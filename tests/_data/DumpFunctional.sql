--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-08 16:25:46 CET

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
-- TOC entry 183 (class 1259 OID 31415771)
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
-- TOC entry 237 (class 1259 OID 31416385)
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
-- TOC entry 236 (class 1259 OID 31416368)
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
-- TOC entry 182 (class 1259 OID 31415764)
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
-- TOC entry 181 (class 1259 OID 31415762)
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
-- TOC entry 227 (class 1259 OID 31416245)
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
-- TOC entry 230 (class 1259 OID 31416275)
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
-- TOC entry 251 (class 1259 OID 31416678)
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
-- TOC entry 203 (class 1259 OID 31416019)
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
-- TOC entry 205 (class 1259 OID 31416051)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 31416056)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 31416600)
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
-- TOC entry 194 (class 1259 OID 31415916)
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
-- TOC entry 238 (class 1259 OID 31416398)
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
-- TOC entry 223 (class 1259 OID 31416199)
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
-- TOC entry 200 (class 1259 OID 31415990)
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
-- TOC entry 197 (class 1259 OID 31415956)
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
-- TOC entry 195 (class 1259 OID 31415933)
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
-- TOC entry 212 (class 1259 OID 31416113)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 31416658)
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
-- TOC entry 250 (class 1259 OID 31416671)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 31416693)
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
-- TOC entry 216 (class 1259 OID 31416138)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 31415890)
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
-- TOC entry 185 (class 1259 OID 31415790)
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
-- TOC entry 189 (class 1259 OID 31415857)
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
-- TOC entry 186 (class 1259 OID 31415801)
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
-- TOC entry 178 (class 1259 OID 31415736)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 31415755)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 31416145)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 31416179)
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
-- TOC entry 233 (class 1259 OID 31416316)
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
-- TOC entry 188 (class 1259 OID 31415837)
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
-- TOC entry 191 (class 1259 OID 31415882)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 31416544)
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
-- TOC entry 213 (class 1259 OID 31416119)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 31415867)
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
-- TOC entry 202 (class 1259 OID 31416011)
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
-- TOC entry 198 (class 1259 OID 31415971)
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
-- TOC entry 199 (class 1259 OID 31415983)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 31416131)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 31416558)
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
-- TOC entry 242 (class 1259 OID 31416568)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 31416467)
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
-- TOC entry 243 (class 1259 OID 31416576)
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
-- TOC entry 219 (class 1259 OID 31416160)
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
-- TOC entry 211 (class 1259 OID 31416104)
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
-- TOC entry 210 (class 1259 OID 31416094)
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
-- TOC entry 232 (class 1259 OID 31416305)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 31416235)
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
-- TOC entry 196 (class 1259 OID 31415945)
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
-- TOC entry 175 (class 1259 OID 31415707)
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
-- TOC entry 174 (class 1259 OID 31415705)
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
-- TOC entry 220 (class 1259 OID 31416173)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 31415745)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 31415729)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 31416187)
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
-- TOC entry 214 (class 1259 OID 31416125)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 31416071)
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
-- TOC entry 173 (class 1259 OID 31415694)
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
-- TOC entry 172 (class 1259 OID 31415686)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 31415681)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 31416252)
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
-- TOC entry 187 (class 1259 OID 31415829)
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
-- TOC entry 209 (class 1259 OID 31416081)
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
-- TOC entry 231 (class 1259 OID 31416293)
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
-- TOC entry 184 (class 1259 OID 31415780)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 31416588)
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
-- TOC entry 207 (class 1259 OID 31416061)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 31415902)
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
-- TOC entry 176 (class 1259 OID 31415716)
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
-- TOC entry 235 (class 1259 OID 31416343)
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
-- TOC entry 201 (class 1259 OID 31416001)
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
-- TOC entry 218 (class 1259 OID 31416152)
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
-- TOC entry 229 (class 1259 OID 31416266)
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
-- TOC entry 247 (class 1259 OID 31416638)
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
-- TOC entry 246 (class 1259 OID 31416607)
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
-- TOC entry 248 (class 1259 OID 31416650)
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
-- TOC entry 225 (class 1259 OID 31416224)
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
-- TOC entry 204 (class 1259 OID 31416045)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 31416333)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 31416214)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 31415767)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 31415710)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 31415771)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5666-f676-3892-46d24b311a95	10	30	Otroci	Abonma za otroke	200
000a0000-5666-f676-0e2f-a386c39f60d9	20	60	Mladina	Abonma za mladino	400
000a0000-5666-f676-9fea-fa3064244f25	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 31416385)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5666-f677-a995-1606639b71b8	000d0000-5666-f677-ae02-ecdcd2ce98fa	\N	00090000-5666-f677-b25c-8487ba2a1e2b	000b0000-5666-f677-1a1e-1eb79b06ccb5	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5666-f677-680c-11513ab0d8bf	000d0000-5666-f677-e262-05ec2ec60e92	00100000-5666-f677-5857-d4becc349e04	00090000-5666-f677-b7bb-3ca248ada4a5	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5666-f677-e7e6-e2c3a992efb6	000d0000-5666-f677-0461-7dd4715dbd8f	00100000-5666-f677-5000-731baa2b7e97	00090000-5666-f677-0038-5164d78844e3	\N	0003	t	\N	2015-12-08	\N	2	t	\N	f	f
000c0000-5666-f677-7ac5-595f14887274	000d0000-5666-f677-dc48-3720a44f5ef9	\N	00090000-5666-f677-05fe-92ad8b709598	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5666-f677-132e-85920d71cea6	000d0000-5666-f677-21cb-89f3d6571e64	\N	00090000-5666-f677-4544-e94332e15b0d	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5666-f677-c2c4-4d5dc4ccfa7b	000d0000-5666-f677-4084-fd1429076878	\N	00090000-5666-f677-dd02-a4b8c367fdbd	000b0000-5666-f677-d4af-ca4f02ab9e48	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5666-f677-6ff5-e0969a76e07f	000d0000-5666-f677-ab16-a18feb38a320	00100000-5666-f677-6f6c-d236a9f3260e	00090000-5666-f677-d813-cff845b3c936	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5666-f677-3a9a-65bbc92c4697	000d0000-5666-f677-15f4-3d36d6c38047	\N	00090000-5666-f677-b931-bc4d2a3b9c3f	000b0000-5666-f677-25a3-e15bbc3223a0	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5666-f677-f04f-f1c35ece8ad0	000d0000-5666-f677-ab16-a18feb38a320	00100000-5666-f677-f237-59f22b3b65e1	00090000-5666-f677-08f5-4208fcbf2497	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5666-f677-f54f-33b20a6f8b6c	000d0000-5666-f677-ab16-a18feb38a320	00100000-5666-f677-40b3-1efc41c88371	00090000-5666-f677-62c3-ae5e96a46d81	\N	0010	t	\N	2015-12-08	\N	16	f	\N	f	t
000c0000-5666-f677-4af9-3961159788e2	000d0000-5666-f677-ab16-a18feb38a320	00100000-5666-f677-9700-5328640db0ce	00090000-5666-f677-74ba-4b402b9f367c	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5666-f677-eff1-25bd5af7d2ed	000d0000-5666-f677-309c-62f32d8b0f1a	00100000-5666-f677-5857-d4becc349e04	00090000-5666-f677-b7bb-3ca248ada4a5	000b0000-5666-f677-f345-74ddebab7d1c	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 31416368)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 31415764)
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
-- TOC entry 3151 (class 0 OID 31416245)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5666-f677-c3fe-d3a166674592	00160000-5666-f676-d7c1-b69b47323370	00090000-5666-f677-7148-da4d9867200e	aizv	10	t
003d0000-5666-f677-cac1-b5ac9e7f8e05	00160000-5666-f676-d7c1-b69b47323370	00090000-5666-f677-5682-c763ab3b52f4	apri	14	t
003d0000-5666-f677-3ba6-3b9fd7fc9692	00160000-5666-f676-af4d-a1b12af8dd00	00090000-5666-f677-5e34-85006d8d41a3	aizv	11	t
003d0000-5666-f677-c872-8130190ba472	00160000-5666-f676-d1d3-a58eb6024f87	00090000-5666-f677-5d9b-3ba6070a708c	aizv	12	t
003d0000-5666-f677-6eb2-823c5ebe9148	00160000-5666-f676-d7c1-b69b47323370	00090000-5666-f677-9547-a12bde3c8d20	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 31416275)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5666-f676-d7c1-b69b47323370	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5666-f676-af4d-a1b12af8dd00	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5666-f676-d1d3-a58eb6024f87	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 31416678)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 31416019)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5666-f677-97b3-fc6f5b271109	\N	\N	00200000-5666-f677-f4ef-b38d037d3c9f	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5666-f677-96db-51c6494f2a00	\N	\N	00200000-5666-f677-6b00-6b521ca26558	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5666-f677-6658-8aad16e6327b	\N	\N	00200000-5666-f677-9644-55645a0d0729	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5666-f677-ff92-2a4b9c863aa3	\N	\N	00200000-5666-f677-f427-c25beb700c25	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5666-f677-02e8-86036f7ceeac	\N	\N	00200000-5666-f677-d86e-2dca51fd5649	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 31416051)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 31416056)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 31416600)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 31415916)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5666-f674-69a9-378d4ef82795	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5666-f674-52dd-1040ca17c167	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5666-f674-4ab1-fe9416798ebb	AL	ALB	008	Albania 	Albanija	\N
00040000-5666-f674-065c-0e7d67904b6a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5666-f674-5985-5a126c5656a4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5666-f674-4937-5a6d0323799a	AD	AND	020	Andorra 	Andora	\N
00040000-5666-f674-34fa-3f7ecdf689b4	AO	AGO	024	Angola 	Angola	\N
00040000-5666-f674-118c-3b93a51169b3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5666-f674-c714-50ee3d69d24e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5666-f674-7dea-113bb9f51f08	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5666-f674-2652-504b61160dc4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5666-f674-5230-899fa3cc5d53	AM	ARM	051	Armenia 	Armenija	\N
00040000-5666-f674-dcd3-7985fbcce58b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5666-f674-5307-ec99a2188967	AU	AUS	036	Australia 	Avstralija	\N
00040000-5666-f674-5654-1a700659a313	AT	AUT	040	Austria 	Avstrija	\N
00040000-5666-f674-9408-0c9a073c4b5a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5666-f674-29f8-f434b4850da3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5666-f674-f825-1e228a85cba8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5666-f674-816d-4bc33eb57e64	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5666-f674-1bee-86bb1b4f6e76	BB	BRB	052	Barbados 	Barbados	\N
00040000-5666-f674-f82f-440102dcd9b6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5666-f674-ef22-2300971dc23d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5666-f674-16e7-353d646aa2fd	BZ	BLZ	084	Belize 	Belize	\N
00040000-5666-f674-9468-d93dcec5d635	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5666-f674-ac47-3e83d5539f32	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5666-f674-acb2-6951c7f77f3c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5666-f674-afb6-7679804cd695	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5666-f674-783c-8544ef3772c6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5666-f674-f384-434044eefcb3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5666-f674-359c-e42d7829fedd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5666-f674-7d84-bc98e77025a6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5666-f674-aeca-e8d575c955a9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5666-f674-039c-d0adfe717247	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5666-f674-0681-4afe80445685	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5666-f674-48a9-2858e35e6863	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5666-f674-9af6-4450fb4744a9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5666-f674-2faf-796fe51b3726	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5666-f674-ae87-cda7fab7384f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5666-f674-f8a3-9d5ee4cebf0c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5666-f674-cc4d-93887d9fd2be	CA	CAN	124	Canada 	Kanada	\N
00040000-5666-f674-1dae-355f9a06059b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5666-f674-4260-2290aac648b2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5666-f674-94c5-8673cab5b333	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5666-f674-bc4e-832802e7af42	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5666-f674-2818-4d09bc481c9d	CL	CHL	152	Chile 	Čile	\N
00040000-5666-f674-13b7-50a8345db86f	CN	CHN	156	China 	Kitajska	\N
00040000-5666-f674-8ba5-adf6b1017f80	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5666-f674-1e10-759ae9786c75	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5666-f674-7d19-16d347906a39	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5666-f674-ccc1-f21e77bf8ee2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5666-f674-e20f-f6be05a61d24	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5666-f674-8ba0-639398fe66fc	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5666-f674-4df5-92dc7d663584	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5666-f674-936a-e3ed84c2d7c1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5666-f674-6ec0-e9c3689a35d4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5666-f674-87cb-dde3ae1d62a6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5666-f674-a70a-7c0800811342	CU	CUB	192	Cuba 	Kuba	\N
00040000-5666-f674-8363-99d0fba8f230	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5666-f674-7bd1-fa53794e01fd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5666-f674-942c-3cd2fcb1ca6c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5666-f674-e609-3df2aa52c090	DK	DNK	208	Denmark 	Danska	\N
00040000-5666-f674-9455-d8d10717ff83	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5666-f674-5167-b4704899397a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5666-f674-d4d1-778813ac3e50	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5666-f674-60a4-645351cbcee0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5666-f674-315f-cfecf4457ab0	EG	EGY	818	Egypt 	Egipt	\N
00040000-5666-f674-b933-5210476426e9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5666-f674-b4b1-320ec78240d1	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5666-f674-780b-ae719b7a1d8f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5666-f674-b5be-18bfeb4b449f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5666-f674-4aac-96e345447882	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5666-f674-bbfe-0ebb3c08e6e1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5666-f674-d89e-30b5206a5412	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5666-f674-b469-35ef7c05fc98	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5666-f674-993f-486a7bf5c2c8	FI	FIN	246	Finland 	Finska	\N
00040000-5666-f674-1ef0-cf8b26dc07a1	FR	FRA	250	France 	Francija	\N
00040000-5666-f674-e143-6fe00fe62726	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5666-f674-57fc-53d6d6032310	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5666-f674-bdc8-efd900d60adf	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5666-f674-30f8-a026c526278a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5666-f674-2918-d52c90e63fd7	GA	GAB	266	Gabon 	Gabon	\N
00040000-5666-f674-1e91-8be4deb1c277	GM	GMB	270	Gambia 	Gambija	\N
00040000-5666-f674-c066-b592fce80e0a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5666-f674-8b9b-2ed98fc831a8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5666-f674-8f5e-9e3611219fec	GH	GHA	288	Ghana 	Gana	\N
00040000-5666-f674-4a4c-5cc0b2263b8a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5666-f674-8dcc-4a8d1b7fb489	GR	GRC	300	Greece 	Grčija	\N
00040000-5666-f674-a9b6-52f17e8917fe	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5666-f674-0dc2-7ac4fd4db5ee	GD	GRD	308	Grenada 	Grenada	\N
00040000-5666-f674-5ef5-3e17afbb6eed	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5666-f674-4fbe-a5f8c5d5901e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5666-f674-086e-8403c73d0668	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5666-f674-7e4d-7eb7311f6087	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5666-f674-efcd-b351fa6bdfe1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5666-f674-1a24-48fcd2b2e445	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5666-f674-d353-71d914245a2a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5666-f674-e5f5-8fb2ed7bb940	HT	HTI	332	Haiti 	Haiti	\N
00040000-5666-f674-6ad9-60e94382b02a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5666-f674-70e2-cfe8b50791eb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5666-f674-dfc8-7e7a4304b2de	HN	HND	340	Honduras 	Honduras	\N
00040000-5666-f674-d635-1fd16c804745	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5666-f674-3c4c-c7d970efd77b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5666-f674-28a6-9635975fec54	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5666-f674-eebc-2f30e9bf2af0	IN	IND	356	India 	Indija	\N
00040000-5666-f674-7366-59b6b47b375b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5666-f674-e79d-812494e95a5a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5666-f674-2b39-bf446303edc2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5666-f674-056a-abea4a7af604	IE	IRL	372	Ireland 	Irska	\N
00040000-5666-f674-b44a-2cd16fbceadb	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5666-f674-55b5-82645dc783fb	IL	ISR	376	Israel 	Izrael	\N
00040000-5666-f674-fa55-16d7e038005b	IT	ITA	380	Italy 	Italija	\N
00040000-5666-f674-bfbc-89f4b746731a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5666-f674-0f05-0635e28c0d52	JP	JPN	392	Japan 	Japonska	\N
00040000-5666-f674-2d05-5ab04fe3248a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5666-f674-6cd8-d585c7f4d946	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5666-f674-4ef2-e43fe59e63bb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5666-f674-6b56-3669406f4119	KE	KEN	404	Kenya 	Kenija	\N
00040000-5666-f674-e0d8-ceb8192736fb	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5666-f674-3681-d70d97722518	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5666-f674-86d4-83fecfaa7526	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5666-f674-d15d-df0730cb748b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5666-f674-bc72-6eef450b0cb3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5666-f674-bbf3-d134b02e0300	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5666-f674-9ad9-8f236c985940	LV	LVA	428	Latvia 	Latvija	\N
00040000-5666-f674-81be-d0568d18a9f8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5666-f674-b245-1828b22e399d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5666-f674-c366-f5c390454601	LR	LBR	430	Liberia 	Liberija	\N
00040000-5666-f674-f21a-f923a2c2ce30	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5666-f674-fafb-88519fb2607e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5666-f674-6c45-13e0d801fa16	LT	LTU	440	Lithuania 	Litva	\N
00040000-5666-f674-e9a5-3aabe14ddf7d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5666-f674-4ad0-00ab0e268fd0	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5666-f674-e78a-98ce9a7c9a77	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5666-f674-f0f4-9a04ea3781cc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5666-f674-f4f0-63293aa2c5c6	MW	MWI	454	Malawi 	Malavi	\N
00040000-5666-f674-091a-6d12ccb9898f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5666-f674-5e32-1e900d4824e4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5666-f674-9d18-208153deafb1	ML	MLI	466	Mali 	Mali	\N
00040000-5666-f674-58bb-03374b6e6a0b	MT	MLT	470	Malta 	Malta	\N
00040000-5666-f674-ba16-917a834aeb38	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5666-f674-0c9f-f492024876f9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5666-f674-d2bc-41309c4a6680	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5666-f674-b38a-f4a1ffc7a5cb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5666-f674-b96e-a63b734af533	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5666-f674-e154-8598aaaf1b0f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5666-f674-1acc-d73874426dc4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5666-f674-f329-25d03e0d0bb7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5666-f674-7262-87e5f2eccabf	MC	MCO	492	Monaco 	Monako	\N
00040000-5666-f674-d421-42f5e4e30a7d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5666-f674-e4eb-7d57b56ef747	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5666-f674-d707-107581429bb0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5666-f674-049f-807fc8590584	MA	MAR	504	Morocco 	Maroko	\N
00040000-5666-f674-a1ab-1d2f1797e2d1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5666-f674-734a-79879d076eaf	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5666-f674-b742-451aee724fff	NA	NAM	516	Namibia 	Namibija	\N
00040000-5666-f674-3700-275c9197bc2c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5666-f674-6aa8-58fe4a2f0942	NP	NPL	524	Nepal 	Nepal	\N
00040000-5666-f674-d001-7e7739afd2bb	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5666-f674-5c13-594af1929d83	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5666-f674-df19-b64c361cccb7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5666-f674-efd5-5da649236890	NE	NER	562	Niger 	Niger 	\N
00040000-5666-f674-30b1-d1b019c4b0f0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5666-f674-8fba-b0d898107697	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5666-f674-0677-6f11126ad289	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5666-f674-5387-1ec18ad78a5a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5666-f674-ab63-4b76b010eebe	NO	NOR	578	Norway 	Norveška	\N
00040000-5666-f674-1df9-ec6ae1726251	OM	OMN	512	Oman 	Oman	\N
00040000-5666-f674-53c3-2ef5693b9949	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5666-f674-312c-5a9dd4a61a6d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5666-f674-c0f5-0a6e434bac07	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5666-f674-47f5-dd15c85c2368	PA	PAN	591	Panama 	Panama	\N
00040000-5666-f674-8189-911cbdc8148d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5666-f674-0d49-73eb90056f01	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5666-f674-4b65-39bb01861ff5	PE	PER	604	Peru 	Peru	\N
00040000-5666-f674-beda-f99ffa970928	PH	PHL	608	Philippines 	Filipini	\N
00040000-5666-f674-b78d-76a7ee466c68	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5666-f674-3dcc-3cbf96c913c8	PL	POL	616	Poland 	Poljska	\N
00040000-5666-f674-9501-088ddb82907a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5666-f674-cfa1-cd517197b85a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5666-f674-6c1f-c8fa1a2306a8	QA	QAT	634	Qatar 	Katar	\N
00040000-5666-f674-1385-ca45b2635bcf	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5666-f674-accf-145a319564e4	RO	ROU	642	Romania 	Romunija	\N
00040000-5666-f674-fca4-4fcc3412269d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5666-f674-1c28-9ca56192486f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5666-f674-8952-6b2bf2bed627	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5666-f674-f47f-b10bc8e4acd2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5666-f674-f5b2-7267f13c1bcc	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5666-f674-121f-748f065b7977	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5666-f674-fe68-62ec8a9ed5d4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5666-f674-57f3-a9de3c099e92	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5666-f674-336f-3e36b1498b56	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5666-f674-b855-79710238305b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5666-f674-14b7-47c42fac2536	SM	SMR	674	San Marino 	San Marino	\N
00040000-5666-f674-13a8-1f699289f9af	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5666-f674-3519-16b032d25f9f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5666-f674-f9b1-5537eff814e2	SN	SEN	686	Senegal 	Senegal	\N
00040000-5666-f674-21bf-70b0caf0de01	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5666-f674-de0e-077521d12bf4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5666-f674-5c2c-ddbf910af3fa	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5666-f674-6092-e2b68e3ba0ab	SG	SGP	702	Singapore 	Singapur	\N
00040000-5666-f674-7ab4-ea7aac0b0714	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5666-f674-6223-fc626e84812c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5666-f674-ea9f-e37bfb6b3fd1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5666-f674-6246-be49a081f416	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5666-f674-4aee-3f220fb32bea	SO	SOM	706	Somalia 	Somalija	\N
00040000-5666-f674-4fa8-b14a695e617d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5666-f674-2bc2-ede59cb466ee	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5666-f674-23f7-dcadfec1c3fa	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5666-f674-8418-2d42b0ae0055	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5666-f674-6e38-a66093cf0928	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5666-f674-b517-62d072cb5e84	SD	SDN	729	Sudan 	Sudan	\N
00040000-5666-f674-e181-b5b555b7bd53	SR	SUR	740	Suriname 	Surinam	\N
00040000-5666-f674-274d-2a0dc663fa45	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5666-f674-183a-e70e55c0436c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5666-f674-c01d-edcb10a09bbd	SE	SWE	752	Sweden 	Švedska	\N
00040000-5666-f674-ec0f-cf9990547dcd	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5666-f674-49e7-c924ab4f077e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5666-f674-84ec-ef28eb204f77	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5666-f674-75a6-802c627e0c15	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5666-f674-a10e-d090062a40a2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5666-f674-1b1d-0a7812c821b1	TH	THA	764	Thailand 	Tajska	\N
00040000-5666-f674-ff6f-7410d2d7f91c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5666-f674-2b7c-4e110a947e5e	TG	TGO	768	Togo 	Togo	\N
00040000-5666-f674-c33e-bdd905fab1ce	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5666-f674-1c9b-ac32aa0e7b81	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5666-f674-8007-ab7bce2c67bf	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5666-f674-8069-223e6564a340	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5666-f674-9492-160616ecbcf9	TR	TUR	792	Turkey 	Turčija	\N
00040000-5666-f674-200c-857a00831d84	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5666-f674-6002-537c5adf150c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5666-f674-27a3-601073429321	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5666-f674-6724-a00c2d10d8d7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5666-f674-5167-6c24c06ffbd6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5666-f674-2d7b-6804cb8ebb46	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5666-f674-c2f9-21bf80c59143	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5666-f674-297c-c702a568f2c2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5666-f674-0b49-2bdff78befe4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5666-f674-cd87-4349058a4148	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5666-f674-265d-8ab40b4ae642	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5666-f674-7aa2-b1446f69db3e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5666-f674-cd08-e0bb970ba474	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5666-f674-8f0e-2d6731a6d543	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5666-f674-7a2e-ec61b7db3ce2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5666-f674-6971-35c28397fbb5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5666-f674-493d-5bfa24f6e760	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5666-f674-a2c0-dcf4663e888b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5666-f674-ea6f-b26776eee692	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5666-f674-1042-f965480f3e6c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5666-f674-c3c2-6d313c20f484	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 31416398)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5666-f677-3d61-23635e1e4b33	000e0000-5666-f677-ffca-05e10540f899	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-f674-ea1c-0f0bbb391d80	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5666-f677-66bb-ae553b6798df	000e0000-5666-f677-afe6-a316b3d3590b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-f674-dd15-dc4580fd8267	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5666-f677-11c6-84bb34483d6d	000e0000-5666-f677-2b3a-6695867daaeb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5666-f674-ea1c-0f0bbb391d80	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5666-f677-bdac-ab9946e68298	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5666-f677-063b-e805ad07b765	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 31416199)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5666-f677-ab16-a18feb38a320	000e0000-5666-f677-afe6-a316b3d3590b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5666-f674-39ff-0c033da7aa5c
000d0000-5666-f677-ae02-ecdcd2ce98fa	000e0000-5666-f677-afe6-a316b3d3590b	000c0000-5666-f677-a995-1606639b71b8	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5666-f674-39ff-0c033da7aa5c
000d0000-5666-f677-e262-05ec2ec60e92	000e0000-5666-f677-afe6-a316b3d3590b	000c0000-5666-f677-680c-11513ab0d8bf	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5666-f674-b9ca-0099446d3fc2
000d0000-5666-f677-0461-7dd4715dbd8f	000e0000-5666-f677-afe6-a316b3d3590b	000c0000-5666-f677-e7e6-e2c3a992efb6	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5666-f674-2df0-3c6632768ac0
000d0000-5666-f677-dc48-3720a44f5ef9	000e0000-5666-f677-afe6-a316b3d3590b	000c0000-5666-f677-7ac5-595f14887274	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5666-f674-a5ba-91ab12638553
000d0000-5666-f677-21cb-89f3d6571e64	000e0000-5666-f677-afe6-a316b3d3590b	000c0000-5666-f677-132e-85920d71cea6	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5666-f674-a5ba-91ab12638553
000d0000-5666-f677-4084-fd1429076878	000e0000-5666-f677-afe6-a316b3d3590b	000c0000-5666-f677-c2c4-4d5dc4ccfa7b	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5666-f674-39ff-0c033da7aa5c
000d0000-5666-f677-15f4-3d36d6c38047	000e0000-5666-f677-afe6-a316b3d3590b	000c0000-5666-f677-3a9a-65bbc92c4697	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5666-f674-b6f3-43d6cd4924aa
000d0000-5666-f677-309c-62f32d8b0f1a	000e0000-5666-f677-afe6-a316b3d3590b	000c0000-5666-f677-eff1-25bd5af7d2ed	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5666-f674-2d83-055ac18e9b64
\.


--
-- TOC entry 3124 (class 0 OID 31415990)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 31415956)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 31415933)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5666-f677-94a2-72ffdf668e48	00080000-5666-f677-9412-3ae3ec9a9111	00090000-5666-f677-62c3-ae5e96a46d81	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 31416113)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 31416658)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5666-f677-6d7e-da68f15a9468	00010000-5666-f675-5a20-9ec4af51bf8c	\N	Prva mapa	Root mapa	2015-12-08 16:25:43	2015-12-08 16:25:43	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 31416671)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 31416693)
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
-- TOC entry 3140 (class 0 OID 31416138)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 31415890)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5666-f675-18dc-73e348fa017a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5666-f675-8904-23bce6245041	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5666-f675-2a4d-722d1d51037e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5666-f675-c9d5-9a5d5602026b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5666-f675-455c-e2706d590e6a	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5666-f675-d801-4a5639eceee9	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5666-f675-2d40-34f5f76da745	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5666-f675-432b-a100b029c906	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5666-f675-d728-efadc7406b21	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5666-f675-afdb-2015b1d3095b	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5666-f675-962f-ef3eb81493e1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5666-f675-c851-0f1b0f16234f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5666-f675-d241-3920579cb070	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5666-f675-0ceb-1243305413e0	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5666-f676-2cac-1957565302d1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5666-f676-f217-6b7f533f97d1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5666-f676-2706-9225e495b283	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5666-f676-a623-78f112e525bf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5666-f676-6179-32dc621664ba	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5666-f678-00fd-1480d215e23f	application.tenant.maticnopodjetje	string	s:36:"00080000-5666-f678-28a5-7ab74e868934";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 31415790)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5666-f676-c1b4-065540cbc24f	00000000-5666-f676-2cac-1957565302d1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5666-f676-62e5-f1178d50f59b	00000000-5666-f676-2cac-1957565302d1	00010000-5666-f675-5a20-9ec4af51bf8c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5666-f676-02ec-accaccbacb5e	00000000-5666-f676-f217-6b7f533f97d1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 31415857)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5666-f677-24a1-7bc2d6426915	\N	00100000-5666-f677-5857-d4becc349e04	00100000-5666-f677-5000-731baa2b7e97	01	Gledališče Nimbis
00410000-5666-f677-af57-a894bb3191dc	00410000-5666-f677-24a1-7bc2d6426915	00100000-5666-f677-5857-d4becc349e04	00100000-5666-f677-5000-731baa2b7e97	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 31415801)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5666-f677-b25c-8487ba2a1e2b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5666-f677-05fe-92ad8b709598	00010000-5666-f676-8e10-f7f800154776	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5666-f677-0038-5164d78844e3	00010000-5666-f676-5c15-da51a6583123	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5666-f677-08f5-4208fcbf2497	00010000-5666-f676-8f64-3c7e18017291	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5666-f677-daee-7e3e3c98bfad	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5666-f677-dd02-a4b8c367fdbd	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5666-f677-74ba-4b402b9f367c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5666-f677-d813-cff845b3c936	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5666-f677-62c3-ae5e96a46d81	00010000-5666-f676-73f2-168d2bbb0754	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5666-f677-b7bb-3ca248ada4a5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5666-f677-b4b4-cf39a64edd7b	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5666-f677-4544-e94332e15b0d	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5666-f677-b931-bc4d2a3b9c3f	00010000-5666-f676-eecc-7a0aebeedd42	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5666-f677-7148-da4d9867200e	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-f677-5682-c763ab3b52f4	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-f677-5e34-85006d8d41a3	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-f677-5d9b-3ba6070a708c	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5666-f677-9547-a12bde3c8d20	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5666-f677-9c0d-0a02fb15a631	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-f677-240f-ae3073d044b1	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5666-f677-0ab7-c0070bb74826	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 31415736)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5666-f674-dfc8-bacfc0fa0e51	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5666-f674-5a99-db994f89ca0b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5666-f674-a381-c4fbbe571b66	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5666-f674-375a-1479d8812587	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5666-f674-2fee-ee176fa5aa57	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5666-f674-a450-c127e184221c	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5666-f674-9e60-51fb7682e040	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5666-f674-3745-d00c5c72f8b0	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5666-f674-c21b-e436d6c230f8	Abonma-read	Abonma - branje	t
00030000-5666-f674-616f-d0b5e4c8ff31	Abonma-write	Abonma - spreminjanje	t
00030000-5666-f674-e117-dc87e559b600	Alternacija-read	Alternacija - branje	t
00030000-5666-f674-ec81-5152ae5e10a0	Alternacija-write	Alternacija - spreminjanje	t
00030000-5666-f674-6a88-3df733750447	Arhivalija-read	Arhivalija - branje	t
00030000-5666-f674-48ae-2cd2e5770f84	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5666-f674-9179-daf71bca427a	AuthStorage-read	AuthStorage - branje	t
00030000-5666-f674-140a-c7eccf014c63	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5666-f674-fd93-6a78c4021eeb	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5666-f674-f2ad-4ea7f0e9a39d	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5666-f674-5603-3bc8f7ac6a30	Besedilo-read	Besedilo - branje	t
00030000-5666-f674-bdb1-3e8c5e1f1948	Besedilo-write	Besedilo - spreminjanje	t
00030000-5666-f674-b186-ad0f9d10905d	Dogodek-read	Dogodek - branje	t
00030000-5666-f674-bc9d-9833f54bb5a9	Dogodek-write	Dogodek - spreminjanje	t
00030000-5666-f674-1ff5-7e9bc12c7521	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5666-f674-bdf7-a3971a6cea41	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5666-f674-3e28-5cd325c5e0f8	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5666-f674-fcf8-f578be475d15	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5666-f674-6c7f-a12b44938364	DogodekTrait-read	DogodekTrait - branje	t
00030000-5666-f674-dc29-240f605ece76	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5666-f674-1738-d7bc7836d139	DrugiVir-read	DrugiVir - branje	t
00030000-5666-f674-b105-63d6d406d898	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5666-f674-c3d0-5d81903bd057	Drzava-read	Drzava - branje	t
00030000-5666-f674-5351-855ba057bab9	Drzava-write	Drzava - spreminjanje	t
00030000-5666-f674-1de8-e8e6d06238b4	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5666-f674-678f-9c635870da5a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5666-f674-88c5-361b6d0df2b4	Funkcija-read	Funkcija - branje	t
00030000-5666-f674-3ba6-0050cfd112ad	Funkcija-write	Funkcija - spreminjanje	t
00030000-5666-f674-ab79-41090bc9e93f	Gostovanje-read	Gostovanje - branje	t
00030000-5666-f674-129e-066484d5530d	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5666-f674-be43-d018fa52433d	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5666-f674-b4c1-f9800c516ba3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5666-f674-64f8-dd3c7c512329	Kupec-read	Kupec - branje	t
00030000-5666-f674-c1e7-b0bdcc3c901f	Kupec-write	Kupec - spreminjanje	t
00030000-5666-f674-426a-022426f814d8	NacinPlacina-read	NacinPlacina - branje	t
00030000-5666-f674-5403-fb8e7fc26a7a	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5666-f674-1451-a76adc5ff616	Option-read	Option - branje	t
00030000-5666-f674-11f5-56a13a6fac1c	Option-write	Option - spreminjanje	t
00030000-5666-f674-dbd1-fc58c68318af	OptionValue-read	OptionValue - branje	t
00030000-5666-f674-3727-2d2bdd14b23a	OptionValue-write	OptionValue - spreminjanje	t
00030000-5666-f674-91d9-d391e5dd6e7b	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5666-f674-2631-47add59a7950	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5666-f674-883a-86a70c7099e5	Oseba-read	Oseba - branje	t
00030000-5666-f674-09b8-b5a482e7644c	Oseba-write	Oseba - spreminjanje	t
00030000-5666-f674-b51f-da7b643720ad	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5666-f674-ed76-249fc4d9e5ee	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5666-f674-ea54-89b5e99b3eb6	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5666-f674-6b69-ee4dc833d80a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5666-f674-84b3-1414d227621c	Pogodba-read	Pogodba - branje	t
00030000-5666-f674-d849-6f073a0d2967	Pogodba-write	Pogodba - spreminjanje	t
00030000-5666-f674-9ff7-582e251d2f08	Popa-read	Popa - branje	t
00030000-5666-f674-d47e-dc8df9ac5d6e	Popa-write	Popa - spreminjanje	t
00030000-5666-f674-c8d3-6aaf8932d357	Posta-read	Posta - branje	t
00030000-5666-f674-3048-600d5bee2e19	Posta-write	Posta - spreminjanje	t
00030000-5666-f674-8be2-1e96ab79b914	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5666-f674-692e-c14cc564329f	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5666-f674-fa1c-05d9be36d9e7	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5666-f674-c485-9b05e4675699	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5666-f674-9a07-b2db33ea5e49	PostniNaslov-read	PostniNaslov - branje	t
00030000-5666-f674-cc8e-225a512d0b74	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5666-f674-dbdf-e627b7c5a674	Praznik-read	Praznik - branje	t
00030000-5666-f674-2e84-f7e581befd35	Praznik-write	Praznik - spreminjanje	t
00030000-5666-f674-dc20-59254187a3c4	Predstava-read	Predstava - branje	t
00030000-5666-f674-e569-83d8cab0cfc0	Predstava-write	Predstava - spreminjanje	t
00030000-5666-f674-46e8-c02e02008b8e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5666-f674-0897-d846acc5b735	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5666-f674-aea8-42a8ede4d033	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5666-f674-9845-f495df315e31	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5666-f674-1f99-b9cfa2172220	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5666-f674-f890-447a2e925c14	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5666-f674-1cc1-f3d58203320c	ProgramDela-read	ProgramDela - branje	t
00030000-5666-f674-f28a-e912d14aa14c	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5666-f674-724e-0c336a96eff1	ProgramFestival-read	ProgramFestival - branje	t
00030000-5666-f674-ac98-674f0a391782	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5666-f674-0ab0-a4359f9cc043	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5666-f674-289d-c5cb4755717c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5666-f674-40ea-8cb04850baf5	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5666-f674-a80f-e2694fc1ada0	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5666-f674-2798-f0e506164b53	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5666-f674-86ae-925c77426864	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5666-f674-43cd-56e04a09a4de	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5666-f674-1ed4-d791126522b4	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5666-f674-efda-8eb611fb1562	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5666-f674-1585-dbfc0bfe1741	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5666-f674-37a9-4c3443a10e9f	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5666-f674-2078-61933e2c5dd8	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5666-f674-d6ba-aa40daf7d226	ProgramRazno-read	ProgramRazno - branje	t
00030000-5666-f674-1bfa-486398e4a93f	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5666-f674-58a4-2feb004de6b9	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5666-f674-2e7c-d95da9f58b00	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5666-f674-e989-fe0126502ff8	Prostor-read	Prostor - branje	t
00030000-5666-f674-32f5-b6e9836a6076	Prostor-write	Prostor - spreminjanje	t
00030000-5666-f674-9ae3-d2e7b98a8266	Racun-read	Racun - branje	t
00030000-5666-f674-6547-4728d55b456c	Racun-write	Racun - spreminjanje	t
00030000-5666-f674-489f-ca61c7358da9	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5666-f674-e255-fddebbc345ab	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5666-f674-172b-aad46d592419	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5666-f674-44db-5711c84224ed	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5666-f674-a112-aa61e91ad8f1	Rekvizit-read	Rekvizit - branje	t
00030000-5666-f674-e0ca-9a552250531f	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5666-f674-e093-4dbeb81b7936	Revizija-read	Revizija - branje	t
00030000-5666-f674-75a6-330564fbbcca	Revizija-write	Revizija - spreminjanje	t
00030000-5666-f674-892b-dd314158ac3a	Rezervacija-read	Rezervacija - branje	t
00030000-5666-f674-fc6d-aebce8ce3325	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5666-f674-11e2-a40fa3960c3f	SedezniRed-read	SedezniRed - branje	t
00030000-5666-f674-c699-c18be828807c	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5666-f674-1faa-39ed445617ba	Sedez-read	Sedez - branje	t
00030000-5666-f674-934a-4fdc48ae5914	Sedez-write	Sedez - spreminjanje	t
00030000-5666-f674-25bd-7106e58421db	Sezona-read	Sezona - branje	t
00030000-5666-f674-308d-9fb92e0c1066	Sezona-write	Sezona - spreminjanje	t
00030000-5666-f674-c542-e4d30e5e12d8	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5666-f674-bd69-ebca181aa9c1	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5666-f674-b1bd-65a6a36fc24d	Telefonska-read	Telefonska - branje	t
00030000-5666-f674-1ce5-cedacf9694eb	Telefonska-write	Telefonska - spreminjanje	t
00030000-5666-f674-1846-242b9a9b6ec4	TerminStoritve-read	TerminStoritve - branje	t
00030000-5666-f674-94a1-dff82eaee6b9	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5666-f674-8056-cdf4a4e01311	TipFunkcije-read	TipFunkcije - branje	t
00030000-5666-f674-99f6-9b493b3b09c2	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5666-f674-9130-2d43c049e344	TipPopa-read	TipPopa - branje	t
00030000-5666-f674-be7c-3de321617a8f	TipPopa-write	TipPopa - spreminjanje	t
00030000-5666-f674-bbec-d306dc25a50b	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5666-f674-255f-971f26e6ea5d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5666-f674-1220-546a4c94e361	TipVaje-read	TipVaje - branje	t
00030000-5666-f674-a29f-3c04de11db43	TipVaje-write	TipVaje - spreminjanje	t
00030000-5666-f674-53d0-9c5ef0ed5c9f	Trr-read	Trr - branje	t
00030000-5666-f674-2377-367ec31e5c2b	Trr-write	Trr - spreminjanje	t
00030000-5666-f674-c0cf-7ede675732ea	Uprizoritev-read	Uprizoritev - branje	t
00030000-5666-f674-98f2-86b2928e6793	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5666-f674-4f93-92d2dbf75445	Vaja-read	Vaja - branje	t
00030000-5666-f674-a3bc-3a0079a79b17	Vaja-write	Vaja - spreminjanje	t
00030000-5666-f674-cfd1-6debada657bb	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5666-f674-3783-15115dfb937f	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5666-f674-f952-607e7baacacd	VrstaStroska-read	VrstaStroska - branje	t
00030000-5666-f674-21e3-8ab7099293f8	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5666-f674-b641-7b6a6819e981	Zaposlitev-read	Zaposlitev - branje	t
00030000-5666-f674-72cb-405dfe6bf599	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5666-f674-d2f0-e566b5b7cdad	Zasedenost-read	Zasedenost - branje	t
00030000-5666-f674-7742-3f510534f088	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5666-f674-06ae-23d153a1a621	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5666-f674-e16e-afbe39382c99	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5666-f674-752d-51f8f160e42a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5666-f674-b656-f865a61255fd	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5666-f674-db88-95282ba5c9b0	Job-read	Branje opravil - samo zase - branje	t
00030000-5666-f674-a3b5-d95aa8afc092	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5666-f674-9715-c6e23c0af311	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5666-f674-65e8-f3747daa6e71	Report-read	Report - branje	t
00030000-5666-f674-3390-f383ce0cce80	Report-write	Report - spreminjanje	t
00030000-5666-f674-9673-c6a1e7127eb9	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5666-f674-6b5a-462b3b7ce0fe	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5666-f674-7b3b-e225ee6dd678	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5666-f674-27b5-b82db4c55ae5	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5666-f674-5299-523df98857b5	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5666-f674-f4dd-63d40b392c9c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5666-f674-db94-5b59802134c3	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5666-f674-37f9-c541f13a4c8e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5666-f674-cf38-d48c6f2d971f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5666-f674-c5d2-8882ae03f77c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5666-f674-3688-8de9e0fe7a19	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5666-f674-50ae-031a07aacfcd	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5666-f674-21f7-0c49cd4f2e1c	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5666-f674-051b-5c3ec1296093	Datoteka-write	Datoteka - spreminjanje	t
00030000-5666-f674-57d4-9908e7613890	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 31415755)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5666-f674-9d18-5bcc8511f55d	00030000-5666-f674-5a99-db994f89ca0b
00020000-5666-f674-9d18-5bcc8511f55d	00030000-5666-f674-dfc8-bacfc0fa0e51
00020000-5666-f674-ccf1-2064ce7a53df	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-f2ad-4ea7f0e9a39d
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-bdb1-3e8c5e1f1948
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-fd93-6a78c4021eeb
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-5603-3bc8f7ac6a30
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f674-24d2-479dd84dd3df	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f674-b36c-4409c6c9f51b	00030000-5666-f674-fd93-6a78c4021eeb
00020000-5666-f674-b36c-4409c6c9f51b	00030000-5666-f674-5603-3bc8f7ac6a30
00020000-5666-f674-b36c-4409c6c9f51b	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f674-b36c-4409c6c9f51b	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f674-b36c-4409c6c9f51b	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f674-4eea-16b656a4ad86	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f674-4eea-16b656a4ad86	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f674-4eea-16b656a4ad86	00030000-5666-f674-72cb-405dfe6bf599
00020000-5666-f674-4eea-16b656a4ad86	00030000-5666-f674-91d9-d391e5dd6e7b
00020000-5666-f674-4334-4b9c0c724dd8	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f674-4334-4b9c0c724dd8	00030000-5666-f674-91d9-d391e5dd6e7b
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-09b8-b5a482e7644c
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-cc8e-225a512d0b74
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-b1bd-65a6a36fc24d
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-1ce5-cedacf9694eb
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-bc76-08beda580427	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f675-0a4c-6e7b10a8d18b	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-0a4c-6e7b10a8d18b	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-0a4c-6e7b10a8d18b	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f675-0a4c-6e7b10a8d18b	00030000-5666-f674-b1bd-65a6a36fc24d
00020000-5666-f675-0a4c-6e7b10a8d18b	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-0a4c-6e7b10a8d18b	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-0a4c-6e7b10a8d18b	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-d10a-8284d06f1237	00030000-5666-f674-09b8-b5a482e7644c
00020000-5666-f675-d10a-8284d06f1237	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-d10a-8284d06f1237	00030000-5666-f674-a450-c127e184221c
00020000-5666-f675-d10a-8284d06f1237	00030000-5666-f674-2fee-ee176fa5aa57
00020000-5666-f675-d10a-8284d06f1237	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f675-d10a-8284d06f1237	00030000-5666-f674-2377-367ec31e5c2b
00020000-5666-f675-d10a-8284d06f1237	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-6c07-5242d1012513	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-6c07-5242d1012513	00030000-5666-f674-a450-c127e184221c
00020000-5666-f675-6c07-5242d1012513	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f675-6c07-5242d1012513	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-b1bd-65a6a36fc24d
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-be43-d018fa52433d
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-1ce5-cedacf9694eb
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-cc8e-225a512d0b74
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-2377-367ec31e5c2b
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-d47e-dc8df9ac5d6e
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-b4c1-f9800c516ba3
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-f890-447a2e925c14
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-0e69-4136230e6332	00030000-5666-f674-9130-2d43c049e344
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-b1bd-65a6a36fc24d
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-be43-d018fa52433d
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-09c9-d6060975956a	00030000-5666-f674-9130-2d43c049e344
00020000-5666-f675-8d64-0f9550389978	00030000-5666-f674-9130-2d43c049e344
00020000-5666-f675-8d64-0f9550389978	00030000-5666-f674-be7c-3de321617a8f
00020000-5666-f675-5023-d8f46195e770	00030000-5666-f674-9130-2d43c049e344
00020000-5666-f675-f5e7-291ed645b81e	00030000-5666-f674-c8d3-6aaf8932d357
00020000-5666-f675-f5e7-291ed645b81e	00030000-5666-f674-3048-600d5bee2e19
00020000-5666-f675-0e8d-eb8f10d1e371	00030000-5666-f674-c8d3-6aaf8932d357
00020000-5666-f675-d5d8-f5108360e9e4	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-d5d8-f5108360e9e4	00030000-5666-f674-5351-855ba057bab9
00020000-5666-f675-4c5f-0f8961ebd9eb	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-1d73-70405f94d871	00030000-5666-f674-752d-51f8f160e42a
00020000-5666-f675-1d73-70405f94d871	00030000-5666-f674-b656-f865a61255fd
00020000-5666-f675-7a4c-844701435fe9	00030000-5666-f674-752d-51f8f160e42a
00020000-5666-f675-39c1-6c9f2670387c	00030000-5666-f674-06ae-23d153a1a621
00020000-5666-f675-39c1-6c9f2670387c	00030000-5666-f674-e16e-afbe39382c99
00020000-5666-f675-e686-266a1044dbf1	00030000-5666-f674-06ae-23d153a1a621
00020000-5666-f675-61e0-8e0a5bec3b20	00030000-5666-f674-c21b-e436d6c230f8
00020000-5666-f675-61e0-8e0a5bec3b20	00030000-5666-f674-616f-d0b5e4c8ff31
00020000-5666-f675-899f-ae4310d26e4f	00030000-5666-f674-c21b-e436d6c230f8
00020000-5666-f675-c4c5-d09c9cd9d235	00030000-5666-f674-e989-fe0126502ff8
00020000-5666-f675-c4c5-d09c9cd9d235	00030000-5666-f674-32f5-b6e9836a6076
00020000-5666-f675-c4c5-d09c9cd9d235	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-c4c5-d09c9cd9d235	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f675-c4c5-d09c9cd9d235	00030000-5666-f674-cc8e-225a512d0b74
00020000-5666-f675-c4c5-d09c9cd9d235	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-39a6-9d782b59679a	00030000-5666-f674-e989-fe0126502ff8
00020000-5666-f675-39a6-9d782b59679a	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-39a6-9d782b59679a	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f675-fa8c-9676c5b493f7	00030000-5666-f674-f952-607e7baacacd
00020000-5666-f675-fa8c-9676c5b493f7	00030000-5666-f674-21e3-8ab7099293f8
00020000-5666-f675-763e-f4034ae63433	00030000-5666-f674-f952-607e7baacacd
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-2631-47add59a7950
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-91d9-d391e5dd6e7b
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f675-b542-fa6980c34096	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-5f36-08d2a5fe31a3	00030000-5666-f674-91d9-d391e5dd6e7b
00020000-5666-f675-5f36-08d2a5fe31a3	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f675-5f36-08d2a5fe31a3	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-5f36-08d2a5fe31a3	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-5f36-08d2a5fe31a3	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-1ace-8a0b488b949b	00030000-5666-f674-1220-546a4c94e361
00020000-5666-f675-1ace-8a0b488b949b	00030000-5666-f674-a29f-3c04de11db43
00020000-5666-f675-e26f-e5771e437ace	00030000-5666-f674-1220-546a4c94e361
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-9e60-51fb7682e040
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-3745-d00c5c72f8b0
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-1cc1-f3d58203320c
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-f28a-e912d14aa14c
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-724e-0c336a96eff1
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-ac98-674f0a391782
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-0ab0-a4359f9cc043
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-289d-c5cb4755717c
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-40ea-8cb04850baf5
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-a80f-e2694fc1ada0
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-2798-f0e506164b53
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-86ae-925c77426864
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-43cd-56e04a09a4de
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-1ed4-d791126522b4
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-efda-8eb611fb1562
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-1585-dbfc0bfe1741
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-37a9-4c3443a10e9f
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-2078-61933e2c5dd8
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-d6ba-aa40daf7d226
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-1bfa-486398e4a93f
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-58a4-2feb004de6b9
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-2e7c-d95da9f58b00
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-9845-f495df315e31
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-b105-63d6d406d898
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-692e-c14cc564329f
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-a3b5-d95aa8afc092
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-1738-d7bc7836d139
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-aea8-42a8ede4d033
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-8be2-1e96ab79b914
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-f952-607e7baacacd
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-c542-e4d30e5e12d8
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-88c5-361b6d0df2b4
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-e117-dc87e559b600
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-8056-cdf4a4e01311
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-84b3-1414d227621c
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-db88-95282ba5c9b0
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-add2-8ad8f842e310	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-1cc1-f3d58203320c
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-724e-0c336a96eff1
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-0ab0-a4359f9cc043
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-40ea-8cb04850baf5
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-2798-f0e506164b53
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-43cd-56e04a09a4de
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-efda-8eb611fb1562
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-37a9-4c3443a10e9f
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-d6ba-aa40daf7d226
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-58a4-2feb004de6b9
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-aea8-42a8ede4d033
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-1738-d7bc7836d139
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-8be2-1e96ab79b914
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-db88-95282ba5c9b0
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-fb81-31007607b98e	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-98f2-86b2928e6793
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-e117-dc87e559b600
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-ec81-5152ae5e10a0
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-5603-3bc8f7ac6a30
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-88c5-361b6d0df2b4
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-3ba6-0050cfd112ad
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-8056-cdf4a4e01311
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-ea70-1bc98b729fd6	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-e117-dc87e559b600
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-5603-3bc8f7ac6a30
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-88c5-361b6d0df2b4
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-8056-cdf4a4e01311
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f675-9f8c-ea46553650ea	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-e117-dc87e559b600
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-ec81-5152ae5e10a0
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-88c5-361b6d0df2b4
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-84b3-1414d227621c
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-d849-6f073a0d2967
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-c542-e4d30e5e12d8
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-bd69-ebca181aa9c1
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-8056-cdf4a4e01311
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-d242-685fda2bd491	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-e117-dc87e559b600
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-88c5-361b6d0df2b4
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-84b3-1414d227621c
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-c542-e4d30e5e12d8
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-8056-cdf4a4e01311
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-aa34-5fab6275a28e	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f675-17d8-a30a3785ad5e	00030000-5666-f674-c542-e4d30e5e12d8
00020000-5666-f675-17d8-a30a3785ad5e	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-17d8-a30a3785ad5e	00030000-5666-f674-88c5-361b6d0df2b4
00020000-5666-f675-17d8-a30a3785ad5e	00030000-5666-f674-84b3-1414d227621c
00020000-5666-f675-17d8-a30a3785ad5e	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-17d8-a30a3785ad5e	00030000-5666-f674-8056-cdf4a4e01311
00020000-5666-f675-17d8-a30a3785ad5e	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-c720-5866ca54d675	00030000-5666-f674-c542-e4d30e5e12d8
00020000-5666-f675-c720-5866ca54d675	00030000-5666-f674-bd69-ebca181aa9c1
00020000-5666-f675-c720-5866ca54d675	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-c720-5866ca54d675	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-2135-6b60b959ab0b	00030000-5666-f674-c542-e4d30e5e12d8
00020000-5666-f675-2135-6b60b959ab0b	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-c21b-e436d6c230f8
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-e117-dc87e559b600
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-fd93-6a78c4021eeb
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-f2ad-4ea7f0e9a39d
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-5603-3bc8f7ac6a30
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-bdb1-3e8c5e1f1948
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-88c5-361b6d0df2b4
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-be43-d018fa52433d
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-91d9-d391e5dd6e7b
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-09b8-b5a482e7644c
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-c8d3-6aaf8932d357
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-cc8e-225a512d0b74
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-e989-fe0126502ff8
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-b1bd-65a6a36fc24d
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-1ce5-cedacf9694eb
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-8056-cdf4a4e01311
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-9130-2d43c049e344
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-1220-546a4c94e361
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-f952-607e7baacacd
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-06ae-23d153a1a621
00020000-5666-f675-b655-703f1da2745e	00030000-5666-f674-752d-51f8f160e42a
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-dfc8-bacfc0fa0e51
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-5a99-db994f89ca0b
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c21b-e436d6c230f8
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-616f-d0b5e4c8ff31
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-e117-dc87e559b600
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-ec81-5152ae5e10a0
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-6a88-3df733750447
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-48ae-2cd2e5770f84
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9179-daf71bca427a
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-140a-c7eccf014c63
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-fd93-6a78c4021eeb
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-f2ad-4ea7f0e9a39d
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-5603-3bc8f7ac6a30
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-bdb1-3e8c5e1f1948
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-b186-ad0f9d10905d
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-375a-1479d8812587
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-bc9d-9833f54bb5a9
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1ff5-7e9bc12c7521
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-bdf7-a3971a6cea41
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-3e28-5cd325c5e0f8
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-fcf8-f578be475d15
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1738-d7bc7836d139
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-b105-63d6d406d898
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c3d0-5d81903bd057
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-5351-855ba057bab9
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1de8-e8e6d06238b4
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-678f-9c635870da5a
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-88c5-361b6d0df2b4
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-3ba6-0050cfd112ad
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-ab79-41090bc9e93f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-129e-066484d5530d
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9715-c6e23c0af311
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-db88-95282ba5c9b0
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-a3b5-d95aa8afc092
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-be43-d018fa52433d
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-b4c1-f9800c516ba3
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-64f8-dd3c7c512329
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c1e7-b0bdcc3c901f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-6b5a-462b3b7ce0fe
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-7b3b-e225ee6dd678
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-27b5-b82db4c55ae5
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-5299-523df98857b5
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-db94-5b59802134c3
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-f4dd-63d40b392c9c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-426a-022426f814d8
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-5403-fb8e7fc26a7a
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1451-a76adc5ff616
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-11f5-56a13a6fac1c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-dbd1-fc58c68318af
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-3727-2d2bdd14b23a
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-91d9-d391e5dd6e7b
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-2631-47add59a7950
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-2fee-ee176fa5aa57
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-09b8-b5a482e7644c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-b51f-da7b643720ad
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-ed76-249fc4d9e5ee
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-ea54-89b5e99b3eb6
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-6b69-ee4dc833d80a
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-84b3-1414d227621c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-d849-6f073a0d2967
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-d47e-dc8df9ac5d6e
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c8d3-6aaf8932d357
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-3048-600d5bee2e19
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-8be2-1e96ab79b914
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-692e-c14cc564329f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-fa1c-05d9be36d9e7
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c485-9b05e4675699
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-cc8e-225a512d0b74
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-dbdf-e627b7c5a674
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-2e84-f7e581befd35
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-dc20-59254187a3c4
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-e569-83d8cab0cfc0
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-46e8-c02e02008b8e
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-0897-d846acc5b735
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-aea8-42a8ede4d033
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9845-f495df315e31
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1f99-b9cfa2172220
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-f890-447a2e925c14
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9e60-51fb7682e040
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1cc1-f3d58203320c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-3745-d00c5c72f8b0
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-f28a-e912d14aa14c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-724e-0c336a96eff1
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-ac98-674f0a391782
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-0ab0-a4359f9cc043
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-289d-c5cb4755717c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-40ea-8cb04850baf5
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-a80f-e2694fc1ada0
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-2798-f0e506164b53
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-86ae-925c77426864
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-43cd-56e04a09a4de
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1ed4-d791126522b4
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-efda-8eb611fb1562
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1585-dbfc0bfe1741
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-37a9-4c3443a10e9f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-2078-61933e2c5dd8
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-d6ba-aa40daf7d226
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1bfa-486398e4a93f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-58a4-2feb004de6b9
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-2e7c-d95da9f58b00
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-e989-fe0126502ff8
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-32f5-b6e9836a6076
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9ae3-d2e7b98a8266
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-6547-4728d55b456c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-489f-ca61c7358da9
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-e255-fddebbc345ab
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-a112-aa61e91ad8f1
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-e0ca-9a552250531f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-172b-aad46d592419
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-44db-5711c84224ed
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-65e8-f3747daa6e71
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-3390-f383ce0cce80
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-e093-4dbeb81b7936
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-75a6-330564fbbcca
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-892b-dd314158ac3a
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-fc6d-aebce8ce3325
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1faa-39ed445617ba
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-934a-4fdc48ae5914
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-11e2-a40fa3960c3f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c699-c18be828807c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-25bd-7106e58421db
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-308d-9fb92e0c1066
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9673-c6a1e7127eb9
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c542-e4d30e5e12d8
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-bd69-ebca181aa9c1
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-b1bd-65a6a36fc24d
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1ce5-cedacf9694eb
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1846-242b9a9b6ec4
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-a381-c4fbbe571b66
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-94a1-dff82eaee6b9
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-8056-cdf4a4e01311
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-99f6-9b493b3b09c2
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-9130-2d43c049e344
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-be7c-3de321617a8f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-bbec-d306dc25a50b
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-255f-971f26e6ea5d
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-1220-546a4c94e361
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-a29f-3c04de11db43
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-2377-367ec31e5c2b
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-98f2-86b2928e6793
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-4f93-92d2dbf75445
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-a3bc-3a0079a79b17
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-cfd1-6debada657bb
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-3783-15115dfb937f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-f952-607e7baacacd
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-21e3-8ab7099293f8
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-21f7-0c49cd4f2e1c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-50ae-031a07aacfcd
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-72cb-405dfe6bf599
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-d2f0-e566b5b7cdad
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-7742-3f510534f088
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-06ae-23d153a1a621
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-e16e-afbe39382c99
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-752d-51f8f160e42a
00020000-5666-f676-f775-1a8f87e0f99b	00030000-5666-f674-b656-f865a61255fd
00020000-5666-f676-55d2-30000d92ac07	00030000-5666-f674-3688-8de9e0fe7a19
00020000-5666-f676-b320-5a3de7962e39	00030000-5666-f674-c5d2-8882ae03f77c
00020000-5666-f676-0ae5-b55737c2b8fc	00030000-5666-f674-98f2-86b2928e6793
00020000-5666-f676-0bcd-4d4bed1a5786	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f676-6467-10103106d398	00030000-5666-f674-7b3b-e225ee6dd678
00020000-5666-f676-d19c-e9b17a9cc9a3	00030000-5666-f674-27b5-b82db4c55ae5
00020000-5666-f676-6c8d-3ef94c6ffaa5	00030000-5666-f674-5299-523df98857b5
00020000-5666-f676-c5bd-fcfdcbdcb4cb	00030000-5666-f674-6b5a-462b3b7ce0fe
00020000-5666-f676-4197-b7efed5fdeaa	00030000-5666-f674-db94-5b59802134c3
00020000-5666-f676-bbec-84a09d7790b1	00030000-5666-f674-f4dd-63d40b392c9c
00020000-5666-f676-6aac-c16cf38269d9	00030000-5666-f674-cf38-d48c6f2d971f
00020000-5666-f676-1d2c-dcbb5353a2dd	00030000-5666-f674-37f9-c541f13a4c8e
00020000-5666-f676-6b5a-901a3cc39a20	00030000-5666-f674-883a-86a70c7099e5
00020000-5666-f676-d5f5-4df8a980b49c	00030000-5666-f674-09b8-b5a482e7644c
00020000-5666-f676-0a9c-312d8a58530e	00030000-5666-f674-2fee-ee176fa5aa57
00020000-5666-f676-b389-4adf91304ef5	00030000-5666-f674-a450-c127e184221c
00020000-5666-f676-6257-4f558df821fe	00030000-5666-f674-051b-5c3ec1296093
00020000-5666-f676-a216-861bf30899c7	00030000-5666-f674-57d4-9908e7613890
00020000-5666-f676-708b-0ecd71cc980f	00030000-5666-f674-9ff7-582e251d2f08
00020000-5666-f676-708b-0ecd71cc980f	00030000-5666-f674-d47e-dc8df9ac5d6e
00020000-5666-f676-708b-0ecd71cc980f	00030000-5666-f674-c0cf-7ede675732ea
00020000-5666-f676-004f-a2248c535aad	00030000-5666-f674-53d0-9c5ef0ed5c9f
00020000-5666-f676-aad8-5ca1e6f19aa8	00030000-5666-f674-2377-367ec31e5c2b
00020000-5666-f676-a96d-3ec284ef8df7	00030000-5666-f674-9673-c6a1e7127eb9
00020000-5666-f676-efd4-397674ddfdbf	00030000-5666-f674-b1bd-65a6a36fc24d
00020000-5666-f676-2e97-1ee97c99dc5a	00030000-5666-f674-1ce5-cedacf9694eb
00020000-5666-f676-f6f4-8c14b7b7a60c	00030000-5666-f674-9a07-b2db33ea5e49
00020000-5666-f676-ec27-99727d1525c3	00030000-5666-f674-cc8e-225a512d0b74
00020000-5666-f676-2490-9fbd4e146379	00030000-5666-f674-b641-7b6a6819e981
00020000-5666-f676-3685-c726eb169fd3	00030000-5666-f674-72cb-405dfe6bf599
00020000-5666-f676-009b-8659b53dae19	00030000-5666-f674-84b3-1414d227621c
00020000-5666-f676-c497-3c6f8bdf6ea7	00030000-5666-f674-d849-6f073a0d2967
00020000-5666-f676-b74f-454a0242531d	00030000-5666-f674-c542-e4d30e5e12d8
00020000-5666-f676-b135-d4988a0037a1	00030000-5666-f674-bd69-ebca181aa9c1
\.


--
-- TOC entry 3141 (class 0 OID 31416145)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 31416179)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 31416316)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5666-f677-1a1e-1eb79b06ccb5	00090000-5666-f677-b25c-8487ba2a1e2b	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5666-f677-d4af-ca4f02ab9e48	00090000-5666-f677-dd02-a4b8c367fdbd	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5666-f677-25a3-e15bbc3223a0	00090000-5666-f677-b931-bc4d2a3b9c3f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5666-f677-f345-74ddebab7d1c	00090000-5666-f677-b7bb-3ca248ada4a5	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 31415837)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5666-f677-9412-3ae3ec9a9111	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-f677-8f70-0e2701084dfa	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5666-f677-1d52-5e554bf97792	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-f677-f48f-a632fc32c0c3	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-f677-aea4-b3d58cf329a3	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-f677-f610-4207141285b6	\N	00040000-5666-f674-2652-504b61160dc4	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-f677-f741-7dded72c055e	\N	00040000-5666-f674-87cb-dde3ae1d62a6	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-f677-78ad-b68ff4b3d62f	\N	00040000-5666-f674-5654-1a700659a313	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-f677-a694-b796ef8db74b	\N	00040000-5666-f674-8b9b-2ed98fc831a8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5666-f678-28a5-7ab74e868934	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 31415882)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5666-f673-b314-de3e14e1897f	8341	Adlešiči
00050000-5666-f673-0b44-7729db641a04	5270	Ajdovščina
00050000-5666-f673-a5f9-61af33f1facb	6280	Ankaran/Ancarano
00050000-5666-f673-c66e-cf853a417e0b	9253	Apače
00050000-5666-f673-c430-ae5f62a01c0e	8253	Artiče
00050000-5666-f673-20b8-1385106b75e2	4275	Begunje na Gorenjskem
00050000-5666-f673-7eb2-1a83744adb4b	1382	Begunje pri Cerknici
00050000-5666-f673-b1ba-5fc3d64c0694	9231	Beltinci
00050000-5666-f673-d151-ee9e9d17e64d	2234	Benedikt
00050000-5666-f673-fcae-bdb1ad0f8c6a	2345	Bistrica ob Dravi
00050000-5666-f673-9e30-4a36c37a4833	3256	Bistrica ob Sotli
00050000-5666-f673-dd2c-f8970469fd43	8259	Bizeljsko
00050000-5666-f673-8376-21d073564625	1223	Blagovica
00050000-5666-f673-aeee-bc7710932e2e	8283	Blanca
00050000-5666-f673-a18a-c0908389eaf6	4260	Bled
00050000-5666-f673-093f-6371b07ef43d	4273	Blejska Dobrava
00050000-5666-f673-ed45-e899f41e8538	9265	Bodonci
00050000-5666-f673-9027-67fa9cbaaf83	9222	Bogojina
00050000-5666-f673-fd02-c0e6f2d3fa57	4263	Bohinjska Bela
00050000-5666-f673-ded7-9b5de0901e50	4264	Bohinjska Bistrica
00050000-5666-f673-0e50-bd7aaa3ed31f	4265	Bohinjsko jezero
00050000-5666-f673-c841-e04a8ca18a6d	1353	Borovnica
00050000-5666-f673-050b-4cc762e72935	8294	Boštanj
00050000-5666-f673-e181-2f5cf672154b	5230	Bovec
00050000-5666-f673-bf85-0a0b381f62bc	5295	Branik
00050000-5666-f673-dbeb-f1cabab212b6	3314	Braslovče
00050000-5666-f673-65ca-302c3dd77e6f	5223	Breginj
00050000-5666-f673-a150-9d39885e4d5e	8280	Brestanica
00050000-5666-f673-bd40-40e4aa0c5c63	2354	Bresternica
00050000-5666-f673-eb1e-f8cba8756c31	4243	Brezje
00050000-5666-f673-886e-30eedfe6d7c7	1351	Brezovica pri Ljubljani
00050000-5666-f673-c0af-68964dfac744	8250	Brežice
00050000-5666-f673-b405-de0d1da99814	4210	Brnik - Aerodrom
00050000-5666-f673-ab91-be4126a1be05	8321	Brusnice
00050000-5666-f673-c0d1-2d49baa1c3b1	3255	Buče
00050000-5666-f673-50da-7f48c42a9704	8276	Bučka 
00050000-5666-f673-e5a9-bb7cf8f3e7d2	9261	Cankova
00050000-5666-f673-1ef9-0c8ce0b8e2be	3000	Celje 
00050000-5666-f673-af12-04138ad417f8	3001	Celje - poštni predali
00050000-5666-f673-32a0-9c5ab920780e	4207	Cerklje na Gorenjskem
00050000-5666-f673-039e-e2898ed1c77d	8263	Cerklje ob Krki
00050000-5666-f673-bfa9-4143c89f511a	1380	Cerknica
00050000-5666-f673-71db-1396dd9b12c7	5282	Cerkno
00050000-5666-f673-1fcf-88b1462bb32b	2236	Cerkvenjak
00050000-5666-f673-04be-347bfadd06b0	2215	Ceršak
00050000-5666-f673-e47a-71812a92977f	2326	Cirkovce
00050000-5666-f673-2500-9f809ec01897	2282	Cirkulane
00050000-5666-f673-d1a3-d932c116393c	5273	Col
00050000-5666-f673-3c25-3be5c6d1a681	8251	Čatež ob Savi
00050000-5666-f673-8b62-242a15aa6400	1413	Čemšenik
00050000-5666-f673-d8b4-2beacaae87b6	5253	Čepovan
00050000-5666-f673-435f-ef21a0272f32	9232	Črenšovci
00050000-5666-f673-9c97-3b6ae98a474e	2393	Črna na Koroškem
00050000-5666-f673-ae1b-2747cc251818	6275	Črni Kal
00050000-5666-f673-9f07-601685bb3a3b	5274	Črni Vrh nad Idrijo
00050000-5666-f673-73ea-3c40edeb98c5	5262	Črniče
00050000-5666-f673-f7b7-a965b1cc35ef	8340	Črnomelj
00050000-5666-f673-333a-6c06a1080643	6271	Dekani
00050000-5666-f673-8bed-9064115330c2	5210	Deskle
00050000-5666-f673-57d6-8654accb76af	2253	Destrnik
00050000-5666-f673-dad2-5abd8d83fbd1	6215	Divača
00050000-5666-f673-1ebd-a8705ab316c8	1233	Dob
00050000-5666-f673-1ee5-56e1a42b070c	3224	Dobje pri Planini
00050000-5666-f673-7273-eee1c265f423	8257	Dobova
00050000-5666-f673-ab65-54deff3f2006	1423	Dobovec
00050000-5666-f673-f911-7bbf9569ce23	5263	Dobravlje
00050000-5666-f673-3d6c-cbe30e5b9188	3204	Dobrna
00050000-5666-f673-f911-8169abcf60e4	8211	Dobrnič
00050000-5666-f673-879d-d482b5414f93	1356	Dobrova
00050000-5666-f673-cd00-aebc1635dbe6	9223	Dobrovnik/Dobronak 
00050000-5666-f673-8e02-65876719b01c	5212	Dobrovo v Brdih
00050000-5666-f673-8710-4e6adfdda781	1431	Dol pri Hrastniku
00050000-5666-f673-66c5-4243a10675f7	1262	Dol pri Ljubljani
00050000-5666-f673-7509-2ae03d255de7	1273	Dole pri Litiji
00050000-5666-f673-7931-22c0d3927922	1331	Dolenja vas
00050000-5666-f673-6cd4-906608484ba9	8350	Dolenjske Toplice
00050000-5666-f673-3cff-cb049adddafe	1230	Domžale
00050000-5666-f673-43d8-c69c6e1edbe3	2252	Dornava
00050000-5666-f673-e145-52fa4ee7ad0e	5294	Dornberk
00050000-5666-f673-6bd4-a7ff3b8b7297	1319	Draga
00050000-5666-f673-d7f5-f26de77bbcc3	8343	Dragatuš
00050000-5666-f673-21c4-e23b419359ae	3222	Dramlje
00050000-5666-f673-c10e-6c05eb5354d7	2370	Dravograd
00050000-5666-f673-c1d9-acd16569c427	4203	Duplje
00050000-5666-f673-9b8a-c6ea0e7c6d54	6221	Dutovlje
00050000-5666-f673-d0ac-b484a5f9bdae	8361	Dvor
00050000-5666-f673-6e8e-4f9c19f7b45e	2343	Fala
00050000-5666-f673-b911-daeee6d701bb	9208	Fokovci
00050000-5666-f673-fe06-be0d5dd7d477	2313	Fram
00050000-5666-f673-13d2-f8925807dec2	3213	Frankolovo
00050000-5666-f673-9bf1-7e0780682df0	1274	Gabrovka
00050000-5666-f673-7dbe-c5d9057dfa14	8254	Globoko
00050000-5666-f673-4286-26f8dc0f6428	5275	Godovič
00050000-5666-f673-da84-1da548c93253	4204	Golnik
00050000-5666-f673-a261-db702065f42e	3303	Gomilsko
00050000-5666-f673-6c18-6e736f2dd217	4224	Gorenja vas
00050000-5666-f673-c440-5c43e2081f40	3263	Gorica pri Slivnici
00050000-5666-f673-2a2c-323a95bb82b9	2272	Gorišnica
00050000-5666-f673-be21-800eb4417d91	9250	Gornja Radgona
00050000-5666-f673-94b0-6af2c247dd77	3342	Gornji Grad
00050000-5666-f673-d42e-b2b0057ba8fa	4282	Gozd Martuljek
00050000-5666-f673-3d3f-abca335d8627	6272	Gračišče
00050000-5666-f673-8a44-0643292b1194	9264	Grad
00050000-5666-f673-06fb-465841ab818c	8332	Gradac
00050000-5666-f673-4b63-61d729200d8e	1384	Grahovo
00050000-5666-f673-739d-0d4c6cedbc53	5242	Grahovo ob Bači
00050000-5666-f673-98c3-799b483f1608	5251	Grgar
00050000-5666-f673-6edc-a83f631d585e	3302	Griže
00050000-5666-f673-f4b9-337ebbdcdce5	3231	Grobelno
00050000-5666-f673-1216-5ea63c9451e7	1290	Grosuplje
00050000-5666-f673-485b-36b4aca2731d	2288	Hajdina
00050000-5666-f673-1195-7d701e31c6f5	8362	Hinje
00050000-5666-f673-cf62-174439d006d0	2311	Hoče
00050000-5666-f673-b024-d235873b6c7e	9205	Hodoš/Hodos
00050000-5666-f673-b2df-91eb70788649	1354	Horjul
00050000-5666-f673-be3c-ddf22e672d71	1372	Hotedršica
00050000-5666-f673-ab26-23daf675d97d	1430	Hrastnik
00050000-5666-f673-0f3c-17589034634e	6225	Hruševje
00050000-5666-f673-dc4a-6a786d6bb58a	4276	Hrušica
00050000-5666-f673-1eba-b88b0dde35c0	5280	Idrija
00050000-5666-f673-f763-2d48c7701c95	1292	Ig
00050000-5666-f673-c381-3af2d8f913ef	6250	Ilirska Bistrica
00050000-5666-f673-45e7-2e339cef7fea	6251	Ilirska Bistrica-Trnovo
00050000-5666-f673-9cd4-6ab05b2b05b4	1295	Ivančna Gorica
00050000-5666-f673-dac9-94f8e2ca6a7c	2259	Ivanjkovci
00050000-5666-f673-33bd-036a26ffd03f	1411	Izlake
00050000-5666-f673-d567-91df33b14fc7	6310	Izola/Isola
00050000-5666-f673-0252-a1fe4f8b2150	2222	Jakobski Dol
00050000-5666-f673-eff8-7dc807e649df	2221	Jarenina
00050000-5666-f673-7f12-99cea6b8b000	6254	Jelšane
00050000-5666-f673-94b1-552e6ad95755	4270	Jesenice
00050000-5666-f673-6489-18f9c859ca69	8261	Jesenice na Dolenjskem
00050000-5666-f673-096d-558ff65bb939	3273	Jurklošter
00050000-5666-f673-fda3-82e9f1060b9c	2223	Jurovski Dol
00050000-5666-f673-a299-9fbd69891e2a	2256	Juršinci
00050000-5666-f673-5f04-4ca19c8ddc63	5214	Kal nad Kanalom
00050000-5666-f673-1be7-03a4dd211087	3233	Kalobje
00050000-5666-f673-2ffb-016ef1145d70	4246	Kamna Gorica
00050000-5666-f673-5566-0f70df8a8532	2351	Kamnica
00050000-5666-f673-d368-78eadc24e921	1241	Kamnik
00050000-5666-f673-55e5-6d15514e75c7	5213	Kanal
00050000-5666-f673-9c52-15fa8904ef99	8258	Kapele
00050000-5666-f673-e1bd-1e93e0f27886	2362	Kapla
00050000-5666-f673-01fe-fc9cf75bf9ca	2325	Kidričevo
00050000-5666-f673-d26e-00672958bf8f	1412	Kisovec
00050000-5666-f673-8bba-c6e5332a575a	6253	Knežak
00050000-5666-f673-8f6f-b25107e2759f	5222	Kobarid
00050000-5666-f673-1443-5a4b704473a7	9227	Kobilje
00050000-5666-f673-f055-0c57fcc635f6	1330	Kočevje
00050000-5666-f673-f9a9-81c68d89d395	1338	Kočevska Reka
00050000-5666-f673-4e7e-eb730da26e2a	2276	Kog
00050000-5666-f673-439d-c86d5917adb3	5211	Kojsko
00050000-5666-f673-54be-5b4fe11485b5	6223	Komen
00050000-5666-f673-04e1-31880a7bf847	1218	Komenda
00050000-5666-f673-22e2-8ebc8abdd050	6000	Koper/Capodistria 
00050000-5666-f673-c1c3-6b25f3346f79	6001	Koper/Capodistria - poštni predali
00050000-5666-f673-d796-91ebcbd9406f	8282	Koprivnica
00050000-5666-f673-d627-18403b14ac12	5296	Kostanjevica na Krasu
00050000-5666-f673-90ff-999b6f1d6f6f	8311	Kostanjevica na Krki
00050000-5666-f673-4afd-639cfe7d33a8	1336	Kostel
00050000-5666-f673-d529-080c60ac2789	6256	Košana
00050000-5666-f673-3f2b-17638f817393	2394	Kotlje
00050000-5666-f673-d7bc-7f87257c3336	6240	Kozina
00050000-5666-f673-bbc5-184367191603	3260	Kozje
00050000-5666-f673-f1ab-92946eb7a978	4000	Kranj 
00050000-5666-f673-d7aa-93923a22dbcf	4001	Kranj - poštni predali
00050000-5666-f673-3073-c73c44ffadac	4280	Kranjska Gora
00050000-5666-f673-8e51-8a449dc519ce	1281	Kresnice
00050000-5666-f673-dacc-d906426bb2cc	4294	Križe
00050000-5666-f673-6d35-8b606b8ab899	9206	Križevci
00050000-5666-f673-5d0b-b1dc706d6dce	9242	Križevci pri Ljutomeru
00050000-5666-f673-3804-2b636c80575d	1301	Krka
00050000-5666-f673-8288-4d4f5b906766	8296	Krmelj
00050000-5666-f673-02ba-5c7d7c2d0e64	4245	Kropa
00050000-5666-f673-e312-62f9c008039f	8262	Krška vas
00050000-5666-f673-cb48-c7f6dd56c3a4	8270	Krško
00050000-5666-f673-c03b-11f9ca9517a0	9263	Kuzma
00050000-5666-f673-4f8f-967447c9ba7a	2318	Laporje
00050000-5666-f673-9db6-84ccb1c8495a	3270	Laško
00050000-5666-f673-5e09-8843287598dc	1219	Laze v Tuhinju
00050000-5666-f673-4d99-2acbe13f89d4	2230	Lenart v Slovenskih goricah
00050000-5666-f673-7784-05fd29ff14f9	9220	Lendava/Lendva
00050000-5666-f673-84ff-c917ef3da862	4248	Lesce
00050000-5666-f673-bd57-6083dc5dd2bf	3261	Lesično
00050000-5666-f673-123f-41e357623d3a	8273	Leskovec pri Krškem
00050000-5666-f673-8bbb-423b852e2871	2372	Libeliče
00050000-5666-f673-1064-b9cec3f72584	2341	Limbuš
00050000-5666-f673-dd64-bd0512cfca00	1270	Litija
00050000-5666-f673-f66c-d4a72b15a67e	3202	Ljubečna
00050000-5666-f673-59c7-dd6dcb69feb3	1000	Ljubljana 
00050000-5666-f673-7f3d-a5fc30f934cf	1001	Ljubljana - poštni predali
00050000-5666-f673-fbe7-768fc4a8d8e4	1231	Ljubljana - Črnuče
00050000-5666-f673-5910-7121cac1187a	1261	Ljubljana - Dobrunje
00050000-5666-f673-539b-88595a2d6be2	1260	Ljubljana - Polje
00050000-5666-f673-4c4a-d1c16ebe3b50	1210	Ljubljana - Šentvid
00050000-5666-f673-4b47-de1b6cb20f62	1211	Ljubljana - Šmartno
00050000-5666-f673-26e0-891215aaf083	3333	Ljubno ob Savinji
00050000-5666-f673-6c7c-1449d63f050d	9240	Ljutomer
00050000-5666-f673-7895-3d90727021e7	3215	Loče
00050000-5666-f673-e1e6-731a599c0e12	5231	Log pod Mangartom
00050000-5666-f673-6b41-38e9d756af8c	1358	Log pri Brezovici
00050000-5666-f673-84cd-e7ba561d6565	1370	Logatec
00050000-5666-f673-0c6f-60f13b24afea	1371	Logatec
00050000-5666-f673-1443-7babda495d08	1434	Loka pri Zidanem Mostu
00050000-5666-f673-8e7f-7cd9aca78289	3223	Loka pri Žusmu
00050000-5666-f673-ba13-200e83f2659c	6219	Lokev
00050000-5666-f673-a88e-485de2aee598	1318	Loški Potok
00050000-5666-f673-e1cb-72c5cdfad9ce	2324	Lovrenc na Dravskem polju
00050000-5666-f673-13f5-0087dffed452	2344	Lovrenc na Pohorju
00050000-5666-f673-403b-f7cccf96ff09	3334	Luče
00050000-5666-f673-cb2b-2747e800d08f	1225	Lukovica
00050000-5666-f673-c400-a565c3fbc4c5	9202	Mačkovci
00050000-5666-f673-0b39-ee5f126e36b6	2322	Majšperk
00050000-5666-f673-7f3f-b3da4559805c	2321	Makole
00050000-5666-f673-0a14-f78f94f2fba0	9243	Mala Nedelja
00050000-5666-f673-8364-bf4cc2da5f50	2229	Malečnik
00050000-5666-f673-2548-32ab43eeb336	6273	Marezige
00050000-5666-f673-d2ec-4ce17d741a08	2000	Maribor 
00050000-5666-f673-b460-8513b62d4c7d	2001	Maribor - poštni predali
00050000-5666-f673-bd52-169cdee6e667	2206	Marjeta na Dravskem polju
00050000-5666-f673-b17f-a3501ce3c288	2281	Markovci
00050000-5666-f673-e214-451435d5e13e	9221	Martjanci
00050000-5666-f673-e413-123af5378175	6242	Materija
00050000-5666-f673-e0bc-2b99e7b6bef6	4211	Mavčiče
00050000-5666-f673-adf9-b69d9b461766	1215	Medvode
00050000-5666-f673-e8eb-8022a7cebf72	1234	Mengeš
00050000-5666-f673-c10b-2e94e01168e1	8330	Metlika
00050000-5666-f673-2be5-3593772f1fec	2392	Mežica
00050000-5666-f673-6e6d-70cff301118f	2204	Miklavž na Dravskem polju
00050000-5666-f673-e681-dce43d883d84	2275	Miklavž pri Ormožu
00050000-5666-f673-38c6-3bd91d1b002c	5291	Miren
00050000-5666-f673-c21c-ea70ced8a08a	8233	Mirna
00050000-5666-f673-c055-0c5e4e5bfe0c	8216	Mirna Peč
00050000-5666-f673-ee4c-939b8358ba02	2382	Mislinja
00050000-5666-f673-7d20-d8826fa04039	4281	Mojstrana
00050000-5666-f673-56dd-6a3468f6f7df	8230	Mokronog
00050000-5666-f673-45f0-2bc5c1654d30	1251	Moravče
00050000-5666-f673-f35e-05a8978a5134	9226	Moravske Toplice
00050000-5666-f673-d797-80624987468d	5216	Most na Soči
00050000-5666-f673-5edf-7c54493e0902	1221	Motnik
00050000-5666-f673-7a95-a49b53685b04	3330	Mozirje
00050000-5666-f673-1d14-21cb90d3d3f0	9000	Murska Sobota 
00050000-5666-f673-8cd5-b58a1b764666	9001	Murska Sobota - poštni predali
00050000-5666-f673-aed3-b4382ce0ea17	2366	Muta
00050000-5666-f673-ece8-8f8300505b1e	4202	Naklo
00050000-5666-f673-c562-d3f130f3135c	3331	Nazarje
00050000-5666-f673-4776-2c926469b015	1357	Notranje Gorice
00050000-5666-f673-41bc-7e11162050cf	3203	Nova Cerkev
00050000-5666-f673-9d03-97e86998e758	5000	Nova Gorica 
00050000-5666-f673-2e18-04db7a955bbf	5001	Nova Gorica - poštni predali
00050000-5666-f673-25f7-2eca2024036e	1385	Nova vas
00050000-5666-f673-bd76-15affd8a6c85	8000	Novo mesto
00050000-5666-f673-9191-a8bb2a8664d4	8001	Novo mesto - poštni predali
00050000-5666-f673-ce2c-78bdb7465487	6243	Obrov
00050000-5666-f673-3812-5356c1f9bbae	9233	Odranci
00050000-5666-f673-6b52-9237b8036eac	2317	Oplotnica
00050000-5666-f673-1190-dcac1b828a79	2312	Orehova vas
00050000-5666-f673-f5e0-97f15680c376	2270	Ormož
00050000-5666-f673-c376-3582279203d6	1316	Ortnek
00050000-5666-f673-30d3-b04f4d117a33	1337	Osilnica
00050000-5666-f673-181a-9995645c2899	8222	Otočec
00050000-5666-f673-5f30-d9dffc90bfc1	2361	Ožbalt
00050000-5666-f673-e158-349c6ce77e5e	2231	Pernica
00050000-5666-f673-bc22-533f69a0a903	2211	Pesnica pri Mariboru
00050000-5666-f673-306b-fe3a4a1ac86d	9203	Petrovci
00050000-5666-f673-ce42-c6330952dd42	3301	Petrovče
00050000-5666-f673-259d-5d0ec19a7cc8	6330	Piran/Pirano
00050000-5666-f673-08b5-aad40f3bf46d	8255	Pišece
00050000-5666-f673-554d-ce94a8f4a359	6257	Pivka
00050000-5666-f673-b053-45d571265afd	6232	Planina
00050000-5666-f673-8388-3c1f4e279fcf	3225	Planina pri Sevnici
00050000-5666-f673-6fa7-3a4b81429d0c	6276	Pobegi
00050000-5666-f674-90e3-49f3ae780064	8312	Podbočje
00050000-5666-f674-167c-29b7395c2d6f	5243	Podbrdo
00050000-5666-f674-525b-57080baa65b8	3254	Podčetrtek
00050000-5666-f674-438c-7d75a801e529	2273	Podgorci
00050000-5666-f674-0b0d-3bbdad0613a5	6216	Podgorje
00050000-5666-f674-69aa-68334106e441	2381	Podgorje pri Slovenj Gradcu
00050000-5666-f674-1ac9-138c10b667d5	6244	Podgrad
00050000-5666-f674-8e3c-339e90117faf	1414	Podkum
00050000-5666-f674-e818-858ffa610a5a	2286	Podlehnik
00050000-5666-f674-40b0-b84f1f98a85d	5272	Podnanos
00050000-5666-f674-6704-a78e0a9837af	4244	Podnart
00050000-5666-f674-1bd1-0607e6960986	3241	Podplat
00050000-5666-f674-5336-d03375a8fa37	3257	Podsreda
00050000-5666-f674-a3d8-7d9bb43db541	2363	Podvelka
00050000-5666-f674-03a7-960898556663	2208	Pohorje
00050000-5666-f674-8059-baa8cb0bde7b	2257	Polenšak
00050000-5666-f674-33ae-62ed971b645f	1355	Polhov Gradec
00050000-5666-f674-5f3f-cda2c12d4598	4223	Poljane nad Škofjo Loko
00050000-5666-f674-8291-96d6d785512b	2319	Poljčane
00050000-5666-f674-e522-fe3f00abf3f9	1272	Polšnik
00050000-5666-f674-770d-2a19738c776b	3313	Polzela
00050000-5666-f674-cd7c-f0577be800e6	3232	Ponikva
00050000-5666-f674-820c-c09306c1ed60	6320	Portorož/Portorose
00050000-5666-f674-114d-339776e575e0	6230	Postojna
00050000-5666-f674-ebbb-809875970d3c	2331	Pragersko
00050000-5666-f674-c6e2-9b3cdec4e81d	3312	Prebold
00050000-5666-f674-36d9-cb7708a5cf1c	4205	Preddvor
00050000-5666-f674-373f-b8f9ba5d260a	6255	Prem
00050000-5666-f674-06cd-95140c4f8a94	1352	Preserje
00050000-5666-f674-b158-10b158b2ff37	6258	Prestranek
00050000-5666-f674-d947-1b64a946736e	2391	Prevalje
00050000-5666-f674-58ad-4b22d8b7876b	3262	Prevorje
00050000-5666-f674-04c8-fdbb6801c7c1	1276	Primskovo 
00050000-5666-f674-9d30-2e4a2faecd27	3253	Pristava pri Mestinju
00050000-5666-f674-62a1-f61ba9fd8609	9207	Prosenjakovci/Partosfalva
00050000-5666-f674-78b5-55d6476b2512	5297	Prvačina
00050000-5666-f674-a6e1-f4cafae31919	2250	Ptuj
00050000-5666-f674-c4fe-e237d4d0debf	2323	Ptujska Gora
00050000-5666-f674-d075-efa7a87e0e7d	9201	Puconci
00050000-5666-f674-1299-940626334a98	2327	Rače
00050000-5666-f674-6473-0787f3ee883e	1433	Radeče
00050000-5666-f674-1bb5-8b9e3640bc7a	9252	Radenci
00050000-5666-f674-e4ad-808d0c9a7fc6	2360	Radlje ob Dravi
00050000-5666-f674-db7c-53999da7b400	1235	Radomlje
00050000-5666-f674-c0e6-45505bc61ee0	4240	Radovljica
00050000-5666-f674-d905-030f06f5dc55	8274	Raka
00050000-5666-f674-9c97-3481f4994af3	1381	Rakek
00050000-5666-f674-4c42-9e4adb2ecdcb	4283	Rateče - Planica
00050000-5666-f674-5dbb-e1e0a19b382c	2390	Ravne na Koroškem
00050000-5666-f674-ea28-ae22a4b915c0	9246	Razkrižje
00050000-5666-f674-0ab2-fa413daf741b	3332	Rečica ob Savinji
00050000-5666-f674-e20b-caf38b295e07	5292	Renče
00050000-5666-f674-69b5-068279811aab	1310	Ribnica
00050000-5666-f674-09c5-56faf19353c7	2364	Ribnica na Pohorju
00050000-5666-f674-244e-de7ea40f1a75	3272	Rimske Toplice
00050000-5666-f674-a607-ccbacf2d82b0	1314	Rob
00050000-5666-f674-48f1-e1942b59bf3d	5215	Ročinj
00050000-5666-f674-d6d7-ea29682cd891	3250	Rogaška Slatina
00050000-5666-f674-3636-5c92a0839fa3	9262	Rogašovci
00050000-5666-f674-988c-6632cc7a016c	3252	Rogatec
00050000-5666-f674-1aed-a040b934c8d5	1373	Rovte
00050000-5666-f674-12fe-e4c9a7fe0f4f	2342	Ruše
00050000-5666-f674-8587-c71fa9bf65e2	1282	Sava
00050000-5666-f674-53e2-ea8955cec776	6333	Sečovlje/Sicciole
00050000-5666-f674-18ba-c289721ac9ed	4227	Selca
00050000-5666-f674-ec7a-ca17669f6a57	2352	Selnica ob Dravi
00050000-5666-f674-6eba-7d43c7477460	8333	Semič
00050000-5666-f674-1ed8-9589a1963cf9	8281	Senovo
00050000-5666-f674-a70a-6358f60b58db	6224	Senožeče
00050000-5666-f674-d2df-2abf17bc05fa	8290	Sevnica
00050000-5666-f674-e95d-b709c64172ea	6210	Sežana
00050000-5666-f674-445c-be6d75877e32	2214	Sladki Vrh
00050000-5666-f674-044a-670e44a8055f	5283	Slap ob Idrijci
00050000-5666-f674-72f4-3b8bd2f28b89	2380	Slovenj Gradec
00050000-5666-f674-48c7-271852545955	2310	Slovenska Bistrica
00050000-5666-f674-5678-e3dbd1c9810a	3210	Slovenske Konjice
00050000-5666-f674-5629-256a0d8b9749	1216	Smlednik
00050000-5666-f674-437f-7c50b4e7f3f0	5232	Soča
00050000-5666-f674-5429-f4e72c523af8	1317	Sodražica
00050000-5666-f674-211b-eeb1f862a5d1	3335	Solčava
00050000-5666-f674-6d85-14260b23ecd9	5250	Solkan
00050000-5666-f674-8d5a-dac878a8b118	4229	Sorica
00050000-5666-f674-a0ac-c3d8f140e834	4225	Sovodenj
00050000-5666-f674-a45f-ceb8f5efda63	5281	Spodnja Idrija
00050000-5666-f674-3a41-88727cc41cd8	2241	Spodnji Duplek
00050000-5666-f674-66c4-48584c50c6f1	9245	Spodnji Ivanjci
00050000-5666-f674-4731-78348af065b0	2277	Središče ob Dravi
00050000-5666-f674-1860-cdb0b009b7da	4267	Srednja vas v Bohinju
00050000-5666-f674-a480-ab1ec2d6af24	8256	Sromlje 
00050000-5666-f674-34c0-0cc302dc2434	5224	Srpenica
00050000-5666-f674-c704-6ac19c7ba10d	1242	Stahovica
00050000-5666-f674-4558-ae4aa03e978a	1332	Stara Cerkev
00050000-5666-f674-957f-74e43c4557dc	8342	Stari trg ob Kolpi
00050000-5666-f674-f697-f94b44d30271	1386	Stari trg pri Ložu
00050000-5666-f674-5bee-debfee1f943f	2205	Starše
00050000-5666-f674-b311-a04a20f3ba9c	2289	Stoperce
00050000-5666-f674-f8d1-f00a1e2df2a4	8322	Stopiče
00050000-5666-f674-e9b6-c804be0619aa	3206	Stranice
00050000-5666-f674-17b4-ce65abd46d21	8351	Straža
00050000-5666-f674-c0db-5eb43aa6adbc	1313	Struge
00050000-5666-f674-415d-1c9d29261c44	8293	Studenec
00050000-5666-f674-6441-4b5f0b78c4cd	8331	Suhor
00050000-5666-f674-ecf4-05cbadeae924	2233	Sv. Ana v Slovenskih goricah
00050000-5666-f674-6eb0-7e76c724373a	2235	Sv. Trojica v Slovenskih goricah
00050000-5666-f674-dcf0-a0db581468f8	2353	Sveti Duh na Ostrem Vrhu
00050000-5666-f674-71b1-25dfcd8030a1	9244	Sveti Jurij ob Ščavnici
00050000-5666-f674-c893-9d279db1c967	3264	Sveti Štefan
00050000-5666-f674-9734-41ccce2a7378	2258	Sveti Tomaž
00050000-5666-f674-2edd-05b0a54d7f0f	9204	Šalovci
00050000-5666-f674-8c5e-3cb2e10a633c	5261	Šempas
00050000-5666-f674-2fa7-26c74b2d613a	5290	Šempeter pri Gorici
00050000-5666-f674-eadb-2fe84c8e8f91	3311	Šempeter v Savinjski dolini
00050000-5666-f674-c3ab-b5815020c548	4208	Šenčur
00050000-5666-f674-cfa2-f7fd0f06413f	2212	Šentilj v Slovenskih goricah
00050000-5666-f674-2724-2353b2498a58	8297	Šentjanž
00050000-5666-f674-fcfd-0dc158f9852a	2373	Šentjanž pri Dravogradu
00050000-5666-f674-263a-05f07fbd468c	8310	Šentjernej
00050000-5666-f674-2bb9-f5ce8ab46f95	3230	Šentjur
00050000-5666-f674-e8e0-4debe8b22a2e	3271	Šentrupert
00050000-5666-f674-dbc1-615a66142456	8232	Šentrupert
00050000-5666-f674-9cf4-1689849f4142	1296	Šentvid pri Stični
00050000-5666-f674-fb84-73fa654fb880	8275	Škocjan
00050000-5666-f674-2fd0-9ef3af4b3340	6281	Škofije
00050000-5666-f674-6d8b-4cfb078ee481	4220	Škofja Loka
00050000-5666-f674-cb3a-239446880473	3211	Škofja vas
00050000-5666-f674-3a35-218fbb7b777d	1291	Škofljica
00050000-5666-f674-ae52-ed4be727a1cb	6274	Šmarje
00050000-5666-f674-78f6-3388c4f2c770	1293	Šmarje - Sap
00050000-5666-f674-b62d-497a4e05e36d	3240	Šmarje pri Jelšah
00050000-5666-f674-12b8-0c3eff35ffae	8220	Šmarješke Toplice
00050000-5666-f674-40fa-c32cad658172	2315	Šmartno na Pohorju
00050000-5666-f674-1349-5ed920b98bd4	3341	Šmartno ob Dreti
00050000-5666-f674-b919-98ac858631a3	3327	Šmartno ob Paki
00050000-5666-f674-cb15-a02a7230f5c6	1275	Šmartno pri Litiji
00050000-5666-f674-4cc2-c0dd125e38b8	2383	Šmartno pri Slovenj Gradcu
00050000-5666-f674-b545-6669e18ffd0d	3201	Šmartno v Rožni dolini
00050000-5666-f674-a923-8901b7560588	3325	Šoštanj
00050000-5666-f674-75c6-51a816feffe2	6222	Štanjel
00050000-5666-f674-ec78-815a399f27b7	3220	Štore
00050000-5666-f674-5da3-28dbdee915f1	3304	Tabor
00050000-5666-f674-6656-34329ff06359	3221	Teharje
00050000-5666-f674-7ce8-e00266051b88	9251	Tišina
00050000-5666-f674-da51-4bb935179e02	5220	Tolmin
00050000-5666-f674-1d9d-683201bfcdf2	3326	Topolšica
00050000-5666-f674-8006-b22a5e7ed314	2371	Trbonje
00050000-5666-f674-7a2c-523a94421b49	1420	Trbovlje
00050000-5666-f674-beac-3508ad202a9b	8231	Trebelno 
00050000-5666-f674-f281-f0165211424e	8210	Trebnje
00050000-5666-f674-7c23-7a32fcbcc518	5252	Trnovo pri Gorici
00050000-5666-f674-511e-93701db257bf	2254	Trnovska vas
00050000-5666-f674-bf58-faae745a91ed	1222	Trojane
00050000-5666-f674-ba6f-081af2761c46	1236	Trzin
00050000-5666-f674-1156-b936a6a19709	4290	Tržič
00050000-5666-f674-2299-3a2911c03a7f	8295	Tržišče
00050000-5666-f674-d5f3-d8db257dd6c8	1311	Turjak
00050000-5666-f674-e519-773166f6ca8a	9224	Turnišče
00050000-5666-f674-d1d9-14bd128ba6b5	8323	Uršna sela
00050000-5666-f674-d7dd-f374683054ea	1252	Vače
00050000-5666-f674-88b6-a286eb2465dd	3320	Velenje 
00050000-5666-f674-3210-8a85a110b885	3322	Velenje - poštni predali
00050000-5666-f674-d111-f32a361232e1	8212	Velika Loka
00050000-5666-f674-4e27-cb0bed9b6f8b	2274	Velika Nedelja
00050000-5666-f674-73f2-c2cfd4934bb7	9225	Velika Polana
00050000-5666-f674-7fa3-e7267b5b18ad	1315	Velike Lašče
00050000-5666-f674-acd5-2e7cdd2daadc	8213	Veliki Gaber
00050000-5666-f674-b343-ea0417e98e7a	9241	Veržej
00050000-5666-f674-2d5a-9b63ceeedef0	1312	Videm - Dobrepolje
00050000-5666-f674-b0d1-42d3ca69bfc5	2284	Videm pri Ptuju
00050000-5666-f674-de50-1e337173440a	8344	Vinica
00050000-5666-f674-e581-e288c9f2a332	5271	Vipava
00050000-5666-f674-0ace-f6042bb2279b	4212	Visoko
00050000-5666-f674-5942-10409618bdfc	1294	Višnja Gora
00050000-5666-f674-1bed-02200f56dd6b	3205	Vitanje
00050000-5666-f674-3cc8-7a70e0425c13	2255	Vitomarci
00050000-5666-f674-25de-27af2befddd8	1217	Vodice
00050000-5666-f674-e637-e8cd926f0fa6	3212	Vojnik\t
00050000-5666-f674-272f-e7a4b1d1a13d	5293	Volčja Draga
00050000-5666-f674-af86-2e2277e5964d	2232	Voličina
00050000-5666-f674-c21d-d1f248fd4ecc	3305	Vransko
00050000-5666-f674-298f-6c2a102903cd	6217	Vremski Britof
00050000-5666-f674-81a0-6c6b1f351916	1360	Vrhnika
00050000-5666-f674-8ec3-e413a6152251	2365	Vuhred
00050000-5666-f674-019c-c98ee9692be2	2367	Vuzenica
00050000-5666-f674-1891-f8d50c346a57	8292	Zabukovje 
00050000-5666-f674-6aa4-9a0c4807efa5	1410	Zagorje ob Savi
00050000-5666-f674-9a04-434c974b963b	1303	Zagradec
00050000-5666-f674-c8bd-6b976fe73177	2283	Zavrč
00050000-5666-f674-0c3a-074553083654	8272	Zdole 
00050000-5666-f674-1935-fb8ab18a1d2b	4201	Zgornja Besnica
00050000-5666-f674-8780-7c7c59f3131e	2242	Zgornja Korena
00050000-5666-f674-2f64-c5dd77b2481d	2201	Zgornja Kungota
00050000-5666-f674-1897-8971e7263a9d	2316	Zgornja Ložnica
00050000-5666-f674-e825-68396018282f	2314	Zgornja Polskava
00050000-5666-f674-3790-b2e093e7a428	2213	Zgornja Velka
00050000-5666-f674-78e0-0407fe53ef53	4247	Zgornje Gorje
00050000-5666-f674-5917-2601554c1faa	4206	Zgornje Jezersko
00050000-5666-f674-4996-fd3870596af8	2285	Zgornji Leskovec
00050000-5666-f674-b63c-1d9b71549085	1432	Zidani Most
00050000-5666-f674-9dd4-731d7d5312b7	3214	Zreče
00050000-5666-f674-f23c-dd5c63b3c9d6	4209	Žabnica
00050000-5666-f674-5533-2006368cfa51	3310	Žalec
00050000-5666-f674-41a3-6c91358e9277	4228	Železniki
00050000-5666-f674-664a-1b75cae63f43	2287	Žetale
00050000-5666-f674-8f7e-d3340c03cf68	4226	Žiri
00050000-5666-f674-f559-92da30d39caf	4274	Žirovnica
00050000-5666-f674-2602-3f554748544c	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 31416544)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 31416119)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 31415867)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5666-f677-0fe6-2f595a7a85d0	00080000-5666-f677-9412-3ae3ec9a9111	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5666-f677-0388-07224deca8b2	00080000-5666-f677-9412-3ae3ec9a9111	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5666-f677-3c52-dde0116800aa	00080000-5666-f677-8f70-0e2701084dfa	\N	00040000-5666-f674-ea9f-e37bfb6b3fd1	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 31416011)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5666-f674-b9f9-e9b25024ef5e	novo leto	1	1	\N	t
00430000-5666-f674-c21a-47cc8c585953	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5666-f674-59de-37594fd95f8a	dan upora proti okupatorju	27	4	\N	t
00430000-5666-f674-781e-49f7de2216c0	praznik dela	1	5	\N	t
00430000-5666-f674-0970-963b0d2dace1	praznik dela	2	5	\N	t
00430000-5666-f674-7aac-a132eda18ad4	dan Primoža Trubarja	8	6	\N	f
00430000-5666-f674-7cc8-e3d2e7524061	dan državnosti	25	6	\N	t
00430000-5666-f674-fafa-0694e902dc0f	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5666-f674-3ed1-cc51cd09bca7	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5666-f674-46f1-bd846f7dcae2	dan suverenosti	25	10	\N	f
00430000-5666-f674-ffbb-9e6b82d70263	dan spomina na mrtve	1	11	\N	t
00430000-5666-f674-1c79-2776ddd43a69	dan Rudolfa Maistra	23	11	\N	f
00430000-5666-f674-49e1-adf322fdb564	božič	25	12	\N	t
00430000-5666-f674-3ccc-2685edf867fa	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5666-f674-5788-98c1e0bec000	Marijino vnebovzetje	15	8	\N	t
00430000-5666-f674-914e-5ce567aa338d	dan reformacije	31	10	\N	t
00430000-5666-f674-2967-a4fa5e9d4ec6	velikonočna nedelja	27	3	2016	t
00430000-5666-f674-bf97-0532869e804d	velikonočna nedelja	16	4	2017	t
00430000-5666-f674-d82c-1e13e3db8631	velikonočna nedelja	1	4	2018	t
00430000-5666-f674-a2c5-344e2284b98c	velikonočna nedelja	21	4	2019	t
00430000-5666-f674-258d-28652d603075	velikonočna nedelja	12	4	2020	t
00430000-5666-f674-b762-bc646e9dc48c	velikonočna nedelja	4	4	2021	t
00430000-5666-f674-f7ee-a0d7e7bde4ea	velikonočna nedelja	17	4	2022	t
00430000-5666-f674-3f4a-490a7d429c18	velikonočna nedelja	9	4	2023	t
00430000-5666-f674-43e0-b42fe434e22b	velikonočna nedelja	31	3	2024	t
00430000-5666-f674-757b-8eb45f224fc1	velikonočna nedelja	20	4	2025	t
00430000-5666-f674-cfe4-df02faede63c	velikonočna nedelja	5	4	2026	t
00430000-5666-f674-b383-c94cf6622e08	velikonočna nedelja	28	3	2027	t
00430000-5666-f674-e988-517a45fc22f4	velikonočna nedelja	16	4	2028	t
00430000-5666-f674-8782-b50172c097fe	velikonočna nedelja	1	4	2029	t
00430000-5666-f674-096e-c62e29a966ee	velikonočna nedelja	21	4	2030	t
00430000-5666-f674-63e2-c036c3d9c395	velikonočni ponedeljek	28	3	2016	t
00430000-5666-f674-fbb6-8e515503656b	velikonočni ponedeljek	17	4	2017	t
00430000-5666-f674-795d-c2185e8b94b5	velikonočni ponedeljek	2	4	2018	t
00430000-5666-f674-189e-f529fa1adca1	velikonočni ponedeljek	22	4	2019	t
00430000-5666-f674-d02a-61a9d4bff230	velikonočni ponedeljek	13	4	2020	t
00430000-5666-f674-5224-3dd43d747eeb	velikonočni ponedeljek	5	4	2021	t
00430000-5666-f674-d372-749963c4182d	velikonočni ponedeljek	18	4	2022	t
00430000-5666-f674-1990-0744b6830bad	velikonočni ponedeljek	10	4	2023	t
00430000-5666-f674-47a0-506fe14a8637	velikonočni ponedeljek	1	4	2024	t
00430000-5666-f674-46a6-86c73288604f	velikonočni ponedeljek	21	4	2025	t
00430000-5666-f674-16a3-f3bb9b2b6ceb	velikonočni ponedeljek	6	4	2026	t
00430000-5666-f674-6e40-fe3a4053035c	velikonočni ponedeljek	29	3	2027	t
00430000-5666-f674-e1b1-22e66664343b	velikonočni ponedeljek	17	4	2028	t
00430000-5666-f674-92cf-df4de7cb9550	velikonočni ponedeljek	2	4	2029	t
00430000-5666-f674-1cc5-67d3f5cdf879	velikonočni ponedeljek	22	4	2030	t
00430000-5666-f674-7eeb-e4384fa106c9	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5666-f674-0f64-a36aa56b74c5	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5666-f674-edf1-d956d320661a	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5666-f674-3c13-d6aa84089605	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5666-f674-9db8-16cf7381a0c5	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5666-f674-2c04-c97e0ed58fd8	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5666-f674-fde3-c37ac7b038aa	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5666-f674-9f3b-c38cf60baf49	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5666-f674-833f-5eca53565b56	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5666-f674-e2d0-acfb865705ea	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5666-f674-054c-936862e1bbc7	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5666-f674-b515-fdd0b90d5a61	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5666-f674-1948-0a54b15893da	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5666-f674-2e96-edd4962dd079	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5666-f674-2ba7-15b0fdcef1f3	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 31415971)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 31415983)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 31416131)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 31416558)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 31416568)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5666-f677-2bf5-e4a59f0178a2	00080000-5666-f677-1d52-5e554bf97792	0987	AK
00190000-5666-f677-6f7b-7c07659a3e20	00080000-5666-f677-8f70-0e2701084dfa	0989	AK
00190000-5666-f677-03e8-089c3f849a4e	00080000-5666-f677-f48f-a632fc32c0c3	0986	AK
00190000-5666-f677-13a5-8328d7998a07	00080000-5666-f677-f610-4207141285b6	0984	AK
00190000-5666-f677-0a6c-44d361a680df	00080000-5666-f677-f741-7dded72c055e	0983	AK
00190000-5666-f677-9636-80d6c87ec176	00080000-5666-f677-78ad-b68ff4b3d62f	0982	AK
00190000-5666-f678-68b2-66343ebd87d6	00080000-5666-f678-28a5-7ab74e868934	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 31416467)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5666-f677-70a9-122320252ed1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 31416576)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 31416160)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5666-f676-2726-5b891e8a6129	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5666-f676-06df-c4b71a12cfa2	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5666-f676-f5b0-58357e684412	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5666-f676-b9c0-43d20eaa9e6f	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5666-f676-5086-70dc98e1a25f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5666-f676-62a1-e8c51f8d8857	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5666-f676-018d-c6418f26f9c1	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 31416104)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 31416094)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 31416305)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 31416235)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 31415945)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 31415707)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5666-f678-28a5-7ab74e868934	00010000-5666-f675-358c-fa16680e21e2	2015-12-08 16:25:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-5666-f678-00fd-1480d215e23f	00010000-5666-f675-358c-fa16680e21e2	2015-12-08 16:25:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5666-f678-68b2-66343ebd87d6	00010000-5666-f675-358c-fa16680e21e2	2015-12-08 16:25:44	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 31416173)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 31415745)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5666-f674-9d18-5bcc8511f55d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5666-f674-ccf1-2064ce7a53df	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5666-f674-d8c6-8f36028f22c2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5666-f674-8fa5-750bba8576a4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5666-f674-24d2-479dd84dd3df	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5666-f674-b36c-4409c6c9f51b	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5666-f674-4eea-16b656a4ad86	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5666-f674-4334-4b9c0c724dd8	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5666-f675-bc76-08beda580427	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-f675-0a4c-6e7b10a8d18b	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-f675-d10a-8284d06f1237	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-f675-6c07-5242d1012513	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5666-f675-0e69-4136230e6332	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5666-f675-09c9-d6060975956a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5666-f675-8d64-0f9550389978	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5666-f675-5023-d8f46195e770	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5666-f675-f5e7-291ed645b81e	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5666-f675-0e8d-eb8f10d1e371	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5666-f675-d5d8-f5108360e9e4	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5666-f675-4c5f-0f8961ebd9eb	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5666-f675-1d73-70405f94d871	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5666-f675-7a4c-844701435fe9	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5666-f675-39c1-6c9f2670387c	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5666-f675-e686-266a1044dbf1	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5666-f675-61e0-8e0a5bec3b20	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5666-f675-899f-ae4310d26e4f	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5666-f675-c4c5-d09c9cd9d235	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5666-f675-39a6-9d782b59679a	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5666-f675-fa8c-9676c5b493f7	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5666-f675-763e-f4034ae63433	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5666-f675-b542-fa6980c34096	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5666-f675-5f36-08d2a5fe31a3	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5666-f675-1ace-8a0b488b949b	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5666-f675-e26f-e5771e437ace	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5666-f675-add2-8ad8f842e310	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5666-f675-fb81-31007607b98e	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5666-f675-ea70-1bc98b729fd6	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5666-f675-9f8c-ea46553650ea	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5666-f675-d242-685fda2bd491	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5666-f675-aa34-5fab6275a28e	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5666-f675-17d8-a30a3785ad5e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5666-f675-c720-5866ca54d675	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5666-f675-2135-6b60b959ab0b	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5666-f675-b655-703f1da2745e	arhivar	arhivar	t
00020000-5666-f676-f775-1a8f87e0f99b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5666-f676-55d2-30000d92ac07	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-b320-5a3de7962e39	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-0ae5-b55737c2b8fc	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-0bcd-4d4bed1a5786	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-6467-10103106d398	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-d19c-e9b17a9cc9a3	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-6c8d-3ef94c6ffaa5	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5666-f676-c5bd-fcfdcbdcb4cb	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5666-f676-4197-b7efed5fdeaa	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-bbec-84a09d7790b1	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-6aac-c16cf38269d9	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-1d2c-dcbb5353a2dd	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-6b5a-901a3cc39a20	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-d5f5-4df8a980b49c	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-0a9c-312d8a58530e	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-b389-4adf91304ef5	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-6257-4f558df821fe	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-a216-861bf30899c7	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-708b-0ecd71cc980f	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5666-f676-004f-a2248c535aad	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-aad8-5ca1e6f19aa8	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-a96d-3ec284ef8df7	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-efd4-397674ddfdbf	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-2e97-1ee97c99dc5a	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-f6f4-8c14b7b7a60c	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-ec27-99727d1525c3	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-2490-9fbd4e146379	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-3685-c726eb169fd3	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-009b-8659b53dae19	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-c497-3c6f8bdf6ea7	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5666-f676-b74f-454a0242531d	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5666-f676-b135-d4988a0037a1	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 31415729)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5666-f675-5a20-9ec4af51bf8c	00020000-5666-f674-d8c6-8f36028f22c2
00010000-5666-f675-358c-fa16680e21e2	00020000-5666-f674-d8c6-8f36028f22c2
00010000-5666-f676-a4c7-d4fa7e5de78a	00020000-5666-f676-f775-1a8f87e0f99b
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-55d2-30000d92ac07
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-6467-10103106d398
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-4197-b7efed5fdeaa
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-6aac-c16cf38269d9
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-6b5a-901a3cc39a20
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-a216-861bf30899c7
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-0ae5-b55737c2b8fc
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-004f-a2248c535aad
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-efd4-397674ddfdbf
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-f6f4-8c14b7b7a60c
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-2490-9fbd4e146379
00010000-5666-f676-d246-720ead17e7e6	00020000-5666-f676-009b-8659b53dae19
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-55d2-30000d92ac07
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-b320-5a3de7962e39
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-0ae5-b55737c2b8fc
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-0bcd-4d4bed1a5786
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-6b5a-901a3cc39a20
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-b389-4adf91304ef5
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-004f-a2248c535aad
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-efd4-397674ddfdbf
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-f6f4-8c14b7b7a60c
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-2490-9fbd4e146379
00010000-5666-f677-0323-8882520d7398	00020000-5666-f676-009b-8659b53dae19
00010000-5666-f677-50e4-bd8a88ac3a95	00020000-5666-f676-55d2-30000d92ac07
00010000-5666-f677-50e4-bd8a88ac3a95	00020000-5666-f676-b320-5a3de7962e39
00010000-5666-f677-50e4-bd8a88ac3a95	00020000-5666-f676-0ae5-b55737c2b8fc
00010000-5666-f677-50e4-bd8a88ac3a95	00020000-5666-f676-0bcd-4d4bed1a5786
00010000-5666-f677-50e4-bd8a88ac3a95	00020000-5666-f676-6aac-c16cf38269d9
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-b320-5a3de7962e39
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-d19c-e9b17a9cc9a3
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-bbec-84a09d7790b1
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-1d2c-dcbb5353a2dd
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-6aac-c16cf38269d9
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-6257-4f558df821fe
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-6b5a-901a3cc39a20
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-d5f5-4df8a980b49c
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-004f-a2248c535aad
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-aad8-5ca1e6f19aa8
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-efd4-397674ddfdbf
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-2e97-1ee97c99dc5a
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-f6f4-8c14b7b7a60c
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-ec27-99727d1525c3
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-2490-9fbd4e146379
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-3685-c726eb169fd3
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-009b-8659b53dae19
00010000-5666-f677-2570-ad546b17d641	00020000-5666-f676-c497-3c6f8bdf6ea7
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-b320-5a3de7962e39
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-d19c-e9b17a9cc9a3
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-c5bd-fcfdcbdcb4cb
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-bbec-84a09d7790b1
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-1d2c-dcbb5353a2dd
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-6aac-c16cf38269d9
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-6257-4f558df821fe
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-6b5a-901a3cc39a20
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-d5f5-4df8a980b49c
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-0a9c-312d8a58530e
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-004f-a2248c535aad
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-aad8-5ca1e6f19aa8
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-a96d-3ec284ef8df7
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-efd4-397674ddfdbf
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-2e97-1ee97c99dc5a
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-f6f4-8c14b7b7a60c
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-ec27-99727d1525c3
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-2490-9fbd4e146379
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-3685-c726eb169fd3
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-009b-8659b53dae19
00010000-5666-f677-7ab5-347a1503fcfa	00020000-5666-f676-c497-3c6f8bdf6ea7
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-b320-5a3de7962e39
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-0ae5-b55737c2b8fc
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-d19c-e9b17a9cc9a3
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-6c8d-3ef94c6ffaa5
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-c5bd-fcfdcbdcb4cb
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-6467-10103106d398
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-bbec-84a09d7790b1
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-1d2c-dcbb5353a2dd
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-6aac-c16cf38269d9
00010000-5666-f677-0ca9-35b2579434d0	00020000-5666-f676-6257-4f558df821fe
00010000-5666-f677-080a-ecf194814032	00020000-5666-f676-55d2-30000d92ac07
00010000-5666-f677-080a-ecf194814032	00020000-5666-f676-0bcd-4d4bed1a5786
00010000-5666-f677-080a-ecf194814032	00020000-5666-f676-6467-10103106d398
00010000-5666-f677-080a-ecf194814032	00020000-5666-f676-4197-b7efed5fdeaa
00010000-5666-f677-080a-ecf194814032	00020000-5666-f676-6aac-c16cf38269d9
00010000-5666-f677-080a-ecf194814032	00020000-5666-f676-6b5a-901a3cc39a20
00010000-5666-f677-080a-ecf194814032	00020000-5666-f676-a216-861bf30899c7
00010000-5666-f677-080a-ecf194814032	00020000-5666-f676-b74f-454a0242531d
00010000-5666-f677-94dd-d7e9f29909fa	00020000-5666-f676-708b-0ecd71cc980f
\.


--
-- TOC entry 3146 (class 0 OID 31416187)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 31416125)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 31416071)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5666-f676-f16b-ea963394275a	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5666-f676-db0f-a0e2075924c6	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5666-f676-2657-66a2426b35b5	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 31415694)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5666-f674-0b12-6092373855b3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5666-f674-0a90-0b2080503399	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5666-f674-b4fe-984e3d024c85	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5666-f674-d9cb-3ceaabefd6f7	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5666-f674-bb28-7b780fe9ba02	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 31415686)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5666-f674-ff63-50411bb515f6	00230000-5666-f674-d9cb-3ceaabefd6f7	popa
00240000-5666-f674-4ed1-69d0853afe1d	00230000-5666-f674-d9cb-3ceaabefd6f7	oseba
00240000-5666-f674-d62f-1088ec700bc5	00230000-5666-f674-d9cb-3ceaabefd6f7	tippopa
00240000-5666-f674-9493-d377b2ef18b1	00230000-5666-f674-d9cb-3ceaabefd6f7	organizacijskaenota
00240000-5666-f674-8242-5343383b7153	00230000-5666-f674-d9cb-3ceaabefd6f7	sezona
00240000-5666-f674-c098-48449b8120c5	00230000-5666-f674-d9cb-3ceaabefd6f7	tipvaje
00240000-5666-f674-5dbf-528887b39947	00230000-5666-f674-0a90-0b2080503399	prostor
00240000-5666-f674-5608-a4f440ba4ba6	00230000-5666-f674-d9cb-3ceaabefd6f7	besedilo
00240000-5666-f674-56dc-dbd9f2862d76	00230000-5666-f674-d9cb-3ceaabefd6f7	uprizoritev
00240000-5666-f674-2e16-5e737d801d36	00230000-5666-f674-d9cb-3ceaabefd6f7	funkcija
00240000-5666-f674-a35a-d8e963066847	00230000-5666-f674-d9cb-3ceaabefd6f7	tipfunkcije
00240000-5666-f674-728f-0994b567755c	00230000-5666-f674-d9cb-3ceaabefd6f7	alternacija
00240000-5666-f674-994e-144d0a4ec5b2	00230000-5666-f674-0b12-6092373855b3	pogodba
00240000-5666-f674-dadd-da0d29fc5bde	00230000-5666-f674-d9cb-3ceaabefd6f7	zaposlitev
00240000-5666-f674-d2d6-473d214ba3cd	00230000-5666-f674-d9cb-3ceaabefd6f7	zvrstuprizoritve
00240000-5666-f674-5882-baf3c1dd2501	00230000-5666-f674-0b12-6092373855b3	programdela
00240000-5666-f674-78cf-a20e11c52910	00230000-5666-f674-d9cb-3ceaabefd6f7	zapis
\.


--
-- TOC entry 3095 (class 0 OID 31415681)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
993b400e-1642-4838-b02c-a41d49fa136b	00240000-5666-f674-ff63-50411bb515f6	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 31416252)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5666-f677-6247-07b1622991c5	000e0000-5666-f677-afe6-a316b3d3590b	00080000-5666-f677-9412-3ae3ec9a9111	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5666-f674-77e5-faed565bd21a
00270000-5666-f677-0814-38d64c58deb7	000e0000-5666-f677-afe6-a316b3d3590b	00080000-5666-f677-9412-3ae3ec9a9111	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5666-f674-77e5-faed565bd21a
\.


--
-- TOC entry 3111 (class 0 OID 31415829)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 31416081)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5666-f677-dbef-bbce1d850a1d	00180000-5666-f677-97b3-fc6f5b271109	000c0000-5666-f677-a995-1606639b71b8	00090000-5666-f677-b25c-8487ba2a1e2b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-f677-4c5c-5353a8f1b295	00180000-5666-f677-97b3-fc6f5b271109	000c0000-5666-f677-680c-11513ab0d8bf	00090000-5666-f677-b7bb-3ca248ada4a5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-f677-05fc-515dce7c0144	00180000-5666-f677-97b3-fc6f5b271109	000c0000-5666-f677-e7e6-e2c3a992efb6	00090000-5666-f677-0038-5164d78844e3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-f677-b83f-bd895ff62eba	00180000-5666-f677-97b3-fc6f5b271109	000c0000-5666-f677-7ac5-595f14887274	00090000-5666-f677-05fe-92ad8b709598	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-f677-ee7c-c0bc5033921e	00180000-5666-f677-97b3-fc6f5b271109	000c0000-5666-f677-132e-85920d71cea6	00090000-5666-f677-4544-e94332e15b0d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5666-f677-6eba-6b91f6863841	00180000-5666-f677-6658-8aad16e6327b	\N	00090000-5666-f677-4544-e94332e15b0d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5666-f677-cd32-0e0d202f322c	00180000-5666-f677-6658-8aad16e6327b	\N	00090000-5666-f677-b7bb-3ca248ada4a5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 31416293)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5666-f674-2d83-055ac18e9b64	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5666-f674-8fd6-9a0b93b7f707	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5666-f674-563c-26948be5745c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5666-f674-b9ca-0099446d3fc2	04	Režija	Režija	Režija	umetnik	30
000f0000-5666-f674-1788-65735d7298d9	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5666-f674-3b48-198aa0560071	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5666-f674-ed9d-838f98a9240e	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5666-f674-38f8-211ee31f5d4f	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5666-f674-9218-6f91897fd5cf	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5666-f674-15ca-2c2b70f4bb40	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5666-f674-b6f3-43d6cd4924aa	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5666-f674-9d41-239ef1a2d8d9	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5666-f674-9cfb-b54a1dab5649	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5666-f674-0ba3-e5eae33e4e41	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5666-f674-39ff-0c033da7aa5c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5666-f674-9f39-40bd35a2ebe2	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5666-f674-a5ba-91ab12638553	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5666-f674-2df0-3c6632768ac0	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 31415780)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5666-f676-e1c8-0d4a26e24480	0001	šola	osnovna ali srednja šola
00400000-5666-f676-967b-7979f4cdb700	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5666-f676-ddf8-51fbabfdd96c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 31416588)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5666-f674-d219-ccdee6b04ea1	01	Velika predstava	f	1.00	1.00
002b0000-5666-f674-69c0-e77872f37400	02	Mala predstava	f	0.50	0.50
002b0000-5666-f674-e544-f6095340a856	03	Mala koprodukcija	t	0.40	1.00
002b0000-5666-f674-ea1c-0f0bbb391d80	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5666-f674-dd15-dc4580fd8267	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 31416061)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5666-f674-32c0-4b651177d880	0001	prva vaja	prva vaja
00420000-5666-f674-6a3d-352cdec5eb39	0002	tehnična vaja	tehnična vaja
00420000-5666-f674-50e8-60044cfc177e	0003	lučna vaja	lučna vaja
00420000-5666-f674-513a-ee8d8bb9f586	0004	kostumska vaja	kostumska vaja
00420000-5666-f674-6ab2-662a1d7960a3	0005	foto vaja	foto vaja
00420000-5666-f674-fd8b-b51e90494914	0006	1. glavna vaja	1. glavna vaja
00420000-5666-f674-f081-ded678f507d2	0007	2. glavna vaja	2. glavna vaja
00420000-5666-f674-97b8-d207355e1e6e	0008	1. generalka	1. generalka
00420000-5666-f674-d852-8ff054e1a91f	0009	2. generalka	2. generalka
00420000-5666-f674-b861-50de0d11ecf4	0010	odprta generalka	odprta generalka
00420000-5666-f674-d2c6-c694a52d3a24	0011	obnovitvena vaja	obnovitvena vaja
00420000-5666-f674-39ec-2bb6cca7b9a2	0012	pevska vaja	pevska vaja
00420000-5666-f674-f9d7-cac5e0343f52	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5666-f674-99c1-708a7a58bf68	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 31415902)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 31415716)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5666-f675-358c-fa16680e21e2	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROiFa4HyygM3fq1qyvUMSHinnNabqveMe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5666-f676-5c15-da51a6583123	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5666-f676-8e10-f7f800154776	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5666-f676-73f2-168d2bbb0754	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5666-f676-eecc-7a0aebeedd42	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5666-f676-8f64-3c7e18017291	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5666-f676-a793-717f6c07b83c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5666-f676-1db3-a94b80c7799e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5666-f676-24fc-4c6cb91ed96a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5666-f676-354f-6d578311e199	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5666-f676-a4c7-d4fa7e5de78a	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5666-f676-a7d0-966e1fd0c1f0	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5666-f676-d246-720ead17e7e6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5666-f677-0323-8882520d7398	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5666-f677-50e4-bd8a88ac3a95	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5666-f677-2570-ad546b17d641	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5666-f677-7ab5-347a1503fcfa	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5666-f677-0ca9-35b2579434d0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5666-f677-080a-ecf194814032	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5666-f677-94dd-d7e9f29909fa	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5666-f675-5a20-9ec4af51bf8c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 31416343)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5666-f677-ffca-05e10540f899	00160000-5666-f676-d7c1-b69b47323370	\N	00140000-5666-f674-c0c3-3f7cdeea91f8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5666-f676-5086-70dc98e1a25f
000e0000-5666-f677-afe6-a316b3d3590b	00160000-5666-f676-d1d3-a58eb6024f87	\N	00140000-5666-f674-6525-239ed7d31abd	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5666-f676-62a1-e8c51f8d8857
000e0000-5666-f677-2b3a-6695867daaeb	\N	\N	00140000-5666-f674-6525-239ed7d31abd	00190000-5666-f677-2bf5-e4a59f0178a2	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5666-f676-5086-70dc98e1a25f
000e0000-5666-f677-e4b8-27d2b5d6d606	\N	\N	00140000-5666-f674-6525-239ed7d31abd	00190000-5666-f677-2bf5-e4a59f0178a2	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5666-f676-5086-70dc98e1a25f
000e0000-5666-f677-f57d-4332267f8dc7	\N	\N	00140000-5666-f674-6525-239ed7d31abd	00190000-5666-f677-2bf5-e4a59f0178a2	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5666-f676-2726-5b891e8a6129
000e0000-5666-f677-d745-f20339d711d1	\N	\N	00140000-5666-f674-6525-239ed7d31abd	00190000-5666-f677-2bf5-e4a59f0178a2	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5666-f676-2726-5b891e8a6129
\.


--
-- TOC entry 3125 (class 0 OID 31416001)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5666-f677-f4ef-b38d037d3c9f	\N	000e0000-5666-f677-afe6-a316b3d3590b	1	
00200000-5666-f677-6b00-6b521ca26558	\N	000e0000-5666-f677-afe6-a316b3d3590b	2	
00200000-5666-f677-9644-55645a0d0729	\N	000e0000-5666-f677-afe6-a316b3d3590b	3	
00200000-5666-f677-f427-c25beb700c25	\N	000e0000-5666-f677-afe6-a316b3d3590b	4	
00200000-5666-f677-d86e-2dca51fd5649	\N	000e0000-5666-f677-afe6-a316b3d3590b	5	
\.


--
-- TOC entry 3142 (class 0 OID 31416152)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 31416266)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5666-f674-dd50-c0a4fa5bba90	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5666-f674-f75a-a1ee78e5b986	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5666-f674-68a5-b1d97aeaa747	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5666-f674-bbf3-c7f1f83b9bf9	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5666-f674-eb5e-098f3f092bbe	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5666-f674-3803-24532b6c5394	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5666-f674-3e25-ef2bcb7f15ce	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5666-f674-81e8-5e07df9049ee	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5666-f674-77e5-faed565bd21a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5666-f674-cbcb-4b4aaaf96ca1	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5666-f674-7ac2-be8954336522	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5666-f674-d420-929c5c5a01de	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5666-f674-21b1-34719be35a02	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5666-f674-d305-bd22efabf9c4	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5666-f674-aa03-b2d0e434f0c4	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5666-f674-89e7-a7b59de0398b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5666-f674-0e2d-7796d46d36f3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5666-f674-9cc4-e48e59716105	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5666-f674-a746-bfc944371b66	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5666-f674-c273-36a6465863b5	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5666-f674-f05b-6354a76534b9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5666-f674-ffc3-203e30fa106c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5666-f674-0577-fab8727d2c1d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5666-f674-b6a1-b905648d71f2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5666-f674-be0d-ba54564ebedb	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5666-f674-2df1-caa87540388f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5666-f674-4412-d81beafa2d30	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5666-f674-9431-d157f39c615e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 31416638)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 31416607)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 31416650)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 31416224)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5666-f677-5857-d4becc349e04	00090000-5666-f677-b7bb-3ca248ada4a5	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-f677-5000-731baa2b7e97	00090000-5666-f677-0038-5164d78844e3	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-f677-6f6c-d236a9f3260e	00090000-5666-f677-d813-cff845b3c936	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-f677-f237-59f22b3b65e1	00090000-5666-f677-08f5-4208fcbf2497	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-f677-40b3-1efc41c88371	00090000-5666-f677-62c3-ae5e96a46d81	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5666-f677-9700-5328640db0ce	00090000-5666-f677-74ba-4b402b9f367c	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 31416045)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 31416333)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5666-f674-c0c3-3f7cdeea91f8	01	Drama	drama (SURS 01)
00140000-5666-f674-0926-35b06148b402	02	Opera	opera (SURS 02)
00140000-5666-f674-5a46-5e59204fe921	03	Balet	balet (SURS 03)
00140000-5666-f674-d406-6f9b3a713985	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5666-f674-af13-850903624428	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5666-f674-6525-239ed7d31abd	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5666-f674-5402-41dcebbece99	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 31416214)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 31415779)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 31416392)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 31416382)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 31415770)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 31416249)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 31416291)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 31416691)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 31416033)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 31416055)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 31416060)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 31416605)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 31415928)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 31416461)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 31416210)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 31415999)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 31415966)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 31415942)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 31416117)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 31416668)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 31416675)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 31416699)
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
-- TOC entry 2728 (class 2606 OID 31416144)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 31415900)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 31415798)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 31415862)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 31415825)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 31415759)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 31415744)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 31416150)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 31416186)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 31416328)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 31415853)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 31415888)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 31416556)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 31416123)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 31415878)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 31416018)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 31415987)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 31415979)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 31416135)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 31416565)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 31416573)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 31416543)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 31416586)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 31416168)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 31416108)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 31416099)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 31416315)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 31416242)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 31415954)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 31415715)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 31416177)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 31415733)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 31415753)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 31416195)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 31416130)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 31416079)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 31415703)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 31415691)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 31415685)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 31416262)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 31415834)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 31416090)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 31416302)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 31415787)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 31416598)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 31416068)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 31415913)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 31415728)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 31416361)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 31416008)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 31416158)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 31416274)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 31416648)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 31416632)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 31416656)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 31416232)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 31416049)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 31416341)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 31416222)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 31416043)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 31416044)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 31416042)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 31416041)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 31416040)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 31416263)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 31416264)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 31416265)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 31416670)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 31416669)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 31415855)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 31415856)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 31416151)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 31416636)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 31416635)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 31416637)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 31416634)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 31416633)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 31416137)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 31416136)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 31416009)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 31416010)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 31416211)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 31416213)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 31416212)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 31415944)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 31415943)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 31416587)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 31416330)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 31416331)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 31416332)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 31416657)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 31416366)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 31416363)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 31416367)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 31416365)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 31416364)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 31415915)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 31415914)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 31415828)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 31416178)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 31415760)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 31415761)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 31416198)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 31416197)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 31416196)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 31415865)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 31415864)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 31415866)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 31415982)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 31415980)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 31415981)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 31415693)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 31416103)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 31416101)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 31416100)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 31416102)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 31415734)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 31415735)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 31416159)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 31416692)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 31416251)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 31416250)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 31416700)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 31416701)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 31416124)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 31416243)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 31416244)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 31416466)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 31416465)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 31416462)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 31416463)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 31416464)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 31415880)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 31415879)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 31415881)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 31416172)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 31416171)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 31416566)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 31416567)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 31416396)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 31416397)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 31416394)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 31416395)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 31416233)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 31416234)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 31416112)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 31416111)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 31416109)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 31416110)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 31416384)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 31416383)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 31415955)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 31415969)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 31415968)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 31415967)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 31415970)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 31416000)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 31415988)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 31415989)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 31416557)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 31416606)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 31416676)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 31416677)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 31415800)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 31415799)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 31415835)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 31415836)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 31416050)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 31416093)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 31416092)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 31416091)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 31416035)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 31416036)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 31416039)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 31416034)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 31416038)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 31416037)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 31415854)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 31415788)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 31415789)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 31415929)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 31415931)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 31415930)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 31415932)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 31416118)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 31416329)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 31416362)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 31416303)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 31416304)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 31415826)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 31415827)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 31416223)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 31415704)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 31415901)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 31415863)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 31415692)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 31416599)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 31416170)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 31416169)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 31416069)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 31416070)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 31416393)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 31415889)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 31416342)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 31416649)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 31416574)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 31416575)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 31416292)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 31416080)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 31415754)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 31416872)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 31416877)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 31416902)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 31416892)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 31416867)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 31416887)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 31416897)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 31416882)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 31417072)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 31417077)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 31417082)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 31417247)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 31417242)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 31416757)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 31416762)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 31416987)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 31417227)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 31417222)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 31417232)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 31417217)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 31417212)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 31416982)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 31416977)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 31416857)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 31416862)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 31417027)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 31417037)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 31417032)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 31416812)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 31416807)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 31416967)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 31417202)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 31417087)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 31417092)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 31417097)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 31417237)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 31417117)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 31417102)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 31417122)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 31417112)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 31417107)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 31416802)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 31416797)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 31416742)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 31416737)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 31417007)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 31416717)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 31416722)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 31417022)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 31417017)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 31417012)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 31416772)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 31416767)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 31416777)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 31416837)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 31416827)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 31416832)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 31416702)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 31416942)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 31416932)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 31416927)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 31416937)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 31416707)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 31416712)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 31416992)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 31417262)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 31417067)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 31417062)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 31417267)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 31417272)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 31416972)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 31417052)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 31417057)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 31417177)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 31417172)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 31417157)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 31417162)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 31417167)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 31416787)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 31416782)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 31416792)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 31417002)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 31416997)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 31417187)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 31417192)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 31417147)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 31417152)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 31417137)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 31417142)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 31417042)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 31417047)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 31416962)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 31416957)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 31416947)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 31416952)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 31417132)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 31417127)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 31416817)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 31416822)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 31416852)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 31416842)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 31416847)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 31417182)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 31417197)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 31417207)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 31417252)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 31417257)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 31416732)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 31416727)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 31416747)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 31416752)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 31416907)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 31416922)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 31416917)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 31416912)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-08 16:25:46 CET

--
-- PostgreSQL database dump complete
--

