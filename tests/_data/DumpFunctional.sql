--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-27 08:49:24 CET

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
-- TOC entry 185 (class 1259 OID 40669503)
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
-- TOC entry 241 (class 1259 OID 40670121)
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
-- TOC entry 240 (class 1259 OID 40670105)
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
-- TOC entry 184 (class 1259 OID 40669496)
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
-- TOC entry 183 (class 1259 OID 40669494)
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
-- TOC entry 231 (class 1259 OID 40669982)
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
-- TOC entry 234 (class 1259 OID 40670012)
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
-- TOC entry 255 (class 1259 OID 40670424)
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
-- TOC entry 212 (class 1259 OID 40669818)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 40669744)
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
-- TOC entry 206 (class 1259 OID 40669769)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 40669774)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 40670346)
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
-- TOC entry 196 (class 1259 OID 40669649)
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
-- TOC entry 242 (class 1259 OID 40670134)
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
-- TOC entry 227 (class 1259 OID 40669940)
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
-- TOC entry 202 (class 1259 OID 40669718)
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
-- TOC entry 199 (class 1259 OID 40669689)
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
-- TOC entry 197 (class 1259 OID 40669666)
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
-- TOC entry 216 (class 1259 OID 40669854)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 40670404)
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
-- TOC entry 254 (class 1259 OID 40670417)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 40670439)
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
-- TOC entry 220 (class 1259 OID 40669878)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 40669623)
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
-- TOC entry 187 (class 1259 OID 40669523)
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
-- TOC entry 191 (class 1259 OID 40669590)
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
-- TOC entry 188 (class 1259 OID 40669534)
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
-- TOC entry 180 (class 1259 OID 40669468)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 40669487)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 40669885)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 40669920)
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
-- TOC entry 237 (class 1259 OID 40670053)
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
-- TOC entry 190 (class 1259 OID 40669570)
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
-- TOC entry 193 (class 1259 OID 40669615)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 40670290)
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
-- TOC entry 217 (class 1259 OID 40669860)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 40669600)
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
-- TOC entry 204 (class 1259 OID 40669736)
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
-- TOC entry 200 (class 1259 OID 40669704)
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
-- TOC entry 201 (class 1259 OID 40669711)
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
-- TOC entry 219 (class 1259 OID 40669872)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 40670304)
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
-- TOC entry 246 (class 1259 OID 40670314)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 40670203)
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
-- TOC entry 247 (class 1259 OID 40670322)
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
-- TOC entry 223 (class 1259 OID 40669900)
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
-- TOC entry 215 (class 1259 OID 40669845)
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
-- TOC entry 214 (class 1259 OID 40669835)
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
-- TOC entry 236 (class 1259 OID 40670042)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 40669972)
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
-- TOC entry 198 (class 1259 OID 40669678)
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
-- TOC entry 177 (class 1259 OID 40669439)
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
-- TOC entry 176 (class 1259 OID 40669437)
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
-- TOC entry 224 (class 1259 OID 40669914)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 40669477)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 40669461)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 40669928)
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
-- TOC entry 218 (class 1259 OID 40669866)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 40669789)
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
-- TOC entry 175 (class 1259 OID 40669426)
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
-- TOC entry 174 (class 1259 OID 40669418)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 40669413)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 40669989)
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
-- TOC entry 189 (class 1259 OID 40669562)
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
-- TOC entry 211 (class 1259 OID 40669808)
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
-- TOC entry 213 (class 1259 OID 40669825)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 40670030)
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
-- TOC entry 186 (class 1259 OID 40669513)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 40670334)
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
-- TOC entry 208 (class 1259 OID 40669779)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 40669635)
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
-- TOC entry 178 (class 1259 OID 40669448)
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
-- TOC entry 239 (class 1259 OID 40670080)
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
-- TOC entry 210 (class 1259 OID 40669799)
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
-- TOC entry 203 (class 1259 OID 40669729)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 40669892)
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
-- TOC entry 233 (class 1259 OID 40670003)
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
-- TOC entry 251 (class 1259 OID 40670384)
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
-- TOC entry 250 (class 1259 OID 40670353)
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
-- TOC entry 252 (class 1259 OID 40670396)
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
-- TOC entry 229 (class 1259 OID 40669965)
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
-- TOC entry 238 (class 1259 OID 40670070)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 40669955)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 40669499)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 40669442)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 40669503)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a8-7680-22e8-5fa41c58dd95	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a8-7680-53eb-5109414f630d	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a8-7680-86dd-408bb0b00edb	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 40670121)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a8-7681-a88a-678c42804c3c	000d0000-56a8-7681-8ef4-4e65c6a7d30e	\N	00090000-56a8-7681-590a-864ef44ff108	000b0000-56a8-7681-1008-96fe13da7146	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a8-7681-4f73-4a4922d28936	000d0000-56a8-7681-49a5-88edfc3f669d	00100000-56a8-7681-3734-16b6cde20bd9	00090000-56a8-7681-5739-40cb99dff9c2	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a8-7681-c6ff-a4ebb092e7c1	000d0000-56a8-7681-b856-551fcd77d0d0	00100000-56a8-7681-9891-74ddeba19635	00090000-56a8-7681-2815-c18c4ee6471d	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a8-7681-760d-de64971f7494	000d0000-56a8-7681-0260-5689caa6ea99	\N	00090000-56a8-7681-d35f-6849dfac302f	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a8-7681-f8ca-022e17116261	000d0000-56a8-7681-0688-1120715f6b07	\N	00090000-56a8-7681-ad72-5114220ffbd6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a8-7681-5140-acfa29b9eb83	000d0000-56a8-7681-79c5-c0afdbbc22f3	\N	00090000-56a8-7681-10a6-745c2af4d49b	000b0000-56a8-7681-7ac6-9293f9ea5714	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a8-7681-5e82-fba0ef07320a	000d0000-56a8-7681-e6b4-1083300522be	00100000-56a8-7681-6d64-998af570e99b	00090000-56a8-7681-1858-ae4b04e5f018	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a8-7681-9c05-eab1c938cf9b	000d0000-56a8-7681-dc65-764da1f2730d	\N	00090000-56a8-7681-9267-32ea1aabd262	000b0000-56a8-7681-70ae-813d4c28c736	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a8-7681-0c03-5c7432a6109e	000d0000-56a8-7681-e6b4-1083300522be	00100000-56a8-7681-79bc-3951eac01119	00090000-56a8-7681-8887-141ec14678f9	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a8-7681-514a-7ead8a3dccbb	000d0000-56a8-7681-e6b4-1083300522be	00100000-56a8-7681-65b8-ab2ccfce2fba	00090000-56a8-7681-fec1-54096ed15586	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a8-7681-d6db-0b7aa3996493	000d0000-56a8-7681-e6b4-1083300522be	00100000-56a8-7681-3757-05b9489c5d5e	00090000-56a8-7681-68c3-9bb911547fb3	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a8-7681-bf9d-30afe6b83b43	000d0000-56a8-7681-3082-54f37cb71258	00100000-56a8-7681-3734-16b6cde20bd9	00090000-56a8-7681-5739-40cb99dff9c2	000b0000-56a8-7681-47c5-4709d447eb0f	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a8-7681-5a39-e72371b388d8	000d0000-56a8-7681-ea60-7d8caf5a1c4a	\N	00090000-56a8-7681-9267-32ea1aabd262	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-0782-54088415d2bf	000d0000-56a8-7681-ea60-7d8caf5a1c4a	\N	00090000-56a8-7681-296f-f4d72b893328	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a8-7681-7262-2005f2fb8cdd	000d0000-56a8-7681-d13d-867c63a58555	00100000-56a8-7681-9891-74ddeba19635	00090000-56a8-7681-2815-c18c4ee6471d	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-42e2-930820447db6	000d0000-56a8-7681-d13d-867c63a58555	\N	00090000-56a8-7681-296f-f4d72b893328	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a8-7681-297b-4d9b61c3666c	000d0000-56a8-7681-56dd-b7e67bd74738	\N	00090000-56a8-7681-296f-f4d72b893328	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-06ec-b1dc4914b67f	000d0000-56a8-7681-56dd-b7e67bd74738	\N	00090000-56a8-7681-9267-32ea1aabd262	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a8-7681-7f52-efe553d11f55	000d0000-56a8-7681-0077-155b9efe21f4	00100000-56a8-7681-6d64-998af570e99b	00090000-56a8-7681-1858-ae4b04e5f018	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-8ffa-0f0691d4758b	000d0000-56a8-7681-0077-155b9efe21f4	\N	00090000-56a8-7681-296f-f4d72b893328	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a8-7681-4190-5df8db03276e	000d0000-56a8-7681-fe33-c9b78627b327	\N	00090000-56a8-7681-296f-f4d72b893328	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-0987-2d41541decaa	000d0000-56a8-7681-fe33-c9b78627b327	00100000-56a8-7681-6d64-998af570e99b	00090000-56a8-7681-1858-ae4b04e5f018	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a8-7681-5a05-ea9350338e85	000d0000-56a8-7681-6a17-8b38a4304604	\N	00090000-56a8-7681-296f-f4d72b893328	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-7174-c4550e03d77c	000d0000-56a8-7681-9185-11ffecc0b555	\N	00090000-56a8-7681-9267-32ea1aabd262	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-2512-25c329222de7	000d0000-56a8-7681-a9e8-f8a064948749	\N	00090000-56a8-7681-9267-32ea1aabd262	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-1c5d-c6d4a285d42a	000d0000-56a8-7681-a9e8-f8a064948749	00100000-56a8-7681-9891-74ddeba19635	00090000-56a8-7681-2815-c18c4ee6471d	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a8-7681-cdba-73859d560471	000d0000-56a8-7681-de97-9f93cd6f448c	\N	00090000-56a8-7681-894e-806be774318a	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a8-7681-af9a-3c9fcc21b777	000d0000-56a8-7681-de97-9f93cd6f448c	\N	00090000-56a8-7681-17f6-c6a055805e1c	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a8-7681-4338-291c903e7da0	000d0000-56a8-7681-d10f-bcb78a05a0a2	\N	00090000-56a8-7681-9267-32ea1aabd262	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a8-7681-9c20-a898fa143465	000d0000-56a8-7681-d10f-bcb78a05a0a2	00100000-56a8-7681-9891-74ddeba19635	00090000-56a8-7681-2815-c18c4ee6471d	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a8-7681-dcdd-5f0d579bc5d9	000d0000-56a8-7681-d10f-bcb78a05a0a2	\N	00090000-56a8-7681-17f6-c6a055805e1c	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a8-7681-f146-462fbfd83664	000d0000-56a8-7681-d10f-bcb78a05a0a2	\N	00090000-56a8-7681-894e-806be774318a	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a8-7681-96d7-dcac6439c236	000d0000-56a8-7681-1c00-ac479e23d47d	\N	00090000-56a8-7681-9267-32ea1aabd262	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a8-7681-0f30-9a0a2c4ef0f3	000d0000-56a8-7681-d712-6b602dc77b2a	00100000-56a8-7681-9891-74ddeba19635	00090000-56a8-7681-2815-c18c4ee6471d	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a8-7681-7ec3-1d717f6ac346	000d0000-56a8-7681-d712-6b602dc77b2a	\N	00090000-56a8-7681-296f-f4d72b893328	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 40670105)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 40669496)
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
-- TOC entry 3191 (class 0 OID 40669982)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a8-7681-adea-6469dd4a1bf5	00160000-56a8-7680-767d-aab2b2ad53ef	00090000-56a8-7681-17f6-c6a055805e1c	aizv	10	t
003d0000-56a8-7681-ec94-dd4ff2d5924b	00160000-56a8-7680-767d-aab2b2ad53ef	00090000-56a8-7681-98d2-4d94b1369d92	apri	14	t
003d0000-56a8-7681-0592-71b218b36d10	00160000-56a8-7680-3d27-465e86a958e4	00090000-56a8-7681-894e-806be774318a	aizv	11	t
003d0000-56a8-7681-3483-9984f9855845	00160000-56a8-7680-0b06-574ce2a1f349	00090000-56a8-7681-dd72-5d79c57a212c	aizv	12	t
003d0000-56a8-7681-0332-871fe6209eb7	00160000-56a8-7680-767d-aab2b2ad53ef	00090000-56a8-7681-296f-f4d72b893328	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 40670012)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a8-7680-767d-aab2b2ad53ef	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a8-7680-3d27-465e86a958e4	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a8-7680-0b06-574ce2a1f349	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 40670424)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 40669818)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 40669744)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a8-7681-0305-40ce7617a674	\N	\N	\N	\N	00440000-56a8-7681-0a35-59922fb31d86	00220000-56a8-7681-be57-a829732f7c04	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a8-7681-6d60-f3e15e990538	\N	\N	\N	\N	00440000-56a8-7681-fdf1-c21aaf8b0aa1	00220000-56a8-7681-eec9-abcf6ab845e5	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a8-7681-4e79-2c89ee048d1a	\N	\N	\N	001e0000-56a8-7681-e321-0f94a7596a02	\N	00220000-56a8-7681-be57-a829732f7c04	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a8-7681-76f3-c6be521d5e3e	\N	\N	\N	001e0000-56a8-7681-9095-b944ab1dc9d9	\N	00220000-56a8-7681-eec9-abcf6ab845e5	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a8-7681-860e-888039417baa	\N	00200000-56a8-7681-83e1-e3d575414741	\N	\N	\N	00220000-56a8-7681-c1d5-baf09adf7e1c	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N
00180000-56a8-7681-ce5a-0f91bdb7ac05	\N	00200000-56a8-7681-d12e-55495667b8f8	\N	\N	\N	00220000-56a8-7681-c1d5-baf09adf7e1c	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N
00180000-56a8-7681-b965-e097e337c629	\N	00200000-56a8-7681-62ff-2e282441aa5e	\N	\N	\N	00220000-56a8-7681-eec9-abcf6ab845e5	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N
00180000-56a8-7681-d51b-9cc059cbb58b	\N	00200000-56a8-7681-21eb-54070453e9b2	\N	\N	\N	00220000-56a8-7681-5a0e-c9e00ab9610d	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N
00180000-56a8-7681-27ba-401766013c92	\N	00200000-56a8-7681-ea04-b02c678faf1b	\N	\N	\N	00220000-56a8-7681-2450-6e33fd8e92a6	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N
00180000-56a8-7681-9ec1-8d353492090b	\N	00200000-56a8-7681-6948-7b41e7cda678	\N	\N	\N	00220000-56a8-7681-eec9-abcf6ab845e5	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N
00180000-56a8-7681-3a9d-df3b76b4ba4e	\N	00200000-56a8-7681-0b56-759f753f9e32	\N	\N	\N	00220000-56a8-7681-2450-6e33fd8e92a6	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N
00180000-56a8-7681-42f2-918255d32f79	\N	00200000-56a8-7681-af67-f25c86d41d48	\N	\N	\N	00220000-56a8-7681-2450-6e33fd8e92a6	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N
00180000-56a8-7681-cd03-338d2f4591d2	\N	00200000-56a8-7681-dd44-52af319391f4	\N	\N	\N	00220000-56a8-7681-c1d5-baf09adf7e1c	001f0000-56a8-7680-87d4-9c097c39aa64	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N
00180000-56a8-7681-7aa7-e5b15443d8ef	001b0000-56a8-7681-0e8b-177fde7b7387	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-87d4-9c097c39aa64	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N
00180000-56a8-7681-69a5-f72094d1a585	001b0000-56a8-7681-45ec-284552c4a6c6	\N	\N	\N	\N	00220000-56a8-7681-eec9-abcf6ab845e5	001f0000-56a8-7680-87d4-9c097c39aa64	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N
00180000-56a8-7681-2a5b-627d6080865e	001b0000-56a8-7681-886a-1b32c32d6dd1	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-87d4-9c097c39aa64	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N
00180000-56a8-7681-3b45-83253d8d7165	001b0000-56a8-7681-9590-43ad6b1d2285	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N
00180000-56a8-7681-f9cb-9c6ac5cee236	001b0000-56a8-7681-a45a-96083906417f	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-89a9-ec0ce13dc084	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N
00180000-56a8-7681-1450-ebac1f5dfd7f	001b0000-56a8-7681-e0f0-363cf94376b0	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-89a9-ec0ce13dc084	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N
00180000-56a8-7681-11e7-6590d67a9dfc	001b0000-56a8-7681-4976-dcb955d90ae0	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-87d4-9c097c39aa64	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N
00180000-56a8-7681-aa22-cf921045237d	001b0000-56a8-7681-8f67-3a8809b50b89	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-89a9-ec0ce13dc084	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N
00180000-56a8-7681-a705-01971c8e4712	001b0000-56a8-7681-1970-fc3f1fcf7bbe	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N
00180000-56a8-7681-01d9-3e29501d6994	001b0000-56a8-7681-fcff-ae6a927654a5	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N
00180000-56a8-7681-00e2-458837c6625d	001b0000-56a8-7681-e5cc-07f51a99061c	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-89a9-ec0ce13dc084	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N
00180000-56a8-7681-5533-7a03a87fe188	001b0000-56a8-7681-2398-f1ad20332dc3	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-eb6e-fcfe88c4d9f3	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N
00180000-56a8-7681-fc39-0aef76c3b690	001b0000-56a8-7681-c3ff-9daa312d8592	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-eb6e-fcfe88c4d9f3	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N
00180000-56a8-7681-d9b3-457091a35ab0	001b0000-56a8-7681-3500-3683f551ffa8	\N	\N	\N	\N	00220000-56a8-7681-be57-a829732f7c04	001f0000-56a8-7680-89a9-ec0ce13dc084	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N
\.


--
-- TOC entry 3166 (class 0 OID 40669769)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a8-7681-e321-0f94a7596a02
001e0000-56a8-7681-9095-b944ab1dc9d9
\.


--
-- TOC entry 3167 (class 0 OID 40669774)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a8-7681-0a35-59922fb31d86
00440000-56a8-7681-fdf1-c21aaf8b0aa1
\.


--
-- TOC entry 3209 (class 0 OID 40670346)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 40669649)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a8-767e-58a1-4a0eb263ba27	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a8-767e-9447-89ba65a1852d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a8-767e-6ff4-2ffef3013706	AL	ALB	008	Albania 	Albanija	\N
00040000-56a8-767e-2584-c9c110d8f6ea	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a8-767e-51a9-06e3e32833f3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a8-767e-81e3-8255c33a8887	AD	AND	020	Andorra 	Andora	\N
00040000-56a8-767e-dd55-74f3fe8db431	AO	AGO	024	Angola 	Angola	\N
00040000-56a8-767e-0e51-17fce9d93db3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a8-767e-aad1-a4254deaabec	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a8-767e-4eb2-960c823cf364	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a8-767e-e41b-a4d1e880bb92	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a8-767e-349a-238d8c887b56	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a8-767e-c976-05a67754777e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a8-767e-f6ca-f21d7942ccc9	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a8-767e-8fc9-dea550b62e0a	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a8-767e-b0ba-da753e340a28	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a8-767e-dd21-d35e6827dcb3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a8-767e-7222-1f7163ecfa43	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a8-767e-4206-940906c52ac5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a8-767e-f43f-035eb93a1310	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a8-767e-61d7-d4e983786d8d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a8-767e-8f22-73a6a1a45efe	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a8-767e-a205-32fa26738da4	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a8-767e-fc48-0f137e1c4168	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a8-767e-8c8d-88f7dd0072c1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a8-767e-dbad-70df00c958a1	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a8-767e-18de-f39c98fb42b5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a8-767e-52e3-9ab07bde849c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a8-767e-c2b8-23624db981bf	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a8-767e-d050-60afd75dcf5d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a8-767e-150b-962ce33666b4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a8-767e-b20f-9a24faa39edb	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a8-767e-68e2-2492c1c1505b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a8-767e-f301-62bda413b320	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a8-767e-39e3-cc71f0800ded	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a8-767e-c805-b23d953c86d0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a8-767e-e6cd-4acd44f4ce90	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a8-767e-f5ce-4994fe8acff3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a8-767e-cbb4-8d7e125441b0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a8-767e-d85b-fd0176448254	CA	CAN	124	Canada 	Kanada	\N
00040000-56a8-767e-ead7-3f79cb643b9e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a8-767e-4e32-a0d0335643d5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a8-767e-46df-9338bb48aeef	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a8-767e-15b5-15d417147def	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a8-767e-7409-69123f26539b	CL	CHL	152	Chile 	Čile	\N
00040000-56a8-767e-4c32-4cba749f7042	CN	CHN	156	China 	Kitajska	\N
00040000-56a8-767e-5dcb-c7ee0002876f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a8-767e-2718-e364c56ff79e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a8-767e-87d3-522bfe12f1df	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a8-767e-3e80-dad75b2d1860	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a8-767e-9f4c-67bb561d3457	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a8-767e-3319-1a4cc197d644	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a8-767e-32fd-76fc3eed3bd6	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a8-767e-97a8-97d77b3363da	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a8-767e-83c6-c813ade1c0c8	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a8-767e-f311-f124231ebbc2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a8-767e-a6df-b162d1808d95	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a8-767e-ceeb-b75f1faa909c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a8-767e-ae1c-7f5d04d10d2a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a8-767e-551f-8412b8627410	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a8-767e-6267-684a1dca37d3	DK	DNK	208	Denmark 	Danska	\N
00040000-56a8-767e-f887-ac14304140b4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a8-767e-6047-99fa6f0a800b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a8-767e-672c-86907df2d1a1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a8-767e-56f4-15a9bd597d68	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a8-767e-4033-3f8c38b45570	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a8-767e-b445-4b1df162f3fc	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a8-767e-fe63-1596b709779e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a8-767e-efff-1d3a015b9110	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a8-767e-9093-a8a32a40b576	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a8-767e-878a-e5c41a8e30bf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a8-767e-fb0e-40b2aa8f0825	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a8-767e-37a5-7f2a2e22da9a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a8-767e-05aa-a8bce74286e9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a8-767e-ded1-70551b0071c1	FI	FIN	246	Finland 	Finska	\N
00040000-56a8-767e-8d2e-6447b0ac409d	FR	FRA	250	France 	Francija	\N
00040000-56a8-767e-740a-e20ffe28439a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a8-767e-e871-ff4edcbc84d4	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a8-767e-fec3-5b9a0c323d73	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a8-767e-cf75-03a870d90298	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a8-767e-ee5e-de0082d8b5c8	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a8-767e-aa8e-d3a10e87f6da	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a8-767e-ef67-20ad49254658	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a8-767e-013c-9ed96c7f1e6b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a8-767e-6bcc-9ed4a05bbced	GH	GHA	288	Ghana 	Gana	\N
00040000-56a8-767e-70c1-9d2be8823aeb	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a8-767e-3bb6-0342e628ae3e	GR	GRC	300	Greece 	Grčija	\N
00040000-56a8-767e-1839-8b3a5467e757	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a8-767e-c94c-c291af37cb77	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a8-767e-97f6-a3d61f336a98	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a8-767e-c96f-1a9573b91e97	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a8-767e-0c4a-be74c7b20fff	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a8-767e-e16b-fbc9240b7086	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a8-767e-218e-237a647f7134	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a8-767e-ebfd-539f74c2cd35	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a8-767e-0bb1-729a854f5b6b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a8-767e-00f5-93dce05a61b5	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a8-767e-ef17-321c78a1b2f8	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a8-767e-04cd-a649c0074b32	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a8-767e-6d41-e63a69186a8b	HN	HND	340	Honduras 	Honduras	\N
00040000-56a8-767e-5693-bc3c17a5505c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a8-767e-9974-e51171358391	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a8-767e-efd2-a7d77af87b8a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a8-767e-4f86-82398d4ae85d	IN	IND	356	India 	Indija	\N
00040000-56a8-767e-834c-3bd175ef40e4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a8-767e-bb17-0839541a7725	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a8-767e-448e-c66fc4f4f730	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a8-767e-4fac-7265b44e8230	IE	IRL	372	Ireland 	Irska	\N
00040000-56a8-767e-34f3-411b0b5513e4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a8-767e-580b-7bdb7ea4efcf	IL	ISR	376	Israel 	Izrael	\N
00040000-56a8-767e-1fe9-8c09c61d1595	IT	ITA	380	Italy 	Italija	\N
00040000-56a8-767e-2594-1d6d3a98527e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a8-767e-373c-986c76d0c734	JP	JPN	392	Japan 	Japonska	\N
00040000-56a8-767e-30ff-dfae4d3fce5b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a8-767e-7faf-e6e8b4f1919e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a8-767e-34be-091aaea3c478	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a8-767e-c231-d0468f4cfa76	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a8-767e-a6f9-2389fe059a83	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a8-767e-ecf2-bcd3b4b0d578	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a8-767e-3329-efc8cf5a99bd	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a8-767e-d10a-a0e6b8fd070d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a8-767e-409b-b9e5a9a64da3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a8-767e-a675-cd1e7f903b7e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a8-767e-57b6-00716f392148	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a8-767e-d320-1c27a1fd9f93	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a8-767e-74a8-d1a83124e9d2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a8-767e-0cb5-9b7de9fde420	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a8-767e-03eb-e18f5202a677	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a8-767e-2e26-afa03a0e5e94	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a8-767e-9ec4-2d1d1d371ef7	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a8-767e-b13c-fa7edb08d256	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a8-767e-4750-d875ae85f814	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a8-767e-899f-2c358dd905c7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a8-767e-b7d6-0b0b67e48269	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a8-767e-bc7e-285cf444de86	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a8-767e-069a-e6169a5a5246	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a8-767e-8c25-9e54d47ab8d7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a8-767e-1581-107b4af1438f	ML	MLI	466	Mali 	Mali	\N
00040000-56a8-767e-25c4-a86bfe73c357	MT	MLT	470	Malta 	Malta	\N
00040000-56a8-767e-1b7a-7c3f9e8b737b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a8-767e-285c-6618c1955c4f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a8-767e-33f5-730657dab40e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a8-767e-6706-12dc6ab05fe4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a8-767e-be86-9e855e8a7b52	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a8-767e-bf9e-5e569c375776	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a8-767e-0907-d0898336fe59	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a8-767e-d88c-941951da0078	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a8-767e-c80f-dcb1a2a2a176	MC	MCO	492	Monaco 	Monako	\N
00040000-56a8-767e-c841-53fd3fae1570	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a8-767e-2ab9-ea39b3ac2891	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a8-767e-dcef-d39b646243b0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a8-767e-2bb5-7f63f1d3a69e	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a8-767e-d687-6701a7767154	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a8-767e-add7-3470731d0dd1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a8-767e-bc9c-ec19cfd1819a	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a8-767e-9657-f662af897aa2	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a8-767e-9962-ae4861c30a47	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a8-767e-bd88-dbd913e768d0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a8-767e-3fca-9a919ace1750	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a8-767e-72f6-fc11fecb94ae	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a8-767e-c33e-cdb53f35e8fd	NE	NER	562	Niger 	Niger 	\N
00040000-56a8-767e-3b55-b3d2467b2ec0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a8-767e-05c8-7b6159221a4c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a8-767e-9335-888c4abbae0a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a8-767e-bf2d-ea32df9a7881	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a8-767e-754d-99ddddcfc47a	NO	NOR	578	Norway 	Norveška	\N
00040000-56a8-767e-a5d3-1105faa12519	OM	OMN	512	Oman 	Oman	\N
00040000-56a8-767e-7048-b21a051f426e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a8-767e-0d6a-53e25aa0434d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a8-767e-172b-0a4ea8e3a780	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a8-767e-cafe-989950ea0ad6	PA	PAN	591	Panama 	Panama	\N
00040000-56a8-767e-67b4-18db7313cb8a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a8-767e-fc21-3155c0f100bf	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a8-767e-82fa-def1c0e167b7	PE	PER	604	Peru 	Peru	\N
00040000-56a8-767e-c10f-65ac3586925e	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a8-767e-2f2d-4b7fdd851f92	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a8-767e-ba58-97976ed91836	PL	POL	616	Poland 	Poljska	\N
00040000-56a8-767e-d555-fdbc98a44d72	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a8-767e-ea1c-a7908e455cf0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a8-767e-0820-027e1368cb93	QA	QAT	634	Qatar 	Katar	\N
00040000-56a8-767e-8638-b01c84352fe8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a8-767e-803f-4edd53602d58	RO	ROU	642	Romania 	Romunija	\N
00040000-56a8-767e-d813-eee31a22ddc0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a8-767e-7c4f-a9affa629eee	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a8-767e-2090-63bb0db3d894	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a8-767e-f9c2-f1c8d97ccc8b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a8-767e-88b6-c1ad67b6ea33	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a8-767e-039b-d1493d93d383	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a8-767e-cf23-9ef6395e1866	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a8-767e-126e-07d3b63afacd	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a8-767e-7274-94c45bdb38ab	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a8-767e-3ce2-20e3d81d12ef	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a8-767e-1057-da925b47bca6	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a8-767e-7b22-fd252872b5fb	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a8-767e-b526-81227eafa23d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a8-767e-bc6b-011f96ab5237	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a8-767e-c5b5-6573d4c402a2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a8-767e-12e1-6c45f4ad6f48	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a8-767e-a0da-682ee39fe2b5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a8-767e-d443-39f9438e2305	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a8-767e-6f30-3ebd558e8e91	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a8-767e-d223-2b48b9830c75	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a8-767e-0497-53d49136f1d5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a8-767e-d4f2-8ca1b06d38da	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a8-767e-b803-d8770ea46860	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a8-767e-ac83-e8d06eab156e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a8-767e-ea37-dc708db0c685	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a8-767e-e476-9c6cb141de3f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a8-767e-1258-c18121bdc62b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a8-767e-685a-6a1e392a60ff	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a8-767e-d17b-e834457216b2	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a8-767e-b999-8c51dd144fd9	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a8-767e-89a2-6a3ede7a6fb2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a8-767e-79af-6948dee521ed	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a8-767e-1b0e-d38d8171a9b8	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a8-767e-9d2f-94a3c0469e0a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a8-767e-c7eb-6d01b2f51114	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a8-767e-4d3b-57e664050a47	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a8-767e-1f13-c03711c73d03	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a8-767e-ebd9-a1c379b94806	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a8-767e-1efd-1a8f4f6440f5	TH	THA	764	Thailand 	Tajska	\N
00040000-56a8-767e-2037-e8292e2b628a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a8-767e-2e83-6acd31efa150	TG	TGO	768	Togo 	Togo	\N
00040000-56a8-767e-719f-c3e8899a4504	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a8-767e-25ca-66d8e72f8c80	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a8-767e-4a69-97fbdc86e6ca	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a8-767e-6539-e45f7e2390b4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a8-767e-e555-542c75437812	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a8-767e-dc64-1e4a7cfd7fa9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a8-767e-8bd9-80ffc3f92a1e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a8-767e-1515-28b6ffa53865	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a8-767e-fe52-ba3cf89a934f	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a8-767e-1619-5369d20ac0df	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a8-767e-44a6-e11af835c939	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a8-767e-5c85-4bd9f9dc21fb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a8-767e-1364-39399fc66318	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a8-767e-88f1-ff6231a8de8f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a8-767e-0e3d-6f6203ed8da3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a8-767e-257c-0013c664487f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a8-767e-77f1-09cf9a5266a4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a8-767e-7a07-cc5b7add9ec0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a8-767e-4f04-5c0d244da04f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a8-767e-24cf-7b599c0ecfd4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a8-767e-3f82-b4bef296a953	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a8-767e-ffeb-954689480bf3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a8-767e-2dd1-df14b329886b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a8-767e-9a73-a292ce09520f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a8-767e-efa8-d11cc61f6cb1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a8-767e-0a93-cbfd83f7186f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 40670134)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a8-7681-61c4-d5967f1890a2	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a8-7681-e132-9480f1d705dc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-7681-8589-fdd4f0505688	000e0000-56a8-7681-0011-85a56e1589e9	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-767e-c774-cc49b8a427a7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-7681-2c5b-d738adb964ae	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-767e-466f-f5adb7adb937	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-7681-468a-9de3104a0314	000e0000-56a8-7681-daaf-a93f0bbbf1fc	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-767e-c774-cc49b8a427a7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 40669940)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a8-7681-d2ea-dfd2dd627c45	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a8-767e-6a10-9ac7051f236f
000d0000-56a8-7681-dc70-850e7d24629b	000e0000-56a8-7681-1cdb-bdc8a313c64a	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-767e-7ef1-726cf97aae59
000d0000-56a8-7681-7144-7ce7031aa0f4	000e0000-56a8-7681-1cdb-bdc8a313c64a	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-8ef4-4e65c6a7d30e	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-a88a-678c42804c3c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-767e-7ef1-726cf97aae59
000d0000-56a8-7681-49a5-88edfc3f669d	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-4f73-4a4922d28936	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-b856-551fcd77d0d0	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-c6ff-a4ebb092e7c1	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a8-767e-b3b2-ff63650a870a
000d0000-56a8-7681-0260-5689caa6ea99	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-760d-de64971f7494	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a8-767e-6a10-9ac7051f236f
000d0000-56a8-7681-0688-1120715f6b07	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-f8ca-022e17116261	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a8-767e-6a10-9ac7051f236f
000d0000-56a8-7681-79c5-c0afdbbc22f3	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-5140-acfa29b9eb83	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-767e-7ef1-726cf97aae59
000d0000-56a8-7681-e6b4-1083300522be	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-0c03-5c7432a6109e	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a8-767e-7ef1-726cf97aae59
000d0000-56a8-7681-dc65-764da1f2730d	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-9c05-eab1c938cf9b	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a8-767e-0d60-bc9d1410989b
000d0000-56a8-7681-3082-54f37cb71258	000e0000-56a8-7681-f335-42a14c0a8bcc	000c0000-56a8-7681-bf9d-30afe6b83b43	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a8-767e-f9ac-cec1d70dc423
000d0000-56a8-7681-ea60-7d8caf5a1c4a	000e0000-56a8-7681-cc7c-134a58e59dd2	000c0000-56a8-7681-5a39-e72371b388d8	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-d13d-867c63a58555	000e0000-56a8-7681-4650-a7b28efa8756	000c0000-56a8-7681-7262-2005f2fb8cdd	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-56dd-b7e67bd74738	000e0000-56a8-7681-4650-a7b28efa8756	000c0000-56a8-7681-297b-4d9b61c3666c	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-0077-155b9efe21f4	000e0000-56a8-7681-6f12-683cf2623b84	000c0000-56a8-7681-7f52-efe553d11f55	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-fe33-c9b78627b327	000e0000-56a8-7681-d596-10eb2e2ad57d	000c0000-56a8-7681-4190-5df8db03276e	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-6a17-8b38a4304604	000e0000-56a8-7681-3e3d-01c7e5891743	000c0000-56a8-7681-5a05-ea9350338e85	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-9185-11ffecc0b555	000e0000-56a8-7681-15ac-447d1b51a162	000c0000-56a8-7681-7174-c4550e03d77c	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-a9e8-f8a064948749	000e0000-56a8-7681-445b-4dcc93503f17	000c0000-56a8-7681-2512-25c329222de7	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-de97-9f93cd6f448c	000e0000-56a8-7681-d3c0-2fb326fc928c	000c0000-56a8-7681-cdba-73859d560471	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-d10f-bcb78a05a0a2	000e0000-56a8-7681-d3c0-2fb326fc928c	000c0000-56a8-7681-4338-291c903e7da0	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-1c00-ac479e23d47d	000e0000-56a8-7681-5a29-cdeab98ab258	000c0000-56a8-7681-96d7-dcac6439c236	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
000d0000-56a8-7681-d712-6b602dc77b2a	000e0000-56a8-7681-5a29-cdeab98ab258	000c0000-56a8-7681-0f30-9a0a2c4ef0f3	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a8-767e-0c20-16900caa181e
\.


--
-- TOC entry 3162 (class 0 OID 40669718)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40669689)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 40669666)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a8-7681-d348-88ced6347d25	00080000-56a8-7681-4696-7e71e7445b61	00090000-56a8-7681-fec1-54096ed15586	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 40669854)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 40670404)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a8-7681-c40d-298f320cb8ac	00010000-56a8-767f-dbb5-1f91cd9b57d9	\N	Prva mapa	Root mapa	2016-01-27 08:49:21	2016-01-27 08:49:21	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 40670417)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 40670439)
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
-- TOC entry 3180 (class 0 OID 40669878)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 40669623)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a8-767f-43a9-c23532a5af9f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a8-767f-0d6f-7891b05c5438	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a8-767f-7c06-be15729b1c0f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a8-767f-2405-37985eb5f38a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a8-767f-8bc8-61acae2b1d06	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a8-767f-51c4-d1cde5236151	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a8-767f-9150-78514499ff94	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a8-767f-9702-257ebb2f355a	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a8-767f-4e75-8fb7d1824875	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a8-767f-abe5-21709aa1048c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a8-767f-3b52-306964b3129c	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a8-767f-e998-c04a80bf31c8	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a8-767f-3ab2-21f32c6b1c20	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a8-767f-f8a2-41adb798114f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a8-767f-9ce7-d7da12f22fc1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a8-767f-cc1a-08de24187da7	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a8-767f-479e-911f4a032ad0	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a8-7680-33e4-00e329bc3882	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a8-7680-1e44-11f0789f817e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a8-7680-4fd0-f68da5ff2a66	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a8-7680-0b9f-1f4a17ffe2b3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a8-7680-60ee-caa03e15eeea	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a8-7683-4d76-77adcd634934	application.tenant.maticnopodjetje	string	s:36:"00080000-56a8-7683-aac9-0bb322554b8a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 40669523)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a8-7680-a7da-edbe7758696b	00000000-56a8-7680-33e4-00e329bc3882	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a8-7680-a88f-ac01ef56199c	00000000-56a8-7680-33e4-00e329bc3882	00010000-56a8-767f-dbb5-1f91cd9b57d9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a8-7680-3b56-7d4af392ed11	00000000-56a8-7680-1e44-11f0789f817e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 40669590)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a8-7681-4843-c43a0c56698c	\N	00100000-56a8-7681-3734-16b6cde20bd9	00100000-56a8-7681-9891-74ddeba19635	01	Gledališče Nimbis
00410000-56a8-7681-51cc-db29f64f69a6	00410000-56a8-7681-4843-c43a0c56698c	00100000-56a8-7681-3734-16b6cde20bd9	00100000-56a8-7681-9891-74ddeba19635	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 40669534)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a8-7681-590a-864ef44ff108	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a8-7681-d35f-6849dfac302f	00010000-56a8-7681-e372-1c8fa8cfb311	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a8-7681-2815-c18c4ee6471d	00010000-56a8-7681-fba9-c3bc890e2c4b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a8-7681-8887-141ec14678f9	00010000-56a8-7681-6504-6a50966540f1	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a8-7681-be5e-48d26c121e72	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a8-7681-10a6-745c2af4d49b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a8-7681-68c3-9bb911547fb3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a8-7681-1858-ae4b04e5f018	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a8-7681-fec1-54096ed15586	00010000-56a8-7681-53e8-a27a05a13c70	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a8-7681-5739-40cb99dff9c2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a8-7681-509c-f9a0199683f5	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-7681-ad72-5114220ffbd6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a8-7681-9267-32ea1aabd262	00010000-56a8-7681-1405-510aa19ba8f6	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-7681-17f6-c6a055805e1c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-7681-98d2-4d94b1369d92	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-7681-894e-806be774318a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-7681-dd72-5d79c57a212c	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-7681-296f-f4d72b893328	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-7681-1af0-30da3530b0b4	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-7681-eec4-d51b4641b0f2	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-7681-daca-570c0b674fac	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 40669468)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a8-767e-3f3d-f2134410d75a	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a8-767e-16aa-55a46a05c60e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a8-767e-7d0b-2c2c6377d653	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a8-767e-4c77-e2854be5b8e9	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a8-767e-57db-6e990a80ffe8	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a8-767e-6af8-1ddb220ab43d	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a8-767e-ca8b-6d8a72b49253	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a8-767e-40da-7d68289a58fe	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a8-767e-08a8-df499c5b91a7	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a8-767e-8486-c44b2ab2dc32	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a8-767e-d6c5-d052b25fd18f	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a8-767e-706a-1b85b971fee1	Abonma-read	Abonma - branje	t
00030000-56a8-767e-b9dd-92f18cdeb529	Abonma-write	Abonma - spreminjanje	t
00030000-56a8-767e-e750-531e29b29587	Alternacija-read	Alternacija - branje	t
00030000-56a8-767e-f9b9-1dcb73b66000	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a8-767e-53fa-3a9a1b262eb9	Arhivalija-read	Arhivalija - branje	t
00030000-56a8-767e-5291-ec3e8610f076	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a8-767e-cf7c-7f08de879610	AuthStorage-read	AuthStorage - branje	t
00030000-56a8-767e-b3e6-e229b9240c26	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a8-767e-1f96-a3ffcb4f9203	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a8-767e-8654-5681d534f92f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a8-767e-a389-5269d5c5faa0	Besedilo-read	Besedilo - branje	t
00030000-56a8-767e-d14e-1e6ef8d45330	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a8-767e-fcc0-3a378e961aa5	Dodatek-read	Dodatek - branje	t
00030000-56a8-767e-cd4c-c5c9b214fd8a	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a8-767e-3742-188e5146a1c5	Dogodek-read	Dogodek - branje	t
00030000-56a8-767e-8a92-1a5b4c382b3f	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a8-767e-2ab7-3f402b539df1	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a8-767e-5e4c-e5bf1f6e82c3	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a8-767e-5ee8-72e741dac96c	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a8-767e-3bf2-8428bf42b671	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a8-767e-8f9e-0b8283dd0c0b	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a8-767e-b17c-d14f5af0ce8a	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a8-767e-6515-ddf7a8402ffc	DrugiVir-read	DrugiVir - branje	t
00030000-56a8-767e-71fa-b1bd33c9687f	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a8-767e-ea7e-ebd849a4065b	Drzava-read	Drzava - branje	t
00030000-56a8-767e-5f03-455e6de8adfc	Drzava-write	Drzava - spreminjanje	t
00030000-56a8-767e-eaf3-b45c2f70b08a	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a8-767e-e3a1-754ec3418427	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a8-767e-926a-b8cd71727fbb	Funkcija-read	Funkcija - branje	t
00030000-56a8-767e-20d2-f38cf5f58bb6	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a8-767e-3f3c-da7b44ade29b	Gostovanje-read	Gostovanje - branje	t
00030000-56a8-767e-ad5d-cd47ef3e8ef8	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a8-767e-520c-3034e78ce062	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a8-767e-3c7e-e6c9438f29d9	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a8-767e-fbe6-fc49f020576f	Kupec-read	Kupec - branje	t
00030000-56a8-767e-6e6a-b1b9f139c97e	Kupec-write	Kupec - spreminjanje	t
00030000-56a8-767e-de57-c04dd5951460	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a8-767e-f04a-9072b0b89706	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a8-767e-eb8a-9d2a5999073a	Option-read	Option - branje	t
00030000-56a8-767e-4583-847cdb2b8625	Option-write	Option - spreminjanje	t
00030000-56a8-767e-323a-588625b130a1	OptionValue-read	OptionValue - branje	t
00030000-56a8-767e-cf6d-22589c05a930	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a8-767e-c0cb-f7ebb9f71385	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a8-767e-0a16-53fbe3591545	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a8-767e-0b35-3f7855429932	Oseba-read	Oseba - branje	t
00030000-56a8-767e-fc2e-2ae6edc691af	Oseba-write	Oseba - spreminjanje	t
00030000-56a8-767e-51c4-c72fcd5f550d	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a8-767e-8c02-45312a9c034e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a8-767e-5f3b-a32599435d1c	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a8-767e-0429-21f5c63f6bf5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a8-767e-ada3-c6111c441418	Pogodba-read	Pogodba - branje	t
00030000-56a8-767e-e0f2-b4524088f22b	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a8-767e-e8f1-f9aceac36022	Popa-read	Popa - branje	t
00030000-56a8-767e-04e6-13f570729d75	Popa-write	Popa - spreminjanje	t
00030000-56a8-767e-dbf3-3f8d4dd827fa	Posta-read	Posta - branje	t
00030000-56a8-767e-8d86-6f19a6f167cf	Posta-write	Posta - spreminjanje	t
00030000-56a8-767e-6530-2a1cd6cee763	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a8-767e-d1cc-076ac133cdc9	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a8-767e-7e51-c6e2ce0321c3	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a8-767e-c526-dbdcab59ef3e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a8-767e-0b6e-e1b068fb5256	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a8-767e-350e-363158ec56da	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a8-767e-f343-7e6e2c41cfe5	Praznik-read	Praznik - branje	t
00030000-56a8-767e-6676-0aa25d13d9e0	Praznik-write	Praznik - spreminjanje	t
00030000-56a8-767e-389c-d331e349ed6c	Predstava-read	Predstava - branje	t
00030000-56a8-767e-c082-6554ca1d7f54	Predstava-write	Predstava - spreminjanje	t
00030000-56a8-767e-dd93-e625d0df36ae	Ura-read	Ura - branje	t
00030000-56a8-767e-6974-917661414e02	Ura-write	Ura - spreminjanje	t
00030000-56a8-767e-44f6-cb605bbc23d9	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a8-767e-e81e-c2c8af3fcbcb	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a8-767e-44ce-8427225d2031	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a8-767e-db96-ba2e3d440ce6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a8-767e-fc4d-787cc566ea1d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a8-767e-458f-e9631732bbda	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a8-767e-3e1b-1fd55cdd6d77	ProgramDela-read	ProgramDela - branje	t
00030000-56a8-767e-902d-5b86f77c811c	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a8-767e-418e-beee0d6f68b2	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a8-767e-7b03-af1db80b9899	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a8-767e-da84-d1693465e931	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a8-767e-699f-88cb602e1fbd	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a8-767e-c4ae-0aa61deb89e0	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a8-767e-79ec-55132bb85fcc	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a8-767e-3abc-be4eafdc5881	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a8-767e-4086-6eb12ea9e595	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a8-767e-eb74-cd7d51c7aecc	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a8-767e-7760-3561374df47d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a8-767e-4d84-811ea65bd5f3	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a8-767e-5efa-a99e3c61d6a7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a8-767e-bb15-4e4b8f9c1e48	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a8-767e-af82-21ce29f07e6a	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a8-767e-b701-2726d1ca2b76	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a8-767e-204e-5238090cc094	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a8-767e-5e63-d306c97da781	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a8-767e-e478-f294fead3299	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a8-767e-68d9-dd2916c5778b	Prostor-read	Prostor - branje	t
00030000-56a8-767e-3d12-69f545af7cd4	Prostor-write	Prostor - spreminjanje	t
00030000-56a8-767e-d935-a8c73b5fbce7	Racun-read	Racun - branje	t
00030000-56a8-767e-d38e-fdcac8404b26	Racun-write	Racun - spreminjanje	t
00030000-56a8-767e-69a2-8b467e36a8c0	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a8-767e-b5a4-cc4335541acc	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a8-767e-55a0-d596eaf97c8b	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a8-767e-229d-846b73d4e0d0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a8-767e-ff90-483229aec5ec	Rekvizit-read	Rekvizit - branje	t
00030000-56a8-767e-9519-eb7d66d7baf4	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a8-767e-f209-0e1e12692114	Revizija-read	Revizija - branje	t
00030000-56a8-767e-7bcd-cd749dc129b7	Revizija-write	Revizija - spreminjanje	t
00030000-56a8-767e-5617-1f6a2baeb2a7	Rezervacija-read	Rezervacija - branje	t
00030000-56a8-767e-8a0f-03c4352e4425	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a8-767e-4ffd-49a5e6dea4f6	SedezniRed-read	SedezniRed - branje	t
00030000-56a8-767e-aa91-82a15b02e498	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a8-767e-0d4d-d839b8955507	Sedez-read	Sedez - branje	t
00030000-56a8-767e-2f65-4c0822c67f74	Sedez-write	Sedez - spreminjanje	t
00030000-56a8-767e-1b8d-6701865ad4ed	Sezona-read	Sezona - branje	t
00030000-56a8-767e-a18f-0b26d85d7606	Sezona-write	Sezona - spreminjanje	t
00030000-56a8-767e-b9a4-44edb59ef706	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a8-767e-3ae5-ea5d8d9a93cb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a8-767e-6a76-0a9f51c84b1d	Telefonska-read	Telefonska - branje	t
00030000-56a8-767e-9629-337c66ba901d	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a8-767e-aef0-aa90b7e92fc1	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a8-767e-1417-8b069881eb21	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a8-767e-bd6d-db77d84492c9	TipDodatka-read	TipDodatka - branje	t
00030000-56a8-767e-01f3-4aea6f2ad000	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a8-767e-e9ff-07618a2350e5	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a8-767e-c6e2-b91d2236c809	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a8-767e-d4c6-c487e38237c3	TipPopa-read	TipPopa - branje	t
00030000-56a8-767e-6788-3794ceadb485	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a8-767e-71c7-2b9f7c7307d6	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a8-767e-5a05-7fbd982b76fe	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a8-767e-4223-5584da0e5686	TipVaje-read	TipVaje - branje	t
00030000-56a8-767e-f795-1b2ddbc67c97	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a8-767e-683a-fbfe445c8aa9	Trr-read	Trr - branje	t
00030000-56a8-767e-9451-3adcc8c620ca	Trr-write	Trr - spreminjanje	t
00030000-56a8-767e-41ed-0bd086835a9e	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a8-767e-a7b1-5c60b5516820	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a8-767e-9edb-aa02895f96d8	Vaja-read	Vaja - branje	t
00030000-56a8-767e-2872-bc2fa1b9142a	Vaja-write	Vaja - spreminjanje	t
00030000-56a8-767e-b6f0-13f7a3f0c32b	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a8-767e-7f68-e971c2ba8101	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a8-767e-a843-743f49566924	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a8-767e-2970-7424f4800a98	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a8-767e-8ff5-f3e7f88dd5db	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a8-767e-f872-ff766859bd23	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a8-767e-d840-41c799c6a71a	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a8-767e-e730-eaa157ebf7eb	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a8-767e-7680-4db87fff8b38	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a8-767e-86ef-991960bc6469	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a8-767e-2aed-028ab4773b02	Job-read	Branje opravil - samo zase - branje	t
00030000-56a8-767e-2870-6ffd234cbf3d	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a8-767e-45cd-f8138314c8ed	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a8-767e-704e-9e29540714a4	Report-read	Report - branje	t
00030000-56a8-767e-3229-202330efceef	Report-write	Report - spreminjanje	t
00030000-56a8-767e-a04c-69d8b3bfa454	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a8-767e-c35f-a1453da8ae2d	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a8-767e-b903-c9234161972f	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a8-767e-9672-88f2de623691	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a8-767e-ec63-b1598719e902	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a8-767e-f230-24b63d28ee01	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a8-767e-7eb1-35d437b45f9a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a8-767e-dabc-b003a7b194ac	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a8-767e-e3fa-aa1f23234feb	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a8-767e-a4d9-ae8cd56e35ae	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a8-767e-698f-a2313268eaac	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a8-767e-da07-6618f7be0581	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a8-767e-c5f6-27ebee0f11a1	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a8-767e-75a3-10d921f64fad	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a8-767e-e859-70f8c9d5faa2	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 40669487)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a8-767e-8744-335e6a488794	00030000-56a8-767e-16aa-55a46a05c60e
00020000-56a8-767e-8744-335e6a488794	00030000-56a8-767e-3f3d-f2134410d75a
00020000-56a8-767e-061a-157546b19834	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-8654-5681d534f92f
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-d14e-1e6ef8d45330
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-f514-30a37e930027	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767e-d543-b31e61306e42	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-767e-d543-b31e61306e42	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767e-d543-b31e61306e42	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-d543-b31e61306e42	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-d543-b31e61306e42	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767e-d543-b31e61306e42	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-1b11-a1bc4df5bf49	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767e-1b11-a1bc4df5bf49	00030000-56a8-767e-f872-ff766859bd23
00020000-56a8-767e-1b11-a1bc4df5bf49	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767e-1b11-a1bc4df5bf49	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-767e-1b11-a1bc4df5bf49	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-1b11-a1bc4df5bf49	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767e-1b11-a1bc4df5bf49	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767e-03e2-350fba77b475	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767e-03e2-350fba77b475	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767e-03e2-350fba77b475	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767e-a3c3-99a48df98728	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767e-a3c3-99a48df98728	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-a3c3-99a48df98728	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-a3c3-99a48df98728	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767e-a3c3-99a48df98728	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767e-a3c3-99a48df98728	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767e-a3c3-99a48df98728	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-a3c3-99a48df98728	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767e-5e03-27c752321124	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-5e03-27c752321124	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-5e03-27c752321124	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767e-5e03-27c752321124	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-9451-3adcc8c620ca
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-350e-363158ec56da
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-9629-337c66ba901d
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-44b0-aeb028e5b57b	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-5529-997b8f71d079	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-5529-997b8f71d079	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767e-5529-997b8f71d079	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767e-5529-997b8f71d079	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767e-5529-997b8f71d079	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767e-5529-997b8f71d079	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-5529-997b8f71d079	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-9629-337c66ba901d
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-350e-363158ec56da
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-9451-3adcc8c620ca
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-04e6-13f570729d75
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-3c7e-e6c9438f29d9
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-458f-e9631732bbda
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-fb7f-dfa015c44783	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-3eeb-214379b00c93	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767e-1226-4fd210c32732	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767e-1226-4fd210c32732	00030000-56a8-767e-6788-3794ceadb485
00020000-56a8-767e-3566-5c7651effbb6	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767e-a808-1b2ea12c19b8	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767e-a808-1b2ea12c19b8	00030000-56a8-767e-8d86-6f19a6f167cf
00020000-56a8-767e-04c5-3925abccd19d	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767e-7dfa-995f875ddfbc	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-7dfa-995f875ddfbc	00030000-56a8-767e-5f03-455e6de8adfc
00020000-56a8-767e-240d-5b73b7cbc7c6	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-3b13-e1635757b206	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-767e-3b13-e1635757b206	00030000-56a8-767e-86ef-991960bc6469
00020000-56a8-767e-a855-69f0dbf88b35	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-767e-d562-d1bdcf801d72	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767e-d562-d1bdcf801d72	00030000-56a8-767e-e730-eaa157ebf7eb
00020000-56a8-767e-e10b-79a43c6a75f2	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767e-ff1a-4676c5f4caf1	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-767e-ff1a-4676c5f4caf1	00030000-56a8-767e-b9dd-92f18cdeb529
00020000-56a8-767e-e542-24302fcaabfc	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-767e-9168-08ae195c5ad0	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767e-9168-08ae195c5ad0	00030000-56a8-767e-3d12-69f545af7cd4
00020000-56a8-767e-9168-08ae195c5ad0	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767e-9168-08ae195c5ad0	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767e-9168-08ae195c5ad0	00030000-56a8-767e-350e-363158ec56da
00020000-56a8-767e-9168-08ae195c5ad0	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-2f05-9bc6b55da835	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767e-2f05-9bc6b55da835	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767e-2f05-9bc6b55da835	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767e-c6cd-e7356a8456bb	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767e-c6cd-e7356a8456bb	00030000-56a8-767e-2970-7424f4800a98
00020000-56a8-767e-95a2-1a21ffd627ef	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-0a16-53fbe3591545
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767e-dc65-cbc728ff12ef	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767e-f667-1bd2f32937df	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767e-f667-1bd2f32937df	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767e-f667-1bd2f32937df	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-f667-1bd2f32937df	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-f667-1bd2f32937df	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767e-7d76-8a9550c20416	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-767e-7d76-8a9550c20416	00030000-56a8-767e-f795-1b2ddbc67c97
00020000-56a8-767e-bf81-13743c48d281	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-ca8b-6d8a72b49253
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-40da-7d68289a58fe
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-3e1b-1fd55cdd6d77
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-902d-5b86f77c811c
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-418e-beee0d6f68b2
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-7b03-af1db80b9899
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-da84-d1693465e931
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-699f-88cb602e1fbd
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-c4ae-0aa61deb89e0
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-79ec-55132bb85fcc
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-3abc-be4eafdc5881
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-4086-6eb12ea9e595
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-eb74-cd7d51c7aecc
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-7760-3561374df47d
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-4d84-811ea65bd5f3
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-5efa-a99e3c61d6a7
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-bb15-4e4b8f9c1e48
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-af82-21ce29f07e6a
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-b701-2726d1ca2b76
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-204e-5238090cc094
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-5e63-d306c97da781
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-e478-f294fead3299
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-db96-ba2e3d440ce6
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-71fa-b1bd33c9687f
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-d1cc-076ac133cdc9
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-2870-6ffd234cbf3d
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-6515-ddf7a8402ffc
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-44ce-8427225d2031
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-6530-2a1cd6cee763
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-2aed-028ab4773b02
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767e-125d-769f74908c31	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-3e1b-1fd55cdd6d77
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-418e-beee0d6f68b2
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-da84-d1693465e931
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-c4ae-0aa61deb89e0
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-3abc-be4eafdc5881
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-eb74-cd7d51c7aecc
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-4d84-811ea65bd5f3
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-bb15-4e4b8f9c1e48
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-b701-2726d1ca2b76
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-5e63-d306c97da781
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-44ce-8427225d2031
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-6515-ddf7a8402ffc
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-6530-2a1cd6cee763
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-2aed-028ab4773b02
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-8bc0-bd1f34dc386d	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-a7b1-5c60b5516820
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-8486-c44b2ab2dc32
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-2ad7-0209c8d4f64a	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767f-f3f1-51fc891d344b	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-83fb-16d0e6932247	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-83fb-16d0e6932247	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-83fb-16d0e6932247	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-83fb-16d0e6932247	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-767f-83fb-16d0e6932247	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-83fb-16d0e6932247	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-83fb-16d0e6932247	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-83fb-16d0e6932247	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-e0f2-b4524088f22b
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-3ae5-ea5d8d9a93cb
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-b339-c2fec4a497bd	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-d730-e0d0e8bb29a8	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-f1fe-2bad11b7a41e	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-f1fe-2bad11b7a41e	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-f1fe-2bad11b7a41e	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-f1fe-2bad11b7a41e	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767f-f1fe-2bad11b7a41e	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-f1fe-2bad11b7a41e	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-f1fe-2bad11b7a41e	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-b5b1-7a1c5f9c7ae1	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-b5b1-7a1c5f9c7ae1	00030000-56a8-767e-3ae5-ea5d8d9a93cb
00020000-56a8-767f-b5b1-7a1c5f9c7ae1	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-b5b1-7a1c5f9c7ae1	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-22cf-70e5782c0333	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-22cf-70e5782c0333	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-8654-5681d534f92f
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-d14e-1e6ef8d45330
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-6515-ddf7a8402ffc
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-71fa-b1bd33c9687f
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-8486-c44b2ab2dc32
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-2aed-028ab4773b02
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-2870-6ffd234cbf3d
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-e0f2-b4524088f22b
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-6530-2a1cd6cee763
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-d1cc-076ac133cdc9
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-44ce-8427225d2031
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-db96-ba2e3d440ce6
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-ca8b-6d8a72b49253
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-3e1b-1fd55cdd6d77
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-40da-7d68289a58fe
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-902d-5b86f77c811c
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-418e-beee0d6f68b2
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-7b03-af1db80b9899
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-da84-d1693465e931
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-699f-88cb602e1fbd
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-c4ae-0aa61deb89e0
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-79ec-55132bb85fcc
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-3abc-be4eafdc5881
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-4086-6eb12ea9e595
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-eb74-cd7d51c7aecc
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-7760-3561374df47d
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-4d84-811ea65bd5f3
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-5efa-a99e3c61d6a7
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-bb15-4e4b8f9c1e48
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-af82-21ce29f07e6a
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-b701-2726d1ca2b76
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-204e-5238090cc094
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-5e63-d306c97da781
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-e478-f294fead3299
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-3ae5-ea5d8d9a93cb
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-a7b1-5c60b5516820
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767f-6efc-f409f2294d6e	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-8654-5681d534f92f
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-d14e-1e6ef8d45330
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767f-78ce-78e01261502d	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-8654-5681d534f92f
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-d14e-1e6ef8d45330
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-8486-c44b2ab2dc32
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-a7b1-5c60b5516820
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767f-c956-c5a35f533a7c	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-8654-5681d534f92f
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-d14e-1e6ef8d45330
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-6515-ddf7a8402ffc
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-71fa-b1bd33c9687f
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-8486-c44b2ab2dc32
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-2aed-028ab4773b02
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-2870-6ffd234cbf3d
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-3c7e-e6c9438f29d9
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-e0f2-b4524088f22b
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-04e6-13f570729d75
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-6530-2a1cd6cee763
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-d1cc-076ac133cdc9
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-350e-363158ec56da
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-44ce-8427225d2031
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-db96-ba2e3d440ce6
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-458f-e9631732bbda
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-ca8b-6d8a72b49253
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-3e1b-1fd55cdd6d77
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-40da-7d68289a58fe
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-902d-5b86f77c811c
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-418e-beee0d6f68b2
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-7b03-af1db80b9899
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-da84-d1693465e931
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-699f-88cb602e1fbd
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-c4ae-0aa61deb89e0
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-79ec-55132bb85fcc
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-3abc-be4eafdc5881
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-4086-6eb12ea9e595
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-eb74-cd7d51c7aecc
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-7760-3561374df47d
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-4d84-811ea65bd5f3
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-5efa-a99e3c61d6a7
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-bb15-4e4b8f9c1e48
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-af82-21ce29f07e6a
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-b701-2726d1ca2b76
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-204e-5238090cc094
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-5e63-d306c97da781
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-e478-f294fead3299
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-3ae5-ea5d8d9a93cb
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-9629-337c66ba901d
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-9451-3adcc8c620ca
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-a7b1-5c60b5516820
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-f872-ff766859bd23
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767f-f2ca-ee6519d5b33a	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-8654-5681d534f92f
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-d14e-1e6ef8d45330
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-8486-c44b2ab2dc32
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-3c7e-e6c9438f29d9
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-04e6-13f570729d75
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-350e-363158ec56da
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-458f-e9631732bbda
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-9629-337c66ba901d
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-9451-3adcc8c620ca
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-a7b1-5c60b5516820
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-f872-ff766859bd23
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767f-0762-8e071a0df28b	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767f-5f6a-3e46c262375e	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-6515-ddf7a8402ffc
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-71fa-b1bd33c9687f
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-2aed-028ab4773b02
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-2870-6ffd234cbf3d
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-3c7e-e6c9438f29d9
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-0a16-53fbe3591545
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-e0f2-b4524088f22b
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-04e6-13f570729d75
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-6530-2a1cd6cee763
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-d1cc-076ac133cdc9
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-350e-363158ec56da
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-44ce-8427225d2031
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-db96-ba2e3d440ce6
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-458f-e9631732bbda
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-ca8b-6d8a72b49253
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-3e1b-1fd55cdd6d77
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-40da-7d68289a58fe
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-902d-5b86f77c811c
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-418e-beee0d6f68b2
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-7b03-af1db80b9899
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-da84-d1693465e931
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-699f-88cb602e1fbd
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-c4ae-0aa61deb89e0
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-79ec-55132bb85fcc
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-3abc-be4eafdc5881
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-4086-6eb12ea9e595
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-eb74-cd7d51c7aecc
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-7760-3561374df47d
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-4d84-811ea65bd5f3
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-5efa-a99e3c61d6a7
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-bb15-4e4b8f9c1e48
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-af82-21ce29f07e6a
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-b701-2726d1ca2b76
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-204e-5238090cc094
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-5e63-d306c97da781
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-e478-f294fead3299
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-3ae5-ea5d8d9a93cb
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-9629-337c66ba901d
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-9451-3adcc8c620ca
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-a843-743f49566924
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-2970-7424f4800a98
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-f872-ff766859bd23
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-767f-dfdb-4268cde6ff99	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3f3d-f2134410d75a
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-16aa-55a46a05c60e
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-706a-1b85b971fee1
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-b9dd-92f18cdeb529
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-53fa-3a9a1b262eb9
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5291-ec3e8610f076
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-cf7c-7f08de879610
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-b3e6-e229b9240c26
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-1f96-a3ffcb4f9203
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-8654-5681d534f92f
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-a389-5269d5c5faa0
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-d14e-1e6ef8d45330
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3742-188e5146a1c5
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-4c77-e2854be5b8e9
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-2ab7-3f402b539df1
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5e4c-e5bf1f6e82c3
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5ee8-72e741dac96c
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3bf2-8428bf42b671
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-8f9e-0b8283dd0c0b
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-b17c-d14f5af0ce8a
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-8a92-1a5b4c382b3f
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-6515-ddf7a8402ffc
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-71fa-b1bd33c9687f
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-ea7e-ebd849a4065b
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5f03-455e6de8adfc
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-eaf3-b45c2f70b08a
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e3a1-754ec3418427
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-8486-c44b2ab2dc32
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3f3c-da7b44ade29b
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-ad5d-cd47ef3e8ef8
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-45cd-f8138314c8ed
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-2aed-028ab4773b02
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-2870-6ffd234cbf3d
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-520c-3034e78ce062
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3c7e-e6c9438f29d9
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-fbe6-fc49f020576f
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-6e6a-b1b9f139c97e
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-7eb1-35d437b45f9a
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-f230-24b63d28ee01
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-c35f-a1453da8ae2d
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-b903-c9234161972f
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-9672-88f2de623691
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-ec63-b1598719e902
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-de57-c04dd5951460
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-f04a-9072b0b89706
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-eb8a-9d2a5999073a
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-323a-588625b130a1
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-cf6d-22589c05a930
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-d6c5-d052b25fd18f
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-4583-847cdb2b8625
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-c0cb-f7ebb9f71385
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-0a16-53fbe3591545
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-51c4-c72fcd5f550d
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-8c02-45312a9c034e
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5f3b-a32599435d1c
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-0429-21f5c63f6bf5
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e0f2-b4524088f22b
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-04e6-13f570729d75
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-dbf3-3f8d4dd827fa
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-6530-2a1cd6cee763
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-d1cc-076ac133cdc9
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-7e51-c6e2ce0321c3
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-c526-dbdcab59ef3e
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-8d86-6f19a6f167cf
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-350e-363158ec56da
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-f343-7e6e2c41cfe5
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-6676-0aa25d13d9e0
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-389c-d331e349ed6c
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-c082-6554ca1d7f54
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-44f6-cb605bbc23d9
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e81e-c2c8af3fcbcb
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-44ce-8427225d2031
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-db96-ba2e3d440ce6
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-fc4d-787cc566ea1d
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-458f-e9631732bbda
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-ca8b-6d8a72b49253
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3e1b-1fd55cdd6d77
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-40da-7d68289a58fe
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-902d-5b86f77c811c
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-418e-beee0d6f68b2
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-7b03-af1db80b9899
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-da84-d1693465e931
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-699f-88cb602e1fbd
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-c4ae-0aa61deb89e0
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-79ec-55132bb85fcc
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3abc-be4eafdc5881
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-4086-6eb12ea9e595
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-eb74-cd7d51c7aecc
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-7760-3561374df47d
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-4d84-811ea65bd5f3
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5efa-a99e3c61d6a7
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-bb15-4e4b8f9c1e48
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-af82-21ce29f07e6a
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-b701-2726d1ca2b76
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-204e-5238090cc094
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5e63-d306c97da781
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e478-f294fead3299
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-68d9-dd2916c5778b
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3d12-69f545af7cd4
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-d935-a8c73b5fbce7
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-d38e-fdcac8404b26
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-69a2-8b467e36a8c0
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-b5a4-cc4335541acc
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-55a0-d596eaf97c8b
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-229d-846b73d4e0d0
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-ff90-483229aec5ec
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-9519-eb7d66d7baf4
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-704e-9e29540714a4
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3229-202330efceef
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-f209-0e1e12692114
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-7bcd-cd749dc129b7
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5617-1f6a2baeb2a7
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-8a0f-03c4352e4425
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-4ffd-49a5e6dea4f6
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-aa91-82a15b02e498
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-0d4d-d839b8955507
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-2f65-4c0822c67f74
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-1b8d-6701865ad4ed
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-a18f-0b26d85d7606
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-a04c-69d8b3bfa454
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-3ae5-ea5d8d9a93cb
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-9629-337c66ba901d
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-aef0-aa90b7e92fc1
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-7d0b-2c2c6377d653
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-1417-8b069881eb21
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e9ff-07618a2350e5
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-c6e2-b91d2236c809
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-d4c6-c487e38237c3
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-6788-3794ceadb485
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-71c7-2b9f7c7307d6
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-5a05-7fbd982b76fe
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-4223-5584da0e5686
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-f795-1b2ddbc67c97
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-9451-3adcc8c620ca
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-a7b1-5c60b5516820
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-9edb-aa02895f96d8
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-2872-bc2fa1b9142a
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-b6f0-13f7a3f0c32b
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-7f68-e971c2ba8101
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-a843-743f49566924
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-2970-7424f4800a98
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-c5f6-27ebee0f11a1
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-da07-6618f7be0581
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-f872-ff766859bd23
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-d840-41c799c6a71a
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-e730-eaa157ebf7eb
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-7680-4db87fff8b38
00020000-56a8-7680-b376-890ddf7928b7	00030000-56a8-767e-86ef-991960bc6469
00020000-56a8-7680-67b0-e52258819413	00030000-56a8-767e-698f-a2313268eaac
00020000-56a8-7680-0fa0-ea4b9c326108	00030000-56a8-767e-a4d9-ae8cd56e35ae
00020000-56a8-7680-739f-4b3a0860942b	00030000-56a8-767e-a7b1-5c60b5516820
00020000-56a8-7680-83fe-3e1c34155c5a	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-7680-24c9-cb0cd002fc5c	00030000-56a8-767e-b903-c9234161972f
00020000-56a8-7680-23ca-ad62871dd052	00030000-56a8-767e-9672-88f2de623691
00020000-56a8-7680-7e40-9bba53079ab9	00030000-56a8-767e-ec63-b1598719e902
00020000-56a8-7680-cec0-34db18b3e842	00030000-56a8-767e-c35f-a1453da8ae2d
00020000-56a8-7680-37a8-9b9d298bd1b6	00030000-56a8-767e-7eb1-35d437b45f9a
00020000-56a8-7680-705b-26a2492d0cb2	00030000-56a8-767e-f230-24b63d28ee01
00020000-56a8-7680-80a8-1ec31c06b01f	00030000-56a8-767e-e3fa-aa1f23234feb
00020000-56a8-7680-a5e0-989c9b3e4fea	00030000-56a8-767e-dabc-b003a7b194ac
00020000-56a8-7680-9506-aa8ac324050d	00030000-56a8-767e-0b35-3f7855429932
00020000-56a8-7680-0dcb-092093e25d05	00030000-56a8-767e-fc2e-2ae6edc691af
00020000-56a8-7680-2339-06f24e281715	00030000-56a8-767e-57db-6e990a80ffe8
00020000-56a8-7680-315e-6ff04d9dbf25	00030000-56a8-767e-6af8-1ddb220ab43d
00020000-56a8-7680-7cde-f58fd4e8b232	00030000-56a8-767e-75a3-10d921f64fad
00020000-56a8-7680-39f6-39fb4e60d717	00030000-56a8-767e-e859-70f8c9d5faa2
00020000-56a8-7680-3264-af0750349b23	00030000-56a8-767e-e8f1-f9aceac36022
00020000-56a8-7680-3264-af0750349b23	00030000-56a8-767e-04e6-13f570729d75
00020000-56a8-7680-3264-af0750349b23	00030000-56a8-767e-41ed-0bd086835a9e
00020000-56a8-7680-70f7-add530f88957	00030000-56a8-767e-683a-fbfe445c8aa9
00020000-56a8-7680-8610-5222048c03bf	00030000-56a8-767e-9451-3adcc8c620ca
00020000-56a8-7680-7a27-aef08154e4be	00030000-56a8-767e-a04c-69d8b3bfa454
00020000-56a8-7680-8fa9-e354e75c6336	00030000-56a8-767e-6a76-0a9f51c84b1d
00020000-56a8-7680-b748-354346a86302	00030000-56a8-767e-9629-337c66ba901d
00020000-56a8-7680-a961-fbefe20845c7	00030000-56a8-767e-0b6e-e1b068fb5256
00020000-56a8-7680-1c3f-a200d94dbe50	00030000-56a8-767e-350e-363158ec56da
00020000-56a8-7680-c76b-574d363d5fd3	00030000-56a8-767e-8ff5-f3e7f88dd5db
00020000-56a8-7680-eae2-6138e94faad6	00030000-56a8-767e-f872-ff766859bd23
00020000-56a8-7680-19d8-03c6a25a12a8	00030000-56a8-767e-ada3-c6111c441418
00020000-56a8-7680-6330-499e0adbb028	00030000-56a8-767e-e0f2-b4524088f22b
00020000-56a8-7680-7d33-8fe3402f9838	00030000-56a8-767e-b9a4-44edb59ef706
00020000-56a8-7680-ec8e-ff3a721997b1	00030000-56a8-767e-3ae5-ea5d8d9a93cb
00020000-56a8-7680-af25-e98cf687b961	00030000-56a8-767e-e750-531e29b29587
00020000-56a8-7680-8503-8d1d0ef5ddb9	00030000-56a8-767e-f9b9-1dcb73b66000
00020000-56a8-7680-19ae-bb231088e10d	00030000-56a8-767e-08a8-df499c5b91a7
00020000-56a8-7680-4866-dd1b8a704a77	00030000-56a8-767e-926a-b8cd71727fbb
00020000-56a8-7680-dc1e-3bd23d496a28	00030000-56a8-767e-20d2-f38cf5f58bb6
00020000-56a8-7680-03b4-21829586b285	00030000-56a8-767e-8486-c44b2ab2dc32
\.


--
-- TOC entry 3181 (class 0 OID 40669885)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 40669920)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 40670053)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a8-7681-1008-96fe13da7146	00090000-56a8-7681-590a-864ef44ff108	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a8-7681-7ac6-9293f9ea5714	00090000-56a8-7681-10a6-745c2af4d49b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a8-7681-70ae-813d4c28c736	00090000-56a8-7681-9267-32ea1aabd262	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a8-7681-47c5-4709d447eb0f	00090000-56a8-7681-5739-40cb99dff9c2	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 40669570)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a8-7681-4696-7e71e7445b61	\N	00040000-56a8-767e-0497-53d49136f1d5	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-7681-6f83-8719a92fd886	\N	00040000-56a8-767e-0497-53d49136f1d5	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a8-7681-c7e4-4d062130c132	\N	00040000-56a8-767e-0497-53d49136f1d5	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-7681-e97e-950302aded71	\N	00040000-56a8-767e-0497-53d49136f1d5	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-7681-125c-95d74080f063	\N	00040000-56a8-767e-0497-53d49136f1d5	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-7681-f15d-e0050a8d130e	\N	00040000-56a8-767e-e41b-a4d1e880bb92	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-7681-a13d-82c0a9bc934d	\N	00040000-56a8-767e-f311-f124231ebbc2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-7681-168a-ee5681ccfdb1	\N	00040000-56a8-767e-8fc9-dea550b62e0a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-7681-e997-d5e4162509cc	\N	00040000-56a8-767e-013c-9ed96c7f1e6b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-7683-aac9-0bb322554b8a	\N	00040000-56a8-767e-0497-53d49136f1d5	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 40669615)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a8-767d-2a76-e107cc4e48a9	8341	Adlešiči
00050000-56a8-767d-72e4-f801ce133d9e	5270	Ajdovščina
00050000-56a8-767d-a6b9-d7263453f350	6280	Ankaran/Ancarano
00050000-56a8-767d-b677-51c64c980a89	9253	Apače
00050000-56a8-767d-38dd-817b3ed47c09	8253	Artiče
00050000-56a8-767d-f699-333baacebd8e	4275	Begunje na Gorenjskem
00050000-56a8-767d-f1ec-9d5c66965bbe	1382	Begunje pri Cerknici
00050000-56a8-767d-adf7-86046730313b	9231	Beltinci
00050000-56a8-767d-7263-d4281591f7b2	2234	Benedikt
00050000-56a8-767d-ddde-fe0ec6f6edb4	2345	Bistrica ob Dravi
00050000-56a8-767d-4f1a-7332d8d58a5f	3256	Bistrica ob Sotli
00050000-56a8-767d-87cb-276cc920c2c0	8259	Bizeljsko
00050000-56a8-767d-6e1d-586bb8376bef	1223	Blagovica
00050000-56a8-767d-82b9-fb9675081b2a	8283	Blanca
00050000-56a8-767d-23cd-feab5ab117c2	4260	Bled
00050000-56a8-767d-b1c7-708492b54620	4273	Blejska Dobrava
00050000-56a8-767d-da2e-a2234cca6e7a	9265	Bodonci
00050000-56a8-767d-28b3-8a2c831cc03d	9222	Bogojina
00050000-56a8-767d-975e-f0ef13e7d0b6	4263	Bohinjska Bela
00050000-56a8-767d-103b-cd01e636a4cd	4264	Bohinjska Bistrica
00050000-56a8-767d-2635-2cde4f237773	4265	Bohinjsko jezero
00050000-56a8-767d-7997-5cd87355f711	1353	Borovnica
00050000-56a8-767d-23f5-f8abf674552e	8294	Boštanj
00050000-56a8-767d-35eb-f20e83838a45	5230	Bovec
00050000-56a8-767d-54fc-86b08a27c0f5	5295	Branik
00050000-56a8-767d-59e9-95161015ad27	3314	Braslovče
00050000-56a8-767d-6986-754bd2368032	5223	Breginj
00050000-56a8-767d-e3e2-197bf1fc01d7	8280	Brestanica
00050000-56a8-767d-fa0d-5de30d0de77a	2354	Bresternica
00050000-56a8-767d-4cb1-a7b535f2a48b	4243	Brezje
00050000-56a8-767d-2641-8ab4acc6aff5	1351	Brezovica pri Ljubljani
00050000-56a8-767d-0dbf-b868b78392ff	8250	Brežice
00050000-56a8-767d-e219-a1e7a0069136	4210	Brnik - Aerodrom
00050000-56a8-767d-7167-083867d6139a	8321	Brusnice
00050000-56a8-767d-e603-49ffa6495a6d	3255	Buče
00050000-56a8-767d-9278-6bfdcae040ba	8276	Bučka 
00050000-56a8-767d-4810-e3dd670e26a8	9261	Cankova
00050000-56a8-767d-6570-6e037bc0278a	3000	Celje 
00050000-56a8-767d-74f6-911fd423544a	3001	Celje - poštni predali
00050000-56a8-767d-370c-c3c59ba59d13	4207	Cerklje na Gorenjskem
00050000-56a8-767d-17ad-0b160f5ee3d8	8263	Cerklje ob Krki
00050000-56a8-767d-767b-4248c688ce77	1380	Cerknica
00050000-56a8-767d-1073-0ee95721d506	5282	Cerkno
00050000-56a8-767d-b2ca-baba5b8f145b	2236	Cerkvenjak
00050000-56a8-767d-659a-7c46414fbbf5	2215	Ceršak
00050000-56a8-767d-86be-a34d9417c42d	2326	Cirkovce
00050000-56a8-767d-4f7e-489dc979e533	2282	Cirkulane
00050000-56a8-767d-9f59-fd482a644193	5273	Col
00050000-56a8-767d-3289-5282a359d365	8251	Čatež ob Savi
00050000-56a8-767d-f87c-4fb749d39ff8	1413	Čemšenik
00050000-56a8-767d-18f7-0e77c704d1ca	5253	Čepovan
00050000-56a8-767d-1ea5-940ffbc34069	9232	Črenšovci
00050000-56a8-767d-a966-695ab8cc925c	2393	Črna na Koroškem
00050000-56a8-767d-b4f8-5bdc62c731b5	6275	Črni Kal
00050000-56a8-767d-c15b-cf206d5a078e	5274	Črni Vrh nad Idrijo
00050000-56a8-767d-a32b-56230b14d4f7	5262	Črniče
00050000-56a8-767d-3347-bd4d37fe2670	8340	Črnomelj
00050000-56a8-767d-1ae0-833ca5bdc3f6	6271	Dekani
00050000-56a8-767d-dbd8-72038f33b770	5210	Deskle
00050000-56a8-767d-0f9f-592d28e6d6b5	2253	Destrnik
00050000-56a8-767d-3f14-d9b28c209d44	6215	Divača
00050000-56a8-767d-9744-7c3c6414b638	1233	Dob
00050000-56a8-767d-c62e-a1e36f34c107	3224	Dobje pri Planini
00050000-56a8-767d-2f83-fb916b97b509	8257	Dobova
00050000-56a8-767d-69fe-1485ef53e9a5	1423	Dobovec
00050000-56a8-767d-5d9c-9a61036b9839	5263	Dobravlje
00050000-56a8-767d-3835-7c4b0fe3577b	3204	Dobrna
00050000-56a8-767d-ebd7-773d77906cef	8211	Dobrnič
00050000-56a8-767d-5985-d4638b0b88e2	1356	Dobrova
00050000-56a8-767d-4a5b-12ef64121797	9223	Dobrovnik/Dobronak 
00050000-56a8-767d-04f7-115f20f8b1ad	5212	Dobrovo v Brdih
00050000-56a8-767d-3bb7-efe2c6d02a20	1431	Dol pri Hrastniku
00050000-56a8-767d-3d0a-c26c5b58f058	1262	Dol pri Ljubljani
00050000-56a8-767d-def8-81f031fb5063	1273	Dole pri Litiji
00050000-56a8-767d-7beb-cc1081a0f476	1331	Dolenja vas
00050000-56a8-767d-d69a-7b7a9898435d	8350	Dolenjske Toplice
00050000-56a8-767d-8101-3c14c65e6f67	1230	Domžale
00050000-56a8-767d-7b8b-f5137c475bba	2252	Dornava
00050000-56a8-767d-2625-bda089f5fc53	5294	Dornberk
00050000-56a8-767d-6387-ee1270dbc764	1319	Draga
00050000-56a8-767d-9a9c-67e05a89ff37	8343	Dragatuš
00050000-56a8-767d-f48a-5d5b0aa78fcb	3222	Dramlje
00050000-56a8-767d-8b54-2c49101fdc4c	2370	Dravograd
00050000-56a8-767d-9315-a64c75daf377	4203	Duplje
00050000-56a8-767d-b0e9-c4135a7d1280	6221	Dutovlje
00050000-56a8-767d-1e7a-55523d1556c6	8361	Dvor
00050000-56a8-767d-8d55-4b433f66952b	2343	Fala
00050000-56a8-767d-da34-83e520fe129d	9208	Fokovci
00050000-56a8-767d-a063-ce6586e6f5c6	2313	Fram
00050000-56a8-767d-4a06-8ef1ebf76acc	3213	Frankolovo
00050000-56a8-767d-f222-4b3c566b4e14	1274	Gabrovka
00050000-56a8-767d-17d3-a69d3b00cf86	8254	Globoko
00050000-56a8-767d-598d-c80a1c2b92c1	5275	Godovič
00050000-56a8-767d-81e2-1ceadf8f0a75	4204	Golnik
00050000-56a8-767d-0eca-13d475a88e9e	3303	Gomilsko
00050000-56a8-767d-81db-3a2d033f5a61	4224	Gorenja vas
00050000-56a8-767d-93c4-8688bf0cc015	3263	Gorica pri Slivnici
00050000-56a8-767d-809b-d6079939d2b6	2272	Gorišnica
00050000-56a8-767d-6a36-9dec0fff895a	9250	Gornja Radgona
00050000-56a8-767d-c630-bc11642da714	3342	Gornji Grad
00050000-56a8-767d-7b47-7e29cca5b416	4282	Gozd Martuljek
00050000-56a8-767d-c44b-e3d5726a2265	6272	Gračišče
00050000-56a8-767d-1ca8-80298ae7b489	9264	Grad
00050000-56a8-767d-ee99-9d39224e5e38	8332	Gradac
00050000-56a8-767d-fa15-cbcc17636ab8	1384	Grahovo
00050000-56a8-767d-7b9e-c899fc820ea7	5242	Grahovo ob Bači
00050000-56a8-767d-f4ef-cf2fda975eff	5251	Grgar
00050000-56a8-767d-0bd5-e330560d8690	3302	Griže
00050000-56a8-767d-b819-ac7d30462137	3231	Grobelno
00050000-56a8-767d-57f3-4dd2dbb4c11a	1290	Grosuplje
00050000-56a8-767d-721e-55fb7f1a1edc	2288	Hajdina
00050000-56a8-767d-34e8-5656c27c804d	8362	Hinje
00050000-56a8-767d-52f5-70def254decb	2311	Hoče
00050000-56a8-767d-c72a-43257b90a244	9205	Hodoš/Hodos
00050000-56a8-767d-0e09-d19d9ec3dd99	1354	Horjul
00050000-56a8-767d-51e3-d2c00b1a21a1	1372	Hotedršica
00050000-56a8-767d-8d88-7107c4872e64	1430	Hrastnik
00050000-56a8-767d-f89d-1ddd20ee3303	6225	Hruševje
00050000-56a8-767d-b8eb-7822e5907ade	4276	Hrušica
00050000-56a8-767d-1fc3-3c9520d2db48	5280	Idrija
00050000-56a8-767d-bd42-29dac3f54b79	1292	Ig
00050000-56a8-767d-e9f5-d3591ad1a286	6250	Ilirska Bistrica
00050000-56a8-767d-fb71-c6e2c32b539d	6251	Ilirska Bistrica-Trnovo
00050000-56a8-767d-b6f2-97818382387e	1295	Ivančna Gorica
00050000-56a8-767d-2216-343ce6b0526c	2259	Ivanjkovci
00050000-56a8-767d-1680-a4ffafff449e	1411	Izlake
00050000-56a8-767d-cf9f-985bf56c1792	6310	Izola/Isola
00050000-56a8-767d-fd3c-d26a12048c39	2222	Jakobski Dol
00050000-56a8-767d-fcb6-1dd992525c9a	2221	Jarenina
00050000-56a8-767d-e7ee-22c053add576	6254	Jelšane
00050000-56a8-767d-4ef4-b6232dd843ef	4270	Jesenice
00050000-56a8-767d-3f11-76a176149dd2	8261	Jesenice na Dolenjskem
00050000-56a8-767d-2366-62eb5c89728b	3273	Jurklošter
00050000-56a8-767d-6b23-68d692bb2829	2223	Jurovski Dol
00050000-56a8-767d-12a1-1410c675e2a9	2256	Juršinci
00050000-56a8-767d-fc95-7a806b422335	5214	Kal nad Kanalom
00050000-56a8-767d-e7d7-3bbe0c5fdbb8	3233	Kalobje
00050000-56a8-767d-6048-ed2daa946b72	4246	Kamna Gorica
00050000-56a8-767d-4565-a2881c1de4fc	2351	Kamnica
00050000-56a8-767d-237a-c3163f15f193	1241	Kamnik
00050000-56a8-767d-71e4-3b8db6d502f5	5213	Kanal
00050000-56a8-767d-a64e-6caf18379b8a	8258	Kapele
00050000-56a8-767d-1759-c39198f89f50	2362	Kapla
00050000-56a8-767d-7cb7-a7d30c8f4337	2325	Kidričevo
00050000-56a8-767d-591b-8d7d596492c4	1412	Kisovec
00050000-56a8-767d-5a35-889c46858e14	6253	Knežak
00050000-56a8-767d-25ad-796a00f9beda	5222	Kobarid
00050000-56a8-767d-5cc0-5b95af19f4a5	9227	Kobilje
00050000-56a8-767d-19bf-f3b5161b9ebb	1330	Kočevje
00050000-56a8-767d-5ab3-58651a318789	1338	Kočevska Reka
00050000-56a8-767d-206a-46dc0c93a8bb	2276	Kog
00050000-56a8-767d-5600-087f911db2ad	5211	Kojsko
00050000-56a8-767d-6664-2a3b43f77319	6223	Komen
00050000-56a8-767d-620c-0e5f6b7a413b	1218	Komenda
00050000-56a8-767d-598a-38adaa91eba9	6000	Koper/Capodistria 
00050000-56a8-767d-5ed6-0be04f3cf413	6001	Koper/Capodistria - poštni predali
00050000-56a8-767d-dc39-5edfd08bd3ba	8282	Koprivnica
00050000-56a8-767d-25f2-b3efc84b7b01	5296	Kostanjevica na Krasu
00050000-56a8-767d-5069-7307607d2fe6	8311	Kostanjevica na Krki
00050000-56a8-767d-088d-6220b5923cc5	1336	Kostel
00050000-56a8-767d-1d25-0e7434b05be4	6256	Košana
00050000-56a8-767d-dfdb-75a9a4ed408f	2394	Kotlje
00050000-56a8-767d-2725-1782280feafa	6240	Kozina
00050000-56a8-767d-ef4e-1b4e199646f4	3260	Kozje
00050000-56a8-767d-9641-ef8e25816fc5	4000	Kranj 
00050000-56a8-767d-46c5-01ec97241e14	4001	Kranj - poštni predali
00050000-56a8-767d-4d77-8a7fab286c0d	4280	Kranjska Gora
00050000-56a8-767d-630e-bdf0b6cdeb47	1281	Kresnice
00050000-56a8-767d-9245-58727cb927a2	4294	Križe
00050000-56a8-767d-df44-8f47164ee0d6	9206	Križevci
00050000-56a8-767d-7bc4-d5041f9c29f6	9242	Križevci pri Ljutomeru
00050000-56a8-767d-7808-a7224a8b209d	1301	Krka
00050000-56a8-767d-22b2-5813a9f4326e	8296	Krmelj
00050000-56a8-767d-2cfb-ec90de9242b9	4245	Kropa
00050000-56a8-767d-b01d-d524e36f57ec	8262	Krška vas
00050000-56a8-767d-ab7c-d2f2d3812ce2	8270	Krško
00050000-56a8-767d-a44a-878ef143c06c	9263	Kuzma
00050000-56a8-767d-68c8-d3e6ed40c8cf	2318	Laporje
00050000-56a8-767d-faf1-e04ab85c4eb8	3270	Laško
00050000-56a8-767d-1f1f-e58f82d2b981	1219	Laze v Tuhinju
00050000-56a8-767d-611c-99a7183014fd	2230	Lenart v Slovenskih goricah
00050000-56a8-767d-9eaa-240f75056ab1	9220	Lendava/Lendva
00050000-56a8-767d-ebc1-ff1947a69f47	4248	Lesce
00050000-56a8-767d-2282-fcffa1465b77	3261	Lesično
00050000-56a8-767d-ed9c-8d41b675b4f9	8273	Leskovec pri Krškem
00050000-56a8-767d-a789-5099e221cc91	2372	Libeliče
00050000-56a8-767d-f69d-9f45ef60605a	2341	Limbuš
00050000-56a8-767d-77ee-956a26076550	1270	Litija
00050000-56a8-767d-95b8-3aacd12fa31a	3202	Ljubečna
00050000-56a8-767d-3a74-b518389d5735	1000	Ljubljana 
00050000-56a8-767d-ce0a-045473fa29bc	1001	Ljubljana - poštni predali
00050000-56a8-767d-0c3f-2e01e4991e8b	1231	Ljubljana - Črnuče
00050000-56a8-767d-0dc3-98ea2f40081e	1261	Ljubljana - Dobrunje
00050000-56a8-767d-5698-cbf56e0a92a4	1260	Ljubljana - Polje
00050000-56a8-767d-47a5-6c411cf9902a	1210	Ljubljana - Šentvid
00050000-56a8-767d-6376-8a392f5624e0	1211	Ljubljana - Šmartno
00050000-56a8-767d-95dd-61aec3310732	3333	Ljubno ob Savinji
00050000-56a8-767d-3b5d-e77d349418ee	9240	Ljutomer
00050000-56a8-767d-b2a4-df004d98472e	3215	Loče
00050000-56a8-767d-5549-20baa5b01e81	5231	Log pod Mangartom
00050000-56a8-767d-e641-e77e44e0de02	1358	Log pri Brezovici
00050000-56a8-767d-513c-1e77a70a21d8	1370	Logatec
00050000-56a8-767d-50f4-e7189d698eca	1371	Logatec
00050000-56a8-767d-6327-43988481ccd7	1434	Loka pri Zidanem Mostu
00050000-56a8-767d-0a88-8c99ad1fb81a	3223	Loka pri Žusmu
00050000-56a8-767d-1ce1-7a49c04d6302	6219	Lokev
00050000-56a8-767d-6331-57b4b98b2b87	1318	Loški Potok
00050000-56a8-767d-4b54-da5cafe2bf4b	2324	Lovrenc na Dravskem polju
00050000-56a8-767d-f8fe-bc0d2e6498c6	2344	Lovrenc na Pohorju
00050000-56a8-767d-4588-9683a668b151	3334	Luče
00050000-56a8-767d-7746-267d5c42b0b8	1225	Lukovica
00050000-56a8-767d-0fc8-613b71448801	9202	Mačkovci
00050000-56a8-767d-02dc-79c5cdce5d89	2322	Majšperk
00050000-56a8-767d-cbf6-a8d600c345e9	2321	Makole
00050000-56a8-767d-c004-2b1e750802bd	9243	Mala Nedelja
00050000-56a8-767d-674a-f77ccc95dfaf	2229	Malečnik
00050000-56a8-767d-b12b-8ff4f33086ab	6273	Marezige
00050000-56a8-767d-4627-ea72712cb715	2000	Maribor 
00050000-56a8-767d-b84a-52fa1cdeafa7	2001	Maribor - poštni predali
00050000-56a8-767d-5210-d40dd1fe425c	2206	Marjeta na Dravskem polju
00050000-56a8-767d-2b31-f82e51025dc4	2281	Markovci
00050000-56a8-767d-d48a-b7fea7dcecfd	9221	Martjanci
00050000-56a8-767d-4f0a-d4e9f5fdd88b	6242	Materija
00050000-56a8-767d-afcd-066e5b2f7b51	4211	Mavčiče
00050000-56a8-767d-96a4-c628b6a345ee	1215	Medvode
00050000-56a8-767d-5600-92de5b684239	1234	Mengeš
00050000-56a8-767d-3943-791f6245aba6	8330	Metlika
00050000-56a8-767d-aaaa-fe993b95eba9	2392	Mežica
00050000-56a8-767d-b81a-d1e4a1a3c2c4	2204	Miklavž na Dravskem polju
00050000-56a8-767d-75a8-899fd1a6d2a7	2275	Miklavž pri Ormožu
00050000-56a8-767d-8dc0-219e872578f6	5291	Miren
00050000-56a8-767d-e10e-7ffadfd6a29f	8233	Mirna
00050000-56a8-767d-9f62-27eff77a7acf	8216	Mirna Peč
00050000-56a8-767d-30f6-419c7616ec2f	2382	Mislinja
00050000-56a8-767d-d64e-7554122de585	4281	Mojstrana
00050000-56a8-767d-4955-7dbeb3a91b04	8230	Mokronog
00050000-56a8-767d-761d-43aee26104bb	1251	Moravče
00050000-56a8-767d-69e0-b2f39114a78e	9226	Moravske Toplice
00050000-56a8-767d-6180-e6410bdec3f3	5216	Most na Soči
00050000-56a8-767d-55f9-c0350e864e66	1221	Motnik
00050000-56a8-767d-4f25-df19f3eece30	3330	Mozirje
00050000-56a8-767d-d958-b48fd5a14623	9000	Murska Sobota 
00050000-56a8-767d-add5-4b1a27fdc981	9001	Murska Sobota - poštni predali
00050000-56a8-767d-1a90-8503353b4fc1	2366	Muta
00050000-56a8-767d-c006-dbde05716fde	4202	Naklo
00050000-56a8-767d-f98e-97c55e4d3118	3331	Nazarje
00050000-56a8-767d-9162-b93d964bab4f	1357	Notranje Gorice
00050000-56a8-767d-8639-35f7103830d9	3203	Nova Cerkev
00050000-56a8-767d-2331-a7f8f73be665	5000	Nova Gorica 
00050000-56a8-767d-4958-43784ad43ce8	5001	Nova Gorica - poštni predali
00050000-56a8-767d-c460-66a19d35d5f3	1385	Nova vas
00050000-56a8-767d-b6bb-d8c4b8b1e8f6	8000	Novo mesto
00050000-56a8-767d-28c1-2ddd8b61fe1d	8001	Novo mesto - poštni predali
00050000-56a8-767d-3ac9-33b5fd2b741b	6243	Obrov
00050000-56a8-767d-bd17-2dcf85bfa63f	9233	Odranci
00050000-56a8-767d-a560-49047ada5cec	2317	Oplotnica
00050000-56a8-767d-c70f-f9ce9da6b058	2312	Orehova vas
00050000-56a8-767d-1d21-2a107eded985	2270	Ormož
00050000-56a8-767d-fba7-96ca0b31293d	1316	Ortnek
00050000-56a8-767d-a99f-e8387a9ce427	1337	Osilnica
00050000-56a8-767d-3103-49d81e05d22c	8222	Otočec
00050000-56a8-767d-92c2-b8c28f4b1efb	2361	Ožbalt
00050000-56a8-767d-38de-e5dc325cbfdc	2231	Pernica
00050000-56a8-767d-01c2-66e1256cc7d1	2211	Pesnica pri Mariboru
00050000-56a8-767d-e1e6-2295c3e75df3	9203	Petrovci
00050000-56a8-767d-6b82-1e6205148445	3301	Petrovče
00050000-56a8-767d-840b-96d74dfcf480	6330	Piran/Pirano
00050000-56a8-767d-0184-be89ab607481	8255	Pišece
00050000-56a8-767d-7393-449894f7f592	6257	Pivka
00050000-56a8-767d-d881-bb9ce98ffb4e	6232	Planina
00050000-56a8-767d-f913-15d974729e11	3225	Planina pri Sevnici
00050000-56a8-767d-a205-e68336caa6e6	6276	Pobegi
00050000-56a8-767d-bd17-2c8d58a196ee	8312	Podbočje
00050000-56a8-767d-229e-c711594cb165	5243	Podbrdo
00050000-56a8-767d-faf3-2e71d97c84d6	3254	Podčetrtek
00050000-56a8-767d-a085-a2af04175cb5	2273	Podgorci
00050000-56a8-767d-1551-0e83e03a0c1e	6216	Podgorje
00050000-56a8-767d-ec4a-87ccb8514104	2381	Podgorje pri Slovenj Gradcu
00050000-56a8-767d-c088-9f2c9f33f024	6244	Podgrad
00050000-56a8-767d-69b5-cf9e40035fce	1414	Podkum
00050000-56a8-767d-9d03-67a31ec7bb90	2286	Podlehnik
00050000-56a8-767d-f774-aa7408699d79	5272	Podnanos
00050000-56a8-767d-1ba5-c10b3f2b6445	4244	Podnart
00050000-56a8-767d-c1fd-008fbec0fea1	3241	Podplat
00050000-56a8-767d-1d55-244c4ccec77e	3257	Podsreda
00050000-56a8-767d-24bc-fbf28a92afb9	2363	Podvelka
00050000-56a8-767d-f9a2-d475b951e131	2208	Pohorje
00050000-56a8-767d-b234-3a960433ae57	2257	Polenšak
00050000-56a8-767d-57f9-500dd60ce8d9	1355	Polhov Gradec
00050000-56a8-767d-ec73-67df6cd046a0	4223	Poljane nad Škofjo Loko
00050000-56a8-767d-634d-18305df3600a	2319	Poljčane
00050000-56a8-767d-18d6-e2e6858d8381	1272	Polšnik
00050000-56a8-767d-a9d9-2c866490d08f	3313	Polzela
00050000-56a8-767d-2867-dd2e5cf6c2e2	3232	Ponikva
00050000-56a8-767d-fac0-aa5969652f0a	6320	Portorož/Portorose
00050000-56a8-767d-43f0-62198e811c4b	6230	Postojna
00050000-56a8-767d-a1c7-6c6dd6bdc030	2331	Pragersko
00050000-56a8-767d-6b7b-aaece8ebe701	3312	Prebold
00050000-56a8-767d-3137-e1859d040815	4205	Preddvor
00050000-56a8-767d-2ec3-70caf476222c	6255	Prem
00050000-56a8-767d-cfe9-57d6bbdf4d40	1352	Preserje
00050000-56a8-767d-ca23-d4594bc1319b	6258	Prestranek
00050000-56a8-767d-0c33-d8c6da9a7577	2391	Prevalje
00050000-56a8-767d-8f16-8eaf629fb17d	3262	Prevorje
00050000-56a8-767d-b163-71fcc9a7d58c	1276	Primskovo 
00050000-56a8-767d-0059-a2a61309ea73	3253	Pristava pri Mestinju
00050000-56a8-767d-ed53-db853a060d62	9207	Prosenjakovci/Partosfalva
00050000-56a8-767d-8fc7-dd050d6d22e1	5297	Prvačina
00050000-56a8-767d-f6c9-8d7a57c32445	2250	Ptuj
00050000-56a8-767d-9a27-b26687aecce7	2323	Ptujska Gora
00050000-56a8-767d-3b0c-12eb3819cde7	9201	Puconci
00050000-56a8-767d-3063-f6adb652376c	2327	Rače
00050000-56a8-767d-6b18-6ff3c0399ef4	1433	Radeče
00050000-56a8-767d-061e-6918547973b3	9252	Radenci
00050000-56a8-767d-909d-62ef3f3995a9	2360	Radlje ob Dravi
00050000-56a8-767d-12e5-e80370e207f7	1235	Radomlje
00050000-56a8-767d-da7d-b8fbf1fc552d	4240	Radovljica
00050000-56a8-767d-f595-4d604f3697e7	8274	Raka
00050000-56a8-767d-b6be-e1687e72d9a9	1381	Rakek
00050000-56a8-767d-6960-7e2a0ff891f4	4283	Rateče - Planica
00050000-56a8-767d-feac-c02fd28056d6	2390	Ravne na Koroškem
00050000-56a8-767d-98c8-b87545c1b329	9246	Razkrižje
00050000-56a8-767d-8e08-515c55015baa	3332	Rečica ob Savinji
00050000-56a8-767d-6a11-93b3be0731bc	5292	Renče
00050000-56a8-767d-c766-c2e891b807cb	1310	Ribnica
00050000-56a8-767d-27d9-c09284a1038e	2364	Ribnica na Pohorju
00050000-56a8-767d-78c4-3452a45b0d2e	3272	Rimske Toplice
00050000-56a8-767d-58b1-18dd108a4b8e	1314	Rob
00050000-56a8-767d-f3c0-5d58227d75f1	5215	Ročinj
00050000-56a8-767d-5629-890e6a561a69	3250	Rogaška Slatina
00050000-56a8-767d-21de-e9be1ef25eb9	9262	Rogašovci
00050000-56a8-767d-54ba-f8fdd386f18b	3252	Rogatec
00050000-56a8-767d-f4a5-540e6b519e99	1373	Rovte
00050000-56a8-767d-2b7a-a7e77944652c	2342	Ruše
00050000-56a8-767d-02de-3531f438e991	1282	Sava
00050000-56a8-767d-e039-b1028d473eb5	6333	Sečovlje/Sicciole
00050000-56a8-767d-d69b-3f0f44533c9b	4227	Selca
00050000-56a8-767d-58c4-c8c468807b6d	2352	Selnica ob Dravi
00050000-56a8-767d-bd1a-9df758c78bc9	8333	Semič
00050000-56a8-767d-a2ee-17d9a2a86743	8281	Senovo
00050000-56a8-767d-cdf9-d4e3e25079e5	6224	Senožeče
00050000-56a8-767d-0c20-8dd68ac9de1e	8290	Sevnica
00050000-56a8-767d-0a81-463ca8592f4b	6210	Sežana
00050000-56a8-767d-a058-991762830fb2	2214	Sladki Vrh
00050000-56a8-767d-3f21-3bff984e51a0	5283	Slap ob Idrijci
00050000-56a8-767d-86fa-b6f717c073ac	2380	Slovenj Gradec
00050000-56a8-767d-8405-559864977bb3	2310	Slovenska Bistrica
00050000-56a8-767d-0133-c3341bd41643	3210	Slovenske Konjice
00050000-56a8-767d-cae4-54f6cc4ba11e	1216	Smlednik
00050000-56a8-767d-dde7-0b57a83de4ed	5232	Soča
00050000-56a8-767d-c621-ae6908f79518	1317	Sodražica
00050000-56a8-767d-44d9-46e229d4aed3	3335	Solčava
00050000-56a8-767d-8f56-98182cd7f515	5250	Solkan
00050000-56a8-767d-e61d-e3166ba0b5c0	4229	Sorica
00050000-56a8-767d-17e7-13c87b2b49ac	4225	Sovodenj
00050000-56a8-767d-ca74-9ab4aa251aaa	5281	Spodnja Idrija
00050000-56a8-767d-765b-cc933efa182b	2241	Spodnji Duplek
00050000-56a8-767d-e0d0-aee73304baf2	9245	Spodnji Ivanjci
00050000-56a8-767d-cdc8-57d0721cf67f	2277	Središče ob Dravi
00050000-56a8-767d-be1c-6b8ef1b79a7f	4267	Srednja vas v Bohinju
00050000-56a8-767d-e985-87173c7213b0	8256	Sromlje 
00050000-56a8-767d-a8ec-57b777d8d9e2	5224	Srpenica
00050000-56a8-767d-3116-bd14591687d3	1242	Stahovica
00050000-56a8-767d-c7f1-a53be0daaba0	1332	Stara Cerkev
00050000-56a8-767d-4aa8-e03482a90b69	8342	Stari trg ob Kolpi
00050000-56a8-767d-6797-0ce5f0d94e56	1386	Stari trg pri Ložu
00050000-56a8-767d-40c9-5c380b9185df	2205	Starše
00050000-56a8-767d-0961-54f0ba26b8b2	2289	Stoperce
00050000-56a8-767d-8fbb-30ccefd15691	8322	Stopiče
00050000-56a8-767d-e5f9-5e6eec3ccdb0	3206	Stranice
00050000-56a8-767d-d53e-09d3e07da005	8351	Straža
00050000-56a8-767d-0aab-884290611add	1313	Struge
00050000-56a8-767d-9589-bd3f8ddffa45	8293	Studenec
00050000-56a8-767d-3fae-1617e084eb43	8331	Suhor
00050000-56a8-767d-5006-88b78110822d	2233	Sv. Ana v Slovenskih goricah
00050000-56a8-767d-e50d-0b2f55bb2d2a	2235	Sv. Trojica v Slovenskih goricah
00050000-56a8-767d-0bbb-8e28e857497f	2353	Sveti Duh na Ostrem Vrhu
00050000-56a8-767d-3340-f82ac9e83911	9244	Sveti Jurij ob Ščavnici
00050000-56a8-767d-7bfd-6b56ccf80e93	3264	Sveti Štefan
00050000-56a8-767d-e5e4-94d623a694f0	2258	Sveti Tomaž
00050000-56a8-767d-fbf4-71a2f0c21313	9204	Šalovci
00050000-56a8-767d-35ad-9b7b1fc6f451	5261	Šempas
00050000-56a8-767d-a5af-6a9baedbcf66	5290	Šempeter pri Gorici
00050000-56a8-767d-89e6-1d950b87c07f	3311	Šempeter v Savinjski dolini
00050000-56a8-767d-3451-c038b7ae6e19	4208	Šenčur
00050000-56a8-767d-b3f5-96498b4c4399	2212	Šentilj v Slovenskih goricah
00050000-56a8-767d-f17b-baca26da904f	8297	Šentjanž
00050000-56a8-767d-1d2d-142e3449d170	2373	Šentjanž pri Dravogradu
00050000-56a8-767d-d461-21844c2c2fc1	8310	Šentjernej
00050000-56a8-767d-2466-afdd45ab27e3	3230	Šentjur
00050000-56a8-767d-1be4-8b017dbceb8f	3271	Šentrupert
00050000-56a8-767d-577c-808f17e2a664	8232	Šentrupert
00050000-56a8-767d-4700-3f6a54de222c	1296	Šentvid pri Stični
00050000-56a8-767d-f87f-6bced4fa40dd	8275	Škocjan
00050000-56a8-767d-d47d-c648a73330df	6281	Škofije
00050000-56a8-767d-2265-e17f7384d4a5	4220	Škofja Loka
00050000-56a8-767d-a947-6e96face5fbd	3211	Škofja vas
00050000-56a8-767d-3f34-b195c00eb3a8	1291	Škofljica
00050000-56a8-767d-07e4-fea34ba1966a	6274	Šmarje
00050000-56a8-767d-e55d-4ef25afc82f7	1293	Šmarje - Sap
00050000-56a8-767d-648b-c680ff218101	3240	Šmarje pri Jelšah
00050000-56a8-767d-3cd9-46b85e523ddd	8220	Šmarješke Toplice
00050000-56a8-767d-d819-44ef12c1b08e	2315	Šmartno na Pohorju
00050000-56a8-767d-abc6-285b11850384	3341	Šmartno ob Dreti
00050000-56a8-767d-1994-da34a703c242	3327	Šmartno ob Paki
00050000-56a8-767d-f549-49bc57c18338	1275	Šmartno pri Litiji
00050000-56a8-767d-140e-206b06b59403	2383	Šmartno pri Slovenj Gradcu
00050000-56a8-767d-4ad7-6689963ed4ca	3201	Šmartno v Rožni dolini
00050000-56a8-767d-e7ec-c9e842d8fccf	3325	Šoštanj
00050000-56a8-767d-3c42-ca2126771e8c	6222	Štanjel
00050000-56a8-767d-982c-81b5da165ff0	3220	Štore
00050000-56a8-767d-6df4-4b6842a25e64	3304	Tabor
00050000-56a8-767d-a531-da41d80909c7	3221	Teharje
00050000-56a8-767d-dff2-9330a719d4d1	9251	Tišina
00050000-56a8-767d-416f-19354af8c9e9	5220	Tolmin
00050000-56a8-767d-f8b3-6418da262371	3326	Topolšica
00050000-56a8-767d-65a7-60ed09cd0755	2371	Trbonje
00050000-56a8-767d-c6cf-c290d9c6a0fb	1420	Trbovlje
00050000-56a8-767d-557f-ccb7a554ad4c	8231	Trebelno 
00050000-56a8-767d-6305-258337b9e502	8210	Trebnje
00050000-56a8-767d-f5c9-4a373151a111	5252	Trnovo pri Gorici
00050000-56a8-767d-588d-2f1e60314990	2254	Trnovska vas
00050000-56a8-767d-94de-191b918091ae	1222	Trojane
00050000-56a8-767d-9af3-a55d39ca81f9	1236	Trzin
00050000-56a8-767d-179c-8e4c212fd740	4290	Tržič
00050000-56a8-767d-52ac-4ac1650e614a	8295	Tržišče
00050000-56a8-767d-81b9-dc7cada743cf	1311	Turjak
00050000-56a8-767d-5fed-848189e59e6d	9224	Turnišče
00050000-56a8-767d-68b9-213a14b44aea	8323	Uršna sela
00050000-56a8-767d-bb24-685b5bc86c08	1252	Vače
00050000-56a8-767d-ddff-9ac0a3ff8f1b	3320	Velenje 
00050000-56a8-767d-63f6-16aa3e3cc316	3322	Velenje - poštni predali
00050000-56a8-767d-91c9-315b02e59c66	8212	Velika Loka
00050000-56a8-767d-b0e5-7abfd7e45816	2274	Velika Nedelja
00050000-56a8-767d-a7e4-6e0bd446748a	9225	Velika Polana
00050000-56a8-767d-f14a-60b678fc081a	1315	Velike Lašče
00050000-56a8-767d-533b-1bab4408768e	8213	Veliki Gaber
00050000-56a8-767d-3385-5860c1413b98	9241	Veržej
00050000-56a8-767d-7f9a-e481beb7e794	1312	Videm - Dobrepolje
00050000-56a8-767d-4680-a83ecb984dab	2284	Videm pri Ptuju
00050000-56a8-767d-b80a-ec4a3d450c4d	8344	Vinica
00050000-56a8-767d-6db4-4beb268dc791	5271	Vipava
00050000-56a8-767d-58d5-d1ba1da54ab4	4212	Visoko
00050000-56a8-767d-b79e-6ce50d581072	1294	Višnja Gora
00050000-56a8-767d-008a-cb600a917be1	3205	Vitanje
00050000-56a8-767d-ef58-7de6cd1eb36f	2255	Vitomarci
00050000-56a8-767d-91e4-6093e37639c2	1217	Vodice
00050000-56a8-767d-57cc-edeb8e356303	3212	Vojnik\t
00050000-56a8-767d-a94c-d3e455ae4d24	5293	Volčja Draga
00050000-56a8-767d-3e92-4b8835748af6	2232	Voličina
00050000-56a8-767d-ad86-a0d12306b8ce	3305	Vransko
00050000-56a8-767d-cc9e-6d1c3557e010	6217	Vremski Britof
00050000-56a8-767d-1323-290d65b43bdd	1360	Vrhnika
00050000-56a8-767d-5688-74cdb566ae1f	2365	Vuhred
00050000-56a8-767d-2ccf-9de09f34ee61	2367	Vuzenica
00050000-56a8-767d-6716-abb842fcc84f	8292	Zabukovje 
00050000-56a8-767d-add4-e84d21503360	1410	Zagorje ob Savi
00050000-56a8-767d-a32d-5b5128b9d599	1303	Zagradec
00050000-56a8-767d-3b8d-7b2b821bf671	2283	Zavrč
00050000-56a8-767d-2828-b885a661eaf1	8272	Zdole 
00050000-56a8-767d-6b01-c288b07429ce	4201	Zgornja Besnica
00050000-56a8-767d-6cb2-b12bcf92c21f	2242	Zgornja Korena
00050000-56a8-767d-159d-f588a652bf5f	2201	Zgornja Kungota
00050000-56a8-767d-11c7-3479f11538b4	2316	Zgornja Ložnica
00050000-56a8-767d-f875-e93000e11efa	2314	Zgornja Polskava
00050000-56a8-767d-d1dc-9f78e5ace751	2213	Zgornja Velka
00050000-56a8-767d-cc68-c46649a144fa	4247	Zgornje Gorje
00050000-56a8-767d-a96e-039fcaf3bedc	4206	Zgornje Jezersko
00050000-56a8-767d-ac44-2d2f0fc55f43	2285	Zgornji Leskovec
00050000-56a8-767d-aa0a-020993fc1b2a	1432	Zidani Most
00050000-56a8-767d-19aa-e8f4227eb18d	3214	Zreče
00050000-56a8-767d-8845-2a275c0e63b1	4209	Žabnica
00050000-56a8-767d-7a77-847393cb1281	3310	Žalec
00050000-56a8-767d-a2e1-bf5b3bb1677a	4228	Železniki
00050000-56a8-767d-47b5-06c1c3eaab60	2287	Žetale
00050000-56a8-767d-70b3-6bcda1b1e613	4226	Žiri
00050000-56a8-767d-0430-f2ef74fad130	4274	Žirovnica
00050000-56a8-767d-0dae-f8a4c9a4bd80	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 40670290)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 40669860)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 40669600)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a8-7681-4d00-b12a00e6c041	00080000-56a8-7681-4696-7e71e7445b61	\N	00040000-56a8-767e-0497-53d49136f1d5	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a8-7681-ea73-595fed257ed2	00080000-56a8-7681-4696-7e71e7445b61	\N	00040000-56a8-767e-0497-53d49136f1d5	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a8-7681-d7a5-838186f38f58	00080000-56a8-7681-6f83-8719a92fd886	\N	00040000-56a8-767e-0497-53d49136f1d5	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 40669736)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a8-767e-1d79-5db5c8d66a8f	novo leto	1	1	\N	t
00430000-56a8-767e-a8eb-1e3267276507	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a8-767e-cddb-6ea4d40b4ab0	dan upora proti okupatorju	27	4	\N	t
00430000-56a8-767e-538f-1f54b2e9c573	praznik dela	1	5	\N	t
00430000-56a8-767e-ab9e-2602f5b4b3b0	praznik dela	2	5	\N	t
00430000-56a8-767e-f5b0-4d7e1e793446	dan Primoža Trubarja	8	6	\N	f
00430000-56a8-767e-3c4c-1469921cc1d5	dan državnosti	25	6	\N	t
00430000-56a8-767e-ab28-278f32c74168	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a8-767e-ffc6-a2a99c5b071d	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a8-767e-f714-5ad6e4f08588	dan suverenosti	25	10	\N	f
00430000-56a8-767e-d14a-e74515bcedc5	dan spomina na mrtve	1	11	\N	t
00430000-56a8-767e-a31d-6b2229337e87	dan Rudolfa Maistra	23	11	\N	f
00430000-56a8-767e-59d6-e925088c82ab	božič	25	12	\N	t
00430000-56a8-767e-a86c-72024d986de5	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a8-767e-a106-8246ec10b762	Marijino vnebovzetje	15	8	\N	t
00430000-56a8-767e-7283-c25ccefa4876	dan reformacije	31	10	\N	t
00430000-56a8-767e-c980-57f343de627a	velikonočna nedelja	27	3	2016	t
00430000-56a8-767e-cdf9-3a4678491e2e	velikonočna nedelja	16	4	2017	t
00430000-56a8-767e-f44e-7437b11df8e8	velikonočna nedelja	1	4	2018	t
00430000-56a8-767e-853b-cf1f069c3813	velikonočna nedelja	21	4	2019	t
00430000-56a8-767e-7138-f265420f4f0d	velikonočna nedelja	12	4	2020	t
00430000-56a8-767e-e1dd-8285316a6da2	velikonočna nedelja	4	4	2021	t
00430000-56a8-767e-a801-156f77ff7462	velikonočna nedelja	17	4	2022	t
00430000-56a8-767e-a68a-3637d241a022	velikonočna nedelja	9	4	2023	t
00430000-56a8-767e-9e51-792850f93b36	velikonočna nedelja	31	3	2024	t
00430000-56a8-767e-90ef-e6437cb38786	velikonočna nedelja	20	4	2025	t
00430000-56a8-767e-69d0-eccd10db4bfc	velikonočna nedelja	5	4	2026	t
00430000-56a8-767e-0d5b-030ede6fa5a0	velikonočna nedelja	28	3	2027	t
00430000-56a8-767e-c1d4-0bc7f2eae76a	velikonočna nedelja	16	4	2028	t
00430000-56a8-767e-4e80-29ba7ce20811	velikonočna nedelja	1	4	2029	t
00430000-56a8-767e-fa4e-69e6386d0bb3	velikonočna nedelja	21	4	2030	t
00430000-56a8-767e-ad84-76c9ae096636	velikonočni ponedeljek	28	3	2016	t
00430000-56a8-767e-c467-a304f6381428	velikonočni ponedeljek	17	4	2017	t
00430000-56a8-767e-d370-3853f30e8eac	velikonočni ponedeljek	2	4	2018	t
00430000-56a8-767e-8d54-030a1be3bcc1	velikonočni ponedeljek	22	4	2019	t
00430000-56a8-767e-35c9-e48c1b770247	velikonočni ponedeljek	13	4	2020	t
00430000-56a8-767e-07de-1efe5ce6e11d	velikonočni ponedeljek	5	4	2021	t
00430000-56a8-767e-8dae-28ec56d5ae4b	velikonočni ponedeljek	18	4	2022	t
00430000-56a8-767e-5ac2-b5fc1dec65b8	velikonočni ponedeljek	10	4	2023	t
00430000-56a8-767e-04ee-89f1c2374f2b	velikonočni ponedeljek	1	4	2024	t
00430000-56a8-767e-8bb2-4ff2227dee06	velikonočni ponedeljek	21	4	2025	t
00430000-56a8-767e-4d75-f16373b7a203	velikonočni ponedeljek	6	4	2026	t
00430000-56a8-767e-c1e4-1a6230fe94f0	velikonočni ponedeljek	29	3	2027	t
00430000-56a8-767e-fa9b-beeabdc1577b	velikonočni ponedeljek	17	4	2028	t
00430000-56a8-767e-e834-88e2fe963820	velikonočni ponedeljek	2	4	2029	t
00430000-56a8-767e-bdb5-dbedcdaf82bf	velikonočni ponedeljek	22	4	2030	t
00430000-56a8-767e-5f81-82c2bfa13ad8	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a8-767e-6621-2fd69f26ee05	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a8-767e-c7bf-974f9a2c10ad	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a8-767e-5c53-daaad42f5a69	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a8-767e-0fd0-da978a863108	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a8-767e-cb1e-d3eb7226c727	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a8-767e-66b4-10889483b49b	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a8-767e-de6f-22a434dab36d	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a8-767e-4015-6e8075788982	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a8-767e-e2a4-ac5b7340e9a3	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a8-767e-315c-6d41f9245f13	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a8-767e-b442-1964f70ecb89	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a8-767e-7769-914666df898d	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a8-767e-a240-e6e468efbf02	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a8-767e-7068-e100f3841e1c	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 40669704)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56a8-7681-9590-43ad6b1d2285	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	1	1	\N
001b0000-56a8-7681-1970-fc3f1fcf7bbe	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	1	2	\N
001b0000-56a8-7681-0e8b-177fde7b7387	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	1	3	1
001b0000-56a8-7681-45ec-284552c4a6c6	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	2	4	2
001b0000-56a8-7681-886a-1b32c32d6dd1	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	4	5	3
001b0000-56a8-7681-fcff-ae6a927654a5	000e0000-56a8-7681-0011-85a56e1589e9	\N	1	1	\N
001b0000-56a8-7681-4976-dcb955d90ae0	000e0000-56a8-7681-0011-85a56e1589e9	\N	3	2	1
001b0000-56a8-7681-e5cc-07f51a99061c	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	1	6	1
001b0000-56a8-7681-a45a-96083906417f	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	3	7	2
001b0000-56a8-7681-8f67-3a8809b50b89	000e0000-56a8-7681-0011-85a56e1589e9	\N	2	3	1
001b0000-56a8-7681-2398-f1ad20332dc3	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	2	9	1
001b0000-56a8-7681-3500-3683f551ffa8	000e0000-56a8-7681-0011-85a56e1589e9	\N	4	4	2
001b0000-56a8-7681-e0f0-363cf94376b0	000e0000-56a8-7681-f335-42a14c0a8bcc	\N	5	8	3
001b0000-56a8-7681-c3ff-9daa312d8592	000e0000-56a8-7681-0011-85a56e1589e9	\N	1	5	1
\.


--
-- TOC entry 3161 (class 0 OID 40669711)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a8-7681-0e8b-177fde7b7387	000a0000-56a8-7680-22e8-5fa41c58dd95
001b0000-56a8-7681-0e8b-177fde7b7387	000a0000-56a8-7680-53eb-5109414f630d
001b0000-56a8-7681-45ec-284552c4a6c6	000a0000-56a8-7680-53eb-5109414f630d
001b0000-56a8-7681-45ec-284552c4a6c6	000a0000-56a8-7680-86dd-408bb0b00edb
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 40669872)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 40670304)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 40670314)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a8-7681-4c6e-88ec3044b35c	00080000-56a8-7681-c7e4-4d062130c132	0987	AK
00190000-56a8-7681-5ee9-d7f842f033f9	00080000-56a8-7681-6f83-8719a92fd886	0989	AK
00190000-56a8-7681-ffbe-f197a0f2ac2f	00080000-56a8-7681-e97e-950302aded71	0986	AK
00190000-56a8-7681-da9a-eb7b7ad67389	00080000-56a8-7681-f15d-e0050a8d130e	0984	AK
00190000-56a8-7681-d800-9af99887c11e	00080000-56a8-7681-a13d-82c0a9bc934d	0983	AK
00190000-56a8-7681-a4d6-2d0ad703626e	00080000-56a8-7681-168a-ee5681ccfdb1	0982	AK
00190000-56a8-7683-50b5-c855732d59da	00080000-56a8-7683-aac9-0bb322554b8a	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 40670203)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a8-7681-6e1d-b206dcade482	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 40670322)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 40669900)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a8-7681-be57-a829732f7c04	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a8-7681-eec9-abcf6ab845e5	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a8-7681-5a0e-c9e00ab9610d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a8-7681-0686-0412376d11c8	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a8-7681-c1d5-baf09adf7e1c	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a8-7681-2450-6e33fd8e92a6	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a8-7681-045d-0cb9599b6e44	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 40669845)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 40669835)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 40670042)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 40669972)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 40669678)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 40669439)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a8-7683-aac9-0bb322554b8a	00010000-56a8-767f-86fd-c573743b391c	2016-01-27 08:49:23	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a8-7683-4d76-77adcd634934	00010000-56a8-767f-86fd-c573743b391c	2016-01-27 08:49:23	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a8-7683-50b5-c855732d59da	00010000-56a8-767f-86fd-c573743b391c	2016-01-27 08:49:23	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 40669914)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 40669477)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a8-767e-8744-335e6a488794	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a8-767e-061a-157546b19834	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a8-767e-ed49-429ffd599c7b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a8-767e-fd66-45666e38d40d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a8-767e-f514-30a37e930027	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a8-767e-d543-b31e61306e42	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a8-767e-1b11-a1bc4df5bf49	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a8-767e-03e2-350fba77b475	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a8-767e-a3c3-99a48df98728	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-767e-5e03-27c752321124	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-767e-44b0-aeb028e5b57b	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-767e-5529-997b8f71d079	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-767e-fb7f-dfa015c44783	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a8-767e-3eeb-214379b00c93	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a8-767e-1226-4fd210c32732	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a8-767e-3566-5c7651effbb6	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a8-767e-a808-1b2ea12c19b8	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a8-767e-04c5-3925abccd19d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a8-767e-7dfa-995f875ddfbc	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a8-767e-240d-5b73b7cbc7c6	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a8-767e-3b13-e1635757b206	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a8-767e-a855-69f0dbf88b35	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a8-767e-d562-d1bdcf801d72	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a8-767e-e10b-79a43c6a75f2	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a8-767e-ff1a-4676c5f4caf1	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a8-767e-e542-24302fcaabfc	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a8-767e-9168-08ae195c5ad0	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a8-767e-2f05-9bc6b55da835	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a8-767e-c6cd-e7356a8456bb	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a8-767e-95a2-1a21ffd627ef	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a8-767e-dc65-cbc728ff12ef	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a8-767e-f667-1bd2f32937df	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a8-767e-7d76-8a9550c20416	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a8-767e-bf81-13743c48d281	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a8-767e-125d-769f74908c31	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a8-767f-8bc0-bd1f34dc386d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a8-767f-2ad7-0209c8d4f64a	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a8-767f-f3f1-51fc891d344b	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a8-767f-83fb-16d0e6932247	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a8-767f-b339-c2fec4a497bd	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a8-767f-d730-e0d0e8bb29a8	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a8-767f-f1fe-2bad11b7a41e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a8-767f-b5b1-7a1c5f9c7ae1	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a8-767f-22cf-70e5782c0333	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a8-767f-6efc-f409f2294d6e	direktor	minimalne pravice za direktorja	t
00020000-56a8-767f-78ce-78e01261502d	arhivar	arhivar	t
00020000-56a8-767f-c956-c5a35f533a7c	dramaturg	dramaturg	t
00020000-56a8-767f-f2ca-ee6519d5b33a	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a8-767f-0762-8e071a0df28b	poslovni-sekretar	poslovni sekretar	t
00020000-56a8-767f-5f6a-3e46c262375e	vodja-tehnike	vodja tehnike	t
00020000-56a8-767f-dfdb-4268cde6ff99	racunovodja	računovodja	t
00020000-56a8-7680-b376-890ddf7928b7	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a8-7680-67b0-e52258819413	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-0fa0-ea4b9c326108	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-739f-4b3a0860942b	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-83fe-3e1c34155c5a	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-24c9-cb0cd002fc5c	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-23ca-ad62871dd052	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-7e40-9bba53079ab9	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-cec0-34db18b3e842	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-37a8-9b9d298bd1b6	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-705b-26a2492d0cb2	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-80a8-1ec31c06b01f	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-a5e0-989c9b3e4fea	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-9506-aa8ac324050d	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-0dcb-092093e25d05	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-2339-06f24e281715	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-315e-6ff04d9dbf25	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-7cde-f58fd4e8b232	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-39f6-39fb4e60d717	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-3264-af0750349b23	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a8-7680-70f7-add530f88957	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-8610-5222048c03bf	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-7a27-aef08154e4be	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-8fa9-e354e75c6336	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-b748-354346a86302	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-a961-fbefe20845c7	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-1c3f-a200d94dbe50	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-c76b-574d363d5fd3	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-eae2-6138e94faad6	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-19d8-03c6a25a12a8	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-6330-499e0adbb028	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-7d33-8fe3402f9838	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-ec8e-ff3a721997b1	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-af25-e98cf687b961	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-8503-8d1d0ef5ddb9	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-19ae-bb231088e10d	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-4866-dd1b8a704a77	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-dc1e-3bd23d496a28	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a8-7680-03b4-21829586b285	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 40669461)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a8-767f-dbb5-1f91cd9b57d9	00020000-56a8-767e-ed49-429ffd599c7b
00010000-56a8-767f-86fd-c573743b391c	00020000-56a8-767e-ed49-429ffd599c7b
00010000-56a8-7681-a393-8a512488303f	00020000-56a8-7680-b376-890ddf7928b7
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-67b0-e52258819413
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-24c9-cb0cd002fc5c
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-37a8-9b9d298bd1b6
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-80a8-1ec31c06b01f
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-9506-aa8ac324050d
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-39f6-39fb4e60d717
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-739f-4b3a0860942b
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-70f7-add530f88957
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-8fa9-e354e75c6336
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-a961-fbefe20845c7
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-c76b-574d363d5fd3
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-19d8-03c6a25a12a8
00010000-56a8-7681-fcda-5b23fe0ca25a	00020000-56a8-7680-af25-e98cf687b961
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-67b0-e52258819413
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-0fa0-ea4b9c326108
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-739f-4b3a0860942b
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-83fe-3e1c34155c5a
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-9506-aa8ac324050d
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-315e-6ff04d9dbf25
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-70f7-add530f88957
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-8fa9-e354e75c6336
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-a961-fbefe20845c7
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-c76b-574d363d5fd3
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-19d8-03c6a25a12a8
00010000-56a8-7681-913b-1516970ae752	00020000-56a8-7680-af25-e98cf687b961
00010000-56a8-7681-8c0b-3b96eaa129ac	00020000-56a8-7680-67b0-e52258819413
00010000-56a8-7681-8c0b-3b96eaa129ac	00020000-56a8-7680-0fa0-ea4b9c326108
00010000-56a8-7681-8c0b-3b96eaa129ac	00020000-56a8-7680-739f-4b3a0860942b
00010000-56a8-7681-8c0b-3b96eaa129ac	00020000-56a8-7680-83fe-3e1c34155c5a
00010000-56a8-7681-8c0b-3b96eaa129ac	00020000-56a8-7680-80a8-1ec31c06b01f
00010000-56a8-7681-8c0b-3b96eaa129ac	00020000-56a8-7680-9506-aa8ac324050d
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-0fa0-ea4b9c326108
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-23ca-ad62871dd052
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-705b-26a2492d0cb2
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-a5e0-989c9b3e4fea
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-80a8-1ec31c06b01f
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-7cde-f58fd4e8b232
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-9506-aa8ac324050d
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-0dcb-092093e25d05
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-70f7-add530f88957
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-8610-5222048c03bf
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-8fa9-e354e75c6336
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-b748-354346a86302
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-a961-fbefe20845c7
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-1c3f-a200d94dbe50
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-c76b-574d363d5fd3
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-eae2-6138e94faad6
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-19d8-03c6a25a12a8
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-6330-499e0adbb028
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-af25-e98cf687b961
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-8503-8d1d0ef5ddb9
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-4866-dd1b8a704a77
00010000-56a8-7681-4249-f37e76b51e29	00020000-56a8-7680-dc1e-3bd23d496a28
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-0fa0-ea4b9c326108
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-23ca-ad62871dd052
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-cec0-34db18b3e842
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-705b-26a2492d0cb2
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-a5e0-989c9b3e4fea
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-80a8-1ec31c06b01f
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-7cde-f58fd4e8b232
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-9506-aa8ac324050d
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-0dcb-092093e25d05
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-2339-06f24e281715
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-70f7-add530f88957
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-8610-5222048c03bf
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-7a27-aef08154e4be
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-8fa9-e354e75c6336
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-b748-354346a86302
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-a961-fbefe20845c7
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-1c3f-a200d94dbe50
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-c76b-574d363d5fd3
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-eae2-6138e94faad6
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-19d8-03c6a25a12a8
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-6330-499e0adbb028
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-af25-e98cf687b961
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-8503-8d1d0ef5ddb9
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-19ae-bb231088e10d
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-4866-dd1b8a704a77
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-dc1e-3bd23d496a28
00010000-56a8-7681-2a37-a7b91be7ded4	00020000-56a8-7680-03b4-21829586b285
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-0fa0-ea4b9c326108
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-739f-4b3a0860942b
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-23ca-ad62871dd052
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-7e40-9bba53079ab9
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-cec0-34db18b3e842
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-24c9-cb0cd002fc5c
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-705b-26a2492d0cb2
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-a5e0-989c9b3e4fea
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-80a8-1ec31c06b01f
00010000-56a8-7681-a6b7-bbdcd4a76457	00020000-56a8-7680-7cde-f58fd4e8b232
00010000-56a8-7681-38b4-cad3479ab83b	00020000-56a8-7680-67b0-e52258819413
00010000-56a8-7681-38b4-cad3479ab83b	00020000-56a8-7680-83fe-3e1c34155c5a
00010000-56a8-7681-38b4-cad3479ab83b	00020000-56a8-7680-24c9-cb0cd002fc5c
00010000-56a8-7681-38b4-cad3479ab83b	00020000-56a8-7680-37a8-9b9d298bd1b6
00010000-56a8-7681-38b4-cad3479ab83b	00020000-56a8-7680-80a8-1ec31c06b01f
00010000-56a8-7681-38b4-cad3479ab83b	00020000-56a8-7680-9506-aa8ac324050d
00010000-56a8-7681-38b4-cad3479ab83b	00020000-56a8-7680-39f6-39fb4e60d717
00010000-56a8-7681-38b4-cad3479ab83b	00020000-56a8-7680-7d33-8fe3402f9838
00010000-56a8-7681-fec2-cf3bb92e5638	00020000-56a8-7680-3264-af0750349b23
00010000-56a8-7681-3a2a-081931e46f78	00020000-56a8-767f-6efc-f409f2294d6e
00010000-56a8-7681-7f1a-1b4fe0d6d0fb	00020000-56a8-767f-78ce-78e01261502d
00010000-56a8-7681-0566-1e4a7c5f9952	00020000-56a8-767f-c956-c5a35f533a7c
00010000-56a8-7681-36f2-c8af20690230	00020000-56a8-767f-f2ca-ee6519d5b33a
00010000-56a8-7681-5166-24ef97ca9d4c	00020000-56a8-767f-0762-8e071a0df28b
00010000-56a8-7681-3ed4-05143e87d4a0	00020000-56a8-767f-5f6a-3e46c262375e
00010000-56a8-7681-3603-b7b774634a05	00020000-56a8-767f-dfdb-4268cde6ff99
\.


--
-- TOC entry 3186 (class 0 OID 40669928)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 40669866)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 40669789)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a8-7680-87d4-9c097c39aa64	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a8-7680-89a9-ec0ce13dc084	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a8-7680-eb6e-fcfe88c4d9f3	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a8-7680-9286-bc1cd75ad9d9	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 40669426)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a8-767e-63c4-e081022c6c7f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a8-767e-6db5-8139445c74a7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a8-767e-20f5-72e4b844ed7f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a8-767e-8a7f-9acdfdc7046a	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a8-767e-fb5c-44ce63caa3c3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 40669418)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a8-767e-01ee-c0b7e694c83b	00230000-56a8-767e-8a7f-9acdfdc7046a	popa
00240000-56a8-767e-446e-afc84d2b1ef5	00230000-56a8-767e-8a7f-9acdfdc7046a	oseba
00240000-56a8-767e-50d7-34b95a8c006b	00230000-56a8-767e-8a7f-9acdfdc7046a	tippopa
00240000-56a8-767e-a154-bb66b5859b78	00230000-56a8-767e-8a7f-9acdfdc7046a	organizacijskaenota
00240000-56a8-767e-7725-d0e74f213463	00230000-56a8-767e-8a7f-9acdfdc7046a	sezona
00240000-56a8-767e-ffa7-d9ddc0076bce	00230000-56a8-767e-8a7f-9acdfdc7046a	tipvaje
00240000-56a8-767e-837b-9b4a9300a9e1	00230000-56a8-767e-8a7f-9acdfdc7046a	tipdodatka
00240000-56a8-767e-31b0-3a67e5e3001c	00230000-56a8-767e-6db5-8139445c74a7	prostor
00240000-56a8-767e-77ef-32b82b5eb687	00230000-56a8-767e-8a7f-9acdfdc7046a	besedilo
00240000-56a8-767e-6446-bc413a1a51a6	00230000-56a8-767e-8a7f-9acdfdc7046a	uprizoritev
00240000-56a8-767e-3638-e27fef0d08dc	00230000-56a8-767e-8a7f-9acdfdc7046a	funkcija
00240000-56a8-767e-07df-f266f280f79e	00230000-56a8-767e-8a7f-9acdfdc7046a	tipfunkcije
00240000-56a8-767e-2679-a533297e6066	00230000-56a8-767e-8a7f-9acdfdc7046a	alternacija
00240000-56a8-767e-cb0b-425f2f214742	00230000-56a8-767e-63c4-e081022c6c7f	pogodba
00240000-56a8-767e-8c66-74f61529f910	00230000-56a8-767e-8a7f-9acdfdc7046a	zaposlitev
00240000-56a8-767e-ebfd-0bf61b723e31	00230000-56a8-767e-8a7f-9acdfdc7046a	zvrstuprizoritve
00240000-56a8-767e-0616-31b1d74e25a9	00230000-56a8-767e-63c4-e081022c6c7f	programdela
00240000-56a8-767e-6e4c-160676a4d0f9	00230000-56a8-767e-8a7f-9acdfdc7046a	zapis
\.


--
-- TOC entry 3133 (class 0 OID 40669413)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0b3bbeab-5d38-42bc-86a3-4a397431d08f	00240000-56a8-767e-01ee-c0b7e694c83b	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 40669989)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a8-7681-7358-5ce5e9bcb40f	000e0000-56a8-7681-f335-42a14c0a8bcc	00080000-56a8-7681-4696-7e71e7445b61	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a8-767e-2838-e09fd0c94949
00270000-56a8-7681-f782-56db1b73971c	000e0000-56a8-7681-f335-42a14c0a8bcc	00080000-56a8-7681-4696-7e71e7445b61	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a8-767e-2838-e09fd0c94949
\.


--
-- TOC entry 3149 (class 0 OID 40669562)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 40669808)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a8-7682-d12c-53f592a26b56	00180000-56a8-7681-860e-888039417baa	000c0000-56a8-7681-a88a-678c42804c3c	00090000-56a8-7681-590a-864ef44ff108	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-7682-0500-82581938dfa5	00180000-56a8-7681-860e-888039417baa	000c0000-56a8-7681-4f73-4a4922d28936	00090000-56a8-7681-5739-40cb99dff9c2	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-7682-a6af-e7043022e242	00180000-56a8-7681-860e-888039417baa	000c0000-56a8-7681-c6ff-a4ebb092e7c1	00090000-56a8-7681-2815-c18c4ee6471d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-7682-c103-081227196b7d	00180000-56a8-7681-860e-888039417baa	000c0000-56a8-7681-760d-de64971f7494	00090000-56a8-7681-d35f-6849dfac302f	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-7682-b5ec-dca6dd7ab171	00180000-56a8-7681-860e-888039417baa	000c0000-56a8-7681-f8ca-022e17116261	00090000-56a8-7681-ad72-5114220ffbd6	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-7682-d62d-a29afcc72149	00180000-56a8-7681-7aa7-e5b15443d8ef	\N	00090000-56a8-7681-ad72-5114220ffbd6	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a8-7682-08c5-66c7a65110db	00180000-56a8-7681-b965-e097e337c629	\N	00090000-56a8-7681-5739-40cb99dff9c2	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a8-7682-3792-a15394773c58	00180000-56a8-7681-860e-888039417baa	\N	00090000-56a8-7681-17f6-c6a055805e1c	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 40669825)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a8-767e-e117-edb0ac37e7a2	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a8-767e-3bb9-d55fbedfb340	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a8-767e-3290-8b9dcf317edc	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a8-767e-5025-1d14d445b11c	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a8-767e-8b49-36a0ee2e1173	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a8-767e-dfae-8e73d6fa38be	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 40670030)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a8-767e-f9ac-cec1d70dc423	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a8-767e-bbdc-3dddb743be28	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a8-767e-d4dd-be5c83721a03	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a8-767e-0c20-16900caa181e	04	Režija	Režija	Režija	umetnik	30
000f0000-56a8-767e-ea29-02e87460693b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a8-767e-3d27-b26b8aac92d8	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a8-767e-dcd7-9068d2574e69	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a8-767e-e538-16b1a90b2db0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a8-767e-c4de-af32f5ad330e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a8-767e-3c61-0f5e4f92a8d9	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a8-767e-0d60-bc9d1410989b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a8-767e-1555-96427a269068	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a8-767e-a236-da33f2eeb2bd	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a8-767e-151a-4cfefb259bcc	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a8-767e-7ef1-726cf97aae59	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a8-767e-4494-8cc25ea0c7d3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a8-767e-6a10-9ac7051f236f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a8-767e-b3b2-ff63650a870a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a8-767e-e3fe-df7c24ffab87	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 40669513)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a8-7680-f588-5bd95bc867c0	0001	šola	osnovna ali srednja šola
00400000-56a8-7680-ff21-205f9b618981	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a8-7680-bc89-9520bca5d901	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 40670334)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a8-767e-277e-ba718a307c33	01	Velika predstava	f	1.00	1.00
002b0000-56a8-767e-ad1c-adc4da535ff6	02	Mala predstava	f	0.50	0.50
002b0000-56a8-767e-0f0f-46ce12337b6c	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a8-767e-c774-cc49b8a427a7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a8-767e-466f-f5adb7adb937	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 40669779)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a8-767e-9af9-44f4a1e9bb14	0001	prva vaja	prva vaja
00420000-56a8-767e-8c3e-c9ccbf3566e0	0002	tehnična vaja	tehnična vaja
00420000-56a8-767e-76ac-db528f40732c	0003	lučna vaja	lučna vaja
00420000-56a8-767e-b433-81f2c8d194f0	0004	kostumska vaja	kostumska vaja
00420000-56a8-767e-9810-d8ffcb8f444a	0005	foto vaja	foto vaja
00420000-56a8-767e-d500-cc30d014490d	0006	1. glavna vaja	1. glavna vaja
00420000-56a8-767e-2181-c4bd8018d58b	0007	2. glavna vaja	2. glavna vaja
00420000-56a8-767e-f359-9a5243c62dbb	0008	1. generalka	1. generalka
00420000-56a8-767e-713d-0f292413c0c3	0009	2. generalka	2. generalka
00420000-56a8-767e-9bd4-37ccc5e1c992	0010	odprta generalka	odprta generalka
00420000-56a8-767e-58ac-aad12dc4fa68	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a8-767e-d602-0bef70913aaa	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a8-767e-3f33-d1574457326e	0013	pevska vaja	pevska vaja
00420000-56a8-767e-7f8d-cbbaf18d2f95	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a8-767e-030f-ca8e244ad333	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a8-767e-b7da-3739316a976f	0016	orientacijska vaja	orientacijska vaja
00420000-56a8-767e-5d5d-b8f028a72624	0017	situacijska vaja	situacijska vaja
00420000-56a8-767e-3cab-c9e3ed7657ba	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 40669635)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 40669448)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a8-767f-86fd-c573743b391c	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO13lfWDPsb6DjWI2hgeYkGxjK6c1cE9y	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a8-7681-fba9-c3bc890e2c4b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a8-7681-e372-1c8fa8cfb311	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a8-7681-53e8-a27a05a13c70	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a8-7681-1405-510aa19ba8f6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a8-7681-6504-6a50966540f1	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a8-7681-afff-e2478e29a6b6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a8-7681-a629-6355b642d935	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a8-7681-e08b-54c86b2399bd	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a8-7681-6f40-b3d82c66041e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a8-7681-a393-8a512488303f	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a8-7681-b452-561d433cfaba	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a8-7681-fcda-5b23fe0ca25a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a8-7681-913b-1516970ae752	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a8-7681-8c0b-3b96eaa129ac	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a8-7681-4249-f37e76b51e29	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a8-7681-2a37-a7b91be7ded4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a8-7681-a6b7-bbdcd4a76457	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a8-7681-38b4-cad3479ab83b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a8-7681-fec2-cf3bb92e5638	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a8-7681-3a2a-081931e46f78	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a8-7681-7f1a-1b4fe0d6d0fb	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a8-7681-0566-1e4a7c5f9952	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a8-7681-36f2-c8af20690230	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a8-7681-5166-24ef97ca9d4c	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a8-7681-3ed4-05143e87d4a0	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a8-7681-3603-b7b774634a05	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a8-767f-dbb5-1f91cd9b57d9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 40670080)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a8-7681-0011-85a56e1589e9	00160000-56a8-7680-767d-aab2b2ad53ef	\N	00140000-56a8-767e-4f53-169efdb96876	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a8-7681-c1d5-baf09adf7e1c
000e0000-56a8-7681-f335-42a14c0a8bcc	00160000-56a8-7680-0b06-574ce2a1f349	\N	00140000-56a8-767e-0fbb-71f7214488e5	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a8-7681-2450-6e33fd8e92a6
000e0000-56a8-7681-daaf-a93f0bbbf1fc	\N	\N	00140000-56a8-767e-0fbb-71f7214488e5	00190000-56a8-7681-4c6e-88ec3044b35c	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a8-7681-c1d5-baf09adf7e1c
000e0000-56a8-7681-e0a2-13ab0d62aeed	\N	\N	00140000-56a8-767e-0fbb-71f7214488e5	00190000-56a8-7681-4c6e-88ec3044b35c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a8-7681-c1d5-baf09adf7e1c
000e0000-56a8-7681-1cdb-bdc8a313c64a	\N	\N	00140000-56a8-767e-0fbb-71f7214488e5	00190000-56a8-7681-4c6e-88ec3044b35c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-066b-6ef7cb023be0	\N	\N	00140000-56a8-767e-0fbb-71f7214488e5	00190000-56a8-7681-4c6e-88ec3044b35c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-cc7c-134a58e59dd2	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-4650-a7b28efa8756	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-6f12-683cf2623b84	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-d596-10eb2e2ad57d	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-3e3d-01c7e5891743	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-15ac-447d1b51a162	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-445b-4dcc93503f17	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-d3c0-2fb326fc928c	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
000e0000-56a8-7681-5a29-cdeab98ab258	\N	\N	00140000-56a8-767e-c5a2-4e4215eb3b2e	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-7681-be57-a829732f7c04
\.


--
-- TOC entry 3170 (class 0 OID 40669799)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40669729)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a8-7681-6948-7b41e7cda678	\N	000e0000-56a8-7681-0011-85a56e1589e9	1
00200000-56a8-7681-af67-f25c86d41d48	\N	000e0000-56a8-7681-f335-42a14c0a8bcc	1
00200000-56a8-7681-83e1-e3d575414741	\N	000e0000-56a8-7681-f335-42a14c0a8bcc	3
00200000-56a8-7681-d12e-55495667b8f8	\N	000e0000-56a8-7681-f335-42a14c0a8bcc	4
00200000-56a8-7681-0b56-759f753f9e32	\N	000e0000-56a8-7681-f335-42a14c0a8bcc	2
00200000-56a8-7681-dd44-52af319391f4	\N	000e0000-56a8-7681-f335-42a14c0a8bcc	8
00200000-56a8-7681-62ff-2e282441aa5e	\N	000e0000-56a8-7681-f335-42a14c0a8bcc	5
00200000-56a8-7681-21eb-54070453e9b2	\N	000e0000-56a8-7681-f335-42a14c0a8bcc	7
00200000-56a8-7681-ea04-b02c678faf1b	\N	000e0000-56a8-7681-f335-42a14c0a8bcc	6
\.


--
-- TOC entry 3182 (class 0 OID 40669892)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 40670003)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a8-767e-71c9-3dc74c56ee60	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a8-767e-50d5-b337e17ac0f4	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a8-767e-436f-566f043c0a73	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a8-767e-4d7d-4b561a7e8a29	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a8-767e-1877-247f338c5b2b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a8-767e-0d90-4d1664eed42b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a8-767e-0d26-e04532ce90fc	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a8-767e-1819-030b2aeaa7e1	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a8-767e-2838-e09fd0c94949	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a8-767e-1d79-24fb739edc93	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a8-767e-a96e-8ce062b301c9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a8-767e-818c-8f4a146e639b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a8-767e-8ffc-3ada015701db	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a8-767e-2ebb-060074591218	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a8-767e-4b75-4f0378abf739	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a8-767e-6b95-83c01a16c7b7	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a8-767e-78bd-846597b33a46	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a8-767e-57fc-94d0d1c453ff	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a8-767e-b523-2e26845895ab	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a8-767e-a584-b6d97e574f03	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a8-767e-e86c-f4e76167a797	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a8-767e-42f7-e252870a5351	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a8-767e-d75e-ad69f43b0fd2	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a8-767e-c983-996d53e2a20c	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a8-767e-2c4c-cd84b42329a2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a8-767e-c795-4b33f030bd26	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a8-767e-0b75-1d30d773678f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a8-767e-81ff-ad34070138cc	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 40670384)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 40670353)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 40670396)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 40669965)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a8-7681-3734-16b6cde20bd9	00090000-56a8-7681-5739-40cb99dff9c2	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-7681-9891-74ddeba19635	00090000-56a8-7681-2815-c18c4ee6471d	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-7681-6d64-998af570e99b	00090000-56a8-7681-1858-ae4b04e5f018	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-7681-79bc-3951eac01119	00090000-56a8-7681-8887-141ec14678f9	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-7681-65b8-ab2ccfce2fba	00090000-56a8-7681-fec1-54096ed15586	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-7681-3757-05b9489c5d5e	00090000-56a8-7681-68c3-9bb911547fb3	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 40670070)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a8-767e-4f53-169efdb96876	01	Drama	drama (SURS 01)
00140000-56a8-767e-2d56-43ec02a97e4a	02	Opera	opera (SURS 02)
00140000-56a8-767e-cc5c-f9d2babdd3eb	03	Balet	balet (SURS 03)
00140000-56a8-767e-f0f9-177f5068a157	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a8-767e-c5a2-4e4215eb3b2e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a8-767e-0fbb-71f7214488e5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a8-767e-dc04-0f0c0503655b	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 40669955)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 40669512)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 40670128)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 40670119)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 40669502)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 40669986)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 40670028)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 40670437)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 40669822)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 40669758)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 40669773)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 40669778)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 40670351)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 40669661)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 40670197)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 40669951)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 40669727)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 40669699)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 40669675)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 40669858)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 40670414)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 40670421)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 40670445)
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
-- TOC entry 2766 (class 2606 OID 40669884)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 40669633)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 40669531)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 40669595)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 40669558)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 40669491)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 40669476)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 40669890)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 40669927)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 40670065)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 40669586)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 40669621)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 40670302)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 40669864)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 40669611)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 40669743)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 40669715)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 40669708)
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
-- TOC entry 2764 (class 2606 OID 40669876)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 40670311)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 40670319)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 40670289)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 40670332)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 40669909)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 40669849)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 40669840)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 40670052)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 40669979)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 40669687)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 40669447)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 40669918)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 40669465)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 40669485)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 40669936)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 40669871)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 40669797)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 40669435)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 40669423)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 40669417)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 40669999)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 40669567)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 40669814)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 40669832)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 40670039)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 40669520)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 40670344)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 40669786)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 40669646)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 40669460)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 40670098)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 40669805)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 40669733)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 40669898)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 40670011)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 40670394)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 40670378)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 40670402)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 40669969)
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
-- TOC entry 2833 (class 2606 OID 40670078)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 40669963)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 40669767)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 40669768)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 40669766)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 40669765)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 40669764)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 40670000)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 40670001)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 40670002)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 40670416)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 40670415)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 40669588)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 40669589)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 40669891)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 40670382)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 40670381)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 40670383)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 40670380)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 40670379)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 40669877)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 40669734)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 40669735)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 40669952)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 40669954)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 40669953)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 40669677)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 40669676)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 40670333)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 40670067)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 40670068)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 40670069)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 40670403)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 40670103)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 40670100)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 40670104)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 40670102)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 40670101)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 40669648)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 40669647)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 40669561)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 40669919)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 40669492)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 40669493)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 40669939)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 40669938)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 40669937)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 40669598)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 40669597)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 40669599)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 40669709)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 40669710)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 40669425)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 40669844)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 40669842)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 40669841)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 40669843)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 40669466)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 40669467)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 40669899)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 40670438)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 40669988)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 40669987)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 40670446)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 40670447)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 40669865)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 40669980)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 40669981)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 40670202)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 40670201)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 40670198)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 40670199)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 40670200)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 40669613)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 40669612)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 40669614)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 40669913)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 40669912)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 40670312)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 40670313)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 40670132)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 40670133)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 40670130)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 40670131)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 40669823)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 40669824)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 40669970)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 40669971)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 40669806)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 40669853)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 40669852)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 40669850)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 40669851)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 40670120)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 40669688)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 40669702)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 40669701)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 40669700)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 40669703)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 40669728)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 40669716)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 40669717)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 40670303)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 40670352)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 40670422)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 40670423)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 40669533)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 40669532)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 40669568)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 40669569)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 40669817)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 40669816)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 40669815)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 40669760)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 40669763)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 40669759)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 40669762)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 40669761)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 40669587)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 40669521)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 40669522)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 40669662)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 40669664)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 40669663)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 40669665)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 40669859)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 40670066)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 40670099)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 40670040)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 40670041)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 40669559)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 40669560)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 40669833)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 40669834)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 40669964)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 40669436)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 40669634)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 40669596)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 40669424)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 40670345)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 40669911)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 40669910)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 40669787)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 40669788)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 40670129)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 40669807)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 40669622)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 40670079)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 40670395)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 40670320)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 40670321)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 40670029)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 40669798)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 40669486)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2942 (class 2606 OID 40670613)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2947 (class 2606 OID 40670638)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 40670628)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2941 (class 2606 OID 40670608)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 40670623)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2946 (class 2606 OID 40670633)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2943 (class 2606 OID 40670618)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 40670818)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 40670823)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 40670828)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 40670988)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 40670983)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 40670503)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 40670508)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 40670733)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3013 (class 2606 OID 40670968)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 40670963)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 40670973)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 40670958)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 40670953)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 40670728)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 40670598)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2940 (class 2606 OID 40670603)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 40670773)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 40670783)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 40670778)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 40670558)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 40670553)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 40670718)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 40670943)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 40670833)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 40670838)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 40670843)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 40670978)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2992 (class 2606 OID 40670863)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 40670848)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 40670868)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 40670858)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 40670853)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 40670548)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 40670543)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 40670488)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 40670483)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 40670753)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 40670463)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 40670468)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2973 (class 2606 OID 40670768)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 40670763)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 40670758)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 40670518)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 40670513)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 40670523)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 40670573)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 40670578)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 40670448)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 40670693)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 40670683)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 40670678)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 40670688)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 40670453)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 40670458)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 40670738)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 40671003)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 40670813)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 40670808)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3021 (class 2606 OID 40671008)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 40671013)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 40670723)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2979 (class 2606 OID 40670798)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 40670803)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 40670918)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 40670913)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 40670898)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 40670903)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 40670908)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 40670533)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 40670528)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 40670538)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 40670748)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2968 (class 2606 OID 40670743)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 40670928)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 40670933)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 40670888)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 40670893)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2995 (class 2606 OID 40670878)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2996 (class 2606 OID 40670883)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 40670668)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 40670673)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2977 (class 2606 OID 40670788)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 40670793)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 40670643)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 40670648)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 40670713)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 40670708)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 40670698)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 40670703)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 40670873)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 40670563)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 40670568)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 40670593)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 40670583)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 40670588)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 40670923)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 40670938)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 40670948)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3018 (class 2606 OID 40670993)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 40670998)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 40670478)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 40670473)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 40670493)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 40670498)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 40670663)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 40670658)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 40670653)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-27 08:49:25 CET

--
-- PostgreSQL database dump complete
--

