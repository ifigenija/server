--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-26 09:43:30 CET

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
-- TOC entry 185 (class 1259 OID 40360263)
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
-- TOC entry 241 (class 1259 OID 40360881)
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
-- TOC entry 240 (class 1259 OID 40360865)
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
-- TOC entry 184 (class 1259 OID 40360256)
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
-- TOC entry 183 (class 1259 OID 40360254)
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
-- TOC entry 231 (class 1259 OID 40360742)
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
-- TOC entry 234 (class 1259 OID 40360772)
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
-- TOC entry 255 (class 1259 OID 40361184)
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
-- TOC entry 212 (class 1259 OID 40360578)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 40360504)
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
-- TOC entry 206 (class 1259 OID 40360529)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 40360534)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 40361106)
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
-- TOC entry 196 (class 1259 OID 40360409)
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
-- TOC entry 242 (class 1259 OID 40360894)
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
-- TOC entry 227 (class 1259 OID 40360700)
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
-- TOC entry 202 (class 1259 OID 40360478)
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
-- TOC entry 199 (class 1259 OID 40360449)
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
-- TOC entry 197 (class 1259 OID 40360426)
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
-- TOC entry 216 (class 1259 OID 40360614)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 40361164)
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
-- TOC entry 254 (class 1259 OID 40361177)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 40361199)
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
-- TOC entry 220 (class 1259 OID 40360638)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 40360383)
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
-- TOC entry 187 (class 1259 OID 40360283)
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
-- TOC entry 191 (class 1259 OID 40360350)
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
-- TOC entry 188 (class 1259 OID 40360294)
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
-- TOC entry 180 (class 1259 OID 40360228)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 40360247)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 40360645)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 40360680)
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
-- TOC entry 237 (class 1259 OID 40360813)
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
-- TOC entry 190 (class 1259 OID 40360330)
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
-- TOC entry 193 (class 1259 OID 40360375)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 40361050)
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
-- TOC entry 217 (class 1259 OID 40360620)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 40360360)
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
-- TOC entry 204 (class 1259 OID 40360496)
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
-- TOC entry 200 (class 1259 OID 40360464)
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
-- TOC entry 201 (class 1259 OID 40360471)
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
-- TOC entry 219 (class 1259 OID 40360632)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 40361064)
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
-- TOC entry 246 (class 1259 OID 40361074)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 40360963)
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
-- TOC entry 247 (class 1259 OID 40361082)
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
-- TOC entry 223 (class 1259 OID 40360660)
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
-- TOC entry 215 (class 1259 OID 40360605)
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
-- TOC entry 214 (class 1259 OID 40360595)
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
-- TOC entry 236 (class 1259 OID 40360802)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 40360732)
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
-- TOC entry 198 (class 1259 OID 40360438)
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
-- TOC entry 177 (class 1259 OID 40360199)
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
-- TOC entry 176 (class 1259 OID 40360197)
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
-- TOC entry 224 (class 1259 OID 40360674)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 40360237)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 40360221)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 40360688)
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
-- TOC entry 218 (class 1259 OID 40360626)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 40360549)
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
-- TOC entry 175 (class 1259 OID 40360186)
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
-- TOC entry 174 (class 1259 OID 40360178)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 40360173)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 40360749)
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
-- TOC entry 189 (class 1259 OID 40360322)
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
-- TOC entry 211 (class 1259 OID 40360568)
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
-- TOC entry 213 (class 1259 OID 40360585)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 40360790)
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
-- TOC entry 186 (class 1259 OID 40360273)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 40361094)
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
-- TOC entry 208 (class 1259 OID 40360539)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 40360395)
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
-- TOC entry 178 (class 1259 OID 40360208)
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
-- TOC entry 239 (class 1259 OID 40360840)
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
-- TOC entry 210 (class 1259 OID 40360559)
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
-- TOC entry 203 (class 1259 OID 40360489)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 40360652)
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
-- TOC entry 233 (class 1259 OID 40360763)
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
-- TOC entry 251 (class 1259 OID 40361144)
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
-- TOC entry 250 (class 1259 OID 40361113)
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
-- TOC entry 252 (class 1259 OID 40361156)
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
-- TOC entry 229 (class 1259 OID 40360725)
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
-- TOC entry 238 (class 1259 OID 40360830)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 40360715)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 40360259)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 40360202)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 40360263)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a7-31ae-41e4-c233ebf5d907	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a7-31ae-d448-bd8e75039160	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a7-31ae-1d37-b3df30958075	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 40360881)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a7-31af-6256-97fd000507e0	000d0000-56a7-31ae-4632-3ea01f0fe5d1	\N	00090000-56a7-31ae-3baf-94590e9f6735	000b0000-56a7-31ae-260a-24ae07a8332f	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a7-31af-34aa-f1176377eadc	000d0000-56a7-31ae-c9ca-248118538472	00100000-56a7-31ae-2dac-2986ea454684	00090000-56a7-31ae-de34-f1d691d89def	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a7-31af-9fd2-292eb5dd388d	000d0000-56a7-31ae-fbca-fd1fbada35f8	00100000-56a7-31ae-d08a-611a0d0d85aa	00090000-56a7-31ae-edb1-00254678d87b	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a7-31af-76d1-e5e66c325a6e	000d0000-56a7-31ae-8d92-9fba37075cf5	\N	00090000-56a7-31ae-643d-a25e5b39372c	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a7-31af-e649-ee0996639e86	000d0000-56a7-31ae-0d37-2cc07a956cc5	\N	00090000-56a7-31ae-0f36-757a8fde9a60	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a7-31af-6717-2fa7185ebf70	000d0000-56a7-31ae-69cb-3b139f29935b	\N	00090000-56a7-31ae-5f79-0fe2f24556da	000b0000-56a7-31ae-d5cd-6d93b5cac924	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a7-31af-2800-39c17fff020a	000d0000-56a7-31ae-131f-f8b576e88d20	00100000-56a7-31ae-9d2b-8d93fe9fcf63	00090000-56a7-31ae-198a-6a116430996b	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a7-31af-ca25-328b0b97481d	000d0000-56a7-31ae-77ca-316f96fea9c1	\N	00090000-56a7-31ae-2c96-2139309bad7f	000b0000-56a7-31ae-9f8c-c7137073daa3	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a7-31af-11f1-a70847af94c0	000d0000-56a7-31ae-131f-f8b576e88d20	00100000-56a7-31ae-bed2-0d562fed45a5	00090000-56a7-31ae-425a-537b133c4537	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a7-31af-1fbd-96b37b22a877	000d0000-56a7-31ae-131f-f8b576e88d20	00100000-56a7-31ae-c95d-83502921ef3b	00090000-56a7-31ae-0821-dfbf3212ca68	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a7-31af-fdd5-18234548ccc5	000d0000-56a7-31ae-131f-f8b576e88d20	00100000-56a7-31ae-7b92-540b4b19e802	00090000-56a7-31ae-0349-fb901d2b7a50	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a7-31af-a9f2-56ae15de0e8f	000d0000-56a7-31ae-f5d3-803a6920f4c5	00100000-56a7-31ae-2dac-2986ea454684	00090000-56a7-31ae-de34-f1d691d89def	000b0000-56a7-31ae-cc60-ef000a8ae098	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a7-31af-3d27-4f50dc071847	000d0000-56a7-31ae-a989-9edeef86a90a	\N	00090000-56a7-31ae-2c96-2139309bad7f	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-5aac-fdeb6add0930	000d0000-56a7-31ae-a989-9edeef86a90a	\N	00090000-56a7-31ae-eba4-f13adf9efffa	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a7-31af-ddb5-25f0d960aa0b	000d0000-56a7-31ae-c6ae-573ca30aa52e	00100000-56a7-31ae-d08a-611a0d0d85aa	00090000-56a7-31ae-edb1-00254678d87b	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-da7d-751d93c8e664	000d0000-56a7-31ae-c6ae-573ca30aa52e	\N	00090000-56a7-31ae-eba4-f13adf9efffa	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a7-31af-084d-b753793bf7d6	000d0000-56a7-31ae-be30-acaa3ee7e4dd	\N	00090000-56a7-31ae-eba4-f13adf9efffa	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-5aa3-be3756fdb1f2	000d0000-56a7-31ae-be30-acaa3ee7e4dd	\N	00090000-56a7-31ae-2c96-2139309bad7f	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a7-31af-bf8b-177256ea40aa	000d0000-56a7-31ae-14ed-cb0226ff1f18	00100000-56a7-31ae-9d2b-8d93fe9fcf63	00090000-56a7-31ae-198a-6a116430996b	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-9a95-519efd6f8dc0	000d0000-56a7-31ae-14ed-cb0226ff1f18	\N	00090000-56a7-31ae-eba4-f13adf9efffa	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a7-31af-0058-ef0694d9110d	000d0000-56a7-31ae-5a02-3bd4059c0b23	\N	00090000-56a7-31ae-eba4-f13adf9efffa	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-9084-21784af0f74f	000d0000-56a7-31ae-5a02-3bd4059c0b23	00100000-56a7-31ae-9d2b-8d93fe9fcf63	00090000-56a7-31ae-198a-6a116430996b	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a7-31af-229b-1b57926bfe2f	000d0000-56a7-31ae-0210-5a8514bddabf	\N	00090000-56a7-31ae-eba4-f13adf9efffa	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-c435-ec36a25696e2	000d0000-56a7-31ae-e898-1eb3cc125808	\N	00090000-56a7-31ae-2c96-2139309bad7f	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-cbe9-eb54935f64ee	000d0000-56a7-31ae-6c14-1f5b9ab8cd5c	\N	00090000-56a7-31ae-2c96-2139309bad7f	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-ddd4-9382ec1bd3ef	000d0000-56a7-31ae-6c14-1f5b9ab8cd5c	00100000-56a7-31ae-d08a-611a0d0d85aa	00090000-56a7-31ae-edb1-00254678d87b	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a7-31af-0e4a-b47276ac110d	000d0000-56a7-31ae-31df-c5a2d8d5ffeb	\N	00090000-56a7-31ae-ac03-e991e06b64a6	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a7-31af-cf78-f4d21aae7068	000d0000-56a7-31ae-31df-c5a2d8d5ffeb	\N	00090000-56a7-31ae-db88-e4cccc698143	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a7-31af-b922-ab1a738dbdce	000d0000-56a7-31ae-7109-7dd4f509b1f8	\N	00090000-56a7-31ae-2c96-2139309bad7f	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a7-31af-d7ae-3e9521027061	000d0000-56a7-31ae-7109-7dd4f509b1f8	00100000-56a7-31ae-d08a-611a0d0d85aa	00090000-56a7-31ae-edb1-00254678d87b	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a7-31af-5320-06f9ec22c47f	000d0000-56a7-31ae-7109-7dd4f509b1f8	\N	00090000-56a7-31ae-db88-e4cccc698143	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a7-31af-80ba-89106b1559d2	000d0000-56a7-31ae-7109-7dd4f509b1f8	\N	00090000-56a7-31ae-ac03-e991e06b64a6	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a7-31af-d11c-435966bc8cd5	000d0000-56a7-31ae-6d8a-b02ab0da5083	\N	00090000-56a7-31ae-2c96-2139309bad7f	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a7-31af-1f63-880a441b5b76	000d0000-56a7-31ae-e9cc-4601140dd1f4	00100000-56a7-31ae-d08a-611a0d0d85aa	00090000-56a7-31ae-edb1-00254678d87b	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a7-31af-88d9-691814e343b8	000d0000-56a7-31ae-e9cc-4601140dd1f4	\N	00090000-56a7-31ae-eba4-f13adf9efffa	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 40360865)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 40360256)
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
-- TOC entry 3191 (class 0 OID 40360742)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a7-31ae-2752-a3928c07a879	00160000-56a7-31ae-337c-1ccdedf2a663	00090000-56a7-31ae-db88-e4cccc698143	aizv	10	t
003d0000-56a7-31ae-f260-f831e306ad53	00160000-56a7-31ae-337c-1ccdedf2a663	00090000-56a7-31ae-29ba-7d440a006980	apri	14	t
003d0000-56a7-31ae-c659-28cffcf65b7a	00160000-56a7-31ae-e68f-d456f72b5572	00090000-56a7-31ae-ac03-e991e06b64a6	aizv	11	t
003d0000-56a7-31ae-158c-cc603c9ad3ea	00160000-56a7-31ae-0e4f-9934db4e6983	00090000-56a7-31ae-d999-c41957a59df5	aizv	12	t
003d0000-56a7-31ae-c0b5-4877dbe92b59	00160000-56a7-31ae-337c-1ccdedf2a663	00090000-56a7-31ae-eba4-f13adf9efffa	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 40360772)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a7-31ae-337c-1ccdedf2a663	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a7-31ae-e68f-d456f72b5572	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a7-31ae-0e4f-9934db4e6983	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 40361184)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 40360578)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 40360504)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a7-31ae-ccfd-e2f27b28f886	\N	\N	\N	\N	00440000-56a7-31ae-cd18-737e1b87ef9b	00220000-56a7-31ae-750d-fd73c7ce0936	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a7-31ae-e520-09bef8a6988f	\N	\N	\N	\N	00440000-56a7-31ae-60bb-a2af52f2c954	00220000-56a7-31ae-f528-693205e56240	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a7-31ae-e1bc-8402be3cf639	\N	\N	\N	001e0000-56a7-31ae-09b5-366614850aab	\N	00220000-56a7-31ae-750d-fd73c7ce0936	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a7-31ae-5608-7b6337b08b78	\N	\N	\N	001e0000-56a7-31ae-43e1-88471af104fc	\N	00220000-56a7-31ae-f528-693205e56240	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a7-31af-efaa-7e53dce514aa	\N	00200000-56a7-31af-7c94-6e74db96e375	\N	\N	\N	00220000-56a7-31ae-0e75-2ae8f01abf57	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	dogodek 1	\N
00180000-56a7-31af-8060-a142e2e9c501	\N	00200000-56a7-31af-378a-cf66a315dc06	\N	\N	\N	00220000-56a7-31ae-0e75-2ae8f01abf57	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	dogodek 2	\N
00180000-56a7-31af-c1ee-eddf2806b15a	\N	00200000-56a7-31af-0609-61dfc71c4848	\N	\N	\N	00220000-56a7-31ae-f528-693205e56240	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	dogodek 3	\N
00180000-56a7-31af-e98d-d8dd5ad467b3	\N	00200000-56a7-31af-6566-e61ff8f4e771	\N	\N	\N	00220000-56a7-31ae-c2b3-bdfe15b00e49	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	dogodek 4	\N
00180000-56a7-31af-802f-3f6fdd6c1374	\N	00200000-56a7-31af-de62-043a03454e6f	\N	\N	\N	00220000-56a7-31ae-7dae-636365e80106	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	dogodek 5	\N
00180000-56a7-31af-31f2-cc4fb53d04ff	001b0000-56a7-31af-9e65-427343346595	\N	\N	\N	\N	00220000-56a7-31ae-750d-fd73c7ce0936	001f0000-56a7-31ae-9214-424cc0665e19	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1	\N
00180000-56a7-31af-ab71-5d7bf6920f5a	001b0000-56a7-31af-62d2-1185e1836332	\N	\N	\N	\N	00220000-56a7-31ae-f528-693205e56240	001f0000-56a7-31ae-9214-424cc0665e19	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2	\N
00180000-56a7-31af-4e86-f311a43fcd9c	001b0000-56a7-31af-fac2-6bfa53893e47	\N	\N	\N	\N	00220000-56a7-31ae-750d-fd73c7ce0936	001f0000-56a7-31ae-9214-424cc0665e19	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3	\N
\.


--
-- TOC entry 3166 (class 0 OID 40360529)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a7-31ae-09b5-366614850aab
001e0000-56a7-31ae-43e1-88471af104fc
\.


--
-- TOC entry 3167 (class 0 OID 40360534)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a7-31ae-cd18-737e1b87ef9b
00440000-56a7-31ae-60bb-a2af52f2c954
\.


--
-- TOC entry 3209 (class 0 OID 40361106)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 40360409)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a7-31ab-2d87-7d3c12d25f6d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a7-31ab-f457-478abfc452a6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a7-31ab-1da4-3e6af2583fb3	AL	ALB	008	Albania 	Albanija	\N
00040000-56a7-31ab-dd3a-a53b1690988c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a7-31ab-6ec1-ae2a7392b527	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a7-31ab-70c8-4df6435c442c	AD	AND	020	Andorra 	Andora	\N
00040000-56a7-31ab-67d9-f6f5d21cb2c8	AO	AGO	024	Angola 	Angola	\N
00040000-56a7-31ab-979e-9e2bd177965c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a7-31ab-df33-2059f01314e6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a7-31ab-232d-3f18d7298aea	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a7-31ab-c2fe-cc1d78a315d8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a7-31ab-70f8-8c4b103b2b98	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a7-31ab-e110-7b7c141d5d35	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a7-31ab-a3f5-696fe923e61d	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a7-31ab-bb12-5c343663610e	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a7-31ab-7407-998f282ee875	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a7-31ab-1bb9-5fe7621c2e53	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a7-31ab-5bd6-25d8bf9b9010	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a7-31ab-7d94-d7c5048bc72e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a7-31ab-21f1-0853be99fc6e	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a7-31ab-fce8-84dc6f80f142	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a7-31ab-6d9a-09efc55b0f08	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a7-31ab-6743-6038d05ad6c5	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a7-31ab-8b11-297b9e4a64ce	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a7-31ab-b43b-bcb9dc3d8bd7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a7-31ab-5bdd-4879cd8c3a65	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a7-31ab-d10b-42ed2a7ed650	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a7-31ab-0dd2-eb50ae9a75fe	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a7-31ab-e8b1-d363047cc060	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a7-31ab-bf9c-fbfb2d4975fd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a7-31ab-2eaa-1a7eafb77ec8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a7-31ab-4760-32d2bf80f82a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a7-31ab-9dec-03e58d4dd92f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a7-31ab-64ee-de2f815c2e94	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a7-31ab-980d-0c13a024efe2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a7-31ab-67f2-439b07f1122e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a7-31ab-72e5-907e59504765	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a7-31ab-e6c3-792d44f91ff1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a7-31ab-3d35-4a50649c4f88	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a7-31ab-7d9c-d12b9b017caf	CA	CAN	124	Canada 	Kanada	\N
00040000-56a7-31ab-4044-762dd218b412	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a7-31ab-dbc2-29677334ebc5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a7-31ab-eecd-345b373558f0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a7-31ab-d437-00db2194324f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a7-31ab-c407-f8183e6c025f	CL	CHL	152	Chile 	Čile	\N
00040000-56a7-31ab-69e0-1d64e823a2d0	CN	CHN	156	China 	Kitajska	\N
00040000-56a7-31ab-4171-7e671964a90e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a7-31ab-a160-87ff1b2457c2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a7-31ab-191a-d373f317952a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a7-31ab-68b0-d78525dd4ae3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a7-31ab-519a-d6b6f75bf918	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a7-31ab-b039-a61521014e89	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a7-31ab-a5d6-cee4677225a7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a7-31ab-4d88-a38fcba55e76	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a7-31ab-9475-74831852b6b2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a7-31ab-448e-d896d9187abc	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a7-31ab-f17f-ac7a99b4c91c	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a7-31ab-a9c0-ccbc6becce30	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a7-31ab-1831-ea1a6e548aba	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a7-31ab-2c32-2ea0ef829bb3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a7-31ab-cacd-b9de37793dcf	DK	DNK	208	Denmark 	Danska	\N
00040000-56a7-31ab-8a04-6782a5e56314	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a7-31ab-a078-fac4f4f8ad4e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a7-31ab-2d1c-2d1f8b0f2811	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a7-31ab-8e70-f3a19fc8d4ba	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a7-31ab-404b-332881c579b6	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a7-31ab-b76b-7e028abc3c6b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a7-31ab-41dd-4db13d7d5523	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a7-31ab-7019-db341f6d2f32	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a7-31ab-404c-89bd8b485756	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a7-31ab-0e1c-195fdfbac39d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a7-31ab-418e-fac9c94a3241	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a7-31ab-4a21-5c7e18df64d1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a7-31ab-935c-35bd8687ab3d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a7-31ab-dd12-56c8cf9a06be	FI	FIN	246	Finland 	Finska	\N
00040000-56a7-31ab-3828-2cbf5c9c14f2	FR	FRA	250	France 	Francija	\N
00040000-56a7-31ab-c0c3-e5c257ebb9cc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a7-31ab-631d-eba3502d4a3f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a7-31ab-ce8d-22150cfa03aa	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a7-31ab-e521-afa51de1c85c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a7-31ab-dce2-b3080b190e72	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a7-31ab-7218-7d9db641c21f	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a7-31ab-f5b0-933f3c3be2eb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a7-31ab-c61a-cb68e4b84416	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a7-31ab-77c1-7466a5a4778b	GH	GHA	288	Ghana 	Gana	\N
00040000-56a7-31ab-fef9-4a36277b6220	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a7-31ab-50e7-59ee32300e81	GR	GRC	300	Greece 	Grčija	\N
00040000-56a7-31ab-28d3-1a7b9d524301	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a7-31ab-54e1-d032a248e085	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a7-31ab-1e3c-cc782d3642de	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a7-31ab-c2c7-a3f4a52c4804	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a7-31ab-166c-1e8116fe1838	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a7-31ab-7614-a3b97563072e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a7-31ab-55c8-e6d4a3719687	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a7-31ab-e4cc-459b4b210910	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a7-31ab-ca79-54c173e76523	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a7-31ab-de80-b1939df84bf9	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a7-31ab-417f-4b5557786ea4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a7-31ab-cd14-6ca945aff798	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a7-31ab-c385-b694523cd83a	HN	HND	340	Honduras 	Honduras	\N
00040000-56a7-31ab-a90a-52e02bb54fd0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a7-31ab-998e-a6cf8ba95d0a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a7-31ab-a970-1053b6796d85	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a7-31ab-faeb-589c305478d8	IN	IND	356	India 	Indija	\N
00040000-56a7-31ab-2c86-eb3aaa97a447	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a7-31ab-090c-a87f6d6cd63a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a7-31ab-28d8-15a2463cdd2a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a7-31ab-1d81-5620b0d76ab2	IE	IRL	372	Ireland 	Irska	\N
00040000-56a7-31ab-e9b9-e66db27f71b8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a7-31ab-8707-e1fb38d269ce	IL	ISR	376	Israel 	Izrael	\N
00040000-56a7-31ab-2c3c-c13b5fc19d4b	IT	ITA	380	Italy 	Italija	\N
00040000-56a7-31ab-be27-071a52890bab	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a7-31ab-63df-1496ec2678f3	JP	JPN	392	Japan 	Japonska	\N
00040000-56a7-31ab-1e3d-fb18bb6f00a9	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a7-31ab-2bad-16b16a9eb960	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a7-31ab-7d2c-d69742c35742	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a7-31ab-827a-b209313e7dac	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a7-31ab-021c-aae8ee7b4d63	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a7-31ab-0079-072d84018f10	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a7-31ab-c84b-b3e3854f33e6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a7-31ab-781d-3010f7a0265b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a7-31ab-4c2b-3d4595dfde4c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a7-31ab-bc19-45d27cf1989c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a7-31ab-b594-de94a0fb19fd	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a7-31ab-540f-5edb11a57fc2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a7-31ab-d854-b1946e429724	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a7-31ab-e88e-b12426a0a2c7	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a7-31ab-f425-257ca2317bd7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a7-31ab-8b98-4eae59d3a2de	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a7-31ab-1732-cb112ec1a3fe	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a7-31ab-2c71-aa761285a3d8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a7-31ab-7d1e-496d358e0cf4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a7-31ab-b6ef-f9da6d3ec87c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a7-31ab-8033-73118ee6d462	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a7-31ab-b784-f14e04ab3861	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a7-31ab-70a7-ff9e7ae1b78a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a7-31ab-6a6b-ff943738026e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a7-31ab-d887-d533c470a8d5	ML	MLI	466	Mali 	Mali	\N
00040000-56a7-31ab-d2eb-7eee6a8952fd	MT	MLT	470	Malta 	Malta	\N
00040000-56a7-31ab-5c15-3b02dce64321	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a7-31ab-f32c-051db6296ec4	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a7-31ab-1ce9-8e5fb7aefb51	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a7-31ab-de20-5db36664213f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a7-31ab-bce7-3f1fa9984703	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a7-31ab-7381-e273dd85ee25	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a7-31ab-0ede-a4d00f296a31	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a7-31ab-af2b-6f5b9522dac3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a7-31ab-2a89-36527248063b	MC	MCO	492	Monaco 	Monako	\N
00040000-56a7-31ab-4356-fc7f52be33c7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a7-31ab-94ac-4a07eedf9a50	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a7-31ab-482b-db4831fd5d6d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a7-31ab-68f3-ce279a26e37d	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a7-31ab-a0fa-46e015970d08	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a7-31ab-4ac9-7cb80203a239	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a7-31ab-2415-fa7b72fc4275	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a7-31ab-673f-6324bae11450	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a7-31ab-a141-5b2760a85676	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a7-31ab-cced-3f930319e7e2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a7-31ab-a11a-c8e1e8ec3c9f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a7-31ab-d307-418bb34849f3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a7-31ab-1bd1-2b81734033b3	NE	NER	562	Niger 	Niger 	\N
00040000-56a7-31ab-418d-b233daabcae8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a7-31ab-d930-1207fd305ad6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a7-31ab-bfaf-81a85c45bc52	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a7-31ab-b8a5-68af474e69c1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a7-31ab-97bc-a76ba7dd297a	NO	NOR	578	Norway 	Norveška	\N
00040000-56a7-31ab-173c-a1971f95e580	OM	OMN	512	Oman 	Oman	\N
00040000-56a7-31ab-b3b3-34a3a226c971	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a7-31ab-d0a9-4cc6235d36c4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a7-31ab-574f-2e997968a8e4	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a7-31ab-14ce-dc7ff81530c5	PA	PAN	591	Panama 	Panama	\N
00040000-56a7-31ab-1cc2-3ad317764709	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a7-31ab-259c-493c54fb625d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a7-31ab-04e0-160a7d172c6e	PE	PER	604	Peru 	Peru	\N
00040000-56a7-31ab-6d95-e04dce93c7db	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a7-31ab-3e4c-a3701038aa55	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a7-31ab-f46c-d17ba8bd8b06	PL	POL	616	Poland 	Poljska	\N
00040000-56a7-31ab-c8fc-f818c108023d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a7-31ab-8fa9-31c1e78734fc	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a7-31ab-a896-df49944e3655	QA	QAT	634	Qatar 	Katar	\N
00040000-56a7-31ab-1748-3c08fca5997a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a7-31ab-8017-fc975c59300c	RO	ROU	642	Romania 	Romunija	\N
00040000-56a7-31ab-b27b-d8b6b9dde1fb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a7-31ab-0b42-ab3370c21452	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a7-31ab-c0db-aacba302dc39	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a7-31ab-fb8d-4693b0c83e2a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a7-31ab-b84c-38c7996c63bd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a7-31ab-7750-1c1ae55d7bad	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a7-31ab-d401-6690267ef587	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a7-31ab-fa30-6de6c35dd41e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a7-31ab-2b78-11f7e525e451	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a7-31ab-ebff-3f719623445f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a7-31ab-5abc-8027e2ade285	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a7-31ab-97bf-18d17f9cfa3b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a7-31ab-3ec1-8f6680e769d8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a7-31ab-9fa1-bc437f87040b	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a7-31ab-f9ab-06109327f62c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a7-31ab-0a81-40b0e0461748	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a7-31ab-0ce3-b5b19c51b70d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a7-31ab-33e2-a181b51c7e59	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a7-31ab-cd10-453aada0e708	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a7-31ab-2dc2-0e0950d0e3ba	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a7-31ab-fec8-5fd43f1a6f86	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a7-31ab-d604-5d03750fd021	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a7-31ab-d1cf-017f58feac2f	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a7-31ab-847a-63cb17d7645d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a7-31ab-143b-df28d4f1dd19	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a7-31ab-7ea9-9050d02be554	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a7-31ab-3f18-0c97bb862b11	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a7-31ab-1b9c-35a5c8656ec6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a7-31ab-1b8e-c9f0c888ddf0	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a7-31ab-a822-5fe8d439be8c	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a7-31ab-4732-f757f04f3859	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a7-31ab-3645-ad4c7c808427	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a7-31ab-bea0-58b05ccb08be	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a7-31ab-f4d7-e3561702527d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a7-31ab-5240-8c85782aadf4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a7-31ab-7638-807b448ffb82	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a7-31ab-4313-b77736c70360	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a7-31ab-63ec-27b64bb4aa79	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a7-31ab-d681-6bea47831b06	TH	THA	764	Thailand 	Tajska	\N
00040000-56a7-31ab-7794-3bfa7c74433f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a7-31ab-2f7f-f4ce027ce71a	TG	TGO	768	Togo 	Togo	\N
00040000-56a7-31ab-6f2f-943630fc968a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a7-31ab-8d9b-75c8b2e35ce5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a7-31ab-9bf0-ed39071ada5d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a7-31ab-0607-7d2e694ca9b6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a7-31ab-e6a7-8f84ae0fffa4	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a7-31ab-f634-51790e5b7952	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a7-31ab-f9fd-4e460433234c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a7-31ab-38be-daa2d6cec1bd	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a7-31ab-2da8-3635033cec5b	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a7-31ab-fcb6-02a0a30d952f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a7-31ab-eae7-cbe4438cae2b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a7-31ab-45a3-3603b2ffa993	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a7-31ab-25ca-f7beb34982ee	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a7-31ab-8d1f-a7660478217c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a7-31ab-bed7-24e7a111e9d7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a7-31ab-d14c-6fe50611f303	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a7-31ab-c756-7daa841075f9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a7-31ab-8e3e-230d0fdf5c64	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a7-31ab-b38c-5ce818ceb897	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a7-31ab-2317-36957fae81eb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a7-31ab-4170-f43913a389d0	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a7-31ab-9b64-05674324a984	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a7-31ab-2922-25f001a322d6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a7-31ab-6e83-4e30fc8cef33	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a7-31ab-6752-7f3746a9fa7e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a7-31ab-7201-09aac1c0b936	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 40360894)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a7-31ae-4e6e-1bf5ed128f9a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a7-31ae-2eb3-736c1229aae3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-31af-36d2-2706292a9510	000e0000-56a7-31ae-69c6-9a94c0372aae	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-31ab-732b-7d879bcab850	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-31af-c635-f1ec5a2daaf3	000e0000-56a7-31ae-f1e7-945003a79beb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-31ab-7320-7c6932f170be	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-31af-1426-123892e412a7	000e0000-56a7-31ae-0674-55e6c8a3ffd6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-31ab-732b-7d879bcab850	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 40360700)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a7-31ae-b719-8d706c18b778	000e0000-56a7-31ae-f1e7-945003a79beb	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a7-31ab-1bfb-691c294bcb0c
000d0000-56a7-31ae-9406-47ba4048752d	000e0000-56a7-31ae-a09b-5bad81b9411f	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-31ab-0da4-ea66b916a2b4
000d0000-56a7-31ae-e616-6a09e38da880	000e0000-56a7-31ae-a09b-5bad81b9411f	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-4632-3ea01f0fe5d1	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-6256-97fd000507e0	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-31ab-0da4-ea66b916a2b4
000d0000-56a7-31ae-c9ca-248118538472	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-34aa-f1176377eadc	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-fbca-fd1fbada35f8	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-9fd2-292eb5dd388d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a7-31ab-6f0b-a8275cc782d9
000d0000-56a7-31ae-8d92-9fba37075cf5	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-76d1-e5e66c325a6e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a7-31ab-1bfb-691c294bcb0c
000d0000-56a7-31ae-0d37-2cc07a956cc5	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-e649-ee0996639e86	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a7-31ab-1bfb-691c294bcb0c
000d0000-56a7-31ae-69cb-3b139f29935b	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-6717-2fa7185ebf70	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-31ab-0da4-ea66b916a2b4
000d0000-56a7-31ae-131f-f8b576e88d20	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-11f1-a70847af94c0	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a7-31ab-0da4-ea66b916a2b4
000d0000-56a7-31ae-77ca-316f96fea9c1	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-ca25-328b0b97481d	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a7-31ab-57d2-e8a6c8d53ad3
000d0000-56a7-31ae-f5d3-803a6920f4c5	000e0000-56a7-31ae-f1e7-945003a79beb	000c0000-56a7-31af-a9f2-56ae15de0e8f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a7-31ab-4502-1f59808333ae
000d0000-56a7-31ae-a989-9edeef86a90a	000e0000-56a7-31ae-840b-5a08eb05253b	000c0000-56a7-31af-3d27-4f50dc071847	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-c6ae-573ca30aa52e	000e0000-56a7-31ae-5118-f642d6aa06a1	000c0000-56a7-31af-ddb5-25f0d960aa0b	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-be30-acaa3ee7e4dd	000e0000-56a7-31ae-5118-f642d6aa06a1	000c0000-56a7-31af-084d-b753793bf7d6	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-14ed-cb0226ff1f18	000e0000-56a7-31ae-ec08-02feae39abce	000c0000-56a7-31af-bf8b-177256ea40aa	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-5a02-3bd4059c0b23	000e0000-56a7-31ae-68cf-9bc9e2eaf91c	000c0000-56a7-31af-0058-ef0694d9110d	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-0210-5a8514bddabf	000e0000-56a7-31ae-85fd-38e42e4b1075	000c0000-56a7-31af-229b-1b57926bfe2f	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-e898-1eb3cc125808	000e0000-56a7-31ae-b589-8efddf4b3342	000c0000-56a7-31af-c435-ec36a25696e2	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-6c14-1f5b9ab8cd5c	000e0000-56a7-31ae-823f-21dc11494ec5	000c0000-56a7-31af-cbe9-eb54935f64ee	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-31df-c5a2d8d5ffeb	000e0000-56a7-31ae-b9e6-8740d2171c8d	000c0000-56a7-31af-0e4a-b47276ac110d	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-7109-7dd4f509b1f8	000e0000-56a7-31ae-b9e6-8740d2171c8d	000c0000-56a7-31af-b922-ab1a738dbdce	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-6d8a-b02ab0da5083	000e0000-56a7-31ae-293d-e75c80a9f183	000c0000-56a7-31af-d11c-435966bc8cd5	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
000d0000-56a7-31ae-e9cc-4601140dd1f4	000e0000-56a7-31ae-293d-e75c80a9f183	000c0000-56a7-31af-1f63-880a441b5b76	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a7-31ab-aa10-e2f1fa353cff
\.


--
-- TOC entry 3162 (class 0 OID 40360478)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40360449)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 40360426)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a7-31ae-8b2c-53c7a1a050f5	00080000-56a7-31ae-83e0-f36154ef6217	00090000-56a7-31ae-0821-dfbf3212ca68	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 40360614)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 40361164)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a7-31ae-e722-4e2521df79f1	00010000-56a7-31ac-21f3-a6f5cd4a8182	\N	Prva mapa	Root mapa	2016-01-26 09:43:26	2016-01-26 09:43:26	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 40361177)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 40361199)
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
-- TOC entry 3180 (class 0 OID 40360638)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 40360383)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a7-31ac-7479-0dc8aad16371	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a7-31ac-d589-455b5dbbf999	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a7-31ac-f54c-6e9f65139217	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a7-31ac-d871-dd588dda204b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a7-31ac-2fc3-c43fedc183f0	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a7-31ac-6014-5c20b861d587	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a7-31ac-43d5-390db7d8ada7	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a7-31ac-68d7-ea8de7df5572	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a7-31ac-87cc-0e4d7f859738	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a7-31ac-1bd7-be249a038f90	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a7-31ac-2811-3eafc47e10b6	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a7-31ac-10cc-afa007bb6c6b	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a7-31ac-e7c2-2b977efdb1cf	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a7-31ac-656f-a577d17b17d3	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a7-31ac-ddc6-91757414e849	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a7-31ac-ed7e-a29750e3c756	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a7-31ac-9226-5849aa8b5c6b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a7-31ae-8aae-08bf0a5b3bd6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a7-31ae-24c2-33a40bf9e419	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a7-31ae-631f-5a13bc94b1c1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a7-31ae-bfd4-4d7e58118636	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a7-31ae-2670-248a9f1c58e5	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a7-31b0-4812-a7d696de8a02	application.tenant.maticnopodjetje	string	s:36:"00080000-56a7-31b0-bd72-3beb799e6a2a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 40360283)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a7-31ae-742e-3d5fcf644ee2	00000000-56a7-31ae-8aae-08bf0a5b3bd6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a7-31ae-b1fb-b8ba75f97013	00000000-56a7-31ae-8aae-08bf0a5b3bd6	00010000-56a7-31ac-21f3-a6f5cd4a8182	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a7-31ae-9842-527bd8c48afb	00000000-56a7-31ae-24c2-33a40bf9e419	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 40360350)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a7-31ae-e3d8-d7d662f52b90	\N	00100000-56a7-31ae-2dac-2986ea454684	00100000-56a7-31ae-d08a-611a0d0d85aa	01	Gledališče Nimbis
00410000-56a7-31ae-a943-61808e750d49	00410000-56a7-31ae-e3d8-d7d662f52b90	00100000-56a7-31ae-2dac-2986ea454684	00100000-56a7-31ae-d08a-611a0d0d85aa	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 40360294)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a7-31ae-3baf-94590e9f6735	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a7-31ae-643d-a25e5b39372c	00010000-56a7-31ae-02d4-d630a4cbc814	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a7-31ae-edb1-00254678d87b	00010000-56a7-31ae-aeab-79467dd74772	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a7-31ae-425a-537b133c4537	00010000-56a7-31ae-cb87-d754cc1d7883	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a7-31ae-6fdd-cdd58e467e69	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a7-31ae-5f79-0fe2f24556da	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a7-31ae-0349-fb901d2b7a50	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a7-31ae-198a-6a116430996b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a7-31ae-0821-dfbf3212ca68	00010000-56a7-31ae-7140-924a4c88ec47	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a7-31ae-de34-f1d691d89def	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a7-31ae-8b28-d03b14be32ba	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-31ae-0f36-757a8fde9a60	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a7-31ae-2c96-2139309bad7f	00010000-56a7-31ae-17e0-036b7376b397	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-31ae-db88-e4cccc698143	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-31ae-29ba-7d440a006980	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-31ae-ac03-e991e06b64a6	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-31ae-d999-c41957a59df5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-31ae-eba4-f13adf9efffa	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-31ae-f58b-e5d25bf1acef	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-31ae-8bee-6ce5cd21939e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-31ae-d82b-44c1851e2acf	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 40360228)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a7-31ac-9e4d-fd4ae5054e64	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a7-31ac-7325-bb4b92392aae	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a7-31ac-7be1-5e9d080d4bd4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a7-31ac-1a57-4243c4c05678	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a7-31ac-8139-4a668edb6383	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a7-31ac-146e-aa0602c4e292	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a7-31ac-fdbb-34d4d68470fe	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a7-31ac-58c2-c433b937c60d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a7-31ac-880f-37f56c3df4dd	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a7-31ac-6c52-1554a63bb9bf	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a7-31ac-5176-0420a45ebdf8	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a7-31ac-83a5-236f8eceb404	Abonma-read	Abonma - branje	t
00030000-56a7-31ac-d70e-bd2769efb7c9	Abonma-write	Abonma - spreminjanje	t
00030000-56a7-31ac-8618-ce4d081bce5b	Alternacija-read	Alternacija - branje	t
00030000-56a7-31ac-0158-9c60d6f358dc	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a7-31ac-ef57-62c23e07db28	Arhivalija-read	Arhivalija - branje	t
00030000-56a7-31ac-b96f-ed4dbc9126b8	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a7-31ac-eaff-8c4db80f9d55	AuthStorage-read	AuthStorage - branje	t
00030000-56a7-31ac-9064-8705ea1d7f67	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a7-31ac-07b0-790d7be38cae	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a7-31ac-50ee-a0a3a8361c80	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a7-31ac-e388-b0bd4013be5a	Besedilo-read	Besedilo - branje	t
00030000-56a7-31ac-c203-ad11452c4f1f	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a7-31ac-efe0-f10af8f5fee7	Dodatek-read	Dodatek - branje	t
00030000-56a7-31ac-caec-69cfd2fe4321	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a7-31ac-71fd-927151e04260	Dogodek-read	Dogodek - branje	t
00030000-56a7-31ac-2bfc-03647e106370	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a7-31ac-284a-22533db34baa	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a7-31ac-6dd4-4ca819602cd2	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a7-31ac-70b2-e922ae079d2a	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a7-31ac-842e-4ce7050653d9	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a7-31ac-331d-63e357e39914	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a7-31ac-8054-5b432cddb47b	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a7-31ac-9962-df59555457d1	DrugiVir-read	DrugiVir - branje	t
00030000-56a7-31ac-2474-ec06a9eb527b	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a7-31ac-847a-0b63364fdfa4	Drzava-read	Drzava - branje	t
00030000-56a7-31ac-4505-94524e8df885	Drzava-write	Drzava - spreminjanje	t
00030000-56a7-31ac-5d0f-468ed180ee55	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a7-31ac-d2bb-537dfbb0581c	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a7-31ac-5149-3770f63d0021	Funkcija-read	Funkcija - branje	t
00030000-56a7-31ac-1007-d109461a0f0c	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a7-31ac-e8a2-8d449877943d	Gostovanje-read	Gostovanje - branje	t
00030000-56a7-31ac-efab-7e13096ab324	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a7-31ac-7e48-3869de08d5c2	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a7-31ac-c4bb-4d51f1d6ff18	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a7-31ac-bf3e-90d3c71c134d	Kupec-read	Kupec - branje	t
00030000-56a7-31ac-7f06-dc3fb4c42a57	Kupec-write	Kupec - spreminjanje	t
00030000-56a7-31ac-1555-57010a75cd8c	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a7-31ac-22e9-7d0006240e6c	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a7-31ac-cb23-093ba8168687	Option-read	Option - branje	t
00030000-56a7-31ac-9da8-0b2a5a2ba891	Option-write	Option - spreminjanje	t
00030000-56a7-31ac-66d6-4a5f8f4571ee	OptionValue-read	OptionValue - branje	t
00030000-56a7-31ac-a802-6322e52cbbbc	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a7-31ac-d96a-bf6e1786e6c8	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a7-31ac-9177-194aebc6771c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a7-31ac-8cf5-fc665286a860	Oseba-read	Oseba - branje	t
00030000-56a7-31ac-043e-d89b601ea353	Oseba-write	Oseba - spreminjanje	t
00030000-56a7-31ac-0530-594af2429c87	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a7-31ac-e370-e0b37852a597	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a7-31ac-bb89-7c0f52724896	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a7-31ac-3654-7e8811c4559e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a7-31ac-7114-17bd8019f5b4	Pogodba-read	Pogodba - branje	t
00030000-56a7-31ac-a76c-85d37d4411ff	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a7-31ac-f15a-284b1b607c01	Popa-read	Popa - branje	t
00030000-56a7-31ac-8a53-0e07a245c7df	Popa-write	Popa - spreminjanje	t
00030000-56a7-31ac-2b3f-5ce04989a1da	Posta-read	Posta - branje	t
00030000-56a7-31ac-3a4b-ca8bc127179e	Posta-write	Posta - spreminjanje	t
00030000-56a7-31ac-94d9-d55088e99cd5	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a7-31ac-817b-033699cc4b7a	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a7-31ac-2aa2-a95d9fad3b71	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a7-31ac-f6be-5887426f9506	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a7-31ac-e40c-5987ec855e23	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a7-31ac-7793-d4c480e7b030	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a7-31ac-34d0-7fcde40939eb	Praznik-read	Praznik - branje	t
00030000-56a7-31ac-7853-870c40435cc7	Praznik-write	Praznik - spreminjanje	t
00030000-56a7-31ac-de34-ca7fce8e1fbd	Predstava-read	Predstava - branje	t
00030000-56a7-31ac-3fb3-83700254a141	Predstava-write	Predstava - spreminjanje	t
00030000-56a7-31ac-901e-a080888a6492	Ura-read	Ura - branje	t
00030000-56a7-31ac-f3d0-c8e0561e18df	Ura-write	Ura - spreminjanje	t
00030000-56a7-31ac-aded-d8a3076df422	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a7-31ac-36a4-4e3e5619bd08	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a7-31ac-3034-ebae07c695a3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a7-31ac-0b55-af2947ecb410	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a7-31ac-f085-d3f91185ab09	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a7-31ac-972e-465195fb7fae	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a7-31ac-faf8-6b06cb63c50c	ProgramDela-read	ProgramDela - branje	t
00030000-56a7-31ac-24eb-e6d875bebf47	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a7-31ac-569d-749586d8afba	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a7-31ac-1c2a-ffb6ed5ac73a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a7-31ac-2c29-7fe23764336c	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a7-31ac-e2ca-3e51d33adc41	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a7-31ac-2d1d-0f8e341cb196	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a7-31ac-11d7-7ef60f295531	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a7-31ac-9f11-0119ef7bfc82	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a7-31ac-fe26-46c74f3c5455	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a7-31ac-314e-e58cebaff6ad	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a7-31ac-8217-e9d489933dee	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a7-31ac-618d-a3548146ac40	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a7-31ac-39d5-52e75cfb77b4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a7-31ac-db63-4971cb31df88	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a7-31ac-b793-d1f4b5e97d14	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a7-31ac-f0c0-3850f23a50d3	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a7-31ac-73ab-299b3f2e5649	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a7-31ac-882e-511b1b49fa85	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a7-31ac-24ce-ca7d3b315f10	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a7-31ac-170f-be8c89a7a92a	Prostor-read	Prostor - branje	t
00030000-56a7-31ac-66ca-3bee83cf901b	Prostor-write	Prostor - spreminjanje	t
00030000-56a7-31ac-5a3b-a7241ef9e8d0	Racun-read	Racun - branje	t
00030000-56a7-31ac-18d0-710555d1a2d6	Racun-write	Racun - spreminjanje	t
00030000-56a7-31ac-285d-7b3afeb1ae29	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a7-31ac-733e-789043ed1072	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a7-31ac-2dfc-51bcd2d909f9	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a7-31ac-ff83-605a852644f4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a7-31ac-9d2e-5be1baa57e09	Rekvizit-read	Rekvizit - branje	t
00030000-56a7-31ac-6ae1-848582e2367f	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a7-31ac-10ab-ccff4812a17c	Revizija-read	Revizija - branje	t
00030000-56a7-31ac-f5c6-f7813eee03fe	Revizija-write	Revizija - spreminjanje	t
00030000-56a7-31ac-9837-8abb903b8585	Rezervacija-read	Rezervacija - branje	t
00030000-56a7-31ac-814d-141abdc52482	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a7-31ac-ecf5-a1bb8ca8f26f	SedezniRed-read	SedezniRed - branje	t
00030000-56a7-31ac-6bcf-71d9b3bba3c2	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a7-31ac-1f70-7963d232f531	Sedez-read	Sedez - branje	t
00030000-56a7-31ac-613f-dea96546eac5	Sedez-write	Sedez - spreminjanje	t
00030000-56a7-31ac-6ddf-1fbfdd7c6f5b	Sezona-read	Sezona - branje	t
00030000-56a7-31ac-3655-d05ae3f66cf2	Sezona-write	Sezona - spreminjanje	t
00030000-56a7-31ac-f806-ae508c95ce98	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a7-31ac-2d0f-555fbb322f13	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a7-31ac-8c2f-74e738f267c1	Telefonska-read	Telefonska - branje	t
00030000-56a7-31ac-4cb3-b746294e9b9d	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a7-31ac-ec3b-58cf3523ca15	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a7-31ac-eabd-723fdffc4689	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a7-31ac-de8b-c9eda77a0202	TipDodatka-read	TipDodatka - branje	t
00030000-56a7-31ac-3860-012e66b77559	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a7-31ac-5205-efe260c4aee5	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a7-31ac-3296-81889d5f5744	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a7-31ac-c0fb-ac549ef14464	TipPopa-read	TipPopa - branje	t
00030000-56a7-31ac-ba0e-0a341af2fbde	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a7-31ac-48de-55a58cdf9818	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a7-31ac-d592-8e8d384fc301	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a7-31ac-8d6b-2d2c2a56c4bd	TipVaje-read	TipVaje - branje	t
00030000-56a7-31ac-26ea-f36ff688df77	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a7-31ac-5777-0553a6047417	Trr-read	Trr - branje	t
00030000-56a7-31ac-debb-d47e86ba07cb	Trr-write	Trr - spreminjanje	t
00030000-56a7-31ac-8b53-b060fc58c7f2	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a7-31ac-929d-f50c086246d2	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a7-31ac-58f0-ed133727ca41	Vaja-read	Vaja - branje	t
00030000-56a7-31ac-314e-e666ada1512e	Vaja-write	Vaja - spreminjanje	t
00030000-56a7-31ac-67c7-fcfad1c1f97a	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a7-31ac-2d69-02bcde984346	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a7-31ac-3cd5-60291dcc9fe3	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a7-31ac-b56b-fd6b32de3550	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a7-31ac-920a-ad572f095b19	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a7-31ac-61b1-67db7117d1f3	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a7-31ac-88e7-e27244248331	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a7-31ac-5fd2-0298ccc63c56	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a7-31ac-da71-6d369afcbf34	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a7-31ac-8d72-c59f9d8098de	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a7-31ac-b7ed-78b1fee64806	Job-read	Branje opravil - samo zase - branje	t
00030000-56a7-31ac-77a8-1d5d12ba84ff	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a7-31ac-a2ec-1dc165241334	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a7-31ac-1cdb-6ee606ea920c	Report-read	Report - branje	t
00030000-56a7-31ac-10fc-7cdb08d250e5	Report-write	Report - spreminjanje	t
00030000-56a7-31ac-9aa7-9c3287ebfe68	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a7-31ac-a62a-6bb3bedeae6a	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a7-31ac-fc11-e0b24548f808	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a7-31ac-f274-e7832aa54185	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a7-31ac-2a4f-6c29e59a3d2a	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a7-31ac-2190-f5148df822b2	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a7-31ac-f791-1400270cd06c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a7-31ac-f210-003bf706d083	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a7-31ac-e3db-26c95d6971b6	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a7-31ac-f495-60dee55d6efd	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a7-31ac-922f-58dad854e086	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a7-31ac-f186-0e48b828df4c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a7-31ac-b277-252f5d371635	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a7-31ac-f0f4-8e5793704177	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a7-31ac-bbd8-c3a0f3f6451a	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 40360247)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a7-31ac-b66e-8fad3c71735c	00030000-56a7-31ac-7325-bb4b92392aae
00020000-56a7-31ac-b66e-8fad3c71735c	00030000-56a7-31ac-9e4d-fd4ae5054e64
00020000-56a7-31ac-0cf5-564915c8eed3	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-50ee-a0a3a8361c80
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-c203-ad11452c4f1f
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-4252-f3f536c9ffad	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-67cb-b8e0e0f2c291	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ac-67cb-b8e0e0f2c291	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-67cb-b8e0e0f2c291	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-67cb-b8e0e0f2c291	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-67cb-b8e0e0f2c291	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-67cb-b8e0e0f2c291	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-8c06-043acf28e218	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-8c06-043acf28e218	00030000-56a7-31ac-61b1-67db7117d1f3
00020000-56a7-31ac-8c06-043acf28e218	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-8c06-043acf28e218	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ac-8c06-043acf28e218	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-8c06-043acf28e218	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-8c06-043acf28e218	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-5bf4-6e14ff4a7940	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-5bf4-6e14ff4a7940	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-5bf4-6e14ff4a7940	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-6d69-0eff479f3655	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-6d69-0eff479f3655	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-6d69-0eff479f3655	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-6d69-0eff479f3655	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-6d69-0eff479f3655	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-6d69-0eff479f3655	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-6d69-0eff479f3655	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-6d69-0eff479f3655	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-01b9-0bf1a81cccf3	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-01b9-0bf1a81cccf3	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-01b9-0bf1a81cccf3	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-01b9-0bf1a81cccf3	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-debb-d47e86ba07cb
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-7793-d4c480e7b030
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-4cb3-b746294e9b9d
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-3dc5-f357aa6297eb	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-d60c-36dee63c0ac4	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-d60c-36dee63c0ac4	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-d60c-36dee63c0ac4	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-d60c-36dee63c0ac4	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-d60c-36dee63c0ac4	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-d60c-36dee63c0ac4	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-d60c-36dee63c0ac4	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-4cb3-b746294e9b9d
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-7793-d4c480e7b030
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-debb-d47e86ba07cb
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-8a53-0e07a245c7df
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-c4bb-4d51f1d6ff18
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-972e-465195fb7fae
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-3eab-822d3918a942	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-48ba-3f4b393f4cd4	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-cdee-036951b07ed2	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-cdee-036951b07ed2	00030000-56a7-31ac-ba0e-0a341af2fbde
00020000-56a7-31ac-dd7d-9cb7599b564a	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-0dd1-c4d2452016f5	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-0dd1-c4d2452016f5	00030000-56a7-31ac-3a4b-ca8bc127179e
00020000-56a7-31ac-57ff-3c67c2a55086	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-fa2e-5183c5f3a68e	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-fa2e-5183c5f3a68e	00030000-56a7-31ac-4505-94524e8df885
00020000-56a7-31ac-f81a-474f88a2e8e5	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-749f-75f175a13d7d	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ac-749f-75f175a13d7d	00030000-56a7-31ac-8d72-c59f9d8098de
00020000-56a7-31ac-b382-eeafd46739db	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ac-da29-cdbe978dac70	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-da29-cdbe978dac70	00030000-56a7-31ac-5fd2-0298ccc63c56
00020000-56a7-31ac-a6a8-46498af61156	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-04ce-a21489748ffd	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ac-04ce-a21489748ffd	00030000-56a7-31ac-d70e-bd2769efb7c9
00020000-56a7-31ac-fc5e-47ea3f12ebcb	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ac-16ae-f7f8da63d387	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-16ae-f7f8da63d387	00030000-56a7-31ac-66ca-3bee83cf901b
00020000-56a7-31ac-16ae-f7f8da63d387	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-16ae-f7f8da63d387	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-16ae-f7f8da63d387	00030000-56a7-31ac-7793-d4c480e7b030
00020000-56a7-31ac-16ae-f7f8da63d387	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-26b5-8b8662958b1d	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-26b5-8b8662958b1d	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-26b5-8b8662958b1d	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-0c4b-54e7c76e8501	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-0c4b-54e7c76e8501	00030000-56a7-31ac-b56b-fd6b32de3550
00020000-56a7-31ac-94ac-29e58d8a63fe	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-9177-194aebc6771c
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-538f-8854de22ef2a	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-1d08-52c0ab22e114	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-1d08-52c0ab22e114	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-1d08-52c0ab22e114	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-1d08-52c0ab22e114	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-1d08-52c0ab22e114	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-f707-34e900df3da2	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ac-f707-34e900df3da2	00030000-56a7-31ac-26ea-f36ff688df77
00020000-56a7-31ac-2027-993b12568e14	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-fdbb-34d4d68470fe
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-58c2-c433b937c60d
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-faf8-6b06cb63c50c
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-24eb-e6d875bebf47
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-569d-749586d8afba
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-1c2a-ffb6ed5ac73a
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-2c29-7fe23764336c
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-e2ca-3e51d33adc41
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-2d1d-0f8e341cb196
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-11d7-7ef60f295531
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-9f11-0119ef7bfc82
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-fe26-46c74f3c5455
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-314e-e58cebaff6ad
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-8217-e9d489933dee
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-618d-a3548146ac40
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-39d5-52e75cfb77b4
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-db63-4971cb31df88
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-b793-d1f4b5e97d14
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-f0c0-3850f23a50d3
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-73ab-299b3f2e5649
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-882e-511b1b49fa85
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-24ce-ca7d3b315f10
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-0b55-af2947ecb410
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-2474-ec06a9eb527b
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-817b-033699cc4b7a
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-77a8-1d5d12ba84ff
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-9962-df59555457d1
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-3034-ebae07c695a3
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-94d9-d55088e99cd5
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-b7ed-78b1fee64806
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-88c4-3cb2bab9b45f	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-faf8-6b06cb63c50c
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-569d-749586d8afba
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-2c29-7fe23764336c
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-2d1d-0f8e341cb196
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-9f11-0119ef7bfc82
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-314e-e58cebaff6ad
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-618d-a3548146ac40
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-db63-4971cb31df88
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-f0c0-3850f23a50d3
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-882e-511b1b49fa85
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-3034-ebae07c695a3
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-9962-df59555457d1
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-94d9-d55088e99cd5
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-b7ed-78b1fee64806
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-19dd-ed3555356f8f	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-929d-f50c086246d2
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-6c52-1554a63bb9bf
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-a1c3-5047f7b35ad3	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-4501-5db672b92160	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-79ab-fb59771e3f64	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-79ab-fb59771e3f64	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-79ab-fb59771e3f64	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-79ab-fb59771e3f64	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ac-79ab-fb59771e3f64	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-79ab-fb59771e3f64	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-79ab-fb59771e3f64	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-79ab-fb59771e3f64	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-a76c-85d37d4411ff
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-2d0f-555fbb322f13
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-f7c4-9c10bb8a6322	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-f886-62d62eb64706	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-760e-42f872f0e260	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-760e-42f872f0e260	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-760e-42f872f0e260	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-760e-42f872f0e260	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-760e-42f872f0e260	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-760e-42f872f0e260	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-760e-42f872f0e260	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-5c08-de34f39e12d3	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-5c08-de34f39e12d3	00030000-56a7-31ac-2d0f-555fbb322f13
00020000-56a7-31ac-5c08-de34f39e12d3	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-5c08-de34f39e12d3	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-bd6e-3164ddca66f6	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-bd6e-3164ddca66f6	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-50ee-a0a3a8361c80
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-c203-ad11452c4f1f
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-9962-df59555457d1
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-2474-ec06a9eb527b
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-6c52-1554a63bb9bf
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-b7ed-78b1fee64806
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-77a8-1d5d12ba84ff
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-a76c-85d37d4411ff
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-94d9-d55088e99cd5
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-817b-033699cc4b7a
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-3034-ebae07c695a3
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-0b55-af2947ecb410
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-fdbb-34d4d68470fe
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-faf8-6b06cb63c50c
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-58c2-c433b937c60d
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-24eb-e6d875bebf47
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-569d-749586d8afba
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-1c2a-ffb6ed5ac73a
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-2c29-7fe23764336c
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-e2ca-3e51d33adc41
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-2d1d-0f8e341cb196
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-11d7-7ef60f295531
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-9f11-0119ef7bfc82
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-fe26-46c74f3c5455
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-314e-e58cebaff6ad
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-8217-e9d489933dee
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-618d-a3548146ac40
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-39d5-52e75cfb77b4
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-db63-4971cb31df88
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-b793-d1f4b5e97d14
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-f0c0-3850f23a50d3
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-73ab-299b3f2e5649
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-882e-511b1b49fa85
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-24ce-ca7d3b315f10
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-2d0f-555fbb322f13
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-929d-f50c086246d2
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-4d38-dac260593181	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-50ee-a0a3a8361c80
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-c203-ad11452c4f1f
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-8736-16ab139bf92d	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-50ee-a0a3a8361c80
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-c203-ad11452c4f1f
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-6c52-1554a63bb9bf
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-929d-f50c086246d2
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-bebf-f4b35df80b61	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-50ee-a0a3a8361c80
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-c203-ad11452c4f1f
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-9962-df59555457d1
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-2474-ec06a9eb527b
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-6c52-1554a63bb9bf
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-b7ed-78b1fee64806
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-77a8-1d5d12ba84ff
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-c4bb-4d51f1d6ff18
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-a76c-85d37d4411ff
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-8a53-0e07a245c7df
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-94d9-d55088e99cd5
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-817b-033699cc4b7a
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-7793-d4c480e7b030
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-3034-ebae07c695a3
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-0b55-af2947ecb410
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-972e-465195fb7fae
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-fdbb-34d4d68470fe
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-faf8-6b06cb63c50c
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-58c2-c433b937c60d
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-24eb-e6d875bebf47
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-569d-749586d8afba
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-1c2a-ffb6ed5ac73a
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-2c29-7fe23764336c
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-e2ca-3e51d33adc41
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-2d1d-0f8e341cb196
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-11d7-7ef60f295531
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-9f11-0119ef7bfc82
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-fe26-46c74f3c5455
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-314e-e58cebaff6ad
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-8217-e9d489933dee
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-618d-a3548146ac40
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-39d5-52e75cfb77b4
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-db63-4971cb31df88
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-b793-d1f4b5e97d14
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-f0c0-3850f23a50d3
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-73ab-299b3f2e5649
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-882e-511b1b49fa85
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-24ce-ca7d3b315f10
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-2d0f-555fbb322f13
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-4cb3-b746294e9b9d
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-debb-d47e86ba07cb
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-929d-f50c086246d2
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-61b1-67db7117d1f3
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-3acb-0782b1f15d31	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-50ee-a0a3a8361c80
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-c203-ad11452c4f1f
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-6c52-1554a63bb9bf
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-c4bb-4d51f1d6ff18
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-8a53-0e07a245c7df
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-7793-d4c480e7b030
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-972e-465195fb7fae
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-4cb3-b746294e9b9d
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-debb-d47e86ba07cb
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-929d-f50c086246d2
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-61b1-67db7117d1f3
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-1424-296604ef3648	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-c022-f26e9d37cbb6	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-9962-df59555457d1
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-2474-ec06a9eb527b
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-b7ed-78b1fee64806
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-77a8-1d5d12ba84ff
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-c4bb-4d51f1d6ff18
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-9177-194aebc6771c
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-a76c-85d37d4411ff
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-8a53-0e07a245c7df
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-94d9-d55088e99cd5
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-817b-033699cc4b7a
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-7793-d4c480e7b030
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-3034-ebae07c695a3
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-0b55-af2947ecb410
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-972e-465195fb7fae
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-fdbb-34d4d68470fe
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-faf8-6b06cb63c50c
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-58c2-c433b937c60d
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-24eb-e6d875bebf47
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-569d-749586d8afba
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-1c2a-ffb6ed5ac73a
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-2c29-7fe23764336c
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-e2ca-3e51d33adc41
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-2d1d-0f8e341cb196
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-11d7-7ef60f295531
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-9f11-0119ef7bfc82
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-fe26-46c74f3c5455
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-314e-e58cebaff6ad
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-8217-e9d489933dee
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-618d-a3548146ac40
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-39d5-52e75cfb77b4
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-db63-4971cb31df88
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-b793-d1f4b5e97d14
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-f0c0-3850f23a50d3
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-73ab-299b3f2e5649
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-882e-511b1b49fa85
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-24ce-ca7d3b315f10
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-2d0f-555fbb322f13
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-4cb3-b746294e9b9d
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-debb-d47e86ba07cb
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-b56b-fd6b32de3550
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-61b1-67db7117d1f3
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ac-7c76-05fd336e2feb	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9e4d-fd4ae5054e64
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-7325-bb4b92392aae
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-83a5-236f8eceb404
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-d70e-bd2769efb7c9
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-ef57-62c23e07db28
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-b96f-ed4dbc9126b8
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-eaff-8c4db80f9d55
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9064-8705ea1d7f67
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-07b0-790d7be38cae
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-50ee-a0a3a8361c80
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-e388-b0bd4013be5a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-c203-ad11452c4f1f
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-71fd-927151e04260
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-1a57-4243c4c05678
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-284a-22533db34baa
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-6dd4-4ca819602cd2
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-70b2-e922ae079d2a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-842e-4ce7050653d9
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-331d-63e357e39914
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8054-5b432cddb47b
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2bfc-03647e106370
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9962-df59555457d1
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2474-ec06a9eb527b
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-847a-0b63364fdfa4
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-4505-94524e8df885
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-5d0f-468ed180ee55
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-d2bb-537dfbb0581c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-6c52-1554a63bb9bf
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-e8a2-8d449877943d
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-efab-7e13096ab324
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-a2ec-1dc165241334
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-b7ed-78b1fee64806
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-77a8-1d5d12ba84ff
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-7e48-3869de08d5c2
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-c4bb-4d51f1d6ff18
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-bf3e-90d3c71c134d
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-7f06-dc3fb4c42a57
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f791-1400270cd06c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2190-f5148df822b2
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-a62a-6bb3bedeae6a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-fc11-e0b24548f808
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f274-e7832aa54185
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2a4f-6c29e59a3d2a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-1555-57010a75cd8c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-22e9-7d0006240e6c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-cb23-093ba8168687
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-66d6-4a5f8f4571ee
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-a802-6322e52cbbbc
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-5176-0420a45ebdf8
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9da8-0b2a5a2ba891
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-d96a-bf6e1786e6c8
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9177-194aebc6771c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-0530-594af2429c87
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-e370-e0b37852a597
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-bb89-7c0f52724896
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-3654-7e8811c4559e
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-a76c-85d37d4411ff
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8a53-0e07a245c7df
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2b3f-5ce04989a1da
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-94d9-d55088e99cd5
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-817b-033699cc4b7a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2aa2-a95d9fad3b71
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f6be-5887426f9506
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-3a4b-ca8bc127179e
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-7793-d4c480e7b030
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-34d0-7fcde40939eb
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-7853-870c40435cc7
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-de34-ca7fce8e1fbd
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-3fb3-83700254a141
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-aded-d8a3076df422
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-36a4-4e3e5619bd08
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-3034-ebae07c695a3
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-0b55-af2947ecb410
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f085-d3f91185ab09
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-972e-465195fb7fae
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-fdbb-34d4d68470fe
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-faf8-6b06cb63c50c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-58c2-c433b937c60d
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-24eb-e6d875bebf47
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-569d-749586d8afba
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-1c2a-ffb6ed5ac73a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2c29-7fe23764336c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-e2ca-3e51d33adc41
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2d1d-0f8e341cb196
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-11d7-7ef60f295531
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9f11-0119ef7bfc82
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-fe26-46c74f3c5455
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-314e-e58cebaff6ad
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8217-e9d489933dee
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-618d-a3548146ac40
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-39d5-52e75cfb77b4
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-db63-4971cb31df88
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-b793-d1f4b5e97d14
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f0c0-3850f23a50d3
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-73ab-299b3f2e5649
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-882e-511b1b49fa85
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-24ce-ca7d3b315f10
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-170f-be8c89a7a92a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-66ca-3bee83cf901b
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-5a3b-a7241ef9e8d0
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-18d0-710555d1a2d6
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-285d-7b3afeb1ae29
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-733e-789043ed1072
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2dfc-51bcd2d909f9
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-ff83-605a852644f4
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9d2e-5be1baa57e09
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-6ae1-848582e2367f
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-1cdb-6ee606ea920c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-10fc-7cdb08d250e5
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-10ab-ccff4812a17c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f5c6-f7813eee03fe
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9837-8abb903b8585
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-814d-141abdc52482
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-ecf5-a1bb8ca8f26f
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-6bcf-71d9b3bba3c2
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-1f70-7963d232f531
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-613f-dea96546eac5
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-6ddf-1fbfdd7c6f5b
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-3655-d05ae3f66cf2
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-9aa7-9c3287ebfe68
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2d0f-555fbb322f13
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-4cb3-b746294e9b9d
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-ec3b-58cf3523ca15
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-7be1-5e9d080d4bd4
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-eabd-723fdffc4689
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-5205-efe260c4aee5
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-3296-81889d5f5744
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-c0fb-ac549ef14464
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-ba0e-0a341af2fbde
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-48de-55a58cdf9818
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-d592-8e8d384fc301
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8d6b-2d2c2a56c4bd
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-26ea-f36ff688df77
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-debb-d47e86ba07cb
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-929d-f50c086246d2
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-58f0-ed133727ca41
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-314e-e666ada1512e
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-67c7-fcfad1c1f97a
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-2d69-02bcde984346
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-3cd5-60291dcc9fe3
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-b56b-fd6b32de3550
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-b277-252f5d371635
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f186-0e48b828df4c
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-61b1-67db7117d1f3
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-88e7-e27244248331
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-5fd2-0298ccc63c56
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-da71-6d369afcbf34
00020000-56a7-31ae-3b1d-8c039d954da0	00030000-56a7-31ac-8d72-c59f9d8098de
00020000-56a7-31ae-f5c9-e315da7223db	00030000-56a7-31ac-922f-58dad854e086
00020000-56a7-31ae-dcae-57c59c6717e9	00030000-56a7-31ac-f495-60dee55d6efd
00020000-56a7-31ae-3706-1cdc72facef7	00030000-56a7-31ac-929d-f50c086246d2
00020000-56a7-31ae-11e9-b1009cb3ba10	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ae-1935-33815a8285c5	00030000-56a7-31ac-fc11-e0b24548f808
00020000-56a7-31ae-0e19-eb9b170745bd	00030000-56a7-31ac-f274-e7832aa54185
00020000-56a7-31ae-dc42-0aa7b513b193	00030000-56a7-31ac-2a4f-6c29e59a3d2a
00020000-56a7-31ae-014d-784d0ff7f003	00030000-56a7-31ac-a62a-6bb3bedeae6a
00020000-56a7-31ae-365e-b4648803be44	00030000-56a7-31ac-f791-1400270cd06c
00020000-56a7-31ae-8a18-9e5ede987b76	00030000-56a7-31ac-2190-f5148df822b2
00020000-56a7-31ae-771f-46e14d42d954	00030000-56a7-31ac-e3db-26c95d6971b6
00020000-56a7-31ae-73ee-a655fd00744a	00030000-56a7-31ac-f210-003bf706d083
00020000-56a7-31ae-832f-c566aee007d1	00030000-56a7-31ac-8cf5-fc665286a860
00020000-56a7-31ae-8844-2299cf41f7ad	00030000-56a7-31ac-043e-d89b601ea353
00020000-56a7-31ae-1570-0c1b3ca3dfa2	00030000-56a7-31ac-8139-4a668edb6383
00020000-56a7-31ae-13ca-740c95302b5b	00030000-56a7-31ac-146e-aa0602c4e292
00020000-56a7-31ae-bc84-52caee143a98	00030000-56a7-31ac-f0f4-8e5793704177
00020000-56a7-31ae-95a9-7e0c65821ee5	00030000-56a7-31ac-bbd8-c3a0f3f6451a
00020000-56a7-31ae-588c-bab034e08f91	00030000-56a7-31ac-f15a-284b1b607c01
00020000-56a7-31ae-588c-bab034e08f91	00030000-56a7-31ac-8a53-0e07a245c7df
00020000-56a7-31ae-588c-bab034e08f91	00030000-56a7-31ac-8b53-b060fc58c7f2
00020000-56a7-31ae-bf18-0fec5fd6e3c6	00030000-56a7-31ac-5777-0553a6047417
00020000-56a7-31ae-1e14-e4504f5bdca4	00030000-56a7-31ac-debb-d47e86ba07cb
00020000-56a7-31ae-4fb9-5ffa464c0170	00030000-56a7-31ac-9aa7-9c3287ebfe68
00020000-56a7-31ae-22b2-28772e31f5ec	00030000-56a7-31ac-8c2f-74e738f267c1
00020000-56a7-31ae-e475-f00c1b0a50c5	00030000-56a7-31ac-4cb3-b746294e9b9d
00020000-56a7-31ae-a3d4-ec82c71718d0	00030000-56a7-31ac-e40c-5987ec855e23
00020000-56a7-31ae-8c21-153dac09d4f1	00030000-56a7-31ac-7793-d4c480e7b030
00020000-56a7-31ae-6865-97eb411cfc01	00030000-56a7-31ac-920a-ad572f095b19
00020000-56a7-31ae-7d3a-df300cc41586	00030000-56a7-31ac-61b1-67db7117d1f3
00020000-56a7-31ae-2f47-1b563effb8b3	00030000-56a7-31ac-7114-17bd8019f5b4
00020000-56a7-31ae-3593-dc5920f68e61	00030000-56a7-31ac-a76c-85d37d4411ff
00020000-56a7-31ae-8570-8add266ad5b3	00030000-56a7-31ac-f806-ae508c95ce98
00020000-56a7-31ae-5ef3-34f40d37e9a8	00030000-56a7-31ac-2d0f-555fbb322f13
00020000-56a7-31ae-c664-890778868e26	00030000-56a7-31ac-8618-ce4d081bce5b
00020000-56a7-31ae-93aa-c2b89573117f	00030000-56a7-31ac-0158-9c60d6f358dc
00020000-56a7-31ae-2d7f-5a212b14e606	00030000-56a7-31ac-880f-37f56c3df4dd
00020000-56a7-31ae-dafb-c35e70949553	00030000-56a7-31ac-5149-3770f63d0021
00020000-56a7-31ae-17df-2d70e8f9b277	00030000-56a7-31ac-1007-d109461a0f0c
00020000-56a7-31ae-6126-897164825a67	00030000-56a7-31ac-6c52-1554a63bb9bf
\.


--
-- TOC entry 3181 (class 0 OID 40360645)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 40360680)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 40360813)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a7-31ae-260a-24ae07a8332f	00090000-56a7-31ae-3baf-94590e9f6735	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a7-31ae-d5cd-6d93b5cac924	00090000-56a7-31ae-5f79-0fe2f24556da	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a7-31ae-9f8c-c7137073daa3	00090000-56a7-31ae-2c96-2139309bad7f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a7-31ae-cc60-ef000a8ae098	00090000-56a7-31ae-de34-f1d691d89def	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 40360330)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a7-31ae-83e0-f36154ef6217	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-31ae-0563-1df136d18702	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a7-31ae-d0f3-79d170e3929b	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-31ae-48e8-e268f4f0b08c	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-31ae-41ab-311211e45cf3	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-31ae-f9c9-5bd026acb7cd	\N	00040000-56a7-31ab-c2fe-cc1d78a315d8	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-31ae-afa9-a0a1319e6cb0	\N	00040000-56a7-31ab-448e-d896d9187abc	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-31ae-0cc9-b20b3aa5f05d	\N	00040000-56a7-31ab-bb12-5c343663610e	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-31ae-af92-132b2cb9f687	\N	00040000-56a7-31ab-c61a-cb68e4b84416	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-31b0-bd72-3beb799e6a2a	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 40360375)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a7-31ab-86ea-7fc2e814fe7a	8341	Adlešiči
00050000-56a7-31ab-d713-5e8936ebf759	5270	Ajdovščina
00050000-56a7-31ab-507c-279f3fa42331	6280	Ankaran/Ancarano
00050000-56a7-31ab-5345-d98a2ba08560	9253	Apače
00050000-56a7-31ab-c302-51c76c91b277	8253	Artiče
00050000-56a7-31ab-70d2-8445888cf437	4275	Begunje na Gorenjskem
00050000-56a7-31ab-d453-fa485eeaea69	1382	Begunje pri Cerknici
00050000-56a7-31ab-a14b-c40ff3420f0b	9231	Beltinci
00050000-56a7-31ab-9cd2-c3e1aa230a05	2234	Benedikt
00050000-56a7-31ab-b565-76438090465b	2345	Bistrica ob Dravi
00050000-56a7-31ab-3e37-615b5519874d	3256	Bistrica ob Sotli
00050000-56a7-31ab-d1e8-af8243b37da2	8259	Bizeljsko
00050000-56a7-31ab-540a-4c814a6ae6a5	1223	Blagovica
00050000-56a7-31ab-3c4d-918e900b4709	8283	Blanca
00050000-56a7-31ab-5657-525fabe2a81e	4260	Bled
00050000-56a7-31ab-d178-8048e21bf3cb	4273	Blejska Dobrava
00050000-56a7-31ab-718f-860d969ad8fd	9265	Bodonci
00050000-56a7-31ab-ffb8-9214942ed940	9222	Bogojina
00050000-56a7-31ab-524f-e97f3f5c9785	4263	Bohinjska Bela
00050000-56a7-31ab-3617-b55dd4d0a224	4264	Bohinjska Bistrica
00050000-56a7-31ab-9592-52556d530c8b	4265	Bohinjsko jezero
00050000-56a7-31ab-aca5-3b33d2bab0ad	1353	Borovnica
00050000-56a7-31ab-a72b-6533ca8f2003	8294	Boštanj
00050000-56a7-31ab-c27e-534c2ca2b3fc	5230	Bovec
00050000-56a7-31ab-a3f2-58bf88d38e70	5295	Branik
00050000-56a7-31ab-1ce8-0c49ffa6b646	3314	Braslovče
00050000-56a7-31ab-8278-b82525bab410	5223	Breginj
00050000-56a7-31ab-b8bf-8036e2d15159	8280	Brestanica
00050000-56a7-31ab-ce6b-ce66643c2d44	2354	Bresternica
00050000-56a7-31ab-a670-34a08bcc8f7a	4243	Brezje
00050000-56a7-31ab-1820-b2e0010e1e8c	1351	Brezovica pri Ljubljani
00050000-56a7-31ab-8c13-2fdfa0ddb97e	8250	Brežice
00050000-56a7-31ab-d623-0eb951ee88c4	4210	Brnik - Aerodrom
00050000-56a7-31ab-cdab-90fee0d1e5fd	8321	Brusnice
00050000-56a7-31ab-8e64-dadc08c427be	3255	Buče
00050000-56a7-31ab-5269-763f1894ffd7	8276	Bučka 
00050000-56a7-31ab-0b84-c8883d20d27a	9261	Cankova
00050000-56a7-31ab-2ec5-e9dc072ae63e	3000	Celje 
00050000-56a7-31ab-c0ba-75e71d06463c	3001	Celje - poštni predali
00050000-56a7-31ab-c009-27cea3ca586f	4207	Cerklje na Gorenjskem
00050000-56a7-31ab-a8be-95c280f47c69	8263	Cerklje ob Krki
00050000-56a7-31ab-43e5-3ef0ec0c44e4	1380	Cerknica
00050000-56a7-31ab-5603-4012c8cf0051	5282	Cerkno
00050000-56a7-31ab-ced8-a642c3c3b5c1	2236	Cerkvenjak
00050000-56a7-31ab-f371-ebb18a36bdfb	2215	Ceršak
00050000-56a7-31ab-4218-707ca45315eb	2326	Cirkovce
00050000-56a7-31ab-b79d-1685a547a5b8	2282	Cirkulane
00050000-56a7-31ab-4198-ad0546de68e3	5273	Col
00050000-56a7-31ab-50d2-6bd65f2a2929	8251	Čatež ob Savi
00050000-56a7-31ab-721b-7ce113cd9caa	1413	Čemšenik
00050000-56a7-31ab-c7f2-92ea52aa4961	5253	Čepovan
00050000-56a7-31ab-2013-d3d2b4d9034b	9232	Črenšovci
00050000-56a7-31ab-faec-8831ae39f481	2393	Črna na Koroškem
00050000-56a7-31ab-d7eb-923f4bd01806	6275	Črni Kal
00050000-56a7-31ab-00f7-8ff60d42e4ab	5274	Črni Vrh nad Idrijo
00050000-56a7-31ab-af8d-c48669df8cdd	5262	Črniče
00050000-56a7-31ab-0fb4-18230daa12ad	8340	Črnomelj
00050000-56a7-31ab-6533-a38ba8c239a4	6271	Dekani
00050000-56a7-31ab-4d60-245b285e5feb	5210	Deskle
00050000-56a7-31ab-a729-eabb2afad428	2253	Destrnik
00050000-56a7-31ab-5543-a6e670e9d15a	6215	Divača
00050000-56a7-31ab-6df4-da52fd43a176	1233	Dob
00050000-56a7-31ab-3cc2-d88e21031585	3224	Dobje pri Planini
00050000-56a7-31ab-c9da-8d1a85a8114e	8257	Dobova
00050000-56a7-31ab-d536-cc60a4123639	1423	Dobovec
00050000-56a7-31ab-ebaf-b75c0392f784	5263	Dobravlje
00050000-56a7-31ab-2dfe-5a779ccbb056	3204	Dobrna
00050000-56a7-31ab-9ea6-d073510e4fbd	8211	Dobrnič
00050000-56a7-31ab-b38d-c00ba3236251	1356	Dobrova
00050000-56a7-31ab-eb22-d06d4f5d37ec	9223	Dobrovnik/Dobronak 
00050000-56a7-31ab-1cab-ba4787ccc91a	5212	Dobrovo v Brdih
00050000-56a7-31ab-1c53-a8096c58e677	1431	Dol pri Hrastniku
00050000-56a7-31ab-f16e-9b0f2253da3e	1262	Dol pri Ljubljani
00050000-56a7-31ab-4a04-9e671bf808ce	1273	Dole pri Litiji
00050000-56a7-31ab-1db1-54f12e746137	1331	Dolenja vas
00050000-56a7-31ab-02cf-29c2554dc764	8350	Dolenjske Toplice
00050000-56a7-31ab-b301-32e21dcc40a2	1230	Domžale
00050000-56a7-31ab-c9de-af29847b6654	2252	Dornava
00050000-56a7-31ab-2bf8-55b06434b331	5294	Dornberk
00050000-56a7-31ab-4343-8437f7e5787c	1319	Draga
00050000-56a7-31ab-bd79-2b09d6993514	8343	Dragatuš
00050000-56a7-31ab-a1dc-530ab6842dae	3222	Dramlje
00050000-56a7-31ab-d688-89c4e26b2a78	2370	Dravograd
00050000-56a7-31ab-9061-c2b4cb3af0bc	4203	Duplje
00050000-56a7-31ab-a54e-f75a99f7ed91	6221	Dutovlje
00050000-56a7-31ab-a7e6-4ae8b5dcde10	8361	Dvor
00050000-56a7-31ab-4315-4117bc3d8655	2343	Fala
00050000-56a7-31ab-fe3b-11bb257cb975	9208	Fokovci
00050000-56a7-31ab-19b3-42591f27ef88	2313	Fram
00050000-56a7-31ab-c1de-73490308f198	3213	Frankolovo
00050000-56a7-31ab-e61c-099da3dfa3f8	1274	Gabrovka
00050000-56a7-31ab-2df4-de3dbfc48381	8254	Globoko
00050000-56a7-31ab-0341-a25cd9824e3b	5275	Godovič
00050000-56a7-31ab-e296-7efc7f6a5255	4204	Golnik
00050000-56a7-31ab-a17d-a3cf8a94d1d4	3303	Gomilsko
00050000-56a7-31ab-9b7e-733afdc0768e	4224	Gorenja vas
00050000-56a7-31ab-bdc1-d3e6254a349f	3263	Gorica pri Slivnici
00050000-56a7-31ab-5190-5ffa8858bbe7	2272	Gorišnica
00050000-56a7-31ab-e9db-a0646c9dd983	9250	Gornja Radgona
00050000-56a7-31ab-c45e-d01e56ef1dae	3342	Gornji Grad
00050000-56a7-31ab-8c5b-c3217e810889	4282	Gozd Martuljek
00050000-56a7-31ab-0345-48143976c4b2	6272	Gračišče
00050000-56a7-31ab-22b1-33ef19037242	9264	Grad
00050000-56a7-31ab-736e-7617efc4a5bc	8332	Gradac
00050000-56a7-31ab-0ff2-c43e4ddf3d36	1384	Grahovo
00050000-56a7-31ab-6b33-c7c62203da3b	5242	Grahovo ob Bači
00050000-56a7-31ab-a507-fc1fcc10b491	5251	Grgar
00050000-56a7-31ab-d099-d407e2653654	3302	Griže
00050000-56a7-31ab-a329-e49b976c2ce9	3231	Grobelno
00050000-56a7-31ab-a934-b5373be5b95c	1290	Grosuplje
00050000-56a7-31ab-c9e6-5d4d4b0e2c00	2288	Hajdina
00050000-56a7-31ab-f446-62e188821e78	8362	Hinje
00050000-56a7-31ab-8c37-1153c2dcf83d	2311	Hoče
00050000-56a7-31ab-e1cd-a94ed1e702e6	9205	Hodoš/Hodos
00050000-56a7-31ab-d05b-a1e8094b1a14	1354	Horjul
00050000-56a7-31ab-92fa-38203959ad6a	1372	Hotedršica
00050000-56a7-31ab-6871-5ea198b537be	1430	Hrastnik
00050000-56a7-31ab-7818-ab504949cd78	6225	Hruševje
00050000-56a7-31ab-43a9-ad38166ed75f	4276	Hrušica
00050000-56a7-31ab-5270-fc1152cfd847	5280	Idrija
00050000-56a7-31ab-33fc-18f632e9b330	1292	Ig
00050000-56a7-31ab-d3c8-3a8cdaa92abe	6250	Ilirska Bistrica
00050000-56a7-31ab-35b3-f7415ba1d514	6251	Ilirska Bistrica-Trnovo
00050000-56a7-31ab-7323-cdfec27ab783	1295	Ivančna Gorica
00050000-56a7-31ab-48a2-4f71e64ba381	2259	Ivanjkovci
00050000-56a7-31ab-c1d8-13e7c01498bd	1411	Izlake
00050000-56a7-31ab-cada-42f7472b92d7	6310	Izola/Isola
00050000-56a7-31ab-3846-9a84e53e49a9	2222	Jakobski Dol
00050000-56a7-31ab-da11-86c2bed66aa8	2221	Jarenina
00050000-56a7-31ab-4612-c5646b362d87	6254	Jelšane
00050000-56a7-31ab-5149-f2da49836ec0	4270	Jesenice
00050000-56a7-31ab-4a98-d46b1c4940eb	8261	Jesenice na Dolenjskem
00050000-56a7-31ab-702d-fef2268ed25b	3273	Jurklošter
00050000-56a7-31ab-0efd-498ad171612d	2223	Jurovski Dol
00050000-56a7-31ab-3708-ba74a61645da	2256	Juršinci
00050000-56a7-31ab-98e9-063b63469892	5214	Kal nad Kanalom
00050000-56a7-31ab-9ba5-59e6f0bc9648	3233	Kalobje
00050000-56a7-31ab-80dd-94cbd9575122	4246	Kamna Gorica
00050000-56a7-31ab-98cb-4b3c6e100aaa	2351	Kamnica
00050000-56a7-31ab-3691-d8c3557cf897	1241	Kamnik
00050000-56a7-31ab-894f-a96475cbc138	5213	Kanal
00050000-56a7-31ab-e33a-7ab8378d9ad4	8258	Kapele
00050000-56a7-31ab-806f-d1245ecc3bfb	2362	Kapla
00050000-56a7-31ab-a693-dffea8448575	2325	Kidričevo
00050000-56a7-31ab-d4db-54dcd19d8d00	1412	Kisovec
00050000-56a7-31ab-6450-0d2bc556bccf	6253	Knežak
00050000-56a7-31ab-122d-ae353fe02fce	5222	Kobarid
00050000-56a7-31ab-aa3b-40b1d0f98f93	9227	Kobilje
00050000-56a7-31ab-41f0-02d01de787e7	1330	Kočevje
00050000-56a7-31ab-1bb5-06602bc7ce37	1338	Kočevska Reka
00050000-56a7-31ab-432d-c1ce0ebd2ab6	2276	Kog
00050000-56a7-31ab-8bc0-11111e83b642	5211	Kojsko
00050000-56a7-31ab-42ea-2be7e7fe0f91	6223	Komen
00050000-56a7-31ab-2a26-94812b23e813	1218	Komenda
00050000-56a7-31ab-e589-465a77d5be9f	6000	Koper/Capodistria 
00050000-56a7-31ab-3756-44cb89046662	6001	Koper/Capodistria - poštni predali
00050000-56a7-31ab-931b-88c5a866f24f	8282	Koprivnica
00050000-56a7-31ab-1fc2-c319fa7404a9	5296	Kostanjevica na Krasu
00050000-56a7-31ab-f47f-81ead77ec0f4	8311	Kostanjevica na Krki
00050000-56a7-31ab-80d5-08ae42895bd4	1336	Kostel
00050000-56a7-31ab-5c02-44240ff4c996	6256	Košana
00050000-56a7-31ab-1b4d-290ed07d93b2	2394	Kotlje
00050000-56a7-31ab-510e-e940c2111e9f	6240	Kozina
00050000-56a7-31ab-3595-8d8717c7941e	3260	Kozje
00050000-56a7-31ab-e456-9d4772003b29	4000	Kranj 
00050000-56a7-31ab-fd26-5c3660eaf7c4	4001	Kranj - poštni predali
00050000-56a7-31ab-a913-9909e05b5747	4280	Kranjska Gora
00050000-56a7-31ab-32cc-bd321e80dfca	1281	Kresnice
00050000-56a7-31ab-e01d-c42041b77cc5	4294	Križe
00050000-56a7-31ab-21c5-407c50a194db	9206	Križevci
00050000-56a7-31ab-160c-6002253b999d	9242	Križevci pri Ljutomeru
00050000-56a7-31ab-42eb-243ab3a08a3a	1301	Krka
00050000-56a7-31ab-917e-2b7447b6ce74	8296	Krmelj
00050000-56a7-31ab-1dca-94c614fcb5b1	4245	Kropa
00050000-56a7-31ab-b0c5-2d3363bbfa7d	8262	Krška vas
00050000-56a7-31ab-aa22-bb4c0208541d	8270	Krško
00050000-56a7-31ab-86cf-27b5e5f12c50	9263	Kuzma
00050000-56a7-31ab-404a-3c18420e5b55	2318	Laporje
00050000-56a7-31ab-ec7c-653db987480e	3270	Laško
00050000-56a7-31ab-a9bf-8bb22062894b	1219	Laze v Tuhinju
00050000-56a7-31ab-4860-e7ae1ad1f872	2230	Lenart v Slovenskih goricah
00050000-56a7-31ab-c64f-09717fdcd160	9220	Lendava/Lendva
00050000-56a7-31ab-49cb-9d4fea0fda8e	4248	Lesce
00050000-56a7-31ab-73e6-b8eb1688c585	3261	Lesično
00050000-56a7-31ab-da73-dcab6c16dd95	8273	Leskovec pri Krškem
00050000-56a7-31ab-e0e0-6979d1100737	2372	Libeliče
00050000-56a7-31ab-f485-b38d1e342af2	2341	Limbuš
00050000-56a7-31ab-8326-cb679fbca9c6	1270	Litija
00050000-56a7-31ab-3245-f9149a50a87c	3202	Ljubečna
00050000-56a7-31ab-be15-2fd949564621	1000	Ljubljana 
00050000-56a7-31ab-36ac-09004e58b0db	1001	Ljubljana - poštni predali
00050000-56a7-31ab-18ae-fd90930697d0	1231	Ljubljana - Črnuče
00050000-56a7-31ab-ba12-f3619291b82c	1261	Ljubljana - Dobrunje
00050000-56a7-31ab-936f-f4722ad248de	1260	Ljubljana - Polje
00050000-56a7-31ab-17e7-1524c6bb3708	1210	Ljubljana - Šentvid
00050000-56a7-31ab-12d4-7ad3779b5a72	1211	Ljubljana - Šmartno
00050000-56a7-31ab-b22c-282bf8a830a6	3333	Ljubno ob Savinji
00050000-56a7-31ab-43a3-6701c0e17174	9240	Ljutomer
00050000-56a7-31ab-e4b4-4f97c7173181	3215	Loče
00050000-56a7-31ab-3036-40c2344a042b	5231	Log pod Mangartom
00050000-56a7-31ab-419f-7459ae60d3d7	1358	Log pri Brezovici
00050000-56a7-31ab-cc08-cf7f1ce318d3	1370	Logatec
00050000-56a7-31ab-5ed7-fe28b9d29dbc	1371	Logatec
00050000-56a7-31ab-a678-7c66c38aedb0	1434	Loka pri Zidanem Mostu
00050000-56a7-31ab-d92c-66ee7783a3ae	3223	Loka pri Žusmu
00050000-56a7-31ab-b66a-2a9dc7073b54	6219	Lokev
00050000-56a7-31ab-1208-41ec6bbf9ec4	1318	Loški Potok
00050000-56a7-31ab-5e01-7a5bdcdd7939	2324	Lovrenc na Dravskem polju
00050000-56a7-31ab-70ca-d9031522bb12	2344	Lovrenc na Pohorju
00050000-56a7-31ab-ab3f-0768d94cab04	3334	Luče
00050000-56a7-31ab-6418-9d25148af652	1225	Lukovica
00050000-56a7-31ab-214f-39a75ca1a2fa	9202	Mačkovci
00050000-56a7-31ab-f2f2-1577ce1732d5	2322	Majšperk
00050000-56a7-31ab-ed03-a4b495264c72	2321	Makole
00050000-56a7-31ab-5ee9-2b7c6a06d246	9243	Mala Nedelja
00050000-56a7-31ab-cbef-47ac87b3de2f	2229	Malečnik
00050000-56a7-31ab-b587-f5f9eeb05524	6273	Marezige
00050000-56a7-31ab-4aff-f76457eca26b	2000	Maribor 
00050000-56a7-31ab-826d-e9c04471547b	2001	Maribor - poštni predali
00050000-56a7-31ab-1f5e-f0660e286b3f	2206	Marjeta na Dravskem polju
00050000-56a7-31ab-f1be-00fa1e178ced	2281	Markovci
00050000-56a7-31ab-4c7a-94c01c9d5a06	9221	Martjanci
00050000-56a7-31ab-deb7-269dad64e561	6242	Materija
00050000-56a7-31ab-3293-90a7c4a331e7	4211	Mavčiče
00050000-56a7-31ab-743c-23b7031ad973	1215	Medvode
00050000-56a7-31ab-c194-279524bfadc1	1234	Mengeš
00050000-56a7-31ab-2730-578710917bd9	8330	Metlika
00050000-56a7-31ab-43aa-1e48e92c05d7	2392	Mežica
00050000-56a7-31ab-55de-1fbbc8ba6585	2204	Miklavž na Dravskem polju
00050000-56a7-31ab-3867-8993ee853af2	2275	Miklavž pri Ormožu
00050000-56a7-31ab-fa40-f5104e5a3800	5291	Miren
00050000-56a7-31ab-204e-62136b720796	8233	Mirna
00050000-56a7-31ab-4476-aca2591901f1	8216	Mirna Peč
00050000-56a7-31ab-119d-a86c8941b50e	2382	Mislinja
00050000-56a7-31ab-af57-97742998f2bd	4281	Mojstrana
00050000-56a7-31ab-994e-f46d2a9e8fc6	8230	Mokronog
00050000-56a7-31ab-d8d0-de25f0b8671a	1251	Moravče
00050000-56a7-31ab-0b5e-774e54a67175	9226	Moravske Toplice
00050000-56a7-31ab-6068-bf981abf4440	5216	Most na Soči
00050000-56a7-31ab-313b-50b6fc726da0	1221	Motnik
00050000-56a7-31ab-2f23-b519c4559f13	3330	Mozirje
00050000-56a7-31ab-e0df-a6878272ecf0	9000	Murska Sobota 
00050000-56a7-31ab-18a2-6d1d2405774e	9001	Murska Sobota - poštni predali
00050000-56a7-31ab-6ce2-cf45f015d5df	2366	Muta
00050000-56a7-31ab-c6af-f77c4400e3d6	4202	Naklo
00050000-56a7-31ab-7384-fae3e1d6b7ec	3331	Nazarje
00050000-56a7-31ab-7daf-286c2f748f5f	1357	Notranje Gorice
00050000-56a7-31ab-3679-c714a3983369	3203	Nova Cerkev
00050000-56a7-31ab-aabd-0e4813cdc04f	5000	Nova Gorica 
00050000-56a7-31ab-8ecc-d015582b4411	5001	Nova Gorica - poštni predali
00050000-56a7-31ab-deb5-175dd35766b3	1385	Nova vas
00050000-56a7-31ab-06d6-fd7bc604e5fd	8000	Novo mesto
00050000-56a7-31ab-7462-7b019c8ecd8c	8001	Novo mesto - poštni predali
00050000-56a7-31ab-59ce-ef05053fc631	6243	Obrov
00050000-56a7-31ab-25a6-8a0b16531fc1	9233	Odranci
00050000-56a7-31ab-aaf6-a36bbe9ac94f	2317	Oplotnica
00050000-56a7-31ab-1fdc-f90a372b7ec2	2312	Orehova vas
00050000-56a7-31ab-3da7-f497b1db6479	2270	Ormož
00050000-56a7-31ab-0529-cdc12f232166	1316	Ortnek
00050000-56a7-31ab-b8ea-0bd2998fb454	1337	Osilnica
00050000-56a7-31ab-cc88-0aea88323f6d	8222	Otočec
00050000-56a7-31ab-c95a-65f5d8c7ae44	2361	Ožbalt
00050000-56a7-31ab-3d24-b7a36fb2a5a3	2231	Pernica
00050000-56a7-31ab-f8fb-a9ecc544f4db	2211	Pesnica pri Mariboru
00050000-56a7-31ab-08e2-a36cbd672c62	9203	Petrovci
00050000-56a7-31ab-3056-a757ba75b2f8	3301	Petrovče
00050000-56a7-31ab-909b-46314cbe1943	6330	Piran/Pirano
00050000-56a7-31ab-e31d-36342596b41b	8255	Pišece
00050000-56a7-31ab-b555-f654f519b3ca	6257	Pivka
00050000-56a7-31ab-a8be-d21d7344020a	6232	Planina
00050000-56a7-31ab-72e3-e770a104249e	3225	Planina pri Sevnici
00050000-56a7-31ab-30a0-00fd6a5a6784	6276	Pobegi
00050000-56a7-31ab-7046-61eb1d38ac65	8312	Podbočje
00050000-56a7-31ab-9913-fb69fa80cc79	5243	Podbrdo
00050000-56a7-31ab-faae-bd28d5334609	3254	Podčetrtek
00050000-56a7-31ab-7073-7d075849a8e3	2273	Podgorci
00050000-56a7-31ab-671e-a792769d953d	6216	Podgorje
00050000-56a7-31ab-768a-8ab035162142	2381	Podgorje pri Slovenj Gradcu
00050000-56a7-31ab-1e50-917803c86956	6244	Podgrad
00050000-56a7-31ab-88ff-67234e6d7b69	1414	Podkum
00050000-56a7-31ab-2773-cdfaf590693d	2286	Podlehnik
00050000-56a7-31ab-8a0b-2ef69b95694e	5272	Podnanos
00050000-56a7-31ab-f74a-81bafda8a5bd	4244	Podnart
00050000-56a7-31ab-2a88-47a6fbd3461a	3241	Podplat
00050000-56a7-31ab-70ed-8804a11f677f	3257	Podsreda
00050000-56a7-31ab-c9e9-a86113e830db	2363	Podvelka
00050000-56a7-31ab-24ed-a6bbf58648a7	2208	Pohorje
00050000-56a7-31ab-e012-7d3e82939222	2257	Polenšak
00050000-56a7-31ab-9992-66c83dc13473	1355	Polhov Gradec
00050000-56a7-31ab-e3aa-9a1016dbaf32	4223	Poljane nad Škofjo Loko
00050000-56a7-31ab-59b2-3cffcf4ae27e	2319	Poljčane
00050000-56a7-31ab-84b5-f95606e5f567	1272	Polšnik
00050000-56a7-31ab-713e-cc923654e706	3313	Polzela
00050000-56a7-31ab-0512-5a72321aac61	3232	Ponikva
00050000-56a7-31ab-0f1a-bc6ebec24018	6320	Portorož/Portorose
00050000-56a7-31ab-c1c7-793d17883dad	6230	Postojna
00050000-56a7-31ab-b25d-43a034044fc8	2331	Pragersko
00050000-56a7-31ab-9a9b-510440304127	3312	Prebold
00050000-56a7-31ab-0ac8-9a61f21d0881	4205	Preddvor
00050000-56a7-31ab-a561-cc3600e603e0	6255	Prem
00050000-56a7-31ab-9fb6-400eb6124e5c	1352	Preserje
00050000-56a7-31ab-10f4-7177296e69af	6258	Prestranek
00050000-56a7-31ab-7f3a-67fcc26d3052	2391	Prevalje
00050000-56a7-31ab-8e2c-d4a81b7e2b5e	3262	Prevorje
00050000-56a7-31ab-ca7e-6a17d0e0b66e	1276	Primskovo 
00050000-56a7-31ab-aa0b-5983956daa6d	3253	Pristava pri Mestinju
00050000-56a7-31ab-4bce-c921e8e8b544	9207	Prosenjakovci/Partosfalva
00050000-56a7-31ab-ff16-bc985bdea3be	5297	Prvačina
00050000-56a7-31ab-c199-f8ab4d2ce700	2250	Ptuj
00050000-56a7-31ab-3a89-ffb630855222	2323	Ptujska Gora
00050000-56a7-31ab-9ca9-e0340718552c	9201	Puconci
00050000-56a7-31ab-b40a-16bfa5b4551b	2327	Rače
00050000-56a7-31ab-5bb5-ad0fbe4770a3	1433	Radeče
00050000-56a7-31ab-1a6b-771ac7314ef6	9252	Radenci
00050000-56a7-31ab-c6a8-06ae6bad5e93	2360	Radlje ob Dravi
00050000-56a7-31ab-15cc-0ffe8c905b26	1235	Radomlje
00050000-56a7-31ab-ac42-a9293ff4490b	4240	Radovljica
00050000-56a7-31ab-6a5c-5ac2f2521f4f	8274	Raka
00050000-56a7-31ab-0f51-7c2bfd2f7282	1381	Rakek
00050000-56a7-31ab-8636-6c188069b5e4	4283	Rateče - Planica
00050000-56a7-31ab-f73b-41fde76a3802	2390	Ravne na Koroškem
00050000-56a7-31ab-887d-b3efb1ff21c0	9246	Razkrižje
00050000-56a7-31ab-aa56-d621aa39fced	3332	Rečica ob Savinji
00050000-56a7-31ab-d49c-106909855193	5292	Renče
00050000-56a7-31ab-1dbc-7cb80553afed	1310	Ribnica
00050000-56a7-31ab-0d8b-e90a6cc55658	2364	Ribnica na Pohorju
00050000-56a7-31ab-5d82-6cb9f77a1754	3272	Rimske Toplice
00050000-56a7-31ab-4ac7-c238cd175a72	1314	Rob
00050000-56a7-31ab-2576-5cd6304c1365	5215	Ročinj
00050000-56a7-31ab-4378-2071985ff7e4	3250	Rogaška Slatina
00050000-56a7-31ab-4cc9-aa1e4c696900	9262	Rogašovci
00050000-56a7-31ab-04c7-91b4d8594a66	3252	Rogatec
00050000-56a7-31ab-cb9d-435cfb457b81	1373	Rovte
00050000-56a7-31ab-77f8-35953080d3ab	2342	Ruše
00050000-56a7-31ab-7c99-c40b2c3d7eb0	1282	Sava
00050000-56a7-31ab-ef66-ced45e676c27	6333	Sečovlje/Sicciole
00050000-56a7-31ab-8cc1-92c8421f250b	4227	Selca
00050000-56a7-31ab-5bcb-d5b5d1bff891	2352	Selnica ob Dravi
00050000-56a7-31ab-fd35-e2d6cf162571	8333	Semič
00050000-56a7-31ab-1cb7-1f4cebc10568	8281	Senovo
00050000-56a7-31ab-7b5b-75f283b4a14b	6224	Senožeče
00050000-56a7-31ab-c98d-2d2ab88ca9e5	8290	Sevnica
00050000-56a7-31ab-6d37-5bd867bdc2f7	6210	Sežana
00050000-56a7-31ab-b08e-b494a0fa04b1	2214	Sladki Vrh
00050000-56a7-31ab-32e7-cee754ebde6c	5283	Slap ob Idrijci
00050000-56a7-31ab-a807-2ab98a64a61f	2380	Slovenj Gradec
00050000-56a7-31ab-bf79-b8fa0655885a	2310	Slovenska Bistrica
00050000-56a7-31ab-cae0-c5765f7ffe8b	3210	Slovenske Konjice
00050000-56a7-31ab-4713-d94fa6a797f0	1216	Smlednik
00050000-56a7-31ab-0344-37c25d9e6c57	5232	Soča
00050000-56a7-31ab-a73a-91f3c8b30ba1	1317	Sodražica
00050000-56a7-31ab-f90e-3c06c5bc630d	3335	Solčava
00050000-56a7-31ab-c76d-790d0734d2ed	5250	Solkan
00050000-56a7-31ab-7848-4866813824b1	4229	Sorica
00050000-56a7-31ab-f15f-956bc773a92b	4225	Sovodenj
00050000-56a7-31ab-eb89-47f22ad9d7b4	5281	Spodnja Idrija
00050000-56a7-31ab-73c6-8078d254b3ef	2241	Spodnji Duplek
00050000-56a7-31ab-693a-e756f41467fd	9245	Spodnji Ivanjci
00050000-56a7-31ab-b45d-f2ebc00b98d0	2277	Središče ob Dravi
00050000-56a7-31ab-ec49-0ce1d7f445ed	4267	Srednja vas v Bohinju
00050000-56a7-31ab-80e1-da811e50f600	8256	Sromlje 
00050000-56a7-31ab-1c64-0fd84d936778	5224	Srpenica
00050000-56a7-31ab-f4ac-e8394839d195	1242	Stahovica
00050000-56a7-31ab-8b94-459a6f482b09	1332	Stara Cerkev
00050000-56a7-31ab-b3e2-1f3a409a264e	8342	Stari trg ob Kolpi
00050000-56a7-31ab-8566-dc283cf94e07	1386	Stari trg pri Ložu
00050000-56a7-31ab-5276-25c2dd5d5962	2205	Starše
00050000-56a7-31ab-aa52-890605487840	2289	Stoperce
00050000-56a7-31ab-34f5-6face21f9d81	8322	Stopiče
00050000-56a7-31ab-86b5-f95696ae052e	3206	Stranice
00050000-56a7-31ab-aaab-c55667203e76	8351	Straža
00050000-56a7-31ab-92ed-6793fa7b4406	1313	Struge
00050000-56a7-31ab-cab0-bfb7a0a451ae	8293	Studenec
00050000-56a7-31ab-746f-9005628a5313	8331	Suhor
00050000-56a7-31ab-91ba-1670f748aa86	2233	Sv. Ana v Slovenskih goricah
00050000-56a7-31ab-994a-6c4a1c427262	2235	Sv. Trojica v Slovenskih goricah
00050000-56a7-31ab-5be1-c941ab633a77	2353	Sveti Duh na Ostrem Vrhu
00050000-56a7-31ab-8f1e-cab0ceb8bdb4	9244	Sveti Jurij ob Ščavnici
00050000-56a7-31ab-eaa2-4e7c657b4964	3264	Sveti Štefan
00050000-56a7-31ab-f0a7-f7180b1be8ae	2258	Sveti Tomaž
00050000-56a7-31ab-61ba-bb57904d36b8	9204	Šalovci
00050000-56a7-31ab-e96e-d0e9ea4621cf	5261	Šempas
00050000-56a7-31ab-0474-30a1c06d6d9b	5290	Šempeter pri Gorici
00050000-56a7-31ab-6319-97f2349f8b22	3311	Šempeter v Savinjski dolini
00050000-56a7-31ab-4d4b-a33ae6606d0b	4208	Šenčur
00050000-56a7-31ab-466c-50c871aa75e9	2212	Šentilj v Slovenskih goricah
00050000-56a7-31ab-9b0c-b247895e88d8	8297	Šentjanž
00050000-56a7-31ab-5257-1852f1e18d37	2373	Šentjanž pri Dravogradu
00050000-56a7-31ab-87fb-bd120c2c1dd8	8310	Šentjernej
00050000-56a7-31ab-392d-6f3581407b05	3230	Šentjur
00050000-56a7-31ab-732d-b4a5028c43e0	3271	Šentrupert
00050000-56a7-31ab-86e3-4ecedcc25a17	8232	Šentrupert
00050000-56a7-31ab-8001-8275c13ad0ec	1296	Šentvid pri Stični
00050000-56a7-31ab-28b1-66add35ba76a	8275	Škocjan
00050000-56a7-31ab-eb17-93fd40f8f9d7	6281	Škofije
00050000-56a7-31ab-728b-c1eac015834b	4220	Škofja Loka
00050000-56a7-31ab-751e-7c5259f5f18b	3211	Škofja vas
00050000-56a7-31ab-1de7-a67fd836e8ab	1291	Škofljica
00050000-56a7-31ab-e6ce-3ee8c7226e6a	6274	Šmarje
00050000-56a7-31ab-1be1-116932654d22	1293	Šmarje - Sap
00050000-56a7-31ab-aed4-454e5d8572f2	3240	Šmarje pri Jelšah
00050000-56a7-31ab-6332-fbe015f65480	8220	Šmarješke Toplice
00050000-56a7-31ab-3c3a-8c79982e987b	2315	Šmartno na Pohorju
00050000-56a7-31ab-debf-69beecb86239	3341	Šmartno ob Dreti
00050000-56a7-31ab-641f-eda365489632	3327	Šmartno ob Paki
00050000-56a7-31ab-5d85-c68ab9d32aaf	1275	Šmartno pri Litiji
00050000-56a7-31ab-a719-499db5fe0b8e	2383	Šmartno pri Slovenj Gradcu
00050000-56a7-31ab-8760-d74118a2f2fb	3201	Šmartno v Rožni dolini
00050000-56a7-31ab-da19-e993d724fa15	3325	Šoštanj
00050000-56a7-31ab-e9d1-830ca5a6ace4	6222	Štanjel
00050000-56a7-31ab-4cad-7cc34d5ffad8	3220	Štore
00050000-56a7-31ab-e7b5-1581421e89a5	3304	Tabor
00050000-56a7-31ab-6b34-51b540e6910a	3221	Teharje
00050000-56a7-31ab-ebe2-8f52c7545cc5	9251	Tišina
00050000-56a7-31ab-5ee0-facad56fc469	5220	Tolmin
00050000-56a7-31ab-b20e-d7085ddc9ae5	3326	Topolšica
00050000-56a7-31ab-a00d-5fbbaa1b485d	2371	Trbonje
00050000-56a7-31ab-ac43-dc3e32900ac6	1420	Trbovlje
00050000-56a7-31ab-a660-f4f177d2bf6a	8231	Trebelno 
00050000-56a7-31ab-a1be-736b360d51e6	8210	Trebnje
00050000-56a7-31ab-1050-e849bdc95e03	5252	Trnovo pri Gorici
00050000-56a7-31ab-10f0-2fb6e6998821	2254	Trnovska vas
00050000-56a7-31ab-1b8a-60305140bfa5	1222	Trojane
00050000-56a7-31ab-4180-252c4c0fe45e	1236	Trzin
00050000-56a7-31ab-43f1-1eed93755b90	4290	Tržič
00050000-56a7-31ab-c944-4374a047472b	8295	Tržišče
00050000-56a7-31ab-321a-d5871a269488	1311	Turjak
00050000-56a7-31ab-902c-b31fccc7fb30	9224	Turnišče
00050000-56a7-31ab-c908-7b2c627b5b03	8323	Uršna sela
00050000-56a7-31ab-d701-7aebc63ee3e5	1252	Vače
00050000-56a7-31ab-b6c9-2578bbf2cd17	3320	Velenje 
00050000-56a7-31ab-8a4f-45d2f7500a02	3322	Velenje - poštni predali
00050000-56a7-31ab-b00e-765543934f0f	8212	Velika Loka
00050000-56a7-31ab-0812-08a454c454ac	2274	Velika Nedelja
00050000-56a7-31ab-e645-e4f654d6db1f	9225	Velika Polana
00050000-56a7-31ab-bd82-553c944fdedd	1315	Velike Lašče
00050000-56a7-31ab-4aee-87e2f3108f1b	8213	Veliki Gaber
00050000-56a7-31ab-e619-81143e92d5c6	9241	Veržej
00050000-56a7-31ab-aa6a-dda96042125e	1312	Videm - Dobrepolje
00050000-56a7-31ab-2ffc-71b5e39c2267	2284	Videm pri Ptuju
00050000-56a7-31ab-46e9-7060971953d1	8344	Vinica
00050000-56a7-31ab-4193-02ddf3b5eee7	5271	Vipava
00050000-56a7-31ab-57a0-19e55d0932f0	4212	Visoko
00050000-56a7-31ab-dbd2-f0a9ba70b961	1294	Višnja Gora
00050000-56a7-31ab-f85b-4d61df33e0f4	3205	Vitanje
00050000-56a7-31ab-aad7-a3206634ee71	2255	Vitomarci
00050000-56a7-31ab-f7ec-267230316f69	1217	Vodice
00050000-56a7-31ab-cbe7-593146ad9489	3212	Vojnik\t
00050000-56a7-31ab-0217-7e93a1587b9c	5293	Volčja Draga
00050000-56a7-31ab-641b-90d6a8240c1f	2232	Voličina
00050000-56a7-31ab-ab15-1b79d8f8e0f1	3305	Vransko
00050000-56a7-31ab-fd6d-64320d53b2e7	6217	Vremski Britof
00050000-56a7-31ab-09c5-3513db2b00e8	1360	Vrhnika
00050000-56a7-31ab-01c9-a1021851907b	2365	Vuhred
00050000-56a7-31ab-917b-fd4108d0b2fe	2367	Vuzenica
00050000-56a7-31ab-ee7c-e8afa5a4d507	8292	Zabukovje 
00050000-56a7-31ab-36b7-484e81feacc7	1410	Zagorje ob Savi
00050000-56a7-31ab-6472-5422df1ced9f	1303	Zagradec
00050000-56a7-31ab-8f0f-d8f388f7acb7	2283	Zavrč
00050000-56a7-31ab-a4fe-f9838af242c6	8272	Zdole 
00050000-56a7-31ab-bacc-b9fbbce2721e	4201	Zgornja Besnica
00050000-56a7-31ab-023f-1d03fa263c4d	2242	Zgornja Korena
00050000-56a7-31ab-a836-352ec9d20bd0	2201	Zgornja Kungota
00050000-56a7-31ab-dff6-5237629b8584	2316	Zgornja Ložnica
00050000-56a7-31ab-ff07-5419b582e598	2314	Zgornja Polskava
00050000-56a7-31ab-d5ed-b3fd96903c0e	2213	Zgornja Velka
00050000-56a7-31ab-86a4-10b15525643f	4247	Zgornje Gorje
00050000-56a7-31ab-f674-c4ed5bc042c2	4206	Zgornje Jezersko
00050000-56a7-31ab-0a37-389c8312f6d2	2285	Zgornji Leskovec
00050000-56a7-31ab-32b8-cd49bfa15679	1432	Zidani Most
00050000-56a7-31ab-6b4b-94652324a3b4	3214	Zreče
00050000-56a7-31ab-9acb-b6911ecc5767	4209	Žabnica
00050000-56a7-31ab-94c8-d2856b653204	3310	Žalec
00050000-56a7-31ab-30f3-804a22401344	4228	Železniki
00050000-56a7-31ab-0970-e2490cbe1bfd	2287	Žetale
00050000-56a7-31ab-664d-2d436c493c13	4226	Žiri
00050000-56a7-31ab-dc45-0cb4ca48c45e	4274	Žirovnica
00050000-56a7-31ab-0e5a-738bf015d605	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 40361050)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 40360620)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 40360360)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a7-31ae-a450-afbac92e7d1b	00080000-56a7-31ae-83e0-f36154ef6217	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a7-31ae-db43-3af6618dc527	00080000-56a7-31ae-83e0-f36154ef6217	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a7-31ae-7511-116c61ab5bb7	00080000-56a7-31ae-0563-1df136d18702	\N	00040000-56a7-31ab-fec8-5fd43f1a6f86	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 40360496)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a7-31ac-5c1a-1a24e45697be	novo leto	1	1	\N	t
00430000-56a7-31ac-5a02-4f29a66811bb	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a7-31ac-81a3-9f2d2ac551a2	dan upora proti okupatorju	27	4	\N	t
00430000-56a7-31ac-5a9f-c378d1019851	praznik dela	1	5	\N	t
00430000-56a7-31ac-c766-a461e18fabd2	praznik dela	2	5	\N	t
00430000-56a7-31ac-da82-b9461ad6f950	dan Primoža Trubarja	8	6	\N	f
00430000-56a7-31ac-0721-739a7f351456	dan državnosti	25	6	\N	t
00430000-56a7-31ac-7cff-c2815250c758	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a7-31ac-e99e-d2dfcb7344ae	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a7-31ac-7ea2-da026c057ea6	dan suverenosti	25	10	\N	f
00430000-56a7-31ac-0094-45022684e9c8	dan spomina na mrtve	1	11	\N	t
00430000-56a7-31ac-447d-984a65acb531	dan Rudolfa Maistra	23	11	\N	f
00430000-56a7-31ac-eb2d-5b73c070921b	božič	25	12	\N	t
00430000-56a7-31ac-5d06-0e5c0e76c05a	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a7-31ac-5903-9c049d09d2ba	Marijino vnebovzetje	15	8	\N	t
00430000-56a7-31ac-8da8-d894e5c499bd	dan reformacije	31	10	\N	t
00430000-56a7-31ac-335a-2dcc2f26ea7e	velikonočna nedelja	27	3	2016	t
00430000-56a7-31ac-c8c9-75ecf59afd90	velikonočna nedelja	16	4	2017	t
00430000-56a7-31ac-4bd0-d49cbb1e620d	velikonočna nedelja	1	4	2018	t
00430000-56a7-31ac-93f5-84645fe9308f	velikonočna nedelja	21	4	2019	t
00430000-56a7-31ac-24be-6c2124c0de45	velikonočna nedelja	12	4	2020	t
00430000-56a7-31ac-906c-6b7eaf31a78c	velikonočna nedelja	4	4	2021	t
00430000-56a7-31ac-9d4b-68e81ec4a096	velikonočna nedelja	17	4	2022	t
00430000-56a7-31ac-20e2-322ecece4463	velikonočna nedelja	9	4	2023	t
00430000-56a7-31ac-5894-aac9bd70f1b8	velikonočna nedelja	31	3	2024	t
00430000-56a7-31ac-088c-7200e0a8735d	velikonočna nedelja	20	4	2025	t
00430000-56a7-31ac-ff1f-378b0f457730	velikonočna nedelja	5	4	2026	t
00430000-56a7-31ac-36ee-736fcd8fa5b1	velikonočna nedelja	28	3	2027	t
00430000-56a7-31ac-f8b3-b4a0f3ef832a	velikonočna nedelja	16	4	2028	t
00430000-56a7-31ac-1972-019b26bdd369	velikonočna nedelja	1	4	2029	t
00430000-56a7-31ac-657f-f25064a79ae5	velikonočna nedelja	21	4	2030	t
00430000-56a7-31ac-05de-b1b018fdf962	velikonočni ponedeljek	28	3	2016	t
00430000-56a7-31ac-bfbb-6cc7c13a0723	velikonočni ponedeljek	17	4	2017	t
00430000-56a7-31ac-bf8d-bb0059ef8e4e	velikonočni ponedeljek	2	4	2018	t
00430000-56a7-31ac-ad3d-03bb120626ad	velikonočni ponedeljek	22	4	2019	t
00430000-56a7-31ac-e566-420a2aa04ff7	velikonočni ponedeljek	13	4	2020	t
00430000-56a7-31ac-1ada-7a9f26e08bd1	velikonočni ponedeljek	5	4	2021	t
00430000-56a7-31ac-842d-1019a0be8ab6	velikonočni ponedeljek	18	4	2022	t
00430000-56a7-31ac-5a8b-9800a2814bac	velikonočni ponedeljek	10	4	2023	t
00430000-56a7-31ac-c2dd-a7af5c648471	velikonočni ponedeljek	1	4	2024	t
00430000-56a7-31ac-ff34-dc522393f6cd	velikonočni ponedeljek	21	4	2025	t
00430000-56a7-31ac-4f13-df39b5dd9485	velikonočni ponedeljek	6	4	2026	t
00430000-56a7-31ac-967d-0fad53bf5a94	velikonočni ponedeljek	29	3	2027	t
00430000-56a7-31ac-02eb-1702a0e15df0	velikonočni ponedeljek	17	4	2028	t
00430000-56a7-31ac-1e38-7c29bf9a77cc	velikonočni ponedeljek	2	4	2029	t
00430000-56a7-31ac-200d-a66ae5d6516c	velikonočni ponedeljek	22	4	2030	t
00430000-56a7-31ac-43fe-5a5e88582558	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a7-31ac-9e87-f722ea1f3954	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a7-31ac-4361-4ef0f7a887bb	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a7-31ac-6395-5cecb1113dcd	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a7-31ac-a93e-27b0f3b90086	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a7-31ac-3b56-58e9e8ea1b90	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a7-31ac-cdaa-33de68647dcc	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a7-31ac-6909-3dd70cff8f89	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a7-31ac-7be9-c48f791b2841	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a7-31ac-03f1-50146e61f80e	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a7-31ac-9609-a32302fc7287	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a7-31ac-a2a4-40d96f6120bb	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a7-31ac-de50-f1eba1f67c88	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a7-31ac-f11d-c61499c90d46	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a7-31ac-3fe0-97f35ed93f3d	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 40360464)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez) FROM stdin;
001b0000-56a7-31af-9e65-427343346595	000e0000-56a7-31ae-f1e7-945003a79beb	\N	1	\N
001b0000-56a7-31af-62d2-1185e1836332	000e0000-56a7-31ae-f1e7-945003a79beb	\N	2	\N
001b0000-56a7-31af-fac2-6bfa53893e47	000e0000-56a7-31ae-f1e7-945003a79beb	\N	3	\N
\.


--
-- TOC entry 3161 (class 0 OID 40360471)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a7-31af-9e65-427343346595	000a0000-56a7-31ae-41e4-c233ebf5d907
001b0000-56a7-31af-9e65-427343346595	000a0000-56a7-31ae-d448-bd8e75039160
001b0000-56a7-31af-62d2-1185e1836332	000a0000-56a7-31ae-d448-bd8e75039160
001b0000-56a7-31af-62d2-1185e1836332	000a0000-56a7-31ae-1d37-b3df30958075
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 40360632)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 40361064)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 40361074)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a7-31ae-b6c3-2af4cdf4e56c	00080000-56a7-31ae-d0f3-79d170e3929b	0987	AK
00190000-56a7-31ae-2aef-5afe66d7cbb0	00080000-56a7-31ae-0563-1df136d18702	0989	AK
00190000-56a7-31ae-2982-943e3579d8cd	00080000-56a7-31ae-48e8-e268f4f0b08c	0986	AK
00190000-56a7-31ae-84a0-939db06e6f82	00080000-56a7-31ae-f9c9-5bd026acb7cd	0984	AK
00190000-56a7-31ae-b331-c656d7eaef2b	00080000-56a7-31ae-afa9-a0a1319e6cb0	0983	AK
00190000-56a7-31ae-14d4-ffb61eb9b6a7	00080000-56a7-31ae-0cc9-b20b3aa5f05d	0982	AK
00190000-56a7-31b0-c1fa-d3f12bfc7269	00080000-56a7-31b0-bd72-3beb799e6a2a	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 40360963)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a7-31af-c5ac-ecaee6a81607	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 40361082)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 40360660)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a7-31ae-750d-fd73c7ce0936	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a7-31ae-f528-693205e56240	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a7-31ae-c2b3-bdfe15b00e49	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a7-31ae-4dda-e1a174b7fbad	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a7-31ae-0e75-2ae8f01abf57	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a7-31ae-7dae-636365e80106	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a7-31ae-9ee4-ee9dc7c2fe4e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 40360605)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 40360595)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 40360802)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 40360732)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 40360438)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 40360199)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a7-31b0-bd72-3beb799e6a2a	00010000-56a7-31ac-6e22-0bd586b7e3a2	2016-01-26 09:43:28	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a7-31b0-4812-a7d696de8a02	00010000-56a7-31ac-6e22-0bd586b7e3a2	2016-01-26 09:43:28	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a7-31b0-c1fa-d3f12bfc7269	00010000-56a7-31ac-6e22-0bd586b7e3a2	2016-01-26 09:43:28	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 40360674)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 40360237)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a7-31ac-b66e-8fad3c71735c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a7-31ac-0cf5-564915c8eed3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a7-31ac-dfa3-0cd28962b1df	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a7-31ac-1a13-68cef620eee0	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a7-31ac-4252-f3f536c9ffad	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a7-31ac-67cb-b8e0e0f2c291	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a7-31ac-8c06-043acf28e218	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a7-31ac-5bf4-6e14ff4a7940	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a7-31ac-6d69-0eff479f3655	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-31ac-01b9-0bf1a81cccf3	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-31ac-3dc5-f357aa6297eb	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-31ac-d60c-36dee63c0ac4	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-31ac-3eab-822d3918a942	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a7-31ac-48ba-3f4b393f4cd4	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a7-31ac-cdee-036951b07ed2	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a7-31ac-dd7d-9cb7599b564a	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a7-31ac-0dd1-c4d2452016f5	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a7-31ac-57ff-3c67c2a55086	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a7-31ac-fa2e-5183c5f3a68e	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a7-31ac-f81a-474f88a2e8e5	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a7-31ac-749f-75f175a13d7d	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a7-31ac-b382-eeafd46739db	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a7-31ac-da29-cdbe978dac70	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a7-31ac-a6a8-46498af61156	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a7-31ac-04ce-a21489748ffd	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a7-31ac-fc5e-47ea3f12ebcb	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a7-31ac-16ae-f7f8da63d387	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a7-31ac-26b5-8b8662958b1d	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a7-31ac-0c4b-54e7c76e8501	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a7-31ac-94ac-29e58d8a63fe	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a7-31ac-538f-8854de22ef2a	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a7-31ac-1d08-52c0ab22e114	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a7-31ac-f707-34e900df3da2	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a7-31ac-2027-993b12568e14	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a7-31ac-88c4-3cb2bab9b45f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a7-31ac-19dd-ed3555356f8f	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a7-31ac-a1c3-5047f7b35ad3	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a7-31ac-4501-5db672b92160	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a7-31ac-79ab-fb59771e3f64	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a7-31ac-f7c4-9c10bb8a6322	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a7-31ac-f886-62d62eb64706	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a7-31ac-760e-42f872f0e260	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a7-31ac-5c08-de34f39e12d3	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a7-31ac-bd6e-3164ddca66f6	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a7-31ac-4d38-dac260593181	direktor	minimalne pravice za direktorja	t
00020000-56a7-31ac-8736-16ab139bf92d	arhivar	arhivar	t
00020000-56a7-31ac-bebf-f4b35df80b61	dramaturg	dramaturg	t
00020000-56a7-31ac-3acb-0782b1f15d31	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a7-31ac-1424-296604ef3648	poslovni-sekretar	poslovni sekretar	t
00020000-56a7-31ac-c022-f26e9d37cbb6	vodja-tehnike	vodja tehnike	t
00020000-56a7-31ac-7c76-05fd336e2feb	racunovodja	računovodja	t
00020000-56a7-31ae-3b1d-8c039d954da0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a7-31ae-f5c9-e315da7223db	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-dcae-57c59c6717e9	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-3706-1cdc72facef7	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-11e9-b1009cb3ba10	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-1935-33815a8285c5	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-0e19-eb9b170745bd	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-dc42-0aa7b513b193	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-014d-784d0ff7f003	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-365e-b4648803be44	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-8a18-9e5ede987b76	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-771f-46e14d42d954	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-73ee-a655fd00744a	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-832f-c566aee007d1	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-8844-2299cf41f7ad	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-1570-0c1b3ca3dfa2	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-13ca-740c95302b5b	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-bc84-52caee143a98	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-95a9-7e0c65821ee5	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-588c-bab034e08f91	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a7-31ae-bf18-0fec5fd6e3c6	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-1e14-e4504f5bdca4	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-4fb9-5ffa464c0170	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-22b2-28772e31f5ec	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-e475-f00c1b0a50c5	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-a3d4-ec82c71718d0	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-8c21-153dac09d4f1	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-6865-97eb411cfc01	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-7d3a-df300cc41586	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-2f47-1b563effb8b3	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-3593-dc5920f68e61	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-8570-8add266ad5b3	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-5ef3-34f40d37e9a8	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-c664-890778868e26	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-93aa-c2b89573117f	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-2d7f-5a212b14e606	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-dafb-c35e70949553	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-17df-2d70e8f9b277	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a7-31ae-6126-897164825a67	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 40360221)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a7-31ac-21f3-a6f5cd4a8182	00020000-56a7-31ac-dfa3-0cd28962b1df
00010000-56a7-31ac-6e22-0bd586b7e3a2	00020000-56a7-31ac-dfa3-0cd28962b1df
00010000-56a7-31ae-ce73-18855ad6227c	00020000-56a7-31ae-3b1d-8c039d954da0
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-f5c9-e315da7223db
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-1935-33815a8285c5
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-365e-b4648803be44
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-771f-46e14d42d954
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-832f-c566aee007d1
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-95a9-7e0c65821ee5
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-3706-1cdc72facef7
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-bf18-0fec5fd6e3c6
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-22b2-28772e31f5ec
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-a3d4-ec82c71718d0
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-6865-97eb411cfc01
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-2f47-1b563effb8b3
00010000-56a7-31ae-fed7-55b38bf18bd2	00020000-56a7-31ae-c664-890778868e26
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-f5c9-e315da7223db
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-dcae-57c59c6717e9
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-3706-1cdc72facef7
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-11e9-b1009cb3ba10
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-832f-c566aee007d1
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-13ca-740c95302b5b
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-bf18-0fec5fd6e3c6
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-22b2-28772e31f5ec
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-a3d4-ec82c71718d0
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-6865-97eb411cfc01
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-2f47-1b563effb8b3
00010000-56a7-31ae-cd86-300e69d78f37	00020000-56a7-31ae-c664-890778868e26
00010000-56a7-31ae-6101-066abbd8acf3	00020000-56a7-31ae-f5c9-e315da7223db
00010000-56a7-31ae-6101-066abbd8acf3	00020000-56a7-31ae-dcae-57c59c6717e9
00010000-56a7-31ae-6101-066abbd8acf3	00020000-56a7-31ae-3706-1cdc72facef7
00010000-56a7-31ae-6101-066abbd8acf3	00020000-56a7-31ae-11e9-b1009cb3ba10
00010000-56a7-31ae-6101-066abbd8acf3	00020000-56a7-31ae-771f-46e14d42d954
00010000-56a7-31ae-6101-066abbd8acf3	00020000-56a7-31ae-832f-c566aee007d1
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-dcae-57c59c6717e9
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-0e19-eb9b170745bd
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-8a18-9e5ede987b76
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-73ee-a655fd00744a
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-771f-46e14d42d954
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-bc84-52caee143a98
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-832f-c566aee007d1
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-8844-2299cf41f7ad
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-bf18-0fec5fd6e3c6
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-1e14-e4504f5bdca4
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-22b2-28772e31f5ec
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-e475-f00c1b0a50c5
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-a3d4-ec82c71718d0
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-8c21-153dac09d4f1
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-6865-97eb411cfc01
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-7d3a-df300cc41586
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-2f47-1b563effb8b3
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-3593-dc5920f68e61
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-c664-890778868e26
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-93aa-c2b89573117f
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-dafb-c35e70949553
00010000-56a7-31ae-079c-0e42e6498da6	00020000-56a7-31ae-17df-2d70e8f9b277
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-dcae-57c59c6717e9
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-0e19-eb9b170745bd
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-014d-784d0ff7f003
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-8a18-9e5ede987b76
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-73ee-a655fd00744a
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-771f-46e14d42d954
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-bc84-52caee143a98
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-832f-c566aee007d1
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-8844-2299cf41f7ad
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-1570-0c1b3ca3dfa2
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-bf18-0fec5fd6e3c6
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-1e14-e4504f5bdca4
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-4fb9-5ffa464c0170
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-22b2-28772e31f5ec
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-e475-f00c1b0a50c5
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-a3d4-ec82c71718d0
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-8c21-153dac09d4f1
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-6865-97eb411cfc01
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-7d3a-df300cc41586
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-2f47-1b563effb8b3
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-3593-dc5920f68e61
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-c664-890778868e26
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-93aa-c2b89573117f
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-2d7f-5a212b14e606
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-dafb-c35e70949553
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-17df-2d70e8f9b277
00010000-56a7-31ae-c38d-8317d94feda5	00020000-56a7-31ae-6126-897164825a67
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-dcae-57c59c6717e9
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-3706-1cdc72facef7
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-0e19-eb9b170745bd
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-dc42-0aa7b513b193
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-014d-784d0ff7f003
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-1935-33815a8285c5
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-8a18-9e5ede987b76
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-73ee-a655fd00744a
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-771f-46e14d42d954
00010000-56a7-31ae-bbba-c0acccf24a5b	00020000-56a7-31ae-bc84-52caee143a98
00010000-56a7-31ae-87d2-ed6b8fee4bfd	00020000-56a7-31ae-f5c9-e315da7223db
00010000-56a7-31ae-87d2-ed6b8fee4bfd	00020000-56a7-31ae-11e9-b1009cb3ba10
00010000-56a7-31ae-87d2-ed6b8fee4bfd	00020000-56a7-31ae-1935-33815a8285c5
00010000-56a7-31ae-87d2-ed6b8fee4bfd	00020000-56a7-31ae-365e-b4648803be44
00010000-56a7-31ae-87d2-ed6b8fee4bfd	00020000-56a7-31ae-771f-46e14d42d954
00010000-56a7-31ae-87d2-ed6b8fee4bfd	00020000-56a7-31ae-832f-c566aee007d1
00010000-56a7-31ae-87d2-ed6b8fee4bfd	00020000-56a7-31ae-95a9-7e0c65821ee5
00010000-56a7-31ae-87d2-ed6b8fee4bfd	00020000-56a7-31ae-8570-8add266ad5b3
00010000-56a7-31ae-d2cd-4daea1187e71	00020000-56a7-31ae-588c-bab034e08f91
00010000-56a7-31ae-5938-dfb42ab22dc8	00020000-56a7-31ac-4d38-dac260593181
00010000-56a7-31ae-4642-897e930bd0f2	00020000-56a7-31ac-8736-16ab139bf92d
00010000-56a7-31ae-d704-e1500a49caa4	00020000-56a7-31ac-bebf-f4b35df80b61
00010000-56a7-31ae-55a6-b7be16df6871	00020000-56a7-31ac-3acb-0782b1f15d31
00010000-56a7-31ae-66aa-e3a0efb3960a	00020000-56a7-31ac-1424-296604ef3648
00010000-56a7-31ae-1b20-d374d45bb0f8	00020000-56a7-31ac-c022-f26e9d37cbb6
00010000-56a7-31ae-c6da-0c7dd5220fe6	00020000-56a7-31ac-7c76-05fd336e2feb
\.


--
-- TOC entry 3186 (class 0 OID 40360688)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 40360626)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 40360549)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a7-31ae-9214-424cc0665e19	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a7-31ae-2369-973dcf34fb88	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a7-31ae-b47a-78a1f679b7db	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a7-31ae-7887-bd8e86597953	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 40360186)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a7-31ab-eb26-98f795f8e6e3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a7-31ab-0e42-d465759aa240	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a7-31ab-4cd1-8eef327e1259	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a7-31ab-ed99-32c83a3db717	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a7-31ab-c44b-efe51f763e89	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 40360178)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a7-31ab-3908-d5f81e53caba	00230000-56a7-31ab-ed99-32c83a3db717	popa
00240000-56a7-31ab-8f00-7c165d2eb3c0	00230000-56a7-31ab-ed99-32c83a3db717	oseba
00240000-56a7-31ab-c710-c6faf7a28db8	00230000-56a7-31ab-ed99-32c83a3db717	tippopa
00240000-56a7-31ab-490f-2bb31a925373	00230000-56a7-31ab-ed99-32c83a3db717	organizacijskaenota
00240000-56a7-31ab-c97c-25a8f045bfea	00230000-56a7-31ab-ed99-32c83a3db717	sezona
00240000-56a7-31ab-b32e-4d358d68dcee	00230000-56a7-31ab-ed99-32c83a3db717	tipvaje
00240000-56a7-31ab-e7d5-f93f74103b2e	00230000-56a7-31ab-ed99-32c83a3db717	tipdodatka
00240000-56a7-31ab-10f6-fe28aa8b4282	00230000-56a7-31ab-0e42-d465759aa240	prostor
00240000-56a7-31ab-bcb4-c9fe171d0f9b	00230000-56a7-31ab-ed99-32c83a3db717	besedilo
00240000-56a7-31ab-3c73-591a3ad76e10	00230000-56a7-31ab-ed99-32c83a3db717	uprizoritev
00240000-56a7-31ab-c9e4-6547e918c08a	00230000-56a7-31ab-ed99-32c83a3db717	funkcija
00240000-56a7-31ab-0abe-b076ecf9e376	00230000-56a7-31ab-ed99-32c83a3db717	tipfunkcije
00240000-56a7-31ab-9893-71caaf18d2b7	00230000-56a7-31ab-ed99-32c83a3db717	alternacija
00240000-56a7-31ab-eee6-3ba612f245f1	00230000-56a7-31ab-eb26-98f795f8e6e3	pogodba
00240000-56a7-31ab-df03-0c1b19807583	00230000-56a7-31ab-ed99-32c83a3db717	zaposlitev
00240000-56a7-31ab-3cca-d5577dcafbc4	00230000-56a7-31ab-ed99-32c83a3db717	zvrstuprizoritve
00240000-56a7-31ab-d44a-cae3a74e0723	00230000-56a7-31ab-eb26-98f795f8e6e3	programdela
00240000-56a7-31ab-a273-05a8ce4ccc93	00230000-56a7-31ab-ed99-32c83a3db717	zapis
\.


--
-- TOC entry 3133 (class 0 OID 40360173)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f6b3c9ba-f6a5-49ef-861f-71e60018bb30	00240000-56a7-31ab-3908-d5f81e53caba	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 40360749)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a7-31af-01ca-8c238c40be0f	000e0000-56a7-31ae-f1e7-945003a79beb	00080000-56a7-31ae-83e0-f36154ef6217	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a7-31ac-447a-f46364a42c7d
00270000-56a7-31af-09ef-dd0d90635296	000e0000-56a7-31ae-f1e7-945003a79beb	00080000-56a7-31ae-83e0-f36154ef6217	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a7-31ac-447a-f46364a42c7d
\.


--
-- TOC entry 3149 (class 0 OID 40360322)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 40360568)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a7-31af-72f9-d1fd9d47c87f	00180000-56a7-31af-efaa-7e53dce514aa	000c0000-56a7-31af-6256-97fd000507e0	00090000-56a7-31ae-3baf-94590e9f6735	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-31af-c7b8-dba7ecbd06e3	00180000-56a7-31af-efaa-7e53dce514aa	000c0000-56a7-31af-34aa-f1176377eadc	00090000-56a7-31ae-de34-f1d691d89def	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-31af-a893-ef66062840c2	00180000-56a7-31af-efaa-7e53dce514aa	000c0000-56a7-31af-9fd2-292eb5dd388d	00090000-56a7-31ae-edb1-00254678d87b	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-31af-8997-bc210299ec34	00180000-56a7-31af-efaa-7e53dce514aa	000c0000-56a7-31af-76d1-e5e66c325a6e	00090000-56a7-31ae-643d-a25e5b39372c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-31af-39a2-c840dcea6245	00180000-56a7-31af-efaa-7e53dce514aa	000c0000-56a7-31af-e649-ee0996639e86	00090000-56a7-31ae-0f36-757a8fde9a60	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-31af-c9d5-654afec42dec	00180000-56a7-31af-31f2-cc4fb53d04ff	\N	00090000-56a7-31ae-0f36-757a8fde9a60	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a7-31af-d7d4-4b31b14a10c3	00180000-56a7-31af-c1ee-eddf2806b15a	\N	00090000-56a7-31ae-de34-f1d691d89def	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a7-31af-8937-9332bacd2120	00180000-56a7-31af-efaa-7e53dce514aa	\N	00090000-56a7-31ae-db88-e4cccc698143	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 40360585)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a7-31ab-3c1c-7640f97e1506	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a7-31ab-02ca-4d57b4542837	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a7-31ab-13b2-44a820304393	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a7-31ab-1bb2-87e857a1462a	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a7-31ab-c90f-99fe32a06c2d	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a7-31ab-e9d1-5a0ed193fbbe	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 40360790)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a7-31ab-4502-1f59808333ae	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a7-31ab-8c65-73b8041f5513	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a7-31ab-368c-0c822a83e714	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a7-31ab-aa10-e2f1fa353cff	04	Režija	Režija	Režija	umetnik	30
000f0000-56a7-31ab-1f71-05a23a3c879f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a7-31ab-3179-929c00c23e04	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a7-31ab-9c37-904966b9026d	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a7-31ab-1c18-f195ead70c02	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a7-31ab-aa0a-7ba60c3581c5	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a7-31ab-22e7-3a4fe917c849	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a7-31ab-57d2-e8a6c8d53ad3	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a7-31ab-db23-259395bbac97	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a7-31ab-28fb-679e618a1f6c	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a7-31ab-b427-3f253f98c105	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a7-31ab-0da4-ea66b916a2b4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a7-31ab-5e96-d43ffb05e845	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a7-31ab-1bfb-691c294bcb0c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a7-31ab-6f0b-a8275cc782d9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a7-31ab-6f57-aaf4d14783c6	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 40360273)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a7-31ae-fc61-7889a2426b7b	0001	šola	osnovna ali srednja šola
00400000-56a7-31ae-e646-29bf71f956ce	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a7-31ae-0282-705f44a4cea8	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 40361094)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a7-31ab-36a7-1344a37c72a6	01	Velika predstava	f	1.00	1.00
002b0000-56a7-31ab-7c94-ef4e98d96046	02	Mala predstava	f	0.50	0.50
002b0000-56a7-31ab-be3c-52e1a21009cf	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a7-31ab-732b-7d879bcab850	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a7-31ab-7320-7c6932f170be	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 40360539)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a7-31ab-45f6-4a5d77d323e1	0001	prva vaja	prva vaja
00420000-56a7-31ab-b7cf-8954a4e45cc4	0002	tehnična vaja	tehnična vaja
00420000-56a7-31ab-da37-096adf4fda67	0003	lučna vaja	lučna vaja
00420000-56a7-31ab-10d3-80bf15f2da25	0004	kostumska vaja	kostumska vaja
00420000-56a7-31ab-e8d9-4f8c7cca4585	0005	foto vaja	foto vaja
00420000-56a7-31ab-df63-fa9ee33154cc	0006	1. glavna vaja	1. glavna vaja
00420000-56a7-31ab-8de5-6fda75a9f1ef	0007	2. glavna vaja	2. glavna vaja
00420000-56a7-31ab-38de-c40718e89363	0008	1. generalka	1. generalka
00420000-56a7-31ab-31b7-c0acf4bbf88a	0009	2. generalka	2. generalka
00420000-56a7-31ab-8ea0-4ef7a8bf733b	0010	odprta generalka	odprta generalka
00420000-56a7-31ab-fca2-047af67df7e8	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a7-31ab-e1b3-8715c1ed1a21	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a7-31ab-71d9-17253e4163ef	0013	pevska vaja	pevska vaja
00420000-56a7-31ab-6f8b-cb7324829e77	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a7-31ab-1139-2c07e3c6b76b	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a7-31ab-9763-0ab7c81807c7	0016	orientacijska vaja	orientacijska vaja
00420000-56a7-31ab-3342-b866a14bdc6f	0017	situacijska vaja	situacijska vaja
00420000-56a7-31ab-7adc-5597066abdcf	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 40360395)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 40360208)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a7-31ac-6e22-0bd586b7e3a2	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROTb.22sTuz4RAZlI0ubMwnnWaf4M45oG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-aeab-79467dd74772	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-02d4-d630a4cbc814	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-7140-924a4c88ec47	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-17e0-036b7376b397	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-cb87-d754cc1d7883	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-76b3-a0fe0f2e94ea	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-20ba-0552cb95d5a3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-675d-036670086732	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-f289-1571387d0618	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-ce73-18855ad6227c	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-2b2a-59296f3756cd	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-fed7-55b38bf18bd2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-cd86-300e69d78f37	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-6101-066abbd8acf3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-079c-0e42e6498da6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-c38d-8317d94feda5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-bbba-c0acccf24a5b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-87d2-ed6b8fee4bfd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-d2cd-4daea1187e71	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-5938-dfb42ab22dc8	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-4642-897e930bd0f2	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-d704-e1500a49caa4	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-55a6-b7be16df6871	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-66aa-e3a0efb3960a	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-1b20-d374d45bb0f8	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a7-31ae-c6da-0c7dd5220fe6	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a7-31ac-21f3-a6f5cd4a8182	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 40360840)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a7-31ae-69c6-9a94c0372aae	00160000-56a7-31ae-337c-1ccdedf2a663	\N	00140000-56a7-31ab-6362-2e25cfbfff2f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a7-31ae-0e75-2ae8f01abf57
000e0000-56a7-31ae-f1e7-945003a79beb	00160000-56a7-31ae-0e4f-9934db4e6983	\N	00140000-56a7-31ab-cdbe-3a55eb57e754	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a7-31ae-7dae-636365e80106
000e0000-56a7-31ae-0674-55e6c8a3ffd6	\N	\N	00140000-56a7-31ab-cdbe-3a55eb57e754	00190000-56a7-31ae-b6c3-2af4cdf4e56c	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a7-31ae-0e75-2ae8f01abf57
000e0000-56a7-31ae-770f-c5d8ee2ca2c7	\N	\N	00140000-56a7-31ab-cdbe-3a55eb57e754	00190000-56a7-31ae-b6c3-2af4cdf4e56c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a7-31ae-0e75-2ae8f01abf57
000e0000-56a7-31ae-a09b-5bad81b9411f	\N	\N	00140000-56a7-31ab-cdbe-3a55eb57e754	00190000-56a7-31ae-b6c3-2af4cdf4e56c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-34dd-6ae479506d08	\N	\N	00140000-56a7-31ab-cdbe-3a55eb57e754	00190000-56a7-31ae-b6c3-2af4cdf4e56c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-840b-5a08eb05253b	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-5118-f642d6aa06a1	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-ec08-02feae39abce	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-68cf-9bc9e2eaf91c	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-85fd-38e42e4b1075	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-b589-8efddf4b3342	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-823f-21dc11494ec5	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-b9e6-8740d2171c8d	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
000e0000-56a7-31ae-293d-e75c80a9f183	\N	\N	00140000-56a7-31ab-b77f-5a8c2362ada9	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-31ae-750d-fd73c7ce0936
\.


--
-- TOC entry 3170 (class 0 OID 40360559)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40360489)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a7-31af-7c94-6e74db96e375	\N	000e0000-56a7-31ae-f1e7-945003a79beb	1
00200000-56a7-31af-378a-cf66a315dc06	\N	000e0000-56a7-31ae-f1e7-945003a79beb	1
00200000-56a7-31af-0609-61dfc71c4848	\N	000e0000-56a7-31ae-f1e7-945003a79beb	1
00200000-56a7-31af-6566-e61ff8f4e771	\N	000e0000-56a7-31ae-f1e7-945003a79beb	1
00200000-56a7-31af-de62-043a03454e6f	\N	000e0000-56a7-31ae-f1e7-945003a79beb	1
\.


--
-- TOC entry 3182 (class 0 OID 40360652)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 40360763)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a7-31ac-6df2-2dab46810fee	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a7-31ac-6b86-a1c7780e3b8d	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a7-31ac-20ef-7f92f983225b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a7-31ac-ae52-b1e20af1204a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a7-31ac-fc84-add0b3b94467	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a7-31ac-6c9d-a069210d4777	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a7-31ac-2c6b-5c4820aca9b4	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a7-31ac-79d1-52fe572a9c07	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a7-31ac-447a-f46364a42c7d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a7-31ac-50fb-baf7a3e0c837	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a7-31ac-6807-cd7fb14e122b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a7-31ac-34bd-a383c6bf656f	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a7-31ac-285f-1a1cd5721ea3	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a7-31ac-0308-a861f9a38984	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a7-31ac-7c54-6b80c6a6f6ec	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a7-31ac-568f-9c8cfbf2a492	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a7-31ac-18c3-30fbd20ca19b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a7-31ac-cf86-3ce418cf737a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a7-31ac-0bc1-65e9041220b1	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a7-31ac-e095-3780b17856a5	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a7-31ac-9aa0-ba8900a0aafa	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a7-31ac-243e-8420bfc1a310	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a7-31ac-cc92-407daf87b15c	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a7-31ac-fabd-72337dd3cd82	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a7-31ac-739f-9d3010132fdd	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a7-31ac-b362-1458835b0645	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a7-31ac-1ae2-2312349593af	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a7-31ac-37e5-36d05b2a7c3c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 40361144)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 40361113)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 40361156)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 40360725)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a7-31ae-2dac-2986ea454684	00090000-56a7-31ae-de34-f1d691d89def	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-31ae-d08a-611a0d0d85aa	00090000-56a7-31ae-edb1-00254678d87b	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-31ae-9d2b-8d93fe9fcf63	00090000-56a7-31ae-198a-6a116430996b	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-31ae-bed2-0d562fed45a5	00090000-56a7-31ae-425a-537b133c4537	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-31ae-c95d-83502921ef3b	00090000-56a7-31ae-0821-dfbf3212ca68	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-31ae-7b92-540b4b19e802	00090000-56a7-31ae-0349-fb901d2b7a50	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 40360830)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a7-31ab-6362-2e25cfbfff2f	01	Drama	drama (SURS 01)
00140000-56a7-31ab-8809-9645d1e460d6	02	Opera	opera (SURS 02)
00140000-56a7-31ab-8031-01bf3a182f70	03	Balet	balet (SURS 03)
00140000-56a7-31ab-6f1e-c4f3ecc67340	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a7-31ab-b77f-5a8c2362ada9	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a7-31ab-cdbe-3a55eb57e754	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a7-31ab-1c9e-c2bb5cb13f9d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 40360715)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 40360272)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 40360888)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 40360879)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 40360262)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 40360746)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 40360788)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 40361197)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 40360582)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 40360518)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 40360533)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 40360538)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 40361111)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 40360421)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 40360957)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 40360711)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 40360487)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 40360459)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 40360435)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 40360618)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 40361174)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 40361181)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 40361205)
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
-- TOC entry 2766 (class 2606 OID 40360644)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 40360393)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 40360291)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 40360355)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 40360318)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 40360251)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 40360236)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 40360650)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 40360687)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 40360825)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 40360346)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 40360381)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 40361062)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 40360624)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 40360371)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 40360503)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 40360475)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 40360468)
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
-- TOC entry 2764 (class 2606 OID 40360636)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 40361071)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 40361079)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 40361049)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 40361092)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 40360669)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 40360609)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 40360600)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 40360812)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 40360739)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 40360447)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 40360207)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 40360678)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 40360225)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 40360245)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 40360696)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 40360631)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 40360557)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 40360195)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 40360183)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 40360177)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 40360759)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 40360327)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 40360574)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 40360592)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 40360799)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 40360280)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 40361104)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 40360546)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 40360406)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 40360220)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 40360858)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 40360565)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 40360493)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 40360658)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 40360771)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 40361154)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 40361138)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 40361162)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 40360729)
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
-- TOC entry 2833 (class 2606 OID 40360838)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 40360723)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 40360527)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 40360528)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 40360526)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 40360525)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 40360524)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 40360760)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 40360761)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 40360762)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 40361176)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 40361175)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 40360348)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 40360349)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 40360651)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 40361142)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 40361141)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 40361143)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 40361140)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 40361139)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 40360637)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 40360494)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 40360495)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 40360712)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 40360714)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 40360713)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 40360437)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 40360436)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 40361093)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 40360827)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 40360828)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 40360829)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 40361163)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 40360863)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 40360860)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 40360864)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 40360862)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 40360861)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 40360408)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 40360407)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 40360321)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 40360679)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 40360252)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 40360253)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 40360699)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 40360698)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 40360697)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 40360358)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 40360357)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 40360359)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 40360469)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 40360470)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 40360185)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 40360604)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 40360602)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 40360601)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 40360603)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 40360226)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 40360227)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 40360659)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 40361198)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 40360748)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 40360747)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 40361206)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 40361207)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 40360625)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 40360740)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 40360741)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 40360962)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 40360961)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 40360958)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 40360959)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 40360960)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 40360373)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 40360372)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 40360374)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 40360673)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 40360672)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 40361072)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 40361073)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 40360892)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 40360893)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 40360890)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 40360891)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 40360583)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 40360584)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 40360730)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 40360731)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 40360566)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 40360613)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 40360612)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 40360610)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 40360611)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 40360880)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 40360448)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 40360462)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 40360461)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 40360460)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 40360463)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 40360488)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 40360476)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 40360477)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 40361063)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 40361112)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 40361182)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 40361183)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 40360293)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 40360292)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 40360328)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 40360329)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 40360577)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 40360576)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 40360575)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 40360520)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 40360523)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 40360519)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 40360522)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 40360521)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 40360347)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 40360281)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 40360282)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 40360422)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 40360424)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 40360423)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 40360425)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 40360619)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 40360826)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 40360859)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 40360800)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 40360801)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 40360319)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 40360320)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 40360593)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 40360594)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 40360724)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 40360196)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 40360394)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 40360356)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 40360184)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 40361105)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 40360671)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 40360670)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 40360547)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 40360548)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 40360889)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 40360567)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 40360382)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 40360839)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 40361155)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 40361080)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 40361081)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 40360789)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 40360558)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 40360246)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 40361373)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 40361398)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 40361388)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 40361368)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 40361383)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 40361393)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 40361378)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 40361578)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 40361583)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 40361588)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 40361748)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 40361743)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 40361263)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 40361268)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 40361493)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 40361728)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 40361723)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 40361733)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 40361718)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 40361713)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 40361488)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 40361358)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 40361363)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 40361533)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 40361543)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 40361538)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 40361318)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 40361313)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 40361478)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 40361703)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 40361593)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 40361598)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 40361603)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 40361738)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 40361623)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 40361608)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 40361628)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 40361618)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 40361613)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 40361308)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 40361303)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 40361248)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 40361243)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 40361513)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 40361223)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 40361228)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 40361528)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 40361523)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 40361518)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 40361278)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 40361273)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 40361283)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 40361333)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 40361338)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 40361208)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 40361453)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 40361443)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 40361438)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 40361448)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 40361213)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 40361218)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 40361498)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 40361763)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 40361573)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 40361568)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 40361768)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 40361773)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 40361483)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 40361558)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 40361563)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 40361678)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 40361673)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 40361658)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 40361663)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 40361668)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 40361293)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 40361288)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 40361298)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 40361508)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 40361503)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 40361688)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 40361693)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 40361648)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 40361653)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 40361638)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 40361643)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 40361428)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 40361433)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 40361548)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 40361553)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 40361403)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 40361408)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 40361473)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 40361468)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 40361458)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 40361463)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 40361633)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 40361323)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 40361328)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 40361353)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 40361343)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 40361348)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 40361683)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 40361698)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 40361708)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 40361753)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 40361758)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 40361238)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 40361233)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 40361253)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 40361258)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 40361423)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 40361418)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 40361413)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-26 09:43:30 CET

--
-- PostgreSQL database dump complete
--

