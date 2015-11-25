--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-25 10:51:36 CET

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
-- TOC entry 183 (class 1259 OID 29438972)
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
-- TOC entry 237 (class 1259 OID 29439586)
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
-- TOC entry 236 (class 1259 OID 29439569)
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
-- TOC entry 182 (class 1259 OID 29438965)
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
-- TOC entry 181 (class 1259 OID 29438963)
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
-- TOC entry 227 (class 1259 OID 29439446)
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
-- TOC entry 230 (class 1259 OID 29439476)
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
-- TOC entry 251 (class 1259 OID 29439877)
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
-- TOC entry 203 (class 1259 OID 29439220)
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
-- TOC entry 205 (class 1259 OID 29439252)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 29439257)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 29439799)
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
-- TOC entry 194 (class 1259 OID 29439117)
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
-- TOC entry 238 (class 1259 OID 29439599)
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
-- TOC entry 223 (class 1259 OID 29439400)
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
-- TOC entry 200 (class 1259 OID 29439191)
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
-- TOC entry 197 (class 1259 OID 29439157)
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
-- TOC entry 195 (class 1259 OID 29439134)
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
-- TOC entry 212 (class 1259 OID 29439314)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 29439857)
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
-- TOC entry 250 (class 1259 OID 29439870)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 29439892)
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
-- TOC entry 216 (class 1259 OID 29439339)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 29439091)
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
-- TOC entry 185 (class 1259 OID 29438991)
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
-- TOC entry 189 (class 1259 OID 29439058)
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
-- TOC entry 186 (class 1259 OID 29439002)
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
-- TOC entry 178 (class 1259 OID 29438937)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 29438956)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 29439346)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 29439380)
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
-- TOC entry 233 (class 1259 OID 29439517)
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
-- TOC entry 188 (class 1259 OID 29439038)
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
-- TOC entry 191 (class 1259 OID 29439083)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 29439744)
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
-- TOC entry 213 (class 1259 OID 29439320)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 29439068)
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
-- TOC entry 202 (class 1259 OID 29439212)
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
-- TOC entry 198 (class 1259 OID 29439172)
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
-- TOC entry 199 (class 1259 OID 29439184)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 29439332)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 29439758)
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
-- TOC entry 242 (class 1259 OID 29439768)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 29439667)
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
-- TOC entry 243 (class 1259 OID 29439776)
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
-- TOC entry 219 (class 1259 OID 29439361)
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
-- TOC entry 211 (class 1259 OID 29439305)
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
-- TOC entry 210 (class 1259 OID 29439295)
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
-- TOC entry 232 (class 1259 OID 29439506)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 29439436)
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
-- TOC entry 196 (class 1259 OID 29439146)
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
-- TOC entry 175 (class 1259 OID 29438908)
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
-- TOC entry 174 (class 1259 OID 29438906)
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
-- TOC entry 220 (class 1259 OID 29439374)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 29438946)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 29438930)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 29439388)
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
-- TOC entry 214 (class 1259 OID 29439326)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 29439272)
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
-- TOC entry 173 (class 1259 OID 29438895)
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
-- TOC entry 172 (class 1259 OID 29438887)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 29438882)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 29439453)
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
-- TOC entry 187 (class 1259 OID 29439030)
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
-- TOC entry 209 (class 1259 OID 29439282)
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
-- TOC entry 231 (class 1259 OID 29439494)
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
-- TOC entry 184 (class 1259 OID 29438981)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 29439787)
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
-- TOC entry 207 (class 1259 OID 29439262)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 29439103)
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
-- TOC entry 176 (class 1259 OID 29438917)
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
-- TOC entry 235 (class 1259 OID 29439544)
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
-- TOC entry 201 (class 1259 OID 29439202)
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
-- TOC entry 218 (class 1259 OID 29439353)
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
-- TOC entry 229 (class 1259 OID 29439467)
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
-- TOC entry 247 (class 1259 OID 29439837)
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
-- TOC entry 246 (class 1259 OID 29439806)
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
-- TOC entry 248 (class 1259 OID 29439849)
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
-- TOC entry 225 (class 1259 OID 29439425)
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
-- TOC entry 204 (class 1259 OID 29439246)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 29439534)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 29439415)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 29438968)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 29438911)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 29438972)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5655-84a5-e16b-3c5bdf83e5b9	10	30	Otroci	Abonma za otroke	200
000a0000-5655-84a5-b9fc-4132754cb969	20	60	Mladina	Abonma za mladino	400
000a0000-5655-84a5-7933-402cd8b633f1	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 29439586)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5655-84a5-8e91-2400256766df	000d0000-5655-84a5-17a9-f66abc30c2a9	\N	00090000-5655-84a5-7008-df89473de3c8	000b0000-5655-84a5-d2ff-8a6728c5d28b	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5655-84a5-ae62-bd9dfdd7ed9f	000d0000-5655-84a5-18c1-ec9159cc613d	00100000-5655-84a5-8949-e50e8d617ed0	00090000-5655-84a5-874d-7fa4a2ce0226	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5655-84a5-9664-03c70b13a569	000d0000-5655-84a5-e5c7-44c54c2ac918	00100000-5655-84a5-b0b0-203967637ade	00090000-5655-84a5-9296-26360a5160c2	\N	0003	t	\N	2015-11-25	\N	2	t	\N	f	f
000c0000-5655-84a5-7b65-460d8e9221fb	000d0000-5655-84a5-520e-d104c41161d4	\N	00090000-5655-84a5-fee2-a529d70c428b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5655-84a5-f643-15eca9d87bb2	000d0000-5655-84a5-044c-0f93482ad781	\N	00090000-5655-84a5-dca6-1e53ed27cb05	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5655-84a5-776f-e3ccdbe9e8d5	000d0000-5655-84a5-bff3-63a7c5fe6161	\N	00090000-5655-84a5-1088-56fdc4b4dddf	000b0000-5655-84a5-bc5b-c3d5db35e66c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5655-84a5-67ae-c475f5596717	000d0000-5655-84a5-e501-75fc246d278c	00100000-5655-84a5-52f0-8c20bb88f1d9	00090000-5655-84a5-e978-a2647dda8b51	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5655-84a5-9479-ff1c11bc6166	000d0000-5655-84a5-76c9-d178cdd567e6	\N	00090000-5655-84a5-416f-5a0ca28eaacd	000b0000-5655-84a5-b9de-565d96fbd4c4	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5655-84a5-734d-4437b2cbf796	000d0000-5655-84a5-e501-75fc246d278c	00100000-5655-84a5-84ad-b39b6a98bdfd	00090000-5655-84a5-e852-02bed4ffd07e	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5655-84a5-059f-77570d0dc41f	000d0000-5655-84a5-e501-75fc246d278c	00100000-5655-84a5-5f13-e352e1534cab	00090000-5655-84a5-dc28-dd69a01317fe	\N	0010	t	\N	2015-11-25	\N	16	f	\N	f	t
000c0000-5655-84a5-2922-fa7536e5c686	000d0000-5655-84a5-e501-75fc246d278c	00100000-5655-84a5-d2c5-c37a5e6ffc90	00090000-5655-84a5-bf73-f7b16317f77f	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5655-84a5-12fc-24be8be0c533	000d0000-5655-84a5-7c6c-6e139267d19f	00100000-5655-84a5-8949-e50e8d617ed0	00090000-5655-84a5-874d-7fa4a2ce0226	000b0000-5655-84a5-a1a5-4d0a6c6ca091	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 29439569)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 29438965)
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
-- TOC entry 3149 (class 0 OID 29439446)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5655-84a5-3c7a-66407835b56a	00160000-5655-84a4-ec47-65106b891f53	00090000-5655-84a5-41fd-5c87531004b4	aizv	10	t
003d0000-5655-84a5-1d45-b619e3643ef8	00160000-5655-84a4-ec47-65106b891f53	00090000-5655-84a5-8603-2aa3934c8e76	apri	14	t
003d0000-5655-84a5-44d8-031bb863f7ee	00160000-5655-84a4-aed0-253ade804fa1	00090000-5655-84a5-f691-e16c1ef10e3a	aizv	11	t
003d0000-5655-84a5-e75b-8a0c7dcd23f1	00160000-5655-84a4-b998-ddc4f699e8bf	00090000-5655-84a5-4e20-05b5389284e5	aizv	12	t
003d0000-5655-84a5-d490-21338204662b	00160000-5655-84a4-ec47-65106b891f53	00090000-5655-84a5-4f7d-0a50e43f87ec	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 29439476)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5655-84a4-ec47-65106b891f53	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5655-84a4-aed0-253ade804fa1	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5655-84a4-b998-ddc4f699e8bf	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 29439877)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 29439220)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5655-84a5-11c6-5cbcabee23d0	\N	\N	00200000-5655-84a5-3f54-4a9916b375fe	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5655-84a5-c9ee-a25051337069	\N	\N	00200000-5655-84a5-51e3-7cdf8ee5566b	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5655-84a5-3a04-e66ec6f93180	\N	\N	00200000-5655-84a5-4ecd-1ba6120602a8	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5655-84a5-176d-91c1792cb682	\N	\N	00200000-5655-84a5-456e-35681b0cabb3	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5655-84a5-b5d7-f142d0ad92f6	\N	\N	00200000-5655-84a5-782f-b66f0ccea24f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 29439252)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 29439257)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 29439799)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 29439117)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5655-84a2-7493-a3ffceacc531	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5655-84a2-5b54-f5949a87f992	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5655-84a2-7eb9-1a7d469cd9e3	AL	ALB	008	Albania 	Albanija	\N
00040000-5655-84a2-9acc-200da03bb851	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5655-84a2-8cb8-8de15f703363	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5655-84a2-e00f-e0873a6be4fb	AD	AND	020	Andorra 	Andora	\N
00040000-5655-84a2-7994-22d5761903fe	AO	AGO	024	Angola 	Angola	\N
00040000-5655-84a2-3517-c637d0582660	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5655-84a2-bc06-8b4f0e1ffd1b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5655-84a2-0655-cedf44477c3e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5655-84a2-52b1-77c94bfa5c29	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5655-84a2-2742-f7ea2f400be9	AM	ARM	051	Armenia 	Armenija	\N
00040000-5655-84a2-d9ac-6bf7b6439a43	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5655-84a2-2bb5-6f406ba0ea05	AU	AUS	036	Australia 	Avstralija	\N
00040000-5655-84a2-89bb-df107efd73fc	AT	AUT	040	Austria 	Avstrija	\N
00040000-5655-84a2-cf41-1c283ee3400e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5655-84a2-8dba-3a4500cdccd3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5655-84a2-0c31-bd915cd50c3d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5655-84a2-b896-1875b22c71fd	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5655-84a2-badf-0dbaa2a086ee	BB	BRB	052	Barbados 	Barbados	\N
00040000-5655-84a2-a726-dbd227e47fc3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5655-84a2-86a5-093b0e15d9c9	BE	BEL	056	Belgium 	Belgija	\N
00040000-5655-84a2-1a0f-740ff0065d96	BZ	BLZ	084	Belize 	Belize	\N
00040000-5655-84a2-bf21-366730786058	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5655-84a2-dd61-988583166d2b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5655-84a2-3de1-8f892b5ab330	BT	BTN	064	Bhutan 	Butan	\N
00040000-5655-84a2-bce8-c9aedcc33666	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5655-84a2-e505-9a05da5be7c0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5655-84a2-9cdf-5f10a5555374	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5655-84a2-baa0-189178aeed8d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5655-84a2-ac99-a0e3e6bc20b8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5655-84a2-79e9-3b55f90aec2c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5655-84a2-b98e-ee1aa8afc142	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5655-84a2-3e39-04f1beb2d671	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5655-84a2-f41b-c8fcdfd1000a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5655-84a2-786c-b2d2850a6c44	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5655-84a2-bf90-99efa6687457	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5655-84a2-f46d-5babc9fb1955	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5655-84a2-fe76-9c25b8cc3c43	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5655-84a2-c220-aaeeffbc79ee	CA	CAN	124	Canada 	Kanada	\N
00040000-5655-84a2-f7a2-4044af7d9e34	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5655-84a2-249e-a2ea93fec79e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5655-84a2-b128-607e778749b8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5655-84a2-c47d-28776f90b63e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5655-84a2-57d0-dd68b3c1240c	CL	CHL	152	Chile 	Čile	\N
00040000-5655-84a2-9cf8-e00c629dddbd	CN	CHN	156	China 	Kitajska	\N
00040000-5655-84a2-a5f7-b9e4635158df	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5655-84a2-ee3d-d0a737f1ef68	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5655-84a2-001a-17b723de43ad	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5655-84a2-bee6-e3e117b75ffc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5655-84a2-4ffd-77d749358121	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5655-84a2-85e0-5ad709844af8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5655-84a2-fb9b-06f23c7deceb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5655-84a2-8724-71a33abc15da	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5655-84a2-9b42-1d428ce24930	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5655-84a2-be94-6ae2073f5a18	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5655-84a2-6385-ad9e1bc4c641	CU	CUB	192	Cuba 	Kuba	\N
00040000-5655-84a2-9316-4e2588a801bf	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5655-84a2-ed65-cb7375ba0b35	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5655-84a2-402d-7315bd4dd5d0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5655-84a2-772b-207c7c946371	DK	DNK	208	Denmark 	Danska	\N
00040000-5655-84a2-244a-22f2ef55d92f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5655-84a2-9072-8d684672033e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5655-84a2-3001-327a0e2e0634	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5655-84a2-547f-b2110db544eb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5655-84a2-4f57-66ec80cb727c	EG	EGY	818	Egypt 	Egipt	\N
00040000-5655-84a2-464f-cfbdd64858a2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5655-84a2-5178-9ee29b937827	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5655-84a2-7cf1-4e8e289b4312	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5655-84a2-2c45-4b8eea2b1742	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5655-84a2-f42b-937cd89aafde	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5655-84a2-60ad-9eae94410207	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5655-84a2-bf89-fa9dcf8a70e4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5655-84a2-757c-0e15286c094c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5655-84a2-d308-efd8488e3fe4	FI	FIN	246	Finland 	Finska	\N
00040000-5655-84a2-07dc-04f6aab9f81f	FR	FRA	250	France 	Francija	\N
00040000-5655-84a2-40c9-f63be457692b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5655-84a2-3d31-2be1f6047c37	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5655-84a2-04d9-8263e67382c5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5655-84a2-4497-18a948b66448	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5655-84a2-77fd-0f51e129567f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5655-84a2-368d-df5f5c109a64	GM	GMB	270	Gambia 	Gambija	\N
00040000-5655-84a2-93fc-20b16eeb0d0d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5655-84a2-abf1-3e301feab55d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5655-84a2-8951-bcbb3d063ea6	GH	GHA	288	Ghana 	Gana	\N
00040000-5655-84a2-ab03-aebee8df8503	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5655-84a2-1339-d8e255791aa9	GR	GRC	300	Greece 	Grčija	\N
00040000-5655-84a2-2f3e-a81fa7b11185	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5655-84a2-b2e2-3abc67668bb3	GD	GRD	308	Grenada 	Grenada	\N
00040000-5655-84a2-a855-4759b1de9fa5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5655-84a2-4286-47b79c2af0ee	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5655-84a2-e3dc-9e90566ed652	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5655-84a2-d576-4a5442c67d57	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5655-84a2-3944-2294d2d1237b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5655-84a2-330f-075f4496532c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5655-84a2-5002-6d484991e180	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5655-84a2-4232-4f02226bc81d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5655-84a2-4c3f-230f3f199f5c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5655-84a2-f16c-9c0164d5bdb4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5655-84a2-0733-cc1e3defe335	HN	HND	340	Honduras 	Honduras	\N
00040000-5655-84a2-8f96-bac943edb4a2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5655-84a2-1621-fcd74ca6bbf9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5655-84a2-da77-a6a530ce09f2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5655-84a2-65c9-6eb1adb86141	IN	IND	356	India 	Indija	\N
00040000-5655-84a2-e0fb-3fe957609028	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5655-84a2-3882-19b1c7857b66	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5655-84a2-aac7-e218ffa6eb1a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5655-84a2-7e0a-eae62277988b	IE	IRL	372	Ireland 	Irska	\N
00040000-5655-84a2-0539-e770fb1347e2	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5655-84a2-5248-fdccd453052c	IL	ISR	376	Israel 	Izrael	\N
00040000-5655-84a2-f717-522093cc864b	IT	ITA	380	Italy 	Italija	\N
00040000-5655-84a2-46c9-8a86f6db750d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5655-84a2-53a0-984a465c7c2c	JP	JPN	392	Japan 	Japonska	\N
00040000-5655-84a2-a98f-3784ff4b9733	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5655-84a2-060c-0cfb09ce79b0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5655-84a2-5cf0-ff8144b599c3	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5655-84a2-e7f0-10d57d4b71d7	KE	KEN	404	Kenya 	Kenija	\N
00040000-5655-84a2-768a-11b210d5faf7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5655-84a2-d11b-e53f561ece2e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5655-84a2-b73a-e91dec27688a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5655-84a2-9564-10ba50b222a0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5655-84a2-e2d7-cda2a5a651c3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5655-84a2-3d42-3e4a0c849385	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5655-84a2-d47e-d4b0e554fcb6	LV	LVA	428	Latvia 	Latvija	\N
00040000-5655-84a2-4060-153762b882cd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5655-84a2-88a8-75ad057f7586	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5655-84a2-414e-6d0dc00ee111	LR	LBR	430	Liberia 	Liberija	\N
00040000-5655-84a2-b935-2a178b6d584d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5655-84a2-334f-d0e9ce679f89	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5655-84a2-3827-43c8726c42c4	LT	LTU	440	Lithuania 	Litva	\N
00040000-5655-84a2-ae00-9287d2402c3c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5655-84a2-ea10-203c64e6e514	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5655-84a2-c3f3-9eccad185127	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5655-84a2-3d35-710835e07c78	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5655-84a2-409d-fc72f7ff56b1	MW	MWI	454	Malawi 	Malavi	\N
00040000-5655-84a2-4b6d-55629994c170	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5655-84a2-296e-e51b2171cc9f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5655-84a2-cb54-14b8ac380dbf	ML	MLI	466	Mali 	Mali	\N
00040000-5655-84a2-e758-020f6ca635a5	MT	MLT	470	Malta 	Malta	\N
00040000-5655-84a2-8120-1b8878fb522f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5655-84a2-4438-774d56869ad1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5655-84a2-6220-7658c522662d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5655-84a2-b202-1095f9b6a594	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5655-84a2-ea5b-cfaa6591e695	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5655-84a2-897e-4d4f74c297c9	MX	MEX	484	Mexico 	Mehika	\N
00040000-5655-84a2-2985-bf3848a15230	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5655-84a2-87cc-ee56e09d009f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5655-84a2-bf0e-fde25db773c2	MC	MCO	492	Monaco 	Monako	\N
00040000-5655-84a2-bc13-ef05f42f31df	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5655-84a2-2dfe-ed93a8f6bd68	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5655-84a2-f351-d8ad3e9c45a3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5655-84a2-18eb-a3c1d6d5f1da	MA	MAR	504	Morocco 	Maroko	\N
00040000-5655-84a2-2377-576cbbef7200	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5655-84a2-4136-aae40d2109f8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5655-84a2-0bd0-9fb9e23de5f6	NA	NAM	516	Namibia 	Namibija	\N
00040000-5655-84a2-dfe5-a30f599d8a43	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5655-84a2-19d8-7d35944514d8	NP	NPL	524	Nepal 	Nepal	\N
00040000-5655-84a2-68f0-9344576fb385	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5655-84a2-ac38-24565ffa0786	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5655-84a2-9531-e81ff9bf44e5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5655-84a2-1f98-7133be71e7a5	NE	NER	562	Niger 	Niger 	\N
00040000-5655-84a2-30bf-ab9a82d52f41	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5655-84a2-0ab7-a401f5f446a4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5655-84a2-18f4-abd1e43b4e5c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5655-84a2-74b3-db007438a9f0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5655-84a2-31ef-45ed8f753fb9	NO	NOR	578	Norway 	Norveška	\N
00040000-5655-84a2-d707-70f92081a209	OM	OMN	512	Oman 	Oman	\N
00040000-5655-84a2-bebe-2f70f386ef1f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5655-84a2-42e2-ee7c94c1e674	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5655-84a2-6310-18db9affaee3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5655-84a2-aadf-1c3675006a98	PA	PAN	591	Panama 	Panama	\N
00040000-5655-84a2-6ddc-92fd906cda56	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5655-84a2-a3e6-053a4fa464b0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5655-84a2-031f-8e33c13e52b0	PE	PER	604	Peru 	Peru	\N
00040000-5655-84a2-fded-b5c45a540d96	PH	PHL	608	Philippines 	Filipini	\N
00040000-5655-84a2-8d84-1b73787754b1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5655-84a2-e8e9-3963c3076ebf	PL	POL	616	Poland 	Poljska	\N
00040000-5655-84a2-9286-fa751d6d382e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5655-84a2-a622-849158bb6fe0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5655-84a2-d76c-49f4cfa1760c	QA	QAT	634	Qatar 	Katar	\N
00040000-5655-84a2-e94f-e10fb55f64fb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5655-84a2-273f-7661f3f47ff4	RO	ROU	642	Romania 	Romunija	\N
00040000-5655-84a2-45ca-acec49ba5da2	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5655-84a2-0acf-49bf4e9f22af	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5655-84a2-eae0-d8117fb0ba56	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5655-84a2-af0e-8f09509a38ef	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5655-84a2-2f0e-03b2e20ddd45	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5655-84a2-653c-8287c91ad292	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5655-84a2-2e70-edfc0111444d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5655-84a2-4b35-207c93e23d2d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5655-84a2-49f8-c9cf89453acc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5655-84a2-cbc1-ed79c12e4161	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5655-84a2-b87a-620eef69b658	SM	SMR	674	San Marino 	San Marino	\N
00040000-5655-84a2-9fbb-1ed874bdad5c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5655-84a2-525b-ddef78e89f95	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5655-84a2-857f-3f51fb405eca	SN	SEN	686	Senegal 	Senegal	\N
00040000-5655-84a2-2cb5-f4b3cff8544c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5655-84a2-303e-358896d3750c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5655-84a2-4678-8f091c71efc0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5655-84a2-d4cb-79a7cef065b1	SG	SGP	702	Singapore 	Singapur	\N
00040000-5655-84a2-4684-b77f2078933f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5655-84a2-627b-26361d96cfa5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5655-84a2-922c-48aefebb4b09	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5655-84a2-7f5d-288199fd1d59	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5655-84a2-b190-c1c501ad5fea	SO	SOM	706	Somalia 	Somalija	\N
00040000-5655-84a2-ef80-c329a9c052ab	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5655-84a2-2c90-419c6e7f8be7	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5655-84a2-8260-76ecb943768b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5655-84a2-a56a-ef1a1dada95b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5655-84a2-98f8-4d59006dda1b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5655-84a2-7752-7cfab765e8c5	SD	SDN	729	Sudan 	Sudan	\N
00040000-5655-84a2-b6d1-8cb7dc9d7ecc	SR	SUR	740	Suriname 	Surinam	\N
00040000-5655-84a2-6029-b4f6db9ae6d7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5655-84a2-950f-1fd058e9e5b4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5655-84a2-d08d-d801d625d730	SE	SWE	752	Sweden 	Švedska	\N
00040000-5655-84a2-0597-0d62770d633a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5655-84a2-7ba2-294788559fa6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5655-84a2-ffac-0ded90370e41	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5655-84a2-a9b7-cbfb2dea3eb1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5655-84a2-94f1-8e015d8d79d6	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5655-84a2-1cc0-42b58aa06555	TH	THA	764	Thailand 	Tajska	\N
00040000-5655-84a2-37ae-4c9e8196ffda	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5655-84a2-cc04-4084fe325fa9	TG	TGO	768	Togo 	Togo	\N
00040000-5655-84a2-8f0d-d67e5da80b4a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5655-84a2-7862-0a96e0c9fc28	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5655-84a2-c02f-a31498f39295	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5655-84a2-b24b-fb58c0ba7f74	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5655-84a2-05cc-3d1ccebd7bda	TR	TUR	792	Turkey 	Turčija	\N
00040000-5655-84a2-2d9d-103610c68a6f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5655-84a2-d174-4e377faa509c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5655-84a2-3b74-57963ff71925	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5655-84a2-7415-159ace910047	UG	UGA	800	Uganda 	Uganda	\N
00040000-5655-84a2-4158-0c01431cd438	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5655-84a2-7e72-9bf2970ace46	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5655-84a2-5884-ef2f4dca9b4a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5655-84a2-ca34-4692d3b31d05	US	USA	840	United States 	Združene države Amerike	\N
00040000-5655-84a2-9d8e-1f226db5da4b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5655-84a2-c532-17a17469be0f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5655-84a2-9321-c8eac3a08436	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5655-84a2-f83f-5f3b72ce1633	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5655-84a2-3495-da192fe1509f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5655-84a2-11b0-a2aebbd0a65f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5655-84a2-4927-7ba7875636e3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5655-84a2-d41b-59490fa7f255	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5655-84a2-91e8-e9c406839e9c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5655-84a2-934a-a1709d897559	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5655-84a2-f366-70b0d185d040	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5655-84a2-b3b4-6a408e9b13e7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5655-84a2-c57f-af65e3f34955	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 29439599)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5655-84a5-76ee-4146d9b520a7	000e0000-5655-84a5-0647-4df47c7a3711	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5655-84a2-db25-3bf6d3bde14e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5655-84a5-2fbb-a4b5c30d7d7c	000e0000-5655-84a5-f3e3-a13a9b422939	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5655-84a2-1087-0f04bc6596c6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5655-84a5-0f0d-1d085537da1f	000e0000-5655-84a5-099f-cae66fe10524	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5655-84a2-db25-3bf6d3bde14e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5655-84a5-e91e-dc9268a45da5	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5655-84a5-2bc4-91638eafacf4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 29439400)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5655-84a5-e501-75fc246d278c	000e0000-5655-84a5-f3e3-a13a9b422939	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5655-84a2-0d6f-ce807adb07c9
000d0000-5655-84a5-17a9-f66abc30c2a9	000e0000-5655-84a5-f3e3-a13a9b422939	000c0000-5655-84a5-8e91-2400256766df	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5655-84a2-0d6f-ce807adb07c9
000d0000-5655-84a5-18c1-ec9159cc613d	000e0000-5655-84a5-f3e3-a13a9b422939	000c0000-5655-84a5-ae62-bd9dfdd7ed9f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5655-84a2-d00b-e55c8693b5a4
000d0000-5655-84a5-e5c7-44c54c2ac918	000e0000-5655-84a5-f3e3-a13a9b422939	000c0000-5655-84a5-9664-03c70b13a569	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5655-84a2-af51-f142d3afb09d
000d0000-5655-84a5-520e-d104c41161d4	000e0000-5655-84a5-f3e3-a13a9b422939	000c0000-5655-84a5-7b65-460d8e9221fb	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5655-84a2-57e1-0115509449f4
000d0000-5655-84a5-044c-0f93482ad781	000e0000-5655-84a5-f3e3-a13a9b422939	000c0000-5655-84a5-f643-15eca9d87bb2	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5655-84a2-57e1-0115509449f4
000d0000-5655-84a5-bff3-63a7c5fe6161	000e0000-5655-84a5-f3e3-a13a9b422939	000c0000-5655-84a5-776f-e3ccdbe9e8d5	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5655-84a2-0d6f-ce807adb07c9
000d0000-5655-84a5-76c9-d178cdd567e6	000e0000-5655-84a5-f3e3-a13a9b422939	000c0000-5655-84a5-9479-ff1c11bc6166	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5655-84a2-378a-921fda16adb3
000d0000-5655-84a5-7c6c-6e139267d19f	000e0000-5655-84a5-f3e3-a13a9b422939	000c0000-5655-84a5-12fc-24be8be0c533	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5655-84a2-69f2-b31f2eb08ba8
\.


--
-- TOC entry 3122 (class 0 OID 29439191)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 29439157)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 29439134)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5655-84a5-6c4a-962d127648c7	00080000-5655-84a5-2212-4fc2c9c91b89	00090000-5655-84a5-dc28-dd69a01317fe	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 29439314)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 29439857)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5655-84a5-bfab-06838d256f17	00010000-5655-84a3-b538-d8ef081fa30d	\N	Prva mapa	Root mapa	2015-11-25 10:51:33	2015-11-25 10:51:33	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 29439870)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 29439892)
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
-- TOC entry 3138 (class 0 OID 29439339)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 29439091)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5655-84a3-fbd0-cfb092e89142	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5655-84a3-c47d-4c372c200602	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5655-84a3-9a94-36d82e177332	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5655-84a3-1e33-bf0ca108f65c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5655-84a3-8281-0f9d2c030a60	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5655-84a3-c391-fbc1ab53f80b	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5655-84a3-683a-616444dc2065	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5655-84a3-f494-cd5a69b3d81e	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5655-84a3-3a80-feaa6d104ed4	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5655-84a3-166e-753d2edfe9ff	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5655-84a3-a8e7-0c4611cd19c4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5655-84a3-49a8-d01789f6db74	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5655-84a3-14dc-2132b9ed2dba	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5655-84a3-efb4-3448ead50b04	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5655-84a4-ee6b-3cf6e87dc2eb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5655-84a4-f5d9-312308c1e344	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5655-84a4-d059-416b9c8ff825	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5655-84a4-a078-602ea866ee2c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5655-84a4-2b32-2ca66a6d5d76	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5655-84a7-f306-b8c06147fca9	application.tenant.maticnopodjetje	string	s:36:"00080000-5655-84a7-7dec-64e0518f3fd2";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 29438991)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5655-84a4-1cf9-5561bc40f6d6	00000000-5655-84a4-ee6b-3cf6e87dc2eb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5655-84a4-8e52-4ff1df9f7871	00000000-5655-84a4-ee6b-3cf6e87dc2eb	00010000-5655-84a3-b538-d8ef081fa30d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5655-84a4-760e-7e8b540278fc	00000000-5655-84a4-f5d9-312308c1e344	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 29439058)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5655-84a5-7e15-822e5c714a66	\N	00100000-5655-84a5-8949-e50e8d617ed0	00100000-5655-84a5-b0b0-203967637ade	01	Gledališče Nimbis
00410000-5655-84a5-c33d-1edd0be97cd7	00410000-5655-84a5-7e15-822e5c714a66	00100000-5655-84a5-8949-e50e8d617ed0	00100000-5655-84a5-b0b0-203967637ade	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 29439002)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5655-84a5-7008-df89473de3c8	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5655-84a5-fee2-a529d70c428b	00010000-5655-84a5-e6fc-68a8746ce703	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5655-84a5-9296-26360a5160c2	00010000-5655-84a5-734a-cf82b9ef916c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5655-84a5-e852-02bed4ffd07e	00010000-5655-84a5-db13-73bbddbe847c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5655-84a5-00ca-493f05e38c91	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5655-84a5-1088-56fdc4b4dddf	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5655-84a5-bf73-f7b16317f77f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5655-84a5-e978-a2647dda8b51	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5655-84a5-dc28-dd69a01317fe	00010000-5655-84a5-6d8c-ba9ee64bc5f8	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5655-84a5-874d-7fa4a2ce0226	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5655-84a5-f2d6-684af29a22e8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5655-84a5-dca6-1e53ed27cb05	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5655-84a5-416f-5a0ca28eaacd	00010000-5655-84a5-9bcf-e1260220c43c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5655-84a5-41fd-5c87531004b4	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-84a5-8603-2aa3934c8e76	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-84a5-f691-e16c1ef10e3a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-84a5-4e20-05b5389284e5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5655-84a5-4f7d-0a50e43f87ec	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5655-84a5-8aac-6045f0b61336	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-84a5-359d-6bf00aecaf3f	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5655-84a5-6df1-befe0b00a919	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 29438937)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5655-84a3-3343-0dd700999900	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5655-84a3-c56c-c9d332cca248	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5655-84a3-8a53-55640baf10ad	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5655-84a3-1ace-a827cac7a4c3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5655-84a3-6c4a-5b9a6d794c4d	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5655-84a3-68b4-6f12ccc13812	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5655-84a3-89ef-0cc1dc9b9d65	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5655-84a3-6e2b-1b7e2bf3ffaa	Abonma-read	Abonma - branje	t
00030000-5655-84a3-2254-9ca35f2d0d0d	Abonma-write	Abonma - spreminjanje	t
00030000-5655-84a3-1cba-04ec9c12963d	Alternacija-read	Alternacija - branje	t
00030000-5655-84a3-d601-0d7fcf8bada8	Alternacija-write	Alternacija - spreminjanje	t
00030000-5655-84a3-caec-dd4927297d04	Arhivalija-read	Arhivalija - branje	t
00030000-5655-84a3-44f7-a0a9bac3dbc1	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5655-84a3-a2b6-beb512f90840	AuthStorage-read	AuthStorage - branje	t
00030000-5655-84a3-8033-35f011b97d0e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5655-84a3-f789-0f4e3240e47b	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5655-84a3-c361-06bd7bee3658	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5655-84a3-431e-47aecf88df09	Besedilo-read	Besedilo - branje	t
00030000-5655-84a3-ead4-6e03ca0992a3	Besedilo-write	Besedilo - spreminjanje	t
00030000-5655-84a3-6d71-af2462f6fb1d	Dogodek-read	Dogodek - branje	t
00030000-5655-84a3-182b-de9716bdf88e	Dogodek-write	Dogodek - spreminjanje	t
00030000-5655-84a3-6d71-2c5ef2c976b0	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5655-84a3-dc4b-ad941723daf2	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5655-84a3-a0ae-293349215562	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5655-84a3-471d-7e15790f694a	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5655-84a3-4728-1e6055894997	DogodekTrait-read	DogodekTrait - branje	t
00030000-5655-84a3-01d1-8ed7915f9db7	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5655-84a3-b8d0-ebde44e9e306	DrugiVir-read	DrugiVir - branje	t
00030000-5655-84a3-8748-6f84e1d4cbd7	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5655-84a3-c7d3-c73913715636	Drzava-read	Drzava - branje	t
00030000-5655-84a3-24f7-b2390f94fc7c	Drzava-write	Drzava - spreminjanje	t
00030000-5655-84a3-3b2a-ac83987283af	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5655-84a3-13d3-94232cbb2916	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5655-84a3-56f9-0607bd805bb2	Funkcija-read	Funkcija - branje	t
00030000-5655-84a3-c7c5-c505c1b7593e	Funkcija-write	Funkcija - spreminjanje	t
00030000-5655-84a3-0e3a-b0df4e03a704	Gostovanje-read	Gostovanje - branje	t
00030000-5655-84a3-fc5c-08031d894fe3	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5655-84a3-e023-e72c3de23700	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5655-84a3-3311-30ad05dddb7a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5655-84a3-fc64-9c8d48c4cceb	Kupec-read	Kupec - branje	t
00030000-5655-84a3-d621-fba49956e404	Kupec-write	Kupec - spreminjanje	t
00030000-5655-84a3-1eb1-b14c2bafaaa4	NacinPlacina-read	NacinPlacina - branje	t
00030000-5655-84a3-b222-902ff507204e	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5655-84a3-9282-f69c31166026	Option-read	Option - branje	t
00030000-5655-84a3-d38e-dc8677360159	Option-write	Option - spreminjanje	t
00030000-5655-84a3-b898-bfef1cbab2ed	OptionValue-read	OptionValue - branje	t
00030000-5655-84a3-8dec-e28e8d19a5f3	OptionValue-write	OptionValue - spreminjanje	t
00030000-5655-84a3-b7f7-ff6fbe03d95d	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5655-84a3-619e-f9c8d5724a88	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5655-84a3-46b6-75d1f26836c8	Oseba-read	Oseba - branje	t
00030000-5655-84a3-9a4a-d734f4950b7e	Oseba-write	Oseba - spreminjanje	t
00030000-5655-84a3-0ab4-dce5711aa635	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5655-84a3-a91c-0dfeb02db7b7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5655-84a3-fa29-ea9782f8dd7f	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5655-84a3-948e-41e3ddc912b2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5655-84a3-abc5-9fb7532be279	Pogodba-read	Pogodba - branje	t
00030000-5655-84a3-f5cd-62d8997bf617	Pogodba-write	Pogodba - spreminjanje	t
00030000-5655-84a3-1f9b-fef5bfc860b3	Popa-read	Popa - branje	t
00030000-5655-84a3-ef81-2ff2e7ea1893	Popa-write	Popa - spreminjanje	t
00030000-5655-84a3-e7a1-775aaeeaa4d2	Posta-read	Posta - branje	t
00030000-5655-84a3-d4eb-127d2ef0ddfa	Posta-write	Posta - spreminjanje	t
00030000-5655-84a3-68af-246be821ee71	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5655-84a3-f5d3-06661c7704e8	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5655-84a3-01ec-b4452910c230	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5655-84a3-cfe4-48b9c217ddc1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5655-84a3-8c75-ec54ab64db81	PostniNaslov-read	PostniNaslov - branje	t
00030000-5655-84a3-f49c-b20241438ee1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5655-84a3-9563-593ba9bbd8d3	Praznik-read	Praznik - branje	t
00030000-5655-84a3-66c2-6886fc779222	Praznik-write	Praznik - spreminjanje	t
00030000-5655-84a3-fffe-8167821ad650	Predstava-read	Predstava - branje	t
00030000-5655-84a3-0fed-db28f31c9814	Predstava-write	Predstava - spreminjanje	t
00030000-5655-84a3-5f7d-672bb36cf532	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5655-84a3-95f9-fc2087f56172	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5655-84a3-b075-6d71e890a30b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5655-84a3-470b-0bcbd063c3d7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5655-84a3-6d7a-8a07659b25d6	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5655-84a3-ce1e-181796523674	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5655-84a3-9e27-93329e56b029	ProgramDela-read	ProgramDela - branje	t
00030000-5655-84a3-c007-9ab06c3b2f44	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5655-84a3-b877-edfb5f65626c	ProgramFestival-read	ProgramFestival - branje	t
00030000-5655-84a3-c4ac-3cd4b918ecd2	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5655-84a3-f96b-87052862d6ce	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5655-84a3-b128-9f6dccb76a06	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5655-84a3-24a9-012f2ac97fef	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5655-84a3-c8f0-e2c0403882f5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5655-84a3-700d-22ee40c03cc3	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5655-84a3-9435-4f02c6001284	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5655-84a3-200d-5e660ed6c444	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5655-84a3-5975-5f3c137d9322	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5655-84a3-f4e9-59f491e738a7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5655-84a3-06f7-ce4f7278a75b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5655-84a3-5fd9-e9ceac6ded60	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5655-84a3-4b7b-b0d3efeddb82	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5655-84a3-3bf9-ef79c78f0d81	ProgramRazno-read	ProgramRazno - branje	t
00030000-5655-84a3-a927-d3e905a34db0	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5655-84a3-1c6b-fbc27e7f7ad0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5655-84a3-8ec9-6e29a9cb7869	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5655-84a3-5e01-c071fe2d7ece	Prostor-read	Prostor - branje	t
00030000-5655-84a3-38a1-4e78c458345e	Prostor-write	Prostor - spreminjanje	t
00030000-5655-84a3-0676-8b7c61613972	Racun-read	Racun - branje	t
00030000-5655-84a3-12ec-e86c0e1e820b	Racun-write	Racun - spreminjanje	t
00030000-5655-84a3-700a-ce4d1f99108e	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5655-84a3-59c2-dd19c98df1fa	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5655-84a3-602b-e6bc02b84e11	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5655-84a3-d620-d477d428e431	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5655-84a3-2eea-ba45f1af51fa	Rekvizit-read	Rekvizit - branje	t
00030000-5655-84a3-dac3-95c6b16a8646	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5655-84a3-d97a-3bfa9307c968	Revizija-read	Revizija - branje	t
00030000-5655-84a3-707f-c8c7918e6fcd	Revizija-write	Revizija - spreminjanje	t
00030000-5655-84a3-f38b-05ec5349eaac	Rezervacija-read	Rezervacija - branje	t
00030000-5655-84a3-bbb9-7ac6ca265ead	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5655-84a3-edf7-8e61e447eeda	SedezniRed-read	SedezniRed - branje	t
00030000-5655-84a3-e457-3ea2a9be673e	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5655-84a3-a027-7f5df534bfaa	Sedez-read	Sedez - branje	t
00030000-5655-84a3-0ba0-fa9f784ae661	Sedez-write	Sedez - spreminjanje	t
00030000-5655-84a3-f093-ef4295b617e9	Sezona-read	Sezona - branje	t
00030000-5655-84a3-6e11-ab0f7ca7b514	Sezona-write	Sezona - spreminjanje	t
00030000-5655-84a3-7eb8-45420f12e9cc	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5655-84a3-7f1d-e6d60b77d98c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5655-84a3-bbd9-51a6e8ba030d	Stevilcenje-read	Stevilcenje - branje	t
00030000-5655-84a3-39b5-6d1d8a15769c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5655-84a3-7353-09d6bed2522d	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5655-84a3-b2e1-2328d15df12a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5655-84a3-fba4-8f63c3206b2a	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5655-84a3-1d22-27a71f583b24	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5655-84a3-39aa-6741e986c594	Telefonska-read	Telefonska - branje	t
00030000-5655-84a3-6f8c-c3f0ee84b6cb	Telefonska-write	Telefonska - spreminjanje	t
00030000-5655-84a3-c506-7eb1d493a890	TerminStoritve-read	TerminStoritve - branje	t
00030000-5655-84a3-5b6e-d9699db2d16c	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5655-84a3-304c-32510f81b3a1	TipFunkcije-read	TipFunkcije - branje	t
00030000-5655-84a3-be70-0c5c3e55658c	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5655-84a3-4e8d-a1c88673f04b	TipPopa-read	TipPopa - branje	t
00030000-5655-84a3-df09-14a2b12dcd59	TipPopa-write	TipPopa - spreminjanje	t
00030000-5655-84a3-1edc-a66154bf56bb	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5655-84a3-f6e5-02c6425cfbc0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5655-84a3-5b51-c2eabe091134	TipVaje-read	TipVaje - branje	t
00030000-5655-84a3-1638-b3adc9ba63b9	TipVaje-write	TipVaje - spreminjanje	t
00030000-5655-84a3-f30a-c83f50cd4d1d	Trr-read	Trr - branje	t
00030000-5655-84a3-f66e-16a1f29d086d	Trr-write	Trr - spreminjanje	t
00030000-5655-84a3-72e8-a231e519045a	Uprizoritev-read	Uprizoritev - branje	t
00030000-5655-84a3-434e-1c236393be8a	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5655-84a3-9aa9-67f22f1d2108	Vaja-read	Vaja - branje	t
00030000-5655-84a3-76df-23b2c9fdefc2	Vaja-write	Vaja - spreminjanje	t
00030000-5655-84a3-109e-9f77528c1d2d	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5655-84a3-9e89-0c8f0d1b9bc0	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5655-84a3-a68d-10eca38d6c5b	VrstaStroska-read	VrstaStroska - branje	t
00030000-5655-84a3-2b98-d27f91b53bd0	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5655-84a3-bd46-4d3f1b09e92e	Zaposlitev-read	Zaposlitev - branje	t
00030000-5655-84a3-50de-d22a64e283d1	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5655-84a3-9383-8a10d45fcc12	Zasedenost-read	Zasedenost - branje	t
00030000-5655-84a3-df03-7b5cba3132d6	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5655-84a3-4aea-417ff567c40b	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5655-84a3-f71a-d6d3737ee3f3	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5655-84a3-1538-72aa3c82c3e2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5655-84a3-d6d4-88e02e8a8396	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5655-84a3-e814-db553d5950b6	Job-read	Branje opravil - samo zase - branje	t
00030000-5655-84a3-e082-476108fde9ef	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5655-84a3-dd8b-eb6ca3785dce	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5655-84a3-daff-4f1238e433dd	Report-read	Report - branje	t
00030000-5655-84a3-57e9-da2fd462fc1f	Report-write	Report - spreminjanje	t
00030000-5655-84a3-8139-b614d0694beb	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5655-84a3-2827-69d558db024e	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5655-84a3-fd64-e2999be75e5f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5655-84a3-2c5f-f92c1b26bac0	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5655-84a3-d1b6-6792772845c4	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5655-84a3-aa2e-6b448412b190	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5655-84a3-52db-7283755cb9b0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5655-84a3-976c-04b732abff3d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5655-84a3-9bfc-ecae01d4eaca	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5655-84a3-22db-42b9b6ba54e4	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5655-84a3-ab72-ffcc67351b0b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5655-84a3-3800-8e3ad2359d31	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5655-84a3-f6ac-9a09f442be5e	Datoteka-write	Datoteka - spreminjanje	t
00030000-5655-84a3-4f80-7543d7287d56	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 29438956)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5655-84a3-603e-af1cff36fa86	00030000-5655-84a3-c56c-c9d332cca248
00020000-5655-84a3-a534-fd1e1331f140	00030000-5655-84a3-c7d3-c73913715636
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-6e2b-1b7e2bf3ffaa
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-2254-9ca35f2d0d0d
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-1cba-04ec9c12963d
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-d601-0d7fcf8bada8
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-caec-dd4927297d04
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-6d71-af2462f6fb1d
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-1ace-a827cac7a4c3
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-182b-de9716bdf88e
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-c7d3-c73913715636
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-24f7-b2390f94fc7c
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-56f9-0607bd805bb2
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-c7c5-c505c1b7593e
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-0e3a-b0df4e03a704
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-fc5c-08031d894fe3
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-e023-e72c3de23700
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-3311-30ad05dddb7a
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-9282-f69c31166026
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-b898-bfef1cbab2ed
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-46b6-75d1f26836c8
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-9a4a-d734f4950b7e
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-1f9b-fef5bfc860b3
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-ef81-2ff2e7ea1893
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-e7a1-775aaeeaa4d2
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-d4eb-127d2ef0ddfa
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-8c75-ec54ab64db81
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-f49c-b20241438ee1
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-fffe-8167821ad650
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-0fed-db28f31c9814
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-6d7a-8a07659b25d6
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-ce1e-181796523674
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-5e01-c071fe2d7ece
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-38a1-4e78c458345e
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-602b-e6bc02b84e11
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-d620-d477d428e431
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-2eea-ba45f1af51fa
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-dac3-95c6b16a8646
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-f093-ef4295b617e9
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-6e11-ab0f7ca7b514
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-304c-32510f81b3a1
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-72e8-a231e519045a
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-434e-1c236393be8a
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-9aa9-67f22f1d2108
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-76df-23b2c9fdefc2
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-9383-8a10d45fcc12
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-df03-7b5cba3132d6
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-4aea-417ff567c40b
00020000-5655-84a3-b559-ec00c6f53b1c	00030000-5655-84a3-1538-72aa3c82c3e2
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-6e2b-1b7e2bf3ffaa
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-caec-dd4927297d04
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-6d71-af2462f6fb1d
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-c7d3-c73913715636
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-0e3a-b0df4e03a704
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-e023-e72c3de23700
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-3311-30ad05dddb7a
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-9282-f69c31166026
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-b898-bfef1cbab2ed
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-46b6-75d1f26836c8
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-9a4a-d734f4950b7e
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-1f9b-fef5bfc860b3
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-e7a1-775aaeeaa4d2
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-8c75-ec54ab64db81
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-f49c-b20241438ee1
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-fffe-8167821ad650
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-5e01-c071fe2d7ece
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-602b-e6bc02b84e11
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-2eea-ba45f1af51fa
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-f093-ef4295b617e9
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-39aa-6741e986c594
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-6f8c-c3f0ee84b6cb
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-f30a-c83f50cd4d1d
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-f66e-16a1f29d086d
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-bd46-4d3f1b09e92e
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-50de-d22a64e283d1
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-4aea-417ff567c40b
00020000-5655-84a3-3448-0e01e2a2bdf0	00030000-5655-84a3-1538-72aa3c82c3e2
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-6e2b-1b7e2bf3ffaa
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-1cba-04ec9c12963d
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-caec-dd4927297d04
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-44f7-a0a9bac3dbc1
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-431e-47aecf88df09
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-6d71-2c5ef2c976b0
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-6d71-af2462f6fb1d
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-c7d3-c73913715636
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-56f9-0607bd805bb2
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-0e3a-b0df4e03a704
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-e023-e72c3de23700
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-9282-f69c31166026
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-b898-bfef1cbab2ed
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-46b6-75d1f26836c8
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-1f9b-fef5bfc860b3
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-e7a1-775aaeeaa4d2
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-fffe-8167821ad650
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-6d7a-8a07659b25d6
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-5e01-c071fe2d7ece
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-602b-e6bc02b84e11
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-2eea-ba45f1af51fa
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-f093-ef4295b617e9
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-304c-32510f81b3a1
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-9aa9-67f22f1d2108
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-9383-8a10d45fcc12
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-4aea-417ff567c40b
00020000-5655-84a3-2759-941a5d3e9ce4	00030000-5655-84a3-1538-72aa3c82c3e2
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-6e2b-1b7e2bf3ffaa
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-2254-9ca35f2d0d0d
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-d601-0d7fcf8bada8
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-caec-dd4927297d04
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-6d71-af2462f6fb1d
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-c7d3-c73913715636
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-0e3a-b0df4e03a704
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-9282-f69c31166026
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-b898-bfef1cbab2ed
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-1f9b-fef5bfc860b3
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-e7a1-775aaeeaa4d2
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-fffe-8167821ad650
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-5e01-c071fe2d7ece
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-602b-e6bc02b84e11
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-2eea-ba45f1af51fa
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-f093-ef4295b617e9
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-304c-32510f81b3a1
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-4aea-417ff567c40b
00020000-5655-84a3-0155-77966fe407c1	00030000-5655-84a3-1538-72aa3c82c3e2
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-6e2b-1b7e2bf3ffaa
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-caec-dd4927297d04
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-6d71-af2462f6fb1d
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-c7d3-c73913715636
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-0e3a-b0df4e03a704
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-9282-f69c31166026
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-b898-bfef1cbab2ed
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-1f9b-fef5bfc860b3
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-e7a1-775aaeeaa4d2
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-fffe-8167821ad650
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-5e01-c071fe2d7ece
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-602b-e6bc02b84e11
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-2eea-ba45f1af51fa
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-f093-ef4295b617e9
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-c506-7eb1d493a890
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-8a53-55640baf10ad
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-304c-32510f81b3a1
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-4aea-417ff567c40b
00020000-5655-84a3-6069-b014e8db1fd1	00030000-5655-84a3-1538-72aa3c82c3e2
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-3343-0dd700999900
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-c56c-c9d332cca248
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-6e2b-1b7e2bf3ffaa
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-2254-9ca35f2d0d0d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1cba-04ec9c12963d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-d601-0d7fcf8bada8
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-caec-dd4927297d04
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-44f7-a0a9bac3dbc1
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-a2b6-beb512f90840
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-8033-35f011b97d0e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f789-0f4e3240e47b
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-c361-06bd7bee3658
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-431e-47aecf88df09
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-ead4-6e03ca0992a3
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-4f80-7543d7287d56
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f6ac-9a09f442be5e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-6d71-af2462f6fb1d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1ace-a827cac7a4c3
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-182b-de9716bdf88e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-6d71-2c5ef2c976b0
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-dc4b-ad941723daf2
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-a0ae-293349215562
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-471d-7e15790f694a
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-b8d0-ebde44e9e306
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-8748-6f84e1d4cbd7
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-c7d3-c73913715636
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-24f7-b2390f94fc7c
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-3b2a-ac83987283af
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-13d3-94232cbb2916
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-56f9-0607bd805bb2
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-c7c5-c505c1b7593e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-0e3a-b0df4e03a704
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-fc5c-08031d894fe3
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-dd8b-eb6ca3785dce
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-e814-db553d5950b6
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-e082-476108fde9ef
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-e023-e72c3de23700
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-3311-30ad05dddb7a
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-fc64-9c8d48c4cceb
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-d621-fba49956e404
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-8139-b614d0694beb
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-2827-69d558db024e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-fd64-e2999be75e5f
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-2c5f-f92c1b26bac0
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-aa2e-6b448412b190
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-d1b6-6792772845c4
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1eb1-b14c2bafaaa4
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-b222-902ff507204e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9282-f69c31166026
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-d38e-dc8677360159
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-b898-bfef1cbab2ed
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-8dec-e28e8d19a5f3
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-b7f7-ff6fbe03d95d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-619e-f9c8d5724a88
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-46b6-75d1f26836c8
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-6c4a-5b9a6d794c4d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9a4a-d734f4950b7e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-0ab4-dce5711aa635
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-a91c-0dfeb02db7b7
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-fa29-ea9782f8dd7f
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-948e-41e3ddc912b2
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-abc5-9fb7532be279
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f5cd-62d8997bf617
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1f9b-fef5bfc860b3
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-ef81-2ff2e7ea1893
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-e7a1-775aaeeaa4d2
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-d4eb-127d2ef0ddfa
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-68af-246be821ee71
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f5d3-06661c7704e8
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-01ec-b4452910c230
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-cfe4-48b9c217ddc1
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-8c75-ec54ab64db81
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f49c-b20241438ee1
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9563-593ba9bbd8d3
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-66c2-6886fc779222
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-fffe-8167821ad650
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-0fed-db28f31c9814
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-5f7d-672bb36cf532
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-95f9-fc2087f56172
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-b075-6d71e890a30b
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-470b-0bcbd063c3d7
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-6d7a-8a07659b25d6
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-ce1e-181796523674
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-68b4-6f12ccc13812
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9e27-93329e56b029
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-89ef-0cc1dc9b9d65
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-c007-9ab06c3b2f44
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-b877-edfb5f65626c
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-c4ac-3cd4b918ecd2
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f96b-87052862d6ce
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-b128-9f6dccb76a06
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-24a9-012f2ac97fef
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-c8f0-e2c0403882f5
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-700d-22ee40c03cc3
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9435-4f02c6001284
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-200d-5e660ed6c444
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-5975-5f3c137d9322
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f4e9-59f491e738a7
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-06f7-ce4f7278a75b
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-5fd9-e9ceac6ded60
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-4b7b-b0d3efeddb82
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-3bf9-ef79c78f0d81
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-a927-d3e905a34db0
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1c6b-fbc27e7f7ad0
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-8ec9-6e29a9cb7869
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-5e01-c071fe2d7ece
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-38a1-4e78c458345e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-0676-8b7c61613972
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-12ec-e86c0e1e820b
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-700a-ce4d1f99108e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-59c2-dd19c98df1fa
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-2eea-ba45f1af51fa
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-dac3-95c6b16a8646
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-602b-e6bc02b84e11
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-d620-d477d428e431
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-daff-4f1238e433dd
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-57e9-da2fd462fc1f
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-d97a-3bfa9307c968
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-707f-c8c7918e6fcd
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f38b-05ec5349eaac
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-bbb9-7ac6ca265ead
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-a027-7f5df534bfaa
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-0ba0-fa9f784ae661
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-edf7-8e61e447eeda
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-e457-3ea2a9be673e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f093-ef4295b617e9
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-6e11-ab0f7ca7b514
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-bbd9-51a6e8ba030d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-39b5-6d1d8a15769c
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-7eb8-45420f12e9cc
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-7f1d-e6d60b77d98c
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-7353-09d6bed2522d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-b2e1-2328d15df12a
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-fba4-8f63c3206b2a
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1d22-27a71f583b24
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-39aa-6741e986c594
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-6f8c-c3f0ee84b6cb
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-c506-7eb1d493a890
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-8a53-55640baf10ad
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-5b6e-d9699db2d16c
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-304c-32510f81b3a1
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-be70-0c5c3e55658c
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-4e8d-a1c88673f04b
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-df09-14a2b12dcd59
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1edc-a66154bf56bb
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f6e5-02c6425cfbc0
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-5b51-c2eabe091134
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1638-b3adc9ba63b9
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f30a-c83f50cd4d1d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f66e-16a1f29d086d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-72e8-a231e519045a
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-434e-1c236393be8a
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9aa9-67f22f1d2108
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-76df-23b2c9fdefc2
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-109e-9f77528c1d2d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9e89-0c8f0d1b9bc0
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-a68d-10eca38d6c5b
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-2b98-d27f91b53bd0
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-3800-8e3ad2359d31
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-ab72-ffcc67351b0b
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-976c-04b732abff3d
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-52db-7283755cb9b0
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-22db-42b9b6ba54e4
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9bfc-ecae01d4eaca
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-bd46-4d3f1b09e92e
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-50de-d22a64e283d1
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-9383-8a10d45fcc12
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-df03-7b5cba3132d6
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-4aea-417ff567c40b
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-f71a-d6d3737ee3f3
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-1538-72aa3c82c3e2
00020000-5655-84a5-a95f-82434b15cfe4	00030000-5655-84a3-d6d4-88e02e8a8396
00020000-5655-84a5-6b4b-d9e88f092dab	00030000-5655-84a3-22db-42b9b6ba54e4
00020000-5655-84a5-9ac0-fd3d8a31594a	00030000-5655-84a3-9bfc-ecae01d4eaca
00020000-5655-84a5-9d6c-733b589880ff	00030000-5655-84a3-434e-1c236393be8a
00020000-5655-84a5-3eb0-e6409e4bbff8	00030000-5655-84a3-72e8-a231e519045a
00020000-5655-84a5-f5ae-e52f663e566b	00030000-5655-84a3-2827-69d558db024e
00020000-5655-84a5-7d68-34cf5440f64e	00030000-5655-84a3-fd64-e2999be75e5f
00020000-5655-84a5-c467-884fed2f0fb7	00030000-5655-84a3-2c5f-f92c1b26bac0
00020000-5655-84a5-6666-bdd98caf4ccc	00030000-5655-84a3-8139-b614d0694beb
00020000-5655-84a5-6d47-f82616727515	00030000-5655-84a3-aa2e-6b448412b190
00020000-5655-84a5-324a-8612aa9e008b	00030000-5655-84a3-d1b6-6792772845c4
00020000-5655-84a5-32ae-3982961c1548	00030000-5655-84a3-976c-04b732abff3d
00020000-5655-84a5-5ed2-f946f060bb5d	00030000-5655-84a3-52db-7283755cb9b0
00020000-5655-84a5-61ce-7c84658d8aa8	00030000-5655-84a3-9a4a-d734f4950b7e
00020000-5655-84a5-2ad6-fda47c3b4652	00030000-5655-84a3-46b6-75d1f26836c8
00020000-5655-84a5-4ec7-c4e755ba6fdb	00030000-5655-84a3-f6ac-9a09f442be5e
00020000-5655-84a5-537a-98d4c8babf8b	00030000-5655-84a3-4f80-7543d7287d56
00020000-5655-84a5-5eea-63498e1bda09	00030000-5655-84a3-1f9b-fef5bfc860b3
00020000-5655-84a5-5eea-63498e1bda09	00030000-5655-84a3-ef81-2ff2e7ea1893
00020000-5655-84a5-5eea-63498e1bda09	00030000-5655-84a3-72e8-a231e519045a
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-c361-06bd7bee3658
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-ead4-6e03ca0992a3
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-f6ac-9a09f442be5e
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-9a4a-d734f4950b7e
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-52db-7283755cb9b0
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-9bfc-ecae01d4eaca
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-f789-0f4e3240e47b
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-431e-47aecf88df09
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-4f80-7543d7287d56
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-46b6-75d1f26836c8
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-976c-04b732abff3d
00020000-5655-84a5-dee7-640f4c0033aa	00030000-5655-84a3-22db-42b9b6ba54e4
00020000-5655-84a5-55df-c7d5fb15cd0e	00030000-5655-84a3-f789-0f4e3240e47b
00020000-5655-84a5-55df-c7d5fb15cd0e	00030000-5655-84a3-431e-47aecf88df09
00020000-5655-84a5-55df-c7d5fb15cd0e	00030000-5655-84a3-4f80-7543d7287d56
00020000-5655-84a5-55df-c7d5fb15cd0e	00030000-5655-84a3-976c-04b732abff3d
00020000-5655-84a5-55df-c7d5fb15cd0e	00030000-5655-84a3-22db-42b9b6ba54e4
00020000-5655-84a5-ff7c-0fe38b7033a6	00030000-5655-84a3-46b6-75d1f26836c8
00020000-5655-84a5-ff7c-0fe38b7033a6	00030000-5655-84a3-9a4a-d734f4950b7e
00020000-5655-84a5-ff7c-0fe38b7033a6	00030000-5655-84a3-bd46-4d3f1b09e92e
00020000-5655-84a5-ff7c-0fe38b7033a6	00030000-5655-84a3-50de-d22a64e283d1
00020000-5655-84a5-b512-14613c59b33c	00030000-5655-84a3-bd46-4d3f1b09e92e
\.


--
-- TOC entry 3139 (class 0 OID 29439346)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 29439380)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 29439517)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5655-84a5-d2ff-8a6728c5d28b	00090000-5655-84a5-7008-df89473de3c8	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5655-84a5-bc5b-c3d5db35e66c	00090000-5655-84a5-1088-56fdc4b4dddf	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5655-84a5-b9de-565d96fbd4c4	00090000-5655-84a5-416f-5a0ca28eaacd	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5655-84a5-a1a5-4d0a6c6ca091	00090000-5655-84a5-874d-7fa4a2ce0226	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 29439038)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5655-84a5-2212-4fc2c9c91b89	\N	00040000-5655-84a2-922c-48aefebb4b09	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-84a5-ea74-4ec6fcec3bf5	\N	00040000-5655-84a2-922c-48aefebb4b09	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5655-84a5-4b4f-e114ed6bb93c	\N	00040000-5655-84a2-922c-48aefebb4b09	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-84a5-0d6c-499e9a1f8389	\N	00040000-5655-84a2-922c-48aefebb4b09	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-84a5-802f-4c82e98ae4e8	\N	00040000-5655-84a2-922c-48aefebb4b09	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-84a5-d165-ed3e4180f721	\N	00040000-5655-84a2-52b1-77c94bfa5c29	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-84a5-4305-c6239bb76dd8	\N	00040000-5655-84a2-be94-6ae2073f5a18	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-84a5-b06a-fdee46fa56e1	\N	00040000-5655-84a2-89bb-df107efd73fc	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-84a5-a596-2d8fdbf05d16	\N	00040000-5655-84a2-abf1-3e301feab55d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5655-84a7-7dec-64e0518f3fd2	\N	00040000-5655-84a2-922c-48aefebb4b09	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 29439083)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5655-84a2-9093-6aad064a256c	8341	Adlešiči
00050000-5655-84a2-25a4-ada98b637ac8	5270	Ajdovščina
00050000-5655-84a2-93ca-1a1b49964712	6280	Ankaran/Ancarano
00050000-5655-84a2-571b-48c8edf2382a	9253	Apače
00050000-5655-84a2-7108-f6fde1e8fe9b	8253	Artiče
00050000-5655-84a2-5909-6edf961cc0df	4275	Begunje na Gorenjskem
00050000-5655-84a2-6233-3b0f300dda86	1382	Begunje pri Cerknici
00050000-5655-84a2-ae01-5f706164e41f	9231	Beltinci
00050000-5655-84a2-d488-80d6959d46f8	2234	Benedikt
00050000-5655-84a2-c172-bd6f8be28c52	2345	Bistrica ob Dravi
00050000-5655-84a2-8c31-1211b65874d4	3256	Bistrica ob Sotli
00050000-5655-84a2-d3c9-550ad1c3cd94	8259	Bizeljsko
00050000-5655-84a2-09b0-4abf275fcb51	1223	Blagovica
00050000-5655-84a2-8afa-2eafcc7bc694	8283	Blanca
00050000-5655-84a2-52c0-e781435ca0cb	4260	Bled
00050000-5655-84a2-89d6-a8d6bc685c18	4273	Blejska Dobrava
00050000-5655-84a2-faae-b5f4fa79491d	9265	Bodonci
00050000-5655-84a2-8d09-e622088154a1	9222	Bogojina
00050000-5655-84a2-9e2a-2cedd043a584	4263	Bohinjska Bela
00050000-5655-84a2-4eef-9cf68049a9d8	4264	Bohinjska Bistrica
00050000-5655-84a2-199e-4499a2a9cf48	4265	Bohinjsko jezero
00050000-5655-84a2-1678-f280b10fccfd	1353	Borovnica
00050000-5655-84a2-0952-1d88ce5dad8a	8294	Boštanj
00050000-5655-84a2-d1c7-53b2a65f66c7	5230	Bovec
00050000-5655-84a2-a76e-a735fa6ccef9	5295	Branik
00050000-5655-84a2-8cac-4436854cb79e	3314	Braslovče
00050000-5655-84a2-2955-88dc9762134f	5223	Breginj
00050000-5655-84a2-c014-0aa9a7185cbc	8280	Brestanica
00050000-5655-84a2-69fd-66849b934cf7	2354	Bresternica
00050000-5655-84a2-d33b-86bb2ad4e783	4243	Brezje
00050000-5655-84a2-0b6f-d4a7861c7005	1351	Brezovica pri Ljubljani
00050000-5655-84a2-7793-4b313652c518	8250	Brežice
00050000-5655-84a2-26c0-5014cb4909b6	4210	Brnik - Aerodrom
00050000-5655-84a2-fa05-ce9f369a6ff7	8321	Brusnice
00050000-5655-84a2-f765-771381ae4cf2	3255	Buče
00050000-5655-84a2-69b4-dea23e56868d	8276	Bučka 
00050000-5655-84a2-2865-9b78e3faea89	9261	Cankova
00050000-5655-84a2-9f3c-0b3d3358eafd	3000	Celje 
00050000-5655-84a2-8ca0-18ace5f87d03	3001	Celje - poštni predali
00050000-5655-84a2-edce-942ac910ca83	4207	Cerklje na Gorenjskem
00050000-5655-84a2-83ad-b7544206ce87	8263	Cerklje ob Krki
00050000-5655-84a2-80bc-07afb4080c7e	1380	Cerknica
00050000-5655-84a2-eb5b-72930fcc2fc1	5282	Cerkno
00050000-5655-84a2-a53c-9cb2c563418f	2236	Cerkvenjak
00050000-5655-84a2-4421-277a14298599	2215	Ceršak
00050000-5655-84a2-64a4-ef0f599c90eb	2326	Cirkovce
00050000-5655-84a2-b522-355553e46335	2282	Cirkulane
00050000-5655-84a2-8a9d-75612dee90ec	5273	Col
00050000-5655-84a2-650a-bec73172530e	8251	Čatež ob Savi
00050000-5655-84a2-7b60-692b4be212a8	1413	Čemšenik
00050000-5655-84a2-207d-20012487e45c	5253	Čepovan
00050000-5655-84a2-5380-3113265060f8	9232	Črenšovci
00050000-5655-84a2-daa4-ef452bbd88b3	2393	Črna na Koroškem
00050000-5655-84a2-d134-25905ddb2ae9	6275	Črni Kal
00050000-5655-84a2-51b3-324c63defc76	5274	Črni Vrh nad Idrijo
00050000-5655-84a2-6a33-775cb934c6b0	5262	Črniče
00050000-5655-84a2-b7f8-4a85237c3152	8340	Črnomelj
00050000-5655-84a2-3ecf-06b16e0621e9	6271	Dekani
00050000-5655-84a2-7eca-1c313fbc805c	5210	Deskle
00050000-5655-84a2-d383-ab34ee8b6a66	2253	Destrnik
00050000-5655-84a2-6886-684acf4cad2b	6215	Divača
00050000-5655-84a2-2297-201a2347117a	1233	Dob
00050000-5655-84a2-9b7c-f5790f78a499	3224	Dobje pri Planini
00050000-5655-84a2-6b1c-9da7616ccb8b	8257	Dobova
00050000-5655-84a2-991c-d1d3e8a6c177	1423	Dobovec
00050000-5655-84a2-53f4-9c267e4f7166	5263	Dobravlje
00050000-5655-84a2-5e72-e22ddb88fe0a	3204	Dobrna
00050000-5655-84a2-af65-b8f7ef09484b	8211	Dobrnič
00050000-5655-84a2-66d3-a1ece4fedd76	1356	Dobrova
00050000-5655-84a2-72d3-1f0901cf32f1	9223	Dobrovnik/Dobronak 
00050000-5655-84a2-840e-4a97bc7b765c	5212	Dobrovo v Brdih
00050000-5655-84a2-a3d9-24fbfc4ddf24	1431	Dol pri Hrastniku
00050000-5655-84a2-3ee3-da068573b7b4	1262	Dol pri Ljubljani
00050000-5655-84a2-259e-0429275cbbc0	1273	Dole pri Litiji
00050000-5655-84a2-09ac-fc9402b1a3ab	1331	Dolenja vas
00050000-5655-84a2-5b62-7683a2c69b16	8350	Dolenjske Toplice
00050000-5655-84a2-f38f-a70ffb9fb3d5	1230	Domžale
00050000-5655-84a2-181b-6575d3d68833	2252	Dornava
00050000-5655-84a2-3820-654deddbd721	5294	Dornberk
00050000-5655-84a2-1192-d90908156a34	1319	Draga
00050000-5655-84a2-d603-3c1ee3387601	8343	Dragatuš
00050000-5655-84a2-4bdd-ab66ea495733	3222	Dramlje
00050000-5655-84a2-fdc2-788062f0239e	2370	Dravograd
00050000-5655-84a2-3d5c-c2adb8dc13b8	4203	Duplje
00050000-5655-84a2-81fa-9626ae8382c8	6221	Dutovlje
00050000-5655-84a2-5f6f-af56bfeafaa0	8361	Dvor
00050000-5655-84a2-4771-a48fdd4dbc1c	2343	Fala
00050000-5655-84a2-3805-7cbe637a2630	9208	Fokovci
00050000-5655-84a2-b920-60eafb5e9bdc	2313	Fram
00050000-5655-84a2-7cb4-b5aacf4158aa	3213	Frankolovo
00050000-5655-84a2-9a7f-337877ba32a9	1274	Gabrovka
00050000-5655-84a2-523a-f3e770a71bae	8254	Globoko
00050000-5655-84a2-9471-c6d765460fdb	5275	Godovič
00050000-5655-84a2-8716-5957ed4575b2	4204	Golnik
00050000-5655-84a2-c795-1b36c7948871	3303	Gomilsko
00050000-5655-84a2-0a1f-3b5b40003030	4224	Gorenja vas
00050000-5655-84a2-2962-c879f609b0f7	3263	Gorica pri Slivnici
00050000-5655-84a2-972e-84151d664402	2272	Gorišnica
00050000-5655-84a2-01d8-504af38ef729	9250	Gornja Radgona
00050000-5655-84a2-13ef-084f57719e35	3342	Gornji Grad
00050000-5655-84a2-1926-c83683d8a101	4282	Gozd Martuljek
00050000-5655-84a2-7817-01c080cc58f6	6272	Gračišče
00050000-5655-84a2-123c-ea927e856971	9264	Grad
00050000-5655-84a2-88bc-60499f2c9970	8332	Gradac
00050000-5655-84a2-426e-a358bf2e5390	1384	Grahovo
00050000-5655-84a2-bcc7-0ed2587fc3aa	5242	Grahovo ob Bači
00050000-5655-84a2-76eb-b792422d4f5a	5251	Grgar
00050000-5655-84a2-8944-a1e8a83b07b2	3302	Griže
00050000-5655-84a2-b9bd-0e7611ce9f55	3231	Grobelno
00050000-5655-84a2-1663-048b33732695	1290	Grosuplje
00050000-5655-84a2-b52c-2cb72e7f4241	2288	Hajdina
00050000-5655-84a2-3830-f8963d0ed799	8362	Hinje
00050000-5655-84a2-3d7a-4c0c89f56ebc	2311	Hoče
00050000-5655-84a2-3d79-1cd7d60784e1	9205	Hodoš/Hodos
00050000-5655-84a2-c333-425f6bfa61c0	1354	Horjul
00050000-5655-84a2-0083-cd85f35ce43b	1372	Hotedršica
00050000-5655-84a2-cd94-c8af13d761d9	1430	Hrastnik
00050000-5655-84a2-950e-22393197553f	6225	Hruševje
00050000-5655-84a2-248f-1e9f283651aa	4276	Hrušica
00050000-5655-84a2-d062-a649412583bd	5280	Idrija
00050000-5655-84a2-cd8b-db2041faa2e3	1292	Ig
00050000-5655-84a2-86c8-48ccd78f2057	6250	Ilirska Bistrica
00050000-5655-84a2-c81d-6bd7c99fde2e	6251	Ilirska Bistrica-Trnovo
00050000-5655-84a2-2707-885779843bc3	1295	Ivančna Gorica
00050000-5655-84a2-3253-03b1802e8ea9	2259	Ivanjkovci
00050000-5655-84a2-30a8-748aae17993d	1411	Izlake
00050000-5655-84a2-82a2-9a3ebe1d09d8	6310	Izola/Isola
00050000-5655-84a2-3488-ff45ab2e174f	2222	Jakobski Dol
00050000-5655-84a2-1c20-734b911663aa	2221	Jarenina
00050000-5655-84a2-80f6-71e21e481a3c	6254	Jelšane
00050000-5655-84a2-0ea0-db12774f574f	4270	Jesenice
00050000-5655-84a2-934d-e2ad13a64b20	8261	Jesenice na Dolenjskem
00050000-5655-84a2-15f7-bdd4f9342fe7	3273	Jurklošter
00050000-5655-84a2-e54b-b42c58b2fe4f	2223	Jurovski Dol
00050000-5655-84a2-f588-77b4b85da7f7	2256	Juršinci
00050000-5655-84a2-bd65-10b8baa835b6	5214	Kal nad Kanalom
00050000-5655-84a2-7cd9-696e7d0c08d1	3233	Kalobje
00050000-5655-84a2-cb1d-314a2b09023b	4246	Kamna Gorica
00050000-5655-84a2-2e6d-abb2df84e5b8	2351	Kamnica
00050000-5655-84a2-ff4f-5411b6a99a21	1241	Kamnik
00050000-5655-84a2-357e-4fd10ec97e9a	5213	Kanal
00050000-5655-84a2-ef1d-9c9f052b49af	8258	Kapele
00050000-5655-84a2-737a-23fbeeb605a9	2362	Kapla
00050000-5655-84a2-f9ba-b5c1a8db4514	2325	Kidričevo
00050000-5655-84a2-6b54-8ff48dfce83d	1412	Kisovec
00050000-5655-84a2-1ad4-92160c610dd9	6253	Knežak
00050000-5655-84a2-c860-8c7d6b432bf1	5222	Kobarid
00050000-5655-84a2-cc45-9fce39c7a606	9227	Kobilje
00050000-5655-84a2-2555-4ee113e79457	1330	Kočevje
00050000-5655-84a2-5d45-29a90c2245c9	1338	Kočevska Reka
00050000-5655-84a2-76fb-60b228d8226c	2276	Kog
00050000-5655-84a2-aae4-0015284a4c42	5211	Kojsko
00050000-5655-84a2-78d0-212b163a90be	6223	Komen
00050000-5655-84a2-8311-44b17498d7c5	1218	Komenda
00050000-5655-84a2-64db-bae017c2f198	6000	Koper/Capodistria 
00050000-5655-84a2-4364-80df7573dad0	6001	Koper/Capodistria - poštni predali
00050000-5655-84a2-b3bb-4e0d5627607f	8282	Koprivnica
00050000-5655-84a2-3880-101a11302624	5296	Kostanjevica na Krasu
00050000-5655-84a2-fef4-c572346e9bb3	8311	Kostanjevica na Krki
00050000-5655-84a2-8ae4-dd37013d5daa	1336	Kostel
00050000-5655-84a2-d924-d9a735d6ddf7	6256	Košana
00050000-5655-84a2-3171-be11c4ad3bf8	2394	Kotlje
00050000-5655-84a2-faee-a99b9488f327	6240	Kozina
00050000-5655-84a2-8520-19b7d8eafabf	3260	Kozje
00050000-5655-84a2-b43d-bef2d14c5479	4000	Kranj 
00050000-5655-84a2-76ce-12c6f8567377	4001	Kranj - poštni predali
00050000-5655-84a2-1cc7-90c270aab2e8	4280	Kranjska Gora
00050000-5655-84a2-1897-c37f93f507ac	1281	Kresnice
00050000-5655-84a2-c183-bbb30d5b2470	4294	Križe
00050000-5655-84a2-5e22-689f252ae328	9206	Križevci
00050000-5655-84a2-7569-e7b88dc94587	9242	Križevci pri Ljutomeru
00050000-5655-84a2-aa65-308352ddf0de	1301	Krka
00050000-5655-84a2-f0ec-47a6a5941358	8296	Krmelj
00050000-5655-84a2-d46b-0975516927d7	4245	Kropa
00050000-5655-84a2-f83e-773dbe53ec37	8262	Krška vas
00050000-5655-84a2-8126-d1544afe4698	8270	Krško
00050000-5655-84a2-45ad-c919aeca9c1d	9263	Kuzma
00050000-5655-84a2-9bbe-b4917be35bef	2318	Laporje
00050000-5655-84a2-d15a-19318f9b813a	3270	Laško
00050000-5655-84a2-14d4-e14a3e545c5a	1219	Laze v Tuhinju
00050000-5655-84a2-58ea-513ace006105	2230	Lenart v Slovenskih goricah
00050000-5655-84a2-376c-35fbbe31f7bf	9220	Lendava/Lendva
00050000-5655-84a2-85be-7bfc158341e0	4248	Lesce
00050000-5655-84a2-7446-c8ef3220f84b	3261	Lesično
00050000-5655-84a2-7c3d-7ab17f5aeec4	8273	Leskovec pri Krškem
00050000-5655-84a2-4f27-313eee1b1ba1	2372	Libeliče
00050000-5655-84a2-eb32-1ea41ecf6974	2341	Limbuš
00050000-5655-84a2-5b80-b8fd897f26b2	1270	Litija
00050000-5655-84a2-6a6b-80244e46177f	3202	Ljubečna
00050000-5655-84a2-bdae-4cf30c3f670e	1000	Ljubljana 
00050000-5655-84a2-eace-0aecac619634	1001	Ljubljana - poštni predali
00050000-5655-84a2-d211-bc0bf0952b8f	1231	Ljubljana - Črnuče
00050000-5655-84a2-e360-490237e211b5	1261	Ljubljana - Dobrunje
00050000-5655-84a2-23d4-aae7f12730c3	1260	Ljubljana - Polje
00050000-5655-84a2-fc72-193aa3c43b0c	1210	Ljubljana - Šentvid
00050000-5655-84a2-4b0f-81cad1932df9	1211	Ljubljana - Šmartno
00050000-5655-84a2-938f-99a064df36a5	3333	Ljubno ob Savinji
00050000-5655-84a2-fe9f-e8c1a2d8ade7	9240	Ljutomer
00050000-5655-84a2-d7a3-117e91b6bbb2	3215	Loče
00050000-5655-84a2-24d2-0821e7626f67	5231	Log pod Mangartom
00050000-5655-84a2-588f-853fc5647090	1358	Log pri Brezovici
00050000-5655-84a2-429d-ab12a4a7f946	1370	Logatec
00050000-5655-84a2-5817-b01dcb02399e	1371	Logatec
00050000-5655-84a2-7a81-16e569024600	1434	Loka pri Zidanem Mostu
00050000-5655-84a2-00d2-a531dadf89c3	3223	Loka pri Žusmu
00050000-5655-84a2-e427-9373a55af1d5	6219	Lokev
00050000-5655-84a2-1022-2ff2011f5fe6	1318	Loški Potok
00050000-5655-84a2-945a-13da849d990f	2324	Lovrenc na Dravskem polju
00050000-5655-84a2-dcc3-6984c586b361	2344	Lovrenc na Pohorju
00050000-5655-84a2-b217-cf63d5b21277	3334	Luče
00050000-5655-84a2-14d5-e3f86719a4b0	1225	Lukovica
00050000-5655-84a2-decc-90450a7cb9e9	9202	Mačkovci
00050000-5655-84a2-9a4b-a465d87f948a	2322	Majšperk
00050000-5655-84a2-3fcc-bb04610d1147	2321	Makole
00050000-5655-84a2-2331-d6d1050331ff	9243	Mala Nedelja
00050000-5655-84a2-959a-b5c5374605cb	2229	Malečnik
00050000-5655-84a2-31d4-3a8ef696adad	6273	Marezige
00050000-5655-84a2-0739-52fee5af2152	2000	Maribor 
00050000-5655-84a2-1338-85159adff1f6	2001	Maribor - poštni predali
00050000-5655-84a2-90c6-326f03d47b76	2206	Marjeta na Dravskem polju
00050000-5655-84a2-a873-950ef3286c5a	2281	Markovci
00050000-5655-84a2-9684-151c384bfb70	9221	Martjanci
00050000-5655-84a2-d8d9-1f22cd2c95d6	6242	Materija
00050000-5655-84a2-2abb-d51eef52ef5f	4211	Mavčiče
00050000-5655-84a2-889f-7c60dc4c7ac0	1215	Medvode
00050000-5655-84a2-6465-8ed1d814e022	1234	Mengeš
00050000-5655-84a2-9154-e9f302587dc8	8330	Metlika
00050000-5655-84a2-3635-c250ba352a13	2392	Mežica
00050000-5655-84a2-3e3f-886898630b05	2204	Miklavž na Dravskem polju
00050000-5655-84a2-592c-a0c6b41e7ab8	2275	Miklavž pri Ormožu
00050000-5655-84a2-8135-3a3716aa12d0	5291	Miren
00050000-5655-84a2-fded-92ba4c6dca1c	8233	Mirna
00050000-5655-84a2-13a1-1da68cdd8b39	8216	Mirna Peč
00050000-5655-84a2-7f76-eb4129db05d7	2382	Mislinja
00050000-5655-84a2-993c-c2b002a15de7	4281	Mojstrana
00050000-5655-84a2-76cb-dfc3c1140182	8230	Mokronog
00050000-5655-84a2-18ce-c7720b36955a	1251	Moravče
00050000-5655-84a2-1609-87628f63f650	9226	Moravske Toplice
00050000-5655-84a2-4283-53005e632915	5216	Most na Soči
00050000-5655-84a2-f23b-c280e3da1082	1221	Motnik
00050000-5655-84a2-ee12-65585513fb39	3330	Mozirje
00050000-5655-84a2-4f0f-af243b9245a3	9000	Murska Sobota 
00050000-5655-84a2-b289-36ee959da296	9001	Murska Sobota - poštni predali
00050000-5655-84a2-d7d4-357aa338fee3	2366	Muta
00050000-5655-84a2-b320-d1662934a8c1	4202	Naklo
00050000-5655-84a2-bd2b-77b0bc5c9603	3331	Nazarje
00050000-5655-84a2-267e-ef726367fcc4	1357	Notranje Gorice
00050000-5655-84a2-6317-3f8db0b6a406	3203	Nova Cerkev
00050000-5655-84a2-9b11-5201325bb4ca	5000	Nova Gorica 
00050000-5655-84a2-a3aa-e4b271f3d5ec	5001	Nova Gorica - poštni predali
00050000-5655-84a2-7ed9-f1cc959957fd	1385	Nova vas
00050000-5655-84a2-c53d-a80f2be940d2	8000	Novo mesto
00050000-5655-84a2-d106-119eb6ad27d6	8001	Novo mesto - poštni predali
00050000-5655-84a2-5f1f-9f585e7ab40d	6243	Obrov
00050000-5655-84a2-8c08-47bffc61c046	9233	Odranci
00050000-5655-84a2-9e6c-e070afc7cb13	2317	Oplotnica
00050000-5655-84a2-bbed-92f0641e6a79	2312	Orehova vas
00050000-5655-84a2-ce99-5e096f4773cb	2270	Ormož
00050000-5655-84a2-dd63-8de63bb66b43	1316	Ortnek
00050000-5655-84a2-a201-46a683061633	1337	Osilnica
00050000-5655-84a2-f565-c262dbdb3f18	8222	Otočec
00050000-5655-84a2-3cab-c7c30919df1e	2361	Ožbalt
00050000-5655-84a2-866e-ca2bb2545452	2231	Pernica
00050000-5655-84a2-d60e-5276f95ab09d	2211	Pesnica pri Mariboru
00050000-5655-84a2-8ad4-7aeb52367509	9203	Petrovci
00050000-5655-84a2-b6c0-3036ce5b4410	3301	Petrovče
00050000-5655-84a2-fa30-f9f88fe13668	6330	Piran/Pirano
00050000-5655-84a2-ae22-f81bf8818e7c	8255	Pišece
00050000-5655-84a2-3261-4521d1f9f3a0	6257	Pivka
00050000-5655-84a2-08cb-fa90446817b2	6232	Planina
00050000-5655-84a2-1486-5575fecbb873	3225	Planina pri Sevnici
00050000-5655-84a2-f040-b86dca47ce8b	6276	Pobegi
00050000-5655-84a2-a353-bf90f6656903	8312	Podbočje
00050000-5655-84a2-2f9d-7e5ff118cbb2	5243	Podbrdo
00050000-5655-84a2-e555-3f6f09248574	3254	Podčetrtek
00050000-5655-84a2-0572-54b6a80f9065	2273	Podgorci
00050000-5655-84a2-1fe9-1f59c035faea	6216	Podgorje
00050000-5655-84a2-32e5-9762bda21aec	2381	Podgorje pri Slovenj Gradcu
00050000-5655-84a2-62a8-842358159db5	6244	Podgrad
00050000-5655-84a2-9213-5fdb1e443ae0	1414	Podkum
00050000-5655-84a2-f073-482000d06dc8	2286	Podlehnik
00050000-5655-84a2-f941-0d4d5886aae0	5272	Podnanos
00050000-5655-84a2-4cd9-92d03aabdd30	4244	Podnart
00050000-5655-84a2-2a89-5a5e74f9d3e6	3241	Podplat
00050000-5655-84a2-21aa-60946644263f	3257	Podsreda
00050000-5655-84a2-57fd-aeb6e8625853	2363	Podvelka
00050000-5655-84a2-b48a-a2132b9a413e	2208	Pohorje
00050000-5655-84a2-a713-73c2637ec6b0	2257	Polenšak
00050000-5655-84a2-63a8-9739adb8b54d	1355	Polhov Gradec
00050000-5655-84a2-2740-f51c254710bd	4223	Poljane nad Škofjo Loko
00050000-5655-84a2-9607-7c42cd66a781	2319	Poljčane
00050000-5655-84a2-5faf-73740a194eb3	1272	Polšnik
00050000-5655-84a2-a621-13272eaf1f79	3313	Polzela
00050000-5655-84a2-f2c1-62427c9308a8	3232	Ponikva
00050000-5655-84a2-e2e1-88dafddd3575	6320	Portorož/Portorose
00050000-5655-84a2-7217-6a9cdc0c103c	6230	Postojna
00050000-5655-84a2-b7bc-2e0735c75c65	2331	Pragersko
00050000-5655-84a2-2cbe-62a561650409	3312	Prebold
00050000-5655-84a2-ee0b-b0576f248942	4205	Preddvor
00050000-5655-84a2-1b45-5af7fa588286	6255	Prem
00050000-5655-84a2-6f79-69bfd427cefe	1352	Preserje
00050000-5655-84a2-2df4-3a80c3182f9c	6258	Prestranek
00050000-5655-84a2-e697-6eb17386e176	2391	Prevalje
00050000-5655-84a2-5727-2adf37df3d25	3262	Prevorje
00050000-5655-84a2-9fc1-c5bad7d4e070	1276	Primskovo 
00050000-5655-84a2-97b4-959b0f53287d	3253	Pristava pri Mestinju
00050000-5655-84a2-cff5-a1bf5ac6aa66	9207	Prosenjakovci/Partosfalva
00050000-5655-84a2-8258-21a9e527842b	5297	Prvačina
00050000-5655-84a2-cde4-c2500bc75e0d	2250	Ptuj
00050000-5655-84a2-aca4-9004f7135274	2323	Ptujska Gora
00050000-5655-84a2-da4b-4366d8aaa73f	9201	Puconci
00050000-5655-84a2-7d78-406e60ef9d7e	2327	Rače
00050000-5655-84a2-32be-b9e2e3c72950	1433	Radeče
00050000-5655-84a2-338e-500e2538ef2b	9252	Radenci
00050000-5655-84a2-76ab-afce0b058329	2360	Radlje ob Dravi
00050000-5655-84a2-35db-9763e2fc13cb	1235	Radomlje
00050000-5655-84a2-e81f-201da5127691	4240	Radovljica
00050000-5655-84a2-a4db-94e6491229ff	8274	Raka
00050000-5655-84a2-fa4f-bd4b1e8cb435	1381	Rakek
00050000-5655-84a2-9125-d3448ed5668c	4283	Rateče - Planica
00050000-5655-84a2-eb0b-2aed2d095189	2390	Ravne na Koroškem
00050000-5655-84a2-6e6f-baec76d39036	9246	Razkrižje
00050000-5655-84a2-bf63-473e1ae55335	3332	Rečica ob Savinji
00050000-5655-84a2-b3f4-aaa44b8de9a6	5292	Renče
00050000-5655-84a2-0eb2-beec0572d7d5	1310	Ribnica
00050000-5655-84a2-1cd9-ffe0b6105ea4	2364	Ribnica na Pohorju
00050000-5655-84a2-ba7b-5399f2b7d38d	3272	Rimske Toplice
00050000-5655-84a2-1d4f-a201bbdee143	1314	Rob
00050000-5655-84a2-1a24-7b610aeebdea	5215	Ročinj
00050000-5655-84a2-25c5-ba5b4132e142	3250	Rogaška Slatina
00050000-5655-84a2-0093-b97d1b8d8f03	9262	Rogašovci
00050000-5655-84a2-60aa-2db0bc44de89	3252	Rogatec
00050000-5655-84a2-72da-e072a146dfe7	1373	Rovte
00050000-5655-84a2-2edd-ebdd416678fa	2342	Ruše
00050000-5655-84a2-d2a8-3396752e4f22	1282	Sava
00050000-5655-84a2-818f-56f2c5791f9e	6333	Sečovlje/Sicciole
00050000-5655-84a2-77a0-4316618aa754	4227	Selca
00050000-5655-84a2-7c76-511d31b130f9	2352	Selnica ob Dravi
00050000-5655-84a2-3d43-8238dcddc36d	8333	Semič
00050000-5655-84a2-3076-d89ace73c073	8281	Senovo
00050000-5655-84a2-7f4d-b31c6457e3f1	6224	Senožeče
00050000-5655-84a2-e63c-9133b8197bc7	8290	Sevnica
00050000-5655-84a2-8775-d95f1ff5d813	6210	Sežana
00050000-5655-84a2-4d99-58dd6ffdf58a	2214	Sladki Vrh
00050000-5655-84a2-1367-17b947ebc614	5283	Slap ob Idrijci
00050000-5655-84a2-1db4-cbc1d1362cf9	2380	Slovenj Gradec
00050000-5655-84a2-583f-f937269119af	2310	Slovenska Bistrica
00050000-5655-84a2-3559-9f4cd514af46	3210	Slovenske Konjice
00050000-5655-84a2-7359-e14bfb300e24	1216	Smlednik
00050000-5655-84a2-d891-119f56defe40	5232	Soča
00050000-5655-84a2-e19f-0b746211048f	1317	Sodražica
00050000-5655-84a2-e017-ec883a545d40	3335	Solčava
00050000-5655-84a2-e037-391b094183e6	5250	Solkan
00050000-5655-84a2-fffe-668e83dce064	4229	Sorica
00050000-5655-84a2-8caa-b6b0ffdee2dc	4225	Sovodenj
00050000-5655-84a2-9f33-8ebb86c82b0f	5281	Spodnja Idrija
00050000-5655-84a2-1807-4ccda744f163	2241	Spodnji Duplek
00050000-5655-84a2-e949-09ec3a4808cc	9245	Spodnji Ivanjci
00050000-5655-84a2-e854-a2465f8de547	2277	Središče ob Dravi
00050000-5655-84a2-3712-5973ab56a770	4267	Srednja vas v Bohinju
00050000-5655-84a2-f635-79c86641f7e5	8256	Sromlje 
00050000-5655-84a2-2d65-b8d28c0880da	5224	Srpenica
00050000-5655-84a2-0561-b77d0e137c7c	1242	Stahovica
00050000-5655-84a2-16cf-6410e4aabf07	1332	Stara Cerkev
00050000-5655-84a2-89d5-5a60179636eb	8342	Stari trg ob Kolpi
00050000-5655-84a2-ddc5-9cddb4e8d70c	1386	Stari trg pri Ložu
00050000-5655-84a2-396b-f95ff550e416	2205	Starše
00050000-5655-84a2-cb69-aeb4bb195c8d	2289	Stoperce
00050000-5655-84a2-44a7-894e10852904	8322	Stopiče
00050000-5655-84a2-760f-c8c0d200b13e	3206	Stranice
00050000-5655-84a2-4e35-ea9d7c384640	8351	Straža
00050000-5655-84a2-fbb6-bc86222160ad	1313	Struge
00050000-5655-84a2-bb31-789ef474b6b7	8293	Studenec
00050000-5655-84a2-97d4-bd4b88f9fcc0	8331	Suhor
00050000-5655-84a2-c99e-a6fc7bdb4564	2233	Sv. Ana v Slovenskih goricah
00050000-5655-84a2-c593-fe1dbc1681f3	2235	Sv. Trojica v Slovenskih goricah
00050000-5655-84a2-59d1-c5d9dd9e7e42	2353	Sveti Duh na Ostrem Vrhu
00050000-5655-84a2-1b44-22cabefae8b3	9244	Sveti Jurij ob Ščavnici
00050000-5655-84a2-1652-a152cfe4fad2	3264	Sveti Štefan
00050000-5655-84a2-5b22-f31593330e84	2258	Sveti Tomaž
00050000-5655-84a2-6408-6917887d9b73	9204	Šalovci
00050000-5655-84a2-7dc3-13da70c387ee	5261	Šempas
00050000-5655-84a2-c704-f92263ce3d4b	5290	Šempeter pri Gorici
00050000-5655-84a2-26b8-0e61aa0cc0d9	3311	Šempeter v Savinjski dolini
00050000-5655-84a2-7e61-e0f75c4754dc	4208	Šenčur
00050000-5655-84a2-281c-31c084d1f801	2212	Šentilj v Slovenskih goricah
00050000-5655-84a2-b7c8-29bbe6c0dde5	8297	Šentjanž
00050000-5655-84a2-b549-6743f027f24f	2373	Šentjanž pri Dravogradu
00050000-5655-84a2-ccde-14e11fcf2e1b	8310	Šentjernej
00050000-5655-84a2-ae06-83e707246aea	3230	Šentjur
00050000-5655-84a2-2c32-f2b185cc2e9a	3271	Šentrupert
00050000-5655-84a2-0196-c1c652afdd88	8232	Šentrupert
00050000-5655-84a2-20df-3faa75707f42	1296	Šentvid pri Stični
00050000-5655-84a2-c3c7-1c09c2a0b400	8275	Škocjan
00050000-5655-84a2-462c-d30db7684924	6281	Škofije
00050000-5655-84a2-1b7a-4fa926884c22	4220	Škofja Loka
00050000-5655-84a2-7fb9-e62b2d41fa2d	3211	Škofja vas
00050000-5655-84a2-e58d-0a6979740dd1	1291	Škofljica
00050000-5655-84a2-4fd5-3f3f02ce88a7	6274	Šmarje
00050000-5655-84a2-9462-8e46cea2bed0	1293	Šmarje - Sap
00050000-5655-84a2-faaf-2fcb228e8452	3240	Šmarje pri Jelšah
00050000-5655-84a2-879f-475d85ed0f91	8220	Šmarješke Toplice
00050000-5655-84a2-9c83-e414f669c10d	2315	Šmartno na Pohorju
00050000-5655-84a2-ae67-a37720c3cb43	3341	Šmartno ob Dreti
00050000-5655-84a2-252f-00cd7a61231b	3327	Šmartno ob Paki
00050000-5655-84a2-2b46-0051dbf27ef6	1275	Šmartno pri Litiji
00050000-5655-84a2-37bb-d1e32687e860	2383	Šmartno pri Slovenj Gradcu
00050000-5655-84a2-4e76-616a7967264c	3201	Šmartno v Rožni dolini
00050000-5655-84a2-ae05-d87c04b7cafa	3325	Šoštanj
00050000-5655-84a2-84bf-20f2e6d939c0	6222	Štanjel
00050000-5655-84a2-8b60-c93f86a2730c	3220	Štore
00050000-5655-84a2-cd94-36e1ce222757	3304	Tabor
00050000-5655-84a2-aae3-07636efba107	3221	Teharje
00050000-5655-84a2-06af-8d5a7d51ff4a	9251	Tišina
00050000-5655-84a2-7bed-72b053e89282	5220	Tolmin
00050000-5655-84a2-aa45-9ff2df0a5557	3326	Topolšica
00050000-5655-84a2-c57a-2b62601683ed	2371	Trbonje
00050000-5655-84a2-c1d4-e0f1b3006700	1420	Trbovlje
00050000-5655-84a2-163a-acc18b6ab3c9	8231	Trebelno 
00050000-5655-84a2-203a-f629db45ef27	8210	Trebnje
00050000-5655-84a2-8a08-efc3775ee6ae	5252	Trnovo pri Gorici
00050000-5655-84a2-9fe2-2596185d7b36	2254	Trnovska vas
00050000-5655-84a2-81c2-d197b5c3929a	1222	Trojane
00050000-5655-84a2-4546-24521608def9	1236	Trzin
00050000-5655-84a2-7fa7-b58b4be0124f	4290	Tržič
00050000-5655-84a2-468d-34e1cd4bb2d0	8295	Tržišče
00050000-5655-84a2-3829-4630af9c4f16	1311	Turjak
00050000-5655-84a2-1f79-399e972fa3ff	9224	Turnišče
00050000-5655-84a2-ee46-65767c484694	8323	Uršna sela
00050000-5655-84a2-08f9-564b9256b2fe	1252	Vače
00050000-5655-84a2-538f-c67db5f4a90d	3320	Velenje 
00050000-5655-84a2-ef9e-c8fc767bd21f	3322	Velenje - poštni predali
00050000-5655-84a2-9e02-b042f3ce742a	8212	Velika Loka
00050000-5655-84a2-ea1e-603d2498a72a	2274	Velika Nedelja
00050000-5655-84a2-4055-c4c32e95009f	9225	Velika Polana
00050000-5655-84a2-5d5d-9e75630c2218	1315	Velike Lašče
00050000-5655-84a2-3150-86d3a3a130e1	8213	Veliki Gaber
00050000-5655-84a2-ee72-f7f6bfd18fe6	9241	Veržej
00050000-5655-84a2-1edd-e2ffef688a32	1312	Videm - Dobrepolje
00050000-5655-84a2-40c5-d0953f965461	2284	Videm pri Ptuju
00050000-5655-84a2-e8ac-298f41f11797	8344	Vinica
00050000-5655-84a2-4625-a7a6445e9c87	5271	Vipava
00050000-5655-84a2-197c-15bc746556ff	4212	Visoko
00050000-5655-84a2-d1fa-de1a9caddea8	1294	Višnja Gora
00050000-5655-84a2-7a7b-65e2bdc3d415	3205	Vitanje
00050000-5655-84a2-da22-1fba42e7989a	2255	Vitomarci
00050000-5655-84a2-fe29-e4e17a4aa5a4	1217	Vodice
00050000-5655-84a2-c138-601d36b628de	3212	Vojnik\t
00050000-5655-84a2-8514-3c4aab1a6d55	5293	Volčja Draga
00050000-5655-84a2-7933-56cd25dcfb13	2232	Voličina
00050000-5655-84a2-9891-3e5adb03fb62	3305	Vransko
00050000-5655-84a2-585f-3a29187c3aeb	6217	Vremski Britof
00050000-5655-84a2-df16-3c01d7490585	1360	Vrhnika
00050000-5655-84a2-9db8-921151238787	2365	Vuhred
00050000-5655-84a2-7a18-64de83028c18	2367	Vuzenica
00050000-5655-84a2-a11b-b92dbb10fcfb	8292	Zabukovje 
00050000-5655-84a2-b245-12bf46034cf3	1410	Zagorje ob Savi
00050000-5655-84a2-0bd2-93a0f08c5849	1303	Zagradec
00050000-5655-84a2-ace9-77a4ba316e45	2283	Zavrč
00050000-5655-84a2-eff6-91b4abc69f30	8272	Zdole 
00050000-5655-84a2-d9ee-2eaae6fdd74a	4201	Zgornja Besnica
00050000-5655-84a2-243e-53d3083160b2	2242	Zgornja Korena
00050000-5655-84a2-659b-132e65fab496	2201	Zgornja Kungota
00050000-5655-84a2-6b70-575b9e1dd678	2316	Zgornja Ložnica
00050000-5655-84a2-fce3-de71d23c5d0c	2314	Zgornja Polskava
00050000-5655-84a2-aea2-cd6b3e5541f8	2213	Zgornja Velka
00050000-5655-84a2-a5b7-41527066e464	4247	Zgornje Gorje
00050000-5655-84a2-dd76-04006bf863b7	4206	Zgornje Jezersko
00050000-5655-84a2-050d-18fcdc44fc93	2285	Zgornji Leskovec
00050000-5655-84a2-1e3e-d85ccfbb419d	1432	Zidani Most
00050000-5655-84a2-6d85-ba187d696dc6	3214	Zreče
00050000-5655-84a2-cc44-8151d8923eda	4209	Žabnica
00050000-5655-84a2-9603-ea5d94e9e6b0	3310	Žalec
00050000-5655-84a2-f420-a6ae18b463a7	4228	Železniki
00050000-5655-84a2-22cb-2d2fee477181	2287	Žetale
00050000-5655-84a2-9ba0-9c3d6d6d3fba	4226	Žiri
00050000-5655-84a2-3a3c-1161c59157be	4274	Žirovnica
00050000-5655-84a2-22b9-e3cf1dfa6115	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 29439744)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 29439320)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 29439068)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5655-84a5-0105-85609328d00f	00080000-5655-84a5-2212-4fc2c9c91b89	\N	00040000-5655-84a2-922c-48aefebb4b09	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5655-84a5-af8b-273f1c0ea95a	00080000-5655-84a5-2212-4fc2c9c91b89	\N	00040000-5655-84a2-922c-48aefebb4b09	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5655-84a5-ee30-b6b17a59e78a	00080000-5655-84a5-ea74-4ec6fcec3bf5	\N	00040000-5655-84a2-922c-48aefebb4b09	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 29439212)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5655-84a3-247d-079e51a1d465	novo leto	1	1	\N	t
00430000-5655-84a3-8eb5-172f9ffe7f34	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5655-84a3-6d89-6b550c5c0145	dan upora proti okupatorju	27	4	\N	t
00430000-5655-84a3-9571-9bdf0812e99b	praznik dela	1	5	\N	t
00430000-5655-84a3-cc92-8ad9588e2c60	praznik dela	2	5	\N	t
00430000-5655-84a3-3227-88b4af39af95	dan Primoža Trubarja	8	6	\N	f
00430000-5655-84a3-d3e3-8246126c53dc	dan državnosti	25	6	\N	t
00430000-5655-84a3-64ef-1065fe4e9ac2	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5655-84a3-ff0c-18016efc90a1	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5655-84a3-68da-b164699dc7e3	dan suverenosti	25	10	\N	f
00430000-5655-84a3-2fd9-9a306d181253	dan spomina na mrtve	1	11	\N	t
00430000-5655-84a3-45f1-698bcfed7525	dan Rudolfa Maistra	23	11	\N	f
00430000-5655-84a3-1b6a-fd0e41864cea	božič	25	12	\N	t
00430000-5655-84a3-fa32-768f0a4fbdcc	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5655-84a3-555f-5454b8ff322f	Marijino vnebovzetje	15	8	\N	t
00430000-5655-84a3-c484-845ab5eda1cf	dan reformacije	31	10	\N	t
00430000-5655-84a3-15e8-e917503527ce	velikonočna nedelja	27	3	2016	t
00430000-5655-84a3-f530-f8763421cfa2	velikonočna nedelja	16	4	2017	t
00430000-5655-84a3-2223-d2c7a1d3f0fc	velikonočna nedelja	1	4	2018	t
00430000-5655-84a3-cd3a-22b5191ddb5b	velikonočna nedelja	21	4	2019	t
00430000-5655-84a3-b43f-ba592716fa63	velikonočna nedelja	12	4	2020	t
00430000-5655-84a3-bd37-680b2b17a701	velikonočna nedelja	4	4	2021	t
00430000-5655-84a3-dc7a-e6c96da65135	velikonočna nedelja	17	4	2022	t
00430000-5655-84a3-1a79-53ee484f3794	velikonočna nedelja	9	4	2023	t
00430000-5655-84a3-ca92-32cb35760676	velikonočna nedelja	31	3	2024	t
00430000-5655-84a3-f31a-040a41e1339a	velikonočna nedelja	20	4	2025	t
00430000-5655-84a3-17b2-3eb529ee5a6d	velikonočna nedelja	5	4	2026	t
00430000-5655-84a3-1d17-73b6ec447163	velikonočna nedelja	28	3	2027	t
00430000-5655-84a3-9a1e-6da770e71f15	velikonočna nedelja	16	4	2028	t
00430000-5655-84a3-3573-169d4722bdae	velikonočna nedelja	1	4	2029	t
00430000-5655-84a3-e9a2-e2f5dd3e99d0	velikonočna nedelja	21	4	2030	t
00430000-5655-84a3-47bd-c6993f04753f	velikonočni ponedeljek	28	3	2016	t
00430000-5655-84a3-3b8c-20f2d5800889	velikonočni ponedeljek	17	4	2017	t
00430000-5655-84a3-1f2e-4382916b8f83	velikonočni ponedeljek	2	4	2018	t
00430000-5655-84a3-d9f6-3abc7048aa5d	velikonočni ponedeljek	22	4	2019	t
00430000-5655-84a3-5b56-6118510ddb38	velikonočni ponedeljek	13	4	2020	t
00430000-5655-84a3-f26d-6040d014031d	velikonočni ponedeljek	5	4	2021	t
00430000-5655-84a3-c272-594d00b80bb4	velikonočni ponedeljek	18	4	2022	t
00430000-5655-84a3-07f3-1c9777aac906	velikonočni ponedeljek	10	4	2023	t
00430000-5655-84a3-bdb8-b18ded8cb30a	velikonočni ponedeljek	1	4	2024	t
00430000-5655-84a3-6dae-871a52428a25	velikonočni ponedeljek	21	4	2025	t
00430000-5655-84a3-16f0-3518efd8660a	velikonočni ponedeljek	6	4	2026	t
00430000-5655-84a3-ebe8-9799265876b7	velikonočni ponedeljek	29	3	2027	t
00430000-5655-84a3-56a5-c78f2b7e9895	velikonočni ponedeljek	17	4	2028	t
00430000-5655-84a3-c94c-747152ce7235	velikonočni ponedeljek	2	4	2029	t
00430000-5655-84a3-5798-2bf2b315f3b9	velikonočni ponedeljek	22	4	2030	t
00430000-5655-84a3-01f8-6f17ff6d2617	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5655-84a3-767b-f79c9c5ca6d4	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5655-84a3-ace4-bfda1e1fba29	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5655-84a3-65be-f70564e84203	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5655-84a3-4ff5-975af5c388dc	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5655-84a3-9f55-aee1aea07d76	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5655-84a3-993f-996973c9c779	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5655-84a3-03f1-bed01b931f65	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5655-84a3-d9b5-4b2e13bb11c1	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5655-84a3-3af7-8e25d1f6a6fe	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5655-84a3-b4fc-59bda67112aa	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5655-84a3-6d5a-bd0cb5f6e432	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5655-84a3-3ebb-9b06de6d92ac	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5655-84a3-a521-2dd910ae4230	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5655-84a3-45ca-7f1796e3e6a4	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 29439172)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 29439184)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 29439332)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 29439758)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 29439768)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5655-84a5-78e4-e6c774b7a606	00080000-5655-84a5-4b4f-e114ed6bb93c	0987	AK
00190000-5655-84a5-1988-8f73a6d1461e	00080000-5655-84a5-ea74-4ec6fcec3bf5	0989	AK
00190000-5655-84a5-1732-fe3411d44b3c	00080000-5655-84a5-0d6c-499e9a1f8389	0986	AK
00190000-5655-84a5-6b38-1569bba3678f	00080000-5655-84a5-d165-ed3e4180f721	0984	AK
00190000-5655-84a5-c5d7-c6236b56175d	00080000-5655-84a5-4305-c6239bb76dd8	0983	AK
00190000-5655-84a5-901d-9b9ca80ea1d5	00080000-5655-84a5-b06a-fdee46fa56e1	0982	AK
00190000-5655-84a7-ed21-c78793c49124	00080000-5655-84a7-7dec-64e0518f3fd2	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 29439667)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5655-84a5-b727-e661a8f538e9	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 29439776)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 29439361)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5655-84a4-e4c6-3f9ec49be5f6	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5655-84a4-5a52-d5db67162f2f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5655-84a4-0f7d-0ac92156bd6e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5655-84a4-48ff-ec3967858eb5	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5655-84a4-af12-e67fbc87d1a5	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5655-84a4-e193-fb3e5688d88c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5655-84a4-bd4d-c13e911ab7ac	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 29439305)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 29439295)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 29439506)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 29439436)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 29439146)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 29438908)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5655-84a7-7dec-64e0518f3fd2	00010000-5655-84a3-ff50-0fc9843fe66c	2015-11-25 10:51:35	INS	a:0:{}
2	App\\Entity\\Option	00000000-5655-84a7-f306-b8c06147fca9	00010000-5655-84a3-ff50-0fc9843fe66c	2015-11-25 10:51:35	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5655-84a7-ed21-c78793c49124	00010000-5655-84a3-ff50-0fc9843fe66c	2015-11-25 10:51:35	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 29439374)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 29438946)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5655-84a3-603e-af1cff36fa86	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5655-84a3-a534-fd1e1331f140	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5655-84a3-60bf-1dfe0c2cf234	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5655-84a3-d939-0e0689b8fff0	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5655-84a3-b559-ec00c6f53b1c	planer	Planer dogodkov v koledarju	t
00020000-5655-84a3-3448-0e01e2a2bdf0	kadrovska	Kadrovska služba	t
00020000-5655-84a3-2759-941a5d3e9ce4	arhivar	Ažuriranje arhivalij	t
00020000-5655-84a3-0155-77966fe407c1	igralec	Igralec	t
00020000-5655-84a3-6069-b014e8db1fd1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5655-84a5-a95f-82434b15cfe4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5655-84a5-6b4b-d9e88f092dab	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-9ac0-fd3d8a31594a	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-9d6c-733b589880ff	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-3eb0-e6409e4bbff8	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-f5ae-e52f663e566b	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-7d68-34cf5440f64e	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-c467-884fed2f0fb7	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-6666-bdd98caf4ccc	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-6d47-f82616727515	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-324a-8612aa9e008b	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-32ae-3982961c1548	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-5ed2-f946f060bb5d	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-61ce-7c84658d8aa8	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-2ad6-fda47c3b4652	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-4ec7-c4e755ba6fdb	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-537a-98d4c8babf8b	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5655-84a5-5eea-63498e1bda09	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5655-84a5-dee7-640f4c0033aa	mn-arhiv-arhivbesedil	vloga, ki pokriva akcije v meniju arhiv->arhivbesedil	t
00020000-5655-84a5-55df-c7d5fb15cd0e	mn-arhiv-arhivbesedil-r	vloga, ki pokriva read akcije v meniju arhiv->arhivbesedil	t
00020000-5655-84a5-ff7c-0fe38b7033a6	mn-seznami-zaposleni	vloga, ki pokriva akcije v meniju arhiv->arhivbesedil	t
00020000-5655-84a5-b512-14613c59b33c	mn-seznami-zaposleni-r	vloga, ki pokriva read akcije v meniju arhiv->arhivbesedil	t
\.


--
-- TOC entry 3099 (class 0 OID 29438930)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5655-84a3-b538-d8ef081fa30d	00020000-5655-84a3-60bf-1dfe0c2cf234
00010000-5655-84a3-ff50-0fc9843fe66c	00020000-5655-84a3-60bf-1dfe0c2cf234
00010000-5655-84a5-06fb-edfb69fd54e3	00020000-5655-84a5-a95f-82434b15cfe4
00010000-5655-84a5-2dcd-f3c31398f6da	00020000-5655-84a5-6b4b-d9e88f092dab
00010000-5655-84a5-2dcd-f3c31398f6da	00020000-5655-84a5-f5ae-e52f663e566b
00010000-5655-84a5-2dcd-f3c31398f6da	00020000-5655-84a5-6d47-f82616727515
00010000-5655-84a5-2dcd-f3c31398f6da	00020000-5655-84a5-32ae-3982961c1548
00010000-5655-84a5-2dcd-f3c31398f6da	00020000-5655-84a5-2ad6-fda47c3b4652
00010000-5655-84a5-2dcd-f3c31398f6da	00020000-5655-84a5-537a-98d4c8babf8b
00010000-5655-84a5-2dcd-f3c31398f6da	00020000-5655-84a5-9d6c-733b589880ff
00010000-5655-84a5-6fa0-14ac0665b93b	00020000-5655-84a5-6b4b-d9e88f092dab
00010000-5655-84a5-6fa0-14ac0665b93b	00020000-5655-84a5-9ac0-fd3d8a31594a
00010000-5655-84a5-6fa0-14ac0665b93b	00020000-5655-84a5-9d6c-733b589880ff
00010000-5655-84a5-6fa0-14ac0665b93b	00020000-5655-84a5-3eb0-e6409e4bbff8
00010000-5655-84a5-5d2a-7412a1efd681	00020000-5655-84a5-6b4b-d9e88f092dab
00010000-5655-84a5-5d2a-7412a1efd681	00020000-5655-84a5-9ac0-fd3d8a31594a
00010000-5655-84a5-5d2a-7412a1efd681	00020000-5655-84a5-9d6c-733b589880ff
00010000-5655-84a5-5d2a-7412a1efd681	00020000-5655-84a5-3eb0-e6409e4bbff8
00010000-5655-84a5-5d2a-7412a1efd681	00020000-5655-84a5-32ae-3982961c1548
00010000-5655-84a5-cc69-0566764e47d1	00020000-5655-84a5-9ac0-fd3d8a31594a
00010000-5655-84a5-cc69-0566764e47d1	00020000-5655-84a5-7d68-34cf5440f64e
00010000-5655-84a5-cc69-0566764e47d1	00020000-5655-84a5-324a-8612aa9e008b
00010000-5655-84a5-cc69-0566764e47d1	00020000-5655-84a5-5ed2-f946f060bb5d
00010000-5655-84a5-cc69-0566764e47d1	00020000-5655-84a5-32ae-3982961c1548
00010000-5655-84a5-cc69-0566764e47d1	00020000-5655-84a5-4ec7-c4e755ba6fdb
00010000-5655-84a5-84aa-5e859c47e151	00020000-5655-84a5-9ac0-fd3d8a31594a
00010000-5655-84a5-84aa-5e859c47e151	00020000-5655-84a5-7d68-34cf5440f64e
00010000-5655-84a5-84aa-5e859c47e151	00020000-5655-84a5-6666-bdd98caf4ccc
00010000-5655-84a5-84aa-5e859c47e151	00020000-5655-84a5-324a-8612aa9e008b
00010000-5655-84a5-84aa-5e859c47e151	00020000-5655-84a5-5ed2-f946f060bb5d
00010000-5655-84a5-84aa-5e859c47e151	00020000-5655-84a5-32ae-3982961c1548
00010000-5655-84a5-84aa-5e859c47e151	00020000-5655-84a5-4ec7-c4e755ba6fdb
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-9ac0-fd3d8a31594a
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-9d6c-733b589880ff
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-7d68-34cf5440f64e
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-c467-884fed2f0fb7
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-6666-bdd98caf4ccc
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-f5ae-e52f663e566b
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-324a-8612aa9e008b
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-5ed2-f946f060bb5d
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-32ae-3982961c1548
00010000-5655-84a5-f8bc-e14c82e4bdb6	00020000-5655-84a5-4ec7-c4e755ba6fdb
00010000-5655-84a5-3633-149a085b9da0	00020000-5655-84a5-6b4b-d9e88f092dab
00010000-5655-84a5-3633-149a085b9da0	00020000-5655-84a5-3eb0-e6409e4bbff8
00010000-5655-84a5-3633-149a085b9da0	00020000-5655-84a5-f5ae-e52f663e566b
00010000-5655-84a5-3633-149a085b9da0	00020000-5655-84a5-6d47-f82616727515
00010000-5655-84a5-3633-149a085b9da0	00020000-5655-84a5-32ae-3982961c1548
00010000-5655-84a5-3633-149a085b9da0	00020000-5655-84a5-2ad6-fda47c3b4652
00010000-5655-84a5-3633-149a085b9da0	00020000-5655-84a5-537a-98d4c8babf8b
00010000-5655-84a5-bfad-f53e9171db92	00020000-5655-84a5-5eea-63498e1bda09
\.


--
-- TOC entry 3144 (class 0 OID 29439388)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 29439326)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 29439272)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5655-84a5-a2e5-dcf49b7509ec	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5655-84a5-5c4e-ff841ba169ff	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5655-84a5-811e-e21a87806a57	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 29438895)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5655-84a2-7c61-983b0dc1f975	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5655-84a2-8a9b-e44150cf18e7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5655-84a2-2539-4506a6aebbac	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5655-84a2-00b9-b1f6fda3ed00	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5655-84a2-b6c0-ca1e7b62601d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 29438887)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5655-84a2-bebe-b1ce2531b168	00230000-5655-84a2-00b9-b1f6fda3ed00	popa
00240000-5655-84a2-8a26-9f9431b58cce	00230000-5655-84a2-00b9-b1f6fda3ed00	oseba
00240000-5655-84a2-7bfb-cee843ded906	00230000-5655-84a2-00b9-b1f6fda3ed00	tippopa
00240000-5655-84a2-34f5-7d9e4b2fd2d7	00230000-5655-84a2-00b9-b1f6fda3ed00	organizacijskaenota
00240000-5655-84a2-1b57-b36fc3f0d173	00230000-5655-84a2-00b9-b1f6fda3ed00	sezona
00240000-5655-84a2-5893-d398720f0605	00230000-5655-84a2-00b9-b1f6fda3ed00	tipvaje
00240000-5655-84a2-48dc-c0939ebbb692	00230000-5655-84a2-8a9b-e44150cf18e7	prostor
00240000-5655-84a2-f478-65366489093c	00230000-5655-84a2-00b9-b1f6fda3ed00	besedilo
00240000-5655-84a2-3070-91b7182c5c1c	00230000-5655-84a2-00b9-b1f6fda3ed00	uprizoritev
00240000-5655-84a2-bb34-05a6e8614888	00230000-5655-84a2-00b9-b1f6fda3ed00	funkcija
00240000-5655-84a2-8c2c-28a7431139f0	00230000-5655-84a2-00b9-b1f6fda3ed00	tipfunkcije
00240000-5655-84a2-e915-7d2efd11fdc0	00230000-5655-84a2-00b9-b1f6fda3ed00	alternacija
00240000-5655-84a2-8d1a-015295d0348a	00230000-5655-84a2-7c61-983b0dc1f975	pogodba
00240000-5655-84a2-9022-af384e273921	00230000-5655-84a2-00b9-b1f6fda3ed00	zaposlitev
00240000-5655-84a2-ab6c-3b59d0a582f4	00230000-5655-84a2-00b9-b1f6fda3ed00	zvrstuprizoritve
00240000-5655-84a2-db09-8ae9e2e1a3a2	00230000-5655-84a2-7c61-983b0dc1f975	programdela
00240000-5655-84a2-f74a-0cf7a6134299	00230000-5655-84a2-00b9-b1f6fda3ed00	zapis
\.


--
-- TOC entry 3093 (class 0 OID 29438882)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0b33aa9e-de7d-404d-8303-1625b2012599	00240000-5655-84a2-bebe-b1ce2531b168	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 29439453)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5655-84a5-5edb-23b79040179f	000e0000-5655-84a5-f3e3-a13a9b422939	00080000-5655-84a5-2212-4fc2c9c91b89	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5655-84a3-fb97-09251e1afdb5
00270000-5655-84a5-83fb-8ad3c76765b8	000e0000-5655-84a5-f3e3-a13a9b422939	00080000-5655-84a5-2212-4fc2c9c91b89	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5655-84a3-fb97-09251e1afdb5
\.


--
-- TOC entry 3109 (class 0 OID 29439030)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 29439282)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5655-84a5-27f7-9b5de563b6ff	00180000-5655-84a5-11c6-5cbcabee23d0	000c0000-5655-84a5-8e91-2400256766df	00090000-5655-84a5-7008-df89473de3c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-84a5-3d28-50f1351f6d31	00180000-5655-84a5-11c6-5cbcabee23d0	000c0000-5655-84a5-ae62-bd9dfdd7ed9f	00090000-5655-84a5-874d-7fa4a2ce0226	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-84a5-376f-f1fb013f2d61	00180000-5655-84a5-11c6-5cbcabee23d0	000c0000-5655-84a5-9664-03c70b13a569	00090000-5655-84a5-9296-26360a5160c2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-84a5-271e-ca05af87b81f	00180000-5655-84a5-11c6-5cbcabee23d0	000c0000-5655-84a5-7b65-460d8e9221fb	00090000-5655-84a5-fee2-a529d70c428b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-84a5-00fd-3daa26b1f648	00180000-5655-84a5-11c6-5cbcabee23d0	000c0000-5655-84a5-f643-15eca9d87bb2	00090000-5655-84a5-dca6-1e53ed27cb05	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5655-84a5-6daa-d5590b251e1c	00180000-5655-84a5-3a04-e66ec6f93180	\N	00090000-5655-84a5-dca6-1e53ed27cb05	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5655-84a5-b837-a494b983fe1c	00180000-5655-84a5-3a04-e66ec6f93180	\N	00090000-5655-84a5-874d-7fa4a2ce0226	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 29439494)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5655-84a2-69f2-b31f2eb08ba8	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5655-84a2-392b-4b3834aea8ee	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5655-84a2-acc6-0fdc588364c2	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5655-84a2-d00b-e55c8693b5a4	04	Režija	Režija	Režija	umetnik	30
000f0000-5655-84a2-006e-dec0031cc7a9	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5655-84a2-c262-08322c85398d	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5655-84a2-2f09-a8d87ea4ff02	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5655-84a2-9094-d4a72401aac4	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5655-84a2-c254-d64eb3267334	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5655-84a2-8ef9-2875dd30b29b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5655-84a2-378a-921fda16adb3	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5655-84a2-b6bd-61e6c57bed55	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5655-84a2-1966-b3aa1a5fb60a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5655-84a2-b07c-b9b9fb675371	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5655-84a2-0d6f-ce807adb07c9	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5655-84a2-4c59-7400a54e0782	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5655-84a2-57e1-0115509449f4	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5655-84a2-af51-f142d3afb09d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 29438981)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5655-84a4-d306-a3079ac0d66f	0001	šola	osnovna ali srednja šola
00400000-5655-84a4-aa43-78d34bacb6ff	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5655-84a4-9b43-8c17a7b7f329	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 29439787)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5655-84a2-75c1-e80e96ba7a9a	01	Velika predstava	f	1.00	1.00
002b0000-5655-84a2-3dd2-9c1d98890bee	02	Mala predstava	f	0.50	0.50
002b0000-5655-84a2-786c-ca1fb7700715	03	Mala koprodukcija	t	0.40	1.00
002b0000-5655-84a2-db25-3bf6d3bde14e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5655-84a2-1087-0f04bc6596c6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 29439262)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5655-84a2-adb8-23e1cdebed33	0001	prva vaja	prva vaja
00420000-5655-84a2-a8ed-3adbd3e28b2e	0002	tehnična vaja	tehnična vaja
00420000-5655-84a2-2063-7b864bcbfbe3	0003	lučna vaja	lučna vaja
00420000-5655-84a2-bc16-dcf71ca1c2f8	0004	kostumska vaja	kostumska vaja
00420000-5655-84a2-acd0-94f5d324369f	0005	foto vaja	foto vaja
00420000-5655-84a2-3a26-87ac557e3a2c	0006	1. glavna vaja	1. glavna vaja
00420000-5655-84a2-9456-eb20476b3b27	0007	2. glavna vaja	2. glavna vaja
00420000-5655-84a2-224c-83bb2ecdca26	0008	1. generalka	1. generalka
00420000-5655-84a2-2a26-ad9de49fdaca	0009	2. generalka	2. generalka
00420000-5655-84a2-9251-0c0330a0da74	0010	odprta generalka	odprta generalka
00420000-5655-84a2-4bd8-5a3014616f64	0011	obnovitvena vaja	obnovitvena vaja
00420000-5655-84a2-9e37-5cd3216a8154	0012	pevska vaja	pevska vaja
00420000-5655-84a2-18ac-fca86136b7e1	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5655-84a2-8e6f-c835192d993e	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 29439103)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 29438917)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5655-84a3-ff50-0fc9843fe66c	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO32JeJ6PihPklzyPCMHZFUlPOs3QZT/e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5655-84a5-734a-cf82b9ef916c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5655-84a5-e6fc-68a8746ce703	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5655-84a5-6d8c-ba9ee64bc5f8	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5655-84a5-9bcf-e1260220c43c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5655-84a5-db13-73bbddbe847c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5655-84a5-14f0-b5469bb1b1c9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5655-84a5-6e0b-96606bdcfb00	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5655-84a5-ce75-9c4ab7b4ff10	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5655-84a5-b356-287f7020d79d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5655-84a5-06fb-edfb69fd54e3	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5655-84a5-87d2-255837b36a8b	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5655-84a5-2dcd-f3c31398f6da	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5655-84a5-6fa0-14ac0665b93b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5655-84a5-5d2a-7412a1efd681	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5655-84a5-cc69-0566764e47d1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5655-84a5-84aa-5e859c47e151	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5655-84a5-f8bc-e14c82e4bdb6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5655-84a5-3633-149a085b9da0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5655-84a5-bfad-f53e9171db92	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5655-84a3-b538-d8ef081fa30d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 29439544)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5655-84a5-0647-4df47c7a3711	00160000-5655-84a4-ec47-65106b891f53	\N	00140000-5655-84a2-ccbc-93fbc4bd60de	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5655-84a4-af12-e67fbc87d1a5
000e0000-5655-84a5-f3e3-a13a9b422939	00160000-5655-84a4-b998-ddc4f699e8bf	\N	00140000-5655-84a2-1c07-44b73518806b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5655-84a4-e193-fb3e5688d88c
000e0000-5655-84a5-099f-cae66fe10524	\N	\N	00140000-5655-84a2-1c07-44b73518806b	00190000-5655-84a5-78e4-e6c774b7a606	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5655-84a4-af12-e67fbc87d1a5
000e0000-5655-84a5-df9b-38ef24fd135a	\N	\N	00140000-5655-84a2-1c07-44b73518806b	00190000-5655-84a5-78e4-e6c774b7a606	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5655-84a4-af12-e67fbc87d1a5
000e0000-5655-84a5-f02c-832073715d20	\N	\N	00140000-5655-84a2-1c07-44b73518806b	00190000-5655-84a5-78e4-e6c774b7a606	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5655-84a4-e4c6-3f9ec49be5f6
000e0000-5655-84a5-7b0a-232610877308	\N	\N	00140000-5655-84a2-1c07-44b73518806b	00190000-5655-84a5-78e4-e6c774b7a606	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5655-84a4-e4c6-3f9ec49be5f6
\.


--
-- TOC entry 3123 (class 0 OID 29439202)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5655-84a5-3f54-4a9916b375fe	\N	000e0000-5655-84a5-f3e3-a13a9b422939	1	
00200000-5655-84a5-51e3-7cdf8ee5566b	\N	000e0000-5655-84a5-f3e3-a13a9b422939	2	
00200000-5655-84a5-4ecd-1ba6120602a8	\N	000e0000-5655-84a5-f3e3-a13a9b422939	3	
00200000-5655-84a5-456e-35681b0cabb3	\N	000e0000-5655-84a5-f3e3-a13a9b422939	4	
00200000-5655-84a5-782f-b66f0ccea24f	\N	000e0000-5655-84a5-f3e3-a13a9b422939	5	
\.


--
-- TOC entry 3140 (class 0 OID 29439353)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 29439467)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5655-84a3-fde7-3b018529d9a7	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5655-84a3-efe3-e180b0a26b85	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5655-84a3-87f6-d0f12de9f2eb	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5655-84a3-eaf4-922ecb3b2f2e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5655-84a3-c044-0a4cb33e9118	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5655-84a3-cabe-2bd9d27275ba	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5655-84a3-34c3-d04bcdaa04f1	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5655-84a3-9c27-0b3c3e15ce7c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5655-84a3-fb97-09251e1afdb5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5655-84a3-27aa-b57c06dafdc3	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5655-84a3-aeb7-5ac996dacd22	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5655-84a3-5732-440d58fc7116	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5655-84a3-8686-58dea7cb6e73	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5655-84a3-17dc-6f492fe91587	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5655-84a3-819e-36d814d83200	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5655-84a3-a984-f45d7043e9e1	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5655-84a3-ed39-ea9ca18003bf	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5655-84a3-c5a6-163a2d0d99d7	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5655-84a3-3e8e-9bf1747c4cab	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5655-84a3-b0e5-57499bfb5204	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5655-84a3-0e5e-21fc00ae56bf	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5655-84a3-f372-8de4233f1016	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5655-84a3-379e-7fc712280c21	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5655-84a3-d9ae-386e641723c3	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5655-84a3-3339-dbe476adab18	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5655-84a3-ad93-3c089a723b31	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5655-84a3-a47d-450eca648114	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5655-84a3-9a24-1fc9a728c864	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 29439837)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 29439806)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 29439849)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 29439425)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5655-84a5-8949-e50e8d617ed0	00090000-5655-84a5-874d-7fa4a2ce0226	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-84a5-b0b0-203967637ade	00090000-5655-84a5-9296-26360a5160c2	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-84a5-52f0-8c20bb88f1d9	00090000-5655-84a5-e978-a2647dda8b51	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-84a5-84ad-b39b6a98bdfd	00090000-5655-84a5-e852-02bed4ffd07e	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-84a5-5f13-e352e1534cab	00090000-5655-84a5-dc28-dd69a01317fe	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5655-84a5-d2c5-c37a5e6ffc90	00090000-5655-84a5-bf73-f7b16317f77f	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 29439246)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 29439534)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5655-84a2-ccbc-93fbc4bd60de	01	Drama	drama (SURS 01)
00140000-5655-84a2-98ee-5eaa19294a35	02	Opera	opera (SURS 02)
00140000-5655-84a2-d8d3-748bcb90f538	03	Balet	balet (SURS 03)
00140000-5655-84a2-2ff1-ea58cc1ba6ff	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5655-84a2-0e84-a28f55bf150e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5655-84a2-1c07-44b73518806b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5655-84a2-2f62-2ce3b6840ea5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 29439415)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 29438980)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 29439593)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 29439583)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 29438971)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 29439450)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 29439492)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 29439890)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 29439234)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 29439256)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 29439261)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 29439804)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 29439129)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 29439661)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 29439411)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 29439200)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 29439167)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 29439143)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 29439318)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 29439867)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 29439874)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 29439898)
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
-- TOC entry 2726 (class 2606 OID 29439345)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 29439101)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 29438999)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 29439063)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 29439026)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 29438960)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 29438945)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 29439351)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 29439387)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 29439529)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 29439054)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 29439089)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 29439756)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 29439324)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 29439079)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 29439219)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 29439188)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 29439180)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 29439336)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 29439765)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 29439773)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 29439743)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 29439785)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 29439369)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 29439309)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 29439300)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 29439516)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 29439443)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 29439155)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 29438916)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 29439378)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 29438934)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 29438954)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 29439396)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 29439331)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 29439280)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 29438904)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 29438892)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 29438886)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 29439463)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 29439035)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 29439291)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 29439503)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 29438988)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 29439797)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 29439269)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 29439114)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 29438929)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 29439562)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 29439209)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 29439359)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 29439475)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 29439847)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 29439831)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 29439855)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 29439433)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 29439250)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 29439542)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 29439423)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 29439244)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 29439245)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 29439243)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 29439242)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 29439241)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 29439464)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 29439465)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 29439466)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 29439869)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 29439868)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 29439056)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 29439057)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 29439352)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 29439835)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 29439834)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 29439836)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 29439833)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 29439832)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 29439338)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 29439337)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 29439210)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 29439211)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 29439412)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 29439414)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 29439413)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 29439145)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 29439144)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 29439786)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 29439531)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 29439532)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 29439533)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 29439856)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 29439567)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 29439564)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 29439568)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 29439566)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 29439565)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 29439116)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 29439115)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 29439029)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 29439379)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 29438961)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 29438962)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 29439399)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 29439398)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 29439397)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 29439066)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 29439065)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 29439067)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 29439183)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 29439181)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 29439182)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 29438894)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 29439304)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 29439302)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 29439301)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 29439303)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 29438935)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 29438936)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 29439360)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 29439891)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 29439452)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 29439451)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 29439899)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 29439900)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 29439325)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 29439444)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 29439445)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 29439666)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 29439665)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 29439662)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 29439663)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 29439664)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 29439081)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 29439080)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 29439082)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 29439373)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 29439372)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 29439766)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 29439767)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 29439597)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 29439598)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 29439595)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 29439596)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 29439434)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 29439435)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 29439313)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 29439312)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 29439310)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 29439311)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 29439585)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 29439584)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 29439156)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 29439170)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 29439169)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 29439168)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 29439171)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 29439201)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 29439189)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 29439190)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 29439757)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 29439805)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 29439875)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 29439876)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 29439001)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 29439000)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 29439036)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 29439037)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 29439251)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 29439294)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 29439293)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 29439292)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 29439236)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 29439237)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 29439240)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 29439235)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 29439239)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 29439238)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 29439055)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 29438989)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 29438990)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 29439130)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 29439132)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 29439131)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 29439133)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 29439319)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 29439530)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 29439563)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 29439504)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 29439505)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 29439027)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 29439028)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 29439424)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 29438905)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 29439102)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 29439064)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 29438893)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 29439798)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 29439371)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 29439370)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 29439270)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 29439271)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 29439594)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 29439090)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 29439543)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 29439848)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 29439774)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 29439775)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 29439493)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 29439281)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 29438955)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 29440071)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 29440076)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 29440101)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 29440091)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 29440066)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 29440086)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 29440096)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 29440081)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 29440271)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 29440276)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 29440281)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 29440446)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 29440441)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 29439956)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 29439961)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 29440186)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 29440426)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 29440421)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 29440431)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 29440416)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 29440411)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 29440181)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 29440176)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 29440056)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 29440061)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 29440226)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 29440236)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 29440231)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 29440011)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 29440006)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 29440166)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 29440401)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 29440286)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 29440291)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 29440296)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 29440436)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 29440316)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 29440301)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 29440321)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 29440311)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 29440306)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 29440001)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 29439996)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 29439941)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 29439936)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 29440206)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 29439916)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 29439921)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 29440221)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 29440216)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 29440211)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 29439971)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 29439966)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 29439976)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 29440036)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 29440026)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 29440031)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 29439901)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 29440141)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 29440131)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 29440126)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 29440136)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 29439906)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 29439911)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 29440191)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 29440461)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 29440266)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 29440261)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 29440466)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 29440471)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 29440171)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 29440251)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 29440256)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 29440376)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 29440371)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 29440356)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 29440361)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 29440366)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 29439986)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 29439981)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 29439991)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 29440201)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 29440196)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 29440386)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 29440391)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 29440346)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 29440351)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 29440336)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 29440341)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 29440241)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 29440246)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 29440161)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 29440156)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 29440146)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 29440151)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 29440331)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 29440326)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 29440016)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 29440021)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 29440051)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 29440041)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 29440046)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 29440381)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 29440396)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 29440406)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 29440451)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 29440456)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 29439931)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 29439926)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 29439946)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 29439951)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 29440106)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 29440121)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 29440116)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 29440111)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-25 10:51:37 CET

--
-- PostgreSQL database dump complete
--

