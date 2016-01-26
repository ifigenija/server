--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-26 15:37:02 CET

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
-- TOC entry 185 (class 1259 OID 40489019)
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
-- TOC entry 241 (class 1259 OID 40489637)
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
-- TOC entry 240 (class 1259 OID 40489621)
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
-- TOC entry 184 (class 1259 OID 40489012)
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
-- TOC entry 183 (class 1259 OID 40489010)
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
-- TOC entry 231 (class 1259 OID 40489498)
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
-- TOC entry 234 (class 1259 OID 40489528)
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
-- TOC entry 255 (class 1259 OID 40489940)
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
-- TOC entry 212 (class 1259 OID 40489334)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 40489260)
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
-- TOC entry 206 (class 1259 OID 40489285)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 40489290)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 40489862)
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
-- TOC entry 196 (class 1259 OID 40489165)
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
-- TOC entry 242 (class 1259 OID 40489650)
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
-- TOC entry 227 (class 1259 OID 40489456)
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
-- TOC entry 202 (class 1259 OID 40489234)
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
-- TOC entry 199 (class 1259 OID 40489205)
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
-- TOC entry 197 (class 1259 OID 40489182)
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
-- TOC entry 216 (class 1259 OID 40489370)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 40489920)
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
-- TOC entry 254 (class 1259 OID 40489933)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 40489955)
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
-- TOC entry 220 (class 1259 OID 40489394)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 40489139)
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
-- TOC entry 187 (class 1259 OID 40489039)
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
-- TOC entry 191 (class 1259 OID 40489106)
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
-- TOC entry 188 (class 1259 OID 40489050)
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
-- TOC entry 180 (class 1259 OID 40488984)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 40489003)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 40489401)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 40489436)
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
-- TOC entry 237 (class 1259 OID 40489569)
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
-- TOC entry 190 (class 1259 OID 40489086)
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
-- TOC entry 193 (class 1259 OID 40489131)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 40489806)
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
-- TOC entry 217 (class 1259 OID 40489376)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 40489116)
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
-- TOC entry 204 (class 1259 OID 40489252)
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
-- TOC entry 200 (class 1259 OID 40489220)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporednasezvsehupr integer,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 40489227)
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
-- TOC entry 219 (class 1259 OID 40489388)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 40489820)
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
-- TOC entry 246 (class 1259 OID 40489830)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 40489719)
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
-- TOC entry 247 (class 1259 OID 40489838)
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
-- TOC entry 223 (class 1259 OID 40489416)
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
-- TOC entry 215 (class 1259 OID 40489361)
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
-- TOC entry 214 (class 1259 OID 40489351)
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
-- TOC entry 236 (class 1259 OID 40489558)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 40489488)
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
-- TOC entry 198 (class 1259 OID 40489194)
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
-- TOC entry 177 (class 1259 OID 40488955)
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
-- TOC entry 176 (class 1259 OID 40488953)
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
-- TOC entry 224 (class 1259 OID 40489430)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 40488993)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 40488977)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 40489444)
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
-- TOC entry 218 (class 1259 OID 40489382)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 40489305)
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
-- TOC entry 175 (class 1259 OID 40488942)
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
-- TOC entry 174 (class 1259 OID 40488934)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 40488929)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 40489505)
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
-- TOC entry 189 (class 1259 OID 40489078)
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
-- TOC entry 211 (class 1259 OID 40489324)
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
-- TOC entry 213 (class 1259 OID 40489341)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 40489546)
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
-- TOC entry 186 (class 1259 OID 40489029)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 40489850)
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
-- TOC entry 208 (class 1259 OID 40489295)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 40489151)
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
-- TOC entry 178 (class 1259 OID 40488964)
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
-- TOC entry 239 (class 1259 OID 40489596)
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
-- TOC entry 210 (class 1259 OID 40489315)
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
-- TOC entry 203 (class 1259 OID 40489245)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 40489408)
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
-- TOC entry 233 (class 1259 OID 40489519)
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
-- TOC entry 251 (class 1259 OID 40489900)
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
-- TOC entry 250 (class 1259 OID 40489869)
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
-- TOC entry 252 (class 1259 OID 40489912)
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
-- TOC entry 229 (class 1259 OID 40489481)
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
-- TOC entry 238 (class 1259 OID 40489586)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 40489471)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 40489015)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 40488958)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 40489019)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a7-8489-598a-b2c4feaf924c	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a7-8489-a2d3-3385c3ad1958	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a7-8489-9452-f8ae727ef0fe	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 40489637)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a7-848b-a9e7-ec79cc4b835b	000d0000-56a7-848a-c659-71ce17a0b56a	\N	00090000-56a7-848a-4182-f91fda1470dc	000b0000-56a7-848a-cf8b-91815d770817	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a7-848b-2c91-3b7af9b0eae6	000d0000-56a7-848a-ecc0-2461399d9a3d	00100000-56a7-848a-c3f8-948f9e6ece17	00090000-56a7-848a-8480-fb6a80dba440	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a7-848b-6ef8-f1a9c03d72ff	000d0000-56a7-848a-f6f1-beed0dd7faad	00100000-56a7-848a-2587-f2c17f4a0e99	00090000-56a7-848a-f9d4-203d53cb150c	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a7-848b-0720-78f77b1d4dfd	000d0000-56a7-848a-7788-6ed98a0d695b	\N	00090000-56a7-848a-4c52-6f6390b6b784	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a7-848b-0b94-12a9f5f32503	000d0000-56a7-848a-31fe-bdce5fd5e32e	\N	00090000-56a7-848a-184d-be990a931e2c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a7-848b-a141-9b418a0da50f	000d0000-56a7-848a-a5fa-7892b8c90dce	\N	00090000-56a7-848a-2070-4ba7cb5af0db	000b0000-56a7-848a-7623-bfed6ec9211c	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a7-848b-533a-30364d29a7ca	000d0000-56a7-848a-66f4-3397206e3da4	00100000-56a7-848a-feae-072ee7ef0123	00090000-56a7-848a-84be-3bc08edd3981	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a7-848b-89bc-5c447b0a83c6	000d0000-56a7-848a-a009-281c0156f770	\N	00090000-56a7-848a-5acb-7428a4429dbb	000b0000-56a7-848a-2bb8-0c8b4b611540	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a7-848b-ffe5-36c392e43300	000d0000-56a7-848a-66f4-3397206e3da4	00100000-56a7-848a-0ac3-6c9e79785b44	00090000-56a7-848a-908b-a8aa73c6d15d	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a7-848b-3c39-309a90c5b1a4	000d0000-56a7-848a-66f4-3397206e3da4	00100000-56a7-848a-2230-223e39ec5da6	00090000-56a7-848a-1404-2ca5b6ecea2d	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a7-848b-525a-1be5ede6c32e	000d0000-56a7-848a-66f4-3397206e3da4	00100000-56a7-848a-0823-1eccb2270f8c	00090000-56a7-848a-cba4-6c08456b0828	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a7-848b-8e3c-f37278b93873	000d0000-56a7-848a-6158-0cf0cad177a8	00100000-56a7-848a-c3f8-948f9e6ece17	00090000-56a7-848a-8480-fb6a80dba440	000b0000-56a7-848a-3aa7-b231c495caf4	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a7-848b-e11d-c3c4fec324eb	000d0000-56a7-848a-05d9-4bbc04446e09	\N	00090000-56a7-848a-5acb-7428a4429dbb	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-ebba-a3ded30ef8b9	000d0000-56a7-848a-05d9-4bbc04446e09	\N	00090000-56a7-848a-8076-13d7fcd7d28e	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a7-848b-941c-f59710ac8692	000d0000-56a7-848a-3234-d46ba0a7efc6	00100000-56a7-848a-2587-f2c17f4a0e99	00090000-56a7-848a-f9d4-203d53cb150c	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-a737-64180e977df5	000d0000-56a7-848a-3234-d46ba0a7efc6	\N	00090000-56a7-848a-8076-13d7fcd7d28e	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a7-848b-a021-fd1b4771c581	000d0000-56a7-848a-da93-5b8fb6274e48	\N	00090000-56a7-848a-8076-13d7fcd7d28e	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-2ad4-b4d16fa63ad1	000d0000-56a7-848a-da93-5b8fb6274e48	\N	00090000-56a7-848a-5acb-7428a4429dbb	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a7-848b-eb4e-edf36fa73756	000d0000-56a7-848a-188e-50b54452bcea	00100000-56a7-848a-feae-072ee7ef0123	00090000-56a7-848a-84be-3bc08edd3981	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-8d58-f5bbfcba24ab	000d0000-56a7-848a-188e-50b54452bcea	\N	00090000-56a7-848a-8076-13d7fcd7d28e	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a7-848b-cb73-d0391ece4e11	000d0000-56a7-848a-b3fc-5f38f03616f3	\N	00090000-56a7-848a-8076-13d7fcd7d28e	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-dbef-0c4d03edb452	000d0000-56a7-848a-b3fc-5f38f03616f3	00100000-56a7-848a-feae-072ee7ef0123	00090000-56a7-848a-84be-3bc08edd3981	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a7-848b-f807-5d25684e12cb	000d0000-56a7-848a-e9f5-71d78de60651	\N	00090000-56a7-848a-8076-13d7fcd7d28e	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-6ca9-8f4154181129	000d0000-56a7-848a-d2de-1b188638cf09	\N	00090000-56a7-848a-5acb-7428a4429dbb	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-5102-884fbc4b6d87	000d0000-56a7-848a-f88a-35f666ee3821	\N	00090000-56a7-848a-5acb-7428a4429dbb	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-5a05-3296489956f3	000d0000-56a7-848a-f88a-35f666ee3821	00100000-56a7-848a-2587-f2c17f4a0e99	00090000-56a7-848a-f9d4-203d53cb150c	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a7-848b-893b-3d589d31fbcd	000d0000-56a7-848a-33e0-c25ea595bc0c	\N	00090000-56a7-848a-7142-e59763829141	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a7-848b-ab4c-d7693f2014fa	000d0000-56a7-848a-33e0-c25ea595bc0c	\N	00090000-56a7-848a-61b1-7c7d74c52b81	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a7-848b-65b9-93b272b4f1e2	000d0000-56a7-848a-6866-40234b20d1f2	\N	00090000-56a7-848a-5acb-7428a4429dbb	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a7-848b-84ec-d7105455e4fa	000d0000-56a7-848a-6866-40234b20d1f2	00100000-56a7-848a-2587-f2c17f4a0e99	00090000-56a7-848a-f9d4-203d53cb150c	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a7-848b-dcc8-4ef2a024a73b	000d0000-56a7-848a-6866-40234b20d1f2	\N	00090000-56a7-848a-61b1-7c7d74c52b81	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a7-848b-f3ea-d576cd5774e1	000d0000-56a7-848a-6866-40234b20d1f2	\N	00090000-56a7-848a-7142-e59763829141	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a7-848b-9a3a-39fa9626b218	000d0000-56a7-848a-c62f-f04987390b8d	\N	00090000-56a7-848a-5acb-7428a4429dbb	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a7-848b-1dde-93c58c586cc3	000d0000-56a7-848a-9287-bf562e464775	00100000-56a7-848a-2587-f2c17f4a0e99	00090000-56a7-848a-f9d4-203d53cb150c	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a7-848b-8100-3efcbd7c93f7	000d0000-56a7-848a-9287-bf562e464775	\N	00090000-56a7-848a-8076-13d7fcd7d28e	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 40489621)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 40489012)
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
-- TOC entry 3191 (class 0 OID 40489498)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a7-848a-6154-6709df1423b6	00160000-56a7-8489-c7ed-53b6fe4565b2	00090000-56a7-848a-61b1-7c7d74c52b81	aizv	10	t
003d0000-56a7-848a-a8f9-f31584dc6881	00160000-56a7-8489-c7ed-53b6fe4565b2	00090000-56a7-848a-9f97-2f7ccba8af30	apri	14	t
003d0000-56a7-848a-0554-9bfb834d94e2	00160000-56a7-8489-3196-b9a1d7eb3fd2	00090000-56a7-848a-7142-e59763829141	aizv	11	t
003d0000-56a7-848a-dcf5-fe965d61c02b	00160000-56a7-8489-ed43-4608ee405b96	00090000-56a7-848a-07f6-03dc3e7b88c0	aizv	12	t
003d0000-56a7-848a-8c9c-ffd832742ef7	00160000-56a7-8489-c7ed-53b6fe4565b2	00090000-56a7-848a-8076-13d7fcd7d28e	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 40489528)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a7-8489-c7ed-53b6fe4565b2	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a7-8489-3196-b9a1d7eb3fd2	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a7-8489-ed43-4608ee405b96	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 40489940)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 40489334)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 40489260)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a7-848a-7a5a-53b41d3b7de7	\N	\N	\N	\N	00440000-56a7-848a-661f-9455a52f3a58	00220000-56a7-848a-747b-5f98a02f1331	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a7-848a-bb47-7aee451fbafe	\N	\N	\N	\N	00440000-56a7-848a-73e9-832d229b22d4	00220000-56a7-848a-e54b-ac45c06ce532	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a7-848a-083c-d538aad59560	\N	\N	\N	001e0000-56a7-848a-baf3-baeef83faa5a	\N	00220000-56a7-848a-747b-5f98a02f1331	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a7-848a-1bf5-62225ab2c745	\N	\N	\N	001e0000-56a7-848a-40e0-4d55180596d4	\N	00220000-56a7-848a-e54b-ac45c06ce532	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a7-848a-6f00-84ad06e230db	\N	00200000-56a7-848a-2518-d904bc32ab80	\N	\N	\N	00220000-56a7-848a-e5e7-f3bebccda32a	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	dogodek 1	\N
00180000-56a7-848a-afaa-196d95be8203	\N	00200000-56a7-848a-b349-47474dece7d6	\N	\N	\N	00220000-56a7-848a-e5e7-f3bebccda32a	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	dogodek 2	\N
00180000-56a7-848a-18e5-66f8a8b3566b	\N	00200000-56a7-848a-605f-f126a942473a	\N	\N	\N	00220000-56a7-848a-e54b-ac45c06ce532	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	dogodek 3	\N
00180000-56a7-848a-d100-7d7cd402df07	\N	00200000-56a7-848a-2a54-ebabcca66d57	\N	\N	\N	00220000-56a7-848a-16ce-d75af5cb4a5f	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	dogodek 4	\N
00180000-56a7-848a-91d3-62f549286f0d	\N	00200000-56a7-848a-e12c-a077365c2cb3	\N	\N	\N	00220000-56a7-848a-faf0-3aaa6ed30885	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	dogodek 5	\N
00180000-56a7-848a-ec02-31f6d22f753a	\N	00200000-56a7-848a-16f7-cfebd37e0a0a	\N	\N	\N	00220000-56a7-848a-e54b-ac45c06ce532	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	dogodek 6	\N
00180000-56a7-848a-2a7c-767f95bdf644	\N	00200000-56a7-848a-dca4-9a56bbdc9dc9	\N	\N	\N	00220000-56a7-848a-faf0-3aaa6ed30885	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	dogodek 7	\N
00180000-56a7-848a-7d04-201fb4391e0c	\N	00200000-56a7-848a-8ef8-080a5fe23dd6	\N	\N	\N	00220000-56a7-848a-faf0-3aaa6ed30885	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	dogodek 8	\N
00180000-56a7-848a-d489-57327c4d0ee7	\N	00200000-56a7-848a-4196-47f911dfde27	\N	\N	\N	00220000-56a7-848a-e5e7-f3bebccda32a	001f0000-56a7-8489-6c55-4387367eb6a6	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	dogodek 9	\N
00180000-56a7-848a-60bc-9608a038f390	001b0000-56a7-848a-53ec-8be1f6e1834e	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-6c55-4387367eb6a6	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N
00180000-56a7-848a-6c81-4180bc50415e	001b0000-56a7-848a-e782-19348cc82c4a	\N	\N	\N	\N	00220000-56a7-848a-e54b-ac45c06ce532	001f0000-56a7-8489-6c55-4387367eb6a6	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N
00180000-56a7-848a-cc89-b01cc1069a39	001b0000-56a7-848a-635d-d69a654968fe	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-6c55-4387367eb6a6	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N
00180000-56a7-848b-4d30-4ef0a9846eba	001b0000-56a7-848b-8a04-1e0cdb4a62c1	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N
00180000-56a7-848b-a556-c5d20f385c97	001b0000-56a7-848b-9235-6058cd8c087b	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-c9d4-751a055285d2	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N
00180000-56a7-848b-8d16-bfb1c464296e	001b0000-56a7-848b-7393-f698a4a50186	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-c9d4-751a055285d2	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N
00180000-56a7-848b-01aa-0867717ced0d	001b0000-56a7-848b-4b3e-64995ef42bff	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-6c55-4387367eb6a6	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N
00180000-56a7-848b-f7f6-d0a66d6bd24f	001b0000-56a7-848b-de1e-1a81ed93ca9c	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-c9d4-751a055285d2	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N
00180000-56a7-848b-b369-a8da0a40c459	001b0000-56a7-848b-5456-30689e43d0f4	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N
00180000-56a7-848b-e82c-1d7ab6229a47	001b0000-56a7-848b-dd4f-bd7fe4901933	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N
00180000-56a7-848b-e1e7-b9c88a9321c7	001b0000-56a7-848b-2cd5-dfa3bb782a0d	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-c9d4-751a055285d2	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N
00180000-56a7-848b-1563-8df8e91cd926	001b0000-56a7-848b-5c54-6b528c39efa6	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-c0fa-2e5a78cb0150	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N
00180000-56a7-848b-e678-aa3efbe29fb8	001b0000-56a7-848b-3e19-5be897711ccd	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-c0fa-2e5a78cb0150	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N
00180000-56a7-848b-9f00-a4a5d59e94fb	001b0000-56a7-848b-9cd6-1921764a5cae	\N	\N	\N	\N	00220000-56a7-848a-747b-5f98a02f1331	001f0000-56a7-8489-c9d4-751a055285d2	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N
\.


--
-- TOC entry 3166 (class 0 OID 40489285)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a7-848a-baf3-baeef83faa5a
001e0000-56a7-848a-40e0-4d55180596d4
\.


--
-- TOC entry 3167 (class 0 OID 40489290)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a7-848a-661f-9455a52f3a58
00440000-56a7-848a-73e9-832d229b22d4
\.


--
-- TOC entry 3209 (class 0 OID 40489862)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 40489165)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a7-8486-755f-246450db4543	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a7-8486-1a11-9d0bc1891780	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a7-8486-43cd-778d5cd11ea6	AL	ALB	008	Albania 	Albanija	\N
00040000-56a7-8486-3ba6-f2ee7d42e03c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a7-8486-94a9-55a5eb9e7654	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a7-8486-b8e4-e3cef3fcf399	AD	AND	020	Andorra 	Andora	\N
00040000-56a7-8486-4c3e-a48e06bf7e67	AO	AGO	024	Angola 	Angola	\N
00040000-56a7-8486-d5c5-574cb507d383	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a7-8486-b7ef-97d5b786862f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a7-8486-9355-4926ab61d01a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a7-8486-af68-2bf173f29b1f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a7-8486-be0f-f9d73f9898f6	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a7-8486-755a-cb6e04e06f7c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a7-8486-7a40-e9e002c979dd	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a7-8486-ec74-1e633d648056	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a7-8486-dd62-c8768ec7bcc0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a7-8486-0506-c6ac9fed19cc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a7-8486-a972-8cada2fcb83d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a7-8486-fa51-9f712425f8d5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a7-8486-354a-9a17de35f376	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a7-8486-7272-a491d56e66f1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a7-8486-3f01-75f1cfdffff6	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a7-8486-0286-33705c7e3e36	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a7-8486-2e03-c93d73aa5580	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a7-8486-e727-11977a8762bf	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a7-8486-e2f7-6628af2afc0c	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a7-8486-613c-45afe61b4300	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a7-8486-3d09-a8630ea769dc	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a7-8486-31b6-dde5d20a1748	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a7-8486-78e8-e39e1bfcafdc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a7-8486-aee1-9d315ee3b672	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a7-8486-dc0e-ee2aac781e07	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a7-8486-f108-736d02a5c536	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a7-8486-91d5-0093bdbed09e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a7-8486-e082-75e97ac0510d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a7-8486-d214-248125453442	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a7-8486-71f5-e3e66a764e0c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a7-8486-5492-84de5bd46f42	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a7-8486-f419-dd1f04a16137	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a7-8486-63a8-37a11cd3a66a	CA	CAN	124	Canada 	Kanada	\N
00040000-56a7-8486-0cf1-c5ff450d4392	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a7-8486-97ac-e0abf0e95ad1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a7-8486-2340-a5dcbecf93d1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a7-8486-59e4-fdeeef5cdfac	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a7-8486-3520-c4aefdd4cbb5	CL	CHL	152	Chile 	Čile	\N
00040000-56a7-8486-3734-1779dd9d2af4	CN	CHN	156	China 	Kitajska	\N
00040000-56a7-8486-3da0-c2ecabf44832	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a7-8486-59c2-f78cd1375abb	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a7-8486-4030-0bdccd3671eb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a7-8486-56c8-57b88a78c415	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a7-8486-59f7-c3ef0cb1101d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a7-8486-93dd-02a553cd29cd	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a7-8486-3c04-d0d8e35511fb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a7-8486-3241-164cfd1e7415	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a7-8486-5b97-a981324adda7	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a7-8486-6590-4e65d85ecd06	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a7-8486-1bbe-e2bec4592ffb	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a7-8486-792c-d1809b90d04e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a7-8486-9c76-c6ccfd8d5948	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a7-8486-e09a-6784ac5c6b32	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a7-8486-ce4a-718f3e235539	DK	DNK	208	Denmark 	Danska	\N
00040000-56a7-8486-8dd3-f436c2dd5434	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a7-8486-0523-ca71961e8336	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a7-8486-6518-f34c47f048c1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a7-8486-4025-9fa25361707d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a7-8486-aeec-59e50b99761f	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a7-8486-3b26-4aefa087d34b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a7-8486-4407-ec841186430d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a7-8486-d5a8-1aec639bf2d6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a7-8486-f6cc-136d2636b505	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a7-8486-06ab-1a08f02761e1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a7-8486-2b6f-be86ae3e092c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a7-8486-08bd-bb0b3f89f2f8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a7-8486-c6e0-ce1203e2efe6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a7-8486-1db5-d185aa27523b	FI	FIN	246	Finland 	Finska	\N
00040000-56a7-8486-7f8e-6c26774ca94f	FR	FRA	250	France 	Francija	\N
00040000-56a7-8486-a627-6d02aa4bfeae	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a7-8486-78a9-82ee2f468c0a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a7-8486-08b9-50e2420d96f2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a7-8486-fe46-458e4c712ebc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a7-8486-7293-82ff9db208ef	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a7-8486-7f08-655eb65d5b70	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a7-8486-d818-6eab7c8e7f74	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a7-8486-8ad8-a18945273b50	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a7-8486-5ed7-d32f8e55cacc	GH	GHA	288	Ghana 	Gana	\N
00040000-56a7-8486-8123-f6569d91fb9c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a7-8486-1bd9-aee8cd57e04c	GR	GRC	300	Greece 	Grčija	\N
00040000-56a7-8486-8d22-d43b0a02a743	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a7-8486-f6d4-7bd7130b2fcc	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a7-8486-a0d8-b2c8be206be4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a7-8486-2d7a-53f29b507e6f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a7-8486-7185-c57f6d887e13	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a7-8486-833f-d953a7b41b88	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a7-8486-0dfe-956ed9f35c35	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a7-8486-4f29-6ddd67a2a7d3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a7-8486-4b6d-80de09c92ddf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a7-8486-9088-1ef3171834bd	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a7-8486-76ad-9da17a63855c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a7-8486-a482-8b0653115e08	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a7-8486-505d-b34836be7deb	HN	HND	340	Honduras 	Honduras	\N
00040000-56a7-8486-1822-abcb3a3a7401	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a7-8486-2d14-3d55ba3d01d4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a7-8486-5b41-2a1a914aceed	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a7-8486-90cb-7794b9bca141	IN	IND	356	India 	Indija	\N
00040000-56a7-8486-1de4-1ed4ab9dff0b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a7-8486-f2da-89ab65414a19	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a7-8486-654d-b4bf4af4a6e1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a7-8486-e19a-bc2a8ecbffdb	IE	IRL	372	Ireland 	Irska	\N
00040000-56a7-8486-f0aa-5b279ffa1e83	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a7-8486-97ec-333298c57dfc	IL	ISR	376	Israel 	Izrael	\N
00040000-56a7-8486-a374-9311cdfffbbc	IT	ITA	380	Italy 	Italija	\N
00040000-56a7-8486-aa5e-fd3b3b5285e0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a7-8486-023d-3967017359b3	JP	JPN	392	Japan 	Japonska	\N
00040000-56a7-8486-4ec3-bcbc7f125801	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a7-8486-c9b4-24201aeabfa3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a7-8486-bdff-51d97170a128	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a7-8486-c721-7cc4770ef1ff	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a7-8486-834e-60e718068e63	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a7-8486-b87d-17ac0b04d08b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a7-8486-c184-04f1d4c39b14	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a7-8486-2af8-07aa2a3df032	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a7-8486-2a89-eca588d58294	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a7-8486-426c-9a57dfa6e73b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a7-8486-3304-cb9d2984442a	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a7-8486-0c5d-3f19ffc5980d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a7-8486-e99a-5ce13b58488a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a7-8486-bcd6-23a56769df0b	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a7-8486-1c34-0dbb2428118a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a7-8486-bba0-111a16ed0014	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a7-8486-deef-c9e13e1cf649	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a7-8486-1e86-6c0318eaa046	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a7-8486-5b7a-99d669658b3b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a7-8486-9e2d-90d02ea05daa	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a7-8486-0c5b-9f73589f9c60	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a7-8486-5a59-e7ab738007ed	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a7-8486-d0cf-563ae60bf5a9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a7-8486-93ff-f0b87d7f7d7f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a7-8486-7b08-b394a874976a	ML	MLI	466	Mali 	Mali	\N
00040000-56a7-8486-fc44-c80b0d11b61d	MT	MLT	470	Malta 	Malta	\N
00040000-56a7-8486-d032-f9145fd259cd	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a7-8486-e968-ed04dcc618a6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a7-8486-5acd-aa7c46350485	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a7-8486-f704-ae550965a5b3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a7-8486-ea7a-45356371f445	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a7-8486-2aab-36d7e0ba3b9f	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a7-8486-c8db-0a6382089b74	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a7-8486-b23b-d46f78d18dd0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a7-8486-31b7-971dfd9166a7	MC	MCO	492	Monaco 	Monako	\N
00040000-56a7-8486-bd73-f36bca6c82cc	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a7-8486-3837-6b097cc287e6	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a7-8486-bff7-1395a120462e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a7-8486-5599-34357581d06d	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a7-8486-ff12-2899f743ea26	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a7-8486-8c1b-a3c018b9712a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a7-8486-a519-c4cebb73b869	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a7-8486-98b7-b464c0cb9e46	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a7-8486-a5fd-8ffc0d532d02	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a7-8486-259a-4177ed5f4b21	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a7-8486-5e42-1df0885ee57e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a7-8486-2458-357ff72b356a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a7-8486-7354-7abc316a5bae	NE	NER	562	Niger 	Niger 	\N
00040000-56a7-8486-1cde-d7bbd34d2be5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a7-8486-a9bb-1b628413a4ad	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a7-8486-090c-05171dbb7a9b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a7-8486-ac4c-f4b1e12b533a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a7-8486-18d2-cf67372958d2	NO	NOR	578	Norway 	Norveška	\N
00040000-56a7-8486-0d88-7b5c711f6cf8	OM	OMN	512	Oman 	Oman	\N
00040000-56a7-8486-5837-3f67cc5700c0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a7-8486-1541-474742b6bc5f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a7-8486-1fac-ef06b103e3a6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a7-8486-45cd-c4274335d52a	PA	PAN	591	Panama 	Panama	\N
00040000-56a7-8486-e2c0-883001700937	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a7-8486-54c2-bed8f725e818	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a7-8486-e94f-fc480bf86adc	PE	PER	604	Peru 	Peru	\N
00040000-56a7-8486-68ca-72a841e276e3	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a7-8486-ff2d-eedaf74b0169	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a7-8486-a612-514dfaf2b606	PL	POL	616	Poland 	Poljska	\N
00040000-56a7-8486-aca9-f5c78d13534d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a7-8486-ad57-06fecc3b1f83	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a7-8486-bb40-879f382b5b47	QA	QAT	634	Qatar 	Katar	\N
00040000-56a7-8486-626a-b7d6ae8b71cf	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a7-8486-e97a-bf8db46bffd2	RO	ROU	642	Romania 	Romunija	\N
00040000-56a7-8486-ca1c-2b10e8b8d3bc	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a7-8486-d2a6-7919b8e498a7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a7-8486-b91e-0115495b0b58	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a7-8486-4159-0de3127e0634	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a7-8486-ba33-cd72c96f9617	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a7-8486-880a-781c74800b72	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a7-8486-26d9-85e504bc0931	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a7-8486-6c55-e8dcceddd8d7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a7-8486-5b74-977d7f5b2f91	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a7-8486-80de-15faf077177e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a7-8486-266c-58ba7c669a58	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a7-8486-d0e5-820faf6d6aae	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a7-8486-943c-6e147b341096	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a7-8486-b985-bd8019a18e61	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a7-8486-f044-6b1504267961	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a7-8486-78c4-47818e580ac4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a7-8486-1312-1578864ea7fd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a7-8486-77b1-70bfed04d4eb	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a7-8486-e4dd-7ca08e311e75	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a7-8486-addf-7071985fddc3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a7-8486-2fcd-92a5d4750dd3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a7-8486-77f5-68b99a0a38cf	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a7-8486-f95c-fa3dad12f9ee	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a7-8486-ccf5-e18d8b22f7de	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a7-8486-a4aa-0eb7feaa74c5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a7-8486-7f5b-d7584fe7bd00	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a7-8486-515c-ca2551d9a53c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a7-8486-0aa9-8add1d07685e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a7-8486-25a1-fe61b514e7a7	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a7-8486-b330-e6bae4f1c11f	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a7-8486-36ea-a6823511c4f5	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a7-8486-8eb4-10690c86a5c6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a7-8486-f2a6-7e3059c4322d	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a7-8486-546f-46a6b3112ef5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a7-8486-142b-e31980b640bc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a7-8486-7833-7c54aebb76d6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a7-8486-86f4-9df2bfc1fcbf	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a7-8486-1a1f-88cd3ba39460	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a7-8486-865d-c60e274c311c	TH	THA	764	Thailand 	Tajska	\N
00040000-56a7-8486-ab60-c548e2c00dd3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a7-8486-eb19-37cad243f811	TG	TGO	768	Togo 	Togo	\N
00040000-56a7-8486-a913-56c59fcab963	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a7-8486-4ac6-0072edbf70c5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a7-8486-3cc8-586da9d3a9dd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a7-8486-4e4b-3ef7560f79e3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a7-8486-548f-fff935974ee5	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a7-8486-cd57-d672ea80bc04	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a7-8486-9517-c0d906acd864	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a7-8486-3d10-d293748fab37	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a7-8486-1e11-61bcb04f0e9a	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a7-8486-2350-86ded5783a09	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a7-8486-dde0-cefd136e1742	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a7-8486-6622-da863c7d9e98	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a7-8486-1307-91210e4c52c0	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a7-8486-7f54-b87100b90214	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a7-8486-c98e-df7af83f817c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a7-8486-e81e-6f913926f7b7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a7-8486-f7a6-944c492af329	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a7-8486-6c7a-24742eb3737a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a7-8486-36a4-88ff9742d590	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a7-8486-ff80-1325827d25ac	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a7-8486-9545-38de31abbdc3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a7-8486-8967-0a321cdc3430	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a7-8486-1cae-d0d33e5f195a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a7-8486-6b41-95a3b053277c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a7-8486-966e-64f69548c56a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a7-8486-2b74-2e3429d10db3	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 40489650)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a7-848a-5c5b-63f596a8970a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a7-848a-779e-b510bbea8964	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-848a-1063-2ae8ec0505cf	000e0000-56a7-848a-c03a-57fd988d648a	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-8486-722b-f9d41f22aa4d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-848a-f784-14bbb6c08945	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-8486-1f80-96f40cf1ef04	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a7-848a-6c04-955fc44c8022	000e0000-56a7-848a-b124-cb0dd685c7df	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a7-8486-722b-f9d41f22aa4d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 40489456)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a7-848a-7b5d-746ed8c095a8	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a7-8486-cf5a-912b69eb9659
000d0000-56a7-848a-a847-bc090b763069	000e0000-56a7-848a-29a0-b109b7adf6b2	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-8486-f096-6511ecfcd252
000d0000-56a7-848a-3bad-f323d9a5f8e0	000e0000-56a7-848a-29a0-b109b7adf6b2	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-c659-71ce17a0b56a	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-a9e7-ec79cc4b835b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-8486-f096-6511ecfcd252
000d0000-56a7-848a-ecc0-2461399d9a3d	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-2c91-3b7af9b0eae6	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-f6f1-beed0dd7faad	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-6ef8-f1a9c03d72ff	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a7-8486-f27d-b4fd317d4a90
000d0000-56a7-848a-7788-6ed98a0d695b	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-0720-78f77b1d4dfd	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a7-8486-cf5a-912b69eb9659
000d0000-56a7-848a-31fe-bdce5fd5e32e	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-0b94-12a9f5f32503	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a7-8486-cf5a-912b69eb9659
000d0000-56a7-848a-a5fa-7892b8c90dce	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-a141-9b418a0da50f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a7-8486-f096-6511ecfcd252
000d0000-56a7-848a-66f4-3397206e3da4	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-ffe5-36c392e43300	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a7-8486-f096-6511ecfcd252
000d0000-56a7-848a-a009-281c0156f770	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-89bc-5c447b0a83c6	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a7-8486-3310-bf9dd10a1a8c
000d0000-56a7-848a-6158-0cf0cad177a8	000e0000-56a7-848a-eef2-93dbc1a9cede	000c0000-56a7-848b-8e3c-f37278b93873	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a7-8486-bdcc-88a826aec135
000d0000-56a7-848a-05d9-4bbc04446e09	000e0000-56a7-848a-ec8b-c63fe8f48e77	000c0000-56a7-848b-e11d-c3c4fec324eb	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-3234-d46ba0a7efc6	000e0000-56a7-848a-1cab-04986185d11d	000c0000-56a7-848b-941c-f59710ac8692	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-da93-5b8fb6274e48	000e0000-56a7-848a-1cab-04986185d11d	000c0000-56a7-848b-a021-fd1b4771c581	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-188e-50b54452bcea	000e0000-56a7-848a-6e42-c75d218b8c55	000c0000-56a7-848b-eb4e-edf36fa73756	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-b3fc-5f38f03616f3	000e0000-56a7-848a-7d2e-29e789da86fc	000c0000-56a7-848b-cb73-d0391ece4e11	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-e9f5-71d78de60651	000e0000-56a7-848a-aeca-cf64fb7413e3	000c0000-56a7-848b-f807-5d25684e12cb	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-d2de-1b188638cf09	000e0000-56a7-848a-f6fc-6339d2b7ce19	000c0000-56a7-848b-6ca9-8f4154181129	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-f88a-35f666ee3821	000e0000-56a7-848a-3d7d-f8b6b8e80d63	000c0000-56a7-848b-5102-884fbc4b6d87	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-33e0-c25ea595bc0c	000e0000-56a7-848a-2a0b-42dd6c902e57	000c0000-56a7-848b-893b-3d589d31fbcd	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-6866-40234b20d1f2	000e0000-56a7-848a-2a0b-42dd6c902e57	000c0000-56a7-848b-65b9-93b272b4f1e2	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-c62f-f04987390b8d	000e0000-56a7-848a-6fec-123c7cb6a39b	000c0000-56a7-848b-9a3a-39fa9626b218	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
000d0000-56a7-848a-9287-bf562e464775	000e0000-56a7-848a-6fec-123c7cb6a39b	000c0000-56a7-848b-1dde-93c58c586cc3	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a7-8486-968b-048ce3654459
\.


--
-- TOC entry 3162 (class 0 OID 40489234)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40489205)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 40489182)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a7-848a-9636-3c306acd4ab7	00080000-56a7-848a-5df5-cae2c08c0fda	00090000-56a7-848a-1404-2ca5b6ecea2d	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 40489370)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 40489920)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a7-848a-2da8-966bc2ca1813	00010000-56a7-8488-d7be-da8e2c15ad84	\N	Prva mapa	Root mapa	2016-01-26 15:36:58	2016-01-26 15:36:58	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 40489933)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 40489955)
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
-- TOC entry 3180 (class 0 OID 40489394)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 40489139)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a7-8488-68f6-c6f138d078f2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a7-8488-54f7-a8a0a12eca73	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a7-8488-5802-c44ffd15b148	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a7-8488-9068-ac15a09ab87a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a7-8488-d00a-477e606388e1	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a7-8488-0797-885bbe3455a6	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a7-8488-cd41-5e2934c6c1ab	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a7-8488-d207-acfa0ef55918	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a7-8488-0a11-3bb4a7f1cae0	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a7-8488-9772-7fd4fe7ab3b3	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a7-8488-8d02-1006a23e4a13	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a7-8488-a34c-e378e5a6c956	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a7-8488-1ad2-d21dc6ca3555	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a7-8488-4f98-0b5ac4003d9a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a7-8488-c967-01f08d3cb028	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a7-8488-313b-86ffc05826ab	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a7-8488-dad6-a85e205717c1	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a7-8489-34f6-d5bd76425dd0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a7-8489-111d-892c15d10bf4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a7-8489-1d07-04efff3072f7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a7-8489-bd0e-18da566caaf4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a7-8489-9835-c8f1a4ed27f9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a7-848c-1633-cc1dcf5da4ba	application.tenant.maticnopodjetje	string	s:36:"00080000-56a7-848c-08ac-87c334ee47b6";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 40489039)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a7-8489-2848-be29529c4d39	00000000-56a7-8489-34f6-d5bd76425dd0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a7-8489-f1d4-d85a918107e3	00000000-56a7-8489-34f6-d5bd76425dd0	00010000-56a7-8488-d7be-da8e2c15ad84	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a7-8489-6c7f-10cdbce95dcb	00000000-56a7-8489-111d-892c15d10bf4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 40489106)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a7-848a-0989-0bfa03fec7c5	\N	00100000-56a7-848a-c3f8-948f9e6ece17	00100000-56a7-848a-2587-f2c17f4a0e99	01	Gledališče Nimbis
00410000-56a7-848a-2b6a-41a365319e5b	00410000-56a7-848a-0989-0bfa03fec7c5	00100000-56a7-848a-c3f8-948f9e6ece17	00100000-56a7-848a-2587-f2c17f4a0e99	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 40489050)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a7-848a-4182-f91fda1470dc	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a7-848a-4c52-6f6390b6b784	00010000-56a7-848a-1b9e-22d74168ce13	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a7-848a-f9d4-203d53cb150c	00010000-56a7-848a-8cc6-f47cdace6f59	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a7-848a-908b-a8aa73c6d15d	00010000-56a7-848a-88c5-a4fa7875f319	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a7-848a-4c53-ea4013cfece8	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a7-848a-2070-4ba7cb5af0db	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a7-848a-cba4-6c08456b0828	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a7-848a-84be-3bc08edd3981	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a7-848a-1404-2ca5b6ecea2d	00010000-56a7-848a-c2a9-cded4fbc2901	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a7-848a-8480-fb6a80dba440	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a7-848a-86b3-66aba68b812c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-848a-184d-be990a931e2c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a7-848a-5acb-7428a4429dbb	00010000-56a7-848a-a3f1-5f463e2c1f6a	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-848a-61b1-7c7d74c52b81	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-848a-9f97-2f7ccba8af30	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-848a-7142-e59763829141	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-848a-07f6-03dc3e7b88c0	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-848a-8076-13d7fcd7d28e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a7-848a-eb94-50d8c1d4b6e5	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-848a-8691-03fd4851b9d4	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a7-848a-10b5-28b854914563	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 40488984)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a7-8487-2172-b24c4cbe9f97	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a7-8487-1e14-8732d958d62b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a7-8487-1bb5-7677945824b5	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a7-8487-6312-9b736846c984	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a7-8487-8536-fbff92fd8b7b	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a7-8487-6677-0734bfa72526	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a7-8487-0ffa-a9584ad6c011	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a7-8487-de4a-8a5f6445add7	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a7-8487-608f-7ee50c65147f	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a7-8487-a6f7-9b455e8d154b	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a7-8487-05bd-c06ab8b1aff9	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a7-8487-12f6-d45fd1d18dfb	Abonma-read	Abonma - branje	t
00030000-56a7-8487-26d7-6489bb540675	Abonma-write	Abonma - spreminjanje	t
00030000-56a7-8487-0b1d-487e376827e9	Alternacija-read	Alternacija - branje	t
00030000-56a7-8487-2f84-ab645cf58172	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a7-8487-f586-4e531096c762	Arhivalija-read	Arhivalija - branje	t
00030000-56a7-8487-05fd-60d459bd9392	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a7-8487-80b9-5198f06677a0	AuthStorage-read	AuthStorage - branje	t
00030000-56a7-8487-2d31-f0e8cd0b6181	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a7-8487-d1aa-f3226839330d	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a7-8487-8f0d-21d1afca48b4	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a7-8487-3482-2f94967a991d	Besedilo-read	Besedilo - branje	t
00030000-56a7-8487-1945-a722f4226981	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a7-8487-6d14-f369974018bd	Dodatek-read	Dodatek - branje	t
00030000-56a7-8487-65ad-cbbe7ae5e9fe	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a7-8487-1ab5-3b30f4b19d97	Dogodek-read	Dogodek - branje	t
00030000-56a7-8487-55ec-5a4720684c9a	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a7-8487-f17d-d32eec131c01	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a7-8487-0462-69eaea722b92	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a7-8487-8b3f-491c0e6b7a25	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a7-8487-6e11-cb2198c5d3d0	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a7-8487-8dc3-3f58a6e8f56a	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a7-8487-6846-94142de8c80f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a7-8487-e6d5-a34451a46eba	DrugiVir-read	DrugiVir - branje	t
00030000-56a7-8487-3b12-d0ad49b102aa	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a7-8487-2d61-e8e11b07f34c	Drzava-read	Drzava - branje	t
00030000-56a7-8487-c9eb-124a3fd9a4bc	Drzava-write	Drzava - spreminjanje	t
00030000-56a7-8487-3361-065997daa3c2	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a7-8487-ccb4-889adff6ab7a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a7-8487-04e1-bf11e86e9db0	Funkcija-read	Funkcija - branje	t
00030000-56a7-8487-76df-08f03cbe0e1f	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a7-8487-bbc1-d5e4f99fcbf7	Gostovanje-read	Gostovanje - branje	t
00030000-56a7-8487-3caa-88d02a6fd0d8	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a7-8487-9702-a4d1ee2d8800	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a7-8487-5e6e-c7b6924d8de4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a7-8487-4518-19d55e24ee35	Kupec-read	Kupec - branje	t
00030000-56a7-8487-a8ef-759bdd26dceb	Kupec-write	Kupec - spreminjanje	t
00030000-56a7-8487-0fac-1d746d22ebd9	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a7-8487-9c9d-6552ceb6ad45	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a7-8487-f51e-dc7acf5f1787	Option-read	Option - branje	t
00030000-56a7-8487-cf68-9a9ce292950d	Option-write	Option - spreminjanje	t
00030000-56a7-8487-d25b-f3edd22bffbc	OptionValue-read	OptionValue - branje	t
00030000-56a7-8487-5d92-663692364864	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a7-8487-691e-b4f8e3c3b215	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a7-8487-6036-426e7f2b3fac	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a7-8487-3357-701d1691cdfe	Oseba-read	Oseba - branje	t
00030000-56a7-8487-c6be-5713a6dffcb7	Oseba-write	Oseba - spreminjanje	t
00030000-56a7-8487-9120-9dfb7445d090	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a7-8487-6be9-42f0f0ce6e66	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a7-8487-58f2-95f17ad0bc25	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a7-8487-9326-05da6f48c338	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a7-8487-2542-f2a1aeee4c5a	Pogodba-read	Pogodba - branje	t
00030000-56a7-8487-180a-cc702a61425b	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a7-8487-8e6a-796fe65a20f6	Popa-read	Popa - branje	t
00030000-56a7-8487-113b-8c63d52712eb	Popa-write	Popa - spreminjanje	t
00030000-56a7-8487-fb1c-762754e8ed70	Posta-read	Posta - branje	t
00030000-56a7-8487-837a-5dc6a9060254	Posta-write	Posta - spreminjanje	t
00030000-56a7-8487-c6d9-3a6bec0df688	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a7-8487-8541-2c9e5ec33163	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a7-8487-926e-d291945c4efd	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a7-8487-a3a2-41d04ab9e4c4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a7-8487-b09d-88e57b4f3c80	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a7-8487-cffe-05c6b713d1b0	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a7-8487-664b-36e3f98e66dc	Praznik-read	Praznik - branje	t
00030000-56a7-8487-5fa0-5ee28c8f2b90	Praznik-write	Praznik - spreminjanje	t
00030000-56a7-8487-4ee8-2d7ad691ad1b	Predstava-read	Predstava - branje	t
00030000-56a7-8487-4793-838ce92ed64c	Predstava-write	Predstava - spreminjanje	t
00030000-56a7-8487-a2d7-ce798f112050	Ura-read	Ura - branje	t
00030000-56a7-8487-3ff6-6e58ee85806f	Ura-write	Ura - spreminjanje	t
00030000-56a7-8487-22c9-b5db80d6040c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a7-8487-b563-dde6c5e12c65	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a7-8487-2825-c526437b6d84	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a7-8487-ff2c-420b1062955e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a7-8487-82a7-3ac39dba5688	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a7-8487-56c0-939562200f66	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a7-8487-4ff6-8bb2aab7cfc7	ProgramDela-read	ProgramDela - branje	t
00030000-56a7-8487-5d9d-9589f0645d13	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a7-8487-a7eb-95fb74f15e6c	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a7-8487-5d31-f04183ba16f8	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a7-8487-fad3-8599a3a8f9ed	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a7-8487-fec8-9b91497fa8fd	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a7-8487-ca01-c7ac5df1955f	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a7-8487-bd1a-084a7862ba52	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a7-8487-1e6c-3e5b8ca83e25	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a7-8487-7bf7-ca11c20ee9ee	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a7-8487-f4bd-b94832fdbfd6	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a7-8487-6796-55bab0efc5e7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a7-8487-8a8f-cbba41b14316	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a7-8487-1533-409510bf9a45	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a7-8487-cf95-1aab99c8549d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a7-8487-341e-1f5f10a95bf1	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a7-8487-7906-dedf0855cc61	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a7-8487-a1ff-82fe6e4bb323	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a7-8487-6d17-98e04923b5e7	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a7-8487-6cd4-8ff45af6fa00	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a7-8487-4688-647364ef34a1	Prostor-read	Prostor - branje	t
00030000-56a7-8487-553f-d93e7ebfec2d	Prostor-write	Prostor - spreminjanje	t
00030000-56a7-8487-0714-57370c48f7b3	Racun-read	Racun - branje	t
00030000-56a7-8487-434f-3678d190b528	Racun-write	Racun - spreminjanje	t
00030000-56a7-8487-5bb8-2b1c26bfcd09	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a7-8487-2113-f5a6c50df4e9	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a7-8487-6dae-cecc56fb8878	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a7-8487-2550-7d0d4e621a64	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a7-8487-ce73-ed688b29f90c	Rekvizit-read	Rekvizit - branje	t
00030000-56a7-8487-5eb2-fef7bf29c389	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a7-8487-c7cd-963d0652e863	Revizija-read	Revizija - branje	t
00030000-56a7-8487-1bf9-9023ea136e2d	Revizija-write	Revizija - spreminjanje	t
00030000-56a7-8487-e9d3-75c2a5b029b6	Rezervacija-read	Rezervacija - branje	t
00030000-56a7-8487-715a-b287d04f1b67	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a7-8487-d8fa-e3468270bd5a	SedezniRed-read	SedezniRed - branje	t
00030000-56a7-8487-e0be-8cdbbe98390b	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a7-8487-85ec-262256394266	Sedez-read	Sedez - branje	t
00030000-56a7-8487-c602-dd2b1b39a31f	Sedez-write	Sedez - spreminjanje	t
00030000-56a7-8487-1325-ba313614dc4e	Sezona-read	Sezona - branje	t
00030000-56a7-8487-2330-f2c9f3acf608	Sezona-write	Sezona - spreminjanje	t
00030000-56a7-8487-0301-f0f680de3ce3	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a7-8487-4d11-2bb8169fab12	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a7-8487-63f1-efa93370ad1d	Telefonska-read	Telefonska - branje	t
00030000-56a7-8487-0403-7a226f821db9	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a7-8487-c8cd-a8e20d35c3d3	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a7-8487-f75d-7451a408c618	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a7-8487-0eee-2d552a7deb72	TipDodatka-read	TipDodatka - branje	t
00030000-56a7-8487-f7dd-d65928a9d69b	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a7-8487-9cee-68416d1e2ad4	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a7-8487-1e31-39f89e572a9e	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a7-8487-96f1-2c2297200b75	TipPopa-read	TipPopa - branje	t
00030000-56a7-8487-8b18-10a00f12ad5f	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a7-8487-2895-b118b3f956f1	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a7-8487-e168-938cd4841104	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a7-8487-6b52-414367c0452e	TipVaje-read	TipVaje - branje	t
00030000-56a7-8487-5fcf-727397388a2e	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a7-8487-2561-83984adecec9	Trr-read	Trr - branje	t
00030000-56a7-8487-f28a-7756a2a4e692	Trr-write	Trr - spreminjanje	t
00030000-56a7-8487-2086-9483bcf0a8a9	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a7-8487-80fa-a41a25c6ea34	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a7-8487-04ca-426626d7ea35	Vaja-read	Vaja - branje	t
00030000-56a7-8487-734c-1401ad56c9ca	Vaja-write	Vaja - spreminjanje	t
00030000-56a7-8487-026d-04bcdba11c62	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a7-8487-562b-de0c7d9c0c5f	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a7-8487-9c36-d8bfe898106b	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a7-8487-bd6c-876f2be5eaff	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a7-8487-96d5-330604dda564	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a7-8487-e2e8-310a273262c0	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a7-8487-9041-2bf398992315	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a7-8487-7fa3-3456c220f9ae	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a7-8487-e921-5396e94c6215	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a7-8487-ddf3-455509ddb8dc	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a7-8487-af91-feeccaf5d13f	Job-read	Branje opravil - samo zase - branje	t
00030000-56a7-8487-7c9b-029c929ffc18	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a7-8487-d8e1-8f9b13252593	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a7-8487-d946-ab88fe64b5bf	Report-read	Report - branje	t
00030000-56a7-8487-0e12-f18da8cdb824	Report-write	Report - spreminjanje	t
00030000-56a7-8487-9423-8296a87fef8b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a7-8487-c5c3-c8960ee28877	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a7-8487-f2e1-6575b7ffcc11	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a7-8487-b157-4bb5921eb846	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a7-8487-e4a2-ae622446e37e	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a7-8487-b270-a52a9b83907f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a7-8487-f308-f94f7c573525	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a7-8487-703f-920120a9ea9c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a7-8487-923b-4fefc6f780ab	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a7-8487-bc11-d7df53944964	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a7-8487-c005-b4042b0489f4	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a7-8487-843b-df0910b26768	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a7-8487-686a-9ca3e038f4f4	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a7-8487-6a2c-0705e1ea3141	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a7-8487-0c23-d96c9427f48c	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 40489003)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a7-8487-0909-6226d7ca2c58	00030000-56a7-8487-1e14-8732d958d62b
00020000-56a7-8487-0909-6226d7ca2c58	00030000-56a7-8487-2172-b24c4cbe9f97
00020000-56a7-8487-e335-50991e3fb59d	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-8f0d-21d1afca48b4
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-1945-a722f4226981
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-74b2-9e24785cc340	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-fda2-ca24b66fd88f	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-8487-fda2-ca24b66fd88f	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-fda2-ca24b66fd88f	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-fda2-ca24b66fd88f	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-fda2-ca24b66fd88f	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-fda2-ca24b66fd88f	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-26f2-4b0394d2ca11	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-26f2-4b0394d2ca11	00030000-56a7-8487-e2e8-310a273262c0
00020000-56a7-8487-26f2-4b0394d2ca11	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-26f2-4b0394d2ca11	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-8487-26f2-4b0394d2ca11	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-26f2-4b0394d2ca11	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-26f2-4b0394d2ca11	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-9659-e4d0d322f2aa	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-9659-e4d0d322f2aa	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-9659-e4d0d322f2aa	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-3048-284b4ea90c29	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-3048-284b4ea90c29	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-3048-284b4ea90c29	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-3048-284b4ea90c29	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-3048-284b4ea90c29	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-3048-284b4ea90c29	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-3048-284b4ea90c29	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-3048-284b4ea90c29	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-fe1f-9ce70685258a	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-fe1f-9ce70685258a	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-fe1f-9ce70685258a	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-fe1f-9ce70685258a	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-f28a-7756a2a4e692
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-cffe-05c6b713d1b0
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-0403-7a226f821db9
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-2829-58b139510d7b	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-00bd-a6b81e05e187	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-00bd-a6b81e05e187	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-00bd-a6b81e05e187	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-00bd-a6b81e05e187	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-00bd-a6b81e05e187	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-00bd-a6b81e05e187	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-00bd-a6b81e05e187	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-0403-7a226f821db9
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-cffe-05c6b713d1b0
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-f28a-7756a2a4e692
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-113b-8c63d52712eb
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-5e6e-c7b6924d8de4
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-56c0-939562200f66
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-3cdc-5aee051a02d5	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-1ca0-4fff71cd947d	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-21fd-62a61d598ef4	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-21fd-62a61d598ef4	00030000-56a7-8487-8b18-10a00f12ad5f
00020000-56a7-8487-502f-1b84e979607d	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-b468-12c553486aa0	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-b468-12c553486aa0	00030000-56a7-8487-837a-5dc6a9060254
00020000-56a7-8487-b778-bcb904e71af7	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-f6ef-fc42da10ba47	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-f6ef-fc42da10ba47	00030000-56a7-8487-c9eb-124a3fd9a4bc
00020000-56a7-8487-f2e6-76ca490a1def	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-c084-54d06e920d40	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-8487-c084-54d06e920d40	00030000-56a7-8487-ddf3-455509ddb8dc
00020000-56a7-8487-9eab-426aa497d9f8	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-8487-f889-cfd83cd6b2b9	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-f889-cfd83cd6b2b9	00030000-56a7-8487-7fa3-3456c220f9ae
00020000-56a7-8487-7467-6d8ab918d0e7	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-1abe-26f418151346	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-8487-1abe-26f418151346	00030000-56a7-8487-26d7-6489bb540675
00020000-56a7-8487-cb39-3d5e91e34d2f	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-8487-bd18-f6f0a5a9b762	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-bd18-f6f0a5a9b762	00030000-56a7-8487-553f-d93e7ebfec2d
00020000-56a7-8487-bd18-f6f0a5a9b762	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-bd18-f6f0a5a9b762	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-bd18-f6f0a5a9b762	00030000-56a7-8487-cffe-05c6b713d1b0
00020000-56a7-8487-bd18-f6f0a5a9b762	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-d39a-e8ac2a2ca07f	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-d39a-e8ac2a2ca07f	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-d39a-e8ac2a2ca07f	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-87f2-87529e02b692	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-87f2-87529e02b692	00030000-56a7-8487-bd6c-876f2be5eaff
00020000-56a7-8487-5821-4925d5553e1f	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-6036-426e7f2b3fac
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-0ea1-2da4c5f1fc96	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-613e-74120ce25caa	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-613e-74120ce25caa	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-613e-74120ce25caa	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-613e-74120ce25caa	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-613e-74120ce25caa	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-f454-c2cbf7e5f1e8	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-8487-f454-c2cbf7e5f1e8	00030000-56a7-8487-5fcf-727397388a2e
00020000-56a7-8487-7547-ea3a196b1bfa	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-0ffa-a9584ad6c011
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-de4a-8a5f6445add7
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-4ff6-8bb2aab7cfc7
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-5d9d-9589f0645d13
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-a7eb-95fb74f15e6c
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-5d31-f04183ba16f8
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-fad3-8599a3a8f9ed
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-fec8-9b91497fa8fd
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-ca01-c7ac5df1955f
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-bd1a-084a7862ba52
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-1e6c-3e5b8ca83e25
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-7bf7-ca11c20ee9ee
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-f4bd-b94832fdbfd6
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-6796-55bab0efc5e7
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-8a8f-cbba41b14316
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-1533-409510bf9a45
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-cf95-1aab99c8549d
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-341e-1f5f10a95bf1
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-7906-dedf0855cc61
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-a1ff-82fe6e4bb323
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-6d17-98e04923b5e7
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-6cd4-8ff45af6fa00
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-ff2c-420b1062955e
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-3b12-d0ad49b102aa
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-8541-2c9e5ec33163
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-7c9b-029c929ffc18
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-e6d5-a34451a46eba
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-2825-c526437b6d84
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-c6d9-3a6bec0df688
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-af91-feeccaf5d13f
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-278d-efe7a667fe97	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-4ff6-8bb2aab7cfc7
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-a7eb-95fb74f15e6c
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-fad3-8599a3a8f9ed
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-ca01-c7ac5df1955f
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-1e6c-3e5b8ca83e25
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-f4bd-b94832fdbfd6
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-8a8f-cbba41b14316
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-cf95-1aab99c8549d
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-7906-dedf0855cc61
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-6d17-98e04923b5e7
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-2825-c526437b6d84
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-e6d5-a34451a46eba
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-c6d9-3a6bec0df688
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-af91-feeccaf5d13f
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-752f-993bff06db02	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-80fa-a41a25c6ea34
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-a6f7-9b455e8d154b
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-81f6-1364bd3268a4	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-03be-3defa2c6202a	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-ab55-3cefc5650fce	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-ab55-3cefc5650fce	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-ab55-3cefc5650fce	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-ab55-3cefc5650fce	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-8487-ab55-3cefc5650fce	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-ab55-3cefc5650fce	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-ab55-3cefc5650fce	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-ab55-3cefc5650fce	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-180a-cc702a61425b
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-4d11-2bb8169fab12
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-b4da-fe678365720d	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-414f-11d23141f46c	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-4fbe-36c69c773ce2	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-4fbe-36c69c773ce2	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-4fbe-36c69c773ce2	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-4fbe-36c69c773ce2	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-4fbe-36c69c773ce2	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-4fbe-36c69c773ce2	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-4fbe-36c69c773ce2	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-0ea4-1f9020cb65e7	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-0ea4-1f9020cb65e7	00030000-56a7-8487-4d11-2bb8169fab12
00020000-56a7-8487-0ea4-1f9020cb65e7	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-0ea4-1f9020cb65e7	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-653a-3a5a74bf8663	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-653a-3a5a74bf8663	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-8f0d-21d1afca48b4
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-1945-a722f4226981
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-e6d5-a34451a46eba
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-3b12-d0ad49b102aa
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-a6f7-9b455e8d154b
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-af91-feeccaf5d13f
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-7c9b-029c929ffc18
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-180a-cc702a61425b
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-c6d9-3a6bec0df688
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-8541-2c9e5ec33163
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-2825-c526437b6d84
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-ff2c-420b1062955e
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-0ffa-a9584ad6c011
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-4ff6-8bb2aab7cfc7
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-de4a-8a5f6445add7
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-5d9d-9589f0645d13
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-a7eb-95fb74f15e6c
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-5d31-f04183ba16f8
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-fad3-8599a3a8f9ed
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-fec8-9b91497fa8fd
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-ca01-c7ac5df1955f
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-bd1a-084a7862ba52
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-1e6c-3e5b8ca83e25
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-7bf7-ca11c20ee9ee
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-f4bd-b94832fdbfd6
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-6796-55bab0efc5e7
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-8a8f-cbba41b14316
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-1533-409510bf9a45
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-cf95-1aab99c8549d
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-341e-1f5f10a95bf1
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-7906-dedf0855cc61
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-a1ff-82fe6e4bb323
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-6d17-98e04923b5e7
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-6cd4-8ff45af6fa00
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-4d11-2bb8169fab12
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-80fa-a41a25c6ea34
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-6e2a-7e00a8ca76a3	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-8f0d-21d1afca48b4
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-1945-a722f4226981
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-1d92-291e2c6a0acf	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-8f0d-21d1afca48b4
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-1945-a722f4226981
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-a6f7-9b455e8d154b
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-80fa-a41a25c6ea34
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-8753-0137a0cb037b	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-8f0d-21d1afca48b4
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-1945-a722f4226981
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-e6d5-a34451a46eba
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-3b12-d0ad49b102aa
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-a6f7-9b455e8d154b
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-af91-feeccaf5d13f
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-7c9b-029c929ffc18
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-5e6e-c7b6924d8de4
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-180a-cc702a61425b
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-113b-8c63d52712eb
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-c6d9-3a6bec0df688
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-8541-2c9e5ec33163
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-cffe-05c6b713d1b0
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-2825-c526437b6d84
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-ff2c-420b1062955e
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-56c0-939562200f66
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-0ffa-a9584ad6c011
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-4ff6-8bb2aab7cfc7
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-de4a-8a5f6445add7
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-5d9d-9589f0645d13
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-a7eb-95fb74f15e6c
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-5d31-f04183ba16f8
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-fad3-8599a3a8f9ed
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-fec8-9b91497fa8fd
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-ca01-c7ac5df1955f
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-bd1a-084a7862ba52
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-1e6c-3e5b8ca83e25
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-7bf7-ca11c20ee9ee
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-f4bd-b94832fdbfd6
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-6796-55bab0efc5e7
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-8a8f-cbba41b14316
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-1533-409510bf9a45
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-cf95-1aab99c8549d
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-341e-1f5f10a95bf1
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-7906-dedf0855cc61
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-a1ff-82fe6e4bb323
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-6d17-98e04923b5e7
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-6cd4-8ff45af6fa00
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-4d11-2bb8169fab12
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-0403-7a226f821db9
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-f28a-7756a2a4e692
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-80fa-a41a25c6ea34
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-e2e8-310a273262c0
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-c5e8-d770b9e4c1b2	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-8f0d-21d1afca48b4
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-1945-a722f4226981
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-a6f7-9b455e8d154b
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-5e6e-c7b6924d8de4
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-113b-8c63d52712eb
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-cffe-05c6b713d1b0
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-56c0-939562200f66
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-0403-7a226f821db9
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-f28a-7756a2a4e692
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-80fa-a41a25c6ea34
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-e2e8-310a273262c0
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-01a2-435f01bcf258	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-9027-6f16d63f624f	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-e6d5-a34451a46eba
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-3b12-d0ad49b102aa
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-af91-feeccaf5d13f
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-7c9b-029c929ffc18
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-5e6e-c7b6924d8de4
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-6036-426e7f2b3fac
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-180a-cc702a61425b
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-113b-8c63d52712eb
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-c6d9-3a6bec0df688
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-8541-2c9e5ec33163
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-cffe-05c6b713d1b0
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-2825-c526437b6d84
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-ff2c-420b1062955e
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-56c0-939562200f66
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-0ffa-a9584ad6c011
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-4ff6-8bb2aab7cfc7
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-de4a-8a5f6445add7
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-5d9d-9589f0645d13
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-a7eb-95fb74f15e6c
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-5d31-f04183ba16f8
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-fad3-8599a3a8f9ed
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-fec8-9b91497fa8fd
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-ca01-c7ac5df1955f
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-bd1a-084a7862ba52
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-1e6c-3e5b8ca83e25
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-7bf7-ca11c20ee9ee
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-f4bd-b94832fdbfd6
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-6796-55bab0efc5e7
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-8a8f-cbba41b14316
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-1533-409510bf9a45
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-cf95-1aab99c8549d
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-341e-1f5f10a95bf1
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-7906-dedf0855cc61
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-a1ff-82fe6e4bb323
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-6d17-98e04923b5e7
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-6cd4-8ff45af6fa00
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-4d11-2bb8169fab12
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-0403-7a226f821db9
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-f28a-7756a2a4e692
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-bd6c-876f2be5eaff
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-e2e8-310a273262c0
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-8487-4e2c-f5044a7198ba	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2172-b24c4cbe9f97
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1e14-8732d958d62b
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-12f6-d45fd1d18dfb
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-26d7-6489bb540675
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-f586-4e531096c762
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-05fd-60d459bd9392
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-80b9-5198f06677a0
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2d31-f0e8cd0b6181
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-d1aa-f3226839330d
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-8f0d-21d1afca48b4
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-3482-2f94967a991d
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1945-a722f4226981
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1ab5-3b30f4b19d97
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6312-9b736846c984
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-f17d-d32eec131c01
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0462-69eaea722b92
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-8b3f-491c0e6b7a25
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6e11-cb2198c5d3d0
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-8dc3-3f58a6e8f56a
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6846-94142de8c80f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-55ec-5a4720684c9a
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-e6d5-a34451a46eba
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-3b12-d0ad49b102aa
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2d61-e8e11b07f34c
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-c9eb-124a3fd9a4bc
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-3361-065997daa3c2
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-ccb4-889adff6ab7a
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-a6f7-9b455e8d154b
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-bbc1-d5e4f99fcbf7
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-3caa-88d02a6fd0d8
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-d8e1-8f9b13252593
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-af91-feeccaf5d13f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-7c9b-029c929ffc18
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-9702-a4d1ee2d8800
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-5e6e-c7b6924d8de4
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-4518-19d55e24ee35
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-a8ef-759bdd26dceb
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-f308-f94f7c573525
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-b270-a52a9b83907f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-c5c3-c8960ee28877
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-f2e1-6575b7ffcc11
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-b157-4bb5921eb846
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-e4a2-ae622446e37e
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0fac-1d746d22ebd9
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-9c9d-6552ceb6ad45
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-f51e-dc7acf5f1787
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-d25b-f3edd22bffbc
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-5d92-663692364864
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-05bd-c06ab8b1aff9
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-cf68-9a9ce292950d
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-691e-b4f8e3c3b215
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6036-426e7f2b3fac
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-9120-9dfb7445d090
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6be9-42f0f0ce6e66
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-58f2-95f17ad0bc25
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-9326-05da6f48c338
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-180a-cc702a61425b
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-113b-8c63d52712eb
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-fb1c-762754e8ed70
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-c6d9-3a6bec0df688
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-8541-2c9e5ec33163
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-926e-d291945c4efd
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-a3a2-41d04ab9e4c4
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-837a-5dc6a9060254
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-cffe-05c6b713d1b0
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-664b-36e3f98e66dc
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-5fa0-5ee28c8f2b90
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-4ee8-2d7ad691ad1b
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-4793-838ce92ed64c
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-22c9-b5db80d6040c
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-b563-dde6c5e12c65
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2825-c526437b6d84
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-ff2c-420b1062955e
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-82a7-3ac39dba5688
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-56c0-939562200f66
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0ffa-a9584ad6c011
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-4ff6-8bb2aab7cfc7
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-de4a-8a5f6445add7
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-5d9d-9589f0645d13
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-a7eb-95fb74f15e6c
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-5d31-f04183ba16f8
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-fad3-8599a3a8f9ed
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-fec8-9b91497fa8fd
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-ca01-c7ac5df1955f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-bd1a-084a7862ba52
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1e6c-3e5b8ca83e25
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-7bf7-ca11c20ee9ee
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-f4bd-b94832fdbfd6
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6796-55bab0efc5e7
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-8a8f-cbba41b14316
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1533-409510bf9a45
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-cf95-1aab99c8549d
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-341e-1f5f10a95bf1
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-7906-dedf0855cc61
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-a1ff-82fe6e4bb323
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6d17-98e04923b5e7
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6cd4-8ff45af6fa00
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-4688-647364ef34a1
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-553f-d93e7ebfec2d
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0714-57370c48f7b3
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-434f-3678d190b528
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-5bb8-2b1c26bfcd09
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2113-f5a6c50df4e9
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6dae-cecc56fb8878
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2550-7d0d4e621a64
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-ce73-ed688b29f90c
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-5eb2-fef7bf29c389
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-d946-ab88fe64b5bf
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0e12-f18da8cdb824
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-c7cd-963d0652e863
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1bf9-9023ea136e2d
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-e9d3-75c2a5b029b6
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-715a-b287d04f1b67
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-d8fa-e3468270bd5a
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-e0be-8cdbbe98390b
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-85ec-262256394266
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-c602-dd2b1b39a31f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1325-ba313614dc4e
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2330-f2c9f3acf608
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-9423-8296a87fef8b
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-4d11-2bb8169fab12
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-0403-7a226f821db9
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-c8cd-a8e20d35c3d3
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1bb5-7677945824b5
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-f75d-7451a408c618
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-9cee-68416d1e2ad4
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-1e31-39f89e572a9e
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-96f1-2c2297200b75
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-8b18-10a00f12ad5f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2895-b118b3f956f1
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-e168-938cd4841104
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-6b52-414367c0452e
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-5fcf-727397388a2e
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-f28a-7756a2a4e692
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-80fa-a41a25c6ea34
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-04ca-426626d7ea35
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-734c-1401ad56c9ca
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-026d-04bcdba11c62
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-562b-de0c7d9c0c5f
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-9c36-d8bfe898106b
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-bd6c-876f2be5eaff
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-686a-9ca3e038f4f4
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-843b-df0910b26768
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-e2e8-310a273262c0
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-9041-2bf398992315
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-7fa3-3456c220f9ae
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-e921-5396e94c6215
00020000-56a7-848a-7b9d-c5c2280452ef	00030000-56a7-8487-ddf3-455509ddb8dc
00020000-56a7-848a-b79f-779f1e5126d1	00030000-56a7-8487-c005-b4042b0489f4
00020000-56a7-848a-de48-d4ae1c5b04e9	00030000-56a7-8487-bc11-d7df53944964
00020000-56a7-848a-fac5-c2d18d191a04	00030000-56a7-8487-80fa-a41a25c6ea34
00020000-56a7-848a-f118-3136c6bbc068	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-848a-6e7d-a0a772e26cbf	00030000-56a7-8487-f2e1-6575b7ffcc11
00020000-56a7-848a-ad59-0c46d1c37a61	00030000-56a7-8487-b157-4bb5921eb846
00020000-56a7-848a-00d4-325d8e75f183	00030000-56a7-8487-e4a2-ae622446e37e
00020000-56a7-848a-1bc7-fec04d7b6b8c	00030000-56a7-8487-c5c3-c8960ee28877
00020000-56a7-848a-8f93-8805bfb12cb2	00030000-56a7-8487-f308-f94f7c573525
00020000-56a7-848a-9ca6-f935f3a08a34	00030000-56a7-8487-b270-a52a9b83907f
00020000-56a7-848a-100a-3dd242b49078	00030000-56a7-8487-923b-4fefc6f780ab
00020000-56a7-848a-6e2d-42e9440112bc	00030000-56a7-8487-703f-920120a9ea9c
00020000-56a7-848a-61b0-32b1192b53e8	00030000-56a7-8487-3357-701d1691cdfe
00020000-56a7-848a-172d-f04395441f48	00030000-56a7-8487-c6be-5713a6dffcb7
00020000-56a7-848a-d4ad-4884d3fd5f39	00030000-56a7-8487-8536-fbff92fd8b7b
00020000-56a7-848a-84f4-61638134b6eb	00030000-56a7-8487-6677-0734bfa72526
00020000-56a7-848a-97e8-9718b2003cad	00030000-56a7-8487-6a2c-0705e1ea3141
00020000-56a7-848a-23f4-768b1fa2cc1d	00030000-56a7-8487-0c23-d96c9427f48c
00020000-56a7-848a-31ac-9d63079b8684	00030000-56a7-8487-8e6a-796fe65a20f6
00020000-56a7-848a-31ac-9d63079b8684	00030000-56a7-8487-113b-8c63d52712eb
00020000-56a7-848a-31ac-9d63079b8684	00030000-56a7-8487-2086-9483bcf0a8a9
00020000-56a7-848a-b0f5-c8a93d891b5f	00030000-56a7-8487-2561-83984adecec9
00020000-56a7-848a-3e33-b2aeeed72b94	00030000-56a7-8487-f28a-7756a2a4e692
00020000-56a7-848a-8aa9-0ff39af0c81d	00030000-56a7-8487-9423-8296a87fef8b
00020000-56a7-848a-a839-4821a7f9a492	00030000-56a7-8487-63f1-efa93370ad1d
00020000-56a7-848a-0c91-83d5d3fc7360	00030000-56a7-8487-0403-7a226f821db9
00020000-56a7-848a-c3c0-81778ce7b18b	00030000-56a7-8487-b09d-88e57b4f3c80
00020000-56a7-848a-a1cc-8796affdf666	00030000-56a7-8487-cffe-05c6b713d1b0
00020000-56a7-848a-7806-8da465a1098a	00030000-56a7-8487-96d5-330604dda564
00020000-56a7-848a-a2bf-cdee30183e40	00030000-56a7-8487-e2e8-310a273262c0
00020000-56a7-848a-6a4e-3ab1c656aad5	00030000-56a7-8487-2542-f2a1aeee4c5a
00020000-56a7-848a-07d7-6a9c86b19b84	00030000-56a7-8487-180a-cc702a61425b
00020000-56a7-848a-cd47-004b3354deb5	00030000-56a7-8487-0301-f0f680de3ce3
00020000-56a7-848a-545f-d1fcb1f9e4d6	00030000-56a7-8487-4d11-2bb8169fab12
00020000-56a7-848a-d8d8-a0fb808bc1a2	00030000-56a7-8487-0b1d-487e376827e9
00020000-56a7-848a-0add-db30294a5a28	00030000-56a7-8487-2f84-ab645cf58172
00020000-56a7-848a-7546-008e630bb018	00030000-56a7-8487-608f-7ee50c65147f
00020000-56a7-848a-2d52-bedb91381376	00030000-56a7-8487-04e1-bf11e86e9db0
00020000-56a7-848a-63a2-23f3c0be5f8d	00030000-56a7-8487-76df-08f03cbe0e1f
00020000-56a7-848a-47e8-bfeba7f62c0a	00030000-56a7-8487-a6f7-9b455e8d154b
\.


--
-- TOC entry 3181 (class 0 OID 40489401)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 40489436)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 40489569)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a7-848a-cf8b-91815d770817	00090000-56a7-848a-4182-f91fda1470dc	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a7-848a-7623-bfed6ec9211c	00090000-56a7-848a-2070-4ba7cb5af0db	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a7-848a-2bb8-0c8b4b611540	00090000-56a7-848a-5acb-7428a4429dbb	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a7-848a-3aa7-b231c495caf4	00090000-56a7-848a-8480-fb6a80dba440	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 40489086)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a7-848a-5df5-cae2c08c0fda	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-848a-bf98-f49608c9b41f	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a7-848a-6c43-21a5732772e4	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-848a-7712-a27f17842510	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-848a-c07b-d46c5e400cbd	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-848a-5596-d71f047a8729	\N	00040000-56a7-8486-af68-2bf173f29b1f	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-848a-e80f-b2e0702fadac	\N	00040000-56a7-8486-6590-4e65d85ecd06	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-848a-dd9c-2456c27aed2a	\N	00040000-56a7-8486-ec74-1e633d648056	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-848a-cfc7-a263090dc488	\N	00040000-56a7-8486-8ad8-a18945273b50	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a7-848c-08ac-87c334ee47b6	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 40489131)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a7-8486-c2cd-2d4c47ce2ee8	8341	Adlešiči
00050000-56a7-8486-7381-ee692fab4634	5270	Ajdovščina
00050000-56a7-8486-6cf1-42dde76e8b23	6280	Ankaran/Ancarano
00050000-56a7-8486-79cc-319e02be27f5	9253	Apače
00050000-56a7-8486-59ac-925837b5298c	8253	Artiče
00050000-56a7-8486-bf65-f57246d18435	4275	Begunje na Gorenjskem
00050000-56a7-8486-3891-c11f75058101	1382	Begunje pri Cerknici
00050000-56a7-8486-1a9b-5a649e4382a1	9231	Beltinci
00050000-56a7-8486-ea56-7b77b891202b	2234	Benedikt
00050000-56a7-8486-9c60-f7fc3f828aae	2345	Bistrica ob Dravi
00050000-56a7-8486-8350-1857edaac45e	3256	Bistrica ob Sotli
00050000-56a7-8486-3e1e-fddb26af4ed3	8259	Bizeljsko
00050000-56a7-8486-8c47-437a99aa6dd4	1223	Blagovica
00050000-56a7-8486-40c6-d23c0151dfda	8283	Blanca
00050000-56a7-8486-d8ae-741a8bc1fe42	4260	Bled
00050000-56a7-8486-0734-5bd218a957d7	4273	Blejska Dobrava
00050000-56a7-8486-93de-ae06988a3a48	9265	Bodonci
00050000-56a7-8486-305e-ef4276e308ae	9222	Bogojina
00050000-56a7-8486-9d32-60324b426c50	4263	Bohinjska Bela
00050000-56a7-8486-8ad5-bfe2b45c86cc	4264	Bohinjska Bistrica
00050000-56a7-8486-11b2-62712df872f5	4265	Bohinjsko jezero
00050000-56a7-8486-a8cc-49fa5735a845	1353	Borovnica
00050000-56a7-8486-7d3e-f95376672681	8294	Boštanj
00050000-56a7-8486-5d5e-d5b1e650a499	5230	Bovec
00050000-56a7-8486-c2f9-95767906f126	5295	Branik
00050000-56a7-8486-7de4-08fef9ffa02a	3314	Braslovče
00050000-56a7-8486-00f5-881496591a18	5223	Breginj
00050000-56a7-8486-2f6b-cfd8652930e0	8280	Brestanica
00050000-56a7-8486-5e7a-379063bf6e3a	2354	Bresternica
00050000-56a7-8486-5851-cc1d8ec2d6d5	4243	Brezje
00050000-56a7-8486-b1f8-7c6d406278d8	1351	Brezovica pri Ljubljani
00050000-56a7-8486-82ff-97727ba064b8	8250	Brežice
00050000-56a7-8486-13ee-efe1f040e101	4210	Brnik - Aerodrom
00050000-56a7-8486-cf33-19a4085773fe	8321	Brusnice
00050000-56a7-8486-bfa6-7aa2d73f7f06	3255	Buče
00050000-56a7-8486-0f1c-56d6a646a0ea	8276	Bučka 
00050000-56a7-8486-ba60-d6eb717bfdeb	9261	Cankova
00050000-56a7-8486-dfe5-c41d129fa134	3000	Celje 
00050000-56a7-8486-bc49-bb5a601da0a9	3001	Celje - poštni predali
00050000-56a7-8486-f417-13032b7c279d	4207	Cerklje na Gorenjskem
00050000-56a7-8486-d723-d47b0636fc37	8263	Cerklje ob Krki
00050000-56a7-8486-1abf-9e64c0ef5ba2	1380	Cerknica
00050000-56a7-8486-efec-eee0b650cc3b	5282	Cerkno
00050000-56a7-8486-3166-10e150acc412	2236	Cerkvenjak
00050000-56a7-8486-c0b9-1aeeb6d1d009	2215	Ceršak
00050000-56a7-8486-42e3-9eefe5586172	2326	Cirkovce
00050000-56a7-8486-5593-d3dc8fcdfc5b	2282	Cirkulane
00050000-56a7-8486-4798-3a3e5088a8cd	5273	Col
00050000-56a7-8486-6a08-07c1539ed46b	8251	Čatež ob Savi
00050000-56a7-8486-6ce0-f374d358e398	1413	Čemšenik
00050000-56a7-8486-3b3b-21462e376042	5253	Čepovan
00050000-56a7-8486-7945-630da7d83c39	9232	Črenšovci
00050000-56a7-8486-c83b-82e8a05cc616	2393	Črna na Koroškem
00050000-56a7-8486-bc32-99fc5cd2a948	6275	Črni Kal
00050000-56a7-8486-9d10-1da062212423	5274	Črni Vrh nad Idrijo
00050000-56a7-8486-3ad3-808ade20d21c	5262	Črniče
00050000-56a7-8486-de53-e9625556b504	8340	Črnomelj
00050000-56a7-8486-0ffa-9a468ecea534	6271	Dekani
00050000-56a7-8486-bbe4-95621285fd57	5210	Deskle
00050000-56a7-8486-8039-a0c5234e6cb5	2253	Destrnik
00050000-56a7-8486-eeec-21c9be1263e0	6215	Divača
00050000-56a7-8486-d932-e0b06700b6d3	1233	Dob
00050000-56a7-8486-fa8c-103379d0a590	3224	Dobje pri Planini
00050000-56a7-8486-a32f-7e89af710000	8257	Dobova
00050000-56a7-8486-1b5d-c304739e4f91	1423	Dobovec
00050000-56a7-8486-3116-3ac3e221e5fa	5263	Dobravlje
00050000-56a7-8486-66c5-617ddd7c3c60	3204	Dobrna
00050000-56a7-8486-a097-ce9b0ace2d84	8211	Dobrnič
00050000-56a7-8486-7351-52153b098b67	1356	Dobrova
00050000-56a7-8486-3f3f-e21898619f35	9223	Dobrovnik/Dobronak 
00050000-56a7-8486-a7d8-dbb74daac5c8	5212	Dobrovo v Brdih
00050000-56a7-8486-c32e-7f0f87cab7eb	1431	Dol pri Hrastniku
00050000-56a7-8486-9a85-d0d1a300528b	1262	Dol pri Ljubljani
00050000-56a7-8486-6afd-162a416efa10	1273	Dole pri Litiji
00050000-56a7-8486-20b8-372239e19c2e	1331	Dolenja vas
00050000-56a7-8486-9e94-adbdccaf7b3f	8350	Dolenjske Toplice
00050000-56a7-8486-30aa-58a8587db4a9	1230	Domžale
00050000-56a7-8486-5124-2bdbbb1078af	2252	Dornava
00050000-56a7-8486-b87a-bf2a4f7bc1bc	5294	Dornberk
00050000-56a7-8486-1fc2-5a5f25ec7e8c	1319	Draga
00050000-56a7-8486-eee7-375f65e26150	8343	Dragatuš
00050000-56a7-8486-7fbf-de8916116686	3222	Dramlje
00050000-56a7-8486-1f3b-f8b6fda84c0c	2370	Dravograd
00050000-56a7-8486-5dbe-fa93a792b953	4203	Duplje
00050000-56a7-8486-898c-c5f0f26621a7	6221	Dutovlje
00050000-56a7-8486-5835-6a41c0c847f7	8361	Dvor
00050000-56a7-8486-3238-7aa763610e6e	2343	Fala
00050000-56a7-8486-98fe-e69eca08b1ca	9208	Fokovci
00050000-56a7-8486-8444-c75bf52e44fa	2313	Fram
00050000-56a7-8486-edf1-84aaf230d392	3213	Frankolovo
00050000-56a7-8486-2fe9-16be05961100	1274	Gabrovka
00050000-56a7-8486-3970-bde23ee267b4	8254	Globoko
00050000-56a7-8486-bf4c-cbe747f193ac	5275	Godovič
00050000-56a7-8486-9de5-8d58daf34116	4204	Golnik
00050000-56a7-8486-da3d-eca8a5f7555e	3303	Gomilsko
00050000-56a7-8486-25c3-4ede36403c1a	4224	Gorenja vas
00050000-56a7-8486-1266-1c464c1660c3	3263	Gorica pri Slivnici
00050000-56a7-8486-52b8-0410d79c1e5d	2272	Gorišnica
00050000-56a7-8486-1160-5076db4b1c51	9250	Gornja Radgona
00050000-56a7-8486-79e2-e17277bed82e	3342	Gornji Grad
00050000-56a7-8486-b4e2-e99e13e79304	4282	Gozd Martuljek
00050000-56a7-8486-ba98-d6bfa64dd3a2	6272	Gračišče
00050000-56a7-8486-ef8b-bebf315555b5	9264	Grad
00050000-56a7-8486-a888-314a8a8cc15b	8332	Gradac
00050000-56a7-8486-953c-71a81d7fa70e	1384	Grahovo
00050000-56a7-8486-6800-6996d132d5d6	5242	Grahovo ob Bači
00050000-56a7-8486-5303-ae72037293e1	5251	Grgar
00050000-56a7-8486-47e6-adaaa448b61d	3302	Griže
00050000-56a7-8486-0aae-061676a6eb65	3231	Grobelno
00050000-56a7-8486-4ffa-94ee60b8b8b0	1290	Grosuplje
00050000-56a7-8486-b4a7-0af671610bfa	2288	Hajdina
00050000-56a7-8486-f25f-d5e728e8ad9d	8362	Hinje
00050000-56a7-8486-b53c-724d4363964b	2311	Hoče
00050000-56a7-8486-5973-d40da81ad896	9205	Hodoš/Hodos
00050000-56a7-8486-61bb-d8ef1872588f	1354	Horjul
00050000-56a7-8486-f45b-bc385a728bb6	1372	Hotedršica
00050000-56a7-8486-2cd0-a0535bda938b	1430	Hrastnik
00050000-56a7-8486-4f89-b34f37cfbf7d	6225	Hruševje
00050000-56a7-8486-be31-37767d9f0473	4276	Hrušica
00050000-56a7-8486-430e-2dfecde68132	5280	Idrija
00050000-56a7-8486-9d95-1391664d3d19	1292	Ig
00050000-56a7-8486-71f1-90210d1359cc	6250	Ilirska Bistrica
00050000-56a7-8486-cc38-e4af9ad25e06	6251	Ilirska Bistrica-Trnovo
00050000-56a7-8486-fe46-f65bbc3b5936	1295	Ivančna Gorica
00050000-56a7-8486-a5b4-32f85b47daee	2259	Ivanjkovci
00050000-56a7-8486-fbdd-4e577cbc5845	1411	Izlake
00050000-56a7-8486-f25c-0ee51a34bd40	6310	Izola/Isola
00050000-56a7-8486-617a-9f0ed2f99074	2222	Jakobski Dol
00050000-56a7-8486-28e4-4558f4119fdc	2221	Jarenina
00050000-56a7-8486-c00d-41491ebedf88	6254	Jelšane
00050000-56a7-8486-7ab3-bbda537e50ef	4270	Jesenice
00050000-56a7-8486-9080-f08f5978b825	8261	Jesenice na Dolenjskem
00050000-56a7-8486-66d4-8c317cfaea01	3273	Jurklošter
00050000-56a7-8486-3aa0-54c95676dec5	2223	Jurovski Dol
00050000-56a7-8486-9ba9-a440664ed543	2256	Juršinci
00050000-56a7-8486-3d4f-442015da48c5	5214	Kal nad Kanalom
00050000-56a7-8486-0b07-ec1e756a0129	3233	Kalobje
00050000-56a7-8486-9518-04d2c39af12f	4246	Kamna Gorica
00050000-56a7-8486-e49f-f1829618c174	2351	Kamnica
00050000-56a7-8486-2633-6f6c3df1a899	1241	Kamnik
00050000-56a7-8486-a068-327db0cc30f1	5213	Kanal
00050000-56a7-8486-c1e8-18ff9848dbb7	8258	Kapele
00050000-56a7-8486-8715-c437a5e041cb	2362	Kapla
00050000-56a7-8486-8d85-e6a53d2e0fa8	2325	Kidričevo
00050000-56a7-8486-2376-09fb0184b7d0	1412	Kisovec
00050000-56a7-8486-8ec0-f4d68147ee64	6253	Knežak
00050000-56a7-8486-9a66-d12ba83ed6ca	5222	Kobarid
00050000-56a7-8486-0ae9-b3eaedd43112	9227	Kobilje
00050000-56a7-8486-04cb-3af18f36eae8	1330	Kočevje
00050000-56a7-8486-4d72-cc33e363767e	1338	Kočevska Reka
00050000-56a7-8486-ac16-a5d6029d46be	2276	Kog
00050000-56a7-8486-3989-a04989008111	5211	Kojsko
00050000-56a7-8486-bb54-fe2850e287a3	6223	Komen
00050000-56a7-8486-02bb-083e89a99c82	1218	Komenda
00050000-56a7-8486-cd4e-621c01a22f4b	6000	Koper/Capodistria 
00050000-56a7-8486-9c26-5a82d8275760	6001	Koper/Capodistria - poštni predali
00050000-56a7-8486-e86b-2dcfc902444f	8282	Koprivnica
00050000-56a7-8486-d818-b728dc1f4132	5296	Kostanjevica na Krasu
00050000-56a7-8486-e4f4-91b157cd7260	8311	Kostanjevica na Krki
00050000-56a7-8486-b837-e8fa82eb0fdc	1336	Kostel
00050000-56a7-8486-61b1-98716bf8e592	6256	Košana
00050000-56a7-8486-306e-24a923f786e2	2394	Kotlje
00050000-56a7-8486-a21c-585ad346c6c1	6240	Kozina
00050000-56a7-8486-a9f6-9d7c41d33d35	3260	Kozje
00050000-56a7-8486-d68c-8e590772d3b1	4000	Kranj 
00050000-56a7-8486-3802-69bb924f7acc	4001	Kranj - poštni predali
00050000-56a7-8486-36dc-45977483868d	4280	Kranjska Gora
00050000-56a7-8486-8b2e-3826e40322b8	1281	Kresnice
00050000-56a7-8486-4b69-11039c312f19	4294	Križe
00050000-56a7-8486-7c91-5ea16e55d863	9206	Križevci
00050000-56a7-8486-261d-3e52ad2a2198	9242	Križevci pri Ljutomeru
00050000-56a7-8486-51e4-b3a0aab54778	1301	Krka
00050000-56a7-8486-3f2c-2f30ff37ff7f	8296	Krmelj
00050000-56a7-8486-46ee-d815d1916025	4245	Kropa
00050000-56a7-8486-c861-268489e84eab	8262	Krška vas
00050000-56a7-8486-8e39-adfdc8cadd00	8270	Krško
00050000-56a7-8486-7a59-3488f23edfff	9263	Kuzma
00050000-56a7-8486-b533-4eadbb60ddb5	2318	Laporje
00050000-56a7-8486-c5b6-2cb28b771572	3270	Laško
00050000-56a7-8486-d617-b725bf461c5a	1219	Laze v Tuhinju
00050000-56a7-8486-127c-b27fdb116f56	2230	Lenart v Slovenskih goricah
00050000-56a7-8486-ae2a-aa4cbf1072e5	9220	Lendava/Lendva
00050000-56a7-8486-67db-3833f2382d93	4248	Lesce
00050000-56a7-8486-30f3-2e8e509b8640	3261	Lesično
00050000-56a7-8486-ee46-cefa00e9a99a	8273	Leskovec pri Krškem
00050000-56a7-8486-51b4-3468bc305898	2372	Libeliče
00050000-56a7-8486-45e2-96870796c0fc	2341	Limbuš
00050000-56a7-8486-d764-8472da81e9f9	1270	Litija
00050000-56a7-8486-b082-cc5837325c50	3202	Ljubečna
00050000-56a7-8486-62ab-f057e6c555a4	1000	Ljubljana 
00050000-56a7-8486-9a4a-e37961fa4152	1001	Ljubljana - poštni predali
00050000-56a7-8486-9b21-41106663d8f1	1231	Ljubljana - Črnuče
00050000-56a7-8486-531b-152984291141	1261	Ljubljana - Dobrunje
00050000-56a7-8486-0cfa-8f8ec0cc2a79	1260	Ljubljana - Polje
00050000-56a7-8486-9dc5-fbf060a611a4	1210	Ljubljana - Šentvid
00050000-56a7-8486-dab8-a27572e58a2a	1211	Ljubljana - Šmartno
00050000-56a7-8486-7ea2-1b859612a055	3333	Ljubno ob Savinji
00050000-56a7-8486-b526-bcacf510c727	9240	Ljutomer
00050000-56a7-8486-85d8-6a56730e84fb	3215	Loče
00050000-56a7-8486-1c20-e345fd1734af	5231	Log pod Mangartom
00050000-56a7-8486-eede-715fb11667c3	1358	Log pri Brezovici
00050000-56a7-8486-36d7-c8882cb13796	1370	Logatec
00050000-56a7-8486-5a76-729625df3686	1371	Logatec
00050000-56a7-8486-482c-33418a3e2450	1434	Loka pri Zidanem Mostu
00050000-56a7-8486-9636-1f4a391d6b37	3223	Loka pri Žusmu
00050000-56a7-8486-e3b2-57b28b8a0e62	6219	Lokev
00050000-56a7-8486-145d-fbe32d7d902f	1318	Loški Potok
00050000-56a7-8486-6b58-19b566e74831	2324	Lovrenc na Dravskem polju
00050000-56a7-8486-aa1b-a12f0f7909af	2344	Lovrenc na Pohorju
00050000-56a7-8486-c3b4-bb63b6bb8c21	3334	Luče
00050000-56a7-8486-c32b-c5bc64b70b08	1225	Lukovica
00050000-56a7-8486-dcca-26f11250e837	9202	Mačkovci
00050000-56a7-8486-460d-5e12fe90ec0f	2322	Majšperk
00050000-56a7-8486-514c-62f4ad624905	2321	Makole
00050000-56a7-8486-7e59-829bb3df2d42	9243	Mala Nedelja
00050000-56a7-8486-4887-485a949d206e	2229	Malečnik
00050000-56a7-8486-3554-decc4d7ed247	6273	Marezige
00050000-56a7-8486-c430-7a3eedb7b399	2000	Maribor 
00050000-56a7-8486-65d0-de1efde0629f	2001	Maribor - poštni predali
00050000-56a7-8486-2db1-6bc4c9793ae3	2206	Marjeta na Dravskem polju
00050000-56a7-8486-fef1-804d0e7b6daa	2281	Markovci
00050000-56a7-8486-a180-1e21dca4875c	9221	Martjanci
00050000-56a7-8486-26fb-d9c4e156bc9c	6242	Materija
00050000-56a7-8486-cd11-f035cb00ba56	4211	Mavčiče
00050000-56a7-8486-f56b-1e5a6c80e185	1215	Medvode
00050000-56a7-8486-8a78-124198b4f1c4	1234	Mengeš
00050000-56a7-8486-1480-985526a42a91	8330	Metlika
00050000-56a7-8486-e974-7b3d5972e014	2392	Mežica
00050000-56a7-8486-ccb4-c749552f9004	2204	Miklavž na Dravskem polju
00050000-56a7-8486-b83f-02a2dd66ca10	2275	Miklavž pri Ormožu
00050000-56a7-8486-3db3-ffdc0ad62cda	5291	Miren
00050000-56a7-8486-d922-9547fcd49389	8233	Mirna
00050000-56a7-8486-9782-0c7ebd44e510	8216	Mirna Peč
00050000-56a7-8486-2789-54b0c2cfbb63	2382	Mislinja
00050000-56a7-8486-a11a-143e8ee23a66	4281	Mojstrana
00050000-56a7-8486-71a1-51bcb449f66b	8230	Mokronog
00050000-56a7-8486-3682-1079cfa2ae4a	1251	Moravče
00050000-56a7-8486-505f-8fc05f38b1d7	9226	Moravske Toplice
00050000-56a7-8486-f544-debb5f5efcb2	5216	Most na Soči
00050000-56a7-8486-44c3-26fe77026a20	1221	Motnik
00050000-56a7-8486-5583-d7471751ff6e	3330	Mozirje
00050000-56a7-8486-0c5f-721a5c19d8e5	9000	Murska Sobota 
00050000-56a7-8486-95fa-992ca464e19b	9001	Murska Sobota - poštni predali
00050000-56a7-8486-7284-0052ef1f3567	2366	Muta
00050000-56a7-8486-58a9-c1cf21cc2a82	4202	Naklo
00050000-56a7-8486-cf72-3e9da6a7c0a1	3331	Nazarje
00050000-56a7-8486-5aa2-1d829241fc08	1357	Notranje Gorice
00050000-56a7-8486-2f91-05f073682f20	3203	Nova Cerkev
00050000-56a7-8486-67ba-49f0efd89af2	5000	Nova Gorica 
00050000-56a7-8486-728c-158b1669e161	5001	Nova Gorica - poštni predali
00050000-56a7-8486-db9e-570f443d4ad5	1385	Nova vas
00050000-56a7-8486-d1fd-3bf66d93c897	8000	Novo mesto
00050000-56a7-8486-f130-a54cb5c62358	8001	Novo mesto - poštni predali
00050000-56a7-8486-ea29-bac9e88c9113	6243	Obrov
00050000-56a7-8486-2a20-9450d221ac6b	9233	Odranci
00050000-56a7-8486-aaf0-77899db42198	2317	Oplotnica
00050000-56a7-8486-2bcc-4c0cb944ea3c	2312	Orehova vas
00050000-56a7-8486-d604-b80b0be2d8d0	2270	Ormož
00050000-56a7-8486-cabc-f65e8edea782	1316	Ortnek
00050000-56a7-8486-f7df-bea5cdb7ee37	1337	Osilnica
00050000-56a7-8486-fc94-350317a244c6	8222	Otočec
00050000-56a7-8486-368b-308a2f5cc9a5	2361	Ožbalt
00050000-56a7-8486-f5d6-9f50a38e07a9	2231	Pernica
00050000-56a7-8486-338f-1ff0396f751d	2211	Pesnica pri Mariboru
00050000-56a7-8486-9964-563f5198bf2d	9203	Petrovci
00050000-56a7-8486-2250-e001c1c48823	3301	Petrovče
00050000-56a7-8486-1020-edf7340f3fbc	6330	Piran/Pirano
00050000-56a7-8486-5d35-9f5c2d109cfe	8255	Pišece
00050000-56a7-8486-84fc-5db284a0cdb9	6257	Pivka
00050000-56a7-8486-42fc-51151d748bbb	6232	Planina
00050000-56a7-8486-5b33-cf34b1829f11	3225	Planina pri Sevnici
00050000-56a7-8486-8929-e5a2ec301f04	6276	Pobegi
00050000-56a7-8486-b99a-d4917ca274a8	8312	Podbočje
00050000-56a7-8486-e448-5d231c1fe468	5243	Podbrdo
00050000-56a7-8486-615d-07141b3ccd6d	3254	Podčetrtek
00050000-56a7-8486-8132-cc1b04291d78	2273	Podgorci
00050000-56a7-8486-b046-f92cb368dc48	6216	Podgorje
00050000-56a7-8486-5c11-600f9fc48b3a	2381	Podgorje pri Slovenj Gradcu
00050000-56a7-8486-7998-8b280be71e96	6244	Podgrad
00050000-56a7-8486-be07-bc381c208b3d	1414	Podkum
00050000-56a7-8486-ea81-94e96c921c14	2286	Podlehnik
00050000-56a7-8486-9292-44fecbbb302c	5272	Podnanos
00050000-56a7-8486-134f-70982bb23709	4244	Podnart
00050000-56a7-8486-40a4-34d277903eef	3241	Podplat
00050000-56a7-8486-3b0e-b4a90c11cef9	3257	Podsreda
00050000-56a7-8486-f9d5-06d89f3188dc	2363	Podvelka
00050000-56a7-8486-bc34-29f70db21342	2208	Pohorje
00050000-56a7-8486-c486-c8d18698fb00	2257	Polenšak
00050000-56a7-8486-6af2-78d0318e1ec7	1355	Polhov Gradec
00050000-56a7-8486-a777-86b0777471bb	4223	Poljane nad Škofjo Loko
00050000-56a7-8486-582a-332c7b4362e9	2319	Poljčane
00050000-56a7-8486-de56-9ca2cdd4ac79	1272	Polšnik
00050000-56a7-8486-07c2-69d476daad49	3313	Polzela
00050000-56a7-8486-e5a3-d91469314f96	3232	Ponikva
00050000-56a7-8486-c3f3-5a31b01825b4	6320	Portorož/Portorose
00050000-56a7-8486-9f20-dfe6e974b6d2	6230	Postojna
00050000-56a7-8486-1ebc-77c38861186d	2331	Pragersko
00050000-56a7-8486-251c-22692c54521c	3312	Prebold
00050000-56a7-8486-6669-cefc1f56e2d4	4205	Preddvor
00050000-56a7-8486-f345-b3eccdb5a981	6255	Prem
00050000-56a7-8486-8228-aebcc58bee5e	1352	Preserje
00050000-56a7-8486-4387-a3de8891d2e6	6258	Prestranek
00050000-56a7-8486-2f6e-12007f28424c	2391	Prevalje
00050000-56a7-8486-d352-935662ce2147	3262	Prevorje
00050000-56a7-8486-47b3-e99f4dedf0fa	1276	Primskovo 
00050000-56a7-8486-fbc5-3796559c025e	3253	Pristava pri Mestinju
00050000-56a7-8486-a1d3-6524dda1a825	9207	Prosenjakovci/Partosfalva
00050000-56a7-8486-4dbf-d2b6712f8226	5297	Prvačina
00050000-56a7-8486-587f-31a6b2147e46	2250	Ptuj
00050000-56a7-8486-4bc3-cc152f95ba33	2323	Ptujska Gora
00050000-56a7-8486-2d0e-d06c2dc23ad3	9201	Puconci
00050000-56a7-8486-3fa7-f66cb2d1365f	2327	Rače
00050000-56a7-8486-ad94-8b517d35aee9	1433	Radeče
00050000-56a7-8486-c2b1-abdf9945ee80	9252	Radenci
00050000-56a7-8486-94cb-f06279d65fff	2360	Radlje ob Dravi
00050000-56a7-8486-ec52-fb5c948413dd	1235	Radomlje
00050000-56a7-8486-cd59-55105af777b8	4240	Radovljica
00050000-56a7-8486-d831-41b4da993293	8274	Raka
00050000-56a7-8486-68c3-49de3435029e	1381	Rakek
00050000-56a7-8486-23b5-30729209d689	4283	Rateče - Planica
00050000-56a7-8486-f90f-d073338cbec9	2390	Ravne na Koroškem
00050000-56a7-8486-86dc-15af23e14db4	9246	Razkrižje
00050000-56a7-8486-345e-eb481f1c110e	3332	Rečica ob Savinji
00050000-56a7-8486-597f-c77ad34ea9c5	5292	Renče
00050000-56a7-8486-1920-cbf7359d2a40	1310	Ribnica
00050000-56a7-8486-682d-2b53fd91d698	2364	Ribnica na Pohorju
00050000-56a7-8486-80ce-1e95b6c2147b	3272	Rimske Toplice
00050000-56a7-8486-44df-fc4f314f240e	1314	Rob
00050000-56a7-8486-9e44-022aa85b925e	5215	Ročinj
00050000-56a7-8486-ea7a-dd520737b9de	3250	Rogaška Slatina
00050000-56a7-8486-eb52-9e02ea0f96bf	9262	Rogašovci
00050000-56a7-8486-7331-47ff6ca12d41	3252	Rogatec
00050000-56a7-8486-6e31-950d1a03ee2b	1373	Rovte
00050000-56a7-8486-508d-608143bf87de	2342	Ruše
00050000-56a7-8486-bf89-56ede1eb77fa	1282	Sava
00050000-56a7-8486-9ef3-0b70c6771f6e	6333	Sečovlje/Sicciole
00050000-56a7-8486-90a3-e532a05e459d	4227	Selca
00050000-56a7-8486-7c9a-b67f1161a7ee	2352	Selnica ob Dravi
00050000-56a7-8486-637a-c5eacd41dbbd	8333	Semič
00050000-56a7-8486-2ac5-4f0fe481df8a	8281	Senovo
00050000-56a7-8486-ff82-1969a6e624a9	6224	Senožeče
00050000-56a7-8486-ca1c-1a8dd294cf01	8290	Sevnica
00050000-56a7-8486-754e-921ff2c5f044	6210	Sežana
00050000-56a7-8486-4c32-471792a895f6	2214	Sladki Vrh
00050000-56a7-8486-0cec-935ffbc18d16	5283	Slap ob Idrijci
00050000-56a7-8486-95a0-7f469bc5eaa5	2380	Slovenj Gradec
00050000-56a7-8486-ee6a-9300318fd1d6	2310	Slovenska Bistrica
00050000-56a7-8486-6c65-ac76c62b984b	3210	Slovenske Konjice
00050000-56a7-8486-43e4-79118f557800	1216	Smlednik
00050000-56a7-8486-98f1-31f2e457c469	5232	Soča
00050000-56a7-8486-8685-0101cb312d09	1317	Sodražica
00050000-56a7-8486-2710-e5e8faf83f33	3335	Solčava
00050000-56a7-8486-6976-bfc5308f7f2d	5250	Solkan
00050000-56a7-8486-80ac-78a556167f8e	4229	Sorica
00050000-56a7-8486-cf73-27145f869d4d	4225	Sovodenj
00050000-56a7-8486-eed5-d47cd860cec4	5281	Spodnja Idrija
00050000-56a7-8486-f5bc-d13c57e103fb	2241	Spodnji Duplek
00050000-56a7-8486-28e5-f55718692c3f	9245	Spodnji Ivanjci
00050000-56a7-8486-1dff-76c33b9662d0	2277	Središče ob Dravi
00050000-56a7-8486-f87b-62b4d9f83feb	4267	Srednja vas v Bohinju
00050000-56a7-8486-84a3-71db1ba627c1	8256	Sromlje 
00050000-56a7-8486-8915-3855e8df32b3	5224	Srpenica
00050000-56a7-8486-fee3-9c03cca55944	1242	Stahovica
00050000-56a7-8486-f21f-45373cb066a4	1332	Stara Cerkev
00050000-56a7-8486-12cd-edf5c00d032f	8342	Stari trg ob Kolpi
00050000-56a7-8486-0c76-fb67567b5bf4	1386	Stari trg pri Ložu
00050000-56a7-8486-6210-db175d3418c0	2205	Starše
00050000-56a7-8486-87d4-a4d0f3567562	2289	Stoperce
00050000-56a7-8486-5c1d-b998f5087bfb	8322	Stopiče
00050000-56a7-8486-e837-39b1c2ee0318	3206	Stranice
00050000-56a7-8486-bc46-521190241781	8351	Straža
00050000-56a7-8486-2d76-688570ff3c98	1313	Struge
00050000-56a7-8486-9c8b-5351de854662	8293	Studenec
00050000-56a7-8486-e5d5-907546df8ff3	8331	Suhor
00050000-56a7-8486-759c-1901f5b83ec1	2233	Sv. Ana v Slovenskih goricah
00050000-56a7-8486-769b-f13703fe2ada	2235	Sv. Trojica v Slovenskih goricah
00050000-56a7-8486-adcf-ebf4d8e01391	2353	Sveti Duh na Ostrem Vrhu
00050000-56a7-8486-13a4-2e948d7471e5	9244	Sveti Jurij ob Ščavnici
00050000-56a7-8486-373e-feb2544b8dba	3264	Sveti Štefan
00050000-56a7-8486-b9f6-b40736d134ac	2258	Sveti Tomaž
00050000-56a7-8486-059a-2b5c3eeefaa1	9204	Šalovci
00050000-56a7-8486-7dbd-5872ef5b2306	5261	Šempas
00050000-56a7-8486-86c8-8c1d4a84ae59	5290	Šempeter pri Gorici
00050000-56a7-8486-f4c1-e1d2470d14af	3311	Šempeter v Savinjski dolini
00050000-56a7-8486-0076-a1644cbf566c	4208	Šenčur
00050000-56a7-8486-1627-e5ccf9a494e2	2212	Šentilj v Slovenskih goricah
00050000-56a7-8486-9912-4a58018a3856	8297	Šentjanž
00050000-56a7-8486-5bf1-7250b26769ea	2373	Šentjanž pri Dravogradu
00050000-56a7-8486-59b2-985b719c1716	8310	Šentjernej
00050000-56a7-8486-ff49-605737d2fe1d	3230	Šentjur
00050000-56a7-8486-da18-8256b3c8d542	3271	Šentrupert
00050000-56a7-8486-7df3-b7df11116280	8232	Šentrupert
00050000-56a7-8486-2fd2-dae6fd5f3629	1296	Šentvid pri Stični
00050000-56a7-8486-cf42-c7938da7607f	8275	Škocjan
00050000-56a7-8486-f2b1-90c57494dcff	6281	Škofije
00050000-56a7-8486-a7da-6a80c662a230	4220	Škofja Loka
00050000-56a7-8486-2493-7790542d2503	3211	Škofja vas
00050000-56a7-8486-08ec-09e8764d4036	1291	Škofljica
00050000-56a7-8486-9de8-534998982026	6274	Šmarje
00050000-56a7-8486-9709-a1d6f74b19f2	1293	Šmarje - Sap
00050000-56a7-8486-9e40-828ad7746666	3240	Šmarje pri Jelšah
00050000-56a7-8486-91ed-c4bef6910d12	8220	Šmarješke Toplice
00050000-56a7-8486-1108-29c3710f1f54	2315	Šmartno na Pohorju
00050000-56a7-8486-2cf2-1e5bf6006dfa	3341	Šmartno ob Dreti
00050000-56a7-8486-bec0-8762e5c1c113	3327	Šmartno ob Paki
00050000-56a7-8486-69fc-e409fabbabc2	1275	Šmartno pri Litiji
00050000-56a7-8486-25c6-2096c0723060	2383	Šmartno pri Slovenj Gradcu
00050000-56a7-8486-623a-6ce2a4b24cfd	3201	Šmartno v Rožni dolini
00050000-56a7-8486-05f5-42a476ba894c	3325	Šoštanj
00050000-56a7-8486-314c-7aa48b9994e1	6222	Štanjel
00050000-56a7-8486-fd06-66d957206d88	3220	Štore
00050000-56a7-8486-a3d6-06fb457d9bed	3304	Tabor
00050000-56a7-8486-c1e1-70579072632a	3221	Teharje
00050000-56a7-8486-9acc-61b871b9d133	9251	Tišina
00050000-56a7-8486-00b2-3f13ad0b50c0	5220	Tolmin
00050000-56a7-8486-5124-11418f44cc00	3326	Topolšica
00050000-56a7-8486-baa5-463d216d7569	2371	Trbonje
00050000-56a7-8486-2b7d-1addf4976da7	1420	Trbovlje
00050000-56a7-8486-e5be-c39d959fba73	8231	Trebelno 
00050000-56a7-8486-466a-64c4992eb8f8	8210	Trebnje
00050000-56a7-8486-c89a-4ab912667d49	5252	Trnovo pri Gorici
00050000-56a7-8486-b69c-52da5ea53b7a	2254	Trnovska vas
00050000-56a7-8486-8d55-2a878936d3a9	1222	Trojane
00050000-56a7-8486-3cc3-80dd20ca4c03	1236	Trzin
00050000-56a7-8486-098d-d58b58ea6d74	4290	Tržič
00050000-56a7-8486-aa3a-28a849a42d10	8295	Tržišče
00050000-56a7-8486-c48e-a8213284e3db	1311	Turjak
00050000-56a7-8486-0433-b2f0bf2816ff	9224	Turnišče
00050000-56a7-8486-ed97-dbbf8fb86b0e	8323	Uršna sela
00050000-56a7-8486-771c-f122f6d94c9b	1252	Vače
00050000-56a7-8486-ece1-cdea6ab672c6	3320	Velenje 
00050000-56a7-8486-e724-e574337aa10f	3322	Velenje - poštni predali
00050000-56a7-8486-8bd1-102a072877dd	8212	Velika Loka
00050000-56a7-8486-9649-aefdd719ecb6	2274	Velika Nedelja
00050000-56a7-8486-022e-692a608e5150	9225	Velika Polana
00050000-56a7-8486-d05c-de7228b853e9	1315	Velike Lašče
00050000-56a7-8486-1997-258a157a8671	8213	Veliki Gaber
00050000-56a7-8486-0c67-70f49f37a36a	9241	Veržej
00050000-56a7-8486-8ca0-9895dbbb53ca	1312	Videm - Dobrepolje
00050000-56a7-8486-0322-8841d6b4feb9	2284	Videm pri Ptuju
00050000-56a7-8486-a1b8-3d618216503d	8344	Vinica
00050000-56a7-8486-d023-f38bba91786f	5271	Vipava
00050000-56a7-8486-d1cc-4f6d322de6df	4212	Visoko
00050000-56a7-8486-1790-99cb367072de	1294	Višnja Gora
00050000-56a7-8486-8708-73c388d9bb2e	3205	Vitanje
00050000-56a7-8486-f23d-0b6487688a05	2255	Vitomarci
00050000-56a7-8486-74ca-ff6d9ead7326	1217	Vodice
00050000-56a7-8486-6dcb-635fafe37dc3	3212	Vojnik\t
00050000-56a7-8486-a6de-1849fcf2cef4	5293	Volčja Draga
00050000-56a7-8486-aa26-60ee2cc535a2	2232	Voličina
00050000-56a7-8486-b80b-f82719225855	3305	Vransko
00050000-56a7-8486-003f-51794608c673	6217	Vremski Britof
00050000-56a7-8486-8420-975cd01bf863	1360	Vrhnika
00050000-56a7-8486-65ab-a1739436e43d	2365	Vuhred
00050000-56a7-8486-6845-6d9b2c7087cc	2367	Vuzenica
00050000-56a7-8486-36cb-b4d3184b13d5	8292	Zabukovje 
00050000-56a7-8486-12e4-ee032ef6f289	1410	Zagorje ob Savi
00050000-56a7-8486-5246-10ac0b6490d4	1303	Zagradec
00050000-56a7-8486-eb31-d5e6832cb220	2283	Zavrč
00050000-56a7-8486-8bdf-cbf9596577db	8272	Zdole 
00050000-56a7-8486-e913-ebb0d313f81f	4201	Zgornja Besnica
00050000-56a7-8486-d179-edf5d8c934d4	2242	Zgornja Korena
00050000-56a7-8486-3324-c63ffbc200c5	2201	Zgornja Kungota
00050000-56a7-8486-3c4a-a0a988046bcc	2316	Zgornja Ložnica
00050000-56a7-8486-5e74-a4b98f80938d	2314	Zgornja Polskava
00050000-56a7-8486-c742-c951310361a6	2213	Zgornja Velka
00050000-56a7-8486-50ce-693375ed97d3	4247	Zgornje Gorje
00050000-56a7-8486-f3f8-b67bd33c5c10	4206	Zgornje Jezersko
00050000-56a7-8486-e632-3417e0a3b161	2285	Zgornji Leskovec
00050000-56a7-8486-6237-72dccb93ab4c	1432	Zidani Most
00050000-56a7-8486-eb31-06e3320afbd3	3214	Zreče
00050000-56a7-8486-9fce-67e9ff2ebb51	4209	Žabnica
00050000-56a7-8486-3717-5db328edbe93	3310	Žalec
00050000-56a7-8486-6233-5f036baa84be	4228	Železniki
00050000-56a7-8486-4778-acdda7511ff8	2287	Žetale
00050000-56a7-8486-5f39-4f503d426dc3	4226	Žiri
00050000-56a7-8486-d8c0-f5fc3dfce609	4274	Žirovnica
00050000-56a7-8486-bc58-f23fa3d3a1cc	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 40489806)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 40489376)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 40489116)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a7-848a-357e-30dd396fc503	00080000-56a7-848a-5df5-cae2c08c0fda	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a7-848a-5371-6cbae4871466	00080000-56a7-848a-5df5-cae2c08c0fda	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a7-848a-4dbb-20f1b51aa646	00080000-56a7-848a-bf98-f49608c9b41f	\N	00040000-56a7-8486-2fcd-92a5d4750dd3	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 40489252)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a7-8487-9bf7-ed2ba2e6a436	novo leto	1	1	\N	t
00430000-56a7-8487-7901-a2051289ef14	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a7-8487-c3bb-99b4532bf5e7	dan upora proti okupatorju	27	4	\N	t
00430000-56a7-8487-e887-a8ed3d61b248	praznik dela	1	5	\N	t
00430000-56a7-8487-351e-bef8612ec765	praznik dela	2	5	\N	t
00430000-56a7-8487-0fd6-dffbd8242401	dan Primoža Trubarja	8	6	\N	f
00430000-56a7-8487-9c94-a6247abbbeda	dan državnosti	25	6	\N	t
00430000-56a7-8487-f34c-32d0c7ec4a76	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a7-8487-3d19-f281ccd34bee	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a7-8487-d52a-5512a7a665b5	dan suverenosti	25	10	\N	f
00430000-56a7-8487-a0ef-36d853faa24a	dan spomina na mrtve	1	11	\N	t
00430000-56a7-8487-ff52-69e1f26716cb	dan Rudolfa Maistra	23	11	\N	f
00430000-56a7-8487-5a7a-b06dcf2773a3	božič	25	12	\N	t
00430000-56a7-8487-9b95-2c91afc8cbac	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a7-8487-58a5-3f923ed474ef	Marijino vnebovzetje	15	8	\N	t
00430000-56a7-8487-cfc4-67cc07806aa3	dan reformacije	31	10	\N	t
00430000-56a7-8487-3e87-52492a103cb5	velikonočna nedelja	27	3	2016	t
00430000-56a7-8487-5762-c2c4baedf37b	velikonočna nedelja	16	4	2017	t
00430000-56a7-8487-8659-34c985f30c69	velikonočna nedelja	1	4	2018	t
00430000-56a7-8487-9a07-820444d26731	velikonočna nedelja	21	4	2019	t
00430000-56a7-8487-a1f0-c2a8e195edad	velikonočna nedelja	12	4	2020	t
00430000-56a7-8487-07c8-23a5dc346192	velikonočna nedelja	4	4	2021	t
00430000-56a7-8487-8074-dcede2bab3c3	velikonočna nedelja	17	4	2022	t
00430000-56a7-8487-4c47-c4d9046f4113	velikonočna nedelja	9	4	2023	t
00430000-56a7-8487-8a4b-f6a339d40191	velikonočna nedelja	31	3	2024	t
00430000-56a7-8487-e3fa-a7bbe96d56ed	velikonočna nedelja	20	4	2025	t
00430000-56a7-8487-cbf1-771165c54fbc	velikonočna nedelja	5	4	2026	t
00430000-56a7-8487-ed59-6d6d2608b3ce	velikonočna nedelja	28	3	2027	t
00430000-56a7-8487-7a8e-c53e1eaea263	velikonočna nedelja	16	4	2028	t
00430000-56a7-8487-2f0f-f466e5f500bc	velikonočna nedelja	1	4	2029	t
00430000-56a7-8487-3b64-da819e17b024	velikonočna nedelja	21	4	2030	t
00430000-56a7-8487-d654-f49156b3e752	velikonočni ponedeljek	28	3	2016	t
00430000-56a7-8487-b023-0a7919964105	velikonočni ponedeljek	17	4	2017	t
00430000-56a7-8487-854d-860ce9a4cffd	velikonočni ponedeljek	2	4	2018	t
00430000-56a7-8487-c36a-2b086762f2e6	velikonočni ponedeljek	22	4	2019	t
00430000-56a7-8487-66cd-dbe8a032a71c	velikonočni ponedeljek	13	4	2020	t
00430000-56a7-8487-5ac9-d56469ada4ea	velikonočni ponedeljek	5	4	2021	t
00430000-56a7-8487-7b9e-0180c6562cf7	velikonočni ponedeljek	18	4	2022	t
00430000-56a7-8487-47f8-78f278e129f1	velikonočni ponedeljek	10	4	2023	t
00430000-56a7-8487-5f76-1435d06866ba	velikonočni ponedeljek	1	4	2024	t
00430000-56a7-8487-fb72-162eebff290c	velikonočni ponedeljek	21	4	2025	t
00430000-56a7-8487-e204-ce5366404a55	velikonočni ponedeljek	6	4	2026	t
00430000-56a7-8487-f7ca-a391c8a3d182	velikonočni ponedeljek	29	3	2027	t
00430000-56a7-8487-6fb2-e85dbe3d7986	velikonočni ponedeljek	17	4	2028	t
00430000-56a7-8487-2d91-99e54220b22a	velikonočni ponedeljek	2	4	2029	t
00430000-56a7-8487-59f0-e6119383d98f	velikonočni ponedeljek	22	4	2030	t
00430000-56a7-8487-02a6-6d3b3013c233	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a7-8487-4baf-588d583aa048	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a7-8487-ce6f-3adccf6e604c	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a7-8487-c70d-775554ab7228	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a7-8487-01be-084f30e1391c	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a7-8487-569a-db584d04cc3c	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a7-8487-8703-911e2071375c	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a7-8487-beb3-b2c6b5162b55	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a7-8487-5bd2-2d5b642ef4d3	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a7-8487-fb04-2900b4b002a2	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a7-8487-017a-1aea32b00ce9	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a7-8487-ebfe-a22acf38ebf7	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a7-8487-b37b-8667fcce374c	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a7-8487-da24-4805427bb805	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a7-8487-e24f-65ab8c346677	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 40489220)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56a7-848b-8a04-1e0cdb4a62c1	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	1	1	\N
001b0000-56a7-848b-5456-30689e43d0f4	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	1	2	\N
001b0000-56a7-848a-53ec-8be1f6e1834e	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	1	3	1
001b0000-56a7-848a-e782-19348cc82c4a	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	2	4	2
001b0000-56a7-848a-635d-d69a654968fe	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	4	5	3
001b0000-56a7-848b-dd4f-bd7fe4901933	000e0000-56a7-848a-c03a-57fd988d648a	\N	1	1	\N
001b0000-56a7-848b-4b3e-64995ef42bff	000e0000-56a7-848a-c03a-57fd988d648a	\N	3	2	1
001b0000-56a7-848b-2cd5-dfa3bb782a0d	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	1	6	1
001b0000-56a7-848b-9235-6058cd8c087b	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	3	7	2
001b0000-56a7-848b-de1e-1a81ed93ca9c	000e0000-56a7-848a-c03a-57fd988d648a	\N	2	3	1
001b0000-56a7-848b-5c54-6b528c39efa6	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	2	9	1
001b0000-56a7-848b-9cd6-1921764a5cae	000e0000-56a7-848a-c03a-57fd988d648a	\N	4	4	2
001b0000-56a7-848b-7393-f698a4a50186	000e0000-56a7-848a-eef2-93dbc1a9cede	\N	5	8	3
001b0000-56a7-848b-3e19-5be897711ccd	000e0000-56a7-848a-c03a-57fd988d648a	\N	1	5	1
\.


--
-- TOC entry 3161 (class 0 OID 40489227)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a7-848a-53ec-8be1f6e1834e	000a0000-56a7-8489-598a-b2c4feaf924c
001b0000-56a7-848a-53ec-8be1f6e1834e	000a0000-56a7-8489-a2d3-3385c3ad1958
001b0000-56a7-848a-e782-19348cc82c4a	000a0000-56a7-8489-a2d3-3385c3ad1958
001b0000-56a7-848a-e782-19348cc82c4a	000a0000-56a7-8489-9452-f8ae727ef0fe
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 40489388)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 40489820)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 40489830)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a7-848a-164d-9243d9ac35b6	00080000-56a7-848a-6c43-21a5732772e4	0987	AK
00190000-56a7-848a-5e81-27acc933c8b8	00080000-56a7-848a-bf98-f49608c9b41f	0989	AK
00190000-56a7-848a-3785-20a247023905	00080000-56a7-848a-7712-a27f17842510	0986	AK
00190000-56a7-848a-4d02-09fe834cfd91	00080000-56a7-848a-5596-d71f047a8729	0984	AK
00190000-56a7-848a-9dfb-58b71dcd401d	00080000-56a7-848a-e80f-b2e0702fadac	0983	AK
00190000-56a7-848a-cb7a-5b7bf6f76b9e	00080000-56a7-848a-dd9c-2456c27aed2a	0982	AK
00190000-56a7-848c-8152-76177a01675b	00080000-56a7-848c-08ac-87c334ee47b6	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 40489719)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a7-848a-911d-1ee3cdc4a7c6	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 40489838)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 40489416)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a7-848a-747b-5f98a02f1331	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a7-848a-e54b-ac45c06ce532	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a7-848a-16ce-d75af5cb4a5f	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a7-848a-19ac-05d62f3454ed	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a7-848a-e5e7-f3bebccda32a	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a7-848a-faf0-3aaa6ed30885	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a7-848a-412c-c0630e3eb53e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 40489361)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 40489351)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 40489558)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 40489488)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 40489194)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 40488955)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a7-848c-08ac-87c334ee47b6	00010000-56a7-8488-cad2-410da8044879	2016-01-26 15:37:00	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a7-848c-1633-cc1dcf5da4ba	00010000-56a7-8488-cad2-410da8044879	2016-01-26 15:37:00	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a7-848c-8152-76177a01675b	00010000-56a7-8488-cad2-410da8044879	2016-01-26 15:37:00	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 40489430)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 40488993)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a7-8487-0909-6226d7ca2c58	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a7-8487-e335-50991e3fb59d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a7-8487-7a78-880533ab3ea2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a7-8487-038d-d2ebb4422ce6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a7-8487-74b2-9e24785cc340	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a7-8487-fda2-ca24b66fd88f	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a7-8487-26f2-4b0394d2ca11	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a7-8487-9659-e4d0d322f2aa	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a7-8487-3048-284b4ea90c29	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-8487-fe1f-9ce70685258a	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-8487-2829-58b139510d7b	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-8487-00bd-a6b81e05e187	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a7-8487-3cdc-5aee051a02d5	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a7-8487-1ca0-4fff71cd947d	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a7-8487-21fd-62a61d598ef4	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a7-8487-502f-1b84e979607d	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a7-8487-b468-12c553486aa0	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a7-8487-b778-bcb904e71af7	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a7-8487-f6ef-fc42da10ba47	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a7-8487-f2e6-76ca490a1def	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a7-8487-c084-54d06e920d40	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a7-8487-9eab-426aa497d9f8	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a7-8487-f889-cfd83cd6b2b9	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a7-8487-7467-6d8ab918d0e7	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a7-8487-1abe-26f418151346	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a7-8487-cb39-3d5e91e34d2f	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a7-8487-bd18-f6f0a5a9b762	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a7-8487-d39a-e8ac2a2ca07f	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a7-8487-87f2-87529e02b692	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a7-8487-5821-4925d5553e1f	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a7-8487-0ea1-2da4c5f1fc96	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a7-8487-613e-74120ce25caa	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a7-8487-f454-c2cbf7e5f1e8	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a7-8487-7547-ea3a196b1bfa	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a7-8487-278d-efe7a667fe97	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a7-8487-752f-993bff06db02	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a7-8487-81f6-1364bd3268a4	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a7-8487-03be-3defa2c6202a	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a7-8487-ab55-3cefc5650fce	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a7-8487-b4da-fe678365720d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a7-8487-414f-11d23141f46c	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a7-8487-4fbe-36c69c773ce2	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a7-8487-0ea4-1f9020cb65e7	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a7-8487-653a-3a5a74bf8663	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a7-8487-6e2a-7e00a8ca76a3	direktor	minimalne pravice za direktorja	t
00020000-56a7-8487-1d92-291e2c6a0acf	arhivar	arhivar	t
00020000-56a7-8487-8753-0137a0cb037b	dramaturg	dramaturg	t
00020000-56a7-8487-c5e8-d770b9e4c1b2	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a7-8487-01a2-435f01bcf258	poslovni-sekretar	poslovni sekretar	t
00020000-56a7-8487-9027-6f16d63f624f	vodja-tehnike	vodja tehnike	t
00020000-56a7-8487-4e2c-f5044a7198ba	racunovodja	računovodja	t
00020000-56a7-848a-7b9d-c5c2280452ef	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a7-848a-b79f-779f1e5126d1	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-de48-d4ae1c5b04e9	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-fac5-c2d18d191a04	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-f118-3136c6bbc068	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-6e7d-a0a772e26cbf	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-ad59-0c46d1c37a61	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-00d4-325d8e75f183	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-1bc7-fec04d7b6b8c	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-8f93-8805bfb12cb2	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-9ca6-f935f3a08a34	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-100a-3dd242b49078	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-6e2d-42e9440112bc	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-61b0-32b1192b53e8	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-172d-f04395441f48	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-d4ad-4884d3fd5f39	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-84f4-61638134b6eb	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-97e8-9718b2003cad	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-23f4-768b1fa2cc1d	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-31ac-9d63079b8684	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a7-848a-b0f5-c8a93d891b5f	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-3e33-b2aeeed72b94	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-8aa9-0ff39af0c81d	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-a839-4821a7f9a492	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-0c91-83d5d3fc7360	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-c3c0-81778ce7b18b	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-a1cc-8796affdf666	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-7806-8da465a1098a	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-a2bf-cdee30183e40	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-6a4e-3ab1c656aad5	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-07d7-6a9c86b19b84	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-cd47-004b3354deb5	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-545f-d1fcb1f9e4d6	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-d8d8-a0fb808bc1a2	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-0add-db30294a5a28	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-7546-008e630bb018	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-2d52-bedb91381376	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-63a2-23f3c0be5f8d	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a7-848a-47e8-bfeba7f62c0a	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 40488977)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a7-8488-d7be-da8e2c15ad84	00020000-56a7-8487-7a78-880533ab3ea2
00010000-56a7-8488-cad2-410da8044879	00020000-56a7-8487-7a78-880533ab3ea2
00010000-56a7-848a-68ef-7d3485470d25	00020000-56a7-848a-7b9d-c5c2280452ef
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-b79f-779f1e5126d1
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-6e7d-a0a772e26cbf
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-8f93-8805bfb12cb2
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-100a-3dd242b49078
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-61b0-32b1192b53e8
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-23f4-768b1fa2cc1d
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-fac5-c2d18d191a04
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-b0f5-c8a93d891b5f
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-a839-4821a7f9a492
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-c3c0-81778ce7b18b
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-7806-8da465a1098a
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-6a4e-3ab1c656aad5
00010000-56a7-848a-b716-1674f1eed9a2	00020000-56a7-848a-d8d8-a0fb808bc1a2
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-b79f-779f1e5126d1
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-de48-d4ae1c5b04e9
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-fac5-c2d18d191a04
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-f118-3136c6bbc068
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-61b0-32b1192b53e8
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-84f4-61638134b6eb
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-b0f5-c8a93d891b5f
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-a839-4821a7f9a492
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-c3c0-81778ce7b18b
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-7806-8da465a1098a
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-6a4e-3ab1c656aad5
00010000-56a7-848a-bdca-21a8c982e6da	00020000-56a7-848a-d8d8-a0fb808bc1a2
00010000-56a7-848a-6a71-7aa9fe1724bd	00020000-56a7-848a-b79f-779f1e5126d1
00010000-56a7-848a-6a71-7aa9fe1724bd	00020000-56a7-848a-de48-d4ae1c5b04e9
00010000-56a7-848a-6a71-7aa9fe1724bd	00020000-56a7-848a-fac5-c2d18d191a04
00010000-56a7-848a-6a71-7aa9fe1724bd	00020000-56a7-848a-f118-3136c6bbc068
00010000-56a7-848a-6a71-7aa9fe1724bd	00020000-56a7-848a-100a-3dd242b49078
00010000-56a7-848a-6a71-7aa9fe1724bd	00020000-56a7-848a-61b0-32b1192b53e8
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-de48-d4ae1c5b04e9
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-ad59-0c46d1c37a61
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-9ca6-f935f3a08a34
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-6e2d-42e9440112bc
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-100a-3dd242b49078
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-97e8-9718b2003cad
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-61b0-32b1192b53e8
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-172d-f04395441f48
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-b0f5-c8a93d891b5f
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-3e33-b2aeeed72b94
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-a839-4821a7f9a492
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-0c91-83d5d3fc7360
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-c3c0-81778ce7b18b
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-a1cc-8796affdf666
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-7806-8da465a1098a
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-a2bf-cdee30183e40
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-6a4e-3ab1c656aad5
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-07d7-6a9c86b19b84
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-d8d8-a0fb808bc1a2
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-0add-db30294a5a28
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-2d52-bedb91381376
00010000-56a7-848a-956b-57c3c6a829ca	00020000-56a7-848a-63a2-23f3c0be5f8d
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-de48-d4ae1c5b04e9
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-ad59-0c46d1c37a61
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-1bc7-fec04d7b6b8c
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-9ca6-f935f3a08a34
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-6e2d-42e9440112bc
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-100a-3dd242b49078
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-97e8-9718b2003cad
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-61b0-32b1192b53e8
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-172d-f04395441f48
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-d4ad-4884d3fd5f39
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-b0f5-c8a93d891b5f
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-3e33-b2aeeed72b94
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-8aa9-0ff39af0c81d
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-a839-4821a7f9a492
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-0c91-83d5d3fc7360
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-c3c0-81778ce7b18b
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-a1cc-8796affdf666
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-7806-8da465a1098a
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-a2bf-cdee30183e40
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-6a4e-3ab1c656aad5
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-07d7-6a9c86b19b84
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-d8d8-a0fb808bc1a2
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-0add-db30294a5a28
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-7546-008e630bb018
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-2d52-bedb91381376
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-63a2-23f3c0be5f8d
00010000-56a7-848a-d3dd-d6632baa3b2f	00020000-56a7-848a-47e8-bfeba7f62c0a
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-de48-d4ae1c5b04e9
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-fac5-c2d18d191a04
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-ad59-0c46d1c37a61
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-00d4-325d8e75f183
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-1bc7-fec04d7b6b8c
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-6e7d-a0a772e26cbf
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-9ca6-f935f3a08a34
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-6e2d-42e9440112bc
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-100a-3dd242b49078
00010000-56a7-848a-3c72-06006ca541b4	00020000-56a7-848a-97e8-9718b2003cad
00010000-56a7-848a-a4af-61332db14f93	00020000-56a7-848a-b79f-779f1e5126d1
00010000-56a7-848a-a4af-61332db14f93	00020000-56a7-848a-f118-3136c6bbc068
00010000-56a7-848a-a4af-61332db14f93	00020000-56a7-848a-6e7d-a0a772e26cbf
00010000-56a7-848a-a4af-61332db14f93	00020000-56a7-848a-8f93-8805bfb12cb2
00010000-56a7-848a-a4af-61332db14f93	00020000-56a7-848a-100a-3dd242b49078
00010000-56a7-848a-a4af-61332db14f93	00020000-56a7-848a-61b0-32b1192b53e8
00010000-56a7-848a-a4af-61332db14f93	00020000-56a7-848a-23f4-768b1fa2cc1d
00010000-56a7-848a-a4af-61332db14f93	00020000-56a7-848a-cd47-004b3354deb5
00010000-56a7-848a-4570-6ba9e1b49896	00020000-56a7-848a-31ac-9d63079b8684
00010000-56a7-848a-bf14-edd68c0233aa	00020000-56a7-8487-6e2a-7e00a8ca76a3
00010000-56a7-848a-5c1f-ebb8f90ebe1b	00020000-56a7-8487-1d92-291e2c6a0acf
00010000-56a7-848a-e4b2-4a3a5a9ace36	00020000-56a7-8487-8753-0137a0cb037b
00010000-56a7-848a-f51b-6e4fa5327457	00020000-56a7-8487-c5e8-d770b9e4c1b2
00010000-56a7-848a-7a91-1d3224f17547	00020000-56a7-8487-01a2-435f01bcf258
00010000-56a7-848a-324f-bd81a9fd2424	00020000-56a7-8487-9027-6f16d63f624f
00010000-56a7-848a-6278-4aab71125997	00020000-56a7-8487-4e2c-f5044a7198ba
\.


--
-- TOC entry 3186 (class 0 OID 40489444)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 40489382)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 40489305)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a7-8489-6c55-4387367eb6a6	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a7-8489-c9d4-751a055285d2	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a7-8489-c0fa-2e5a78cb0150	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a7-8489-ebb2-bddd542c44cd	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 40488942)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a7-8486-a21e-77ea9a62c4a4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a7-8486-a2e5-eebf93fb2999	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a7-8486-e3ab-15fcacf03bba	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a7-8486-5581-7d2834528902	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a7-8486-347b-12ccc5fa79dd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 40488934)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a7-8486-3db1-3c40afa94399	00230000-56a7-8486-5581-7d2834528902	popa
00240000-56a7-8486-4c37-9fc8f8e24b87	00230000-56a7-8486-5581-7d2834528902	oseba
00240000-56a7-8486-5fe2-e0894f78c876	00230000-56a7-8486-5581-7d2834528902	tippopa
00240000-56a7-8486-18ab-5edefe51ab8f	00230000-56a7-8486-5581-7d2834528902	organizacijskaenota
00240000-56a7-8486-06a9-98bea76fca2f	00230000-56a7-8486-5581-7d2834528902	sezona
00240000-56a7-8486-982b-e88942b8a572	00230000-56a7-8486-5581-7d2834528902	tipvaje
00240000-56a7-8486-e750-cdb50f5fbf69	00230000-56a7-8486-5581-7d2834528902	tipdodatka
00240000-56a7-8486-4eca-d07bcbac683e	00230000-56a7-8486-a2e5-eebf93fb2999	prostor
00240000-56a7-8486-eea9-c74886738a14	00230000-56a7-8486-5581-7d2834528902	besedilo
00240000-56a7-8486-1ac4-802f08e483c6	00230000-56a7-8486-5581-7d2834528902	uprizoritev
00240000-56a7-8486-9e29-f887617fc69a	00230000-56a7-8486-5581-7d2834528902	funkcija
00240000-56a7-8486-c013-711821347052	00230000-56a7-8486-5581-7d2834528902	tipfunkcije
00240000-56a7-8486-a305-1a9c567331cb	00230000-56a7-8486-5581-7d2834528902	alternacija
00240000-56a7-8486-c2ea-f2fa353398d2	00230000-56a7-8486-a21e-77ea9a62c4a4	pogodba
00240000-56a7-8486-f3d0-8a2379900290	00230000-56a7-8486-5581-7d2834528902	zaposlitev
00240000-56a7-8486-6481-33baab91b790	00230000-56a7-8486-5581-7d2834528902	zvrstuprizoritve
00240000-56a7-8486-6b89-b86310f2f176	00230000-56a7-8486-a21e-77ea9a62c4a4	programdela
00240000-56a7-8486-f852-0a158cebd683	00230000-56a7-8486-5581-7d2834528902	zapis
\.


--
-- TOC entry 3133 (class 0 OID 40488929)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e6639b5b-c047-4b68-8abf-b4017b82ffc4	00240000-56a7-8486-3db1-3c40afa94399	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 40489505)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a7-848a-035f-db00cf85aa21	000e0000-56a7-848a-eef2-93dbc1a9cede	00080000-56a7-848a-5df5-cae2c08c0fda	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a7-8487-db19-4c158c576470
00270000-56a7-848a-2108-d5fc00d125cf	000e0000-56a7-848a-eef2-93dbc1a9cede	00080000-56a7-848a-5df5-cae2c08c0fda	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a7-8487-db19-4c158c576470
\.


--
-- TOC entry 3149 (class 0 OID 40489078)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 40489324)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a7-848b-c7f7-71b74b0cea76	00180000-56a7-848a-6f00-84ad06e230db	000c0000-56a7-848b-a9e7-ec79cc4b835b	00090000-56a7-848a-4182-f91fda1470dc	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-848b-d678-d8680b6a55f5	00180000-56a7-848a-6f00-84ad06e230db	000c0000-56a7-848b-2c91-3b7af9b0eae6	00090000-56a7-848a-8480-fb6a80dba440	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-848b-2f69-49767d352047	00180000-56a7-848a-6f00-84ad06e230db	000c0000-56a7-848b-6ef8-f1a9c03d72ff	00090000-56a7-848a-f9d4-203d53cb150c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-848b-7731-56648c0ffc27	00180000-56a7-848a-6f00-84ad06e230db	000c0000-56a7-848b-0720-78f77b1d4dfd	00090000-56a7-848a-4c52-6f6390b6b784	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-848b-73f6-d3ac2aab22fc	00180000-56a7-848a-6f00-84ad06e230db	000c0000-56a7-848b-0b94-12a9f5f32503	00090000-56a7-848a-184d-be990a931e2c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a7-848b-3b4f-b695468ea65b	00180000-56a7-848a-60bc-9608a038f390	\N	00090000-56a7-848a-184d-be990a931e2c	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a7-848b-befd-be7b3ed5064f	00180000-56a7-848a-18e5-66f8a8b3566b	\N	00090000-56a7-848a-8480-fb6a80dba440	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a7-848b-0961-4ea74220fa6f	00180000-56a7-848a-6f00-84ad06e230db	\N	00090000-56a7-848a-61b1-7c7d74c52b81	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 40489341)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a7-8486-6a17-4dfa15511e2c	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a7-8486-2558-46730e035dc3	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a7-8486-a37c-692d2239864a	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a7-8486-a645-7c759ecba483	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a7-8486-2e35-42d8917bfc28	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a7-8486-050b-eb3c5d613bb5	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 40489546)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a7-8486-bdcc-88a826aec135	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a7-8486-9167-807650b52ee5	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a7-8486-d990-0a980280f5bd	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a7-8486-968b-048ce3654459	04	Režija	Režija	Režija	umetnik	30
000f0000-56a7-8486-ee01-d6bc4a36d8ff	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a7-8486-4d62-978d147f4953	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a7-8486-cb9d-96f82fd49429	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a7-8486-27d1-0b8908f74dd5	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a7-8486-86b3-0d2a8e675f91	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a7-8486-b9c3-499f4cc255c8	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a7-8486-3310-bf9dd10a1a8c	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a7-8486-bc0e-417f2ec8d690	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a7-8486-ade7-9f6fa2deb27b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a7-8486-7b1f-d3f1895e4420	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a7-8486-f096-6511ecfcd252	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a7-8486-cda5-bb626a07f726	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a7-8486-cf5a-912b69eb9659	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a7-8486-f27d-b4fd317d4a90	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a7-8486-5c8b-9808a889a526	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 40489029)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a7-8489-56b0-c15d820ff63a	0001	šola	osnovna ali srednja šola
00400000-56a7-8489-f3e4-cad84a4cfcdb	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a7-8489-743e-65f664b53027	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 40489850)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a7-8486-f019-3cfcdcb983c8	01	Velika predstava	f	1.00	1.00
002b0000-56a7-8486-4c1c-8864217534e2	02	Mala predstava	f	0.50	0.50
002b0000-56a7-8486-776a-de5c314a4c04	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a7-8486-722b-f9d41f22aa4d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a7-8486-1f80-96f40cf1ef04	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 40489295)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a7-8486-b337-e4dc9f7160e6	0001	prva vaja	prva vaja
00420000-56a7-8486-6f4a-d6b90cdeb862	0002	tehnična vaja	tehnična vaja
00420000-56a7-8486-a636-0f654f8bf208	0003	lučna vaja	lučna vaja
00420000-56a7-8486-24be-d582f3571952	0004	kostumska vaja	kostumska vaja
00420000-56a7-8486-9394-b93466ee4306	0005	foto vaja	foto vaja
00420000-56a7-8486-9992-22f108b38fe8	0006	1. glavna vaja	1. glavna vaja
00420000-56a7-8486-63eb-cef78d444946	0007	2. glavna vaja	2. glavna vaja
00420000-56a7-8486-d6df-c8ac68383ba6	0008	1. generalka	1. generalka
00420000-56a7-8486-f3f6-e1af4cc6b96b	0009	2. generalka	2. generalka
00420000-56a7-8486-0eb9-38a2c8c883fa	0010	odprta generalka	odprta generalka
00420000-56a7-8486-ead0-6150e0cf4844	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a7-8486-3306-5c91d7355191	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a7-8486-dd13-4c14f0f5f088	0013	pevska vaja	pevska vaja
00420000-56a7-8486-6fe7-ede60fdefe38	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a7-8486-0318-ce70d29ce14c	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a7-8486-ead9-9106d1ce11ac	0016	orientacijska vaja	orientacijska vaja
00420000-56a7-8486-16d6-9b0021b299b1	0017	situacijska vaja	situacijska vaja
00420000-56a7-8486-a516-f7ae65f49667	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 40489151)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 40488964)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a7-8488-cad2-410da8044879	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROneOui2XWrCEnynoRj9sKkBvBiN2PNgO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a7-848a-8cc6-f47cdace6f59	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a7-848a-1b9e-22d74168ce13	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a7-848a-c2a9-cded4fbc2901	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a7-848a-a3f1-5f463e2c1f6a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a7-848a-88c5-a4fa7875f319	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a7-848a-c003-fb20279765bc	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a7-848a-34df-5a0f5aa8be74	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a7-848a-5522-ee3ddf2f8437	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a7-848a-a087-7cd2f5392dac	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a7-848a-68ef-7d3485470d25	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a7-848a-43e4-521a6711b73f	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a7-848a-b716-1674f1eed9a2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a7-848a-bdca-21a8c982e6da	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a7-848a-6a71-7aa9fe1724bd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a7-848a-956b-57c3c6a829ca	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a7-848a-d3dd-d6632baa3b2f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a7-848a-3c72-06006ca541b4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a7-848a-a4af-61332db14f93	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a7-848a-4570-6ba9e1b49896	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a7-848a-bf14-edd68c0233aa	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a7-848a-5c1f-ebb8f90ebe1b	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a7-848a-e4b2-4a3a5a9ace36	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a7-848a-f51b-6e4fa5327457	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a7-848a-7a91-1d3224f17547	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a7-848a-324f-bd81a9fd2424	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a7-848a-6278-4aab71125997	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a7-8488-d7be-da8e2c15ad84	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 40489596)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a7-848a-c03a-57fd988d648a	00160000-56a7-8489-c7ed-53b6fe4565b2	\N	00140000-56a7-8486-a528-653d45b10c31	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a7-848a-e5e7-f3bebccda32a
000e0000-56a7-848a-eef2-93dbc1a9cede	00160000-56a7-8489-ed43-4608ee405b96	\N	00140000-56a7-8486-dc53-01041cab608f	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a7-848a-faf0-3aaa6ed30885
000e0000-56a7-848a-b124-cb0dd685c7df	\N	\N	00140000-56a7-8486-dc53-01041cab608f	00190000-56a7-848a-164d-9243d9ac35b6	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a7-848a-e5e7-f3bebccda32a
000e0000-56a7-848a-0033-a29a873c8d0d	\N	\N	00140000-56a7-8486-dc53-01041cab608f	00190000-56a7-848a-164d-9243d9ac35b6	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a7-848a-e5e7-f3bebccda32a
000e0000-56a7-848a-29a0-b109b7adf6b2	\N	\N	00140000-56a7-8486-dc53-01041cab608f	00190000-56a7-848a-164d-9243d9ac35b6	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-2523-ce35c2b8f5e0	\N	\N	00140000-56a7-8486-dc53-01041cab608f	00190000-56a7-848a-164d-9243d9ac35b6	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-ec8b-c63fe8f48e77	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-1cab-04986185d11d	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-6e42-c75d218b8c55	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-7d2e-29e789da86fc	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-aeca-cf64fb7413e3	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-f6fc-6339d2b7ce19	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-3d7d-f8b6b8e80d63	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-2a0b-42dd6c902e57	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
000e0000-56a7-848a-6fec-123c7cb6a39b	\N	\N	00140000-56a7-8486-4391-8b116758fbef	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a7-848a-747b-5f98a02f1331
\.


--
-- TOC entry 3170 (class 0 OID 40489315)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40489245)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a7-848a-16f7-cfebd37e0a0a	\N	000e0000-56a7-848a-c03a-57fd988d648a	1
00200000-56a7-848a-8ef8-080a5fe23dd6	\N	000e0000-56a7-848a-eef2-93dbc1a9cede	1
00200000-56a7-848a-2518-d904bc32ab80	\N	000e0000-56a7-848a-eef2-93dbc1a9cede	3
00200000-56a7-848a-b349-47474dece7d6	\N	000e0000-56a7-848a-eef2-93dbc1a9cede	4
00200000-56a7-848a-dca4-9a56bbdc9dc9	\N	000e0000-56a7-848a-eef2-93dbc1a9cede	2
00200000-56a7-848a-4196-47f911dfde27	\N	000e0000-56a7-848a-eef2-93dbc1a9cede	8
00200000-56a7-848a-605f-f126a942473a	\N	000e0000-56a7-848a-eef2-93dbc1a9cede	5
00200000-56a7-848a-2a54-ebabcca66d57	\N	000e0000-56a7-848a-eef2-93dbc1a9cede	7
00200000-56a7-848a-e12c-a077365c2cb3	\N	000e0000-56a7-848a-eef2-93dbc1a9cede	6
\.


--
-- TOC entry 3182 (class 0 OID 40489408)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 40489519)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a7-8487-a80c-6a7b9d359c67	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a7-8487-b9b6-6f739695fc61	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a7-8487-1534-0c7c2e9e63db	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a7-8487-0127-09b6bfe8eb49	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a7-8487-f196-f50298fb7f95	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a7-8487-892c-04040e7eb521	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a7-8487-d40b-171d30dc39f7	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a7-8487-b2e7-9b1491edc0bd	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a7-8487-db19-4c158c576470	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a7-8487-3ad1-467f30b8f9dd	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a7-8487-8ed2-084e2b451e2a	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a7-8487-965b-48975ca95b90	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a7-8487-5aa8-ea961f31096e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a7-8487-c0d0-6e3d7bbd8841	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a7-8487-5fc3-5dd13bd6692b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a7-8487-3ef6-1f3c5e131b71	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a7-8487-3141-96584d007a18	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a7-8487-d6ee-2eb548105fa5	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a7-8487-d3c4-7cce265cf6a1	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a7-8487-0e45-baecbd763b3f	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a7-8487-3884-9ed786a4e7ed	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a7-8487-ae48-2c013abe43ec	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a7-8487-2980-92302e676b00	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a7-8487-1697-af31aaecac07	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a7-8487-0ba8-e084ba5b6c82	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a7-8487-5b0d-ee62c9b470d6	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a7-8487-d352-504106ba36e1	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a7-8487-87f0-d0af2bd1beb6	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 40489900)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 40489869)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 40489912)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 40489481)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a7-848a-c3f8-948f9e6ece17	00090000-56a7-848a-8480-fb6a80dba440	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-848a-2587-f2c17f4a0e99	00090000-56a7-848a-f9d4-203d53cb150c	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-848a-feae-072ee7ef0123	00090000-56a7-848a-84be-3bc08edd3981	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-848a-0ac3-6c9e79785b44	00090000-56a7-848a-908b-a8aa73c6d15d	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-848a-2230-223e39ec5da6	00090000-56a7-848a-1404-2ca5b6ecea2d	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a7-848a-0823-1eccb2270f8c	00090000-56a7-848a-cba4-6c08456b0828	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 40489586)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a7-8486-a528-653d45b10c31	01	Drama	drama (SURS 01)
00140000-56a7-8486-b09d-85e694be9c7b	02	Opera	opera (SURS 02)
00140000-56a7-8486-f039-7a88de0c4068	03	Balet	balet (SURS 03)
00140000-56a7-8486-ae95-dcefbb5ec6a5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a7-8486-4391-8b116758fbef	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a7-8486-dc53-01041cab608f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a7-8486-501e-4ed114e3df40	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 40489471)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 40489028)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 40489644)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 40489635)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 40489018)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 40489502)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 40489544)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 40489953)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 40489338)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 40489274)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 40489289)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 40489294)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 40489867)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 40489177)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 40489713)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 40489467)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 40489243)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 40489215)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 40489191)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 40489374)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 40489930)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 40489937)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 40489961)
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
-- TOC entry 2766 (class 2606 OID 40489400)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 40489149)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 40489047)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 40489111)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 40489074)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 40489007)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 40488992)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 40489406)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 40489443)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 40489581)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 40489102)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 40489137)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 40489818)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 40489380)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 40489127)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 40489259)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 40489231)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 40489224)
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
-- TOC entry 2764 (class 2606 OID 40489392)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 40489827)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 40489835)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 40489805)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 40489848)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 40489425)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 40489365)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 40489356)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 40489568)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 40489495)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 40489203)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 40488963)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 40489434)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 40488981)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 40489001)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 40489452)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 40489387)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 40489313)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 40488951)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 40488939)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 40488933)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 40489515)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 40489083)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 40489330)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 40489348)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 40489555)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 40489036)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 40489860)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 40489302)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 40489162)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 40488976)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 40489614)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 40489321)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 40489249)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 40489414)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 40489527)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 40489910)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 40489894)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 40489918)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 40489485)
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
-- TOC entry 2833 (class 2606 OID 40489594)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 40489479)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 40489283)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 40489284)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 40489282)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 40489281)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 40489280)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 40489516)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 40489517)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 40489518)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 40489932)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 40489931)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 40489104)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 40489105)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 40489407)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 40489898)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 40489897)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 40489899)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 40489896)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 40489895)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 40489393)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 40489250)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 40489251)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 40489468)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 40489470)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 40489469)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 40489193)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 40489192)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 40489849)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 40489583)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 40489584)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 40489585)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 40489919)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 40489619)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 40489616)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 40489620)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 40489618)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 40489617)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 40489164)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 40489163)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 40489077)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 40489435)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 40489008)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 40489009)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 40489455)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 40489454)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 40489453)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 40489114)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 40489113)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 40489115)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 40489225)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 40489226)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 40488941)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 40489360)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 40489358)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 40489357)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 40489359)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 40488982)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 40488983)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 40489415)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 40489954)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 40489504)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 40489503)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 40489962)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 40489963)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 40489381)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 40489496)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 40489497)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 40489718)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 40489717)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 40489714)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 40489715)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 40489716)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 40489129)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 40489128)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 40489130)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 40489429)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 40489428)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 40489828)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 40489829)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 40489648)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 40489649)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 40489646)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 40489647)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 40489339)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 40489340)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 40489486)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 40489487)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 40489322)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 40489369)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 40489368)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 40489366)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 40489367)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 40489636)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 40489204)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 40489218)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 40489217)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 40489216)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 40489219)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 40489244)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 40489232)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 40489233)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 40489819)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 40489868)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 40489938)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 40489939)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 40489049)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 40489048)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 40489084)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 40489085)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 40489333)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 40489332)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 40489331)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 40489276)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 40489279)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 40489275)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 40489278)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 40489277)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 40489103)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 40489037)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 40489038)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 40489178)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 40489180)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 40489179)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 40489181)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 40489375)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 40489582)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 40489615)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 40489556)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 40489557)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 40489075)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 40489076)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 40489349)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 40489350)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 40489480)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 40488952)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 40489150)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 40489112)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 40488940)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 40489861)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 40489427)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 40489426)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 40489303)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 40489304)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 40489645)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 40489323)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 40489138)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 40489595)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 40489911)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 40489836)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 40489837)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 40489545)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 40489314)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 40489002)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 40490129)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 40490154)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 40490144)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 40490124)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 40490139)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 40490149)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 40490134)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 40490334)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 40490339)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 40490344)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 40490504)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 40490499)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 40490019)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 40490024)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 40490249)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 40490484)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 40490479)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 40490489)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 40490474)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 40490469)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 40490244)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 40490114)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 40490119)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 40490289)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 40490299)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 40490294)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 40490074)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 40490069)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 40490234)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 40490459)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 40490349)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 40490354)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 40490359)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 40490494)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 40490379)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 40490364)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 40490384)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 40490374)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 40490369)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 40490064)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 40490059)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 40490004)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 40489999)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 40490269)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 40489979)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 40489984)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 40490284)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 40490279)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 40490274)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 40490034)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 40490029)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 40490039)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 40490089)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 40490094)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 40489964)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 40490209)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 40490199)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 40490194)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 40490204)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 40489969)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 40489974)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 40490254)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 40490519)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 40490329)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 40490324)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 40490524)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 40490529)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 40490239)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 40490314)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 40490319)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 40490434)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 40490429)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 40490414)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 40490419)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 40490424)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 40490049)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 40490044)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 40490054)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 40490264)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 40490259)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 40490444)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 40490449)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 40490404)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 40490409)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 40490394)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 40490399)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 40490184)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 40490189)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 40490304)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 40490309)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 40490159)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 40490164)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 40490229)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 40490224)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 40490214)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 40490219)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 40490389)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 40490079)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 40490084)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 40490109)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 40490099)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 40490104)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 40490439)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 40490454)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 40490464)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 40490509)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 40490514)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 40489994)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 40489989)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 40490009)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 40490014)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 40490179)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 40490174)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 40490169)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-26 15:37:02 CET

--
-- PostgreSQL database dump complete
--

