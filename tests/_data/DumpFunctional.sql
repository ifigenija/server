--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-29 17:11:36 CET

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
-- TOC entry 185 (class 1259 OID 42075601)
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
-- TOC entry 241 (class 1259 OID 42076219)
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
-- TOC entry 240 (class 1259 OID 42076203)
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
-- TOC entry 184 (class 1259 OID 42075594)
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
-- TOC entry 183 (class 1259 OID 42075592)
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
-- TOC entry 231 (class 1259 OID 42076080)
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
-- TOC entry 234 (class 1259 OID 42076110)
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
-- TOC entry 255 (class 1259 OID 42076522)
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
-- TOC entry 212 (class 1259 OID 42075916)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 42075841)
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
-- TOC entry 206 (class 1259 OID 42075867)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 42075872)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 42076444)
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
-- TOC entry 196 (class 1259 OID 42075747)
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
-- TOC entry 242 (class 1259 OID 42076232)
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
-- TOC entry 227 (class 1259 OID 42076038)
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
-- TOC entry 202 (class 1259 OID 42075815)
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
-- TOC entry 199 (class 1259 OID 42075787)
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
-- TOC entry 197 (class 1259 OID 42075764)
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
-- TOC entry 216 (class 1259 OID 42075952)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 42076502)
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
-- TOC entry 254 (class 1259 OID 42076515)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 42076537)
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
-- TOC entry 220 (class 1259 OID 42075976)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 42075721)
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
-- TOC entry 187 (class 1259 OID 42075621)
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
-- TOC entry 191 (class 1259 OID 42075688)
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
-- TOC entry 188 (class 1259 OID 42075632)
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
-- TOC entry 180 (class 1259 OID 42075566)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 42075585)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 42075983)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 42076018)
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
-- TOC entry 237 (class 1259 OID 42076151)
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
-- TOC entry 190 (class 1259 OID 42075668)
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
-- TOC entry 193 (class 1259 OID 42075713)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 42076388)
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
-- TOC entry 217 (class 1259 OID 42075958)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 42075698)
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
-- TOC entry 204 (class 1259 OID 42075833)
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
-- TOC entry 200 (class 1259 OID 42075802)
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
-- TOC entry 201 (class 1259 OID 42075808)
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
-- TOC entry 219 (class 1259 OID 42075970)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 42076402)
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
-- TOC entry 246 (class 1259 OID 42076412)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 42076301)
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
-- TOC entry 247 (class 1259 OID 42076420)
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
-- TOC entry 223 (class 1259 OID 42075998)
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
-- TOC entry 215 (class 1259 OID 42075943)
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
-- TOC entry 214 (class 1259 OID 42075933)
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
-- TOC entry 236 (class 1259 OID 42076140)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 42076070)
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
-- TOC entry 198 (class 1259 OID 42075776)
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
-- TOC entry 177 (class 1259 OID 42075537)
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
-- TOC entry 176 (class 1259 OID 42075535)
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
-- TOC entry 224 (class 1259 OID 42076012)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 42075575)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 42075559)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 42076026)
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
-- TOC entry 218 (class 1259 OID 42075964)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 42075887)
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
-- TOC entry 175 (class 1259 OID 42075524)
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
-- TOC entry 174 (class 1259 OID 42075516)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 42075511)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 42076087)
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
-- TOC entry 189 (class 1259 OID 42075660)
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
-- TOC entry 211 (class 1259 OID 42075906)
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
-- TOC entry 213 (class 1259 OID 42075923)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 42076128)
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
-- TOC entry 186 (class 1259 OID 42075611)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 42076432)
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
-- TOC entry 208 (class 1259 OID 42075877)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 42075733)
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
-- TOC entry 178 (class 1259 OID 42075546)
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
-- TOC entry 239 (class 1259 OID 42076178)
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
-- TOC entry 210 (class 1259 OID 42075897)
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
-- TOC entry 203 (class 1259 OID 42075826)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 42075990)
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
-- TOC entry 233 (class 1259 OID 42076101)
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
-- TOC entry 251 (class 1259 OID 42076482)
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
-- TOC entry 250 (class 1259 OID 42076451)
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
-- TOC entry 252 (class 1259 OID 42076494)
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
-- TOC entry 229 (class 1259 OID 42076063)
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
-- TOC entry 238 (class 1259 OID 42076168)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 42076053)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 42075597)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 42075540)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 42075601)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56ab-8f34-1a23-a7b5faeba7af	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56ab-8f34-6e7d-36171646f67d	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56ab-8f34-4a4f-f149ec567e91	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 42076219)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56ab-8f35-91a9-fdf1d757c190	000d0000-56ab-8f35-922c-e211f95aa9a3	\N	00090000-56ab-8f35-ab2a-0bd8bcd95c9f	000b0000-56ab-8f35-7df4-37677b471230	0001	f	\N	\N	\N	3	t	t	t
000c0000-56ab-8f35-d44c-326305fee55a	000d0000-56ab-8f35-d143-077c65fc5cb1	00100000-56ab-8f35-5e4a-f50cdafbc391	00090000-56ab-8f35-2811-93f1482f70c4	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56ab-8f35-501c-a3867c2f67a2	000d0000-56ab-8f35-47dd-b51cd6bcf681	00100000-56ab-8f35-e3e4-03a0ccd612a8	00090000-56ab-8f35-b85a-465c09e86446	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56ab-8f35-279c-c6700467d131	000d0000-56ab-8f35-a1fe-70da71591b8c	\N	00090000-56ab-8f35-d238-5f8136169859	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56ab-8f35-75e2-c84753e35691	000d0000-56ab-8f35-1100-f9a36b9e4132	\N	00090000-56ab-8f35-831f-ec9b84a703e3	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56ab-8f35-fcd4-24f93d6a8712	000d0000-56ab-8f35-1c77-24243e42e8a7	\N	00090000-56ab-8f35-e997-f1ab81910b60	000b0000-56ab-8f35-f92e-0512f5568a5f	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56ab-8f35-971b-03ff96c4a63b	000d0000-56ab-8f35-650d-648e179c23e0	00100000-56ab-8f35-7c08-5db77be5ac7c	00090000-56ab-8f35-ba2a-e6dbcd404bc5	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56ab-8f35-e1ad-40d6900097dd	000d0000-56ab-8f35-f3e8-d252c9f14a03	\N	00090000-56ab-8f35-8622-b3d327ded8a2	000b0000-56ab-8f35-d7f9-0d9fc2e87180	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56ab-8f35-cc39-f49972cc7002	000d0000-56ab-8f35-650d-648e179c23e0	00100000-56ab-8f35-fc92-23255c72c6b9	00090000-56ab-8f35-a408-450b69ef9d86	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56ab-8f35-9f9c-4db2ce351dae	000d0000-56ab-8f35-650d-648e179c23e0	00100000-56ab-8f35-71f7-a647100200f9	00090000-56ab-8f35-b5ca-afac559968b8	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56ab-8f35-4d7c-b13a23bb3516	000d0000-56ab-8f35-650d-648e179c23e0	00100000-56ab-8f35-aead-5ce75c2ee806	00090000-56ab-8f35-5872-71df2bd775c6	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56ab-8f35-fedd-1e4eb7e7f560	000d0000-56ab-8f35-eb6f-66fe70566057	00100000-56ab-8f35-5e4a-f50cdafbc391	00090000-56ab-8f35-2811-93f1482f70c4	000b0000-56ab-8f35-f5b8-28804c77d5f6	0012	t	\N	\N	\N	2	t	t	t
000c0000-56ab-8f35-bb9f-d96fea387b3b	000d0000-56ab-8f35-d421-76a7bc88ed42	\N	00090000-56ab-8f35-8622-b3d327ded8a2	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-9eb9-94d534b77915	000d0000-56ab-8f35-d421-76a7bc88ed42	\N	00090000-56ab-8f35-0cbe-0252a52a58ee	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56ab-8f35-f074-d36233aa0c5e	000d0000-56ab-8f35-b334-9cd223ec6d53	00100000-56ab-8f35-e3e4-03a0ccd612a8	00090000-56ab-8f35-b85a-465c09e86446	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-5f47-26521a045657	000d0000-56ab-8f35-b334-9cd223ec6d53	\N	00090000-56ab-8f35-0cbe-0252a52a58ee	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56ab-8f35-dfde-e5eb4587418d	000d0000-56ab-8f35-554a-ed2e7730481f	\N	00090000-56ab-8f35-0cbe-0252a52a58ee	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-5424-0ffd1495af27	000d0000-56ab-8f35-554a-ed2e7730481f	\N	00090000-56ab-8f35-8622-b3d327ded8a2	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56ab-8f35-9ad1-1282aff074a6	000d0000-56ab-8f35-5a78-d2698b42fb97	00100000-56ab-8f35-7c08-5db77be5ac7c	00090000-56ab-8f35-ba2a-e6dbcd404bc5	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-5d12-1a5e12b8ee54	000d0000-56ab-8f35-5a78-d2698b42fb97	\N	00090000-56ab-8f35-0cbe-0252a52a58ee	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56ab-8f35-6e2e-38290fad78f5	000d0000-56ab-8f35-60da-96508b7cb25a	\N	00090000-56ab-8f35-0cbe-0252a52a58ee	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-abbe-27e715fbf0e2	000d0000-56ab-8f35-60da-96508b7cb25a	00100000-56ab-8f35-7c08-5db77be5ac7c	00090000-56ab-8f35-ba2a-e6dbcd404bc5	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56ab-8f35-7b28-64e27f3e376c	000d0000-56ab-8f35-e75b-6deaacec200f	\N	00090000-56ab-8f35-0cbe-0252a52a58ee	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-1fb9-99a8913eb3ba	000d0000-56ab-8f35-af56-9738c887912d	\N	00090000-56ab-8f35-8622-b3d327ded8a2	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-a25d-e5949b9dee42	000d0000-56ab-8f35-cfac-ddfa070d6cb5	\N	00090000-56ab-8f35-8622-b3d327ded8a2	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-4215-581705536d91	000d0000-56ab-8f35-cfac-ddfa070d6cb5	00100000-56ab-8f35-e3e4-03a0ccd612a8	00090000-56ab-8f35-b85a-465c09e86446	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56ab-8f35-923e-f9479332009d	000d0000-56ab-8f35-2c44-25e8e0abf805	\N	00090000-56ab-8f35-ffcb-acd156e46cdd	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56ab-8f35-bb6b-15d4f3a92b24	000d0000-56ab-8f35-2c44-25e8e0abf805	\N	00090000-56ab-8f35-74d6-cdb5c2d93820	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56ab-8f35-fb27-113bda032a25	000d0000-56ab-8f35-33bc-dbabf735fb35	\N	00090000-56ab-8f35-8622-b3d327ded8a2	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56ab-8f35-99d6-ddc51c874066	000d0000-56ab-8f35-33bc-dbabf735fb35	00100000-56ab-8f35-e3e4-03a0ccd612a8	00090000-56ab-8f35-b85a-465c09e86446	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56ab-8f35-50ce-3ef3cd428644	000d0000-56ab-8f35-33bc-dbabf735fb35	\N	00090000-56ab-8f35-74d6-cdb5c2d93820	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56ab-8f35-d869-570dd5177826	000d0000-56ab-8f35-33bc-dbabf735fb35	\N	00090000-56ab-8f35-ffcb-acd156e46cdd	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56ab-8f35-293c-5953830af45a	000d0000-56ab-8f35-6cd0-67a3e2e5d391	\N	00090000-56ab-8f35-8622-b3d327ded8a2	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56ab-8f35-584e-8d2e03355a79	000d0000-56ab-8f35-1ea8-5c67700f139a	00100000-56ab-8f35-e3e4-03a0ccd612a8	00090000-56ab-8f35-b85a-465c09e86446	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56ab-8f35-f293-574ed2971ddc	000d0000-56ab-8f35-1ea8-5c67700f139a	\N	00090000-56ab-8f35-0cbe-0252a52a58ee	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 42076203)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 42075594)
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
-- TOC entry 3191 (class 0 OID 42076080)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56ab-8f35-f118-7c8c14e70aa0	00160000-56ab-8f34-5cf1-7ab80d342fbd	00090000-56ab-8f35-74d6-cdb5c2d93820	aizv	10	t
003d0000-56ab-8f35-4c03-5b73bb2f3697	00160000-56ab-8f34-5cf1-7ab80d342fbd	00090000-56ab-8f35-19c2-56b08fd001e1	apri	14	t
003d0000-56ab-8f35-0778-76db6c01a785	00160000-56ab-8f34-224a-0bf12f8ac2cf	00090000-56ab-8f35-ffcb-acd156e46cdd	aizv	11	t
003d0000-56ab-8f35-385e-e9eada6a3e7a	00160000-56ab-8f34-3017-4654e7d15c79	00090000-56ab-8f35-6826-af68506407a0	aizv	12	t
003d0000-56ab-8f35-85bc-793ce4decff9	00160000-56ab-8f34-5cf1-7ab80d342fbd	00090000-56ab-8f35-0cbe-0252a52a58ee	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 42076110)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56ab-8f34-5cf1-7ab80d342fbd	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56ab-8f34-224a-0bf12f8ac2cf	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56ab-8f34-3017-4654e7d15c79	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 42076522)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 42075916)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 42075841)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56ab-8f35-6e64-9685442bd9dc	\N	\N	\N	\N	00440000-56ab-8f35-332f-63a86977d466	00220000-56ab-8f34-4800-5eeb4ed72510	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56ab-8f35-cad8-e2c2041374f1	\N	\N	\N	\N	00440000-56ab-8f35-57c2-282796986b85	00220000-56ab-8f34-dfcf-9616735c9980	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56ab-8f35-c0f5-0019f30680e6	\N	\N	\N	001e0000-56ab-8f35-85d8-74d887381a34	\N	00220000-56ab-8f34-4800-5eeb4ed72510	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56ab-8f35-9fd6-fa1ca1196943	\N	\N	\N	001e0000-56ab-8f35-93f4-bf5e5be5398d	\N	00220000-56ab-8f34-dfcf-9616735c9980	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56ab-8f35-1432-f15a4fcd4271	\N	00200000-56ab-8f35-041d-8a7e2b3435ed	\N	\N	\N	00220000-56ab-8f34-b944-69c2db02f6c7	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56ab-8f35-c8ea-1041400f3375	\N	00200000-56ab-8f35-a084-0d2d51cbd611	\N	\N	\N	00220000-56ab-8f34-b944-69c2db02f6c7	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56ab-8f35-aac7-e6c46635d247	\N	00200000-56ab-8f35-b15f-5dd7e0d2baed	\N	\N	\N	00220000-56ab-8f34-dfcf-9616735c9980	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56ab-8f35-b36a-4a6986ab378d	\N	00200000-56ab-8f35-81f9-853640951013	\N	\N	\N	00220000-56ab-8f34-7332-fbab713ea765	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56ab-8f35-f2ab-e1a93bfc3af8	\N	00200000-56ab-8f35-b847-f7bf59b590c8	\N	\N	\N	00220000-56ab-8f34-de7c-6d9c907f526b	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56ab-8f35-b92e-8f6c9a04167b	\N	00200000-56ab-8f35-c291-8e278a8a666d	\N	\N	\N	00220000-56ab-8f34-dfcf-9616735c9980	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56ab-8f35-7b2c-db9cee57f84f	\N	00200000-56ab-8f35-8285-e1c40938ed05	\N	\N	\N	00220000-56ab-8f34-de7c-6d9c907f526b	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56ab-8f35-320e-c83a34a0a214	\N	00200000-56ab-8f35-5ef8-47f464e301ed	\N	\N	\N	00220000-56ab-8f34-de7c-6d9c907f526b	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56ab-8f35-153c-bdce3fcd6e98	\N	00200000-56ab-8f35-8075-0ca313a195c3	\N	\N	\N	00220000-56ab-8f34-b944-69c2db02f6c7	001f0000-56ab-8f34-9d2d-a7b360e3e1e7	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56ab-8f35-eeb2-e4c43babe163	\N	00200000-56ab-8f35-3d94-271d7aa53bd9	\N	\N	\N	00220000-56ab-8f34-b944-69c2db02f6c7	001f0000-56ab-8f34-9d2d-a7b360e3e1e7	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56ab-8f35-61d3-89578010c122	\N	\N	001c0000-56ab-8f35-196a-64cbc745e2b3	\N	\N	\N	001f0000-56ab-8f34-92aa-680b3f7309b8	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56ab-8f35-970d-7421c446f18b	001b0000-56ab-8f35-e390-301315d23b5b	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-9d2d-a7b360e3e1e7	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56ab-8f35-1c15-4d6381766880	001b0000-56ab-8f35-429a-745855cc3df6	\N	\N	\N	\N	00220000-56ab-8f34-dfcf-9616735c9980	001f0000-56ab-8f34-9d2d-a7b360e3e1e7	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56ab-8f35-58d4-58641b3cac1e	001b0000-56ab-8f35-a5a3-7706d75fa0c7	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-9d2d-a7b360e3e1e7	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56ab-8f35-dfbc-0c9f20f9efb3	001b0000-56ab-8f35-8a39-05293d1a05f5	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56ab-8f35-ceaa-03aea4549626	001b0000-56ab-8f35-c341-398148cf5b47	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-92aa-680b3f7309b8	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56ab-8f35-fb02-0a3849aaad0b	001b0000-56ab-8f35-ac71-f85e2b26c756	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-92aa-680b3f7309b8	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56ab-8f35-c9b4-f0284722379a	001b0000-56ab-8f35-99e9-0334bdb5b080	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-9d2d-a7b360e3e1e7	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56ab-8f35-b0c9-994f23a0e2b4	001b0000-56ab-8f35-a228-105ba9fd1b7e	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-92aa-680b3f7309b8	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56ab-8f35-d022-e600d4f5c15f	001b0000-56ab-8f35-321d-6957f7af6090	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56ab-8f35-6638-16014b4443e5	001b0000-56ab-8f35-b846-80bb7465285f	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56ab-8f35-ce9d-a9c34cb44598	001b0000-56ab-8f35-717a-369b2f7d05cf	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-92aa-680b3f7309b8	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56ab-8f35-ae78-0de68b6e6eb0	001b0000-56ab-8f35-2c00-a8ce8c27e8be	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-87ad-8d72d713c530	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56ab-8f35-b234-297388ccad22	001b0000-56ab-8f35-f105-9b7bdd23f33e	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-87ad-8d72d713c530	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56ab-8f35-1e3a-3433ff6aafc1	001b0000-56ab-8f35-9c1a-16dacfaf2a7e	\N	\N	\N	\N	00220000-56ab-8f34-4800-5eeb4ed72510	001f0000-56ab-8f34-92aa-680b3f7309b8	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56ab-8f35-61d0-78a52f9c4261	001b0000-56ab-8f35-ef89-1e62dd5eada0	\N	\N	\N	\N	\N	001f0000-56ab-8f34-92aa-680b3f7309b8	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56ab-8f35-196a-64cbc745e2b3
00180000-56ab-8f35-5482-661b4c289901	001b0000-56ab-8f35-b578-aa9e9c1b7941	\N	\N	\N	\N	\N	001f0000-56ab-8f34-92aa-680b3f7309b8	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56ab-8f35-196a-64cbc745e2b3
\.


--
-- TOC entry 3166 (class 0 OID 42075867)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56ab-8f35-85d8-74d887381a34
001e0000-56ab-8f35-93f4-bf5e5be5398d
\.


--
-- TOC entry 3167 (class 0 OID 42075872)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56ab-8f35-332f-63a86977d466
00440000-56ab-8f35-57c2-282796986b85
\.


--
-- TOC entry 3209 (class 0 OID 42076444)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 42075747)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56ab-8f32-c455-05a2a72193e2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56ab-8f32-e302-4e6045300b49	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56ab-8f32-d8b1-c7565d29e529	AL	ALB	008	Albania 	Albanija	\N
00040000-56ab-8f32-4f67-9e463ba3118e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56ab-8f32-f2b0-de4fb7566255	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56ab-8f32-60f9-685c4462032b	AD	AND	020	Andorra 	Andora	\N
00040000-56ab-8f32-68eb-eb318a8409aa	AO	AGO	024	Angola 	Angola	\N
00040000-56ab-8f32-9a8d-57cdbcb7fc70	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56ab-8f32-4417-9f36873cc757	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56ab-8f32-afd1-fe1347c04d3a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-8f32-30a4-460bf4379d45	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56ab-8f32-f98f-b6400b68ff98	AM	ARM	051	Armenia 	Armenija	\N
00040000-56ab-8f32-d2cd-173531319e66	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56ab-8f32-b003-68f17ed4d4d9	AU	AUS	036	Australia 	Avstralija	\N
00040000-56ab-8f32-5eb3-ba16698eb14e	AT	AUT	040	Austria 	Avstrija	\N
00040000-56ab-8f32-41c5-90fdb0912427	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56ab-8f32-a853-b01c63439707	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56ab-8f32-bea8-582ed34f4ef2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56ab-8f32-5ada-993bcb74d277	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56ab-8f32-8c01-dc221c61437e	BB	BRB	052	Barbados 	Barbados	\N
00040000-56ab-8f32-1ddd-461edbe93958	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56ab-8f32-8c7f-e400a1f0a584	BE	BEL	056	Belgium 	Belgija	\N
00040000-56ab-8f32-2c23-67e4ada164a7	BZ	BLZ	084	Belize 	Belize	\N
00040000-56ab-8f32-973b-a99df7e1048e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56ab-8f32-288d-ace9a9485df9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56ab-8f32-ac0b-c2a4f38aabf8	BT	BTN	064	Bhutan 	Butan	\N
00040000-56ab-8f32-10da-a2bb93d9d3a2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56ab-8f32-885f-5a8498f22432	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56ab-8f32-425c-2d12e3f27271	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56ab-8f32-e678-469f315f48e8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56ab-8f32-7c1d-06c4bed92ba2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56ab-8f32-7342-f775b48ce0e8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56ab-8f32-6583-ba9c92663c0f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56ab-8f32-07ca-857d393e910c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56ab-8f32-9dd7-568406f208f5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56ab-8f32-e321-9cb18899a2e8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56ab-8f32-a2f3-9f0ff629b0bc	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56ab-8f32-c95a-0e00e2d1abd3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56ab-8f32-011f-ab4eab12cda7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56ab-8f32-66f0-6f038a03ad07	CA	CAN	124	Canada 	Kanada	\N
00040000-56ab-8f32-3b25-5a13339fa728	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56ab-8f32-cee7-4ea3b244ed43	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56ab-8f32-c8dd-2d6575d0cb01	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56ab-8f32-0877-c6e6d4d79b56	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56ab-8f32-2eb9-5997fa854c26	CL	CHL	152	Chile 	Čile	\N
00040000-56ab-8f32-48c4-7f8c5910d41c	CN	CHN	156	China 	Kitajska	\N
00040000-56ab-8f32-454a-4e6aab8e42ff	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56ab-8f32-6a35-34ec49ec4596	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56ab-8f32-a96d-fbaea7bc5d88	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56ab-8f32-982b-3fa31e66ac91	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56ab-8f32-232e-c8de4b55cf20	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56ab-8f32-12da-c3c327a71c69	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56ab-8f32-e329-852e6a10f42b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56ab-8f32-b2d5-61ee590c30db	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56ab-8f32-4466-757b53a8213e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56ab-8f32-b98d-40028fa24e77	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56ab-8f32-0af0-3d398076bb67	CU	CUB	192	Cuba 	Kuba	\N
00040000-56ab-8f32-53b2-39ea5f4cee3b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56ab-8f32-880e-ead9cf9b22c1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56ab-8f32-bbfc-03cbbedb2dd4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56ab-8f32-fd99-dae907b0c667	DK	DNK	208	Denmark 	Danska	\N
00040000-56ab-8f32-9ec1-36a40fe6546f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56ab-8f32-338a-369e896f7f48	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-8f32-c648-c745cff2cc64	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56ab-8f32-e206-3d7c67281a3a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56ab-8f32-ccc0-c6dc942056df	EG	EGY	818	Egypt 	Egipt	\N
00040000-56ab-8f32-3b9d-dda93a0f546a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56ab-8f32-2ded-b4941fedbb95	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56ab-8f32-94c9-b652628107c4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56ab-8f32-fe20-e99d1f0b0bdc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56ab-8f32-79b5-e66133913ace	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56ab-8f32-a389-99931515c51c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56ab-8f32-b361-13d9571c3e9a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56ab-8f32-c190-921300b34446	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56ab-8f32-db6c-0d3f1a7ce228	FI	FIN	246	Finland 	Finska	\N
00040000-56ab-8f32-afc5-993c285e5c9c	FR	FRA	250	France 	Francija	\N
00040000-56ab-8f32-a5e0-cb800ffdb582	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56ab-8f32-250d-04beea0cf6ae	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56ab-8f32-6666-1c24a4395b62	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56ab-8f32-c5de-9adbb107d503	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56ab-8f32-d70f-4d203e63bb39	GA	GAB	266	Gabon 	Gabon	\N
00040000-56ab-8f32-b5b4-6bafb4ea0db3	GM	GMB	270	Gambia 	Gambija	\N
00040000-56ab-8f32-a462-70b45a9967a1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56ab-8f32-487c-b6dc9111ba02	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56ab-8f32-a012-a7cebbe35e30	GH	GHA	288	Ghana 	Gana	\N
00040000-56ab-8f32-cd16-9cc5be0ed01f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56ab-8f32-2c83-791c5fb8105d	GR	GRC	300	Greece 	Grčija	\N
00040000-56ab-8f32-7b7f-fffcfcaa5391	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56ab-8f32-750f-5e6fb4849f10	GD	GRD	308	Grenada 	Grenada	\N
00040000-56ab-8f32-5264-ae1821a77a49	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56ab-8f32-32cc-28b5150c577a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56ab-8f32-6ec0-3b32c709196c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56ab-8f32-985c-a61c1853deca	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56ab-8f32-8d03-42e79b43af5e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56ab-8f32-e0b8-5a32e7ea256c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56ab-8f32-3b59-99d401cb3b7e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56ab-8f32-2e3a-9a13f909ef80	HT	HTI	332	Haiti 	Haiti	\N
00040000-56ab-8f32-90d4-2741f1f7749e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56ab-8f32-5a73-e03eb93734b2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56ab-8f32-5d68-0f5052348e74	HN	HND	340	Honduras 	Honduras	\N
00040000-56ab-8f32-a4a7-40578990cbaf	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56ab-8f32-4579-a6eff5c75771	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56ab-8f32-93a9-3ac64f210881	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56ab-8f32-da5b-7a4c50bf5c82	IN	IND	356	India 	Indija	\N
00040000-56ab-8f32-e1d8-fcd297637e7b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56ab-8f32-5c7d-bff2dd60c08c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56ab-8f32-2170-56b43631188a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56ab-8f32-d943-7a8064317020	IE	IRL	372	Ireland 	Irska	\N
00040000-56ab-8f32-cf74-3fc0523fe00b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56ab-8f32-ddd7-ec5339164eb8	IL	ISR	376	Israel 	Izrael	\N
00040000-56ab-8f32-26ee-f57841baf363	IT	ITA	380	Italy 	Italija	\N
00040000-56ab-8f32-3aa3-92dfe1d0b4e9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56ab-8f32-7215-1fe86efe5808	JP	JPN	392	Japan 	Japonska	\N
00040000-56ab-8f32-e33e-1903eb2aa5af	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56ab-8f32-639b-b5e6aa66df51	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56ab-8f32-749c-5789400cb62b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56ab-8f32-e386-29af5df47b40	KE	KEN	404	Kenya 	Kenija	\N
00040000-56ab-8f32-12b6-9e5ca07997ce	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56ab-8f32-ea2d-f6ab18e392d2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56ab-8f32-95f1-6682f29056e9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56ab-8f32-7bea-a21692783a6a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56ab-8f32-4b95-dc7b93aabbec	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56ab-8f32-40c0-d8b65894938e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56ab-8f32-18f3-7ad880edd13d	LV	LVA	428	Latvia 	Latvija	\N
00040000-56ab-8f32-b0f6-9ef3c3038cd0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56ab-8f32-96a7-e49366626930	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56ab-8f32-cb5b-168b812c4e0d	LR	LBR	430	Liberia 	Liberija	\N
00040000-56ab-8f32-578d-c3f6215ce3a4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56ab-8f32-5ad3-437f687b138a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56ab-8f32-bff6-119a7d82d520	LT	LTU	440	Lithuania 	Litva	\N
00040000-56ab-8f32-0217-fa31e48789e8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56ab-8f32-b692-ed83a3921292	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56ab-8f32-a67e-4d123e65e582	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56ab-8f32-436d-25b99c8ecaf9	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56ab-8f32-94ac-856fca6e81cf	MW	MWI	454	Malawi 	Malavi	\N
00040000-56ab-8f32-d2a9-4e82491db444	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56ab-8f32-52e5-e42117c1ba34	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56ab-8f32-e6a4-979d65e3ff0a	ML	MLI	466	Mali 	Mali	\N
00040000-56ab-8f32-cf46-9fa1241d036e	MT	MLT	470	Malta 	Malta	\N
00040000-56ab-8f32-3273-9ee8603bd30a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56ab-8f32-c29a-0f7ca4624196	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56ab-8f32-b0b4-c2158b8418e7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56ab-8f32-ec85-55f0da92e841	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56ab-8f32-1566-9273d706ac46	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56ab-8f32-24b1-889475d8f04c	MX	MEX	484	Mexico 	Mehika	\N
00040000-56ab-8f32-9181-013c6678048a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56ab-8f32-bbb6-445581393845	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56ab-8f32-d854-49d11e7a38c8	MC	MCO	492	Monaco 	Monako	\N
00040000-56ab-8f32-b1c5-93cf724e4dd2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56ab-8f32-1e17-6cd94566f975	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56ab-8f32-1c7c-11bd693bdf16	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56ab-8f32-fff4-8a65717b2fa0	MA	MAR	504	Morocco 	Maroko	\N
00040000-56ab-8f32-8234-32666d215486	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56ab-8f32-2409-55da23bc4934	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56ab-8f32-524d-a882173d38bd	NA	NAM	516	Namibia 	Namibija	\N
00040000-56ab-8f32-f946-506c8baa9b75	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56ab-8f32-0419-2cce659c2b71	NP	NPL	524	Nepal 	Nepal	\N
00040000-56ab-8f32-38e7-43ba9fbc0f6e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56ab-8f32-b2d6-3340cb59a22e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56ab-8f32-b4d8-84eeb439e7b2	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56ab-8f32-13ae-afb3e851ac93	NE	NER	562	Niger 	Niger 	\N
00040000-56ab-8f32-f0ad-31ace4f8abf6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56ab-8f32-35ae-0cdaf9410169	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56ab-8f32-4dde-cf8012fe7c06	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56ab-8f32-3fde-13e95b29fc24	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56ab-8f32-8bda-e9ff7f76b7a2	NO	NOR	578	Norway 	Norveška	\N
00040000-56ab-8f32-2c2e-851039c2bc13	OM	OMN	512	Oman 	Oman	\N
00040000-56ab-8f32-7b91-011200569001	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56ab-8f32-9d12-fd1de7d4c528	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56ab-8f32-97be-ea567cc2ed71	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56ab-8f32-e59c-0befa10ff1c8	PA	PAN	591	Panama 	Panama	\N
00040000-56ab-8f32-8c08-b0c4b9ffd8f7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56ab-8f32-3cff-076c78bad85a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56ab-8f32-3059-ff24f64f07b3	PE	PER	604	Peru 	Peru	\N
00040000-56ab-8f32-47b9-ff7644fe6108	PH	PHL	608	Philippines 	Filipini	\N
00040000-56ab-8f32-1066-b69ff482fd75	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56ab-8f32-095e-0b784db7827a	PL	POL	616	Poland 	Poljska	\N
00040000-56ab-8f32-0da8-202182d92def	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56ab-8f32-2f15-a08556434990	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56ab-8f32-5c2e-a14501651715	QA	QAT	634	Qatar 	Katar	\N
00040000-56ab-8f32-3258-32a677feb594	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56ab-8f32-960d-90036d937a85	RO	ROU	642	Romania 	Romunija	\N
00040000-56ab-8f32-ae6c-5387ddc3323a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56ab-8f32-c593-dc3fae224080	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56ab-8f32-b1a5-c25a5f384382	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56ab-8f32-b8d9-652036f81a79	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56ab-8f32-0286-e8a90819d615	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56ab-8f32-a5e1-c06fcaa30021	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56ab-8f32-903a-8ee88b2c7c8b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56ab-8f32-d224-dd6a021ec436	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56ab-8f32-8acc-0281bdee831f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56ab-8f32-6322-13b56ec7f78b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56ab-8f32-1cf3-10289684b008	SM	SMR	674	San Marino 	San Marino	\N
00040000-56ab-8f32-512c-2da496d6dee3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56ab-8f32-1be0-237c8f56d424	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56ab-8f32-1231-165f9e93d8b2	SN	SEN	686	Senegal 	Senegal	\N
00040000-56ab-8f32-f609-dfec6a435c20	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56ab-8f32-a7f0-2e5545edb21b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56ab-8f32-04f4-e6e50878ba36	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56ab-8f32-6b06-aa1b06782d7c	SG	SGP	702	Singapore 	Singapur	\N
00040000-56ab-8f32-8a80-88d47cdeb47c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56ab-8f32-d8b4-9ae9e6399065	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56ab-8f32-0640-8976702f7284	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56ab-8f32-d781-37c8e927091a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56ab-8f32-83c4-efb3dd1eecfb	SO	SOM	706	Somalia 	Somalija	\N
00040000-56ab-8f32-fbc2-6c3bb6f830ea	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56ab-8f32-0bec-992e871660c9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56ab-8f32-96a6-a238da2c06a3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56ab-8f32-9c8f-715e7bec445f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56ab-8f32-0070-8cbb0aeb6acc	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56ab-8f32-9721-ef857ca2a317	SD	SDN	729	Sudan 	Sudan	\N
00040000-56ab-8f32-ab97-5e05b20b35aa	SR	SUR	740	Suriname 	Surinam	\N
00040000-56ab-8f32-6ea8-7040e4b7c572	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56ab-8f32-e545-ceedadf6670f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56ab-8f32-5831-07939a230428	SE	SWE	752	Sweden 	Švedska	\N
00040000-56ab-8f32-7acc-1eb09e006845	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56ab-8f32-3801-8e145788ee8f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56ab-8f32-989b-bcce86ffd068	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56ab-8f32-bac0-ddd6131ee6e6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56ab-8f32-7fa5-355e0d450100	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56ab-8f32-6f7b-24f4faa2b41a	TH	THA	764	Thailand 	Tajska	\N
00040000-56ab-8f32-3ade-fcf61b4762a3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56ab-8f32-0019-53444dd62110	TG	TGO	768	Togo 	Togo	\N
00040000-56ab-8f32-584b-d33d44f63e8f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56ab-8f32-65f8-fd29078f6ea8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56ab-8f32-dafb-68634827d480	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56ab-8f32-df36-25bb0f5fbf72	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56ab-8f32-9a94-906c0dd6e4cc	TR	TUR	792	Turkey 	Turčija	\N
00040000-56ab-8f32-660f-b5c53a344710	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56ab-8f32-5063-6fd4eea229bc	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-8f32-e182-fe50b18e72d6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56ab-8f32-ac8a-b69fa33bb166	UG	UGA	800	Uganda 	Uganda	\N
00040000-56ab-8f32-2d8e-07ab4bbc4cfd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56ab-8f32-2929-f7b50f7cccf6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56ab-8f32-b842-09400940ada9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56ab-8f32-473b-fa77a741b0d8	US	USA	840	United States 	Združene države Amerike	\N
00040000-56ab-8f32-4f0b-a54a2066b892	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56ab-8f32-a735-bf8b90d789e5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56ab-8f32-ec67-55f98ca323ec	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56ab-8f32-3b08-fcfe6eae3c92	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56ab-8f32-c82a-c1d577456503	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56ab-8f32-39df-cea6e0eb8da6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56ab-8f32-2a3f-7ced12a0b0f5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-8f32-674a-f8a194397af7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56ab-8f32-4a0c-508ff685e562	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56ab-8f32-9a80-cddb9723b830	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56ab-8f32-5472-04a8329a4088	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56ab-8f32-6381-bf1a30cbfe6c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56ab-8f32-cfc8-8bb568211eee	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 42076232)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56ab-8f35-2353-ced6ae394b8b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56ab-8f35-73d1-7bcdfb31c901	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-8f35-d850-5045b871c264	000e0000-56ab-8f35-1644-2519393eecb8	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-8f31-bc65-940feacd6782	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-8f35-5315-dbebd3e391dd	000e0000-56ab-8f35-0ea5-f6884c9a9416	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-8f31-359a-11e8701d28e2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-8f35-635c-abd0b3e28170	000e0000-56ab-8f35-7182-958b0010db2b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-8f31-bc65-940feacd6782	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 42076038)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56ab-8f35-709d-a8c41faf2ba2	000e0000-56ab-8f35-0ea5-f6884c9a9416	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56ab-8f32-cce7-25e6718ff41f
000d0000-56ab-8f35-e266-ed514127adad	000e0000-56ab-8f35-5a70-e7c50852e07e	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-8f32-f104-d0d55a46c453
000d0000-56ab-8f35-19a5-930dee1e8b32	000e0000-56ab-8f35-5a70-e7c50852e07e	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-922c-e211f95aa9a3	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-91a9-fdf1d757c190	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-8f32-f104-d0d55a46c453
000d0000-56ab-8f35-d143-077c65fc5cb1	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-d44c-326305fee55a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-47dd-b51cd6bcf681	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-501c-a3867c2f67a2	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56ab-8f32-417d-c5f7936fb759
000d0000-56ab-8f35-a1fe-70da71591b8c	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-279c-c6700467d131	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56ab-8f32-cce7-25e6718ff41f
000d0000-56ab-8f35-1100-f9a36b9e4132	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-75e2-c84753e35691	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56ab-8f32-cce7-25e6718ff41f
000d0000-56ab-8f35-1c77-24243e42e8a7	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-fcd4-24f93d6a8712	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-8f32-f104-d0d55a46c453
000d0000-56ab-8f35-650d-648e179c23e0	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-cc39-f49972cc7002	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56ab-8f32-f104-d0d55a46c453
000d0000-56ab-8f35-f3e8-d252c9f14a03	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-e1ad-40d6900097dd	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56ab-8f32-48ea-5ff4693107d0
000d0000-56ab-8f35-eb6f-66fe70566057	000e0000-56ab-8f35-0ea5-f6884c9a9416	000c0000-56ab-8f35-fedd-1e4eb7e7f560	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56ab-8f31-8b50-25db332a94f9
000d0000-56ab-8f35-d421-76a7bc88ed42	000e0000-56ab-8f35-2495-4a40d50e79c3	000c0000-56ab-8f35-bb9f-d96fea387b3b	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-b334-9cd223ec6d53	000e0000-56ab-8f35-be55-3f1cff6023ed	000c0000-56ab-8f35-f074-d36233aa0c5e	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-554a-ed2e7730481f	000e0000-56ab-8f35-be55-3f1cff6023ed	000c0000-56ab-8f35-dfde-e5eb4587418d	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-5a78-d2698b42fb97	000e0000-56ab-8f35-ef06-49f9036673a5	000c0000-56ab-8f35-9ad1-1282aff074a6	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-60da-96508b7cb25a	000e0000-56ab-8f35-d05a-d51807b30a27	000c0000-56ab-8f35-6e2e-38290fad78f5	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-e75b-6deaacec200f	000e0000-56ab-8f35-8e7d-d487b5a18d4c	000c0000-56ab-8f35-7b28-64e27f3e376c	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-af56-9738c887912d	000e0000-56ab-8f35-d63a-afb1978a67e8	000c0000-56ab-8f35-1fb9-99a8913eb3ba	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-cfac-ddfa070d6cb5	000e0000-56ab-8f35-0d7e-de744cd8bd1f	000c0000-56ab-8f35-a25d-e5949b9dee42	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-2c44-25e8e0abf805	000e0000-56ab-8f35-394d-a7850bffb14b	000c0000-56ab-8f35-923e-f9479332009d	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-33bc-dbabf735fb35	000e0000-56ab-8f35-394d-a7850bffb14b	000c0000-56ab-8f35-fb27-113bda032a25	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-6cd0-67a3e2e5d391	000e0000-56ab-8f35-7bb5-5515f04c9857	000c0000-56ab-8f35-293c-5953830af45a	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
000d0000-56ab-8f35-1ea8-5c67700f139a	000e0000-56ab-8f35-7bb5-5515f04c9857	000c0000-56ab-8f35-584e-8d2e03355a79	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56ab-8f32-af78-59af3d4c6b5c
\.


--
-- TOC entry 3162 (class 0 OID 42075815)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56ab-8f35-196a-64cbc745e2b3	00040000-56ab-8f32-93a9-3ac64f210881		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 42075787)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 42075764)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56ab-8f35-8fd3-bd333abf6edf	00080000-56ab-8f34-9901-de8229192597	00090000-56ab-8f35-b5ca-afac559968b8	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 42075952)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 42076502)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56ab-8f35-fcb1-3a5076dce319	00010000-56ab-8f33-e6df-e74a1da84d14	\N	Prva mapa	Root mapa	2016-01-29 17:11:33	2016-01-29 17:11:33	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 42076515)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 42076537)
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
-- TOC entry 3180 (class 0 OID 42075976)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 42075721)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56ab-8f33-45ac-ac085a520823	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56ab-8f33-26c9-82c0098ddda8	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56ab-8f33-0538-9f72ef45fb3e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56ab-8f33-0641-e5060cd28e7c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56ab-8f33-2ac5-12058cdcaedc	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56ab-8f33-2c63-9e9aa58905bc	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56ab-8f33-8d13-e255e5364204	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56ab-8f33-07f1-bf36fcf1d454	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56ab-8f33-a293-d59631313199	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56ab-8f33-ded4-87c6dfd0d59d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56ab-8f33-da38-88709a76d4d8	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-8f33-e505-cc221ea7a9ac	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-8f33-0dcb-fee690755f11	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56ab-8f33-7dbb-c96e16fa9256	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56ab-8f33-453a-cec4c5c3545b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56ab-8f33-374e-7bbac282dda5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56ab-8f33-bdb6-3a220924548c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56ab-8f34-808a-51cd18a46192	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56ab-8f34-4b37-42e5364c3f6c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56ab-8f34-4f14-b0908ff60bec	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56ab-8f34-f7ab-8616d467f63d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56ab-8f34-08b0-87006254995b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56ab-8f34-41b4-4d30f264bfc9	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56ab-8f37-0448-068aead56925	application.tenant.maticnopodjetje	string	s:36:"00080000-56ab-8f37-ef96-a3f420de4bdf";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 42075621)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56ab-8f34-00e5-8042feef9e1b	00000000-56ab-8f34-808a-51cd18a46192	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56ab-8f34-0736-61cdd5896afa	00000000-56ab-8f34-808a-51cd18a46192	00010000-56ab-8f33-e6df-e74a1da84d14	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56ab-8f34-9499-488c39c3fa12	00000000-56ab-8f34-4b37-42e5364c3f6c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56ab-8f34-087e-b4a8acf0509c	00000000-56ab-8f34-41b4-4d30f264bfc9	\N	s:6:"zelena";	t
00000000-56ab-8f34-2608-d3b06efff77e	00000000-56ab-8f34-41b4-4d30f264bfc9	00010000-56ab-8f33-e6df-e74a1da84d14	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 42075688)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56ab-8f35-a01d-6520966b41b2	\N	00100000-56ab-8f35-5e4a-f50cdafbc391	00100000-56ab-8f35-e3e4-03a0ccd612a8	01	Gledališče Nimbis
00410000-56ab-8f35-dfe6-4be129d93501	00410000-56ab-8f35-a01d-6520966b41b2	00100000-56ab-8f35-5e4a-f50cdafbc391	00100000-56ab-8f35-e3e4-03a0ccd612a8	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 42075632)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56ab-8f35-ab2a-0bd8bcd95c9f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56ab-8f35-d238-5f8136169859	00010000-56ab-8f34-ce4e-c9b7d98a9d85	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56ab-8f35-b85a-465c09e86446	00010000-56ab-8f34-5357-e000a9d1f2ae	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56ab-8f35-a408-450b69ef9d86	00010000-56ab-8f34-6097-eae3857b83d8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56ab-8f35-dcd8-108ceeec3ee0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56ab-8f35-e997-f1ab81910b60	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56ab-8f35-5872-71df2bd775c6	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56ab-8f35-ba2a-e6dbcd404bc5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56ab-8f35-b5ca-afac559968b8	00010000-56ab-8f34-0b18-f7426db91cc5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56ab-8f35-2811-93f1482f70c4	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56ab-8f35-12b9-7b2022c1ffe1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-8f35-831f-ec9b84a703e3	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56ab-8f35-8622-b3d327ded8a2	00010000-56ab-8f34-58cc-60ff27b329a4	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-8f35-74d6-cdb5c2d93820	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-8f35-19c2-56b08fd001e1	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-8f35-ffcb-acd156e46cdd	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-8f35-6826-af68506407a0	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-8f35-0cbe-0252a52a58ee	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-8f35-6f6a-390b5f865279	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-8f35-a1d8-9ef852c450e0	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-8f35-4db0-16ed3bb2a681	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 42075566)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56ab-8f32-9a9b-15705ab22f20	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56ab-8f32-347f-029318d5cad9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56ab-8f32-1178-4b6dab0098bc	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56ab-8f32-da2b-136e0391d107	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56ab-8f32-ad2c-21ad1b6c6291	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56ab-8f32-99f9-627bcb85efe0	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56ab-8f32-60e3-fd5689cfdf89	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56ab-8f32-8ff7-b9fe10597065	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56ab-8f32-0bdc-4206cef66a0f	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56ab-8f32-4667-07972df4b119	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56ab-8f32-ff16-e6ac5dc703ac	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56ab-8f32-38ac-cbbeab20ecc4	Abonma-read	Abonma - branje	t
00030000-56ab-8f32-1e67-07eccddc448d	Abonma-write	Abonma - spreminjanje	t
00030000-56ab-8f32-a15e-8e5bd8921e87	Alternacija-read	Alternacija - branje	t
00030000-56ab-8f32-6adc-58cb47942a30	Alternacija-write	Alternacija - spreminjanje	t
00030000-56ab-8f32-40cc-6bc97099d9b0	Arhivalija-read	Arhivalija - branje	t
00030000-56ab-8f32-41fe-35acd95908c2	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56ab-8f32-b0a6-745da1737310	AuthStorage-read	AuthStorage - branje	t
00030000-56ab-8f32-dfa3-51dca0aa9e7b	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56ab-8f32-d82d-342672149978	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56ab-8f32-6828-f2ce4ab215ff	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56ab-8f32-5ad9-ce3672e699a6	Besedilo-read	Besedilo - branje	t
00030000-56ab-8f32-1fb7-954dc58fe416	Besedilo-write	Besedilo - spreminjanje	t
00030000-56ab-8f32-5224-4ab4e5af0afe	Dodatek-read	Dodatek - branje	t
00030000-56ab-8f32-139a-131f662b41c0	Dodatek-write	Dodatek - spreminjanje	t
00030000-56ab-8f32-08c2-7c5c2f85eb3c	Dogodek-read	Dogodek - branje	t
00030000-56ab-8f32-aca7-3ca8495ab310	Dogodek-write	Dogodek - spreminjanje	t
00030000-56ab-8f32-9fe8-8fae393c79ad	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56ab-8f32-ccf7-9e26cec44f4a	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56ab-8f32-27df-71bbd0740e3c	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56ab-8f32-12f5-4c74e395ef4b	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56ab-8f32-c9c8-89f00b3f05c6	DogodekTrait-read	DogodekTrait - branje	t
00030000-56ab-8f32-35fe-b817661de143	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56ab-8f32-fd42-884ac5c36511	DrugiVir-read	DrugiVir - branje	t
00030000-56ab-8f32-19af-234c0f05d6df	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56ab-8f32-25bb-d166699f5d0b	Drzava-read	Drzava - branje	t
00030000-56ab-8f32-55b7-9e007e7b9a8d	Drzava-write	Drzava - spreminjanje	t
00030000-56ab-8f32-fdb8-c21e574ddb4e	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56ab-8f32-a9a0-918ec7615407	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56ab-8f32-2ba8-5f4fb0cd5fbd	Funkcija-read	Funkcija - branje	t
00030000-56ab-8f32-dce2-50c3a67b08d2	Funkcija-write	Funkcija - spreminjanje	t
00030000-56ab-8f32-a6a6-ebce84f9945c	Gostovanje-read	Gostovanje - branje	t
00030000-56ab-8f32-0f62-4e2c68618b0a	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56ab-8f32-edd6-976a8c8e2d2c	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56ab-8f32-e1b5-b140a1128f92	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56ab-8f32-8bec-546e838a0b13	Kupec-read	Kupec - branje	t
00030000-56ab-8f32-3d95-600e210e9072	Kupec-write	Kupec - spreminjanje	t
00030000-56ab-8f32-637e-85da77cf7afb	NacinPlacina-read	NacinPlacina - branje	t
00030000-56ab-8f32-66d0-76614b030061	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56ab-8f32-ffc3-adfa0fc4031e	Option-read	Option - branje	t
00030000-56ab-8f32-c4d5-26f3333048b1	Option-write	Option - spreminjanje	t
00030000-56ab-8f32-c42a-36eea9227868	OptionValue-read	OptionValue - branje	t
00030000-56ab-8f32-b590-b39abf4d02d1	OptionValue-write	OptionValue - spreminjanje	t
00030000-56ab-8f32-2038-1f08293488d5	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56ab-8f32-4dbd-e722a6e6e752	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56ab-8f32-91b9-473b7764bdea	Oseba-read	Oseba - branje	t
00030000-56ab-8f32-2600-e15436b613a8	Oseba-write	Oseba - spreminjanje	t
00030000-56ab-8f32-b546-2888ef120111	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56ab-8f32-2d77-5fafa7d35f90	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56ab-8f32-14f9-e581dd079613	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56ab-8f32-d391-dcdb525cd34c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56ab-8f32-be67-c8151b63dd22	Pogodba-read	Pogodba - branje	t
00030000-56ab-8f32-8f90-cda313793c24	Pogodba-write	Pogodba - spreminjanje	t
00030000-56ab-8f32-dbff-137a0bbee56b	Popa-read	Popa - branje	t
00030000-56ab-8f32-bc73-26e162650b2e	Popa-write	Popa - spreminjanje	t
00030000-56ab-8f32-bd7a-1fdf8bea5b20	Posta-read	Posta - branje	t
00030000-56ab-8f32-7910-864d0bdeca94	Posta-write	Posta - spreminjanje	t
00030000-56ab-8f32-4c84-ef516fd3a3da	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56ab-8f32-c528-28eaae28a8f0	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56ab-8f32-1753-ddfed734590e	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56ab-8f32-254b-04d8b28c683d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56ab-8f32-5a75-712198ad8d93	PostniNaslov-read	PostniNaslov - branje	t
00030000-56ab-8f32-87b4-804ff9eceaa1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56ab-8f32-dfcc-03e6d7e5d915	Praznik-read	Praznik - branje	t
00030000-56ab-8f32-2535-bde76f47984e	Praznik-write	Praznik - spreminjanje	t
00030000-56ab-8f32-9cc9-ae0976dc06c9	Predstava-read	Predstava - branje	t
00030000-56ab-8f32-4532-9026fa83e943	Predstava-write	Predstava - spreminjanje	t
00030000-56ab-8f32-570f-53cdfdce6cea	Ura-read	Ura - branje	t
00030000-56ab-8f32-708d-162e826bd054	Ura-write	Ura - spreminjanje	t
00030000-56ab-8f32-480a-081dfbe8672d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56ab-8f32-e349-92e7ef85d413	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56ab-8f32-cc40-094e32c5beff	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56ab-8f32-aad7-dc1396689677	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56ab-8f32-6931-b1d6758099c8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56ab-8f32-8243-b4b2fdd07958	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56ab-8f32-fac2-29542ba2dc14	ProgramDela-read	ProgramDela - branje	t
00030000-56ab-8f32-6257-670ccc473967	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56ab-8f32-55a8-6bb3504eed52	ProgramFestival-read	ProgramFestival - branje	t
00030000-56ab-8f32-7ef3-eeab4a3ef821	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56ab-8f32-157f-975c94a007ac	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56ab-8f32-27f2-b4767634ffe2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56ab-8f32-5176-75c8529ee742	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56ab-8f32-ed95-e13bc425ac6e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56ab-8f32-db86-94ec793e86a7	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56ab-8f32-384f-99ea2dd92535	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56ab-8f32-e862-88496defb177	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56ab-8f32-ea65-b7826ff82e73	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56ab-8f32-5481-773ef3c692af	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56ab-8f32-2a2c-756a7c48ee9b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56ab-8f32-e2af-231c60260fae	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56ab-8f32-9b96-b6dd5d634bf1	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56ab-8f32-f30c-2e4999a9076a	ProgramRazno-read	ProgramRazno - branje	t
00030000-56ab-8f32-ec6b-bc48073519d7	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56ab-8f32-2b13-38f48e6cd49b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56ab-8f32-e80a-bf1fd16238a4	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56ab-8f32-4e12-2906a40c1f55	Prostor-read	Prostor - branje	t
00030000-56ab-8f32-f7ac-a3fe58c666ea	Prostor-write	Prostor - spreminjanje	t
00030000-56ab-8f32-473a-5df507bf6fc6	Racun-read	Racun - branje	t
00030000-56ab-8f32-f176-88ef7d5a758d	Racun-write	Racun - spreminjanje	t
00030000-56ab-8f32-5fc1-67b4bae49c5f	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56ab-8f32-6b81-b7a546eb646d	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56ab-8f32-3039-c96abc91f845	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56ab-8f32-2f47-1c2dd3a35b34	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56ab-8f32-69fa-50c7a8220f28	Rekvizit-read	Rekvizit - branje	t
00030000-56ab-8f32-5e5f-b2590380453b	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56ab-8f32-e6c3-2809cdae79a8	Revizija-read	Revizija - branje	t
00030000-56ab-8f32-e35c-e86272895005	Revizija-write	Revizija - spreminjanje	t
00030000-56ab-8f32-0409-3b25f6799f3f	Rezervacija-read	Rezervacija - branje	t
00030000-56ab-8f32-8d1d-a8ec0ec3e21c	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56ab-8f32-9c29-068d1c7e53c0	SedezniRed-read	SedezniRed - branje	t
00030000-56ab-8f32-f0db-9c141a062bfa	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56ab-8f32-2f39-3b11a83d509e	Sedez-read	Sedez - branje	t
00030000-56ab-8f32-6645-47898f50e5d2	Sedez-write	Sedez - spreminjanje	t
00030000-56ab-8f32-9716-1b29c0565308	Sezona-read	Sezona - branje	t
00030000-56ab-8f32-6bf2-00b8a6fa7571	Sezona-write	Sezona - spreminjanje	t
00030000-56ab-8f32-0ed0-5b03a52077e7	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56ab-8f32-d717-0a9d50bd8e09	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56ab-8f32-84c9-1cb72b0cdfcf	Telefonska-read	Telefonska - branje	t
00030000-56ab-8f32-43bc-0286d52cafde	Telefonska-write	Telefonska - spreminjanje	t
00030000-56ab-8f32-dd1a-0ec8ee1091e7	TerminStoritve-read	TerminStoritve - branje	t
00030000-56ab-8f32-6bec-c3075a6c917d	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56ab-8f32-219e-e1179b32cb78	TipDodatka-read	TipDodatka - branje	t
00030000-56ab-8f32-2a77-f1525267e9db	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56ab-8f32-dc1b-8139dbec5611	TipFunkcije-read	TipFunkcije - branje	t
00030000-56ab-8f32-5fa1-862e0eef815d	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56ab-8f32-2c44-c74a14d0c683	TipPopa-read	TipPopa - branje	t
00030000-56ab-8f32-edad-63d7cd107044	TipPopa-write	TipPopa - spreminjanje	t
00030000-56ab-8f32-cffa-1924af12b8e8	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56ab-8f32-9f53-039a2880bb49	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56ab-8f32-2f33-ccc97e359391	TipVaje-read	TipVaje - branje	t
00030000-56ab-8f32-4638-01e7f6067989	TipVaje-write	TipVaje - spreminjanje	t
00030000-56ab-8f32-38b4-a73b24e5ab1e	Trr-read	Trr - branje	t
00030000-56ab-8f32-d1ca-e0f7541b4161	Trr-write	Trr - spreminjanje	t
00030000-56ab-8f32-ad3d-35fa799ca48f	Uprizoritev-read	Uprizoritev - branje	t
00030000-56ab-8f32-ce3b-d3429e8f1714	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56ab-8f32-d312-13643e7f19d8	Vaja-read	Vaja - branje	t
00030000-56ab-8f32-b16a-a16b5729ee77	Vaja-write	Vaja - spreminjanje	t
00030000-56ab-8f32-7418-a90355f7dae3	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56ab-8f32-392e-34aebda39077	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56ab-8f32-88ce-5bb5c77abea4	VrstaStroska-read	VrstaStroska - branje	t
00030000-56ab-8f32-da17-0356b4c154c1	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56ab-8f32-18ba-c406f344f2d0	Zaposlitev-read	Zaposlitev - branje	t
00030000-56ab-8f32-98d0-287ef2d96ff7	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56ab-8f32-3c33-19b9bdd4c84a	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56ab-8f32-c463-10f26e1a2530	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56ab-8f32-e4cd-68b3328c0593	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56ab-8f32-5aca-ea93ec383582	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56ab-8f32-6836-e2bcf32ab6aa	Job-read	Branje opravil - samo zase - branje	t
00030000-56ab-8f32-1b64-4721d36781d4	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56ab-8f32-498f-4dd02760a3f5	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56ab-8f32-0041-490987c76b2b	Report-read	Report - branje	t
00030000-56ab-8f32-d975-26cb19283204	Report-write	Report - spreminjanje	t
00030000-56ab-8f32-0153-4ce12e444a75	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56ab-8f32-3a4b-3f2f1ba5a33f	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56ab-8f32-dcf0-30c306d2dc99	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56ab-8f32-a306-572611f6cc82	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56ab-8f32-d9cc-4a37f94a17a2	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56ab-8f32-eef3-2a91a36e657c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56ab-8f32-cf1a-b55ab6120133	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56ab-8f32-90af-79e8a1d3e9e8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-8f32-b082-bbbdcfeef917	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-8f32-4852-7a1de97df6ea	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-8f32-494d-5ba951e414d2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-8f32-1cad-bc73cda627ea	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56ab-8f32-25a0-c6d85980e646	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56ab-8f32-4df2-24fe36256ae2	Datoteka-write	Datoteka - spreminjanje	t
00030000-56ab-8f32-f0af-8a9b797a6a16	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 42075585)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56ab-8f32-6a66-44ace0c4fea4	00030000-56ab-8f32-347f-029318d5cad9
00020000-56ab-8f32-6a66-44ace0c4fea4	00030000-56ab-8f32-9a9b-15705ab22f20
00020000-56ab-8f32-f76e-dc7c1016857d	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-6828-f2ce4ab215ff
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-1fb7-954dc58fe416
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-eff2-d2358b373a76	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-85c4-a60cde488bbc	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f32-85c4-a60cde488bbc	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-85c4-a60cde488bbc	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-85c4-a60cde488bbc	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-85c4-a60cde488bbc	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-85c4-a60cde488bbc	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-5d28-9db8f81c26e1	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-5d28-9db8f81c26e1	00030000-56ab-8f32-98d0-287ef2d96ff7
00020000-56ab-8f32-5d28-9db8f81c26e1	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-5d28-9db8f81c26e1	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f32-5d28-9db8f81c26e1	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-5d28-9db8f81c26e1	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-5d28-9db8f81c26e1	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-12b8-72dfbe472185	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-12b8-72dfbe472185	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-12b8-72dfbe472185	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-7587-9b88afb0ae41	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-7587-9b88afb0ae41	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-7587-9b88afb0ae41	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-7587-9b88afb0ae41	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-7587-9b88afb0ae41	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-7587-9b88afb0ae41	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-7587-9b88afb0ae41	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-7587-9b88afb0ae41	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-64a4-f7573974b708	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-64a4-f7573974b708	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-64a4-f7573974b708	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-64a4-f7573974b708	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-d1ca-e0f7541b4161
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-87b4-804ff9eceaa1
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-43bc-0286d52cafde
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-2292-f5f7bb01a4d4	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-cfe7-288f3edad9e9	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-cfe7-288f3edad9e9	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-cfe7-288f3edad9e9	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-cfe7-288f3edad9e9	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-cfe7-288f3edad9e9	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-cfe7-288f3edad9e9	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-cfe7-288f3edad9e9	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-43bc-0286d52cafde
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-87b4-804ff9eceaa1
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-d1ca-e0f7541b4161
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-bc73-26e162650b2e
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-e1b5-b140a1128f92
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-8243-b4b2fdd07958
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-f0b4-32d0222c1289	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-61db-34091f167b0e	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-e8cb-c35fc738800d	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-e8cb-c35fc738800d	00030000-56ab-8f32-edad-63d7cd107044
00020000-56ab-8f32-5cfa-b9f1024a3e6a	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-b352-ee923059294a	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-b352-ee923059294a	00030000-56ab-8f32-7910-864d0bdeca94
00020000-56ab-8f32-122f-47ec032fab5d	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-cc55-5acbeed185eb	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-cc55-5acbeed185eb	00030000-56ab-8f32-55b7-9e007e7b9a8d
00020000-56ab-8f32-ab3d-05a40f1999e9	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-17ee-546dd1153a95	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f32-17ee-546dd1153a95	00030000-56ab-8f32-5aca-ea93ec383582
00020000-56ab-8f32-cb19-eda005fabe01	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f32-67f2-caf4a19a9a47	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-67f2-caf4a19a9a47	00030000-56ab-8f32-c463-10f26e1a2530
00020000-56ab-8f32-cc6e-768b4280fab9	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-bcd9-98cc6c848db5	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f32-bcd9-98cc6c848db5	00030000-56ab-8f32-1e67-07eccddc448d
00020000-56ab-8f32-cb4e-259ef3f0914f	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f32-bfe1-6de56449c126	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-bfe1-6de56449c126	00030000-56ab-8f32-f7ac-a3fe58c666ea
00020000-56ab-8f32-bfe1-6de56449c126	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-bfe1-6de56449c126	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-bfe1-6de56449c126	00030000-56ab-8f32-87b4-804ff9eceaa1
00020000-56ab-8f32-bfe1-6de56449c126	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-4106-062e6e70db4c	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-4106-062e6e70db4c	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-4106-062e6e70db4c	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-1209-4be0caac2ac0	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-1209-4be0caac2ac0	00030000-56ab-8f32-da17-0356b4c154c1
00020000-56ab-8f32-8c1d-47d497235d04	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-4dbd-e722a6e6e752
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-1ff7-6cf1f2ae609c	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-d280-8975d1350ab3	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-d280-8975d1350ab3	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-d280-8975d1350ab3	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-d280-8975d1350ab3	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-d280-8975d1350ab3	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-3ab8-9ad65804f573	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f32-3ab8-9ad65804f573	00030000-56ab-8f32-4638-01e7f6067989
00020000-56ab-8f32-429d-8ccde908c585	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-60e3-fd5689cfdf89
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-8ff7-b9fe10597065
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-fac2-29542ba2dc14
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-6257-670ccc473967
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-55a8-6bb3504eed52
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-7ef3-eeab4a3ef821
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-157f-975c94a007ac
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-27f2-b4767634ffe2
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-5176-75c8529ee742
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-ed95-e13bc425ac6e
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-db86-94ec793e86a7
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-384f-99ea2dd92535
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-e862-88496defb177
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-ea65-b7826ff82e73
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-5481-773ef3c692af
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-2a2c-756a7c48ee9b
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-e2af-231c60260fae
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-9b96-b6dd5d634bf1
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-f30c-2e4999a9076a
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-ec6b-bc48073519d7
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-2b13-38f48e6cd49b
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-e80a-bf1fd16238a4
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-aad7-dc1396689677
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-19af-234c0f05d6df
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-c528-28eaae28a8f0
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-1b64-4721d36781d4
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-fd42-884ac5c36511
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-cc40-094e32c5beff
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-4c84-ef516fd3a3da
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-6836-e2bcf32ab6aa
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-862a-c6e6b4cb1a18	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-fac2-29542ba2dc14
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-55a8-6bb3504eed52
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-157f-975c94a007ac
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-5176-75c8529ee742
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-db86-94ec793e86a7
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-e862-88496defb177
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-5481-773ef3c692af
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-e2af-231c60260fae
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-f30c-2e4999a9076a
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-2b13-38f48e6cd49b
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-cc40-094e32c5beff
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-fd42-884ac5c36511
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-4c84-ef516fd3a3da
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-6836-e2bcf32ab6aa
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-988b-60b26b294abb	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-ce3b-d3429e8f1714
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-4667-07972df4b119
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-8a82-ce113701fd02	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-2eb5-2e8e90d8dccd	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-c0c7-d444ffdcbbbf	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-c0c7-d444ffdcbbbf	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-c0c7-d444ffdcbbbf	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-c0c7-d444ffdcbbbf	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f32-c0c7-d444ffdcbbbf	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-c0c7-d444ffdcbbbf	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-c0c7-d444ffdcbbbf	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-c0c7-d444ffdcbbbf	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-8f90-cda313793c24
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-d717-0a9d50bd8e09
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-4b07-679887527459	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-da0e-1200417dae52	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-a754-4dbb1369151f	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-a754-4dbb1369151f	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-a754-4dbb1369151f	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-a754-4dbb1369151f	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-a754-4dbb1369151f	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-a754-4dbb1369151f	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-a754-4dbb1369151f	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-202c-c4123f37bc83	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-202c-c4123f37bc83	00030000-56ab-8f32-d717-0a9d50bd8e09
00020000-56ab-8f32-202c-c4123f37bc83	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-202c-c4123f37bc83	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-bbdd-4bfc77cbf011	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-bbdd-4bfc77cbf011	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-6828-f2ce4ab215ff
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-1fb7-954dc58fe416
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-fd42-884ac5c36511
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-19af-234c0f05d6df
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-4667-07972df4b119
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-6836-e2bcf32ab6aa
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-1b64-4721d36781d4
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-8f90-cda313793c24
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-4c84-ef516fd3a3da
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-c528-28eaae28a8f0
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-cc40-094e32c5beff
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-aad7-dc1396689677
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-60e3-fd5689cfdf89
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-fac2-29542ba2dc14
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-8ff7-b9fe10597065
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-6257-670ccc473967
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-55a8-6bb3504eed52
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-7ef3-eeab4a3ef821
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-157f-975c94a007ac
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-27f2-b4767634ffe2
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-5176-75c8529ee742
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-ed95-e13bc425ac6e
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-db86-94ec793e86a7
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-384f-99ea2dd92535
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-e862-88496defb177
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-ea65-b7826ff82e73
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-5481-773ef3c692af
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-2a2c-756a7c48ee9b
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-e2af-231c60260fae
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-9b96-b6dd5d634bf1
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-f30c-2e4999a9076a
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-ec6b-bc48073519d7
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-2b13-38f48e6cd49b
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-e80a-bf1fd16238a4
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-d717-0a9d50bd8e09
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-ce3b-d3429e8f1714
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-bcfc-f001acea115c	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-6828-f2ce4ab215ff
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-1fb7-954dc58fe416
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-dd23-8cdb9d7207e5	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-6828-f2ce4ab215ff
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-1fb7-954dc58fe416
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-4667-07972df4b119
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-ce3b-d3429e8f1714
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-c32b-5345717ff8c5	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-6828-f2ce4ab215ff
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-1fb7-954dc58fe416
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-fd42-884ac5c36511
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-19af-234c0f05d6df
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-4667-07972df4b119
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-6836-e2bcf32ab6aa
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-1b64-4721d36781d4
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-e1b5-b140a1128f92
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-8f90-cda313793c24
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-bc73-26e162650b2e
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-4c84-ef516fd3a3da
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-c528-28eaae28a8f0
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-87b4-804ff9eceaa1
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-cc40-094e32c5beff
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-aad7-dc1396689677
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-8243-b4b2fdd07958
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-60e3-fd5689cfdf89
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-fac2-29542ba2dc14
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-8ff7-b9fe10597065
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-6257-670ccc473967
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-55a8-6bb3504eed52
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-7ef3-eeab4a3ef821
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-157f-975c94a007ac
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-27f2-b4767634ffe2
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-5176-75c8529ee742
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-ed95-e13bc425ac6e
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-db86-94ec793e86a7
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-384f-99ea2dd92535
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-e862-88496defb177
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-ea65-b7826ff82e73
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-5481-773ef3c692af
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-2a2c-756a7c48ee9b
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-e2af-231c60260fae
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-9b96-b6dd5d634bf1
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-f30c-2e4999a9076a
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-ec6b-bc48073519d7
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-2b13-38f48e6cd49b
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-e80a-bf1fd16238a4
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-d717-0a9d50bd8e09
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-43bc-0286d52cafde
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-d1ca-e0f7541b4161
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-ce3b-d3429e8f1714
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-98d0-287ef2d96ff7
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-7ba9-89724fe6d890	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-6828-f2ce4ab215ff
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-1fb7-954dc58fe416
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-4667-07972df4b119
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-e1b5-b140a1128f92
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-bc73-26e162650b2e
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-87b4-804ff9eceaa1
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-8243-b4b2fdd07958
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-43bc-0286d52cafde
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-d1ca-e0f7541b4161
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-ce3b-d3429e8f1714
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-98d0-287ef2d96ff7
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-d1d8-e9d4ba786669	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-91d4-5148ae406300	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-fd42-884ac5c36511
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-19af-234c0f05d6df
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-6836-e2bcf32ab6aa
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-1b64-4721d36781d4
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-e1b5-b140a1128f92
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-4dbd-e722a6e6e752
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-8f90-cda313793c24
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-bc73-26e162650b2e
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-4c84-ef516fd3a3da
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-c528-28eaae28a8f0
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-87b4-804ff9eceaa1
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-cc40-094e32c5beff
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-aad7-dc1396689677
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-8243-b4b2fdd07958
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-60e3-fd5689cfdf89
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-fac2-29542ba2dc14
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-8ff7-b9fe10597065
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-6257-670ccc473967
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-55a8-6bb3504eed52
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-7ef3-eeab4a3ef821
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-157f-975c94a007ac
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-27f2-b4767634ffe2
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-5176-75c8529ee742
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-ed95-e13bc425ac6e
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-db86-94ec793e86a7
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-384f-99ea2dd92535
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-e862-88496defb177
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-ea65-b7826ff82e73
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-5481-773ef3c692af
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-2a2c-756a7c48ee9b
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-e2af-231c60260fae
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-9b96-b6dd5d634bf1
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-f30c-2e4999a9076a
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-ec6b-bc48073519d7
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-2b13-38f48e6cd49b
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-e80a-bf1fd16238a4
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-d717-0a9d50bd8e09
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-43bc-0286d52cafde
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-d1ca-e0f7541b4161
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-da17-0356b4c154c1
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-98d0-287ef2d96ff7
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-9a9b-15705ab22f20
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-347f-029318d5cad9
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-38ac-cbbeab20ecc4
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-1e67-07eccddc448d
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-40cc-6bc97099d9b0
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-41fe-35acd95908c2
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-b0a6-745da1737310
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-dfa3-51dca0aa9e7b
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-d82d-342672149978
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6828-f2ce4ab215ff
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-5ad9-ce3672e699a6
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-1fb7-954dc58fe416
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-08c2-7c5c2f85eb3c
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-da2b-136e0391d107
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-9fe8-8fae393c79ad
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ccf7-9e26cec44f4a
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-27df-71bbd0740e3c
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-12f5-4c74e395ef4b
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-c9c8-89f00b3f05c6
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-35fe-b817661de143
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-aca7-3ca8495ab310
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-fd42-884ac5c36511
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-19af-234c0f05d6df
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-25bb-d166699f5d0b
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-55b7-9e007e7b9a8d
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-fdb8-c21e574ddb4e
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-a9a0-918ec7615407
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-4667-07972df4b119
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-a6a6-ebce84f9945c
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-0f62-4e2c68618b0a
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-498f-4dd02760a3f5
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6836-e2bcf32ab6aa
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-1b64-4721d36781d4
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-edd6-976a8c8e2d2c
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-e1b5-b140a1128f92
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-8bec-546e838a0b13
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-3d95-600e210e9072
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-cf1a-b55ab6120133
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-eef3-2a91a36e657c
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-3a4b-3f2f1ba5a33f
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-dcf0-30c306d2dc99
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-a306-572611f6cc82
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-d9cc-4a37f94a17a2
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-637e-85da77cf7afb
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-66d0-76614b030061
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ffc3-adfa0fc4031e
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-c42a-36eea9227868
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-b590-b39abf4d02d1
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ff16-e6ac5dc703ac
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-c4d5-26f3333048b1
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2038-1f08293488d5
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-4dbd-e722a6e6e752
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-b546-2888ef120111
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2d77-5fafa7d35f90
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-14f9-e581dd079613
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-d391-dcdb525cd34c
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-8f90-cda313793c24
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-bc73-26e162650b2e
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-bd7a-1fdf8bea5b20
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-4c84-ef516fd3a3da
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-c528-28eaae28a8f0
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-1753-ddfed734590e
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-254b-04d8b28c683d
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-7910-864d0bdeca94
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-87b4-804ff9eceaa1
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-dfcc-03e6d7e5d915
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2535-bde76f47984e
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-9cc9-ae0976dc06c9
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-4532-9026fa83e943
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-480a-081dfbe8672d
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-e349-92e7ef85d413
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-cc40-094e32c5beff
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-aad7-dc1396689677
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6931-b1d6758099c8
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-8243-b4b2fdd07958
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-60e3-fd5689cfdf89
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-fac2-29542ba2dc14
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-8ff7-b9fe10597065
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6257-670ccc473967
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-55a8-6bb3504eed52
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-7ef3-eeab4a3ef821
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-157f-975c94a007ac
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-27f2-b4767634ffe2
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-5176-75c8529ee742
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ed95-e13bc425ac6e
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-db86-94ec793e86a7
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-384f-99ea2dd92535
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-e862-88496defb177
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ea65-b7826ff82e73
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-5481-773ef3c692af
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2a2c-756a7c48ee9b
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-e2af-231c60260fae
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-9b96-b6dd5d634bf1
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-f30c-2e4999a9076a
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ec6b-bc48073519d7
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2b13-38f48e6cd49b
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-e80a-bf1fd16238a4
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-4e12-2906a40c1f55
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-f7ac-a3fe58c666ea
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-473a-5df507bf6fc6
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-f176-88ef7d5a758d
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-5fc1-67b4bae49c5f
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6b81-b7a546eb646d
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-3039-c96abc91f845
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2f47-1c2dd3a35b34
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-69fa-50c7a8220f28
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-5e5f-b2590380453b
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-0041-490987c76b2b
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-d975-26cb19283204
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-e6c3-2809cdae79a8
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-e35c-e86272895005
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-0409-3b25f6799f3f
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-8d1d-a8ec0ec3e21c
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-9c29-068d1c7e53c0
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-f0db-9c141a062bfa
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2f39-3b11a83d509e
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6645-47898f50e5d2
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-9716-1b29c0565308
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6bf2-00b8a6fa7571
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-0153-4ce12e444a75
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-d717-0a9d50bd8e09
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-43bc-0286d52cafde
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-dd1a-0ec8ee1091e7
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-1178-4b6dab0098bc
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-6bec-c3075a6c917d
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-dc1b-8139dbec5611
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-5fa1-862e0eef815d
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2c44-c74a14d0c683
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-edad-63d7cd107044
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-cffa-1924af12b8e8
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-9f53-039a2880bb49
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-2f33-ccc97e359391
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-4638-01e7f6067989
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-d1ca-e0f7541b4161
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-ce3b-d3429e8f1714
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-d312-13643e7f19d8
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-b16a-a16b5729ee77
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-7418-a90355f7dae3
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-392e-34aebda39077
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-88ce-5bb5c77abea4
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-da17-0356b4c154c1
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-25a0-c6d85980e646
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-1cad-bc73cda627ea
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-98d0-287ef2d96ff7
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-3c33-19b9bdd4c84a
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-c463-10f26e1a2530
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-e4cd-68b3328c0593
00020000-56ab-8f34-7b79-1bca41e3a696	00030000-56ab-8f32-5aca-ea93ec383582
00020000-56ab-8f34-aacf-284f9cfdefed	00030000-56ab-8f32-494d-5ba951e414d2
00020000-56ab-8f34-3ef5-4d200be48957	00030000-56ab-8f32-4852-7a1de97df6ea
00020000-56ab-8f34-b3e4-9d63ab439f86	00030000-56ab-8f32-ce3b-d3429e8f1714
00020000-56ab-8f34-b083-a5d5a34bd04b	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f34-ccf0-8c95d14ae478	00030000-56ab-8f32-dcf0-30c306d2dc99
00020000-56ab-8f34-f547-83a26f00f46a	00030000-56ab-8f32-a306-572611f6cc82
00020000-56ab-8f34-d6c2-c7ed3a9f25c7	00030000-56ab-8f32-d9cc-4a37f94a17a2
00020000-56ab-8f34-36db-1360f57ee120	00030000-56ab-8f32-3a4b-3f2f1ba5a33f
00020000-56ab-8f34-9213-1670545c341f	00030000-56ab-8f32-cf1a-b55ab6120133
00020000-56ab-8f34-dc8d-08f9521fa400	00030000-56ab-8f32-eef3-2a91a36e657c
00020000-56ab-8f34-d7c3-365fb697db63	00030000-56ab-8f32-b082-bbbdcfeef917
00020000-56ab-8f34-e695-fb023131901e	00030000-56ab-8f32-90af-79e8a1d3e9e8
00020000-56ab-8f34-4a82-24a4b1516bde	00030000-56ab-8f32-91b9-473b7764bdea
00020000-56ab-8f34-b1b7-3d34943a89ba	00030000-56ab-8f32-2600-e15436b613a8
00020000-56ab-8f34-b79c-46c6ecda38db	00030000-56ab-8f32-ad2c-21ad1b6c6291
00020000-56ab-8f34-c33e-47021c819f60	00030000-56ab-8f32-99f9-627bcb85efe0
00020000-56ab-8f34-6d95-5e5ec8fa932e	00030000-56ab-8f32-4df2-24fe36256ae2
00020000-56ab-8f34-f6f9-9017ebe097f2	00030000-56ab-8f32-f0af-8a9b797a6a16
00020000-56ab-8f34-af89-d082fb874610	00030000-56ab-8f32-dbff-137a0bbee56b
00020000-56ab-8f34-af89-d082fb874610	00030000-56ab-8f32-bc73-26e162650b2e
00020000-56ab-8f34-af89-d082fb874610	00030000-56ab-8f32-ad3d-35fa799ca48f
00020000-56ab-8f34-b239-d97f08864f63	00030000-56ab-8f32-38b4-a73b24e5ab1e
00020000-56ab-8f34-4be9-51556df27a34	00030000-56ab-8f32-d1ca-e0f7541b4161
00020000-56ab-8f34-c230-90f4c5a47946	00030000-56ab-8f32-0153-4ce12e444a75
00020000-56ab-8f34-29e6-9e519c3691fe	00030000-56ab-8f32-84c9-1cb72b0cdfcf
00020000-56ab-8f34-56b1-af25e24b8ed7	00030000-56ab-8f32-43bc-0286d52cafde
00020000-56ab-8f34-e65d-8b91a95a4481	00030000-56ab-8f32-5a75-712198ad8d93
00020000-56ab-8f34-6bc1-64fd122879bd	00030000-56ab-8f32-87b4-804ff9eceaa1
00020000-56ab-8f34-27b9-ce00803af23a	00030000-56ab-8f32-18ba-c406f344f2d0
00020000-56ab-8f34-d723-f7c174d9e2b0	00030000-56ab-8f32-98d0-287ef2d96ff7
00020000-56ab-8f34-340f-9a4aec700376	00030000-56ab-8f32-be67-c8151b63dd22
00020000-56ab-8f34-fb50-43f992ece51e	00030000-56ab-8f32-8f90-cda313793c24
00020000-56ab-8f34-98ad-a4e34b002a0b	00030000-56ab-8f32-0ed0-5b03a52077e7
00020000-56ab-8f34-cfc0-d66328aa7272	00030000-56ab-8f32-d717-0a9d50bd8e09
00020000-56ab-8f34-4436-62ea9c75098e	00030000-56ab-8f32-a15e-8e5bd8921e87
00020000-56ab-8f34-72d0-0c083b7e980c	00030000-56ab-8f32-6adc-58cb47942a30
00020000-56ab-8f34-3768-0668b6672b2c	00030000-56ab-8f32-0bdc-4206cef66a0f
00020000-56ab-8f34-1e8a-b9f51b2094c7	00030000-56ab-8f32-2ba8-5f4fb0cd5fbd
00020000-56ab-8f34-de3f-03ef2b4b4ee4	00030000-56ab-8f32-dce2-50c3a67b08d2
00020000-56ab-8f34-f6a9-ef70c367b82e	00030000-56ab-8f32-4667-07972df4b119
\.


--
-- TOC entry 3181 (class 0 OID 42075983)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 42076018)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 42076151)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56ab-8f35-7df4-37677b471230	00090000-56ab-8f35-ab2a-0bd8bcd95c9f	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56ab-8f35-f92e-0512f5568a5f	00090000-56ab-8f35-e997-f1ab81910b60	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56ab-8f35-d7f9-0d9fc2e87180	00090000-56ab-8f35-8622-b3d327ded8a2	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56ab-8f35-f5b8-28804c77d5f6	00090000-56ab-8f35-2811-93f1482f70c4	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 42075668)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56ab-8f34-9901-de8229192597	\N	00040000-56ab-8f32-0640-8976702f7284	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-8f34-b5ce-d9b803029303	\N	00040000-56ab-8f32-0640-8976702f7284	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56ab-8f34-1699-5c53efafbc62	\N	00040000-56ab-8f32-0640-8976702f7284	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-8f34-f9de-16d1b6c472b5	\N	00040000-56ab-8f32-0640-8976702f7284	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-8f34-7233-b3859e78a065	\N	00040000-56ab-8f32-0640-8976702f7284	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-8f34-e972-98baebd057f1	\N	00040000-56ab-8f32-30a4-460bf4379d45	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-8f34-fcdf-0e2fbe7801d5	\N	00040000-56ab-8f32-b98d-40028fa24e77	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-8f34-40a2-f78bf39b4897	\N	00040000-56ab-8f32-5eb3-ba16698eb14e	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-8f34-96c7-0cf140935a9d	\N	00040000-56ab-8f32-487c-b6dc9111ba02	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-8f37-ef96-a3f420de4bdf	\N	00040000-56ab-8f32-0640-8976702f7284	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 42075713)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56ab-8f31-610b-ac1202ff6b31	8341	Adlešiči
00050000-56ab-8f31-179a-076fe7a31ab4	5270	Ajdovščina
00050000-56ab-8f31-089c-d206dc657482	6280	Ankaran/Ancarano
00050000-56ab-8f31-08ea-5d2f07486faf	9253	Apače
00050000-56ab-8f31-87b6-af3e9a928fde	8253	Artiče
00050000-56ab-8f31-e688-7e0c08adf393	4275	Begunje na Gorenjskem
00050000-56ab-8f31-554f-7f2f6931a80c	1382	Begunje pri Cerknici
00050000-56ab-8f31-7874-b697240b74ca	9231	Beltinci
00050000-56ab-8f31-9f3d-4195c191a54a	2234	Benedikt
00050000-56ab-8f31-377a-5bc4ebc9cdff	2345	Bistrica ob Dravi
00050000-56ab-8f31-f729-b852c60011a3	3256	Bistrica ob Sotli
00050000-56ab-8f31-9420-abbc9bec87f8	8259	Bizeljsko
00050000-56ab-8f31-3793-e14b86630a44	1223	Blagovica
00050000-56ab-8f31-f8fc-fe288ac864f0	8283	Blanca
00050000-56ab-8f31-6e11-d52d1689d660	4260	Bled
00050000-56ab-8f31-1939-a5d450bf8eb3	4273	Blejska Dobrava
00050000-56ab-8f31-0662-74ea142783e0	9265	Bodonci
00050000-56ab-8f31-a671-02ab9ad7f435	9222	Bogojina
00050000-56ab-8f31-ce71-fd2dce8ec5a1	4263	Bohinjska Bela
00050000-56ab-8f31-0ee8-70a3dd661945	4264	Bohinjska Bistrica
00050000-56ab-8f31-f0a1-4f65da8efa4b	4265	Bohinjsko jezero
00050000-56ab-8f31-efca-cea7e8be6c98	1353	Borovnica
00050000-56ab-8f31-6519-0929aa971f8b	8294	Boštanj
00050000-56ab-8f31-066f-7ae4fae9baa5	5230	Bovec
00050000-56ab-8f31-4f40-4c3b4429f662	5295	Branik
00050000-56ab-8f31-b719-3bd5d27c11fe	3314	Braslovče
00050000-56ab-8f31-ebe5-d8ac9debec1d	5223	Breginj
00050000-56ab-8f31-806a-4c0689aebc1a	8280	Brestanica
00050000-56ab-8f31-eeae-ee462c569f6a	2354	Bresternica
00050000-56ab-8f31-d245-29ab1ec18128	4243	Brezje
00050000-56ab-8f31-d0c9-114a35ea7e75	1351	Brezovica pri Ljubljani
00050000-56ab-8f31-dd94-6f99d4018605	8250	Brežice
00050000-56ab-8f31-eb41-2f014bba6ed5	4210	Brnik - Aerodrom
00050000-56ab-8f31-cbaa-9e22092bd66f	8321	Brusnice
00050000-56ab-8f31-e9fc-c0e20d358cc1	3255	Buče
00050000-56ab-8f31-4543-1a798fc79297	8276	Bučka 
00050000-56ab-8f31-4903-67d2327b7470	9261	Cankova
00050000-56ab-8f31-f984-844a0d44870f	3000	Celje 
00050000-56ab-8f31-6708-b6064be545d9	3001	Celje - poštni predali
00050000-56ab-8f31-57ae-c05ca4f2f6ed	4207	Cerklje na Gorenjskem
00050000-56ab-8f31-99c2-f5973867b0a7	8263	Cerklje ob Krki
00050000-56ab-8f31-5e31-bcbcd1f9c032	1380	Cerknica
00050000-56ab-8f31-a9f4-0f278d0ae204	5282	Cerkno
00050000-56ab-8f31-6ae3-2160978aa23b	2236	Cerkvenjak
00050000-56ab-8f31-bd07-12f260cdd3f4	2215	Ceršak
00050000-56ab-8f31-0531-3ae3d9b54141	2326	Cirkovce
00050000-56ab-8f31-1b3f-00950900a821	2282	Cirkulane
00050000-56ab-8f31-6707-5415fa956f39	5273	Col
00050000-56ab-8f31-2001-4f9472b40ddc	8251	Čatež ob Savi
00050000-56ab-8f31-393a-334173c63a88	1413	Čemšenik
00050000-56ab-8f31-6244-d884d38670cf	5253	Čepovan
00050000-56ab-8f31-843a-7bf14b8559b8	9232	Črenšovci
00050000-56ab-8f31-fa5e-8a028d324c9a	2393	Črna na Koroškem
00050000-56ab-8f31-92ee-d71b9479ed37	6275	Črni Kal
00050000-56ab-8f31-4c3d-9e6df7cc58ab	5274	Črni Vrh nad Idrijo
00050000-56ab-8f31-4fdb-6d3219638a37	5262	Črniče
00050000-56ab-8f31-49d6-08bb10a01c68	8340	Črnomelj
00050000-56ab-8f31-660a-80e6d40a9a46	6271	Dekani
00050000-56ab-8f31-df92-27da61bcd16e	5210	Deskle
00050000-56ab-8f31-a535-243104993809	2253	Destrnik
00050000-56ab-8f31-7800-423db39c229b	6215	Divača
00050000-56ab-8f31-cff3-c3b0c8af5950	1233	Dob
00050000-56ab-8f31-189c-c4734c77f121	3224	Dobje pri Planini
00050000-56ab-8f31-1930-1bc20ef2bfd0	8257	Dobova
00050000-56ab-8f31-79e0-b09553aff525	1423	Dobovec
00050000-56ab-8f31-03fd-9795732359eb	5263	Dobravlje
00050000-56ab-8f31-9c29-69c7cfc7ac19	3204	Dobrna
00050000-56ab-8f31-f2cf-e4d6d0e807a8	8211	Dobrnič
00050000-56ab-8f31-82f7-aa69f945e76b	1356	Dobrova
00050000-56ab-8f31-c327-5abf752ae7c3	9223	Dobrovnik/Dobronak 
00050000-56ab-8f31-32fb-775c98bd2164	5212	Dobrovo v Brdih
00050000-56ab-8f31-9006-86aa4b2fca32	1431	Dol pri Hrastniku
00050000-56ab-8f31-e4f0-6fc52908400e	1262	Dol pri Ljubljani
00050000-56ab-8f31-f921-720eab8eddf1	1273	Dole pri Litiji
00050000-56ab-8f31-1f04-bfec7194efe1	1331	Dolenja vas
00050000-56ab-8f31-5b01-9b8eaef72b68	8350	Dolenjske Toplice
00050000-56ab-8f31-f88a-4fef00404078	1230	Domžale
00050000-56ab-8f31-0892-a3cccc0709c3	2252	Dornava
00050000-56ab-8f31-44ae-44fe5c477904	5294	Dornberk
00050000-56ab-8f31-8669-c6c1e732703d	1319	Draga
00050000-56ab-8f31-d148-9779536b3c21	8343	Dragatuš
00050000-56ab-8f31-0289-95a6d7b78728	3222	Dramlje
00050000-56ab-8f31-231a-a1eda5d7e928	2370	Dravograd
00050000-56ab-8f31-8d5b-810e73848cdc	4203	Duplje
00050000-56ab-8f31-3157-12703ab9e6ad	6221	Dutovlje
00050000-56ab-8f31-f9f6-2966639557b5	8361	Dvor
00050000-56ab-8f31-6b86-ee3b558b78dc	2343	Fala
00050000-56ab-8f31-ace9-483197fe7965	9208	Fokovci
00050000-56ab-8f31-b9e1-626d3b4932e9	2313	Fram
00050000-56ab-8f31-4e6a-a92079717001	3213	Frankolovo
00050000-56ab-8f31-c59c-a809b21e0231	1274	Gabrovka
00050000-56ab-8f31-c525-f10e742d0664	8254	Globoko
00050000-56ab-8f31-f431-12150fc6ab45	5275	Godovič
00050000-56ab-8f31-7e56-b69ffaaae69a	4204	Golnik
00050000-56ab-8f31-4276-e726650c8916	3303	Gomilsko
00050000-56ab-8f31-a47c-7b4a51345698	4224	Gorenja vas
00050000-56ab-8f31-6734-122bbd4f9e92	3263	Gorica pri Slivnici
00050000-56ab-8f31-4cfe-a84738983d56	2272	Gorišnica
00050000-56ab-8f31-1c31-4249a5a1ac65	9250	Gornja Radgona
00050000-56ab-8f31-91fa-c0f4eb63e84a	3342	Gornji Grad
00050000-56ab-8f31-ca40-c4f9932911af	4282	Gozd Martuljek
00050000-56ab-8f31-48cc-db55d21264e6	6272	Gračišče
00050000-56ab-8f31-15c0-e2d0c5e93676	9264	Grad
00050000-56ab-8f31-f385-2e10c3ca0059	8332	Gradac
00050000-56ab-8f31-9b5f-db4705cf39e6	1384	Grahovo
00050000-56ab-8f31-6702-d8e681f34aad	5242	Grahovo ob Bači
00050000-56ab-8f31-e125-f3ec6ad4d430	5251	Grgar
00050000-56ab-8f31-6033-a9366ca372e7	3302	Griže
00050000-56ab-8f31-c815-88c2893dc7e1	3231	Grobelno
00050000-56ab-8f31-c72d-e8eb1f6bd85d	1290	Grosuplje
00050000-56ab-8f31-ff63-0cf6c0d24e6a	2288	Hajdina
00050000-56ab-8f31-83bf-a2b4f216ec7a	8362	Hinje
00050000-56ab-8f31-1e64-1e5b76b4911b	2311	Hoče
00050000-56ab-8f31-57f8-cd71f324c68b	9205	Hodoš/Hodos
00050000-56ab-8f31-0f9b-9c160823624b	1354	Horjul
00050000-56ab-8f31-7c0f-b407663d6952	1372	Hotedršica
00050000-56ab-8f31-0bc6-d0f8eff0118f	1430	Hrastnik
00050000-56ab-8f31-be6b-fbda724a106f	6225	Hruševje
00050000-56ab-8f31-c50c-f72d38accbe2	4276	Hrušica
00050000-56ab-8f31-ac68-c0e8313aa2e8	5280	Idrija
00050000-56ab-8f31-f955-c8e4a964045d	1292	Ig
00050000-56ab-8f31-acfc-e39cf28c532b	6250	Ilirska Bistrica
00050000-56ab-8f31-b479-b855f486df87	6251	Ilirska Bistrica-Trnovo
00050000-56ab-8f31-2d82-c27df0592d20	1295	Ivančna Gorica
00050000-56ab-8f31-2dbd-54f1c973778f	2259	Ivanjkovci
00050000-56ab-8f31-6cfa-7285d650d692	1411	Izlake
00050000-56ab-8f31-6335-88e308be621e	6310	Izola/Isola
00050000-56ab-8f31-aa8f-662506b8a8e7	2222	Jakobski Dol
00050000-56ab-8f31-8119-7d1dfa0af184	2221	Jarenina
00050000-56ab-8f31-93c2-599135c4a54a	6254	Jelšane
00050000-56ab-8f31-6709-e1136e0a2ffa	4270	Jesenice
00050000-56ab-8f31-533b-3cccabe186e4	8261	Jesenice na Dolenjskem
00050000-56ab-8f31-073c-711859837302	3273	Jurklošter
00050000-56ab-8f31-bc8d-084c3a04c6bb	2223	Jurovski Dol
00050000-56ab-8f31-bc12-b40a01a23f69	2256	Juršinci
00050000-56ab-8f31-7975-beb556bbd067	5214	Kal nad Kanalom
00050000-56ab-8f31-c5d2-21b59cc7a795	3233	Kalobje
00050000-56ab-8f31-1772-f6e71c85bbf9	4246	Kamna Gorica
00050000-56ab-8f31-28de-353286b499cd	2351	Kamnica
00050000-56ab-8f31-ded6-f6aa9164846e	1241	Kamnik
00050000-56ab-8f31-602e-dcc89ad10481	5213	Kanal
00050000-56ab-8f31-2fba-9dc2cb474dfa	8258	Kapele
00050000-56ab-8f31-86bd-07a277b386d4	2362	Kapla
00050000-56ab-8f31-b464-784e0a678e6a	2325	Kidričevo
00050000-56ab-8f31-d8c2-65571ef4247b	1412	Kisovec
00050000-56ab-8f31-65ee-71d42c46e950	6253	Knežak
00050000-56ab-8f31-795b-1c1b0a16426b	5222	Kobarid
00050000-56ab-8f31-521f-a21f54c4d4b3	9227	Kobilje
00050000-56ab-8f31-3016-d8b15c310d41	1330	Kočevje
00050000-56ab-8f31-4f37-bad589ff832f	1338	Kočevska Reka
00050000-56ab-8f31-c2cd-4cf0401fdeb8	2276	Kog
00050000-56ab-8f31-2782-de602dd8ca56	5211	Kojsko
00050000-56ab-8f31-a60e-91dd1c7edd95	6223	Komen
00050000-56ab-8f31-7835-16e05f62d26c	1218	Komenda
00050000-56ab-8f31-080b-bc01bf47b1e3	6000	Koper/Capodistria 
00050000-56ab-8f31-399a-1147c017a9b1	6001	Koper/Capodistria - poštni predali
00050000-56ab-8f31-b9e6-0a2c48d31387	8282	Koprivnica
00050000-56ab-8f31-4be0-712132f73ba9	5296	Kostanjevica na Krasu
00050000-56ab-8f31-f552-01b26a40070a	8311	Kostanjevica na Krki
00050000-56ab-8f31-8988-decdbdb81c2c	1336	Kostel
00050000-56ab-8f31-03ff-b93f88695b2e	6256	Košana
00050000-56ab-8f31-8ab9-53c376b9171f	2394	Kotlje
00050000-56ab-8f31-e2dc-90fc235c7ceb	6240	Kozina
00050000-56ab-8f31-3bba-aa7860dfd233	3260	Kozje
00050000-56ab-8f31-cdd9-0d1599ed2359	4000	Kranj 
00050000-56ab-8f31-f1f5-bce69c755fb1	4001	Kranj - poštni predali
00050000-56ab-8f31-246f-10ef1c6e0a9c	4280	Kranjska Gora
00050000-56ab-8f31-edc7-b84d2e7af100	1281	Kresnice
00050000-56ab-8f31-d275-7b2e03012ab0	4294	Križe
00050000-56ab-8f31-01bd-862c10dd9945	9206	Križevci
00050000-56ab-8f31-9999-8888c3523e7f	9242	Križevci pri Ljutomeru
00050000-56ab-8f31-5cb8-7a3b4fb7b1f4	1301	Krka
00050000-56ab-8f31-4ab2-866a3f750778	8296	Krmelj
00050000-56ab-8f31-73b7-ff4c88dd986d	4245	Kropa
00050000-56ab-8f31-5525-388a2871b4a6	8262	Krška vas
00050000-56ab-8f31-b202-46e039f5f7ff	8270	Krško
00050000-56ab-8f31-aa7c-2b1aba9a4a31	9263	Kuzma
00050000-56ab-8f31-2886-ec7b22ad428e	2318	Laporje
00050000-56ab-8f31-a585-a4178fb925eb	3270	Laško
00050000-56ab-8f31-02f4-5174f6c5298b	1219	Laze v Tuhinju
00050000-56ab-8f31-3391-bca11988807a	2230	Lenart v Slovenskih goricah
00050000-56ab-8f31-ebd2-359cff2a600d	9220	Lendava/Lendva
00050000-56ab-8f31-c645-2668a9d5e5e4	4248	Lesce
00050000-56ab-8f31-263e-aa923ac20c53	3261	Lesično
00050000-56ab-8f31-acac-f49c28709f68	8273	Leskovec pri Krškem
00050000-56ab-8f31-fe41-f023d580e2bb	2372	Libeliče
00050000-56ab-8f31-ab7a-c95a555c7c89	2341	Limbuš
00050000-56ab-8f31-43bc-018e413df81d	1270	Litija
00050000-56ab-8f31-fd6c-661c5c5b50d6	3202	Ljubečna
00050000-56ab-8f31-2d95-ad473bc478e0	1000	Ljubljana 
00050000-56ab-8f31-5558-9f768f9254ef	1001	Ljubljana - poštni predali
00050000-56ab-8f31-0ad7-bfd0ff5b103a	1231	Ljubljana - Črnuče
00050000-56ab-8f31-c55b-1ff910545c15	1261	Ljubljana - Dobrunje
00050000-56ab-8f31-bdf3-41fb7c993a0b	1260	Ljubljana - Polje
00050000-56ab-8f31-2cb4-966a36ffe8d1	1210	Ljubljana - Šentvid
00050000-56ab-8f31-f57f-b418d09f7f12	1211	Ljubljana - Šmartno
00050000-56ab-8f31-f442-38725b181e17	3333	Ljubno ob Savinji
00050000-56ab-8f31-51ac-32c2698476ec	9240	Ljutomer
00050000-56ab-8f31-dbfe-faf4d12b3a49	3215	Loče
00050000-56ab-8f31-de25-637f837aad2a	5231	Log pod Mangartom
00050000-56ab-8f31-4eca-6c4e95bf93a9	1358	Log pri Brezovici
00050000-56ab-8f31-0cd4-8b31ab2598e5	1370	Logatec
00050000-56ab-8f31-95e5-d3241eeb439a	1371	Logatec
00050000-56ab-8f31-0f93-03962ee9d88b	1434	Loka pri Zidanem Mostu
00050000-56ab-8f31-ee2c-7f6904c6fba3	3223	Loka pri Žusmu
00050000-56ab-8f31-a379-a97ae477f8f9	6219	Lokev
00050000-56ab-8f31-040c-31aecbb639be	1318	Loški Potok
00050000-56ab-8f31-9c75-283605a89a25	2324	Lovrenc na Dravskem polju
00050000-56ab-8f31-6a7b-7a911be0a622	2344	Lovrenc na Pohorju
00050000-56ab-8f31-4178-47367b9e7f9f	3334	Luče
00050000-56ab-8f31-6816-a99803eb2aff	1225	Lukovica
00050000-56ab-8f31-ccb9-e6e2f0eefe48	9202	Mačkovci
00050000-56ab-8f31-a8ac-b71365577ef8	2322	Majšperk
00050000-56ab-8f31-36dd-06d91f27a797	2321	Makole
00050000-56ab-8f31-2819-90a5c469e1d1	9243	Mala Nedelja
00050000-56ab-8f31-fac1-ce718dffe110	2229	Malečnik
00050000-56ab-8f31-f0ec-0f9e9fd2d4d7	6273	Marezige
00050000-56ab-8f31-c353-c5d7ad726b11	2000	Maribor 
00050000-56ab-8f31-6bd9-a9f3c21be33a	2001	Maribor - poštni predali
00050000-56ab-8f31-224e-242f2e5bab42	2206	Marjeta na Dravskem polju
00050000-56ab-8f31-b61d-a76f114dc899	2281	Markovci
00050000-56ab-8f31-f0c9-062ff3c7b394	9221	Martjanci
00050000-56ab-8f31-f694-af5eb3e600ed	6242	Materija
00050000-56ab-8f31-106f-4b8cfa3d50fe	4211	Mavčiče
00050000-56ab-8f31-7430-edeb2bf1842a	1215	Medvode
00050000-56ab-8f31-a0dc-17257508d6a1	1234	Mengeš
00050000-56ab-8f31-2aa8-d48ffc4144ae	8330	Metlika
00050000-56ab-8f31-21ec-a2e266004fd3	2392	Mežica
00050000-56ab-8f31-e88c-abe59faa97ec	2204	Miklavž na Dravskem polju
00050000-56ab-8f31-799c-8aa0f9f56abc	2275	Miklavž pri Ormožu
00050000-56ab-8f31-2680-fd19a098f6cb	5291	Miren
00050000-56ab-8f31-c14b-5628e3cb9495	8233	Mirna
00050000-56ab-8f31-3ddd-adee6feca1b5	8216	Mirna Peč
00050000-56ab-8f31-247c-73d865723706	2382	Mislinja
00050000-56ab-8f31-2898-44777c2b15da	4281	Mojstrana
00050000-56ab-8f31-f6c7-8e3087560add	8230	Mokronog
00050000-56ab-8f31-d0fa-0f9c7aee813e	1251	Moravče
00050000-56ab-8f31-1205-1edbd67b9c22	9226	Moravske Toplice
00050000-56ab-8f31-cc0a-b294a7199cc9	5216	Most na Soči
00050000-56ab-8f31-38e7-d54041505fbb	1221	Motnik
00050000-56ab-8f31-3984-86d914397fab	3330	Mozirje
00050000-56ab-8f31-d4dd-155e4a7ccef7	9000	Murska Sobota 
00050000-56ab-8f31-0a70-9d156d9937da	9001	Murska Sobota - poštni predali
00050000-56ab-8f31-8c5c-9a6756641155	2366	Muta
00050000-56ab-8f31-a58e-a6633e473c96	4202	Naklo
00050000-56ab-8f31-3864-bdf719822e0f	3331	Nazarje
00050000-56ab-8f31-d5df-888364c7a8d3	1357	Notranje Gorice
00050000-56ab-8f31-b519-5ff029694c5c	3203	Nova Cerkev
00050000-56ab-8f31-de21-27b468d51294	5000	Nova Gorica 
00050000-56ab-8f31-f40e-252c8f266851	5001	Nova Gorica - poštni predali
00050000-56ab-8f31-1cf7-cdf7dd686979	1385	Nova vas
00050000-56ab-8f31-032d-49edc1339aa0	8000	Novo mesto
00050000-56ab-8f31-ec21-9899b6b043aa	8001	Novo mesto - poštni predali
00050000-56ab-8f31-bbcc-02d728a3be59	6243	Obrov
00050000-56ab-8f31-f31b-452aa5f8e6af	9233	Odranci
00050000-56ab-8f31-eebe-dcae61d9495f	2317	Oplotnica
00050000-56ab-8f31-5489-bf5cfcea1b1c	2312	Orehova vas
00050000-56ab-8f31-82f8-1ef391429e6d	2270	Ormož
00050000-56ab-8f31-1539-5a797b07b6b7	1316	Ortnek
00050000-56ab-8f31-e93c-d3c1c282c4ca	1337	Osilnica
00050000-56ab-8f31-abc4-8eaf950e3501	8222	Otočec
00050000-56ab-8f31-74ae-b280695799c9	2361	Ožbalt
00050000-56ab-8f31-2ea8-62b87e68f221	2231	Pernica
00050000-56ab-8f31-dbb5-b77b7c5bef09	2211	Pesnica pri Mariboru
00050000-56ab-8f31-496c-a2724e866be3	9203	Petrovci
00050000-56ab-8f31-1af5-7ed5d06238e2	3301	Petrovče
00050000-56ab-8f31-3b13-1e39cd2711b7	6330	Piran/Pirano
00050000-56ab-8f31-c177-8d1e280cbb53	8255	Pišece
00050000-56ab-8f31-c45d-455366a136ba	6257	Pivka
00050000-56ab-8f31-a6aa-4da5e69c58fb	6232	Planina
00050000-56ab-8f31-0445-9366276c253c	3225	Planina pri Sevnici
00050000-56ab-8f31-bf21-39549ed7c964	6276	Pobegi
00050000-56ab-8f31-ede2-beb2ac70a4ab	8312	Podbočje
00050000-56ab-8f31-dae6-2e69dcb8bbaf	5243	Podbrdo
00050000-56ab-8f31-248c-a9b988324f6b	3254	Podčetrtek
00050000-56ab-8f31-69fe-9c93d1dbe734	2273	Podgorci
00050000-56ab-8f31-b72a-0eb3b4c5dd24	6216	Podgorje
00050000-56ab-8f31-bc76-90df1614f47c	2381	Podgorje pri Slovenj Gradcu
00050000-56ab-8f31-5d83-4e5d4458f312	6244	Podgrad
00050000-56ab-8f31-8d30-44c00f3601d7	1414	Podkum
00050000-56ab-8f31-4aa3-34c6ec44852a	2286	Podlehnik
00050000-56ab-8f31-cbb1-df2ccc3e0547	5272	Podnanos
00050000-56ab-8f31-df84-399c08b72d7b	4244	Podnart
00050000-56ab-8f31-eeec-abf54b11f2fc	3241	Podplat
00050000-56ab-8f31-95a0-776290293cc7	3257	Podsreda
00050000-56ab-8f31-2952-420db15ce4a4	2363	Podvelka
00050000-56ab-8f31-655a-d7f5a3681059	2208	Pohorje
00050000-56ab-8f31-200f-bd3704a83e2e	2257	Polenšak
00050000-56ab-8f31-421a-36e0ab46da19	1355	Polhov Gradec
00050000-56ab-8f31-6c1f-67dc46eba600	4223	Poljane nad Škofjo Loko
00050000-56ab-8f31-73fb-64fa3629986f	2319	Poljčane
00050000-56ab-8f31-59fb-f2be5daa17fb	1272	Polšnik
00050000-56ab-8f31-7986-a2f38922c0cd	3313	Polzela
00050000-56ab-8f31-e92d-512331c3c909	3232	Ponikva
00050000-56ab-8f31-c71f-f6b474345cad	6320	Portorož/Portorose
00050000-56ab-8f31-ade6-ead8f324200a	6230	Postojna
00050000-56ab-8f31-47db-12fbfc991070	2331	Pragersko
00050000-56ab-8f31-3bc1-139fc730782b	3312	Prebold
00050000-56ab-8f31-9d13-0b1b88bf1dc8	4205	Preddvor
00050000-56ab-8f31-36ef-64ec2d03b7c8	6255	Prem
00050000-56ab-8f31-641a-50ebe9a77569	1352	Preserje
00050000-56ab-8f31-8485-7a97ffc6f92a	6258	Prestranek
00050000-56ab-8f31-5c33-38bdef2631b7	2391	Prevalje
00050000-56ab-8f31-1134-756d8b90292c	3262	Prevorje
00050000-56ab-8f31-9541-aabd2988b0dd	1276	Primskovo 
00050000-56ab-8f31-4138-9f46e64fc5d2	3253	Pristava pri Mestinju
00050000-56ab-8f31-ea0c-71ff689f675c	9207	Prosenjakovci/Partosfalva
00050000-56ab-8f31-a163-c280cae0df8c	5297	Prvačina
00050000-56ab-8f31-f4ee-5e192aba5f81	2250	Ptuj
00050000-56ab-8f31-8361-081a0e6f691d	2323	Ptujska Gora
00050000-56ab-8f31-c3ec-cfb9b1775842	9201	Puconci
00050000-56ab-8f31-59b1-374b18c12d45	2327	Rače
00050000-56ab-8f31-ff5a-5cfb2116394c	1433	Radeče
00050000-56ab-8f31-ae37-95b47c8aa98c	9252	Radenci
00050000-56ab-8f31-4a2b-85b2bb7ebddc	2360	Radlje ob Dravi
00050000-56ab-8f31-d073-ad1768f30880	1235	Radomlje
00050000-56ab-8f31-afa0-dbe9a553f626	4240	Radovljica
00050000-56ab-8f31-64ff-3fb91b0ec994	8274	Raka
00050000-56ab-8f31-fdca-785ffa592577	1381	Rakek
00050000-56ab-8f31-7bde-190bfad378b1	4283	Rateče - Planica
00050000-56ab-8f31-78f3-e35cd90a1584	2390	Ravne na Koroškem
00050000-56ab-8f31-f033-c15aa73c1516	9246	Razkrižje
00050000-56ab-8f31-e9c2-26a6b11672a3	3332	Rečica ob Savinji
00050000-56ab-8f31-3f9c-55c562be38a1	5292	Renče
00050000-56ab-8f31-98db-4e168a03a9c3	1310	Ribnica
00050000-56ab-8f31-4161-cad918f0c755	2364	Ribnica na Pohorju
00050000-56ab-8f31-0271-4b1f2c8f6ab8	3272	Rimske Toplice
00050000-56ab-8f31-b03c-8da6dd536dc9	1314	Rob
00050000-56ab-8f31-fa35-f4730c77c206	5215	Ročinj
00050000-56ab-8f31-4cf6-b48c22c222b5	3250	Rogaška Slatina
00050000-56ab-8f31-a9d3-c01ca55078b3	9262	Rogašovci
00050000-56ab-8f31-4326-1482982c1d15	3252	Rogatec
00050000-56ab-8f31-0f8a-28b2f9a69bb1	1373	Rovte
00050000-56ab-8f31-9e0f-e36faa7356cf	2342	Ruše
00050000-56ab-8f31-d711-b0c8f26c0ac6	1282	Sava
00050000-56ab-8f31-4251-3f3725b276e9	6333	Sečovlje/Sicciole
00050000-56ab-8f31-f56a-177d09eabbbb	4227	Selca
00050000-56ab-8f31-74ed-c6db9d160055	2352	Selnica ob Dravi
00050000-56ab-8f31-2304-f94bf982e161	8333	Semič
00050000-56ab-8f31-6746-19207f163fea	8281	Senovo
00050000-56ab-8f31-9af3-6f3c91a35aae	6224	Senožeče
00050000-56ab-8f31-dbd6-6bbedd419cc1	8290	Sevnica
00050000-56ab-8f31-a4ea-2dcccc5d95a6	6210	Sežana
00050000-56ab-8f31-a3c2-14e7077c82f7	2214	Sladki Vrh
00050000-56ab-8f31-2a82-b0b4160cb6e8	5283	Slap ob Idrijci
00050000-56ab-8f31-dd92-b391e5d416f9	2380	Slovenj Gradec
00050000-56ab-8f31-86ba-d8ed2accb119	2310	Slovenska Bistrica
00050000-56ab-8f31-129b-8186bbb1ea12	3210	Slovenske Konjice
00050000-56ab-8f31-1b1e-48bb95d6dd30	1216	Smlednik
00050000-56ab-8f31-831b-5725f6ee3254	5232	Soča
00050000-56ab-8f31-1bce-9a486105262c	1317	Sodražica
00050000-56ab-8f31-32e0-1c1c3949376a	3335	Solčava
00050000-56ab-8f31-e81d-79dfdf05fceb	5250	Solkan
00050000-56ab-8f31-ec4a-446b8e73f0b8	4229	Sorica
00050000-56ab-8f31-009c-5bd3b3ccfc57	4225	Sovodenj
00050000-56ab-8f31-158d-f650fa80d89d	5281	Spodnja Idrija
00050000-56ab-8f31-565c-3ec35360ea90	2241	Spodnji Duplek
00050000-56ab-8f31-5d5e-da84348a9680	9245	Spodnji Ivanjci
00050000-56ab-8f31-56b2-4457ad5890e8	2277	Središče ob Dravi
00050000-56ab-8f31-13ac-287b326f0519	4267	Srednja vas v Bohinju
00050000-56ab-8f31-d330-19f8470c9f2a	8256	Sromlje 
00050000-56ab-8f31-87ce-2ccfcb36cb4c	5224	Srpenica
00050000-56ab-8f31-50ec-8d7744e5241d	1242	Stahovica
00050000-56ab-8f31-d536-8d9334bb7580	1332	Stara Cerkev
00050000-56ab-8f31-067a-b2e9f5823470	8342	Stari trg ob Kolpi
00050000-56ab-8f31-e115-a18f503d0d9a	1386	Stari trg pri Ložu
00050000-56ab-8f31-b0ca-cb50be8c7b94	2205	Starše
00050000-56ab-8f31-cd84-712f71d616cc	2289	Stoperce
00050000-56ab-8f31-1c63-87a7690448ea	8322	Stopiče
00050000-56ab-8f31-f17c-c1c5a42ad33d	3206	Stranice
00050000-56ab-8f31-0186-46cab54a1339	8351	Straža
00050000-56ab-8f31-6320-500e99b7410e	1313	Struge
00050000-56ab-8f31-9746-1a3ab647b62c	8293	Studenec
00050000-56ab-8f31-e620-f9998ccf8b8f	8331	Suhor
00050000-56ab-8f31-0689-48c5bdff3442	2233	Sv. Ana v Slovenskih goricah
00050000-56ab-8f31-4022-0e3738f409fc	2235	Sv. Trojica v Slovenskih goricah
00050000-56ab-8f31-f393-027546e30b06	2353	Sveti Duh na Ostrem Vrhu
00050000-56ab-8f31-4414-f37f6318ea17	9244	Sveti Jurij ob Ščavnici
00050000-56ab-8f31-6315-aa353374e1d7	3264	Sveti Štefan
00050000-56ab-8f31-d97c-ce62f9fe5acb	2258	Sveti Tomaž
00050000-56ab-8f31-3fb4-ddbf78e4b420	9204	Šalovci
00050000-56ab-8f31-eff1-f821f449220c	5261	Šempas
00050000-56ab-8f31-cf39-61c583e6eea5	5290	Šempeter pri Gorici
00050000-56ab-8f31-8d69-c50f698345d7	3311	Šempeter v Savinjski dolini
00050000-56ab-8f31-309d-dda39ef62fcd	4208	Šenčur
00050000-56ab-8f31-a6d1-13f3607287d7	2212	Šentilj v Slovenskih goricah
00050000-56ab-8f31-e112-e6b4a317837b	8297	Šentjanž
00050000-56ab-8f31-65dc-093cc8e1e621	2373	Šentjanž pri Dravogradu
00050000-56ab-8f31-b265-1093db9e04f0	8310	Šentjernej
00050000-56ab-8f31-e056-bb8c452432ee	3230	Šentjur
00050000-56ab-8f31-f9f6-f0a5c9b9a9eb	3271	Šentrupert
00050000-56ab-8f31-0db3-ca1bd8aa4fb8	8232	Šentrupert
00050000-56ab-8f31-95f4-d3686dd64206	1296	Šentvid pri Stični
00050000-56ab-8f31-8406-d1df11482234	8275	Škocjan
00050000-56ab-8f31-ea16-e7d8c04b9134	6281	Škofije
00050000-56ab-8f31-7d03-46c7928bc28a	4220	Škofja Loka
00050000-56ab-8f31-dd4a-e753cd70975e	3211	Škofja vas
00050000-56ab-8f31-c450-6a883ccf9905	1291	Škofljica
00050000-56ab-8f31-4b95-174b8b4d599f	6274	Šmarje
00050000-56ab-8f31-cf64-2b8a75c356c8	1293	Šmarje - Sap
00050000-56ab-8f31-b53f-71ce2a31d5fb	3240	Šmarje pri Jelšah
00050000-56ab-8f31-7559-cd380acc7f62	8220	Šmarješke Toplice
00050000-56ab-8f31-c3ae-75e847a369dd	2315	Šmartno na Pohorju
00050000-56ab-8f31-24f6-e4a8aeb928a4	3341	Šmartno ob Dreti
00050000-56ab-8f31-3c97-5165f71ceb5d	3327	Šmartno ob Paki
00050000-56ab-8f31-0c90-4f35ed25689e	1275	Šmartno pri Litiji
00050000-56ab-8f31-d2e7-226574643d8c	2383	Šmartno pri Slovenj Gradcu
00050000-56ab-8f31-d10a-71b1f91fb3d8	3201	Šmartno v Rožni dolini
00050000-56ab-8f31-3bde-e19f47d8af68	3325	Šoštanj
00050000-56ab-8f31-8354-e477d31f65b5	6222	Štanjel
00050000-56ab-8f31-986f-c44aa6db2117	3220	Štore
00050000-56ab-8f31-18b9-9380b3254a94	3304	Tabor
00050000-56ab-8f31-e46b-e0180e746384	3221	Teharje
00050000-56ab-8f31-06b4-061c9d2e4eec	9251	Tišina
00050000-56ab-8f31-647d-40da00d21baa	5220	Tolmin
00050000-56ab-8f31-2411-201c85858e58	3326	Topolšica
00050000-56ab-8f31-3457-c20fd30b8626	2371	Trbonje
00050000-56ab-8f31-106a-8712e5377570	1420	Trbovlje
00050000-56ab-8f31-1edd-07bc80c81ff0	8231	Trebelno 
00050000-56ab-8f31-1011-56a93538bd68	8210	Trebnje
00050000-56ab-8f31-99dc-fc60a5adec8d	5252	Trnovo pri Gorici
00050000-56ab-8f31-d172-b43d7b85bcdd	2254	Trnovska vas
00050000-56ab-8f31-6344-3b0bd8d8c15d	1222	Trojane
00050000-56ab-8f31-f787-b5f174c16e70	1236	Trzin
00050000-56ab-8f31-c38c-c77f40e686cc	4290	Tržič
00050000-56ab-8f31-9408-42f436a3c0eb	8295	Tržišče
00050000-56ab-8f31-89e8-4202fde517aa	1311	Turjak
00050000-56ab-8f31-8b74-acdf91b84c43	9224	Turnišče
00050000-56ab-8f31-6558-5815710a9e48	8323	Uršna sela
00050000-56ab-8f31-01b7-547d6eeef545	1252	Vače
00050000-56ab-8f31-32a2-3e97a0c733e9	3320	Velenje 
00050000-56ab-8f31-3855-9a45ef114f98	3322	Velenje - poštni predali
00050000-56ab-8f31-92b6-4e03b9882c1f	8212	Velika Loka
00050000-56ab-8f31-13de-b6248d03b6e6	2274	Velika Nedelja
00050000-56ab-8f31-3025-59d2264d83f9	9225	Velika Polana
00050000-56ab-8f31-f38c-de1fa78e1e5e	1315	Velike Lašče
00050000-56ab-8f31-0b0e-d8ea0139dbcd	8213	Veliki Gaber
00050000-56ab-8f31-1ce8-a43c6478285e	9241	Veržej
00050000-56ab-8f31-1a2f-4df2a0bca734	1312	Videm - Dobrepolje
00050000-56ab-8f31-55ca-aa95b1937de0	2284	Videm pri Ptuju
00050000-56ab-8f31-9931-3ee3261a9297	8344	Vinica
00050000-56ab-8f31-4fe3-69bcd079120d	5271	Vipava
00050000-56ab-8f31-de6f-8be515436fa7	4212	Visoko
00050000-56ab-8f31-75de-89efe26e6d76	1294	Višnja Gora
00050000-56ab-8f31-61fe-ca279c8e6ddd	3205	Vitanje
00050000-56ab-8f31-18b2-16084787207d	2255	Vitomarci
00050000-56ab-8f31-fbc5-088217aff3f0	1217	Vodice
00050000-56ab-8f31-8506-cad285fa2ba3	3212	Vojnik\t
00050000-56ab-8f31-da18-9a5188cae27a	5293	Volčja Draga
00050000-56ab-8f31-5352-345ba35b75af	2232	Voličina
00050000-56ab-8f31-d9af-d5464c36a445	3305	Vransko
00050000-56ab-8f31-8583-073f1debe519	6217	Vremski Britof
00050000-56ab-8f31-375a-cadfb01efeef	1360	Vrhnika
00050000-56ab-8f31-6045-e9ce9fd6670b	2365	Vuhred
00050000-56ab-8f31-190a-f19fb0d984b5	2367	Vuzenica
00050000-56ab-8f31-a6b8-1e80c5cac3e8	8292	Zabukovje 
00050000-56ab-8f31-34a1-19a31cca4f09	1410	Zagorje ob Savi
00050000-56ab-8f31-6efd-9e15844cc3b0	1303	Zagradec
00050000-56ab-8f31-ff79-1729d029576e	2283	Zavrč
00050000-56ab-8f31-ae45-a5b95764b61d	8272	Zdole 
00050000-56ab-8f31-e65c-05511ae3e0bc	4201	Zgornja Besnica
00050000-56ab-8f31-f400-f782d7832d3e	2242	Zgornja Korena
00050000-56ab-8f31-bc27-dcba9202cbb4	2201	Zgornja Kungota
00050000-56ab-8f31-0213-a015191a13fb	2316	Zgornja Ložnica
00050000-56ab-8f31-4386-77e334d1372a	2314	Zgornja Polskava
00050000-56ab-8f31-341a-878b31e41aac	2213	Zgornja Velka
00050000-56ab-8f31-a6c2-0f3339d9ce5d	4247	Zgornje Gorje
00050000-56ab-8f31-04a9-5d571abe3164	4206	Zgornje Jezersko
00050000-56ab-8f31-d3c0-c46eca31ba5c	2285	Zgornji Leskovec
00050000-56ab-8f31-3db5-4c68020a00ba	1432	Zidani Most
00050000-56ab-8f31-5fcf-febe2b5eb2b6	3214	Zreče
00050000-56ab-8f31-fe64-d580e84f4d53	4209	Žabnica
00050000-56ab-8f31-6625-11e646ad8eb7	3310	Žalec
00050000-56ab-8f31-c5b7-cc034c14b6c3	4228	Železniki
00050000-56ab-8f31-40d9-49bbf7f50e58	2287	Žetale
00050000-56ab-8f31-3c64-b9c9452c960d	4226	Žiri
00050000-56ab-8f31-1afb-17871f56daea	4274	Žirovnica
00050000-56ab-8f31-a29c-f933da131420	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 42076388)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 42075958)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 42075698)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56ab-8f35-4518-9be566d930ea	00080000-56ab-8f34-9901-de8229192597	\N	00040000-56ab-8f32-0640-8976702f7284	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56ab-8f35-8091-e053e5127573	00080000-56ab-8f34-9901-de8229192597	\N	00040000-56ab-8f32-0640-8976702f7284	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56ab-8f35-2095-a977fdaaf2dd	00080000-56ab-8f34-b5ce-d9b803029303	\N	00040000-56ab-8f32-0640-8976702f7284	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 42075833)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56ab-8f32-6611-4490f8b14088	novo leto	1	1	\N	t
00430000-56ab-8f32-7179-ba0e62f5ac90	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56ab-8f32-977e-ef99eb437cb3	dan upora proti okupatorju	27	4	\N	t
00430000-56ab-8f32-2ad6-0066b0c1bafa	praznik dela	1	5	\N	t
00430000-56ab-8f32-02ac-d23ec8651ca2	praznik dela	2	5	\N	t
00430000-56ab-8f32-200a-89c4e21757db	dan Primoža Trubarja	8	6	\N	f
00430000-56ab-8f32-4fd2-9b0385b75cd1	dan državnosti	25	6	\N	t
00430000-56ab-8f32-4bb8-5b1a7cd476e6	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56ab-8f32-06ec-67871764344d	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56ab-8f32-80d6-7b74e459d385	dan suverenosti	25	10	\N	f
00430000-56ab-8f32-46e1-b428f4e839a7	dan spomina na mrtve	1	11	\N	t
00430000-56ab-8f32-f987-2b202db6048f	dan Rudolfa Maistra	23	11	\N	f
00430000-56ab-8f32-bcf4-cb1ba8585af8	božič	25	12	\N	t
00430000-56ab-8f32-359d-74df41cb8a08	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56ab-8f32-898c-b40e07ea2212	Marijino vnebovzetje	15	8	\N	t
00430000-56ab-8f32-4174-bf43ae978d5d	dan reformacije	31	10	\N	t
00430000-56ab-8f32-8e7e-1063acfce0d8	velikonočna nedelja	27	3	2016	t
00430000-56ab-8f32-df29-57468452d662	velikonočna nedelja	16	4	2017	t
00430000-56ab-8f32-55e8-c63538ab6f8a	velikonočna nedelja	1	4	2018	t
00430000-56ab-8f32-7847-3d1c97ff110b	velikonočna nedelja	21	4	2019	t
00430000-56ab-8f32-ff16-bba724d22463	velikonočna nedelja	12	4	2020	t
00430000-56ab-8f32-bbd7-1257178354d3	velikonočna nedelja	4	4	2021	t
00430000-56ab-8f32-ed20-506f25b93056	velikonočna nedelja	17	4	2022	t
00430000-56ab-8f32-2b8c-d792e274da3b	velikonočna nedelja	9	4	2023	t
00430000-56ab-8f32-a2e0-3fd4aadffbe0	velikonočna nedelja	31	3	2024	t
00430000-56ab-8f32-29ca-d54f914025a6	velikonočna nedelja	20	4	2025	t
00430000-56ab-8f32-ceef-3869bdb07bb0	velikonočna nedelja	5	4	2026	t
00430000-56ab-8f32-d7fa-680ca1112f24	velikonočna nedelja	28	3	2027	t
00430000-56ab-8f32-8fa9-152fcf6b61a8	velikonočna nedelja	16	4	2028	t
00430000-56ab-8f32-2afe-190bb310d684	velikonočna nedelja	1	4	2029	t
00430000-56ab-8f32-3354-c4c814826389	velikonočna nedelja	21	4	2030	t
00430000-56ab-8f32-629c-1c61de2098f2	velikonočni ponedeljek	28	3	2016	t
00430000-56ab-8f32-54b7-43806f9219b4	velikonočni ponedeljek	17	4	2017	t
00430000-56ab-8f32-f029-d661ae3977d5	velikonočni ponedeljek	2	4	2018	t
00430000-56ab-8f32-cffc-238570777d35	velikonočni ponedeljek	22	4	2019	t
00430000-56ab-8f32-c694-0223048a33ad	velikonočni ponedeljek	13	4	2020	t
00430000-56ab-8f32-aee6-8f55eb6d312c	velikonočni ponedeljek	5	4	2021	t
00430000-56ab-8f32-b6e5-64a9268f5e6b	velikonočni ponedeljek	18	4	2022	t
00430000-56ab-8f32-deb7-af7336507c50	velikonočni ponedeljek	10	4	2023	t
00430000-56ab-8f32-1f41-d2985d0823b7	velikonočni ponedeljek	1	4	2024	t
00430000-56ab-8f32-5d2d-77c05fed194b	velikonočni ponedeljek	21	4	2025	t
00430000-56ab-8f32-3d53-99789c4bf97a	velikonočni ponedeljek	6	4	2026	t
00430000-56ab-8f32-1709-7ae060d0237e	velikonočni ponedeljek	29	3	2027	t
00430000-56ab-8f32-805c-393e6f84bd5f	velikonočni ponedeljek	17	4	2028	t
00430000-56ab-8f32-273b-dd7e83a9e45d	velikonočni ponedeljek	2	4	2029	t
00430000-56ab-8f32-206e-0b6b9b13e885	velikonočni ponedeljek	22	4	2030	t
00430000-56ab-8f32-8512-376b0f36d868	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56ab-8f32-5c1a-31bbc093a5e1	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56ab-8f32-0416-f649f711c0d0	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56ab-8f32-999c-058c78b117bc	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56ab-8f32-3158-37be1ce32a9d	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56ab-8f32-5cf2-f951df7b00e3	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56ab-8f32-9e8e-0dab7aa2c1ce	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56ab-8f32-6485-e9814d57245d	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56ab-8f32-dc01-37e35754bdd4	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56ab-8f32-0a6c-04dab6deaabf	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56ab-8f32-59d1-c9862bae7f57	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56ab-8f32-9d9d-14e974e06014	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56ab-8f32-268d-a0079767bb24	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56ab-8f32-c37b-a058a084f80c	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56ab-8f32-d9dd-f32667f97953	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 42075802)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56ab-8f35-e390-301315d23b5b	000e0000-56ab-8f35-0ea5-f6884c9a9416	1	3	1
001b0000-56ab-8f35-429a-745855cc3df6	000e0000-56ab-8f35-0ea5-f6884c9a9416	2	4	2
001b0000-56ab-8f35-a5a3-7706d75fa0c7	000e0000-56ab-8f35-0ea5-f6884c9a9416	4	5	3
001b0000-56ab-8f35-8a39-05293d1a05f5	000e0000-56ab-8f35-0ea5-f6884c9a9416	\N	1	\N
001b0000-56ab-8f35-c341-398148cf5b47	000e0000-56ab-8f35-0ea5-f6884c9a9416	5	9	4
001b0000-56ab-8f35-ac71-f85e2b26c756	000e0000-56ab-8f35-0ea5-f6884c9a9416	7	10	5
001b0000-56ab-8f35-99e9-0334bdb5b080	000e0000-56ab-8f35-1644-2519393eecb8	3	2	1
001b0000-56ab-8f35-a228-105ba9fd1b7e	000e0000-56ab-8f35-1644-2519393eecb8	4	3	1
001b0000-56ab-8f35-321d-6957f7af6090	000e0000-56ab-8f35-0ea5-f6884c9a9416	\N	2	\N
001b0000-56ab-8f35-b846-80bb7465285f	000e0000-56ab-8f35-1644-2519393eecb8	\N	1	\N
001b0000-56ab-8f35-717a-369b2f7d05cf	000e0000-56ab-8f35-0ea5-f6884c9a9416	3	8	3
001b0000-56ab-8f35-2c00-a8ce8c27e8be	000e0000-56ab-8f35-0ea5-f6884c9a9416	2	11	1
001b0000-56ab-8f35-f105-9b7bdd23f33e	000e0000-56ab-8f35-1644-2519393eecb8	1	5	1
001b0000-56ab-8f35-9c1a-16dacfaf2a7e	000e0000-56ab-8f35-1644-2519393eecb8	6	4	2
001b0000-56ab-8f35-ef89-1e62dd5eada0	000e0000-56ab-8f35-0ea5-f6884c9a9416	1	6	1
001b0000-56ab-8f35-b578-aa9e9c1b7941	000e0000-56ab-8f35-0ea5-f6884c9a9416	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 42075808)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56ab-8f35-e390-301315d23b5b	000a0000-56ab-8f34-1a23-a7b5faeba7af
001b0000-56ab-8f35-e390-301315d23b5b	000a0000-56ab-8f34-6e7d-36171646f67d
001b0000-56ab-8f35-429a-745855cc3df6	000a0000-56ab-8f34-6e7d-36171646f67d
001b0000-56ab-8f35-429a-745855cc3df6	000a0000-56ab-8f34-4a4f-f149ec567e91
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 42075970)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 42076402)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 42076412)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56ab-8f35-9bb1-c31e48206e53	00080000-56ab-8f34-1699-5c53efafbc62	0987	AK
00190000-56ab-8f35-08ca-ccccb494c941	00080000-56ab-8f34-b5ce-d9b803029303	0989	AK
00190000-56ab-8f35-05e4-2722091394f3	00080000-56ab-8f34-f9de-16d1b6c472b5	0986	AK
00190000-56ab-8f35-5f96-0982846a9244	00080000-56ab-8f34-e972-98baebd057f1	0984	AK
00190000-56ab-8f35-41ae-845f19cbcae7	00080000-56ab-8f34-fcdf-0e2fbe7801d5	0983	AK
00190000-56ab-8f35-0ebc-98d274421a62	00080000-56ab-8f34-40a2-f78bf39b4897	0982	AK
00190000-56ab-8f37-7701-9dff4c5ccb92	00080000-56ab-8f37-ef96-a3f420de4bdf	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 42076301)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56ab-8f35-221d-b0e78fd2a854	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 42076420)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 42075998)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56ab-8f34-4800-5eeb4ed72510	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56ab-8f34-dfcf-9616735c9980	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56ab-8f34-7332-fbab713ea765	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56ab-8f34-582e-4dc7ac2ecbf1	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56ab-8f34-b944-69c2db02f6c7	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56ab-8f34-de7c-6d9c907f526b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56ab-8f34-ef41-2f2685e7b95d	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 42075943)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 42075933)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 42076140)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 42076070)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 42075776)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 42075537)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56ab-8f37-ef96-a3f420de4bdf	00010000-56ab-8f33-4716-439a6e3a7450	2016-01-29 17:11:35	INS	a:0:{}
2	App\\Entity\\Option	00000000-56ab-8f37-0448-068aead56925	00010000-56ab-8f33-4716-439a6e3a7450	2016-01-29 17:11:35	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56ab-8f37-7701-9dff4c5ccb92	00010000-56ab-8f33-4716-439a6e3a7450	2016-01-29 17:11:35	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 42076012)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 42075575)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56ab-8f32-6a66-44ace0c4fea4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56ab-8f32-f76e-dc7c1016857d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56ab-8f32-002b-fed6fdbaa44a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56ab-8f32-dd95-65712c815090	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56ab-8f32-eff2-d2358b373a76	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-8f32-85c4-a60cde488bbc	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-8f32-5d28-9db8f81c26e1	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56ab-8f32-12b8-72dfbe472185	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56ab-8f32-7587-9b88afb0ae41	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-8f32-64a4-f7573974b708	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-8f32-2292-f5f7bb01a4d4	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-8f32-cfe7-288f3edad9e9	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-8f32-f0b4-32d0222c1289	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-8f32-61db-34091f167b0e	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-8f32-e8cb-c35fc738800d	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-8f32-5cfa-b9f1024a3e6a	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-8f32-b352-ee923059294a	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56ab-8f32-122f-47ec032fab5d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56ab-8f32-cc55-5acbeed185eb	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56ab-8f32-ab3d-05a40f1999e9	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56ab-8f32-17ee-546dd1153a95	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-8f32-cb19-eda005fabe01	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-8f32-67f2-caf4a19a9a47	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-8f32-cc6e-768b4280fab9	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-8f32-bcd9-98cc6c848db5	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56ab-8f32-cb4e-259ef3f0914f	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56ab-8f32-bfe1-6de56449c126	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56ab-8f32-4106-062e6e70db4c	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56ab-8f32-1209-4be0caac2ac0	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-8f32-8c1d-47d497235d04	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-8f32-1ff7-6cf1f2ae609c	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-8f32-d280-8975d1350ab3	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-8f32-3ab8-9ad65804f573	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56ab-8f32-429d-8ccde908c585	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56ab-8f32-862a-c6e6b4cb1a18	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56ab-8f32-988b-60b26b294abb	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56ab-8f32-8a82-ce113701fd02	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-8f32-2eb5-2e8e90d8dccd	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-8f32-c0c7-d444ffdcbbbf	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56ab-8f32-4b07-679887527459	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-8f32-da0e-1200417dae52	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-8f32-a754-4dbb1369151f	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56ab-8f32-202c-c4123f37bc83	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-8f32-bbdd-4bfc77cbf011	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-8f32-bcfc-f001acea115c	direktor	minimalne pravice za direktorja	t
00020000-56ab-8f32-dd23-8cdb9d7207e5	arhivar	arhivar	t
00020000-56ab-8f32-c32b-5345717ff8c5	dramaturg	dramaturg	t
00020000-56ab-8f32-7ba9-89724fe6d890	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56ab-8f32-d1d8-e9d4ba786669	poslovni-sekretar	poslovni sekretar	t
00020000-56ab-8f32-91d4-5148ae406300	vodja-tehnike	vodja tehnike	t
00020000-56ab-8f32-bd8f-c52ad2b3e2e2	racunovodja	računovodja	t
00020000-56ab-8f34-7b79-1bca41e3a696	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56ab-8f34-aacf-284f9cfdefed	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-3ef5-4d200be48957	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-b3e4-9d63ab439f86	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-b083-a5d5a34bd04b	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-ccf0-8c95d14ae478	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-f547-83a26f00f46a	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-d6c2-c7ed3a9f25c7	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-36db-1360f57ee120	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-9213-1670545c341f	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-dc8d-08f9521fa400	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-d7c3-365fb697db63	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-e695-fb023131901e	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-4a82-24a4b1516bde	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-b1b7-3d34943a89ba	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-b79c-46c6ecda38db	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-c33e-47021c819f60	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-6d95-5e5ec8fa932e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-f6f9-9017ebe097f2	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-af89-d082fb874610	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56ab-8f34-b239-d97f08864f63	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-4be9-51556df27a34	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-c230-90f4c5a47946	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-29e6-9e519c3691fe	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-56b1-af25e24b8ed7	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-e65d-8b91a95a4481	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-6bc1-64fd122879bd	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-27b9-ce00803af23a	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-d723-f7c174d9e2b0	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-340f-9a4aec700376	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-fb50-43f992ece51e	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-98ad-a4e34b002a0b	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-cfc0-d66328aa7272	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-4436-62ea9c75098e	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-72d0-0c083b7e980c	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-3768-0668b6672b2c	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-1e8a-b9f51b2094c7	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-de3f-03ef2b4b4ee4	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-8f34-f6a9-ef70c367b82e	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 42075559)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56ab-8f33-e6df-e74a1da84d14	00020000-56ab-8f32-002b-fed6fdbaa44a
00010000-56ab-8f33-4716-439a6e3a7450	00020000-56ab-8f32-002b-fed6fdbaa44a
00010000-56ab-8f34-2d26-752cbf21e3b5	00020000-56ab-8f34-7b79-1bca41e3a696
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-aacf-284f9cfdefed
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-ccf0-8c95d14ae478
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-9213-1670545c341f
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-d7c3-365fb697db63
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-4a82-24a4b1516bde
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-f6f9-9017ebe097f2
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-b3e4-9d63ab439f86
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-b239-d97f08864f63
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-29e6-9e519c3691fe
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-e65d-8b91a95a4481
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-27b9-ce00803af23a
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-340f-9a4aec700376
00010000-56ab-8f34-bf00-aa719aa42f98	00020000-56ab-8f34-4436-62ea9c75098e
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-aacf-284f9cfdefed
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-3ef5-4d200be48957
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-b3e4-9d63ab439f86
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-b083-a5d5a34bd04b
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-4a82-24a4b1516bde
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-c33e-47021c819f60
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-b239-d97f08864f63
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-29e6-9e519c3691fe
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-e65d-8b91a95a4481
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-27b9-ce00803af23a
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-340f-9a4aec700376
00010000-56ab-8f34-7a71-123dda72bf0f	00020000-56ab-8f34-4436-62ea9c75098e
00010000-56ab-8f34-b857-9c3c188f413c	00020000-56ab-8f34-aacf-284f9cfdefed
00010000-56ab-8f34-b857-9c3c188f413c	00020000-56ab-8f34-3ef5-4d200be48957
00010000-56ab-8f34-b857-9c3c188f413c	00020000-56ab-8f34-b3e4-9d63ab439f86
00010000-56ab-8f34-b857-9c3c188f413c	00020000-56ab-8f34-b083-a5d5a34bd04b
00010000-56ab-8f34-b857-9c3c188f413c	00020000-56ab-8f34-d7c3-365fb697db63
00010000-56ab-8f34-b857-9c3c188f413c	00020000-56ab-8f34-4a82-24a4b1516bde
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-3ef5-4d200be48957
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-f547-83a26f00f46a
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-dc8d-08f9521fa400
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-e695-fb023131901e
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-d7c3-365fb697db63
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-6d95-5e5ec8fa932e
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-4a82-24a4b1516bde
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-b1b7-3d34943a89ba
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-b239-d97f08864f63
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-4be9-51556df27a34
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-29e6-9e519c3691fe
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-56b1-af25e24b8ed7
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-e65d-8b91a95a4481
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-6bc1-64fd122879bd
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-27b9-ce00803af23a
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-d723-f7c174d9e2b0
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-340f-9a4aec700376
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-fb50-43f992ece51e
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-4436-62ea9c75098e
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-72d0-0c083b7e980c
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-1e8a-b9f51b2094c7
00010000-56ab-8f34-1ab5-440b7cf0d1d5	00020000-56ab-8f34-de3f-03ef2b4b4ee4
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-3ef5-4d200be48957
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-f547-83a26f00f46a
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-36db-1360f57ee120
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-dc8d-08f9521fa400
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-e695-fb023131901e
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-d7c3-365fb697db63
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-6d95-5e5ec8fa932e
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-4a82-24a4b1516bde
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-b1b7-3d34943a89ba
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-b79c-46c6ecda38db
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-b239-d97f08864f63
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-4be9-51556df27a34
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-c230-90f4c5a47946
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-29e6-9e519c3691fe
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-56b1-af25e24b8ed7
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-e65d-8b91a95a4481
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-6bc1-64fd122879bd
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-27b9-ce00803af23a
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-d723-f7c174d9e2b0
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-340f-9a4aec700376
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-fb50-43f992ece51e
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-4436-62ea9c75098e
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-72d0-0c083b7e980c
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-3768-0668b6672b2c
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-1e8a-b9f51b2094c7
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-de3f-03ef2b4b4ee4
00010000-56ab-8f34-399c-176c918feba8	00020000-56ab-8f34-f6a9-ef70c367b82e
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-3ef5-4d200be48957
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-b3e4-9d63ab439f86
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-f547-83a26f00f46a
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-d6c2-c7ed3a9f25c7
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-36db-1360f57ee120
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-ccf0-8c95d14ae478
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-dc8d-08f9521fa400
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-e695-fb023131901e
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-d7c3-365fb697db63
00010000-56ab-8f34-3d4a-32a6a4005d7a	00020000-56ab-8f34-6d95-5e5ec8fa932e
00010000-56ab-8f34-ff7e-3de4ba900e81	00020000-56ab-8f34-aacf-284f9cfdefed
00010000-56ab-8f34-ff7e-3de4ba900e81	00020000-56ab-8f34-b083-a5d5a34bd04b
00010000-56ab-8f34-ff7e-3de4ba900e81	00020000-56ab-8f34-ccf0-8c95d14ae478
00010000-56ab-8f34-ff7e-3de4ba900e81	00020000-56ab-8f34-9213-1670545c341f
00010000-56ab-8f34-ff7e-3de4ba900e81	00020000-56ab-8f34-d7c3-365fb697db63
00010000-56ab-8f34-ff7e-3de4ba900e81	00020000-56ab-8f34-4a82-24a4b1516bde
00010000-56ab-8f34-ff7e-3de4ba900e81	00020000-56ab-8f34-f6f9-9017ebe097f2
00010000-56ab-8f34-ff7e-3de4ba900e81	00020000-56ab-8f34-98ad-a4e34b002a0b
00010000-56ab-8f34-dbef-fcb938def4a2	00020000-56ab-8f34-af89-d082fb874610
00010000-56ab-8f34-c409-d9d06670c96b	00020000-56ab-8f32-bcfc-f001acea115c
00010000-56ab-8f35-4c89-da07a4e1c63e	00020000-56ab-8f32-dd23-8cdb9d7207e5
00010000-56ab-8f35-e8f5-f84fe168e338	00020000-56ab-8f32-c32b-5345717ff8c5
00010000-56ab-8f35-d95b-a34335bb6345	00020000-56ab-8f32-7ba9-89724fe6d890
00010000-56ab-8f35-69bd-abd815ca9144	00020000-56ab-8f32-d1d8-e9d4ba786669
00010000-56ab-8f35-f404-cedf52648e7a	00020000-56ab-8f32-91d4-5148ae406300
00010000-56ab-8f35-ae3e-93fc249a8f31	00020000-56ab-8f32-bd8f-c52ad2b3e2e2
\.


--
-- TOC entry 3186 (class 0 OID 42076026)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 42075964)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 42075887)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56ab-8f34-9d2d-a7b360e3e1e7	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56ab-8f34-92aa-680b3f7309b8	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56ab-8f34-87ad-8d72d713c530	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56ab-8f34-5bac-42f41507f930	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 42075524)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56ab-8f32-fe74-8bbb13eafb69	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56ab-8f32-4f0e-50ae87308a5c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56ab-8f32-83d0-8831cdc91c3b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56ab-8f32-a20a-0e3e32888d09	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56ab-8f32-de19-a3cf749fda78	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 42075516)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56ab-8f32-d620-7a49bfed2213	00230000-56ab-8f32-a20a-0e3e32888d09	popa
00240000-56ab-8f32-264c-a6f362036133	00230000-56ab-8f32-a20a-0e3e32888d09	oseba
00240000-56ab-8f32-d1df-a87db62ffa48	00230000-56ab-8f32-a20a-0e3e32888d09	tippopa
00240000-56ab-8f32-49c2-217297d00f82	00230000-56ab-8f32-a20a-0e3e32888d09	organizacijskaenota
00240000-56ab-8f32-7846-9e67199006fe	00230000-56ab-8f32-a20a-0e3e32888d09	sezona
00240000-56ab-8f32-cade-9338e77d464d	00230000-56ab-8f32-a20a-0e3e32888d09	tipvaje
00240000-56ab-8f32-98bd-f769cc40f167	00230000-56ab-8f32-a20a-0e3e32888d09	tipdodatka
00240000-56ab-8f32-3a93-ba7258d374af	00230000-56ab-8f32-4f0e-50ae87308a5c	prostor
00240000-56ab-8f32-0c33-68b8555a85c1	00230000-56ab-8f32-a20a-0e3e32888d09	besedilo
00240000-56ab-8f32-8796-c137e79c0dc0	00230000-56ab-8f32-a20a-0e3e32888d09	uprizoritev
00240000-56ab-8f32-772b-bc90d907a780	00230000-56ab-8f32-a20a-0e3e32888d09	funkcija
00240000-56ab-8f32-dae0-e80ea6dd31f7	00230000-56ab-8f32-a20a-0e3e32888d09	tipfunkcije
00240000-56ab-8f32-f410-8b57594e7fcc	00230000-56ab-8f32-a20a-0e3e32888d09	alternacija
00240000-56ab-8f32-f492-66021840bdd9	00230000-56ab-8f32-fe74-8bbb13eafb69	pogodba
00240000-56ab-8f32-a1bf-1f50181f8aa0	00230000-56ab-8f32-a20a-0e3e32888d09	zaposlitev
00240000-56ab-8f32-5514-aebf5ead3a71	00230000-56ab-8f32-a20a-0e3e32888d09	zvrstuprizoritve
00240000-56ab-8f32-0ed8-0aff6e3b7156	00230000-56ab-8f32-fe74-8bbb13eafb69	programdela
00240000-56ab-8f32-3929-b66e08c06a69	00230000-56ab-8f32-a20a-0e3e32888d09	zapis
\.


--
-- TOC entry 3133 (class 0 OID 42075511)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
2e8293da-e343-48f8-a4d3-77145ccfdd85	00240000-56ab-8f32-d620-7a49bfed2213	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 42076087)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56ab-8f35-681f-20947a809cf6	000e0000-56ab-8f35-0ea5-f6884c9a9416	00080000-56ab-8f34-9901-de8229192597	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56ab-8f32-5ed6-c186af1f048d
00270000-56ab-8f35-0f65-5396c22f3859	000e0000-56ab-8f35-0ea5-f6884c9a9416	00080000-56ab-8f34-9901-de8229192597	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56ab-8f32-5ed6-c186af1f048d
\.


--
-- TOC entry 3149 (class 0 OID 42075660)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 42075906)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56ab-8f35-02da-681fd91f5caa	00180000-56ab-8f35-1432-f15a4fcd4271	000c0000-56ab-8f35-91a9-fdf1d757c190	00090000-56ab-8f35-ab2a-0bd8bcd95c9f	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-8f35-eac3-56a0988a4e51	00180000-56ab-8f35-1432-f15a4fcd4271	000c0000-56ab-8f35-d44c-326305fee55a	00090000-56ab-8f35-2811-93f1482f70c4	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-8f35-62da-dd7ea93f2932	00180000-56ab-8f35-1432-f15a4fcd4271	000c0000-56ab-8f35-501c-a3867c2f67a2	00090000-56ab-8f35-b85a-465c09e86446	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-8f35-311e-fc8ae74f7012	00180000-56ab-8f35-1432-f15a4fcd4271	000c0000-56ab-8f35-279c-c6700467d131	00090000-56ab-8f35-d238-5f8136169859	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-8f35-5bc2-4d7ac291662b	00180000-56ab-8f35-1432-f15a4fcd4271	000c0000-56ab-8f35-75e2-c84753e35691	00090000-56ab-8f35-831f-ec9b84a703e3	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-8f35-60f1-afee674da9ee	00180000-56ab-8f35-970d-7421c446f18b	\N	00090000-56ab-8f35-831f-ec9b84a703e3	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56ab-8f35-5788-08ac39c45b1d	00180000-56ab-8f35-aac7-e6c46635d247	\N	00090000-56ab-8f35-2811-93f1482f70c4	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56ab-8f35-09ce-ae7d15057d94	00180000-56ab-8f35-1432-f15a4fcd4271	\N	00090000-56ab-8f35-74d6-cdb5c2d93820	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 42075923)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56ab-8f32-96a7-eaf311174b81	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56ab-8f32-f5d3-17f478cbce93	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56ab-8f32-367e-c90be56c5553	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56ab-8f32-7083-51ed0a5fa9dd	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56ab-8f32-0d27-2ef5897b9953	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56ab-8f32-b1f6-cde24e1a0e5e	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 42076128)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56ab-8f31-8b50-25db332a94f9	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56ab-8f32-cb7b-7759c4d1ea98	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56ab-8f32-641d-3e5e1346fad4	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56ab-8f32-af78-59af3d4c6b5c	04	Režija	Režija	Režija	umetnik	30
000f0000-56ab-8f32-3bd5-147a00057cb2	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56ab-8f32-1baa-319534be1c5e	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56ab-8f32-d4ca-fefb40bd9686	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56ab-8f32-776b-13f204f5a41b	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56ab-8f32-b07f-c4d4e253f99a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56ab-8f32-94ed-b931507192c5	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56ab-8f32-48ea-5ff4693107d0	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56ab-8f32-a981-d66db052863e	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56ab-8f32-6d4b-c08cefa90649	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56ab-8f32-f642-aca908cfcfb2	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56ab-8f32-f104-d0d55a46c453	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56ab-8f32-128e-f51989db4d89	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56ab-8f32-cce7-25e6718ff41f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56ab-8f32-417d-c5f7936fb759	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56ab-8f32-64ff-897eb1b502d1	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 42075611)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56ab-8f34-e134-a61496657438	0001	šola	osnovna ali srednja šola
00400000-56ab-8f34-50e1-cd70b212900c	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56ab-8f34-8859-3dce79d85314	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 42076432)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56ab-8f31-9eb2-5e46bafb9b47	01	Velika predstava	f	1.00	1.00
002b0000-56ab-8f31-a8ba-611ca97851f5	02	Mala predstava	f	0.50	0.50
002b0000-56ab-8f31-9cc1-33106fed65a4	03	Mala koprodukcija	t	0.40	1.00
002b0000-56ab-8f31-bc65-940feacd6782	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56ab-8f31-359a-11e8701d28e2	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 42075877)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56ab-8f31-e9fe-9a3fa706e080	0001	prva vaja	prva vaja
00420000-56ab-8f31-3f88-65324a6465d1	0002	tehnična vaja	tehnična vaja
00420000-56ab-8f31-51ae-f668d6ed7515	0003	lučna vaja	lučna vaja
00420000-56ab-8f31-dded-5c4b2fe42bfa	0004	kostumska vaja	kostumska vaja
00420000-56ab-8f31-ba1c-68b399e6454f	0005	foto vaja	foto vaja
00420000-56ab-8f31-8ead-fcd44eeae9aa	0006	1. glavna vaja	1. glavna vaja
00420000-56ab-8f31-e778-5b100c384ad7	0007	2. glavna vaja	2. glavna vaja
00420000-56ab-8f31-478e-eddd8bea1e81	0008	1. generalka	1. generalka
00420000-56ab-8f31-7b50-cd44372c5b88	0009	2. generalka	2. generalka
00420000-56ab-8f31-14d9-190177170cd5	0010	odprta generalka	odprta generalka
00420000-56ab-8f31-b0fd-64408721571f	0011	obnovitvena vaja	obnovitvena vaja
00420000-56ab-8f31-9144-7a85da0fba15	0012	italijanka	krajša "obnovitvena" vaja
00420000-56ab-8f31-af29-a4ee0c0acae6	0013	pevska vaja	pevska vaja
00420000-56ab-8f31-4a8a-b598a1e65033	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56ab-8f31-ef21-114c87230bab	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56ab-8f31-1e1f-d99ed0b44377	0016	orientacijska vaja	orientacijska vaja
00420000-56ab-8f31-1259-4300b1c973c6	0017	situacijska vaja	situacijska vaja
00420000-56ab-8f31-fe28-c1d20426c4fe	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 42075733)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 42075546)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56ab-8f33-4716-439a6e3a7450	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROgePoNlH3EBLN5kZUumg0I5F92LLnw3m	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-5357-e000a9d1f2ae	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-ce4e-c9b7d98a9d85	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-0b18-f7426db91cc5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-58cc-60ff27b329a4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-6097-eae3857b83d8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-17b8-608aba6c3d1f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-516c-40340b079cf2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-e775-466f17792e8f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-38ea-a47b52694863	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-2d26-752cbf21e3b5	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-cfe9-0e38a9b2725c	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-bf00-aa719aa42f98	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-7a71-123dda72bf0f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-b857-9c3c188f413c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-1ab5-440b7cf0d1d5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-399c-176c918feba8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-3d4a-32a6a4005d7a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-ff7e-3de4ba900e81	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-dbef-fcb938def4a2	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56ab-8f34-c409-d9d06670c96b	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56ab-8f35-4c89-da07a4e1c63e	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56ab-8f35-e8f5-f84fe168e338	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56ab-8f35-d95b-a34335bb6345	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56ab-8f35-69bd-abd815ca9144	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56ab-8f35-f404-cedf52648e7a	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56ab-8f35-ae3e-93fc249a8f31	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56ab-8f33-e6df-e74a1da84d14	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 42076178)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56ab-8f35-1644-2519393eecb8	00160000-56ab-8f34-5cf1-7ab80d342fbd	\N	00140000-56ab-8f32-e24b-df39557a1bba	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56ab-8f34-b944-69c2db02f6c7
000e0000-56ab-8f35-0ea5-f6884c9a9416	00160000-56ab-8f34-3017-4654e7d15c79	\N	00140000-56ab-8f32-caf7-a7edb49bebb7	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56ab-8f34-de7c-6d9c907f526b
000e0000-56ab-8f35-7182-958b0010db2b	\N	\N	00140000-56ab-8f32-caf7-a7edb49bebb7	00190000-56ab-8f35-9bb1-c31e48206e53	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-8f34-b944-69c2db02f6c7
000e0000-56ab-8f35-04db-4e7b0536467f	\N	\N	00140000-56ab-8f32-caf7-a7edb49bebb7	00190000-56ab-8f35-9bb1-c31e48206e53	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-8f34-b944-69c2db02f6c7
000e0000-56ab-8f35-5a70-e7c50852e07e	\N	\N	00140000-56ab-8f32-caf7-a7edb49bebb7	00190000-56ab-8f35-9bb1-c31e48206e53	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-600a-fb1c92ff5fbe	\N	\N	00140000-56ab-8f32-caf7-a7edb49bebb7	00190000-56ab-8f35-9bb1-c31e48206e53	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-2495-4a40d50e79c3	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-be55-3f1cff6023ed	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-ef06-49f9036673a5	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-d05a-d51807b30a27	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-8e7d-d487b5a18d4c	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-d63a-afb1978a67e8	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-0d7e-de744cd8bd1f	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-394d-a7850bffb14b	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
000e0000-56ab-8f35-7bb5-5515f04c9857	\N	\N	00140000-56ab-8f32-0e4e-7a2ff7640b68	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-8f34-4800-5eeb4ed72510
\.


--
-- TOC entry 3170 (class 0 OID 42075897)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 42075826)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56ab-8f35-041d-8a7e2b3435ed	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	3
00200000-56ab-8f35-a084-0d2d51cbd611	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	4
00200000-56ab-8f35-b15f-5dd7e0d2baed	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	6
00200000-56ab-8f35-81f9-853640951013	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	5
00200000-56ab-8f35-b847-f7bf59b590c8	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	7
00200000-56ab-8f35-c291-8e278a8a666d	\N	000e0000-56ab-8f35-1644-2519393eecb8	1
00200000-56ab-8f35-8285-e1c40938ed05	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	2
00200000-56ab-8f35-5ef8-47f464e301ed	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	1
00200000-56ab-8f35-8075-0ca313a195c3	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	8
00200000-56ab-8f35-3d94-271d7aa53bd9	\N	000e0000-56ab-8f35-0ea5-f6884c9a9416	9
\.


--
-- TOC entry 3182 (class 0 OID 42075990)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 42076101)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56ab-8f32-e8d0-6568b1c60141	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56ab-8f32-c587-2305295ada13	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56ab-8f32-d864-74cf7f6535e1	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56ab-8f32-2ef1-f916a182d4ae	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56ab-8f32-e740-cb0149e4b988	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56ab-8f32-b6b2-b94ef170731b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56ab-8f32-aaa3-244757d7896d	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56ab-8f32-64a4-d0b51055a754	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56ab-8f32-5ed6-c186af1f048d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56ab-8f32-227a-dd4a9babeafe	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56ab-8f32-c278-d7479d869853	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56ab-8f32-e983-c0258be28857	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56ab-8f32-42cf-ceac6d3b36b3	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56ab-8f32-807f-f56747efc189	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56ab-8f32-41e5-a5ee53d49f81	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56ab-8f32-43f3-14ea1df15f51	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56ab-8f32-612d-8fadcd1fd46c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56ab-8f32-7779-a7ebacb5625c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56ab-8f32-89ff-f745706055c4	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56ab-8f32-8b7f-a60da3203949	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56ab-8f32-ab5e-31009e6df526	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56ab-8f32-c2db-a6031b734cc3	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56ab-8f32-6a39-9d8614781a45	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56ab-8f32-47e4-19910096fcad	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56ab-8f32-a124-ecb6c02357a1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56ab-8f32-708d-859560707d79	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56ab-8f32-3242-23c95ea6f305	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56ab-8f32-2671-b1b8efbd61b2	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 42076482)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 42076451)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 42076494)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 42076063)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56ab-8f35-5e4a-f50cdafbc391	00090000-56ab-8f35-2811-93f1482f70c4	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-8f35-e3e4-03a0ccd612a8	00090000-56ab-8f35-b85a-465c09e86446	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-8f35-7c08-5db77be5ac7c	00090000-56ab-8f35-ba2a-e6dbcd404bc5	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-8f35-fc92-23255c72c6b9	00090000-56ab-8f35-a408-450b69ef9d86	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-8f35-71f7-a647100200f9	00090000-56ab-8f35-b5ca-afac559968b8	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-8f35-aead-5ce75c2ee806	00090000-56ab-8f35-5872-71df2bd775c6	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 42076168)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56ab-8f32-e24b-df39557a1bba	01	Drama	drama (SURS 01)
00140000-56ab-8f32-3873-96d816c7e943	02	Opera	opera (SURS 02)
00140000-56ab-8f32-3965-32880b7535e2	03	Balet	balet (SURS 03)
00140000-56ab-8f32-fbc6-7f7b7e34b3eb	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56ab-8f32-0e4e-7a2ff7640b68	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56ab-8f32-caf7-a7edb49bebb7	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56ab-8f32-a824-3d1048b3b26f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 42076053)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 42075610)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 42076226)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 42076217)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 42075600)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 42076084)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 42076126)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 42076535)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 42075920)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 42075855)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 42075871)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 42075876)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 42076449)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 42075759)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 42076295)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 42076049)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 42075824)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 42075797)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 42075773)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 42075956)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 42076512)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 42076519)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 42076543)
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
-- TOC entry 2766 (class 2606 OID 42075982)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 42075731)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 42075629)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 42075693)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 42075656)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 42075589)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 42075574)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 42075988)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 42076025)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 42076163)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 42075684)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 42075719)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 42076400)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 42075962)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 42075709)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 42075840)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 42075812)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 42075806)
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
-- TOC entry 2764 (class 2606 OID 42075974)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 42076409)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 42076417)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42076387)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 42076430)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 42076007)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 42075947)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 42075938)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 42076150)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 42076077)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 42075785)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 42075545)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 42076016)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 42075563)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 42075583)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 42076034)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 42075969)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 42075895)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 42075533)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 42075521)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 42075515)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 42076097)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 42075665)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 42075912)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 42075930)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 42076137)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 42075618)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 42076442)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 42075884)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 42075744)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 42075558)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 42076196)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 42075903)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 42075830)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 42075996)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 42076109)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 42076492)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 42076476)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 42076500)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 42076067)
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
-- TOC entry 2833 (class 2606 OID 42076176)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 42076061)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 42075865)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 42075866)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 42075864)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 42075862)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 42075863)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 42075861)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 42076098)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 42076099)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 42076100)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 42076514)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 42076513)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 42075686)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 42075687)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 42075989)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 42076480)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 42076479)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 42076481)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 42076478)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 42076477)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 42075975)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 42075831)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 42075832)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 42076050)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 42076052)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 42076051)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 42075775)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 42075774)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 42076431)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 42076165)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 42076166)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 42076167)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 42076501)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 42076201)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 42076198)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 42076202)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 42076200)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 42076199)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 42075746)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 42075745)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 42075659)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 42076017)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 42075590)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 42075591)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 42076037)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 42076036)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 42076035)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 42075696)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 42075695)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 42075697)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 42075807)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 42075523)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 42075942)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 42075940)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 42075939)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 42075941)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 42075564)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 42075565)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 42075997)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 42076536)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 42076086)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 42076085)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 42076544)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 42076545)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 42075963)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 42076078)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 42076079)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 42076300)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 42076299)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 42076296)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 42076297)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 42076298)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 42075711)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 42075710)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 42075712)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 42076011)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 42076010)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 42076410)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 42076411)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 42076230)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 42076231)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 42076228)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 42076229)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 42075921)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 42075922)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 42076068)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 42076069)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 42075904)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 42075951)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 42075950)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 42075948)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 42075949)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 42076218)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 42075786)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 42075800)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 42075799)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 42075798)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 42075801)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 42075825)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 42075813)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 42075814)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 42076401)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 42076450)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 42076520)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 42076521)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 42075631)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 42075630)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 42075666)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 42075667)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 42075915)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 42075914)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 42075913)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 42075857)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 42075860)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 42075856)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 42075859)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 42075858)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 42075685)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 42075619)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 42075620)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 42075760)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 42075762)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 42075761)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 42075763)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 42075957)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 42076164)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 42076197)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 42076138)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 42076139)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 42075657)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 42075658)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 42075931)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 42075932)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 42076062)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 42075534)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 42075732)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 42075694)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 42075522)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 42076443)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 42076009)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 42076008)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 42075885)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 42075886)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 42076227)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 42075905)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 42075720)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 42076177)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 42076493)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 42076418)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 42076419)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 42076127)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 42075896)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 42075584)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 42076706)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 42076731)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 42076721)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 42076701)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 42076736)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 42076716)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 42076726)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 42076711)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 42076916)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 42076921)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 42076926)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 42077086)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 42077081)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 42076601)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 42076606)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 42076831)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 42077066)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 42077061)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 42077071)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 42077056)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 42077051)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 42076826)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 42076691)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 42076696)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 42076871)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 42076881)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 42076876)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 42076656)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 42076651)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 42076816)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 42077041)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 42076931)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 42076936)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 42076941)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 42077076)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 42076961)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 42076946)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 42076966)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 42076956)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 42076951)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 42076646)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 42076641)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 42076586)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 42076581)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 42076851)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 42076561)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 42076566)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 42076866)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 42076861)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 42076856)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 42076616)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 42076611)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 42076621)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 42076671)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 42076546)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 42076791)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 42076781)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 42076776)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 42076786)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 42076551)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 42076556)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 42076836)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 42077101)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 42076911)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 42076906)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 42077106)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 42077111)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 42076821)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 42076896)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 42076901)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 42077016)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 42077011)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 42076996)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 42077001)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 42077006)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 42076631)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 42076626)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 42076636)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 42076846)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 42076841)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 42077026)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 42077031)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 42076986)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 42076991)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 42076976)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 42076981)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 42076766)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 42076771)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 42076886)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 42076891)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 42076741)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 42076746)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 42076811)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 42076806)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 42076796)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 42076801)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 42076971)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 42076661)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 42076666)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 42076686)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 42076676)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 42076681)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 42077021)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 42077036)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 42077046)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 42077091)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 42077096)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 42076576)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 42076571)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 42076591)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 42076596)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 42076761)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 42076756)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 42076751)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-29 17:11:36 CET

--
-- PostgreSQL database dump complete
--

