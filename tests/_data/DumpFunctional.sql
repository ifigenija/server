--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-13 16:43:14 CET

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
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 26862226)
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
-- TOC entry 237 (class 1259 OID 26862840)
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
-- TOC entry 236 (class 1259 OID 26862823)
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
-- TOC entry 182 (class 1259 OID 26862219)
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
-- TOC entry 181 (class 1259 OID 26862217)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 26862700)
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
-- TOC entry 230 (class 1259 OID 26862730)
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
-- TOC entry 251 (class 1259 OID 26863131)
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
-- TOC entry 203 (class 1259 OID 26862474)
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
-- TOC entry 205 (class 1259 OID 26862506)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 26862511)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 26863053)
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
-- TOC entry 194 (class 1259 OID 26862371)
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
-- TOC entry 238 (class 1259 OID 26862853)
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
-- TOC entry 223 (class 1259 OID 26862654)
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
-- TOC entry 200 (class 1259 OID 26862445)
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
-- TOC entry 197 (class 1259 OID 26862411)
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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 26862388)
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
-- TOC entry 212 (class 1259 OID 26862568)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 26863111)
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
-- TOC entry 250 (class 1259 OID 26863124)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 26863146)
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
-- TOC entry 216 (class 1259 OID 26862593)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 26862345)
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
-- TOC entry 185 (class 1259 OID 26862245)
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
-- TOC entry 189 (class 1259 OID 26862312)
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
-- TOC entry 186 (class 1259 OID 26862256)
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
-- TOC entry 178 (class 1259 OID 26862191)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 26862210)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 26862600)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 26862634)
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
-- TOC entry 233 (class 1259 OID 26862771)
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
-- TOC entry 188 (class 1259 OID 26862292)
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
-- TOC entry 191 (class 1259 OID 26862337)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 26862998)
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
-- TOC entry 213 (class 1259 OID 26862574)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 26862322)
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
-- TOC entry 202 (class 1259 OID 26862466)
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
-- TOC entry 198 (class 1259 OID 26862426)
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
-- TOC entry 199 (class 1259 OID 26862438)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 26862586)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 26863012)
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
-- TOC entry 242 (class 1259 OID 26863022)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 26862921)
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
-- TOC entry 243 (class 1259 OID 26863030)
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
    programrazno_id uuid
);


--
-- TOC entry 219 (class 1259 OID 26862615)
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
-- TOC entry 211 (class 1259 OID 26862559)
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
-- TOC entry 210 (class 1259 OID 26862549)
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
-- TOC entry 232 (class 1259 OID 26862760)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 26862690)
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
-- TOC entry 196 (class 1259 OID 26862400)
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
-- TOC entry 175 (class 1259 OID 26862162)
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
-- TOC entry 174 (class 1259 OID 26862160)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 26862628)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 26862200)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 26862184)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 26862642)
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
-- TOC entry 214 (class 1259 OID 26862580)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 26862526)
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
-- TOC entry 173 (class 1259 OID 26862149)
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
-- TOC entry 172 (class 1259 OID 26862141)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 26862136)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 26862707)
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
-- TOC entry 187 (class 1259 OID 26862284)
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
-- TOC entry 209 (class 1259 OID 26862536)
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
-- TOC entry 231 (class 1259 OID 26862748)
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
-- TOC entry 184 (class 1259 OID 26862235)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 26863041)
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
-- TOC entry 207 (class 1259 OID 26862516)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 26862357)
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
-- TOC entry 176 (class 1259 OID 26862171)
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
-- TOC entry 235 (class 1259 OID 26862798)
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
-- TOC entry 201 (class 1259 OID 26862456)
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
-- TOC entry 218 (class 1259 OID 26862607)
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
-- TOC entry 229 (class 1259 OID 26862721)
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
-- TOC entry 247 (class 1259 OID 26863091)
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
-- TOC entry 246 (class 1259 OID 26863060)
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
-- TOC entry 248 (class 1259 OID 26863103)
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
-- TOC entry 225 (class 1259 OID 26862679)
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
-- TOC entry 204 (class 1259 OID 26862500)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 26862788)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 26862669)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 26862222)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 26862165)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 26862226)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5646-050e-fc3a-e37a8de43bd2	10	30	Otroci	Abonma za otroke	200
000a0000-5646-050e-d379-bd598375b489	20	60	Mladina	Abonma za mladino	400
000a0000-5646-050e-1d80-fb0056467859	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 26862840)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5646-050f-a0ca-ce931960177f	000d0000-5646-050f-1d26-eb59e6ff320b	\N	00090000-5646-050f-a082-69cf68e7671c	000b0000-5646-050f-cfa7-0464812122d8	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5646-050f-915f-39aeed7f35a9	000d0000-5646-050f-2bbe-71b98e7a2c16	00100000-5646-050f-4452-e006c7d0d02c	00090000-5646-050f-934a-5a828c89d725	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5646-050f-8665-49e114e3ad97	000d0000-5646-050f-9d10-2491ebd7bdb9	00100000-5646-050f-6b61-22a78acf409b	00090000-5646-050f-1b5e-3ecd646912d3	\N	0003	t	\N	2015-11-13	\N	2	t	\N	f	f
000c0000-5646-050f-5353-6d87e251a406	000d0000-5646-050f-5420-40f4084a54b3	\N	00090000-5646-050f-7249-f812cc432789	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5646-050f-d3ea-f30f0441f926	000d0000-5646-050f-0ed1-bca822b75860	\N	00090000-5646-050f-91f3-7123332605b4	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5646-050f-527b-445f8d90f296	000d0000-5646-050f-3454-88e6286a788a	\N	00090000-5646-050f-d638-99bc9f7b6c48	000b0000-5646-050f-347a-b99e8f977a6a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5646-050f-dc2b-f2d403da3712	000d0000-5646-050f-633e-ec0a8f2b36c8	00100000-5646-050f-1cb2-6fef54c65dd4	00090000-5646-050f-cdf3-0b3820c94d8a	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5646-050f-ace2-f06787a80110	000d0000-5646-050f-47e2-cec2cad2c628	\N	00090000-5646-050f-203c-a28692bbf5fc	000b0000-5646-050f-bb58-b65398419447	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5646-050f-a85d-68f79c127618	000d0000-5646-050f-633e-ec0a8f2b36c8	00100000-5646-050f-42b4-3bcd2d8117fc	00090000-5646-050f-c7d5-5f3ebdab0169	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5646-050f-f5ac-208fd4c8f401	000d0000-5646-050f-633e-ec0a8f2b36c8	00100000-5646-050f-8608-b939b39a6c05	00090000-5646-050f-d9f6-10c0753b7803	\N	0010	t	\N	2015-11-13	\N	16	f	\N	f	t
000c0000-5646-050f-5d48-5cbabbb57f65	000d0000-5646-050f-633e-ec0a8f2b36c8	00100000-5646-050f-6252-3064d906320e	00090000-5646-050f-98f2-6b9514946654	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5646-050f-8684-bbd99154255e	000d0000-5646-050f-e3fd-bf1a9542f6e1	00100000-5646-050f-4452-e006c7d0d02c	00090000-5646-050f-934a-5a828c89d725	000b0000-5646-050f-1476-0bf3b4ba3783	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 26862823)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 26862219)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 26862700)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5646-050f-3a5b-89472975b334	00160000-5646-050e-35f0-feac47d360c8	00090000-5646-050f-231a-fc5fd3d6e94a	aizv	10	t
003d0000-5646-050f-862a-be2da98b7b19	00160000-5646-050e-35f0-feac47d360c8	00090000-5646-050f-4024-e015d5981c81	apri	14	t
003d0000-5646-050f-2e4d-4c1b705462de	00160000-5646-050e-5bd9-b5bad1d838da	00090000-5646-050f-7b85-a6440b86b7cf	aizv	11	t
003d0000-5646-050f-bcaf-82302759d6d9	00160000-5646-050e-b444-c8f4e6b682d2	00090000-5646-050f-2473-a64ad5e101db	aizv	12	t
003d0000-5646-050f-299a-ad98f3a23164	00160000-5646-050e-35f0-feac47d360c8	00090000-5646-050f-8aba-f3d8f5a11d26	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 26862730)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5646-050e-35f0-feac47d360c8	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5646-050e-5bd9-b5bad1d838da	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5646-050e-b444-c8f4e6b682d2	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 26863131)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 26862474)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5646-050f-bbe3-9b14eff53f11	\N	\N	00200000-5646-050f-4e88-b65acb537419	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5646-050f-2d72-89374ccbf50e	\N	\N	00200000-5646-050f-45d4-be24e3900fa2	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5646-050f-f5b8-d9d09a87d124	\N	\N	00200000-5646-050f-2971-4f833d8b1443	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5646-050f-e2ca-b1404686e855	\N	\N	00200000-5646-050f-887a-a6a56c032591	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5646-050f-c5f6-c1f7524ba5a9	\N	\N	00200000-5646-050f-79e7-018d6ff4e926	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 26862506)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 26862511)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 26863053)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 26862371)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5646-050c-2f77-78e4fc747e0a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5646-050c-83bf-d29f4d67546e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5646-050c-30c0-0de11ced76c6	AL	ALB	008	Albania 	Albanija	\N
00040000-5646-050c-53ef-ff58f8872fc4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5646-050c-663e-d2c70cbdee7e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5646-050c-f7df-2da1fcfc3c0a	AD	AND	020	Andorra 	Andora	\N
00040000-5646-050c-f29b-164ba9e59ce4	AO	AGO	024	Angola 	Angola	\N
00040000-5646-050c-c73d-46d8829d35e7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5646-050c-31ab-6be57605e384	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5646-050c-a83f-83810e0e2239	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5646-050c-fcc8-d7d4c26ce9ae	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5646-050c-37b0-c4523fa7794b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5646-050c-f8f3-32c2b06ad3fb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5646-050c-4af3-04a110fe6952	AU	AUS	036	Australia 	Avstralija	\N
00040000-5646-050c-bc12-43d52bd7df55	AT	AUT	040	Austria 	Avstrija	\N
00040000-5646-050c-e9f6-e88ad790e342	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5646-050c-6079-3914c494ae61	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5646-050c-0c7f-b409844ba35e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5646-050c-3bf5-734507b4fdc0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5646-050c-320f-e2620a702e2d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5646-050c-2bda-7800ccce43bc	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5646-050c-b29e-1b3554238bcf	BE	BEL	056	Belgium 	Belgija	\N
00040000-5646-050c-5d13-882ba38dc080	BZ	BLZ	084	Belize 	Belize	\N
00040000-5646-050c-5bf7-2b14f406fc0e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5646-050c-d464-adbc4f47375c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5646-050c-02d3-019507b00a59	BT	BTN	064	Bhutan 	Butan	\N
00040000-5646-050c-18c5-df9b4c333377	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5646-050c-b653-95b6f1e34fd9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5646-050c-f6cb-d70cd35d187c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5646-050c-365f-7460abca1b14	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5646-050c-8e28-e6f442d77786	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5646-050c-54f8-18288a5ba0f3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5646-050c-eb03-1a2caad6b7ea	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5646-050c-312f-533848ad6698	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5646-050c-98c7-8800280173c2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5646-050c-df70-87dc78f81b4f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5646-050c-2b7a-36a3b00c8dbc	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5646-050c-db17-41a7a6309422	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5646-050c-f4b5-2c4dbef83157	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5646-050c-aa99-d2810e0c101c	CA	CAN	124	Canada 	Kanada	\N
00040000-5646-050c-173a-75e874c5f92d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5646-050c-e1fd-4697481c7d75	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5646-050c-320e-90409c11cf76	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5646-050c-3564-6de6fedaf8fe	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5646-050c-e126-c755c1f71961	CL	CHL	152	Chile 	Čile	\N
00040000-5646-050c-184b-d1f1170559cc	CN	CHN	156	China 	Kitajska	\N
00040000-5646-050c-cda7-bd8adfa02c44	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5646-050c-0858-16faf030a15f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5646-050c-a5e9-e184fa7aa552	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5646-050c-39c4-4ffefcf34b73	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5646-050c-1202-7055ea140251	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5646-050c-c345-9cc96304b245	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5646-050c-936a-6a52218c1c18	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5646-050c-628d-5dfb26d25629	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5646-050c-d9d1-6771b97bba23	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5646-050c-9da3-246a35e49c39	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5646-050c-3cc3-2331fb58c895	CU	CUB	192	Cuba 	Kuba	\N
00040000-5646-050c-226a-718770020ff1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5646-050c-99ee-1cb21b6fe173	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5646-050c-33cf-d2c6f3fa14b3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5646-050c-7d20-10d59777c390	DK	DNK	208	Denmark 	Danska	\N
00040000-5646-050c-e9bb-d8939e5a3e59	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5646-050c-c9d8-c475b3eec350	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5646-050c-b3ec-cd0bf4b9d562	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5646-050c-bba9-7fe516311ddf	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5646-050c-9060-f049c48d72b8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5646-050c-54c7-f9c028c6415c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5646-050c-3fd2-ef92afa03170	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5646-050c-0bd1-2a6c3b865720	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5646-050c-e68e-a2046dbb70a7	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5646-050c-b1c9-06477c2e638b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5646-050c-89b0-ccb7d5dce8f2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5646-050c-e490-ec5f6ee4f6bd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5646-050c-699b-b18b8c4d3dd4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5646-050c-7c4f-27fd0a28145c	FI	FIN	246	Finland 	Finska	\N
00040000-5646-050c-98e1-0d376466e2ef	FR	FRA	250	France 	Francija	\N
00040000-5646-050c-0e65-d0f0a496720c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5646-050c-74fa-bdab4a0c710c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5646-050c-4761-2027beac1d41	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5646-050c-5b71-2cd604e9afa7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5646-050c-af00-a815d15e4617	GA	GAB	266	Gabon 	Gabon	\N
00040000-5646-050c-f194-1b56d3a597dc	GM	GMB	270	Gambia 	Gambija	\N
00040000-5646-050c-4114-0d4dc1cea509	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5646-050c-7352-37ad79dfc6ff	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5646-050c-5d93-177dc31bbc19	GH	GHA	288	Ghana 	Gana	\N
00040000-5646-050c-98b9-469a8511d8d3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5646-050c-8efa-404efcfc9904	GR	GRC	300	Greece 	Grčija	\N
00040000-5646-050c-5608-30605a15790b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5646-050c-cb32-19134204973f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5646-050c-601b-bff11a57c77d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5646-050c-288e-3c06b0751c48	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5646-050c-8df1-dececccef572	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5646-050c-d17f-31df5237dfdd	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5646-050c-0640-c3e8eb99b920	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5646-050c-a4e9-fe293d2cfa45	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5646-050c-4e1e-a98dc4927913	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5646-050c-5258-798541608d05	HT	HTI	332	Haiti 	Haiti	\N
00040000-5646-050c-3f9b-f9110a575d54	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5646-050c-f9df-1ce1ed761b2b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5646-050c-c449-a95d7bfeb904	HN	HND	340	Honduras 	Honduras	\N
00040000-5646-050c-f7c9-38922a42c9d6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5646-050c-d1f7-57c7e7eb5b71	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5646-050c-b7f0-cf7d321ef4a7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5646-050c-9597-71f82dd5abd7	IN	IND	356	India 	Indija	\N
00040000-5646-050c-e33c-05840d8beb54	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5646-050c-ee57-206eb93b4646	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5646-050c-1b64-f309d9abf018	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5646-050c-4e5d-44571afa2c6c	IE	IRL	372	Ireland 	Irska	\N
00040000-5646-050c-ed09-95282d2fc5a4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5646-050c-9a89-bd74c683ef7a	IL	ISR	376	Israel 	Izrael	\N
00040000-5646-050c-585b-65701fd053c1	IT	ITA	380	Italy 	Italija	\N
00040000-5646-050c-d245-bcd2b3583ae4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5646-050c-ac70-9d37323b2880	JP	JPN	392	Japan 	Japonska	\N
00040000-5646-050c-3e22-d0cca4ea84bd	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5646-050c-23ab-85208c8f091c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5646-050c-5941-6889aa449aa7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5646-050c-752c-bddc9bd7a581	KE	KEN	404	Kenya 	Kenija	\N
00040000-5646-050c-fb82-dac927aef575	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5646-050c-d8c0-5e4b0e3f07e8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5646-050c-6bad-074c501f9c7b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5646-050c-133d-bd7f65118618	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5646-050c-7a33-a373fd5a0fa2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5646-050c-7a7b-806790938974	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5646-050c-9e09-3c28f3ea98d4	LV	LVA	428	Latvia 	Latvija	\N
00040000-5646-050c-edca-abba6e7d8c1f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5646-050c-fc0a-703106e84a48	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5646-050c-7727-c7b6fb2cb04a	LR	LBR	430	Liberia 	Liberija	\N
00040000-5646-050c-59eb-5358b47a2d73	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5646-050c-8a81-e2f3315d7e22	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5646-050c-ea8c-10c332e3962c	LT	LTU	440	Lithuania 	Litva	\N
00040000-5646-050c-280e-45e7d1f78ee1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5646-050c-5e60-c669634ef0a2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5646-050c-8bdf-9d6f2056b754	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5646-050c-d51d-ec416cf83901	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5646-050c-e03e-4090626ce0a4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5646-050c-f4d3-25844a8a595e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5646-050c-dfa7-fa318c8e6311	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5646-050c-2c62-574869f3955c	ML	MLI	466	Mali 	Mali	\N
00040000-5646-050c-17b1-c255aca471c1	MT	MLT	470	Malta 	Malta	\N
00040000-5646-050c-8c48-d1f9fbbb93fa	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5646-050c-fa81-4e33e162cc69	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5646-050c-3299-98a471a749ab	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5646-050c-b6ac-a91f5e16b5cb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5646-050c-fa99-233f7d7522ec	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5646-050c-9579-d436224b3b02	MX	MEX	484	Mexico 	Mehika	\N
00040000-5646-050c-010f-12e1a23b9c25	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5646-050c-4a9b-0b1176631c09	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5646-050c-3a52-e60829327da2	MC	MCO	492	Monaco 	Monako	\N
00040000-5646-050c-9775-56c8407dce90	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5646-050c-0c15-967cdbd80579	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5646-050c-5d61-9260027c594d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5646-050c-3329-80bdc4ac7b8d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5646-050c-5123-1bd281d78d4a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5646-050c-d85b-04b0c151aaba	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5646-050c-6e4a-9b4583ff0769	NA	NAM	516	Namibia 	Namibija	\N
00040000-5646-050c-b52d-216ee674c358	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5646-050c-5a5a-3220e31d8641	NP	NPL	524	Nepal 	Nepal	\N
00040000-5646-050c-53e3-6118093bbcac	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5646-050c-a478-ad752ed9c1cd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5646-050c-4cca-47d2ea9517e8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5646-050c-1b17-2fae2d439e7b	NE	NER	562	Niger 	Niger 	\N
00040000-5646-050c-f743-4d32f7ab7c0f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5646-050c-daef-f3a389e63f9f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5646-050c-7d4a-27195437cac6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5646-050c-dd01-be82bd4e4848	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5646-050c-6e44-b4f4e8222f8c	NO	NOR	578	Norway 	Norveška	\N
00040000-5646-050c-0e0c-82650ad22996	OM	OMN	512	Oman 	Oman	\N
00040000-5646-050c-7388-5b60d66cd748	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5646-050c-e331-ba61b68ebe9e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5646-050c-d283-04ec24881448	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5646-050c-bee7-93a219487aa0	PA	PAN	591	Panama 	Panama	\N
00040000-5646-050c-4f34-8619d0e26998	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5646-050c-33e3-592f1c1f9337	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5646-050c-d81b-0060fc0b6552	PE	PER	604	Peru 	Peru	\N
00040000-5646-050c-2d2d-eb0b781fdd29	PH	PHL	608	Philippines 	Filipini	\N
00040000-5646-050c-d4b6-c26b71cc9bb1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5646-050c-05ff-c9e412452b20	PL	POL	616	Poland 	Poljska	\N
00040000-5646-050c-d029-e23040ff3fa7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5646-050c-af65-b4291b1c7c38	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5646-050c-8b3a-ce9e8cdbc072	QA	QAT	634	Qatar 	Katar	\N
00040000-5646-050c-5975-96f23b9f445e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5646-050c-ec6e-d23be41131d7	RO	ROU	642	Romania 	Romunija	\N
00040000-5646-050c-d89a-f7579a911693	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5646-050c-37ec-4565b90fa6fe	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5646-050c-4275-b3c7b30068ca	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5646-050c-7040-7ebd71578841	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5646-050c-5678-24448a83fae3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5646-050c-b0b7-2078c8f634ef	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5646-050c-527c-451729015733	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5646-050c-e0e0-3df68ede8165	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5646-050c-9caf-300cc215ded7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5646-050c-e1f2-150ae3d6043d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5646-050c-8a16-39766b393670	SM	SMR	674	San Marino 	San Marino	\N
00040000-5646-050c-a6d5-7396def92086	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5646-050c-74da-481ac4c18492	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5646-050c-b0c0-dd826fe4808e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5646-050c-e033-688f1249bbc6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5646-050c-0cfd-bb3455bd6065	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5646-050c-40e0-2b2c08777628	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5646-050c-cbdf-d987a4b923c9	SG	SGP	702	Singapore 	Singapur	\N
00040000-5646-050c-a2a8-c864a93db149	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5646-050c-a661-889c56e3363d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5646-050c-e401-8a5543419ba6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5646-050c-ab83-950b76e47908	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5646-050c-3af2-70216c251590	SO	SOM	706	Somalia 	Somalija	\N
00040000-5646-050c-3163-e4247188ef7f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5646-050c-29e9-ef2ddbad8a75	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5646-050c-8fa6-6ffc1da85932	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5646-050c-2d79-12511772489a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5646-050c-d732-7c97bb64f676	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5646-050c-acfb-1da207eafc67	SD	SDN	729	Sudan 	Sudan	\N
00040000-5646-050c-677c-67d6859aa6e0	SR	SUR	740	Suriname 	Surinam	\N
00040000-5646-050c-f6e2-922a548bece8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5646-050c-27e0-c993e5b3d8c3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5646-050c-9e35-223eb042d3e0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5646-050c-d4c3-1450bd2ec953	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5646-050c-2bc5-6056c5c14371	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5646-050c-af13-f8354a0eb9e5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5646-050c-0a96-556774c9a77a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5646-050c-0ede-16a464bb6356	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5646-050c-b99c-174500aefde9	TH	THA	764	Thailand 	Tajska	\N
00040000-5646-050c-1b86-86e814c118f8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5646-050c-f902-01835306c946	TG	TGO	768	Togo 	Togo	\N
00040000-5646-050c-c55e-290eed786899	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5646-050c-164e-242be6987129	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5646-050c-c704-9fa1fb8760b2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5646-050c-e9ed-6f7274e94321	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5646-050c-e243-a6eb5f4178a3	TR	TUR	792	Turkey 	Turčija	\N
00040000-5646-050c-f878-a395702bf6a2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5646-050c-2096-1a455302f245	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5646-050c-c9ff-77051a404adf	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5646-050c-a082-7fb69ddd9d10	UG	UGA	800	Uganda 	Uganda	\N
00040000-5646-050c-f9d9-4504fa842125	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5646-050c-c253-94e36a710d0d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5646-050c-7457-7570aef6ca70	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5646-050c-e30f-3d9cc5252796	US	USA	840	United States 	Združene države Amerike	\N
00040000-5646-050c-5499-eb10cceb2b3f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5646-050c-3c0b-1b00ed8cfa89	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5646-050c-262b-10186ecf3115	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5646-050c-51ad-5e02054f9c58	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5646-050c-1e32-a7132d087ed4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5646-050c-7f01-608ddd7c3960	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5646-050c-0141-6361370ea20f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5646-050c-a82b-c81cb2373945	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5646-050c-4ca9-89e6106f9829	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5646-050c-7d08-9b2114ad9b1f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5646-050c-68be-7355f66badeb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5646-050c-b627-667bf8d8a842	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5646-050c-e968-5cb8b9e6ec4b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 26862853)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5646-050f-9a90-b99555a23bd1	000e0000-5646-050f-0136-d29b736c599d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5646-050c-4380-7dd9ec32a921	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5646-050f-cf86-c08768373a32	000e0000-5646-050f-00fb-d55ee2d810e0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5646-050c-5d0a-58fa957c24b6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5646-050f-ec2b-85dde48ba3d4	000e0000-5646-050f-c2e8-e9d84380f980	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5646-050c-4380-7dd9ec32a921	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5646-050f-29aa-2c62159c6cf1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5646-050f-a25d-0ddca09332e8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 26862654)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5646-050f-633e-ec0a8f2b36c8	000e0000-5646-050f-00fb-d55ee2d810e0	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5646-050c-3188-50fc605804b7
000d0000-5646-050f-1d26-eb59e6ff320b	000e0000-5646-050f-00fb-d55ee2d810e0	000c0000-5646-050f-a0ca-ce931960177f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5646-050c-3188-50fc605804b7
000d0000-5646-050f-2bbe-71b98e7a2c16	000e0000-5646-050f-00fb-d55ee2d810e0	000c0000-5646-050f-915f-39aeed7f35a9	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5646-050c-d20f-5103762ffe86
000d0000-5646-050f-9d10-2491ebd7bdb9	000e0000-5646-050f-00fb-d55ee2d810e0	000c0000-5646-050f-8665-49e114e3ad97	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5646-050c-a9d5-5c37f417242e
000d0000-5646-050f-5420-40f4084a54b3	000e0000-5646-050f-00fb-d55ee2d810e0	000c0000-5646-050f-5353-6d87e251a406	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5646-050c-afb9-af4f1985cd25
000d0000-5646-050f-0ed1-bca822b75860	000e0000-5646-050f-00fb-d55ee2d810e0	000c0000-5646-050f-d3ea-f30f0441f926	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5646-050c-afb9-af4f1985cd25
000d0000-5646-050f-3454-88e6286a788a	000e0000-5646-050f-00fb-d55ee2d810e0	000c0000-5646-050f-527b-445f8d90f296	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5646-050c-3188-50fc605804b7
000d0000-5646-050f-47e2-cec2cad2c628	000e0000-5646-050f-00fb-d55ee2d810e0	000c0000-5646-050f-ace2-f06787a80110	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5646-050c-2e23-bf919fff29da
000d0000-5646-050f-e3fd-bf1a9542f6e1	000e0000-5646-050f-00fb-d55ee2d810e0	000c0000-5646-050f-8684-bbd99154255e	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5646-050c-5123-2b5753eb5da3
\.


--
-- TOC entry 3122 (class 0 OID 26862445)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 26862411)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 26862388)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5646-050f-c77b-116a13daf057	00080000-5646-050e-217f-e9e80d0acc6b	00090000-5646-050f-d9f6-10c0753b7803	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 26862568)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 26863111)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5646-050f-2a88-06072672a5e8	00010000-5646-050d-d800-1c2746b71403	\N	Prva mapa	Root mapa	2015-11-13 16:43:11	2015-11-13 16:43:11	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 26863124)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 26863146)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 25231831)
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
-- TOC entry 3138 (class 0 OID 26862593)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 26862345)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5646-050d-ee6c-46bba72253c9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5646-050d-5904-dd24e5a7e0e9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5646-050d-7787-d6a5b50d90e9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5646-050d-d6e4-89b742bd21d8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5646-050d-d7be-8c4a6d802672	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5646-050d-63d7-6ef60cce5964	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5646-050d-472c-bda83f6defd7	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5646-050d-bd5b-ee8e9683bef1	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5646-050d-9d63-773c52a0a749	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5646-050d-52be-08601b2a09ec	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5646-050d-3873-43f62fc92739	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5646-050d-260a-46b13f10fdd5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5646-050d-b76e-b2d564751dbb	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5646-050d-eda7-884dd64c3e7d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5646-050e-6663-d3944969f5a4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5646-050e-88e5-ba4374ca0bb1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5646-050e-4a8d-801670c868d4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5646-050e-264e-4730f4d9c530	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5646-050e-f2a4-d88c93d1d9e2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5646-0510-8c39-9f9e7eb37d49	application.tenant.maticnopodjetje	string	s:36:"00080000-5646-0510-cdfa-04e7b6e5286b";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 26862245)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5646-050e-e53c-870d9adfcea8	00000000-5646-050e-6663-d3944969f5a4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5646-050e-26af-dbf24d5833bd	00000000-5646-050e-6663-d3944969f5a4	00010000-5646-050d-d800-1c2746b71403	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5646-050e-f4b9-4527b950fd6a	00000000-5646-050e-88e5-ba4374ca0bb1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 26862312)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5646-050f-417b-e94873f05b4f	\N	00100000-5646-050f-4452-e006c7d0d02c	00100000-5646-050f-6b61-22a78acf409b	01	Gledališče Nimbis
00410000-5646-050f-13b7-1933f2293706	00410000-5646-050f-417b-e94873f05b4f	00100000-5646-050f-4452-e006c7d0d02c	00100000-5646-050f-6b61-22a78acf409b	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 26862256)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5646-050f-a082-69cf68e7671c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5646-050f-7249-f812cc432789	00010000-5646-050e-dff2-9e58bd7da684	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5646-050f-1b5e-3ecd646912d3	00010000-5646-050e-f1f1-eab16167db6a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5646-050f-c7d5-5f3ebdab0169	00010000-5646-050e-87ea-e580c7f4d209	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5646-050f-b3f0-f6cd15d120a0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5646-050f-d638-99bc9f7b6c48	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5646-050f-98f2-6b9514946654	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5646-050f-cdf3-0b3820c94d8a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5646-050f-d9f6-10c0753b7803	00010000-5646-050e-ffe2-1eed6ab8dd91	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5646-050f-934a-5a828c89d725	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5646-050f-dea9-e0b408170fea	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5646-050f-91f3-7123332605b4	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5646-050f-203c-a28692bbf5fc	00010000-5646-050e-d640-c6c03d5c1930	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5646-050f-231a-fc5fd3d6e94a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5646-050f-4024-e015d5981c81	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5646-050f-7b85-a6440b86b7cf	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5646-050f-2473-a64ad5e101db	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5646-050f-8aba-f3d8f5a11d26	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5646-050f-ec18-4b9fc53eacb2	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5646-050f-488d-cddfb6e46e78	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5646-050f-0cd3-0e2df87fbb71	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 26862191)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5646-050d-1f43-a138ce2a0775	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5646-050d-b005-3757fc33642a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5646-050d-f32e-6e3cd9e71338	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5646-050d-e72f-8c800918edd8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5646-050d-5a77-5f61b0fe8675	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5646-050d-2f3d-0d64c192f2cc	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5646-050d-3812-4fee1c68148b	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5646-050d-c977-c67577a54adc	Abonma-read	Abonma - branje	t
00030000-5646-050d-a221-7513dc80b99e	Abonma-write	Abonma - spreminjanje	t
00030000-5646-050d-5960-52538d142301	Alternacija-read	Alternacija - branje	t
00030000-5646-050d-adcd-86076147d400	Alternacija-write	Alternacija - spreminjanje	t
00030000-5646-050d-bde7-eb4f6c57c256	Arhivalija-read	Arhivalija - branje	t
00030000-5646-050d-816d-b7716b18c94b	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5646-050d-8fed-12bef1861065	AuthStorage-read	AuthStorage - branje	t
00030000-5646-050d-ce31-de56df8d9feb	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5646-050d-f223-449be9ea5673	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5646-050d-9694-6a1bc6070d61	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5646-050d-3dc3-693f5906530f	Besedilo-read	Besedilo - branje	t
00030000-5646-050d-a207-59b06ea668df	Besedilo-write	Besedilo - spreminjanje	t
00030000-5646-050d-56b6-8f83f6765f3b	Dogodek-read	Dogodek - branje	t
00030000-5646-050d-5402-4bb40f2f6bc0	Dogodek-write	Dogodek - spreminjanje	t
00030000-5646-050d-a076-ad6c7f00e12b	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5646-050d-267f-b3c20d8a65d4	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5646-050d-9ac2-7c6e4e4114d1	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5646-050d-dbbd-0ceac5022f1c	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5646-050d-4871-9bc819f01032	DogodekTrait-read	DogodekTrait - branje	t
00030000-5646-050d-27c9-af7ed021817f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5646-050d-822c-d53b945f2a06	DrugiVir-read	DrugiVir - branje	t
00030000-5646-050d-056c-f98453d37789	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5646-050d-90aa-24d4c1ed9746	Drzava-read	Drzava - branje	t
00030000-5646-050d-ae2b-1b355789679d	Drzava-write	Drzava - spreminjanje	t
00030000-5646-050d-7806-84aafcd24d6d	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5646-050d-5b1c-6cd2e7deee0e	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5646-050d-c781-fd5619b24a26	Funkcija-read	Funkcija - branje	t
00030000-5646-050d-c6b8-28ba79ce5fd6	Funkcija-write	Funkcija - spreminjanje	t
00030000-5646-050d-613a-9c8557d171a5	Gostovanje-read	Gostovanje - branje	t
00030000-5646-050d-4732-1bdda0be2887	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5646-050d-cf07-72f21857ef6d	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5646-050d-4889-3a083ac01c97	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5646-050d-b3c5-daad6b485560	Kupec-read	Kupec - branje	t
00030000-5646-050d-1b8e-969628db9fbe	Kupec-write	Kupec - spreminjanje	t
00030000-5646-050d-6d9f-3c37161e6a68	NacinPlacina-read	NacinPlacina - branje	t
00030000-5646-050d-ea00-c9de189e4e7e	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5646-050d-1d43-a9c8d7f40bfb	Option-read	Option - branje	t
00030000-5646-050d-20d9-8fad98a29b9b	Option-write	Option - spreminjanje	t
00030000-5646-050d-4040-30bf60984f60	OptionValue-read	OptionValue - branje	t
00030000-5646-050d-d6e0-3f96cafd2e1e	OptionValue-write	OptionValue - spreminjanje	t
00030000-5646-050d-1782-db782932b4f5	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5646-050d-ea14-1c85ac0f2a56	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5646-050d-0321-b5814a5d5c65	Oseba-read	Oseba - branje	t
00030000-5646-050d-79bc-3027fe54a86a	Oseba-write	Oseba - spreminjanje	t
00030000-5646-050d-9d4c-09780f8a8482	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5646-050d-6582-a3d0ecb7fb2c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5646-050d-9491-0530c9e9dc0b	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5646-050d-dbff-a94774426a6c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5646-050d-12a6-8adcfc128275	Pogodba-read	Pogodba - branje	t
00030000-5646-050d-789d-f5682284916d	Pogodba-write	Pogodba - spreminjanje	t
00030000-5646-050d-e9ff-1bb019c86889	Popa-read	Popa - branje	t
00030000-5646-050d-9d50-b4b17a8c7525	Popa-write	Popa - spreminjanje	t
00030000-5646-050d-cf65-46c26fddea6d	Posta-read	Posta - branje	t
00030000-5646-050d-43f1-a7b418d8b4db	Posta-write	Posta - spreminjanje	t
00030000-5646-050d-5422-04552429e5b7	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5646-050d-2c75-7284ca085985	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5646-050d-c0da-eb94a6605d77	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5646-050d-f4f6-7481305c0751	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5646-050d-2359-1932a2b4dcc4	PostniNaslov-read	PostniNaslov - branje	t
00030000-5646-050d-0a7d-8ebd56a2b3a1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5646-050d-cf0d-d77762cd2689	Praznik-read	Praznik - branje	t
00030000-5646-050d-47ad-c0679325cf0e	Praznik-write	Praznik - spreminjanje	t
00030000-5646-050d-a922-b49bec3ab891	Predstava-read	Predstava - branje	t
00030000-5646-050d-9369-2a95258cda3a	Predstava-write	Predstava - spreminjanje	t
00030000-5646-050d-e70e-40f8a23ba1ef	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5646-050d-f4ba-697b645eb74d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5646-050d-a573-81254f0b8bf8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5646-050d-dadf-82f5ce0b0e9e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5646-050d-5faf-3b237cbcbe48	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5646-050d-0a14-cef6cb025e79	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5646-050d-74cd-89d33978c349	ProgramDela-read	ProgramDela - branje	t
00030000-5646-050d-56f5-ca9a994fee92	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5646-050d-dd7d-f3ab37004628	ProgramFestival-read	ProgramFestival - branje	t
00030000-5646-050d-3a69-3e190e0a0fd1	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5646-050d-475d-039188f2f336	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5646-050d-b74a-9aa38eb22b8a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5646-050d-2285-4a8758017a11	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5646-050d-121e-9ccf8c7bf2ed	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5646-050d-9b95-3182ad615d93	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5646-050d-df49-45331ba1d79c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5646-050d-df0c-1385996fd407	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5646-050d-ae2e-bca450420889	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5646-050d-447f-6060086015b8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5646-050d-9413-75ce7ec15341	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5646-050d-dd8e-d0af9555c580	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5646-050d-a789-133412fc11f6	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5646-050d-5646-a32c180a2d1e	ProgramRazno-read	ProgramRazno - branje	t
00030000-5646-050d-2b4a-6183831e5b09	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5646-050d-234e-d8ba21cc164d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5646-050d-2134-ead4e707df39	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5646-050d-ae1d-b078fc99836c	Prostor-read	Prostor - branje	t
00030000-5646-050d-b2e5-c52377bfe973	Prostor-write	Prostor - spreminjanje	t
00030000-5646-050d-6a90-c3b13aca3d0b	Racun-read	Racun - branje	t
00030000-5646-050d-0fda-97c57b823528	Racun-write	Racun - spreminjanje	t
00030000-5646-050d-eff0-775d3d118413	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5646-050d-cc5c-e8838bb8aaf9	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5646-050d-b2f1-732a58516679	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5646-050d-10fa-07f7c3784a2e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5646-050d-dae5-a1d3f746d072	Rekvizit-read	Rekvizit - branje	t
00030000-5646-050d-c918-fdf40d34930c	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5646-050d-3301-fe3534d757c7	Revizija-read	Revizija - branje	t
00030000-5646-050d-eeab-de376eced956	Revizija-write	Revizija - spreminjanje	t
00030000-5646-050d-f4a3-1398c85095df	Rezervacija-read	Rezervacija - branje	t
00030000-5646-050d-a8d5-cd62df4f947e	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5646-050d-3289-74a3d1a4620c	SedezniRed-read	SedezniRed - branje	t
00030000-5646-050d-1937-5f86ae6daa7f	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5646-050d-2ccf-81c873ad3557	Sedez-read	Sedez - branje	t
00030000-5646-050d-848c-bd0a0f02b7c8	Sedez-write	Sedez - spreminjanje	t
00030000-5646-050d-2d1a-6802e4b6f9e3	Sezona-read	Sezona - branje	t
00030000-5646-050d-d9f0-5f7151e27152	Sezona-write	Sezona - spreminjanje	t
00030000-5646-050d-5c49-77f4dbff7b6a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5646-050d-0265-ae8b17661370	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5646-050d-295c-ea9e97d08e99	Stevilcenje-read	Stevilcenje - branje	t
00030000-5646-050d-dd70-e8ae7ad4cd80	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5646-050d-c602-ff343225c595	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5646-050d-33d1-f3ea5b450b43	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5646-050d-87c7-70824d56c1c8	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5646-050d-3a11-ea601ac93499	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5646-050d-01ea-51b1bdb33299	Telefonska-read	Telefonska - branje	t
00030000-5646-050d-a3a6-34cfd6a6f929	Telefonska-write	Telefonska - spreminjanje	t
00030000-5646-050d-ab74-a12a0cc9941e	TerminStoritve-read	TerminStoritve - branje	t
00030000-5646-050d-cb1d-cb08d722076b	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5646-050d-7583-a63370a737d5	TipFunkcije-read	TipFunkcije - branje	t
00030000-5646-050d-67ab-7edcfba8f051	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5646-050d-f752-d8ea57d7cee0	TipPopa-read	TipPopa - branje	t
00030000-5646-050d-652f-a2acd4fd6e0d	TipPopa-write	TipPopa - spreminjanje	t
00030000-5646-050d-cbd3-f1014c3ec4fd	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5646-050d-c5af-688be8f7c072	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5646-050d-4063-8eec4ac26439	TipVaje-read	TipVaje - branje	t
00030000-5646-050d-9d85-9e1164e0a875	TipVaje-write	TipVaje - spreminjanje	t
00030000-5646-050d-bb68-239b5e38ed93	Trr-read	Trr - branje	t
00030000-5646-050d-dbc3-eb545e415329	Trr-write	Trr - spreminjanje	t
00030000-5646-050d-9418-93c4270cf5c6	Uprizoritev-read	Uprizoritev - branje	t
00030000-5646-050d-b648-80e1cb41bb4c	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5646-050d-b235-b0b760dde345	Vaja-read	Vaja - branje	t
00030000-5646-050d-8efe-c3bf84a90c87	Vaja-write	Vaja - spreminjanje	t
00030000-5646-050d-486e-a121566f9c38	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5646-050d-b40b-68330c2b3b57	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5646-050d-03e9-7cd05d830854	VrstaStroska-read	VrstaStroska - branje	t
00030000-5646-050d-4de4-e37f9c7ed2ac	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5646-050d-e416-3c91aff35fe2	Zaposlitev-read	Zaposlitev - branje	t
00030000-5646-050d-e582-d065ea69dac4	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5646-050d-76a0-dc970e86600b	Zasedenost-read	Zasedenost - branje	t
00030000-5646-050d-0bed-7f1cf8a56cb0	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5646-050d-06cf-c608ae350b5a	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5646-050d-e639-a92966cbf497	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5646-050d-95b6-ea14b4ff54ff	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5646-050d-9452-fa7758663cb1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5646-050d-376f-8879d231af68	Job-read	Branje opravil - samo zase - branje	t
00030000-5646-050d-f643-2d3f7cdbc59a	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5646-050d-70ef-165d743c9723	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5646-050d-92cf-44b2123fbcb1	Report-read	Report - branje	t
00030000-5646-050d-1747-2c4a656dcd80	Report-write	Report - spreminjanje	t
00030000-5646-050d-e70d-76942e064711	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5646-050d-72c7-a9335ab26aa3	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5646-050d-e507-5bbfa275f678	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5646-050d-7c3a-ce81ce147e27	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5646-050d-320d-e75b43a8f1cd	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5646-050d-6564-12c743c4dc19	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5646-050d-05b8-462dd0eff8f4	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5646-050d-faa6-d9d5cb2e32da	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5646-050d-a831-97162210ebd0	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5646-050d-ae47-d419d7fcd716	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5646-050d-cb50-ae66fdf5149d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5646-050d-78ee-c30f3e99a8d3	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5646-050d-ad81-1c01ad816407	Datoteka-write	Datoteka - spreminjanje	t
00030000-5646-050d-83f0-40cccb120fa3	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 26862210)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5646-050d-c231-0286b1fa7e28	00030000-5646-050d-b005-3757fc33642a
00020000-5646-050d-71e3-6d97de400cb2	00030000-5646-050d-90aa-24d4c1ed9746
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-c977-c67577a54adc
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-a221-7513dc80b99e
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-5960-52538d142301
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-adcd-86076147d400
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-bde7-eb4f6c57c256
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-56b6-8f83f6765f3b
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-e72f-8c800918edd8
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-5402-4bb40f2f6bc0
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-90aa-24d4c1ed9746
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-ae2b-1b355789679d
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-c781-fd5619b24a26
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-c6b8-28ba79ce5fd6
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-613a-9c8557d171a5
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-4732-1bdda0be2887
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-cf07-72f21857ef6d
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-4889-3a083ac01c97
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-1d43-a9c8d7f40bfb
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-4040-30bf60984f60
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-0321-b5814a5d5c65
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-79bc-3027fe54a86a
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-e9ff-1bb019c86889
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-9d50-b4b17a8c7525
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-cf65-46c26fddea6d
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-43f1-a7b418d8b4db
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-2359-1932a2b4dcc4
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-0a7d-8ebd56a2b3a1
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-a922-b49bec3ab891
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-9369-2a95258cda3a
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-5faf-3b237cbcbe48
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-0a14-cef6cb025e79
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-ae1d-b078fc99836c
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-b2e5-c52377bfe973
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-b2f1-732a58516679
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-10fa-07f7c3784a2e
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-dae5-a1d3f746d072
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-c918-fdf40d34930c
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-2d1a-6802e4b6f9e3
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-d9f0-5f7151e27152
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-7583-a63370a737d5
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-9418-93c4270cf5c6
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-b648-80e1cb41bb4c
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-b235-b0b760dde345
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-8efe-c3bf84a90c87
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-76a0-dc970e86600b
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-0bed-7f1cf8a56cb0
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-06cf-c608ae350b5a
00020000-5646-050d-9168-26759e79e820	00030000-5646-050d-95b6-ea14b4ff54ff
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-c977-c67577a54adc
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-bde7-eb4f6c57c256
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-56b6-8f83f6765f3b
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-90aa-24d4c1ed9746
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-613a-9c8557d171a5
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-cf07-72f21857ef6d
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-4889-3a083ac01c97
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-1d43-a9c8d7f40bfb
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-4040-30bf60984f60
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-0321-b5814a5d5c65
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-79bc-3027fe54a86a
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-e9ff-1bb019c86889
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-cf65-46c26fddea6d
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-2359-1932a2b4dcc4
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-0a7d-8ebd56a2b3a1
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-a922-b49bec3ab891
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-ae1d-b078fc99836c
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-b2f1-732a58516679
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-dae5-a1d3f746d072
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-2d1a-6802e4b6f9e3
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-01ea-51b1bdb33299
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-a3a6-34cfd6a6f929
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-bb68-239b5e38ed93
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-dbc3-eb545e415329
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-e416-3c91aff35fe2
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-e582-d065ea69dac4
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-06cf-c608ae350b5a
00020000-5646-050d-e061-ff9154715350	00030000-5646-050d-95b6-ea14b4ff54ff
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-c977-c67577a54adc
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-5960-52538d142301
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-bde7-eb4f6c57c256
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-816d-b7716b18c94b
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-3dc3-693f5906530f
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-a076-ad6c7f00e12b
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-56b6-8f83f6765f3b
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-90aa-24d4c1ed9746
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-c781-fd5619b24a26
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-613a-9c8557d171a5
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-cf07-72f21857ef6d
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-1d43-a9c8d7f40bfb
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-4040-30bf60984f60
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-0321-b5814a5d5c65
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-e9ff-1bb019c86889
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-cf65-46c26fddea6d
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-a922-b49bec3ab891
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-5faf-3b237cbcbe48
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-ae1d-b078fc99836c
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-b2f1-732a58516679
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-dae5-a1d3f746d072
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-2d1a-6802e4b6f9e3
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-7583-a63370a737d5
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-b235-b0b760dde345
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-76a0-dc970e86600b
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-06cf-c608ae350b5a
00020000-5646-050d-63e6-bd101b440223	00030000-5646-050d-95b6-ea14b4ff54ff
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-c977-c67577a54adc
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-a221-7513dc80b99e
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-adcd-86076147d400
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-bde7-eb4f6c57c256
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-56b6-8f83f6765f3b
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-90aa-24d4c1ed9746
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-613a-9c8557d171a5
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-1d43-a9c8d7f40bfb
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-4040-30bf60984f60
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-e9ff-1bb019c86889
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-cf65-46c26fddea6d
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-a922-b49bec3ab891
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-ae1d-b078fc99836c
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-b2f1-732a58516679
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-dae5-a1d3f746d072
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-2d1a-6802e4b6f9e3
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-7583-a63370a737d5
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-06cf-c608ae350b5a
00020000-5646-050d-4240-6e16b19880a8	00030000-5646-050d-95b6-ea14b4ff54ff
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-c977-c67577a54adc
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-bde7-eb4f6c57c256
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-56b6-8f83f6765f3b
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-90aa-24d4c1ed9746
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-613a-9c8557d171a5
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-1d43-a9c8d7f40bfb
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-4040-30bf60984f60
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-e9ff-1bb019c86889
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-cf65-46c26fddea6d
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-a922-b49bec3ab891
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-ae1d-b078fc99836c
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-b2f1-732a58516679
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-dae5-a1d3f746d072
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-2d1a-6802e4b6f9e3
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-ab74-a12a0cc9941e
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-f32e-6e3cd9e71338
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-7583-a63370a737d5
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-06cf-c608ae350b5a
00020000-5646-050d-9b54-7b6101bbb302	00030000-5646-050d-95b6-ea14b4ff54ff
00020000-5646-050e-b929-990228500770	00030000-5646-050d-1f43-a138ce2a0775
00020000-5646-050e-b929-990228500770	00030000-5646-050d-b005-3757fc33642a
00020000-5646-050e-b929-990228500770	00030000-5646-050d-c977-c67577a54adc
00020000-5646-050e-b929-990228500770	00030000-5646-050d-a221-7513dc80b99e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-5960-52538d142301
00020000-5646-050e-b929-990228500770	00030000-5646-050d-adcd-86076147d400
00020000-5646-050e-b929-990228500770	00030000-5646-050d-bde7-eb4f6c57c256
00020000-5646-050e-b929-990228500770	00030000-5646-050d-816d-b7716b18c94b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-f223-449be9ea5673
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9694-6a1bc6070d61
00020000-5646-050e-b929-990228500770	00030000-5646-050d-3dc3-693f5906530f
00020000-5646-050e-b929-990228500770	00030000-5646-050d-a207-59b06ea668df
00020000-5646-050e-b929-990228500770	00030000-5646-050d-a076-ad6c7f00e12b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-267f-b3c20d8a65d4
00020000-5646-050e-b929-990228500770	00030000-5646-050d-56b6-8f83f6765f3b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-e72f-8c800918edd8
00020000-5646-050e-b929-990228500770	00030000-5646-050d-5402-4bb40f2f6bc0
00020000-5646-050e-b929-990228500770	00030000-5646-050d-822c-d53b945f2a06
00020000-5646-050e-b929-990228500770	00030000-5646-050d-056c-f98453d37789
00020000-5646-050e-b929-990228500770	00030000-5646-050d-90aa-24d4c1ed9746
00020000-5646-050e-b929-990228500770	00030000-5646-050d-ae2b-1b355789679d
00020000-5646-050e-b929-990228500770	00030000-5646-050d-7806-84aafcd24d6d
00020000-5646-050e-b929-990228500770	00030000-5646-050d-5b1c-6cd2e7deee0e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-c781-fd5619b24a26
00020000-5646-050e-b929-990228500770	00030000-5646-050d-c6b8-28ba79ce5fd6
00020000-5646-050e-b929-990228500770	00030000-5646-050d-613a-9c8557d171a5
00020000-5646-050e-b929-990228500770	00030000-5646-050d-4732-1bdda0be2887
00020000-5646-050e-b929-990228500770	00030000-5646-050d-cf07-72f21857ef6d
00020000-5646-050e-b929-990228500770	00030000-5646-050d-4889-3a083ac01c97
00020000-5646-050e-b929-990228500770	00030000-5646-050d-b3c5-daad6b485560
00020000-5646-050e-b929-990228500770	00030000-5646-050d-1b8e-969628db9fbe
00020000-5646-050e-b929-990228500770	00030000-5646-050d-6d9f-3c37161e6a68
00020000-5646-050e-b929-990228500770	00030000-5646-050d-ea00-c9de189e4e7e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-1d43-a9c8d7f40bfb
00020000-5646-050e-b929-990228500770	00030000-5646-050d-4040-30bf60984f60
00020000-5646-050e-b929-990228500770	00030000-5646-050d-d6e0-3f96cafd2e1e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-20d9-8fad98a29b9b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-1782-db782932b4f5
00020000-5646-050e-b929-990228500770	00030000-5646-050d-ea14-1c85ac0f2a56
00020000-5646-050e-b929-990228500770	00030000-5646-050d-0321-b5814a5d5c65
00020000-5646-050e-b929-990228500770	00030000-5646-050d-5a77-5f61b0fe8675
00020000-5646-050e-b929-990228500770	00030000-5646-050d-79bc-3027fe54a86a
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9d4c-09780f8a8482
00020000-5646-050e-b929-990228500770	00030000-5646-050d-6582-a3d0ecb7fb2c
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9491-0530c9e9dc0b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-dbff-a94774426a6c
00020000-5646-050e-b929-990228500770	00030000-5646-050d-12a6-8adcfc128275
00020000-5646-050e-b929-990228500770	00030000-5646-050d-789d-f5682284916d
00020000-5646-050e-b929-990228500770	00030000-5646-050d-e9ff-1bb019c86889
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9d50-b4b17a8c7525
00020000-5646-050e-b929-990228500770	00030000-5646-050d-cf65-46c26fddea6d
00020000-5646-050e-b929-990228500770	00030000-5646-050d-5422-04552429e5b7
00020000-5646-050e-b929-990228500770	00030000-5646-050d-2c75-7284ca085985
00020000-5646-050e-b929-990228500770	00030000-5646-050d-c0da-eb94a6605d77
00020000-5646-050e-b929-990228500770	00030000-5646-050d-f4f6-7481305c0751
00020000-5646-050e-b929-990228500770	00030000-5646-050d-43f1-a7b418d8b4db
00020000-5646-050e-b929-990228500770	00030000-5646-050d-2359-1932a2b4dcc4
00020000-5646-050e-b929-990228500770	00030000-5646-050d-0a7d-8ebd56a2b3a1
00020000-5646-050e-b929-990228500770	00030000-5646-050d-cf0d-d77762cd2689
00020000-5646-050e-b929-990228500770	00030000-5646-050d-47ad-c0679325cf0e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-a922-b49bec3ab891
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9369-2a95258cda3a
00020000-5646-050e-b929-990228500770	00030000-5646-050d-e70e-40f8a23ba1ef
00020000-5646-050e-b929-990228500770	00030000-5646-050d-f4ba-697b645eb74d
00020000-5646-050e-b929-990228500770	00030000-5646-050d-a573-81254f0b8bf8
00020000-5646-050e-b929-990228500770	00030000-5646-050d-dadf-82f5ce0b0e9e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-5faf-3b237cbcbe48
00020000-5646-050e-b929-990228500770	00030000-5646-050d-0a14-cef6cb025e79
00020000-5646-050e-b929-990228500770	00030000-5646-050d-2f3d-0d64c192f2cc
00020000-5646-050e-b929-990228500770	00030000-5646-050d-74cd-89d33978c349
00020000-5646-050e-b929-990228500770	00030000-5646-050d-3812-4fee1c68148b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-56f5-ca9a994fee92
00020000-5646-050e-b929-990228500770	00030000-5646-050d-dd7d-f3ab37004628
00020000-5646-050e-b929-990228500770	00030000-5646-050d-3a69-3e190e0a0fd1
00020000-5646-050e-b929-990228500770	00030000-5646-050d-475d-039188f2f336
00020000-5646-050e-b929-990228500770	00030000-5646-050d-b74a-9aa38eb22b8a
00020000-5646-050e-b929-990228500770	00030000-5646-050d-2285-4a8758017a11
00020000-5646-050e-b929-990228500770	00030000-5646-050d-121e-9ccf8c7bf2ed
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9b95-3182ad615d93
00020000-5646-050e-b929-990228500770	00030000-5646-050d-df49-45331ba1d79c
00020000-5646-050e-b929-990228500770	00030000-5646-050d-df0c-1385996fd407
00020000-5646-050e-b929-990228500770	00030000-5646-050d-ae2e-bca450420889
00020000-5646-050e-b929-990228500770	00030000-5646-050d-447f-6060086015b8
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9413-75ce7ec15341
00020000-5646-050e-b929-990228500770	00030000-5646-050d-dd8e-d0af9555c580
00020000-5646-050e-b929-990228500770	00030000-5646-050d-a789-133412fc11f6
00020000-5646-050e-b929-990228500770	00030000-5646-050d-5646-a32c180a2d1e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-2b4a-6183831e5b09
00020000-5646-050e-b929-990228500770	00030000-5646-050d-234e-d8ba21cc164d
00020000-5646-050e-b929-990228500770	00030000-5646-050d-2134-ead4e707df39
00020000-5646-050e-b929-990228500770	00030000-5646-050d-ae1d-b078fc99836c
00020000-5646-050e-b929-990228500770	00030000-5646-050d-b2e5-c52377bfe973
00020000-5646-050e-b929-990228500770	00030000-5646-050d-6a90-c3b13aca3d0b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-0fda-97c57b823528
00020000-5646-050e-b929-990228500770	00030000-5646-050d-eff0-775d3d118413
00020000-5646-050e-b929-990228500770	00030000-5646-050d-cc5c-e8838bb8aaf9
00020000-5646-050e-b929-990228500770	00030000-5646-050d-b2f1-732a58516679
00020000-5646-050e-b929-990228500770	00030000-5646-050d-10fa-07f7c3784a2e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-dae5-a1d3f746d072
00020000-5646-050e-b929-990228500770	00030000-5646-050d-c918-fdf40d34930c
00020000-5646-050e-b929-990228500770	00030000-5646-050d-3301-fe3534d757c7
00020000-5646-050e-b929-990228500770	00030000-5646-050d-eeab-de376eced956
00020000-5646-050e-b929-990228500770	00030000-5646-050d-f4a3-1398c85095df
00020000-5646-050e-b929-990228500770	00030000-5646-050d-a8d5-cd62df4f947e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-3289-74a3d1a4620c
00020000-5646-050e-b929-990228500770	00030000-5646-050d-1937-5f86ae6daa7f
00020000-5646-050e-b929-990228500770	00030000-5646-050d-2ccf-81c873ad3557
00020000-5646-050e-b929-990228500770	00030000-5646-050d-848c-bd0a0f02b7c8
00020000-5646-050e-b929-990228500770	00030000-5646-050d-2d1a-6802e4b6f9e3
00020000-5646-050e-b929-990228500770	00030000-5646-050d-d9f0-5f7151e27152
00020000-5646-050e-b929-990228500770	00030000-5646-050d-5c49-77f4dbff7b6a
00020000-5646-050e-b929-990228500770	00030000-5646-050d-0265-ae8b17661370
00020000-5646-050e-b929-990228500770	00030000-5646-050d-295c-ea9e97d08e99
00020000-5646-050e-b929-990228500770	00030000-5646-050d-c602-ff343225c595
00020000-5646-050e-b929-990228500770	00030000-5646-050d-33d1-f3ea5b450b43
00020000-5646-050e-b929-990228500770	00030000-5646-050d-dd70-e8ae7ad4cd80
00020000-5646-050e-b929-990228500770	00030000-5646-050d-87c7-70824d56c1c8
00020000-5646-050e-b929-990228500770	00030000-5646-050d-3a11-ea601ac93499
00020000-5646-050e-b929-990228500770	00030000-5646-050d-01ea-51b1bdb33299
00020000-5646-050e-b929-990228500770	00030000-5646-050d-a3a6-34cfd6a6f929
00020000-5646-050e-b929-990228500770	00030000-5646-050d-ab74-a12a0cc9941e
00020000-5646-050e-b929-990228500770	00030000-5646-050d-f32e-6e3cd9e71338
00020000-5646-050e-b929-990228500770	00030000-5646-050d-cb1d-cb08d722076b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-7583-a63370a737d5
00020000-5646-050e-b929-990228500770	00030000-5646-050d-67ab-7edcfba8f051
00020000-5646-050e-b929-990228500770	00030000-5646-050d-f752-d8ea57d7cee0
00020000-5646-050e-b929-990228500770	00030000-5646-050d-652f-a2acd4fd6e0d
00020000-5646-050e-b929-990228500770	00030000-5646-050d-cbd3-f1014c3ec4fd
00020000-5646-050e-b929-990228500770	00030000-5646-050d-c5af-688be8f7c072
00020000-5646-050e-b929-990228500770	00030000-5646-050d-4063-8eec4ac26439
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9d85-9e1164e0a875
00020000-5646-050e-b929-990228500770	00030000-5646-050d-bb68-239b5e38ed93
00020000-5646-050e-b929-990228500770	00030000-5646-050d-dbc3-eb545e415329
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9418-93c4270cf5c6
00020000-5646-050e-b929-990228500770	00030000-5646-050d-b648-80e1cb41bb4c
00020000-5646-050e-b929-990228500770	00030000-5646-050d-b235-b0b760dde345
00020000-5646-050e-b929-990228500770	00030000-5646-050d-8efe-c3bf84a90c87
00020000-5646-050e-b929-990228500770	00030000-5646-050d-486e-a121566f9c38
00020000-5646-050e-b929-990228500770	00030000-5646-050d-b40b-68330c2b3b57
00020000-5646-050e-b929-990228500770	00030000-5646-050d-03e9-7cd05d830854
00020000-5646-050e-b929-990228500770	00030000-5646-050d-4de4-e37f9c7ed2ac
00020000-5646-050e-b929-990228500770	00030000-5646-050d-e416-3c91aff35fe2
00020000-5646-050e-b929-990228500770	00030000-5646-050d-e582-d065ea69dac4
00020000-5646-050e-b929-990228500770	00030000-5646-050d-76a0-dc970e86600b
00020000-5646-050e-b929-990228500770	00030000-5646-050d-0bed-7f1cf8a56cb0
00020000-5646-050e-b929-990228500770	00030000-5646-050d-06cf-c608ae350b5a
00020000-5646-050e-b929-990228500770	00030000-5646-050d-e639-a92966cbf497
00020000-5646-050e-b929-990228500770	00030000-5646-050d-95b6-ea14b4ff54ff
00020000-5646-050e-b929-990228500770	00030000-5646-050d-9452-fa7758663cb1
00020000-5646-050e-2e68-033618ebd302	00030000-5646-050d-ae47-d419d7fcd716
00020000-5646-050e-1439-2d41730626cd	00030000-5646-050d-a831-97162210ebd0
00020000-5646-050e-6586-bd8ea5bae482	00030000-5646-050d-b648-80e1cb41bb4c
00020000-5646-050e-f677-161c61c74e7e	00030000-5646-050d-9418-93c4270cf5c6
00020000-5646-050e-db20-7d04a8a1bc12	00030000-5646-050d-72c7-a9335ab26aa3
00020000-5646-050e-491e-1e37bd77118d	00030000-5646-050d-e507-5bbfa275f678
00020000-5646-050e-7264-5412cd5f735b	00030000-5646-050d-7c3a-ce81ce147e27
00020000-5646-050e-588a-1da8c47cffc0	00030000-5646-050d-e70d-76942e064711
00020000-5646-050e-e382-9c70fc752a7e	00030000-5646-050d-6564-12c743c4dc19
00020000-5646-050e-431c-b2767634962d	00030000-5646-050d-320d-e75b43a8f1cd
\.


--
-- TOC entry 3139 (class 0 OID 26862600)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 26862634)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 26862771)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5646-050f-cfa7-0464812122d8	00090000-5646-050f-a082-69cf68e7671c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5646-050f-347a-b99e8f977a6a	00090000-5646-050f-d638-99bc9f7b6c48	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5646-050f-bb58-b65398419447	00090000-5646-050f-203c-a28692bbf5fc	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5646-050f-1476-0bf3b4ba3783	00090000-5646-050f-934a-5a828c89d725	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 26862292)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5646-050e-217f-e9e80d0acc6b	\N	00040000-5646-050c-e401-8a5543419ba6	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5646-050e-6f24-833cdea3277e	\N	00040000-5646-050c-e401-8a5543419ba6	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5646-050e-f065-491aa398285d	\N	00040000-5646-050c-e401-8a5543419ba6	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5646-050e-3a2e-4be2a808da0a	\N	00040000-5646-050c-e401-8a5543419ba6	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5646-050e-a82e-31b6473eda5b	\N	00040000-5646-050c-e401-8a5543419ba6	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5646-050e-23ca-a910638a4602	\N	00040000-5646-050c-fcc8-d7d4c26ce9ae	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5646-050e-2bb3-6d8321f0a9aa	\N	00040000-5646-050c-9da3-246a35e49c39	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5646-050e-cac2-532347b9161c	\N	00040000-5646-050c-bc12-43d52bd7df55	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5646-050e-167e-760bdf833c53	\N	00040000-5646-050c-7352-37ad79dfc6ff	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5646-0510-cdfa-04e7b6e5286b	\N	00040000-5646-050c-e401-8a5543419ba6	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 26862337)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5646-050c-ec3c-e38d01ad1ceb	8341	Adlešiči
00050000-5646-050c-75e4-336a03b88790	5270	Ajdovščina
00050000-5646-050c-192b-8c292a5dc2d8	6280	Ankaran/Ancarano
00050000-5646-050c-dd59-0ccff93374e6	9253	Apače
00050000-5646-050c-bec9-75a17a3c5a4b	8253	Artiče
00050000-5646-050c-bd38-65c5846e1268	4275	Begunje na Gorenjskem
00050000-5646-050c-d2ac-7b12fab6a557	1382	Begunje pri Cerknici
00050000-5646-050c-5f5d-871a51b0cf64	9231	Beltinci
00050000-5646-050c-bcb2-4797fc2869f8	2234	Benedikt
00050000-5646-050c-7c8d-7f1c0a2457b2	2345	Bistrica ob Dravi
00050000-5646-050c-5ca9-504003f50b91	3256	Bistrica ob Sotli
00050000-5646-050c-8a60-66a630c47af0	8259	Bizeljsko
00050000-5646-050c-1e16-0479a9400f7e	1223	Blagovica
00050000-5646-050c-a7df-129def3ea2b2	8283	Blanca
00050000-5646-050c-8242-b050cdb5d92a	4260	Bled
00050000-5646-050c-abcb-9e5ae0015173	4273	Blejska Dobrava
00050000-5646-050c-7cab-c42d85deee0f	9265	Bodonci
00050000-5646-050c-3dae-c0e96c243eb4	9222	Bogojina
00050000-5646-050c-11e0-1c2ddfad738a	4263	Bohinjska Bela
00050000-5646-050c-2592-6329056fb66f	4264	Bohinjska Bistrica
00050000-5646-050c-a439-9ce51aa6b688	4265	Bohinjsko jezero
00050000-5646-050c-7770-0003ab955859	1353	Borovnica
00050000-5646-050c-c9ed-3bd90351ba53	8294	Boštanj
00050000-5646-050c-71a8-23712f966da5	5230	Bovec
00050000-5646-050c-575b-63d9b8654c6e	5295	Branik
00050000-5646-050c-12fa-9bbfc9e3cb09	3314	Braslovče
00050000-5646-050c-687d-351756fc59a2	5223	Breginj
00050000-5646-050c-4107-e071a03c7c98	8280	Brestanica
00050000-5646-050c-3da5-76b4e0f1d2d6	2354	Bresternica
00050000-5646-050c-de9b-ab3ac0f25a3e	4243	Brezje
00050000-5646-050c-01ee-b043c5e0c94c	1351	Brezovica pri Ljubljani
00050000-5646-050c-5dd4-0ce00c49ad62	8250	Brežice
00050000-5646-050c-0370-da551452c968	4210	Brnik - Aerodrom
00050000-5646-050c-507a-6848d407f725	8321	Brusnice
00050000-5646-050c-2179-565c0ec36ccd	3255	Buče
00050000-5646-050c-65f3-90f59c9fede6	8276	Bučka 
00050000-5646-050c-bc6b-882022091649	9261	Cankova
00050000-5646-050c-abe4-32a6197a43cd	3000	Celje 
00050000-5646-050c-98b2-0d9fde8de33f	3001	Celje - poštni predali
00050000-5646-050c-e9a8-ec903e255315	4207	Cerklje na Gorenjskem
00050000-5646-050c-286d-654272095b3c	8263	Cerklje ob Krki
00050000-5646-050c-a7b2-554cadd61842	1380	Cerknica
00050000-5646-050c-a62d-770ece36e441	5282	Cerkno
00050000-5646-050c-90e5-09649f1d9675	2236	Cerkvenjak
00050000-5646-050c-2554-74d43e24f78e	2215	Ceršak
00050000-5646-050c-1c3b-c704a6eae79a	2326	Cirkovce
00050000-5646-050c-6cce-d999df11edc1	2282	Cirkulane
00050000-5646-050c-9805-72efa55071df	5273	Col
00050000-5646-050c-6614-73e943fb78e3	8251	Čatež ob Savi
00050000-5646-050c-db0a-21e1d57c8c9d	1413	Čemšenik
00050000-5646-050c-9de9-4f7b603c455c	5253	Čepovan
00050000-5646-050c-4891-2cfeb62b1c59	9232	Črenšovci
00050000-5646-050c-a8a4-00e80125c5d0	2393	Črna na Koroškem
00050000-5646-050c-fd0c-f56243219a61	6275	Črni Kal
00050000-5646-050c-8d6a-2dff40b1861e	5274	Črni Vrh nad Idrijo
00050000-5646-050c-5801-d1b59b645ac7	5262	Črniče
00050000-5646-050c-585c-b3bcff273acc	8340	Črnomelj
00050000-5646-050c-4a11-70add4acab04	6271	Dekani
00050000-5646-050c-0048-3bb15cb15e79	5210	Deskle
00050000-5646-050c-c226-683113b370df	2253	Destrnik
00050000-5646-050c-3543-cf9251f10aa1	6215	Divača
00050000-5646-050c-789e-e7f670888f01	1233	Dob
00050000-5646-050c-9fcd-7a3f9800106f	3224	Dobje pri Planini
00050000-5646-050c-46ad-bed4925767a2	8257	Dobova
00050000-5646-050c-d85a-c18a53f8c96a	1423	Dobovec
00050000-5646-050c-d32f-ad7247d8738d	5263	Dobravlje
00050000-5646-050c-7370-326884ad7d46	3204	Dobrna
00050000-5646-050c-f138-f580b1ebb952	8211	Dobrnič
00050000-5646-050c-39f6-30db64485259	1356	Dobrova
00050000-5646-050c-c71f-87681547df93	9223	Dobrovnik/Dobronak 
00050000-5646-050c-46f5-1f48290de2a2	5212	Dobrovo v Brdih
00050000-5646-050c-1ed7-0fb24d802d6f	1431	Dol pri Hrastniku
00050000-5646-050c-cf16-445476f96f1a	1262	Dol pri Ljubljani
00050000-5646-050c-f458-c6fe27b68f2c	1273	Dole pri Litiji
00050000-5646-050c-943b-30c3d547424a	1331	Dolenja vas
00050000-5646-050c-6787-025caf6bffc4	8350	Dolenjske Toplice
00050000-5646-050c-3242-72a123a1daf8	1230	Domžale
00050000-5646-050c-e334-5feb48024871	2252	Dornava
00050000-5646-050c-e979-e70adaa3063e	5294	Dornberk
00050000-5646-050c-c808-982a93795270	1319	Draga
00050000-5646-050c-5d5a-d447b3b18ce4	8343	Dragatuš
00050000-5646-050c-b728-45cb181eb725	3222	Dramlje
00050000-5646-050c-8036-aedba43a38a8	2370	Dravograd
00050000-5646-050c-93b8-3e45032e14c0	4203	Duplje
00050000-5646-050c-6da8-7333feda9074	6221	Dutovlje
00050000-5646-050c-911e-4735aaa32521	8361	Dvor
00050000-5646-050c-564a-be1b62b60ec7	2343	Fala
00050000-5646-050c-a076-a58453693e75	9208	Fokovci
00050000-5646-050c-9fe0-f801575e2ae9	2313	Fram
00050000-5646-050c-57a3-b967607e5962	3213	Frankolovo
00050000-5646-050c-5b00-f8267f7c6f33	1274	Gabrovka
00050000-5646-050c-effc-8413636a90b8	8254	Globoko
00050000-5646-050c-c1f3-f28cf0367d8a	5275	Godovič
00050000-5646-050c-e5ae-b15193d140dc	4204	Golnik
00050000-5646-050c-7bd9-e13fea7f63a7	3303	Gomilsko
00050000-5646-050c-2885-11f5d02c6bc0	4224	Gorenja vas
00050000-5646-050c-c56d-c88a84c15e4b	3263	Gorica pri Slivnici
00050000-5646-050c-3f0d-b909f1e7c684	2272	Gorišnica
00050000-5646-050c-f326-44b4f6257801	9250	Gornja Radgona
00050000-5646-050c-b0a3-7e910241632c	3342	Gornji Grad
00050000-5646-050c-38fd-71cf014b595f	4282	Gozd Martuljek
00050000-5646-050c-9052-cd4bd78aefb9	6272	Gračišče
00050000-5646-050c-fede-e21ba7e4c0af	9264	Grad
00050000-5646-050c-f0dc-dc64682a281e	8332	Gradac
00050000-5646-050c-2cf7-b2d6bf82afe5	1384	Grahovo
00050000-5646-050c-1386-ad5305ce1a3f	5242	Grahovo ob Bači
00050000-5646-050c-65b9-e3c96373c658	5251	Grgar
00050000-5646-050c-3a81-5207fb4946f9	3302	Griže
00050000-5646-050c-f01d-daee44639055	3231	Grobelno
00050000-5646-050c-d154-5268cf8f0e1a	1290	Grosuplje
00050000-5646-050c-5428-124aa823f555	2288	Hajdina
00050000-5646-050c-0f88-0819a92d0a2f	8362	Hinje
00050000-5646-050c-83d7-d0868ebdc5ed	2311	Hoče
00050000-5646-050c-3c9a-ae530a38cb00	9205	Hodoš/Hodos
00050000-5646-050c-60f6-99543225c173	1354	Horjul
00050000-5646-050c-0e0f-cdef3d5fe036	1372	Hotedršica
00050000-5646-050c-b7d8-1b4ccd0cc84b	1430	Hrastnik
00050000-5646-050c-14c5-f80a38e62efe	6225	Hruševje
00050000-5646-050c-478a-66eae939f7b1	4276	Hrušica
00050000-5646-050c-6584-571751ed4dee	5280	Idrija
00050000-5646-050c-9480-be5eaa13a14f	1292	Ig
00050000-5646-050c-1503-e11214d75de4	6250	Ilirska Bistrica
00050000-5646-050c-f69c-828effc04fa3	6251	Ilirska Bistrica-Trnovo
00050000-5646-050c-a55d-d522a2dc1db8	1295	Ivančna Gorica
00050000-5646-050c-994f-1b02772d1007	2259	Ivanjkovci
00050000-5646-050c-dd97-f1c832f31d6a	1411	Izlake
00050000-5646-050c-d0d1-dc5d34dab566	6310	Izola/Isola
00050000-5646-050c-fe8b-461f66380c7b	2222	Jakobski Dol
00050000-5646-050c-a775-54860e6bb575	2221	Jarenina
00050000-5646-050c-5acd-e9730ae2d32b	6254	Jelšane
00050000-5646-050c-b9ef-2419deca1283	4270	Jesenice
00050000-5646-050c-139b-15a843658d56	8261	Jesenice na Dolenjskem
00050000-5646-050c-ad59-e029e6336a37	3273	Jurklošter
00050000-5646-050c-bdf7-c431d765641d	2223	Jurovski Dol
00050000-5646-050c-fa44-3cbb428df539	2256	Juršinci
00050000-5646-050c-21ff-db39cba4c0cb	5214	Kal nad Kanalom
00050000-5646-050c-232d-17082924c25b	3233	Kalobje
00050000-5646-050c-3ede-2ee77dd17865	4246	Kamna Gorica
00050000-5646-050c-3ed5-7ae477a694d6	2351	Kamnica
00050000-5646-050c-34ee-b8945eecd1b7	1241	Kamnik
00050000-5646-050c-410f-8a51787c4ab9	5213	Kanal
00050000-5646-050c-915c-52c58c151ea4	8258	Kapele
00050000-5646-050c-8b0f-496c2882315c	2362	Kapla
00050000-5646-050c-c616-9de72c102074	2325	Kidričevo
00050000-5646-050c-4b41-d0967140ed82	1412	Kisovec
00050000-5646-050c-7d0f-731e5c5e6959	6253	Knežak
00050000-5646-050c-f2e0-77b07971b65c	5222	Kobarid
00050000-5646-050c-03fc-693a8a0e3a1d	9227	Kobilje
00050000-5646-050c-1f33-648c8bbb3938	1330	Kočevje
00050000-5646-050c-2ac0-70d0d46ea922	1338	Kočevska Reka
00050000-5646-050c-8a6c-6c6e676ae64b	2276	Kog
00050000-5646-050c-8b25-e88a89689626	5211	Kojsko
00050000-5646-050c-770f-c59dfd93eb9d	6223	Komen
00050000-5646-050c-ac56-6d764191a0ec	1218	Komenda
00050000-5646-050c-42a5-38e0d3f2cb20	6000	Koper/Capodistria 
00050000-5646-050c-5710-2b8561655763	6001	Koper/Capodistria - poštni predali
00050000-5646-050c-4114-6ad0703c68ff	8282	Koprivnica
00050000-5646-050c-c483-a7f195c8c77b	5296	Kostanjevica na Krasu
00050000-5646-050c-76c2-c65f35018f36	8311	Kostanjevica na Krki
00050000-5646-050c-688b-714412d77e45	1336	Kostel
00050000-5646-050c-b1cb-c2e140c5b711	6256	Košana
00050000-5646-050c-4bdf-76abe274e265	2394	Kotlje
00050000-5646-050c-61ab-bcb54aff4759	6240	Kozina
00050000-5646-050c-606d-339ade9a0b7f	3260	Kozje
00050000-5646-050c-bf7a-2ca3630217f1	4000	Kranj 
00050000-5646-050c-9199-2f1886c2752b	4001	Kranj - poštni predali
00050000-5646-050c-8aed-7435d6e07306	4280	Kranjska Gora
00050000-5646-050c-a4d0-87494fe5981d	1281	Kresnice
00050000-5646-050c-17b5-76a40551efcb	4294	Križe
00050000-5646-050c-e336-c5ec1efdcfc8	9206	Križevci
00050000-5646-050c-6ec0-823dcfe0578f	9242	Križevci pri Ljutomeru
00050000-5646-050c-e2d1-53b9476334c0	1301	Krka
00050000-5646-050c-8307-d7b08d2afa30	8296	Krmelj
00050000-5646-050c-bd62-9fc05193de2f	4245	Kropa
00050000-5646-050c-d92c-90e30808af71	8262	Krška vas
00050000-5646-050c-4faf-0fa106f42476	8270	Krško
00050000-5646-050c-711f-50086c37281c	9263	Kuzma
00050000-5646-050c-fbf7-ce9193fdf305	2318	Laporje
00050000-5646-050c-1c42-4c710963e119	3270	Laško
00050000-5646-050c-ac45-e1553cf43663	1219	Laze v Tuhinju
00050000-5646-050c-b20e-32fe2a55bc21	2230	Lenart v Slovenskih goricah
00050000-5646-050c-4b55-a01afa9b3c4a	9220	Lendava/Lendva
00050000-5646-050c-e9d7-48365fc51b94	4248	Lesce
00050000-5646-050c-86f0-58d8126a3fc0	3261	Lesično
00050000-5646-050c-a129-aff9da2620f5	8273	Leskovec pri Krškem
00050000-5646-050c-55d0-7d79943939c0	2372	Libeliče
00050000-5646-050c-0f2e-82704e7ac0d0	2341	Limbuš
00050000-5646-050c-b3d5-8321bebecc2e	1270	Litija
00050000-5646-050c-b8c6-6036f9a07f8d	3202	Ljubečna
00050000-5646-050c-120a-7d1ce039ebb4	1000	Ljubljana 
00050000-5646-050c-c95b-cfe86d67f2a9	1001	Ljubljana - poštni predali
00050000-5646-050c-61b0-ab56ec4e5a4b	1231	Ljubljana - Črnuče
00050000-5646-050c-5e5e-7afc25696e31	1261	Ljubljana - Dobrunje
00050000-5646-050c-d97c-5ef9a05d0ffe	1260	Ljubljana - Polje
00050000-5646-050c-071c-49e8c89e4383	1210	Ljubljana - Šentvid
00050000-5646-050c-8a75-f98550307430	1211	Ljubljana - Šmartno
00050000-5646-050c-1380-566274bba646	3333	Ljubno ob Savinji
00050000-5646-050c-371f-015dbf0e8e16	9240	Ljutomer
00050000-5646-050c-8312-d59226263e78	3215	Loče
00050000-5646-050c-c50b-33cbbee9a96c	5231	Log pod Mangartom
00050000-5646-050c-5039-d4701e9be63e	1358	Log pri Brezovici
00050000-5646-050c-af92-45f29a63e01b	1370	Logatec
00050000-5646-050c-4762-ce000c592a65	1371	Logatec
00050000-5646-050c-36cb-6d050a379510	1434	Loka pri Zidanem Mostu
00050000-5646-050c-c832-58ac8f1eefce	3223	Loka pri Žusmu
00050000-5646-050c-c375-d82afedfa856	6219	Lokev
00050000-5646-050c-191d-2ee3ee36df83	1318	Loški Potok
00050000-5646-050c-9c39-37a25e5ed87c	2324	Lovrenc na Dravskem polju
00050000-5646-050c-c278-69761ba8e4c5	2344	Lovrenc na Pohorju
00050000-5646-050c-448f-85fc54842c16	3334	Luče
00050000-5646-050c-68c6-df5cd038b442	1225	Lukovica
00050000-5646-050c-1684-380ec9f108be	9202	Mačkovci
00050000-5646-050c-ca5d-067331b1fc7c	2322	Majšperk
00050000-5646-050c-483a-67eb02f69a7d	2321	Makole
00050000-5646-050c-f39a-de24546d62fd	9243	Mala Nedelja
00050000-5646-050c-195c-9cd11119f2a9	2229	Malečnik
00050000-5646-050c-c114-be45ed95bfca	6273	Marezige
00050000-5646-050c-6656-2fd1c2fb1820	2000	Maribor 
00050000-5646-050c-393c-f72083ac691b	2001	Maribor - poštni predali
00050000-5646-050c-3bb0-ed010a374b05	2206	Marjeta na Dravskem polju
00050000-5646-050c-4c5b-4f8bee7d39ac	2281	Markovci
00050000-5646-050c-6ff8-a6246c14b4bf	9221	Martjanci
00050000-5646-050c-729d-e4150dc3f24a	6242	Materija
00050000-5646-050c-a17c-a860bee26d03	4211	Mavčiče
00050000-5646-050c-1450-3f0804054e1c	1215	Medvode
00050000-5646-050c-db73-c802086358f3	1234	Mengeš
00050000-5646-050c-c485-fbcd42b86b14	8330	Metlika
00050000-5646-050c-8dcd-a5de41c20554	2392	Mežica
00050000-5646-050c-accc-a2710e1df841	2204	Miklavž na Dravskem polju
00050000-5646-050c-a974-22d1cbc6d08f	2275	Miklavž pri Ormožu
00050000-5646-050c-787a-55f9264f36cc	5291	Miren
00050000-5646-050c-504b-c4f5844cd411	8233	Mirna
00050000-5646-050c-861c-99393deb026a	8216	Mirna Peč
00050000-5646-050c-c231-b3cf0a795af8	2382	Mislinja
00050000-5646-050c-b195-06335abcc3f1	4281	Mojstrana
00050000-5646-050c-81ff-3ff91ac71a5d	8230	Mokronog
00050000-5646-050c-6b60-8877d62a5cc2	1251	Moravče
00050000-5646-050c-c636-d72acc81b4e5	9226	Moravske Toplice
00050000-5646-050c-6cb8-2860c06d9227	5216	Most na Soči
00050000-5646-050c-6a85-fd42e59c2e85	1221	Motnik
00050000-5646-050c-a797-878f947d81ff	3330	Mozirje
00050000-5646-050c-31df-8b46dc120c8b	9000	Murska Sobota 
00050000-5646-050c-9d35-ddd0228c9656	9001	Murska Sobota - poštni predali
00050000-5646-050c-ca3e-8c4554d252ba	2366	Muta
00050000-5646-050c-04d0-fbafd5766bf4	4202	Naklo
00050000-5646-050c-e62e-53f0b94bf17a	3331	Nazarje
00050000-5646-050c-1eb9-5b544cd8e5a0	1357	Notranje Gorice
00050000-5646-050c-e1c1-67ede3b9a95a	3203	Nova Cerkev
00050000-5646-050c-5f0d-c2e1b4492239	5000	Nova Gorica 
00050000-5646-050c-b71a-f63e671cc532	5001	Nova Gorica - poštni predali
00050000-5646-050c-d623-82cededaf9a6	1385	Nova vas
00050000-5646-050c-6ef0-9a0125c47c3d	8000	Novo mesto
00050000-5646-050c-de9a-8671ccfba24b	8001	Novo mesto - poštni predali
00050000-5646-050c-2066-bd00a0aa8eb9	6243	Obrov
00050000-5646-050c-edfe-7929df394ef4	9233	Odranci
00050000-5646-050c-beec-825b052097ca	2317	Oplotnica
00050000-5646-050c-1b7a-8d7e0b9d70ca	2312	Orehova vas
00050000-5646-050c-65b5-8e89b7eed586	2270	Ormož
00050000-5646-050c-5481-177efd63497b	1316	Ortnek
00050000-5646-050c-8fa4-716e4bdb5e8f	1337	Osilnica
00050000-5646-050c-76d8-227f8cb435d6	8222	Otočec
00050000-5646-050c-edfe-3d8a990e1a2e	2361	Ožbalt
00050000-5646-050c-e283-2cd64d8ff70c	2231	Pernica
00050000-5646-050c-3475-48a6d5d1beae	2211	Pesnica pri Mariboru
00050000-5646-050c-a2c8-b0ecd6251f13	9203	Petrovci
00050000-5646-050c-34e4-808171176602	3301	Petrovče
00050000-5646-050c-0dbf-7fd7532a469c	6330	Piran/Pirano
00050000-5646-050c-d476-ad3dbbef9b08	8255	Pišece
00050000-5646-050c-45b3-dd9c460a174a	6257	Pivka
00050000-5646-050c-a092-bce3e58e3c71	6232	Planina
00050000-5646-050c-a32c-563eac0da85e	3225	Planina pri Sevnici
00050000-5646-050c-386a-1530cff84a27	6276	Pobegi
00050000-5646-050c-d8f9-9a469bb8e502	8312	Podbočje
00050000-5646-050c-4263-aa40a7758cac	5243	Podbrdo
00050000-5646-050c-c9ba-f5a05e0bfcc1	3254	Podčetrtek
00050000-5646-050c-4066-4883b65beb09	2273	Podgorci
00050000-5646-050c-82ea-ad904b7d13c8	6216	Podgorje
00050000-5646-050c-c081-f317fed3ebb2	2381	Podgorje pri Slovenj Gradcu
00050000-5646-050c-c3e3-abfc33f2afdf	6244	Podgrad
00050000-5646-050c-58a7-0e899326607f	1414	Podkum
00050000-5646-050c-9a80-83e83aae13d9	2286	Podlehnik
00050000-5646-050c-8228-6daae77e2c73	5272	Podnanos
00050000-5646-050c-4d32-c5e7e90afd15	4244	Podnart
00050000-5646-050c-df70-a6dfdee412f1	3241	Podplat
00050000-5646-050c-7270-c41e3704fccc	3257	Podsreda
00050000-5646-050c-99f1-84a8458e81e1	2363	Podvelka
00050000-5646-050c-5bd7-ef2fec424871	2208	Pohorje
00050000-5646-050c-e7e0-96650313cc2b	2257	Polenšak
00050000-5646-050c-0990-8ab0d3e20c40	1355	Polhov Gradec
00050000-5646-050c-65d8-653fb0863cb5	4223	Poljane nad Škofjo Loko
00050000-5646-050c-a557-a4273c531b09	2319	Poljčane
00050000-5646-050c-a86e-462bf0575add	1272	Polšnik
00050000-5646-050c-97ad-18087b0a0a19	3313	Polzela
00050000-5646-050c-eabe-fb3fa95d51a6	3232	Ponikva
00050000-5646-050c-ca31-5d4e8f6c6e2b	6320	Portorož/Portorose
00050000-5646-050c-0f36-22c99541442b	6230	Postojna
00050000-5646-050c-9fca-0bc18c58d3e1	2331	Pragersko
00050000-5646-050c-9333-7b3e4e269a48	3312	Prebold
00050000-5646-050c-2678-228e8cd3e314	4205	Preddvor
00050000-5646-050c-f8d0-31bcce61621b	6255	Prem
00050000-5646-050c-fc3f-5b374d1c4f73	1352	Preserje
00050000-5646-050c-09eb-cb79aafa3c58	6258	Prestranek
00050000-5646-050c-50de-8792c6a02711	2391	Prevalje
00050000-5646-050c-fcdf-5e4a855e292e	3262	Prevorje
00050000-5646-050c-ebe6-15b5f1118e9b	1276	Primskovo 
00050000-5646-050c-f3ba-d4d0df4437f3	3253	Pristava pri Mestinju
00050000-5646-050c-9a1d-540167732756	9207	Prosenjakovci/Partosfalva
00050000-5646-050c-8c0c-3d5426825a14	5297	Prvačina
00050000-5646-050c-cc88-35a6fc9b8cbf	2250	Ptuj
00050000-5646-050c-8da2-95d0d634d64c	2323	Ptujska Gora
00050000-5646-050c-c846-5e2f47761c55	9201	Puconci
00050000-5646-050c-1d0b-408c750d1b9f	2327	Rače
00050000-5646-050c-470e-6667b4dc6f2b	1433	Radeče
00050000-5646-050c-4fa1-5bcf9b86cc2b	9252	Radenci
00050000-5646-050c-60f5-1134cb7df7f6	2360	Radlje ob Dravi
00050000-5646-050c-0e38-9d1ae92a5607	1235	Radomlje
00050000-5646-050c-fd83-859c6d053483	4240	Radovljica
00050000-5646-050c-6c72-e25669574a57	8274	Raka
00050000-5646-050c-877b-f226bf089968	1381	Rakek
00050000-5646-050c-0648-33a963916471	4283	Rateče - Planica
00050000-5646-050c-2299-46a2cd2aa69f	2390	Ravne na Koroškem
00050000-5646-050c-3abb-7c7371ba7e90	9246	Razkrižje
00050000-5646-050c-c9ca-dc14052656c2	3332	Rečica ob Savinji
00050000-5646-050c-7093-feaf32990663	5292	Renče
00050000-5646-050c-1834-c38925f7613a	1310	Ribnica
00050000-5646-050c-5d41-861170e54629	2364	Ribnica na Pohorju
00050000-5646-050c-1596-e18e73945088	3272	Rimske Toplice
00050000-5646-050c-3746-babc80425e2d	1314	Rob
00050000-5646-050c-cff0-6bd5e3bac857	5215	Ročinj
00050000-5646-050c-ab30-c599bde21d4e	3250	Rogaška Slatina
00050000-5646-050c-600c-4b340f5ad9e7	9262	Rogašovci
00050000-5646-050c-02be-7760cb0aac10	3252	Rogatec
00050000-5646-050c-26c3-adcca77419e0	1373	Rovte
00050000-5646-050c-86d6-0035640b8e72	2342	Ruše
00050000-5646-050c-0584-0edad1f4ba28	1282	Sava
00050000-5646-050c-dea7-ec3839c156c2	6333	Sečovlje/Sicciole
00050000-5646-050c-5363-29932375fa62	4227	Selca
00050000-5646-050c-c5d9-a1f35cbc91a2	2352	Selnica ob Dravi
00050000-5646-050c-d769-c18b046bbb59	8333	Semič
00050000-5646-050c-2954-8fc5c90ca5e9	8281	Senovo
00050000-5646-050c-6ed7-544efd61ef15	6224	Senožeče
00050000-5646-050c-ebf8-03562c4b31a5	8290	Sevnica
00050000-5646-050c-e7cb-0fe1b54ef861	6210	Sežana
00050000-5646-050c-6da8-5eadf163f0dd	2214	Sladki Vrh
00050000-5646-050c-c52b-e81cf2613327	5283	Slap ob Idrijci
00050000-5646-050c-a28b-2cd519bb7707	2380	Slovenj Gradec
00050000-5646-050c-b53f-284de68d199e	2310	Slovenska Bistrica
00050000-5646-050c-560a-d670a608d17e	3210	Slovenske Konjice
00050000-5646-050c-c738-f3f6d20eb84c	1216	Smlednik
00050000-5646-050c-c0f6-76838be456ca	5232	Soča
00050000-5646-050c-baf6-d9fd7ed5ca45	1317	Sodražica
00050000-5646-050c-0df3-bb34b096f4a9	3335	Solčava
00050000-5646-050c-027e-6af623824414	5250	Solkan
00050000-5646-050c-2284-c9e4afbb003b	4229	Sorica
00050000-5646-050c-280f-eadbe63db258	4225	Sovodenj
00050000-5646-050c-4cbf-54fd04deb3da	5281	Spodnja Idrija
00050000-5646-050c-71bb-2561e36c509c	2241	Spodnji Duplek
00050000-5646-050c-6ed2-181fa9dd4571	9245	Spodnji Ivanjci
00050000-5646-050c-b9ae-4aad2bd01006	2277	Središče ob Dravi
00050000-5646-050c-6b10-9465d61e6416	4267	Srednja vas v Bohinju
00050000-5646-050c-3b3a-c7f46bd95f4e	8256	Sromlje 
00050000-5646-050c-5f87-3a9914d959dd	5224	Srpenica
00050000-5646-050c-449d-edc50676316a	1242	Stahovica
00050000-5646-050c-172f-8c64d65f0341	1332	Stara Cerkev
00050000-5646-050c-fd98-2fed1a06936e	8342	Stari trg ob Kolpi
00050000-5646-050c-d06c-eeff64c402af	1386	Stari trg pri Ložu
00050000-5646-050c-091f-f160d385b8c0	2205	Starše
00050000-5646-050c-99df-5cda2b5fe87e	2289	Stoperce
00050000-5646-050c-e151-0be120d35143	8322	Stopiče
00050000-5646-050c-1874-e3737ff14b69	3206	Stranice
00050000-5646-050c-25ae-cb59045d1eda	8351	Straža
00050000-5646-050c-a503-4b6dd7fa961d	1313	Struge
00050000-5646-050c-63bb-f7e422eb43dc	8293	Studenec
00050000-5646-050c-2770-d9c9535fd225	8331	Suhor
00050000-5646-050c-55a2-c41b7dd0bd76	2233	Sv. Ana v Slovenskih goricah
00050000-5646-050c-609b-16644b11a568	2235	Sv. Trojica v Slovenskih goricah
00050000-5646-050c-f21a-dade3cabc1a3	2353	Sveti Duh na Ostrem Vrhu
00050000-5646-050c-8415-5cb7431272be	9244	Sveti Jurij ob Ščavnici
00050000-5646-050c-b953-02df86709394	3264	Sveti Štefan
00050000-5646-050c-d2e7-0bce819f2a8a	2258	Sveti Tomaž
00050000-5646-050c-90f2-fb027476381b	9204	Šalovci
00050000-5646-050c-42dc-1acdf3726303	5261	Šempas
00050000-5646-050c-a1d6-b55cd418f39d	5290	Šempeter pri Gorici
00050000-5646-050c-c5e0-edc663ad8e60	3311	Šempeter v Savinjski dolini
00050000-5646-050c-8207-1fcdc7638a0d	4208	Šenčur
00050000-5646-050c-20f1-155107220661	2212	Šentilj v Slovenskih goricah
00050000-5646-050c-8e7e-0e95d539b7db	8297	Šentjanž
00050000-5646-050c-0c57-c082ca23084d	2373	Šentjanž pri Dravogradu
00050000-5646-050c-6789-429fffe53035	8310	Šentjernej
00050000-5646-050c-7e6b-6ce40845aecb	3230	Šentjur
00050000-5646-050c-9ad2-8fb187e3b512	3271	Šentrupert
00050000-5646-050c-338b-6cb96d384bbd	8232	Šentrupert
00050000-5646-050c-3d57-ae12a749405d	1296	Šentvid pri Stični
00050000-5646-050c-3b5e-f3af382b337f	8275	Škocjan
00050000-5646-050c-06e5-3386b5e6f0e9	6281	Škofije
00050000-5646-050c-1d4f-0ffcfc8aa052	4220	Škofja Loka
00050000-5646-050c-7a5b-8aff7b1e9e8c	3211	Škofja vas
00050000-5646-050c-a461-d8f02617f387	1291	Škofljica
00050000-5646-050c-bdc4-665df3758ec0	6274	Šmarje
00050000-5646-050c-078b-8ec1ff5ff9f5	1293	Šmarje - Sap
00050000-5646-050c-0c6b-ebed381b429c	3240	Šmarje pri Jelšah
00050000-5646-050c-6e9f-07dcdf5f8177	8220	Šmarješke Toplice
00050000-5646-050c-ae6f-64a02567927e	2315	Šmartno na Pohorju
00050000-5646-050c-2be7-6f1017beb5da	3341	Šmartno ob Dreti
00050000-5646-050c-a90a-95e9edd407dd	3327	Šmartno ob Paki
00050000-5646-050c-0f44-ba97bb4d3d5a	1275	Šmartno pri Litiji
00050000-5646-050c-c6e9-c172580909d9	2383	Šmartno pri Slovenj Gradcu
00050000-5646-050c-05ae-ac8bf4c30da7	3201	Šmartno v Rožni dolini
00050000-5646-050c-1e24-7a4fed245219	3325	Šoštanj
00050000-5646-050c-d7f6-d2a0a40cf6b5	6222	Štanjel
00050000-5646-050c-ca0a-10b0062edb2a	3220	Štore
00050000-5646-050c-1377-d104972f2b83	3304	Tabor
00050000-5646-050c-08dd-88a87e38ca0e	3221	Teharje
00050000-5646-050c-d82d-e6e583988ae9	9251	Tišina
00050000-5646-050c-79af-86c7aab175c3	5220	Tolmin
00050000-5646-050c-4e2d-36f650e1046c	3326	Topolšica
00050000-5646-050c-af60-f74cc50ad996	2371	Trbonje
00050000-5646-050c-5698-7829ff5b4e39	1420	Trbovlje
00050000-5646-050c-5d99-744cddd57153	8231	Trebelno 
00050000-5646-050c-a6a0-e3d954fea704	8210	Trebnje
00050000-5646-050c-26d3-65304a284871	5252	Trnovo pri Gorici
00050000-5646-050c-5eb9-a48515d15ef9	2254	Trnovska vas
00050000-5646-050c-a84a-30d419edc0fb	1222	Trojane
00050000-5646-050c-7a3f-d8bed7972d41	1236	Trzin
00050000-5646-050c-e4ba-fbbe48796dc1	4290	Tržič
00050000-5646-050c-6815-776c01f71d78	8295	Tržišče
00050000-5646-050c-b4e0-57de6c05fc03	1311	Turjak
00050000-5646-050c-ea31-c1601c5b2cef	9224	Turnišče
00050000-5646-050c-c041-1699f282d90c	8323	Uršna sela
00050000-5646-050c-104a-417bf96353ef	1252	Vače
00050000-5646-050c-a2a4-af27227ef032	3320	Velenje 
00050000-5646-050c-016d-de15ca0c04dd	3322	Velenje - poštni predali
00050000-5646-050c-724a-428b09fbc5d2	8212	Velika Loka
00050000-5646-050c-d497-d2719a91f871	2274	Velika Nedelja
00050000-5646-050c-b879-f033c25eb1a4	9225	Velika Polana
00050000-5646-050c-e813-db5ecee3f662	1315	Velike Lašče
00050000-5646-050c-17d6-85aea9276dd4	8213	Veliki Gaber
00050000-5646-050c-09fd-981ce020958d	9241	Veržej
00050000-5646-050c-8640-008071481be5	1312	Videm - Dobrepolje
00050000-5646-050c-273a-a0215df8e300	2284	Videm pri Ptuju
00050000-5646-050c-703e-bd42e46b70d1	8344	Vinica
00050000-5646-050c-d9b2-a61075d128ce	5271	Vipava
00050000-5646-050c-735e-b1268a127713	4212	Visoko
00050000-5646-050c-8f81-0570a863d3f5	1294	Višnja Gora
00050000-5646-050c-73d4-c32a40613c1f	3205	Vitanje
00050000-5646-050c-0b49-af2171d9d5c8	2255	Vitomarci
00050000-5646-050c-9fe3-29df84ade690	1217	Vodice
00050000-5646-050c-b109-1e7134fb3527	3212	Vojnik\t
00050000-5646-050c-c662-beceee78a1de	5293	Volčja Draga
00050000-5646-050c-7d53-65b6e07913d3	2232	Voličina
00050000-5646-050c-31ed-61bf47a610e0	3305	Vransko
00050000-5646-050c-ff90-ac56678aa585	6217	Vremski Britof
00050000-5646-050c-3829-1580993abc6e	1360	Vrhnika
00050000-5646-050c-e055-fe100a5f5899	2365	Vuhred
00050000-5646-050c-68f8-0ac7ba335ca1	2367	Vuzenica
00050000-5646-050c-0dda-ca69726cabcf	8292	Zabukovje 
00050000-5646-050c-ce62-da35e7a07e71	1410	Zagorje ob Savi
00050000-5646-050c-fa15-8c91b4b85655	1303	Zagradec
00050000-5646-050c-4a47-2116e95bbf4c	2283	Zavrč
00050000-5646-050c-1cb7-1514f71a5600	8272	Zdole 
00050000-5646-050c-def2-9a84e7b41e9e	4201	Zgornja Besnica
00050000-5646-050c-08d1-5854e2f7b3a6	2242	Zgornja Korena
00050000-5646-050c-b51d-aabb15f4739a	2201	Zgornja Kungota
00050000-5646-050c-c71c-34c41d0b9546	2316	Zgornja Ložnica
00050000-5646-050c-31b4-9c33e5b65c83	2314	Zgornja Polskava
00050000-5646-050c-9eae-0eeacc663f6c	2213	Zgornja Velka
00050000-5646-050c-0a3b-473423059d97	4247	Zgornje Gorje
00050000-5646-050c-50bf-0b0164909594	4206	Zgornje Jezersko
00050000-5646-050c-7ef5-54c165e04a78	2285	Zgornji Leskovec
00050000-5646-050c-1829-443e6589b645	1432	Zidani Most
00050000-5646-050c-9ea4-0d00021b87f4	3214	Zreče
00050000-5646-050c-7522-460e60ae63d9	4209	Žabnica
00050000-5646-050c-fcbd-33567830279a	3310	Žalec
00050000-5646-050c-9088-64424c2b2816	4228	Železniki
00050000-5646-050c-b24a-76b6c6e5dc47	2287	Žetale
00050000-5646-050c-2fe2-976e4f5d3f3c	4226	Žiri
00050000-5646-050c-1a5c-ed15f1aa2dfc	4274	Žirovnica
00050000-5646-050c-9ac3-dde71b9f1e35	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 26862998)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 26862574)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 26862322)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5646-050f-7e97-5cd63f1fff4a	00080000-5646-050e-217f-e9e80d0acc6b	\N	00040000-5646-050c-e401-8a5543419ba6	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5646-050f-b149-e1b08d3faf18	00080000-5646-050e-217f-e9e80d0acc6b	\N	00040000-5646-050c-e401-8a5543419ba6	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5646-050f-a076-6cefc254a63a	00080000-5646-050e-6f24-833cdea3277e	\N	00040000-5646-050c-e401-8a5543419ba6	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 26862466)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5646-050c-3e00-c08413d6dd4c	novo leto	1	1	\N	t
00430000-5646-050c-9281-e31b03e57f64	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5646-050c-0c12-c8647e17a800	dan upora proti okupatorju	27	4	\N	t
00430000-5646-050c-4927-5e134d856fd5	praznik dela	1	5	\N	t
00430000-5646-050c-4c1d-73ac3a7b849b	praznik dela	2	5	\N	t
00430000-5646-050c-7d6a-ad4309be331d	dan Primoža Trubarja	8	6	\N	f
00430000-5646-050c-12d3-7185dc3e21af	dan državnosti	25	6	\N	t
00430000-5646-050c-c76b-57c7967e9b14	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5646-050c-03c6-c57bbdd48da4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5646-050c-1da3-1088624384e7	dan suverenosti	25	10	\N	f
00430000-5646-050c-62e8-09fd744b7890	dan spomina na mrtve	1	11	\N	t
00430000-5646-050c-4cd6-8567080eac4f	dan Rudolfa Maistra	23	11	\N	f
00430000-5646-050c-fc22-74c7f27210aa	božič	25	12	\N	t
00430000-5646-050c-19ac-e7b3b8a1761f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5646-050d-a3da-b7f9156ca5cd	Marijino vnebovzetje	15	8	\N	t
00430000-5646-050d-2e77-3fe355880ae8	dan reformacije	31	10	\N	t
00430000-5646-050d-970d-ab953fe434b9	velikonočna nedelja	27	3	2016	t
00430000-5646-050d-5ec3-937ed9f863a1	velikonočna nedelja	16	4	2017	t
00430000-5646-050d-a820-c8fcb2b5ede0	velikonočna nedelja	1	4	2018	t
00430000-5646-050d-dbeb-882c82c4a0bc	velikonočna nedelja	21	4	2019	t
00430000-5646-050d-09fc-b25add775149	velikonočna nedelja	12	4	2020	t
00430000-5646-050d-9b0d-408b157db773	velikonočna nedelja	4	4	2021	t
00430000-5646-050d-98da-564d46ee5c50	velikonočna nedelja	17	4	2022	t
00430000-5646-050d-0a74-0c91ab88e27c	velikonočna nedelja	9	4	2023	t
00430000-5646-050d-ab5d-99f2330075d5	velikonočna nedelja	31	3	2024	t
00430000-5646-050d-cf4c-4132fa9a240d	velikonočna nedelja	20	4	2025	t
00430000-5646-050d-df88-5fc116c20dc9	velikonočna nedelja	5	4	2026	t
00430000-5646-050d-e403-66ea7358d735	velikonočna nedelja	28	3	2027	t
00430000-5646-050d-d854-3bd127ea9e20	velikonočna nedelja	16	4	2028	t
00430000-5646-050d-c3ca-d787ff516f53	velikonočna nedelja	1	4	2029	t
00430000-5646-050d-091b-c340578027de	velikonočna nedelja	21	4	2030	t
00430000-5646-050d-a59a-e694b42292e3	velikonočni ponedeljek	28	3	2016	t
00430000-5646-050d-af03-e489596e7532	velikonočni ponedeljek	17	4	2017	t
00430000-5646-050d-91e6-31a9874cbd8e	velikonočni ponedeljek	2	4	2018	t
00430000-5646-050d-d60c-033537b8fd38	velikonočni ponedeljek	22	4	2019	t
00430000-5646-050d-c19b-9800a87797bf	velikonočni ponedeljek	13	4	2020	t
00430000-5646-050d-3b2c-57685b03dc4b	velikonočni ponedeljek	5	4	2021	t
00430000-5646-050d-0b7c-ef4e310388cb	velikonočni ponedeljek	18	4	2022	t
00430000-5646-050d-8fab-654287163835	velikonočni ponedeljek	10	4	2023	t
00430000-5646-050d-2a39-de5aecd86b83	velikonočni ponedeljek	1	4	2024	t
00430000-5646-050d-9c01-5068eda5ad3f	velikonočni ponedeljek	21	4	2025	t
00430000-5646-050d-724a-6b86e301a7c2	velikonočni ponedeljek	6	4	2026	t
00430000-5646-050d-96e9-e2d93344f10d	velikonočni ponedeljek	29	3	2027	t
00430000-5646-050d-8df7-769c804bdb3f	velikonočni ponedeljek	17	4	2028	t
00430000-5646-050d-e8c3-cc03ca0decac	velikonočni ponedeljek	2	4	2029	t
00430000-5646-050d-b393-779f66a9efb3	velikonočni ponedeljek	22	4	2030	t
00430000-5646-050d-d813-7d17d869bebb	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5646-050d-a4fc-f013a0d2ab0a	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5646-050d-8b03-37fcfd00f528	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5646-050d-5f8e-58aeb356ef68	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5646-050d-b395-b76bac282fb1	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5646-050d-c74b-a1f793027266	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5646-050d-b6b4-319403ad9fb2	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5646-050d-7d91-bfdf0b043e88	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5646-050d-1d82-042d386ddded	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5646-050d-c7a7-1fe54330caf7	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5646-050d-7f28-75dc6fdd6c57	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5646-050d-7d43-bf68090acc08	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5646-050d-cc4b-f9846a037294	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5646-050d-d723-2fba14fd4c00	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5646-050d-dedf-a1cefedee1c3	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 26862426)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 26862438)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 26862586)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 26863012)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 26863022)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5646-050f-5885-deb3faad5350	00080000-5646-050e-f065-491aa398285d	0987	AK
00190000-5646-050f-2f79-446e719143d8	00080000-5646-050e-6f24-833cdea3277e	0989	AK
00190000-5646-050f-c867-e7d3ac412cc8	00080000-5646-050e-3a2e-4be2a808da0a	0986	AK
00190000-5646-050f-4c7d-53ee8d951adf	00080000-5646-050e-23ca-a910638a4602	0984	AK
00190000-5646-050f-68ab-9a6aa410ae7c	00080000-5646-050e-2bb3-6d8321f0a9aa	0983	AK
00190000-5646-050f-87d2-0d881fa1a9a7	00080000-5646-050e-cac2-532347b9161c	0982	AK
00190000-5646-0510-6ce9-edf5be4de976	00080000-5646-0510-cdfa-04e7b6e5286b	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 26862921)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5646-050f-48bb-cbd6c7d586e5	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 26863030)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 26862615)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5646-050e-066a-96123ae33650	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5646-050e-72de-835c944c5e5c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5646-050e-322d-4112c1ca4f5b	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5646-050e-576b-fc882f0c7c67	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5646-050e-7c7f-adef37cf734d	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5646-050e-adb1-6d42db2775aa	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5646-050e-ac34-da78ca762c6f	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 26862559)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 26862549)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 26862760)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 26862690)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 26862400)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 26862162)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5646-0510-cdfa-04e7b6e5286b	00010000-5646-050d-e54e-13d9621577c6	2015-11-13 16:43:12	INS	a:0:{}
2	App\\Entity\\Option	00000000-5646-0510-8c39-9f9e7eb37d49	00010000-5646-050d-e54e-13d9621577c6	2015-11-13 16:43:12	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5646-0510-6ce9-edf5be4de976	00010000-5646-050d-e54e-13d9621577c6	2015-11-13 16:43:12	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 26862628)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 26862200)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5646-050d-c231-0286b1fa7e28	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5646-050d-71e3-6d97de400cb2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5646-050d-51f6-9dcc4525024f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5646-050d-a279-855e92a6eda9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5646-050d-9168-26759e79e820	planer	Planer dogodkov v koledarju	t
00020000-5646-050d-e061-ff9154715350	kadrovska	Kadrovska služba	t
00020000-5646-050d-63e6-bd101b440223	arhivar	Ažuriranje arhivalij	t
00020000-5646-050d-4240-6e16b19880a8	igralec	Igralec	t
00020000-5646-050d-9b54-7b6101bbb302	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5646-050e-b929-990228500770	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5646-050e-2e68-033618ebd302	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5646-050e-1439-2d41730626cd	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5646-050e-6586-bd8ea5bae482	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5646-050e-f677-161c61c74e7e	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5646-050e-db20-7d04a8a1bc12	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5646-050e-491e-1e37bd77118d	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5646-050e-7264-5412cd5f735b	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5646-050e-588a-1da8c47cffc0	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5646-050e-e382-9c70fc752a7e	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5646-050e-431c-b2767634962d	MapaAcl-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3099 (class 0 OID 26862184)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5646-050d-d800-1c2746b71403	00020000-5646-050d-51f6-9dcc4525024f
00010000-5646-050d-e54e-13d9621577c6	00020000-5646-050d-51f6-9dcc4525024f
00010000-5646-050e-c8ad-498ec51df9c3	00020000-5646-050e-b929-990228500770
00010000-5646-050e-1cb7-e21055670114	00020000-5646-050e-2e68-033618ebd302
00010000-5646-050e-1cb7-e21055670114	00020000-5646-050e-db20-7d04a8a1bc12
00010000-5646-050e-1cb7-e21055670114	00020000-5646-050e-e382-9c70fc752a7e
00010000-5646-050e-788a-277a212b3daa	00020000-5646-050e-1439-2d41730626cd
00010000-5646-050e-788a-277a212b3daa	00020000-5646-050e-491e-1e37bd77118d
00010000-5646-050e-788a-277a212b3daa	00020000-5646-050e-431c-b2767634962d
00010000-5646-050e-3cf6-4e1122583b2a	00020000-5646-050e-1439-2d41730626cd
00010000-5646-050e-3cf6-4e1122583b2a	00020000-5646-050e-491e-1e37bd77118d
00010000-5646-050e-3cf6-4e1122583b2a	00020000-5646-050e-588a-1da8c47cffc0
00010000-5646-050e-3cf6-4e1122583b2a	00020000-5646-050e-431c-b2767634962d
00010000-5646-050e-1ad8-27f23e67e857	00020000-5646-050e-1439-2d41730626cd
00010000-5646-050e-1ad8-27f23e67e857	00020000-5646-050e-6586-bd8ea5bae482
00010000-5646-050e-1ad8-27f23e67e857	00020000-5646-050e-491e-1e37bd77118d
00010000-5646-050e-1ad8-27f23e67e857	00020000-5646-050e-7264-5412cd5f735b
00010000-5646-050e-1ad8-27f23e67e857	00020000-5646-050e-588a-1da8c47cffc0
00010000-5646-050e-1ad8-27f23e67e857	00020000-5646-050e-db20-7d04a8a1bc12
00010000-5646-050e-1ad8-27f23e67e857	00020000-5646-050e-431c-b2767634962d
00010000-5646-050e-bdd7-457e818460a4	00020000-5646-050e-2e68-033618ebd302
00010000-5646-050e-bdd7-457e818460a4	00020000-5646-050e-f677-161c61c74e7e
00010000-5646-050e-bdd7-457e818460a4	00020000-5646-050e-db20-7d04a8a1bc12
00010000-5646-050e-bdd7-457e818460a4	00020000-5646-050e-e382-9c70fc752a7e
\.


--
-- TOC entry 3144 (class 0 OID 26862642)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 26862580)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 26862526)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5646-050e-1064-e5d4ed5c7b2b	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5646-050e-dddd-82df62e52e6b	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5646-050e-d648-1fd8eeec31c1	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 26862149)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5646-050c-44a7-a1d2709cd70d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5646-050c-7b34-89f2af05e8bb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5646-050c-eb12-ebda1d81a7bf	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5646-050c-9216-d55ab211e868	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5646-050c-988f-56083c13fc1b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 26862141)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5646-050c-2caf-6c63189f7453	00230000-5646-050c-9216-d55ab211e868	popa
00240000-5646-050c-9644-aed3ef7d0577	00230000-5646-050c-9216-d55ab211e868	oseba
00240000-5646-050c-dfab-7d5de7744fac	00230000-5646-050c-9216-d55ab211e868	tippopa
00240000-5646-050c-25e7-853c4ee6de6a	00230000-5646-050c-9216-d55ab211e868	organizacijskaenota
00240000-5646-050c-2154-42a7df08f985	00230000-5646-050c-9216-d55ab211e868	sezona
00240000-5646-050c-d041-3a2b9d062be9	00230000-5646-050c-9216-d55ab211e868	tipvaje
00240000-5646-050c-ed70-18bfee0d108c	00230000-5646-050c-7b34-89f2af05e8bb	prostor
00240000-5646-050c-ea6e-7efcc01d259b	00230000-5646-050c-9216-d55ab211e868	besedilo
00240000-5646-050c-34de-1c02f8f1ca9f	00230000-5646-050c-9216-d55ab211e868	uprizoritev
00240000-5646-050c-087b-a3c23fd3839c	00230000-5646-050c-9216-d55ab211e868	funkcija
00240000-5646-050c-75c3-933bef9eb8b2	00230000-5646-050c-9216-d55ab211e868	tipfunkcije
00240000-5646-050c-ead2-2eb46fb27a77	00230000-5646-050c-9216-d55ab211e868	alternacija
00240000-5646-050c-e0b7-0838e84a7309	00230000-5646-050c-44a7-a1d2709cd70d	pogodba
00240000-5646-050c-0a93-4a6082255ab7	00230000-5646-050c-9216-d55ab211e868	zaposlitev
00240000-5646-050c-bc89-9fe306f150d1	00230000-5646-050c-9216-d55ab211e868	zvrstuprizoritve
00240000-5646-050c-42e4-52ffb59d7ff0	00230000-5646-050c-44a7-a1d2709cd70d	programdela
00240000-5646-050c-7610-b731610149dd	00230000-5646-050c-9216-d55ab211e868	zapis
\.


--
-- TOC entry 3093 (class 0 OID 26862136)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
2c687a74-ac5c-4bdf-ad66-db5173132481	00240000-5646-050c-2caf-6c63189f7453	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 26862707)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5646-050f-3a3b-d297b509561d	000e0000-5646-050f-00fb-d55ee2d810e0	00080000-5646-050e-217f-e9e80d0acc6b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5646-050c-c4a6-3f26fa28ac37
00270000-5646-050f-cbc6-5bfcfe54a55d	000e0000-5646-050f-00fb-d55ee2d810e0	00080000-5646-050e-217f-e9e80d0acc6b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5646-050c-c4a6-3f26fa28ac37
\.


--
-- TOC entry 3109 (class 0 OID 26862284)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 26862536)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5646-050f-55dd-5abe97069011	00180000-5646-050f-bbe3-9b14eff53f11	000c0000-5646-050f-a0ca-ce931960177f	00090000-5646-050f-a082-69cf68e7671c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5646-050f-e209-c042fa32fc32	00180000-5646-050f-bbe3-9b14eff53f11	000c0000-5646-050f-915f-39aeed7f35a9	00090000-5646-050f-934a-5a828c89d725	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5646-050f-ff22-67ef51bf1629	00180000-5646-050f-bbe3-9b14eff53f11	000c0000-5646-050f-8665-49e114e3ad97	00090000-5646-050f-1b5e-3ecd646912d3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5646-050f-1856-72119441157a	00180000-5646-050f-bbe3-9b14eff53f11	000c0000-5646-050f-5353-6d87e251a406	00090000-5646-050f-7249-f812cc432789	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5646-050f-17f8-412e28ae55a4	00180000-5646-050f-bbe3-9b14eff53f11	000c0000-5646-050f-d3ea-f30f0441f926	00090000-5646-050f-91f3-7123332605b4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5646-050f-e6d5-586411731a77	00180000-5646-050f-f5b8-d9d09a87d124	\N	00090000-5646-050f-91f3-7123332605b4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5646-050f-f4c3-65c42eb22b9e	00180000-5646-050f-f5b8-d9d09a87d124	\N	00090000-5646-050f-934a-5a828c89d725	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 26862748)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5646-050c-5123-2b5753eb5da3	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5646-050c-e40c-5377991c8e69	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5646-050c-7eef-e2ec5317e9a7	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5646-050c-d20f-5103762ffe86	04	Režija	Režija	Režija	umetnik	30
000f0000-5646-050c-86c3-5851170e1ccd	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5646-050c-fc72-23852857c744	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5646-050c-ac13-0d26e649c866	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5646-050c-a5d9-f0c8ec9b4503	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5646-050c-eec0-de1ab0aa9d93	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5646-050c-b26d-105baa77b88f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5646-050c-2e23-bf919fff29da	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5646-050c-72bf-439e40ad2d70	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5646-050c-f5c6-7de85e1633ed	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5646-050c-4de6-4ff728331dc7	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5646-050c-3188-50fc605804b7	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5646-050c-3d43-63202e059473	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5646-050c-afb9-af4f1985cd25	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5646-050c-a9d5-5c37f417242e	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 26862235)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5646-050e-d5cf-c8e675889299	0001	šola	osnovna ali srednja šola
00400000-5646-050e-a68a-f0562a275e40	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5646-050e-8a80-6689888ce86c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 26863041)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5646-050c-3deb-e03b069d5b1a	01	Velika predstava	f	1.00	1.00
002b0000-5646-050c-7e52-cefb5707be01	02	Mala predstava	f	0.50	0.50
002b0000-5646-050c-27c1-2f5c93dfcddc	03	Mala koprodukcija	t	0.40	1.00
002b0000-5646-050c-4380-7dd9ec32a921	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5646-050c-5d0a-58fa957c24b6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 26862516)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5646-050c-9c76-61e00ebafc14	0001	prva vaja	prva vaja
00420000-5646-050c-4777-15902d433532	0002	tehnična vaja	tehnična vaja
00420000-5646-050c-49c4-001263925460	0003	lučna vaja	lučna vaja
00420000-5646-050c-4b14-c7a0684b53b4	0004	kostumska vaja	kostumska vaja
00420000-5646-050c-4419-57db7b42d11d	0005	foto vaja	foto vaja
00420000-5646-050c-919d-7d22dcf1b260	0006	1. glavna vaja	1. glavna vaja
00420000-5646-050c-e8de-194285da45a0	0007	2. glavna vaja	2. glavna vaja
00420000-5646-050c-2eab-0dc7c9dc0808	0008	1. generalka	1. generalka
00420000-5646-050c-f4a5-d489d79e2b7c	0009	2. generalka	2. generalka
00420000-5646-050c-25a5-9a327602ba1a	0010	odprta generalka	odprta generalka
00420000-5646-050c-eff7-0146fc9c6fc0	0011	obnovitvena vaja	obnovitvena vaja
00420000-5646-050c-0277-144f379e7f2c	0012	pevska vaja	pevska vaja
00420000-5646-050c-4791-a41584c49916	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5646-050c-5828-7527eb7a00a7	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 26862357)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 26862171)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5646-050d-e54e-13d9621577c6	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROlysRK8SwgPkBINaaRk3LQduLt816vRO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5646-050e-f1f1-eab16167db6a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5646-050e-dff2-9e58bd7da684	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5646-050e-ffe2-1eed6ab8dd91	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5646-050e-d640-c6c03d5c1930	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5646-050e-87ea-e580c7f4d209	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5646-050e-783d-16236440fc77	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5646-050e-36da-744e8c70b1ca	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5646-050e-fe17-36c36af02c7e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5646-050e-c3f1-53b8c4d43380	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5646-050e-c8ad-498ec51df9c3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5646-050e-d29e-40c28adae55b	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5646-050e-1cb7-e21055670114	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5646-050e-788a-277a212b3daa	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5646-050e-3cf6-4e1122583b2a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5646-050e-1ad8-27f23e67e857	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5646-050e-bdd7-457e818460a4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5646-050d-d800-1c2746b71403	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 26862798)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5646-050f-0136-d29b736c599d	00160000-5646-050e-35f0-feac47d360c8	\N	00140000-5646-050c-c312-e962e7b1f73f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5646-050e-7c7f-adef37cf734d
000e0000-5646-050f-00fb-d55ee2d810e0	00160000-5646-050e-b444-c8f4e6b682d2	\N	00140000-5646-050c-c944-92640a9a3e06	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5646-050e-adb1-6d42db2775aa
000e0000-5646-050f-c2e8-e9d84380f980	\N	\N	00140000-5646-050c-c944-92640a9a3e06	00190000-5646-050f-5885-deb3faad5350	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5646-050e-7c7f-adef37cf734d
000e0000-5646-050f-a514-638c9340a51f	\N	\N	00140000-5646-050c-c944-92640a9a3e06	00190000-5646-050f-5885-deb3faad5350	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5646-050e-7c7f-adef37cf734d
000e0000-5646-050f-2942-0efdf4c1b745	\N	\N	00140000-5646-050c-c944-92640a9a3e06	00190000-5646-050f-5885-deb3faad5350	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5646-050e-066a-96123ae33650
000e0000-5646-050f-2270-0fd196a721e8	\N	\N	00140000-5646-050c-c944-92640a9a3e06	00190000-5646-050f-5885-deb3faad5350	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5646-050e-066a-96123ae33650
\.


--
-- TOC entry 3123 (class 0 OID 26862456)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5646-050f-4e88-b65acb537419	\N	000e0000-5646-050f-00fb-d55ee2d810e0	1	
00200000-5646-050f-45d4-be24e3900fa2	\N	000e0000-5646-050f-00fb-d55ee2d810e0	2	
00200000-5646-050f-2971-4f833d8b1443	\N	000e0000-5646-050f-00fb-d55ee2d810e0	3	
00200000-5646-050f-887a-a6a56c032591	\N	000e0000-5646-050f-00fb-d55ee2d810e0	4	
00200000-5646-050f-79e7-018d6ff4e926	\N	000e0000-5646-050f-00fb-d55ee2d810e0	5	
\.


--
-- TOC entry 3140 (class 0 OID 26862607)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 26862721)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5646-050c-b8ff-195144b2aa97	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5646-050c-9a7e-f8f5e13da36e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5646-050c-2551-f90b0ea54430	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5646-050c-6136-c4660fc575ea	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5646-050c-7888-cf005dcd56fa	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5646-050c-d8c4-b9abb4a9191d	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5646-050c-4c8a-df37d3e2a6a6	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5646-050c-db3d-6b266d9e9d8c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5646-050c-c4a6-3f26fa28ac37	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5646-050c-149a-91d2b514c027	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5646-050c-b52e-4025f82ddb7d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5646-050c-b594-b1aa8764fc30	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5646-050c-b6a1-eb240bbde21f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5646-050c-2e09-e95843b17ccb	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5646-050c-ec6e-d82e74462f7e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5646-050c-45d3-24b687ccdbc1	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5646-050c-2daf-3439a1d4c17c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5646-050c-d699-d6ebff14d810	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5646-050c-0c8e-8515badfe520	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5646-050c-0448-b620def8c6a9	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5646-050c-65f7-28d39265c852	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5646-050c-e06f-318a1217dde9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5646-050c-f750-47beb7ad5dcc	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5646-050c-c69f-8bf3c81a8ea0	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5646-050c-f4b6-7d71bac0673b	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5646-050c-36e1-9e4774351a60	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5646-050c-3528-5101a2e04445	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5646-050c-f25f-807b48f0c6c5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 26863091)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 26863060)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 26863103)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 26862679)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5646-050f-4452-e006c7d0d02c	00090000-5646-050f-934a-5a828c89d725	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5646-050f-6b61-22a78acf409b	00090000-5646-050f-1b5e-3ecd646912d3	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5646-050f-1cb2-6fef54c65dd4	00090000-5646-050f-cdf3-0b3820c94d8a	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5646-050f-42b4-3bcd2d8117fc	00090000-5646-050f-c7d5-5f3ebdab0169	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5646-050f-8608-b939b39a6c05	00090000-5646-050f-d9f6-10c0753b7803	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5646-050f-6252-3064d906320e	00090000-5646-050f-98f2-6b9514946654	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 26862500)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 26862788)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5646-050c-c312-e962e7b1f73f	01	Drama	drama (SURS 01)
00140000-5646-050c-4127-3b7c5eb8f631	02	Opera	opera (SURS 02)
00140000-5646-050c-2d25-b14f4befd381	03	Balet	balet (SURS 03)
00140000-5646-050c-23ff-ed9df13fd6f2	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5646-050c-5efd-bc05d1914f2f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5646-050c-c944-92640a9a3e06	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5646-050c-d5f7-67e0fefffc84	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 26862669)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 26862234)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 26862847)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 26862837)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 26862225)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 26862704)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 26862746)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 26863144)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 26862488)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 26862510)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 26862515)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 26863058)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 26862383)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 26862915)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 26862665)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 26862454)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 26862421)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 26862397)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 26862572)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 26863121)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 26863128)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 26863152)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2726 (class 2606 OID 26862599)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 26862355)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 26862253)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 26862317)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 26862280)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 26862214)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 26862199)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 26862605)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 26862641)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 26862783)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 26862308)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 26862343)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 26863010)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 26862578)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 26862333)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 26862473)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 26862442)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 26862434)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 26862590)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 26863019)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 26863027)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 26862997)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 26863039)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 26862623)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 26862563)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 26862554)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 26862770)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 26862697)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 26862409)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 26862170)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 26862632)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 26862188)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 26862208)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 26862650)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 26862585)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 26862534)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 26862158)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 26862146)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 26862140)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 26862717)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 26862289)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 26862545)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 26862757)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 26862242)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 26863051)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 26862523)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 26862368)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 26862183)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 26862816)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 26862463)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 26862613)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 26862729)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 26863101)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 26863085)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 26863109)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 26862687)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 26862504)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 26862796)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 26862677)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 26862498)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 26862499)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 26862497)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 26862496)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 26862495)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 26862718)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 26862719)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 26862720)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 26863123)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 26863122)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 26862310)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 26862311)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 26862606)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 26863089)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 26863088)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 26863090)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 26863087)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 26863086)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 26862592)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 26862591)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 26862464)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 26862465)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 26862666)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 26862668)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 26862667)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 26862399)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 26862398)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 26863040)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 26862785)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 26862786)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 26862787)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 26863110)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 26862821)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 26862818)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 26862822)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 26862820)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 26862819)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 26862370)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 26862369)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 26862283)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 26862633)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 26862215)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 26862216)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 26862653)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 26862652)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 26862651)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 26862320)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 26862319)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 26862321)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 26862437)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 26862435)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 26862436)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 26862148)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 26862558)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 26862556)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 26862555)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 26862557)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 26862189)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 26862190)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 26862614)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 26863145)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 26862706)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 26862705)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 26863153)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 26863154)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 26862579)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 26862698)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 26862699)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 26862920)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 26862919)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 26862916)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 26862917)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 26862918)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 26862335)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 26862334)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 26862336)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 26862627)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 26862626)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 26863020)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 26863021)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 26862851)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 26862852)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 26862849)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 26862850)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 26862688)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 26862689)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 26862567)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 26862566)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 26862564)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 26862565)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 26862839)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 26862838)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 26862410)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 26862424)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 26862423)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 26862422)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 26862425)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 26862455)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 26862443)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 26862444)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 26863011)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 26863059)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 26863129)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 26863130)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 26862255)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 26862254)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 26862290)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 26862291)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 26862505)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 26862548)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 26862547)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 26862546)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 26862490)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 26862491)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 26862494)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 26862489)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 26862493)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 26862492)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 26862309)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 26862243)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 26862244)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 26862384)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 26862386)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 26862385)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 26862387)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 26862573)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 26862784)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 26862817)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 26862758)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 26862759)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 26862281)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 26862282)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 26862678)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 26862159)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 26862356)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 26862318)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 26862147)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 26863052)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 26862625)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 26862624)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 26862524)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 26862525)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 26862848)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 26862344)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 26862797)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 26863102)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 26863028)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 26863029)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 26862747)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 26862535)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 26862209)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 26863325)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 26863330)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 26863355)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 26863345)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 26863320)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 26863340)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 26863350)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 26863335)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 26863525)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 26863530)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 26863535)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 26863700)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 26863695)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 26863210)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 26863215)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 26863440)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 26863680)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 26863675)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 26863685)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 26863670)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 26863665)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 26863435)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 26863430)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 26863310)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 26863315)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 26863480)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 26863490)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 26863485)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 26863265)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 26863260)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 26863420)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 26863655)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 26863540)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 26863545)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 26863550)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 26863690)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 26863570)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 26863555)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 26863575)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 26863565)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 26863560)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 26863255)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 26863250)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 26863195)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 26863190)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 26863460)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 26863170)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 26863175)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 26863475)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 26863470)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 26863465)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 26863225)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 26863220)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 26863230)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 26863290)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 26863280)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 26863285)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 26863155)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 26863395)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 26863385)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 26863380)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 26863390)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 26863160)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 26863165)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 26863445)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 26863715)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 26863520)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 26863515)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 26863720)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 26863725)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 26863425)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 26863505)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 26863510)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 26863630)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 26863625)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 26863610)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 26863615)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 26863620)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 26863240)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 26863235)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 26863245)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 26863455)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 26863450)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 26863640)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 26863645)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 26863600)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 26863605)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 26863590)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 26863595)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 26863495)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 26863500)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 26863415)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 26863410)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 26863400)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 26863405)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 26863585)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 26863580)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 26863270)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 26863275)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 26863305)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 26863295)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 26863300)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 26863635)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 26863650)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 26863660)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 26863705)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 26863710)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 26863185)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 26863180)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 26863200)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 26863205)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 26863360)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 26863375)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 26863370)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 26863365)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-13 16:43:14 CET

--
-- PostgreSQL database dump complete
--

