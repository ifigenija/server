--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-01 12:54:01 CET

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
-- TOC entry 185 (class 1259 OID 42250012)
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
-- TOC entry 241 (class 1259 OID 42250630)
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
-- TOC entry 240 (class 1259 OID 42250614)
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
-- TOC entry 184 (class 1259 OID 42250005)
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
-- TOC entry 183 (class 1259 OID 42250003)
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
-- TOC entry 231 (class 1259 OID 42250491)
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
-- TOC entry 234 (class 1259 OID 42250521)
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
-- TOC entry 255 (class 1259 OID 42250933)
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
-- TOC entry 212 (class 1259 OID 42250327)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 42250252)
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
    barva character varying(7) DEFAULT NULL::character varying,
    nadrejenogostovanje_id uuid
);


--
-- TOC entry 206 (class 1259 OID 42250278)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 42250283)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 42250855)
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
-- TOC entry 196 (class 1259 OID 42250158)
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
-- TOC entry 242 (class 1259 OID 42250643)
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
-- TOC entry 227 (class 1259 OID 42250449)
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
-- TOC entry 202 (class 1259 OID 42250226)
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
-- TOC entry 199 (class 1259 OID 42250198)
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
-- TOC entry 197 (class 1259 OID 42250175)
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
-- TOC entry 216 (class 1259 OID 42250363)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 42250913)
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
-- TOC entry 254 (class 1259 OID 42250926)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 42250948)
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
-- TOC entry 220 (class 1259 OID 42250387)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 42250132)
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
-- TOC entry 187 (class 1259 OID 42250032)
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
-- TOC entry 191 (class 1259 OID 42250099)
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
-- TOC entry 188 (class 1259 OID 42250043)
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
-- TOC entry 180 (class 1259 OID 42249977)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 42249996)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 42250394)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 42250429)
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
-- TOC entry 237 (class 1259 OID 42250562)
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
-- TOC entry 190 (class 1259 OID 42250079)
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
-- TOC entry 193 (class 1259 OID 42250124)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 42250799)
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
-- TOC entry 217 (class 1259 OID 42250369)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 42250109)
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
-- TOC entry 204 (class 1259 OID 42250244)
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
-- TOC entry 200 (class 1259 OID 42250213)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporednasezvsehupr integer,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 42250219)
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
-- TOC entry 219 (class 1259 OID 42250381)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 42250813)
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
-- TOC entry 246 (class 1259 OID 42250823)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 42250712)
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
-- TOC entry 247 (class 1259 OID 42250831)
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
-- TOC entry 223 (class 1259 OID 42250409)
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
-- TOC entry 215 (class 1259 OID 42250354)
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
-- TOC entry 214 (class 1259 OID 42250344)
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
-- TOC entry 236 (class 1259 OID 42250551)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 42250481)
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
-- TOC entry 198 (class 1259 OID 42250187)
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
-- TOC entry 177 (class 1259 OID 42249948)
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
-- TOC entry 176 (class 1259 OID 42249946)
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
-- TOC entry 224 (class 1259 OID 42250423)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 42249986)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 42249970)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 42250437)
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
-- TOC entry 218 (class 1259 OID 42250375)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 42250298)
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
-- TOC entry 175 (class 1259 OID 42249935)
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
-- TOC entry 174 (class 1259 OID 42249927)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 42249922)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 42250498)
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
-- TOC entry 189 (class 1259 OID 42250071)
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
-- TOC entry 211 (class 1259 OID 42250317)
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
-- TOC entry 213 (class 1259 OID 42250334)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 42250539)
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
-- TOC entry 186 (class 1259 OID 42250022)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 42250843)
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
-- TOC entry 208 (class 1259 OID 42250288)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 42250144)
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
-- TOC entry 178 (class 1259 OID 42249957)
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
-- TOC entry 239 (class 1259 OID 42250589)
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
-- TOC entry 210 (class 1259 OID 42250308)
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
-- TOC entry 203 (class 1259 OID 42250237)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 42250401)
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
-- TOC entry 233 (class 1259 OID 42250512)
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
-- TOC entry 251 (class 1259 OID 42250893)
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
-- TOC entry 250 (class 1259 OID 42250862)
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
-- TOC entry 252 (class 1259 OID 42250905)
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
-- TOC entry 229 (class 1259 OID 42250474)
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
-- TOC entry 238 (class 1259 OID 42250579)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 42250464)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 42250008)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 42249951)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 42250012)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56af-4755-ce8f-f937316d0e61	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56af-4755-f11f-506ba431cdd6	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56af-4755-46a9-cb49ae3699da	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 42250630)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56af-4756-7474-b42375a9e7c5	000d0000-56af-4755-95e7-78e694586905	\N	00090000-56af-4755-411c-e0f790d9f184	000b0000-56af-4755-55e3-f0d744414e3c	0001	f	\N	\N	\N	3	t	t	t
000c0000-56af-4756-8b30-a28c4b5a2b0d	000d0000-56af-4755-6936-173f95a29c48	00100000-56af-4755-d16b-5d0f050313f7	00090000-56af-4755-960b-a9c3bd868032	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56af-4756-b4a2-02516c2b8484	000d0000-56af-4755-7933-910c581e181d	00100000-56af-4755-744b-cb358edb645e	00090000-56af-4755-809c-a3e31c6fc022	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56af-4756-f620-07aa4b259c79	000d0000-56af-4755-237b-3e7da846f490	\N	00090000-56af-4755-e9c6-1f03f9770b0c	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56af-4756-25e2-05d3c6d98320	000d0000-56af-4755-e928-6758c8bae9f8	\N	00090000-56af-4755-816e-1e7c46bf89a8	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56af-4756-20a3-a0ca2f2de207	000d0000-56af-4755-7a40-619d1910a8ab	\N	00090000-56af-4755-cedc-8083a2f5019a	000b0000-56af-4755-cec9-a083da27a4ec	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56af-4756-781a-1e902d4b18b6	000d0000-56af-4755-137b-56f7c9b1fdb6	00100000-56af-4755-a1cd-6455de24c2b5	00090000-56af-4755-55e9-6c02941aa8aa	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56af-4756-7b60-f005f1b1c969	000d0000-56af-4755-bc73-7a3eeb256785	\N	00090000-56af-4755-7ba3-1342b2788dd9	000b0000-56af-4755-ee54-f8f53126a339	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56af-4756-71b7-00d5cf454d7d	000d0000-56af-4755-137b-56f7c9b1fdb6	00100000-56af-4755-442a-230f8fa7ee34	00090000-56af-4755-a5b0-54754713cafc	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56af-4756-f607-0910cd0448e3	000d0000-56af-4755-137b-56f7c9b1fdb6	00100000-56af-4755-a504-55c6b9610133	00090000-56af-4755-2762-b93c0d836c37	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56af-4756-c95d-d77c9ff2db9b	000d0000-56af-4755-137b-56f7c9b1fdb6	00100000-56af-4755-8dab-fdaad0b80121	00090000-56af-4755-e922-c563e7c6fd5c	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56af-4756-513a-49b4b717f1a2	000d0000-56af-4755-853d-98ae11f178fb	00100000-56af-4755-d16b-5d0f050313f7	00090000-56af-4755-960b-a9c3bd868032	000b0000-56af-4755-53ee-c1380a5d1729	0012	t	\N	\N	\N	2	t	t	t
000c0000-56af-4756-d33c-941d9c3f128f	000d0000-56af-4755-8ebb-d563be01ec33	\N	00090000-56af-4755-7ba3-1342b2788dd9	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56af-4756-d03a-e5db50b57261	000d0000-56af-4755-8ebb-d563be01ec33	\N	00090000-56af-4755-acc7-60c3345ef933	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56af-4756-3251-1b6de688ab25	000d0000-56af-4755-2890-67429e57bd41	00100000-56af-4755-744b-cb358edb645e	00090000-56af-4755-809c-a3e31c6fc022	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56af-4756-8c10-f352e9461c81	000d0000-56af-4755-2890-67429e57bd41	\N	00090000-56af-4755-acc7-60c3345ef933	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56af-4756-69d3-a51769717faf	000d0000-56af-4755-276b-0b62a71baaf8	\N	00090000-56af-4755-acc7-60c3345ef933	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56af-4756-261d-b3f557683bab	000d0000-56af-4755-276b-0b62a71baaf8	\N	00090000-56af-4755-7ba3-1342b2788dd9	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56af-4756-fd3b-065cdde7dd92	000d0000-56af-4755-a5e9-9aae061adbf1	00100000-56af-4755-a1cd-6455de24c2b5	00090000-56af-4755-55e9-6c02941aa8aa	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56af-4756-e1d1-2dacf21e4a20	000d0000-56af-4755-a5e9-9aae061adbf1	\N	00090000-56af-4755-acc7-60c3345ef933	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56af-4756-1e18-0f4a6ae03947	000d0000-56af-4755-1e6e-382592a775d7	\N	00090000-56af-4755-acc7-60c3345ef933	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56af-4756-8203-ba617a5e81fc	000d0000-56af-4755-1e6e-382592a775d7	00100000-56af-4755-a1cd-6455de24c2b5	00090000-56af-4755-55e9-6c02941aa8aa	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56af-4756-f4f9-7841d64f2c03	000d0000-56af-4755-7dad-9e779c43d9be	\N	00090000-56af-4755-acc7-60c3345ef933	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56af-4756-137b-dbe3f8739df6	000d0000-56af-4755-79f3-7e747319d74f	\N	00090000-56af-4755-7ba3-1342b2788dd9	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56af-4756-3aff-1f5f99fbf5be	000d0000-56af-4755-56ee-9e48d9f0f0e2	\N	00090000-56af-4755-7ba3-1342b2788dd9	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56af-4756-159a-76d89e2a9b90	000d0000-56af-4755-56ee-9e48d9f0f0e2	00100000-56af-4755-744b-cb358edb645e	00090000-56af-4755-809c-a3e31c6fc022	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56af-4756-c71e-8ad8100effe7	000d0000-56af-4755-e831-35c3b32756f5	\N	00090000-56af-4755-327b-60f0efce6f71	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56af-4756-c3eb-5b7fed161f02	000d0000-56af-4755-e831-35c3b32756f5	\N	00090000-56af-4755-25f4-acc4aaaee62e	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56af-4756-d596-95492765404e	000d0000-56af-4755-a0e3-11d43e3e9241	\N	00090000-56af-4755-7ba3-1342b2788dd9	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56af-4756-0038-706cb82c7591	000d0000-56af-4755-a0e3-11d43e3e9241	00100000-56af-4755-744b-cb358edb645e	00090000-56af-4755-809c-a3e31c6fc022	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56af-4756-37b0-2748f257d439	000d0000-56af-4755-a0e3-11d43e3e9241	\N	00090000-56af-4755-25f4-acc4aaaee62e	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56af-4756-9749-29665048b4ac	000d0000-56af-4755-a0e3-11d43e3e9241	\N	00090000-56af-4755-327b-60f0efce6f71	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56af-4756-2587-3ce2a812a833	000d0000-56af-4755-13d0-b65394ad20dd	\N	00090000-56af-4755-7ba3-1342b2788dd9	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56af-4756-205a-9d0d168131b8	000d0000-56af-4755-bb16-2adaa874203c	00100000-56af-4755-744b-cb358edb645e	00090000-56af-4755-809c-a3e31c6fc022	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56af-4756-ff09-2aadc16fcaca	000d0000-56af-4755-bb16-2adaa874203c	\N	00090000-56af-4755-acc7-60c3345ef933	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 42250614)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 42250005)
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
-- TOC entry 3191 (class 0 OID 42250491)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56af-4755-2290-92ed5540a8ce	00160000-56af-4755-91a6-6fdf76933b54	00090000-56af-4755-25f4-acc4aaaee62e	aizv	10	t
003d0000-56af-4755-a10d-4e6d774d1c52	00160000-56af-4755-91a6-6fdf76933b54	00090000-56af-4755-93d4-374e51b473e0	apri	14	t
003d0000-56af-4755-5880-fb2e4d4f2441	00160000-56af-4755-3b1f-ceef02cf549e	00090000-56af-4755-327b-60f0efce6f71	aizv	11	t
003d0000-56af-4755-91aa-87599338e6d3	00160000-56af-4755-5404-6d9f1c11e828	00090000-56af-4755-31f7-624917be0d2c	aizv	12	t
003d0000-56af-4755-5f44-fad966a1455d	00160000-56af-4755-91a6-6fdf76933b54	00090000-56af-4755-acc7-60c3345ef933	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 42250521)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56af-4755-91a6-6fdf76933b54	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56af-4755-3b1f-ceef02cf549e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56af-4755-5404-6d9f1c11e828	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 42250933)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 42250327)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 42250252)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56af-4755-4c7e-1304511a7ce3	\N	\N	\N	\N	00440000-56af-4755-0158-c28553730c1f	00220000-56af-4755-eb9a-cfd2776f1188	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56af-4755-2dc8-35fef2e3dcd8	\N	\N	\N	\N	00440000-56af-4755-61a8-05f4b3b5f38e	00220000-56af-4755-319f-ff9d4e8fd60a	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56af-4755-f0a6-fd31f65eaf01	\N	\N	\N	001e0000-56af-4755-73ad-05fe33e1e117	\N	00220000-56af-4755-eb9a-cfd2776f1188	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56af-4755-d577-567b309f23a4	\N	\N	\N	001e0000-56af-4755-6923-917415ef07fb	\N	00220000-56af-4755-319f-ff9d4e8fd60a	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56af-4756-7ece-dc742ddef464	\N	00200000-56af-4756-defb-14fae532c919	\N	\N	\N	00220000-56af-4755-ae4a-5e7596171cfe	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56af-4756-fc74-3cc1fc2709e4	\N	00200000-56af-4756-fca1-d62af5589eca	\N	\N	\N	00220000-56af-4755-ae4a-5e7596171cfe	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56af-4756-136e-cb3df8a6cf35	\N	00200000-56af-4756-0753-3cfb91c812fe	\N	\N	\N	00220000-56af-4755-319f-ff9d4e8fd60a	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56af-4756-db0a-552fa04dd636	\N	00200000-56af-4756-2831-d2ef48b72d9d	\N	\N	\N	00220000-56af-4755-2b92-f1de4abbe58e	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56af-4756-f8d1-03eaa7810cd3	\N	00200000-56af-4756-a266-0a314816a728	\N	\N	\N	00220000-56af-4755-8651-21f667774965	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56af-4756-11f6-4cb5d4a45125	\N	00200000-56af-4756-dce2-9ec30fe56cdc	\N	\N	\N	00220000-56af-4755-319f-ff9d4e8fd60a	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56af-4756-c4a4-973ced11e70f	\N	00200000-56af-4756-ed01-7fba3e8ee32f	\N	\N	\N	00220000-56af-4755-8651-21f667774965	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56af-4756-a168-c7a8d97e0126	\N	00200000-56af-4756-de2c-c9d90382152f	\N	\N	\N	00220000-56af-4755-8651-21f667774965	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56af-4756-dd90-eae1359dfd11	\N	00200000-56af-4756-94c6-391977eef9e0	\N	\N	\N	00220000-56af-4755-ae4a-5e7596171cfe	001f0000-56af-4755-95cf-f4c09114d210	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56af-4756-70c7-3c9531ca9fb0	\N	00200000-56af-4756-6709-eb5bc6bcaf94	\N	\N	\N	00220000-56af-4755-ae4a-5e7596171cfe	001f0000-56af-4755-95cf-f4c09114d210	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56af-4756-08fc-ba3cf4c96712	\N	\N	001c0000-56af-4756-f8d8-fd4bc9fe2912	\N	\N	\N	001f0000-56af-4755-b13d-c9bc7105e580	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56af-4756-8066-ec3ee1b8ea84	001b0000-56af-4756-ca23-742245a30eeb	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-95cf-f4c09114d210	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56af-4756-c4d4-d20c2fdcc42c	001b0000-56af-4756-b41a-6084b36a7f8d	\N	\N	\N	\N	00220000-56af-4755-319f-ff9d4e8fd60a	001f0000-56af-4755-95cf-f4c09114d210	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56af-4756-709c-3561c09a4cf4	001b0000-56af-4756-af26-6d948c34eb86	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-95cf-f4c09114d210	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56af-4756-a225-4689a3f7aaf0	001b0000-56af-4756-7f44-a79c20d4177d	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56af-4756-bab2-1927f2e1e910	001b0000-56af-4756-7ed6-46b386739968	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-b13d-c9bc7105e580	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56af-4756-e46e-62ae629694c8	001b0000-56af-4756-54b5-7fb1c821a31d	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-b13d-c9bc7105e580	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56af-4756-81f5-37c9c39d3e8e	001b0000-56af-4756-5a57-73271f2175e2	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-95cf-f4c09114d210	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56af-4756-fe62-b959e8b7548a	001b0000-56af-4756-54ae-454470dfb863	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-b13d-c9bc7105e580	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56af-4756-551c-810d2f104492	001b0000-56af-4756-42fc-129c79faab74	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56af-4756-9126-0d3f61955af8	001b0000-56af-4756-023c-bec723bb0555	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56af-4756-49eb-4ce417e41955	001b0000-56af-4756-88ea-f86cc9c5ec2f	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-b13d-c9bc7105e580	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56af-4756-9326-c0df89585410	001b0000-56af-4756-1da4-6a80a978927d	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-91ba-aff47c87952d	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56af-4756-23b6-49a0a5161df3	001b0000-56af-4756-0bb3-c2794055fdef	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-91ba-aff47c87952d	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56af-4756-ce24-7892e61ec47d	001b0000-56af-4756-7d12-55fd08c76113	\N	\N	\N	\N	00220000-56af-4755-eb9a-cfd2776f1188	001f0000-56af-4755-b13d-c9bc7105e580	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56af-4756-3ba0-e30fcd5137ae	001b0000-56af-4756-1246-03502de62ec1	\N	\N	\N	\N	\N	001f0000-56af-4755-b13d-c9bc7105e580	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56af-4756-f8d8-fd4bc9fe2912
00180000-56af-4756-7117-e613cf463c8f	001b0000-56af-4756-3bf5-4655866ff13d	\N	\N	\N	\N	\N	001f0000-56af-4755-b13d-c9bc7105e580	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56af-4756-f8d8-fd4bc9fe2912
\.


--
-- TOC entry 3166 (class 0 OID 42250278)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56af-4755-73ad-05fe33e1e117
001e0000-56af-4755-6923-917415ef07fb
\.


--
-- TOC entry 3167 (class 0 OID 42250283)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56af-4755-0158-c28553730c1f
00440000-56af-4755-61a8-05f4b3b5f38e
\.


--
-- TOC entry 3209 (class 0 OID 42250855)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 42250158)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56af-4752-e23f-45affb8fd77b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56af-4752-9f33-4fcc05bb2735	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56af-4752-91d2-e2cf9dc2113e	AL	ALB	008	Albania 	Albanija	\N
00040000-56af-4752-e3af-84fd4266b76c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56af-4752-c560-807324171eab	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56af-4752-088c-37327f8fa257	AD	AND	020	Andorra 	Andora	\N
00040000-56af-4752-afbe-1f0ce3bfceab	AO	AGO	024	Angola 	Angola	\N
00040000-56af-4752-6877-985eb5b7b940	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56af-4752-351c-1e56a4c20187	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56af-4752-aa44-2ab43f4681cc	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-4752-d2ec-74e924fb45cd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56af-4752-1c64-ba637e0f4eb6	AM	ARM	051	Armenia 	Armenija	\N
00040000-56af-4752-98da-d29a275b9ae2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56af-4752-4227-af28cc1a5115	AU	AUS	036	Australia 	Avstralija	\N
00040000-56af-4752-7320-212787e90be2	AT	AUT	040	Austria 	Avstrija	\N
00040000-56af-4752-36d3-7b79861331f2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56af-4752-5d47-4a396601f88a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56af-4752-bfa8-195af82f3724	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56af-4752-18e5-14a21868ffa7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56af-4752-14c3-cb13160aa5c1	BB	BRB	052	Barbados 	Barbados	\N
00040000-56af-4752-869c-aec9a0e42f99	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56af-4752-d059-c31b6103dab9	BE	BEL	056	Belgium 	Belgija	\N
00040000-56af-4752-2eb4-75510f243e11	BZ	BLZ	084	Belize 	Belize	\N
00040000-56af-4752-fe5c-3f9c17c9ca6e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56af-4752-4b1e-44cd57f51be6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56af-4752-6694-f1ee80571246	BT	BTN	064	Bhutan 	Butan	\N
00040000-56af-4752-6890-1c9bf8928ad5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56af-4752-3ec1-ba0e7bd6c840	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56af-4752-5c2f-48bd6160647e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56af-4752-bb61-6460cdb82178	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56af-4752-b266-aa54528b6274	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56af-4752-2ccf-b42032bedf66	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56af-4752-a04c-1b84684f6443	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56af-4752-e91d-35072e445541	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56af-4752-a60f-c9e8a29d2032	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56af-4752-d89c-628e471a8136	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56af-4752-5506-fc5708c6ae60	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56af-4752-11c3-1f9c0224f10a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56af-4752-8f7f-32bfbe1e5d43	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56af-4752-2107-80de4ce65346	CA	CAN	124	Canada 	Kanada	\N
00040000-56af-4752-5047-6ef06f0e2c8b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56af-4752-97e8-56218c05143a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56af-4752-f5ac-fdaefb042fa2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56af-4752-8566-c4c71236c798	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56af-4752-2d02-1309d710d5f0	CL	CHL	152	Chile 	Čile	\N
00040000-56af-4752-58b7-c0d4b3ff8138	CN	CHN	156	China 	Kitajska	\N
00040000-56af-4752-e2f9-1d24382b1ebc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56af-4752-c621-9d80922a7a71	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56af-4752-0f2d-822e781926f1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56af-4752-845b-1e7d29653f8f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56af-4752-2fe2-0191706e826c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56af-4752-3e29-6e31563b4fe5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56af-4752-b4a9-01e934af982a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56af-4752-5a01-eca97c5396d3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56af-4752-a329-91b88300b09a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56af-4752-917f-b68ccccb3d94	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56af-4752-a149-3fe65c46a2c3	CU	CUB	192	Cuba 	Kuba	\N
00040000-56af-4752-3a90-6cbdbcebaf75	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56af-4752-9c78-1af802cb2f6c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56af-4752-72e0-7fb718a4d112	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56af-4752-5a65-fad54a233a96	DK	DNK	208	Denmark 	Danska	\N
00040000-56af-4752-da41-b2b3151e346e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56af-4752-9c63-cfde806dd25c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-4752-9b59-502b2bfd675b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56af-4752-4af7-99045a35f19a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56af-4752-45ad-1c7264e6ea17	EG	EGY	818	Egypt 	Egipt	\N
00040000-56af-4752-2756-59de2f9dfb3a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56af-4752-8010-d00f8705c667	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56af-4752-6892-b122e642b6d7	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56af-4752-6cd1-9164752cebf5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56af-4752-21c8-3e7b744f007a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56af-4752-0011-20db11ff5aa1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56af-4752-ec4e-978659b476d6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56af-4752-61dc-b4e7a4b9dfb2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56af-4752-06fb-e67b1e364420	FI	FIN	246	Finland 	Finska	\N
00040000-56af-4752-9759-442d521c36c5	FR	FRA	250	France 	Francija	\N
00040000-56af-4752-7dee-d7c05ebe6cec	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56af-4752-6da9-3b624c614ab2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56af-4752-af2e-5a3130fe0ab3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56af-4752-5534-dc142afbb153	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56af-4752-1ad7-088ec734d1db	GA	GAB	266	Gabon 	Gabon	\N
00040000-56af-4752-7b7e-0c395eea2820	GM	GMB	270	Gambia 	Gambija	\N
00040000-56af-4752-6da8-c1a8e7d1e936	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56af-4752-6854-3237256838a3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56af-4752-746f-35d5890351ab	GH	GHA	288	Ghana 	Gana	\N
00040000-56af-4752-4d8a-a93732c5a5fa	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56af-4752-f81a-fabe834b8f63	GR	GRC	300	Greece 	Grčija	\N
00040000-56af-4752-8060-686735f8e73a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56af-4752-acda-1f376fbc16cc	GD	GRD	308	Grenada 	Grenada	\N
00040000-56af-4752-db46-a66a2c6578ae	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56af-4752-1388-160a97ee4166	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56af-4752-a6d5-d47711c2a0e4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56af-4752-61ee-9eee0abc461e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56af-4752-cdae-09e6e9d1b721	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56af-4752-7a33-1b24fe68b8d8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56af-4752-6fa6-f7f4d4583332	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56af-4752-f92a-b9e40e11d6fb	HT	HTI	332	Haiti 	Haiti	\N
00040000-56af-4752-47bd-d9ab9d3bbdfd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56af-4752-8b5b-841d6f501212	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56af-4752-bfbd-acf0db698cc2	HN	HND	340	Honduras 	Honduras	\N
00040000-56af-4752-6652-b1879c4ca0e4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56af-4752-5dee-fe2114488e83	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56af-4752-5426-18b61379c9f4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56af-4752-db0e-86173d4e0565	IN	IND	356	India 	Indija	\N
00040000-56af-4752-dc8e-953937d1635a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56af-4752-3bb4-178a18e2827a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56af-4752-e347-c4177c3f927a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56af-4752-0af1-bb8cc1403997	IE	IRL	372	Ireland 	Irska	\N
00040000-56af-4752-8743-53355a8d9700	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56af-4752-665b-565a3cf19f51	IL	ISR	376	Israel 	Izrael	\N
00040000-56af-4752-6154-6b38c28f64c7	IT	ITA	380	Italy 	Italija	\N
00040000-56af-4752-bd65-8f7aaf429841	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56af-4752-abc6-e676063e1da3	JP	JPN	392	Japan 	Japonska	\N
00040000-56af-4752-4d95-160d6149ca76	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56af-4752-2782-36d9b653a466	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56af-4752-123c-8141d21f95fd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56af-4752-16c3-12ff621a86fa	KE	KEN	404	Kenya 	Kenija	\N
00040000-56af-4752-a427-be3634b844c6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56af-4752-71b3-3bf158cee46f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56af-4752-5090-b547a5da94a4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56af-4752-d9aa-eba4c743f0d6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56af-4752-f56b-854b5688e6de	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56af-4752-b189-09f99e026cd2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56af-4752-52da-50c92d731210	LV	LVA	428	Latvia 	Latvija	\N
00040000-56af-4752-7a4a-ed4a8555f207	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56af-4752-1b2f-664fc24a28f4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56af-4752-6539-5adc141420a6	LR	LBR	430	Liberia 	Liberija	\N
00040000-56af-4752-659d-e786f24f0900	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56af-4752-0e06-846d87dff87d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56af-4752-f8ca-c2f39a8576b4	LT	LTU	440	Lithuania 	Litva	\N
00040000-56af-4752-4765-eafbd226c4c5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56af-4752-b5d9-d7146bc88240	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56af-4752-f88e-0f0c7476a076	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56af-4752-3df5-89158b932092	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56af-4752-39a3-c1dfdee5ab9e	MW	MWI	454	Malawi 	Malavi	\N
00040000-56af-4752-3cf4-7a48455cfde1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56af-4752-9d92-b30fecf25c9e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56af-4752-7c07-372987c8c58b	ML	MLI	466	Mali 	Mali	\N
00040000-56af-4752-eeb4-89f9196a4505	MT	MLT	470	Malta 	Malta	\N
00040000-56af-4752-3753-49ac6b7922ae	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56af-4752-d8ab-ff7daf28bbfe	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56af-4752-a5f3-746171bd44de	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56af-4752-0727-8a796a883935	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56af-4752-8667-3913db9f9cb7	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56af-4752-f4da-5ca34ca7a10f	MX	MEX	484	Mexico 	Mehika	\N
00040000-56af-4752-23c0-6e1bb40cc42f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56af-4752-a0a9-1c3f2e8cfad3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56af-4752-b340-933df0e77d83	MC	MCO	492	Monaco 	Monako	\N
00040000-56af-4752-9024-8a258db6c254	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56af-4752-c80d-4d50b3653a3d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56af-4752-b56e-100dc5d81565	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56af-4752-4618-855cc8c0f259	MA	MAR	504	Morocco 	Maroko	\N
00040000-56af-4752-b6de-d2f378469efe	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56af-4752-aa6c-bbe8a6b0f7b0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56af-4752-62fb-7afbffd02190	NA	NAM	516	Namibia 	Namibija	\N
00040000-56af-4752-e9a5-9869779a0961	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56af-4752-a55f-912364bd7e06	NP	NPL	524	Nepal 	Nepal	\N
00040000-56af-4752-f4ee-031bd5d7257e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56af-4752-2ec7-dfc1ee44ed40	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56af-4752-5f94-b13c69c9b7e5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56af-4752-43b9-c956c2e5f421	NE	NER	562	Niger 	Niger 	\N
00040000-56af-4752-7b2f-321243ec49a5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56af-4752-b448-4159334ab0da	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56af-4752-40b5-f29792be868e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56af-4752-1f3f-7dcbc313ac05	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56af-4752-cd97-7338b0ec31dd	NO	NOR	578	Norway 	Norveška	\N
00040000-56af-4752-b69e-1f497bc9c86d	OM	OMN	512	Oman 	Oman	\N
00040000-56af-4752-c33e-aabae55fb4da	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56af-4752-7864-d00b9778b8f2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56af-4752-35cd-d5982e857587	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56af-4752-a906-7561130cf210	PA	PAN	591	Panama 	Panama	\N
00040000-56af-4752-0abf-23ff6b833e10	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56af-4752-0a97-12d22013ab41	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56af-4752-d5c8-5f72c5e92732	PE	PER	604	Peru 	Peru	\N
00040000-56af-4752-a440-6cbdd0a41847	PH	PHL	608	Philippines 	Filipini	\N
00040000-56af-4752-4303-95d39cea6625	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56af-4752-3cbc-931d01323996	PL	POL	616	Poland 	Poljska	\N
00040000-56af-4752-45c9-4e79342d49dc	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56af-4752-1e48-3ad5859caf87	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56af-4752-61d3-0edc928a874a	QA	QAT	634	Qatar 	Katar	\N
00040000-56af-4752-048a-5bed755705a6	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56af-4752-2b20-c94ec48c3042	RO	ROU	642	Romania 	Romunija	\N
00040000-56af-4752-bbfc-af978a41d1f5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56af-4752-eb89-9b11d9d20304	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56af-4752-b89c-6f0e736f8cbc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56af-4752-e3f2-29ab93db34c8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56af-4752-6ca0-1183af74e653	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56af-4752-50e7-7485c995685f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56af-4752-d5c5-df866405d254	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56af-4752-de98-0740f85e6b63	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56af-4752-53a3-ecfcab02747a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56af-4752-0801-b2c170fa2747	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56af-4752-749b-798d0f256849	SM	SMR	674	San Marino 	San Marino	\N
00040000-56af-4752-d8e3-1e8411ef6741	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56af-4752-e57b-ad0fc64567e4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56af-4752-5572-d4dfb02572db	SN	SEN	686	Senegal 	Senegal	\N
00040000-56af-4752-353c-0420226ead67	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56af-4752-df79-8a80243ae6d7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56af-4752-48c7-ad7010717b5a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56af-4752-a02b-865efee80eb0	SG	SGP	702	Singapore 	Singapur	\N
00040000-56af-4752-5ade-95b5fe9a2d3c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56af-4752-135e-dcd2a1462007	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56af-4752-04a4-6b7ae22ca3b1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56af-4752-6f8a-32d6237a0e35	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56af-4752-049c-4a7cd917d31b	SO	SOM	706	Somalia 	Somalija	\N
00040000-56af-4752-0425-475c664feccb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56af-4752-9eb5-42ed7c9df676	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56af-4752-7ac9-cd768bcd9be7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56af-4752-276c-f88021bb16a4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56af-4752-4123-c790d0bb83b3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56af-4752-4817-e8f49ea44c32	SD	SDN	729	Sudan 	Sudan	\N
00040000-56af-4752-fa31-db32b4b1ff4a	SR	SUR	740	Suriname 	Surinam	\N
00040000-56af-4752-a420-b8ae3b859a68	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56af-4752-264e-da968b0f6952	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56af-4752-df1d-ef9c36e34fb6	SE	SWE	752	Sweden 	Švedska	\N
00040000-56af-4752-d06c-4a4bbc24e9f6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56af-4752-0bce-fe5695db1551	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56af-4752-c163-d32f4b8d28a5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56af-4752-a903-24c9105f599d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56af-4752-af05-0fab5620052f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56af-4752-d306-6df7421572db	TH	THA	764	Thailand 	Tajska	\N
00040000-56af-4752-854d-1d041f1cb796	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56af-4752-d888-68567d5c3130	TG	TGO	768	Togo 	Togo	\N
00040000-56af-4752-92fc-dd62de74016c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56af-4752-0c32-715a33aa4c1b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56af-4752-7b76-5a8d1c64fbbb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56af-4752-f865-06862f30c7a9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56af-4752-e801-1d3201719b94	TR	TUR	792	Turkey 	Turčija	\N
00040000-56af-4752-86a0-6d1cfeab27c0	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56af-4752-50b6-94860b7ca4a5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-4752-c39b-8ec4292349c6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56af-4752-04c4-be2c9383ab13	UG	UGA	800	Uganda 	Uganda	\N
00040000-56af-4752-1068-6b5c360f2544	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56af-4752-4592-1e2903a13534	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56af-4752-dd20-46e2f88ec7d5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56af-4752-a2eb-f11c5ef313fb	US	USA	840	United States 	Združene države Amerike	\N
00040000-56af-4752-d30f-f02732649354	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56af-4752-c8d1-380b332d3f79	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56af-4752-0b46-f2d265d783da	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56af-4752-c4b7-ff1a6a22a7e1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56af-4752-e2d4-9255b869bcc4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56af-4752-5cfe-c34d4b1f2d75	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56af-4752-f395-049520a0791b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-4752-0c5b-d97b9e87094e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56af-4752-8fd1-dd4b1189c3a9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56af-4752-d456-724a3323cab4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56af-4752-b8b6-73d9ee01b0dc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56af-4752-74b9-7038f233e9b8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56af-4752-b43b-25208b3a2993	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 42250643)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56af-4755-edf4-2d74c291e19e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56af-4755-64f5-523188de84e9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-4755-358b-aa2d9425cd58	000e0000-56af-4755-210a-8e7c3df3f5eb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-4752-b89f-03cca1f57746	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-4755-6b45-640326e423e4	000e0000-56af-4755-c36e-fce048942f4d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-4752-6855-5c703ed6f03b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-4755-5b4e-00dd4dddc2c1	000e0000-56af-4755-a759-366e4641c2dd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-4752-b89f-03cca1f57746	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 42250449)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56af-4755-8653-d6a8642bbe4b	000e0000-56af-4755-c36e-fce048942f4d	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56af-4752-94b1-849fe1b30f01
000d0000-56af-4755-5fb5-d6a2eedfc24c	000e0000-56af-4755-df5e-050006f3b440	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-4752-5513-e18474db64d3
000d0000-56af-4755-f853-905182effca4	000e0000-56af-4755-df5e-050006f3b440	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-95e7-78e694586905	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-7474-b42375a9e7c5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-4752-5513-e18474db64d3
000d0000-56af-4755-6936-173f95a29c48	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-8b30-a28c4b5a2b0d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-7933-910c581e181d	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-b4a2-02516c2b8484	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56af-4752-0ee1-8551cebcd131
000d0000-56af-4755-237b-3e7da846f490	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-f620-07aa4b259c79	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56af-4752-94b1-849fe1b30f01
000d0000-56af-4755-e928-6758c8bae9f8	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-25e2-05d3c6d98320	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56af-4752-94b1-849fe1b30f01
000d0000-56af-4755-7a40-619d1910a8ab	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-20a3-a0ca2f2de207	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-4752-5513-e18474db64d3
000d0000-56af-4755-137b-56f7c9b1fdb6	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-71b7-00d5cf454d7d	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56af-4752-5513-e18474db64d3
000d0000-56af-4755-bc73-7a3eeb256785	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-7b60-f005f1b1c969	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56af-4752-d7c8-b68d96782c93
000d0000-56af-4755-853d-98ae11f178fb	000e0000-56af-4755-c36e-fce048942f4d	000c0000-56af-4756-513a-49b4b717f1a2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56af-4752-3e2e-57343596f91e
000d0000-56af-4755-8ebb-d563be01ec33	000e0000-56af-4755-18dd-a3c9227d706b	000c0000-56af-4756-d33c-941d9c3f128f	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-2890-67429e57bd41	000e0000-56af-4755-d0e9-7faf117582ef	000c0000-56af-4756-3251-1b6de688ab25	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-276b-0b62a71baaf8	000e0000-56af-4755-d0e9-7faf117582ef	000c0000-56af-4756-69d3-a51769717faf	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-a5e9-9aae061adbf1	000e0000-56af-4755-a9f2-133d4d5a35fa	000c0000-56af-4756-fd3b-065cdde7dd92	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-1e6e-382592a775d7	000e0000-56af-4755-dc98-8608c5301f84	000c0000-56af-4756-1e18-0f4a6ae03947	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-7dad-9e779c43d9be	000e0000-56af-4755-7a42-09fe13a98496	000c0000-56af-4756-f4f9-7841d64f2c03	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-79f3-7e747319d74f	000e0000-56af-4755-5539-d69c2a6dffb6	000c0000-56af-4756-137b-dbe3f8739df6	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-56ee-9e48d9f0f0e2	000e0000-56af-4755-b3df-ade8d228a02c	000c0000-56af-4756-3aff-1f5f99fbf5be	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-e831-35c3b32756f5	000e0000-56af-4755-e7ee-90ac6e395ffe	000c0000-56af-4756-c71e-8ad8100effe7	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-a0e3-11d43e3e9241	000e0000-56af-4755-e7ee-90ac6e395ffe	000c0000-56af-4756-d596-95492765404e	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-13d0-b65394ad20dd	000e0000-56af-4755-d5a1-fc7e524ae712	000c0000-56af-4756-2587-3ce2a812a833	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
000d0000-56af-4755-bb16-2adaa874203c	000e0000-56af-4755-d5a1-fc7e524ae712	000c0000-56af-4756-205a-9d0d168131b8	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56af-4752-62dc-958659826ccd
\.


--
-- TOC entry 3162 (class 0 OID 42250226)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56af-4756-f8d8-fd4bc9fe2912	00040000-56af-4752-5426-18b61379c9f4		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 42250198)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 42250175)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56af-4755-dfe9-27c8b32277e9	00080000-56af-4755-29fe-853b3c61644f	00090000-56af-4755-2762-b93c0d836c37	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 42250363)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 42250913)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56af-4755-6c95-ab113b1cf68c	00010000-56af-4753-c836-1cd1166910a3	\N	Prva mapa	Root mapa	2016-02-01 12:53:57	2016-02-01 12:53:57	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 42250926)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 42250948)
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
-- TOC entry 3180 (class 0 OID 42250387)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 42250132)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56af-4753-d0b4-265c5e0128e6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56af-4753-24e0-9c57c45dc0fd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56af-4753-b753-d910c8289644	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56af-4753-af66-df87f98f7f84	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56af-4753-cd5c-c467c36079e4	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56af-4753-8bda-25319643b1f7	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56af-4753-5955-507e3e8c0437	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56af-4753-4b4d-f10d77a28d1e	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56af-4753-8333-788599d11f19	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56af-4753-9359-755405241508	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56af-4753-8dab-ca503fe717e0	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-4753-2b83-8ad074c85beb	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-4753-afdd-b8383ba80d22	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56af-4753-8817-4551e900b525	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56af-4753-5fc5-3c112ce47ef6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56af-4753-4a82-2bccfba71644	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56af-4753-310a-ec53d5cc982c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56af-4755-0bf3-47cc9e5b461a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56af-4755-16b3-51b4e7149492	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56af-4755-f5b5-9f6c57fdfcdf	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56af-4755-b707-446086bde2c1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56af-4755-dd22-a9b6ff01ce01	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56af-4755-1457-95143c320b88	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56af-4757-8b14-b8aa9b71ca19	application.tenant.maticnopodjetje	string	s:36:"00080000-56af-4757-2ff0-d0848abf1b06";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 42250032)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56af-4755-8258-4d262e0faf7d	00000000-56af-4755-0bf3-47cc9e5b461a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56af-4755-78c1-95b63bc92876	00000000-56af-4755-0bf3-47cc9e5b461a	00010000-56af-4753-c836-1cd1166910a3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56af-4755-cfcc-c712fff84161	00000000-56af-4755-16b3-51b4e7149492	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56af-4755-f9e3-e1ed3838ce3e	00000000-56af-4755-1457-95143c320b88	\N	s:6:"zelena";	t
00000000-56af-4755-257b-dfdf8d242fe6	00000000-56af-4755-1457-95143c320b88	00010000-56af-4753-c836-1cd1166910a3	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 42250099)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56af-4755-566d-a241b5bd5cd5	\N	00100000-56af-4755-d16b-5d0f050313f7	00100000-56af-4755-744b-cb358edb645e	01	Gledališče Nimbis
00410000-56af-4755-069b-c1a9622fb1d9	00410000-56af-4755-566d-a241b5bd5cd5	00100000-56af-4755-d16b-5d0f050313f7	00100000-56af-4755-744b-cb358edb645e	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 42250043)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56af-4755-411c-e0f790d9f184	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56af-4755-e9c6-1f03f9770b0c	00010000-56af-4755-8399-61b8df61e608	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56af-4755-809c-a3e31c6fc022	00010000-56af-4755-47ad-e3a4ee634df7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56af-4755-a5b0-54754713cafc	00010000-56af-4755-0969-3a828f40063a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56af-4755-ca06-1a54dd1b0195	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56af-4755-cedc-8083a2f5019a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56af-4755-e922-c563e7c6fd5c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56af-4755-55e9-6c02941aa8aa	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56af-4755-2762-b93c0d836c37	00010000-56af-4755-3184-ac213662a472	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56af-4755-960b-a9c3bd868032	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56af-4755-64cf-97d3b218e21a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-4755-816e-1e7c46bf89a8	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56af-4755-7ba3-1342b2788dd9	00010000-56af-4755-58e5-837c30d5200e	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-4755-25f4-acc4aaaee62e	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-4755-93d4-374e51b473e0	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-4755-327b-60f0efce6f71	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-4755-31f7-624917be0d2c	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-4755-acc7-60c3345ef933	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-4755-fb98-e7619260456c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-4755-c1c0-b2d1250bb9a1	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-4755-c6e8-a53c2b59956f	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 42249977)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56af-4753-bfc5-736aa4597eda	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56af-4753-0f9f-491a92733bd7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56af-4753-f5b7-8712f1465a62	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56af-4753-429e-6733c9c5e35c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56af-4753-0259-8798702c79ce	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56af-4753-fb08-cc970041c678	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56af-4753-1a94-9c11cfec000f	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56af-4753-d6de-4f5d3c4d1b94	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56af-4753-3d64-8e489f803f53	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56af-4753-9c3c-51b63d21367f	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56af-4753-b3fa-d084ef33f15c	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56af-4753-676b-138bd0235d01	Abonma-read	Abonma - branje	t
00030000-56af-4753-9595-d09925708824	Abonma-write	Abonma - spreminjanje	t
00030000-56af-4753-a500-b5485f6dd783	Alternacija-read	Alternacija - branje	t
00030000-56af-4753-df13-8549935f4ab2	Alternacija-write	Alternacija - spreminjanje	t
00030000-56af-4753-30f7-9cdb422b0d9c	Arhivalija-read	Arhivalija - branje	t
00030000-56af-4753-da93-ec999c51146c	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56af-4753-c9df-3c569c797ca3	AuthStorage-read	AuthStorage - branje	t
00030000-56af-4753-2d5c-ef9eb1653e9e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56af-4753-046b-f86de961e2d9	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56af-4753-ed23-2a53ab83ba53	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56af-4753-2cfe-00756815469e	Besedilo-read	Besedilo - branje	t
00030000-56af-4753-1584-710f051a275d	Besedilo-write	Besedilo - spreminjanje	t
00030000-56af-4753-ceb9-5de45284c36a	Dodatek-read	Dodatek - branje	t
00030000-56af-4753-a553-9ab1bd41f549	Dodatek-write	Dodatek - spreminjanje	t
00030000-56af-4753-070d-b412506d2763	Dogodek-read	Dogodek - branje	t
00030000-56af-4753-4892-b436bb3c97a6	Dogodek-write	Dogodek - spreminjanje	t
00030000-56af-4753-5657-70291e98a212	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56af-4753-d897-7b4547810daa	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56af-4753-681f-3617c2a1e8e1	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56af-4753-fa01-0f627803c91f	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56af-4753-4aee-0255ea69abc5	DogodekTrait-read	DogodekTrait - branje	t
00030000-56af-4753-3bdc-2d1a14b4c48d	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56af-4753-a278-f918d20508ac	DrugiVir-read	DrugiVir - branje	t
00030000-56af-4753-073e-9ab77a57d209	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56af-4753-067e-104be50a7149	Drzava-read	Drzava - branje	t
00030000-56af-4753-276d-5765d451ea8d	Drzava-write	Drzava - spreminjanje	t
00030000-56af-4753-6769-fc94963a777f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56af-4753-1939-34fda05d2fbf	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56af-4753-1500-a87dabb0c30f	Funkcija-read	Funkcija - branje	t
00030000-56af-4753-8a07-04f631ed24c8	Funkcija-write	Funkcija - spreminjanje	t
00030000-56af-4753-cb48-ddc7f89ac685	Gostovanje-read	Gostovanje - branje	t
00030000-56af-4753-e0eb-7cdb40309689	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56af-4753-645c-64c0327707fd	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56af-4753-544d-82233c92b899	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56af-4753-35c5-abdf4a9e22d5	Kupec-read	Kupec - branje	t
00030000-56af-4753-d3e6-d055965bf9c6	Kupec-write	Kupec - spreminjanje	t
00030000-56af-4753-f643-ca8c76ff99d1	NacinPlacina-read	NacinPlacina - branje	t
00030000-56af-4753-8c98-bdc7664c90c7	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56af-4753-161a-b0d9d277e469	Option-read	Option - branje	t
00030000-56af-4753-b784-5bb0e902a952	Option-write	Option - spreminjanje	t
00030000-56af-4753-a010-31d15d6e9fae	OptionValue-read	OptionValue - branje	t
00030000-56af-4753-abe6-e99b4b144434	OptionValue-write	OptionValue - spreminjanje	t
00030000-56af-4753-afd8-669e3b5a76ed	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56af-4753-a002-0fc0fb544ac3	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56af-4753-b721-e7f77acdd055	Oseba-read	Oseba - branje	t
00030000-56af-4753-cdf8-bf5cee5b0903	Oseba-write	Oseba - spreminjanje	t
00030000-56af-4753-3bb9-f7816fc266ba	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56af-4753-231c-8eb02a81289b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56af-4753-c082-c0260d3b56e5	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56af-4753-544f-0b3ca1d97a70	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56af-4753-cba1-87e85629b34d	Pogodba-read	Pogodba - branje	t
00030000-56af-4753-1545-fdf7b246e1e2	Pogodba-write	Pogodba - spreminjanje	t
00030000-56af-4753-a2ca-f38ac103b5aa	Popa-read	Popa - branje	t
00030000-56af-4753-007f-a946619faff9	Popa-write	Popa - spreminjanje	t
00030000-56af-4753-457c-b3031db74c63	Posta-read	Posta - branje	t
00030000-56af-4753-5764-e41c0495d0c7	Posta-write	Posta - spreminjanje	t
00030000-56af-4753-333f-4987ccfb08ec	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56af-4753-1de2-7ee74110a0b6	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56af-4753-b596-a36e2609f961	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56af-4753-1d29-85f0115d9f42	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56af-4753-c770-2074a4fbebe9	PostniNaslov-read	PostniNaslov - branje	t
00030000-56af-4753-8d57-c93791517b36	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56af-4753-6dde-4472a6c36155	Praznik-read	Praznik - branje	t
00030000-56af-4753-96f3-c4588187bf7e	Praznik-write	Praznik - spreminjanje	t
00030000-56af-4753-71bf-75dc9649e4cc	Predstava-read	Predstava - branje	t
00030000-56af-4753-4397-62239ef02bf8	Predstava-write	Predstava - spreminjanje	t
00030000-56af-4753-dbc6-335f7430d55b	Ura-read	Ura - branje	t
00030000-56af-4753-c20a-f8c8b7027290	Ura-write	Ura - spreminjanje	t
00030000-56af-4753-1b67-eba3fcc826c8	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56af-4753-b69e-a123d7ef645e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56af-4753-67a8-1a0526bad972	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56af-4753-f564-a3802cd4c1d9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56af-4753-5926-521b622157d8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56af-4753-c3b6-c388ec4e395e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56af-4753-9d52-c58228a4a67f	ProgramDela-read	ProgramDela - branje	t
00030000-56af-4753-505a-23516763876e	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56af-4753-a690-5aa4fd5d6a34	ProgramFestival-read	ProgramFestival - branje	t
00030000-56af-4753-5dd0-f6b70f6af09c	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56af-4753-e013-2b52e679469b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56af-4753-19a9-1cb72396e144	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56af-4753-d9d8-6c0399c50186	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56af-4753-d26a-71a87ff926ea	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56af-4753-f669-f5583ef519cc	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56af-4753-d655-df9dd780f0cc	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56af-4753-fc65-3132b5d058ae	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56af-4753-f8a7-384effcf8349	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56af-4753-7d57-9f437afa85fc	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56af-4753-b348-b4be12d3e172	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56af-4753-a5c9-fd630697369e	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56af-4753-f437-b9432258143e	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56af-4753-99a0-3827168e0191	ProgramRazno-read	ProgramRazno - branje	t
00030000-56af-4753-f69d-a4ed16367851	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56af-4753-a5ec-e76feef8d31a	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56af-4753-ba99-da8c91b96119	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56af-4753-c1a6-482e3405cdb4	Prostor-read	Prostor - branje	t
00030000-56af-4753-4a53-0f6cbcdeaffe	Prostor-write	Prostor - spreminjanje	t
00030000-56af-4753-e595-c875f9477edf	Racun-read	Racun - branje	t
00030000-56af-4753-4331-ae7ebe46301f	Racun-write	Racun - spreminjanje	t
00030000-56af-4753-2835-c735bf53fb49	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56af-4753-d8ef-5d19ef6951d9	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56af-4753-eba6-59584e272a0a	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56af-4753-0885-e968300262fe	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56af-4753-7548-f06bc580aac9	Rekvizit-read	Rekvizit - branje	t
00030000-56af-4753-e068-9f1086c38a5a	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56af-4753-0eb7-f071e2301bd7	Revizija-read	Revizija - branje	t
00030000-56af-4753-b162-ef0125ec81ff	Revizija-write	Revizija - spreminjanje	t
00030000-56af-4753-cb83-e9154147cc9f	Rezervacija-read	Rezervacija - branje	t
00030000-56af-4753-719b-5e4bbd5ac9bb	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56af-4753-20fd-79d383f2eb98	SedezniRed-read	SedezniRed - branje	t
00030000-56af-4753-3561-b215d8687cd5	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56af-4753-9276-b06b68a8d2da	Sedez-read	Sedez - branje	t
00030000-56af-4753-deba-45150aec6ac4	Sedez-write	Sedez - spreminjanje	t
00030000-56af-4753-513b-819ca73c8b7e	Sezona-read	Sezona - branje	t
00030000-56af-4753-3046-978987fc05a1	Sezona-write	Sezona - spreminjanje	t
00030000-56af-4753-971f-e419f1290603	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56af-4753-3668-eb70259527b0	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56af-4753-aa32-0e6765b4f725	Telefonska-read	Telefonska - branje	t
00030000-56af-4753-34c7-08180542df93	Telefonska-write	Telefonska - spreminjanje	t
00030000-56af-4753-8c0a-737eb09f59a4	TerminStoritve-read	TerminStoritve - branje	t
00030000-56af-4753-f402-82e90dcea5a9	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56af-4753-4bf9-91ea925c2df7	TipDodatka-read	TipDodatka - branje	t
00030000-56af-4753-e01d-a2d73220734b	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56af-4753-483a-eef88b8e8bfb	TipFunkcije-read	TipFunkcije - branje	t
00030000-56af-4753-6790-473f6a64566b	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56af-4753-fdb2-b7505778626d	TipPopa-read	TipPopa - branje	t
00030000-56af-4753-8126-26af91ac6d7c	TipPopa-write	TipPopa - spreminjanje	t
00030000-56af-4753-6a31-53ea28431bee	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56af-4753-e0fc-53fb89f4008e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56af-4753-c1f1-9f8f1b67d3d8	TipVaje-read	TipVaje - branje	t
00030000-56af-4753-f942-720820b09a80	TipVaje-write	TipVaje - spreminjanje	t
00030000-56af-4753-1775-71885ac23330	Trr-read	Trr - branje	t
00030000-56af-4753-3784-33660a037090	Trr-write	Trr - spreminjanje	t
00030000-56af-4753-fba8-84e75a7a724c	Uprizoritev-read	Uprizoritev - branje	t
00030000-56af-4753-4847-b49badac0cba	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56af-4753-8dfe-112100c0712b	Vaja-read	Vaja - branje	t
00030000-56af-4753-85ae-ecade8631b99	Vaja-write	Vaja - spreminjanje	t
00030000-56af-4753-5b31-ab1964c4f172	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56af-4753-ab39-efb4b0315206	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56af-4753-742d-44f1e07402eb	VrstaStroska-read	VrstaStroska - branje	t
00030000-56af-4753-8211-1263fa55ad17	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56af-4753-2f96-ae24768767a5	Zaposlitev-read	Zaposlitev - branje	t
00030000-56af-4753-c25f-079dac03e850	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56af-4753-0723-e684165931fe	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56af-4753-f01e-1581991eeaa6	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56af-4753-962d-3d69d57a1e2e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56af-4753-40d2-7245afdc1681	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56af-4753-421b-29251476937a	Job-read	Branje opravil - samo zase - branje	t
00030000-56af-4753-01b1-bd3298803bae	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56af-4753-4d10-80cd4d84fb41	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56af-4753-a976-87800a734ad5	Report-read	Report - branje	t
00030000-56af-4753-d69e-ad612644d0fa	Report-write	Report - spreminjanje	t
00030000-56af-4753-0b8a-cd18577e0fe9	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56af-4753-c5eb-e4be21abc592	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56af-4753-d9b1-20f6cb8c0287	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56af-4753-cd37-a93fb380eb85	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56af-4753-f5e9-574e240bab8c	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56af-4753-6a3a-44fdb7da526d	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56af-4753-5b52-328721a17e68	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56af-4753-3780-0d50a8a6368b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-4753-3b6e-05632ff69d38	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-4753-8a37-52cd0f82c21a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-4753-60b5-3e8e5f4aa9fd	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-4753-7319-3d92f78bd20d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56af-4753-452a-286008809249	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56af-4753-8982-c69e154edea4	Datoteka-write	Datoteka - spreminjanje	t
00030000-56af-4753-a65f-ab6e782002d4	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 42249996)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56af-4753-f779-86e64806d2dc	00030000-56af-4753-0f9f-491a92733bd7
00020000-56af-4753-f779-86e64806d2dc	00030000-56af-4753-bfc5-736aa4597eda
00020000-56af-4753-9aca-2c9fe2fbbc9a	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-ed23-2a53ab83ba53
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-1584-710f051a275d
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-7584-55dd1a795b5d	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-e8b9-dd85eca890e0	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4753-e8b9-dd85eca890e0	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-e8b9-dd85eca890e0	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-e8b9-dd85eca890e0	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-e8b9-dd85eca890e0	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-e8b9-dd85eca890e0	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-6ab1-da0d9cc5d726	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-6ab1-da0d9cc5d726	00030000-56af-4753-c25f-079dac03e850
00020000-56af-4753-6ab1-da0d9cc5d726	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-6ab1-da0d9cc5d726	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4753-6ab1-da0d9cc5d726	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-6ab1-da0d9cc5d726	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-6ab1-da0d9cc5d726	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-4c40-5a460f51cbe7	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-4c40-5a460f51cbe7	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-4c40-5a460f51cbe7	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-0106-a742dde56373	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-0106-a742dde56373	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-0106-a742dde56373	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-0106-a742dde56373	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-0106-a742dde56373	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-0106-a742dde56373	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-0106-a742dde56373	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-0106-a742dde56373	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-47c5-60a9ca0fc9e1	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-47c5-60a9ca0fc9e1	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-47c5-60a9ca0fc9e1	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-47c5-60a9ca0fc9e1	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-3784-33660a037090
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-8d57-c93791517b36
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-34c7-08180542df93
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-6686-6388755ec12f	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-0170-c87e12b15c29	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-0170-c87e12b15c29	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-0170-c87e12b15c29	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-0170-c87e12b15c29	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-0170-c87e12b15c29	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-0170-c87e12b15c29	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-0170-c87e12b15c29	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-34c7-08180542df93
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-8d57-c93791517b36
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-3784-33660a037090
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-007f-a946619faff9
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-544d-82233c92b899
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-c3b6-c388ec4e395e
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-f69b-5b89cf83a29b	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-af9d-a7a4959d6275	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-515d-d2478555c833	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-515d-d2478555c833	00030000-56af-4753-8126-26af91ac6d7c
00020000-56af-4753-3688-40321c31ef08	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-e59c-75cb8a6cf92d	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-e59c-75cb8a6cf92d	00030000-56af-4753-5764-e41c0495d0c7
00020000-56af-4753-8621-11217188ab24	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-ed02-70be03c8ce0f	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-ed02-70be03c8ce0f	00030000-56af-4753-276d-5765d451ea8d
00020000-56af-4753-b270-5408e849bf08	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-9b5d-7f252ba4d07c	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4753-9b5d-7f252ba4d07c	00030000-56af-4753-40d2-7245afdc1681
00020000-56af-4753-ac9b-d3c9eda06703	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4753-c4bf-756f6dfe6637	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-c4bf-756f6dfe6637	00030000-56af-4753-f01e-1581991eeaa6
00020000-56af-4753-309a-d3c66607e6b6	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-442e-0cb8336e2326	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4753-442e-0cb8336e2326	00030000-56af-4753-9595-d09925708824
00020000-56af-4753-4cb5-a6cc12f8d939	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4753-4d42-9db3a0d0e0ce	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-4d42-9db3a0d0e0ce	00030000-56af-4753-4a53-0f6cbcdeaffe
00020000-56af-4753-4d42-9db3a0d0e0ce	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-4d42-9db3a0d0e0ce	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-4d42-9db3a0d0e0ce	00030000-56af-4753-8d57-c93791517b36
00020000-56af-4753-4d42-9db3a0d0e0ce	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-53e9-a500af7ade71	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-53e9-a500af7ade71	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-53e9-a500af7ade71	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-239e-e35776ab0379	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-239e-e35776ab0379	00030000-56af-4753-8211-1263fa55ad17
00020000-56af-4753-d49f-03f637c50c0c	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-a002-0fc0fb544ac3
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-e2c8-c026273e344f	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-835a-6910f4273fba	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-835a-6910f4273fba	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-835a-6910f4273fba	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-835a-6910f4273fba	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-835a-6910f4273fba	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-cb27-125a619b5abc	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4753-cb27-125a619b5abc	00030000-56af-4753-f942-720820b09a80
00020000-56af-4753-fa3e-adbb4cf632ef	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-1a94-9c11cfec000f
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-d6de-4f5d3c4d1b94
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-9d52-c58228a4a67f
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-505a-23516763876e
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-a690-5aa4fd5d6a34
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-5dd0-f6b70f6af09c
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-e013-2b52e679469b
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-19a9-1cb72396e144
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-d9d8-6c0399c50186
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-d26a-71a87ff926ea
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-f669-f5583ef519cc
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-d655-df9dd780f0cc
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-fc65-3132b5d058ae
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-f8a7-384effcf8349
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-7d57-9f437afa85fc
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-b348-b4be12d3e172
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-a5c9-fd630697369e
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-f437-b9432258143e
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-99a0-3827168e0191
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-f69d-a4ed16367851
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-a5ec-e76feef8d31a
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-ba99-da8c91b96119
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-f564-a3802cd4c1d9
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-073e-9ab77a57d209
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-1de2-7ee74110a0b6
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-01b1-bd3298803bae
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-a278-f918d20508ac
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-67a8-1a0526bad972
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-333f-4987ccfb08ec
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-421b-29251476937a
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-6a68-ac5bd9b69fbb	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-9d52-c58228a4a67f
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-a690-5aa4fd5d6a34
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-e013-2b52e679469b
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-d9d8-6c0399c50186
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-f669-f5583ef519cc
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-fc65-3132b5d058ae
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-7d57-9f437afa85fc
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-a5c9-fd630697369e
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-99a0-3827168e0191
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-a5ec-e76feef8d31a
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-67a8-1a0526bad972
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-a278-f918d20508ac
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-333f-4987ccfb08ec
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-421b-29251476937a
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-4dd6-9755db5921c5	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-4847-b49badac0cba
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-9c3c-51b63d21367f
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-2eb6-e1c60d5cf457	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-a322-88964aad3f6a	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-0b7a-22aab6a2d644	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-0b7a-22aab6a2d644	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-0b7a-22aab6a2d644	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-0b7a-22aab6a2d644	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4753-0b7a-22aab6a2d644	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-0b7a-22aab6a2d644	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-0b7a-22aab6a2d644	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-0b7a-22aab6a2d644	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-1545-fdf7b246e1e2
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-3668-eb70259527b0
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-08de-fc4ad3204e7b	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-aadb-67bba283ea45	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-3b47-41d1e93d49f1	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-3b47-41d1e93d49f1	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-3b47-41d1e93d49f1	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-3b47-41d1e93d49f1	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-3b47-41d1e93d49f1	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-3b47-41d1e93d49f1	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-3b47-41d1e93d49f1	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-b9c8-3ebf67ddf007	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-b9c8-3ebf67ddf007	00030000-56af-4753-3668-eb70259527b0
00020000-56af-4753-b9c8-3ebf67ddf007	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-b9c8-3ebf67ddf007	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-0f80-e43c16e88ec6	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-0f80-e43c16e88ec6	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-ed23-2a53ab83ba53
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-1584-710f051a275d
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-a278-f918d20508ac
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-073e-9ab77a57d209
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-9c3c-51b63d21367f
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-421b-29251476937a
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-01b1-bd3298803bae
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-1545-fdf7b246e1e2
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-333f-4987ccfb08ec
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-1de2-7ee74110a0b6
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-67a8-1a0526bad972
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-f564-a3802cd4c1d9
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-1a94-9c11cfec000f
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-9d52-c58228a4a67f
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-d6de-4f5d3c4d1b94
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-505a-23516763876e
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-a690-5aa4fd5d6a34
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-5dd0-f6b70f6af09c
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-e013-2b52e679469b
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-19a9-1cb72396e144
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-d9d8-6c0399c50186
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-d26a-71a87ff926ea
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-f669-f5583ef519cc
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-d655-df9dd780f0cc
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-fc65-3132b5d058ae
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-f8a7-384effcf8349
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-7d57-9f437afa85fc
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-b348-b4be12d3e172
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-a5c9-fd630697369e
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-f437-b9432258143e
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-99a0-3827168e0191
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-f69d-a4ed16367851
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-a5ec-e76feef8d31a
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-ba99-da8c91b96119
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-3668-eb70259527b0
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-4847-b49badac0cba
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-6129-dea546491929	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-ed23-2a53ab83ba53
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-1584-710f051a275d
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-145d-de7fff49d932	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-ed23-2a53ab83ba53
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-1584-710f051a275d
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-9c3c-51b63d21367f
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-4847-b49badac0cba
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-ab41-a2b186be192c	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-ed23-2a53ab83ba53
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-1584-710f051a275d
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-a278-f918d20508ac
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-073e-9ab77a57d209
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-9c3c-51b63d21367f
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-421b-29251476937a
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-01b1-bd3298803bae
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-544d-82233c92b899
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-1545-fdf7b246e1e2
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-007f-a946619faff9
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-333f-4987ccfb08ec
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-1de2-7ee74110a0b6
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-8d57-c93791517b36
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-67a8-1a0526bad972
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-f564-a3802cd4c1d9
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-c3b6-c388ec4e395e
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-1a94-9c11cfec000f
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-9d52-c58228a4a67f
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-d6de-4f5d3c4d1b94
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-505a-23516763876e
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-a690-5aa4fd5d6a34
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-5dd0-f6b70f6af09c
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-e013-2b52e679469b
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-19a9-1cb72396e144
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-d9d8-6c0399c50186
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-d26a-71a87ff926ea
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-f669-f5583ef519cc
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-d655-df9dd780f0cc
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-fc65-3132b5d058ae
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-f8a7-384effcf8349
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-7d57-9f437afa85fc
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-b348-b4be12d3e172
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-a5c9-fd630697369e
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-f437-b9432258143e
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-99a0-3827168e0191
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-f69d-a4ed16367851
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-a5ec-e76feef8d31a
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-ba99-da8c91b96119
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-3668-eb70259527b0
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-34c7-08180542df93
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-3784-33660a037090
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-4847-b49badac0cba
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-c25f-079dac03e850
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-5429-8eb8fbaad26d	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-ed23-2a53ab83ba53
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-1584-710f051a275d
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-9c3c-51b63d21367f
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-544d-82233c92b899
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-007f-a946619faff9
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-8d57-c93791517b36
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-c3b6-c388ec4e395e
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-34c7-08180542df93
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-3784-33660a037090
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-4847-b49badac0cba
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-c25f-079dac03e850
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-5856-31ab1030963a	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-ed34-9caa23d666d2	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-a278-f918d20508ac
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-073e-9ab77a57d209
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-067e-104be50a7149
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-421b-29251476937a
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-01b1-bd3298803bae
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-544d-82233c92b899
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-a002-0fc0fb544ac3
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-1545-fdf7b246e1e2
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-007f-a946619faff9
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-333f-4987ccfb08ec
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-1de2-7ee74110a0b6
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-8d57-c93791517b36
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-67a8-1a0526bad972
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-f564-a3802cd4c1d9
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-5926-521b622157d8
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-c3b6-c388ec4e395e
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-1a94-9c11cfec000f
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-9d52-c58228a4a67f
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-d6de-4f5d3c4d1b94
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-505a-23516763876e
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-a690-5aa4fd5d6a34
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-5dd0-f6b70f6af09c
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-e013-2b52e679469b
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-19a9-1cb72396e144
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-d9d8-6c0399c50186
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-d26a-71a87ff926ea
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-f669-f5583ef519cc
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-d655-df9dd780f0cc
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-fc65-3132b5d058ae
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-f8a7-384effcf8349
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-7d57-9f437afa85fc
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-b348-b4be12d3e172
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-a5c9-fd630697369e
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-f437-b9432258143e
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-99a0-3827168e0191
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-f69d-a4ed16367851
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-a5ec-e76feef8d31a
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-ba99-da8c91b96119
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-971f-e419f1290603
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-3668-eb70259527b0
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-34c7-08180542df93
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-1775-71885ac23330
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-3784-33660a037090
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-8211-1263fa55ad17
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-c25f-079dac03e850
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-0723-e684165931fe
00020000-56af-4753-9cf2-217aa5ecd47a	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-bfc5-736aa4597eda
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-0f9f-491a92733bd7
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-676b-138bd0235d01
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-9595-d09925708824
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-30f7-9cdb422b0d9c
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-da93-ec999c51146c
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-c9df-3c569c797ca3
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-2d5c-ef9eb1653e9e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-046b-f86de961e2d9
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-ed23-2a53ab83ba53
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-2cfe-00756815469e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1584-710f051a275d
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-070d-b412506d2763
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-429e-6733c9c5e35c
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-5657-70291e98a212
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d897-7b4547810daa
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-681f-3617c2a1e8e1
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-fa01-0f627803c91f
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-4aee-0255ea69abc5
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3bdc-2d1a14b4c48d
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-4892-b436bb3c97a6
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a278-f918d20508ac
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-073e-9ab77a57d209
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-067e-104be50a7149
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-276d-5765d451ea8d
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-6769-fc94963a777f
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1939-34fda05d2fbf
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-9c3c-51b63d21367f
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-cb48-ddc7f89ac685
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-e0eb-7cdb40309689
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-4d10-80cd4d84fb41
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-421b-29251476937a
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-01b1-bd3298803bae
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-645c-64c0327707fd
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-544d-82233c92b899
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-35c5-abdf4a9e22d5
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d3e6-d055965bf9c6
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-5b52-328721a17e68
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-6a3a-44fdb7da526d
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-c5eb-e4be21abc592
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d9b1-20f6cb8c0287
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-cd37-a93fb380eb85
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f5e9-574e240bab8c
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f643-ca8c76ff99d1
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8c98-bdc7664c90c7
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-161a-b0d9d277e469
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a010-31d15d6e9fae
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-abe6-e99b4b144434
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-b3fa-d084ef33f15c
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-b784-5bb0e902a952
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-afd8-669e3b5a76ed
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a002-0fc0fb544ac3
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3bb9-f7816fc266ba
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-231c-8eb02a81289b
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-c082-c0260d3b56e5
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-544f-0b3ca1d97a70
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1545-fdf7b246e1e2
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-007f-a946619faff9
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-457c-b3031db74c63
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-333f-4987ccfb08ec
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1de2-7ee74110a0b6
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-b596-a36e2609f961
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1d29-85f0115d9f42
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-5764-e41c0495d0c7
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8d57-c93791517b36
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-6dde-4472a6c36155
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-96f3-c4588187bf7e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-71bf-75dc9649e4cc
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-4397-62239ef02bf8
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1b67-eba3fcc826c8
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-b69e-a123d7ef645e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-67a8-1a0526bad972
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f564-a3802cd4c1d9
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-5926-521b622157d8
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-c3b6-c388ec4e395e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1a94-9c11cfec000f
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-9d52-c58228a4a67f
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d6de-4f5d3c4d1b94
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-505a-23516763876e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a690-5aa4fd5d6a34
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-5dd0-f6b70f6af09c
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-e013-2b52e679469b
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-19a9-1cb72396e144
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d9d8-6c0399c50186
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d26a-71a87ff926ea
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f669-f5583ef519cc
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d655-df9dd780f0cc
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-fc65-3132b5d058ae
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f8a7-384effcf8349
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-7d57-9f437afa85fc
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-b348-b4be12d3e172
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a5c9-fd630697369e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f437-b9432258143e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-99a0-3827168e0191
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f69d-a4ed16367851
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a5ec-e76feef8d31a
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-ba99-da8c91b96119
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-c1a6-482e3405cdb4
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-4a53-0f6cbcdeaffe
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-e595-c875f9477edf
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-4331-ae7ebe46301f
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-2835-c735bf53fb49
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d8ef-5d19ef6951d9
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-eba6-59584e272a0a
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-0885-e968300262fe
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-7548-f06bc580aac9
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-e068-9f1086c38a5a
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-a976-87800a734ad5
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-d69e-ad612644d0fa
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-0eb7-f071e2301bd7
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-b162-ef0125ec81ff
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-cb83-e9154147cc9f
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-719b-5e4bbd5ac9bb
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-20fd-79d383f2eb98
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3561-b215d8687cd5
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-9276-b06b68a8d2da
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-deba-45150aec6ac4
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-513b-819ca73c8b7e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3046-978987fc05a1
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-0b8a-cd18577e0fe9
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-971f-e419f1290603
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3668-eb70259527b0
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-34c7-08180542df93
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8c0a-737eb09f59a4
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f5b7-8712f1465a62
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f402-82e90dcea5a9
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-483a-eef88b8e8bfb
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-6790-473f6a64566b
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-fdb2-b7505778626d
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8126-26af91ac6d7c
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-6a31-53ea28431bee
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-e0fc-53fb89f4008e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-c1f1-9f8f1b67d3d8
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f942-720820b09a80
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-1775-71885ac23330
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3784-33660a037090
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-4847-b49badac0cba
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8dfe-112100c0712b
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-85ae-ecade8631b99
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-5b31-ab1964c4f172
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-ab39-efb4b0315206
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-742d-44f1e07402eb
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8211-1263fa55ad17
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-452a-286008809249
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-7319-3d92f78bd20d
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-c25f-079dac03e850
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-0723-e684165931fe
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-f01e-1581991eeaa6
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-962d-3d69d57a1e2e
00020000-56af-4755-57c8-03f3f12d0528	00030000-56af-4753-40d2-7245afdc1681
00020000-56af-4755-2fb4-18134d69aead	00030000-56af-4753-60b5-3e8e5f4aa9fd
00020000-56af-4755-09a4-fe2c7cd5eb4c	00030000-56af-4753-8a37-52cd0f82c21a
00020000-56af-4755-5ab0-415a53eb7315	00030000-56af-4753-4847-b49badac0cba
00020000-56af-4755-d4ab-a63bc4f03afc	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4755-ec0d-412aadeead99	00030000-56af-4753-d9b1-20f6cb8c0287
00020000-56af-4755-9da2-e2837dafb49a	00030000-56af-4753-cd37-a93fb380eb85
00020000-56af-4755-4ed1-e15997aa0a1b	00030000-56af-4753-f5e9-574e240bab8c
00020000-56af-4755-4f22-702870645a75	00030000-56af-4753-c5eb-e4be21abc592
00020000-56af-4755-3a56-bcd8b481b18d	00030000-56af-4753-5b52-328721a17e68
00020000-56af-4755-88aa-350042c06bba	00030000-56af-4753-6a3a-44fdb7da526d
00020000-56af-4755-3644-a73fbed38123	00030000-56af-4753-3b6e-05632ff69d38
00020000-56af-4755-8251-2635256a9ef8	00030000-56af-4753-3780-0d50a8a6368b
00020000-56af-4755-5fcc-9fe730c8cd23	00030000-56af-4753-b721-e7f77acdd055
00020000-56af-4755-bb51-c140a7ac33c8	00030000-56af-4753-cdf8-bf5cee5b0903
00020000-56af-4755-ab53-72286081dfaf	00030000-56af-4753-0259-8798702c79ce
00020000-56af-4755-341b-07504a1db9ca	00030000-56af-4753-fb08-cc970041c678
00020000-56af-4755-3b8b-d8e69b3ccb7d	00030000-56af-4753-8982-c69e154edea4
00020000-56af-4755-03d7-afe69f8c75f0	00030000-56af-4753-a65f-ab6e782002d4
00020000-56af-4755-5a6f-c340562e527c	00030000-56af-4753-a2ca-f38ac103b5aa
00020000-56af-4755-5a6f-c340562e527c	00030000-56af-4753-007f-a946619faff9
00020000-56af-4755-5a6f-c340562e527c	00030000-56af-4753-fba8-84e75a7a724c
00020000-56af-4755-7178-dba94a5d8c40	00030000-56af-4753-1775-71885ac23330
00020000-56af-4755-6f4e-0de892dc4f66	00030000-56af-4753-3784-33660a037090
00020000-56af-4755-aec9-e21eb031b2ac	00030000-56af-4753-0b8a-cd18577e0fe9
00020000-56af-4755-bc66-cf32732aa8a0	00030000-56af-4753-aa32-0e6765b4f725
00020000-56af-4755-a37a-45a14eec70f7	00030000-56af-4753-34c7-08180542df93
00020000-56af-4755-7d72-abd850b73e08	00030000-56af-4753-c770-2074a4fbebe9
00020000-56af-4755-7178-e5f0dd6b6745	00030000-56af-4753-8d57-c93791517b36
00020000-56af-4755-f595-df9ead77b4e1	00030000-56af-4753-2f96-ae24768767a5
00020000-56af-4755-1597-e44dbc394089	00030000-56af-4753-c25f-079dac03e850
00020000-56af-4755-ed36-b1b3b5b77c60	00030000-56af-4753-cba1-87e85629b34d
00020000-56af-4755-ffa4-e03af8b8266b	00030000-56af-4753-1545-fdf7b246e1e2
00020000-56af-4755-f665-0cc814c7ac0f	00030000-56af-4753-971f-e419f1290603
00020000-56af-4755-c7ae-708fb1fb2537	00030000-56af-4753-3668-eb70259527b0
00020000-56af-4755-3e4e-165395efee9f	00030000-56af-4753-a500-b5485f6dd783
00020000-56af-4755-a150-336f49202d10	00030000-56af-4753-df13-8549935f4ab2
00020000-56af-4755-351a-6a2ffac63b82	00030000-56af-4753-3d64-8e489f803f53
00020000-56af-4755-bb95-66feca3e4ea4	00030000-56af-4753-1500-a87dabb0c30f
00020000-56af-4755-3e0b-b063c6cdbff8	00030000-56af-4753-8a07-04f631ed24c8
00020000-56af-4755-fda2-f095dc4f539a	00030000-56af-4753-9c3c-51b63d21367f
\.


--
-- TOC entry 3181 (class 0 OID 42250394)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 42250429)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 42250562)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56af-4755-55e3-f0d744414e3c	00090000-56af-4755-411c-e0f790d9f184	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56af-4755-cec9-a083da27a4ec	00090000-56af-4755-cedc-8083a2f5019a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56af-4755-ee54-f8f53126a339	00090000-56af-4755-7ba3-1342b2788dd9	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56af-4755-53ee-c1380a5d1729	00090000-56af-4755-960b-a9c3bd868032	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 42250079)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56af-4755-29fe-853b3c61644f	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-4755-1a07-5c63a10172fc	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56af-4755-b50d-742c0b4bb3e4	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-4755-1441-0fb92ce22fce	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-4755-9180-ca2c55e6675c	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-4755-9964-0bd940604d8b	\N	00040000-56af-4752-d2ec-74e924fb45cd	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-4755-4cd6-d72f644a1f0a	\N	00040000-56af-4752-917f-b68ccccb3d94	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-4755-fc3c-87057bcbd66b	\N	00040000-56af-4752-7320-212787e90be2	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-4755-6b96-dc8aad2a7e5d	\N	00040000-56af-4752-6854-3237256838a3	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-4757-2ff0-d0848abf1b06	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 42250124)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56af-4752-755b-478eedcd967d	8341	Adlešiči
00050000-56af-4752-124d-39190a5443db	5270	Ajdovščina
00050000-56af-4752-5d5a-b10d391a5f81	6280	Ankaran/Ancarano
00050000-56af-4752-d00c-de51521a7a90	9253	Apače
00050000-56af-4752-140b-62055f5d4eb6	8253	Artiče
00050000-56af-4752-b63b-94edaad6bab6	4275	Begunje na Gorenjskem
00050000-56af-4752-9081-e8104192aa19	1382	Begunje pri Cerknici
00050000-56af-4752-26f7-b1cd02e15e09	9231	Beltinci
00050000-56af-4752-df2f-31df7fc91607	2234	Benedikt
00050000-56af-4752-5b36-62079e65211b	2345	Bistrica ob Dravi
00050000-56af-4752-f753-ee65cb24d6a8	3256	Bistrica ob Sotli
00050000-56af-4752-4194-cbf721fba3f2	8259	Bizeljsko
00050000-56af-4752-5523-3aeb404edfc2	1223	Blagovica
00050000-56af-4752-fcb7-a678b7de4441	8283	Blanca
00050000-56af-4752-69e4-64a70228f71c	4260	Bled
00050000-56af-4752-eb5e-727077be8fce	4273	Blejska Dobrava
00050000-56af-4752-e0f6-6007b60da487	9265	Bodonci
00050000-56af-4752-36d5-99db5470185c	9222	Bogojina
00050000-56af-4752-ae63-5caec6d251bd	4263	Bohinjska Bela
00050000-56af-4752-8f2a-92547d710ebc	4264	Bohinjska Bistrica
00050000-56af-4752-3bda-2237d267dffe	4265	Bohinjsko jezero
00050000-56af-4752-660c-f31cb4cea1d6	1353	Borovnica
00050000-56af-4752-f924-edcef2cdd751	8294	Boštanj
00050000-56af-4752-6627-98afa5f360c9	5230	Bovec
00050000-56af-4752-f26d-c5ecf6c74ba4	5295	Branik
00050000-56af-4752-e5b5-0944c9fa46d3	3314	Braslovče
00050000-56af-4752-1428-c1edd01e6d04	5223	Breginj
00050000-56af-4752-ccc2-94ccd2a9a88d	8280	Brestanica
00050000-56af-4752-45e7-1c69ac8ac84a	2354	Bresternica
00050000-56af-4752-bff2-79f5083bde85	4243	Brezje
00050000-56af-4752-738e-a1d970053970	1351	Brezovica pri Ljubljani
00050000-56af-4752-3635-562874b9000e	8250	Brežice
00050000-56af-4752-4327-b9bd3132d29b	4210	Brnik - Aerodrom
00050000-56af-4752-027c-3ec0570eb572	8321	Brusnice
00050000-56af-4752-32cc-915b33b3fd25	3255	Buče
00050000-56af-4752-7b59-5712e91dc1dc	8276	Bučka 
00050000-56af-4752-aefe-949ca8e5152a	9261	Cankova
00050000-56af-4752-b075-f7424501c293	3000	Celje 
00050000-56af-4752-4a6a-63ea83dd5585	3001	Celje - poštni predali
00050000-56af-4752-0e0e-8bc0ab6e2777	4207	Cerklje na Gorenjskem
00050000-56af-4752-6840-e3fb360b6a3c	8263	Cerklje ob Krki
00050000-56af-4752-483d-ef71301acb2d	1380	Cerknica
00050000-56af-4752-d207-50615ebd62ca	5282	Cerkno
00050000-56af-4752-e101-781ee289ef08	2236	Cerkvenjak
00050000-56af-4752-df20-938c075e1076	2215	Ceršak
00050000-56af-4752-83aa-1fae2fc9957a	2326	Cirkovce
00050000-56af-4752-911f-84ccfab120df	2282	Cirkulane
00050000-56af-4752-aa1c-381d233cbfc6	5273	Col
00050000-56af-4752-f706-1b78b71077ff	8251	Čatež ob Savi
00050000-56af-4752-0fe1-630fa7db0819	1413	Čemšenik
00050000-56af-4752-0307-826ab98abcd2	5253	Čepovan
00050000-56af-4752-939c-fa619db8277c	9232	Črenšovci
00050000-56af-4752-7aef-b44667a9e919	2393	Črna na Koroškem
00050000-56af-4752-d651-555a02258610	6275	Črni Kal
00050000-56af-4752-a2bd-fd4392b694c4	5274	Črni Vrh nad Idrijo
00050000-56af-4752-851c-f619ee8d153b	5262	Črniče
00050000-56af-4752-9b73-8386931e510d	8340	Črnomelj
00050000-56af-4752-9c20-7840295f8e20	6271	Dekani
00050000-56af-4752-0e41-3b21a5690dcb	5210	Deskle
00050000-56af-4752-8ee7-e42645d07e42	2253	Destrnik
00050000-56af-4752-1543-bc80a240c18c	6215	Divača
00050000-56af-4752-063c-7a39584d4ed7	1233	Dob
00050000-56af-4752-de3f-e3cf3165b49b	3224	Dobje pri Planini
00050000-56af-4752-9d7a-d3d750aec037	8257	Dobova
00050000-56af-4752-6a32-1883510fd9ff	1423	Dobovec
00050000-56af-4752-aa0b-4621b9ee3796	5263	Dobravlje
00050000-56af-4752-1eed-33e31d9738fa	3204	Dobrna
00050000-56af-4752-318d-305097884dfc	8211	Dobrnič
00050000-56af-4752-bbbc-cb300605eb83	1356	Dobrova
00050000-56af-4752-c8f3-544ef553c026	9223	Dobrovnik/Dobronak 
00050000-56af-4752-7bfb-498a293a5563	5212	Dobrovo v Brdih
00050000-56af-4752-a5d0-8d1eeea2790d	1431	Dol pri Hrastniku
00050000-56af-4752-2f51-78fe1c41740a	1262	Dol pri Ljubljani
00050000-56af-4752-c495-7d77d2c4ccbd	1273	Dole pri Litiji
00050000-56af-4752-5d2d-94f7cf44ab11	1331	Dolenja vas
00050000-56af-4752-4120-e983cb400e43	8350	Dolenjske Toplice
00050000-56af-4752-92e7-23d8cbb54855	1230	Domžale
00050000-56af-4752-90ef-a0488aa6dc0d	2252	Dornava
00050000-56af-4752-d879-045355983f80	5294	Dornberk
00050000-56af-4752-8338-6c0fc858a1a2	1319	Draga
00050000-56af-4752-9c61-1d7e8084e9e7	8343	Dragatuš
00050000-56af-4752-0f46-eacb2d6d2d55	3222	Dramlje
00050000-56af-4752-d87d-f556a41c895f	2370	Dravograd
00050000-56af-4752-7063-5f257f1a4a23	4203	Duplje
00050000-56af-4752-dbf1-bcd7fd13bfbe	6221	Dutovlje
00050000-56af-4752-9f36-cfa2b11d477f	8361	Dvor
00050000-56af-4752-03e1-107861557b10	2343	Fala
00050000-56af-4752-e5d8-77d4024f0a47	9208	Fokovci
00050000-56af-4752-e015-22d307b8fdfe	2313	Fram
00050000-56af-4752-d762-76d37c7384c7	3213	Frankolovo
00050000-56af-4752-07c9-dfc47bca182f	1274	Gabrovka
00050000-56af-4752-5b74-716a33c1bbc1	8254	Globoko
00050000-56af-4752-1422-8a2e89f6f009	5275	Godovič
00050000-56af-4752-89d3-a905a5d7d04a	4204	Golnik
00050000-56af-4752-52ea-ae8bb4c9042f	3303	Gomilsko
00050000-56af-4752-59ef-4722a4b91183	4224	Gorenja vas
00050000-56af-4752-de86-8e1114c70a65	3263	Gorica pri Slivnici
00050000-56af-4752-04f0-2ccd262808c2	2272	Gorišnica
00050000-56af-4752-9a48-28889429f762	9250	Gornja Radgona
00050000-56af-4752-d9e6-a083f0bc6ece	3342	Gornji Grad
00050000-56af-4752-341f-e3fdbf8847bd	4282	Gozd Martuljek
00050000-56af-4752-715b-bf8cba5dbaae	6272	Gračišče
00050000-56af-4752-45ac-410d7c09582a	9264	Grad
00050000-56af-4752-3de5-36e36789f59f	8332	Gradac
00050000-56af-4752-7dad-9003c51c1437	1384	Grahovo
00050000-56af-4752-6267-f3662cf806e1	5242	Grahovo ob Bači
00050000-56af-4752-3240-00408b2ca137	5251	Grgar
00050000-56af-4752-2d13-afc7358332d5	3302	Griže
00050000-56af-4752-4f38-85b8ff8cb9a6	3231	Grobelno
00050000-56af-4752-e235-e51e4337bd42	1290	Grosuplje
00050000-56af-4752-e84d-6ee8b4c9a5b2	2288	Hajdina
00050000-56af-4752-5448-959dd7d1a254	8362	Hinje
00050000-56af-4752-f292-e56bc12617da	2311	Hoče
00050000-56af-4752-e4e7-af81fd49dcfb	9205	Hodoš/Hodos
00050000-56af-4752-4cf0-450c602d62d2	1354	Horjul
00050000-56af-4752-a1ef-daf308bc2d6a	1372	Hotedršica
00050000-56af-4752-8f70-a570bf916534	1430	Hrastnik
00050000-56af-4752-9ce3-8c324b20fee3	6225	Hruševje
00050000-56af-4752-52e7-f57b35b97e43	4276	Hrušica
00050000-56af-4752-869d-fedee6cbb847	5280	Idrija
00050000-56af-4752-b223-b60877ad108c	1292	Ig
00050000-56af-4752-ae89-ca6fd31304d3	6250	Ilirska Bistrica
00050000-56af-4752-709e-0f1582feea75	6251	Ilirska Bistrica-Trnovo
00050000-56af-4752-8cd6-602792d6f1de	1295	Ivančna Gorica
00050000-56af-4752-2e27-53fc0c6e47d1	2259	Ivanjkovci
00050000-56af-4752-054d-9bb7ea6405d3	1411	Izlake
00050000-56af-4752-13fe-ed48d5720209	6310	Izola/Isola
00050000-56af-4752-0b36-96fda362340d	2222	Jakobski Dol
00050000-56af-4752-6e8c-ed89a59673d6	2221	Jarenina
00050000-56af-4752-bc24-12433e854cf8	6254	Jelšane
00050000-56af-4752-830d-ab101ece757e	4270	Jesenice
00050000-56af-4752-3028-0f1538702f32	8261	Jesenice na Dolenjskem
00050000-56af-4752-0e67-cb47f7d70c14	3273	Jurklošter
00050000-56af-4752-6cb3-e2683b55bee9	2223	Jurovski Dol
00050000-56af-4752-24fa-e25297dc450f	2256	Juršinci
00050000-56af-4752-0339-09c85acc9792	5214	Kal nad Kanalom
00050000-56af-4752-4e7f-442dac675e25	3233	Kalobje
00050000-56af-4752-f5be-461901a7a0ec	4246	Kamna Gorica
00050000-56af-4752-d1bc-e4532c9d3720	2351	Kamnica
00050000-56af-4752-f5ba-5605d5242894	1241	Kamnik
00050000-56af-4752-588f-b7e990d76c19	5213	Kanal
00050000-56af-4752-c519-275e6a4bddd9	8258	Kapele
00050000-56af-4752-3d0b-a459042c87d5	2362	Kapla
00050000-56af-4752-af46-7a160af2e1e6	2325	Kidričevo
00050000-56af-4752-a9fc-2a91cc3e7d4b	1412	Kisovec
00050000-56af-4752-4b0e-35d85cd2ad15	6253	Knežak
00050000-56af-4752-20b3-0a39d035719e	5222	Kobarid
00050000-56af-4752-ed64-63f0d36eb354	9227	Kobilje
00050000-56af-4752-c184-deccf49d8e38	1330	Kočevje
00050000-56af-4752-3983-358b60738c2a	1338	Kočevska Reka
00050000-56af-4752-95dd-a368e73803a8	2276	Kog
00050000-56af-4752-a45b-fbb6bb0ccc0d	5211	Kojsko
00050000-56af-4752-3846-24afd7145a8a	6223	Komen
00050000-56af-4752-009e-a9e5288e851e	1218	Komenda
00050000-56af-4752-fc86-31a3a4da4351	6000	Koper/Capodistria 
00050000-56af-4752-82dd-a6685698aa1f	6001	Koper/Capodistria - poštni predali
00050000-56af-4752-1719-3f43c69b934f	8282	Koprivnica
00050000-56af-4752-e548-a8e488be6573	5296	Kostanjevica na Krasu
00050000-56af-4752-ed82-406843bc98ff	8311	Kostanjevica na Krki
00050000-56af-4752-0299-9bcf456bbe85	1336	Kostel
00050000-56af-4752-ed6c-9e0cc6be3c97	6256	Košana
00050000-56af-4752-3007-9f45da95bfa5	2394	Kotlje
00050000-56af-4752-44b3-2d583e861452	6240	Kozina
00050000-56af-4752-270f-73c0e06ab8fa	3260	Kozje
00050000-56af-4752-85b1-a70ff1ce9757	4000	Kranj 
00050000-56af-4752-a1dd-9844b73e3490	4001	Kranj - poštni predali
00050000-56af-4752-b5f1-ed8d32108270	4280	Kranjska Gora
00050000-56af-4752-e35f-621d07476fbb	1281	Kresnice
00050000-56af-4752-ac39-433e5b127822	4294	Križe
00050000-56af-4752-b4c8-2977013fcda7	9206	Križevci
00050000-56af-4752-7eb0-86c8943db454	9242	Križevci pri Ljutomeru
00050000-56af-4752-cea1-02bc89645364	1301	Krka
00050000-56af-4752-bb07-297556d84fa5	8296	Krmelj
00050000-56af-4752-177b-43b196b3d11e	4245	Kropa
00050000-56af-4752-f8c3-3b3076488117	8262	Krška vas
00050000-56af-4752-4e6f-f8ff7063b158	8270	Krško
00050000-56af-4752-a4fc-49d02e45c0b3	9263	Kuzma
00050000-56af-4752-3eb2-967c431dbcc1	2318	Laporje
00050000-56af-4752-da83-4f7ac9225dae	3270	Laško
00050000-56af-4752-f229-c73ab7fa3bc1	1219	Laze v Tuhinju
00050000-56af-4752-9850-29fa3057ab83	2230	Lenart v Slovenskih goricah
00050000-56af-4752-39e3-187d97f70e20	9220	Lendava/Lendva
00050000-56af-4752-0ae0-213373f77f24	4248	Lesce
00050000-56af-4752-4977-708df14d39ba	3261	Lesično
00050000-56af-4752-c1be-357789bc228c	8273	Leskovec pri Krškem
00050000-56af-4752-c958-e7ccafd06d0e	2372	Libeliče
00050000-56af-4752-85fe-e30aa53d8e69	2341	Limbuš
00050000-56af-4752-91e1-bc1984b09ce6	1270	Litija
00050000-56af-4752-185f-ffe6a9975d13	3202	Ljubečna
00050000-56af-4752-de91-42dadc64a8a0	1000	Ljubljana 
00050000-56af-4752-5e7e-bca920507987	1001	Ljubljana - poštni predali
00050000-56af-4752-9b29-e03305e0795f	1231	Ljubljana - Črnuče
00050000-56af-4752-d782-cb55f4ff1dc9	1261	Ljubljana - Dobrunje
00050000-56af-4752-2d59-8b28bc6ce37d	1260	Ljubljana - Polje
00050000-56af-4752-59af-a73bb63a2219	1210	Ljubljana - Šentvid
00050000-56af-4752-39b0-a163d28525a2	1211	Ljubljana - Šmartno
00050000-56af-4752-84f3-f50f499b0035	3333	Ljubno ob Savinji
00050000-56af-4752-d433-74763dfbb7f4	9240	Ljutomer
00050000-56af-4752-aef6-88c2f223d6e8	3215	Loče
00050000-56af-4752-681e-0c918d0e924b	5231	Log pod Mangartom
00050000-56af-4752-1c69-daf3c02771e9	1358	Log pri Brezovici
00050000-56af-4752-69c2-db8d7890e45d	1370	Logatec
00050000-56af-4752-d8d4-3ca3b9d1bb21	1371	Logatec
00050000-56af-4752-9a93-7ecc7a24a234	1434	Loka pri Zidanem Mostu
00050000-56af-4752-de96-377d7fa9cbd1	3223	Loka pri Žusmu
00050000-56af-4752-a0b1-61f989e29d2e	6219	Lokev
00050000-56af-4752-dfba-0e41acd5087b	1318	Loški Potok
00050000-56af-4752-8bfa-570e85546be6	2324	Lovrenc na Dravskem polju
00050000-56af-4752-9c8a-0b8287f42e7d	2344	Lovrenc na Pohorju
00050000-56af-4752-bc6e-98fdde9309ac	3334	Luče
00050000-56af-4752-10c1-2df3633b5c11	1225	Lukovica
00050000-56af-4752-a7a8-c4fc461c0e6a	9202	Mačkovci
00050000-56af-4752-e477-d94417c189f7	2322	Majšperk
00050000-56af-4752-8e91-55ed6a1caf92	2321	Makole
00050000-56af-4752-4dca-7dd181f54d61	9243	Mala Nedelja
00050000-56af-4752-3107-d295a39b3e7b	2229	Malečnik
00050000-56af-4752-21bf-b16e3aa33491	6273	Marezige
00050000-56af-4752-f76a-3cac54173dee	2000	Maribor 
00050000-56af-4752-77da-f618e01f1566	2001	Maribor - poštni predali
00050000-56af-4752-1e38-6587e0433b0d	2206	Marjeta na Dravskem polju
00050000-56af-4752-60c3-c817286a48d9	2281	Markovci
00050000-56af-4752-772a-0751291f7274	9221	Martjanci
00050000-56af-4752-fe88-f850f0b5d978	6242	Materija
00050000-56af-4752-e307-1cdff649c6e3	4211	Mavčiče
00050000-56af-4752-4f3d-362be5fb7021	1215	Medvode
00050000-56af-4752-d08e-8fb6c7033246	1234	Mengeš
00050000-56af-4752-e883-b66363526bc1	8330	Metlika
00050000-56af-4752-9d89-fdc62873e2bc	2392	Mežica
00050000-56af-4752-b149-1d55fb1b47f5	2204	Miklavž na Dravskem polju
00050000-56af-4752-048f-d7e6045e4ab9	2275	Miklavž pri Ormožu
00050000-56af-4752-fdab-77cbdf6d9603	5291	Miren
00050000-56af-4752-4ea9-816a88dfdcfe	8233	Mirna
00050000-56af-4752-92a7-f4d70f5d0d0e	8216	Mirna Peč
00050000-56af-4752-894a-6d3453940c17	2382	Mislinja
00050000-56af-4752-87e9-adac9751752e	4281	Mojstrana
00050000-56af-4752-2dc7-9feefe9836ce	8230	Mokronog
00050000-56af-4752-8c17-15a0547ce4ee	1251	Moravče
00050000-56af-4752-b425-ec9791dc4711	9226	Moravske Toplice
00050000-56af-4752-1a2d-bb9ba4e3df50	5216	Most na Soči
00050000-56af-4752-2c97-e725c11d830b	1221	Motnik
00050000-56af-4752-b4a5-65a0b127f374	3330	Mozirje
00050000-56af-4752-2fa2-ccb22f5a7c14	9000	Murska Sobota 
00050000-56af-4752-44e5-6fabae5dcf2a	9001	Murska Sobota - poštni predali
00050000-56af-4752-7616-080cac0f7078	2366	Muta
00050000-56af-4752-05f9-319727955f81	4202	Naklo
00050000-56af-4752-5c4f-c764b46b177e	3331	Nazarje
00050000-56af-4752-976e-1f1bc6eb5fbf	1357	Notranje Gorice
00050000-56af-4752-10db-85265231ddf3	3203	Nova Cerkev
00050000-56af-4752-6469-b6eea3befd2b	5000	Nova Gorica 
00050000-56af-4752-97d2-5eb037af26dc	5001	Nova Gorica - poštni predali
00050000-56af-4752-78bd-c52358f82814	1385	Nova vas
00050000-56af-4752-bb51-0f8cd159bf9c	8000	Novo mesto
00050000-56af-4752-26df-87f7800b9db3	8001	Novo mesto - poštni predali
00050000-56af-4752-9959-2e9ad99a0ad9	6243	Obrov
00050000-56af-4752-7444-a18dd87559f3	9233	Odranci
00050000-56af-4752-f3ee-028edbac329b	2317	Oplotnica
00050000-56af-4752-7504-cce27eee2618	2312	Orehova vas
00050000-56af-4752-c2e6-e22205361506	2270	Ormož
00050000-56af-4752-32c5-c3f089487137	1316	Ortnek
00050000-56af-4752-e460-efe2d06083c6	1337	Osilnica
00050000-56af-4752-0fb6-7e2004840e6f	8222	Otočec
00050000-56af-4752-aac6-37194ecf1132	2361	Ožbalt
00050000-56af-4752-c480-53c783a73f12	2231	Pernica
00050000-56af-4752-b9be-13614f98f94b	2211	Pesnica pri Mariboru
00050000-56af-4752-bad1-95bf4cfc01fd	9203	Petrovci
00050000-56af-4752-a5ba-39a53fe95641	3301	Petrovče
00050000-56af-4752-432b-5b94cde7164f	6330	Piran/Pirano
00050000-56af-4752-0c4c-290e98268555	8255	Pišece
00050000-56af-4752-7586-907844daa9e8	6257	Pivka
00050000-56af-4752-78e2-83d1f5046040	6232	Planina
00050000-56af-4752-6dcd-7ade914c0dc7	3225	Planina pri Sevnici
00050000-56af-4752-0e44-45c1c4dd58d4	6276	Pobegi
00050000-56af-4752-676d-1be56d3fa0f1	8312	Podbočje
00050000-56af-4752-39b6-30c89a441aa9	5243	Podbrdo
00050000-56af-4752-82de-2924d9e9ce4e	3254	Podčetrtek
00050000-56af-4752-6341-00fc03630421	2273	Podgorci
00050000-56af-4752-27e6-89902b1c80c3	6216	Podgorje
00050000-56af-4752-95af-ff614c76b916	2381	Podgorje pri Slovenj Gradcu
00050000-56af-4752-2330-3435a9037482	6244	Podgrad
00050000-56af-4752-b74d-e59f868a81d0	1414	Podkum
00050000-56af-4752-8f60-d00fcd20fcdf	2286	Podlehnik
00050000-56af-4752-ad1a-9fbae417d25d	5272	Podnanos
00050000-56af-4752-48d9-4e45c4ce48a3	4244	Podnart
00050000-56af-4752-0e09-2e3364993378	3241	Podplat
00050000-56af-4752-a892-8d175b3fadee	3257	Podsreda
00050000-56af-4752-34b7-78e3f838c4bf	2363	Podvelka
00050000-56af-4752-bf43-c1747d2e4c53	2208	Pohorje
00050000-56af-4752-e50d-7a8c712f447a	2257	Polenšak
00050000-56af-4752-db13-3659a02aea3f	1355	Polhov Gradec
00050000-56af-4752-422b-dd141387783c	4223	Poljane nad Škofjo Loko
00050000-56af-4752-ab41-ce0171178db3	2319	Poljčane
00050000-56af-4752-1303-7bde8c0eaac3	1272	Polšnik
00050000-56af-4752-2ab4-4ec269d9828a	3313	Polzela
00050000-56af-4752-26d9-07c8f6723007	3232	Ponikva
00050000-56af-4752-53e6-10e6ee872c57	6320	Portorož/Portorose
00050000-56af-4752-e092-0d531592db08	6230	Postojna
00050000-56af-4752-2a3a-a58f11bdcb75	2331	Pragersko
00050000-56af-4752-d268-3745e159e06f	3312	Prebold
00050000-56af-4752-8cd5-2343ee523315	4205	Preddvor
00050000-56af-4752-eee4-e39db7912031	6255	Prem
00050000-56af-4752-2a03-62837e8a9927	1352	Preserje
00050000-56af-4752-a744-a635884df617	6258	Prestranek
00050000-56af-4752-5e4d-654571a2efd6	2391	Prevalje
00050000-56af-4752-7d5f-945721f09b06	3262	Prevorje
00050000-56af-4752-48bd-958267d4efc2	1276	Primskovo 
00050000-56af-4752-bfea-2fa1775a43b6	3253	Pristava pri Mestinju
00050000-56af-4752-11fc-1ee659cb6eb7	9207	Prosenjakovci/Partosfalva
00050000-56af-4752-4be0-69dbeae48f5a	5297	Prvačina
00050000-56af-4752-7602-c12ccd368a5d	2250	Ptuj
00050000-56af-4752-722a-e4c80274afcb	2323	Ptujska Gora
00050000-56af-4752-7ab1-8f6f2b0cd65e	9201	Puconci
00050000-56af-4752-6923-bab2345e1a2c	2327	Rače
00050000-56af-4752-c51a-5b34e5882e20	1433	Radeče
00050000-56af-4752-0498-bbfab41b5a00	9252	Radenci
00050000-56af-4752-4c09-383dae28f31c	2360	Radlje ob Dravi
00050000-56af-4752-328a-5a1a5874e76b	1235	Radomlje
00050000-56af-4752-d6ec-c6d8c8a0457d	4240	Radovljica
00050000-56af-4752-68d1-f68704017834	8274	Raka
00050000-56af-4752-4be2-398f618ea744	1381	Rakek
00050000-56af-4752-ecc6-64739935362c	4283	Rateče - Planica
00050000-56af-4752-97b4-f91aa64f74fd	2390	Ravne na Koroškem
00050000-56af-4752-dec1-108dd4051d50	9246	Razkrižje
00050000-56af-4752-c533-64e65f4d15cc	3332	Rečica ob Savinji
00050000-56af-4752-0cc0-7839bdf18dc4	5292	Renče
00050000-56af-4752-33df-9cf06c077020	1310	Ribnica
00050000-56af-4752-2a94-94b864002621	2364	Ribnica na Pohorju
00050000-56af-4752-2e32-621896d59c8d	3272	Rimske Toplice
00050000-56af-4752-8aaf-74cfe7282ae7	1314	Rob
00050000-56af-4752-f126-cadb1dc695b8	5215	Ročinj
00050000-56af-4752-8491-989e61ca0587	3250	Rogaška Slatina
00050000-56af-4752-8981-4da62b340985	9262	Rogašovci
00050000-56af-4752-2eda-41dbb74da0aa	3252	Rogatec
00050000-56af-4752-9aef-1f30f0bb1a6e	1373	Rovte
00050000-56af-4752-ee03-1728c033d5df	2342	Ruše
00050000-56af-4752-a107-034f1412bf66	1282	Sava
00050000-56af-4752-5bcd-9c9f62eab9ff	6333	Sečovlje/Sicciole
00050000-56af-4752-febf-956fb77b9dff	4227	Selca
00050000-56af-4752-1d5a-aad6a46ff607	2352	Selnica ob Dravi
00050000-56af-4752-1512-aa68d1a3e664	8333	Semič
00050000-56af-4752-d9d9-dce964da7681	8281	Senovo
00050000-56af-4752-72a4-ae8b3cf2eb59	6224	Senožeče
00050000-56af-4752-434f-ac03c69ab151	8290	Sevnica
00050000-56af-4752-ba4f-6240e0b6c129	6210	Sežana
00050000-56af-4752-d918-9e901ec0a699	2214	Sladki Vrh
00050000-56af-4752-bc3b-906ca6b455de	5283	Slap ob Idrijci
00050000-56af-4752-c7c6-ffa4d7527a07	2380	Slovenj Gradec
00050000-56af-4752-3496-ec9d034c2cb9	2310	Slovenska Bistrica
00050000-56af-4752-3fb7-940048e20597	3210	Slovenske Konjice
00050000-56af-4752-3b1e-708b787e5320	1216	Smlednik
00050000-56af-4752-583f-1c9097e0eb6c	5232	Soča
00050000-56af-4752-7490-2e9d29562eb7	1317	Sodražica
00050000-56af-4752-4102-4582b682dfe6	3335	Solčava
00050000-56af-4752-243d-db00778978c6	5250	Solkan
00050000-56af-4752-e8fa-eed0edd23fbb	4229	Sorica
00050000-56af-4752-63e0-0a5eff91ac47	4225	Sovodenj
00050000-56af-4752-71b5-52b9a26a4f21	5281	Spodnja Idrija
00050000-56af-4752-1042-7f409e2fa0b7	2241	Spodnji Duplek
00050000-56af-4752-b898-9e66aae6ce87	9245	Spodnji Ivanjci
00050000-56af-4752-1d5b-07025d58e84e	2277	Središče ob Dravi
00050000-56af-4752-a75c-528cfe828b72	4267	Srednja vas v Bohinju
00050000-56af-4752-0bc2-788db6db2909	8256	Sromlje 
00050000-56af-4752-a764-3246ed75078c	5224	Srpenica
00050000-56af-4752-6460-a1e995b6b29b	1242	Stahovica
00050000-56af-4752-ce78-3f1a12531f04	1332	Stara Cerkev
00050000-56af-4752-153b-d593aa17233c	8342	Stari trg ob Kolpi
00050000-56af-4752-133d-24c36f50a910	1386	Stari trg pri Ložu
00050000-56af-4752-d7e6-09fbf2ef82d8	2205	Starše
00050000-56af-4752-a09e-e976576beeb5	2289	Stoperce
00050000-56af-4752-f6a2-4b1d49774886	8322	Stopiče
00050000-56af-4752-7d54-277204275524	3206	Stranice
00050000-56af-4752-7ff8-e9e797827ceb	8351	Straža
00050000-56af-4752-4c2b-539be30efa7f	1313	Struge
00050000-56af-4752-f02d-45f27bb3c541	8293	Studenec
00050000-56af-4752-dfd6-7c52bdff7c37	8331	Suhor
00050000-56af-4752-e317-187e67589b40	2233	Sv. Ana v Slovenskih goricah
00050000-56af-4752-1715-93539820330e	2235	Sv. Trojica v Slovenskih goricah
00050000-56af-4752-c508-226fa884e1a5	2353	Sveti Duh na Ostrem Vrhu
00050000-56af-4752-4b84-e891681c6cdd	9244	Sveti Jurij ob Ščavnici
00050000-56af-4752-94a1-79904a11fdb1	3264	Sveti Štefan
00050000-56af-4752-44f7-c8fd596c4f59	2258	Sveti Tomaž
00050000-56af-4752-8d69-2c28cee69b24	9204	Šalovci
00050000-56af-4752-d4e2-d31443f3b827	5261	Šempas
00050000-56af-4752-feba-c1d5df5c8758	5290	Šempeter pri Gorici
00050000-56af-4752-e8ed-0ec541c71caa	3311	Šempeter v Savinjski dolini
00050000-56af-4752-38b9-1283b75c84b3	4208	Šenčur
00050000-56af-4752-1dc5-94ac1d3e72df	2212	Šentilj v Slovenskih goricah
00050000-56af-4752-5877-0c5bcdf0f25c	8297	Šentjanž
00050000-56af-4752-e80f-9f84729148f5	2373	Šentjanž pri Dravogradu
00050000-56af-4752-fe0f-033c526c3d7d	8310	Šentjernej
00050000-56af-4752-3184-1368f389b36b	3230	Šentjur
00050000-56af-4752-652c-2f07b1826e96	3271	Šentrupert
00050000-56af-4752-1ad2-f841bb486737	8232	Šentrupert
00050000-56af-4752-d716-d98bc1a3bd70	1296	Šentvid pri Stični
00050000-56af-4752-5277-cd513844bf67	8275	Škocjan
00050000-56af-4752-7e12-995c971c4ff7	6281	Škofije
00050000-56af-4752-a662-22bc7f38ab5a	4220	Škofja Loka
00050000-56af-4752-b656-61856fed9023	3211	Škofja vas
00050000-56af-4752-7c76-86bc5977cc73	1291	Škofljica
00050000-56af-4752-0daa-b5c1116894a7	6274	Šmarje
00050000-56af-4752-2b76-f1b691abbbdc	1293	Šmarje - Sap
00050000-56af-4752-be21-0ee197e31bd3	3240	Šmarje pri Jelšah
00050000-56af-4752-3cc3-9b4ba08ece0c	8220	Šmarješke Toplice
00050000-56af-4752-0caf-adf00008d0d8	2315	Šmartno na Pohorju
00050000-56af-4752-fc65-5dc5745e1b0a	3341	Šmartno ob Dreti
00050000-56af-4752-4ec7-3a6749bbd072	3327	Šmartno ob Paki
00050000-56af-4752-002d-7cc764e163a1	1275	Šmartno pri Litiji
00050000-56af-4752-24ba-734359c1562b	2383	Šmartno pri Slovenj Gradcu
00050000-56af-4752-27cb-aa7f8365485b	3201	Šmartno v Rožni dolini
00050000-56af-4752-dd0e-be96d5b63ae5	3325	Šoštanj
00050000-56af-4752-4d7e-e6faf72fd637	6222	Štanjel
00050000-56af-4752-9807-fc6fe9db9ee3	3220	Štore
00050000-56af-4752-91ab-d573bbad3758	3304	Tabor
00050000-56af-4752-2733-9e89bdd6b4af	3221	Teharje
00050000-56af-4752-13ce-146b75fa39f4	9251	Tišina
00050000-56af-4752-76a4-bd68dee0016d	5220	Tolmin
00050000-56af-4752-ccf9-3e19f364295d	3326	Topolšica
00050000-56af-4752-a2c9-4a51c391c06e	2371	Trbonje
00050000-56af-4752-3b50-2d83b8ccf3ec	1420	Trbovlje
00050000-56af-4752-bdce-f5e120260588	8231	Trebelno 
00050000-56af-4752-7d31-c5eda9e961f9	8210	Trebnje
00050000-56af-4752-1348-867b90a80118	5252	Trnovo pri Gorici
00050000-56af-4752-24db-8d8cc4f8f631	2254	Trnovska vas
00050000-56af-4752-12fe-71f77b9f77e7	1222	Trojane
00050000-56af-4752-36d7-a8127f45dd97	1236	Trzin
00050000-56af-4752-be66-5c2a55446257	4290	Tržič
00050000-56af-4752-4c9e-0eee2c63f5e8	8295	Tržišče
00050000-56af-4752-c69a-599b060320a7	1311	Turjak
00050000-56af-4752-3033-3349f92b4d41	9224	Turnišče
00050000-56af-4752-dc59-89f80a1bdd9b	8323	Uršna sela
00050000-56af-4752-a6ca-b7b996a48ab3	1252	Vače
00050000-56af-4752-c40d-d387a76a24df	3320	Velenje 
00050000-56af-4752-665d-a7536b944345	3322	Velenje - poštni predali
00050000-56af-4752-6b03-ea34def16bef	8212	Velika Loka
00050000-56af-4752-25a4-68fab1a30a97	2274	Velika Nedelja
00050000-56af-4752-abf9-69bf4774294b	9225	Velika Polana
00050000-56af-4752-5cbb-fa0a9d71406b	1315	Velike Lašče
00050000-56af-4752-1a67-d873ac8118b7	8213	Veliki Gaber
00050000-56af-4752-a139-9312cc6517d8	9241	Veržej
00050000-56af-4752-50f7-d1224ef54490	1312	Videm - Dobrepolje
00050000-56af-4752-fa0b-d01782d17765	2284	Videm pri Ptuju
00050000-56af-4752-500e-deb82068a8d3	8344	Vinica
00050000-56af-4752-c0b9-d9802c5ae7f2	5271	Vipava
00050000-56af-4752-93f1-7c3f3fb67873	4212	Visoko
00050000-56af-4752-b926-4963d6785d22	1294	Višnja Gora
00050000-56af-4752-7773-b73d7fcc9b52	3205	Vitanje
00050000-56af-4752-d5f0-0eeaf1e9945a	2255	Vitomarci
00050000-56af-4752-6715-9299237e25a6	1217	Vodice
00050000-56af-4752-c840-7886b08e7768	3212	Vojnik\t
00050000-56af-4752-1b9d-67b52cd08263	5293	Volčja Draga
00050000-56af-4752-8db3-d1dc156a4c04	2232	Voličina
00050000-56af-4752-21e3-5f0245351585	3305	Vransko
00050000-56af-4752-5f33-84330f494763	6217	Vremski Britof
00050000-56af-4752-8f1f-0d6237208c9f	1360	Vrhnika
00050000-56af-4752-1344-3d3f49080d71	2365	Vuhred
00050000-56af-4752-862f-930a00b6156e	2367	Vuzenica
00050000-56af-4752-74b9-3b7f1efc6fab	8292	Zabukovje 
00050000-56af-4752-2319-6be837e4c6bb	1410	Zagorje ob Savi
00050000-56af-4752-59c0-ae7c2214df1f	1303	Zagradec
00050000-56af-4752-89a9-6fbdce07a64d	2283	Zavrč
00050000-56af-4752-d5b7-0f3e3d092ada	8272	Zdole 
00050000-56af-4752-8130-73cbd9a59758	4201	Zgornja Besnica
00050000-56af-4752-0f3b-03d62ed66acf	2242	Zgornja Korena
00050000-56af-4752-2c6e-67235c013016	2201	Zgornja Kungota
00050000-56af-4752-f25e-f3f27e7d1d29	2316	Zgornja Ložnica
00050000-56af-4752-15e7-7d18181150bc	2314	Zgornja Polskava
00050000-56af-4752-a3d5-8ce2f785378c	2213	Zgornja Velka
00050000-56af-4752-b8ed-8f667749c35a	4247	Zgornje Gorje
00050000-56af-4752-7a3e-b37775a6ea2c	4206	Zgornje Jezersko
00050000-56af-4752-6b3d-c961a2c2040d	2285	Zgornji Leskovec
00050000-56af-4752-7c55-ba36f012da86	1432	Zidani Most
00050000-56af-4752-b791-dc85e5c28f89	3214	Zreče
00050000-56af-4752-96bb-a1e119e496af	4209	Žabnica
00050000-56af-4752-9dd2-8add37a6a1a9	3310	Žalec
00050000-56af-4752-60d2-f7394c66342f	4228	Železniki
00050000-56af-4752-53cd-cb275036747a	2287	Žetale
00050000-56af-4752-5775-a9c46db6e4df	4226	Žiri
00050000-56af-4752-36ce-8ee42aa8c811	4274	Žirovnica
00050000-56af-4752-32cf-a4a6f2c91cd2	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 42250799)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 42250369)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 42250109)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56af-4755-c856-4fada1d4eaad	00080000-56af-4755-29fe-853b3c61644f	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56af-4755-9ca8-c19edf0f6592	00080000-56af-4755-29fe-853b3c61644f	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56af-4755-a885-7566b0216d20	00080000-56af-4755-1a07-5c63a10172fc	\N	00040000-56af-4752-04a4-6b7ae22ca3b1	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 42250244)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56af-4752-02c0-94163e1c16dc	novo leto	1	1	\N	t
00430000-56af-4752-3611-4404b3677e7a	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56af-4752-601d-b88e9f496f70	dan upora proti okupatorju	27	4	\N	t
00430000-56af-4752-2c32-766f669e621a	praznik dela	1	5	\N	t
00430000-56af-4752-0967-c2ebf7231f9b	praznik dela	2	5	\N	t
00430000-56af-4752-4b0b-75a5e8d08d21	dan Primoža Trubarja	8	6	\N	f
00430000-56af-4752-7523-c92961436188	dan državnosti	25	6	\N	t
00430000-56af-4752-84ec-257265b86d4f	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56af-4752-9729-110cee112871	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56af-4752-e894-986f1575f155	dan suverenosti	25	10	\N	f
00430000-56af-4752-a624-67ed11e0aa93	dan spomina na mrtve	1	11	\N	t
00430000-56af-4752-6b00-2f97794d7977	dan Rudolfa Maistra	23	11	\N	f
00430000-56af-4752-db37-0e14fec903e4	božič	25	12	\N	t
00430000-56af-4752-8305-44130b098006	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56af-4752-6404-014743e858f8	Marijino vnebovzetje	15	8	\N	t
00430000-56af-4752-16b9-1cbb33bb50e4	dan reformacije	31	10	\N	t
00430000-56af-4752-5afd-9db8886d2b5c	velikonočna nedelja	27	3	2016	t
00430000-56af-4752-af91-17dc5827ecdd	velikonočna nedelja	16	4	2017	t
00430000-56af-4752-41dd-83d8ec530e43	velikonočna nedelja	1	4	2018	t
00430000-56af-4752-03a8-250f74464874	velikonočna nedelja	21	4	2019	t
00430000-56af-4752-f42e-73d67cf16b3c	velikonočna nedelja	12	4	2020	t
00430000-56af-4752-a605-d78210decf20	velikonočna nedelja	4	4	2021	t
00430000-56af-4752-63e0-51c7529f34bc	velikonočna nedelja	17	4	2022	t
00430000-56af-4752-0eff-6a3148709e9c	velikonočna nedelja	9	4	2023	t
00430000-56af-4752-1e7d-c83b86276f98	velikonočna nedelja	31	3	2024	t
00430000-56af-4752-16c9-5c61b34b01f4	velikonočna nedelja	20	4	2025	t
00430000-56af-4752-1e8d-35f43b59ff82	velikonočna nedelja	5	4	2026	t
00430000-56af-4752-9497-607e505da929	velikonočna nedelja	28	3	2027	t
00430000-56af-4752-bdd3-c909e76bc961	velikonočna nedelja	16	4	2028	t
00430000-56af-4752-9142-9fdf5430eb78	velikonočna nedelja	1	4	2029	t
00430000-56af-4752-bd66-39bc9f85bf5c	velikonočna nedelja	21	4	2030	t
00430000-56af-4752-fc21-0b8ea7e77224	velikonočni ponedeljek	28	3	2016	t
00430000-56af-4752-4f1f-c9ac07efbc93	velikonočni ponedeljek	17	4	2017	t
00430000-56af-4752-6868-511053cc0450	velikonočni ponedeljek	2	4	2018	t
00430000-56af-4752-9135-0a8c56cb3601	velikonočni ponedeljek	22	4	2019	t
00430000-56af-4752-54a0-8060fcdbcdcb	velikonočni ponedeljek	13	4	2020	t
00430000-56af-4752-4e62-4eca9c17c4e7	velikonočni ponedeljek	5	4	2021	t
00430000-56af-4752-adf5-84497b9d5c1b	velikonočni ponedeljek	18	4	2022	t
00430000-56af-4752-bb71-51702f3b4fdb	velikonočni ponedeljek	10	4	2023	t
00430000-56af-4752-467b-74df53fb2cf4	velikonočni ponedeljek	1	4	2024	t
00430000-56af-4752-97a5-1f8e72c7d1c6	velikonočni ponedeljek	21	4	2025	t
00430000-56af-4752-8757-51904655a825	velikonočni ponedeljek	6	4	2026	t
00430000-56af-4752-fc6f-30e6ad2a35ec	velikonočni ponedeljek	29	3	2027	t
00430000-56af-4752-fa06-3869d54ade0a	velikonočni ponedeljek	17	4	2028	t
00430000-56af-4752-6ad3-f5fb1cb77b31	velikonočni ponedeljek	2	4	2029	t
00430000-56af-4752-a42b-f1430e94d8bc	velikonočni ponedeljek	22	4	2030	t
00430000-56af-4752-8a31-f11b10ad8b7a	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56af-4752-8589-5c5a374c85d6	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56af-4752-60f3-9deebf89fb1b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56af-4752-2d43-f43aeeeb6057	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56af-4752-b099-341ba4aaa28d	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56af-4752-87d5-74dcf3159a25	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56af-4752-5f13-01fd359d3934	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56af-4752-d233-eedbe9b9bcdf	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56af-4752-e96c-5c7ac4dd7a41	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56af-4752-91e3-586fc9403ee4	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56af-4752-98ae-28ddbdc63276	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56af-4752-ce29-4add788b5fd4	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56af-4752-0e34-8c2b2bcfc4c4	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56af-4752-862d-e55959b8abf0	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56af-4752-3745-5144186f6dec	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 42250213)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56af-4756-ca23-742245a30eeb	000e0000-56af-4755-c36e-fce048942f4d	1	3	1
001b0000-56af-4756-b41a-6084b36a7f8d	000e0000-56af-4755-c36e-fce048942f4d	2	4	2
001b0000-56af-4756-af26-6d948c34eb86	000e0000-56af-4755-c36e-fce048942f4d	4	5	3
001b0000-56af-4756-7f44-a79c20d4177d	000e0000-56af-4755-c36e-fce048942f4d	\N	1	\N
001b0000-56af-4756-7ed6-46b386739968	000e0000-56af-4755-c36e-fce048942f4d	5	9	4
001b0000-56af-4756-54b5-7fb1c821a31d	000e0000-56af-4755-c36e-fce048942f4d	7	10	5
001b0000-56af-4756-5a57-73271f2175e2	000e0000-56af-4755-210a-8e7c3df3f5eb	3	2	1
001b0000-56af-4756-54ae-454470dfb863	000e0000-56af-4755-210a-8e7c3df3f5eb	4	3	1
001b0000-56af-4756-42fc-129c79faab74	000e0000-56af-4755-c36e-fce048942f4d	\N	2	\N
001b0000-56af-4756-023c-bec723bb0555	000e0000-56af-4755-210a-8e7c3df3f5eb	\N	1	\N
001b0000-56af-4756-88ea-f86cc9c5ec2f	000e0000-56af-4755-c36e-fce048942f4d	3	8	3
001b0000-56af-4756-1da4-6a80a978927d	000e0000-56af-4755-c36e-fce048942f4d	2	11	1
001b0000-56af-4756-0bb3-c2794055fdef	000e0000-56af-4755-210a-8e7c3df3f5eb	1	5	1
001b0000-56af-4756-7d12-55fd08c76113	000e0000-56af-4755-210a-8e7c3df3f5eb	6	4	2
001b0000-56af-4756-1246-03502de62ec1	000e0000-56af-4755-c36e-fce048942f4d	1	6	1
001b0000-56af-4756-3bf5-4655866ff13d	000e0000-56af-4755-c36e-fce048942f4d	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 42250219)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56af-4756-ca23-742245a30eeb	000a0000-56af-4755-ce8f-f937316d0e61
001b0000-56af-4756-ca23-742245a30eeb	000a0000-56af-4755-f11f-506ba431cdd6
001b0000-56af-4756-b41a-6084b36a7f8d	000a0000-56af-4755-f11f-506ba431cdd6
001b0000-56af-4756-b41a-6084b36a7f8d	000a0000-56af-4755-46a9-cb49ae3699da
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 42250381)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 42250813)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 42250823)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56af-4755-a4df-3d8d20c71099	00080000-56af-4755-b50d-742c0b4bb3e4	0987	AK
00190000-56af-4755-7f9c-9f54268a652d	00080000-56af-4755-1a07-5c63a10172fc	0989	AK
00190000-56af-4755-c334-5253335c233f	00080000-56af-4755-1441-0fb92ce22fce	0986	AK
00190000-56af-4755-7ded-b83356ebc26e	00080000-56af-4755-9964-0bd940604d8b	0984	AK
00190000-56af-4755-6ac5-daacce2a1e6e	00080000-56af-4755-4cd6-d72f644a1f0a	0983	AK
00190000-56af-4755-7761-ad8c2230ec5e	00080000-56af-4755-fc3c-87057bcbd66b	0982	AK
00190000-56af-4757-2454-32aa107e85ff	00080000-56af-4757-2ff0-d0848abf1b06	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 42250712)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56af-4756-91c0-f1c316ea13fb	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 42250831)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 42250409)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56af-4755-eb9a-cfd2776f1188	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56af-4755-319f-ff9d4e8fd60a	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56af-4755-2b92-f1de4abbe58e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56af-4755-1cf0-eca5301783d7	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56af-4755-ae4a-5e7596171cfe	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56af-4755-8651-21f667774965	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56af-4755-5b1c-cfd61a180ade	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 42250354)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 42250344)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 42250551)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 42250481)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 42250187)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 42249948)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56af-4757-2ff0-d0848abf1b06	00010000-56af-4753-9115-8612583f9295	2016-02-01 12:53:59	INS	a:0:{}
2	App\\Entity\\Option	00000000-56af-4757-8b14-b8aa9b71ca19	00010000-56af-4753-9115-8612583f9295	2016-02-01 12:53:59	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56af-4757-2454-32aa107e85ff	00010000-56af-4753-9115-8612583f9295	2016-02-01 12:53:59	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 42250423)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 42249986)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56af-4753-f779-86e64806d2dc	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56af-4753-9aca-2c9fe2fbbc9a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56af-4753-4571-37a6708f7f0e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56af-4753-da14-8fc566617c6c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56af-4753-7584-55dd1a795b5d	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56af-4753-e8b9-dd85eca890e0	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56af-4753-6ab1-da0d9cc5d726	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56af-4753-4c40-5a460f51cbe7	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56af-4753-0106-a742dde56373	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-4753-47c5-60a9ca0fc9e1	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-4753-6686-6388755ec12f	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-4753-0170-c87e12b15c29	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-4753-f69b-5b89cf83a29b	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-4753-af9d-a7a4959d6275	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-4753-515d-d2478555c833	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-4753-3688-40321c31ef08	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-4753-e59c-75cb8a6cf92d	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56af-4753-8621-11217188ab24	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56af-4753-ed02-70be03c8ce0f	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56af-4753-b270-5408e849bf08	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56af-4753-9b5d-7f252ba4d07c	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-4753-ac9b-d3c9eda06703	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-4753-c4bf-756f6dfe6637	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-4753-309a-d3c66607e6b6	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-4753-442e-0cb8336e2326	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56af-4753-4cb5-a6cc12f8d939	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56af-4753-4d42-9db3a0d0e0ce	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56af-4753-53e9-a500af7ade71	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56af-4753-239e-e35776ab0379	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56af-4753-d49f-03f637c50c0c	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56af-4753-e2c8-c026273e344f	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-4753-835a-6910f4273fba	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-4753-cb27-125a619b5abc	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56af-4753-fa3e-adbb4cf632ef	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56af-4753-6a68-ac5bd9b69fbb	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56af-4753-4dd6-9755db5921c5	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56af-4753-2eb6-e1c60d5cf457	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-4753-a322-88964aad3f6a	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-4753-0b7a-22aab6a2d644	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56af-4753-08de-fc4ad3204e7b	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-4753-aadb-67bba283ea45	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-4753-3b47-41d1e93d49f1	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56af-4753-b9c8-3ebf67ddf007	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-4753-0f80-e43c16e88ec6	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-4753-6129-dea546491929	direktor	minimalne pravice za direktorja	t
00020000-56af-4753-145d-de7fff49d932	arhivar	arhivar	t
00020000-56af-4753-ab41-a2b186be192c	dramaturg	dramaturg	t
00020000-56af-4753-5429-8eb8fbaad26d	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56af-4753-5856-31ab1030963a	poslovni-sekretar	poslovni sekretar	t
00020000-56af-4753-ed34-9caa23d666d2	vodja-tehnike	vodja tehnike	t
00020000-56af-4753-9cf2-217aa5ecd47a	racunovodja	računovodja	t
00020000-56af-4755-57c8-03f3f12d0528	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56af-4755-2fb4-18134d69aead	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-09a4-fe2c7cd5eb4c	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-5ab0-415a53eb7315	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-d4ab-a63bc4f03afc	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-ec0d-412aadeead99	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-9da2-e2837dafb49a	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-4ed1-e15997aa0a1b	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56af-4755-4f22-702870645a75	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56af-4755-3a56-bcd8b481b18d	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-88aa-350042c06bba	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-3644-a73fbed38123	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-8251-2635256a9ef8	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-5fcc-9fe730c8cd23	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-bb51-c140a7ac33c8	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-ab53-72286081dfaf	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-341b-07504a1db9ca	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-3b8b-d8e69b3ccb7d	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-03d7-afe69f8c75f0	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-5a6f-c340562e527c	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56af-4755-7178-dba94a5d8c40	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-6f4e-0de892dc4f66	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-aec9-e21eb031b2ac	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-bc66-cf32732aa8a0	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-a37a-45a14eec70f7	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-7d72-abd850b73e08	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-7178-e5f0dd6b6745	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-f595-df9ead77b4e1	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-1597-e44dbc394089	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-ed36-b1b3b5b77c60	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-ffa4-e03af8b8266b	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-f665-0cc814c7ac0f	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-c7ae-708fb1fb2537	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-3e4e-165395efee9f	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-a150-336f49202d10	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-351a-6a2ffac63b82	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56af-4755-bb95-66feca3e4ea4	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56af-4755-3e0b-b063c6cdbff8	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56af-4755-fda2-f095dc4f539a	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 42249970)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56af-4753-c836-1cd1166910a3	00020000-56af-4753-4571-37a6708f7f0e
00010000-56af-4753-9115-8612583f9295	00020000-56af-4753-4571-37a6708f7f0e
00010000-56af-4755-37c2-fb051f8ad5b3	00020000-56af-4755-57c8-03f3f12d0528
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-2fb4-18134d69aead
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-ec0d-412aadeead99
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-3a56-bcd8b481b18d
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-3644-a73fbed38123
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-5fcc-9fe730c8cd23
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-03d7-afe69f8c75f0
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-5ab0-415a53eb7315
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-7178-dba94a5d8c40
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-bc66-cf32732aa8a0
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-7d72-abd850b73e08
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-f595-df9ead77b4e1
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-ed36-b1b3b5b77c60
00010000-56af-4755-e34a-ce652b85cb27	00020000-56af-4755-3e4e-165395efee9f
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-2fb4-18134d69aead
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-09a4-fe2c7cd5eb4c
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-5ab0-415a53eb7315
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-d4ab-a63bc4f03afc
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-5fcc-9fe730c8cd23
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-341b-07504a1db9ca
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-7178-dba94a5d8c40
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-bc66-cf32732aa8a0
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-7d72-abd850b73e08
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-f595-df9ead77b4e1
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-ed36-b1b3b5b77c60
00010000-56af-4755-4b3c-77647a9f4ea1	00020000-56af-4755-3e4e-165395efee9f
00010000-56af-4755-a5c1-85f2a7904724	00020000-56af-4755-2fb4-18134d69aead
00010000-56af-4755-a5c1-85f2a7904724	00020000-56af-4755-09a4-fe2c7cd5eb4c
00010000-56af-4755-a5c1-85f2a7904724	00020000-56af-4755-5ab0-415a53eb7315
00010000-56af-4755-a5c1-85f2a7904724	00020000-56af-4755-d4ab-a63bc4f03afc
00010000-56af-4755-a5c1-85f2a7904724	00020000-56af-4755-3644-a73fbed38123
00010000-56af-4755-a5c1-85f2a7904724	00020000-56af-4755-5fcc-9fe730c8cd23
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-09a4-fe2c7cd5eb4c
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-9da2-e2837dafb49a
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-88aa-350042c06bba
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-8251-2635256a9ef8
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-3644-a73fbed38123
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-3b8b-d8e69b3ccb7d
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-5fcc-9fe730c8cd23
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-bb51-c140a7ac33c8
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-7178-dba94a5d8c40
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-6f4e-0de892dc4f66
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-bc66-cf32732aa8a0
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-a37a-45a14eec70f7
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-7d72-abd850b73e08
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-7178-e5f0dd6b6745
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-f595-df9ead77b4e1
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-1597-e44dbc394089
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-ed36-b1b3b5b77c60
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-ffa4-e03af8b8266b
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-3e4e-165395efee9f
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-a150-336f49202d10
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-bb95-66feca3e4ea4
00010000-56af-4755-958f-5071e90e0fb8	00020000-56af-4755-3e0b-b063c6cdbff8
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-09a4-fe2c7cd5eb4c
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-9da2-e2837dafb49a
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-4f22-702870645a75
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-88aa-350042c06bba
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-8251-2635256a9ef8
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-3644-a73fbed38123
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-3b8b-d8e69b3ccb7d
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-5fcc-9fe730c8cd23
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-bb51-c140a7ac33c8
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-ab53-72286081dfaf
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-7178-dba94a5d8c40
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-6f4e-0de892dc4f66
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-aec9-e21eb031b2ac
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-bc66-cf32732aa8a0
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-a37a-45a14eec70f7
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-7d72-abd850b73e08
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-7178-e5f0dd6b6745
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-f595-df9ead77b4e1
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-1597-e44dbc394089
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-ed36-b1b3b5b77c60
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-ffa4-e03af8b8266b
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-3e4e-165395efee9f
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-a150-336f49202d10
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-351a-6a2ffac63b82
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-bb95-66feca3e4ea4
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-3e0b-b063c6cdbff8
00010000-56af-4755-4951-c2bc05bae374	00020000-56af-4755-fda2-f095dc4f539a
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-09a4-fe2c7cd5eb4c
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-5ab0-415a53eb7315
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-9da2-e2837dafb49a
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-4ed1-e15997aa0a1b
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-4f22-702870645a75
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-ec0d-412aadeead99
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-88aa-350042c06bba
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-8251-2635256a9ef8
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-3644-a73fbed38123
00010000-56af-4755-c6ec-6ba104cf959e	00020000-56af-4755-3b8b-d8e69b3ccb7d
00010000-56af-4755-c8e4-1e15698a4951	00020000-56af-4755-2fb4-18134d69aead
00010000-56af-4755-c8e4-1e15698a4951	00020000-56af-4755-d4ab-a63bc4f03afc
00010000-56af-4755-c8e4-1e15698a4951	00020000-56af-4755-ec0d-412aadeead99
00010000-56af-4755-c8e4-1e15698a4951	00020000-56af-4755-3a56-bcd8b481b18d
00010000-56af-4755-c8e4-1e15698a4951	00020000-56af-4755-3644-a73fbed38123
00010000-56af-4755-c8e4-1e15698a4951	00020000-56af-4755-5fcc-9fe730c8cd23
00010000-56af-4755-c8e4-1e15698a4951	00020000-56af-4755-03d7-afe69f8c75f0
00010000-56af-4755-c8e4-1e15698a4951	00020000-56af-4755-f665-0cc814c7ac0f
00010000-56af-4755-3c90-9189351d7148	00020000-56af-4755-5a6f-c340562e527c
00010000-56af-4755-44d2-c97ba275846b	00020000-56af-4753-6129-dea546491929
00010000-56af-4755-836a-90fbf22a3575	00020000-56af-4753-145d-de7fff49d932
00010000-56af-4755-a1da-8602905baad9	00020000-56af-4753-ab41-a2b186be192c
00010000-56af-4755-3f16-250a3dfa7f78	00020000-56af-4753-5429-8eb8fbaad26d
00010000-56af-4755-2de8-80a20770f5fe	00020000-56af-4753-5856-31ab1030963a
00010000-56af-4755-6ea6-11685b46939c	00020000-56af-4753-ed34-9caa23d666d2
00010000-56af-4755-e21b-d75a3d04290b	00020000-56af-4753-9cf2-217aa5ecd47a
\.


--
-- TOC entry 3186 (class 0 OID 42250437)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 42250375)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 42250298)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56af-4755-95cf-f4c09114d210	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56af-4755-b13d-c9bc7105e580	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56af-4755-91ba-aff47c87952d	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56af-4755-9d2f-c6d8700f6d5e	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 42249935)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56af-4752-43d0-096eacc10729	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56af-4752-ad34-d8543d057c6c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56af-4752-8fbd-90f9c3f7229d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56af-4752-df15-b5fc6e16561e	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56af-4752-0261-b2f029382d22	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 42249927)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56af-4752-9084-f9528ce1a9f5	00230000-56af-4752-df15-b5fc6e16561e	popa
00240000-56af-4752-6207-97e4171b4ff2	00230000-56af-4752-df15-b5fc6e16561e	oseba
00240000-56af-4752-c048-1fc52e2231ce	00230000-56af-4752-df15-b5fc6e16561e	tippopa
00240000-56af-4752-236b-cce95d4cdd2e	00230000-56af-4752-df15-b5fc6e16561e	organizacijskaenota
00240000-56af-4752-ecd6-9392fd0388ee	00230000-56af-4752-df15-b5fc6e16561e	sezona
00240000-56af-4752-cd5c-7228a3ca12c9	00230000-56af-4752-df15-b5fc6e16561e	tipvaje
00240000-56af-4752-b9b2-33bcc565e706	00230000-56af-4752-df15-b5fc6e16561e	tipdodatka
00240000-56af-4752-9193-9220e534ef38	00230000-56af-4752-ad34-d8543d057c6c	prostor
00240000-56af-4752-310a-b50a6471ddd8	00230000-56af-4752-df15-b5fc6e16561e	besedilo
00240000-56af-4752-6b60-723936a0a1f7	00230000-56af-4752-df15-b5fc6e16561e	uprizoritev
00240000-56af-4752-b461-cd81d67207ef	00230000-56af-4752-df15-b5fc6e16561e	funkcija
00240000-56af-4752-abaa-4963db27e36a	00230000-56af-4752-df15-b5fc6e16561e	tipfunkcije
00240000-56af-4752-cce2-05f11207d1a6	00230000-56af-4752-df15-b5fc6e16561e	alternacija
00240000-56af-4752-384a-eddeb6e46e74	00230000-56af-4752-43d0-096eacc10729	pogodba
00240000-56af-4752-8ed1-2eec26adbd74	00230000-56af-4752-df15-b5fc6e16561e	zaposlitev
00240000-56af-4752-c1bd-23816dc0e586	00230000-56af-4752-df15-b5fc6e16561e	zvrstuprizoritve
00240000-56af-4752-e73d-15f18f89edce	00230000-56af-4752-43d0-096eacc10729	programdela
00240000-56af-4752-da3a-e7ead3889e0d	00230000-56af-4752-df15-b5fc6e16561e	zapis
\.


--
-- TOC entry 3133 (class 0 OID 42249922)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
fbb0abe4-310a-4e9c-8c87-27ed3d183517	00240000-56af-4752-9084-f9528ce1a9f5	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 42250498)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56af-4756-f7a0-131c1f90597c	000e0000-56af-4755-c36e-fce048942f4d	00080000-56af-4755-29fe-853b3c61644f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56af-4752-8adf-e6b319a8d2e9
00270000-56af-4756-3a91-36b736641f10	000e0000-56af-4755-c36e-fce048942f4d	00080000-56af-4755-29fe-853b3c61644f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56af-4752-8adf-e6b319a8d2e9
\.


--
-- TOC entry 3149 (class 0 OID 42250071)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 42250317)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56af-4756-088c-4c2a9ca3a1f3	00180000-56af-4756-7ece-dc742ddef464	000c0000-56af-4756-7474-b42375a9e7c5	00090000-56af-4755-411c-e0f790d9f184	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-4756-2006-f92adb1602b2	00180000-56af-4756-7ece-dc742ddef464	000c0000-56af-4756-8b30-a28c4b5a2b0d	00090000-56af-4755-960b-a9c3bd868032	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-4756-4078-c3a5314116be	00180000-56af-4756-7ece-dc742ddef464	000c0000-56af-4756-b4a2-02516c2b8484	00090000-56af-4755-809c-a3e31c6fc022	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-4756-9b56-5e62185fb602	00180000-56af-4756-7ece-dc742ddef464	000c0000-56af-4756-f620-07aa4b259c79	00090000-56af-4755-e9c6-1f03f9770b0c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-4756-1cb2-9da22dedaacc	00180000-56af-4756-7ece-dc742ddef464	000c0000-56af-4756-25e2-05d3c6d98320	00090000-56af-4755-816e-1e7c46bf89a8	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-4756-bc93-b3928b825d33	00180000-56af-4756-8066-ec3ee1b8ea84	\N	00090000-56af-4755-816e-1e7c46bf89a8	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	f	\N	\N
001a0000-56af-4756-2a35-7730195ccc96	00180000-56af-4756-136e-cb3df8a6cf35	\N	00090000-56af-4755-960b-a9c3bd868032	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56af-4756-29aa-978b4f79cd7e	00180000-56af-4756-7ece-dc742ddef464	\N	00090000-56af-4755-25f4-acc4aaaee62e	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56af-4756-3033-a5ac0c575c39	00180000-56af-4756-08fc-ba3cf4c96712	\N	00090000-56af-4755-411c-e0f790d9f184	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56af-4756-a05a-969b6fd82522	00180000-56af-4756-08fc-ba3cf4c96712	\N	00090000-56af-4755-960b-a9c3bd868032	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56af-4756-919b-a124f582718f	00180000-56af-4756-08fc-ba3cf4c96712	\N	00090000-56af-4755-a5b0-54754713cafc	0	2015-03-10 07:00:00	15840	2015-03-31 23:00:00	f	f	t	\N	\N
001a0000-56af-4756-8cbc-0e94f812ebfc	00180000-56af-4756-3ba0-e30fcd5137ae	000c0000-56af-4756-7474-b42375a9e7c5	00090000-56af-4755-411c-e0f790d9f184	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
001a0000-56af-4756-59e6-fedb0a9bf645	00180000-56af-4756-3ba0-e30fcd5137ae	000c0000-56af-4756-8b30-a28c4b5a2b0d	00090000-56af-4755-960b-a9c3bd868032	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 42250334)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56af-4752-050f-d998bf7c4799	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56af-4752-536c-21b5dba06b17	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56af-4752-4b35-1b16c3d89171	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56af-4752-9028-eefd10b7cf5d	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56af-4752-1d48-ab21ee77da91	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56af-4752-1dad-6ef31e4c0bb6	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 42250539)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56af-4752-3e2e-57343596f91e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56af-4752-b053-87be066e9c41	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56af-4752-e504-fc61fd786f4a	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56af-4752-62dc-958659826ccd	04	Režija	Režija	Režija	umetnik	30
000f0000-56af-4752-9b34-36e9e1b6834b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56af-4752-9e6c-a8037068b8a5	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56af-4752-998e-d34e80a68aa4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56af-4752-c868-d5a60af136c1	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56af-4752-669d-b354fb1c4462	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56af-4752-4405-c12247790a2d	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56af-4752-d7c8-b68d96782c93	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56af-4752-2fb7-886c6c2dac8b	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56af-4752-4096-9130ecce9e52	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56af-4752-786e-72539439a106	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56af-4752-5513-e18474db64d3	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56af-4752-9d20-4d44d3c90303	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56af-4752-94b1-849fe1b30f01	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56af-4752-0ee1-8551cebcd131	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56af-4752-ad5e-ccc943943384	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 42250022)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56af-4755-6123-0f2d513c2995	0001	šola	osnovna ali srednja šola
00400000-56af-4755-027c-c748435283c2	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56af-4755-aa70-8a97c01d5fd7	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 42250843)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56af-4752-5945-bca4a72c765d	01	Velika predstava	f	1.00	1.00
002b0000-56af-4752-f307-e45571d3e44a	02	Mala predstava	f	0.50	0.50
002b0000-56af-4752-fd90-324b1b373431	03	Mala koprodukcija	t	0.40	1.00
002b0000-56af-4752-b89f-03cca1f57746	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56af-4752-6855-5c703ed6f03b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 42250288)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56af-4752-d60e-76285bef9af4	0001	prva vaja	prva vaja
00420000-56af-4752-c684-5f846f2bdeef	0002	tehnična vaja	tehnična vaja
00420000-56af-4752-d0ec-a95e64fb5143	0003	lučna vaja	lučna vaja
00420000-56af-4752-b39a-7ad9c9970861	0004	kostumska vaja	kostumska vaja
00420000-56af-4752-1172-0d8c9ff4de72	0005	foto vaja	foto vaja
00420000-56af-4752-ccb7-19c83a9be92a	0006	1. glavna vaja	1. glavna vaja
00420000-56af-4752-28cb-ae821720f38e	0007	2. glavna vaja	2. glavna vaja
00420000-56af-4752-04b8-c24a430d00cf	0008	1. generalka	1. generalka
00420000-56af-4752-d158-d014d42a6ae4	0009	2. generalka	2. generalka
00420000-56af-4752-f371-f594d360f008	0010	odprta generalka	odprta generalka
00420000-56af-4752-4711-52c85c08be53	0011	obnovitvena vaja	obnovitvena vaja
00420000-56af-4752-bbd2-a14cfb5e1fba	0012	italijanka	krajša "obnovitvena" vaja
00420000-56af-4752-b5e9-2123f1c76362	0013	pevska vaja	pevska vaja
00420000-56af-4752-babb-30e02f45fc16	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56af-4752-311a-d367abd79c6e	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56af-4752-a3ae-5073053a2f05	0016	orientacijska vaja	orientacijska vaja
00420000-56af-4752-e5a5-c53ff8d0eac7	0017	situacijska vaja	situacijska vaja
00420000-56af-4752-41d9-4aad7473fb6b	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 42250144)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 42249957)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56af-4753-9115-8612583f9295	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROSx/qaw2lqNNlI5XGBs3MkG0z6dmyOYG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56af-4755-47ad-e3a4ee634df7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56af-4755-8399-61b8df61e608	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56af-4755-3184-ac213662a472	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56af-4755-58e5-837c30d5200e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56af-4755-0969-3a828f40063a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56af-4755-40e9-3eaeb56c8af8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56af-4755-4142-644dc21096c3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56af-4755-0259-0001e4b978ed	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56af-4755-3aa9-fe35964c914d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56af-4755-37c2-fb051f8ad5b3	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56af-4755-f370-de36a216a87f	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56af-4755-e34a-ce652b85cb27	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56af-4755-4b3c-77647a9f4ea1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56af-4755-a5c1-85f2a7904724	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56af-4755-958f-5071e90e0fb8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56af-4755-4951-c2bc05bae374	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56af-4755-c6ec-6ba104cf959e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56af-4755-c8e4-1e15698a4951	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56af-4755-3c90-9189351d7148	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56af-4755-44d2-c97ba275846b	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56af-4755-836a-90fbf22a3575	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56af-4755-a1da-8602905baad9	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56af-4755-3f16-250a3dfa7f78	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56af-4755-2de8-80a20770f5fe	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56af-4755-6ea6-11685b46939c	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56af-4755-e21b-d75a3d04290b	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56af-4753-c836-1cd1166910a3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 42250589)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56af-4755-210a-8e7c3df3f5eb	00160000-56af-4755-91a6-6fdf76933b54	\N	00140000-56af-4752-1c39-e74126bbaaa4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56af-4755-ae4a-5e7596171cfe
000e0000-56af-4755-c36e-fce048942f4d	00160000-56af-4755-5404-6d9f1c11e828	\N	00140000-56af-4752-e2b7-ced8b52b9116	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56af-4755-8651-21f667774965
000e0000-56af-4755-a759-366e4641c2dd	\N	\N	00140000-56af-4752-e2b7-ced8b52b9116	00190000-56af-4755-a4df-3d8d20c71099	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-4755-ae4a-5e7596171cfe
000e0000-56af-4755-0edb-fdc940644161	\N	\N	00140000-56af-4752-e2b7-ced8b52b9116	00190000-56af-4755-a4df-3d8d20c71099	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-4755-ae4a-5e7596171cfe
000e0000-56af-4755-df5e-050006f3b440	\N	\N	00140000-56af-4752-e2b7-ced8b52b9116	00190000-56af-4755-a4df-3d8d20c71099	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-6436-9b923607a499	\N	\N	00140000-56af-4752-e2b7-ced8b52b9116	00190000-56af-4755-a4df-3d8d20c71099	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-18dd-a3c9227d706b	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-d0e9-7faf117582ef	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-a9f2-133d4d5a35fa	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-dc98-8608c5301f84	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-7a42-09fe13a98496	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-5539-d69c2a6dffb6	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-b3df-ade8d228a02c	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-e7ee-90ac6e395ffe	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
000e0000-56af-4755-d5a1-fc7e524ae712	\N	\N	00140000-56af-4752-e5a7-a17696240827	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-4755-eb9a-cfd2776f1188
\.


--
-- TOC entry 3170 (class 0 OID 42250308)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 42250237)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56af-4756-defb-14fae532c919	\N	000e0000-56af-4755-c36e-fce048942f4d	3
00200000-56af-4756-fca1-d62af5589eca	\N	000e0000-56af-4755-c36e-fce048942f4d	4
00200000-56af-4756-0753-3cfb91c812fe	\N	000e0000-56af-4755-c36e-fce048942f4d	6
00200000-56af-4756-2831-d2ef48b72d9d	\N	000e0000-56af-4755-c36e-fce048942f4d	5
00200000-56af-4756-a266-0a314816a728	\N	000e0000-56af-4755-c36e-fce048942f4d	7
00200000-56af-4756-dce2-9ec30fe56cdc	\N	000e0000-56af-4755-210a-8e7c3df3f5eb	1
00200000-56af-4756-ed01-7fba3e8ee32f	\N	000e0000-56af-4755-c36e-fce048942f4d	2
00200000-56af-4756-de2c-c9d90382152f	\N	000e0000-56af-4755-c36e-fce048942f4d	1
00200000-56af-4756-94c6-391977eef9e0	\N	000e0000-56af-4755-c36e-fce048942f4d	8
00200000-56af-4756-6709-eb5bc6bcaf94	\N	000e0000-56af-4755-c36e-fce048942f4d	9
\.


--
-- TOC entry 3182 (class 0 OID 42250401)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 42250512)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56af-4752-ead2-a1b43288545f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56af-4752-1492-7f5e6d08284b	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56af-4752-4100-d3f4716eb9d7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56af-4752-15da-4c40c14409db	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56af-4752-3b12-79b7c20ddd57	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56af-4752-d805-fbf38de6932e	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56af-4752-9cd0-7a2fdfb57efb	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56af-4752-57f3-c370b0a9dc09	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56af-4752-8adf-e6b319a8d2e9	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56af-4752-0e3d-1c3abc68c9a6	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56af-4752-c6ce-0fce8ea7e5fa	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56af-4752-6623-85cd39350ed3	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56af-4752-fccd-ac2520dfda64	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56af-4752-0499-df4db3405b78	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56af-4752-0f09-dd929b4e9886	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56af-4752-d61e-187e185ba749	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56af-4752-a874-3405b2ddee0c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56af-4752-5292-d475c095e1d1	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56af-4752-a269-21a45dfb551d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56af-4752-c817-ecb884be4e76	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56af-4752-d341-198235844105	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56af-4752-20fc-9ecf826cc105	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56af-4752-706b-05c7d530382c	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56af-4752-1514-bb868ed2c634	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56af-4752-0b9d-2a3e090ca2c7	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56af-4752-a405-e7e81ebc33bd	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56af-4752-dfdd-a080c9f5d2b0	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56af-4752-a5fb-9cc87f19efce	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 42250893)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 42250862)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 42250905)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 42250474)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56af-4755-d16b-5d0f050313f7	00090000-56af-4755-960b-a9c3bd868032	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-4755-744b-cb358edb645e	00090000-56af-4755-809c-a3e31c6fc022	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-4755-a1cd-6455de24c2b5	00090000-56af-4755-55e9-6c02941aa8aa	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-4755-442a-230f8fa7ee34	00090000-56af-4755-a5b0-54754713cafc	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-4755-a504-55c6b9610133	00090000-56af-4755-2762-b93c0d836c37	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-4755-8dab-fdaad0b80121	00090000-56af-4755-e922-c563e7c6fd5c	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 42250579)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56af-4752-1c39-e74126bbaaa4	01	Drama	drama (SURS 01)
00140000-56af-4752-a1e3-99b8f7e22ad8	02	Opera	opera (SURS 02)
00140000-56af-4752-d25f-6f24ad1a9711	03	Balet	balet (SURS 03)
00140000-56af-4752-d94b-776d3e18e843	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56af-4752-e5a7-a17696240827	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56af-4752-e2b7-ced8b52b9116	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56af-4752-507f-46c09616509d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 42250464)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 42250021)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 42250637)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 42250628)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 42250011)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 42250495)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 42250537)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 42250946)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 42250331)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 42250266)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 42250282)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 42250287)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 42250860)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 42250170)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 42250706)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 42250460)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 42250235)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 42250208)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 42250184)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 42250367)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 42250923)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 42250930)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 42250954)
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
-- TOC entry 2766 (class 2606 OID 42250393)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 42250142)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 42250040)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 42250104)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 42250067)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 42250000)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 42249985)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 42250399)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 42250436)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 42250574)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 42250095)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 42250130)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 42250811)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 42250373)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 42250120)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 42250251)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 42250223)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 42250217)
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
-- TOC entry 2764 (class 2606 OID 42250385)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 42250820)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 42250828)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42250798)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 42250841)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 42250418)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 42250358)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 42250349)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 42250561)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 42250488)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 42250196)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 42249956)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 42250427)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 42249974)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 42249994)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 42250445)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 42250380)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 42250306)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 42249944)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 42249932)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 42249926)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 42250508)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 42250076)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 42250323)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 42250341)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 42250548)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 42250029)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 42250853)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 42250295)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 42250155)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 42249969)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 42250607)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 42250314)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 42250241)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 42250407)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 42250520)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 42250903)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 42250887)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 42250911)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 42250478)
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
-- TOC entry 2833 (class 2606 OID 42250587)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 42250472)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 42250276)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 42250277)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 42250275)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 42250273)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 42250274)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 42250272)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 42250509)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 42250510)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 42250511)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 42250925)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 42250924)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 42250097)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 42250098)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 42250400)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 42250891)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 42250890)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 42250892)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 42250889)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 42250888)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 42250386)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 42250242)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 42250243)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 42250461)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 42250463)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 42250462)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 42250186)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 42250185)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 42250842)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 42250576)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 42250577)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 42250578)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 42250912)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 42250612)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 42250609)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 42250613)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 42250611)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 42250610)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 42250157)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 42250156)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 42250070)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 42250428)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 42250001)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 42250002)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 42250448)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 42250447)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 42250446)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 42250107)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 42250106)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 42250108)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 42250218)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 42249934)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 42250353)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 42250351)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 42250350)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 42250352)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 42249975)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 42249976)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 42250408)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 42250947)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 42250497)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 42250496)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 42250955)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 42250956)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 42250374)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 42250489)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 42250490)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 42250711)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 42250710)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 42250707)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 42250708)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 42250709)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 42250122)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 42250121)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 42250123)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 42250422)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 42250421)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 42250821)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 42250822)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 42250641)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 42250642)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 42250639)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 42250640)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 42250332)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 42250333)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 42250479)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 42250480)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 42250315)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 42250362)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 42250361)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 42250359)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 42250360)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 42250629)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 42250197)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 42250211)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 42250210)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 42250209)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 42250212)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 42250236)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 42250224)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 42250225)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 42250812)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 42250861)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 42250931)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 42250932)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 42250042)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 42250041)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 42250077)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 42250078)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 42250326)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 42250325)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 42250324)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 42250268)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 42250271)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 42250267)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 42250270)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 42250269)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 42250096)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 42250030)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 42250031)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 42250171)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 42250173)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 42250172)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 42250174)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 42250368)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 42250575)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 42250608)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 42250549)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 42250550)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 42250068)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 42250069)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 42250342)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 42250343)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 42250473)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 42249945)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 42250143)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 42250105)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 42249933)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 42250854)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 42250420)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 42250419)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 42250296)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 42250297)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 42250638)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 42250316)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 42250131)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 42250588)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 42250904)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 42250829)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 42250830)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 42250538)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 42250307)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 42249995)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 42251117)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 42251142)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 42251132)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 42251112)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 42251147)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 42251127)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 42251137)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 42251122)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 42251327)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 42251332)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 42251337)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 42251497)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 42251492)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 42251012)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 42251017)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 42251242)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 42251477)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 42251472)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 42251482)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 42251467)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 42251462)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 42251237)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 42251102)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 42251107)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 42251282)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 42251292)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 42251287)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 42251067)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 42251062)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 42251227)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 42251452)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 42251342)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 42251347)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 42251352)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 42251487)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 42251372)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 42251357)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 42251377)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 42251367)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 42251362)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 42251057)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 42251052)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 42250997)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 42250992)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 42251262)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 42250972)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 42250977)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 42251277)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 42251272)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 42251267)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 42251027)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 42251022)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 42251032)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 42251082)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 42250957)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 42251202)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 42251192)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 42251187)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 42251197)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 42250962)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 42250967)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 42251247)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 42251512)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 42251322)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 42251317)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 42251517)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 42251522)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 42251232)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 42251307)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 42251312)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 42251427)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 42251422)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 42251407)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 42251412)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 42251417)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 42251042)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 42251037)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 42251047)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 42251257)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 42251252)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 42251437)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 42251442)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 42251397)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 42251402)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 42251387)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 42251392)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 42251177)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 42251182)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 42251297)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 42251302)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 42251152)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 42251157)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 42251222)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 42251217)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 42251207)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 42251212)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 42251382)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 42251072)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 42251077)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 42251097)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 42251087)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 42251092)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 42251432)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 42251447)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 42251457)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 42251502)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 42251507)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 42250987)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 42250982)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 42251002)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 42251007)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 42251172)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 42251167)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 42251162)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-01 12:54:01 CET

--
-- PostgreSQL database dump complete
--

