--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-08 09:37:23 CET

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
-- TOC entry 183 (class 1259 OID 31134076)
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
-- TOC entry 237 (class 1259 OID 31134690)
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
-- TOC entry 236 (class 1259 OID 31134673)
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
-- TOC entry 182 (class 1259 OID 31134069)
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
-- TOC entry 181 (class 1259 OID 31134067)
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
-- TOC entry 227 (class 1259 OID 31134550)
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
-- TOC entry 230 (class 1259 OID 31134580)
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
-- TOC entry 251 (class 1259 OID 31134983)
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
-- TOC entry 203 (class 1259 OID 31134324)
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
-- TOC entry 205 (class 1259 OID 31134356)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 31134361)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 31134905)
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
-- TOC entry 194 (class 1259 OID 31134221)
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
-- TOC entry 238 (class 1259 OID 31134703)
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
-- TOC entry 223 (class 1259 OID 31134504)
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
-- TOC entry 200 (class 1259 OID 31134295)
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
-- TOC entry 197 (class 1259 OID 31134261)
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
-- TOC entry 195 (class 1259 OID 31134238)
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
-- TOC entry 212 (class 1259 OID 31134418)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 31134963)
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
-- TOC entry 250 (class 1259 OID 31134976)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 31134998)
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
-- TOC entry 216 (class 1259 OID 31134443)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 31134195)
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
-- TOC entry 185 (class 1259 OID 31134095)
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
-- TOC entry 189 (class 1259 OID 31134162)
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
-- TOC entry 186 (class 1259 OID 31134106)
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
-- TOC entry 178 (class 1259 OID 31134041)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 31134060)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 31134450)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 31134484)
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
-- TOC entry 233 (class 1259 OID 31134621)
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
-- TOC entry 188 (class 1259 OID 31134142)
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
-- TOC entry 191 (class 1259 OID 31134187)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 31134849)
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
-- TOC entry 213 (class 1259 OID 31134424)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 31134172)
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
-- TOC entry 202 (class 1259 OID 31134316)
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
-- TOC entry 198 (class 1259 OID 31134276)
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
-- TOC entry 199 (class 1259 OID 31134288)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 31134436)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 31134863)
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
-- TOC entry 242 (class 1259 OID 31134873)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 31134772)
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
-- TOC entry 243 (class 1259 OID 31134881)
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
-- TOC entry 219 (class 1259 OID 31134465)
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
-- TOC entry 211 (class 1259 OID 31134409)
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
-- TOC entry 210 (class 1259 OID 31134399)
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
-- TOC entry 232 (class 1259 OID 31134610)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 31134540)
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
-- TOC entry 196 (class 1259 OID 31134250)
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
-- TOC entry 175 (class 1259 OID 31134012)
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
-- TOC entry 174 (class 1259 OID 31134010)
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
-- TOC entry 220 (class 1259 OID 31134478)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 31134050)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 31134034)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 31134492)
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
-- TOC entry 214 (class 1259 OID 31134430)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 31134376)
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
-- TOC entry 173 (class 1259 OID 31133999)
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
-- TOC entry 172 (class 1259 OID 31133991)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 31133986)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 31134557)
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
-- TOC entry 187 (class 1259 OID 31134134)
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
-- TOC entry 209 (class 1259 OID 31134386)
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
-- TOC entry 231 (class 1259 OID 31134598)
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
-- TOC entry 184 (class 1259 OID 31134085)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 31134893)
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
-- TOC entry 207 (class 1259 OID 31134366)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 31134207)
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
-- TOC entry 176 (class 1259 OID 31134021)
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
-- TOC entry 235 (class 1259 OID 31134648)
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
-- TOC entry 201 (class 1259 OID 31134306)
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
-- TOC entry 218 (class 1259 OID 31134457)
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
-- TOC entry 229 (class 1259 OID 31134571)
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
-- TOC entry 247 (class 1259 OID 31134943)
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
-- TOC entry 246 (class 1259 OID 31134912)
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
-- TOC entry 248 (class 1259 OID 31134955)
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
-- TOC entry 225 (class 1259 OID 31134529)
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
-- TOC entry 204 (class 1259 OID 31134350)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 31134638)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 31134519)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 31134072)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 31134015)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 31134076)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5666-96c0-e24b-7d2e8eb81665	10	30	Otroci	Abonma za otroke	200
000a0000-5666-96c0-70ee-f90f6cd92cae	20	60	Mladina	Abonma za mladino	400
000a0000-5666-96c0-e14d-2c65e21c64b9	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 31134690)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5666-96c0-667f-6e8a71a2d6e2	000d0000-5666-96c0-894b-4aecd4b1cf61	\N	00090000-5666-96c0-9701-03ca470104f7	000b0000-5666-96c0-eced-fa8c540c68cd	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5666-96c0-e24a-293869582fe0	000d0000-5666-96c0-7b93-41ab9d7eb033	00100000-5666-96c0-13a4-b8d612453f1e	00090000-5666-96c0-eb81-940c755a89d7	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5666-96c0-00cd-d441d6e7fc98	000d0000-5666-96c0-8c48-6c075e492bcc	00100000-5666-96c0-f90c-145dde7338fb	00090000-5666-96c0-57d4-78992930c664	\N	0003	t	\N	2015-12-08	\N	2	t	\N	f	f
000c0000-5666-96c0-75ca-201a8fc38a98	000d0000-5666-96c0-f669-8f6f649e7b52	\N	00090000-5666-96c0-f4b7-ac1aae9386eb	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5666-96c0-f51c-dbc32cd7a87a	000d0000-5666-96c0-87d1-0356e3b03ac0	\N	00090000-5666-96c0-ea8e-6e2f51408682	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5666-96c0-0bff-2bb38bccbc40	000d0000-5666-96c0-f4f4-38f653d8e680	\N	00090000-5666-96c0-e4bb-33ac8a5f47f7	000b0000-5666-96c0-8cac-04d633ccf2bf	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5666-96c0-0ece-d538223131a4	000d0000-5666-96c0-09ee-06dd2c4bb3be	00100000-5666-96c0-f7bf-f0c931e18308	00090000-5666-96c0-2ff7-1c0c66be7940	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5666-96c0-72f7-91c1770d558f	000d0000-5666-96c0-b22e-e03564824e2a	\N	00090000-5666-96c0-ea71-8596c70c874d	000b0000-5666-96c0-e5d5-703a5ebf9a60	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5666-96c0-dd5e-eafb9d4e342a	000d0000-5666-96c0-09ee-06dd2c4bb3be	00100000-5666-96c0-fc28-eeb053c1c4db	00090000-5666-96c0-1a4b-8905db25e932	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5666-96c0-9ad3-0025d8afe8f0	000d0000-5666-96c0-09ee-06dd2c4bb3be	00100000-5666-96c0-923a-2131379664be	00090000-5666-96c0-1bf2-5c8c347b4664	\N	0010	t	\N	2015-12-08	\N	16	f	\N	f	t
000c0000-5666-96c0-2af2-b0c327101150	000d0000-5666-96c0-09ee-06dd2c4bb3be	00100000-5666-96c0-e4e0-95158184e69d	00090000-5666-96c0-266f-5cf6f58fee36	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5666-96c0-2578-7ca9bc20f2bf	000d0000-5666-96c0-84da-65bc3959bb9f	00100000-5666-96c0-13a4-b8d612453f1e	00090000-5666-96c0-eb81-940c755a89d7	000b0000-5666-96c0-edf2-bbbe7dbb8844	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 31134673)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 31134069)
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
-- TOC entry 3151 (class 0 OID 31134550)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5666-96c0-e29c-4b5ebc01d1fb	00160000-5666-96c0-0016-70f55ff889c2	00090000-5666-96c0-d2e2-2e05df22c953	aizv	10	t
003d0000-5666-96c0-7aa6-20198bacbec3	00160000-5666-96c0-0016-70f55ff889c2	00090000-5666-96c0-262c-b4623a375bc6	apri	14	t
003d0000-5666-96c0-3bab-646e5ef32eaf	00160000-5666-96c0-5cf7-9418143e1605	00090000-5666-96c0-eb2b-9506e0001a6e	aizv	11	t
003d0000-5666-96c0-b254-0b0f8e3efab4	00160000-5666-96c0-0a30-468f41808797	00090000-5666-96c0-0973-709a664d1dfd	aizv	12	t
003d0000-5666-96c0-50b5-632e2ffa5dd9	00160000-5666-96c0-0016-70f55ff889c2	00090000-5666-96c0-8cdd-b65a56890581	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 31134580)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5666-96c0-0016-70f55ff889c2	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5666-96c0-5cf7-9418143e1605	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5666-96c0-0a30-468f41808797	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 31134983)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 31134324)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5666-96c0-0ada-86ee9551e01e	\N	\N	00200000-5666-96c0-9e49-a75578108e33	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5666-96c0-6461-d15e007aaf0b	\N	\N	00200000-5666-96c0-b33f-67f8af846cab	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5666-96c0-6e22-0117a6606a95	\N	\N	00200000-5666-96c0-92c7-7c6e5ff0e445	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5666-96c0-5620-b51f3756e878	\N	\N	00200000-5666-96c0-2e70-5173bf441206	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5666-96c0-ad05-9480211590fe	\N	\N	00200000-5666-96c0-ae5a-ce61bd71e167	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 31134356)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 31134361)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 31134905)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 31134221)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5666-96be-8611-81d5dacb1d7c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5666-96be-52ab-185a6809e046	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5666-96be-7911-e01427e3ce06	AL	ALB	008	Albania 	Albanija	\N
00040000-5666-96be-2857-ee835bedd1c1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5666-96be-af76-be68194e32c8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5666-96be-bc38-535d38555eac	AD	AND	020	Andorra 	Andora	\N
00040000-5666-96be-a9ae-15ff0bb7f14e	AO	AGO	024	Angola 	Angola	\N
00040000-5666-96be-a921-4ef342f88572	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5666-96be-00c6-06073873ed0c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5666-96be-923f-ea9d5a063f68	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5666-96be-ad56-f9184bdc3ba9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5666-96be-2e71-952343ca4735	AM	ARM	051	Armenia 	Armenija	\N
00040000-5666-96be-89dc-000dc6242944	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5666-96be-106a-2e924f9bd557	AU	AUS	036	Australia 	Avstralija	\N
00040000-5666-96be-6cb6-76f52bf36431	AT	AUT	040	Austria 	Avstrija	\N
00040000-5666-96be-4c52-1f42d79c3529	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5666-96be-52f6-025f7f8c1d62	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5666-96be-6dbd-20862e36dc85	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5666-96be-b75f-4e2c38dc151c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5666-96be-8306-6fa1a48dddef	BB	BRB	052	Barbados 	Barbados	\N
00040000-5666-96be-c45e-49d87e4d6732	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5666-96be-47e9-da03aaed749a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5666-96be-ec0c-2b598981e189	BZ	BLZ	084	Belize 	Belize	\N
00040000-5666-96be-d08e-69b642523729	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5666-96be-a952-1f40d45d11a9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5666-96be-dcf0-15a80a998b9f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5666-96be-a911-202d8b101d38	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5666-96be-5414-68ce98fbf5ee	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5666-96be-8113-9b6e3cf5861f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5666-96be-acb4-d71c42a9dc09	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5666-96be-74a1-f4384a944d5c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5666-96be-8287-df96944f0559	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5666-96be-9292-4954f1b950e2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5666-96be-48eb-5a59ca8b0704	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5666-96be-f28a-a1e5fc3fb8f3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5666-96be-1617-80eaef278298	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5666-96be-07c3-71cf46713024	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5666-96be-d0b2-149426190302	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5666-96be-3b97-e7832abaf7b1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5666-96be-9708-38acf8dbd8ed	CA	CAN	124	Canada 	Kanada	\N
00040000-5666-96be-4ca1-660ae2e863c2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5666-96be-9abd-bd30c1c927d7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5666-96be-8fd4-66995b468768	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5666-96be-1c57-38005e1b3745	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5666-96be-ced6-4b88ef71ddc1	CL	CHL	152	Chile 	Čile	\N
00040000-5666-96be-ca99-e6984a8c7f7a	CN	CHN	156	China 	Kitajska	\N
00040000-5666-96be-06c6-c7bd693eb5a9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5666-96be-8b16-7808c0d53fb3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5666-96be-b2a7-b30e8da7a313	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5666-96be-5c5e-3efa502503d0	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5666-96be-a0b6-be24b631b172	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5666-96be-5e2f-4ca5b47e06cb	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5666-96be-f069-4818983bdd38	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5666-96be-1493-feadf300898f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5666-96be-a327-4228d52bff7f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5666-96be-37d7-633115327313	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5666-96be-c76d-6a92ccbb588a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5666-96be-d915-874148e9878c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5666-96be-086c-3824c46af244	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5666-96be-c863-de516a5224c5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5666-96be-0bee-e4af905fdb98	DK	DNK	208	Denmark 	Danska	\N
00040000-5666-96be-57f2-8a6fe35704eb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5666-96be-1212-83ef1557f1ea	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5666-96be-29ed-11b48a66f0ba	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5666-96be-461e-9699f98c3002	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5666-96be-cb0d-3c96703dabc2	EG	EGY	818	Egypt 	Egipt	\N
00040000-5666-96be-27c6-77e1f7dfc0f1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5666-96be-bd1f-61485adde9bf	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5666-96be-3c8b-62fd4e9ef3d2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5666-96be-d51d-582fd5ec2356	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5666-96be-74a8-b23762c3e8fe	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5666-96be-6998-4d94a9df3bf2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5666-96be-45c9-0a04a2c84014	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5666-96be-db17-f9aba237657c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5666-96be-accd-77b2b3bd369b	FI	FIN	246	Finland 	Finska	\N
00040000-5666-96be-827a-adfb0516e3d9	FR	FRA	250	France 	Francija	\N
00040000-5666-96be-b889-47412ee20389	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5666-96be-b172-0a98e323be7a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5666-96be-cd67-9e33d6b1a416	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5666-96be-97dc-f390c6681f4c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5666-96be-04c0-3f6c19d91b25	GA	GAB	266	Gabon 	Gabon	\N
00040000-5666-96be-8c3d-fba898f8abca	GM	GMB	270	Gambia 	Gambija	\N
00040000-5666-96be-753c-5151581af3e1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5666-96be-1616-4b66e0242da8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5666-96be-3e90-ed6c2e3cbc64	GH	GHA	288	Ghana 	Gana	\N
00040000-5666-96be-7567-8078d0d5d919	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5666-96be-3add-18460eb0700e	GR	GRC	300	Greece 	Grčija	\N
00040000-5666-96be-4c85-3e703b16cb82	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5666-96be-585a-0d54f842ca34	GD	GRD	308	Grenada 	Grenada	\N
00040000-5666-96be-5670-f640a61697be	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5666-96be-67b3-0c09eb27d0c6	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5666-96be-b325-11cec617b948	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5666-96be-8774-0394f5d42e3a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5666-96be-e390-1480e61d2bd0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5666-96be-23ef-690bead2b203	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5666-96be-903a-325f3119a789	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5666-96be-22d2-63125e8b53bf	HT	HTI	332	Haiti 	Haiti	\N
00040000-5666-96be-28e9-fb7724b49692	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5666-96be-88df-abd0b5a9b2a0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5666-96be-fe4c-4979d35f7f68	HN	HND	340	Honduras 	Honduras	\N
00040000-5666-96be-49fa-de9a3e30e96e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5666-96be-c122-7f96af46b263	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5666-96be-a189-1e86113d3135	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5666-96be-4e8a-0681593bd1d5	IN	IND	356	India 	Indija	\N
00040000-5666-96be-0700-e6a48004d3e2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5666-96be-0ed8-05dcf1bfcad2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5666-96be-538b-126fdeeb237e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5666-96be-e894-7d4ec598df63	IE	IRL	372	Ireland 	Irska	\N
00040000-5666-96be-295c-69e337b5b229	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5666-96be-a89c-5ad0bc820236	IL	ISR	376	Israel 	Izrael	\N
00040000-5666-96be-1107-91a9126b63e3	IT	ITA	380	Italy 	Italija	\N
00040000-5666-96be-2c98-4073a7e3094d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5666-96be-e4f6-af97154cc8de	JP	JPN	392	Japan 	Japonska	\N
00040000-5666-96be-776c-d219756103b4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5666-96be-5581-088372e5294c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5666-96be-bc0b-8e9c02d5fdd8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5666-96be-88b2-af3762e6ceae	KE	KEN	404	Kenya 	Kenija	\N
00040000-5666-96be-0b25-b73371ef06a6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5666-96be-30bb-66d3d6cdee40	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5666-96be-b8d3-da60a9952009	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5666-96be-0c71-897893a81eef	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5666-96be-5298-8f5f3f723b71	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5666-96be-1dc6-43962b423ced	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5666-96be-30b8-e986f71b10b1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5666-96be-b041-edde73ee4744	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5666-96be-704c-c78136719e3d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5666-96be-886f-be9d214ede19	LR	LBR	430	Liberia 	Liberija	\N
00040000-5666-96be-383c-04b06f45a9b6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5666-96be-ef07-f3c521ffa489	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5666-96be-d18c-3d8c9cbb2d34	LT	LTU	440	Lithuania 	Litva	\N
00040000-5666-96be-1060-341e9b44e2f5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5666-96be-d5c2-3528282ee708	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5666-96be-1634-b92a61acb1bc	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5666-96be-e9a0-323e65c98972	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5666-96be-f922-dbc8738d84e3	MW	MWI	454	Malawi 	Malavi	\N
00040000-5666-96be-a540-5a6cfb5417d7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5666-96be-f74f-be3a87f19e48	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5666-96be-48d0-e7ef0347df6e	ML	MLI	466	Mali 	Mali	\N
00040000-5666-96be-b588-48861e794579	MT	MLT	470	Malta 	Malta	\N
00040000-5666-96be-8785-ab266feb0417	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5666-96be-c22c-7561ddfdb84f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5666-96be-6a18-e69b4ea2fdbb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5666-96be-9ae6-2cbc20ba30e7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5666-96be-d84c-4654616f365d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5666-96be-179a-831d28094583	MX	MEX	484	Mexico 	Mehika	\N
00040000-5666-96be-9a2a-afe7d9e2f8dc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5666-96be-80bb-ca09e836162e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5666-96be-60e1-a001b80c590a	MC	MCO	492	Monaco 	Monako	\N
00040000-5666-96be-6ea3-9393c610e2d4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5666-96be-b9f2-3e72d2266817	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5666-96be-3846-33b2617ba346	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5666-96be-2679-9bccfad3e0ae	MA	MAR	504	Morocco 	Maroko	\N
00040000-5666-96be-d359-fe705a38b88a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5666-96be-1b34-b2eb1f4655fc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5666-96be-001c-78f720b6af08	NA	NAM	516	Namibia 	Namibija	\N
00040000-5666-96be-cc74-198165560fbb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5666-96be-d13f-cb2a8d5b6417	NP	NPL	524	Nepal 	Nepal	\N
00040000-5666-96be-362e-f88d6c6a0ea0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5666-96be-79a1-d85f0a3a38cc	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5666-96be-1ee7-f5ffdbc45e2b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5666-96be-f492-afd67af02daa	NE	NER	562	Niger 	Niger 	\N
00040000-5666-96be-6e10-3408118eb27f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5666-96be-9131-aff288905dd4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5666-96be-be52-01af5404177b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5666-96be-7534-66e9c9b72292	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5666-96be-24a5-c76ce5c47078	NO	NOR	578	Norway 	Norveška	\N
00040000-5666-96be-069c-655ac005f066	OM	OMN	512	Oman 	Oman	\N
00040000-5666-96be-3afd-7a4c2b472467	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5666-96be-4080-b274ee420c5b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5666-96be-5956-b1c549e61c61	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5666-96be-e9ff-a3c3d8d15dca	PA	PAN	591	Panama 	Panama	\N
00040000-5666-96be-f69a-20140e4af187	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5666-96be-4291-4a867e91dce0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5666-96be-30b9-ddae33acc99e	PE	PER	604	Peru 	Peru	\N
00040000-5666-96be-508e-89b28a001aa2	PH	PHL	608	Philippines 	Filipini	\N
00040000-5666-96be-6c58-0bb2a44a612a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5666-96be-6f40-b4f6f3958d71	PL	POL	616	Poland 	Poljska	\N
00040000-5666-96be-beb5-97cfd2508143	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5666-96be-62bb-0e94e0c340fa	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5666-96be-df56-1d75e7083ea4	QA	QAT	634	Qatar 	Katar	\N
00040000-5666-96be-4532-e4ebd4a0d441	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5666-96be-6a8f-5c99b8346aee	RO	ROU	642	Romania 	Romunija	\N
00040000-5666-96be-b33e-cdcfc168e6f5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5666-96be-ff07-281cbc8379f3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5666-96be-1c45-8d02cec098a1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5666-96be-02cd-5717dfd66024	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5666-96be-1643-a4d3f96034a5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5666-96be-3b48-eaeaecd9e918	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5666-96be-cd2c-8bd65cc3a1e0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5666-96be-7d5b-96540f8a69f7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5666-96be-a659-3283ebc0debe	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5666-96be-92a3-a1b7cbbf9ebc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5666-96be-2893-b3848f8fd9bb	SM	SMR	674	San Marino 	San Marino	\N
00040000-5666-96be-0ac3-d3aa60f9f6c9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5666-96be-b269-6ef41133a674	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5666-96be-fe41-9655f7ff44a5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5666-96be-58c9-a2d76992250f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5666-96be-248d-6f9114fd91dd	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5666-96be-64e6-4beee602e329	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5666-96be-0eff-0316df7c7c51	SG	SGP	702	Singapore 	Singapur	\N
00040000-5666-96be-8492-db41ac11df39	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5666-96be-7630-63400b0cb5a5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5666-96be-6d96-00e7e71933d3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5666-96be-b25f-4c9c547d3ed5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5666-96be-799b-e962b49cd16f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5666-96be-2970-079d7944c40d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5666-96be-f314-99d5242a694d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5666-96be-3b55-bb4b45295188	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5666-96be-c0c7-2a980c225091	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5666-96be-ba87-e41012a0430f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5666-96be-3ae1-932122f47abd	SD	SDN	729	Sudan 	Sudan	\N
00040000-5666-96be-e493-8e788dfd4c91	SR	SUR	740	Suriname 	Surinam	\N
00040000-5666-96be-1be2-4b5ec5d66d06	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5666-96be-9588-aae52631a22e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5666-96be-e965-1cb90a043eec	SE	SWE	752	Sweden 	Švedska	\N
00040000-5666-96be-5ed8-239601888d26	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5666-96be-967a-6763d61db216	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5666-96be-401f-85130d235359	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5666-96be-94ca-a8e821de6ac7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5666-96be-a392-0be80db8fdfd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5666-96be-7ebb-d2a46af20aee	TH	THA	764	Thailand 	Tajska	\N
00040000-5666-96be-f231-c35be8574f5e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5666-96be-116f-45d04db7a6f1	TG	TGO	768	Togo 	Togo	\N
00040000-5666-96be-cf2b-5f8779bad754	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5666-96be-1e13-b0d9d8a2d0ac	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5666-96be-ef98-8bf2c43d09a9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5666-96be-553a-ce0761e38417	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5666-96be-9126-2919e76398e4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5666-96be-92da-f5e83f081aa3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5666-96be-cf9a-16e3a8299b7f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5666-96be-39a0-68f5ada567f7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5666-96be-5df6-96dd3a369935	UG	UGA	800	Uganda 	Uganda	\N
00040000-5666-96be-0e78-326fc21a36fa	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5666-96be-c7c9-cf8a8b102efc	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5666-96be-7e72-0e832a4121f7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5666-96be-9134-da10ede75a34	US	USA	840	United States 	Združene države Amerike	\N
00040000-5666-96be-f536-c832fac399c1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5666-96be-aa31-bfec0d168824	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5666-96be-60b6-23ef377ff8f2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5666-96be-1027-52e5d994103d	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5666-96be-f78b-004d5e9e81ec	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5666-96be-6520-cdd29787b040	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5666-96be-ad57-bd9c0641b746	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5666-96be-06a6-a510308f9771	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5666-96be-86d2-34488180589b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5666-96be-4c3b-30ac4a8dc2ae	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5666-96be-d613-0ca37d1c07ea	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5666-96be-0d8b-ef818c52c501	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5666-96be-810c-77eff95ce047	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 31134703)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5666-96c0-07de-e55bbf72b0c3	000e0000-5666-96c0-97a6-bcaef5e50a72	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-96bd-d3c5-1d497936b437	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5666-96c0-b468-72a64d41fa64	000e0000-5666-96c0-2815-53134f3025b7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-96bd-7821-1a13a3c07483	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5666-96c0-c2e2-a45988f823df	000e0000-5666-96c0-1b04-d8d0c1c8a80d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-96bd-d3c5-1d497936b437	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5666-96c0-3490-a9fe7fbcb25b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5666-96c0-45af-0d2d2799fba0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 31134504)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5666-96c0-09ee-06dd2c4bb3be	000e0000-5666-96c0-2815-53134f3025b7	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5666-96bd-d98b-89725e891be9
000d0000-5666-96c0-894b-4aecd4b1cf61	000e0000-5666-96c0-2815-53134f3025b7	000c0000-5666-96c0-667f-6e8a71a2d6e2	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5666-96bd-d98b-89725e891be9
000d0000-5666-96c0-7b93-41ab9d7eb033	000e0000-5666-96c0-2815-53134f3025b7	000c0000-5666-96c0-e24a-293869582fe0	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5666-96bd-9a43-dbbb350b3ccd
000d0000-5666-96c0-8c48-6c075e492bcc	000e0000-5666-96c0-2815-53134f3025b7	000c0000-5666-96c0-00cd-d441d6e7fc98	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5666-96bd-27a9-6dcd0311196d
000d0000-5666-96c0-f669-8f6f649e7b52	000e0000-5666-96c0-2815-53134f3025b7	000c0000-5666-96c0-75ca-201a8fc38a98	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5666-96bd-f353-842ec763b379
000d0000-5666-96c0-87d1-0356e3b03ac0	000e0000-5666-96c0-2815-53134f3025b7	000c0000-5666-96c0-f51c-dbc32cd7a87a	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5666-96bd-f353-842ec763b379
000d0000-5666-96c0-f4f4-38f653d8e680	000e0000-5666-96c0-2815-53134f3025b7	000c0000-5666-96c0-0bff-2bb38bccbc40	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5666-96bd-d98b-89725e891be9
000d0000-5666-96c0-b22e-e03564824e2a	000e0000-5666-96c0-2815-53134f3025b7	000c0000-5666-96c0-72f7-91c1770d558f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5666-96bd-ebba-6302dcd4b6bd
000d0000-5666-96c0-84da-65bc3959bb9f	000e0000-5666-96c0-2815-53134f3025b7	000c0000-5666-96c0-2578-7ca9bc20f2bf	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5666-96bd-f32e-1aabb35e9711
\.


--
-- TOC entry 3124 (class 0 OID 31134295)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 31134261)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 31134238)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5666-96c0-f4f6-4507a20fdf8d	00080000-5666-96c0-2b5d-9189283d15de	00090000-5666-96c0-1bf2-5c8c347b4664	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 31134418)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 31134963)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5666-96c0-5824-d7a68710c60c	00010000-5666-96be-b454-bd6da1c939d4	\N	Prva mapa	Root mapa	2015-12-08 09:37:20	2015-12-08 09:37:20	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 31134976)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 31134998)
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
-- TOC entry 3140 (class 0 OID 31134443)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 31134195)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5666-96be-2753-b19533b753a2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5666-96be-2b2e-aafd71ea3a1a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5666-96be-90f7-720696f5e70c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5666-96be-43f5-6e17fc7ccbb8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5666-96be-b185-c79e8a2cbaf2	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5666-96be-23ba-340c0462a3e1	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5666-96be-0d42-b9c60ba5be33	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5666-96be-ccf9-b104bbcf8e3a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5666-96be-a87d-d2c9be3278b9	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5666-96be-7dda-f322fbd06019	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5666-96be-d35f-6658ccdcc8fa	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5666-96be-7e42-df10f344ebe0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5666-96be-b226-452f7e789853	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5666-96be-2242-bc8cfa44f543	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5666-96c0-6fe0-72d39f1d0c63	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5666-96c0-a4d2-cfb9f96bfefb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5666-96c0-a4b8-4e9b803f78a1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5666-96c0-4da4-1e551087da20	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5666-96c0-47ae-cd55f9f2e931	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5666-96c2-5e13-0c7cbb0dbf28	application.tenant.maticnopodjetje	string	s:36:"00080000-5666-96c2-6a2f-ccc77f30e288";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 31134095)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5666-96c0-685e-79fb9173252d	00000000-5666-96c0-6fe0-72d39f1d0c63	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5666-96c0-05bb-d066af08fdba	00000000-5666-96c0-6fe0-72d39f1d0c63	00010000-5666-96be-b454-bd6da1c939d4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5666-96c0-2745-23b055e8ebab	00000000-5666-96c0-a4d2-cfb9f96bfefb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 31134162)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5666-96c0-54d1-3a9ad2d4125b	\N	00100000-5666-96c0-13a4-b8d612453f1e	00100000-5666-96c0-f90c-145dde7338fb	01	Gledališče Nimbis
00410000-5666-96c0-5879-1154b30d46d4	00410000-5666-96c0-54d1-3a9ad2d4125b	00100000-5666-96c0-13a4-b8d612453f1e	00100000-5666-96c0-f90c-145dde7338fb	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 31134106)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5666-96c0-9701-03ca470104f7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5666-96c0-f4b7-ac1aae9386eb	00010000-5666-96c0-9478-66dbc451541e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5666-96c0-57d4-78992930c664	00010000-5666-96c0-a7e9-e7a783a66c12	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5666-96c0-1a4b-8905db25e932	00010000-5666-96c0-6506-4b7267389405	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5666-96c0-56e7-e9b606060877	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5666-96c0-e4bb-33ac8a5f47f7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5666-96c0-266f-5cf6f58fee36	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5666-96c0-2ff7-1c0c66be7940	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5666-96c0-1bf2-5c8c347b4664	00010000-5666-96c0-c38b-12abfea80138	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5666-96c0-eb81-940c755a89d7	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5666-96c0-f3f7-770af0d073f7	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5666-96c0-ea8e-6e2f51408682	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5666-96c0-ea71-8596c70c874d	00010000-5666-96c0-411b-19e7221a2a68	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5666-96c0-d2e2-2e05df22c953	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-96c0-262c-b4623a375bc6	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-96c0-eb2b-9506e0001a6e	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-96c0-0973-709a664d1dfd	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5666-96c0-8cdd-b65a56890581	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5666-96c0-b280-08d0759a4528	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-96c0-1bdf-fa95767de69e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-96c0-e6ae-640557ed9378	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 31134041)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5666-96be-509b-f2a33e76ad8d	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5666-96be-25f3-383e8ccecb67	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5666-96be-5594-825f3dc5eb98	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5666-96be-d147-a8cebc5fd037	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5666-96be-567b-871a32eb152d	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5666-96be-890d-41cad8a053ab	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5666-96be-bcf5-e69786c31a07	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5666-96be-fcf4-2c7434beb841	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5666-96be-a183-781f81c1e5f1	Abonma-read	Abonma - branje	t
00030000-5666-96be-e098-49d57dd6512f	Abonma-write	Abonma - spreminjanje	t
00030000-5666-96be-3036-9a3c8374089b	Alternacija-read	Alternacija - branje	t
00030000-5666-96be-d812-058c2b3ba4b2	Alternacija-write	Alternacija - spreminjanje	t
00030000-5666-96be-5682-aa3be818b306	Arhivalija-read	Arhivalija - branje	t
00030000-5666-96be-3513-7139e3d709e6	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5666-96be-50c6-d3f442e2ca2c	AuthStorage-read	AuthStorage - branje	t
00030000-5666-96be-a20f-e6431abae2f6	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5666-96be-2fdf-0a720df0998c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5666-96be-3ffb-f758142b1109	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5666-96be-4d2f-128e954190c4	Besedilo-read	Besedilo - branje	t
00030000-5666-96be-cb31-1933884a71cb	Besedilo-write	Besedilo - spreminjanje	t
00030000-5666-96be-161a-af2a66e6f88d	Dogodek-read	Dogodek - branje	t
00030000-5666-96be-e49c-d6bc2d1871cc	Dogodek-write	Dogodek - spreminjanje	t
00030000-5666-96be-6a71-098df8c95fbc	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5666-96be-1006-bdbf794e3969	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5666-96be-3fca-c11732a80fb7	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5666-96be-babb-cb30f7e80cff	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5666-96be-a667-534c04a8c16d	DogodekTrait-read	DogodekTrait - branje	t
00030000-5666-96be-c31a-478422395b73	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5666-96be-6308-36f58f730f21	DrugiVir-read	DrugiVir - branje	t
00030000-5666-96be-f937-e0a4840db469	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5666-96be-99bc-be650d1f9d65	Drzava-read	Drzava - branje	t
00030000-5666-96be-77f5-00451e4cb50d	Drzava-write	Drzava - spreminjanje	t
00030000-5666-96be-d3df-b80089e877f7	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5666-96be-feb7-fa2cf23d527a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5666-96be-2821-a5d3ed37bca4	Funkcija-read	Funkcija - branje	t
00030000-5666-96be-7f50-90075db97e82	Funkcija-write	Funkcija - spreminjanje	t
00030000-5666-96be-d320-65a058d98316	Gostovanje-read	Gostovanje - branje	t
00030000-5666-96be-2005-acf34560c17c	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5666-96be-c945-2cf9237bee48	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5666-96be-20a6-20612a26ae63	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5666-96be-5a06-2df2f2e8d6a4	Kupec-read	Kupec - branje	t
00030000-5666-96be-c21e-2e637362602d	Kupec-write	Kupec - spreminjanje	t
00030000-5666-96be-e957-eb65a72127a2	NacinPlacina-read	NacinPlacina - branje	t
00030000-5666-96be-c640-48f23e2f2efe	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5666-96be-ced0-cad3453372a8	Option-read	Option - branje	t
00030000-5666-96be-7eb8-2740f01420bd	Option-write	Option - spreminjanje	t
00030000-5666-96be-382e-443e0cca77af	OptionValue-read	OptionValue - branje	t
00030000-5666-96be-9893-e9661f22127c	OptionValue-write	OptionValue - spreminjanje	t
00030000-5666-96be-0e88-92f10342fb32	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5666-96be-ff55-54172bea84da	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5666-96be-0340-d490ac914a10	Oseba-read	Oseba - branje	t
00030000-5666-96be-0287-00c481e0fdc9	Oseba-write	Oseba - spreminjanje	t
00030000-5666-96be-0584-61e4aca6b0e8	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5666-96be-4db9-008c7bc49d30	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5666-96be-193e-539073902495	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5666-96be-9cfe-dc84d919c101	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5666-96be-1d7d-f6c8724d0e78	Pogodba-read	Pogodba - branje	t
00030000-5666-96be-5607-a71ef6456db0	Pogodba-write	Pogodba - spreminjanje	t
00030000-5666-96be-fea2-8d1a6c3ce336	Popa-read	Popa - branje	t
00030000-5666-96be-d1b9-f0585c64f32c	Popa-write	Popa - spreminjanje	t
00030000-5666-96be-4ab1-f4cc9826f5f8	Posta-read	Posta - branje	t
00030000-5666-96be-55ca-0f165e80c3dc	Posta-write	Posta - spreminjanje	t
00030000-5666-96be-1c0d-f2b4ad5a7446	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5666-96be-1fda-5bdb037343fa	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5666-96be-f89e-7a1d58e6ff7c	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5666-96be-9cf7-19aee742f3d7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5666-96be-02f2-700992fd70c3	PostniNaslov-read	PostniNaslov - branje	t
00030000-5666-96be-a0a8-e8e0478997da	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5666-96be-2c4a-d6fdf2c930da	Praznik-read	Praznik - branje	t
00030000-5666-96be-625c-5470c7ed4dc6	Praznik-write	Praznik - spreminjanje	t
00030000-5666-96be-2b33-e12bd9e30fff	Predstava-read	Predstava - branje	t
00030000-5666-96be-e336-96a9ef4c9cb0	Predstava-write	Predstava - spreminjanje	t
00030000-5666-96be-1fed-28f3895bd261	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5666-96be-ef43-2adec4ff5bd4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5666-96be-f630-2f77257accf2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5666-96be-4dda-4b326d117aa0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5666-96be-d2d5-02adbc4b1350	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5666-96be-e0e8-59c2a41f31e6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5666-96be-9e0e-38cd7f031b3e	ProgramDela-read	ProgramDela - branje	t
00030000-5666-96be-5ffb-d4ac305477d3	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5666-96be-220e-82c4f9daa8ae	ProgramFestival-read	ProgramFestival - branje	t
00030000-5666-96be-6bb7-6fe245542cf5	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5666-96be-2a0d-655187c648e1	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5666-96be-027f-16113d71aa60	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5666-96be-902d-68cdc4ca92e0	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5666-96be-bd81-b046053d2f14	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5666-96be-b538-69085bdd3e20	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5666-96be-7acc-d2ee8e8b5933	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5666-96be-ec58-afbf2faf2837	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5666-96be-70d4-22e19b87cc26	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5666-96be-7a69-d31bfb3a2eaa	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5666-96be-4534-102166641121	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5666-96be-5f2d-bee7450847e8	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5666-96be-d655-aa6d12d51c29	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5666-96be-98b2-e1cd2aaa656d	ProgramRazno-read	ProgramRazno - branje	t
00030000-5666-96be-ef90-58ec6167e479	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5666-96be-5cc4-60a43fa35707	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5666-96be-b0c4-d7d8d742bb33	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5666-96be-2a65-49e7cbdadeea	Prostor-read	Prostor - branje	t
00030000-5666-96be-6956-7832106b6dcb	Prostor-write	Prostor - spreminjanje	t
00030000-5666-96be-d872-8ff87dce4c67	Racun-read	Racun - branje	t
00030000-5666-96be-2a8a-31809bf921f3	Racun-write	Racun - spreminjanje	t
00030000-5666-96be-71aa-e64dcc2a420d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5666-96be-107c-3a65895c26c2	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5666-96be-e408-bdcb1f2bb9db	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5666-96be-de2f-8bc58ec22409	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5666-96be-d8d6-eabded214493	Rekvizit-read	Rekvizit - branje	t
00030000-5666-96be-4336-45b9637dc703	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5666-96be-8af3-cc46d9774f52	Revizija-read	Revizija - branje	t
00030000-5666-96be-3d28-7f24f5ce8d27	Revizija-write	Revizija - spreminjanje	t
00030000-5666-96be-1175-2cbf47935256	Rezervacija-read	Rezervacija - branje	t
00030000-5666-96be-de23-d375e5e9be93	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5666-96be-c816-637400e29741	SedezniRed-read	SedezniRed - branje	t
00030000-5666-96be-a5b1-cfa312c7b77b	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5666-96be-7c50-6b7300f387b8	Sedez-read	Sedez - branje	t
00030000-5666-96be-21ec-ab9a0babcb6f	Sedez-write	Sedez - spreminjanje	t
00030000-5666-96be-19d3-aa88ee1274ba	Sezona-read	Sezona - branje	t
00030000-5666-96be-f272-b5593a2b0b7b	Sezona-write	Sezona - spreminjanje	t
00030000-5666-96be-f76a-6be21f03fdf5	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5666-96be-43ed-097ab7b9c10d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5666-96be-5191-8a033350df77	Telefonska-read	Telefonska - branje	t
00030000-5666-96be-7ec8-d1e24967579a	Telefonska-write	Telefonska - spreminjanje	t
00030000-5666-96be-5545-8ef2f9ff1711	TerminStoritve-read	TerminStoritve - branje	t
00030000-5666-96be-4e0a-919f49192cdd	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5666-96be-9959-9113836edaec	TipFunkcije-read	TipFunkcije - branje	t
00030000-5666-96be-c022-f20c96e4c33f	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5666-96be-838d-985fca413b5d	TipPopa-read	TipPopa - branje	t
00030000-5666-96be-687a-1201e4ef8f69	TipPopa-write	TipPopa - spreminjanje	t
00030000-5666-96be-d984-257074859ab9	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5666-96be-0f36-0e9cc3b2548c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5666-96be-73d0-f02b6828302a	TipVaje-read	TipVaje - branje	t
00030000-5666-96be-167f-e7aba387ec1a	TipVaje-write	TipVaje - spreminjanje	t
00030000-5666-96be-2db7-e67d87ac2c61	Trr-read	Trr - branje	t
00030000-5666-96be-f792-5c32908aaa79	Trr-write	Trr - spreminjanje	t
00030000-5666-96be-ae41-6d7980a61d38	Uprizoritev-read	Uprizoritev - branje	t
00030000-5666-96be-d780-5c4bf5aac308	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5666-96be-89af-e2052ec50781	Vaja-read	Vaja - branje	t
00030000-5666-96be-d21f-996609fc1a57	Vaja-write	Vaja - spreminjanje	t
00030000-5666-96be-b522-f7dcfbae5205	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5666-96be-0847-1a4198d4d553	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5666-96be-62e0-1372d6a2b8c1	VrstaStroska-read	VrstaStroska - branje	t
00030000-5666-96be-53ca-f1513c38d10a	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5666-96be-7821-ae04787087d6	Zaposlitev-read	Zaposlitev - branje	t
00030000-5666-96be-7620-c4635922e7ae	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5666-96be-d0e9-ad67562406d5	Zasedenost-read	Zasedenost - branje	t
00030000-5666-96be-a8a6-eacce7f2ab6a	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5666-96be-c0a9-1bc94fa5ac06	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5666-96be-b7a5-990a10327657	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5666-96be-2cd8-ab0ae45eb9dc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5666-96be-3194-d6a08078dc02	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5666-96be-7755-5a886d4b2a38	Job-read	Branje opravil - samo zase - branje	t
00030000-5666-96be-63c0-e866d2ef1c94	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5666-96be-6504-3a6048fbecdb	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5666-96be-f58d-dbdd4373bd4a	Report-read	Report - branje	t
00030000-5666-96be-cc30-0bbd94a561d4	Report-write	Report - spreminjanje	t
00030000-5666-96be-fbc9-d4f71dadc69c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5666-96be-5cfd-211df3d32b0b	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5666-96be-c5cd-c39b52253545	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5666-96be-48e3-da733386f0c3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5666-96be-42ff-db5f149ee7e0	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5666-96be-b48e-3238d2912520	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5666-96be-7c5f-adf915761610	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5666-96be-1afd-e6fed0f2f312	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5666-96be-b1d6-0c1026d99a33	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5666-96be-703c-aadc5fdab39f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5666-96be-d834-0013b6d39be8	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5666-96be-931e-7748febaa83a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5666-96be-770d-d074fba75a18	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5666-96be-a35b-4f962713b7f7	Datoteka-write	Datoteka - spreminjanje	t
00030000-5666-96be-569e-59bf1e5a696a	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 31134060)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5666-96be-1211-6038d7312f32	00030000-5666-96be-25f3-383e8ccecb67
00020000-5666-96be-1211-6038d7312f32	00030000-5666-96be-509b-f2a33e76ad8d
00020000-5666-96be-7f71-57ab7a75322e	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-3ffb-f758142b1109
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-cb31-1933884a71cb
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-2fdf-0a720df0998c
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-4d2f-128e954190c4
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-3db4-6533eee41595	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-4c0a-6918362d4750	00030000-5666-96be-2fdf-0a720df0998c
00020000-5666-96be-4c0a-6918362d4750	00030000-5666-96be-4d2f-128e954190c4
00020000-5666-96be-4c0a-6918362d4750	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-4c0a-6918362d4750	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-4c0a-6918362d4750	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-5139-269b798b07e1	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-5139-269b798b07e1	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96be-5139-269b798b07e1	00030000-5666-96be-7620-c4635922e7ae
00020000-5666-96be-5139-269b798b07e1	00030000-5666-96be-0e88-92f10342fb32
00020000-5666-96be-aa89-3087635268e7	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96be-aa89-3087635268e7	00030000-5666-96be-0e88-92f10342fb32
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-0287-00c481e0fdc9
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-a0a8-e8e0478997da
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-5191-8a033350df77
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-7ec8-d1e24967579a
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-e4a0-e40e29c600d3	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96be-9b80-b80b11a023c8	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-9b80-b80b11a023c8	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-9b80-b80b11a023c8	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96be-9b80-b80b11a023c8	00030000-5666-96be-5191-8a033350df77
00020000-5666-96be-9b80-b80b11a023c8	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-9b80-b80b11a023c8	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-9b80-b80b11a023c8	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-8831-373c3d269f3f	00030000-5666-96be-0287-00c481e0fdc9
00020000-5666-96be-8831-373c3d269f3f	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-8831-373c3d269f3f	00030000-5666-96be-890d-41cad8a053ab
00020000-5666-96be-8831-373c3d269f3f	00030000-5666-96be-567b-871a32eb152d
00020000-5666-96be-8831-373c3d269f3f	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96be-8831-373c3d269f3f	00030000-5666-96be-f792-5c32908aaa79
00020000-5666-96be-8831-373c3d269f3f	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-f2ad-619a833e5875	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-f2ad-619a833e5875	00030000-5666-96be-890d-41cad8a053ab
00020000-5666-96be-f2ad-619a833e5875	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96be-f2ad-619a833e5875	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-5191-8a033350df77
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-c945-2cf9237bee48
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-7ec8-d1e24967579a
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-a0a8-e8e0478997da
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-f792-5c32908aaa79
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-d1b9-f0585c64f32c
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-20a6-20612a26ae63
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-e0e8-59c2a41f31e6
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-dc3e-1e6c266b504e	00030000-5666-96be-838d-985fca413b5d
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-5191-8a033350df77
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-c945-2cf9237bee48
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-9c51-5a2961faec99	00030000-5666-96be-838d-985fca413b5d
00020000-5666-96be-fd77-df6eb0283563	00030000-5666-96be-838d-985fca413b5d
00020000-5666-96be-fd77-df6eb0283563	00030000-5666-96be-687a-1201e4ef8f69
00020000-5666-96be-d842-604547945e12	00030000-5666-96be-838d-985fca413b5d
00020000-5666-96be-15a6-aa201673f433	00030000-5666-96be-4ab1-f4cc9826f5f8
00020000-5666-96be-15a6-aa201673f433	00030000-5666-96be-55ca-0f165e80c3dc
00020000-5666-96be-ee3f-263dbd387260	00030000-5666-96be-4ab1-f4cc9826f5f8
00020000-5666-96be-5ccc-933e376de929	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-5ccc-933e376de929	00030000-5666-96be-77f5-00451e4cb50d
00020000-5666-96be-5a58-79844c843a8a	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-0211-e24253ef6d8c	00030000-5666-96be-2cd8-ab0ae45eb9dc
00020000-5666-96be-0211-e24253ef6d8c	00030000-5666-96be-3194-d6a08078dc02
00020000-5666-96be-37d0-f16b3bacea58	00030000-5666-96be-2cd8-ab0ae45eb9dc
00020000-5666-96be-fedc-c86e88852b96	00030000-5666-96be-c0a9-1bc94fa5ac06
00020000-5666-96be-fedc-c86e88852b96	00030000-5666-96be-b7a5-990a10327657
00020000-5666-96be-7b2c-310974fc770a	00030000-5666-96be-c0a9-1bc94fa5ac06
00020000-5666-96be-d070-563bdfe8e514	00030000-5666-96be-a183-781f81c1e5f1
00020000-5666-96be-d070-563bdfe8e514	00030000-5666-96be-e098-49d57dd6512f
00020000-5666-96be-f5ae-0208ea8272d9	00030000-5666-96be-a183-781f81c1e5f1
00020000-5666-96be-ebb1-89dcaa8b0a6f	00030000-5666-96be-2a65-49e7cbdadeea
00020000-5666-96be-ebb1-89dcaa8b0a6f	00030000-5666-96be-6956-7832106b6dcb
00020000-5666-96be-ebb1-89dcaa8b0a6f	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-ebb1-89dcaa8b0a6f	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96be-ebb1-89dcaa8b0a6f	00030000-5666-96be-a0a8-e8e0478997da
00020000-5666-96be-ebb1-89dcaa8b0a6f	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-633e-fb2427a338fa	00030000-5666-96be-2a65-49e7cbdadeea
00020000-5666-96be-633e-fb2427a338fa	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-633e-fb2427a338fa	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96be-0bfe-2c9f5185b065	00030000-5666-96be-62e0-1372d6a2b8c1
00020000-5666-96be-0bfe-2c9f5185b065	00030000-5666-96be-53ca-f1513c38d10a
00020000-5666-96be-8cab-a1222193ca2d	00030000-5666-96be-62e0-1372d6a2b8c1
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-ff55-54172bea84da
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-0e88-92f10342fb32
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96be-833c-36ba086a1572	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-9814-7fbf0d5d6a69	00030000-5666-96be-0e88-92f10342fb32
00020000-5666-96be-9814-7fbf0d5d6a69	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96be-9814-7fbf0d5d6a69	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-9814-7fbf0d5d6a69	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-9814-7fbf0d5d6a69	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-499d-7b125be62282	00030000-5666-96be-73d0-f02b6828302a
00020000-5666-96be-499d-7b125be62282	00030000-5666-96be-167f-e7aba387ec1a
00020000-5666-96be-308a-eac28954ed1e	00030000-5666-96be-73d0-f02b6828302a
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-bcf5-e69786c31a07
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-fcf4-2c7434beb841
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-9e0e-38cd7f031b3e
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-5ffb-d4ac305477d3
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-220e-82c4f9daa8ae
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-6bb7-6fe245542cf5
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-2a0d-655187c648e1
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-027f-16113d71aa60
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-902d-68cdc4ca92e0
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-bd81-b046053d2f14
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-b538-69085bdd3e20
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-7acc-d2ee8e8b5933
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-ec58-afbf2faf2837
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-70d4-22e19b87cc26
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-7a69-d31bfb3a2eaa
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-4534-102166641121
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-5f2d-bee7450847e8
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-d655-aa6d12d51c29
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-98b2-e1cd2aaa656d
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-ef90-58ec6167e479
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-5cc4-60a43fa35707
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-b0c4-d7d8d742bb33
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-4dda-4b326d117aa0
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-f937-e0a4840db469
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-1fda-5bdb037343fa
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-63c0-e866d2ef1c94
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-6308-36f58f730f21
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-f630-2f77257accf2
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-1c0d-f2b4ad5a7446
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-62e0-1372d6a2b8c1
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-f76a-6be21f03fdf5
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-2821-a5d3ed37bca4
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-3036-9a3c8374089b
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-9959-9113836edaec
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-1d7d-f6c8724d0e78
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-7755-5a886d4b2a38
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-03f6-fcb14f604762	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-9e0e-38cd7f031b3e
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-220e-82c4f9daa8ae
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-2a0d-655187c648e1
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-902d-68cdc4ca92e0
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-b538-69085bdd3e20
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-ec58-afbf2faf2837
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-7a69-d31bfb3a2eaa
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-5f2d-bee7450847e8
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-98b2-e1cd2aaa656d
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-5cc4-60a43fa35707
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-f630-2f77257accf2
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-6308-36f58f730f21
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-1c0d-f2b4ad5a7446
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-7755-5a886d4b2a38
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-0377-2d5f95ddc20c	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-d780-5c4bf5aac308
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-3036-9a3c8374089b
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-d812-058c2b3ba4b2
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-4d2f-128e954190c4
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-2821-a5d3ed37bca4
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-7f50-90075db97e82
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-9959-9113836edaec
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-aadd-d0d7db693fa6	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-3036-9a3c8374089b
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-4d2f-128e954190c4
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-2821-a5d3ed37bca4
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-9959-9113836edaec
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96be-36b3-dfb57faad8bb	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-3036-9a3c8374089b
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-d812-058c2b3ba4b2
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-2821-a5d3ed37bca4
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-1d7d-f6c8724d0e78
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-5607-a71ef6456db0
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-f76a-6be21f03fdf5
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-43ed-097ab7b9c10d
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-9959-9113836edaec
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-16ef-2239f70bb693	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-3036-9a3c8374089b
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-2821-a5d3ed37bca4
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-1d7d-f6c8724d0e78
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-f76a-6be21f03fdf5
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-9959-9113836edaec
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-990d-9ca6aafd16e2	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96be-576d-53ce23b97b1a	00030000-5666-96be-f76a-6be21f03fdf5
00020000-5666-96be-576d-53ce23b97b1a	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-576d-53ce23b97b1a	00030000-5666-96be-2821-a5d3ed37bca4
00020000-5666-96be-576d-53ce23b97b1a	00030000-5666-96be-1d7d-f6c8724d0e78
00020000-5666-96be-576d-53ce23b97b1a	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-576d-53ce23b97b1a	00030000-5666-96be-9959-9113836edaec
00020000-5666-96be-576d-53ce23b97b1a	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-6625-e70a9af0d546	00030000-5666-96be-f76a-6be21f03fdf5
00020000-5666-96be-6625-e70a9af0d546	00030000-5666-96be-43ed-097ab7b9c10d
00020000-5666-96be-6625-e70a9af0d546	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-6625-e70a9af0d546	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-d8cc-864d85a8c12e	00030000-5666-96be-f76a-6be21f03fdf5
00020000-5666-96be-d8cc-864d85a8c12e	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-a183-781f81c1e5f1
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-3036-9a3c8374089b
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-2fdf-0a720df0998c
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-3ffb-f758142b1109
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-4d2f-128e954190c4
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-cb31-1933884a71cb
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-2821-a5d3ed37bca4
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-c945-2cf9237bee48
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-0e88-92f10342fb32
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-0287-00c481e0fdc9
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-4ab1-f4cc9826f5f8
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-a0a8-e8e0478997da
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-2a65-49e7cbdadeea
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-5191-8a033350df77
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-7ec8-d1e24967579a
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-9959-9113836edaec
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-838d-985fca413b5d
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-73d0-f02b6828302a
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-62e0-1372d6a2b8c1
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-c0a9-1bc94fa5ac06
00020000-5666-96be-be30-1a6d5ccd414c	00030000-5666-96be-2cd8-ab0ae45eb9dc
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-509b-f2a33e76ad8d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-25f3-383e8ccecb67
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-a183-781f81c1e5f1
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-e098-49d57dd6512f
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-3036-9a3c8374089b
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d812-058c2b3ba4b2
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5682-aa3be818b306
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-3513-7139e3d709e6
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-50c6-d3f442e2ca2c
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-a20f-e6431abae2f6
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2fdf-0a720df0998c
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-3ffb-f758142b1109
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-4d2f-128e954190c4
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-cb31-1933884a71cb
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-161a-af2a66e6f88d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d147-a8cebc5fd037
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-e49c-d6bc2d1871cc
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-6a71-098df8c95fbc
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-1006-bdbf794e3969
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-3fca-c11732a80fb7
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-babb-cb30f7e80cff
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-6308-36f58f730f21
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-f937-e0a4840db469
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-99bc-be650d1f9d65
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-77f5-00451e4cb50d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d3df-b80089e877f7
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-feb7-fa2cf23d527a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2821-a5d3ed37bca4
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7f50-90075db97e82
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d320-65a058d98316
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2005-acf34560c17c
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-6504-3a6048fbecdb
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7755-5a886d4b2a38
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-63c0-e866d2ef1c94
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-c945-2cf9237bee48
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-20a6-20612a26ae63
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5a06-2df2f2e8d6a4
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-c21e-2e637362602d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5cfd-211df3d32b0b
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-c5cd-c39b52253545
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-48e3-da733386f0c3
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-42ff-db5f149ee7e0
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7c5f-adf915761610
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-b48e-3238d2912520
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-e957-eb65a72127a2
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-c640-48f23e2f2efe
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-ced0-cad3453372a8
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7eb8-2740f01420bd
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-382e-443e0cca77af
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-9893-e9661f22127c
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-0e88-92f10342fb32
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-ff55-54172bea84da
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-567b-871a32eb152d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-0287-00c481e0fdc9
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-0584-61e4aca6b0e8
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-4db9-008c7bc49d30
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-193e-539073902495
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-9cfe-dc84d919c101
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-1d7d-f6c8724d0e78
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5607-a71ef6456db0
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d1b9-f0585c64f32c
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-4ab1-f4cc9826f5f8
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-55ca-0f165e80c3dc
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-1c0d-f2b4ad5a7446
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-1fda-5bdb037343fa
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-f89e-7a1d58e6ff7c
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-9cf7-19aee742f3d7
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-a0a8-e8e0478997da
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2c4a-d6fdf2c930da
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-625c-5470c7ed4dc6
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2b33-e12bd9e30fff
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-e336-96a9ef4c9cb0
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-1fed-28f3895bd261
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-ef43-2adec4ff5bd4
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-f630-2f77257accf2
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-4dda-4b326d117aa0
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d2d5-02adbc4b1350
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-e0e8-59c2a41f31e6
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-bcf5-e69786c31a07
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-9e0e-38cd7f031b3e
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-fcf4-2c7434beb841
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5ffb-d4ac305477d3
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-220e-82c4f9daa8ae
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-6bb7-6fe245542cf5
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2a0d-655187c648e1
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-027f-16113d71aa60
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-902d-68cdc4ca92e0
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-bd81-b046053d2f14
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-b538-69085bdd3e20
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7acc-d2ee8e8b5933
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-ec58-afbf2faf2837
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-70d4-22e19b87cc26
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7a69-d31bfb3a2eaa
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-4534-102166641121
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5f2d-bee7450847e8
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d655-aa6d12d51c29
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-98b2-e1cd2aaa656d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-ef90-58ec6167e479
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5cc4-60a43fa35707
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-b0c4-d7d8d742bb33
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2a65-49e7cbdadeea
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-6956-7832106b6dcb
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d872-8ff87dce4c67
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2a8a-31809bf921f3
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-71aa-e64dcc2a420d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-107c-3a65895c26c2
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d8d6-eabded214493
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-4336-45b9637dc703
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-e408-bdcb1f2bb9db
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-de2f-8bc58ec22409
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-f58d-dbdd4373bd4a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-cc30-0bbd94a561d4
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-8af3-cc46d9774f52
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-3d28-7f24f5ce8d27
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-1175-2cbf47935256
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-de23-d375e5e9be93
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7c50-6b7300f387b8
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-21ec-ab9a0babcb6f
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-c816-637400e29741
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-a5b1-cfa312c7b77b
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-19d3-aa88ee1274ba
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-f272-b5593a2b0b7b
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-fbc9-d4f71dadc69c
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-f76a-6be21f03fdf5
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-43ed-097ab7b9c10d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5191-8a033350df77
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7ec8-d1e24967579a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5545-8ef2f9ff1711
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-5594-825f3dc5eb98
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-4e0a-919f49192cdd
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-9959-9113836edaec
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-c022-f20c96e4c33f
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-838d-985fca413b5d
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-687a-1201e4ef8f69
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d984-257074859ab9
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-0f36-0e9cc3b2548c
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-73d0-f02b6828302a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-167f-e7aba387ec1a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-f792-5c32908aaa79
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d780-5c4bf5aac308
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-89af-e2052ec50781
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d21f-996609fc1a57
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-b522-f7dcfbae5205
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-0847-1a4198d4d553
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-62e0-1372d6a2b8c1
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-53ca-f1513c38d10a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-770d-d074fba75a18
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-931e-7748febaa83a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-7620-c4635922e7ae
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-d0e9-ad67562406d5
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-a8a6-eacce7f2ab6a
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-c0a9-1bc94fa5ac06
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-b7a5-990a10327657
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-2cd8-ab0ae45eb9dc
00020000-5666-96c0-a270-776daf9b5dd6	00030000-5666-96be-3194-d6a08078dc02
00020000-5666-96c0-0593-a283ca5401db	00030000-5666-96be-d834-0013b6d39be8
00020000-5666-96c0-4fdc-6f1e254fe7f2	00030000-5666-96be-703c-aadc5fdab39f
00020000-5666-96c0-3e59-04c184d54e36	00030000-5666-96be-d780-5c4bf5aac308
00020000-5666-96c0-9319-e13e5515f624	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96c0-4fc2-ba04513b4b17	00030000-5666-96be-c5cd-c39b52253545
00020000-5666-96c0-a178-d607c2938c19	00030000-5666-96be-48e3-da733386f0c3
00020000-5666-96c0-83ab-0961d4f183ed	00030000-5666-96be-42ff-db5f149ee7e0
00020000-5666-96c0-161d-883c766fc317	00030000-5666-96be-5cfd-211df3d32b0b
00020000-5666-96c0-8785-73aa8833c240	00030000-5666-96be-7c5f-adf915761610
00020000-5666-96c0-ca71-68286dbe7980	00030000-5666-96be-b48e-3238d2912520
00020000-5666-96c0-6792-28617a2cd31f	00030000-5666-96be-b1d6-0c1026d99a33
00020000-5666-96c0-95a8-6abd22e63d72	00030000-5666-96be-1afd-e6fed0f2f312
00020000-5666-96c0-ead7-75b4723c91cb	00030000-5666-96be-0340-d490ac914a10
00020000-5666-96c0-a7c8-b02b530a5717	00030000-5666-96be-0287-00c481e0fdc9
00020000-5666-96c0-08de-909daf3b3c64	00030000-5666-96be-567b-871a32eb152d
00020000-5666-96c0-c453-840d1439e741	00030000-5666-96be-890d-41cad8a053ab
00020000-5666-96c0-2b80-fd2e7bb4eee4	00030000-5666-96be-a35b-4f962713b7f7
00020000-5666-96c0-bad4-375104128b67	00030000-5666-96be-569e-59bf1e5a696a
00020000-5666-96c0-0bde-cc93dc5e0b6c	00030000-5666-96be-fea2-8d1a6c3ce336
00020000-5666-96c0-0bde-cc93dc5e0b6c	00030000-5666-96be-d1b9-f0585c64f32c
00020000-5666-96c0-0bde-cc93dc5e0b6c	00030000-5666-96be-ae41-6d7980a61d38
00020000-5666-96c0-3026-19551e06abc0	00030000-5666-96be-2db7-e67d87ac2c61
00020000-5666-96c0-0874-a9c866225c87	00030000-5666-96be-f792-5c32908aaa79
00020000-5666-96c0-4581-2238591cb20a	00030000-5666-96be-fbc9-d4f71dadc69c
00020000-5666-96c0-efcd-15bf09ef1218	00030000-5666-96be-5191-8a033350df77
00020000-5666-96c0-d8ec-be2def2beb41	00030000-5666-96be-7ec8-d1e24967579a
00020000-5666-96c0-f53a-c6d5ddeaff6f	00030000-5666-96be-02f2-700992fd70c3
00020000-5666-96c0-90fa-ed908e110fce	00030000-5666-96be-a0a8-e8e0478997da
00020000-5666-96c0-c3a2-238a120fe371	00030000-5666-96be-7821-ae04787087d6
00020000-5666-96c0-078b-5afbff933504	00030000-5666-96be-7620-c4635922e7ae
\.


--
-- TOC entry 3141 (class 0 OID 31134450)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 31134484)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 31134621)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5666-96c0-eced-fa8c540c68cd	00090000-5666-96c0-9701-03ca470104f7	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5666-96c0-8cac-04d633ccf2bf	00090000-5666-96c0-e4bb-33ac8a5f47f7	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5666-96c0-e5d5-703a5ebf9a60	00090000-5666-96c0-ea71-8596c70c874d	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5666-96c0-edf2-bbbe7dbb8844	00090000-5666-96c0-eb81-940c755a89d7	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 31134142)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5666-96c0-2b5d-9189283d15de	\N	00040000-5666-96be-6d96-00e7e71933d3	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-96c0-6824-3e85bd29d968	\N	00040000-5666-96be-6d96-00e7e71933d3	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5666-96c0-d54b-b63c86c0b9aa	\N	00040000-5666-96be-6d96-00e7e71933d3	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-96c0-769d-1d9fff189b77	\N	00040000-5666-96be-6d96-00e7e71933d3	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-96c0-85be-f14c317e0019	\N	00040000-5666-96be-6d96-00e7e71933d3	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-96c0-54d5-a91a0904838a	\N	00040000-5666-96be-ad56-f9184bdc3ba9	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-96c0-7f64-58699a5ba8a1	\N	00040000-5666-96be-37d7-633115327313	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-96c0-1b18-fac561fca10a	\N	00040000-5666-96be-6cb6-76f52bf36431	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-96c0-90e8-c33df1c60797	\N	00040000-5666-96be-1616-4b66e0242da8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-96c2-6a2f-ccc77f30e288	\N	00040000-5666-96be-6d96-00e7e71933d3	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 31134187)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5666-96bd-c97b-001d5f5bb6ee	8341	Adlešiči
00050000-5666-96bd-7e89-2bcc9ce98b27	5270	Ajdovščina
00050000-5666-96bd-9224-09d1fd6d6aeb	6280	Ankaran/Ancarano
00050000-5666-96bd-8fdb-9ce8ef7f7704	9253	Apače
00050000-5666-96bd-5096-a237982e51cc	8253	Artiče
00050000-5666-96bd-8478-9e5570473128	4275	Begunje na Gorenjskem
00050000-5666-96bd-2b84-cfd1d7983e36	1382	Begunje pri Cerknici
00050000-5666-96bd-c124-53497d2124e6	9231	Beltinci
00050000-5666-96bd-a22c-58acff0d4177	2234	Benedikt
00050000-5666-96bd-a3fa-c7cb0e0eafc9	2345	Bistrica ob Dravi
00050000-5666-96bd-4c12-1882cd983964	3256	Bistrica ob Sotli
00050000-5666-96bd-24e8-76defe58e973	8259	Bizeljsko
00050000-5666-96bd-bd31-bc75e14254fa	1223	Blagovica
00050000-5666-96bd-177e-3ddfe9cb0fed	8283	Blanca
00050000-5666-96bd-14ec-0ae93d98daf1	4260	Bled
00050000-5666-96bd-09f5-815c5c87125b	4273	Blejska Dobrava
00050000-5666-96bd-2498-e92ec2ed1add	9265	Bodonci
00050000-5666-96bd-af17-9170e1db9836	9222	Bogojina
00050000-5666-96bd-3066-649c955ee16a	4263	Bohinjska Bela
00050000-5666-96bd-7aa3-1d34f1f0af7f	4264	Bohinjska Bistrica
00050000-5666-96bd-f304-201c4455da72	4265	Bohinjsko jezero
00050000-5666-96bd-d623-1cbb5fa3adb8	1353	Borovnica
00050000-5666-96bd-03e0-c324ccee7a9a	8294	Boštanj
00050000-5666-96bd-8435-12ab298e832c	5230	Bovec
00050000-5666-96bd-8417-bd32c0fe0174	5295	Branik
00050000-5666-96bd-1242-5fa89e0491d5	3314	Braslovče
00050000-5666-96bd-a526-d006ac74b8ff	5223	Breginj
00050000-5666-96bd-6a02-c8cb74432e18	8280	Brestanica
00050000-5666-96bd-9069-d96e87fc7e62	2354	Bresternica
00050000-5666-96bd-bb03-8e66f82a6dae	4243	Brezje
00050000-5666-96bd-1e35-9c05e9ce9b47	1351	Brezovica pri Ljubljani
00050000-5666-96bd-67e4-429abcca9135	8250	Brežice
00050000-5666-96bd-fcbe-789242787544	4210	Brnik - Aerodrom
00050000-5666-96bd-0e8c-07e60dab0a31	8321	Brusnice
00050000-5666-96bd-d7ca-51d097184e11	3255	Buče
00050000-5666-96bd-3e25-814f54345f6d	8276	Bučka 
00050000-5666-96bd-b315-0fa44712059b	9261	Cankova
00050000-5666-96bd-4c74-d8351e6f4f63	3000	Celje 
00050000-5666-96bd-0079-e441d9674c43	3001	Celje - poštni predali
00050000-5666-96bd-80d2-8ec6942fb858	4207	Cerklje na Gorenjskem
00050000-5666-96bd-89a9-34bcf9c03c6b	8263	Cerklje ob Krki
00050000-5666-96bd-d846-b4347f1c626a	1380	Cerknica
00050000-5666-96bd-e967-3b96f5c168b2	5282	Cerkno
00050000-5666-96bd-b8e9-4f2b45072ebf	2236	Cerkvenjak
00050000-5666-96bd-a40e-00785dfe4732	2215	Ceršak
00050000-5666-96bd-d1c8-8fc168656edf	2326	Cirkovce
00050000-5666-96bd-b1ad-3f560beca06e	2282	Cirkulane
00050000-5666-96bd-f86e-4114b75a1035	5273	Col
00050000-5666-96bd-b47b-97ea459f38ee	8251	Čatež ob Savi
00050000-5666-96bd-1692-3c97495e651c	1413	Čemšenik
00050000-5666-96bd-a8aa-a05adc30dcee	5253	Čepovan
00050000-5666-96bd-3305-1e901b4e1bc9	9232	Črenšovci
00050000-5666-96bd-8071-59631167c3fb	2393	Črna na Koroškem
00050000-5666-96bd-ec3b-f0a888501eb9	6275	Črni Kal
00050000-5666-96bd-7f8c-0e87bfa60023	5274	Črni Vrh nad Idrijo
00050000-5666-96bd-7e83-20fa037a240f	5262	Črniče
00050000-5666-96bd-4652-4906d0949b01	8340	Črnomelj
00050000-5666-96bd-ce48-0de46e458077	6271	Dekani
00050000-5666-96bd-637c-3ce11ca5c323	5210	Deskle
00050000-5666-96bd-b47b-52096c12327a	2253	Destrnik
00050000-5666-96bd-7a46-edb82e26c9c7	6215	Divača
00050000-5666-96bd-6689-8e068255d4b2	1233	Dob
00050000-5666-96bd-51a8-ecedae4e520a	3224	Dobje pri Planini
00050000-5666-96bd-10f1-0613085f9a82	8257	Dobova
00050000-5666-96bd-d9cc-44bcc27e2766	1423	Dobovec
00050000-5666-96bd-fda3-67760fcd963f	5263	Dobravlje
00050000-5666-96bd-ad45-176447c10c37	3204	Dobrna
00050000-5666-96bd-60cd-61398fa69616	8211	Dobrnič
00050000-5666-96bd-a462-6695409ba41e	1356	Dobrova
00050000-5666-96bd-720c-f57bf06a82db	9223	Dobrovnik/Dobronak 
00050000-5666-96bd-4abb-356af4f90e91	5212	Dobrovo v Brdih
00050000-5666-96bd-c106-86dd40077b71	1431	Dol pri Hrastniku
00050000-5666-96bd-a64c-86ec6227602e	1262	Dol pri Ljubljani
00050000-5666-96bd-beb7-bf2d05d0a02e	1273	Dole pri Litiji
00050000-5666-96bd-5ff2-adf040b5f3d1	1331	Dolenja vas
00050000-5666-96bd-9f3a-9df6083202d5	8350	Dolenjske Toplice
00050000-5666-96bd-ba5c-3910e4ad0b96	1230	Domžale
00050000-5666-96bd-17a2-8ba3c2233e45	2252	Dornava
00050000-5666-96bd-60ed-f9be61469c0b	5294	Dornberk
00050000-5666-96bd-e217-1fd8cd6af501	1319	Draga
00050000-5666-96bd-abb4-6c5a682c46c9	8343	Dragatuš
00050000-5666-96bd-8d76-d0a39bdee7fa	3222	Dramlje
00050000-5666-96bd-5f41-dbcd60cc4d21	2370	Dravograd
00050000-5666-96bd-451c-2f0cbaf018eb	4203	Duplje
00050000-5666-96bd-d410-ae0d04229db2	6221	Dutovlje
00050000-5666-96bd-efc2-76444f57e105	8361	Dvor
00050000-5666-96bd-1a9d-586e452cc146	2343	Fala
00050000-5666-96bd-dd08-a83fd8d7b1d7	9208	Fokovci
00050000-5666-96bd-bff3-f5054660ba82	2313	Fram
00050000-5666-96bd-20dd-be2bbe5ddbba	3213	Frankolovo
00050000-5666-96bd-a14b-b71c7fb8f61d	1274	Gabrovka
00050000-5666-96bd-e446-471be9197ea8	8254	Globoko
00050000-5666-96bd-e0f3-2875947306a9	5275	Godovič
00050000-5666-96bd-2b65-235f76f3d7ea	4204	Golnik
00050000-5666-96bd-32b8-0484a23a5eef	3303	Gomilsko
00050000-5666-96bd-223b-5468137ba2ae	4224	Gorenja vas
00050000-5666-96bd-b179-be961650df5f	3263	Gorica pri Slivnici
00050000-5666-96bd-8553-9b0aeb0254f6	2272	Gorišnica
00050000-5666-96bd-b290-c598cd417365	9250	Gornja Radgona
00050000-5666-96bd-b696-b7db13803664	3342	Gornji Grad
00050000-5666-96bd-ad53-c3a1b09bbca7	4282	Gozd Martuljek
00050000-5666-96bd-99b2-5c1c77e9feaa	6272	Gračišče
00050000-5666-96bd-cd52-2c810516f050	9264	Grad
00050000-5666-96bd-0b58-530685d155d6	8332	Gradac
00050000-5666-96bd-2d23-33c61e5e65e8	1384	Grahovo
00050000-5666-96bd-9add-059614a39be8	5242	Grahovo ob Bači
00050000-5666-96bd-08b1-c7323fa6b08f	5251	Grgar
00050000-5666-96bd-0531-f4c4976aafee	3302	Griže
00050000-5666-96bd-629a-e4be8b9c146f	3231	Grobelno
00050000-5666-96bd-1b55-e310d106b60f	1290	Grosuplje
00050000-5666-96bd-d9e8-1ac72ded300b	2288	Hajdina
00050000-5666-96bd-562d-ba5c3ce70918	8362	Hinje
00050000-5666-96bd-ab92-0b1e69f163ef	2311	Hoče
00050000-5666-96bd-3c71-0dbab49f37b6	9205	Hodoš/Hodos
00050000-5666-96bd-4994-4ca98b4a44a5	1354	Horjul
00050000-5666-96bd-bf97-0fd4578efa50	1372	Hotedršica
00050000-5666-96bd-45e5-7c6aa8b77bef	1430	Hrastnik
00050000-5666-96bd-988c-3187c81edf68	6225	Hruševje
00050000-5666-96bd-e00d-cc12fcb9477e	4276	Hrušica
00050000-5666-96bd-cab5-db8753185baf	5280	Idrija
00050000-5666-96bd-76c1-e2b37d7972eb	1292	Ig
00050000-5666-96bd-0893-ebcb308f8e7d	6250	Ilirska Bistrica
00050000-5666-96bd-52d7-c54817f05dfa	6251	Ilirska Bistrica-Trnovo
00050000-5666-96bd-9479-154ca3b9615b	1295	Ivančna Gorica
00050000-5666-96bd-53ac-083f0b57296d	2259	Ivanjkovci
00050000-5666-96bd-d488-c8b82f641ca2	1411	Izlake
00050000-5666-96bd-5d31-35d4a4f400ef	6310	Izola/Isola
00050000-5666-96bd-c96a-e211aa9f174a	2222	Jakobski Dol
00050000-5666-96bd-04e8-894a3feaccca	2221	Jarenina
00050000-5666-96bd-89b7-c74798952941	6254	Jelšane
00050000-5666-96bd-56cc-88ee101e5e5e	4270	Jesenice
00050000-5666-96bd-49ea-6c6ad8c65de7	8261	Jesenice na Dolenjskem
00050000-5666-96bd-8103-86fabd89d3b7	3273	Jurklošter
00050000-5666-96bd-c976-a9652384fb93	2223	Jurovski Dol
00050000-5666-96bd-4c10-117981edb19c	2256	Juršinci
00050000-5666-96bd-492e-ee0f2d209dd4	5214	Kal nad Kanalom
00050000-5666-96bd-391a-ecc7b2db4d72	3233	Kalobje
00050000-5666-96bd-b8ce-8e8aeba91bb7	4246	Kamna Gorica
00050000-5666-96bd-1a78-3490a9b29243	2351	Kamnica
00050000-5666-96bd-5ccc-0f4ffa7ab4cc	1241	Kamnik
00050000-5666-96bd-109e-9be241658a7b	5213	Kanal
00050000-5666-96bd-670c-d77973400fca	8258	Kapele
00050000-5666-96bd-7070-e01a87a77e63	2362	Kapla
00050000-5666-96bd-9a1f-ee76789b0095	2325	Kidričevo
00050000-5666-96bd-7995-a19f7bb6810b	1412	Kisovec
00050000-5666-96bd-b8b2-d9bbf64daffd	6253	Knežak
00050000-5666-96bd-ddd2-fb43969c527e	5222	Kobarid
00050000-5666-96bd-0d9e-faee464fbb25	9227	Kobilje
00050000-5666-96bd-8744-89641d5cd2a0	1330	Kočevje
00050000-5666-96bd-4504-59c64cffab5c	1338	Kočevska Reka
00050000-5666-96bd-b4c1-ae5285600577	2276	Kog
00050000-5666-96bd-3939-24dac3f1ada7	5211	Kojsko
00050000-5666-96bd-7cfa-5d2c070930dc	6223	Komen
00050000-5666-96bd-4f86-4732469fba55	1218	Komenda
00050000-5666-96bd-e03d-50d1e96addd1	6000	Koper/Capodistria 
00050000-5666-96bd-5b5e-c959ae1b570e	6001	Koper/Capodistria - poštni predali
00050000-5666-96bd-e586-50787a7f1e4b	8282	Koprivnica
00050000-5666-96bd-54f4-62c255b0d16c	5296	Kostanjevica na Krasu
00050000-5666-96bd-8afb-e5483fbdb086	8311	Kostanjevica na Krki
00050000-5666-96bd-073b-bcf88062cef6	1336	Kostel
00050000-5666-96bd-d181-4f2c88b81e4b	6256	Košana
00050000-5666-96bd-b5f1-0bf47bf62ed2	2394	Kotlje
00050000-5666-96bd-c6bd-d32f9404d2f7	6240	Kozina
00050000-5666-96bd-2229-1ebef0186169	3260	Kozje
00050000-5666-96bd-3921-2ff574304c43	4000	Kranj 
00050000-5666-96bd-b463-45fdd69f0591	4001	Kranj - poštni predali
00050000-5666-96bd-c603-13d946776029	4280	Kranjska Gora
00050000-5666-96bd-9caa-2a31b683069e	1281	Kresnice
00050000-5666-96bd-0ba6-f715f7eade8a	4294	Križe
00050000-5666-96bd-1ef9-1fd120b6f442	9206	Križevci
00050000-5666-96bd-0e7c-413841910886	9242	Križevci pri Ljutomeru
00050000-5666-96bd-0a1e-d61f32e754ba	1301	Krka
00050000-5666-96bd-d6e6-a82fef79b196	8296	Krmelj
00050000-5666-96bd-e786-16c8383086ec	4245	Kropa
00050000-5666-96bd-90a7-c1060649fe3f	8262	Krška vas
00050000-5666-96bd-2782-f7f0a8eaf6ca	8270	Krško
00050000-5666-96bd-58cb-c9d582f2f7f9	9263	Kuzma
00050000-5666-96bd-20af-f73db24402aa	2318	Laporje
00050000-5666-96bd-ece7-1ebc01dc4c21	3270	Laško
00050000-5666-96bd-819b-93f55392eb8a	1219	Laze v Tuhinju
00050000-5666-96bd-dce2-a97acf47ec63	2230	Lenart v Slovenskih goricah
00050000-5666-96bd-7edb-4596704f216a	9220	Lendava/Lendva
00050000-5666-96bd-021d-47ed1fa86f45	4248	Lesce
00050000-5666-96bd-2c1a-d0c730f7ecc6	3261	Lesično
00050000-5666-96bd-e22a-c2f50814755b	8273	Leskovec pri Krškem
00050000-5666-96bd-2a49-f942808c8460	2372	Libeliče
00050000-5666-96bd-eeb5-99380c77b227	2341	Limbuš
00050000-5666-96bd-a990-364a6215bc86	1270	Litija
00050000-5666-96bd-38f0-a098d1d2abe6	3202	Ljubečna
00050000-5666-96bd-6dff-1bb3903295f4	1000	Ljubljana 
00050000-5666-96bd-fb65-67b9c8ccb0c1	1001	Ljubljana - poštni predali
00050000-5666-96bd-8e87-b501af0c2988	1231	Ljubljana - Črnuče
00050000-5666-96bd-4aaa-7ff08f8974b4	1261	Ljubljana - Dobrunje
00050000-5666-96bd-6ca9-d70aea17024b	1260	Ljubljana - Polje
00050000-5666-96bd-c142-1418607df7e0	1210	Ljubljana - Šentvid
00050000-5666-96bd-53bb-455f84b9ee79	1211	Ljubljana - Šmartno
00050000-5666-96bd-7353-b9ddfe20b5a5	3333	Ljubno ob Savinji
00050000-5666-96bd-cd9f-9ff15c08635e	9240	Ljutomer
00050000-5666-96bd-c73e-f660a85284b5	3215	Loče
00050000-5666-96bd-4a82-bbdba4b8ed2c	5231	Log pod Mangartom
00050000-5666-96bd-a47b-979e1c9bda5c	1358	Log pri Brezovici
00050000-5666-96bd-6218-309cbfda04f0	1370	Logatec
00050000-5666-96bd-9dea-c5b9ac2ed43d	1371	Logatec
00050000-5666-96bd-0c16-2c73fb3ae06f	1434	Loka pri Zidanem Mostu
00050000-5666-96bd-b1f1-3b077c2bf778	3223	Loka pri Žusmu
00050000-5666-96bd-6bb7-f60aa137bf5f	6219	Lokev
00050000-5666-96bd-6069-864a9c155d50	1318	Loški Potok
00050000-5666-96bd-bf86-8a8b65624945	2324	Lovrenc na Dravskem polju
00050000-5666-96bd-1514-cec496289b95	2344	Lovrenc na Pohorju
00050000-5666-96bd-c49c-79e62ee6efe1	3334	Luče
00050000-5666-96bd-ee25-d978869843f5	1225	Lukovica
00050000-5666-96bd-29c3-f3a90bd38ef1	9202	Mačkovci
00050000-5666-96bd-8ec3-d0941e0c0e67	2322	Majšperk
00050000-5666-96bd-8ee3-0e09a3d9f153	2321	Makole
00050000-5666-96bd-8e9c-b00dae2cb0c4	9243	Mala Nedelja
00050000-5666-96bd-8efe-0418e4e8a9a5	2229	Malečnik
00050000-5666-96bd-99e5-0214a317b7b5	6273	Marezige
00050000-5666-96bd-60d8-057e645c22d4	2000	Maribor 
00050000-5666-96bd-55f4-9022a0274966	2001	Maribor - poštni predali
00050000-5666-96bd-194c-17d7cb2b3223	2206	Marjeta na Dravskem polju
00050000-5666-96bd-9fd5-c98767bf8c1a	2281	Markovci
00050000-5666-96bd-c63e-e25bc4b13db6	9221	Martjanci
00050000-5666-96bd-0e73-17a800fa3b6e	6242	Materija
00050000-5666-96bd-e4c7-1006c0863775	4211	Mavčiče
00050000-5666-96bd-7498-44984a3265bd	1215	Medvode
00050000-5666-96bd-9824-bd6178ed545f	1234	Mengeš
00050000-5666-96bd-b15d-6a8818bef61c	8330	Metlika
00050000-5666-96bd-bc06-0dba39b1ce86	2392	Mežica
00050000-5666-96bd-0240-22667d1d4e3d	2204	Miklavž na Dravskem polju
00050000-5666-96bd-a66d-6ad4f01e494c	2275	Miklavž pri Ormožu
00050000-5666-96bd-f615-7a7c16330b2d	5291	Miren
00050000-5666-96bd-d701-a3119b2e3ce0	8233	Mirna
00050000-5666-96bd-6d3d-77b4cecf81a2	8216	Mirna Peč
00050000-5666-96bd-7847-774fcdaaea42	2382	Mislinja
00050000-5666-96bd-51a6-38829084f4ab	4281	Mojstrana
00050000-5666-96bd-d35c-b8666939ffce	8230	Mokronog
00050000-5666-96bd-eb6b-7c8794e22a5c	1251	Moravče
00050000-5666-96bd-3374-81b0d5524dab	9226	Moravske Toplice
00050000-5666-96bd-545c-c659a3b2b3dc	5216	Most na Soči
00050000-5666-96bd-28de-2620e74a5d00	1221	Motnik
00050000-5666-96bd-386f-5d8076bbeb68	3330	Mozirje
00050000-5666-96bd-4489-8adbe7d06e1a	9000	Murska Sobota 
00050000-5666-96bd-37f6-c1237c3b7b70	9001	Murska Sobota - poštni predali
00050000-5666-96bd-b6af-eb0ce1b0da04	2366	Muta
00050000-5666-96bd-2f5c-9cd77ff2c756	4202	Naklo
00050000-5666-96bd-4cb1-7c1bf3695dc2	3331	Nazarje
00050000-5666-96bd-a81b-95c582e68726	1357	Notranje Gorice
00050000-5666-96bd-f003-377fd4e58a9a	3203	Nova Cerkev
00050000-5666-96bd-d796-548591dab419	5000	Nova Gorica 
00050000-5666-96bd-5510-4b6c55688f8d	5001	Nova Gorica - poštni predali
00050000-5666-96bd-88c3-0c985cb9eaa0	1385	Nova vas
00050000-5666-96bd-b08c-0cf3b03920ed	8000	Novo mesto
00050000-5666-96bd-ef96-29b361eb61cc	8001	Novo mesto - poštni predali
00050000-5666-96bd-822d-e244fd0e3e21	6243	Obrov
00050000-5666-96bd-a2f7-474f04085219	9233	Odranci
00050000-5666-96bd-a2b9-3a1239c27950	2317	Oplotnica
00050000-5666-96bd-333a-acb2613c1d7b	2312	Orehova vas
00050000-5666-96bd-ced6-50ea4384b2f1	2270	Ormož
00050000-5666-96bd-8b6a-0260b5d2b296	1316	Ortnek
00050000-5666-96bd-7b89-9c8e06180eda	1337	Osilnica
00050000-5666-96bd-9726-af3f4ae4f880	8222	Otočec
00050000-5666-96bd-4b7a-abe079596947	2361	Ožbalt
00050000-5666-96bd-98d4-6515ec18d6be	2231	Pernica
00050000-5666-96bd-27a0-40a339133ca6	2211	Pesnica pri Mariboru
00050000-5666-96bd-ffdd-04e38ec24bf0	9203	Petrovci
00050000-5666-96bd-cf5e-7dba87df8de2	3301	Petrovče
00050000-5666-96bd-80aa-c7cdb602444a	6330	Piran/Pirano
00050000-5666-96bd-f2db-7621c76e4241	8255	Pišece
00050000-5666-96bd-12f4-5b89e606cfc5	6257	Pivka
00050000-5666-96bd-9485-010a8f8d6b67	6232	Planina
00050000-5666-96bd-29e3-1110a0d00049	3225	Planina pri Sevnici
00050000-5666-96bd-9ef9-aaf010d41f45	6276	Pobegi
00050000-5666-96bd-e321-a2447ab7b4c8	8312	Podbočje
00050000-5666-96bd-e3da-a39f553cc299	5243	Podbrdo
00050000-5666-96bd-ff5d-e3031dec054c	3254	Podčetrtek
00050000-5666-96bd-7b4b-fa1c9fd6c0d6	2273	Podgorci
00050000-5666-96bd-cb53-5781ea3557e8	6216	Podgorje
00050000-5666-96bd-2d86-35d88965bbc0	2381	Podgorje pri Slovenj Gradcu
00050000-5666-96bd-8dee-bb18bd77c4be	6244	Podgrad
00050000-5666-96bd-b93d-850b97880178	1414	Podkum
00050000-5666-96bd-4ad0-9f002fbc7447	2286	Podlehnik
00050000-5666-96bd-f5d3-62d5f0ffacc5	5272	Podnanos
00050000-5666-96bd-84b3-06314ca8b54e	4244	Podnart
00050000-5666-96bd-b8a5-009ca82c84ee	3241	Podplat
00050000-5666-96bd-c50b-dc61c95d9698	3257	Podsreda
00050000-5666-96bd-e57e-a23fccb4d264	2363	Podvelka
00050000-5666-96bd-1374-0eac12809dd7	2208	Pohorje
00050000-5666-96bd-274e-fc3739ba4487	2257	Polenšak
00050000-5666-96bd-246f-71314a9ebbf3	1355	Polhov Gradec
00050000-5666-96bd-f3fb-3ce116ba703a	4223	Poljane nad Škofjo Loko
00050000-5666-96bd-f25d-140b19b4f8aa	2319	Poljčane
00050000-5666-96bd-fae9-eba9dca51ec9	1272	Polšnik
00050000-5666-96bd-6806-a064fe883dab	3313	Polzela
00050000-5666-96bd-0686-ab8380c38139	3232	Ponikva
00050000-5666-96bd-4de5-1cf5717035b7	6320	Portorož/Portorose
00050000-5666-96bd-3cb0-4937638a452d	6230	Postojna
00050000-5666-96bd-21b2-7839e76eb1a7	2331	Pragersko
00050000-5666-96bd-ae77-b32e72047eb5	3312	Prebold
00050000-5666-96bd-745e-8f4e0453aaea	4205	Preddvor
00050000-5666-96bd-3c03-1ca062fe2826	6255	Prem
00050000-5666-96bd-2fa8-011de771dfab	1352	Preserje
00050000-5666-96bd-2e60-6dcb8ddc70de	6258	Prestranek
00050000-5666-96bd-e09f-f6e795bb4b6a	2391	Prevalje
00050000-5666-96bd-72d4-b876b7a47539	3262	Prevorje
00050000-5666-96bd-7386-e1d7cc36421c	1276	Primskovo 
00050000-5666-96bd-99a8-bd22acfe16e8	3253	Pristava pri Mestinju
00050000-5666-96bd-eaad-ea9c7ad53aad	9207	Prosenjakovci/Partosfalva
00050000-5666-96bd-1f88-148f43b3a788	5297	Prvačina
00050000-5666-96bd-c6de-5b3530558ea5	2250	Ptuj
00050000-5666-96bd-71bd-1f82631d2efe	2323	Ptujska Gora
00050000-5666-96bd-a71f-1664e3e81da4	9201	Puconci
00050000-5666-96bd-b4ce-0eb97849d40a	2327	Rače
00050000-5666-96bd-7604-b447fa9df578	1433	Radeče
00050000-5666-96bd-6c6f-f8a78de30a00	9252	Radenci
00050000-5666-96bd-3c00-d6b20be7729c	2360	Radlje ob Dravi
00050000-5666-96bd-3c2a-27ad00740a52	1235	Radomlje
00050000-5666-96bd-da60-82fe2830dc92	4240	Radovljica
00050000-5666-96bd-bdac-3e278a79363a	8274	Raka
00050000-5666-96bd-7570-4bf45e5cef33	1381	Rakek
00050000-5666-96bd-6ad5-fd2ae154ec92	4283	Rateče - Planica
00050000-5666-96bd-fd29-ce1a0080e922	2390	Ravne na Koroškem
00050000-5666-96bd-432e-618feba75e07	9246	Razkrižje
00050000-5666-96bd-4123-fb6bd85a242d	3332	Rečica ob Savinji
00050000-5666-96bd-15cc-ed35738382f1	5292	Renče
00050000-5666-96bd-a875-53d6e5ba2aaf	1310	Ribnica
00050000-5666-96bd-ae0a-8efbd4b2080c	2364	Ribnica na Pohorju
00050000-5666-96bd-e184-bd2f2aab8497	3272	Rimske Toplice
00050000-5666-96bd-5d2f-96d977d69370	1314	Rob
00050000-5666-96bd-a960-738b7b6d5154	5215	Ročinj
00050000-5666-96bd-78ed-8a696f7dd8bf	3250	Rogaška Slatina
00050000-5666-96bd-c753-0c9f04e5f09b	9262	Rogašovci
00050000-5666-96bd-cc51-ad966c7c46bd	3252	Rogatec
00050000-5666-96bd-94e1-2614865ceec2	1373	Rovte
00050000-5666-96bd-ffc9-051ef3eff6f7	2342	Ruše
00050000-5666-96bd-bbc9-a1d0e0974b8e	1282	Sava
00050000-5666-96bd-dc12-fa7b152ebbe6	6333	Sečovlje/Sicciole
00050000-5666-96bd-2f2c-5a82932e1b7b	4227	Selca
00050000-5666-96bd-0bd6-3baaadfe0f61	2352	Selnica ob Dravi
00050000-5666-96bd-5dca-90af99b911df	8333	Semič
00050000-5666-96bd-5f9d-f6e319c1dd28	8281	Senovo
00050000-5666-96bd-c0e7-f6aaf8986c5c	6224	Senožeče
00050000-5666-96bd-9800-e958d22f13ef	8290	Sevnica
00050000-5666-96bd-b906-ad755bc6c8f5	6210	Sežana
00050000-5666-96bd-1707-b55e83a37c67	2214	Sladki Vrh
00050000-5666-96bd-fa29-670eaedec116	5283	Slap ob Idrijci
00050000-5666-96bd-0dc2-ab8895e791fb	2380	Slovenj Gradec
00050000-5666-96bd-69c5-15ca0b1dd5a2	2310	Slovenska Bistrica
00050000-5666-96bd-613a-4a80bce0d299	3210	Slovenske Konjice
00050000-5666-96bd-4563-5fb3ef628b65	1216	Smlednik
00050000-5666-96bd-c560-7fe51130fb9c	5232	Soča
00050000-5666-96bd-0240-1bf67376b866	1317	Sodražica
00050000-5666-96bd-9293-e028da6aafd4	3335	Solčava
00050000-5666-96bd-2e36-d267e28e8470	5250	Solkan
00050000-5666-96bd-723f-08fe8c3c1c35	4229	Sorica
00050000-5666-96bd-f349-a3cbe0778a3c	4225	Sovodenj
00050000-5666-96bd-9bae-70543505b9f2	5281	Spodnja Idrija
00050000-5666-96bd-8186-1f1c918f3908	2241	Spodnji Duplek
00050000-5666-96bd-3d38-92416826b5d8	9245	Spodnji Ivanjci
00050000-5666-96bd-552c-0e1d96d8d91a	2277	Središče ob Dravi
00050000-5666-96bd-ae46-50d038473e7a	4267	Srednja vas v Bohinju
00050000-5666-96bd-e6a2-b51c8a194000	8256	Sromlje 
00050000-5666-96bd-c0a2-2f08f6cebc6f	5224	Srpenica
00050000-5666-96bd-d5b7-9eed370b3558	1242	Stahovica
00050000-5666-96bd-b4e4-01b177d74d77	1332	Stara Cerkev
00050000-5666-96bd-f108-423835fc5173	8342	Stari trg ob Kolpi
00050000-5666-96bd-df41-78783c205d5b	1386	Stari trg pri Ložu
00050000-5666-96bd-a559-d08cf33e87db	2205	Starše
00050000-5666-96bd-101f-5a98b099b7aa	2289	Stoperce
00050000-5666-96bd-0bf3-bc64b0745325	8322	Stopiče
00050000-5666-96bd-1765-35cebbb17c8f	3206	Stranice
00050000-5666-96bd-87d2-0f1ab51b3cd1	8351	Straža
00050000-5666-96bd-f359-62ea50e1c3da	1313	Struge
00050000-5666-96bd-4342-a80ed813f8a9	8293	Studenec
00050000-5666-96bd-57be-bc3b6527939c	8331	Suhor
00050000-5666-96bd-8bd3-7270a930080c	2233	Sv. Ana v Slovenskih goricah
00050000-5666-96bd-02a5-c6f3270585d5	2235	Sv. Trojica v Slovenskih goricah
00050000-5666-96bd-7cd7-a8f13ca3ed2f	2353	Sveti Duh na Ostrem Vrhu
00050000-5666-96bd-b78f-9492357ac228	9244	Sveti Jurij ob Ščavnici
00050000-5666-96bd-3c66-1005eb83d7d4	3264	Sveti Štefan
00050000-5666-96bd-04fa-35920654fa2e	2258	Sveti Tomaž
00050000-5666-96bd-ff5e-65d70f1c461f	9204	Šalovci
00050000-5666-96bd-3294-9cb3ce470877	5261	Šempas
00050000-5666-96bd-a9a6-cfe754c9e8bb	5290	Šempeter pri Gorici
00050000-5666-96bd-31db-a8d1136e5e64	3311	Šempeter v Savinjski dolini
00050000-5666-96bd-120a-329381b12c0c	4208	Šenčur
00050000-5666-96bd-f4fc-92c876c9f4d5	2212	Šentilj v Slovenskih goricah
00050000-5666-96bd-cd9d-6b6d8d04b33b	8297	Šentjanž
00050000-5666-96bd-3717-586520dc8e01	2373	Šentjanž pri Dravogradu
00050000-5666-96bd-de52-1ada06f15065	8310	Šentjernej
00050000-5666-96bd-dcb5-799497387632	3230	Šentjur
00050000-5666-96bd-6d49-1045281d2fa5	3271	Šentrupert
00050000-5666-96bd-033f-88b94e7b7a86	8232	Šentrupert
00050000-5666-96bd-67bc-c82e774358b8	1296	Šentvid pri Stični
00050000-5666-96bd-45a1-454d27a292fb	8275	Škocjan
00050000-5666-96bd-831e-f70b1b403cf4	6281	Škofije
00050000-5666-96bd-52e9-d093092b62a4	4220	Škofja Loka
00050000-5666-96bd-f8ca-8d7e1bf3fe3a	3211	Škofja vas
00050000-5666-96bd-a23b-d6f3a8de14dc	1291	Škofljica
00050000-5666-96bd-daf5-209fe05efe74	6274	Šmarje
00050000-5666-96bd-7661-7d6a53814ef2	1293	Šmarje - Sap
00050000-5666-96bd-2997-1cef8be338e6	3240	Šmarje pri Jelšah
00050000-5666-96bd-0961-be902867e7c5	8220	Šmarješke Toplice
00050000-5666-96bd-7907-b5f35cbffaac	2315	Šmartno na Pohorju
00050000-5666-96bd-c502-2d921d3421dc	3341	Šmartno ob Dreti
00050000-5666-96bd-c8f2-a2926ef5f4ef	3327	Šmartno ob Paki
00050000-5666-96bd-2851-2f227407a703	1275	Šmartno pri Litiji
00050000-5666-96bd-a2e8-4191a98c480f	2383	Šmartno pri Slovenj Gradcu
00050000-5666-96bd-c207-00cbfbbf95bc	3201	Šmartno v Rožni dolini
00050000-5666-96bd-fe42-05f2508af85f	3325	Šoštanj
00050000-5666-96bd-c670-e060aab5f1c0	6222	Štanjel
00050000-5666-96bd-cd72-2653ce8b9920	3220	Štore
00050000-5666-96bd-366e-f6d3fd1a2f6b	3304	Tabor
00050000-5666-96bd-0bd2-79fd02557e84	3221	Teharje
00050000-5666-96bd-dc57-1023b01895a6	9251	Tišina
00050000-5666-96bd-f29c-8db6a2979190	5220	Tolmin
00050000-5666-96bd-6429-96dae6e27f6d	3326	Topolšica
00050000-5666-96bd-e4fd-e3ce2f0428f3	2371	Trbonje
00050000-5666-96bd-62e9-78845d12a317	1420	Trbovlje
00050000-5666-96bd-1fc5-e8ddcdabce93	8231	Trebelno 
00050000-5666-96bd-e938-386b17a90daa	8210	Trebnje
00050000-5666-96bd-b9da-a157c86c607c	5252	Trnovo pri Gorici
00050000-5666-96bd-8172-05b1b49eca1f	2254	Trnovska vas
00050000-5666-96bd-c0e0-0bd8cec75af5	1222	Trojane
00050000-5666-96bd-dc7f-576aa7489adc	1236	Trzin
00050000-5666-96bd-b592-ad345cede687	4290	Tržič
00050000-5666-96bd-a9da-69eeb3e968dc	8295	Tržišče
00050000-5666-96bd-a724-aa8d4063acea	1311	Turjak
00050000-5666-96bd-4e26-ca19e53b346a	9224	Turnišče
00050000-5666-96bd-def1-75e26aeb1ac9	8323	Uršna sela
00050000-5666-96bd-87df-26cc1f16eb2b	1252	Vače
00050000-5666-96bd-b551-84c9b194f63a	3320	Velenje 
00050000-5666-96bd-d1cf-655c9c5f2cc5	3322	Velenje - poštni predali
00050000-5666-96bd-6292-c39ffb9c10a0	8212	Velika Loka
00050000-5666-96bd-0583-1b7788aa8f9f	2274	Velika Nedelja
00050000-5666-96bd-099f-d7be32cc6cb7	9225	Velika Polana
00050000-5666-96bd-002f-1a7551078556	1315	Velike Lašče
00050000-5666-96bd-2bba-0f0d368c5044	8213	Veliki Gaber
00050000-5666-96bd-c3bf-a5dfa953e085	9241	Veržej
00050000-5666-96bd-9d34-d4fccda2933b	1312	Videm - Dobrepolje
00050000-5666-96bd-0bb1-d841599be4b1	2284	Videm pri Ptuju
00050000-5666-96bd-e87c-684de5761196	8344	Vinica
00050000-5666-96bd-9556-83c58f841e91	5271	Vipava
00050000-5666-96bd-a65c-50f08d00644f	4212	Visoko
00050000-5666-96bd-bc56-ca3e68ae5bba	1294	Višnja Gora
00050000-5666-96bd-3f4c-03581b3d2e27	3205	Vitanje
00050000-5666-96bd-b9a2-7cd044838d6c	2255	Vitomarci
00050000-5666-96bd-27d9-c895d5140959	1217	Vodice
00050000-5666-96bd-755f-1a2cfdd6806c	3212	Vojnik\t
00050000-5666-96bd-30cd-b7fd7f24302b	5293	Volčja Draga
00050000-5666-96bd-fc2e-3250fdccbcf0	2232	Voličina
00050000-5666-96bd-b495-cd3175a429a6	3305	Vransko
00050000-5666-96bd-a9a9-32c3d01892c4	6217	Vremski Britof
00050000-5666-96bd-432c-23de37737748	1360	Vrhnika
00050000-5666-96bd-c871-daca0d6a30fc	2365	Vuhred
00050000-5666-96bd-cc72-81bbae2ece48	2367	Vuzenica
00050000-5666-96bd-0570-34eb7fbf3730	8292	Zabukovje 
00050000-5666-96bd-0871-92ef94581756	1410	Zagorje ob Savi
00050000-5666-96bd-83fa-02298e8f9ac9	1303	Zagradec
00050000-5666-96bd-e9f5-5e62215b5063	2283	Zavrč
00050000-5666-96bd-1f59-0f368a056149	8272	Zdole 
00050000-5666-96bd-f9f8-20a442d28905	4201	Zgornja Besnica
00050000-5666-96bd-a8ea-2a1858e7b8ca	2242	Zgornja Korena
00050000-5666-96bd-9118-6639233c9549	2201	Zgornja Kungota
00050000-5666-96bd-dac4-54bb0fc818d7	2316	Zgornja Ložnica
00050000-5666-96bd-92bf-e34f9dad9c50	2314	Zgornja Polskava
00050000-5666-96bd-62bd-ed2985d7028d	2213	Zgornja Velka
00050000-5666-96bd-e9c1-51d7c5baf95d	4247	Zgornje Gorje
00050000-5666-96bd-8aca-1064c07b656f	4206	Zgornje Jezersko
00050000-5666-96bd-08bf-71cc08223105	2285	Zgornji Leskovec
00050000-5666-96bd-bc9d-a08e4f9c37da	1432	Zidani Most
00050000-5666-96bd-8cc4-7814d26b5ec1	3214	Zreče
00050000-5666-96bd-89e9-02fad7aac767	4209	Žabnica
00050000-5666-96bd-c4f2-9b93248fc2f8	3310	Žalec
00050000-5666-96bd-2268-d9a0e4288056	4228	Železniki
00050000-5666-96bd-1a74-f6431e62dba8	2287	Žetale
00050000-5666-96bd-977c-6f9363cd0d1c	4226	Žiri
00050000-5666-96bd-4cc6-23fb0c00d61c	4274	Žirovnica
00050000-5666-96bd-e291-7fd8dcd7a392	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 31134849)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 31134424)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 31134172)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5666-96c0-244b-cd89f64483e9	00080000-5666-96c0-2b5d-9189283d15de	\N	00040000-5666-96be-6d96-00e7e71933d3	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5666-96c0-9e87-f64938bc254f	00080000-5666-96c0-2b5d-9189283d15de	\N	00040000-5666-96be-6d96-00e7e71933d3	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5666-96c0-94f0-6ff5207d6b18	00080000-5666-96c0-6824-3e85bd29d968	\N	00040000-5666-96be-6d96-00e7e71933d3	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 31134316)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5666-96be-be88-3234900bb996	novo leto	1	1	\N	t
00430000-5666-96be-2fe3-4298b2aa2121	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5666-96be-ad3a-fcc062eb3326	dan upora proti okupatorju	27	4	\N	t
00430000-5666-96be-2067-5c1f87900ae8	praznik dela	1	5	\N	t
00430000-5666-96be-a47b-d49fcd49ea78	praznik dela	2	5	\N	t
00430000-5666-96be-e73c-83ea0d2f9db0	dan Primoža Trubarja	8	6	\N	f
00430000-5666-96be-8b62-919f5a0ee06e	dan državnosti	25	6	\N	t
00430000-5666-96be-0caa-509e4e42e168	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5666-96be-9e61-8752f960e3a3	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5666-96be-5b48-8c5891cda279	dan suverenosti	25	10	\N	f
00430000-5666-96be-8b6d-b52d2c6f262d	dan spomina na mrtve	1	11	\N	t
00430000-5666-96be-6c72-335ebb5f9b06	dan Rudolfa Maistra	23	11	\N	f
00430000-5666-96be-c55f-cdbb13fc8228	božič	25	12	\N	t
00430000-5666-96be-e904-2a04f8ddd4db	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5666-96be-4022-033ff0db0c5f	Marijino vnebovzetje	15	8	\N	t
00430000-5666-96be-dbbd-a767a7895c34	dan reformacije	31	10	\N	t
00430000-5666-96be-03fc-ddba17d965fa	velikonočna nedelja	27	3	2016	t
00430000-5666-96be-0115-68d0dd262fb1	velikonočna nedelja	16	4	2017	t
00430000-5666-96be-c6dc-ee80dbfc77d2	velikonočna nedelja	1	4	2018	t
00430000-5666-96be-23ea-f442529d58af	velikonočna nedelja	21	4	2019	t
00430000-5666-96be-aa99-1b3635a7fa26	velikonočna nedelja	12	4	2020	t
00430000-5666-96be-545a-49aa10069f03	velikonočna nedelja	4	4	2021	t
00430000-5666-96be-6eb8-0ab5a68c01f3	velikonočna nedelja	17	4	2022	t
00430000-5666-96be-4dbe-b718df6405a4	velikonočna nedelja	9	4	2023	t
00430000-5666-96be-4d6c-32ed591066dc	velikonočna nedelja	31	3	2024	t
00430000-5666-96be-19aa-4484f0018deb	velikonočna nedelja	20	4	2025	t
00430000-5666-96be-8ea6-342bff161c43	velikonočna nedelja	5	4	2026	t
00430000-5666-96be-6bf1-ad9a15cfb029	velikonočna nedelja	28	3	2027	t
00430000-5666-96be-1a8f-710ed15ec4c2	velikonočna nedelja	16	4	2028	t
00430000-5666-96be-29d8-59337db53c6c	velikonočna nedelja	1	4	2029	t
00430000-5666-96be-02c8-d199ba8996ea	velikonočna nedelja	21	4	2030	t
00430000-5666-96be-ed6f-007ec05a473b	velikonočni ponedeljek	28	3	2016	t
00430000-5666-96be-1eea-b94701777a9f	velikonočni ponedeljek	17	4	2017	t
00430000-5666-96be-23a1-b32a3b794770	velikonočni ponedeljek	2	4	2018	t
00430000-5666-96be-e741-53308e31b901	velikonočni ponedeljek	22	4	2019	t
00430000-5666-96be-1380-8e347b786a8f	velikonočni ponedeljek	13	4	2020	t
00430000-5666-96be-bc2a-9aa9983cb28d	velikonočni ponedeljek	5	4	2021	t
00430000-5666-96be-194f-816cdd3c99ee	velikonočni ponedeljek	18	4	2022	t
00430000-5666-96be-4d49-4d9674907de9	velikonočni ponedeljek	10	4	2023	t
00430000-5666-96be-a2fc-844c64e5466e	velikonočni ponedeljek	1	4	2024	t
00430000-5666-96be-e38e-abd691d078a4	velikonočni ponedeljek	21	4	2025	t
00430000-5666-96be-4820-33be25376338	velikonočni ponedeljek	6	4	2026	t
00430000-5666-96be-5f85-96008ac75bbd	velikonočni ponedeljek	29	3	2027	t
00430000-5666-96be-e711-1600d3682704	velikonočni ponedeljek	17	4	2028	t
00430000-5666-96be-80ac-1967a8e45e2a	velikonočni ponedeljek	2	4	2029	t
00430000-5666-96be-6f0e-d460322dc252	velikonočni ponedeljek	22	4	2030	t
00430000-5666-96be-9abd-00eb17d9db76	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5666-96be-e1fb-ddcbd27edc82	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5666-96be-6087-71ca0a79b357	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5666-96be-1209-c16b3c570016	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5666-96be-8297-60f0741fa426	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5666-96be-9872-205e5de6c526	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5666-96be-9271-a8aa836f6abd	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5666-96be-a66e-6ee202b368d8	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5666-96be-a8db-99e7281bf197	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5666-96be-1875-c589fb2eb5dc	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5666-96be-8553-ef0703572caa	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5666-96be-b58b-54881f8859bf	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5666-96be-87cd-a15dbeebe138	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5666-96be-b662-a63ee9c66ec9	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5666-96be-5a13-30f8c215c5a5	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 31134276)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 31134288)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 31134436)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 31134863)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 31134873)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5666-96c0-2530-1c43bfb7ce0e	00080000-5666-96c0-d54b-b63c86c0b9aa	0987	AK
00190000-5666-96c0-393e-e9e81b94cb9c	00080000-5666-96c0-6824-3e85bd29d968	0989	AK
00190000-5666-96c0-141c-5b845d68b1b2	00080000-5666-96c0-769d-1d9fff189b77	0986	AK
00190000-5666-96c0-ac60-ed2ec0784ecb	00080000-5666-96c0-54d5-a91a0904838a	0984	AK
00190000-5666-96c0-9f2c-422ea4d5f12f	00080000-5666-96c0-7f64-58699a5ba8a1	0983	AK
00190000-5666-96c0-c38b-cb6c7e7796ea	00080000-5666-96c0-1b18-fac561fca10a	0982	AK
00190000-5666-96c2-6555-53c9099a100f	00080000-5666-96c2-6a2f-ccc77f30e288	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 31134772)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5666-96c0-0989-0cd29073a6dc	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 31134881)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 31134465)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5666-96c0-6449-d0ddc9fb4288	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5666-96c0-293a-7e34afbcdca4	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5666-96c0-99df-2a07412b547c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5666-96c0-c059-d87cbff8607f	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5666-96c0-c3e5-047de6a1a040	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5666-96c0-d8aa-0fb33adb560c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5666-96c0-c4c7-da2afe52a479	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 31134409)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 31134399)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 31134610)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 31134540)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 31134250)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 31134012)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5666-96c2-6a2f-ccc77f30e288	00010000-5666-96be-41e1-c44de0360fcc	2015-12-08 09:37:22	INS	a:0:{}
2	App\\Entity\\Option	00000000-5666-96c2-5e13-0c7cbb0dbf28	00010000-5666-96be-41e1-c44de0360fcc	2015-12-08 09:37:22	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5666-96c2-6555-53c9099a100f	00010000-5666-96be-41e1-c44de0360fcc	2015-12-08 09:37:22	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 31134478)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 31134050)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5666-96be-1211-6038d7312f32	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5666-96be-7f71-57ab7a75322e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5666-96be-9677-e3482630fcec	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5666-96be-03be-aaa5c7e73409	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5666-96be-3db4-6533eee41595	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5666-96be-4c0a-6918362d4750	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5666-96be-5139-269b798b07e1	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5666-96be-aa89-3087635268e7	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5666-96be-e4a0-e40e29c600d3	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-96be-9b80-b80b11a023c8	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-96be-8831-373c3d269f3f	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-96be-f2ad-619a833e5875	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-96be-dc3e-1e6c266b504e	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5666-96be-9c51-5a2961faec99	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5666-96be-fd77-df6eb0283563	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5666-96be-d842-604547945e12	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5666-96be-15a6-aa201673f433	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5666-96be-ee3f-263dbd387260	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5666-96be-5ccc-933e376de929	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5666-96be-5a58-79844c843a8a	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5666-96be-0211-e24253ef6d8c	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5666-96be-37d0-f16b3bacea58	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5666-96be-fedc-c86e88852b96	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5666-96be-7b2c-310974fc770a	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5666-96be-d070-563bdfe8e514	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5666-96be-f5ae-0208ea8272d9	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5666-96be-ebb1-89dcaa8b0a6f	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5666-96be-633e-fb2427a338fa	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5666-96be-0bfe-2c9f5185b065	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5666-96be-8cab-a1222193ca2d	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5666-96be-833c-36ba086a1572	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5666-96be-9814-7fbf0d5d6a69	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5666-96be-499d-7b125be62282	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5666-96be-308a-eac28954ed1e	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5666-96be-03f6-fcb14f604762	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5666-96be-0377-2d5f95ddc20c	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5666-96be-aadd-d0d7db693fa6	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5666-96be-36b3-dfb57faad8bb	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5666-96be-16ef-2239f70bb693	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5666-96be-990d-9ca6aafd16e2	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5666-96be-576d-53ce23b97b1a	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5666-96be-6625-e70a9af0d546	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5666-96be-d8cc-864d85a8c12e	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5666-96be-be30-1a6d5ccd414c	arhivar	arhivar	t
00020000-5666-96c0-a270-776daf9b5dd6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5666-96c0-0593-a283ca5401db	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-4fdc-6f1e254fe7f2	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-3e59-04c184d54e36	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-9319-e13e5515f624	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-4fc2-ba04513b4b17	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-a178-d607c2938c19	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-83ab-0961d4f183ed	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-161d-883c766fc317	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-8785-73aa8833c240	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-ca71-68286dbe7980	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-6792-28617a2cd31f	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-95a8-6abd22e63d72	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-ead7-75b4723c91cb	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-a7c8-b02b530a5717	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-08de-909daf3b3c64	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-c453-840d1439e741	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-2b80-fd2e7bb4eee4	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-bad4-375104128b67	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-0bde-cc93dc5e0b6c	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5666-96c0-3026-19551e06abc0	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-0874-a9c866225c87	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-4581-2238591cb20a	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-efcd-15bf09ef1218	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-d8ec-be2def2beb41	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-f53a-c6d5ddeaff6f	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-90fa-ed908e110fce	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-c3a2-238a120fe371	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5666-96c0-078b-5afbff933504	Zaposlitev-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 31134034)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5666-96be-b454-bd6da1c939d4	00020000-5666-96be-9677-e3482630fcec
00010000-5666-96be-41e1-c44de0360fcc	00020000-5666-96be-9677-e3482630fcec
00010000-5666-96c0-0187-a1ff1fd6eba4	00020000-5666-96c0-a270-776daf9b5dd6
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-0593-a283ca5401db
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-4fc2-ba04513b4b17
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-8785-73aa8833c240
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-6792-28617a2cd31f
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-ead7-75b4723c91cb
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-bad4-375104128b67
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-3e59-04c184d54e36
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-3026-19551e06abc0
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-efcd-15bf09ef1218
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-f53a-c6d5ddeaff6f
00010000-5666-96c0-3c3a-002c1a72f22a	00020000-5666-96c0-c3a2-238a120fe371
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-0593-a283ca5401db
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-4fdc-6f1e254fe7f2
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-3e59-04c184d54e36
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-9319-e13e5515f624
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-ead7-75b4723c91cb
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-c453-840d1439e741
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-3026-19551e06abc0
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-efcd-15bf09ef1218
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-f53a-c6d5ddeaff6f
00010000-5666-96c0-433a-8b6b21596259	00020000-5666-96c0-c3a2-238a120fe371
00010000-5666-96c0-e2d4-214ce423d377	00020000-5666-96c0-0593-a283ca5401db
00010000-5666-96c0-e2d4-214ce423d377	00020000-5666-96c0-4fdc-6f1e254fe7f2
00010000-5666-96c0-e2d4-214ce423d377	00020000-5666-96c0-3e59-04c184d54e36
00010000-5666-96c0-e2d4-214ce423d377	00020000-5666-96c0-9319-e13e5515f624
00010000-5666-96c0-e2d4-214ce423d377	00020000-5666-96c0-6792-28617a2cd31f
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-4fdc-6f1e254fe7f2
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-a178-d607c2938c19
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-ca71-68286dbe7980
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-95a8-6abd22e63d72
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-6792-28617a2cd31f
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-2b80-fd2e7bb4eee4
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-ead7-75b4723c91cb
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-a7c8-b02b530a5717
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-3026-19551e06abc0
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-0874-a9c866225c87
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-efcd-15bf09ef1218
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-d8ec-be2def2beb41
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-f53a-c6d5ddeaff6f
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-90fa-ed908e110fce
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-c3a2-238a120fe371
00010000-5666-96c0-223f-37fb522583a1	00020000-5666-96c0-078b-5afbff933504
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-4fdc-6f1e254fe7f2
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-a178-d607c2938c19
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-161d-883c766fc317
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-ca71-68286dbe7980
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-95a8-6abd22e63d72
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-6792-28617a2cd31f
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-2b80-fd2e7bb4eee4
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-ead7-75b4723c91cb
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-a7c8-b02b530a5717
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-08de-909daf3b3c64
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-3026-19551e06abc0
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-0874-a9c866225c87
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-4581-2238591cb20a
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-efcd-15bf09ef1218
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-d8ec-be2def2beb41
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-f53a-c6d5ddeaff6f
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-90fa-ed908e110fce
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-c3a2-238a120fe371
00010000-5666-96c0-b224-dbb74b3cbced	00020000-5666-96c0-078b-5afbff933504
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-4fdc-6f1e254fe7f2
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-3e59-04c184d54e36
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-a178-d607c2938c19
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-83ab-0961d4f183ed
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-161d-883c766fc317
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-4fc2-ba04513b4b17
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-ca71-68286dbe7980
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-95a8-6abd22e63d72
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-6792-28617a2cd31f
00010000-5666-96c0-c98f-ecf6e18272ca	00020000-5666-96c0-2b80-fd2e7bb4eee4
00010000-5666-96c0-fd96-6707e617c508	00020000-5666-96c0-0593-a283ca5401db
00010000-5666-96c0-fd96-6707e617c508	00020000-5666-96c0-9319-e13e5515f624
00010000-5666-96c0-fd96-6707e617c508	00020000-5666-96c0-4fc2-ba04513b4b17
00010000-5666-96c0-fd96-6707e617c508	00020000-5666-96c0-8785-73aa8833c240
00010000-5666-96c0-fd96-6707e617c508	00020000-5666-96c0-6792-28617a2cd31f
00010000-5666-96c0-fd96-6707e617c508	00020000-5666-96c0-ead7-75b4723c91cb
00010000-5666-96c0-fd96-6707e617c508	00020000-5666-96c0-bad4-375104128b67
00010000-5666-96c0-8620-f4b3e48c2d25	00020000-5666-96c0-0bde-cc93dc5e0b6c
\.


--
-- TOC entry 3146 (class 0 OID 31134492)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 31134430)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 31134376)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5666-96c0-8745-9a0b2669b09e	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5666-96c0-13db-d5463654b0de	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5666-96c0-c1e5-9e72865c8084	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 31133999)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5666-96be-abdc-1f2b0ed34c12	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5666-96be-f82c-1ef2a0550849	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5666-96be-0ce4-f78d061137f9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5666-96be-45a2-736ff2f0e438	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5666-96be-a0d6-1953ac708fe2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 31133991)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5666-96be-b9cb-dfc6b7484b8b	00230000-5666-96be-45a2-736ff2f0e438	popa
00240000-5666-96be-c752-27ad226b4ee3	00230000-5666-96be-45a2-736ff2f0e438	oseba
00240000-5666-96be-1a5b-ec3c5d113f45	00230000-5666-96be-45a2-736ff2f0e438	tippopa
00240000-5666-96be-1cde-252a2164f05e	00230000-5666-96be-45a2-736ff2f0e438	organizacijskaenota
00240000-5666-96be-9dcc-93be0d9d30df	00230000-5666-96be-45a2-736ff2f0e438	sezona
00240000-5666-96be-cc8e-9564397bed26	00230000-5666-96be-45a2-736ff2f0e438	tipvaje
00240000-5666-96be-500d-ac58342cc245	00230000-5666-96be-f82c-1ef2a0550849	prostor
00240000-5666-96be-c36c-4299207f1cd1	00230000-5666-96be-45a2-736ff2f0e438	besedilo
00240000-5666-96be-aadd-5a9c9dc57019	00230000-5666-96be-45a2-736ff2f0e438	uprizoritev
00240000-5666-96be-0804-28b8bf88866f	00230000-5666-96be-45a2-736ff2f0e438	funkcija
00240000-5666-96be-21ce-940348191199	00230000-5666-96be-45a2-736ff2f0e438	tipfunkcije
00240000-5666-96be-078a-4ab390bb81e2	00230000-5666-96be-45a2-736ff2f0e438	alternacija
00240000-5666-96be-948f-944bf81df810	00230000-5666-96be-abdc-1f2b0ed34c12	pogodba
00240000-5666-96be-5e90-b4c0a9f505f5	00230000-5666-96be-45a2-736ff2f0e438	zaposlitev
00240000-5666-96be-e777-ee918d9e17d1	00230000-5666-96be-45a2-736ff2f0e438	zvrstuprizoritve
00240000-5666-96be-943b-d39096d84f97	00230000-5666-96be-abdc-1f2b0ed34c12	programdela
00240000-5666-96be-7be9-6d467ed19aa3	00230000-5666-96be-45a2-736ff2f0e438	zapis
\.


--
-- TOC entry 3095 (class 0 OID 31133986)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7ce9e2f3-9d29-4271-8b50-2078fb7703ba	00240000-5666-96be-b9cb-dfc6b7484b8b	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 31134557)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5666-96c0-04ad-4b8fd85c2de2	000e0000-5666-96c0-2815-53134f3025b7	00080000-5666-96c0-2b5d-9189283d15de	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5666-96be-3e2e-5b2b373b9408
00270000-5666-96c0-5244-7a75f3eabc29	000e0000-5666-96c0-2815-53134f3025b7	00080000-5666-96c0-2b5d-9189283d15de	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5666-96be-3e2e-5b2b373b9408
\.


--
-- TOC entry 3111 (class 0 OID 31134134)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 31134386)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5666-96c0-d86e-bbc581b7b70b	00180000-5666-96c0-0ada-86ee9551e01e	000c0000-5666-96c0-667f-6e8a71a2d6e2	00090000-5666-96c0-9701-03ca470104f7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-96c0-9e0b-560fe2f1953d	00180000-5666-96c0-0ada-86ee9551e01e	000c0000-5666-96c0-e24a-293869582fe0	00090000-5666-96c0-eb81-940c755a89d7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-96c0-44fd-a760f8220b52	00180000-5666-96c0-0ada-86ee9551e01e	000c0000-5666-96c0-00cd-d441d6e7fc98	00090000-5666-96c0-57d4-78992930c664	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-96c0-89be-1b6fee5f09bb	00180000-5666-96c0-0ada-86ee9551e01e	000c0000-5666-96c0-75ca-201a8fc38a98	00090000-5666-96c0-f4b7-ac1aae9386eb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-96c0-3ffd-006c222a7b8d	00180000-5666-96c0-0ada-86ee9551e01e	000c0000-5666-96c0-f51c-dbc32cd7a87a	00090000-5666-96c0-ea8e-6e2f51408682	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-96c0-255e-1bbb308f7377	00180000-5666-96c0-6e22-0117a6606a95	\N	00090000-5666-96c0-ea8e-6e2f51408682	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5666-96c0-da03-a8be939e1b85	00180000-5666-96c0-6e22-0117a6606a95	\N	00090000-5666-96c0-eb81-940c755a89d7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 31134598)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5666-96bd-f32e-1aabb35e9711	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5666-96bd-72f5-ceb38c5f0c09	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5666-96bd-a77d-c87fe17aaf58	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5666-96bd-9a43-dbbb350b3ccd	04	Režija	Režija	Režija	umetnik	30
000f0000-5666-96bd-dbec-58401430bbaa	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5666-96bd-87f9-f79574466695	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5666-96bd-d8f1-c748c8ea1f27	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5666-96bd-d5cb-5a50dff97ffc	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5666-96bd-3baa-2dc8b57a0a48	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5666-96bd-2f03-c29352a08e91	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5666-96bd-ebba-6302dcd4b6bd	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5666-96bd-a587-e75298388c43	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5666-96bd-0924-d1bd2e0f8f02	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5666-96bd-eea6-59b3ba028fbb	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5666-96bd-d98b-89725e891be9	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5666-96bd-6c69-6d36815fdf32	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5666-96bd-f353-842ec763b379	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5666-96bd-27a9-6dcd0311196d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 31134085)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5666-96c0-eb1d-7ee26f2a7e8b	0001	šola	osnovna ali srednja šola
00400000-5666-96c0-d3a7-222a7e65a4d0	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5666-96c0-9c44-d0ab4a6dbdff	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 31134893)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5666-96bd-4940-60eba214ee84	01	Velika predstava	f	1.00	1.00
002b0000-5666-96bd-22e6-21002b80345b	02	Mala predstava	f	0.50	0.50
002b0000-5666-96bd-55eb-35b316777939	03	Mala koprodukcija	t	0.40	1.00
002b0000-5666-96bd-d3c5-1d497936b437	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5666-96bd-7821-1a13a3c07483	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 31134366)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5666-96bd-dd44-fbea949b1ca5	0001	prva vaja	prva vaja
00420000-5666-96bd-02a1-e29d6dffb28a	0002	tehnična vaja	tehnična vaja
00420000-5666-96bd-0154-10b8a423f557	0003	lučna vaja	lučna vaja
00420000-5666-96bd-c46c-cf3e6540fb4a	0004	kostumska vaja	kostumska vaja
00420000-5666-96bd-f431-7f372349bb66	0005	foto vaja	foto vaja
00420000-5666-96bd-d1af-32e129cb920a	0006	1. glavna vaja	1. glavna vaja
00420000-5666-96bd-937f-f51ddf23a480	0007	2. glavna vaja	2. glavna vaja
00420000-5666-96bd-d2b3-af62524a1aed	0008	1. generalka	1. generalka
00420000-5666-96bd-5aa4-977ed5317cab	0009	2. generalka	2. generalka
00420000-5666-96bd-3252-554dee139755	0010	odprta generalka	odprta generalka
00420000-5666-96bd-7edd-cfba08d4d4d2	0011	obnovitvena vaja	obnovitvena vaja
00420000-5666-96bd-83c9-fe771d9da789	0012	pevska vaja	pevska vaja
00420000-5666-96bd-28bc-580ad16ad39d	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5666-96bd-414e-1b4115080c62	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 31134207)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 31134021)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5666-96be-41e1-c44de0360fcc	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO80LMsYDA7ZDG2VrTGG3pBcExOHQah6a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5666-96c0-a7e9-e7a783a66c12	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5666-96c0-9478-66dbc451541e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5666-96c0-c38b-12abfea80138	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5666-96c0-411b-19e7221a2a68	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5666-96c0-6506-4b7267389405	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5666-96c0-2759-c283c5178ab9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5666-96c0-ff81-60980663f075	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5666-96c0-8709-532f380173c0	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5666-96c0-5431-828eb1e5345c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5666-96c0-0187-a1ff1fd6eba4	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5666-96c0-56d9-5999928ef4cb	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5666-96c0-3c3a-002c1a72f22a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5666-96c0-433a-8b6b21596259	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5666-96c0-e2d4-214ce423d377	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5666-96c0-223f-37fb522583a1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5666-96c0-b224-dbb74b3cbced	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5666-96c0-c98f-ecf6e18272ca	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5666-96c0-fd96-6707e617c508	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5666-96c0-8620-f4b3e48c2d25	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5666-96be-b454-bd6da1c939d4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 31134648)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5666-96c0-97a6-bcaef5e50a72	00160000-5666-96c0-0016-70f55ff889c2	\N	00140000-5666-96be-ce0e-a4eef3851bce	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5666-96c0-c3e5-047de6a1a040
000e0000-5666-96c0-2815-53134f3025b7	00160000-5666-96c0-0a30-468f41808797	\N	00140000-5666-96be-85d9-737e16b9c416	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5666-96c0-d8aa-0fb33adb560c
000e0000-5666-96c0-1b04-d8d0c1c8a80d	\N	\N	00140000-5666-96be-85d9-737e16b9c416	00190000-5666-96c0-2530-1c43bfb7ce0e	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5666-96c0-c3e5-047de6a1a040
000e0000-5666-96c0-3cab-4473c1f4e7b7	\N	\N	00140000-5666-96be-85d9-737e16b9c416	00190000-5666-96c0-2530-1c43bfb7ce0e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5666-96c0-c3e5-047de6a1a040
000e0000-5666-96c0-cd16-836d51438821	\N	\N	00140000-5666-96be-85d9-737e16b9c416	00190000-5666-96c0-2530-1c43bfb7ce0e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5666-96c0-6449-d0ddc9fb4288
000e0000-5666-96c0-776d-fd9d61db3042	\N	\N	00140000-5666-96be-85d9-737e16b9c416	00190000-5666-96c0-2530-1c43bfb7ce0e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5666-96c0-6449-d0ddc9fb4288
\.


--
-- TOC entry 3125 (class 0 OID 31134306)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5666-96c0-9e49-a75578108e33	\N	000e0000-5666-96c0-2815-53134f3025b7	1	
00200000-5666-96c0-b33f-67f8af846cab	\N	000e0000-5666-96c0-2815-53134f3025b7	2	
00200000-5666-96c0-92c7-7c6e5ff0e445	\N	000e0000-5666-96c0-2815-53134f3025b7	3	
00200000-5666-96c0-2e70-5173bf441206	\N	000e0000-5666-96c0-2815-53134f3025b7	4	
00200000-5666-96c0-ae5a-ce61bd71e167	\N	000e0000-5666-96c0-2815-53134f3025b7	5	
\.


--
-- TOC entry 3142 (class 0 OID 31134457)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 31134571)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5666-96be-d7a6-b8f496bbe8d5	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5666-96be-5034-c6a363632995	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5666-96be-3cfa-30d5564d4bdc	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5666-96be-0890-014b78b339b1	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5666-96be-305b-e540bb52eb67	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5666-96be-8957-eaef78d5a19c	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5666-96be-ced9-8a0f29c5da7c	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5666-96be-6558-a791398a0d30	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5666-96be-3e2e-5b2b373b9408	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5666-96be-0d82-e3af8c629117	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5666-96be-3367-0b667fe42871	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5666-96be-0748-37728d7ba43a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5666-96be-02ba-317fb811d2f6	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5666-96be-289f-62d86203f01c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5666-96be-ca8a-4b7e36bd8f4b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5666-96be-61ac-07c3f7cee2aa	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5666-96be-43f2-93b787315a97	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5666-96be-ab0a-aae440478855	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5666-96be-7c7a-93a4ac3895b0	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5666-96be-e7e4-192bd8a1396d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5666-96be-40c2-440fc75c2f46	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5666-96be-89c9-df07d5214bc1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5666-96be-2294-33d5061ff360	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5666-96be-1816-2608d913200f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5666-96be-28b1-40f353c55cdd	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5666-96be-0b9c-c71f23bf73fc	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5666-96be-4fd7-c245b8544f85	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5666-96be-fd5d-5a7137edfd1a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 31134943)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 31134912)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 31134955)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 31134529)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5666-96c0-13a4-b8d612453f1e	00090000-5666-96c0-eb81-940c755a89d7	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-96c0-f90c-145dde7338fb	00090000-5666-96c0-57d4-78992930c664	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-96c0-f7bf-f0c931e18308	00090000-5666-96c0-2ff7-1c0c66be7940	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-96c0-fc28-eeb053c1c4db	00090000-5666-96c0-1a4b-8905db25e932	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-96c0-923a-2131379664be	00090000-5666-96c0-1bf2-5c8c347b4664	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-96c0-e4e0-95158184e69d	00090000-5666-96c0-266f-5cf6f58fee36	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 31134350)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 31134638)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5666-96be-ce0e-a4eef3851bce	01	Drama	drama (SURS 01)
00140000-5666-96be-6694-1b6ea7941c8d	02	Opera	opera (SURS 02)
00140000-5666-96be-2da9-7300e3627e54	03	Balet	balet (SURS 03)
00140000-5666-96be-e376-98ae938045d8	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5666-96be-8bfe-006ec5f6655d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5666-96be-85d9-737e16b9c416	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5666-96be-8c5e-f1cdef9f4e2d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 31134519)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 31134084)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 31134697)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 31134687)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 31134075)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 31134554)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 31134596)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 31134996)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 31134338)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 31134360)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 31134365)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 31134910)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 31134233)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 31134766)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 31134515)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 31134304)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 31134271)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 31134247)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 31134422)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 31134973)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 31134980)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 31135004)
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
-- TOC entry 2728 (class 2606 OID 31134449)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 31134205)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 31134103)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 31134167)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 31134130)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 31134064)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 31134049)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 31134455)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 31134491)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 31134633)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 31134158)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 31134193)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 31134861)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 31134428)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 31134183)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 31134323)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 31134292)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 31134284)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 31134440)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 31134870)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 31134878)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 31134848)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 31134891)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 31134473)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 31134413)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 31134404)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 31134620)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 31134547)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 31134259)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 31134020)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 31134482)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 31134038)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 31134058)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 31134500)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 31134435)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 31134384)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 31134008)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 31133996)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 31133990)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 31134567)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 31134139)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 31134395)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 31134607)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 31134092)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 31134903)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 31134373)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 31134218)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 31134033)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 31134666)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 31134313)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 31134463)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 31134579)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 31134953)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 31134937)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 31134961)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 31134537)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 31134354)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 31134646)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 31134527)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 31134348)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 31134349)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 31134347)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 31134346)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 31134345)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 31134568)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 31134569)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 31134570)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 31134975)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 31134974)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 31134160)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 31134161)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 31134456)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 31134941)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 31134940)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 31134942)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 31134939)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 31134938)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 31134442)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 31134441)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 31134314)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 31134315)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 31134516)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 31134518)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 31134517)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 31134249)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 31134248)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 31134892)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 31134635)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 31134636)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 31134637)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 31134962)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 31134671)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 31134668)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 31134672)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 31134670)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 31134669)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 31134220)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 31134219)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 31134133)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 31134483)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 31134065)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 31134066)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 31134503)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 31134502)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 31134501)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 31134170)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 31134169)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 31134171)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 31134287)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 31134285)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 31134286)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 31133998)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 31134408)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 31134406)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 31134405)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 31134407)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 31134039)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 31134040)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 31134464)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 31134997)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 31134556)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 31134555)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 31135005)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 31135006)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 31134429)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 31134548)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 31134549)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 31134771)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 31134770)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 31134767)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 31134768)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 31134769)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 31134185)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 31134184)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 31134186)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 31134477)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 31134476)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 31134871)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 31134872)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 31134701)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 31134702)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 31134699)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 31134700)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 31134538)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 31134539)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 31134417)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 31134416)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 31134414)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 31134415)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 31134689)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 31134688)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 31134260)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 31134274)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 31134273)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 31134272)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 31134275)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 31134305)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 31134293)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 31134294)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 31134862)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 31134911)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 31134981)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 31134982)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 31134105)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 31134104)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 31134140)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 31134141)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 31134355)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 31134398)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 31134397)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 31134396)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 31134340)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 31134341)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 31134344)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 31134339)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 31134343)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 31134342)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 31134159)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 31134093)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 31134094)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 31134234)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 31134236)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 31134235)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 31134237)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 31134423)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 31134634)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 31134667)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 31134608)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 31134609)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 31134131)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 31134132)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 31134528)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 31134009)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 31134206)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 31134168)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 31133997)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 31134904)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 31134475)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 31134474)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 31134374)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 31134375)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 31134698)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 31134194)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 31134647)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 31134954)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 31134879)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 31134880)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 31134597)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 31134385)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 31134059)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 31135177)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 31135182)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 31135207)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 31135197)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 31135172)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 31135192)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 31135202)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 31135187)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 31135377)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 31135382)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 31135387)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 31135552)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 31135547)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 31135062)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 31135067)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 31135292)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 31135532)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 31135527)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 31135537)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 31135522)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 31135517)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 31135287)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 31135282)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 31135162)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 31135167)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 31135332)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 31135342)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 31135337)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 31135117)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 31135112)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 31135272)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 31135507)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 31135392)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 31135397)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 31135402)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 31135542)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 31135422)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 31135407)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 31135427)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 31135417)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 31135412)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 31135107)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 31135102)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 31135047)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 31135042)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 31135312)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 31135022)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 31135027)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 31135327)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 31135322)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 31135317)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 31135077)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 31135072)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 31135082)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 31135142)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 31135132)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 31135137)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 31135007)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 31135247)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 31135237)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 31135232)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 31135242)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 31135012)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 31135017)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 31135297)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 31135567)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 31135372)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 31135367)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 31135572)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 31135577)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 31135277)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 31135357)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 31135362)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 31135482)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 31135477)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 31135462)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 31135467)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 31135472)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 31135092)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 31135087)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 31135097)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 31135307)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 31135302)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 31135492)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 31135497)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 31135452)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 31135457)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 31135442)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 31135447)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 31135347)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 31135352)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 31135267)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 31135262)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 31135252)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 31135257)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 31135437)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 31135432)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 31135122)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 31135127)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 31135157)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 31135147)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 31135152)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 31135487)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 31135502)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 31135512)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 31135557)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 31135562)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 31135037)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 31135032)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 31135052)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 31135057)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 31135212)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 31135227)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 31135222)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 31135217)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-08 09:37:24 CET

--
-- PostgreSQL database dump complete
--

