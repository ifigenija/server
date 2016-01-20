--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-20 09:18:27 CET

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
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 38203469)
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
-- TOC entry 241 (class 1259 OID 38204087)
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
-- TOC entry 240 (class 1259 OID 38204071)
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
-- TOC entry 184 (class 1259 OID 38203462)
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
-- TOC entry 183 (class 1259 OID 38203460)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 38203948)
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
-- TOC entry 234 (class 1259 OID 38203978)
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
-- TOC entry 255 (class 1259 OID 38204390)
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
-- TOC entry 212 (class 1259 OID 38203784)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 38203710)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 38203735)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 38203740)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 38204312)
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
-- TOC entry 196 (class 1259 OID 38203614)
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
-- TOC entry 242 (class 1259 OID 38204100)
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
-- TOC entry 227 (class 1259 OID 38203906)
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
-- TOC entry 202 (class 1259 OID 38203684)
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
-- TOC entry 199 (class 1259 OID 38203654)
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
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 38203631)
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
-- TOC entry 216 (class 1259 OID 38203820)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 38204370)
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
-- TOC entry 254 (class 1259 OID 38204383)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 38204405)
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
-- TOC entry 220 (class 1259 OID 38203845)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 38203588)
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
-- TOC entry 187 (class 1259 OID 38203488)
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
-- TOC entry 191 (class 1259 OID 38203555)
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
-- TOC entry 188 (class 1259 OID 38203499)
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
-- TOC entry 180 (class 1259 OID 38203434)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 38203453)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 38203852)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 38203886)
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
-- TOC entry 237 (class 1259 OID 38204019)
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
-- TOC entry 190 (class 1259 OID 38203535)
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
-- TOC entry 193 (class 1259 OID 38203580)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 38204256)
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
-- TOC entry 217 (class 1259 OID 38203826)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 38203565)
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
-- TOC entry 204 (class 1259 OID 38203702)
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
-- TOC entry 200 (class 1259 OID 38203669)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 201 (class 1259 OID 38203677)
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
-- TOC entry 219 (class 1259 OID 38203838)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 38204270)
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
-- TOC entry 246 (class 1259 OID 38204280)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 38204169)
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
-- TOC entry 247 (class 1259 OID 38204288)
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
-- TOC entry 223 (class 1259 OID 38203867)
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
-- TOC entry 215 (class 1259 OID 38203811)
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
-- TOC entry 214 (class 1259 OID 38203801)
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
-- TOC entry 236 (class 1259 OID 38204008)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 38203938)
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
-- TOC entry 198 (class 1259 OID 38203643)
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
-- TOC entry 177 (class 1259 OID 38203405)
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
-- TOC entry 176 (class 1259 OID 38203403)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 38203880)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 38203443)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 38203427)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 38203894)
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
-- TOC entry 218 (class 1259 OID 38203832)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 38203755)
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
-- TOC entry 175 (class 1259 OID 38203392)
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
-- TOC entry 174 (class 1259 OID 38203384)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 38203379)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 38203955)
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
-- TOC entry 189 (class 1259 OID 38203527)
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
-- TOC entry 211 (class 1259 OID 38203774)
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
-- TOC entry 213 (class 1259 OID 38203791)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 38203996)
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
-- TOC entry 186 (class 1259 OID 38203478)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 38204300)
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
-- TOC entry 208 (class 1259 OID 38203745)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 38203600)
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
-- TOC entry 178 (class 1259 OID 38203414)
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
-- TOC entry 239 (class 1259 OID 38204046)
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
-- TOC entry 210 (class 1259 OID 38203765)
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
-- TOC entry 203 (class 1259 OID 38203695)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 38203859)
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
-- TOC entry 233 (class 1259 OID 38203969)
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
-- TOC entry 251 (class 1259 OID 38204350)
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
-- TOC entry 250 (class 1259 OID 38204319)
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
-- TOC entry 252 (class 1259 OID 38204362)
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
-- TOC entry 229 (class 1259 OID 38203931)
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
-- TOC entry 238 (class 1259 OID 38204036)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 38203921)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 38203465)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 38203408)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3146 (class 0 OID 38203469)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569f-42cf-1033-af80b3281305	10	30	Otroci	Abonma za otroke	200
000a0000-569f-42cf-229e-b198950a658a	20	60	Mladina	Abonma za mladino	400
000a0000-569f-42cf-3f86-ed61ea1c88b7	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3202 (class 0 OID 38204087)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569f-42d0-6cf1-47a193220fef	000d0000-569f-42cf-718c-a17e23cb4d22	\N	00090000-569f-42cf-5ae8-01f2c8520a91	000b0000-569f-42cf-501e-492d904283dd	0001	f	\N	\N	\N	3	t	t	t
000c0000-569f-42d0-f80f-11d205ac271e	000d0000-569f-42cf-1b7e-170e751e4970	00100000-569f-42cf-40f4-56ba8c21d1b8	00090000-569f-42cf-6465-e611cb259be9	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569f-42d0-4068-d70a0b37f319	000d0000-569f-42cf-568b-eebb935c1849	00100000-569f-42cf-fcb9-7b1cfdaeb9df	00090000-569f-42cf-e2c1-89b9cf8a1035	\N	0003	t	\N	2016-01-20	\N	2	t	f	f
000c0000-569f-42d0-402f-3b356564b831	000d0000-569f-42cf-943c-8c4e7240e6e7	\N	00090000-569f-42cf-2bca-83fde894eb60	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569f-42d0-f0be-55aaa8491458	000d0000-569f-42cf-be8a-58ef50b1d4ee	\N	00090000-569f-42cf-11ea-f25064e74281	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569f-42d0-021f-1373d4a3ddf5	000d0000-569f-42cf-7e3b-63b18e066e33	\N	00090000-569f-42cf-0bfe-6e965e54408d	000b0000-569f-42cf-cc9d-09afc6047808	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569f-42d0-d864-9a52f60e0567	000d0000-569f-42cf-d495-de2118abae84	00100000-569f-42cf-3afe-7e47d2f2488a	00090000-569f-42cf-b158-7f7f22e8bf47	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569f-42d0-3f0a-be81c42e7b3f	000d0000-569f-42cf-061e-0bced6a5ca4d	\N	00090000-569f-42cf-5194-302345c61364	000b0000-569f-42cf-3c4c-5446d995fd97	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569f-42d0-c1be-272bed91f390	000d0000-569f-42cf-d495-de2118abae84	00100000-569f-42cf-da8d-863f2dd8222c	00090000-569f-42cf-8720-f548c3ab4f20	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569f-42d0-f77e-34287769fce4	000d0000-569f-42cf-d495-de2118abae84	00100000-569f-42cf-3e33-0e76ee78f392	00090000-569f-42cf-ccf4-6b33850c57e6	\N	0010	t	\N	2016-01-20	\N	16	f	f	t
000c0000-569f-42d0-cb11-b3c19c1585d5	000d0000-569f-42cf-d495-de2118abae84	00100000-569f-42cf-2043-253a9752fcad	00090000-569f-42cf-4437-79c3fdb5d141	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569f-42d0-aac9-5bf5d216103a	000d0000-569f-42cf-f1dc-4e36640d9d2a	00100000-569f-42cf-40f4-56ba8c21d1b8	00090000-569f-42cf-6465-e611cb259be9	000b0000-569f-42cf-905d-1006364f4d9e	0012	t	\N	\N	\N	2	t	t	t
000c0000-569f-42d0-3a8e-58a4d7e5913c	000d0000-569f-42cf-a953-fb9ab38edb53	\N	00090000-569f-42cf-5194-302345c61364	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-10a4-a4e2381e0ab8	000d0000-569f-42cf-a953-fb9ab38edb53	\N	00090000-569f-42cf-f3ef-f988ac203fd9	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569f-42d0-d582-5c0bd43b023d	000d0000-569f-42cf-f760-5a00ddeb544c	00100000-569f-42cf-fcb9-7b1cfdaeb9df	00090000-569f-42cf-e2c1-89b9cf8a1035	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-6fa0-5134854524c1	000d0000-569f-42cf-f760-5a00ddeb544c	\N	00090000-569f-42cf-f3ef-f988ac203fd9	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569f-42d0-e10e-67f95a84c623	000d0000-569f-42cf-4b9a-6a2ba96ddbad	\N	00090000-569f-42cf-f3ef-f988ac203fd9	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-8275-5bf338b1c523	000d0000-569f-42cf-4b9a-6a2ba96ddbad	\N	00090000-569f-42cf-5194-302345c61364	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569f-42d0-5e75-5f4d4f85d989	000d0000-569f-42cf-0605-26b3a52da745	00100000-569f-42cf-3afe-7e47d2f2488a	00090000-569f-42cf-b158-7f7f22e8bf47	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-ba46-62ef774a4851	000d0000-569f-42cf-0605-26b3a52da745	\N	00090000-569f-42cf-f3ef-f988ac203fd9	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569f-42d0-9813-62e1450e2c7f	000d0000-569f-42cf-ff42-4fe2a2774a5a	\N	00090000-569f-42cf-f3ef-f988ac203fd9	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-fc6c-ae91c10f8a18	000d0000-569f-42cf-ff42-4fe2a2774a5a	00100000-569f-42cf-3afe-7e47d2f2488a	00090000-569f-42cf-b158-7f7f22e8bf47	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569f-42d0-cf75-ae81bb3a8eba	000d0000-569f-42cf-30aa-18970fa85e48	\N	00090000-569f-42cf-f3ef-f988ac203fd9	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-7b1d-658a392d79ed	000d0000-569f-42cf-8219-96c282116f4f	\N	00090000-569f-42cf-5194-302345c61364	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-1f2d-fb9d90949a39	000d0000-569f-42cf-1e1c-e44b87092563	\N	00090000-569f-42cf-5194-302345c61364	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-2482-e58980afa758	000d0000-569f-42cf-1e1c-e44b87092563	00100000-569f-42cf-fcb9-7b1cfdaeb9df	00090000-569f-42cf-e2c1-89b9cf8a1035	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569f-42d0-b3e5-2e146aeef7a5	000d0000-569f-42cf-f74e-72a51ce585a2	\N	00090000-569f-42cf-0c23-09d2db242615	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569f-42d0-84b1-82b37ca11607	000d0000-569f-42cf-f74e-72a51ce585a2	\N	00090000-569f-42cf-ac9a-891cea8c5d40	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569f-42d0-42ee-6ebfaa693836	000d0000-569f-42cf-14fd-1746d8d2efee	\N	00090000-569f-42cf-5194-302345c61364	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569f-42d0-a170-cf04da0c2728	000d0000-569f-42cf-14fd-1746d8d2efee	00100000-569f-42cf-fcb9-7b1cfdaeb9df	00090000-569f-42cf-e2c1-89b9cf8a1035	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569f-42d0-8f65-b4de3936c784	000d0000-569f-42cf-14fd-1746d8d2efee	\N	00090000-569f-42cf-ac9a-891cea8c5d40	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569f-42d0-2bc7-6913c247cd44	000d0000-569f-42cf-14fd-1746d8d2efee	\N	00090000-569f-42cf-0c23-09d2db242615	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569f-42d0-036b-38c34e0d73f4	000d0000-569f-42cf-e427-8e693a181f3d	\N	00090000-569f-42cf-5194-302345c61364	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569f-42d0-96eb-65c3269362fc	000d0000-569f-42cf-68b8-f1a4ba857a4a	00100000-569f-42cf-fcb9-7b1cfdaeb9df	00090000-569f-42cf-e2c1-89b9cf8a1035	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569f-42d0-14cf-af1fb1a4d0f3	000d0000-569f-42cf-68b8-f1a4ba857a4a	\N	00090000-569f-42cf-f3ef-f988ac203fd9	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3201 (class 0 OID 38204071)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 38203462)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 38203948)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569f-42cf-e438-4e01b1ed810f	00160000-569f-42cf-9609-c2755835327c	00090000-569f-42cf-ac9a-891cea8c5d40	aizv	10	t
003d0000-569f-42cf-675b-9e26fb1e3325	00160000-569f-42cf-9609-c2755835327c	00090000-569f-42cf-2d09-a5d5a7f04948	apri	14	t
003d0000-569f-42cf-bd13-6aa415750498	00160000-569f-42cf-102d-9c4290175527	00090000-569f-42cf-0c23-09d2db242615	aizv	11	t
003d0000-569f-42cf-b19d-6c0c5c9c4c8d	00160000-569f-42cf-0a30-74afe8cebd49	00090000-569f-42cf-b98a-70cc1722590c	aizv	12	t
003d0000-569f-42cf-32b2-a33e67381506	00160000-569f-42cf-9609-c2755835327c	00090000-569f-42cf-f3ef-f988ac203fd9	apri	18	f
\.


--
-- TOC entry 3195 (class 0 OID 38203978)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569f-42cf-9609-c2755835327c	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569f-42cf-102d-9c4290175527	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569f-42cf-0a30-74afe8cebd49	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3216 (class 0 OID 38204390)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 38203784)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 38203710)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569f-42d0-2f31-c85d6354b6d2	\N	00200000-569f-42cf-3415-ad060c3f9f25	\N	\N	\N	00220000-569f-42cf-4ec5-1c1c57e9964e	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569f-42d0-1516-0fe661fe7489	\N	00200000-569f-42cf-224d-1d8371ff47a4	\N	\N	\N	00220000-569f-42cf-4ec5-1c1c57e9964e	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569f-42d0-8473-282a30f5ee64	\N	00200000-569f-42cf-2403-f462254e213f	\N	\N	\N	00220000-569f-42cf-48d5-55ba25f24864	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569f-42d0-30af-95671bf7d3f7	\N	00200000-569f-42cf-fe68-4309e9b5cdf9	\N	\N	\N	00220000-569f-42cf-d244-6761ede34cf0	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569f-42d0-6b17-aae24f355655	\N	00200000-569f-42cf-d39a-9b9ac472adc7	\N	\N	\N	00220000-569f-42cf-8116-6f177794de50	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
00180000-569f-42d0-8f0e-02bf38961c69	001b0000-569f-42d0-a5d4-cf877e7e19c3	\N	\N	\N	\N	00220000-569f-42cf-4e44-628b3e0336a4	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1
\.


--
-- TOC entry 3167 (class 0 OID 38203735)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 38203740)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 38204312)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 38203614)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569f-42cc-45c3-4fb27399a50e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569f-42cc-a013-09a57f219a4c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569f-42cc-399b-ec586ea7759a	AL	ALB	008	Albania 	Albanija	\N
00040000-569f-42cc-4770-be1f8a27236b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569f-42cc-7da1-71fac4e17072	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569f-42cc-416a-547a3eea7193	AD	AND	020	Andorra 	Andora	\N
00040000-569f-42cc-f02e-8a06aac3e0c9	AO	AGO	024	Angola 	Angola	\N
00040000-569f-42cc-c1dd-e714c1193fd1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569f-42cc-6e8a-f8dcb336c1de	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569f-42cc-cf0a-ddc5f633fd30	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-42cc-ba7a-dd8a58625671	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569f-42cc-5922-063ba347a284	AM	ARM	051	Armenia 	Armenija	\N
00040000-569f-42cc-4b51-924d8333de06	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569f-42cc-6432-912b4098d58c	AU	AUS	036	Australia 	Avstralija	\N
00040000-569f-42cc-8823-5b580b0442fe	AT	AUT	040	Austria 	Avstrija	\N
00040000-569f-42cc-2d4a-bf24312168eb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569f-42cc-d9cb-de0cb1bf47b2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569f-42cc-32bc-8ebf449e2957	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569f-42cc-c940-b273d4eac871	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569f-42cc-5611-2bf393bfe6c3	BB	BRB	052	Barbados 	Barbados	\N
00040000-569f-42cc-a7c2-640f0280a1df	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569f-42cc-063e-c06198864541	BE	BEL	056	Belgium 	Belgija	\N
00040000-569f-42cc-cef2-75ce790d8dca	BZ	BLZ	084	Belize 	Belize	\N
00040000-569f-42cc-a955-3482ae442e88	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569f-42cc-50e1-6c949c138381	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569f-42cc-5f61-cd5042cea113	BT	BTN	064	Bhutan 	Butan	\N
00040000-569f-42cc-7a7a-fe2c6bc047ef	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569f-42cc-5f53-abd07c7a4d78	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569f-42cc-b1df-c378d73173c2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569f-42cc-fd40-5d768176895a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569f-42cc-f535-e3f45e2db319	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569f-42cc-142b-d03521fac575	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569f-42cc-b35b-5207611ce868	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569f-42cc-f763-1e7ce01c59d0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569f-42cc-cb35-d4dce5b840c8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569f-42cc-1da2-cb5c14574360	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569f-42cc-31b2-eac3c8e1077f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569f-42cc-418c-a1a4879da669	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569f-42cc-7eb5-c3a78e13e41d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569f-42cc-43b7-68cf3d334e69	CA	CAN	124	Canada 	Kanada	\N
00040000-569f-42cc-ddf9-93784ad2574e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569f-42cc-75c5-173c81ab95fa	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569f-42cc-a3b2-5c845bf0801d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569f-42cc-ecb4-873bb52bcbe9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569f-42cc-9b99-669853b24992	CL	CHL	152	Chile 	Čile	\N
00040000-569f-42cc-c0f3-d2feecccf3de	CN	CHN	156	China 	Kitajska	\N
00040000-569f-42cc-9159-76f6f028ca5c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569f-42cc-bdf3-e8fb758baa6b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569f-42cc-64c3-1bd4ac76187b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569f-42cc-8eb1-a64e37477ad2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569f-42cc-3c13-281dc505cf67	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569f-42cc-2d1b-9894f7bca514	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569f-42cc-a1f7-403949323fc6	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569f-42cc-4ad1-b51cd7c89196	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569f-42cc-00c0-bc58be909395	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569f-42cc-4825-dac5c68834c4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569f-42cc-b314-8169b8ef6ea4	CU	CUB	192	Cuba 	Kuba	\N
00040000-569f-42cc-ebe9-437130f7bf5e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569f-42cc-7541-623bae22ecbf	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569f-42cc-63ff-13982f1945cb	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569f-42cc-f8f3-734e0a3313a3	DK	DNK	208	Denmark 	Danska	\N
00040000-569f-42cc-1f95-962b9957fa79	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569f-42cc-36ff-a6d697ff3798	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-42cc-88c8-13ee58c078f7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569f-42cc-2ada-db87e01b0d24	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569f-42cc-6ca2-68cfe13eb169	EG	EGY	818	Egypt 	Egipt	\N
00040000-569f-42cc-a610-ca9400d74b30	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569f-42cc-da86-31c35dcfd42a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569f-42cc-83d8-eaec477b72c2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569f-42cc-a492-73e4a5996409	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569f-42cc-bfc0-3e3dd4abc623	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569f-42cc-5ffb-8eb068a2cfa3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569f-42cc-cb9d-3bc7c1656fa3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569f-42cc-8f50-b9a1b50f80d1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569f-42cc-e6a4-8e20e0a15b83	FI	FIN	246	Finland 	Finska	\N
00040000-569f-42cc-3974-bb02536b93e1	FR	FRA	250	France 	Francija	\N
00040000-569f-42cc-e9b0-ed59c5ff97b3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569f-42cc-b9e8-6dec1388d1a6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569f-42cc-c663-a9165096902f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569f-42cc-44c7-bb1831130aa0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569f-42cc-fa6b-59834de70ae5	GA	GAB	266	Gabon 	Gabon	\N
00040000-569f-42cc-52e7-cf02f2a925e7	GM	GMB	270	Gambia 	Gambija	\N
00040000-569f-42cc-ab67-6125e605aa5e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569f-42cc-e729-86d351ea6b8e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569f-42cc-728d-af9cbd098010	GH	GHA	288	Ghana 	Gana	\N
00040000-569f-42cc-59f6-c4236828b027	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569f-42cc-fdde-957666a0232a	GR	GRC	300	Greece 	Grčija	\N
00040000-569f-42cc-1362-9d9c1f9fd409	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569f-42cc-9a5b-2fce04ce0916	GD	GRD	308	Grenada 	Grenada	\N
00040000-569f-42cc-8e62-01def0833fad	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569f-42cc-86b4-fdbea914d009	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569f-42cc-9233-c4af6db7eaf3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569f-42cc-e55f-52f8a6a08e21	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569f-42cc-5386-d03bd4f85279	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569f-42cc-6b49-fb56350a46e4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569f-42cc-8818-e79b87fcf718	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569f-42cc-019e-af74c686486e	HT	HTI	332	Haiti 	Haiti	\N
00040000-569f-42cc-551d-8a20d8d5f8ba	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569f-42cc-5c3a-f606782de6f7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569f-42cc-aca8-6422cf8975d3	HN	HND	340	Honduras 	Honduras	\N
00040000-569f-42cc-5fa8-1596231db65e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569f-42cc-1c89-ec642964fb49	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569f-42cc-e3a7-36501d01fda6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569f-42cc-a929-6dc6c251bc2e	IN	IND	356	India 	Indija	\N
00040000-569f-42cc-4c3b-c860384e2f49	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569f-42cc-d5e9-4236272832e6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569f-42cc-6903-99d34b51b2b7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569f-42cc-ac79-c00418ba57b2	IE	IRL	372	Ireland 	Irska	\N
00040000-569f-42cc-3f90-be83ada06e5c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569f-42cc-c1d3-8266215b8b3a	IL	ISR	376	Israel 	Izrael	\N
00040000-569f-42cc-8db9-60c73ad7a1b9	IT	ITA	380	Italy 	Italija	\N
00040000-569f-42cc-853e-df1aa807a85a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569f-42cc-349f-e0303739d486	JP	JPN	392	Japan 	Japonska	\N
00040000-569f-42cc-ced9-d41105302f37	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569f-42cc-4528-f664aa70a1ed	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569f-42cc-4f4c-cabea8dc503e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569f-42cc-6c19-49b87485f966	KE	KEN	404	Kenya 	Kenija	\N
00040000-569f-42cc-d2fe-5de6fbc80e8f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569f-42cc-6b25-097c0e820645	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569f-42cc-addd-0219ff9c6d0d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569f-42cc-2c6d-a32b864bd810	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569f-42cc-26fc-2e1499dd5f14	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569f-42cc-fa43-add11901b606	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569f-42cc-b768-702a1ab45226	LV	LVA	428	Latvia 	Latvija	\N
00040000-569f-42cc-edf6-29a9ebf295b7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569f-42cc-9c67-c6d7075bd877	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569f-42cc-700f-14ea1c7924f0	LR	LBR	430	Liberia 	Liberija	\N
00040000-569f-42cc-b2cf-b3627b6c4732	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569f-42cc-f9a8-a28b8149eaed	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569f-42cc-6919-15d53ffa8f5d	LT	LTU	440	Lithuania 	Litva	\N
00040000-569f-42cc-7214-837af96bf05e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569f-42cc-2cb2-26eabe518154	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569f-42cc-ecfd-f5f0b0cc21e0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569f-42cc-9f2f-4e74191ea5ca	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569f-42cc-e73b-82a6bc92d128	MW	MWI	454	Malawi 	Malavi	\N
00040000-569f-42cc-b15c-9ee5d5cac3e4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569f-42cc-282b-4bfc4cf70b95	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569f-42cc-7288-9eeb02815360	ML	MLI	466	Mali 	Mali	\N
00040000-569f-42cc-f18f-845e0bb53988	MT	MLT	470	Malta 	Malta	\N
00040000-569f-42cc-be51-cdf8b9eb0f5c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569f-42cc-a9f9-d2e6fe394946	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569f-42cc-8541-03c4d53bea67	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569f-42cc-200d-f9b6ac0b31ab	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569f-42cc-fae7-4a3e07a8551b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569f-42cc-96cf-abbd46b8a623	MX	MEX	484	Mexico 	Mehika	\N
00040000-569f-42cc-0e92-8faec4424aef	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569f-42cc-e8b6-db96fa404334	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569f-42cc-0b0f-4c59b52773c3	MC	MCO	492	Monaco 	Monako	\N
00040000-569f-42cc-e7ff-4237cbc6162b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569f-42cc-3bcc-05e62d54ebb4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569f-42cc-4ac6-8d0ca9a40ee2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569f-42cc-5bcc-629c59914f5e	MA	MAR	504	Morocco 	Maroko	\N
00040000-569f-42cc-9546-d2f279e6ab99	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569f-42cc-8f48-b03cf93bbeef	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569f-42cc-de90-08e7543ef611	NA	NAM	516	Namibia 	Namibija	\N
00040000-569f-42cc-9e9a-1834bcdbe1b3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569f-42cc-a15e-44ce1beaf069	NP	NPL	524	Nepal 	Nepal	\N
00040000-569f-42cc-5547-711c6d43845c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569f-42cc-e7ef-afb6f8c17a24	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569f-42cc-4afc-7f36f89c765a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569f-42cc-e0f8-df9e45e7a201	NE	NER	562	Niger 	Niger 	\N
00040000-569f-42cc-b4b1-d0b5bead58ae	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569f-42cc-5531-42892abf81bf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569f-42cc-cd55-ac15a8e05f5b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569f-42cc-a775-896d910b514b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569f-42cc-666e-e906d9790b6c	NO	NOR	578	Norway 	Norveška	\N
00040000-569f-42cc-6d00-5318358313e7	OM	OMN	512	Oman 	Oman	\N
00040000-569f-42cc-bdf5-2f2edb45ccbc	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569f-42cc-b4f8-dba66f78b771	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569f-42cc-86fe-909e5e0bfa7c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569f-42cc-c8cf-3febfdc4098d	PA	PAN	591	Panama 	Panama	\N
00040000-569f-42cc-1de5-ccef3229307d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569f-42cc-1668-2d28f69ec6ba	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569f-42cc-9007-df624790836f	PE	PER	604	Peru 	Peru	\N
00040000-569f-42cc-ce8a-991216a40ed3	PH	PHL	608	Philippines 	Filipini	\N
00040000-569f-42cc-bd77-82e305c6085f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569f-42cc-11f6-914d41d09f85	PL	POL	616	Poland 	Poljska	\N
00040000-569f-42cc-bb41-f4b54cd0bf1b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569f-42cc-ad59-651848999e12	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569f-42cc-d591-0cddc1ce3bbc	QA	QAT	634	Qatar 	Katar	\N
00040000-569f-42cc-0654-6c880a6d9fa4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569f-42cc-bf4d-034e6b89af50	RO	ROU	642	Romania 	Romunija	\N
00040000-569f-42cc-11e6-cd0e0d8e2991	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569f-42cc-9546-48097fa89921	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569f-42cc-a256-8a20b563b300	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569f-42cc-98a2-150c0d64513d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569f-42cc-33cc-eff333baba9e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569f-42cc-48b1-d7d03cd1d2b2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569f-42cc-ef54-4437d1357f7c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569f-42cc-692f-4f3069b5001f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569f-42cc-0f2e-98632cc912e2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569f-42cc-1a4a-0232323522fb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569f-42cc-7f72-cdb46555c977	SM	SMR	674	San Marino 	San Marino	\N
00040000-569f-42cc-3e8a-88e69d978d27	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569f-42cc-dbda-76c3e65c7143	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569f-42cc-5337-13d0871d209f	SN	SEN	686	Senegal 	Senegal	\N
00040000-569f-42cc-4872-5d1cdd347d00	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569f-42cc-2765-c23310d24c3f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569f-42cc-ef9a-40a29040ee75	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569f-42cc-2eaf-4b202d64e1a8	SG	SGP	702	Singapore 	Singapur	\N
00040000-569f-42cc-5164-59646c4065f5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569f-42cc-ba9d-2ac66f4d7a65	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569f-42cc-1224-646f9ce70e46	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569f-42cc-ea32-f4542531f0da	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569f-42cc-8168-eca9771ee4be	SO	SOM	706	Somalia 	Somalija	\N
00040000-569f-42cc-e7a6-90b1ffee6ec4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569f-42cc-5294-c7de75e51a53	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569f-42cc-a29b-9b04497127a1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569f-42cd-42d0-70b6968c32d9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569f-42cd-d7d2-214aee80bd98	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569f-42cd-9670-0bafa81b23ae	SD	SDN	729	Sudan 	Sudan	\N
00040000-569f-42cd-e38a-467c226dba6b	SR	SUR	740	Suriname 	Surinam	\N
00040000-569f-42cd-ce88-9d92d1070099	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569f-42cd-bbc7-a6483547595c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569f-42cd-698e-1468db166f85	SE	SWE	752	Sweden 	Švedska	\N
00040000-569f-42cd-caf7-caf09bf62484	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569f-42cd-244b-a746732794be	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569f-42cd-181b-4f6c33b08d76	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569f-42cd-210c-40eaddc0b11c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569f-42cd-c050-fdd6699a28bf	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569f-42cd-d151-727412540e95	TH	THA	764	Thailand 	Tajska	\N
00040000-569f-42cd-243c-af792c876f9a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569f-42cd-d33a-35e290d77649	TG	TGO	768	Togo 	Togo	\N
00040000-569f-42cd-e09a-3da83e2f0387	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569f-42cd-b86a-9924a69a56ab	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569f-42cd-9d67-20fcd76035e9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569f-42cd-d93d-782b81751a0a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569f-42cd-1a1c-ca9d13feadc4	TR	TUR	792	Turkey 	Turčija	\N
00040000-569f-42cd-b74d-f61343bbc69d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569f-42cd-2591-ff4d9dc6ce70	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-42cd-8c8d-a61f889e4e11	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569f-42cd-7854-f9a29baa8dba	UG	UGA	800	Uganda 	Uganda	\N
00040000-569f-42cd-39c7-19d3e55d2973	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569f-42cd-6584-e710cda129e9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569f-42cd-1452-81d422031462	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569f-42cd-4795-51e50f049ed7	US	USA	840	United States 	Združene države Amerike	\N
00040000-569f-42cd-509f-8618e33c1b1c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569f-42cd-1e60-fe366519ef70	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569f-42cd-d973-417100844125	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569f-42cd-9791-064ce2da427b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569f-42cd-bec3-e1cc47e0e106	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569f-42cd-b965-d53dfbb4d0ab	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569f-42cd-d4aa-0e69ec4cf1ff	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-42cd-325d-4642f5563168	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569f-42cd-97cd-0cb135ccdb75	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569f-42cd-faeb-0049f3775edb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569f-42cd-6299-105fce6e3e03	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569f-42cd-690c-ae29ba5e0a24	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569f-42cd-1f42-057030207176	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3203 (class 0 OID 38204100)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569f-42cf-7b59-7dbfcc4e8de4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569f-42cf-0e8d-ad3ea2143b8b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-42d0-5f90-a2aadb7925ae	000e0000-569f-42cf-3f75-5e7bb25e4238	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-42cc-f1cf-ebd522d238a2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-42d0-fbef-bd8634f5200c	000e0000-569f-42cf-5588-0710dd43b28b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-42cc-0668-2d02eb687f32	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-42d0-52a9-fad8ef02adda	000e0000-569f-42cf-2a2d-fdee77f8a984	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-42cc-f1cf-ebd522d238a2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 38203906)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569f-42cf-3fe3-f1b84e187e95	000e0000-569f-42cf-5588-0710dd43b28b	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569f-42cc-12e0-0dd136cc2579
000d0000-569f-42cf-a52e-57ae3170f31c	000e0000-569f-42cf-2c63-38f5ce9d431d	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-42cc-ca36-5f439077e271
000d0000-569f-42cf-8464-b062ac989cd6	000e0000-569f-42cf-2c63-38f5ce9d431d	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-718c-a17e23cb4d22	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-6cf1-47a193220fef	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-42cc-ca36-5f439077e271
000d0000-569f-42cf-1b7e-170e751e4970	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-f80f-11d205ac271e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-568b-eebb935c1849	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-4068-d70a0b37f319	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569f-42cc-1fde-809ae8d5942f
000d0000-569f-42cf-943c-8c4e7240e6e7	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-402f-3b356564b831	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569f-42cc-12e0-0dd136cc2579
000d0000-569f-42cf-be8a-58ef50b1d4ee	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-f0be-55aaa8491458	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569f-42cc-12e0-0dd136cc2579
000d0000-569f-42cf-7e3b-63b18e066e33	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-021f-1373d4a3ddf5	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-42cc-ca36-5f439077e271
000d0000-569f-42cf-d495-de2118abae84	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-c1be-272bed91f390	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569f-42cc-ca36-5f439077e271
000d0000-569f-42cf-061e-0bced6a5ca4d	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-3f0a-be81c42e7b3f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569f-42cc-6117-53ab4d1bfe9e
000d0000-569f-42cf-f1dc-4e36640d9d2a	000e0000-569f-42cf-5588-0710dd43b28b	000c0000-569f-42d0-aac9-5bf5d216103a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569f-42cc-10c5-1012a4e1036a
000d0000-569f-42cf-a953-fb9ab38edb53	000e0000-569f-42cf-1297-b1ac3636f3d3	000c0000-569f-42d0-3a8e-58a4d7e5913c	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-f760-5a00ddeb544c	000e0000-569f-42cf-a5ce-54a66eecf111	000c0000-569f-42d0-d582-5c0bd43b023d	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-4b9a-6a2ba96ddbad	000e0000-569f-42cf-a5ce-54a66eecf111	000c0000-569f-42d0-e10e-67f95a84c623	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-0605-26b3a52da745	000e0000-569f-42cf-113b-81d13f4af8e3	000c0000-569f-42d0-5e75-5f4d4f85d989	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-ff42-4fe2a2774a5a	000e0000-569f-42cf-54ba-9f43ca9b08ca	000c0000-569f-42d0-9813-62e1450e2c7f	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-30aa-18970fa85e48	000e0000-569f-42cf-7c67-cac6d0d09e7c	000c0000-569f-42d0-cf75-ae81bb3a8eba	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-8219-96c282116f4f	000e0000-569f-42cf-5c81-c726d7426067	000c0000-569f-42d0-7b1d-658a392d79ed	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-1e1c-e44b87092563	000e0000-569f-42cf-ac13-1f40950ef8e9	000c0000-569f-42d0-1f2d-fb9d90949a39	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-f74e-72a51ce585a2	000e0000-569f-42cf-56c3-96793e4249b6	000c0000-569f-42d0-b3e5-2e146aeef7a5	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-14fd-1746d8d2efee	000e0000-569f-42cf-56c3-96793e4249b6	000c0000-569f-42d0-42ee-6ebfaa693836	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-e427-8e693a181f3d	000e0000-569f-42cf-442d-dd452831277e	000c0000-569f-42d0-036b-38c34e0d73f4	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
000d0000-569f-42cf-68b8-f1a4ba857a4a	000e0000-569f-42cf-442d-dd452831277e	000c0000-569f-42d0-96eb-65c3269362fc	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569f-42cc-2387-ceb4f4182b30
\.


--
-- TOC entry 3163 (class 0 OID 38203684)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 38203654)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 38203631)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569f-42cf-efae-a25da624b1c0	00080000-569f-42cf-a934-4bd755900899	00090000-569f-42cf-ccf4-6b33850c57e6	AK		igralka
\.


--
-- TOC entry 3177 (class 0 OID 38203820)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 38204370)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569f-42cf-34ca-9b5933559cd0	00010000-569f-42cd-8008-d04ad114a1b2	\N	Prva mapa	Root mapa	2016-01-20 09:18:23	2016-01-20 09:18:23	R	\N	\N
\.


--
-- TOC entry 3215 (class 0 OID 38204383)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 38204405)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34548309)
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
-- TOC entry 3181 (class 0 OID 38203845)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 38203588)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569f-42cd-a9b8-3cfa7b63674f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569f-42cd-ffe2-7ef77c5b700e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569f-42cd-a865-49a80a397334	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569f-42cd-dd7f-ce4a2a664feb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569f-42cd-bf3a-4727fea23fb1	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569f-42cd-9933-e80738aca411	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569f-42cd-8436-7948b6d736c1	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569f-42cd-e0f3-b11a5f8048fa	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:2:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:5:"value";s:5:"10:00";}s:13:"dopoldanKonec";a:2:{s:5:"label";s:27:"Konec dopoldanskega termina";s:5:"value";s:5:"14:00";}s:15:"popoldanZacetek";a:2:{s:5:"label";s:30:"Začetek popoldanskega termina";s:5:"value";s:5:"15:00";}s:13:"popoldanKonec";a:2:{s:5:"label";s:27:"Konec dopoldanskega termina";s:5:"value";s:5:"19:00";}s:12:"vecerZacetek";a:2:{s:5:"label";s:27:"Začetek večernega termina";s:5:"value";s:5:"20:00";}s:10:"vecerKonec";a:2:{s:5:"label";s:24:"Konec večernega termina";s:5:"value";s:5:"23:00";}}	f	f	f	\N	Privzete vrednosti za termine dogodkov v hh:mm
00000000-569f-42cd-4210-99ed21f3138b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569f-42cd-295f-4540671e8ef0	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-42cd-7e96-bfece0898f2b	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-42cd-9ac5-f9e4e5c5c6b2	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569f-42cd-1a26-213647b20de4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569f-42cd-08bf-d347e57dd9a9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569f-42ce-3372-a0e6863f0c93	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569f-42ce-b467-7fa59649251f	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569f-42cf-cf2d-58241a5be67c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569f-42cf-2bc6-133cbad7584f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569f-42cf-8df5-760b7af0317f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569f-42cf-2cb6-f1c964e02bfb	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569f-42cf-748c-c59300de972b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569f-42d1-cfca-c8d54a2747cf	application.tenant.maticnopodjetje	string	s:36:"00080000-569f-42d1-d49c-9fbfb39a08ab";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3148 (class 0 OID 38203488)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569f-42cf-5189-aec86e179e3b	00000000-569f-42cf-cf2d-58241a5be67c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569f-42cf-7b07-ae0a26b6b09a	00000000-569f-42cf-cf2d-58241a5be67c	00010000-569f-42cd-8008-d04ad114a1b2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569f-42cf-6d7e-3f446ebea2f9	00000000-569f-42cf-2bc6-133cbad7584f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3152 (class 0 OID 38203555)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569f-42cf-24ae-e7fbf3f902f1	\N	00100000-569f-42cf-40f4-56ba8c21d1b8	00100000-569f-42cf-fcb9-7b1cfdaeb9df	01	Gledališče Nimbis
00410000-569f-42cf-fab0-4416ad149d28	00410000-569f-42cf-24ae-e7fbf3f902f1	00100000-569f-42cf-40f4-56ba8c21d1b8	00100000-569f-42cf-fcb9-7b1cfdaeb9df	02	Tehnika
\.


--
-- TOC entry 3149 (class 0 OID 38203499)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569f-42cf-5ae8-01f2c8520a91	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569f-42cf-2bca-83fde894eb60	00010000-569f-42cf-3878-91a84a7f4d62	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569f-42cf-e2c1-89b9cf8a1035	00010000-569f-42cf-38e8-ffd503c8a5a3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569f-42cf-8720-f548c3ab4f20	00010000-569f-42cf-7650-c2b33016a745	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569f-42cf-800a-2aef0c9d9f81	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569f-42cf-0bfe-6e965e54408d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569f-42cf-4437-79c3fdb5d141	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569f-42cf-b158-7f7f22e8bf47	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569f-42cf-ccf4-6b33850c57e6	00010000-569f-42cf-5e71-7a37418dba3f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569f-42cf-6465-e611cb259be9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569f-42cf-683f-15953ad5f9a7	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-42cf-11ea-f25064e74281	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569f-42cf-5194-302345c61364	00010000-569f-42cf-73bc-549d609ecd84	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-42cf-ac9a-891cea8c5d40	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-42cf-2d09-a5d5a7f04948	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-42cf-0c23-09d2db242615	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-42cf-b98a-70cc1722590c	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-42cf-f3ef-f988ac203fd9	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-42cf-c30b-79ac13290455	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-42cf-1b8e-ac856087fb95	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-42cf-e7de-2f988fa15c76	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 38203434)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569f-42cd-0708-e16affa0532d	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569f-42cd-2823-652f7c8f0099	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569f-42cd-a07b-d74563b6042d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569f-42cd-0015-80de9672adf2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569f-42cd-b734-e6e0623bab28	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569f-42cd-e64e-a240720e931c	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569f-42cd-b98d-dacf59e791da	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569f-42cd-1d1c-3ab816b7c749	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569f-42cd-7f7b-4c97f9536bad	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569f-42cd-5e04-bfe660aa4a59	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569f-42cd-aef9-362e4bae5b6b	Abonma-read	Abonma - branje	t
00030000-569f-42cd-388c-2b27199d857c	Abonma-write	Abonma - spreminjanje	t
00030000-569f-42cd-55b4-dc80169518c0	Alternacija-read	Alternacija - branje	t
00030000-569f-42cd-2891-6fbc368e3b26	Alternacija-write	Alternacija - spreminjanje	t
00030000-569f-42cd-4163-35cea815846f	Arhivalija-read	Arhivalija - branje	t
00030000-569f-42cd-6b05-63f5e002b95b	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569f-42cd-8fd9-b642d0e2f73f	AuthStorage-read	AuthStorage - branje	t
00030000-569f-42cd-07d3-34a8f481ac15	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569f-42cd-511c-f17193941bb0	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569f-42cd-b66f-3886106703bf	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569f-42cd-5536-748199ffd192	Besedilo-read	Besedilo - branje	t
00030000-569f-42cd-634c-a3f782691574	Besedilo-write	Besedilo - spreminjanje	t
00030000-569f-42cd-b489-5050101c408a	Dodatek-read	Dodatek - branje	t
00030000-569f-42cd-86d1-5eb8d6c958da	Dodatek-write	Dodatek - spreminjanje	t
00030000-569f-42cd-3b5e-9dc188fda302	Dogodek-read	Dogodek - branje	t
00030000-569f-42cd-22f4-8a19789303a1	Dogodek-write	Dogodek - spreminjanje	t
00030000-569f-42cd-c9dd-a3bb7eaaa6ba	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569f-42cd-2d54-6332bd22a330	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569f-42cd-aada-7f767ee1501d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569f-42cd-fb36-8eb1a1d9d89a	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569f-42cd-584c-c0bf85192070	DogodekTrait-read	DogodekTrait - branje	t
00030000-569f-42cd-866c-f85d2ac40e73	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569f-42cd-5b0e-c4d19ae81ab1	DrugiVir-read	DrugiVir - branje	t
00030000-569f-42cd-8a46-4a2e360cb16c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569f-42cd-621f-2d814b9e437c	Drzava-read	Drzava - branje	t
00030000-569f-42cd-fb7a-80bafd91f687	Drzava-write	Drzava - spreminjanje	t
00030000-569f-42cd-6cec-bfbe40722303	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569f-42cd-c120-adca2d973d39	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569f-42cd-0a5b-4fedf7d83da6	Funkcija-read	Funkcija - branje	t
00030000-569f-42cd-3c0d-723b2981f61c	Funkcija-write	Funkcija - spreminjanje	t
00030000-569f-42cd-534a-48e832505834	Gostovanje-read	Gostovanje - branje	t
00030000-569f-42cd-1814-cb32e6b87120	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569f-42cd-a0f7-19f1f129f1be	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569f-42cd-8e7e-fa83a1b132f4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569f-42cd-1300-fc2dfcb8d9dc	Kupec-read	Kupec - branje	t
00030000-569f-42cd-efc9-75d3894f7412	Kupec-write	Kupec - spreminjanje	t
00030000-569f-42cd-3a5c-be17b1d4365a	NacinPlacina-read	NacinPlacina - branje	t
00030000-569f-42cd-294f-817865fcd66b	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569f-42cd-26bf-e28d8ff32794	Option-read	Option - branje	t
00030000-569f-42cd-8c69-791c9763ea0e	Option-write	Option - spreminjanje	t
00030000-569f-42cd-139a-c597fbcf838f	OptionValue-read	OptionValue - branje	t
00030000-569f-42cd-8aa7-758fc1aa4181	OptionValue-write	OptionValue - spreminjanje	t
00030000-569f-42cd-ccc1-2807775d8b66	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569f-42cd-e89d-1fefd2c7f83f	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569f-42cd-68ad-3f5ef5f24710	Oseba-read	Oseba - branje	t
00030000-569f-42cd-a120-e320404f4cca	Oseba-write	Oseba - spreminjanje	t
00030000-569f-42cd-f6ac-1cc77543cec0	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569f-42cd-ecba-1e39d37dbfed	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569f-42cd-543a-8618ef38777c	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569f-42cd-fd59-3254ded78bad	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569f-42cd-3ae1-266a149908c6	Pogodba-read	Pogodba - branje	t
00030000-569f-42cd-3a93-18dbbf83dd03	Pogodba-write	Pogodba - spreminjanje	t
00030000-569f-42cd-d333-e090939913e5	Popa-read	Popa - branje	t
00030000-569f-42cd-fb31-768d20582733	Popa-write	Popa - spreminjanje	t
00030000-569f-42cd-5e62-0b24a4896c54	Posta-read	Posta - branje	t
00030000-569f-42cd-b2f5-7f38120e1a29	Posta-write	Posta - spreminjanje	t
00030000-569f-42cd-ace5-40623a84e915	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569f-42cd-81e7-774daac8f2b9	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569f-42cd-5dfe-6787e152a4fc	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569f-42cd-4466-d1020bfe3374	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569f-42cd-5816-e5eb51f63e15	PostniNaslov-read	PostniNaslov - branje	t
00030000-569f-42cd-ac11-6a4591dabdb9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569f-42cd-cf70-54a52d56e1f9	Praznik-read	Praznik - branje	t
00030000-569f-42cd-f658-71d24f17da2d	Praznik-write	Praznik - spreminjanje	t
00030000-569f-42cd-9806-4c5c6a46338e	Predstava-read	Predstava - branje	t
00030000-569f-42cd-194c-cea065ef0f83	Predstava-write	Predstava - spreminjanje	t
00030000-569f-42cd-da64-0d99be1fadf5	Ura-read	Ura - branje	t
00030000-569f-42cd-9d46-4f5327de517e	Ura-write	Ura - spreminjanje	t
00030000-569f-42cd-8258-a2104fdbe63a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569f-42cd-0c28-fdf0b8de07ac	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569f-42cd-d148-84932e9971ad	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569f-42cd-0801-50fe56491675	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569f-42cd-ac4b-b6da1f959697	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569f-42cd-ed8a-9ad1b282097d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569f-42cd-ee92-63e1d9aa8450	ProgramDela-read	ProgramDela - branje	t
00030000-569f-42cd-aa82-910c9674cf54	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569f-42cd-f815-f62a803a92ab	ProgramFestival-read	ProgramFestival - branje	t
00030000-569f-42cd-9456-b90c6e4282d9	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569f-42cd-f1fc-c5583f430d99	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569f-42cd-9a97-b75994810326	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569f-42cd-7192-03055068d9d8	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569f-42cd-d255-1f8fc5002cd0	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569f-42cd-2712-f1282dca5983	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569f-42cd-6035-fee4dd8eb414	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569f-42cd-e747-e56ed28f23f8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569f-42cd-5660-ea25a36ace64	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569f-42cd-d238-f6b4b60c0a3a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569f-42cd-e154-cfea7cbfd071	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569f-42cd-5314-3dd659024be9	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569f-42cd-5292-3ff5cb85f17d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569f-42cd-89fc-ee2e6cc8dc1c	ProgramRazno-read	ProgramRazno - branje	t
00030000-569f-42cd-115e-fe412d22cca5	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569f-42cd-4aa3-36ffc6a433d2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569f-42cd-376e-819100ce65e5	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569f-42cd-33ee-c9b90aa944e1	Prostor-read	Prostor - branje	t
00030000-569f-42cd-7e20-b28f0936192d	Prostor-write	Prostor - spreminjanje	t
00030000-569f-42cd-3bdf-e49732a40431	Racun-read	Racun - branje	t
00030000-569f-42cd-b833-717cd8726cd9	Racun-write	Racun - spreminjanje	t
00030000-569f-42cd-4195-4834aaa611c8	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569f-42cd-b8a5-300c4379bd52	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569f-42cd-c8d1-b847d4f0c5de	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569f-42cd-f394-9a3259f92874	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569f-42cd-bddb-cb89f2a2d5d4	Rekvizit-read	Rekvizit - branje	t
00030000-569f-42cd-a095-1d1138186683	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569f-42cd-ba80-44f901cc957e	Revizija-read	Revizija - branje	t
00030000-569f-42cd-ad3a-01aac1ac5564	Revizija-write	Revizija - spreminjanje	t
00030000-569f-42cd-f8af-f8b62116d4aa	Rezervacija-read	Rezervacija - branje	t
00030000-569f-42cd-e1b9-4f840b69766b	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569f-42cd-1f04-3774edef8cf4	SedezniRed-read	SedezniRed - branje	t
00030000-569f-42cd-c472-a19e4b41fcc4	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569f-42cd-0d12-8227db23f7ea	Sedez-read	Sedez - branje	t
00030000-569f-42cd-f671-c10021fd7ef2	Sedez-write	Sedez - spreminjanje	t
00030000-569f-42cd-3e84-274e1e4f9015	Sezona-read	Sezona - branje	t
00030000-569f-42cd-88e5-49507916a88e	Sezona-write	Sezona - spreminjanje	t
00030000-569f-42cd-9ced-cae5caea6251	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569f-42cd-fc2e-158fb35a678e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569f-42cd-fa9b-7365ba9f7a70	Telefonska-read	Telefonska - branje	t
00030000-569f-42cd-88fe-934551aac95d	Telefonska-write	Telefonska - spreminjanje	t
00030000-569f-42cd-f9e1-9cc7260eb909	TerminStoritve-read	TerminStoritve - branje	t
00030000-569f-42cd-adff-2dae625c0f4e	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569f-42cd-62e4-d8688a6f0c0f	TipDodatka-read	TipDodatka - branje	t
00030000-569f-42cd-dcca-7d961f72d3a4	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569f-42cd-a2e1-2befadf8a006	TipFunkcije-read	TipFunkcije - branje	t
00030000-569f-42cd-f920-812811e2f1a8	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569f-42cd-acdb-8f1037736e25	TipPopa-read	TipPopa - branje	t
00030000-569f-42cd-ba80-6f2f8642635b	TipPopa-write	TipPopa - spreminjanje	t
00030000-569f-42cd-09b5-ef770f831f03	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569f-42cd-f317-cf7dae417119	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569f-42cd-e264-01e80851d6de	TipVaje-read	TipVaje - branje	t
00030000-569f-42cd-51cc-a16ce31e196c	TipVaje-write	TipVaje - spreminjanje	t
00030000-569f-42cd-3b76-907a901a01e1	Trr-read	Trr - branje	t
00030000-569f-42cd-4828-9f0e0a83dbdd	Trr-write	Trr - spreminjanje	t
00030000-569f-42cd-9b34-7404d445776f	Uprizoritev-read	Uprizoritev - branje	t
00030000-569f-42cd-bf21-ad0e8c2676e3	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569f-42cd-dbf5-fa442df976e7	Vaja-read	Vaja - branje	t
00030000-569f-42cd-b227-ac02e84663c5	Vaja-write	Vaja - spreminjanje	t
00030000-569f-42cd-c0c0-d4e9307cb597	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569f-42cd-ad37-b002b7f557ba	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569f-42cd-9bbc-4dc79b643434	VrstaStroska-read	VrstaStroska - branje	t
00030000-569f-42cd-6cbb-d870149140ef	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569f-42cd-0cca-79fd307529d9	Zaposlitev-read	Zaposlitev - branje	t
00030000-569f-42cd-0ed2-fe83b619f83b	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569f-42cd-b6f3-b6d6faad7016	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569f-42cd-5d01-8b5b19735a5e	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569f-42cd-a31e-ba3bcaa5420a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569f-42cd-ec30-c2b7d826d14c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569f-42cd-1dfd-2d1a0f508b69	Job-read	Branje opravil - samo zase - branje	t
00030000-569f-42cd-a9f0-45dad734dcab	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569f-42cd-a9ea-905f8dc8ec4b	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569f-42cd-4b66-ff6d0675e94d	Report-read	Report - branje	t
00030000-569f-42cd-0bb8-8f13bb23709b	Report-write	Report - spreminjanje	t
00030000-569f-42cd-778b-574f51a3fc7d	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569f-42cd-8ab5-ff75ad7743ce	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569f-42cd-df4d-c0f305f6f3f7	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569f-42cd-5761-072461f4e7a6	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569f-42cd-5ca9-4435ac92d889	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569f-42cd-8f53-80ffe96c7dc8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569f-42cd-6d38-5d16b01e3e07	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569f-42cd-008d-33241a79ae56	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-42cd-1008-2d32de7ed967	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-42cd-e52e-84e55a87a20f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-42cd-bb27-e5f171a5e5df	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-42cd-f2c0-126f8e6f62bf	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569f-42cd-3536-3f19ac0187e1	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569f-42cd-effd-5e321bed4e2c	Datoteka-write	Datoteka - spreminjanje	t
00030000-569f-42cd-4122-4e3b325fb2e0	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3143 (class 0 OID 38203453)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569f-42cd-5b4d-b8f1f158d4f0	00030000-569f-42cd-2823-652f7c8f0099
00020000-569f-42cd-5b4d-b8f1f158d4f0	00030000-569f-42cd-0708-e16affa0532d
00020000-569f-42cd-6b9d-bc5b9ea74cf9	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-b66f-3886106703bf
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-634c-a3f782691574
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-f8b2-fff31c6d130b	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-cd80-ebf5f93b5454	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cd-cd80-ebf5f93b5454	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-cd80-ebf5f93b5454	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-cd80-ebf5f93b5454	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-cd80-ebf5f93b5454	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-cd80-ebf5f93b5454	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-62de-eed3dadc7057	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-62de-eed3dadc7057	00030000-569f-42cd-0ed2-fe83b619f83b
00020000-569f-42cd-62de-eed3dadc7057	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-62de-eed3dadc7057	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cd-62de-eed3dadc7057	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-62de-eed3dadc7057	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-62de-eed3dadc7057	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-879c-7340a00cffda	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-879c-7340a00cffda	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-879c-7340a00cffda	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-1e3c-ec2576f09aa2	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-1e3c-ec2576f09aa2	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-1e3c-ec2576f09aa2	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-1e3c-ec2576f09aa2	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-1e3c-ec2576f09aa2	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-1e3c-ec2576f09aa2	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-1e3c-ec2576f09aa2	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-1e3c-ec2576f09aa2	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-7af4-58a05e5d3ef7	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-7af4-58a05e5d3ef7	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-7af4-58a05e5d3ef7	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-7af4-58a05e5d3ef7	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-4828-9f0e0a83dbdd
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-ac11-6a4591dabdb9
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-88fe-934551aac95d
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-26e2-ca835f126ef8	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-7cce-7611295ecadb	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-7cce-7611295ecadb	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-7cce-7611295ecadb	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-7cce-7611295ecadb	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-7cce-7611295ecadb	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-7cce-7611295ecadb	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-7cce-7611295ecadb	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-88fe-934551aac95d
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-ac11-6a4591dabdb9
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-4828-9f0e0a83dbdd
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-fb31-768d20582733
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-8e7e-fa83a1b132f4
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-ed8a-9ad1b282097d
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-0f29-9a0b80bbf0fc	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-5104-9cf35b196019	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-8677-1604c21ef561	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-8677-1604c21ef561	00030000-569f-42cd-ba80-6f2f8642635b
00020000-569f-42cd-51a9-445a00cdc13d	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-4fdd-483282bc01d4	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-4fdd-483282bc01d4	00030000-569f-42cd-b2f5-7f38120e1a29
00020000-569f-42cd-72ba-13de8dbd7749	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-522d-3932a28f993b	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-522d-3932a28f993b	00030000-569f-42cd-fb7a-80bafd91f687
00020000-569f-42cd-439d-cb1e841fc789	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-bef1-b3cb48f8671c	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cd-bef1-b3cb48f8671c	00030000-569f-42cd-ec30-c2b7d826d14c
00020000-569f-42cd-9553-ee9c82d48eb8	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cd-6a98-186c7bca5faa	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-6a98-186c7bca5faa	00030000-569f-42cd-5d01-8b5b19735a5e
00020000-569f-42cd-3822-4d680e5f715e	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-5632-fa75cbc477be	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cd-5632-fa75cbc477be	00030000-569f-42cd-388c-2b27199d857c
00020000-569f-42cd-609c-ce56addde446	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cd-80d6-2931645e808d	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-80d6-2931645e808d	00030000-569f-42cd-7e20-b28f0936192d
00020000-569f-42cd-80d6-2931645e808d	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-80d6-2931645e808d	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-80d6-2931645e808d	00030000-569f-42cd-ac11-6a4591dabdb9
00020000-569f-42cd-80d6-2931645e808d	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-03e7-1db066fbe4d3	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-03e7-1db066fbe4d3	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-03e7-1db066fbe4d3	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-96e9-bbd94c95ce3e	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-96e9-bbd94c95ce3e	00030000-569f-42cd-6cbb-d870149140ef
00020000-569f-42cd-120e-3cbc1afb6a53	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-e89d-1fefd2c7f83f
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-c724-4085b9b5dd7a	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-ea8d-51c962ebeff2	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-ea8d-51c962ebeff2	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-ea8d-51c962ebeff2	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-ea8d-51c962ebeff2	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-ea8d-51c962ebeff2	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-198a-9b0d5247fe84	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cd-198a-9b0d5247fe84	00030000-569f-42cd-51cc-a16ce31e196c
00020000-569f-42cd-17cd-32374b4c52f7	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-b98d-dacf59e791da
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-1d1c-3ab816b7c749
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-ee92-63e1d9aa8450
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-aa82-910c9674cf54
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-f815-f62a803a92ab
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-9456-b90c6e4282d9
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-f1fc-c5583f430d99
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-9a97-b75994810326
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-7192-03055068d9d8
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-d255-1f8fc5002cd0
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-2712-f1282dca5983
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-6035-fee4dd8eb414
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-e747-e56ed28f23f8
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-5660-ea25a36ace64
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-d238-f6b4b60c0a3a
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-e154-cfea7cbfd071
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-5314-3dd659024be9
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-5292-3ff5cb85f17d
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-89fc-ee2e6cc8dc1c
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-115e-fe412d22cca5
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-4aa3-36ffc6a433d2
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-376e-819100ce65e5
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-0801-50fe56491675
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-8a46-4a2e360cb16c
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-81e7-774daac8f2b9
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-a9f0-45dad734dcab
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-5b0e-c4d19ae81ab1
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-d148-84932e9971ad
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-ace5-40623a84e915
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-1dfd-2d1a0f508b69
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-7802-6d336ea0bf78	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-ee92-63e1d9aa8450
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-f815-f62a803a92ab
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-f1fc-c5583f430d99
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-7192-03055068d9d8
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-2712-f1282dca5983
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-e747-e56ed28f23f8
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-d238-f6b4b60c0a3a
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-5314-3dd659024be9
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-89fc-ee2e6cc8dc1c
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-4aa3-36ffc6a433d2
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-d148-84932e9971ad
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-5b0e-c4d19ae81ab1
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-ace5-40623a84e915
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-1dfd-2d1a0f508b69
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-ef4d-e02e7ac8ffdd	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-bf21-ad0e8c2676e3
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-5e04-bfe660aa4a59
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-6638-cb6e87d72f76	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-606d-e2754fe0b68a	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-92fa-fe0d50eb9924	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-92fa-fe0d50eb9924	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-92fa-fe0d50eb9924	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-92fa-fe0d50eb9924	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cd-92fa-fe0d50eb9924	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-92fa-fe0d50eb9924	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-92fa-fe0d50eb9924	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-92fa-fe0d50eb9924	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-3a93-18dbbf83dd03
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-fc2e-158fb35a678e
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-a3e5-4d0b10bd33b5	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-c4b2-8e5cd2fa5aec	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-9904-a6f2624f2649	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-9904-a6f2624f2649	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-9904-a6f2624f2649	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-9904-a6f2624f2649	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-9904-a6f2624f2649	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-9904-a6f2624f2649	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-9904-a6f2624f2649	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-69de-5f7fed3ec683	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-69de-5f7fed3ec683	00030000-569f-42cd-fc2e-158fb35a678e
00020000-569f-42cd-69de-5f7fed3ec683	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-69de-5f7fed3ec683	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-05d3-213b239b5317	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-05d3-213b239b5317	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-b66f-3886106703bf
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-634c-a3f782691574
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-5b0e-c4d19ae81ab1
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-8a46-4a2e360cb16c
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-5e04-bfe660aa4a59
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-1dfd-2d1a0f508b69
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-a9f0-45dad734dcab
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-3a93-18dbbf83dd03
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-ace5-40623a84e915
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-81e7-774daac8f2b9
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-d148-84932e9971ad
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-0801-50fe56491675
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-b98d-dacf59e791da
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-ee92-63e1d9aa8450
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-1d1c-3ab816b7c749
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-aa82-910c9674cf54
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-f815-f62a803a92ab
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-9456-b90c6e4282d9
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-f1fc-c5583f430d99
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-9a97-b75994810326
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-7192-03055068d9d8
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-d255-1f8fc5002cd0
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-2712-f1282dca5983
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-6035-fee4dd8eb414
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-e747-e56ed28f23f8
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-5660-ea25a36ace64
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-d238-f6b4b60c0a3a
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-e154-cfea7cbfd071
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-5314-3dd659024be9
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-5292-3ff5cb85f17d
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-89fc-ee2e6cc8dc1c
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-115e-fe412d22cca5
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-4aa3-36ffc6a433d2
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-376e-819100ce65e5
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-fc2e-158fb35a678e
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-bf21-ad0e8c2676e3
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-f0ce-9fb1ea01dd7e	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-b66f-3886106703bf
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-634c-a3f782691574
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-31b4-46aca90dbf38	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-b66f-3886106703bf
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-634c-a3f782691574
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-5e04-bfe660aa4a59
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-bf21-ad0e8c2676e3
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-c283-26ddff7decd0	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-b66f-3886106703bf
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-634c-a3f782691574
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-5b0e-c4d19ae81ab1
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-8a46-4a2e360cb16c
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-5e04-bfe660aa4a59
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-1dfd-2d1a0f508b69
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-a9f0-45dad734dcab
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-8e7e-fa83a1b132f4
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-3a93-18dbbf83dd03
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-fb31-768d20582733
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-ace5-40623a84e915
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-81e7-774daac8f2b9
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-ac11-6a4591dabdb9
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-d148-84932e9971ad
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-0801-50fe56491675
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-ed8a-9ad1b282097d
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-b98d-dacf59e791da
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-ee92-63e1d9aa8450
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-1d1c-3ab816b7c749
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-aa82-910c9674cf54
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-f815-f62a803a92ab
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-9456-b90c6e4282d9
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-f1fc-c5583f430d99
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-9a97-b75994810326
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-7192-03055068d9d8
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-d255-1f8fc5002cd0
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-2712-f1282dca5983
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-6035-fee4dd8eb414
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-e747-e56ed28f23f8
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-5660-ea25a36ace64
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-d238-f6b4b60c0a3a
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-e154-cfea7cbfd071
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-5314-3dd659024be9
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-5292-3ff5cb85f17d
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-89fc-ee2e6cc8dc1c
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-115e-fe412d22cca5
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-4aa3-36ffc6a433d2
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-376e-819100ce65e5
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-fc2e-158fb35a678e
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-88fe-934551aac95d
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-4828-9f0e0a83dbdd
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-bf21-ad0e8c2676e3
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-0ed2-fe83b619f83b
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-b7d3-e9afb540d52a	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-b66f-3886106703bf
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-634c-a3f782691574
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-5e04-bfe660aa4a59
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-8e7e-fa83a1b132f4
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-fb31-768d20582733
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-ac11-6a4591dabdb9
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-ed8a-9ad1b282097d
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-88fe-934551aac95d
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-4828-9f0e0a83dbdd
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-bf21-ad0e8c2676e3
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-0ed2-fe83b619f83b
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-7a90-5c353c35c954	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-1e64-335030d70003	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-5b0e-c4d19ae81ab1
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-8a46-4a2e360cb16c
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-1dfd-2d1a0f508b69
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-a9f0-45dad734dcab
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-8e7e-fa83a1b132f4
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-e89d-1fefd2c7f83f
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-3a93-18dbbf83dd03
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-fb31-768d20582733
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-ace5-40623a84e915
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-81e7-774daac8f2b9
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-ac11-6a4591dabdb9
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-d148-84932e9971ad
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-0801-50fe56491675
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-ed8a-9ad1b282097d
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-b98d-dacf59e791da
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-ee92-63e1d9aa8450
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-1d1c-3ab816b7c749
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-aa82-910c9674cf54
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-f815-f62a803a92ab
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-9456-b90c6e4282d9
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-f1fc-c5583f430d99
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-9a97-b75994810326
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-7192-03055068d9d8
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-d255-1f8fc5002cd0
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-2712-f1282dca5983
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-6035-fee4dd8eb414
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-e747-e56ed28f23f8
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-5660-ea25a36ace64
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-d238-f6b4b60c0a3a
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-e154-cfea7cbfd071
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-5314-3dd659024be9
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-5292-3ff5cb85f17d
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-89fc-ee2e6cc8dc1c
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-115e-fe412d22cca5
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-4aa3-36ffc6a433d2
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-376e-819100ce65e5
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-fc2e-158fb35a678e
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-88fe-934551aac95d
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-4828-9f0e0a83dbdd
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-6cbb-d870149140ef
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-0ed2-fe83b619f83b
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cd-c422-7b138ac17f00	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0708-e16affa0532d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-2823-652f7c8f0099
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-aef9-362e4bae5b6b
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-388c-2b27199d857c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-4163-35cea815846f
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-6b05-63f5e002b95b
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-8fd9-b642d0e2f73f
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-07d3-34a8f481ac15
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-511c-f17193941bb0
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-b66f-3886106703bf
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5536-748199ffd192
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-634c-a3f782691574
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3b5e-9dc188fda302
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0015-80de9672adf2
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-c9dd-a3bb7eaaa6ba
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-2d54-6332bd22a330
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-aada-7f767ee1501d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-fb36-8eb1a1d9d89a
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-584c-c0bf85192070
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-866c-f85d2ac40e73
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-22f4-8a19789303a1
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5b0e-c4d19ae81ab1
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-8a46-4a2e360cb16c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-621f-2d814b9e437c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-fb7a-80bafd91f687
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-6cec-bfbe40722303
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-c120-adca2d973d39
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5e04-bfe660aa4a59
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-534a-48e832505834
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-1814-cb32e6b87120
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-a9ea-905f8dc8ec4b
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-1dfd-2d1a0f508b69
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-a9f0-45dad734dcab
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-a0f7-19f1f129f1be
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-8e7e-fa83a1b132f4
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-1300-fc2dfcb8d9dc
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-efc9-75d3894f7412
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-6d38-5d16b01e3e07
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-8f53-80ffe96c7dc8
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-8ab5-ff75ad7743ce
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-df4d-c0f305f6f3f7
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5761-072461f4e7a6
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5ca9-4435ac92d889
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3a5c-be17b1d4365a
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-294f-817865fcd66b
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-26bf-e28d8ff32794
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-139a-c597fbcf838f
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-8aa7-758fc1aa4181
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-8c69-791c9763ea0e
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ccc1-2807775d8b66
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-e89d-1fefd2c7f83f
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f6ac-1cc77543cec0
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ecba-1e39d37dbfed
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-543a-8618ef38777c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-fd59-3254ded78bad
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3a93-18dbbf83dd03
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-fb31-768d20582733
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5e62-0b24a4896c54
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ace5-40623a84e915
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-81e7-774daac8f2b9
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5dfe-6787e152a4fc
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-4466-d1020bfe3374
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-b2f5-7f38120e1a29
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ac11-6a4591dabdb9
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-cf70-54a52d56e1f9
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f658-71d24f17da2d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-9806-4c5c6a46338e
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-194c-cea065ef0f83
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-8258-a2104fdbe63a
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0c28-fdf0b8de07ac
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-d148-84932e9971ad
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0801-50fe56491675
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ac4b-b6da1f959697
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ed8a-9ad1b282097d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-b98d-dacf59e791da
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ee92-63e1d9aa8450
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-1d1c-3ab816b7c749
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-aa82-910c9674cf54
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f815-f62a803a92ab
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-9456-b90c6e4282d9
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f1fc-c5583f430d99
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-9a97-b75994810326
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-7192-03055068d9d8
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-d255-1f8fc5002cd0
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-2712-f1282dca5983
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-6035-fee4dd8eb414
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-e747-e56ed28f23f8
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5660-ea25a36ace64
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-d238-f6b4b60c0a3a
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-e154-cfea7cbfd071
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5314-3dd659024be9
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5292-3ff5cb85f17d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-89fc-ee2e6cc8dc1c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-115e-fe412d22cca5
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-4aa3-36ffc6a433d2
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-376e-819100ce65e5
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-33ee-c9b90aa944e1
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-7e20-b28f0936192d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3bdf-e49732a40431
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-b833-717cd8726cd9
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-4195-4834aaa611c8
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-b8a5-300c4379bd52
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-c8d1-b847d4f0c5de
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f394-9a3259f92874
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-bddb-cb89f2a2d5d4
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-a095-1d1138186683
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-4b66-ff6d0675e94d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0bb8-8f13bb23709b
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ba80-44f901cc957e
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ad3a-01aac1ac5564
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f8af-f8b62116d4aa
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-e1b9-4f840b69766b
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-1f04-3774edef8cf4
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-c472-a19e4b41fcc4
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0d12-8227db23f7ea
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f671-c10021fd7ef2
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3e84-274e1e4f9015
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-88e5-49507916a88e
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-778b-574f51a3fc7d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-fc2e-158fb35a678e
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-88fe-934551aac95d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f9e1-9cc7260eb909
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-a07b-d74563b6042d
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-adff-2dae625c0f4e
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-a2e1-2befadf8a006
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f920-812811e2f1a8
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-acdb-8f1037736e25
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ba80-6f2f8642635b
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-09b5-ef770f831f03
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f317-cf7dae417119
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-e264-01e80851d6de
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-51cc-a16ce31e196c
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-4828-9f0e0a83dbdd
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-bf21-ad0e8c2676e3
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-dbf5-fa442df976e7
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-b227-ac02e84663c5
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-c0c0-d4e9307cb597
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ad37-b002b7f557ba
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-9bbc-4dc79b643434
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-6cbb-d870149140ef
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-3536-3f19ac0187e1
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-f2c0-126f8e6f62bf
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-0ed2-fe83b619f83b
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-b6f3-b6d6faad7016
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-5d01-8b5b19735a5e
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-a31e-ba3bcaa5420a
00020000-569f-42cf-aa42-6dcf90b37ff0	00030000-569f-42cd-ec30-c2b7d826d14c
00020000-569f-42cf-6ab7-a503269025e4	00030000-569f-42cd-bb27-e5f171a5e5df
00020000-569f-42cf-4a3a-adf4be04bde0	00030000-569f-42cd-e52e-84e55a87a20f
00020000-569f-42cf-36c2-8779f1071db3	00030000-569f-42cd-bf21-ad0e8c2676e3
00020000-569f-42cf-a646-cb207786f7a4	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cf-24fd-8ff4574dd1d5	00030000-569f-42cd-df4d-c0f305f6f3f7
00020000-569f-42cf-ed4b-ea9a4993d329	00030000-569f-42cd-5761-072461f4e7a6
00020000-569f-42cf-4303-938f7f760df1	00030000-569f-42cd-5ca9-4435ac92d889
00020000-569f-42cf-2885-ba8d45ad1d94	00030000-569f-42cd-8ab5-ff75ad7743ce
00020000-569f-42cf-5052-533d535cdd89	00030000-569f-42cd-6d38-5d16b01e3e07
00020000-569f-42cf-7105-a605f58f0978	00030000-569f-42cd-8f53-80ffe96c7dc8
00020000-569f-42cf-ab7c-0f7de64e2725	00030000-569f-42cd-1008-2d32de7ed967
00020000-569f-42cf-f3f2-3fe8b4f3d88b	00030000-569f-42cd-008d-33241a79ae56
00020000-569f-42cf-4af1-764274b30741	00030000-569f-42cd-68ad-3f5ef5f24710
00020000-569f-42cf-5add-1b2973ddb7f5	00030000-569f-42cd-a120-e320404f4cca
00020000-569f-42cf-d44f-2301d8177639	00030000-569f-42cd-b734-e6e0623bab28
00020000-569f-42cf-a60a-96a93f5d5830	00030000-569f-42cd-e64e-a240720e931c
00020000-569f-42cf-b0de-1363335a81d1	00030000-569f-42cd-effd-5e321bed4e2c
00020000-569f-42cf-a00b-d0129079baf7	00030000-569f-42cd-4122-4e3b325fb2e0
00020000-569f-42cf-dce9-5ffbaa4c42a0	00030000-569f-42cd-d333-e090939913e5
00020000-569f-42cf-dce9-5ffbaa4c42a0	00030000-569f-42cd-fb31-768d20582733
00020000-569f-42cf-dce9-5ffbaa4c42a0	00030000-569f-42cd-9b34-7404d445776f
00020000-569f-42cf-c2d3-077d638a6e2b	00030000-569f-42cd-3b76-907a901a01e1
00020000-569f-42cf-9221-492953ee4018	00030000-569f-42cd-4828-9f0e0a83dbdd
00020000-569f-42cf-6e87-cf275691ebdd	00030000-569f-42cd-778b-574f51a3fc7d
00020000-569f-42cf-1f6b-82cf4a0839fe	00030000-569f-42cd-fa9b-7365ba9f7a70
00020000-569f-42cf-b6a4-9bea80af6d73	00030000-569f-42cd-88fe-934551aac95d
00020000-569f-42cf-43e4-7266cecebbd5	00030000-569f-42cd-5816-e5eb51f63e15
00020000-569f-42cf-9c3b-5ea9f70eefda	00030000-569f-42cd-ac11-6a4591dabdb9
00020000-569f-42cf-bb48-82f2596bb12b	00030000-569f-42cd-0cca-79fd307529d9
00020000-569f-42cf-2d65-c2d9ba590023	00030000-569f-42cd-0ed2-fe83b619f83b
00020000-569f-42cf-508e-5adeb6c2730b	00030000-569f-42cd-3ae1-266a149908c6
00020000-569f-42cf-c56a-fd52ebb11722	00030000-569f-42cd-3a93-18dbbf83dd03
00020000-569f-42cf-6c73-950ec15e068f	00030000-569f-42cd-9ced-cae5caea6251
00020000-569f-42cf-2c85-253bd0c311e7	00030000-569f-42cd-fc2e-158fb35a678e
00020000-569f-42cf-652d-8bbd243db9ce	00030000-569f-42cd-55b4-dc80169518c0
00020000-569f-42cf-3588-34c28c75080c	00030000-569f-42cd-2891-6fbc368e3b26
00020000-569f-42cf-d2b6-83fd043b4e96	00030000-569f-42cd-7f7b-4c97f9536bad
00020000-569f-42cf-47f2-58ec796f27d4	00030000-569f-42cd-0a5b-4fedf7d83da6
00020000-569f-42cf-f73c-b6ecbe6ca341	00030000-569f-42cd-3c0d-723b2981f61c
00020000-569f-42cf-def0-dc5c9751487b	00030000-569f-42cd-5e04-bfe660aa4a59
\.


--
-- TOC entry 3182 (class 0 OID 38203852)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 38203886)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 38204019)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569f-42cf-501e-492d904283dd	00090000-569f-42cf-5ae8-01f2c8520a91	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569f-42cf-cc9d-09afc6047808	00090000-569f-42cf-0bfe-6e965e54408d	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569f-42cf-3c4c-5446d995fd97	00090000-569f-42cf-5194-302345c61364	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569f-42cf-905d-1006364f4d9e	00090000-569f-42cf-6465-e611cb259be9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3151 (class 0 OID 38203535)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569f-42cf-a934-4bd755900899	\N	00040000-569f-42cc-1224-646f9ce70e46	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-42cf-7c0a-a4e32f106ca9	\N	00040000-569f-42cc-1224-646f9ce70e46	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569f-42cf-3c50-a13dc0b7562c	\N	00040000-569f-42cc-1224-646f9ce70e46	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-42cf-5d11-2164d77734e2	\N	00040000-569f-42cc-1224-646f9ce70e46	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-42cf-7b32-1bbe6ee34af8	\N	00040000-569f-42cc-1224-646f9ce70e46	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-42cf-9080-9d7d2af6a118	\N	00040000-569f-42cc-ba7a-dd8a58625671	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-42cf-4f1e-5d176d3b2691	\N	00040000-569f-42cc-4825-dac5c68834c4	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-42cf-298a-5ef4c812a780	\N	00040000-569f-42cc-8823-5b580b0442fe	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-42cf-1e8b-28b1ca8229e5	\N	00040000-569f-42cc-e729-86d351ea6b8e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-42d1-d49c-9fbfb39a08ab	\N	00040000-569f-42cc-1224-646f9ce70e46	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3154 (class 0 OID 38203580)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569f-42cc-31da-3384ed5c04d0	8341	Adlešiči
00050000-569f-42cc-7081-abab3ffb0d72	5270	Ajdovščina
00050000-569f-42cc-880d-e5b2affbb9b0	6280	Ankaran/Ancarano
00050000-569f-42cc-a449-d95ba1a13531	9253	Apače
00050000-569f-42cc-b6a7-7fa37b2c55d0	8253	Artiče
00050000-569f-42cc-8be7-e347e9efa68d	4275	Begunje na Gorenjskem
00050000-569f-42cc-0dbd-31b24cf9803b	1382	Begunje pri Cerknici
00050000-569f-42cc-5649-60686a583e97	9231	Beltinci
00050000-569f-42cc-e834-257fbd93fcd0	2234	Benedikt
00050000-569f-42cc-2660-ff1ac5d66a67	2345	Bistrica ob Dravi
00050000-569f-42cc-55a7-6f5604dd8d35	3256	Bistrica ob Sotli
00050000-569f-42cc-bbd8-9223b2a14eab	8259	Bizeljsko
00050000-569f-42cc-2411-185d53043f4c	1223	Blagovica
00050000-569f-42cc-d061-a52a7ad51b0a	8283	Blanca
00050000-569f-42cc-c684-a869a68ee96f	4260	Bled
00050000-569f-42cc-d1a0-436130a35455	4273	Blejska Dobrava
00050000-569f-42cc-0eb4-78d1ccf56229	9265	Bodonci
00050000-569f-42cc-27e2-970952de71e9	9222	Bogojina
00050000-569f-42cc-1c27-df62472f9f82	4263	Bohinjska Bela
00050000-569f-42cc-12af-974f96a121c5	4264	Bohinjska Bistrica
00050000-569f-42cc-f77e-bba9fd1ab2cd	4265	Bohinjsko jezero
00050000-569f-42cc-efd0-de0b50dfa677	1353	Borovnica
00050000-569f-42cc-7313-51e7b972dd34	8294	Boštanj
00050000-569f-42cc-2d07-67224b67ce65	5230	Bovec
00050000-569f-42cc-a328-6602e78fc506	5295	Branik
00050000-569f-42cc-dc72-d45ab65fdb3b	3314	Braslovče
00050000-569f-42cc-2a58-0f5c9cafec70	5223	Breginj
00050000-569f-42cc-c536-7bb3863bd3c5	8280	Brestanica
00050000-569f-42cc-9acd-9ac191c68598	2354	Bresternica
00050000-569f-42cc-2687-e0a1556f22e7	4243	Brezje
00050000-569f-42cc-b7fc-e230084a019b	1351	Brezovica pri Ljubljani
00050000-569f-42cc-2594-f3c73b487275	8250	Brežice
00050000-569f-42cc-32ec-1b2726340256	4210	Brnik - Aerodrom
00050000-569f-42cc-8bcb-f263c9b1aab3	8321	Brusnice
00050000-569f-42cc-a506-fbb6a7fc750d	3255	Buče
00050000-569f-42cc-08c8-0f92b6afe1e7	8276	Bučka 
00050000-569f-42cc-a99c-651df2464d3b	9261	Cankova
00050000-569f-42cc-d693-9641e2e6235b	3000	Celje 
00050000-569f-42cc-5c82-0899b07e9906	3001	Celje - poštni predali
00050000-569f-42cc-d88e-35dd81820596	4207	Cerklje na Gorenjskem
00050000-569f-42cc-ce9b-7b221e50ab6f	8263	Cerklje ob Krki
00050000-569f-42cc-63d6-20e5fc7c512c	1380	Cerknica
00050000-569f-42cc-7fe5-3fe3481ff69e	5282	Cerkno
00050000-569f-42cc-aa0a-7f2ea001ea23	2236	Cerkvenjak
00050000-569f-42cc-9f19-2ee15868cc11	2215	Ceršak
00050000-569f-42cc-7cf5-46c82e93452f	2326	Cirkovce
00050000-569f-42cc-92bb-bce6c4d9617b	2282	Cirkulane
00050000-569f-42cc-310f-0eaab41ee3c9	5273	Col
00050000-569f-42cc-a50a-2ac38486689d	8251	Čatež ob Savi
00050000-569f-42cc-a54f-cdc5ff7ce4a2	1413	Čemšenik
00050000-569f-42cc-3241-7a8bfcfcc29d	5253	Čepovan
00050000-569f-42cc-50bc-53482842f299	9232	Črenšovci
00050000-569f-42cc-5fe2-b6e0797bc577	2393	Črna na Koroškem
00050000-569f-42cc-13b7-842daccd8e6c	6275	Črni Kal
00050000-569f-42cc-748d-7eb8f48508f0	5274	Črni Vrh nad Idrijo
00050000-569f-42cc-966c-33cbb29c65b1	5262	Črniče
00050000-569f-42cc-858d-15e21fdbf033	8340	Črnomelj
00050000-569f-42cc-d943-e3f7001c767c	6271	Dekani
00050000-569f-42cc-ca80-46e011ac9a5d	5210	Deskle
00050000-569f-42cc-7074-93f320471571	2253	Destrnik
00050000-569f-42cc-36bf-b948f33e55ad	6215	Divača
00050000-569f-42cc-bd0c-65bed17c6f13	1233	Dob
00050000-569f-42cc-2ba5-d37901876c24	3224	Dobje pri Planini
00050000-569f-42cc-7060-26e6fa426552	8257	Dobova
00050000-569f-42cc-c342-a3f740ece75c	1423	Dobovec
00050000-569f-42cc-c1fa-d0216dc9a579	5263	Dobravlje
00050000-569f-42cc-ccc6-d81c87e10242	3204	Dobrna
00050000-569f-42cc-6b54-3ffcc6417d99	8211	Dobrnič
00050000-569f-42cc-dcec-2dce188f74a9	1356	Dobrova
00050000-569f-42cc-a4f1-969e9cf55325	9223	Dobrovnik/Dobronak 
00050000-569f-42cc-4a74-d06633f479cc	5212	Dobrovo v Brdih
00050000-569f-42cc-f59b-eb18de9db6d2	1431	Dol pri Hrastniku
00050000-569f-42cc-de69-7670a3c1f57e	1262	Dol pri Ljubljani
00050000-569f-42cc-a4e0-4b6471114d81	1273	Dole pri Litiji
00050000-569f-42cc-0eb6-b2fb92f20a89	1331	Dolenja vas
00050000-569f-42cc-adf2-ed4f70d06ba9	8350	Dolenjske Toplice
00050000-569f-42cc-5acb-051aa42a40cb	1230	Domžale
00050000-569f-42cc-8b35-656b45610df2	2252	Dornava
00050000-569f-42cc-0801-a10d1ec6e98e	5294	Dornberk
00050000-569f-42cc-3497-c54358978329	1319	Draga
00050000-569f-42cc-df96-1ffaaf825821	8343	Dragatuš
00050000-569f-42cc-b200-2db9107650ac	3222	Dramlje
00050000-569f-42cc-6ccb-27410894b99d	2370	Dravograd
00050000-569f-42cc-0547-d2782c47a14f	4203	Duplje
00050000-569f-42cc-7118-fc0f5e697eff	6221	Dutovlje
00050000-569f-42cc-2c59-6375c12269fc	8361	Dvor
00050000-569f-42cc-efa4-33e484d65970	2343	Fala
00050000-569f-42cc-ebc1-e49f63059a96	9208	Fokovci
00050000-569f-42cc-7410-b2b22d1065b3	2313	Fram
00050000-569f-42cc-0f71-94c63d1d203a	3213	Frankolovo
00050000-569f-42cc-149d-3ba6db28b0c2	1274	Gabrovka
00050000-569f-42cc-7630-74b4dd2a2229	8254	Globoko
00050000-569f-42cc-7f69-81b36f349b73	5275	Godovič
00050000-569f-42cc-e995-dc3e5b592ad0	4204	Golnik
00050000-569f-42cc-c0ce-869e323b877e	3303	Gomilsko
00050000-569f-42cc-d4eb-da2abbb60199	4224	Gorenja vas
00050000-569f-42cc-3426-02e59d0f2508	3263	Gorica pri Slivnici
00050000-569f-42cc-3d2e-2f4d9936081e	2272	Gorišnica
00050000-569f-42cc-4311-112127f7a211	9250	Gornja Radgona
00050000-569f-42cc-41d0-06c2cd5bc7b0	3342	Gornji Grad
00050000-569f-42cc-5f96-d16739f01d92	4282	Gozd Martuljek
00050000-569f-42cc-a345-2a4768cb624b	6272	Gračišče
00050000-569f-42cc-093e-a43a9d624c6e	9264	Grad
00050000-569f-42cc-611c-70c027cd0ad6	8332	Gradac
00050000-569f-42cc-8bad-37f6f9f59408	1384	Grahovo
00050000-569f-42cc-cea1-a01aa528361c	5242	Grahovo ob Bači
00050000-569f-42cc-1ab7-53d2c1040383	5251	Grgar
00050000-569f-42cc-d57d-03d6eef461ef	3302	Griže
00050000-569f-42cc-bea3-86d1978d3537	3231	Grobelno
00050000-569f-42cc-8fbd-33426d5fc1fe	1290	Grosuplje
00050000-569f-42cc-4d51-fdc0bb73424c	2288	Hajdina
00050000-569f-42cc-e727-c9be64ebc02e	8362	Hinje
00050000-569f-42cc-1e21-bf5c0b85e3f3	2311	Hoče
00050000-569f-42cc-0357-a87fdf478be5	9205	Hodoš/Hodos
00050000-569f-42cc-b583-bb11b8be2dde	1354	Horjul
00050000-569f-42cc-751c-36007b141503	1372	Hotedršica
00050000-569f-42cc-33e3-d2265d2a467d	1430	Hrastnik
00050000-569f-42cc-1ec7-e4eb3bb780b2	6225	Hruševje
00050000-569f-42cc-ecbd-43579d6be187	4276	Hrušica
00050000-569f-42cc-12be-e16815bc9177	5280	Idrija
00050000-569f-42cc-a0d5-7ad9712fc2c7	1292	Ig
00050000-569f-42cc-1439-a600f8edade8	6250	Ilirska Bistrica
00050000-569f-42cc-c90b-89a4db79bc29	6251	Ilirska Bistrica-Trnovo
00050000-569f-42cc-f446-bdf896961315	1295	Ivančna Gorica
00050000-569f-42cc-c61b-b58da24840b8	2259	Ivanjkovci
00050000-569f-42cc-3ed8-3b8776a5e7c7	1411	Izlake
00050000-569f-42cc-89a4-aa4416425f9c	6310	Izola/Isola
00050000-569f-42cc-1976-31151d4997d1	2222	Jakobski Dol
00050000-569f-42cc-6ce4-cd81d2946d21	2221	Jarenina
00050000-569f-42cc-29b5-d957502be774	6254	Jelšane
00050000-569f-42cc-1165-967d8c21e8e6	4270	Jesenice
00050000-569f-42cc-d0c5-72f5d98a5b1f	8261	Jesenice na Dolenjskem
00050000-569f-42cc-e917-2347e60da5f0	3273	Jurklošter
00050000-569f-42cc-0be2-e9edf2efefd1	2223	Jurovski Dol
00050000-569f-42cc-2f88-7504ff773f92	2256	Juršinci
00050000-569f-42cc-36bd-afa301e770ef	5214	Kal nad Kanalom
00050000-569f-42cc-4c32-94850f3b7851	3233	Kalobje
00050000-569f-42cc-db21-8d808970d715	4246	Kamna Gorica
00050000-569f-42cc-224d-854cc6ea6246	2351	Kamnica
00050000-569f-42cc-735a-24b640ebf17b	1241	Kamnik
00050000-569f-42cc-a29f-b76078d9a5f9	5213	Kanal
00050000-569f-42cc-da68-9708ea7d9280	8258	Kapele
00050000-569f-42cc-cb76-e7a1e037a76d	2362	Kapla
00050000-569f-42cc-b176-32988c3c0d99	2325	Kidričevo
00050000-569f-42cc-04b6-6e2135ef6a4b	1412	Kisovec
00050000-569f-42cc-e37b-75ce26e00673	6253	Knežak
00050000-569f-42cc-1187-53ed8fd8e977	5222	Kobarid
00050000-569f-42cc-9381-23f08a973522	9227	Kobilje
00050000-569f-42cc-27ec-ffb9ebdb96a3	1330	Kočevje
00050000-569f-42cc-8f18-21f073973a11	1338	Kočevska Reka
00050000-569f-42cc-09d8-ee205b5b6507	2276	Kog
00050000-569f-42cc-8855-998b60112f1e	5211	Kojsko
00050000-569f-42cc-b8b8-106e8492148f	6223	Komen
00050000-569f-42cc-9b47-d4aa80374845	1218	Komenda
00050000-569f-42cc-6c7f-2a7c8806c9c4	6000	Koper/Capodistria 
00050000-569f-42cc-06bd-8fac1a86bfe0	6001	Koper/Capodistria - poštni predali
00050000-569f-42cc-b045-447fc7d3ca87	8282	Koprivnica
00050000-569f-42cc-9651-c4d9de4c514d	5296	Kostanjevica na Krasu
00050000-569f-42cc-ca64-ae7ef3c7f12a	8311	Kostanjevica na Krki
00050000-569f-42cc-dc52-1ad79e724f7c	1336	Kostel
00050000-569f-42cc-1f4c-b982d2efaccf	6256	Košana
00050000-569f-42cc-b7c2-85f426983dd8	2394	Kotlje
00050000-569f-42cc-88f1-ae7e3ffaa1b8	6240	Kozina
00050000-569f-42cc-13a6-5b25a17ff263	3260	Kozje
00050000-569f-42cc-e739-ad33f47ddb82	4000	Kranj 
00050000-569f-42cc-6925-900d1a405e0f	4001	Kranj - poštni predali
00050000-569f-42cc-9b9a-735620ac230f	4280	Kranjska Gora
00050000-569f-42cc-78bc-dd07d4b5c0fb	1281	Kresnice
00050000-569f-42cc-bc71-8b1b21417ef1	4294	Križe
00050000-569f-42cc-2bbc-8dd84c280677	9206	Križevci
00050000-569f-42cc-93ae-900489cf7924	9242	Križevci pri Ljutomeru
00050000-569f-42cc-c63b-29fcf398d814	1301	Krka
00050000-569f-42cc-9819-4c3e9a6f154e	8296	Krmelj
00050000-569f-42cc-e4f6-8e853ee77a6e	4245	Kropa
00050000-569f-42cc-d125-c4bf41292ef5	8262	Krška vas
00050000-569f-42cc-38bc-e6a60888986a	8270	Krško
00050000-569f-42cc-75be-795da8e3fab3	9263	Kuzma
00050000-569f-42cc-9a8b-2175ab71af41	2318	Laporje
00050000-569f-42cc-bd86-dda848f02de7	3270	Laško
00050000-569f-42cc-eea8-2ad71abeb62b	1219	Laze v Tuhinju
00050000-569f-42cc-0de2-81c24003301b	2230	Lenart v Slovenskih goricah
00050000-569f-42cc-1aaa-a297e6a5264e	9220	Lendava/Lendva
00050000-569f-42cc-7b50-677eaa87ceab	4248	Lesce
00050000-569f-42cc-fa35-c0af9de64e7a	3261	Lesično
00050000-569f-42cc-e8df-4c5cb7c6d4a9	8273	Leskovec pri Krškem
00050000-569f-42cc-1632-c944563dc2ae	2372	Libeliče
00050000-569f-42cc-fe8b-33b7ebe4ed2d	2341	Limbuš
00050000-569f-42cc-22b0-1e5128ca35f7	1270	Litija
00050000-569f-42cc-c765-0be7a61e06b9	3202	Ljubečna
00050000-569f-42cc-e27b-a3082b021fe0	1000	Ljubljana 
00050000-569f-42cc-0fd0-b3023bc25961	1001	Ljubljana - poštni predali
00050000-569f-42cc-3dbd-cd601f5d1b46	1231	Ljubljana - Črnuče
00050000-569f-42cc-e363-a6bcc07eab44	1261	Ljubljana - Dobrunje
00050000-569f-42cc-92d8-d379806cb946	1260	Ljubljana - Polje
00050000-569f-42cc-9f96-4e8c0161ce73	1210	Ljubljana - Šentvid
00050000-569f-42cc-b653-ccf0ab986d2f	1211	Ljubljana - Šmartno
00050000-569f-42cc-e71d-ba87a89f3d53	3333	Ljubno ob Savinji
00050000-569f-42cc-42dd-2b677eeac209	9240	Ljutomer
00050000-569f-42cc-d9c1-a12de2866f38	3215	Loče
00050000-569f-42cc-e7ea-06450f5b907f	5231	Log pod Mangartom
00050000-569f-42cc-ffe7-a99c49cebb01	1358	Log pri Brezovici
00050000-569f-42cc-49ae-f092634b1b28	1370	Logatec
00050000-569f-42cc-c39d-731e3039bffe	1371	Logatec
00050000-569f-42cc-f74e-4bc6acde82e7	1434	Loka pri Zidanem Mostu
00050000-569f-42cc-3dc4-9b0c02520155	3223	Loka pri Žusmu
00050000-569f-42cc-8479-35eb4761a7c5	6219	Lokev
00050000-569f-42cc-6555-d6d3ab894de1	1318	Loški Potok
00050000-569f-42cc-f812-0f72b5b54687	2324	Lovrenc na Dravskem polju
00050000-569f-42cc-f2b2-6f8fd7b39bc6	2344	Lovrenc na Pohorju
00050000-569f-42cc-5450-26d0cba31ca3	3334	Luče
00050000-569f-42cc-b597-2b9c17044592	1225	Lukovica
00050000-569f-42cc-ca9c-9adeaefc1890	9202	Mačkovci
00050000-569f-42cc-48fd-50021c086872	2322	Majšperk
00050000-569f-42cc-5301-09451537251f	2321	Makole
00050000-569f-42cc-6b8b-ad5a6844e704	9243	Mala Nedelja
00050000-569f-42cc-1ac6-f151bdc66f1d	2229	Malečnik
00050000-569f-42cc-6cb9-e20eff0a1a76	6273	Marezige
00050000-569f-42cc-2aa2-161fe57d7a4f	2000	Maribor 
00050000-569f-42cc-36a3-2163a41df96d	2001	Maribor - poštni predali
00050000-569f-42cc-fc13-f733190c7e2e	2206	Marjeta na Dravskem polju
00050000-569f-42cc-2c1e-77d28d2b66d3	2281	Markovci
00050000-569f-42cc-5647-f9d69261968f	9221	Martjanci
00050000-569f-42cc-d05e-3de063d6b7ea	6242	Materija
00050000-569f-42cc-eba5-f71e8d2d16bc	4211	Mavčiče
00050000-569f-42cc-4603-86de4b9cd424	1215	Medvode
00050000-569f-42cc-d2ce-8d1222f750d0	1234	Mengeš
00050000-569f-42cc-1f18-d5b7cd2b7841	8330	Metlika
00050000-569f-42cc-7061-85f053427c9f	2392	Mežica
00050000-569f-42cc-8fd7-b20f8ab806fe	2204	Miklavž na Dravskem polju
00050000-569f-42cc-3b87-24ec2d103412	2275	Miklavž pri Ormožu
00050000-569f-42cc-3b13-b65805c86cae	5291	Miren
00050000-569f-42cc-4e18-02cd986fb9f6	8233	Mirna
00050000-569f-42cc-ec02-951b7a3ccdda	8216	Mirna Peč
00050000-569f-42cc-f309-904ccde6ab32	2382	Mislinja
00050000-569f-42cc-2f1d-0fdd71ad774a	4281	Mojstrana
00050000-569f-42cc-9038-62681f1066e1	8230	Mokronog
00050000-569f-42cc-148c-55b0004282da	1251	Moravče
00050000-569f-42cc-23ba-badf7efe6f47	9226	Moravske Toplice
00050000-569f-42cc-54db-7505b8036e14	5216	Most na Soči
00050000-569f-42cc-2eb8-61d6f17df4ed	1221	Motnik
00050000-569f-42cc-e6dd-d09e221ca90e	3330	Mozirje
00050000-569f-42cc-9c0a-c5ef59642baa	9000	Murska Sobota 
00050000-569f-42cc-fb64-95e72f1f094e	9001	Murska Sobota - poštni predali
00050000-569f-42cc-7546-813b80d5fa25	2366	Muta
00050000-569f-42cc-0505-2cd7aaec99e2	4202	Naklo
00050000-569f-42cc-6e72-57edb3d40787	3331	Nazarje
00050000-569f-42cc-724a-25cc3d04a258	1357	Notranje Gorice
00050000-569f-42cc-b69d-67044bae7367	3203	Nova Cerkev
00050000-569f-42cc-261b-05ff3e420e42	5000	Nova Gorica 
00050000-569f-42cc-bec8-7c6b4026d59e	5001	Nova Gorica - poštni predali
00050000-569f-42cc-ca97-7d5bcf4d3539	1385	Nova vas
00050000-569f-42cc-242f-0bf5180bbe82	8000	Novo mesto
00050000-569f-42cc-ca19-cbc3180d0702	8001	Novo mesto - poštni predali
00050000-569f-42cc-80ce-bd3e484f31da	6243	Obrov
00050000-569f-42cc-458d-444e74141765	9233	Odranci
00050000-569f-42cc-c120-941494742480	2317	Oplotnica
00050000-569f-42cc-8279-305721c3c455	2312	Orehova vas
00050000-569f-42cc-8a45-409eb7d456b4	2270	Ormož
00050000-569f-42cc-08bb-8867b8373ef9	1316	Ortnek
00050000-569f-42cc-2fbe-4205d537844b	1337	Osilnica
00050000-569f-42cc-9982-2189d2803795	8222	Otočec
00050000-569f-42cc-2024-0f257fbc815f	2361	Ožbalt
00050000-569f-42cc-d7c1-d3b7afc5267c	2231	Pernica
00050000-569f-42cc-1c17-c69ddfad7ffa	2211	Pesnica pri Mariboru
00050000-569f-42cc-c1c6-7bf3f0c1f924	9203	Petrovci
00050000-569f-42cc-2c1e-20c17361f0bd	3301	Petrovče
00050000-569f-42cc-83d1-62670c642344	6330	Piran/Pirano
00050000-569f-42cc-1919-d2219b48d76d	8255	Pišece
00050000-569f-42cc-c2ea-7e7481905bd0	6257	Pivka
00050000-569f-42cc-8bf9-2f25e229420d	6232	Planina
00050000-569f-42cc-4728-16e00695f8a2	3225	Planina pri Sevnici
00050000-569f-42cc-8568-e3aa9b1e0919	6276	Pobegi
00050000-569f-42cc-5afc-9cd420501f7f	8312	Podbočje
00050000-569f-42cc-b545-2e948b0de55f	5243	Podbrdo
00050000-569f-42cc-c4f6-a7335131d941	3254	Podčetrtek
00050000-569f-42cc-a65d-b40eb084dde4	2273	Podgorci
00050000-569f-42cc-0e7d-15f029866b15	6216	Podgorje
00050000-569f-42cc-1136-869778820ed7	2381	Podgorje pri Slovenj Gradcu
00050000-569f-42cc-7c45-f3af1e0567e0	6244	Podgrad
00050000-569f-42cc-fc97-2bf9299ed4ce	1414	Podkum
00050000-569f-42cc-0319-274d43415cde	2286	Podlehnik
00050000-569f-42cc-9fe7-37fbbe279a46	5272	Podnanos
00050000-569f-42cc-0a2c-c67c6f828a2c	4244	Podnart
00050000-569f-42cc-c9bc-3d294006942a	3241	Podplat
00050000-569f-42cc-8380-da2d25343e8a	3257	Podsreda
00050000-569f-42cc-d376-ebfe4ebed732	2363	Podvelka
00050000-569f-42cc-9544-590b55764ac4	2208	Pohorje
00050000-569f-42cc-5c14-dee7e930a2d4	2257	Polenšak
00050000-569f-42cc-fe0d-7c145226f916	1355	Polhov Gradec
00050000-569f-42cc-6f8a-d7b3cc1597ae	4223	Poljane nad Škofjo Loko
00050000-569f-42cc-f868-0a018877dbc5	2319	Poljčane
00050000-569f-42cc-332a-284699c15738	1272	Polšnik
00050000-569f-42cc-8c69-b0887f500226	3313	Polzela
00050000-569f-42cc-03b8-67940b33fafd	3232	Ponikva
00050000-569f-42cc-3b3c-4c0208f0637f	6320	Portorož/Portorose
00050000-569f-42cc-9b48-bbffcaec5b8f	6230	Postojna
00050000-569f-42cc-6066-a0182364322c	2331	Pragersko
00050000-569f-42cc-122c-f836e640155f	3312	Prebold
00050000-569f-42cc-07dc-23c9cce16f7d	4205	Preddvor
00050000-569f-42cc-c72c-0bbd86759317	6255	Prem
00050000-569f-42cc-1253-3b462c70cd23	1352	Preserje
00050000-569f-42cc-05e0-e8ac8fab6f42	6258	Prestranek
00050000-569f-42cc-a256-ed46ab51c6f8	2391	Prevalje
00050000-569f-42cc-3392-3d396c85f65b	3262	Prevorje
00050000-569f-42cc-08f8-2428a3d16d16	1276	Primskovo 
00050000-569f-42cc-d9f1-146259ce8075	3253	Pristava pri Mestinju
00050000-569f-42cc-579e-0280cbabf54a	9207	Prosenjakovci/Partosfalva
00050000-569f-42cc-0bd5-4849ee90ca85	5297	Prvačina
00050000-569f-42cc-8d57-ba5ffa3db9dc	2250	Ptuj
00050000-569f-42cc-5dfa-641d5b3e67da	2323	Ptujska Gora
00050000-569f-42cc-bcf1-d31ab9736fbc	9201	Puconci
00050000-569f-42cc-0958-44275c1c70be	2327	Rače
00050000-569f-42cc-35f7-3641071bd298	1433	Radeče
00050000-569f-42cc-cbe5-982328e95636	9252	Radenci
00050000-569f-42cc-f641-04678e3b8f61	2360	Radlje ob Dravi
00050000-569f-42cc-5453-0145c83e2ddf	1235	Radomlje
00050000-569f-42cc-cc18-a8f1012c2814	4240	Radovljica
00050000-569f-42cc-c7d6-9ec7e7f7118d	8274	Raka
00050000-569f-42cc-d377-e9ebcd0df750	1381	Rakek
00050000-569f-42cc-5885-a7f006c9954c	4283	Rateče - Planica
00050000-569f-42cc-8781-20efd1f092b3	2390	Ravne na Koroškem
00050000-569f-42cc-7279-a373c5533ad1	9246	Razkrižje
00050000-569f-42cc-41fb-3a88720dfb65	3332	Rečica ob Savinji
00050000-569f-42cc-0e90-deca1b174d53	5292	Renče
00050000-569f-42cc-b549-1ab1b2a9880a	1310	Ribnica
00050000-569f-42cc-af83-e7a753e4a3d8	2364	Ribnica na Pohorju
00050000-569f-42cc-caf2-f5370e9d992c	3272	Rimske Toplice
00050000-569f-42cc-6523-9d043096790c	1314	Rob
00050000-569f-42cc-bfce-639ed6ca211c	5215	Ročinj
00050000-569f-42cc-7f84-b846b3e3fc51	3250	Rogaška Slatina
00050000-569f-42cc-d17d-dd55b1372216	9262	Rogašovci
00050000-569f-42cc-d19c-bdf0c9c7a131	3252	Rogatec
00050000-569f-42cc-440a-19d080dfcb0e	1373	Rovte
00050000-569f-42cc-dea1-9028786bf2bc	2342	Ruše
00050000-569f-42cc-4e1d-a19aea8bb906	1282	Sava
00050000-569f-42cc-c78f-d6ec02cfb2ed	6333	Sečovlje/Sicciole
00050000-569f-42cc-e0ad-d50856bc7846	4227	Selca
00050000-569f-42cc-e045-84145a83d9c6	2352	Selnica ob Dravi
00050000-569f-42cc-ff50-619ff264453f	8333	Semič
00050000-569f-42cc-4d8a-7c26b30577b2	8281	Senovo
00050000-569f-42cc-9a05-75550a880582	6224	Senožeče
00050000-569f-42cc-1b96-853c4f45231f	8290	Sevnica
00050000-569f-42cc-3a90-6738dcd84373	6210	Sežana
00050000-569f-42cc-fa4e-cb139a0bf216	2214	Sladki Vrh
00050000-569f-42cc-d90e-b65bd2e431db	5283	Slap ob Idrijci
00050000-569f-42cc-99cb-5571e1c016a3	2380	Slovenj Gradec
00050000-569f-42cc-a982-f3daf042e3e5	2310	Slovenska Bistrica
00050000-569f-42cc-2a95-12b332101d8f	3210	Slovenske Konjice
00050000-569f-42cc-7b69-cb7db0b6fa15	1216	Smlednik
00050000-569f-42cc-8f88-f0fcd6691d2e	5232	Soča
00050000-569f-42cc-86d9-ef0bc79c6770	1317	Sodražica
00050000-569f-42cc-1600-8ba2bb20a1b1	3335	Solčava
00050000-569f-42cc-603a-227ae177cc36	5250	Solkan
00050000-569f-42cc-8049-5ddbe1eb3919	4229	Sorica
00050000-569f-42cc-8905-ac33eab635db	4225	Sovodenj
00050000-569f-42cc-8f75-4e959d6cbba5	5281	Spodnja Idrija
00050000-569f-42cc-fa10-3194811e6ec1	2241	Spodnji Duplek
00050000-569f-42cc-da99-d861d6e9af02	9245	Spodnji Ivanjci
00050000-569f-42cc-c5d2-5e109b6443a1	2277	Središče ob Dravi
00050000-569f-42cc-b443-8e2fb59e784d	4267	Srednja vas v Bohinju
00050000-569f-42cc-886f-7d5852885e5e	8256	Sromlje 
00050000-569f-42cc-8141-ece791cc4911	5224	Srpenica
00050000-569f-42cc-0ff9-f770431f831a	1242	Stahovica
00050000-569f-42cc-567b-0e36cbd0fc8b	1332	Stara Cerkev
00050000-569f-42cc-9184-e59d534d1a5b	8342	Stari trg ob Kolpi
00050000-569f-42cc-32af-b51a953a08b2	1386	Stari trg pri Ložu
00050000-569f-42cc-5549-17e16935f452	2205	Starše
00050000-569f-42cc-2365-620a6894ab7c	2289	Stoperce
00050000-569f-42cc-8bc3-875192a09b7a	8322	Stopiče
00050000-569f-42cc-1ae7-f2319fc4d7fc	3206	Stranice
00050000-569f-42cc-cf1e-371e664f2471	8351	Straža
00050000-569f-42cc-18fd-f8ce1155140f	1313	Struge
00050000-569f-42cc-f672-2722a377d257	8293	Studenec
00050000-569f-42cc-20dc-2d0ca2068521	8331	Suhor
00050000-569f-42cc-000d-8d7375b4edd6	2233	Sv. Ana v Slovenskih goricah
00050000-569f-42cc-e9c5-3b1cb70c6d95	2235	Sv. Trojica v Slovenskih goricah
00050000-569f-42cc-fb8a-322231c41b2a	2353	Sveti Duh na Ostrem Vrhu
00050000-569f-42cc-f309-85d5d6e38207	9244	Sveti Jurij ob Ščavnici
00050000-569f-42cc-4529-57572c4ed6f5	3264	Sveti Štefan
00050000-569f-42cc-7664-def35de5c596	2258	Sveti Tomaž
00050000-569f-42cc-8134-96312de019d3	9204	Šalovci
00050000-569f-42cc-0435-0422236c84c9	5261	Šempas
00050000-569f-42cc-802b-2b8504f59329	5290	Šempeter pri Gorici
00050000-569f-42cc-43c6-8a0aca9f63b6	3311	Šempeter v Savinjski dolini
00050000-569f-42cc-4785-15483989d93c	4208	Šenčur
00050000-569f-42cc-3b2b-e54d5c5ccc6b	2212	Šentilj v Slovenskih goricah
00050000-569f-42cc-dba9-e3cf4ac4811d	8297	Šentjanž
00050000-569f-42cc-6897-aa9c3d40586a	2373	Šentjanž pri Dravogradu
00050000-569f-42cc-07e5-2b45ad8e87d9	8310	Šentjernej
00050000-569f-42cc-0eb9-017d262e3a18	3230	Šentjur
00050000-569f-42cc-c799-abc1d72e2f45	3271	Šentrupert
00050000-569f-42cc-1888-14cf115675a1	8232	Šentrupert
00050000-569f-42cc-a061-7f1d5c05d907	1296	Šentvid pri Stični
00050000-569f-42cc-febc-98959cd26d8e	8275	Škocjan
00050000-569f-42cc-4978-8e46819b4755	6281	Škofije
00050000-569f-42cc-db5c-108b79563e5e	4220	Škofja Loka
00050000-569f-42cc-6397-c52537d146ed	3211	Škofja vas
00050000-569f-42cc-3a93-1230d6fd88f4	1291	Škofljica
00050000-569f-42cc-7219-1c8080e4c31d	6274	Šmarje
00050000-569f-42cc-971d-81357337e83b	1293	Šmarje - Sap
00050000-569f-42cc-0ffa-e9f1e22ed8a3	3240	Šmarje pri Jelšah
00050000-569f-42cc-5ba4-bebf5b241a64	8220	Šmarješke Toplice
00050000-569f-42cc-2e5e-d80060051f76	2315	Šmartno na Pohorju
00050000-569f-42cc-d975-175c702ae03e	3341	Šmartno ob Dreti
00050000-569f-42cc-7719-8c8a7faec961	3327	Šmartno ob Paki
00050000-569f-42cc-19e9-d5a572fcd3a2	1275	Šmartno pri Litiji
00050000-569f-42cc-7b8e-ac97b4f3c6dc	2383	Šmartno pri Slovenj Gradcu
00050000-569f-42cc-dcce-b1a68a6e984c	3201	Šmartno v Rožni dolini
00050000-569f-42cc-be7a-018ea0ee0f68	3325	Šoštanj
00050000-569f-42cc-d27c-0333ff5ddcca	6222	Štanjel
00050000-569f-42cc-f79b-9577eff94ef7	3220	Štore
00050000-569f-42cc-dc3e-7faac6940a91	3304	Tabor
00050000-569f-42cc-712b-c934f5f1496b	3221	Teharje
00050000-569f-42cc-7746-034e6d8b3bbe	9251	Tišina
00050000-569f-42cc-d281-967b99af8cb1	5220	Tolmin
00050000-569f-42cc-9854-d3190e6a69b4	3326	Topolšica
00050000-569f-42cc-de69-89a5a678a69b	2371	Trbonje
00050000-569f-42cc-4583-0ab0d9f92c54	1420	Trbovlje
00050000-569f-42cc-f8a6-1bd0a36d958f	8231	Trebelno 
00050000-569f-42cc-d7eb-840bc4024a17	8210	Trebnje
00050000-569f-42cc-6ce4-b39e5c1a6a59	5252	Trnovo pri Gorici
00050000-569f-42cc-c07e-6eabd7eebf6a	2254	Trnovska vas
00050000-569f-42cc-d57f-f7a3bae94c2e	1222	Trojane
00050000-569f-42cc-e6dc-fceb1d999e50	1236	Trzin
00050000-569f-42cc-ef3e-5154187da158	4290	Tržič
00050000-569f-42cc-9ab8-eca35128df67	8295	Tržišče
00050000-569f-42cc-c1ef-b44b3bde370f	1311	Turjak
00050000-569f-42cc-0d9b-c7f4275a7f36	9224	Turnišče
00050000-569f-42cc-0064-2a2eb0f4abae	8323	Uršna sela
00050000-569f-42cc-017b-c5288f6ff468	1252	Vače
00050000-569f-42cc-a44f-95530a4ff42e	3320	Velenje 
00050000-569f-42cc-a7d7-f1ae068cc764	3322	Velenje - poštni predali
00050000-569f-42cc-5d50-517d06fc07c0	8212	Velika Loka
00050000-569f-42cc-3aec-7deeb24b4859	2274	Velika Nedelja
00050000-569f-42cc-4598-a81c58f71cde	9225	Velika Polana
00050000-569f-42cc-292e-45ab0d05e1a0	1315	Velike Lašče
00050000-569f-42cc-79a1-eb2ae17b7446	8213	Veliki Gaber
00050000-569f-42cc-5fc8-fe41072519a3	9241	Veržej
00050000-569f-42cc-db5a-847b84d54391	1312	Videm - Dobrepolje
00050000-569f-42cc-0d3b-1172e5106652	2284	Videm pri Ptuju
00050000-569f-42cc-add1-00a09c8f673e	8344	Vinica
00050000-569f-42cc-ce29-3a7a784d4d05	5271	Vipava
00050000-569f-42cc-7d1c-8eb06accd745	4212	Visoko
00050000-569f-42cc-9363-2a93bc14ad09	1294	Višnja Gora
00050000-569f-42cc-bdd8-09db4274ac6d	3205	Vitanje
00050000-569f-42cc-6708-1f94039dff04	2255	Vitomarci
00050000-569f-42cc-88de-1d11820cfc0d	1217	Vodice
00050000-569f-42cc-cc6f-21e985267e61	3212	Vojnik\t
00050000-569f-42cc-14d5-f74dcbdb7589	5293	Volčja Draga
00050000-569f-42cc-53ac-597f4e4a9d1b	2232	Voličina
00050000-569f-42cc-6795-110046921e55	3305	Vransko
00050000-569f-42cc-e0b7-42af2faa385d	6217	Vremski Britof
00050000-569f-42cc-dc06-793116f208eb	1360	Vrhnika
00050000-569f-42cc-2e8a-fa843d2a6e7a	2365	Vuhred
00050000-569f-42cc-476d-6d8ba986f6ca	2367	Vuzenica
00050000-569f-42cc-83f6-17172dd598bc	8292	Zabukovje 
00050000-569f-42cc-3ce0-bfbe808f2a24	1410	Zagorje ob Savi
00050000-569f-42cc-a726-5be943546357	1303	Zagradec
00050000-569f-42cc-fa11-a022c926a40c	2283	Zavrč
00050000-569f-42cc-8a1b-d0356875b485	8272	Zdole 
00050000-569f-42cc-e801-3b76fb10a7c5	4201	Zgornja Besnica
00050000-569f-42cc-0adc-c2afeb635733	2242	Zgornja Korena
00050000-569f-42cc-6c6c-a49aca4e9e07	2201	Zgornja Kungota
00050000-569f-42cc-c775-332c6f5aa299	2316	Zgornja Ložnica
00050000-569f-42cc-0b0a-9829e99387f7	2314	Zgornja Polskava
00050000-569f-42cc-bba2-303ed586d8b8	2213	Zgornja Velka
00050000-569f-42cc-d2b9-94ad0cb38427	4247	Zgornje Gorje
00050000-569f-42cc-6727-582b268e8e50	4206	Zgornje Jezersko
00050000-569f-42cc-1cb7-0d0e92842c99	2285	Zgornji Leskovec
00050000-569f-42cc-cbe3-63d9d26a6879	1432	Zidani Most
00050000-569f-42cc-938e-34e73fb06965	3214	Zreče
00050000-569f-42cc-fd5d-60149fc69fa9	4209	Žabnica
00050000-569f-42cc-9f68-bce30e8f4239	3310	Žalec
00050000-569f-42cc-6cf2-be39349bdb49	4228	Železniki
00050000-569f-42cc-d739-75b353c6cc27	2287	Žetale
00050000-569f-42cc-33fc-c6fbb3757d14	4226	Žiri
00050000-569f-42cc-f932-fb6eff727b1e	4274	Žirovnica
00050000-569f-42cc-89db-95f6d7a97542	8360	Žužemberk
\.


--
-- TOC entry 3205 (class 0 OID 38204256)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 38203826)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 38203565)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569f-42cf-6546-6673b8d6bb9c	00080000-569f-42cf-a934-4bd755900899	\N	00040000-569f-42cc-1224-646f9ce70e46	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569f-42cf-3234-4b733621548c	00080000-569f-42cf-a934-4bd755900899	\N	00040000-569f-42cc-1224-646f9ce70e46	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569f-42cf-4cfe-c0ec0c75db38	00080000-569f-42cf-7c0a-a4e32f106ca9	\N	00040000-569f-42cc-1224-646f9ce70e46	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3165 (class 0 OID 38203702)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569f-42cd-2c30-a07d326e94f3	novo leto	1	1	\N	t
00430000-569f-42cd-116f-87c4ba11f219	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569f-42cd-dd95-95e960d72b43	dan upora proti okupatorju	27	4	\N	t
00430000-569f-42cd-73d2-3c0555485a38	praznik dela	1	5	\N	t
00430000-569f-42cd-9a28-cb791c481af9	praznik dela	2	5	\N	t
00430000-569f-42cd-aae6-4cc22897ee72	dan Primoža Trubarja	8	6	\N	f
00430000-569f-42cd-f3f9-21d1b375608b	dan državnosti	25	6	\N	t
00430000-569f-42cd-a445-0aca7771a40a	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569f-42cd-696f-893ef60c528a	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569f-42cd-ac61-d5b405a5d562	dan suverenosti	25	10	\N	f
00430000-569f-42cd-7a4d-12980ae94b55	dan spomina na mrtve	1	11	\N	t
00430000-569f-42cd-c551-ebe831ab0b52	dan Rudolfa Maistra	23	11	\N	f
00430000-569f-42cd-75b1-a228afddebb9	božič	25	12	\N	t
00430000-569f-42cd-a954-e7368b000fb8	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569f-42cd-ba5d-efcca1db999b	Marijino vnebovzetje	15	8	\N	t
00430000-569f-42cd-175e-ea9c0937c1d6	dan reformacije	31	10	\N	t
00430000-569f-42cd-bec1-eaff1f9df2ac	velikonočna nedelja	27	3	2016	t
00430000-569f-42cd-989c-a807c186488f	velikonočna nedelja	16	4	2017	t
00430000-569f-42cd-9de5-4be476787fd2	velikonočna nedelja	1	4	2018	t
00430000-569f-42cd-8810-16550e5c6030	velikonočna nedelja	21	4	2019	t
00430000-569f-42cd-78f6-52d68fd7dd78	velikonočna nedelja	12	4	2020	t
00430000-569f-42cd-1ab1-4f9bdaf205bc	velikonočna nedelja	4	4	2021	t
00430000-569f-42cd-63e7-21f1a6ba4480	velikonočna nedelja	17	4	2022	t
00430000-569f-42cd-749b-a08c821db119	velikonočna nedelja	9	4	2023	t
00430000-569f-42cd-376a-e525ad165a0d	velikonočna nedelja	31	3	2024	t
00430000-569f-42cd-d7b9-adc181ada362	velikonočna nedelja	20	4	2025	t
00430000-569f-42cd-5ca8-c65e97bac713	velikonočna nedelja	5	4	2026	t
00430000-569f-42cd-ae6f-e544fd1c0ea3	velikonočna nedelja	28	3	2027	t
00430000-569f-42cd-3ce4-58ea420c91ae	velikonočna nedelja	16	4	2028	t
00430000-569f-42cd-67ca-ea2e85cdaf49	velikonočna nedelja	1	4	2029	t
00430000-569f-42cd-0128-c3c282458154	velikonočna nedelja	21	4	2030	t
00430000-569f-42cd-57a7-b02e8965f7f3	velikonočni ponedeljek	28	3	2016	t
00430000-569f-42cd-acd4-1725d36fb89e	velikonočni ponedeljek	17	4	2017	t
00430000-569f-42cd-a6d1-6c1dc2eb93b3	velikonočni ponedeljek	2	4	2018	t
00430000-569f-42cd-fdee-7738be1a72c2	velikonočni ponedeljek	22	4	2019	t
00430000-569f-42cd-b9e4-b98085c73793	velikonočni ponedeljek	13	4	2020	t
00430000-569f-42cd-00a1-c4a4dec5ae99	velikonočni ponedeljek	5	4	2021	t
00430000-569f-42cd-0816-c875d02472cf	velikonočni ponedeljek	18	4	2022	t
00430000-569f-42cd-229b-750685314199	velikonočni ponedeljek	10	4	2023	t
00430000-569f-42cd-e967-27435bf8c390	velikonočni ponedeljek	1	4	2024	t
00430000-569f-42cd-287a-0a7eeda180bf	velikonočni ponedeljek	21	4	2025	t
00430000-569f-42cd-8f19-bf1d9f744f12	velikonočni ponedeljek	6	4	2026	t
00430000-569f-42cd-9fc1-a936e06f7fde	velikonočni ponedeljek	29	3	2027	t
00430000-569f-42cd-2056-c6eb6a6a4c4f	velikonočni ponedeljek	17	4	2028	t
00430000-569f-42cd-91b0-22107287e927	velikonočni ponedeljek	2	4	2029	t
00430000-569f-42cd-39dd-255221fd5c1c	velikonočni ponedeljek	22	4	2030	t
00430000-569f-42cd-74a5-2e490457e693	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569f-42cd-d50c-41a24805c050	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569f-42cd-aef2-e791090ea40d	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569f-42cd-5184-f3d55b5de3da	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569f-42cd-7351-bd0c13f6604e	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569f-42cd-e196-7ac394d28e3a	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569f-42cd-2954-933244099ee7	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569f-42cd-012d-2a64d2271481	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569f-42cd-5d88-26363ccf198a	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569f-42cd-54f6-3adc10341a90	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569f-42cd-b189-f0621259d8b8	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569f-42cd-1979-3d1cf8708a22	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569f-42cd-efd6-b3bc451bbf81	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569f-42cd-6deb-c0849f8634fb	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569f-42cd-9cec-7ccd98197682	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3161 (class 0 OID 38203669)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569f-42d0-a5d4-cf877e7e19c3	000e0000-569f-42cf-5588-0710dd43b28b	\N	1	\N	\N
\.


--
-- TOC entry 3162 (class 0 OID 38203677)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 38203838)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 38204270)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 38204280)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569f-42cf-f163-1edd25aeff62	00080000-569f-42cf-3c50-a13dc0b7562c	0987	AK
00190000-569f-42cf-0ac1-f6472a80c4a4	00080000-569f-42cf-7c0a-a4e32f106ca9	0989	AK
00190000-569f-42cf-ee1a-c146c79e7393	00080000-569f-42cf-5d11-2164d77734e2	0986	AK
00190000-569f-42cf-f8c1-e9b73b3b65cd	00080000-569f-42cf-9080-9d7d2af6a118	0984	AK
00190000-569f-42cf-31fe-1735e81463ce	00080000-569f-42cf-4f1e-5d176d3b2691	0983	AK
00190000-569f-42cf-1537-2981ffb095b7	00080000-569f-42cf-298a-5ef4c812a780	0982	AK
00190000-569f-42d1-8695-056ea6af188c	00080000-569f-42d1-d49c-9fbfb39a08ab	1001	AK
\.


--
-- TOC entry 3204 (class 0 OID 38204169)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569f-42d0-b7df-d6fe5b952491	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3208 (class 0 OID 38204288)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 38203867)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569f-42cf-4e44-628b3e0336a4	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569f-42cf-48d5-55ba25f24864	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569f-42cf-d244-6761ede34cf0	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569f-42cf-84cd-ca694aeba738	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569f-42cf-4ec5-1c1c57e9964e	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569f-42cf-8116-6f177794de50	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569f-42cf-6883-4e59c4a878c5	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3176 (class 0 OID 38203811)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 38203801)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 38204008)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 38203938)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 38203643)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 38203405)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569f-42d1-d49c-9fbfb39a08ab	00010000-569f-42cd-67f7-27b8fabc0dad	2016-01-20 09:18:25	INS	a:0:{}
2	App\\Entity\\Option	00000000-569f-42d1-cfca-c8d54a2747cf	00010000-569f-42cd-67f7-27b8fabc0dad	2016-01-20 09:18:25	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569f-42d1-8695-056ea6af188c	00010000-569f-42cd-67f7-27b8fabc0dad	2016-01-20 09:18:25	INS	a:0:{}
\.


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3185 (class 0 OID 38203880)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 38203443)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569f-42cd-5b4d-b8f1f158d4f0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569f-42cd-6b9d-bc5b9ea74cf9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569f-42cd-f6f4-7b00a2c1c8de	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569f-42cd-9f68-372561d79910	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569f-42cd-f8b2-fff31c6d130b	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569f-42cd-cd80-ebf5f93b5454	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569f-42cd-62de-eed3dadc7057	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569f-42cd-879c-7340a00cffda	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569f-42cd-1e3c-ec2576f09aa2	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-42cd-7af4-58a05e5d3ef7	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-42cd-26e2-ca835f126ef8	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-42cd-7cce-7611295ecadb	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-42cd-0f29-9a0b80bbf0fc	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-42cd-5104-9cf35b196019	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-42cd-8677-1604c21ef561	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-42cd-51a9-445a00cdc13d	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-42cd-4fdd-483282bc01d4	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569f-42cd-72ba-13de8dbd7749	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569f-42cd-522d-3932a28f993b	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569f-42cd-439d-cb1e841fc789	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569f-42cd-bef1-b3cb48f8671c	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-42cd-9553-ee9c82d48eb8	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-42cd-6a98-186c7bca5faa	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-42cd-3822-4d680e5f715e	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-42cd-5632-fa75cbc477be	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569f-42cd-609c-ce56addde446	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569f-42cd-80d6-2931645e808d	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569f-42cd-03e7-1db066fbe4d3	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569f-42cd-96e9-bbd94c95ce3e	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569f-42cd-120e-3cbc1afb6a53	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569f-42cd-c724-4085b9b5dd7a	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-42cd-ea8d-51c962ebeff2	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-42cd-198a-9b0d5247fe84	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569f-42cd-17cd-32374b4c52f7	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569f-42cd-7802-6d336ea0bf78	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569f-42cd-ef4d-e02e7ac8ffdd	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569f-42cd-6638-cb6e87d72f76	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-42cd-606d-e2754fe0b68a	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-42cd-92fa-fe0d50eb9924	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569f-42cd-a3e5-4d0b10bd33b5	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-42cd-c4b2-8e5cd2fa5aec	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-42cd-9904-a6f2624f2649	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569f-42cd-69de-5f7fed3ec683	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-42cd-05d3-213b239b5317	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-42cd-f0ce-9fb1ea01dd7e	direktor	minimalne pravice za direktorja	t
00020000-569f-42cd-31b4-46aca90dbf38	arhivar	arhivar	t
00020000-569f-42cd-c283-26ddff7decd0	dramaturg	dramaturg	t
00020000-569f-42cd-b7d3-e9afb540d52a	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569f-42cd-7a90-5c353c35c954	poslovni-sekretar	poslovni sekretar	t
00020000-569f-42cd-1e64-335030d70003	vodja-tehnike	vodja tehnike	t
00020000-569f-42cd-c422-7b138ac17f00	racunovodja	računovodja	t
00020000-569f-42cf-aa42-6dcf90b37ff0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569f-42cf-6ab7-a503269025e4	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-4a3a-adf4be04bde0	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-36c2-8779f1071db3	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-a646-cb207786f7a4	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-24fd-8ff4574dd1d5	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-ed4b-ea9a4993d329	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-4303-938f7f760df1	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-2885-ba8d45ad1d94	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-5052-533d535cdd89	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-7105-a605f58f0978	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-ab7c-0f7de64e2725	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-f3f2-3fe8b4f3d88b	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-4af1-764274b30741	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-5add-1b2973ddb7f5	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-d44f-2301d8177639	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-a60a-96a93f5d5830	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-b0de-1363335a81d1	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-a00b-d0129079baf7	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-dce9-5ffbaa4c42a0	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569f-42cf-c2d3-077d638a6e2b	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-9221-492953ee4018	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-6e87-cf275691ebdd	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-1f6b-82cf4a0839fe	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-b6a4-9bea80af6d73	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-43e4-7266cecebbd5	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-9c3b-5ea9f70eefda	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-bb48-82f2596bb12b	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-2d65-c2d9ba590023	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-508e-5adeb6c2730b	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-c56a-fd52ebb11722	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-6c73-950ec15e068f	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-2c85-253bd0c311e7	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-652d-8bbd243db9ce	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-3588-34c28c75080c	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-d2b6-83fd043b4e96	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-47f2-58ec796f27d4	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-f73c-b6ecbe6ca341	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569f-42cf-def0-dc5c9751487b	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3140 (class 0 OID 38203427)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569f-42cd-8008-d04ad114a1b2	00020000-569f-42cd-f6f4-7b00a2c1c8de
00010000-569f-42cd-67f7-27b8fabc0dad	00020000-569f-42cd-f6f4-7b00a2c1c8de
00010000-569f-42cf-95d5-f4d35ce71261	00020000-569f-42cf-aa42-6dcf90b37ff0
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-6ab7-a503269025e4
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-24fd-8ff4574dd1d5
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-5052-533d535cdd89
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-ab7c-0f7de64e2725
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-4af1-764274b30741
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-a00b-d0129079baf7
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-36c2-8779f1071db3
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-c2d3-077d638a6e2b
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-1f6b-82cf4a0839fe
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-43e4-7266cecebbd5
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-bb48-82f2596bb12b
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-508e-5adeb6c2730b
00010000-569f-42cf-35c0-072ff2bf3f82	00020000-569f-42cf-652d-8bbd243db9ce
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-6ab7-a503269025e4
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-4a3a-adf4be04bde0
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-36c2-8779f1071db3
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-a646-cb207786f7a4
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-4af1-764274b30741
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-a60a-96a93f5d5830
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-c2d3-077d638a6e2b
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-1f6b-82cf4a0839fe
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-43e4-7266cecebbd5
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-bb48-82f2596bb12b
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-508e-5adeb6c2730b
00010000-569f-42cf-3521-da65da0ba501	00020000-569f-42cf-652d-8bbd243db9ce
00010000-569f-42cf-f341-a4f3cc43faaa	00020000-569f-42cf-6ab7-a503269025e4
00010000-569f-42cf-f341-a4f3cc43faaa	00020000-569f-42cf-4a3a-adf4be04bde0
00010000-569f-42cf-f341-a4f3cc43faaa	00020000-569f-42cf-36c2-8779f1071db3
00010000-569f-42cf-f341-a4f3cc43faaa	00020000-569f-42cf-a646-cb207786f7a4
00010000-569f-42cf-f341-a4f3cc43faaa	00020000-569f-42cf-ab7c-0f7de64e2725
00010000-569f-42cf-f341-a4f3cc43faaa	00020000-569f-42cf-4af1-764274b30741
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-4a3a-adf4be04bde0
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-ed4b-ea9a4993d329
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-7105-a605f58f0978
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-f3f2-3fe8b4f3d88b
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-ab7c-0f7de64e2725
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-b0de-1363335a81d1
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-4af1-764274b30741
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-5add-1b2973ddb7f5
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-c2d3-077d638a6e2b
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-9221-492953ee4018
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-1f6b-82cf4a0839fe
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-b6a4-9bea80af6d73
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-43e4-7266cecebbd5
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-9c3b-5ea9f70eefda
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-bb48-82f2596bb12b
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-2d65-c2d9ba590023
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-508e-5adeb6c2730b
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-c56a-fd52ebb11722
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-652d-8bbd243db9ce
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-3588-34c28c75080c
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-47f2-58ec796f27d4
00010000-569f-42cf-37b8-8d33f8729511	00020000-569f-42cf-f73c-b6ecbe6ca341
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-4a3a-adf4be04bde0
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-ed4b-ea9a4993d329
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-2885-ba8d45ad1d94
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-7105-a605f58f0978
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-f3f2-3fe8b4f3d88b
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-ab7c-0f7de64e2725
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-b0de-1363335a81d1
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-4af1-764274b30741
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-5add-1b2973ddb7f5
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-d44f-2301d8177639
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-c2d3-077d638a6e2b
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-9221-492953ee4018
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-6e87-cf275691ebdd
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-1f6b-82cf4a0839fe
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-b6a4-9bea80af6d73
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-43e4-7266cecebbd5
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-9c3b-5ea9f70eefda
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-bb48-82f2596bb12b
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-2d65-c2d9ba590023
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-508e-5adeb6c2730b
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-c56a-fd52ebb11722
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-652d-8bbd243db9ce
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-3588-34c28c75080c
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-d2b6-83fd043b4e96
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-47f2-58ec796f27d4
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-f73c-b6ecbe6ca341
00010000-569f-42cf-4875-395049823d5c	00020000-569f-42cf-def0-dc5c9751487b
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-4a3a-adf4be04bde0
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-36c2-8779f1071db3
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-ed4b-ea9a4993d329
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-4303-938f7f760df1
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-2885-ba8d45ad1d94
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-24fd-8ff4574dd1d5
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-7105-a605f58f0978
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-f3f2-3fe8b4f3d88b
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-ab7c-0f7de64e2725
00010000-569f-42cf-3025-aa33379b0266	00020000-569f-42cf-b0de-1363335a81d1
00010000-569f-42cf-e2ba-63ec7799bf59	00020000-569f-42cf-6ab7-a503269025e4
00010000-569f-42cf-e2ba-63ec7799bf59	00020000-569f-42cf-a646-cb207786f7a4
00010000-569f-42cf-e2ba-63ec7799bf59	00020000-569f-42cf-24fd-8ff4574dd1d5
00010000-569f-42cf-e2ba-63ec7799bf59	00020000-569f-42cf-5052-533d535cdd89
00010000-569f-42cf-e2ba-63ec7799bf59	00020000-569f-42cf-ab7c-0f7de64e2725
00010000-569f-42cf-e2ba-63ec7799bf59	00020000-569f-42cf-4af1-764274b30741
00010000-569f-42cf-e2ba-63ec7799bf59	00020000-569f-42cf-a00b-d0129079baf7
00010000-569f-42cf-e2ba-63ec7799bf59	00020000-569f-42cf-6c73-950ec15e068f
00010000-569f-42cf-a1ac-45901f92df3c	00020000-569f-42cf-dce9-5ffbaa4c42a0
00010000-569f-42cf-d1d2-97fb18e78f6b	00020000-569f-42cd-f0ce-9fb1ea01dd7e
00010000-569f-42cf-b723-d19f1cac123f	00020000-569f-42cd-31b4-46aca90dbf38
00010000-569f-42cf-7dc9-b590f9849a53	00020000-569f-42cd-c283-26ddff7decd0
00010000-569f-42cf-4c60-95781195e200	00020000-569f-42cd-b7d3-e9afb540d52a
00010000-569f-42cf-182b-fdd1daaa819a	00020000-569f-42cd-7a90-5c353c35c954
00010000-569f-42cf-ff73-af78318b0934	00020000-569f-42cd-1e64-335030d70003
00010000-569f-42cf-fa56-8923319fbc17	00020000-569f-42cd-c422-7b138ac17f00
\.


--
-- TOC entry 3187 (class 0 OID 38203894)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 38203832)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 38203755)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569f-42cf-9a3b-0ab3ec463793	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569f-42cf-284f-d96a248854d5	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569f-42cf-1485-b8ba79201876	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3136 (class 0 OID 38203392)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569f-42cc-8657-403ddce40a84	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569f-42cc-0948-7475a5bda55f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569f-42cc-7af2-1f6e1d23596c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569f-42cc-892e-02fe051220d0	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569f-42cc-883c-c37c6915e07e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3135 (class 0 OID 38203384)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569f-42cc-41df-3d66c8895636	00230000-569f-42cc-892e-02fe051220d0	popa
00240000-569f-42cc-c000-7465b9781315	00230000-569f-42cc-892e-02fe051220d0	oseba
00240000-569f-42cc-6509-34758fa36a3c	00230000-569f-42cc-892e-02fe051220d0	tippopa
00240000-569f-42cc-4267-e22d2d2d16f4	00230000-569f-42cc-892e-02fe051220d0	organizacijskaenota
00240000-569f-42cc-5409-6ca9eeb8a95e	00230000-569f-42cc-892e-02fe051220d0	sezona
00240000-569f-42cc-cd75-b9bac8eb907b	00230000-569f-42cc-892e-02fe051220d0	tipvaje
00240000-569f-42cc-d859-77760818741f	00230000-569f-42cc-892e-02fe051220d0	tipdodatka
00240000-569f-42cc-0f75-8413e4ab3d49	00230000-569f-42cc-0948-7475a5bda55f	prostor
00240000-569f-42cc-d163-1486267dcc5f	00230000-569f-42cc-892e-02fe051220d0	besedilo
00240000-569f-42cc-3b45-59666d9ac746	00230000-569f-42cc-892e-02fe051220d0	uprizoritev
00240000-569f-42cc-8c38-ad62dfe5308b	00230000-569f-42cc-892e-02fe051220d0	funkcija
00240000-569f-42cc-aaa8-65f961f6c8ae	00230000-569f-42cc-892e-02fe051220d0	tipfunkcije
00240000-569f-42cc-e9e9-b167addc1f84	00230000-569f-42cc-892e-02fe051220d0	alternacija
00240000-569f-42cc-64c8-72affee443b3	00230000-569f-42cc-8657-403ddce40a84	pogodba
00240000-569f-42cc-a08c-730a5b7c67b3	00230000-569f-42cc-892e-02fe051220d0	zaposlitev
00240000-569f-42cc-7540-fafb2779bc14	00230000-569f-42cc-892e-02fe051220d0	zvrstuprizoritve
00240000-569f-42cc-1f77-d4947fec0957	00230000-569f-42cc-8657-403ddce40a84	programdela
00240000-569f-42cc-2718-b8dacfcf968a	00230000-569f-42cc-892e-02fe051220d0	zapis
\.


--
-- TOC entry 3134 (class 0 OID 38203379)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
86f523f6-6b9e-4fb6-a065-fc78ecbc7d9f	00240000-569f-42cc-41df-3d66c8895636	0	1001
\.


--
-- TOC entry 3193 (class 0 OID 38203955)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569f-42d0-5933-71ff928769af	000e0000-569f-42cf-5588-0710dd43b28b	00080000-569f-42cf-a934-4bd755900899	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569f-42cd-f109-e9300e5a78e7
00270000-569f-42d0-274c-78f3698e4309	000e0000-569f-42cf-5588-0710dd43b28b	00080000-569f-42cf-a934-4bd755900899	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569f-42cd-f109-e9300e5a78e7
\.


--
-- TOC entry 3150 (class 0 OID 38203527)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 38203774)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569f-42d0-9bab-562a3ade38ab	00180000-569f-42d0-2f31-c85d6354b6d2	000c0000-569f-42d0-6cf1-47a193220fef	00090000-569f-42cf-5ae8-01f2c8520a91	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-42d0-64ce-ba8a15791650	00180000-569f-42d0-2f31-c85d6354b6d2	000c0000-569f-42d0-f80f-11d205ac271e	00090000-569f-42cf-6465-e611cb259be9	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-42d0-bfb2-92efc01e2fd1	00180000-569f-42d0-2f31-c85d6354b6d2	000c0000-569f-42d0-4068-d70a0b37f319	00090000-569f-42cf-e2c1-89b9cf8a1035	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-42d0-cdaa-68c0eddba88d	00180000-569f-42d0-2f31-c85d6354b6d2	000c0000-569f-42d0-402f-3b356564b831	00090000-569f-42cf-2bca-83fde894eb60	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-42d0-0b30-9eeabd405315	00180000-569f-42d0-2f31-c85d6354b6d2	000c0000-569f-42d0-f0be-55aaa8491458	00090000-569f-42cf-11ea-f25064e74281	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-42d0-0ec2-ae923917c839	00180000-569f-42d0-8f0e-02bf38961c69	\N	00090000-569f-42cf-11ea-f25064e74281	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569f-42d0-13e7-2c84d86c02b8	00180000-569f-42d0-8473-282a30f5ee64	\N	00090000-569f-42cf-6465-e611cb259be9	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-569f-42d0-1381-eae543765f59	00180000-569f-42d0-2f31-c85d6354b6d2	\N	00090000-569f-42cf-ac9a-891cea8c5d40	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 38203791)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569f-42cc-2418-ab84fceb5a47	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569f-42cc-a7c1-9b36c85a5afe	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569f-42cc-add6-8b8053d0b5fd	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569f-42cc-8b97-139393da7cf6	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569f-42cc-362b-5fc9e808ce34	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569f-42cc-9645-8fddc4e0db86	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3196 (class 0 OID 38203996)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569f-42cc-10c5-1012a4e1036a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569f-42cc-4a99-443a29a351b0	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569f-42cc-a34f-65a9a0281cb5	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569f-42cc-2387-ceb4f4182b30	04	Režija	Režija	Režija	umetnik	30
000f0000-569f-42cc-0f47-da2d18950260	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569f-42cc-aacb-0a63a4920f96	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569f-42cc-cb22-42082759b707	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569f-42cc-6bb8-e6040041ac01	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569f-42cc-9aab-948ac419fc25	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569f-42cc-e99c-a8ea2dad5ca5	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569f-42cc-6117-53ab4d1bfe9e	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569f-42cc-ff56-dd339a6b364c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569f-42cc-2a12-7765bc3ddba5	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569f-42cc-2d46-1974fc3057a4	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569f-42cc-ca36-5f439077e271	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569f-42cc-054a-71e2e6ccf568	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569f-42cc-12e0-0dd136cc2579	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569f-42cc-1fde-809ae8d5942f	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569f-42cc-cc7b-ca37d8b5d9af	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3147 (class 0 OID 38203478)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569f-42cf-2527-630e1a129206	0001	šola	osnovna ali srednja šola
00400000-569f-42cf-1030-53428e9deb6d	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569f-42cf-12ec-62dc4e5fce1b	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3209 (class 0 OID 38204300)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569f-42cc-96b5-b1b23c0de132	01	Velika predstava	f	1.00	1.00
002b0000-569f-42cc-3d08-1b775a681223	02	Mala predstava	f	0.50	0.50
002b0000-569f-42cc-6b07-924aac85272d	03	Mala koprodukcija	t	0.40	1.00
002b0000-569f-42cc-f1cf-ebd522d238a2	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569f-42cc-0668-2d02eb687f32	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3169 (class 0 OID 38203745)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569f-42cc-06c5-c2dcef1e6ca6	0001	prva vaja	prva vaja
00420000-569f-42cc-ad5a-2ae201df3ded	0002	tehnična vaja	tehnična vaja
00420000-569f-42cc-3fdf-4e0eb92d15e7	0003	lučna vaja	lučna vaja
00420000-569f-42cc-4cab-61c78dd76f7e	0004	kostumska vaja	kostumska vaja
00420000-569f-42cc-97c4-47a55557ff81	0005	foto vaja	foto vaja
00420000-569f-42cc-f087-9330041f7f2d	0006	1. glavna vaja	1. glavna vaja
00420000-569f-42cc-de48-fbe0a0c29a77	0007	2. glavna vaja	2. glavna vaja
00420000-569f-42cc-8549-d7c7ad476b72	0008	1. generalka	1. generalka
00420000-569f-42cc-9105-a5dff85a3c27	0009	2. generalka	2. generalka
00420000-569f-42cc-e37d-9bd56427ac68	0010	odprta generalka	odprta generalka
00420000-569f-42cc-2382-e241ad1a9893	0011	obnovitvena vaja	obnovitvena vaja
00420000-569f-42cc-5b7a-59da6af41c19	0012	italijanka	krajša "obnovitvena" vaja
00420000-569f-42cc-1584-f28da237ee08	0013	pevska vaja	pevska vaja
00420000-569f-42cc-8f74-e50352c11823	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569f-42cc-a227-c15d31d7c61c	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569f-42cc-8ef1-b9e26cd4b589	0016	orientacijska vaja	orientacijska vaja
00420000-569f-42cc-40bc-9c7b60dee95c	0017	situacijska vaja	situacijska vaja
00420000-569f-42cc-5c99-35b95a8d4aa8	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3156 (class 0 OID 38203600)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 38203414)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569f-42cd-67f7-27b8fabc0dad	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROUPFI65R.7jkOQgnZBjdmrVLrSjFCedO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569f-42cf-38e8-ffd503c8a5a3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569f-42cf-3878-91a84a7f4d62	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569f-42cf-5e71-7a37418dba3f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569f-42cf-73bc-549d609ecd84	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569f-42cf-7650-c2b33016a745	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569f-42cf-fea1-1ca1e6131be8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569f-42cf-72a3-004a524a784f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569f-42cf-97f5-a283fd886a91	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569f-42cf-3651-6ee3e7d09e0c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569f-42cf-95d5-f4d35ce71261	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569f-42cf-0a1e-f7a1489b4bed	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569f-42cf-35c0-072ff2bf3f82	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569f-42cf-3521-da65da0ba501	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569f-42cf-f341-a4f3cc43faaa	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569f-42cf-37b8-8d33f8729511	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569f-42cf-4875-395049823d5c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569f-42cf-3025-aa33379b0266	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569f-42cf-e2ba-63ec7799bf59	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569f-42cf-a1ac-45901f92df3c	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569f-42cf-d1d2-97fb18e78f6b	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569f-42cf-b723-d19f1cac123f	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569f-42cf-7dc9-b590f9849a53	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569f-42cf-4c60-95781195e200	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569f-42cf-182b-fdd1daaa819a	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569f-42cf-ff73-af78318b0934	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569f-42cf-fa56-8923319fbc17	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569f-42cd-8008-d04ad114a1b2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3200 (class 0 OID 38204046)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569f-42cf-3f75-5e7bb25e4238	00160000-569f-42cf-9609-c2755835327c	\N	00140000-569f-42cc-abde-c949d3da816f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569f-42cf-4ec5-1c1c57e9964e
000e0000-569f-42cf-5588-0710dd43b28b	00160000-569f-42cf-0a30-74afe8cebd49	\N	00140000-569f-42cc-d93e-d014a424246e	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569f-42cf-8116-6f177794de50
000e0000-569f-42cf-2a2d-fdee77f8a984	\N	\N	00140000-569f-42cc-d93e-d014a424246e	00190000-569f-42cf-f163-1edd25aeff62	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-42cf-4ec5-1c1c57e9964e
000e0000-569f-42cf-dd79-b4d958844e92	\N	\N	00140000-569f-42cc-d93e-d014a424246e	00190000-569f-42cf-f163-1edd25aeff62	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-42cf-4ec5-1c1c57e9964e
000e0000-569f-42cf-2c63-38f5ce9d431d	\N	\N	00140000-569f-42cc-d93e-d014a424246e	00190000-569f-42cf-f163-1edd25aeff62	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-a12f-d3c0dc1183f2	\N	\N	00140000-569f-42cc-d93e-d014a424246e	00190000-569f-42cf-f163-1edd25aeff62	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-1297-b1ac3636f3d3	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-a5ce-54a66eecf111	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-113b-81d13f4af8e3	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-54ba-9f43ca9b08ca	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-7c67-cac6d0d09e7c	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-5c81-c726d7426067	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-ac13-1f40950ef8e9	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-56c3-96793e4249b6	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
000e0000-569f-42cf-442d-dd452831277e	\N	\N	00140000-569f-42cc-d1f3-d6efe139f286	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-42cf-4e44-628b3e0336a4
\.


--
-- TOC entry 3171 (class 0 OID 38203765)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 38203695)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569f-42cf-3415-ad060c3f9f25	\N	000e0000-569f-42cf-5588-0710dd43b28b	1
00200000-569f-42cf-224d-1d8371ff47a4	\N	000e0000-569f-42cf-5588-0710dd43b28b	2
00200000-569f-42cf-2403-f462254e213f	\N	000e0000-569f-42cf-5588-0710dd43b28b	3
00200000-569f-42cf-fe68-4309e9b5cdf9	\N	000e0000-569f-42cf-5588-0710dd43b28b	4
00200000-569f-42cf-d39a-9b9ac472adc7	\N	000e0000-569f-42cf-5588-0710dd43b28b	5
\.


--
-- TOC entry 3183 (class 0 OID 38203859)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 38203969)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569f-42cd-2f4c-16ee1f7afc88	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569f-42cd-91b7-6c35b3a7ed39	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569f-42cd-f0fc-c9d7a3c12619	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569f-42cd-b9a5-e6e1c5b43db8	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569f-42cd-5fc7-b1995eda801a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569f-42cd-0a52-946d79d8028d	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569f-42cd-8c13-6071cccd186b	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569f-42cd-55c8-c1f65ef208f1	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569f-42cd-f109-e9300e5a78e7	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569f-42cd-e61f-91d66635f419	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569f-42cd-5f7c-c298e95af7e8	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569f-42cd-2c64-11552b45e65e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569f-42cd-8ca9-7a39dfff2204	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569f-42cd-9218-1af98459c770	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569f-42cd-106f-de72a95cd6e6	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569f-42cd-4585-65b031aafa41	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569f-42cd-5493-42d9a2aaffbd	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569f-42cd-dd6e-e9256eee2c47	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569f-42cd-cee0-6dbd773ce062	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569f-42cd-9937-9a9391827dcc	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569f-42cd-e188-1f1ccd3bee62	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569f-42cd-684b-a669628986d1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569f-42cd-b9cb-a6c14d795ae3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569f-42cd-4fb2-f2a5a3eb8eb1	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569f-42cd-7de0-3cf466903181	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569f-42cd-e4d4-d3ea623fbc6a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569f-42cd-8fa0-6baec88d71a0	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569f-42cd-b896-d3b721a3c03c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3212 (class 0 OID 38204350)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 38204319)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 38204362)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 38203931)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569f-42cf-40f4-56ba8c21d1b8	00090000-569f-42cf-6465-e611cb259be9	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-42cf-fcb9-7b1cfdaeb9df	00090000-569f-42cf-e2c1-89b9cf8a1035	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-42cf-3afe-7e47d2f2488a	00090000-569f-42cf-b158-7f7f22e8bf47	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-42cf-da8d-863f2dd8222c	00090000-569f-42cf-8720-f548c3ab4f20	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-42cf-3e33-0e76ee78f392	00090000-569f-42cf-ccf4-6b33850c57e6	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-42cf-2043-253a9752fcad	00090000-569f-42cf-4437-79c3fdb5d141	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3133 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 38204036)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569f-42cc-abde-c949d3da816f	01	Drama	drama (SURS 01)
00140000-569f-42cc-4e17-9821b683fa75	02	Opera	opera (SURS 02)
00140000-569f-42cc-b197-9f7ec0dbbfa0	03	Balet	balet (SURS 03)
00140000-569f-42cc-93e2-a00561aa0c0e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569f-42cc-d1f3-d6efe139f286	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569f-42cc-d93e-d014a424246e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569f-42cc-8b89-8a349d3923fe	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3189 (class 0 OID 38203921)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 38203477)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 38204094)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 38204085)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 38203468)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 38203952)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 38203994)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 38204403)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 38203788)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 38203724)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 38203739)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 38203744)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 38204317)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 38203626)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 38204163)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 38203917)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 38203693)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 38203664)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 38203640)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 38203824)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 38204380)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 38204387)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 38204411)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2766 (class 2606 OID 38203851)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 38203598)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 38203496)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 38203560)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 38203523)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 38203457)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 38203442)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 38203857)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 38203893)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 38204031)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 38203551)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 38203586)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 38204268)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 38203830)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 38203576)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 38203709)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 38203681)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 38203674)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 38203842)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 38204277)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 38204285)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 38204255)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 38204298)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 38203875)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 38203815)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 38203806)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 38204018)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 38203945)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 38203652)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 38203413)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 38203884)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 38203431)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 38203451)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 38203902)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 38203837)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 38203763)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 38203401)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 38203389)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 38203383)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 38203965)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 38203532)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 38203780)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 38203798)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 38204005)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 38203485)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 38204310)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 38203752)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 38203611)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 38203426)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 38204064)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 38203771)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 38203699)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 38203865)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 38203977)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 38204360)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 38204344)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 38204368)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 38203935)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 38204044)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 38203929)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 38203733)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 38203734)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 38203732)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 38203731)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 38203730)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 38203966)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 38203967)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 38203968)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 38204382)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 38204381)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 38203553)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 38203554)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 38203858)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 38204348)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 38204347)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 38204349)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 38204346)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 38204345)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2761 (class 1259 OID 38203844)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2762 (class 1259 OID 38203843)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 38203700)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 38203701)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 38203918)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 38203920)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 38203919)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 38203642)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 38203641)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 38204299)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 38204033)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 38204034)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 38204035)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 38204369)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 38204069)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 38204066)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 38204070)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 38204068)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 38204067)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 38203613)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 38203612)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 38203526)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 38203885)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 38203458)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 38203459)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 38203905)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 38203904)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 38203903)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 38203563)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 38203562)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 38203564)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 38203675)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 38203676)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 38203391)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2741 (class 1259 OID 38203810)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2742 (class 1259 OID 38203808)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2743 (class 1259 OID 38203807)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2744 (class 1259 OID 38203809)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 38203432)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 38203433)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 38203866)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 38204404)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 38203954)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 38203953)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 38204412)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 38204413)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2756 (class 1259 OID 38203831)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 38203946)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 38203947)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 38204168)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 38204167)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 38204164)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 38204165)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 38204166)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 38203578)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 38203577)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 38203579)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 38203879)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 38203878)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 38204278)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 38204279)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 38204098)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 38204099)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 38204096)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 38204097)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2735 (class 1259 OID 38203789)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2736 (class 1259 OID 38203790)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 38203936)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 38203937)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2724 (class 1259 OID 38203772)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 38203819)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2748 (class 1259 OID 38203818)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2749 (class 1259 OID 38203816)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2750 (class 1259 OID 38203817)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 38204086)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 38203653)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 38203667)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 38203666)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 38203665)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 38203668)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 38203694)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 38203682)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 38203683)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 38204269)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 38204318)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 38204388)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 38204389)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 38203498)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 38203497)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 38203533)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 38203534)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 38203783)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 38203782)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2730 (class 1259 OID 38203781)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2708 (class 1259 OID 38203726)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2709 (class 1259 OID 38203729)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2710 (class 1259 OID 38203725)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2711 (class 1259 OID 38203728)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2712 (class 1259 OID 38203727)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 38203552)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 38203486)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 38203487)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 38203627)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 38203629)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 38203628)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 38203630)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2755 (class 1259 OID 38203825)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 38204032)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 38204065)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 38204006)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 38204007)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 38203524)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 38203525)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2739 (class 1259 OID 38203799)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 38203800)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 38203930)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 38203402)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 38203599)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 38203561)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 38203390)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 38204311)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 38203877)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 38203876)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 38203753)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 38203754)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 38204095)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2725 (class 1259 OID 38203773)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 38203587)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 38204045)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 38204361)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 38204286)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 38204287)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 38203995)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2723 (class 1259 OID 38203764)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 38203452)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2942 (class 2606 OID 38204579)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2947 (class 2606 OID 38204604)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 38204594)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2941 (class 2606 OID 38204574)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 38204589)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2946 (class 2606 OID 38204599)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2943 (class 2606 OID 38204584)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2984 (class 2606 OID 38204789)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2985 (class 2606 OID 38204794)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 38204799)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3018 (class 2606 OID 38204959)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 38204954)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 38204469)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 38204474)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 38204704)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3014 (class 2606 OID 38204939)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 38204934)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3015 (class 2606 OID 38204944)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 38204929)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3011 (class 2606 OID 38204924)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2966 (class 2606 OID 38204699)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2965 (class 2606 OID 38204694)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 38204564)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2940 (class 2606 OID 38204569)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 38204744)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 38204754)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2976 (class 2606 OID 38204749)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 38204524)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 38204519)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 38204684)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 38204914)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2987 (class 2606 OID 38204804)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 38204809)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 38204814)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3016 (class 2606 OID 38204949)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2993 (class 2606 OID 38204834)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2990 (class 2606 OID 38204819)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2994 (class 2606 OID 38204839)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2992 (class 2606 OID 38204829)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2991 (class 2606 OID 38204824)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 38204514)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 38204509)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 38204454)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 38204449)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 38204724)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 38204429)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 38204434)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2974 (class 2606 OID 38204739)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2973 (class 2606 OID 38204734)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2972 (class 2606 OID 38204729)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 38204484)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 38204479)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 38204489)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 38204539)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 38204544)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 38204414)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 38204659)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 38204649)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 38204644)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 38204654)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 38204419)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 38204424)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2968 (class 2606 OID 38204709)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3021 (class 2606 OID 38204974)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2983 (class 2606 OID 38204784)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 38204779)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 38204979)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3023 (class 2606 OID 38204984)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 38204689)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 38204769)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2981 (class 2606 OID 38204774)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3004 (class 2606 OID 38204889)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3003 (class 2606 OID 38204884)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3000 (class 2606 OID 38204869)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3001 (class 2606 OID 38204874)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3002 (class 2606 OID 38204879)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 38204499)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 38204494)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 38204504)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2970 (class 2606 OID 38204719)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 38204714)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 38204899)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3007 (class 2606 OID 38204904)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2998 (class 2606 OID 38204859)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2999 (class 2606 OID 38204864)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2996 (class 2606 OID 38204849)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 38204854)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 38204634)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 38204639)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 38204759)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2979 (class 2606 OID 38204764)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 38204609)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 38204614)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 38204679)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 38204674)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 38204664)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 38204669)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2995 (class 2606 OID 38204844)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 38204529)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 38204534)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 38204559)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 38204549)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 38204554)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3005 (class 2606 OID 38204894)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3008 (class 2606 OID 38204909)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 38204919)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 38204964)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3020 (class 2606 OID 38204969)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 38204444)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 38204439)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 38204459)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 38204464)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 38204629)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 38204624)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 38204619)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-20 09:18:27 CET

--
-- PostgreSQL database dump complete
--

