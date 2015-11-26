--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-26 16:28:08 CET

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
-- TOC entry 183 (class 1259 OID 29717247)
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
-- TOC entry 237 (class 1259 OID 29717863)
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
-- TOC entry 236 (class 1259 OID 29717846)
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
-- TOC entry 182 (class 1259 OID 29717240)
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
-- TOC entry 181 (class 1259 OID 29717238)
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
-- TOC entry 227 (class 1259 OID 29717723)
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
-- TOC entry 230 (class 1259 OID 29717753)
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
-- TOC entry 251 (class 1259 OID 29718154)
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
-- TOC entry 203 (class 1259 OID 29717497)
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
-- TOC entry 205 (class 1259 OID 29717529)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 29717534)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 29718076)
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
-- TOC entry 194 (class 1259 OID 29717394)
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
-- TOC entry 238 (class 1259 OID 29717876)
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
-- TOC entry 223 (class 1259 OID 29717677)
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
-- TOC entry 200 (class 1259 OID 29717468)
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
-- TOC entry 197 (class 1259 OID 29717434)
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
-- TOC entry 195 (class 1259 OID 29717411)
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
-- TOC entry 212 (class 1259 OID 29717591)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 29718134)
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
-- TOC entry 250 (class 1259 OID 29718147)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 29718169)
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
-- TOC entry 216 (class 1259 OID 29717616)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 29717368)
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
-- TOC entry 185 (class 1259 OID 29717266)
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
-- TOC entry 189 (class 1259 OID 29717333)
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
-- TOC entry 186 (class 1259 OID 29717277)
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
-- TOC entry 178 (class 1259 OID 29717212)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 29717231)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 29717623)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 29717657)
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
-- TOC entry 233 (class 1259 OID 29717794)
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
-- TOC entry 188 (class 1259 OID 29717313)
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
-- TOC entry 191 (class 1259 OID 29717360)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 29718021)
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
-- TOC entry 213 (class 1259 OID 29717597)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 29717345)
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
-- TOC entry 202 (class 1259 OID 29717489)
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
-- TOC entry 198 (class 1259 OID 29717449)
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
-- TOC entry 199 (class 1259 OID 29717461)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 29717609)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 29718035)
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
-- TOC entry 242 (class 1259 OID 29718045)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 29717944)
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
-- TOC entry 243 (class 1259 OID 29718053)
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
-- TOC entry 219 (class 1259 OID 29717638)
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
-- TOC entry 211 (class 1259 OID 29717582)
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
-- TOC entry 210 (class 1259 OID 29717572)
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
-- TOC entry 232 (class 1259 OID 29717783)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 29717713)
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
-- TOC entry 196 (class 1259 OID 29717423)
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
-- TOC entry 175 (class 1259 OID 29717182)
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
-- TOC entry 174 (class 1259 OID 29717180)
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
-- TOC entry 220 (class 1259 OID 29717651)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 29717221)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 29717205)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 29717665)
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
-- TOC entry 214 (class 1259 OID 29717603)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 29717549)
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
-- TOC entry 173 (class 1259 OID 29717169)
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
-- TOC entry 172 (class 1259 OID 29717161)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 29717156)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 29717730)
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
-- TOC entry 187 (class 1259 OID 29717305)
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
-- TOC entry 209 (class 1259 OID 29717559)
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
-- TOC entry 231 (class 1259 OID 29717771)
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
-- TOC entry 184 (class 1259 OID 29717256)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 29718064)
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
-- TOC entry 207 (class 1259 OID 29717539)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 29717380)
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
-- TOC entry 176 (class 1259 OID 29717191)
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
-- TOC entry 235 (class 1259 OID 29717821)
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
-- TOC entry 201 (class 1259 OID 29717479)
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
-- TOC entry 218 (class 1259 OID 29717630)
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
-- TOC entry 229 (class 1259 OID 29717744)
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
-- TOC entry 247 (class 1259 OID 29718114)
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
-- TOC entry 246 (class 1259 OID 29718083)
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
-- TOC entry 248 (class 1259 OID 29718126)
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
-- TOC entry 225 (class 1259 OID 29717702)
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
-- TOC entry 204 (class 1259 OID 29717523)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 29717811)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 29717692)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 29717243)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 29717185)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 29717247)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5657-2504-7ffb-57de9d72a51e	10	30	Otroci	Abonma za otroke	200
000a0000-5657-2504-7123-d46a57758189	20	60	Mladina	Abonma za mladino	400
000a0000-5657-2504-f71b-f26c295bcc39	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 29717863)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5657-2505-eec8-12307b0c95da	000d0000-5657-2505-8d83-ab082cbcf877	\N	00090000-5657-2504-319f-2a8178a78b87	000b0000-5657-2505-dbd7-7a2df030eb77	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5657-2505-ada7-781f8c313a37	000d0000-5657-2505-bdb2-69a2028790d5	00100000-5657-2505-ddd4-a3ea6ee95210	00090000-5657-2505-0e81-8b6da52350b6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5657-2505-3f53-2732406146a2	000d0000-5657-2505-7809-3f9f3ac7a0b4	00100000-5657-2505-c847-75c2cde59a5b	00090000-5657-2504-5be3-6b25b68b3eff	\N	0003	t	\N	2015-11-26	\N	2	t	\N	f	f
000c0000-5657-2505-f04a-6b20cb6b5780	000d0000-5657-2505-499a-53d4bd0fe63e	\N	00090000-5657-2504-6c73-de67f9f19f05	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5657-2505-23f8-e12a935449bf	000d0000-5657-2505-8b65-ffab93023148	\N	00090000-5657-2505-ee08-809ab3097a75	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5657-2505-0d91-7e79be6c4086	000d0000-5657-2505-f624-f0cf6fdd39cc	\N	00090000-5657-2504-fdca-ee98226ec552	000b0000-5657-2505-084b-0e0e80f8aeed	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5657-2505-89e3-eda6d35a0acd	000d0000-5657-2505-2982-a23ace96e417	00100000-5657-2505-5fb2-cfe56a133ece	00090000-5657-2505-a922-c7fc95b67eef	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5657-2505-de13-ce0fb35a96af	000d0000-5657-2505-290f-a0ce473bf591	\N	00090000-5657-2505-da07-7a292391011f	000b0000-5657-2505-f9bc-55ed7ba3d0f7	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5657-2505-2d7f-3cecf27d2a19	000d0000-5657-2505-2982-a23ace96e417	00100000-5657-2505-96b2-1f0a1e20d2bd	00090000-5657-2504-5266-16698057c7b4	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5657-2505-6916-b2963ad0a415	000d0000-5657-2505-2982-a23ace96e417	00100000-5657-2505-bf82-28f4afbb74f6	00090000-5657-2505-fec1-1f2ab29dbf42	\N	0010	t	\N	2015-11-26	\N	16	f	\N	f	t
000c0000-5657-2505-fce5-fcf87667a582	000d0000-5657-2505-2982-a23ace96e417	00100000-5657-2505-9d83-23a81c716b9b	00090000-5657-2504-c738-faaf0d3ce339	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5657-2505-c641-42643e854c14	000d0000-5657-2505-6cb3-6422b3e9a2da	00100000-5657-2505-ddd4-a3ea6ee95210	00090000-5657-2505-0e81-8b6da52350b6	000b0000-5657-2505-aca3-17d9d0411daa	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 29717846)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 29717240)
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
-- TOC entry 3149 (class 0 OID 29717723)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5657-2505-dff2-5e6a04d91a05	00160000-5657-2504-cdd0-b97d2fc98b43	00090000-5657-2505-cb00-f19fefbb5c8b	aizv	10	t
003d0000-5657-2505-1c4b-8f6bbd1c8389	00160000-5657-2504-cdd0-b97d2fc98b43	00090000-5657-2505-a670-8498b5097258	apri	14	t
003d0000-5657-2505-544d-49983c9b4fa3	00160000-5657-2504-6380-890b25d0ebc0	00090000-5657-2505-cd0d-9cc581569545	aizv	11	t
003d0000-5657-2505-8221-ffac2537afec	00160000-5657-2504-dad2-869f4d8969b9	00090000-5657-2505-244b-127686d40101	aizv	12	t
003d0000-5657-2505-1307-f31cdfd3bc09	00160000-5657-2504-cdd0-b97d2fc98b43	00090000-5657-2505-8cfd-bb53b33b07ed	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 29717753)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5657-2504-cdd0-b97d2fc98b43	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5657-2504-6380-890b25d0ebc0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5657-2504-dad2-869f4d8969b9	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 29718154)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 29717497)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5657-2505-fa70-433d9e5a672a	\N	\N	00200000-5657-2505-f8c1-c7b402be0a71	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5657-2505-4b56-1293ec5d2aa8	\N	\N	00200000-5657-2505-6b78-bdb4e8761b68	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5657-2505-2b3a-11e05fa9419d	\N	\N	00200000-5657-2505-c281-1904ced7f7e3	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5657-2505-36a3-499e30109748	\N	\N	00200000-5657-2505-67ac-3bb269025d3b	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5657-2505-017d-efe7d4e5cd63	\N	\N	00200000-5657-2505-4c8e-50f74a5bb7ab	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 29717529)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 29717534)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 29718076)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 29717394)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5657-2502-64f8-f647be1ae2cd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5657-2502-34d6-a80d786c2c0f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5657-2502-58b9-aea7f7359d06	AL	ALB	008	Albania 	Albanija	\N
00040000-5657-2502-41f0-4fac39cfcb8a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5657-2502-1c19-03f6d3db00ab	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5657-2502-075d-a51892e5f644	AD	AND	020	Andorra 	Andora	\N
00040000-5657-2502-bf57-8523169454b1	AO	AGO	024	Angola 	Angola	\N
00040000-5657-2502-95dd-200381f79dec	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5657-2502-c152-29facd82cd1a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5657-2502-a8e4-d27659789d26	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5657-2502-ed74-c1ba32927998	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5657-2502-03dc-7acc487a397e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5657-2502-0342-71edd5819b9d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5657-2502-d9bd-53728cd3ad5d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5657-2502-63ab-b3abc98d487c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5657-2502-6012-5f4d404524a0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5657-2502-ca3a-e2a2995c8f6d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5657-2502-77a2-cdd338f940d3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5657-2502-3311-91899d9cf19e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5657-2502-03a6-48a069c4c9a9	BB	BRB	052	Barbados 	Barbados	\N
00040000-5657-2502-fa9b-76562a981ff3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5657-2502-d7c0-0187c7c4d905	BE	BEL	056	Belgium 	Belgija	\N
00040000-5657-2502-454f-226c384cc141	BZ	BLZ	084	Belize 	Belize	\N
00040000-5657-2502-fe10-4a5ad3162210	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5657-2502-5933-09900b62cf21	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5657-2502-a5a9-1fefce292846	BT	BTN	064	Bhutan 	Butan	\N
00040000-5657-2502-d21a-f74adb2b8362	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5657-2502-b54c-e1299d5b871e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5657-2502-6eff-77310aae8e98	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5657-2502-57f0-22c78c2069c8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5657-2502-b52d-244b1b5a6221	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5657-2502-0a40-b6053926de81	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5657-2502-646a-1a61ab099a57	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5657-2502-a660-0e78ba0c129c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5657-2502-1303-b4767f9990dd	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5657-2502-9d18-d1df3ff3c599	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5657-2502-127d-0596c891f3ab	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5657-2502-4544-a74255a4a59f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5657-2502-a299-4a6bee4857c6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5657-2502-d67a-267da0055b49	CA	CAN	124	Canada 	Kanada	\N
00040000-5657-2502-2961-b0548192fc6d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5657-2502-e4b1-c029a42f93c0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5657-2502-c28e-5d9a61ede1a4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5657-2502-9e02-52d8ff4e2abb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5657-2502-674e-6f83bbf16c71	CL	CHL	152	Chile 	Čile	\N
00040000-5657-2502-1a00-3b637ad0b720	CN	CHN	156	China 	Kitajska	\N
00040000-5657-2502-2bb6-e04222b13b32	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5657-2502-9077-3e187792f183	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5657-2502-1d20-ca3d5eff32c8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5657-2502-45c7-78fcdb0fe622	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5657-2502-415f-38baab66a351	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5657-2502-3eeb-1fe8726a5a9d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5657-2502-2e7f-70545b4a61e8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5657-2502-d6dd-2b0de73fc428	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5657-2502-72eb-1b8e54d6ed5f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5657-2502-dc2d-65078e8dd093	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5657-2502-9785-e42c23a1d7cf	CU	CUB	192	Cuba 	Kuba	\N
00040000-5657-2502-c1ce-5394e43c38b6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5657-2502-8f6a-77287d4d0ad6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5657-2502-523c-38415392bb7e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5657-2502-a7b7-68bd1722f831	DK	DNK	208	Denmark 	Danska	\N
00040000-5657-2502-a3b8-866f8d14fd0b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5657-2502-9c26-87bfb5e0fabe	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5657-2502-6f55-c2152506bb25	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5657-2502-e315-fe38540fc62c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5657-2502-4151-9b1059a9dd2f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5657-2502-71ed-773456891380	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5657-2502-5607-027955d97cfc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5657-2502-cb50-d7d07c0eefa8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5657-2502-d22f-549a313d5df6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5657-2502-edfd-2aeb69b3c61e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5657-2502-6140-412ff75f5fc2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5657-2502-d205-e128fad90c2d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5657-2502-a92e-3c2009a94abd	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5657-2502-daf0-e3b5a4a4e9aa	FI	FIN	246	Finland 	Finska	\N
00040000-5657-2502-2526-b554bc61e888	FR	FRA	250	France 	Francija	\N
00040000-5657-2502-41a2-73d72905a089	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5657-2502-dbe4-b5ec2e2c27ea	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5657-2502-c868-38c8bec6fcec	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5657-2502-ac35-d29355193ebf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5657-2502-b614-e3b7a39f0270	GA	GAB	266	Gabon 	Gabon	\N
00040000-5657-2502-185f-523ca3d6f303	GM	GMB	270	Gambia 	Gambija	\N
00040000-5657-2502-4a0b-80333166dffb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5657-2502-4660-62c108999075	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5657-2502-8a13-f5f2cb898a26	GH	GHA	288	Ghana 	Gana	\N
00040000-5657-2502-4f91-53740f0c22a6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5657-2502-12b1-629553ebcc82	GR	GRC	300	Greece 	Grčija	\N
00040000-5657-2502-0a1f-556cf2dd694f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5657-2502-6007-0de459e45bf3	GD	GRD	308	Grenada 	Grenada	\N
00040000-5657-2502-7a4c-5abf3da0e496	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5657-2502-140b-8fa5200ee22e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5657-2502-f71d-134f2a824ec1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5657-2502-4030-fd261f71ec1e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5657-2502-8106-3533d590daa1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5657-2502-2971-1d24fe391855	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5657-2502-a184-dac2aaa56a5e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5657-2502-04db-9908cd7d7dee	HT	HTI	332	Haiti 	Haiti	\N
00040000-5657-2502-aa3c-cc2f2521c0c8	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5657-2502-090c-02895e292380	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5657-2502-6168-5eb3ab8efc27	HN	HND	340	Honduras 	Honduras	\N
00040000-5657-2502-26fe-aa438e73d012	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5657-2502-7774-f1260fb65fee	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5657-2502-64b6-13887e114de0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5657-2502-fa0c-166a46df1478	IN	IND	356	India 	Indija	\N
00040000-5657-2502-b04d-f2b10e1e5806	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5657-2502-13b2-ae1aecef2afe	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5657-2502-0852-a175196161f0	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5657-2502-2d62-326bb2eda30d	IE	IRL	372	Ireland 	Irska	\N
00040000-5657-2502-9b74-c9e73fe6ae59	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5657-2502-2a44-eb62ee8cee59	IL	ISR	376	Israel 	Izrael	\N
00040000-5657-2502-ba60-38d3202b7bd5	IT	ITA	380	Italy 	Italija	\N
00040000-5657-2502-ff6d-1d1a9ba3eac0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5657-2502-53c1-37265b6ae01f	JP	JPN	392	Japan 	Japonska	\N
00040000-5657-2502-fd11-5a8dca1dd553	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5657-2502-9d00-9def2311f3f2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5657-2502-4b6f-3d4db54fb929	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5657-2502-3a8c-06fc61a149be	KE	KEN	404	Kenya 	Kenija	\N
00040000-5657-2502-fc4a-c38ee354555e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5657-2502-6eda-cd866c37afb3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5657-2502-933b-a1587242868e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5657-2502-1f6f-35528ab4eec0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5657-2502-c128-5e957e80ef8c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5657-2502-6a98-52e083478493	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5657-2502-7997-7b4a72432c35	LV	LVA	428	Latvia 	Latvija	\N
00040000-5657-2502-6a35-ba32a41400ce	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5657-2502-95a1-b0e67be22969	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5657-2502-507c-766ad5e3ef3c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5657-2502-2dc8-6d3829023110	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5657-2502-1a6d-971100c4004b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5657-2502-fab8-572a20d35931	LT	LTU	440	Lithuania 	Litva	\N
00040000-5657-2502-5d06-b989719acea4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5657-2502-111f-1ecab8f4b3a3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5657-2502-bd89-3078c12d9639	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5657-2502-e193-7b4b88a2df12	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5657-2502-7280-d7facb743578	MW	MWI	454	Malawi 	Malavi	\N
00040000-5657-2502-140c-e3c94b12f724	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5657-2502-b96b-e10b931d970a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5657-2502-f925-16bbee3d6a3e	ML	MLI	466	Mali 	Mali	\N
00040000-5657-2502-6507-f2f92ee34e43	MT	MLT	470	Malta 	Malta	\N
00040000-5657-2502-b46a-2e82f9f29f4a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5657-2502-77c4-9d5f1080b41d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5657-2502-f79a-8ceba0e447aa	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5657-2502-1d14-d561c6bb46f0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5657-2502-9261-246131e8e6dd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5657-2502-6638-910474e5e17d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5657-2502-f8e2-3784c3ac8812	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5657-2502-70d5-d2626dbbc9ea	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5657-2502-efc9-61da01fbdcfb	MC	MCO	492	Monaco 	Monako	\N
00040000-5657-2502-8e1c-802c0eb3eaf0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5657-2502-272c-c4ae9b76858e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5657-2502-34ca-120227261906	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5657-2502-d188-1e2f5596919e	MA	MAR	504	Morocco 	Maroko	\N
00040000-5657-2502-dffa-6e68d9cc605f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5657-2502-c295-5224c7548c7b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5657-2502-da83-c255c6d37dc2	NA	NAM	516	Namibia 	Namibija	\N
00040000-5657-2502-7551-04c8b0f79bf5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5657-2502-dd8b-c95416b611d9	NP	NPL	524	Nepal 	Nepal	\N
00040000-5657-2502-bfe1-f0e4d0b490e6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5657-2502-61dc-2711e9efac38	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5657-2502-1a09-521328f122e6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5657-2502-0f99-93968231e006	NE	NER	562	Niger 	Niger 	\N
00040000-5657-2502-b85d-cc4508fe3049	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5657-2502-9114-69b73d205e6d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5657-2502-b317-41e1c00c04d0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5657-2502-27fb-6e11beef126b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5657-2502-1cf8-0057038fad11	NO	NOR	578	Norway 	Norveška	\N
00040000-5657-2502-9744-d3d8cf2af1fa	OM	OMN	512	Oman 	Oman	\N
00040000-5657-2502-d6b4-51ca96d1f58d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5657-2502-52f3-68aa8eec5492	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5657-2502-c89b-22e2293ad87b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5657-2502-16ef-f7f0d9889bc9	PA	PAN	591	Panama 	Panama	\N
00040000-5657-2502-fa0d-033192cfbc84	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5657-2502-5343-9f5d0f19b47b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5657-2502-ae5e-c6b6d6d7a4cb	PE	PER	604	Peru 	Peru	\N
00040000-5657-2502-d342-b5695bc37670	PH	PHL	608	Philippines 	Filipini	\N
00040000-5657-2502-ffe8-675c41ac92e5	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5657-2502-346a-8cf386768068	PL	POL	616	Poland 	Poljska	\N
00040000-5657-2502-3099-fb04440fa9aa	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5657-2502-1003-1dad47bfac33	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5657-2502-955c-aa25358c413c	QA	QAT	634	Qatar 	Katar	\N
00040000-5657-2502-a383-9d12cbd2471b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5657-2502-6331-0d7d23ed82fd	RO	ROU	642	Romania 	Romunija	\N
00040000-5657-2502-1540-cd3ebec19d15	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5657-2502-01c5-73e1eafd1d47	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5657-2502-15a3-1cbac5d3001c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5657-2502-ff03-97d9fb9c25bb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5657-2502-daa2-606041b8db9f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5657-2502-dc28-fe45e23235ba	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5657-2502-cec6-c3e48eea58da	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5657-2502-389e-4559bb5ed7bc	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5657-2502-9e48-b96b82722eff	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5657-2502-e2c5-9a61300fb981	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5657-2502-87d9-023237740620	SM	SMR	674	San Marino 	San Marino	\N
00040000-5657-2502-3921-dc58fa205cc6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5657-2502-23b1-86fca0b99b1f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5657-2502-38dd-733fb933072e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5657-2502-7a03-5a5b5b68a959	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5657-2502-2e72-8a9931ffba80	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5657-2502-c1e7-90efb5a92036	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5657-2502-963c-0e2aca2c2ca2	SG	SGP	702	Singapore 	Singapur	\N
00040000-5657-2502-3294-dc1b430780d3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5657-2502-15de-114a3d08e2c6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5657-2502-9f78-4e081d698b62	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5657-2502-34dc-4ede22df610c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5657-2502-70a3-4f1b9b492b4e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5657-2502-4d1b-3daa4f91c48c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5657-2502-49d9-d5b842429278	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5657-2502-d9e3-bb75bd8b3bdc	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5657-2502-54bc-94abc0c2df2a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5657-2502-8a82-92071c606c55	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5657-2502-b26b-65e573bf0124	SD	SDN	729	Sudan 	Sudan	\N
00040000-5657-2502-2820-71764dbbbdff	SR	SUR	740	Suriname 	Surinam	\N
00040000-5657-2502-1475-019b864c13ac	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5657-2502-2750-6cd2bd65e922	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5657-2502-5a33-f4ca7c3563d8	SE	SWE	752	Sweden 	Švedska	\N
00040000-5657-2502-86f1-07060dbc4c40	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5657-2502-8767-56aa71a5483f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5657-2502-91e0-f74687009a60	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5657-2502-284b-6b3d439b208c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5657-2502-3cbb-448c7c2697ca	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5657-2502-7b3f-2d01cad8d050	TH	THA	764	Thailand 	Tajska	\N
00040000-5657-2502-c681-8b83fabaa042	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5657-2502-94fa-59dd4e73bd7c	TG	TGO	768	Togo 	Togo	\N
00040000-5657-2502-dc8b-6577c99e7284	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5657-2502-e725-91ddec54f33a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5657-2502-0adc-244f9843d19c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5657-2502-8256-cc663c1bd8f2	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5657-2502-a03c-c910ec93cb04	TR	TUR	792	Turkey 	Turčija	\N
00040000-5657-2502-e34c-b46a2edb2f8c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5657-2502-9d7a-a89189aed6b2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5657-2502-5995-1446544bef54	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5657-2502-4b32-2abb85a986a7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5657-2502-807c-5fc5d7e106d7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5657-2502-b087-52448f20d27b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5657-2502-619e-cc93f7567259	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5657-2502-f64f-1b3f39c34c97	US	USA	840	United States 	Združene države Amerike	\N
00040000-5657-2502-a6fd-6195cb7ae90a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5657-2502-2f39-8d570994d3de	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5657-2502-ab82-7c8fedd85d9e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5657-2502-2897-495abb8a60af	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5657-2502-5f38-e1bb2ecd78ef	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5657-2502-6e68-14ff9ae6316e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5657-2502-f469-3633cf5e839a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5657-2502-48b3-f17acf53750b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5657-2502-dc84-a73853594815	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5657-2502-b6d3-c92d4c33e5a4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5657-2502-c9df-5145c867872d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5657-2502-d5f6-c875e8e6279d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5657-2502-a295-694068e6656b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 29717876)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5657-2505-b408-685ec0b7cc64	000e0000-5657-2505-cb36-3d4806d92743	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5657-2502-0ceb-9e46d994cc18	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5657-2505-9db7-cd1d756bfedb	000e0000-5657-2505-6f0f-ee6b9dd094a5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5657-2502-4084-3254b1cd7593	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5657-2505-c35f-67c69febb1b2	000e0000-5657-2505-82ef-d1f44ebb8593	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5657-2502-0ceb-9e46d994cc18	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5657-2505-954e-a6a042594c88	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5657-2505-7c77-057eab0735e8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 29717677)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5657-2505-2982-a23ace96e417	000e0000-5657-2505-6f0f-ee6b9dd094a5	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5657-2502-b4aa-04f3b906e3ba
000d0000-5657-2505-8d83-ab082cbcf877	000e0000-5657-2505-6f0f-ee6b9dd094a5	000c0000-5657-2505-eec8-12307b0c95da	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5657-2502-b4aa-04f3b906e3ba
000d0000-5657-2505-bdb2-69a2028790d5	000e0000-5657-2505-6f0f-ee6b9dd094a5	000c0000-5657-2505-ada7-781f8c313a37	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5657-2502-48fc-fe011e73f7ca
000d0000-5657-2505-7809-3f9f3ac7a0b4	000e0000-5657-2505-6f0f-ee6b9dd094a5	000c0000-5657-2505-3f53-2732406146a2	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5657-2502-883c-12c86253ea34
000d0000-5657-2505-499a-53d4bd0fe63e	000e0000-5657-2505-6f0f-ee6b9dd094a5	000c0000-5657-2505-f04a-6b20cb6b5780	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5657-2502-6712-20103cafb13e
000d0000-5657-2505-8b65-ffab93023148	000e0000-5657-2505-6f0f-ee6b9dd094a5	000c0000-5657-2505-23f8-e12a935449bf	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5657-2502-6712-20103cafb13e
000d0000-5657-2505-f624-f0cf6fdd39cc	000e0000-5657-2505-6f0f-ee6b9dd094a5	000c0000-5657-2505-0d91-7e79be6c4086	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5657-2502-b4aa-04f3b906e3ba
000d0000-5657-2505-290f-a0ce473bf591	000e0000-5657-2505-6f0f-ee6b9dd094a5	000c0000-5657-2505-de13-ce0fb35a96af	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5657-2502-3599-1bcd504a3ac8
000d0000-5657-2505-6cb3-6422b3e9a2da	000e0000-5657-2505-6f0f-ee6b9dd094a5	000c0000-5657-2505-c641-42643e854c14	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5657-2502-b417-a70666463501
\.


--
-- TOC entry 3122 (class 0 OID 29717468)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 29717434)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 29717411)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5657-2505-0cb4-a7b054a76c06	00080000-5657-2504-3749-89271569afb1	00090000-5657-2505-fec1-1f2ab29dbf42	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 29717591)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 29718134)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5657-2504-ec54-c759bec3a7d5	00010000-5657-2502-40a1-207905f4ac92	\N	Prva mapa	Root mapa	2015-11-26 16:28:04	2015-11-26 16:28:04	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 29718147)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 29718169)
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
-- TOC entry 3138 (class 0 OID 29717616)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 29717368)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5657-2502-4119-4189b8abae28	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5657-2502-979c-f8448485864f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5657-2502-aec8-85622bd517c5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5657-2502-b415-8bdb37d1c778	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5657-2502-e487-d0386426a0df	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5657-2502-b86d-6761efb02946	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5657-2502-daf1-7c948e8f4483	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5657-2502-3d19-8300400a02f5	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5657-2502-4325-05f1ffbd23d9	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5657-2502-6953-ef4320e35280	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5657-2502-228e-a834c97ba9af	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5657-2502-3e34-e0c9ea042854	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5657-2502-9998-53dba49629b4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5657-2502-c9cc-577b94222e4a	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5657-2504-4352-d327c17bdf91	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5657-2504-bd44-93d6b2968a12	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5657-2504-0ca9-12f7230818ac	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5657-2504-5e4e-3c6b0b6322c4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5657-2504-2439-a9a02b02e23e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5657-2506-30cf-43ea3e8b5486	application.tenant.maticnopodjetje	string	s:36:"00080000-5657-2506-47ad-0a3b009c0ef5";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 29717266)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5657-2504-8cac-b96814248e28	00000000-5657-2504-4352-d327c17bdf91	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5657-2504-9376-1d5e3515a0f3	00000000-5657-2504-4352-d327c17bdf91	00010000-5657-2502-40a1-207905f4ac92	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5657-2504-5e12-33c4afc66f0c	00000000-5657-2504-bd44-93d6b2968a12	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 29717333)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5657-2505-521f-cc2a955938bd	\N	00100000-5657-2505-ddd4-a3ea6ee95210	00100000-5657-2505-c847-75c2cde59a5b	01	Gledališče Nimbis
00410000-5657-2505-265e-413278cba060	00410000-5657-2505-521f-cc2a955938bd	00100000-5657-2505-ddd4-a3ea6ee95210	00100000-5657-2505-c847-75c2cde59a5b	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 29717277)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5657-2504-319f-2a8178a78b87	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5657-2504-6c73-de67f9f19f05	00010000-5657-2504-5c45-2e525b2d851a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5657-2504-5be3-6b25b68b3eff	00010000-5657-2504-45a9-69a0f2a97ec0	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5657-2504-5266-16698057c7b4	00010000-5657-2504-367a-b3e60a18412e	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5657-2504-d503-f925dd3584d5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5657-2504-fdca-ee98226ec552	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5657-2504-c738-faaf0d3ce339	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5657-2505-a922-c7fc95b67eef	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5657-2505-fec1-1f2ab29dbf42	00010000-5657-2504-4ec2-3ab78c68ade4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5657-2505-0e81-8b6da52350b6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5657-2505-2eda-26affebe9d33	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5657-2505-ee08-809ab3097a75	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5657-2505-da07-7a292391011f	00010000-5657-2504-7298-09f63c8c155b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5657-2505-cb00-f19fefbb5c8b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5657-2505-a670-8498b5097258	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5657-2505-cd0d-9cc581569545	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5657-2505-244b-127686d40101	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5657-2505-8cfd-bb53b33b07ed	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5657-2505-b1a2-bdc95609c1f2	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5657-2505-5ed2-297d57b886e5	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5657-2505-c8c6-d3303ee17092	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 29717212)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5657-2502-0648-b43c8fe24c63	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5657-2502-44f6-0882da73d520	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5657-2502-4830-185d8cce5be7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5657-2502-f931-cbb10e462ead	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5657-2502-8911-bc9d4dfb03be	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5657-2502-593a-0bce6d6243c4	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5657-2502-39e7-13a5d05b19f5	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5657-2502-16f4-2229e73bdcde	Abonma-read	Abonma - branje	t
00030000-5657-2502-cce2-3f6f4c3740a5	Abonma-write	Abonma - spreminjanje	t
00030000-5657-2502-7a3a-bc4bdca9c5c9	Alternacija-read	Alternacija - branje	t
00030000-5657-2502-523f-7680aadb8cc5	Alternacija-write	Alternacija - spreminjanje	t
00030000-5657-2502-6771-175d7d1cb614	Arhivalija-read	Arhivalija - branje	t
00030000-5657-2502-e8a1-ccea466fa6b2	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5657-2502-f4f7-82737d567f38	AuthStorage-read	AuthStorage - branje	t
00030000-5657-2502-976b-d27b637a6839	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5657-2502-5c5c-0f322782607c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5657-2502-983d-dc594884cc03	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5657-2502-4a34-d29c70992b79	Besedilo-read	Besedilo - branje	t
00030000-5657-2502-0eaf-6cb57041b122	Besedilo-write	Besedilo - spreminjanje	t
00030000-5657-2502-0c42-9c68dc33458b	Dogodek-read	Dogodek - branje	t
00030000-5657-2502-a7a9-4c819017a6a8	Dogodek-write	Dogodek - spreminjanje	t
00030000-5657-2502-3aa3-c0f2ca373722	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5657-2502-5652-72f86e8f523e	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5657-2502-0e8c-d9fad479302f	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5657-2502-fb1c-e417e28b7647	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5657-2502-8027-0ffb2ffd524c	DogodekTrait-read	DogodekTrait - branje	t
00030000-5657-2502-20c3-2b910d41f6d0	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5657-2502-6aff-61814de088f6	DrugiVir-read	DrugiVir - branje	t
00030000-5657-2502-663f-428a6cd08699	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5657-2502-f68f-e77c5915437f	Drzava-read	Drzava - branje	t
00030000-5657-2502-574b-edc8aeb003df	Drzava-write	Drzava - spreminjanje	t
00030000-5657-2502-f148-201d172edda2	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5657-2502-f979-9a817958dcb7	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5657-2502-2f64-796b1ea5d60c	Funkcija-read	Funkcija - branje	t
00030000-5657-2502-6cf7-d740e9b45bce	Funkcija-write	Funkcija - spreminjanje	t
00030000-5657-2502-35af-60cb83c73026	Gostovanje-read	Gostovanje - branje	t
00030000-5657-2502-30c2-e47024a84dd0	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5657-2502-8418-81979786884a	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5657-2502-55a3-263d80a81e56	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5657-2502-bc21-85d596c32e1e	Kupec-read	Kupec - branje	t
00030000-5657-2502-fb63-36664930960a	Kupec-write	Kupec - spreminjanje	t
00030000-5657-2502-9851-396d7998ec2b	NacinPlacina-read	NacinPlacina - branje	t
00030000-5657-2502-795a-bebf84d1bcaf	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5657-2502-d76b-7350acff8818	Option-read	Option - branje	t
00030000-5657-2502-8cc0-dc0e1cfff61a	Option-write	Option - spreminjanje	t
00030000-5657-2502-f77a-58d54cf00a68	OptionValue-read	OptionValue - branje	t
00030000-5657-2502-ff57-78bb0fc2caca	OptionValue-write	OptionValue - spreminjanje	t
00030000-5657-2502-e2f4-ce56324237dc	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5657-2502-8a8e-e5ffc124440c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5657-2502-69ca-870a9af0e0e4	Oseba-read	Oseba - branje	t
00030000-5657-2502-f83a-878dcb110747	Oseba-write	Oseba - spreminjanje	t
00030000-5657-2502-6925-8e0d7b075868	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5657-2502-b405-3db543bf3e2e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5657-2502-8c4a-b770ebd0c2d7	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5657-2502-a4e1-f64a18e6dfaa	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5657-2502-143e-9e4321feab10	Pogodba-read	Pogodba - branje	t
00030000-5657-2502-7e35-9d878af63995	Pogodba-write	Pogodba - spreminjanje	t
00030000-5657-2502-8090-9e41b66ca383	Popa-read	Popa - branje	t
00030000-5657-2502-a40e-94d229d3f315	Popa-write	Popa - spreminjanje	t
00030000-5657-2502-9412-98cf3610457b	Posta-read	Posta - branje	t
00030000-5657-2502-0b42-e0077f68d149	Posta-write	Posta - spreminjanje	t
00030000-5657-2502-257d-a49c3e52841e	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5657-2502-32a3-1a22b228ae7e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5657-2502-4e1d-7fc03bdec543	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5657-2502-7040-77a0529a31ba	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5657-2502-3a4f-636961087883	PostniNaslov-read	PostniNaslov - branje	t
00030000-5657-2502-bb87-846fdd7cddf9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5657-2502-1d4e-ee3b5d701134	Praznik-read	Praznik - branje	t
00030000-5657-2502-4087-13ee98efb050	Praznik-write	Praznik - spreminjanje	t
00030000-5657-2502-d989-34e109983b1e	Predstava-read	Predstava - branje	t
00030000-5657-2502-9a3b-e9e752b6c661	Predstava-write	Predstava - spreminjanje	t
00030000-5657-2502-e4c6-8c3f677b2aab	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5657-2502-a315-6863d8c06332	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5657-2502-16f4-3394baf56778	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5657-2502-6643-c92be6aa3f84	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5657-2502-7f4a-62f24fbac1b7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5657-2502-faf4-5f8fd2ea046a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5657-2502-f723-aef3fff92129	ProgramDela-read	ProgramDela - branje	t
00030000-5657-2502-5b53-7672244231d0	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5657-2502-5f89-3510efc83e8f	ProgramFestival-read	ProgramFestival - branje	t
00030000-5657-2502-755f-efb8c42d9a2e	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5657-2502-0cb9-b5ebf4f8619b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5657-2502-a9f6-fd8d9609d478	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5657-2502-9b21-f90cf2cef76e	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5657-2502-8082-0bf6644d15e6	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5657-2502-c6ef-bb3096a9e5d0	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5657-2502-c50a-a77861921c92	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5657-2502-b404-fc7c857ae51f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5657-2502-c943-be663904e06d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5657-2502-17c6-c35bb2672da7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5657-2502-1286-89d0a118acbc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5657-2502-765b-90053a00352d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5657-2502-1582-40d2d7f0b742	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5657-2502-ec06-33b8dca959cc	ProgramRazno-read	ProgramRazno - branje	t
00030000-5657-2502-2d43-b9ae00d67e5c	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5657-2502-7205-d2c627383834	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5657-2502-d1b8-5a655973db0b	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5657-2502-5096-def8a37864dc	Prostor-read	Prostor - branje	t
00030000-5657-2502-35a3-d4010fe6802b	Prostor-write	Prostor - spreminjanje	t
00030000-5657-2502-6d1b-ddd4a646671b	Racun-read	Racun - branje	t
00030000-5657-2502-068d-ea53e2cbeec0	Racun-write	Racun - spreminjanje	t
00030000-5657-2502-cfb9-d6e7f13a864a	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5657-2502-07d7-4c3f6da7ba8a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5657-2502-34be-609939fe4943	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5657-2502-6b0f-f1714bfcc240	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5657-2502-9d4f-5109a6182125	Rekvizit-read	Rekvizit - branje	t
00030000-5657-2502-95c2-158527a3d845	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5657-2502-69d4-fbf1587cea80	Revizija-read	Revizija - branje	t
00030000-5657-2502-abdd-91be485c5a00	Revizija-write	Revizija - spreminjanje	t
00030000-5657-2502-c956-42807e7cb49b	Rezervacija-read	Rezervacija - branje	t
00030000-5657-2502-c30f-e9bf60394953	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5657-2502-56a2-a625aa252ec1	SedezniRed-read	SedezniRed - branje	t
00030000-5657-2502-5679-d1b43cc71a64	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5657-2502-2d1c-6966ccca0310	Sedez-read	Sedez - branje	t
00030000-5657-2502-e5ce-8ee3a4f7c03e	Sedez-write	Sedez - spreminjanje	t
00030000-5657-2502-2872-064a510cc436	Sezona-read	Sezona - branje	t
00030000-5657-2502-474a-0f5255b0fc7d	Sezona-write	Sezona - spreminjanje	t
00030000-5657-2502-95c1-f04e92761e47	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5657-2502-47ac-c119ceabe2b1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5657-2502-2688-5f583f3677f7	Stevilcenje-read	Stevilcenje - branje	t
00030000-5657-2502-0f2f-29fd1458e363	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5657-2502-5716-8c81a6c0a07a	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5657-2502-876d-9c7e17317b84	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5657-2502-b894-0682b6bf3bf4	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5657-2502-65e9-7190bc444185	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5657-2502-5fb1-128d71397a6c	Telefonska-read	Telefonska - branje	t
00030000-5657-2502-6601-65d4fd4bc9a2	Telefonska-write	Telefonska - spreminjanje	t
00030000-5657-2502-7744-02147b2b8bae	TerminStoritve-read	TerminStoritve - branje	t
00030000-5657-2502-0bd4-46cc0e5d0181	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5657-2502-4a50-8f2500eaac66	TipFunkcije-read	TipFunkcije - branje	t
00030000-5657-2502-eb56-f6e58ea0489e	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5657-2502-a926-44474cb8a730	TipPopa-read	TipPopa - branje	t
00030000-5657-2502-af4e-533f753d8557	TipPopa-write	TipPopa - spreminjanje	t
00030000-5657-2502-2de9-cd0208bc1f82	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5657-2502-77fb-859337252c43	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5657-2502-9b12-7d25eee78049	TipVaje-read	TipVaje - branje	t
00030000-5657-2502-6839-06b3204b7917	TipVaje-write	TipVaje - spreminjanje	t
00030000-5657-2502-8f6f-acb1cd8c4645	Trr-read	Trr - branje	t
00030000-5657-2502-73d0-7e7812a4f919	Trr-write	Trr - spreminjanje	t
00030000-5657-2502-b4ca-7be0d5093ff8	Uprizoritev-read	Uprizoritev - branje	t
00030000-5657-2502-05df-2fbff200e4e0	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5657-2502-7a62-df06063731d1	Vaja-read	Vaja - branje	t
00030000-5657-2502-e42f-fbc1e16dd6e3	Vaja-write	Vaja - spreminjanje	t
00030000-5657-2502-7514-9a6a23810183	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5657-2502-14e2-e2d3267063de	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5657-2502-c18c-9af761617e68	VrstaStroska-read	VrstaStroska - branje	t
00030000-5657-2502-6e7f-4faa71e5eca7	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5657-2502-829d-477553c10230	Zaposlitev-read	Zaposlitev - branje	t
00030000-5657-2502-ca1b-47cb3ec210bc	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5657-2502-4622-44c9ceea671e	Zasedenost-read	Zasedenost - branje	t
00030000-5657-2502-414e-446c9664ac59	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5657-2502-1d76-3dbf981896f8	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5657-2502-9d5b-5ae43949a899	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5657-2502-6d20-09f131059380	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5657-2502-3ad1-d0c78da5db4f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5657-2502-28cb-2033a56d320d	Job-read	Branje opravil - samo zase - branje	t
00030000-5657-2502-a894-7809c5e9850e	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5657-2502-365c-200a80d14096	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5657-2502-55c3-50f4b362ed3a	Report-read	Report - branje	t
00030000-5657-2502-180b-3482befe76d5	Report-write	Report - spreminjanje	t
00030000-5657-2502-d8cb-353fd8264a02	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5657-2502-c09c-7ffbd4fe43d7	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5657-2502-f832-07e2ca74ce95	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5657-2502-013c-383f9ffdd86d	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5657-2502-ee12-5c6ef6c5884a	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5657-2502-15a1-de1f02608608	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5657-2502-742b-91d173a916f3	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5657-2502-b27d-7d2e3c01e5e2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5657-2502-bb15-a0dfae96c992	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5657-2502-01cf-05affc68dd0e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5657-2502-f816-5374ae5b7862	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5657-2502-e611-5ece24c51354	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5657-2502-4ac3-1bbd5a4d24b5	Datoteka-write	Datoteka - spreminjanje	t
00030000-5657-2502-8f81-acf7b6eb28f6	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 29717231)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5657-2502-0573-f0081e286c8f	00030000-5657-2502-44f6-0882da73d520
00020000-5657-2502-52de-02edd5ce83b8	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-16f4-2229e73bdcde
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-cce2-3f6f4c3740a5
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-7a3a-bc4bdca9c5c9
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-523f-7680aadb8cc5
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-6771-175d7d1cb614
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-0c42-9c68dc33458b
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-f931-cbb10e462ead
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-a7a9-4c819017a6a8
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-574b-edc8aeb003df
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-2f64-796b1ea5d60c
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-6cf7-d740e9b45bce
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-35af-60cb83c73026
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-30c2-e47024a84dd0
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-8418-81979786884a
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-55a3-263d80a81e56
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-d76b-7350acff8818
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-f77a-58d54cf00a68
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-f83a-878dcb110747
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-a40e-94d229d3f315
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-9412-98cf3610457b
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-0b42-e0077f68d149
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-3a4f-636961087883
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-bb87-846fdd7cddf9
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-d989-34e109983b1e
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-9a3b-e9e752b6c661
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-7f4a-62f24fbac1b7
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-faf4-5f8fd2ea046a
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-5096-def8a37864dc
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-35a3-d4010fe6802b
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-34be-609939fe4943
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-6b0f-f1714bfcc240
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-9d4f-5109a6182125
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-95c2-158527a3d845
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-2872-064a510cc436
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-474a-0f5255b0fc7d
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-4a50-8f2500eaac66
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-b4ca-7be0d5093ff8
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-05df-2fbff200e4e0
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-7a62-df06063731d1
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-e42f-fbc1e16dd6e3
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-4622-44c9ceea671e
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-414e-446c9664ac59
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-1d76-3dbf981896f8
00020000-5657-2502-6ec3-08701dc94eaa	00030000-5657-2502-6d20-09f131059380
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-16f4-2229e73bdcde
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-6771-175d7d1cb614
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-0c42-9c68dc33458b
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-35af-60cb83c73026
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-8418-81979786884a
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-55a3-263d80a81e56
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-d76b-7350acff8818
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-f77a-58d54cf00a68
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-f83a-878dcb110747
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-9412-98cf3610457b
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-3a4f-636961087883
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-bb87-846fdd7cddf9
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-d989-34e109983b1e
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-5096-def8a37864dc
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-34be-609939fe4943
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-9d4f-5109a6182125
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-2872-064a510cc436
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-5fb1-128d71397a6c
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-6601-65d4fd4bc9a2
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-8f6f-acb1cd8c4645
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-73d0-7e7812a4f919
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-829d-477553c10230
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-ca1b-47cb3ec210bc
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-1d76-3dbf981896f8
00020000-5657-2502-e935-02115eef35c7	00030000-5657-2502-6d20-09f131059380
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-16f4-2229e73bdcde
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-7a3a-bc4bdca9c5c9
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-6771-175d7d1cb614
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-e8a1-ccea466fa6b2
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-4a34-d29c70992b79
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-3aa3-c0f2ca373722
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-0c42-9c68dc33458b
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-2f64-796b1ea5d60c
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-35af-60cb83c73026
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-8418-81979786884a
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-d76b-7350acff8818
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-f77a-58d54cf00a68
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-9412-98cf3610457b
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-d989-34e109983b1e
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-7f4a-62f24fbac1b7
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-5096-def8a37864dc
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-34be-609939fe4943
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-9d4f-5109a6182125
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-2872-064a510cc436
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-4a50-8f2500eaac66
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-7a62-df06063731d1
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-4622-44c9ceea671e
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-1d76-3dbf981896f8
00020000-5657-2502-db55-485e26b2d5d8	00030000-5657-2502-6d20-09f131059380
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-16f4-2229e73bdcde
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-cce2-3f6f4c3740a5
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-523f-7680aadb8cc5
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-6771-175d7d1cb614
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-0c42-9c68dc33458b
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-35af-60cb83c73026
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-d76b-7350acff8818
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-f77a-58d54cf00a68
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-9412-98cf3610457b
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-d989-34e109983b1e
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-5096-def8a37864dc
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-34be-609939fe4943
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-9d4f-5109a6182125
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-2872-064a510cc436
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-4a50-8f2500eaac66
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-1d76-3dbf981896f8
00020000-5657-2502-8bc4-33ed2855f047	00030000-5657-2502-6d20-09f131059380
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-16f4-2229e73bdcde
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-6771-175d7d1cb614
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-0c42-9c68dc33458b
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-35af-60cb83c73026
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-d76b-7350acff8818
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-f77a-58d54cf00a68
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-9412-98cf3610457b
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-d989-34e109983b1e
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-5096-def8a37864dc
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-34be-609939fe4943
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-9d4f-5109a6182125
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-2872-064a510cc436
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-7744-02147b2b8bae
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-4830-185d8cce5be7
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-4a50-8f2500eaac66
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-1d76-3dbf981896f8
00020000-5657-2502-1bad-3f891d8e1f94	00030000-5657-2502-6d20-09f131059380
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-0648-b43c8fe24c63
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-44f6-0882da73d520
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-16f4-2229e73bdcde
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-cce2-3f6f4c3740a5
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-7a3a-bc4bdca9c5c9
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-523f-7680aadb8cc5
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6771-175d7d1cb614
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-e8a1-ccea466fa6b2
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f4f7-82737d567f38
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-976b-d27b637a6839
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-5c5c-0f322782607c
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-983d-dc594884cc03
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-4a34-d29c70992b79
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-0eaf-6cb57041b122
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-4ac3-1bbd5a4d24b5
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-0c42-9c68dc33458b
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f931-cbb10e462ead
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-a7a9-4c819017a6a8
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-3aa3-c0f2ca373722
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-5652-72f86e8f523e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-0e8c-d9fad479302f
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-fb1c-e417e28b7647
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6aff-61814de088f6
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-663f-428a6cd08699
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-574b-edc8aeb003df
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f148-201d172edda2
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f979-9a817958dcb7
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-2f64-796b1ea5d60c
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6cf7-d740e9b45bce
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-35af-60cb83c73026
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-30c2-e47024a84dd0
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-365c-200a80d14096
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-28cb-2033a56d320d
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-a894-7809c5e9850e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8418-81979786884a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-55a3-263d80a81e56
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-bc21-85d596c32e1e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-fb63-36664930960a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-d8cb-353fd8264a02
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-c09c-7ffbd4fe43d7
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f832-07e2ca74ce95
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-013c-383f9ffdd86d
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-15a1-de1f02608608
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-ee12-5c6ef6c5884a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-9851-396d7998ec2b
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-795a-bebf84d1bcaf
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-d76b-7350acff8818
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8cc0-dc0e1cfff61a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f77a-58d54cf00a68
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-ff57-78bb0fc2caca
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-e2f4-ce56324237dc
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8a8e-e5ffc124440c
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8911-bc9d4dfb03be
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f83a-878dcb110747
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6925-8e0d7b075868
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-b405-3db543bf3e2e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8c4a-b770ebd0c2d7
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-a4e1-f64a18e6dfaa
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-143e-9e4321feab10
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-7e35-9d878af63995
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-a40e-94d229d3f315
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-9412-98cf3610457b
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-0b42-e0077f68d149
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-257d-a49c3e52841e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-32a3-1a22b228ae7e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-4e1d-7fc03bdec543
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-7040-77a0529a31ba
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-3a4f-636961087883
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-bb87-846fdd7cddf9
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-1d4e-ee3b5d701134
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-4087-13ee98efb050
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-d989-34e109983b1e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-9a3b-e9e752b6c661
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-e4c6-8c3f677b2aab
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-a315-6863d8c06332
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-16f4-3394baf56778
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6643-c92be6aa3f84
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-7f4a-62f24fbac1b7
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-faf4-5f8fd2ea046a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-593a-0bce6d6243c4
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f723-aef3fff92129
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-39e7-13a5d05b19f5
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-5b53-7672244231d0
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-5f89-3510efc83e8f
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-755f-efb8c42d9a2e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-0cb9-b5ebf4f8619b
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-a9f6-fd8d9609d478
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-9b21-f90cf2cef76e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8082-0bf6644d15e6
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-c6ef-bb3096a9e5d0
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-c50a-a77861921c92
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-b404-fc7c857ae51f
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-c943-be663904e06d
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-17c6-c35bb2672da7
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-1286-89d0a118acbc
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-765b-90053a00352d
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-1582-40d2d7f0b742
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-ec06-33b8dca959cc
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-2d43-b9ae00d67e5c
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-7205-d2c627383834
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-d1b8-5a655973db0b
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-5096-def8a37864dc
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-35a3-d4010fe6802b
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6d1b-ddd4a646671b
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-068d-ea53e2cbeec0
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-cfb9-d6e7f13a864a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-07d7-4c3f6da7ba8a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-9d4f-5109a6182125
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-95c2-158527a3d845
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-34be-609939fe4943
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6b0f-f1714bfcc240
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-55c3-50f4b362ed3a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-180b-3482befe76d5
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-69d4-fbf1587cea80
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-abdd-91be485c5a00
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-c956-42807e7cb49b
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-c30f-e9bf60394953
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-2d1c-6966ccca0310
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-e5ce-8ee3a4f7c03e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-56a2-a625aa252ec1
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-5679-d1b43cc71a64
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-2872-064a510cc436
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-474a-0f5255b0fc7d
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-2688-5f583f3677f7
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-0f2f-29fd1458e363
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-95c1-f04e92761e47
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-47ac-c119ceabe2b1
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-5716-8c81a6c0a07a
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-876d-9c7e17317b84
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-b894-0682b6bf3bf4
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-65e9-7190bc444185
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-5fb1-128d71397a6c
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6601-65d4fd4bc9a2
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-7744-02147b2b8bae
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-4830-185d8cce5be7
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-0bd4-46cc0e5d0181
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-4a50-8f2500eaac66
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-eb56-f6e58ea0489e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-a926-44474cb8a730
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-af4e-533f753d8557
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-2de9-cd0208bc1f82
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-77fb-859337252c43
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-9b12-7d25eee78049
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6839-06b3204b7917
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-8f6f-acb1cd8c4645
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-73d0-7e7812a4f919
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-b4ca-7be0d5093ff8
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-05df-2fbff200e4e0
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-7a62-df06063731d1
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-e42f-fbc1e16dd6e3
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-7514-9a6a23810183
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-14e2-e2d3267063de
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-c18c-9af761617e68
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6e7f-4faa71e5eca7
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-e611-5ece24c51354
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-f816-5374ae5b7862
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-742b-91d173a916f3
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-bb15-a0dfae96c992
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-829d-477553c10230
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-ca1b-47cb3ec210bc
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-4622-44c9ceea671e
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-414e-446c9664ac59
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-1d76-3dbf981896f8
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-9d5b-5ae43949a899
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-6d20-09f131059380
00020000-5657-2504-a58a-c045ab2208f2	00030000-5657-2502-3ad1-d0c78da5db4f
00020000-5657-2504-4c15-a5ff2813bd42	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-db21-33e08287a99f	00030000-5657-2502-bb15-a0dfae96c992
00020000-5657-2504-50c5-620e58967e79	00030000-5657-2502-05df-2fbff200e4e0
00020000-5657-2504-e667-d941cfb4baec	00030000-5657-2502-b4ca-7be0d5093ff8
00020000-5657-2504-c8d1-2ed7f986b206	00030000-5657-2502-c09c-7ffbd4fe43d7
00020000-5657-2504-27f2-58a2e5b1b499	00030000-5657-2502-f832-07e2ca74ce95
00020000-5657-2504-d024-bdcc59ffc1f1	00030000-5657-2502-013c-383f9ffdd86d
00020000-5657-2504-0c2b-8ccf31905717	00030000-5657-2502-d8cb-353fd8264a02
00020000-5657-2504-158e-f890396be079	00030000-5657-2502-15a1-de1f02608608
00020000-5657-2504-61d0-5cc17c059eb3	00030000-5657-2502-ee12-5c6ef6c5884a
00020000-5657-2504-4a46-afe9f2cc65b6	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-6121-b839dfcde895	00030000-5657-2502-742b-91d173a916f3
00020000-5657-2504-050e-53f970b2d05a	00030000-5657-2502-f83a-878dcb110747
00020000-5657-2504-2e44-158aa2dde4c3	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2504-4e3c-fa847c44e53e	00030000-5657-2502-4ac3-1bbd5a4d24b5
00020000-5657-2504-41ae-404e0d50dcbe	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-9a6a-e5318b99bdd3	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2504-9a6a-e5318b99bdd3	00030000-5657-2502-a40e-94d229d3f315
00020000-5657-2504-9a6a-e5318b99bdd3	00030000-5657-2502-b4ca-7be0d5093ff8
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-983d-dc594884cc03
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-0eaf-6cb57041b122
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-4ac3-1bbd5a4d24b5
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-742b-91d173a916f3
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-bb15-a0dfae96c992
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-5c5c-0f322782607c
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-4a34-d29c70992b79
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-b368-b09ed8a708e2	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-68cd-ecfc2a3a4435	00030000-5657-2502-5c5c-0f322782607c
00020000-5657-2504-68cd-ecfc2a3a4435	00030000-5657-2502-4a34-d29c70992b79
00020000-5657-2504-68cd-ecfc2a3a4435	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-68cd-ecfc2a3a4435	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-68cd-ecfc2a3a4435	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-1f17-2d2b16427096	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2504-1f17-2d2b16427096	00030000-5657-2502-829d-477553c10230
00020000-5657-2504-1f17-2d2b16427096	00030000-5657-2502-ca1b-47cb3ec210bc
00020000-5657-2504-1f17-2d2b16427096	00030000-5657-2502-e2f4-ce56324237dc
00020000-5657-2504-a7a3-0aab0ce87d63	00030000-5657-2502-829d-477553c10230
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-5fb1-128d71397a6c
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-3a4f-636961087883
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-8f6f-acb1cd8c4645
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-8418-81979786884a
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-7f4a-62f24fbac1b7
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-6601-65d4fd4bc9a2
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-bb87-846fdd7cddf9
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-742b-91d173a916f3
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-73d0-7e7812a4f919
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-a40e-94d229d3f315
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-4ac3-1bbd5a4d24b5
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-bb15-a0dfae96c992
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-55a3-263d80a81e56
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-faf4-5f8fd2ea046a
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2504-9166-56967e7e5970	00030000-5657-2502-a926-44474cb8a730
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-5fb1-128d71397a6c
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-3a4f-636961087883
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-8f6f-acb1cd8c4645
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-8418-81979786884a
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-7f4a-62f24fbac1b7
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2504-9dbf-a344fd514794	00030000-5657-2502-a926-44474cb8a730
00020000-5657-2504-f422-850c1e172260	00030000-5657-2502-a926-44474cb8a730
00020000-5657-2504-f422-850c1e172260	00030000-5657-2502-af4e-533f753d8557
00020000-5657-2504-88c6-8e9b7f93ce36	00030000-5657-2502-a926-44474cb8a730
00020000-5657-2504-0c9c-adfabcb8c0fd	00030000-5657-2502-9412-98cf3610457b
00020000-5657-2504-0c9c-adfabcb8c0fd	00030000-5657-2502-0b42-e0077f68d149
00020000-5657-2504-3a38-868b1d1fbe99	00030000-5657-2502-9412-98cf3610457b
00020000-5657-2504-e2b1-15d2856de578	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2504-e2b1-15d2856de578	00030000-5657-2502-574b-edc8aeb003df
00020000-5657-2504-8147-d71d3c2e9355	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2504-25cc-bfae7557b4fe	00030000-5657-2502-6d20-09f131059380
00020000-5657-2504-25cc-bfae7557b4fe	00030000-5657-2502-3ad1-d0c78da5db4f
00020000-5657-2504-6fd4-0fd863ed66a6	00030000-5657-2502-6d20-09f131059380
00020000-5657-2504-eb03-255dc9d9dddb	00030000-5657-2502-1d76-3dbf981896f8
00020000-5657-2504-eb03-255dc9d9dddb	00030000-5657-2502-9d5b-5ae43949a899
00020000-5657-2504-daa6-a288a0a5fdf9	00030000-5657-2502-1d76-3dbf981896f8
00020000-5657-2504-fba7-19df80bc85b0	00030000-5657-2502-16f4-2229e73bdcde
00020000-5657-2504-fba7-19df80bc85b0	00030000-5657-2502-cce2-3f6f4c3740a5
00020000-5657-2504-443f-fbf026920bff	00030000-5657-2502-16f4-2229e73bdcde
00020000-5657-2504-80fd-e1e55e4f3075	00030000-5657-2502-5096-def8a37864dc
00020000-5657-2504-80fd-e1e55e4f3075	00030000-5657-2502-35a3-d4010fe6802b
00020000-5657-2504-80fd-e1e55e4f3075	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2504-80fd-e1e55e4f3075	00030000-5657-2502-3a4f-636961087883
00020000-5657-2504-80fd-e1e55e4f3075	00030000-5657-2502-bb87-846fdd7cddf9
00020000-5657-2504-80fd-e1e55e4f3075	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2504-6ee2-042fcd6c6a2e	00030000-5657-2502-5096-def8a37864dc
00020000-5657-2504-6ee2-042fcd6c6a2e	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2504-6ee2-042fcd6c6a2e	00030000-5657-2502-3a4f-636961087883
00020000-5657-2504-311f-97908d731fb0	00030000-5657-2502-c18c-9af761617e68
00020000-5657-2504-311f-97908d731fb0	00030000-5657-2502-6e7f-4faa71e5eca7
00020000-5657-2504-f0bc-41a946c2e3f5	00030000-5657-2502-c18c-9af761617e68
00020000-5657-2504-c1f3-35f742a954fe	00030000-5657-2502-8a8e-e5ffc124440c
00020000-5657-2504-c1f3-35f742a954fe	00030000-5657-2502-e2f4-ce56324237dc
00020000-5657-2504-c1f3-35f742a954fe	00030000-5657-2502-4ac3-1bbd5a4d24b5
00020000-5657-2504-c1f3-35f742a954fe	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-c1f3-35f742a954fe	00030000-5657-2502-742b-91d173a916f3
00020000-5657-2504-c1f3-35f742a954fe	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-c1f3-35f742a954fe	00030000-5657-2502-bb15-a0dfae96c992
00020000-5657-2504-c1f3-35f742a954fe	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-5027-fec600e3a5ad	00030000-5657-2502-e2f4-ce56324237dc
00020000-5657-2504-5027-fec600e3a5ad	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-5027-fec600e3a5ad	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-5027-fec600e3a5ad	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-caa4-7da871c0cbfe	00030000-5657-2502-9b12-7d25eee78049
00020000-5657-2504-caa4-7da871c0cbfe	00030000-5657-2502-6839-06b3204b7917
00020000-5657-2504-8a11-d3b906f3c861	00030000-5657-2502-9b12-7d25eee78049
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-593a-0bce6d6243c4
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-39e7-13a5d05b19f5
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-f723-aef3fff92129
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-5b53-7672244231d0
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-5f89-3510efc83e8f
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-755f-efb8c42d9a2e
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-0cb9-b5ebf4f8619b
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-a9f6-fd8d9609d478
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-9b21-f90cf2cef76e
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-8082-0bf6644d15e6
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-c6ef-bb3096a9e5d0
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-c50a-a77861921c92
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-b404-fc7c857ae51f
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-c943-be663904e06d
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-17c6-c35bb2672da7
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-1286-89d0a118acbc
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-765b-90053a00352d
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-1582-40d2d7f0b742
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-ec06-33b8dca959cc
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-2d43-b9ae00d67e5c
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-7205-d2c627383834
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-d1b8-5a655973db0b
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-6643-c92be6aa3f84
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-663f-428a6cd08699
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-32a3-1a22b228ae7e
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-6aff-61814de088f6
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-16f4-3394baf56778
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-7f4a-62f24fbac1b7
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-257d-a49c3e52841e
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-c18c-9af761617e68
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-b4ca-7be0d5093ff8
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-b894-0682b6bf3bf4
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-2f64-796b1ea5d60c
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-7a3a-bc4bdca9c5c9
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-4a50-8f2500eaac66
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-69ca-870a9af0e0e4
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-143e-9e4321feab10
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-8090-9e41b66ca383
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-4ac3-1bbd5a4d24b5
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-742b-91d173a916f3
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-bb15-a0dfae96c992
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-0b52-7f09f0049715	00030000-5657-2502-01cf-05affc68dd0e
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-f723-aef3fff92129
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-5f89-3510efc83e8f
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-0cb9-b5ebf4f8619b
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-9b21-f90cf2cef76e
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-c6ef-bb3096a9e5d0
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-b404-fc7c857ae51f
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-17c6-c35bb2672da7
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-765b-90053a00352d
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-ec06-33b8dca959cc
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-7205-d2c627383834
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-16f4-3394baf56778
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-6aff-61814de088f6
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-257d-a49c3e52841e
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-f68f-e77c5915437f
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-28cb-2033a56d320d
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-55c3-50f4b362ed3a
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-8f81-acf7b6eb28f6
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-b27d-7d2e3c01e5e2
00020000-5657-2504-2195-5e3a508feb08	00030000-5657-2502-01cf-05affc68dd0e
\.


--
-- TOC entry 3139 (class 0 OID 29717623)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 29717657)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 29717794)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5657-2505-dbd7-7a2df030eb77	00090000-5657-2504-319f-2a8178a78b87	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5657-2505-084b-0e0e80f8aeed	00090000-5657-2504-fdca-ee98226ec552	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5657-2505-f9bc-55ed7ba3d0f7	00090000-5657-2505-da07-7a292391011f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5657-2505-aca3-17d9d0411daa	00090000-5657-2505-0e81-8b6da52350b6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 29717313)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5657-2504-3749-89271569afb1	\N	00040000-5657-2502-9f78-4e081d698b62	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5657-2504-744f-ec709015f155	\N	00040000-5657-2502-9f78-4e081d698b62	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5657-2504-9dd5-868be64b18d2	\N	00040000-5657-2502-9f78-4e081d698b62	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5657-2504-f626-b59231586dde	\N	00040000-5657-2502-9f78-4e081d698b62	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5657-2504-7474-8867e0eecf1e	\N	00040000-5657-2502-9f78-4e081d698b62	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5657-2504-c195-4cc3a1334365	\N	00040000-5657-2502-ed74-c1ba32927998	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5657-2504-de9f-05cfcf0a0a02	\N	00040000-5657-2502-dc2d-65078e8dd093	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5657-2504-fb51-731c9dca70ec	\N	00040000-5657-2502-63ab-b3abc98d487c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5657-2504-fa0c-d29ee97c3ed8	\N	00040000-5657-2502-4660-62c108999075	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5657-2506-47ad-0a3b009c0ef5	\N	00040000-5657-2502-9f78-4e081d698b62	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 29717360)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5657-2501-788b-3c6e2e7ff965	8341	Adlešiči
00050000-5657-2501-9dcc-ccf6df499ce7	5270	Ajdovščina
00050000-5657-2501-cf02-121da6aa11e6	6280	Ankaran/Ancarano
00050000-5657-2501-10a7-3c32e712c92c	9253	Apače
00050000-5657-2501-e196-59271869c90d	8253	Artiče
00050000-5657-2501-6440-0648450d7379	4275	Begunje na Gorenjskem
00050000-5657-2501-bb56-821695751d46	1382	Begunje pri Cerknici
00050000-5657-2501-63b5-5f60fe348d3b	9231	Beltinci
00050000-5657-2501-032f-8be9f5af49f0	2234	Benedikt
00050000-5657-2501-69f5-710863a0b967	2345	Bistrica ob Dravi
00050000-5657-2501-3320-5e5bfd987b3d	3256	Bistrica ob Sotli
00050000-5657-2501-c959-96bbc26d6532	8259	Bizeljsko
00050000-5657-2501-e199-74ca5872b297	1223	Blagovica
00050000-5657-2501-2ed5-e56204e68cba	8283	Blanca
00050000-5657-2501-8745-1680fe529d77	4260	Bled
00050000-5657-2501-8404-00b361f6ca33	4273	Blejska Dobrava
00050000-5657-2501-3659-b88dd8dc5e07	9265	Bodonci
00050000-5657-2501-ddff-4e36b66b1494	9222	Bogojina
00050000-5657-2501-ec8d-87308a3d2850	4263	Bohinjska Bela
00050000-5657-2501-8983-ef7d473f223e	4264	Bohinjska Bistrica
00050000-5657-2501-c26a-e2d89be848d1	4265	Bohinjsko jezero
00050000-5657-2501-94e6-02686951f14a	1353	Borovnica
00050000-5657-2501-2e66-039904d0891c	8294	Boštanj
00050000-5657-2501-565b-2442e15abd1c	5230	Bovec
00050000-5657-2501-000f-eea8cda074e8	5295	Branik
00050000-5657-2501-930a-5d39c9e626a1	3314	Braslovče
00050000-5657-2501-5224-06eaf9906211	5223	Breginj
00050000-5657-2501-28ca-51cf23375ff5	8280	Brestanica
00050000-5657-2501-47eb-34883aa20088	2354	Bresternica
00050000-5657-2501-f43a-3c368650165f	4243	Brezje
00050000-5657-2501-a55d-6f526b1b2851	1351	Brezovica pri Ljubljani
00050000-5657-2501-749e-599c98ab2e77	8250	Brežice
00050000-5657-2501-62a6-35b9e51a2bf0	4210	Brnik - Aerodrom
00050000-5657-2501-645d-e17455293489	8321	Brusnice
00050000-5657-2501-aa54-831119aadaf8	3255	Buče
00050000-5657-2501-97ad-1776eeb0ec89	8276	Bučka 
00050000-5657-2501-81ae-fcb481ff96eb	9261	Cankova
00050000-5657-2501-1907-ad91b773f5e9	3000	Celje 
00050000-5657-2501-36d4-946dfa7d6887	3001	Celje - poštni predali
00050000-5657-2501-ce56-e611b09aa94f	4207	Cerklje na Gorenjskem
00050000-5657-2501-a548-9e1908ecc71d	8263	Cerklje ob Krki
00050000-5657-2501-cb81-d15f8a9c650d	1380	Cerknica
00050000-5657-2501-48fa-87556d29b2d4	5282	Cerkno
00050000-5657-2501-5dca-263339cc381d	2236	Cerkvenjak
00050000-5657-2501-c136-1d4339bcf293	2215	Ceršak
00050000-5657-2501-de6b-59d727bfde2c	2326	Cirkovce
00050000-5657-2501-ed1a-01b98095f5af	2282	Cirkulane
00050000-5657-2501-4a88-31a75b03f910	5273	Col
00050000-5657-2501-2165-c38e1255e3b4	8251	Čatež ob Savi
00050000-5657-2501-0926-882d0d1d7496	1413	Čemšenik
00050000-5657-2501-da1a-ce93b2adcce5	5253	Čepovan
00050000-5657-2501-22f0-4ff38ed76779	9232	Črenšovci
00050000-5657-2501-82a1-9805662111ee	2393	Črna na Koroškem
00050000-5657-2501-bf7c-696ab30459d9	6275	Črni Kal
00050000-5657-2501-4f64-0b37e49de545	5274	Črni Vrh nad Idrijo
00050000-5657-2501-56f4-d02f0fd33540	5262	Črniče
00050000-5657-2501-6178-6de637937572	8340	Črnomelj
00050000-5657-2501-2ae1-71168a31fc0b	6271	Dekani
00050000-5657-2501-8497-a4f64ea86e89	5210	Deskle
00050000-5657-2501-5f5a-d2745de2615e	2253	Destrnik
00050000-5657-2501-8628-d86b9a0701ca	6215	Divača
00050000-5657-2501-2c7d-c69ab6b2c508	1233	Dob
00050000-5657-2501-07ed-480b08cf5c61	3224	Dobje pri Planini
00050000-5657-2501-cd21-9e873d33b91a	8257	Dobova
00050000-5657-2501-3ce6-d632388687c2	1423	Dobovec
00050000-5657-2501-1c92-0a5260585d4b	5263	Dobravlje
00050000-5657-2501-90ad-a1827961a9ee	3204	Dobrna
00050000-5657-2501-fd29-7db151822488	8211	Dobrnič
00050000-5657-2501-efd1-40eb46c5e9ee	1356	Dobrova
00050000-5657-2501-5dde-85911ecd24ca	9223	Dobrovnik/Dobronak 
00050000-5657-2501-760f-48a3bdc88ea8	5212	Dobrovo v Brdih
00050000-5657-2501-43f3-577b57e06305	1431	Dol pri Hrastniku
00050000-5657-2501-eca7-963fb46c7f2a	1262	Dol pri Ljubljani
00050000-5657-2501-38ea-2fa6afc89945	1273	Dole pri Litiji
00050000-5657-2501-3c7e-7c90597b5e97	1331	Dolenja vas
00050000-5657-2501-d188-b0a652decb16	8350	Dolenjske Toplice
00050000-5657-2501-a649-aac05b5f33a6	1230	Domžale
00050000-5657-2501-8c9e-ad1a4a51c5d2	2252	Dornava
00050000-5657-2501-8e0e-48cd70608ca9	5294	Dornberk
00050000-5657-2501-9158-759e2b2c128b	1319	Draga
00050000-5657-2501-09a1-5204d89d80f9	8343	Dragatuš
00050000-5657-2501-00c3-17662b59e3c0	3222	Dramlje
00050000-5657-2501-a12e-dbdc68b5c619	2370	Dravograd
00050000-5657-2501-0a61-95a0253182ff	4203	Duplje
00050000-5657-2501-472d-5cab3201d0e2	6221	Dutovlje
00050000-5657-2501-ded2-dbe3d6ad6cc8	8361	Dvor
00050000-5657-2501-a1fc-a030f92d9f63	2343	Fala
00050000-5657-2501-c621-848983bd8cb1	9208	Fokovci
00050000-5657-2501-80b3-cf4c9370cec8	2313	Fram
00050000-5657-2501-03fb-fce466ea91ce	3213	Frankolovo
00050000-5657-2501-2e5b-1c74e44987d2	1274	Gabrovka
00050000-5657-2501-ab61-2ed177913608	8254	Globoko
00050000-5657-2501-7425-d67aa0ab39fd	5275	Godovič
00050000-5657-2501-ce64-b936daf2e1ca	4204	Golnik
00050000-5657-2501-f71a-f7aab476b723	3303	Gomilsko
00050000-5657-2501-f8dd-fb23c9e9d559	4224	Gorenja vas
00050000-5657-2501-cd24-e3e5dc191f7e	3263	Gorica pri Slivnici
00050000-5657-2501-7e5a-8aaebd0e1744	2272	Gorišnica
00050000-5657-2501-e922-45908a70a784	9250	Gornja Radgona
00050000-5657-2501-4c25-a518764beda4	3342	Gornji Grad
00050000-5657-2501-49ae-ddc702ec725a	4282	Gozd Martuljek
00050000-5657-2501-fdfd-fe4547c6491c	6272	Gračišče
00050000-5657-2501-ee1b-c808744f0319	9264	Grad
00050000-5657-2501-4888-834d99c79f83	8332	Gradac
00050000-5657-2501-0899-af943ed23d9c	1384	Grahovo
00050000-5657-2501-d756-255b853163a7	5242	Grahovo ob Bači
00050000-5657-2501-1857-1c36f2b93a38	5251	Grgar
00050000-5657-2501-ae71-d2ac1c77f95d	3302	Griže
00050000-5657-2501-b5a9-c33c65fc0d40	3231	Grobelno
00050000-5657-2501-58c0-dbc5a68668d7	1290	Grosuplje
00050000-5657-2501-aa79-4905fc69f1c1	2288	Hajdina
00050000-5657-2501-a40c-aadc83d679be	8362	Hinje
00050000-5657-2501-348f-503407c185c5	2311	Hoče
00050000-5657-2501-280b-6ab7a7505255	9205	Hodoš/Hodos
00050000-5657-2501-41e5-1103185e1ee5	1354	Horjul
00050000-5657-2501-84c6-e08e2cede0b5	1372	Hotedršica
00050000-5657-2501-e038-acde50cdffbf	1430	Hrastnik
00050000-5657-2501-2f61-51d6978c2cb1	6225	Hruševje
00050000-5657-2501-c27d-91642e13f5fe	4276	Hrušica
00050000-5657-2501-e89f-053132dbcf99	5280	Idrija
00050000-5657-2501-ddcc-55bd75d8cee9	1292	Ig
00050000-5657-2501-b774-767022e91e4c	6250	Ilirska Bistrica
00050000-5657-2501-54bc-be9076804930	6251	Ilirska Bistrica-Trnovo
00050000-5657-2501-83ff-c91e94cd1e71	1295	Ivančna Gorica
00050000-5657-2501-b39a-f369236afbe0	2259	Ivanjkovci
00050000-5657-2501-e957-77afe3ffe7fb	1411	Izlake
00050000-5657-2501-3e3c-b060f183ebbd	6310	Izola/Isola
00050000-5657-2501-31a7-b097ebe2c08c	2222	Jakobski Dol
00050000-5657-2501-6031-346372aedf2b	2221	Jarenina
00050000-5657-2501-66ab-7c1119c4faf6	6254	Jelšane
00050000-5657-2501-c869-ab11e5a36ecc	4270	Jesenice
00050000-5657-2501-1706-8cd7ded08f55	8261	Jesenice na Dolenjskem
00050000-5657-2501-eac2-76745d7510be	3273	Jurklošter
00050000-5657-2501-fb57-07205fd269b3	2223	Jurovski Dol
00050000-5657-2501-9ffb-1d252d10581e	2256	Juršinci
00050000-5657-2501-cd89-a2f9ca55b6ab	5214	Kal nad Kanalom
00050000-5657-2501-404b-e8f64345d896	3233	Kalobje
00050000-5657-2501-73ae-89c1e1e631fa	4246	Kamna Gorica
00050000-5657-2501-fa36-858c0b4b5915	2351	Kamnica
00050000-5657-2501-2c0b-cb69a5e2acd2	1241	Kamnik
00050000-5657-2501-d59d-98dec34a8e87	5213	Kanal
00050000-5657-2501-a467-7de5be1eb39d	8258	Kapele
00050000-5657-2501-a106-2cd701aa6b2a	2362	Kapla
00050000-5657-2501-f39f-17e7ad123983	2325	Kidričevo
00050000-5657-2501-6dad-eee864be5b74	1412	Kisovec
00050000-5657-2501-0e76-dee9e973c72e	6253	Knežak
00050000-5657-2501-6a0a-f4cb60d87dda	5222	Kobarid
00050000-5657-2501-50a8-751aa68087fc	9227	Kobilje
00050000-5657-2501-5438-49debc6b44d2	1330	Kočevje
00050000-5657-2501-72b6-b7d5a398519a	1338	Kočevska Reka
00050000-5657-2501-00fe-a3cf3e4b47df	2276	Kog
00050000-5657-2501-652c-97ea8a813017	5211	Kojsko
00050000-5657-2501-094e-84b80729da0b	6223	Komen
00050000-5657-2501-9708-e7fe7cb148ca	1218	Komenda
00050000-5657-2501-7036-2f0a2dda6903	6000	Koper/Capodistria 
00050000-5657-2501-4170-8eed9afd0f85	6001	Koper/Capodistria - poštni predali
00050000-5657-2501-d230-de4c5c2df53f	8282	Koprivnica
00050000-5657-2501-b779-b7fbcc65123c	5296	Kostanjevica na Krasu
00050000-5657-2501-57d3-479adf604507	8311	Kostanjevica na Krki
00050000-5657-2501-dec1-a56db23b2dcf	1336	Kostel
00050000-5657-2501-d4ae-59548303de1a	6256	Košana
00050000-5657-2501-6e6f-ca518ad619cf	2394	Kotlje
00050000-5657-2501-74ba-d7f4b8285f68	6240	Kozina
00050000-5657-2501-3477-0dd159c3317b	3260	Kozje
00050000-5657-2501-ec91-1e3afecee38e	4000	Kranj 
00050000-5657-2501-75b5-91242470cfe6	4001	Kranj - poštni predali
00050000-5657-2501-abc5-f6bbd5975ee9	4280	Kranjska Gora
00050000-5657-2501-07cf-84847fa6a58b	1281	Kresnice
00050000-5657-2501-e1c3-d3b4e2f3d024	4294	Križe
00050000-5657-2501-846f-2964ca64abc0	9206	Križevci
00050000-5657-2501-d127-81fe76c6125b	9242	Križevci pri Ljutomeru
00050000-5657-2501-9564-e6e9255432db	1301	Krka
00050000-5657-2501-7441-c1119d04f5a7	8296	Krmelj
00050000-5657-2501-26ca-7cb94f05ceca	4245	Kropa
00050000-5657-2501-f5bb-8d8ee87d7556	8262	Krška vas
00050000-5657-2501-a5c8-5e87eb8f24f4	8270	Krško
00050000-5657-2501-3599-1049d0443914	9263	Kuzma
00050000-5657-2501-8107-451cb9eb32bd	2318	Laporje
00050000-5657-2501-fc80-8c4f129c0f46	3270	Laško
00050000-5657-2501-747b-01c93dccdfb8	1219	Laze v Tuhinju
00050000-5657-2501-b6c7-cd923cb8b3b3	2230	Lenart v Slovenskih goricah
00050000-5657-2501-6dde-23e4ad168e8e	9220	Lendava/Lendva
00050000-5657-2501-c9f3-1cade538582e	4248	Lesce
00050000-5657-2501-e938-043536d897c0	3261	Lesično
00050000-5657-2501-bac4-b13bd3f4e481	8273	Leskovec pri Krškem
00050000-5657-2501-f78a-b3d0ecd625c3	2372	Libeliče
00050000-5657-2501-6254-bf2751c2d45a	2341	Limbuš
00050000-5657-2501-ad4e-50e6db07fe2f	1270	Litija
00050000-5657-2501-1ab6-306455150235	3202	Ljubečna
00050000-5657-2501-cfa7-3653681f6dff	1000	Ljubljana 
00050000-5657-2501-cb8a-d69b3c410611	1001	Ljubljana - poštni predali
00050000-5657-2501-457b-ff301e716521	1231	Ljubljana - Črnuče
00050000-5657-2501-d179-5ad03f95ebfc	1261	Ljubljana - Dobrunje
00050000-5657-2501-d980-c419e8e1604b	1260	Ljubljana - Polje
00050000-5657-2501-a520-b54e0df52c08	1210	Ljubljana - Šentvid
00050000-5657-2501-cf20-a54d1e4a19ba	1211	Ljubljana - Šmartno
00050000-5657-2501-a94e-f468faf216f0	3333	Ljubno ob Savinji
00050000-5657-2501-fba9-5f0f225d8160	9240	Ljutomer
00050000-5657-2501-ed7c-b3d4f34f0aa1	3215	Loče
00050000-5657-2501-53df-20d901012aec	5231	Log pod Mangartom
00050000-5657-2501-7c95-4fea16220ea1	1358	Log pri Brezovici
00050000-5657-2501-f0ac-8a4ebdc40206	1370	Logatec
00050000-5657-2501-5d91-8b50c2c58837	1371	Logatec
00050000-5657-2501-c034-02d09ed1986f	1434	Loka pri Zidanem Mostu
00050000-5657-2501-609a-2ac6d827e1a7	3223	Loka pri Žusmu
00050000-5657-2501-0a3d-0f4b02965ddf	6219	Lokev
00050000-5657-2501-d44b-0fb3ad993fea	1318	Loški Potok
00050000-5657-2501-d8f7-71647e345922	2324	Lovrenc na Dravskem polju
00050000-5657-2501-0605-b52529c7e282	2344	Lovrenc na Pohorju
00050000-5657-2501-bced-8e4f942cc19c	3334	Luče
00050000-5657-2501-e2c0-b1d8d058a52c	1225	Lukovica
00050000-5657-2501-ae06-265fa3c086f4	9202	Mačkovci
00050000-5657-2501-92ca-66b4af4d0784	2322	Majšperk
00050000-5657-2501-b07b-4f6375e3db95	2321	Makole
00050000-5657-2501-706f-50fcf60ef844	9243	Mala Nedelja
00050000-5657-2501-56b8-3e6b2cf23a51	2229	Malečnik
00050000-5657-2501-3664-4b3f01d26585	6273	Marezige
00050000-5657-2501-7951-7150df739d0a	2000	Maribor 
00050000-5657-2501-461e-a3c6583e1b68	2001	Maribor - poštni predali
00050000-5657-2501-76a0-c81f98ed6bcf	2206	Marjeta na Dravskem polju
00050000-5657-2501-6bc6-62090a75aa4c	2281	Markovci
00050000-5657-2501-dc4a-d796f7110211	9221	Martjanci
00050000-5657-2501-8788-c847df375b9f	6242	Materija
00050000-5657-2501-d2a3-21897a9f0e65	4211	Mavčiče
00050000-5657-2501-0603-c37408744d86	1215	Medvode
00050000-5657-2501-f989-079126fc6c58	1234	Mengeš
00050000-5657-2501-ddb3-c6c80b2b78a6	8330	Metlika
00050000-5657-2501-c977-0c4e50019326	2392	Mežica
00050000-5657-2501-4956-0269a62e0b98	2204	Miklavž na Dravskem polju
00050000-5657-2501-cbc7-cbcb759960d7	2275	Miklavž pri Ormožu
00050000-5657-2501-48ea-7c0679c72407	5291	Miren
00050000-5657-2501-b1ff-67a11e984b27	8233	Mirna
00050000-5657-2501-b0d9-fc06920d966d	8216	Mirna Peč
00050000-5657-2501-fc56-a9328b9febd9	2382	Mislinja
00050000-5657-2501-3769-09db76a20908	4281	Mojstrana
00050000-5657-2501-0a1d-2cc7884c77ec	8230	Mokronog
00050000-5657-2501-63ed-9c53f1253e8f	1251	Moravče
00050000-5657-2501-c8f8-086c4c08bd95	9226	Moravske Toplice
00050000-5657-2501-cf17-069c32a4e1ba	5216	Most na Soči
00050000-5657-2501-3ac6-d9f2a3f8d4a2	1221	Motnik
00050000-5657-2501-8629-1013809259b8	3330	Mozirje
00050000-5657-2501-9561-6c9c0b4e5fe5	9000	Murska Sobota 
00050000-5657-2501-1606-84b38a291018	9001	Murska Sobota - poštni predali
00050000-5657-2501-0cc4-fcc0615dbb0f	2366	Muta
00050000-5657-2501-9bb4-1741b4610034	4202	Naklo
00050000-5657-2501-a5d8-d34b81b5bb0b	3331	Nazarje
00050000-5657-2501-8181-18ebb1e549da	1357	Notranje Gorice
00050000-5657-2501-dc83-08aa3aa48ae2	3203	Nova Cerkev
00050000-5657-2501-b165-dbd1d2f1fb63	5000	Nova Gorica 
00050000-5657-2501-18ca-41b80d91117e	5001	Nova Gorica - poštni predali
00050000-5657-2501-fa46-7790dcb282a7	1385	Nova vas
00050000-5657-2501-7297-c0eef9a15f35	8000	Novo mesto
00050000-5657-2501-bbae-eb0b2c242d18	8001	Novo mesto - poštni predali
00050000-5657-2501-e528-1448780410bb	6243	Obrov
00050000-5657-2501-08f6-827fb19ef01b	9233	Odranci
00050000-5657-2501-d708-5813aafcda0e	2317	Oplotnica
00050000-5657-2501-ca5c-434a37b7dae7	2312	Orehova vas
00050000-5657-2501-3f13-62334e05758f	2270	Ormož
00050000-5657-2501-cb2e-1a64cdf9dbdc	1316	Ortnek
00050000-5657-2501-8416-556be7720fc8	1337	Osilnica
00050000-5657-2501-edcc-7bb2c1fa4aa1	8222	Otočec
00050000-5657-2501-4278-ad0fe98b906e	2361	Ožbalt
00050000-5657-2501-c671-78c21e5242df	2231	Pernica
00050000-5657-2501-f931-fda726af08d3	2211	Pesnica pri Mariboru
00050000-5657-2501-0d1f-f52a66b65bb8	9203	Petrovci
00050000-5657-2501-9235-70dda81b8ad1	3301	Petrovče
00050000-5657-2501-eaf0-f3d11e73a8a4	6330	Piran/Pirano
00050000-5657-2501-85ce-8062228e2e70	8255	Pišece
00050000-5657-2501-56e0-893a9174c515	6257	Pivka
00050000-5657-2501-dbd5-609dd7827b80	6232	Planina
00050000-5657-2501-84b2-6fcc0bff9521	3225	Planina pri Sevnici
00050000-5657-2501-2673-bd9539f1a0e6	6276	Pobegi
00050000-5657-2501-b364-964d3079b0db	8312	Podbočje
00050000-5657-2501-3d79-89f3793bcba7	5243	Podbrdo
00050000-5657-2501-6667-bbbf483945fe	3254	Podčetrtek
00050000-5657-2501-a45e-286ad0a088ca	2273	Podgorci
00050000-5657-2501-2482-eed0959c798e	6216	Podgorje
00050000-5657-2501-1d50-2244c13489f2	2381	Podgorje pri Slovenj Gradcu
00050000-5657-2501-240e-579a3ee14dd4	6244	Podgrad
00050000-5657-2501-378a-a21f6f926eb4	1414	Podkum
00050000-5657-2501-e7a3-341626e4c16d	2286	Podlehnik
00050000-5657-2501-cb36-5a88eb38bffe	5272	Podnanos
00050000-5657-2501-8c4a-1fbb87d0fe57	4244	Podnart
00050000-5657-2501-51e1-090ebf497016	3241	Podplat
00050000-5657-2501-165c-b960521f865e	3257	Podsreda
00050000-5657-2501-9e84-4d8ab95d643a	2363	Podvelka
00050000-5657-2501-b8f8-8276d6d26058	2208	Pohorje
00050000-5657-2501-db35-aca35b5eddf0	2257	Polenšak
00050000-5657-2501-cce9-57896e7ea4d9	1355	Polhov Gradec
00050000-5657-2501-0c16-629b07fd1670	4223	Poljane nad Škofjo Loko
00050000-5657-2501-849d-9617a9ff7726	2319	Poljčane
00050000-5657-2501-0786-c766b5b4162d	1272	Polšnik
00050000-5657-2501-2c5f-a28ceaaa8081	3313	Polzela
00050000-5657-2501-f183-3b84c58b62b9	3232	Ponikva
00050000-5657-2501-32a1-8e2158c9e813	6320	Portorož/Portorose
00050000-5657-2501-0f36-f072c833e8c4	6230	Postojna
00050000-5657-2501-3a2b-3311987d2789	2331	Pragersko
00050000-5657-2501-04fa-0493ca59cd13	3312	Prebold
00050000-5657-2501-2d1e-f7c67c231fef	4205	Preddvor
00050000-5657-2501-b020-194850163f9e	6255	Prem
00050000-5657-2501-ac5f-2ab4c470b88c	1352	Preserje
00050000-5657-2501-c41f-ff313e2d34a9	6258	Prestranek
00050000-5657-2501-6944-6bb11c8aa3c6	2391	Prevalje
00050000-5657-2501-cc94-a27d1d9d4a24	3262	Prevorje
00050000-5657-2501-e65b-696a103d9688	1276	Primskovo 
00050000-5657-2501-4d36-5acc328912c2	3253	Pristava pri Mestinju
00050000-5657-2501-4a34-c695553aadb2	9207	Prosenjakovci/Partosfalva
00050000-5657-2501-704d-a8b9979d4449	5297	Prvačina
00050000-5657-2501-657f-2ba83f5c3d98	2250	Ptuj
00050000-5657-2501-09a9-ec5db7d8c917	2323	Ptujska Gora
00050000-5657-2501-c921-07db1d6b6d5c	9201	Puconci
00050000-5657-2501-6c4c-819442db916c	2327	Rače
00050000-5657-2501-801e-d68331d91475	1433	Radeče
00050000-5657-2501-38b1-2c0ddb18cb64	9252	Radenci
00050000-5657-2501-fb04-35543f91e189	2360	Radlje ob Dravi
00050000-5657-2501-fc31-095e76bccd5e	1235	Radomlje
00050000-5657-2501-37a3-f36b6742fc0c	4240	Radovljica
00050000-5657-2501-2a7f-d187e484629d	8274	Raka
00050000-5657-2501-fc88-17a7d39d4ace	1381	Rakek
00050000-5657-2501-7302-d344a93d8b1a	4283	Rateče - Planica
00050000-5657-2501-523e-0962994c96fd	2390	Ravne na Koroškem
00050000-5657-2501-2cca-897855d9f50b	9246	Razkrižje
00050000-5657-2501-d64f-69e08b02a4d2	3332	Rečica ob Savinji
00050000-5657-2501-22c7-672c7e625898	5292	Renče
00050000-5657-2501-34f9-12f3c56babf9	1310	Ribnica
00050000-5657-2501-910f-5a0d57ee31b2	2364	Ribnica na Pohorju
00050000-5657-2501-1957-808c50738235	3272	Rimske Toplice
00050000-5657-2501-5a44-4363edad3a3d	1314	Rob
00050000-5657-2501-96a6-5bae69018cc8	5215	Ročinj
00050000-5657-2501-d1f4-79da043aa38e	3250	Rogaška Slatina
00050000-5657-2501-dc61-3e07cb7e783f	9262	Rogašovci
00050000-5657-2501-d81d-8a5cfbeee8ea	3252	Rogatec
00050000-5657-2501-03e9-fe8e8fb69700	1373	Rovte
00050000-5657-2501-7991-728c5e9bc54a	2342	Ruše
00050000-5657-2501-b0e0-eb04b0ddb242	1282	Sava
00050000-5657-2501-ea15-9767cb7df2a6	6333	Sečovlje/Sicciole
00050000-5657-2501-87a2-63fa3d3d4811	4227	Selca
00050000-5657-2501-dd52-6ef13ed09674	2352	Selnica ob Dravi
00050000-5657-2501-2a8d-d748e081ee68	8333	Semič
00050000-5657-2501-b9b5-40ef7422263c	8281	Senovo
00050000-5657-2501-abd3-fd016f4de997	6224	Senožeče
00050000-5657-2501-8480-1265992574d7	8290	Sevnica
00050000-5657-2501-390b-c217d7835754	6210	Sežana
00050000-5657-2501-db69-9f1242845a17	2214	Sladki Vrh
00050000-5657-2501-7c19-96f68e142733	5283	Slap ob Idrijci
00050000-5657-2501-5563-3ddf60c74c68	2380	Slovenj Gradec
00050000-5657-2501-c1a4-7df33810affd	2310	Slovenska Bistrica
00050000-5657-2501-6411-46bec8b30aec	3210	Slovenske Konjice
00050000-5657-2501-d4a7-229c8107262e	1216	Smlednik
00050000-5657-2501-deb8-9e6727939004	5232	Soča
00050000-5657-2501-daa6-7bd1ced3fe74	1317	Sodražica
00050000-5657-2501-2e97-713d7927e759	3335	Solčava
00050000-5657-2501-099c-a3f2ebeaffd9	5250	Solkan
00050000-5657-2501-0d0a-7050f245e9ab	4229	Sorica
00050000-5657-2501-f44e-319fe8de659e	4225	Sovodenj
00050000-5657-2501-fad5-6a3bdc3b3fe2	5281	Spodnja Idrija
00050000-5657-2501-3763-344969eed73d	2241	Spodnji Duplek
00050000-5657-2501-4b31-c90b7bce420c	9245	Spodnji Ivanjci
00050000-5657-2501-1e9b-440e6d2002f6	2277	Središče ob Dravi
00050000-5657-2501-3159-918af6b2213a	4267	Srednja vas v Bohinju
00050000-5657-2501-10cf-8bc07d2c93dc	8256	Sromlje 
00050000-5657-2501-4a6c-be78622d3bdd	5224	Srpenica
00050000-5657-2501-718b-7e2ef1c312f3	1242	Stahovica
00050000-5657-2501-5dd0-d9df7beb0ce4	1332	Stara Cerkev
00050000-5657-2501-bc07-bdd4f1e44071	8342	Stari trg ob Kolpi
00050000-5657-2501-6cf4-738a3b485e63	1386	Stari trg pri Ložu
00050000-5657-2501-1c54-da4dce3604c0	2205	Starše
00050000-5657-2501-5c89-dfb4e49ab662	2289	Stoperce
00050000-5657-2501-bc3e-19d7088da90a	8322	Stopiče
00050000-5657-2501-13c6-0b9fe46a5de7	3206	Stranice
00050000-5657-2501-ab6e-2068a485d690	8351	Straža
00050000-5657-2501-d7bd-d59caf0cb1b6	1313	Struge
00050000-5657-2501-b264-ffd0d44da609	8293	Studenec
00050000-5657-2501-44a2-0f6212fa2ffc	8331	Suhor
00050000-5657-2501-f4d1-13f06b8e5d2b	2233	Sv. Ana v Slovenskih goricah
00050000-5657-2501-e50d-327b15c03a0a	2235	Sv. Trojica v Slovenskih goricah
00050000-5657-2501-8ece-2418a951c1b5	2353	Sveti Duh na Ostrem Vrhu
00050000-5657-2501-7922-01c30b3a72d2	9244	Sveti Jurij ob Ščavnici
00050000-5657-2501-4503-8a0e1e512d9a	3264	Sveti Štefan
00050000-5657-2501-2f70-d1d47b82a73f	2258	Sveti Tomaž
00050000-5657-2501-4d72-3e9018f43cd4	9204	Šalovci
00050000-5657-2501-ccb0-e4f79712aefa	5261	Šempas
00050000-5657-2501-a606-07df13c36a8f	5290	Šempeter pri Gorici
00050000-5657-2501-b2e7-63468994c888	3311	Šempeter v Savinjski dolini
00050000-5657-2501-c612-421f89b4c9ea	4208	Šenčur
00050000-5657-2501-9e48-230374b2c134	2212	Šentilj v Slovenskih goricah
00050000-5657-2501-5d42-86991f3361be	8297	Šentjanž
00050000-5657-2501-0bb1-cee4213c12b3	2373	Šentjanž pri Dravogradu
00050000-5657-2501-a1ae-edfcaf40134f	8310	Šentjernej
00050000-5657-2501-1707-fb6b4b3f4201	3230	Šentjur
00050000-5657-2501-7f13-b2542eb5fa03	3271	Šentrupert
00050000-5657-2501-0a9a-b66ef58e769d	8232	Šentrupert
00050000-5657-2501-d2b5-1d34a9142dce	1296	Šentvid pri Stični
00050000-5657-2501-d3d3-d411eca8a734	8275	Škocjan
00050000-5657-2501-fc69-d951fbf80315	6281	Škofije
00050000-5657-2501-30fe-e3471c244201	4220	Škofja Loka
00050000-5657-2501-2f1a-fcd6d3cf6fcb	3211	Škofja vas
00050000-5657-2501-d552-6df500cdacd7	1291	Škofljica
00050000-5657-2501-0abd-f11f76b12dee	6274	Šmarje
00050000-5657-2501-4e38-1eca8024d41f	1293	Šmarje - Sap
00050000-5657-2501-2516-afc50668acb6	3240	Šmarje pri Jelšah
00050000-5657-2501-545d-7e9dfb75a832	8220	Šmarješke Toplice
00050000-5657-2501-0b41-11b1d4ff2782	2315	Šmartno na Pohorju
00050000-5657-2501-787e-d302c3ca7fe0	3341	Šmartno ob Dreti
00050000-5657-2501-3ee9-7ac9f28c4fa8	3327	Šmartno ob Paki
00050000-5657-2501-aa4d-9213fd2a2b29	1275	Šmartno pri Litiji
00050000-5657-2501-0566-c310175e9d17	2383	Šmartno pri Slovenj Gradcu
00050000-5657-2501-8428-b2b1789a5815	3201	Šmartno v Rožni dolini
00050000-5657-2501-f2b9-ed788c0f8bc7	3325	Šoštanj
00050000-5657-2501-7459-6e2e7ef38a03	6222	Štanjel
00050000-5657-2501-a4c0-f9cd56b123e5	3220	Štore
00050000-5657-2501-5fec-d7344c195ddf	3304	Tabor
00050000-5657-2501-0b43-5c9ed8e1d8b1	3221	Teharje
00050000-5657-2501-5539-5169dc0c5d19	9251	Tišina
00050000-5657-2501-d4c1-caaef4de7742	5220	Tolmin
00050000-5657-2501-2fe0-2a15bb4551ff	3326	Topolšica
00050000-5657-2501-95c1-44fa970539be	2371	Trbonje
00050000-5657-2501-2cdc-a7450ea8907c	1420	Trbovlje
00050000-5657-2501-98b9-b4d0ad0271fd	8231	Trebelno 
00050000-5657-2501-08bd-2a4ed1f0ed05	8210	Trebnje
00050000-5657-2501-f8f9-5b5b3b9de266	5252	Trnovo pri Gorici
00050000-5657-2501-2021-a2b07164169f	2254	Trnovska vas
00050000-5657-2501-8637-14b714ad64d8	1222	Trojane
00050000-5657-2501-153d-745db0ae4e89	1236	Trzin
00050000-5657-2501-0a01-c08d9a3bafda	4290	Tržič
00050000-5657-2501-4b94-6c7ac03564a2	8295	Tržišče
00050000-5657-2501-ad02-d3f608b3bcf7	1311	Turjak
00050000-5657-2501-1554-6890858626a5	9224	Turnišče
00050000-5657-2501-9f5e-91f8641bec3f	8323	Uršna sela
00050000-5657-2501-6019-775a6101b0ea	1252	Vače
00050000-5657-2501-2759-8e1327d814e9	3320	Velenje 
00050000-5657-2501-62b4-d0f2e6794a32	3322	Velenje - poštni predali
00050000-5657-2501-24a8-b69c12ddae03	8212	Velika Loka
00050000-5657-2501-0ec3-d329c4b0ccfb	2274	Velika Nedelja
00050000-5657-2501-4625-103a78028f7d	9225	Velika Polana
00050000-5657-2501-63f1-9d507e49442a	1315	Velike Lašče
00050000-5657-2501-1204-c870bf8463d7	8213	Veliki Gaber
00050000-5657-2501-1e9b-9358d7afeab9	9241	Veržej
00050000-5657-2501-5076-22337a66c0c3	1312	Videm - Dobrepolje
00050000-5657-2501-067e-8777b7b243b6	2284	Videm pri Ptuju
00050000-5657-2501-7996-f63452ed09ab	8344	Vinica
00050000-5657-2501-ba66-8dc522cfbd32	5271	Vipava
00050000-5657-2501-7d11-3fb5869144a2	4212	Visoko
00050000-5657-2501-0637-c60b4789a700	1294	Višnja Gora
00050000-5657-2501-4463-cbfb8840cdb5	3205	Vitanje
00050000-5657-2501-2f04-381a348fa095	2255	Vitomarci
00050000-5657-2501-c0f6-ed3004a970db	1217	Vodice
00050000-5657-2501-a1a9-247def76f587	3212	Vojnik\t
00050000-5657-2501-e639-b3467470f301	5293	Volčja Draga
00050000-5657-2501-8f66-a475957b62f6	2232	Voličina
00050000-5657-2501-308d-376296da19b5	3305	Vransko
00050000-5657-2501-68aa-27ab28682814	6217	Vremski Britof
00050000-5657-2501-4722-c0b34ea9abc1	1360	Vrhnika
00050000-5657-2501-4ae3-4f31af07a681	2365	Vuhred
00050000-5657-2501-2093-655741be9bd7	2367	Vuzenica
00050000-5657-2501-a0a8-899079d02b52	8292	Zabukovje 
00050000-5657-2501-23d5-065b6c4f0eb5	1410	Zagorje ob Savi
00050000-5657-2501-90dc-ec9dabecb72b	1303	Zagradec
00050000-5657-2501-a2b9-c383718504fa	2283	Zavrč
00050000-5657-2501-f172-f3de04c6fcdc	8272	Zdole 
00050000-5657-2501-ef21-5d39597872ac	4201	Zgornja Besnica
00050000-5657-2501-3697-1b270f9088d4	2242	Zgornja Korena
00050000-5657-2501-46ba-afd26755a559	2201	Zgornja Kungota
00050000-5657-2501-1d6e-fca3005d4913	2316	Zgornja Ložnica
00050000-5657-2501-7ef3-e91835cc654e	2314	Zgornja Polskava
00050000-5657-2501-6855-16dc08c6fbff	2213	Zgornja Velka
00050000-5657-2501-2afa-e396575fbead	4247	Zgornje Gorje
00050000-5657-2501-316b-b4595f716ee8	4206	Zgornje Jezersko
00050000-5657-2501-71a3-e83570f1e41e	2285	Zgornji Leskovec
00050000-5657-2501-9b3b-ff20a1ec0ddc	1432	Zidani Most
00050000-5657-2501-48e0-696609f51e99	3214	Zreče
00050000-5657-2501-a7a8-027c5c92cad3	4209	Žabnica
00050000-5657-2501-8901-8e65e5409ed8	3310	Žalec
00050000-5657-2501-8559-1714b136bf4d	4228	Železniki
00050000-5657-2501-3185-9b67b486b7a9	2287	Žetale
00050000-5657-2501-2fdf-1c87aac40ac2	4226	Žiri
00050000-5657-2501-60b4-7ef22aa1e912	4274	Žirovnica
00050000-5657-2501-9740-7176b36415d6	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 29718021)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 29717597)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 29717345)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5657-2504-57ac-d35539fa2774	00080000-5657-2504-3749-89271569afb1	\N	00040000-5657-2502-9f78-4e081d698b62	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5657-2504-166b-6677dbc36ce2	00080000-5657-2504-3749-89271569afb1	\N	00040000-5657-2502-9f78-4e081d698b62	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5657-2504-b003-66268051be6f	00080000-5657-2504-744f-ec709015f155	\N	00040000-5657-2502-9f78-4e081d698b62	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 29717489)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5657-2502-640a-90617f12c9e5	novo leto	1	1	\N	t
00430000-5657-2502-083a-ab6c82d8ff8d	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5657-2502-e7b5-9571a93927f3	dan upora proti okupatorju	27	4	\N	t
00430000-5657-2502-9538-4459c1a9e658	praznik dela	1	5	\N	t
00430000-5657-2502-edd0-d63be5198b2d	praznik dela	2	5	\N	t
00430000-5657-2502-cdb8-ad96d5cc64c4	dan Primoža Trubarja	8	6	\N	f
00430000-5657-2502-8a7f-3700c8e6bb4b	dan državnosti	25	6	\N	t
00430000-5657-2502-d672-c33d7527e63c	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5657-2502-d563-1048fd065f63	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5657-2502-6f8d-d9453dcd6749	dan suverenosti	25	10	\N	f
00430000-5657-2502-b04b-92c6a0d1602a	dan spomina na mrtve	1	11	\N	t
00430000-5657-2502-898d-0dbb2c096cd9	dan Rudolfa Maistra	23	11	\N	f
00430000-5657-2502-596b-812232fb2593	božič	25	12	\N	t
00430000-5657-2502-c342-1c5b219dbf1b	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5657-2502-3331-6f3329518c3a	Marijino vnebovzetje	15	8	\N	t
00430000-5657-2502-1779-02158599db67	dan reformacije	31	10	\N	t
00430000-5657-2502-8cac-62572f8b4cc5	velikonočna nedelja	27	3	2016	t
00430000-5657-2502-c076-b1078b084ba7	velikonočna nedelja	16	4	2017	t
00430000-5657-2502-a273-924f9f9f69ae	velikonočna nedelja	1	4	2018	t
00430000-5657-2502-a7ae-a9087c9690ef	velikonočna nedelja	21	4	2019	t
00430000-5657-2502-16c6-8c75cd84bf2e	velikonočna nedelja	12	4	2020	t
00430000-5657-2502-d432-6d3de1a6cce9	velikonočna nedelja	4	4	2021	t
00430000-5657-2502-b077-a4dc39b4b6f6	velikonočna nedelja	17	4	2022	t
00430000-5657-2502-163c-069fd9f3e1d8	velikonočna nedelja	9	4	2023	t
00430000-5657-2502-ed8d-10379f720c39	velikonočna nedelja	31	3	2024	t
00430000-5657-2502-c583-e47b16fef1e7	velikonočna nedelja	20	4	2025	t
00430000-5657-2502-cb1c-e6cb04feaeff	velikonočna nedelja	5	4	2026	t
00430000-5657-2502-94c3-312ac3270aa9	velikonočna nedelja	28	3	2027	t
00430000-5657-2502-b087-cf41fa6d07d1	velikonočna nedelja	16	4	2028	t
00430000-5657-2502-b78b-89d1784251e1	velikonočna nedelja	1	4	2029	t
00430000-5657-2502-0d4f-1c576a34b34f	velikonočna nedelja	21	4	2030	t
00430000-5657-2502-8358-210a49db73bb	velikonočni ponedeljek	28	3	2016	t
00430000-5657-2502-a897-2c47402470f1	velikonočni ponedeljek	17	4	2017	t
00430000-5657-2502-6638-786c29feea08	velikonočni ponedeljek	2	4	2018	t
00430000-5657-2502-da8f-cd97bc05ba0a	velikonočni ponedeljek	22	4	2019	t
00430000-5657-2502-e8c9-38b1308af4cd	velikonočni ponedeljek	13	4	2020	t
00430000-5657-2502-cbbc-8a922d0720b4	velikonočni ponedeljek	5	4	2021	t
00430000-5657-2502-5e43-2e6df806e54f	velikonočni ponedeljek	18	4	2022	t
00430000-5657-2502-29d2-edfa2381a4dc	velikonočni ponedeljek	10	4	2023	t
00430000-5657-2502-601f-7d266b002d4b	velikonočni ponedeljek	1	4	2024	t
00430000-5657-2502-de6f-5a868d201205	velikonočni ponedeljek	21	4	2025	t
00430000-5657-2502-535c-747d84a04c12	velikonočni ponedeljek	6	4	2026	t
00430000-5657-2502-3066-50874cb4db7d	velikonočni ponedeljek	29	3	2027	t
00430000-5657-2502-72c3-5797b8b02d7f	velikonočni ponedeljek	17	4	2028	t
00430000-5657-2502-8a86-39b6dd182689	velikonočni ponedeljek	2	4	2029	t
00430000-5657-2502-da8c-dd19e4350800	velikonočni ponedeljek	22	4	2030	t
00430000-5657-2502-fb84-abe6c18f357c	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5657-2502-4a6a-1204abae6a8d	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5657-2502-c7ca-d9e8c7c61855	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5657-2502-3bfb-2e3218f0c207	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5657-2502-fccf-07a97186e59a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5657-2502-5c57-1475b56d96c4	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5657-2502-fc8c-7aafe5515c77	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5657-2502-3640-c9c40f7b595d	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5657-2502-ec48-d5166977061d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5657-2502-e764-7af583e36361	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5657-2502-b673-1b7e0df9264c	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5657-2502-9d43-2d8ed4b9b19e	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5657-2502-8d53-1414b84d43ef	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5657-2502-610b-97a5304ba27e	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5657-2502-566a-5f093c561d9d	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 29717449)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 29717461)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 29717609)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 29718035)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 29718045)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5657-2505-7593-25173c4b88c7	00080000-5657-2504-9dd5-868be64b18d2	0987	AK
00190000-5657-2505-2821-de292dd059fb	00080000-5657-2504-744f-ec709015f155	0989	AK
00190000-5657-2505-b379-70f86bc5c554	00080000-5657-2504-f626-b59231586dde	0986	AK
00190000-5657-2505-24c2-a17bd222d408	00080000-5657-2504-c195-4cc3a1334365	0984	AK
00190000-5657-2505-e444-e28f55e1738a	00080000-5657-2504-de9f-05cfcf0a0a02	0983	AK
00190000-5657-2505-402c-2a1a867aa6cd	00080000-5657-2504-fb51-731c9dca70ec	0982	AK
00190000-5657-2506-6da5-200c83b95b6a	00080000-5657-2506-47ad-0a3b009c0ef5	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 29717944)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5657-2505-76e7-7cb25dc38955	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 29718053)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 29717638)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5657-2504-6de6-b05d20864fbb	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5657-2504-a0e1-40ac71fb4fc3	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5657-2504-4543-8f244e038a35	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5657-2504-8a98-a739c40cb03e	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5657-2504-5d46-d72e5642e988	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5657-2504-70e4-f6e9d92f4742	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5657-2504-1491-e0dd5f7f134a	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 29717582)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 29717572)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 29717783)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 29717713)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 29717423)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 29717182)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5657-2506-47ad-0a3b009c0ef5	00010000-5657-2502-2c50-a0e3dea3e41b	2015-11-26 16:28:06	INS	a:0:{}
2	App\\Entity\\Option	00000000-5657-2506-30cf-43ea3e8b5486	00010000-5657-2502-2c50-a0e3dea3e41b	2015-11-26 16:28:06	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5657-2506-6da5-200c83b95b6a	00010000-5657-2502-2c50-a0e3dea3e41b	2015-11-26 16:28:06	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 29717651)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 29717221)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5657-2502-0573-f0081e286c8f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5657-2502-52de-02edd5ce83b8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5657-2502-668a-c3206ecfa942	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5657-2502-adcc-849c65d9a91d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5657-2502-6ec3-08701dc94eaa	planer	Planer dogodkov v koledarju	t
00020000-5657-2502-e935-02115eef35c7	kadrovska	Kadrovska služba	t
00020000-5657-2502-db55-485e26b2d5d8	arhivar	Ažuriranje arhivalij	t
00020000-5657-2502-8bc4-33ed2855f047	igralec	Igralec	t
00020000-5657-2502-1bad-3f891d8e1f94	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5657-2504-a58a-c045ab2208f2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5657-2504-4c15-a5ff2813bd42	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5657-2504-db21-33e08287a99f	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5657-2504-50c5-620e58967e79	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5657-2504-e667-d941cfb4baec	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5657-2504-c8d1-2ed7f986b206	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5657-2504-27f2-58a2e5b1b499	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5657-2504-d024-bdcc59ffc1f1	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5657-2504-0c2b-8ccf31905717	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5657-2504-158e-f890396be079	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5657-2504-61d0-5cc17c059eb3	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5657-2504-4a46-afe9f2cc65b6	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5657-2504-6121-b839dfcde895	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5657-2504-050e-53f970b2d05a	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5657-2504-2e44-158aa2dde4c3	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5657-2504-4e3c-fa847c44e53e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5657-2504-41ae-404e0d50dcbe	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5657-2504-9a6a-e5318b99bdd3	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5657-2504-b368-b09ed8a708e2	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5657-2504-68cd-ecfc2a3a4435	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5657-2504-1f17-2d2b16427096	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5657-2504-a7a3-0aab0ce87d63	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5657-2504-9166-56967e7e5970	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5657-2504-9dbf-a344fd514794	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5657-2504-f422-850c1e172260	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5657-2504-88c6-8e9b7f93ce36	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5657-2504-0c9c-adfabcb8c0fd	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5657-2504-3a38-868b1d1fbe99	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5657-2504-e2b1-15d2856de578	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5657-2504-8147-d71d3c2e9355	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5657-2504-25cc-bfae7557b4fe	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5657-2504-6fd4-0fd863ed66a6	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5657-2504-eb03-255dc9d9dddb	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5657-2504-daa6-a288a0a5fdf9	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5657-2504-fba7-19df80bc85b0	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5657-2504-443f-fbf026920bff	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5657-2504-80fd-e1e55e4f3075	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5657-2504-6ee2-042fcd6c6a2e	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5657-2504-311f-97908d731fb0	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5657-2504-f0bc-41a946c2e3f5	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5657-2504-c1f3-35f742a954fe	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5657-2504-5027-fec600e3a5ad	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5657-2504-caa4-7da871c0cbfe	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5657-2504-8a11-d3b906f3c861	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5657-2504-0b52-7f09f0049715	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5657-2504-2195-5e3a508feb08	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5657-2504-3cbb-69abc585c85f	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5657-2504-e993-59117afad64b	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5657-2504-9410-527542f2004a	mn-produkcija-stroskovnik-	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5657-2504-80c9-8e8036ea5ab5	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5657-2504-6be6-118d64180b1b	mn-produkcija-stroskovnik-splosno	omogoča akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5657-2504-f347-49af2e232d1c	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5657-2504-6a9c-f5fbf105bde1	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5657-2504-449c-3c3f7874190c	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
\.


--
-- TOC entry 3099 (class 0 OID 29717205)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5657-2502-40a1-207905f4ac92	00020000-5657-2502-668a-c3206ecfa942
00010000-5657-2502-2c50-a0e3dea3e41b	00020000-5657-2502-668a-c3206ecfa942
00010000-5657-2504-4728-467fc123964d	00020000-5657-2504-a58a-c045ab2208f2
00010000-5657-2504-6b3d-5724a1189dd9	00020000-5657-2504-4c15-a5ff2813bd42
00010000-5657-2504-6b3d-5724a1189dd9	00020000-5657-2504-c8d1-2ed7f986b206
00010000-5657-2504-6b3d-5724a1189dd9	00020000-5657-2504-158e-f890396be079
00010000-5657-2504-6b3d-5724a1189dd9	00020000-5657-2504-4a46-afe9f2cc65b6
00010000-5657-2504-6b3d-5724a1189dd9	00020000-5657-2504-2e44-158aa2dde4c3
00010000-5657-2504-6b3d-5724a1189dd9	00020000-5657-2504-41ae-404e0d50dcbe
00010000-5657-2504-6b3d-5724a1189dd9	00020000-5657-2504-50c5-620e58967e79
00010000-5657-2504-bf48-e3eafad0d5e2	00020000-5657-2504-4c15-a5ff2813bd42
00010000-5657-2504-bf48-e3eafad0d5e2	00020000-5657-2504-db21-33e08287a99f
00010000-5657-2504-bf48-e3eafad0d5e2	00020000-5657-2504-50c5-620e58967e79
00010000-5657-2504-bf48-e3eafad0d5e2	00020000-5657-2504-e667-d941cfb4baec
00010000-5657-2504-a808-80c747dc7c60	00020000-5657-2504-4c15-a5ff2813bd42
00010000-5657-2504-a808-80c747dc7c60	00020000-5657-2504-db21-33e08287a99f
00010000-5657-2504-a808-80c747dc7c60	00020000-5657-2504-50c5-620e58967e79
00010000-5657-2504-a808-80c747dc7c60	00020000-5657-2504-e667-d941cfb4baec
00010000-5657-2504-a808-80c747dc7c60	00020000-5657-2504-4a46-afe9f2cc65b6
00010000-5657-2504-0f97-ad358a728577	00020000-5657-2504-db21-33e08287a99f
00010000-5657-2504-0f97-ad358a728577	00020000-5657-2504-27f2-58a2e5b1b499
00010000-5657-2504-0f97-ad358a728577	00020000-5657-2504-61d0-5cc17c059eb3
00010000-5657-2504-0f97-ad358a728577	00020000-5657-2504-6121-b839dfcde895
00010000-5657-2504-0f97-ad358a728577	00020000-5657-2504-4a46-afe9f2cc65b6
00010000-5657-2504-0f97-ad358a728577	00020000-5657-2504-4e3c-fa847c44e53e
00010000-5657-2504-4acc-63a65ea705cf	00020000-5657-2504-db21-33e08287a99f
00010000-5657-2504-4acc-63a65ea705cf	00020000-5657-2504-27f2-58a2e5b1b499
00010000-5657-2504-4acc-63a65ea705cf	00020000-5657-2504-0c2b-8ccf31905717
00010000-5657-2504-4acc-63a65ea705cf	00020000-5657-2504-61d0-5cc17c059eb3
00010000-5657-2504-4acc-63a65ea705cf	00020000-5657-2504-6121-b839dfcde895
00010000-5657-2504-4acc-63a65ea705cf	00020000-5657-2504-4a46-afe9f2cc65b6
00010000-5657-2504-4acc-63a65ea705cf	00020000-5657-2504-4e3c-fa847c44e53e
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-db21-33e08287a99f
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-50c5-620e58967e79
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-27f2-58a2e5b1b499
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-d024-bdcc59ffc1f1
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-0c2b-8ccf31905717
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-c8d1-2ed7f986b206
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-61d0-5cc17c059eb3
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-6121-b839dfcde895
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-4a46-afe9f2cc65b6
00010000-5657-2504-4ec1-1c28ecf6a545	00020000-5657-2504-4e3c-fa847c44e53e
00010000-5657-2504-cabe-9da317e19866	00020000-5657-2504-4c15-a5ff2813bd42
00010000-5657-2504-cabe-9da317e19866	00020000-5657-2504-e667-d941cfb4baec
00010000-5657-2504-cabe-9da317e19866	00020000-5657-2504-c8d1-2ed7f986b206
00010000-5657-2504-cabe-9da317e19866	00020000-5657-2504-158e-f890396be079
00010000-5657-2504-cabe-9da317e19866	00020000-5657-2504-4a46-afe9f2cc65b6
00010000-5657-2504-cabe-9da317e19866	00020000-5657-2504-2e44-158aa2dde4c3
00010000-5657-2504-cabe-9da317e19866	00020000-5657-2504-41ae-404e0d50dcbe
00010000-5657-2504-897d-5c0883b5d5c2	00020000-5657-2504-9a6a-e5318b99bdd3
\.


--
-- TOC entry 3144 (class 0 OID 29717665)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 29717603)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 29717549)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5657-2504-cd39-2e9151affe11	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5657-2504-f860-231dd434ade0	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5657-2504-d644-91c4c7c715ed	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 29717169)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5657-2502-8eff-5009516ccdb1	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5657-2502-3ba0-d751dab49c5e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5657-2502-ac98-deeb86156476	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5657-2502-e59d-3d30a132093a	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5657-2502-714c-ad0fb6a71ff2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 29717161)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5657-2502-6568-9a64d1906793	00230000-5657-2502-e59d-3d30a132093a	popa
00240000-5657-2502-1109-6ddc202990f6	00230000-5657-2502-e59d-3d30a132093a	oseba
00240000-5657-2502-f054-79d0f383481b	00230000-5657-2502-e59d-3d30a132093a	tippopa
00240000-5657-2502-81db-f6bfb2e9aefa	00230000-5657-2502-e59d-3d30a132093a	organizacijskaenota
00240000-5657-2502-cfdf-60c8cd7075b2	00230000-5657-2502-e59d-3d30a132093a	sezona
00240000-5657-2502-c0d1-085b21e0c3c9	00230000-5657-2502-e59d-3d30a132093a	tipvaje
00240000-5657-2502-baf3-a0fc3e8eff28	00230000-5657-2502-3ba0-d751dab49c5e	prostor
00240000-5657-2502-9855-e4736886b3d8	00230000-5657-2502-e59d-3d30a132093a	besedilo
00240000-5657-2502-09ac-ba6073adb211	00230000-5657-2502-e59d-3d30a132093a	uprizoritev
00240000-5657-2502-023a-809dc938edbe	00230000-5657-2502-e59d-3d30a132093a	funkcija
00240000-5657-2502-fd18-f42881bf387c	00230000-5657-2502-e59d-3d30a132093a	tipfunkcije
00240000-5657-2502-6a03-8891f8ee5742	00230000-5657-2502-e59d-3d30a132093a	alternacija
00240000-5657-2502-7e61-7089885ff7ba	00230000-5657-2502-8eff-5009516ccdb1	pogodba
00240000-5657-2502-3b73-44f31c915992	00230000-5657-2502-e59d-3d30a132093a	zaposlitev
00240000-5657-2502-2b9c-45ab7dfb6561	00230000-5657-2502-e59d-3d30a132093a	zvrstuprizoritve
00240000-5657-2502-af44-29234d02ab69	00230000-5657-2502-8eff-5009516ccdb1	programdela
00240000-5657-2502-8ebf-fc01730cd7d5	00230000-5657-2502-e59d-3d30a132093a	zapis
\.


--
-- TOC entry 3093 (class 0 OID 29717156)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f33cee97-0710-4c80-a10d-1f944948772a	00240000-5657-2502-6568-9a64d1906793	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 29717730)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5657-2505-ca40-e53d3511c7f6	000e0000-5657-2505-6f0f-ee6b9dd094a5	00080000-5657-2504-3749-89271569afb1	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5657-2502-e363-bca0094ea99e
00270000-5657-2505-7879-9310418846b1	000e0000-5657-2505-6f0f-ee6b9dd094a5	00080000-5657-2504-3749-89271569afb1	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5657-2502-e363-bca0094ea99e
\.


--
-- TOC entry 3109 (class 0 OID 29717305)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 29717559)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5657-2505-15a9-f5befc6e3195	00180000-5657-2505-fa70-433d9e5a672a	000c0000-5657-2505-eec8-12307b0c95da	00090000-5657-2504-319f-2a8178a78b87	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5657-2505-3f8f-d751d6f1b6fb	00180000-5657-2505-fa70-433d9e5a672a	000c0000-5657-2505-ada7-781f8c313a37	00090000-5657-2505-0e81-8b6da52350b6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5657-2505-df16-7dd3c3c90a6e	00180000-5657-2505-fa70-433d9e5a672a	000c0000-5657-2505-3f53-2732406146a2	00090000-5657-2504-5be3-6b25b68b3eff	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5657-2505-71b7-75c62d2a11fa	00180000-5657-2505-fa70-433d9e5a672a	000c0000-5657-2505-f04a-6b20cb6b5780	00090000-5657-2504-6c73-de67f9f19f05	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5657-2505-5ce6-827b21579778	00180000-5657-2505-fa70-433d9e5a672a	000c0000-5657-2505-23f8-e12a935449bf	00090000-5657-2505-ee08-809ab3097a75	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5657-2505-548a-8d76dd600435	00180000-5657-2505-2b3a-11e05fa9419d	\N	00090000-5657-2505-ee08-809ab3097a75	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5657-2505-b2f3-2b06c84c05b9	00180000-5657-2505-2b3a-11e05fa9419d	\N	00090000-5657-2505-0e81-8b6da52350b6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 29717771)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5657-2502-b417-a70666463501	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5657-2502-71cf-0f2f39b82247	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5657-2502-867b-0605517fca18	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5657-2502-48fc-fe011e73f7ca	04	Režija	Režija	Režija	umetnik	30
000f0000-5657-2502-ba7c-2f5945ec4c3a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5657-2502-ab5b-144aadfa1524	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5657-2502-046c-86b83adc129b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5657-2502-95ff-a740bc9517c3	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5657-2502-2ec3-27a3a811f3d4	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5657-2502-00ed-43646f6fe1c7	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5657-2502-3599-1bcd504a3ac8	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5657-2502-b59d-9d29e50515e6	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5657-2502-6a75-63ccc79077db	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5657-2502-bd2b-3ea9f4b9343b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5657-2502-b4aa-04f3b906e3ba	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5657-2502-965f-56fb1594d43e	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5657-2502-6712-20103cafb13e	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5657-2502-883c-12c86253ea34	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 29717256)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5657-2504-7a00-d1ba57bff394	0001	šola	osnovna ali srednja šola
00400000-5657-2504-e5c5-719335da44af	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5657-2504-71dd-7b77333fb54c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 29718064)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5657-2502-3ad2-a4956aba43a9	01	Velika predstava	f	1.00	1.00
002b0000-5657-2502-e972-ad31f929e273	02	Mala predstava	f	0.50	0.50
002b0000-5657-2502-a17a-28977ec0e8a5	03	Mala koprodukcija	t	0.40	1.00
002b0000-5657-2502-0ceb-9e46d994cc18	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5657-2502-4084-3254b1cd7593	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 29717539)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5657-2502-50b7-cfd69ff8f64e	0001	prva vaja	prva vaja
00420000-5657-2502-60ab-2c350a312d70	0002	tehnična vaja	tehnična vaja
00420000-5657-2502-6695-fbc5d1dd7f39	0003	lučna vaja	lučna vaja
00420000-5657-2502-f259-87bdce4c02f9	0004	kostumska vaja	kostumska vaja
00420000-5657-2502-f8dd-20f039104ea6	0005	foto vaja	foto vaja
00420000-5657-2502-2a00-4cfd43c03cc7	0006	1. glavna vaja	1. glavna vaja
00420000-5657-2502-da27-70e4cbdb0b28	0007	2. glavna vaja	2. glavna vaja
00420000-5657-2502-44c5-1f8704ace369	0008	1. generalka	1. generalka
00420000-5657-2502-a47d-6c4cbb038aa0	0009	2. generalka	2. generalka
00420000-5657-2502-ea63-db01259f9005	0010	odprta generalka	odprta generalka
00420000-5657-2502-b50b-ccef791bddfa	0011	obnovitvena vaja	obnovitvena vaja
00420000-5657-2502-5c2c-02a6317754f0	0012	pevska vaja	pevska vaja
00420000-5657-2502-c062-a04d01ddb5cc	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5657-2502-f585-11654ac2c31d	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 29717380)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 29717191)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5657-2502-2c50-a0e3dea3e41b	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROtpLpLQwFZknRNido39/.983/zV7mTji	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5657-2504-45a9-69a0f2a97ec0	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5657-2504-5c45-2e525b2d851a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5657-2504-4ec2-3ab78c68ade4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5657-2504-7298-09f63c8c155b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5657-2504-367a-b3e60a18412e	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5657-2504-eac0-822ad490934c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5657-2504-688e-5367c153d347	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5657-2504-7862-168dccf95c89	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5657-2504-3ec3-c9fa5d14ea1b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5657-2504-4728-467fc123964d	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5657-2504-d57f-1d77b0700817	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5657-2504-6b3d-5724a1189dd9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5657-2504-bf48-e3eafad0d5e2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5657-2504-a808-80c747dc7c60	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5657-2504-0f97-ad358a728577	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5657-2504-4acc-63a65ea705cf	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5657-2504-4ec1-1c28ecf6a545	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5657-2504-cabe-9da317e19866	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5657-2504-897d-5c0883b5d5c2	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5657-2502-40a1-207905f4ac92	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 29717821)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5657-2505-cb36-3d4806d92743	00160000-5657-2504-cdd0-b97d2fc98b43	\N	00140000-5657-2502-89aa-88d18a815c72	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5657-2504-5d46-d72e5642e988
000e0000-5657-2505-6f0f-ee6b9dd094a5	00160000-5657-2504-dad2-869f4d8969b9	\N	00140000-5657-2502-783b-f86144a6f58b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5657-2504-70e4-f6e9d92f4742
000e0000-5657-2505-82ef-d1f44ebb8593	\N	\N	00140000-5657-2502-783b-f86144a6f58b	00190000-5657-2505-7593-25173c4b88c7	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5657-2504-5d46-d72e5642e988
000e0000-5657-2505-01a2-40a4ffd24bcc	\N	\N	00140000-5657-2502-783b-f86144a6f58b	00190000-5657-2505-7593-25173c4b88c7	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5657-2504-5d46-d72e5642e988
000e0000-5657-2505-aee3-eb8c15d46c3b	\N	\N	00140000-5657-2502-783b-f86144a6f58b	00190000-5657-2505-7593-25173c4b88c7	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5657-2504-6de6-b05d20864fbb
000e0000-5657-2505-7fca-8f2635f597e3	\N	\N	00140000-5657-2502-783b-f86144a6f58b	00190000-5657-2505-7593-25173c4b88c7	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5657-2504-6de6-b05d20864fbb
\.


--
-- TOC entry 3123 (class 0 OID 29717479)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5657-2505-f8c1-c7b402be0a71	\N	000e0000-5657-2505-6f0f-ee6b9dd094a5	1	
00200000-5657-2505-6b78-bdb4e8761b68	\N	000e0000-5657-2505-6f0f-ee6b9dd094a5	2	
00200000-5657-2505-c281-1904ced7f7e3	\N	000e0000-5657-2505-6f0f-ee6b9dd094a5	3	
00200000-5657-2505-67ac-3bb269025d3b	\N	000e0000-5657-2505-6f0f-ee6b9dd094a5	4	
00200000-5657-2505-4c8e-50f74a5bb7ab	\N	000e0000-5657-2505-6f0f-ee6b9dd094a5	5	
\.


--
-- TOC entry 3140 (class 0 OID 29717630)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 29717744)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5657-2502-529c-3b3cede857aa	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5657-2502-74f4-63d46878a13a	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5657-2502-84b1-f6aa7a66dffc	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5657-2502-e16f-fcb0dc0ba515	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5657-2502-6d3d-c16dc854da44	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5657-2502-816b-c38c32d4f075	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5657-2502-fbf8-2498a476e768	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5657-2502-7db2-82a4e69ee0db	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5657-2502-e363-bca0094ea99e	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5657-2502-a1a4-182667cd1b0b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5657-2502-3d49-42723d91a7b6	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5657-2502-8b39-ebd1035ced5e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5657-2502-a15e-88d700ea4d92	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5657-2502-f638-3dd6704d6218	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5657-2502-840c-70a4c47aa7f6	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5657-2502-5717-d03511550a31	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5657-2502-7e9b-29787740c04f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5657-2502-2f5f-da86feee0039	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5657-2502-17be-5d89c4fdb25f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5657-2502-e75e-acae850d521c	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5657-2502-19c4-e45f29341fb9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5657-2502-7e97-4e71ef0ddf5f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5657-2502-616b-928d9f881a9b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5657-2502-4b76-b5efa7eb1a9e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5657-2502-05d2-6d2e8649a27f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5657-2502-27c1-fa22688e5f04	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5657-2502-ffdd-455f1004320b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5657-2502-de9e-92d7af57523b	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 29718114)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 29718083)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 29718126)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 29717702)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5657-2505-ddd4-a3ea6ee95210	00090000-5657-2505-0e81-8b6da52350b6	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5657-2505-c847-75c2cde59a5b	00090000-5657-2504-5be3-6b25b68b3eff	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5657-2505-5fb2-cfe56a133ece	00090000-5657-2505-a922-c7fc95b67eef	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5657-2505-96b2-1f0a1e20d2bd	00090000-5657-2504-5266-16698057c7b4	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5657-2505-bf82-28f4afbb74f6	00090000-5657-2505-fec1-1f2ab29dbf42	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5657-2505-9d83-23a81c716b9b	00090000-5657-2504-c738-faaf0d3ce339	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 29717523)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 29717811)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5657-2502-89aa-88d18a815c72	01	Drama	drama (SURS 01)
00140000-5657-2502-1385-c1b1b7624687	02	Opera	opera (SURS 02)
00140000-5657-2502-59ce-002d86fa7a06	03	Balet	balet (SURS 03)
00140000-5657-2502-e618-3bf286b6daf5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5657-2502-95fc-8aaf8edd2afe	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5657-2502-783b-f86144a6f58b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5657-2502-5936-746dc349e11a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 29717692)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 29717255)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 29717870)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 29717860)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 29717246)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 29717727)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 29717769)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 29718167)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 29717511)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 29717533)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 29717538)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 29718081)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 29717406)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 29717938)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 29717688)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 29717477)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 29717444)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 29717420)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 29717595)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 29718144)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 29718151)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 29718175)
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
-- TOC entry 2726 (class 2606 OID 29717622)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 29717378)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 29717274)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 29717338)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 29717301)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 29717235)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 29717220)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 29717628)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 29717664)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 29717806)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 29717329)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 29717366)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 29718033)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 29717601)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 29717356)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 29717496)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 29717465)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 29717457)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 29717613)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 29718042)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 29718050)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 29718020)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 29718062)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 29717646)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 29717586)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 29717577)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 29717793)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 29717720)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 29717432)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 29717190)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 29717655)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 29717209)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 29717229)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 29717673)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 29717608)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 29717557)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 29717178)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 29717166)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 29717160)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 29717740)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 29717310)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 29717568)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 29717780)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 29717263)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 29718074)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 29717546)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 29717391)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 29717203)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 29717839)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 29717486)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 29717636)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 29717752)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 29718124)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 29718108)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 29718132)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 29717710)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 29717527)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 29717819)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 29717700)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 29717521)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 29717522)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 29717520)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 29717519)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 29717518)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 29717741)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 29717742)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 29717743)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 29718146)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 29718145)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 29717331)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 29717332)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 29717629)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 29718112)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 29718111)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 29718113)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 29718110)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 29718109)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 29717615)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 29717614)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 29717487)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 29717488)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 29717689)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 29717691)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 29717690)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 29717422)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 29717421)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 29718063)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 29717808)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 29717809)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 29717810)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 29718133)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 29717844)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 29717841)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 29717845)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 29717843)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 29717842)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 29717393)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 29717392)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 29717304)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 29717656)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 29717236)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 29717237)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 29717676)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 29717675)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 29717674)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 29717342)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 29717341)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 29717343)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 29717460)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 29717458)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 29717459)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 29717168)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 29717581)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 29717579)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 29717578)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 29717580)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 29717210)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 29717211)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 29717637)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 29718168)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 29717729)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 29717728)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 29718176)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 29718177)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 29717602)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 29717721)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 29717722)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 29717943)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 29717942)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 29717939)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 29717940)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 29717941)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 29717358)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 29717357)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 29717359)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 29717650)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 29717649)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 29718043)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 29718044)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 29717874)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 29717875)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 29717872)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 29717873)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 29717711)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 29717712)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 29717590)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 29717589)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 29717587)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 29717588)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 29717862)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 29717861)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 29717433)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 29717447)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 29717446)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 29717445)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 29717448)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 29717478)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 29717466)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 29717467)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 29718034)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 29718082)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 29718152)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 29718153)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 29717276)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 29717275)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 29717311)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 29717312)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 29717528)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 29717571)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 29717570)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 29717569)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 29717513)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 29717514)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 29717517)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 29717512)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 29717516)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 29717515)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 29717330)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 29717264)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 29717265)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 29717407)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 29717409)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 29717408)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 29717410)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 29717596)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 29717807)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 29717840)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 29717781)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 29717782)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 29717302)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 29717303)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 29717701)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 29717179)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 29717379)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 29717340)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 29717167)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 29718075)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 29717648)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 29717647)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 29717547)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 29717548)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 29717871)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 29717367)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 29717820)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 29718125)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 29718051)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 29718052)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 29717770)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 29717558)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 29717230)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 29718348)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 29718353)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 29718378)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 29718368)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 29718343)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 29718363)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 29718373)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 29718358)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 29718548)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 29718553)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 29718558)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 29718723)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 29718718)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 29718233)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 29718238)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 29718463)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 29718703)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 29718698)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 29718708)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 29718693)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 29718688)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 29718458)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 29718453)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 29718333)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 29718338)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 29718503)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 29718513)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 29718508)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 29718288)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 29718283)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 29718443)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 29718678)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 29718563)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 29718568)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 29718573)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 29718713)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 29718593)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 29718578)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 29718598)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 29718588)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 29718583)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 29718278)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 29718273)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 29718218)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 29718213)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 29718483)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 29718193)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 29718198)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 29718498)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 29718493)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 29718488)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 29718248)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 29718243)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 29718253)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 29718313)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 29718303)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 29718308)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 29718178)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 29718418)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 29718408)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 29718403)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 29718413)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 29718183)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 29718188)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 29718468)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 29718738)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 29718543)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 29718538)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 29718743)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 29718748)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 29718448)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 29718528)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 29718533)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 29718653)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 29718648)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 29718633)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 29718638)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 29718643)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 29718263)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 29718258)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 29718268)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 29718478)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 29718473)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 29718663)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 29718668)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 29718623)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 29718628)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 29718613)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 29718618)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 29718518)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 29718523)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 29718438)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 29718433)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 29718423)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 29718428)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 29718608)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 29718603)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 29718293)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 29718298)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 29718328)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 29718318)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 29718323)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 29718658)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 29718673)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 29718683)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 29718728)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 29718733)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 29718208)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 29718203)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 29718223)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 29718228)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 29718383)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 29718398)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 29718393)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 29718388)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-26 16:28:08 CET

--
-- PostgreSQL database dump complete
--

