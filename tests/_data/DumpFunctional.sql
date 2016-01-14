--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-14 13:32:01 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 256 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 256
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 36291445)
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
-- TOC entry 240 (class 1259 OID 36292071)
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
-- TOC entry 239 (class 1259 OID 36292055)
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
-- TOC entry 182 (class 1259 OID 36291438)
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
-- TOC entry 181 (class 1259 OID 36291436)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 230 (class 1259 OID 36291932)
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
-- TOC entry 233 (class 1259 OID 36291962)
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
-- TOC entry 254 (class 1259 OID 36292374)
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
-- TOC entry 210 (class 1259 OID 36291759)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    prisotnost_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 203 (class 1259 OID 36291687)
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
-- TOC entry 205 (class 1259 OID 36291719)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 36291724)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 36292296)
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
-- TOC entry 194 (class 1259 OID 36291590)
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
-- TOC entry 241 (class 1259 OID 36292084)
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
-- TOC entry 226 (class 1259 OID 36291890)
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
-- TOC entry 200 (class 1259 OID 36291661)
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
-- TOC entry 197 (class 1259 OID 36291630)
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
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 36291607)
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
-- TOC entry 215 (class 1259 OID 36291804)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 252 (class 1259 OID 36292354)
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
-- TOC entry 253 (class 1259 OID 36292367)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 36292389)
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
-- TOC entry 219 (class 1259 OID 36291829)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 36291564)
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
-- TOC entry 185 (class 1259 OID 36291464)
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
-- TOC entry 189 (class 1259 OID 36291531)
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
-- TOC entry 186 (class 1259 OID 36291475)
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
-- TOC entry 178 (class 1259 OID 36291410)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 36291429)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 36291836)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 36291870)
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
-- TOC entry 236 (class 1259 OID 36292003)
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
-- TOC entry 188 (class 1259 OID 36291511)
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
-- TOC entry 191 (class 1259 OID 36291556)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 36292240)
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
-- TOC entry 216 (class 1259 OID 36291810)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 36291541)
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
-- TOC entry 202 (class 1259 OID 36291679)
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
-- TOC entry 198 (class 1259 OID 36291645)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 199 (class 1259 OID 36291654)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 36291776)
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
-- TOC entry 218 (class 1259 OID 36291822)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 36292254)
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
-- TOC entry 245 (class 1259 OID 36292264)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 36292153)
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
-- TOC entry 246 (class 1259 OID 36292272)
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
-- TOC entry 222 (class 1259 OID 36291851)
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
-- TOC entry 214 (class 1259 OID 36291795)
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
-- TOC entry 213 (class 1259 OID 36291785)
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
-- TOC entry 235 (class 1259 OID 36291992)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 36291922)
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
-- TOC entry 196 (class 1259 OID 36291619)
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
-- TOC entry 175 (class 1259 OID 36291381)
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
-- TOC entry 174 (class 1259 OID 36291379)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 223 (class 1259 OID 36291864)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 36291419)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 36291403)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 36291878)
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
-- TOC entry 217 (class 1259 OID 36291816)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 36291739)
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
-- TOC entry 173 (class 1259 OID 36291368)
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
-- TOC entry 172 (class 1259 OID 36291360)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 36291355)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 231 (class 1259 OID 36291939)
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
-- TOC entry 187 (class 1259 OID 36291503)
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
-- TOC entry 209 (class 1259 OID 36291749)
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
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 211 (class 1259 OID 36291766)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 234 (class 1259 OID 36291980)
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
-- TOC entry 184 (class 1259 OID 36291454)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 247 (class 1259 OID 36292284)
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
-- TOC entry 207 (class 1259 OID 36291729)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 36291576)
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
-- TOC entry 176 (class 1259 OID 36291390)
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
-- TOC entry 238 (class 1259 OID 36292030)
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
-- TOC entry 201 (class 1259 OID 36291672)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 221 (class 1259 OID 36291843)
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
-- TOC entry 232 (class 1259 OID 36291953)
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
-- TOC entry 250 (class 1259 OID 36292334)
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
-- TOC entry 249 (class 1259 OID 36292303)
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
-- TOC entry 251 (class 1259 OID 36292346)
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
-- TOC entry 228 (class 1259 OID 36291915)
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
-- TOC entry 204 (class 1259 OID 36291713)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 237 (class 1259 OID 36292020)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 227 (class 1259 OID 36291905)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2252 (class 2604 OID 36291441)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 36291384)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3139 (class 0 OID 36291445)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5697-953d-2689-386ed092bd8b	10	30	Otroci	Abonma za otroke	200
000a0000-5697-953d-26a3-be80032f982f	20	60	Mladina	Abonma za mladino	400
000a0000-5697-953d-9a77-de683d4282c0	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3196 (class 0 OID 36292071)
-- Dependencies: 240
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5697-953e-5471-08f915a451df	000d0000-5697-953e-0776-551ad09d74f1	\N	00090000-5697-953e-5fa4-30979214b8cb	000b0000-5697-953e-62e8-e85147f0bc53	0001	f	\N	\N	\N	3	t	t	t
000c0000-5697-953e-5be3-45974ed48281	000d0000-5697-953e-3a7d-5454d242f342	00100000-5697-953e-32fa-6f3fb7c079ff	00090000-5697-953e-e550-c00c54677d4d	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5697-953e-d301-b29040691e19	000d0000-5697-953e-daa8-04ea8832f206	00100000-5697-953e-f67a-f92303b23f62	00090000-5697-953e-ada5-813a2e643638	\N	0003	t	\N	2016-01-14	\N	2	t	f	f
000c0000-5697-953e-b3f5-9d121db81e35	000d0000-5697-953e-5aa8-c127a9fff099	\N	00090000-5697-953e-151e-24a0bb698e69	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5697-953e-4936-267756067bdb	000d0000-5697-953e-d1cf-5b7ee80e6fed	\N	00090000-5697-953e-6140-74f0b3380317	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5697-953e-decd-2e78469522c9	000d0000-5697-953e-bba2-2f3928ea80ae	\N	00090000-5697-953e-a46a-87d92ddc53ed	000b0000-5697-953e-970d-791a304ec7bf	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5697-953e-953b-c98707baa462	000d0000-5697-953e-65db-a2cdc71337e6	00100000-5697-953e-02f3-89297cc0191b	00090000-5697-953e-defd-ce518fb1a902	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5697-953e-3bee-857cef9ca511	000d0000-5697-953e-b950-345e962f0e4e	\N	00090000-5697-953e-a9a5-587dfc861850	000b0000-5697-953e-e15e-76c5c9172dc9	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5697-953e-f064-c58529f5b3e9	000d0000-5697-953e-65db-a2cdc71337e6	00100000-5697-953e-c716-04d8c7a3c669	00090000-5697-953e-7a57-a6520f1daf80	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5697-953e-1e1c-4207e4a3cd6c	000d0000-5697-953e-65db-a2cdc71337e6	00100000-5697-953e-8b27-4c17e602cb88	00090000-5697-953e-ab76-0c66e1528aa2	\N	0010	t	\N	2016-01-14	\N	16	f	f	t
000c0000-5697-953e-125a-00d3492dac34	000d0000-5697-953e-65db-a2cdc71337e6	00100000-5697-953e-1c3f-1b5f213e0a34	00090000-5697-953e-a15d-bacb1e04e126	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5697-953e-7dc1-e86fa5ed420b	000d0000-5697-953e-f873-30f075448cc2	00100000-5697-953e-32fa-6f3fb7c079ff	00090000-5697-953e-e550-c00c54677d4d	000b0000-5697-953e-0b32-a6defa1580e9	0012	t	\N	\N	\N	2	t	t	t
000c0000-5697-953e-d9da-2bc57942a4e7	000d0000-5697-953e-75ac-272b7c95ca91	\N	00090000-5697-953e-a9a5-587dfc861850	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5697-953e-a547-bb93966c40ec	000d0000-5697-953e-75ac-272b7c95ca91	\N	00090000-5697-953e-b4fb-8fb70a2ca5dd	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5697-953e-ecd3-7a4de277a376	000d0000-5697-953e-bd03-5b4bf8246ace	00100000-5697-953e-f67a-f92303b23f62	00090000-5697-953e-ada5-813a2e643638	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5697-953e-ac2c-4d1296b353b2	000d0000-5697-953e-bd03-5b4bf8246ace	\N	00090000-5697-953e-b4fb-8fb70a2ca5dd	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5697-953e-3ed7-98b4402a9c94	000d0000-5697-953e-8bc2-d9b241e0f91b	\N	00090000-5697-953e-b4fb-8fb70a2ca5dd	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5697-953e-d279-81cc77662594	000d0000-5697-953e-8bc2-d9b241e0f91b	\N	00090000-5697-953e-a9a5-587dfc861850	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5697-953e-a19a-40669e684325	000d0000-5697-953e-2ee4-28cfb443fb62	00100000-5697-953e-02f3-89297cc0191b	00090000-5697-953e-defd-ce518fb1a902	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5697-953e-3cc8-c995af18af04	000d0000-5697-953e-2ee4-28cfb443fb62	\N	00090000-5697-953e-b4fb-8fb70a2ca5dd	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5697-953e-cde2-58be8fe369b8	000d0000-5697-953e-51a4-8ce94a5fbc2c	\N	00090000-5697-953e-b4fb-8fb70a2ca5dd	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5697-953e-8acf-a114620c18f4	000d0000-5697-953e-51a4-8ce94a5fbc2c	00100000-5697-953e-02f3-89297cc0191b	00090000-5697-953e-defd-ce518fb1a902	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5697-953e-ae93-a218a8ff246d	000d0000-5697-953e-c310-561514d4535a	\N	00090000-5697-953e-b4fb-8fb70a2ca5dd	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5697-953e-c225-a271ec424923	000d0000-5697-953e-f2ff-3fff1fe0e27a	\N	00090000-5697-953e-a9a5-587dfc861850	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5697-953e-ddb4-dd6000bb46eb	000d0000-5697-953e-e792-3edf0095a98a	\N	00090000-5697-953e-a9a5-587dfc861850	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5697-953e-f42f-99aa661b8c89	000d0000-5697-953e-e792-3edf0095a98a	00100000-5697-953e-f67a-f92303b23f62	00090000-5697-953e-ada5-813a2e643638	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5697-953e-5b2e-a108f80fd576	000d0000-5697-953e-f274-59c2cab91916	\N	00090000-5697-953e-eb7e-a4983acece29	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5697-953e-dfba-aee7de815bdc	000d0000-5697-953e-f274-59c2cab91916	\N	00090000-5697-953e-ec9b-65cc36a1ab9a	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5697-953e-85eb-5aa9371b6c78	000d0000-5697-953e-29b6-10275a2e651f	\N	00090000-5697-953e-a9a5-587dfc861850	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5697-953e-87eb-1150b4e2d3b5	000d0000-5697-953e-29b6-10275a2e651f	00100000-5697-953e-f67a-f92303b23f62	00090000-5697-953e-ada5-813a2e643638	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5697-953e-9b2e-621c35805289	000d0000-5697-953e-29b6-10275a2e651f	\N	00090000-5697-953e-ec9b-65cc36a1ab9a	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5697-953e-0885-699b1d43063c	000d0000-5697-953e-29b6-10275a2e651f	\N	00090000-5697-953e-eb7e-a4983acece29	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5697-953e-5918-010069d16709	000d0000-5697-953e-e3ba-3928f2ce84ac	\N	00090000-5697-953e-a9a5-587dfc861850	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5697-953e-895d-a5fe3e310d70	000d0000-5697-953e-dda2-289dc5107a6f	00100000-5697-953e-f67a-f92303b23f62	00090000-5697-953e-ada5-813a2e643638	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5697-953e-1fd1-8776e274e54c	000d0000-5697-953e-dda2-289dc5107a6f	\N	00090000-5697-953e-b4fb-8fb70a2ca5dd	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3195 (class 0 OID 36292055)
-- Dependencies: 239
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 36291438)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3186 (class 0 OID 36291932)
-- Dependencies: 230
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5697-953e-581a-e3cb8503a6fe	00160000-5697-953d-64b1-7d36efb14fd1	00090000-5697-953e-ec9b-65cc36a1ab9a	aizv	10	t
003d0000-5697-953e-b629-6edbc1b3910d	00160000-5697-953d-64b1-7d36efb14fd1	00090000-5697-953e-441b-02722b53bf32	apri	14	t
003d0000-5697-953e-e640-b62d8e947274	00160000-5697-953d-fc2b-4dcbb9f59a89	00090000-5697-953e-eb7e-a4983acece29	aizv	11	t
003d0000-5697-953e-14dc-f6df38b7ee32	00160000-5697-953d-8782-75766b6c36ae	00090000-5697-953e-dab1-f6cf2ce1e407	aizv	12	t
003d0000-5697-953e-109f-6fcf482b50e5	00160000-5697-953d-64b1-7d36efb14fd1	00090000-5697-953e-b4fb-8fb70a2ca5dd	apri	18	f
\.


--
-- TOC entry 3189 (class 0 OID 36291962)
-- Dependencies: 233
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5697-953d-64b1-7d36efb14fd1	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5697-953d-fc2b-4dcbb9f59a89	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5697-953d-8782-75766b6c36ae	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3210 (class 0 OID 36292374)
-- Dependencies: 254
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 36291759)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, prisotnost_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 36291687)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5697-953e-7d0e-ae4cf0601ac4	\N	\N	00200000-5697-953e-f9f4-c14a59f7ca85	\N	\N	\N	00220000-5697-953d-c943-721d677b0ad7	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5697-953e-0c51-499baa88907b	\N	\N	00200000-5697-953e-651b-6aad2848dfd2	\N	\N	\N	00220000-5697-953d-c943-721d677b0ad7	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5697-953e-005d-1e173f011663	\N	\N	00200000-5697-953e-3f86-d030df467ddf	\N	\N	\N	00220000-5697-953d-fbb7-7a3a83d62ba5	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5697-953e-909d-a02bdd314cec	\N	\N	00200000-5697-953e-99b9-5d6499720ce1	\N	\N	\N	00220000-5697-953d-511c-f35969e43663	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5697-953e-b75d-ed683a44fc25	\N	\N	00200000-5697-953e-9d28-2da3c9ecb47d	\N	\N	\N	00220000-5697-953d-d1e0-e2c546c7a09a	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3161 (class 0 OID 36291719)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 36291724)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 36292296)
-- Dependencies: 248
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 36291590)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5697-953b-0f3c-88add17d4e13	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5697-953b-9074-63f6d6e4d53b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5697-953b-7e36-5f50dbdcd8e4	AL	ALB	008	Albania 	Albanija	\N
00040000-5697-953b-417e-9274a6806e93	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5697-953b-df42-1e0356f4b20c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5697-953b-ec65-f0c2a908b7d3	AD	AND	020	Andorra 	Andora	\N
00040000-5697-953b-d72e-c31de721b182	AO	AGO	024	Angola 	Angola	\N
00040000-5697-953b-afdf-37e46d63c78c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5697-953b-3928-6530eed9a6bb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5697-953b-5777-09be477a78d4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-953b-788e-e34af4ed770d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5697-953b-b96d-b91979b1f37a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5697-953b-1e58-f50e83c84af8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5697-953b-d3ec-9775f8633257	AU	AUS	036	Australia 	Avstralija	\N
00040000-5697-953b-ccce-b9656dda6dc2	AT	AUT	040	Austria 	Avstrija	\N
00040000-5697-953b-0c42-379db2a1a52c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5697-953b-6eaf-ac3458a9ac97	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5697-953b-b921-d5ec0ff45c67	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5697-953b-3370-dd6cf9a51e0d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5697-953b-1145-e54ea466d043	BB	BRB	052	Barbados 	Barbados	\N
00040000-5697-953b-5050-68fb531b1cda	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5697-953b-f1a3-469f1a4c7ba6	BE	BEL	056	Belgium 	Belgija	\N
00040000-5697-953b-24c2-92a6eddd0330	BZ	BLZ	084	Belize 	Belize	\N
00040000-5697-953b-6617-b3599d5263b0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5697-953b-602f-65c5e90e2781	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5697-953b-ba53-edceee64105a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5697-953b-cfdd-4c73b397e0ee	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5697-953b-edec-6393d04ee8e1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5697-953b-f87f-17b59c676310	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5697-953b-616b-95d16f4120f0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5697-953b-70ef-c1601143b0e4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5697-953b-61e7-d15321c16adc	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5697-953b-01a4-fa5f3867dd09	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5697-953b-7dad-b7f0e71a2ffa	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5697-953b-2022-bf50df016329	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5697-953b-96bc-1e94654d73d8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5697-953b-d692-b7ccb1bd084b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5697-953b-f65d-4d001421bb74	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5697-953b-9272-d6c05009c904	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5697-953b-246c-bb2e70f953f1	CA	CAN	124	Canada 	Kanada	\N
00040000-5697-953b-6608-c7239bd39be2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5697-953b-2ccf-3a5a93bf8f29	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5697-953b-1d66-9a14944423b4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5697-953b-a37c-ba251084ea3e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5697-953b-19b4-eebac1da23fa	CL	CHL	152	Chile 	Čile	\N
00040000-5697-953b-7143-7aac2ef1b255	CN	CHN	156	China 	Kitajska	\N
00040000-5697-953b-1773-46e7c946fd30	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5697-953b-9e8b-80c3ccef270d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5697-953b-4724-d4e3afcc1cdf	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5697-953b-337d-51d540f20957	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5697-953b-9f6e-7d559d9eec58	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5697-953b-878e-3e5065ac2e94	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5697-953b-15aa-5b1c371893c8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5697-953b-976b-44b8aa68c80e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5697-953b-42fc-49aa6167114c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5697-953b-250b-8f0c17b3a671	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5697-953b-f4d7-6abfc7ff81df	CU	CUB	192	Cuba 	Kuba	\N
00040000-5697-953b-4b61-c850484382c5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5697-953b-d715-fb02fe12474d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5697-953b-88b0-8fe19ea67d5d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5697-953b-2469-42d115ca1406	DK	DNK	208	Denmark 	Danska	\N
00040000-5697-953b-c173-518602b2d529	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5697-953b-b07b-4a0a9cfdb08e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-953b-5312-b0c186d46900	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5697-953b-e4f4-161b21f63243	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5697-953b-ab74-6ff7be872d05	EG	EGY	818	Egypt 	Egipt	\N
00040000-5697-953b-5c69-c0699789af50	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5697-953b-2e9f-722472dbfbaa	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5697-953b-c579-b856dc8566fd	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5697-953b-e707-68bdf3c4250b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5697-953b-0101-dd61b59c97cf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5697-953b-65f5-5d8da88a86b1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5697-953b-0653-aec69db58b18	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5697-953b-b98d-8aad3f4ff186	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5697-953b-3549-ab688eaae140	FI	FIN	246	Finland 	Finska	\N
00040000-5697-953b-bb32-1881f312b82c	FR	FRA	250	France 	Francija	\N
00040000-5697-953b-9ee5-167bfb27b992	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5697-953b-0a3c-9d77ff8c9ee4	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5697-953b-dd1d-5794f9c81911	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5697-953b-c9de-2054d4db6f12	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5697-953b-afa8-5291669ec9f9	GA	GAB	266	Gabon 	Gabon	\N
00040000-5697-953b-1ef9-fb0da8b405ca	GM	GMB	270	Gambia 	Gambija	\N
00040000-5697-953b-2b89-4da91dddea96	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5697-953b-cef8-1f5256f9f3cf	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5697-953b-675d-677d7e5cdb40	GH	GHA	288	Ghana 	Gana	\N
00040000-5697-953b-6686-8f5c6a4dc0e9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5697-953b-4766-97754384183b	GR	GRC	300	Greece 	Grčija	\N
00040000-5697-953b-acfa-a74480820e30	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5697-953b-0b2f-e082bdd68797	GD	GRD	308	Grenada 	Grenada	\N
00040000-5697-953b-e2e3-989738b6f9a3	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5697-953b-3f91-f3d7cd75a912	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5697-953b-347b-ff6fde8ff912	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5697-953b-883f-9c07d16e2c9e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5697-953b-4857-cea5f5a62b95	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5697-953b-8082-5de24097e181	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5697-953b-615c-61ff51b378d3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5697-953b-876e-e55e7b281a92	HT	HTI	332	Haiti 	Haiti	\N
00040000-5697-953b-690a-244f7778f9e4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5697-953b-0561-38ef5995423c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5697-953b-8b10-53a32d1dd7af	HN	HND	340	Honduras 	Honduras	\N
00040000-5697-953b-422f-5292fef0f0b7	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5697-953b-55ca-056174328764	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5697-953b-6400-a65de7ae25e5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5697-953b-5bab-c20de0a13c32	IN	IND	356	India 	Indija	\N
00040000-5697-953b-e6f3-ea8c4eb29b58	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5697-953b-9a2d-f1fbdab55e52	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5697-953b-8331-dbbb5a68bcef	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5697-953b-d449-979c59895033	IE	IRL	372	Ireland 	Irska	\N
00040000-5697-953b-fc94-8b7628da31b8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5697-953b-8432-ddb88ea50057	IL	ISR	376	Israel 	Izrael	\N
00040000-5697-953b-e5aa-fc14280b1796	IT	ITA	380	Italy 	Italija	\N
00040000-5697-953b-5176-1b9f95410037	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5697-953b-6f8e-9a2f59cee266	JP	JPN	392	Japan 	Japonska	\N
00040000-5697-953b-0e2a-72960f0451a4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5697-953b-8c54-428ec3812e2f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5697-953b-85b7-200e74896ea6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5697-953b-9e26-5e73ca563422	KE	KEN	404	Kenya 	Kenija	\N
00040000-5697-953b-b3cb-fe092f4c52c6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5697-953b-417a-4c93ccd6173e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5697-953b-4eb5-42675a3ff5ec	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5697-953b-91aa-70c0bb79c7e3	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5697-953b-ff81-4ed9b80ce528	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5697-953b-7875-97c97049029c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5697-953b-b09a-64b5b7ca1ae1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5697-953b-5b76-ee1f10c0816c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5697-953b-de37-d7227446649b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5697-953b-5b9d-095dac0c5fd3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5697-953b-82a7-9ed330d70dc4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5697-953b-b24e-ce41f86023b7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5697-953b-a052-e3c96feb9110	LT	LTU	440	Lithuania 	Litva	\N
00040000-5697-953b-7e7a-71d10c8a6bcc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5697-953b-5014-17fbaa9d1254	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5697-953b-e510-bfbdbd856c69	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5697-953b-c410-2a440dd9c9f6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5697-953b-01c4-dd112f48879b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5697-953b-3d8e-34629ad3117a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5697-953b-fc30-625eb0ac0adf	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5697-953b-c7ed-144be2490266	ML	MLI	466	Mali 	Mali	\N
00040000-5697-953b-ba6d-54531c9b8b1e	MT	MLT	470	Malta 	Malta	\N
00040000-5697-953b-cdd4-8da26091aa68	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5697-953b-bdb8-2af1e13ab696	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5697-953b-ea06-986ef18bc03d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5697-953b-a9f6-a36d9fc2c72c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5697-953b-8b81-ac983c5a877e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5697-953b-e711-c1dd4bfbfb84	MX	MEX	484	Mexico 	Mehika	\N
00040000-5697-953b-7455-90e7f3284896	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5697-953b-27ac-06fc2257e696	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5697-953b-62dd-9249a75939bc	MC	MCO	492	Monaco 	Monako	\N
00040000-5697-953b-7dc9-0cac2f4b0bc2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5697-953b-9263-1b7146c0c532	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5697-953b-ec69-bf3ff3f9e837	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5697-953b-5442-0f1cd818a338	MA	MAR	504	Morocco 	Maroko	\N
00040000-5697-953b-14ac-ad8f1473d1a6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5697-953b-537a-6a9e69961522	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5697-953b-8133-1130ea21bf39	NA	NAM	516	Namibia 	Namibija	\N
00040000-5697-953b-0060-f5da8d31cddb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5697-953b-63fa-e44acd4b218b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5697-953b-bce1-9e626c94d310	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5697-953b-fa77-d431b4b08e90	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5697-953b-8e17-4a7fd85785e9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5697-953b-b196-aa8bd0f60ee2	NE	NER	562	Niger 	Niger 	\N
00040000-5697-953b-90f1-0c46ea9165da	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5697-953b-3fda-4326b306fe6b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5697-953b-d8bb-90a7756e384e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5697-953b-e56c-fabeae01175d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5697-953b-b6aa-efaba19bf9d4	NO	NOR	578	Norway 	Norveška	\N
00040000-5697-953b-ac08-617e0e57a53f	OM	OMN	512	Oman 	Oman	\N
00040000-5697-953b-39a1-8837a5780a15	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5697-953b-9ef4-78eee1292fce	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5697-953b-365f-9431e4629a71	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5697-953b-ec5e-eb87191449b7	PA	PAN	591	Panama 	Panama	\N
00040000-5697-953b-71cd-0c9b213be927	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5697-953b-cace-853fde56b18b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5697-953b-b89a-589b184513e7	PE	PER	604	Peru 	Peru	\N
00040000-5697-953b-ac7b-0bccd466c1d4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5697-953b-8280-828c9c76a2f2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5697-953b-b767-24590eb1dc9c	PL	POL	616	Poland 	Poljska	\N
00040000-5697-953b-b16c-3954284130fa	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5697-953b-c3e0-6c2abadb0d8a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5697-953b-5970-82a96eacd8e9	QA	QAT	634	Qatar 	Katar	\N
00040000-5697-953b-f0d3-8a45da1e31bd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5697-953b-5f74-dd4c3fcf735e	RO	ROU	642	Romania 	Romunija	\N
00040000-5697-953b-88db-491942de4a31	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5697-953b-a63f-21e23e66c620	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5697-953b-9bdd-7cf3d9bb23e4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5697-953b-c6af-b37a600982c4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5697-953b-c805-01240b9ded5c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5697-953b-4447-26b136946dcf	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5697-953b-3805-9405776f1774	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5697-953b-02d8-12438880632d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5697-953b-74d2-a3958674cbac	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5697-953b-45b5-272c3bcce711	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5697-953b-6770-dfba11b35b71	SM	SMR	674	San Marino 	San Marino	\N
00040000-5697-953b-191d-4b2f07403c7c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5697-953b-3e6d-f61fd70637f8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5697-953b-21da-028e7602d774	SN	SEN	686	Senegal 	Senegal	\N
00040000-5697-953b-41ab-fe8941e5ab95	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5697-953b-817e-505d16d3f41b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5697-953b-1511-3d1e59031af1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5697-953b-4d1b-a49fc765fce0	SG	SGP	702	Singapore 	Singapur	\N
00040000-5697-953b-910f-67a3e29655ca	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5697-953b-2ecd-119d544ea6b0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5697-953b-7157-48936302ac30	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5697-953b-9298-afb4c65cfdd3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5697-953b-b176-97d278a0ffe6	SO	SOM	706	Somalia 	Somalija	\N
00040000-5697-953b-ec44-242a3f2ebb71	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5697-953b-fd05-17cbaa50fdf3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5697-953b-6649-c78b51483c3e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5697-953b-19e8-10e595797396	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5697-953b-41ed-a567ece15a51	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5697-953b-6242-7987de483d80	SD	SDN	729	Sudan 	Sudan	\N
00040000-5697-953b-2575-734a9c7edcdf	SR	SUR	740	Suriname 	Surinam	\N
00040000-5697-953b-a432-ff44f5fddbd1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5697-953b-7c25-f8975fa54eef	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5697-953b-1289-13bbbcb40c39	SE	SWE	752	Sweden 	Švedska	\N
00040000-5697-953b-7ca0-44fe98f97436	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5697-953b-b07f-6b8cac583dab	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5697-953b-b9b6-dc77ff0998cd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5697-953b-dd2f-78733acd2711	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5697-953b-f9a7-7098b5e688be	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5697-953b-cb04-2f3155a24e2f	TH	THA	764	Thailand 	Tajska	\N
00040000-5697-953b-04a2-01c2c4716ea3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5697-953b-7a8b-2cbc3636f1ac	TG	TGO	768	Togo 	Togo	\N
00040000-5697-953b-8b2a-0e57df84d70c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5697-953b-4ca1-aaa95bb380a6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5697-953b-1f2e-23338da41b11	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5697-953b-5d54-546c9cd8535d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5697-953b-185b-2bd3ca5ef6d5	TR	TUR	792	Turkey 	Turčija	\N
00040000-5697-953b-273f-9b6755d3d7b2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5697-953b-6cc0-638da6b34b03	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-953b-df92-0effa9ec230c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5697-953b-2835-bd66f9345462	UG	UGA	800	Uganda 	Uganda	\N
00040000-5697-953b-dc90-c50d630d61d5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5697-953b-d118-d732810eded7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5697-953b-e637-866d81f66c8e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5697-953b-2991-849b66c463a5	US	USA	840	United States 	Združene države Amerike	\N
00040000-5697-953b-0e79-6307a1ea0cfe	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5697-953b-aad1-7880fee3505f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5697-953b-90ab-6ad010fce11b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5697-953b-3871-14c2a7223fd0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5697-953b-114a-370cde1f75ca	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5697-953b-ed0d-9247ddd7462f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5697-953b-1416-12881bdb3b95	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-953b-0e98-ae6c8738c124	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5697-953b-e5e3-78c1bf0700c7	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5697-953b-6917-6a9557f97b90	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5697-953b-9a11-dabafbf56161	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5697-953b-f17e-e8c30caf9365	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5697-953b-a73b-2a75bef26231	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3197 (class 0 OID 36292084)
-- Dependencies: 241
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5697-953e-520a-291f798fa635	000e0000-5697-953e-0955-d59d4821617e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-953a-137d-910f95416b27	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-953e-d9fc-2aa63b4b837b	000e0000-5697-953e-193f-8623a21549c6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-953a-6ec6-f5fa177264ea	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-953e-2cdc-395341d194b3	000e0000-5697-953e-dcff-8f530fd9cb9e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-953a-137d-910f95416b27	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-953e-d1ac-6a1517a70897	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-953e-db74-753819a7f8e4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3182 (class 0 OID 36291890)
-- Dependencies: 226
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5697-953e-59b2-4de10339959a	000e0000-5697-953e-193f-8623a21549c6	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-5697-953a-ace7-83f9adfffce9
000d0000-5697-953e-b2ad-b324e75f291b	000e0000-5697-953e-a191-2c9a0a668290	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-953a-b6d6-ea5863b395b9
000d0000-5697-953e-b254-4343c13c8d7e	000e0000-5697-953e-a191-2c9a0a668290	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-0776-551ad09d74f1	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-5471-08f915a451df	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-953a-b6d6-ea5863b395b9
000d0000-5697-953e-3a7d-5454d242f342	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-5be3-45974ed48281	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-daa8-04ea8832f206	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-d301-b29040691e19	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5697-953a-f9ee-e591eb3f4eb1
000d0000-5697-953e-5aa8-c127a9fff099	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-b3f5-9d121db81e35	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5697-953a-ace7-83f9adfffce9
000d0000-5697-953e-d1cf-5b7ee80e6fed	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-4936-267756067bdb	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5697-953a-ace7-83f9adfffce9
000d0000-5697-953e-bba2-2f3928ea80ae	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-decd-2e78469522c9	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-953a-b6d6-ea5863b395b9
000d0000-5697-953e-65db-a2cdc71337e6	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-f064-c58529f5b3e9	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5697-953a-b6d6-ea5863b395b9
000d0000-5697-953e-b950-345e962f0e4e	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-3bee-857cef9ca511	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5697-953a-7dc4-3c88a144dc84
000d0000-5697-953e-f873-30f075448cc2	000e0000-5697-953e-193f-8623a21549c6	000c0000-5697-953e-7dc1-e86fa5ed420b	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5697-953a-d87a-c94fce2f00cf
000d0000-5697-953e-75ac-272b7c95ca91	000e0000-5697-953e-250d-1fa0e530eb06	000c0000-5697-953e-d9da-2bc57942a4e7	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-bd03-5b4bf8246ace	000e0000-5697-953e-ce2e-955f369e53d1	000c0000-5697-953e-ecd3-7a4de277a376	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-8bc2-d9b241e0f91b	000e0000-5697-953e-ce2e-955f369e53d1	000c0000-5697-953e-3ed7-98b4402a9c94	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-2ee4-28cfb443fb62	000e0000-5697-953e-e210-9868835821b1	000c0000-5697-953e-a19a-40669e684325	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-51a4-8ce94a5fbc2c	000e0000-5697-953e-a392-bb5eea777b04	000c0000-5697-953e-cde2-58be8fe369b8	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-c310-561514d4535a	000e0000-5697-953e-de7e-194484ec39f6	000c0000-5697-953e-ae93-a218a8ff246d	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-f2ff-3fff1fe0e27a	000e0000-5697-953e-a548-5c063d18014b	000c0000-5697-953e-c225-a271ec424923	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-e792-3edf0095a98a	000e0000-5697-953e-3d7d-250ddbb8e3b3	000c0000-5697-953e-ddb4-dd6000bb46eb	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-f274-59c2cab91916	000e0000-5697-953e-863e-43ffb9c10021	000c0000-5697-953e-5b2e-a108f80fd576	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-29b6-10275a2e651f	000e0000-5697-953e-863e-43ffb9c10021	000c0000-5697-953e-85eb-5aa9371b6c78	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-e3ba-3928f2ce84ac	000e0000-5697-953e-cd31-b6eaff0585cb	000c0000-5697-953e-5918-010069d16709	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
000d0000-5697-953e-dda2-289dc5107a6f	000e0000-5697-953e-cd31-b6eaff0585cb	000c0000-5697-953e-895d-a5fe3e310d70	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5697-953a-516d-847647f607da
\.


--
-- TOC entry 3156 (class 0 OID 36291661)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 36291630)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 36291607)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5697-953e-6f77-780b6a02258c	00080000-5697-953e-6168-536df66b025e	00090000-5697-953e-ab76-0c66e1528aa2	AK		igralka
\.


--
-- TOC entry 3171 (class 0 OID 36291804)
-- Dependencies: 215
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 36292354)
-- Dependencies: 252
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5697-953e-ab0f-fa288c44b0cd	00010000-5697-953c-dde3-200429c34d75	\N	Prva mapa	Root mapa	2016-01-14 13:31:58	2016-01-14 13:31:58	R	\N	\N
\.


--
-- TOC entry 3209 (class 0 OID 36292367)
-- Dependencies: 253
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 36292389)
-- Dependencies: 255
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 34548309)
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
-- TOC entry 3175 (class 0 OID 36291829)
-- Dependencies: 219
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 36291564)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5697-953c-88b6-c3da182ef729	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5697-953c-a58c-6f924ebfcf79	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5697-953c-5d10-22e774513191	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5697-953c-0805-c75153c34db3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5697-953c-f429-609499a4d2de	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5697-953c-cea9-a7956210e986	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5697-953c-ee28-8d4aba93bf99	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5697-953c-fb59-63f79f886fca	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-953c-06fd-31b6f22cf761	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-953c-b4d4-a479137ec9d2	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5697-953c-6517-d743adda097b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5697-953c-6476-5764b07c8dc8	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5697-953c-94be-369211f08d6b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5697-953c-cfdc-cab85e0cabdf	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5697-953d-1bd9-78820e993efe	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5697-953d-a707-806ed4aabc24	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5697-953d-de88-b08cf7fa79f5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5697-953d-d6e9-b4d3ed461e2b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5697-953d-a8b1-3890af793c3d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5697-9540-ff6e-efa9de955ffa	application.tenant.maticnopodjetje	string	s:36:"00080000-5697-9540-60cc-ffb9526ded09";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3141 (class 0 OID 36291464)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5697-953d-3710-2265a4607c95	00000000-5697-953d-1bd9-78820e993efe	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5697-953d-7520-39998888c4a4	00000000-5697-953d-1bd9-78820e993efe	00010000-5697-953c-dde3-200429c34d75	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5697-953d-a38d-1ae6a7f5f893	00000000-5697-953d-a707-806ed4aabc24	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3145 (class 0 OID 36291531)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5697-953e-1b75-a273fb409724	\N	00100000-5697-953e-32fa-6f3fb7c079ff	00100000-5697-953e-f67a-f92303b23f62	01	Gledališče Nimbis
00410000-5697-953e-1d10-07f3581b2e65	00410000-5697-953e-1b75-a273fb409724	00100000-5697-953e-32fa-6f3fb7c079ff	00100000-5697-953e-f67a-f92303b23f62	02	Tehnika
\.


--
-- TOC entry 3142 (class 0 OID 36291475)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5697-953e-5fa4-30979214b8cb	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5697-953e-151e-24a0bb698e69	00010000-5697-953d-f0c3-95bb49ba3054	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5697-953e-ada5-813a2e643638	00010000-5697-953d-5bf6-8176530a0ca3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5697-953e-7a57-a6520f1daf80	00010000-5697-953d-f92b-a001eed089fb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5697-953e-6947-adca9f437a0e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5697-953e-a46a-87d92ddc53ed	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5697-953e-a15d-bacb1e04e126	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5697-953e-defd-ce518fb1a902	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5697-953e-ab76-0c66e1528aa2	00010000-5697-953d-0e14-b62267eaabc8	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5697-953e-e550-c00c54677d4d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5697-953e-f8dc-40695cb94b49	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-953e-6140-74f0b3380317	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5697-953e-a9a5-587dfc861850	00010000-5697-953d-788d-07f7ef3ef861	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-953e-ec9b-65cc36a1ab9a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-953e-441b-02722b53bf32	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-953e-eb7e-a4983acece29	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-953e-dab1-f6cf2ce1e407	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-953e-b4fb-8fb70a2ca5dd	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-953e-c3e1-43ac9b37cdf5	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-953e-6740-5b8cba5fbf93	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-953e-3242-93e3605dd1db	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3134 (class 0 OID 36291410)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5697-953b-ea84-cc6a7cfcf2e0	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5697-953b-a94c-c907c77602aa	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5697-953b-ff36-0688cc0d0b3e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5697-953b-4151-000cf9306c29	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5697-953b-e8a3-9975600906cc	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5697-953b-856d-48bcb4a59379	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5697-953b-ab75-6edfefc135a2	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5697-953b-a5d6-7b83ea6ddea8	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5697-953b-c78d-85c9a116c5f2	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5697-953b-0c21-a6b72de22595	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5697-953b-e380-f0b7901c9472	Abonma-read	Abonma - branje	t
00030000-5697-953b-bed7-f2f8e6ace93d	Abonma-write	Abonma - spreminjanje	t
00030000-5697-953b-ff5e-fa932176d3ed	Alternacija-read	Alternacija - branje	t
00030000-5697-953b-9429-42b7d9a31bb4	Alternacija-write	Alternacija - spreminjanje	t
00030000-5697-953b-a278-119a98a577d0	Arhivalija-read	Arhivalija - branje	t
00030000-5697-953b-c957-12a2cbd08cb0	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5697-953b-662e-2ceba6c84691	AuthStorage-read	AuthStorage - branje	t
00030000-5697-953b-0629-5bcb6a22b213	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5697-953b-462c-c27adfa8ab58	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5697-953b-91c3-9f0ce5868d89	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5697-953b-0454-aaa3f0c13ad5	Besedilo-read	Besedilo - branje	t
00030000-5697-953b-5210-f75037eba3ad	Besedilo-write	Besedilo - spreminjanje	t
00030000-5697-953b-11f2-fd5573ee9351	Dodatek-read	Dodatek - branje	t
00030000-5697-953b-461d-2623fb6087b0	Dodatek-write	Dodatek - spreminjanje	t
00030000-5697-953b-acbf-1fd511155dce	Dogodek-read	Dogodek - branje	t
00030000-5697-953b-18cf-a1f3513a3fc7	Dogodek-write	Dogodek - spreminjanje	t
00030000-5697-953b-3fac-1c25ce9ac2b1	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5697-953b-2fba-fd5c1380153f	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5697-953b-2a34-207bbbec6519	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5697-953b-731e-3d00853ee4c9	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5697-953b-9b6a-780d0fa0f265	DogodekTrait-read	DogodekTrait - branje	t
00030000-5697-953b-eaad-3d42c8aa3a0a	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5697-953b-98f5-bfe2bf965a29	DrugiVir-read	DrugiVir - branje	t
00030000-5697-953b-8f42-5b1204069a1c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5697-953b-28f9-0368be76d0eb	Drzava-read	Drzava - branje	t
00030000-5697-953b-6f26-58faaf9eda15	Drzava-write	Drzava - spreminjanje	t
00030000-5697-953b-cd1f-c33fa0819e60	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5697-953b-1225-e89fa8f23360	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5697-953b-0ae1-95a26089ff54	Funkcija-read	Funkcija - branje	t
00030000-5697-953b-d81a-46bbed08d667	Funkcija-write	Funkcija - spreminjanje	t
00030000-5697-953b-ce50-d412c25894f1	Gostovanje-read	Gostovanje - branje	t
00030000-5697-953b-afd8-413c9c370faf	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5697-953b-9d57-cd07f5991baf	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5697-953b-e35b-b571f06a48ae	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5697-953b-ee0d-6392cc4cb5dd	Kupec-read	Kupec - branje	t
00030000-5697-953b-f4f4-615ac60d4571	Kupec-write	Kupec - spreminjanje	t
00030000-5697-953b-f545-940cb04df5f8	NacinPlacina-read	NacinPlacina - branje	t
00030000-5697-953b-0ab1-b6a638d8499e	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5697-953b-ce46-c5f2b9dab3b7	Option-read	Option - branje	t
00030000-5697-953b-d55c-6e8665e5b5f6	Option-write	Option - spreminjanje	t
00030000-5697-953b-b86f-18d7df44b713	OptionValue-read	OptionValue - branje	t
00030000-5697-953b-f36e-85d9e47c1874	OptionValue-write	OptionValue - spreminjanje	t
00030000-5697-953b-eacc-16e2c5dfcf7b	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5697-953b-d33e-b4005ead7a23	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5697-953b-faf8-06c5a977dd1c	Oseba-read	Oseba - branje	t
00030000-5697-953b-f03b-b0ecfab3bac5	Oseba-write	Oseba - spreminjanje	t
00030000-5697-953b-e516-1f8d1965abcf	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5697-953b-7a36-85ca94a51092	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5697-953b-9b68-083dac193ac0	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5697-953b-6a52-9f82a35824ca	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5697-953b-429d-954ee3add2a4	Pogodba-read	Pogodba - branje	t
00030000-5697-953b-25ca-f4bf637e01c7	Pogodba-write	Pogodba - spreminjanje	t
00030000-5697-953b-0570-fb5b654acbd8	Popa-read	Popa - branje	t
00030000-5697-953b-40c6-430e5cbcb437	Popa-write	Popa - spreminjanje	t
00030000-5697-953b-66f6-d946546f9906	Posta-read	Posta - branje	t
00030000-5697-953b-fde3-0423155c60a6	Posta-write	Posta - spreminjanje	t
00030000-5697-953b-c793-00bc3deba03b	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5697-953b-c636-1e0b12ad594a	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5697-953b-c959-9245bc5da9ad	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5697-953b-0544-39d37c8f7e5f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5697-953b-b4f3-139389f35035	PostniNaslov-read	PostniNaslov - branje	t
00030000-5697-953b-ba09-783d4cdc7c2a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5697-953b-e69c-fee520b678fa	Praznik-read	Praznik - branje	t
00030000-5697-953b-45df-1786a48ce78f	Praznik-write	Praznik - spreminjanje	t
00030000-5697-953b-c32d-74e115479030	Predstava-read	Predstava - branje	t
00030000-5697-953b-ce90-96f73da1288c	Predstava-write	Predstava - spreminjanje	t
00030000-5697-953b-848a-740b339ed3a0	Prisotnost-read	Prisotnost - branje	t
00030000-5697-953b-4874-7b8eb5071fd6	Prisotnost-write	Prisotnost - spreminjanje	t
00030000-5697-953b-e7f8-9574577a5777	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5697-953b-0bdb-3de26a60ac4e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5697-953b-3f3e-d2b5d0a19e58	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5697-953b-0d94-db57b2d600f8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5697-953b-a858-eacb0b0b9269	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5697-953b-e313-6bef681b090b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5697-953b-c8c5-ec8e949ff1f9	ProgramDela-read	ProgramDela - branje	t
00030000-5697-953b-e8b6-8b965243e4d9	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5697-953b-2f76-939b7bf97aad	ProgramFestival-read	ProgramFestival - branje	t
00030000-5697-953b-9c63-e1d94dcd321b	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5697-953b-c0b9-9299c9be72f8	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5697-953b-017d-88ef87611f66	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5697-953b-0cfd-62be6d2cdf9d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5697-953b-0f0a-0b5b6d32b5bd	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5697-953b-136f-62ab2d975188	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5697-953b-5527-aca2f131c76b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5697-953b-0c03-250d743be7e8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5697-953b-5f27-2e272b313b9b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5697-953b-073f-7421c998e9fa	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5697-953b-3cd2-e3960a70866e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5697-953b-5d9a-a3e9a4c030f2	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5697-953b-e1f4-aa1607d08052	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5697-953b-11ea-bbdd09df6a62	ProgramRazno-read	ProgramRazno - branje	t
00030000-5697-953b-a387-a862801be36a	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5697-953b-68d8-0a2486f4ca4b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5697-953b-be48-d96d6fb90a0d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5697-953b-6942-4eeca7f60bfd	Prostor-read	Prostor - branje	t
00030000-5697-953b-6e63-e918dacaaaf9	Prostor-write	Prostor - spreminjanje	t
00030000-5697-953b-d91a-c05f75a66ac0	Racun-read	Racun - branje	t
00030000-5697-953b-c586-6c4a3c9b2a3a	Racun-write	Racun - spreminjanje	t
00030000-5697-953b-d20b-d1721d2c166d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5697-953b-e31e-df13ae44a3f1	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5697-953b-5740-4e0006c9e3ed	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5697-953b-589f-51378dfdb31c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5697-953b-a8ac-63cb086b98af	Rekvizit-read	Rekvizit - branje	t
00030000-5697-953b-1d53-c08c668dcaaa	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5697-953b-ea06-e5a03dde8b96	Revizija-read	Revizija - branje	t
00030000-5697-953b-4014-fad8e1644f00	Revizija-write	Revizija - spreminjanje	t
00030000-5697-953b-a7e7-91e36f5a21a9	Rezervacija-read	Rezervacija - branje	t
00030000-5697-953b-6f1e-593c0f98aa53	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5697-953b-c5d5-e8b3b55c61e5	SedezniRed-read	SedezniRed - branje	t
00030000-5697-953b-2259-5fdf92119c7a	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5697-953b-3b15-f5f36a1d945f	Sedez-read	Sedez - branje	t
00030000-5697-953b-2020-eead500b5dbc	Sedez-write	Sedez - spreminjanje	t
00030000-5697-953b-7b69-7f42fd9cfaf2	Sezona-read	Sezona - branje	t
00030000-5697-953b-de7b-4b9c0344b371	Sezona-write	Sezona - spreminjanje	t
00030000-5697-953b-180e-cc1b3561d382	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5697-953b-f894-768378105c2d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5697-953b-da16-c50c2b705b61	Telefonska-read	Telefonska - branje	t
00030000-5697-953b-f101-d63da1fb8201	Telefonska-write	Telefonska - spreminjanje	t
00030000-5697-953b-11f8-6aea7159bc8e	TerminStoritve-read	TerminStoritve - branje	t
00030000-5697-953b-57e5-48ceedd2e43c	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5697-953b-113a-fac80273b73e	TipDodatka-read	TipDodatka - branje	t
00030000-5697-953b-f2cc-2154fb831ae1	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5697-953b-edd8-62472bb2e031	TipFunkcije-read	TipFunkcije - branje	t
00030000-5697-953b-714d-9c2cf72fc7ed	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5697-953b-8641-d8567f69d3b3	TipPopa-read	TipPopa - branje	t
00030000-5697-953b-c6b8-62b7cc9d6a7f	TipPopa-write	TipPopa - spreminjanje	t
00030000-5697-953b-a1bb-344e8c4c5b5a	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5697-953b-65a0-16c542761099	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5697-953b-14c5-209bba7af99b	TipVaje-read	TipVaje - branje	t
00030000-5697-953b-c041-62448b36697f	TipVaje-write	TipVaje - spreminjanje	t
00030000-5697-953b-fc5a-3c57a0d71c5b	Trr-read	Trr - branje	t
00030000-5697-953b-deef-36d915ea9309	Trr-write	Trr - spreminjanje	t
00030000-5697-953b-b42b-7e5e4ffaba61	Uprizoritev-read	Uprizoritev - branje	t
00030000-5697-953b-b184-ee126af72e71	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5697-953b-a0dd-a6c99cb01c08	Vaja-read	Vaja - branje	t
00030000-5697-953b-d104-6abd8bd3b829	Vaja-write	Vaja - spreminjanje	t
00030000-5697-953b-df1d-7bf8a68f758f	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5697-953b-0462-c447801c95a8	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5697-953b-79fc-0f9046dd3850	VrstaStroska-read	VrstaStroska - branje	t
00030000-5697-953b-974a-c2587e499ff2	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5697-953b-6121-461586de1b25	Zaposlitev-read	Zaposlitev - branje	t
00030000-5697-953b-29c8-619e50526119	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5697-953b-cb6f-eaf238b2b921	Zasedenost-read	Zasedenost - branje	t
00030000-5697-953b-6283-4344375758a9	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5697-953b-3c01-22ace78deba6	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5697-953b-0772-7cd583cf68e0	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5697-953b-41dd-03ddc72011c1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5697-953b-623d-027c6c642547	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5697-953b-c15a-262857514add	Job-read	Branje opravil - samo zase - branje	t
00030000-5697-953b-2b01-594483a5d640	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5697-953b-778c-1308158a2617	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5697-953b-dca1-0ae3b933f454	Report-read	Report - branje	t
00030000-5697-953b-b592-dc2a3493e4f5	Report-write	Report - spreminjanje	t
00030000-5697-953b-c6e0-0ed9e5cd66d6	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5697-953b-db62-f09a08184c72	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5697-953b-1e5a-6e0fb26bb6c7	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5697-953b-8699-a1e8245fdc5a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5697-953b-35fb-a7ee07bb579c	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5697-953b-f1c0-280cc62370c3	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5697-953b-9ac5-55b094f71c1b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5697-953b-6079-120ca488b02e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-953b-23ca-cef424d31012	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-953b-ec17-4596f4acfdf1	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-953b-359f-692c3f435636	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-953b-a113-3cd525775391	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5697-953b-2baa-d3f7f8fb9bd5	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5697-953b-13bd-7318f87bbe85	Datoteka-write	Datoteka - spreminjanje	t
00030000-5697-953b-a129-224edc39857a	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3136 (class 0 OID 36291429)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5697-953b-bb84-09f0646dcbc3	00030000-5697-953b-a94c-c907c77602aa
00020000-5697-953b-bb84-09f0646dcbc3	00030000-5697-953b-ea84-cc6a7cfcf2e0
00020000-5697-953b-8ffc-67bd73818d48	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-91c3-9f0ce5868d89
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-5210-f75037eba3ad
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-3222-07eac3c10ee9	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-ceb1-9814804314c6	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953b-ceb1-9814804314c6	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-ceb1-9814804314c6	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-ceb1-9814804314c6	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-ceb1-9814804314c6	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-ceb1-9814804314c6	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-ae74-3d748c3e8617	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-ae74-3d748c3e8617	00030000-5697-953b-29c8-619e50526119
00020000-5697-953b-ae74-3d748c3e8617	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-ae74-3d748c3e8617	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953b-ae74-3d748c3e8617	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-ae74-3d748c3e8617	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-ae74-3d748c3e8617	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-73cb-20fae959f72e	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-73cb-20fae959f72e	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-73cb-20fae959f72e	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-51a0-c166dc5c175e	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-51a0-c166dc5c175e	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-51a0-c166dc5c175e	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-51a0-c166dc5c175e	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-51a0-c166dc5c175e	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-51a0-c166dc5c175e	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-51a0-c166dc5c175e	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-51a0-c166dc5c175e	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-1b1a-fd922d3b7a1c	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-1b1a-fd922d3b7a1c	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-1b1a-fd922d3b7a1c	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-1b1a-fd922d3b7a1c	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-deef-36d915ea9309
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-ba09-783d4cdc7c2a
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-f101-d63da1fb8201
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-32ba-b17254f31035	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-5a66-00e05d830dcd	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-5a66-00e05d830dcd	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-5a66-00e05d830dcd	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-5a66-00e05d830dcd	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-5a66-00e05d830dcd	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-5a66-00e05d830dcd	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-5a66-00e05d830dcd	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-f101-d63da1fb8201
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-ba09-783d4cdc7c2a
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-deef-36d915ea9309
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-40c6-430e5cbcb437
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-e35b-b571f06a48ae
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-e313-6bef681b090b
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-4dbd-9966b9857c0e	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-fb20-dff5bcc0e462	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-adf3-7c368197f327	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-adf3-7c368197f327	00030000-5697-953b-c6b8-62b7cc9d6a7f
00020000-5697-953b-b91d-e272be50cbdc	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-5d7b-3effbdf70e3b	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953b-5d7b-3effbdf70e3b	00030000-5697-953b-fde3-0423155c60a6
00020000-5697-953b-a2f4-978b6da312cf	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953b-906a-37d82b01dbec	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-906a-37d82b01dbec	00030000-5697-953b-6f26-58faaf9eda15
00020000-5697-953b-2b1c-e2922a8ec34d	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-2e6a-39a168397053	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953b-2e6a-39a168397053	00030000-5697-953b-623d-027c6c642547
00020000-5697-953b-6839-76feeb3a5dcd	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953b-35ea-70fcc73ef327	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953b-35ea-70fcc73ef327	00030000-5697-953b-0772-7cd583cf68e0
00020000-5697-953b-865c-a0c24007cb66	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953b-8994-0fceb7842b94	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953b-8994-0fceb7842b94	00030000-5697-953b-bed7-f2f8e6ace93d
00020000-5697-953b-0f63-31967404d7ff	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953b-15ae-a7d5e14dd378	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953b-15ae-a7d5e14dd378	00030000-5697-953b-6e63-e918dacaaaf9
00020000-5697-953b-15ae-a7d5e14dd378	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-15ae-a7d5e14dd378	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-15ae-a7d5e14dd378	00030000-5697-953b-ba09-783d4cdc7c2a
00020000-5697-953b-15ae-a7d5e14dd378	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-761d-98eec401f2ea	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953b-761d-98eec401f2ea	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-761d-98eec401f2ea	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-631b-b7564e9f911e	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-631b-b7564e9f911e	00030000-5697-953b-974a-c2587e499ff2
00020000-5697-953b-4716-40611764aff3	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-d33e-b4005ead7a23
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-2551-2bcb4fd40b0b	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-a0b9-5f6c30bb0dcc	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-a0b9-5f6c30bb0dcc	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-a0b9-5f6c30bb0dcc	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-a0b9-5f6c30bb0dcc	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-a0b9-5f6c30bb0dcc	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-4cac-7c56037a936f	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953b-4cac-7c56037a936f	00030000-5697-953b-c041-62448b36697f
00020000-5697-953b-641f-7974d8599a26	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-ab75-6edfefc135a2
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-a5d6-7b83ea6ddea8
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-c8c5-ec8e949ff1f9
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-e8b6-8b965243e4d9
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-2f76-939b7bf97aad
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-9c63-e1d94dcd321b
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-c0b9-9299c9be72f8
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-017d-88ef87611f66
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-0cfd-62be6d2cdf9d
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-0f0a-0b5b6d32b5bd
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-136f-62ab2d975188
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-5527-aca2f131c76b
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-0c03-250d743be7e8
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-5f27-2e272b313b9b
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-073f-7421c998e9fa
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-3cd2-e3960a70866e
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-5d9a-a3e9a4c030f2
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-e1f4-aa1607d08052
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-11ea-bbdd09df6a62
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-a387-a862801be36a
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-68d8-0a2486f4ca4b
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-be48-d96d6fb90a0d
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-0d94-db57b2d600f8
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-8f42-5b1204069a1c
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-c636-1e0b12ad594a
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-2b01-594483a5d640
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-98f5-bfe2bf965a29
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-3f3e-d2b5d0a19e58
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-c793-00bc3deba03b
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-c15a-262857514add
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-50ca-ded42b166484	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-c8c5-ec8e949ff1f9
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-2f76-939b7bf97aad
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-c0b9-9299c9be72f8
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-0cfd-62be6d2cdf9d
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-136f-62ab2d975188
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-0c03-250d743be7e8
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-073f-7421c998e9fa
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-5d9a-a3e9a4c030f2
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-11ea-bbdd09df6a62
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-68d8-0a2486f4ca4b
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-3f3e-d2b5d0a19e58
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-98f5-bfe2bf965a29
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-c793-00bc3deba03b
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-c15a-262857514add
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-b121-a2c58f114cc6	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-b184-ee126af72e71
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-0c21-a6b72de22595
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-1996-dedf7ccc04f7	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-403b-32c80120cf42	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-149a-a91a47990283	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-149a-a91a47990283	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953b-149a-a91a47990283	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-149a-a91a47990283	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953b-149a-a91a47990283	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-149a-a91a47990283	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-149a-a91a47990283	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-149a-a91a47990283	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-25ca-f4bf637e01c7
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-f894-768378105c2d
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-e6ed-b654f0a90144	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-3708-b7066b5e83d0	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-67d2-711b3f701619	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-67d2-711b3f701619	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-67d2-711b3f701619	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-67d2-711b3f701619	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953b-67d2-711b3f701619	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-67d2-711b3f701619	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-67d2-711b3f701619	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-3f22-05c19e2d82c3	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-3f22-05c19e2d82c3	00030000-5697-953b-f894-768378105c2d
00020000-5697-953b-3f22-05c19e2d82c3	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-3f22-05c19e2d82c3	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-1b7d-a54c67125a75	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-1b7d-a54c67125a75	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-91c3-9f0ce5868d89
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-5210-f75037eba3ad
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-98f5-bfe2bf965a29
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-8f42-5b1204069a1c
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-0c21-a6b72de22595
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-c15a-262857514add
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-2b01-594483a5d640
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-25ca-f4bf637e01c7
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-c793-00bc3deba03b
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-c636-1e0b12ad594a
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-3f3e-d2b5d0a19e58
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-0d94-db57b2d600f8
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-ab75-6edfefc135a2
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-c8c5-ec8e949ff1f9
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-a5d6-7b83ea6ddea8
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-e8b6-8b965243e4d9
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-2f76-939b7bf97aad
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-9c63-e1d94dcd321b
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-c0b9-9299c9be72f8
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-017d-88ef87611f66
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-0cfd-62be6d2cdf9d
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-0f0a-0b5b6d32b5bd
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-136f-62ab2d975188
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-5527-aca2f131c76b
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-0c03-250d743be7e8
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-5f27-2e272b313b9b
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-073f-7421c998e9fa
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-3cd2-e3960a70866e
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-5d9a-a3e9a4c030f2
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-e1f4-aa1607d08052
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-11ea-bbdd09df6a62
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-a387-a862801be36a
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-68d8-0a2486f4ca4b
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-be48-d96d6fb90a0d
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-f894-768378105c2d
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-b184-ee126af72e71
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953b-0127-f5fcd2bdba0f	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-91c3-9f0ce5868d89
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-5210-f75037eba3ad
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953b-ca81-8a2369d55206	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-91c3-9f0ce5868d89
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-5210-f75037eba3ad
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-0c21-a6b72de22595
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-b184-ee126af72e71
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953b-692c-696c951e2255	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-91c3-9f0ce5868d89
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-5210-f75037eba3ad
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-98f5-bfe2bf965a29
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-8f42-5b1204069a1c
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-0c21-a6b72de22595
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-c15a-262857514add
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-2b01-594483a5d640
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-e35b-b571f06a48ae
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-25ca-f4bf637e01c7
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-40c6-430e5cbcb437
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-c793-00bc3deba03b
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-c636-1e0b12ad594a
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-ba09-783d4cdc7c2a
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-3f3e-d2b5d0a19e58
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-0d94-db57b2d600f8
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-e313-6bef681b090b
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-ab75-6edfefc135a2
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-c8c5-ec8e949ff1f9
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-a5d6-7b83ea6ddea8
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-e8b6-8b965243e4d9
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-2f76-939b7bf97aad
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-9c63-e1d94dcd321b
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-c0b9-9299c9be72f8
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-017d-88ef87611f66
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-0cfd-62be6d2cdf9d
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-0f0a-0b5b6d32b5bd
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-136f-62ab2d975188
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-5527-aca2f131c76b
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-0c03-250d743be7e8
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-5f27-2e272b313b9b
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-073f-7421c998e9fa
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-3cd2-e3960a70866e
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-5d9a-a3e9a4c030f2
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-e1f4-aa1607d08052
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-11ea-bbdd09df6a62
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-a387-a862801be36a
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-68d8-0a2486f4ca4b
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-be48-d96d6fb90a0d
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-f894-768378105c2d
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-f101-d63da1fb8201
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-deef-36d915ea9309
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-b184-ee126af72e71
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-29c8-619e50526119
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953b-f508-ee04fc13934d	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-91c3-9f0ce5868d89
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-5210-f75037eba3ad
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-0c21-a6b72de22595
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-e35b-b571f06a48ae
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-40c6-430e5cbcb437
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-ba09-783d4cdc7c2a
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-e313-6bef681b090b
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-f101-d63da1fb8201
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-deef-36d915ea9309
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-b184-ee126af72e71
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-29c8-619e50526119
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953b-eb38-048c6ed3f55f	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-a129-224edc39857a
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-359f-692c3f435636
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-6121-461586de1b25
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953b-fa3e-b9f5d00bf27b	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-a129-224edc39857a
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-98f5-bfe2bf965a29
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-8f42-5b1204069a1c
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-c15a-262857514add
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-2b01-594483a5d640
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-e35b-b571f06a48ae
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-d33e-b4005ead7a23
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-25ca-f4bf637e01c7
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-40c6-430e5cbcb437
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-c793-00bc3deba03b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-c636-1e0b12ad594a
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-ba09-783d4cdc7c2a
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-3f3e-d2b5d0a19e58
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-0d94-db57b2d600f8
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-e313-6bef681b090b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-ab75-6edfefc135a2
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-c8c5-ec8e949ff1f9
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-a5d6-7b83ea6ddea8
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-e8b6-8b965243e4d9
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-2f76-939b7bf97aad
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-9c63-e1d94dcd321b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-c0b9-9299c9be72f8
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-017d-88ef87611f66
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-0cfd-62be6d2cdf9d
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-0f0a-0b5b6d32b5bd
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-136f-62ab2d975188
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-5527-aca2f131c76b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-0c03-250d743be7e8
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-5f27-2e272b313b9b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-073f-7421c998e9fa
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-3cd2-e3960a70866e
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-5d9a-a3e9a4c030f2
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-e1f4-aa1607d08052
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-11ea-bbdd09df6a62
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-a387-a862801be36a
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-68d8-0a2486f4ca4b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-be48-d96d6fb90a0d
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-f894-768378105c2d
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-f101-d63da1fb8201
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-deef-36d915ea9309
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-974a-c2587e499ff2
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-359f-692c3f435636
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-6121-461586de1b25
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-29c8-619e50526119
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953c-df32-c13b333544e9	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ea84-cc6a7cfcf2e0
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a94c-c907c77602aa
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e380-f0b7901c9472
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-bed7-f2f8e6ace93d
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a278-119a98a577d0
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c957-12a2cbd08cb0
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-662e-2ceba6c84691
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0629-5bcb6a22b213
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-462c-c27adfa8ab58
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-91c3-9f0ce5868d89
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0454-aaa3f0c13ad5
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-5210-f75037eba3ad
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a129-224edc39857a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-acbf-1fd511155dce
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-4151-000cf9306c29
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-3fac-1c25ce9ac2b1
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-2fba-fd5c1380153f
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-2a34-207bbbec6519
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-731e-3d00853ee4c9
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-9b6a-780d0fa0f265
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-eaad-3d42c8aa3a0a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-18cf-a1f3513a3fc7
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-98f5-bfe2bf965a29
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-8f42-5b1204069a1c
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-28f9-0368be76d0eb
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-6f26-58faaf9eda15
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-cd1f-c33fa0819e60
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-1225-e89fa8f23360
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0c21-a6b72de22595
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ce50-d412c25894f1
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-afd8-413c9c370faf
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-778c-1308158a2617
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c15a-262857514add
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-2b01-594483a5d640
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-9d57-cd07f5991baf
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e35b-b571f06a48ae
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ee0d-6392cc4cb5dd
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-f4f4-615ac60d4571
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-9ac5-55b094f71c1b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-f1c0-280cc62370c3
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-db62-f09a08184c72
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-1e5a-6e0fb26bb6c7
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-8699-a1e8245fdc5a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-35fb-a7ee07bb579c
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-f545-940cb04df5f8
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0ab1-b6a638d8499e
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ce46-c5f2b9dab3b7
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-b86f-18d7df44b713
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-f36e-85d9e47c1874
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-d55c-6e8665e5b5f6
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-eacc-16e2c5dfcf7b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-d33e-b4005ead7a23
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e516-1f8d1965abcf
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-7a36-85ca94a51092
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-9b68-083dac193ac0
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-6a52-9f82a35824ca
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-25ca-f4bf637e01c7
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-40c6-430e5cbcb437
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-66f6-d946546f9906
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c793-00bc3deba03b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c636-1e0b12ad594a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c959-9245bc5da9ad
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0544-39d37c8f7e5f
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-fde3-0423155c60a6
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ba09-783d4cdc7c2a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e69c-fee520b678fa
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-45df-1786a48ce78f
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c32d-74e115479030
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ce90-96f73da1288c
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e7f8-9574577a5777
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0bdb-3de26a60ac4e
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-3f3e-d2b5d0a19e58
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0d94-db57b2d600f8
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a858-eacb0b0b9269
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e313-6bef681b090b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ab75-6edfefc135a2
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c8c5-ec8e949ff1f9
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a5d6-7b83ea6ddea8
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e8b6-8b965243e4d9
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-2f76-939b7bf97aad
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-9c63-e1d94dcd321b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c0b9-9299c9be72f8
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-017d-88ef87611f66
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0cfd-62be6d2cdf9d
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0f0a-0b5b6d32b5bd
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-136f-62ab2d975188
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-5527-aca2f131c76b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0c03-250d743be7e8
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-5f27-2e272b313b9b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-073f-7421c998e9fa
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-3cd2-e3960a70866e
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-5d9a-a3e9a4c030f2
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e1f4-aa1607d08052
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-11ea-bbdd09df6a62
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a387-a862801be36a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-68d8-0a2486f4ca4b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-be48-d96d6fb90a0d
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-6942-4eeca7f60bfd
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-6e63-e918dacaaaf9
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-d91a-c05f75a66ac0
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c586-6c4a3c9b2a3a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-d20b-d1721d2c166d
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-e31e-df13ae44a3f1
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-5740-4e0006c9e3ed
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-589f-51378dfdb31c
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a8ac-63cb086b98af
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-1d53-c08c668dcaaa
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-dca1-0ae3b933f454
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-b592-dc2a3493e4f5
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ea06-e5a03dde8b96
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-4014-fad8e1644f00
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a7e7-91e36f5a21a9
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-6f1e-593c0f98aa53
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c5d5-e8b3b55c61e5
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-2259-5fdf92119c7a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-3b15-f5f36a1d945f
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-2020-eead500b5dbc
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-7b69-7f42fd9cfaf2
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-de7b-4b9c0344b371
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c6e0-0ed9e5cd66d6
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-f894-768378105c2d
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-f101-d63da1fb8201
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-11f8-6aea7159bc8e
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ff36-0688cc0d0b3e
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-57e5-48ceedd2e43c
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-edd8-62472bb2e031
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-714d-9c2cf72fc7ed
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-8641-d8567f69d3b3
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c6b8-62b7cc9d6a7f
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a1bb-344e8c4c5b5a
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-65a0-16c542761099
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-14c5-209bba7af99b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-c041-62448b36697f
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-deef-36d915ea9309
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-b184-ee126af72e71
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a0dd-a6c99cb01c08
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-d104-6abd8bd3b829
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-df1d-7bf8a68f758f
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0462-c447801c95a8
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-79fc-0f9046dd3850
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-974a-c2587e499ff2
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-2baa-d3f7f8fb9bd5
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-a113-3cd525775391
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-359f-692c3f435636
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-6121-461586de1b25
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-29c8-619e50526119
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-cb6f-eaf238b2b921
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-6283-4344375758a9
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-3c01-22ace78deba6
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-0772-7cd583cf68e0
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-41dd-03ddc72011c1
00020000-5697-953d-e616-53b42a5aa73d	00030000-5697-953b-623d-027c6c642547
00020000-5697-953d-4a37-0e2d42b0485b	00030000-5697-953b-359f-692c3f435636
00020000-5697-953d-797c-783e8576cf19	00030000-5697-953b-ec17-4596f4acfdf1
00020000-5697-953d-7f6a-d22fcf5e6d36	00030000-5697-953b-b184-ee126af72e71
00020000-5697-953d-66fa-c697aa798d24	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953d-d729-9ffbd6247f86	00030000-5697-953b-1e5a-6e0fb26bb6c7
00020000-5697-953d-d321-23427b51a799	00030000-5697-953b-8699-a1e8245fdc5a
00020000-5697-953d-6b0b-0754ea14f51c	00030000-5697-953b-35fb-a7ee07bb579c
00020000-5697-953d-37a0-0b6ec85e4394	00030000-5697-953b-db62-f09a08184c72
00020000-5697-953d-da46-5a909e7f97ac	00030000-5697-953b-9ac5-55b094f71c1b
00020000-5697-953d-8866-48c8fa6a9c22	00030000-5697-953b-f1c0-280cc62370c3
00020000-5697-953d-c6aa-fdfc5d7ad129	00030000-5697-953b-23ca-cef424d31012
00020000-5697-953d-2650-e946df546500	00030000-5697-953b-6079-120ca488b02e
00020000-5697-953d-0a8c-e0bb5ee990cb	00030000-5697-953b-faf8-06c5a977dd1c
00020000-5697-953d-aed5-2c2558128e96	00030000-5697-953b-f03b-b0ecfab3bac5
00020000-5697-953d-f0a1-5dbb7c1f5eec	00030000-5697-953b-e8a3-9975600906cc
00020000-5697-953d-ac12-eae6fd6bf198	00030000-5697-953b-856d-48bcb4a59379
00020000-5697-953d-33ad-a6e01933e81b	00030000-5697-953b-13bd-7318f87bbe85
00020000-5697-953d-efa2-29ea24e3e41e	00030000-5697-953b-a129-224edc39857a
00020000-5697-953d-a517-95ff19cda91f	00030000-5697-953b-0570-fb5b654acbd8
00020000-5697-953d-a517-95ff19cda91f	00030000-5697-953b-40c6-430e5cbcb437
00020000-5697-953d-a517-95ff19cda91f	00030000-5697-953b-b42b-7e5e4ffaba61
00020000-5697-953d-a27d-9ef11f992dba	00030000-5697-953b-fc5a-3c57a0d71c5b
00020000-5697-953d-595f-bfa83e53831d	00030000-5697-953b-deef-36d915ea9309
00020000-5697-953d-7aac-f1454c1cbffe	00030000-5697-953b-c6e0-0ed9e5cd66d6
00020000-5697-953d-6ba2-5afba42997b7	00030000-5697-953b-da16-c50c2b705b61
00020000-5697-953d-789a-660b8f66cc4d	00030000-5697-953b-f101-d63da1fb8201
00020000-5697-953d-4806-e0f652a9a142	00030000-5697-953b-b4f3-139389f35035
00020000-5697-953d-02ee-ac947af21c8f	00030000-5697-953b-ba09-783d4cdc7c2a
00020000-5697-953d-7e5f-47057528b3a3	00030000-5697-953b-6121-461586de1b25
00020000-5697-953d-999e-bf836451a98c	00030000-5697-953b-29c8-619e50526119
00020000-5697-953d-0345-79d8e8a2c767	00030000-5697-953b-429d-954ee3add2a4
00020000-5697-953d-4614-ac0142206be9	00030000-5697-953b-25ca-f4bf637e01c7
00020000-5697-953d-6cbf-b29d20df511f	00030000-5697-953b-180e-cc1b3561d382
00020000-5697-953d-6a26-58937992ff9e	00030000-5697-953b-f894-768378105c2d
00020000-5697-953d-b9b0-df1d6a49cd2a	00030000-5697-953b-ff5e-fa932176d3ed
00020000-5697-953d-34bf-b2b17b0d8d29	00030000-5697-953b-9429-42b7d9a31bb4
00020000-5697-953d-d50c-23243ba31798	00030000-5697-953b-c78d-85c9a116c5f2
00020000-5697-953d-7d9c-4219b7bbcfb0	00030000-5697-953b-0ae1-95a26089ff54
00020000-5697-953d-c5d2-2365b9d5e241	00030000-5697-953b-d81a-46bbed08d667
00020000-5697-953d-4279-e2ed7918e8a2	00030000-5697-953b-0c21-a6b72de22595
\.


--
-- TOC entry 3176 (class 0 OID 36291836)
-- Dependencies: 220
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 36291870)
-- Dependencies: 224
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 36292003)
-- Dependencies: 236
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5697-953e-62e8-e85147f0bc53	00090000-5697-953e-5fa4-30979214b8cb	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5697-953e-970d-791a304ec7bf	00090000-5697-953e-a46a-87d92ddc53ed	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5697-953e-e15e-76c5c9172dc9	00090000-5697-953e-a9a5-587dfc861850	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5697-953e-0b32-a6defa1580e9	00090000-5697-953e-e550-c00c54677d4d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3144 (class 0 OID 36291511)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5697-953e-6168-536df66b025e	\N	00040000-5697-953b-7157-48936302ac30	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-953e-9e02-ac162a213de3	\N	00040000-5697-953b-7157-48936302ac30	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5697-953e-ed76-6c21918906a3	\N	00040000-5697-953b-7157-48936302ac30	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-953e-a4d1-b5c1d2f67bc3	\N	00040000-5697-953b-7157-48936302ac30	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-953e-49e5-d4d816ff0319	\N	00040000-5697-953b-7157-48936302ac30	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-953e-d503-05c7c4a2449e	\N	00040000-5697-953b-788e-e34af4ed770d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-953e-b09b-fa54268fdf6a	\N	00040000-5697-953b-250b-8f0c17b3a671	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-953e-d15f-f568a5354caf	\N	00040000-5697-953b-ccce-b9656dda6dc2	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-953e-475e-879994d142af	\N	00040000-5697-953b-cef8-1f5256f9f3cf	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-9540-60cc-ffb9526ded09	\N	00040000-5697-953b-7157-48936302ac30	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3147 (class 0 OID 36291556)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5697-953a-b722-519708fdab1e	8341	Adlešiči
00050000-5697-953a-74aa-37fd60f528df	5270	Ajdovščina
00050000-5697-953a-e5ec-cf960fe504c8	6280	Ankaran/Ancarano
00050000-5697-953a-78cb-9407b9a09498	9253	Apače
00050000-5697-953a-3725-18ad7908617c	8253	Artiče
00050000-5697-953a-9b30-60621147292c	4275	Begunje na Gorenjskem
00050000-5697-953a-ab75-b5e7c0f19d7d	1382	Begunje pri Cerknici
00050000-5697-953a-a7aa-f4e17d414e42	9231	Beltinci
00050000-5697-953a-7db8-7e3377c76a38	2234	Benedikt
00050000-5697-953a-9c20-aec4e16ebab1	2345	Bistrica ob Dravi
00050000-5697-953a-3ce7-5cc799601ff9	3256	Bistrica ob Sotli
00050000-5697-953a-31ba-e3a5639eb978	8259	Bizeljsko
00050000-5697-953a-feb0-f4089939dbcb	1223	Blagovica
00050000-5697-953a-9e72-9e36ec43dead	8283	Blanca
00050000-5697-953a-1f6d-0053c531856a	4260	Bled
00050000-5697-953a-6e3c-b248edd56b42	4273	Blejska Dobrava
00050000-5697-953a-5132-8544d32c0a26	9265	Bodonci
00050000-5697-953a-460c-61f14f79b991	9222	Bogojina
00050000-5697-953a-d464-c4d2bc557c06	4263	Bohinjska Bela
00050000-5697-953a-61cc-68eb0f5853e0	4264	Bohinjska Bistrica
00050000-5697-953a-f430-6533bb1ccc89	4265	Bohinjsko jezero
00050000-5697-953a-262d-452d0dab47f1	1353	Borovnica
00050000-5697-953a-13a7-09a2354ceb2c	8294	Boštanj
00050000-5697-953a-0399-58a1fa314286	5230	Bovec
00050000-5697-953a-e8e7-43df6ee849f3	5295	Branik
00050000-5697-953a-6dd8-b77b1452e076	3314	Braslovče
00050000-5697-953a-0e97-34f3f51b2c67	5223	Breginj
00050000-5697-953a-bfdd-05d3eae9aaa4	8280	Brestanica
00050000-5697-953a-3892-c6402b47bd15	2354	Bresternica
00050000-5697-953a-0c31-8b59a2e735e3	4243	Brezje
00050000-5697-953a-b80e-30ea25743b26	1351	Brezovica pri Ljubljani
00050000-5697-953a-f95c-d0e9c867fe8a	8250	Brežice
00050000-5697-953a-df5c-0c5474b92c1e	4210	Brnik - Aerodrom
00050000-5697-953a-7b7a-4529a498e07b	8321	Brusnice
00050000-5697-953a-fbf8-d0a1a2580d3d	3255	Buče
00050000-5697-953a-e02c-8cab3dc53c3c	8276	Bučka 
00050000-5697-953a-0780-9054c7be17c3	9261	Cankova
00050000-5697-953a-2b71-a0cf037da51b	3000	Celje 
00050000-5697-953a-f6a0-aa50a5b85e74	3001	Celje - poštni predali
00050000-5697-953a-7d6a-7a856a36bda7	4207	Cerklje na Gorenjskem
00050000-5697-953a-cfce-c07fad919a10	8263	Cerklje ob Krki
00050000-5697-953a-20a9-766b692c5977	1380	Cerknica
00050000-5697-953a-a4a6-eef9c4c2f778	5282	Cerkno
00050000-5697-953a-abd8-1fb31663b853	2236	Cerkvenjak
00050000-5697-953a-5f35-c54de5e4e479	2215	Ceršak
00050000-5697-953a-0c57-0fcdc622094d	2326	Cirkovce
00050000-5697-953a-379a-184a83b44389	2282	Cirkulane
00050000-5697-953a-4657-907be27b6861	5273	Col
00050000-5697-953a-85da-e85acc4d04eb	8251	Čatež ob Savi
00050000-5697-953a-b7b5-be7e2ed8c07f	1413	Čemšenik
00050000-5697-953a-82e3-73fe4cdf5459	5253	Čepovan
00050000-5697-953a-63f2-0de13a736265	9232	Črenšovci
00050000-5697-953a-f4bc-c949c47d31a8	2393	Črna na Koroškem
00050000-5697-953a-85f4-8d3859d856ff	6275	Črni Kal
00050000-5697-953a-e20d-acdce6181052	5274	Črni Vrh nad Idrijo
00050000-5697-953a-ca7c-d7d1d211fad9	5262	Črniče
00050000-5697-953a-1304-4afee3ea9de5	8340	Črnomelj
00050000-5697-953a-c3e1-1bc181a241a7	6271	Dekani
00050000-5697-953a-de6c-23e2fdd637aa	5210	Deskle
00050000-5697-953a-17b3-86a2c660f289	2253	Destrnik
00050000-5697-953a-492f-9816dfca13df	6215	Divača
00050000-5697-953a-0f1a-9a5f94b4d40c	1233	Dob
00050000-5697-953a-058d-b35e5e8fa8ff	3224	Dobje pri Planini
00050000-5697-953a-399d-d815cec40da8	8257	Dobova
00050000-5697-953a-3071-257df07499c2	1423	Dobovec
00050000-5697-953a-7216-cc4c5d981cad	5263	Dobravlje
00050000-5697-953a-9ff8-9e2511ee9d37	3204	Dobrna
00050000-5697-953a-5074-51501308c301	8211	Dobrnič
00050000-5697-953a-2849-bc4ab8e89556	1356	Dobrova
00050000-5697-953a-07ce-6cfbd671c801	9223	Dobrovnik/Dobronak 
00050000-5697-953a-240a-b395ff1d81b8	5212	Dobrovo v Brdih
00050000-5697-953a-a9d9-38562af40a3c	1431	Dol pri Hrastniku
00050000-5697-953a-7879-6d295da58a93	1262	Dol pri Ljubljani
00050000-5697-953a-fa2f-1558332ff9d3	1273	Dole pri Litiji
00050000-5697-953a-ca38-9519bc622d0f	1331	Dolenja vas
00050000-5697-953a-cc2c-70281a93bde1	8350	Dolenjske Toplice
00050000-5697-953a-3201-e806ed4851b4	1230	Domžale
00050000-5697-953a-1648-9597be953398	2252	Dornava
00050000-5697-953a-59f3-37ed1ec7b034	5294	Dornberk
00050000-5697-953a-6a45-c1bd0107f22d	1319	Draga
00050000-5697-953a-4abd-0fe2b661b48e	8343	Dragatuš
00050000-5697-953a-3ac9-e5bebf21558d	3222	Dramlje
00050000-5697-953a-db21-459bf7c76ad5	2370	Dravograd
00050000-5697-953a-ca6f-0afdcedeff1d	4203	Duplje
00050000-5697-953a-c363-dc2873202e46	6221	Dutovlje
00050000-5697-953a-d714-79dec9b9da0d	8361	Dvor
00050000-5697-953a-32c4-fea1062da25c	2343	Fala
00050000-5697-953a-cab7-60a23c27c1f8	9208	Fokovci
00050000-5697-953a-fdc8-c3f1fe49aeb4	2313	Fram
00050000-5697-953a-2964-c40cbe3a92ce	3213	Frankolovo
00050000-5697-953a-9fc2-d086df60be09	1274	Gabrovka
00050000-5697-953a-f09d-b4eed0e6482d	8254	Globoko
00050000-5697-953a-33c4-604f92a7023a	5275	Godovič
00050000-5697-953a-0c74-4bbb0649f81e	4204	Golnik
00050000-5697-953a-63d0-8a845e982f61	3303	Gomilsko
00050000-5697-953a-e2bd-c67729145066	4224	Gorenja vas
00050000-5697-953a-0ee4-2de3a0ee916f	3263	Gorica pri Slivnici
00050000-5697-953a-72ee-8fbf3994e470	2272	Gorišnica
00050000-5697-953a-041b-42bc90c73a85	9250	Gornja Radgona
00050000-5697-953a-f418-7f8c66963da6	3342	Gornji Grad
00050000-5697-953a-750f-5d7cfd0332c9	4282	Gozd Martuljek
00050000-5697-953a-0608-3ff132e00c24	6272	Gračišče
00050000-5697-953a-3911-ca27279ecd8b	9264	Grad
00050000-5697-953a-9170-ad1bb4197223	8332	Gradac
00050000-5697-953a-762f-17e671a38800	1384	Grahovo
00050000-5697-953a-cca8-8b3a0bc28888	5242	Grahovo ob Bači
00050000-5697-953a-a822-949782c500ad	5251	Grgar
00050000-5697-953a-8fa3-587609738c15	3302	Griže
00050000-5697-953a-6889-75dc1dd6ad12	3231	Grobelno
00050000-5697-953a-dca8-94c7878eafcf	1290	Grosuplje
00050000-5697-953a-779b-86ad7dac803c	2288	Hajdina
00050000-5697-953a-0b45-ef5368d6ac61	8362	Hinje
00050000-5697-953a-cfd1-b50485fa4776	2311	Hoče
00050000-5697-953a-662c-7e12efd8b512	9205	Hodoš/Hodos
00050000-5697-953a-e7d4-26498f6ae78f	1354	Horjul
00050000-5697-953a-c8a5-118a1b1a411c	1372	Hotedršica
00050000-5697-953a-fc30-dfd7ab5cad31	1430	Hrastnik
00050000-5697-953a-556a-e0b6ab425280	6225	Hruševje
00050000-5697-953a-8217-6c191486c62f	4276	Hrušica
00050000-5697-953a-e2f0-bdd6ba53a7bf	5280	Idrija
00050000-5697-953a-b395-17d394acec2a	1292	Ig
00050000-5697-953a-4ab3-1b5d25d8be54	6250	Ilirska Bistrica
00050000-5697-953a-d40a-29ea7d8c0e65	6251	Ilirska Bistrica-Trnovo
00050000-5697-953a-28b9-c1c194b9ece7	1295	Ivančna Gorica
00050000-5697-953a-cbca-aa4bb8df7222	2259	Ivanjkovci
00050000-5697-953a-8995-cf0d5e93546a	1411	Izlake
00050000-5697-953a-5b84-d6bdb2cc6f07	6310	Izola/Isola
00050000-5697-953a-1d84-16b3e501f20a	2222	Jakobski Dol
00050000-5697-953a-dbb9-31029a08c4b1	2221	Jarenina
00050000-5697-953a-85cf-95eac6463ba8	6254	Jelšane
00050000-5697-953a-246c-d3ab6e7f2c7c	4270	Jesenice
00050000-5697-953a-bfc8-74b86dec66f4	8261	Jesenice na Dolenjskem
00050000-5697-953a-05fb-78532759d8e4	3273	Jurklošter
00050000-5697-953a-934b-7e5664cb9e64	2223	Jurovski Dol
00050000-5697-953a-e34c-1e25326f1e94	2256	Juršinci
00050000-5697-953a-85dd-4b92edbdbd3e	5214	Kal nad Kanalom
00050000-5697-953a-288b-50ac9212708d	3233	Kalobje
00050000-5697-953a-a8a9-7022c110bbcb	4246	Kamna Gorica
00050000-5697-953a-3e47-f56e025368ad	2351	Kamnica
00050000-5697-953a-b669-d0cc7b088c15	1241	Kamnik
00050000-5697-953a-dfd9-5c429f8841f4	5213	Kanal
00050000-5697-953a-354a-84b283e30127	8258	Kapele
00050000-5697-953a-b545-316c47e9cf2c	2362	Kapla
00050000-5697-953a-14d8-103d07460dea	2325	Kidričevo
00050000-5697-953a-40ea-af39c4d2cd16	1412	Kisovec
00050000-5697-953a-c0e5-35b0d285a8a0	6253	Knežak
00050000-5697-953a-944d-9df5aebfac42	5222	Kobarid
00050000-5697-953a-c271-3d6347654512	9227	Kobilje
00050000-5697-953a-214c-4ef0848f2f5e	1330	Kočevje
00050000-5697-953a-efe7-c3b9ca246595	1338	Kočevska Reka
00050000-5697-953a-a538-da5c5b0d05cf	2276	Kog
00050000-5697-953a-6f43-f863560538b3	5211	Kojsko
00050000-5697-953a-aa35-9735a46c75d3	6223	Komen
00050000-5697-953a-18c3-28ad1732d578	1218	Komenda
00050000-5697-953a-5822-01b992f4c0d0	6000	Koper/Capodistria 
00050000-5697-953a-383e-85bc14a6a5f1	6001	Koper/Capodistria - poštni predali
00050000-5697-953a-a3e8-8cebe7d8f099	8282	Koprivnica
00050000-5697-953a-00b8-c100099bcdf5	5296	Kostanjevica na Krasu
00050000-5697-953a-4292-bd8b424ad6c1	8311	Kostanjevica na Krki
00050000-5697-953a-9b76-db309c02e8ea	1336	Kostel
00050000-5697-953a-57cf-02b5f972838b	6256	Košana
00050000-5697-953a-899b-b2876c148892	2394	Kotlje
00050000-5697-953a-9003-d320a95b0af9	6240	Kozina
00050000-5697-953a-0c5a-a97a56792ce2	3260	Kozje
00050000-5697-953a-ccd6-83afd5a0006f	4000	Kranj 
00050000-5697-953a-efea-10d14a650ce4	4001	Kranj - poštni predali
00050000-5697-953a-2301-de0bec57591b	4280	Kranjska Gora
00050000-5697-953a-4a02-913e79be0fc5	1281	Kresnice
00050000-5697-953a-fb51-bae72f6e6f07	4294	Križe
00050000-5697-953a-ae2e-35a6ccf4d4f7	9206	Križevci
00050000-5697-953a-9f77-7bc8748ea0dd	9242	Križevci pri Ljutomeru
00050000-5697-953a-2bc1-7b1a554bae4f	1301	Krka
00050000-5697-953a-bf87-ca1483cb2650	8296	Krmelj
00050000-5697-953a-2c4a-2902f75b4935	4245	Kropa
00050000-5697-953a-ee7f-1b821c7a1a82	8262	Krška vas
00050000-5697-953a-1782-951adb8a4c6b	8270	Krško
00050000-5697-953a-56ad-30ae71bcda42	9263	Kuzma
00050000-5697-953a-d0a2-da9863d81f18	2318	Laporje
00050000-5697-953a-a1f9-edb8b9a245a6	3270	Laško
00050000-5697-953a-10a7-dba2d7ff9501	1219	Laze v Tuhinju
00050000-5697-953a-f38f-f8383f652b67	2230	Lenart v Slovenskih goricah
00050000-5697-953a-f938-b9d2dca13a38	9220	Lendava/Lendva
00050000-5697-953a-f27a-4a633c93d1c2	4248	Lesce
00050000-5697-953a-5d0d-c78ff5b0eade	3261	Lesično
00050000-5697-953a-980d-6f8c7ae7264e	8273	Leskovec pri Krškem
00050000-5697-953a-ab57-7574776c355f	2372	Libeliče
00050000-5697-953a-7827-9934ba2a9b5a	2341	Limbuš
00050000-5697-953a-d9c7-677a35ac0177	1270	Litija
00050000-5697-953a-fab5-923e0a27806d	3202	Ljubečna
00050000-5697-953a-1e3d-9071e285e705	1000	Ljubljana 
00050000-5697-953a-3595-10126f72ed70	1001	Ljubljana - poštni predali
00050000-5697-953a-880a-349a833cd4fb	1231	Ljubljana - Črnuče
00050000-5697-953a-16ce-e4fca0b00a95	1261	Ljubljana - Dobrunje
00050000-5697-953a-dc24-9f54408079b9	1260	Ljubljana - Polje
00050000-5697-953a-3c1a-933b512a6b7f	1210	Ljubljana - Šentvid
00050000-5697-953a-5883-a25d4831ae44	1211	Ljubljana - Šmartno
00050000-5697-953a-3b18-e5ce2d094d4b	3333	Ljubno ob Savinji
00050000-5697-953a-aeed-9dff43e5acdd	9240	Ljutomer
00050000-5697-953a-3cc2-dd94f9d46254	3215	Loče
00050000-5697-953a-635f-09701e151c29	5231	Log pod Mangartom
00050000-5697-953a-75b6-df17f65f522a	1358	Log pri Brezovici
00050000-5697-953a-edab-1e57f7c09f9a	1370	Logatec
00050000-5697-953a-d71c-aff8e29cd631	1371	Logatec
00050000-5697-953a-6da4-fe5df93513e2	1434	Loka pri Zidanem Mostu
00050000-5697-953a-4299-e1823a669f03	3223	Loka pri Žusmu
00050000-5697-953a-773c-5b6062a87355	6219	Lokev
00050000-5697-953a-8531-3b671e0c7432	1318	Loški Potok
00050000-5697-953a-0e14-1451ebacc980	2324	Lovrenc na Dravskem polju
00050000-5697-953a-6bc3-b2dc4a0a41e7	2344	Lovrenc na Pohorju
00050000-5697-953a-585f-1569263e2f07	3334	Luče
00050000-5697-953a-2eb1-d5aade649bdd	1225	Lukovica
00050000-5697-953a-5027-8797c65a60f2	9202	Mačkovci
00050000-5697-953a-e048-c9579ad012ef	2322	Majšperk
00050000-5697-953a-9816-7a0cb08da6bb	2321	Makole
00050000-5697-953a-c1cd-bdcc1d1d10d6	9243	Mala Nedelja
00050000-5697-953a-bc60-32444e0f28e8	2229	Malečnik
00050000-5697-953a-6999-bce479ce5a60	6273	Marezige
00050000-5697-953a-10a9-8733bbb5b190	2000	Maribor 
00050000-5697-953a-b7df-e69cf71553b7	2001	Maribor - poštni predali
00050000-5697-953a-af27-9c64329085bd	2206	Marjeta na Dravskem polju
00050000-5697-953a-63f2-f21fad7c0396	2281	Markovci
00050000-5697-953a-29a0-852ec17ab811	9221	Martjanci
00050000-5697-953a-9829-e83ac56b59e7	6242	Materija
00050000-5697-953a-09a3-7e3a0b16c71d	4211	Mavčiče
00050000-5697-953a-ef6f-649ff26d1743	1215	Medvode
00050000-5697-953a-966d-b99d9412ce82	1234	Mengeš
00050000-5697-953a-fd04-9df3a306bc2b	8330	Metlika
00050000-5697-953a-197a-a0d6951fc2e0	2392	Mežica
00050000-5697-953a-890f-d2c910aab933	2204	Miklavž na Dravskem polju
00050000-5697-953a-deb1-591ae02401c1	2275	Miklavž pri Ormožu
00050000-5697-953a-04f5-5e9999776372	5291	Miren
00050000-5697-953a-96d5-f3e593592cbf	8233	Mirna
00050000-5697-953a-fcbf-bd17fb285738	8216	Mirna Peč
00050000-5697-953a-1717-5fba95d358fb	2382	Mislinja
00050000-5697-953a-a097-613cd2c0caff	4281	Mojstrana
00050000-5697-953a-cf5a-e98f56b6e69c	8230	Mokronog
00050000-5697-953a-2210-c8b6e1f1066c	1251	Moravče
00050000-5697-953a-7b1b-cb39a6469c7b	9226	Moravske Toplice
00050000-5697-953a-c367-d18951d4c289	5216	Most na Soči
00050000-5697-953a-824d-be5ce228995d	1221	Motnik
00050000-5697-953a-403c-002503cb04c9	3330	Mozirje
00050000-5697-953a-d411-32ac1a4f08a7	9000	Murska Sobota 
00050000-5697-953a-7a5e-20c85ffeaae8	9001	Murska Sobota - poštni predali
00050000-5697-953a-d278-bf669b8ec9a5	2366	Muta
00050000-5697-953a-cd66-58d7453a436c	4202	Naklo
00050000-5697-953a-5e3b-9402a10adfac	3331	Nazarje
00050000-5697-953a-5092-6a0ac0a8c8cd	1357	Notranje Gorice
00050000-5697-953a-b733-e11889969779	3203	Nova Cerkev
00050000-5697-953a-263d-37b7c6a8dd46	5000	Nova Gorica 
00050000-5697-953a-e4ce-1ee7ec54988a	5001	Nova Gorica - poštni predali
00050000-5697-953a-975b-93cc67f61a17	1385	Nova vas
00050000-5697-953a-4d95-28211f26c721	8000	Novo mesto
00050000-5697-953a-fed8-07c61129772a	8001	Novo mesto - poštni predali
00050000-5697-953a-d1a7-a2720a64252f	6243	Obrov
00050000-5697-953a-523c-0db7088dcf3d	9233	Odranci
00050000-5697-953a-49b6-cd71a3e7a494	2317	Oplotnica
00050000-5697-953a-cd3e-54ad5d03fd26	2312	Orehova vas
00050000-5697-953a-5f45-a812222576ac	2270	Ormož
00050000-5697-953a-d3a9-6e2f30927caa	1316	Ortnek
00050000-5697-953a-62e7-125e0e1571bf	1337	Osilnica
00050000-5697-953a-693d-73b660641757	8222	Otočec
00050000-5697-953a-c868-46dd149d2be6	2361	Ožbalt
00050000-5697-953a-c5a0-97e4dffb89c9	2231	Pernica
00050000-5697-953a-d195-69e5a64f5df0	2211	Pesnica pri Mariboru
00050000-5697-953a-b34c-058ae8702152	9203	Petrovci
00050000-5697-953a-654f-c630fa0269c2	3301	Petrovče
00050000-5697-953a-3194-6c1fa13c06cd	6330	Piran/Pirano
00050000-5697-953a-9b63-ffffe1cfb1fd	8255	Pišece
00050000-5697-953a-6659-8656cf965058	6257	Pivka
00050000-5697-953a-b511-98fd67b2875a	6232	Planina
00050000-5697-953a-d370-c2a1f9475c09	3225	Planina pri Sevnici
00050000-5697-953a-fd8a-4a5e48db47b5	6276	Pobegi
00050000-5697-953a-b771-1402a86c0447	8312	Podbočje
00050000-5697-953a-b594-8cc56303a0b0	5243	Podbrdo
00050000-5697-953a-034b-38e023ff650d	3254	Podčetrtek
00050000-5697-953a-d4f5-df09d3cb18a7	2273	Podgorci
00050000-5697-953a-2935-cf0d763e56ac	6216	Podgorje
00050000-5697-953a-55e7-8a602a44c0a1	2381	Podgorje pri Slovenj Gradcu
00050000-5697-953a-4837-33f585535215	6244	Podgrad
00050000-5697-953a-36a4-5f0460f4b143	1414	Podkum
00050000-5697-953a-34dd-43f4cf2e860f	2286	Podlehnik
00050000-5697-953a-af6e-5087ff1e57cc	5272	Podnanos
00050000-5697-953a-74d9-9439eba6c901	4244	Podnart
00050000-5697-953a-77f0-61a590560356	3241	Podplat
00050000-5697-953a-5725-9adba457c2e4	3257	Podsreda
00050000-5697-953a-0af9-66da179adc27	2363	Podvelka
00050000-5697-953a-d218-9aeb90701c6d	2208	Pohorje
00050000-5697-953a-f95e-ced9faad9ecc	2257	Polenšak
00050000-5697-953a-0b52-fafbd59eb6dd	1355	Polhov Gradec
00050000-5697-953a-7271-ee48923d0acf	4223	Poljane nad Škofjo Loko
00050000-5697-953a-60df-c8021836a9b5	2319	Poljčane
00050000-5697-953a-29a8-e0ef35c3521f	1272	Polšnik
00050000-5697-953a-4972-a4a74738899e	3313	Polzela
00050000-5697-953a-3a0c-9dcc5bb7f1db	3232	Ponikva
00050000-5697-953a-c768-411f747dd909	6320	Portorož/Portorose
00050000-5697-953a-4528-1e09ae4a4b24	6230	Postojna
00050000-5697-953a-874e-701002f77fde	2331	Pragersko
00050000-5697-953a-0421-3c44a0987592	3312	Prebold
00050000-5697-953a-d6c0-62ff47a6b13a	4205	Preddvor
00050000-5697-953a-30f1-dd618eadddca	6255	Prem
00050000-5697-953a-16aa-e8b99e70f3bb	1352	Preserje
00050000-5697-953a-aeb7-2fdc5561a0e5	6258	Prestranek
00050000-5697-953a-d599-1583602ee22f	2391	Prevalje
00050000-5697-953a-c1ba-f220713370c8	3262	Prevorje
00050000-5697-953a-3784-daa23b14cd7c	1276	Primskovo 
00050000-5697-953a-14ee-09ab59bb49fc	3253	Pristava pri Mestinju
00050000-5697-953a-3391-b4e0517f019f	9207	Prosenjakovci/Partosfalva
00050000-5697-953a-9fb1-8272de5b9b74	5297	Prvačina
00050000-5697-953a-81ae-d6bc3fbf954f	2250	Ptuj
00050000-5697-953a-814b-9558fbe2872f	2323	Ptujska Gora
00050000-5697-953a-38a4-2a57d4cef44e	9201	Puconci
00050000-5697-953a-76d0-4a08efd69af8	2327	Rače
00050000-5697-953a-732d-6683a0c7703d	1433	Radeče
00050000-5697-953a-925a-9d1f1ab470a6	9252	Radenci
00050000-5697-953a-3d42-c911662c4bb1	2360	Radlje ob Dravi
00050000-5697-953a-9410-f97868d985c7	1235	Radomlje
00050000-5697-953a-30c6-a99f4ec3b736	4240	Radovljica
00050000-5697-953a-b0ce-9d8b96695417	8274	Raka
00050000-5697-953a-94db-8b04d127cb17	1381	Rakek
00050000-5697-953a-4c81-2fe39b1e1cf7	4283	Rateče - Planica
00050000-5697-953a-166c-824464a7fafc	2390	Ravne na Koroškem
00050000-5697-953a-e506-0cfe41ccae42	9246	Razkrižje
00050000-5697-953a-3193-afbc7f0004d8	3332	Rečica ob Savinji
00050000-5697-953a-05ca-f262453c9900	5292	Renče
00050000-5697-953a-9f4f-7764020b269e	1310	Ribnica
00050000-5697-953a-0c75-d840b04e8287	2364	Ribnica na Pohorju
00050000-5697-953a-2f14-c72914f23d1e	3272	Rimske Toplice
00050000-5697-953a-61d2-55e5499919e5	1314	Rob
00050000-5697-953a-7568-b71176d2d9cb	5215	Ročinj
00050000-5697-953a-dbc7-aab4cd7b6fa4	3250	Rogaška Slatina
00050000-5697-953a-ecd9-7f5ff0b9e878	9262	Rogašovci
00050000-5697-953a-64e0-7018e40669b9	3252	Rogatec
00050000-5697-953a-cd91-63d400ef9ce0	1373	Rovte
00050000-5697-953a-d1d4-445633ff9158	2342	Ruše
00050000-5697-953a-3ba4-e1e013743870	1282	Sava
00050000-5697-953a-f4c5-8c157833d6e9	6333	Sečovlje/Sicciole
00050000-5697-953a-5d86-7f02108db806	4227	Selca
00050000-5697-953a-a747-61cfdd0c8ef5	2352	Selnica ob Dravi
00050000-5697-953a-1c26-4296613af241	8333	Semič
00050000-5697-953a-9f56-effb210a3fdc	8281	Senovo
00050000-5697-953a-9c2c-bc1117a78ce8	6224	Senožeče
00050000-5697-953a-9e3b-5e4008b0e093	8290	Sevnica
00050000-5697-953a-fd61-1de59aef8128	6210	Sežana
00050000-5697-953a-33ec-c35fa7f75c5e	2214	Sladki Vrh
00050000-5697-953a-7de8-3d1fe83fbe14	5283	Slap ob Idrijci
00050000-5697-953a-75c0-8d47984b3975	2380	Slovenj Gradec
00050000-5697-953a-0ed7-927e89b2d2e0	2310	Slovenska Bistrica
00050000-5697-953a-d95c-f075167ba6b1	3210	Slovenske Konjice
00050000-5697-953a-bc5a-2c3f86986a14	1216	Smlednik
00050000-5697-953a-5ccb-d992e10d54b7	5232	Soča
00050000-5697-953a-3b58-b728ff6fa4fc	1317	Sodražica
00050000-5697-953a-efc6-049b06eb9db1	3335	Solčava
00050000-5697-953a-0f97-77290bc2c92a	5250	Solkan
00050000-5697-953a-f614-b95f3c53182e	4229	Sorica
00050000-5697-953a-ef1e-48c981a649be	4225	Sovodenj
00050000-5697-953a-5f22-dc53734d8a7c	5281	Spodnja Idrija
00050000-5697-953a-4c62-6f9b71d7d730	2241	Spodnji Duplek
00050000-5697-953a-5be7-63738246def1	9245	Spodnji Ivanjci
00050000-5697-953a-dc24-d581deb4d1c4	2277	Središče ob Dravi
00050000-5697-953a-629b-1cf57437fd96	4267	Srednja vas v Bohinju
00050000-5697-953a-0f59-8969d300c62d	8256	Sromlje 
00050000-5697-953a-c8e7-7968fc231cfd	5224	Srpenica
00050000-5697-953a-f6e2-5fae3a8adf2b	1242	Stahovica
00050000-5697-953a-a9e3-4efef5a2a284	1332	Stara Cerkev
00050000-5697-953a-1d89-27116ed80c6d	8342	Stari trg ob Kolpi
00050000-5697-953a-690d-024228ec9c6d	1386	Stari trg pri Ložu
00050000-5697-953a-719a-5e3375c0d418	2205	Starše
00050000-5697-953a-3aa3-2c89b771850b	2289	Stoperce
00050000-5697-953a-e914-4c999e3014eb	8322	Stopiče
00050000-5697-953a-a60b-e9e407e33d81	3206	Stranice
00050000-5697-953a-e9b9-1bdb89044978	8351	Straža
00050000-5697-953a-aabe-461c6f585251	1313	Struge
00050000-5697-953a-0f60-44f56167fe64	8293	Studenec
00050000-5697-953a-1545-48299d9e3c7a	8331	Suhor
00050000-5697-953a-90c6-a5ab8628af2d	2233	Sv. Ana v Slovenskih goricah
00050000-5697-953a-3868-e9edac437980	2235	Sv. Trojica v Slovenskih goricah
00050000-5697-953a-5073-16b949b918ae	2353	Sveti Duh na Ostrem Vrhu
00050000-5697-953a-c91e-c8bc5364d833	9244	Sveti Jurij ob Ščavnici
00050000-5697-953a-48f2-696816cc525c	3264	Sveti Štefan
00050000-5697-953a-8210-065ff97ac4fd	2258	Sveti Tomaž
00050000-5697-953a-92cd-152fdfaceb65	9204	Šalovci
00050000-5697-953a-fc90-2216776bd604	5261	Šempas
00050000-5697-953a-8e85-194c77646c43	5290	Šempeter pri Gorici
00050000-5697-953a-678f-c0f4fa913198	3311	Šempeter v Savinjski dolini
00050000-5697-953a-6ca1-6fed4785fbdb	4208	Šenčur
00050000-5697-953a-31f1-0edbce283709	2212	Šentilj v Slovenskih goricah
00050000-5697-953a-b743-7036d27b3e3f	8297	Šentjanž
00050000-5697-953a-5cf6-1d3c529d0db2	2373	Šentjanž pri Dravogradu
00050000-5697-953a-026c-e9b0e13e40b1	8310	Šentjernej
00050000-5697-953a-d9e5-6301838aaeb5	3230	Šentjur
00050000-5697-953a-2827-7030d05aa1be	3271	Šentrupert
00050000-5697-953a-5b64-afa899f86a2d	8232	Šentrupert
00050000-5697-953a-28b3-a894bb42c911	1296	Šentvid pri Stični
00050000-5697-953a-b02d-3dfdb6f8267e	8275	Škocjan
00050000-5697-953a-dc53-0f8872182e99	6281	Škofije
00050000-5697-953a-6c5c-813f0e07f255	4220	Škofja Loka
00050000-5697-953a-90a1-4565731ca513	3211	Škofja vas
00050000-5697-953a-8de3-a82f43b20b68	1291	Škofljica
00050000-5697-953a-677d-071d870acb50	6274	Šmarje
00050000-5697-953a-e938-54f41648b33e	1293	Šmarje - Sap
00050000-5697-953a-9a1a-d8165d642fbf	3240	Šmarje pri Jelšah
00050000-5697-953a-5566-5c02ea7a20a0	8220	Šmarješke Toplice
00050000-5697-953a-1735-b38ba5ec5c17	2315	Šmartno na Pohorju
00050000-5697-953a-b82d-baedc0e46cd8	3341	Šmartno ob Dreti
00050000-5697-953a-3e58-04e8d828391a	3327	Šmartno ob Paki
00050000-5697-953a-1a91-75cadea7f742	1275	Šmartno pri Litiji
00050000-5697-953a-082b-2da5a85b0f45	2383	Šmartno pri Slovenj Gradcu
00050000-5697-953a-b393-971df6cad708	3201	Šmartno v Rožni dolini
00050000-5697-953a-781a-fb0144b454b9	3325	Šoštanj
00050000-5697-953a-34ef-7545856bf5d8	6222	Štanjel
00050000-5697-953a-24fb-11f3df657a9e	3220	Štore
00050000-5697-953a-1af7-96ac884f3718	3304	Tabor
00050000-5697-953a-94ff-26a51ce36a30	3221	Teharje
00050000-5697-953a-13ce-c9a3911f07a9	9251	Tišina
00050000-5697-953a-23d4-cbe5addc9c68	5220	Tolmin
00050000-5697-953a-67f6-0b62f14f4c77	3326	Topolšica
00050000-5697-953a-ca06-8505603ba341	2371	Trbonje
00050000-5697-953a-57bf-7461e5101335	1420	Trbovlje
00050000-5697-953a-e023-2f56dbb8ed2d	8231	Trebelno 
00050000-5697-953a-2d35-27072933175c	8210	Trebnje
00050000-5697-953a-fb20-98795b7775b8	5252	Trnovo pri Gorici
00050000-5697-953a-fab8-0e427ca2efca	2254	Trnovska vas
00050000-5697-953a-85be-440af48c6ad3	1222	Trojane
00050000-5697-953a-4f9b-bca37b652a20	1236	Trzin
00050000-5697-953a-c3a4-6a92eedb200d	4290	Tržič
00050000-5697-953a-145d-a053e1f8c98a	8295	Tržišče
00050000-5697-953a-87ae-69dcaf6dab70	1311	Turjak
00050000-5697-953a-e7a2-8287ad96c9bf	9224	Turnišče
00050000-5697-953a-7ca9-bfc3b15a457b	8323	Uršna sela
00050000-5697-953a-f6f1-b720a8159316	1252	Vače
00050000-5697-953a-f0b4-b6f6bccf4204	3320	Velenje 
00050000-5697-953a-bf69-3b5078baeca6	3322	Velenje - poštni predali
00050000-5697-953a-626a-17d1419cce2d	8212	Velika Loka
00050000-5697-953a-465d-4dc8d4216776	2274	Velika Nedelja
00050000-5697-953a-8f07-2b758b8bbd18	9225	Velika Polana
00050000-5697-953a-fc93-491c9478d7d4	1315	Velike Lašče
00050000-5697-953a-3407-96a39fb140ea	8213	Veliki Gaber
00050000-5697-953a-d4b9-22d8ff403a5d	9241	Veržej
00050000-5697-953a-4fea-346c7a72ad27	1312	Videm - Dobrepolje
00050000-5697-953a-6f45-80507f728590	2284	Videm pri Ptuju
00050000-5697-953a-18ea-79582f4d7704	8344	Vinica
00050000-5697-953a-3e1e-6461f4f59ce0	5271	Vipava
00050000-5697-953a-332f-2915472f8f4b	4212	Visoko
00050000-5697-953a-be2e-a5ef46cbf03c	1294	Višnja Gora
00050000-5697-953a-1c78-ba914913583d	3205	Vitanje
00050000-5697-953a-423f-89f8fc659908	2255	Vitomarci
00050000-5697-953a-8b84-be01651de399	1217	Vodice
00050000-5697-953a-9a7e-a22ef5645995	3212	Vojnik\t
00050000-5697-953a-151a-70fcd4703a00	5293	Volčja Draga
00050000-5697-953a-71a5-07777428c9bf	2232	Voličina
00050000-5697-953a-30c9-2c11e07d148e	3305	Vransko
00050000-5697-953a-9525-eb326a0edf0b	6217	Vremski Britof
00050000-5697-953a-75d5-b002833611cc	1360	Vrhnika
00050000-5697-953a-ac39-4d5f7d3b1c6c	2365	Vuhred
00050000-5697-953a-8563-9cc63f15113c	2367	Vuzenica
00050000-5697-953a-e024-1906f86a383b	8292	Zabukovje 
00050000-5697-953a-dc8b-5703642cee9d	1410	Zagorje ob Savi
00050000-5697-953a-7a6d-bdabf8696e9f	1303	Zagradec
00050000-5697-953a-fac3-3d25783dea93	2283	Zavrč
00050000-5697-953a-8fa9-ab376d4f3672	8272	Zdole 
00050000-5697-953a-783a-3948aac0617d	4201	Zgornja Besnica
00050000-5697-953a-a809-cc931e244837	2242	Zgornja Korena
00050000-5697-953a-94d9-078664008c40	2201	Zgornja Kungota
00050000-5697-953a-4721-bdb68b2e012a	2316	Zgornja Ložnica
00050000-5697-953a-19f6-24a4cca9b447	2314	Zgornja Polskava
00050000-5697-953a-91ec-3fdf532e65e7	2213	Zgornja Velka
00050000-5697-953a-079c-f55d493078d8	4247	Zgornje Gorje
00050000-5697-953a-72a4-010305f2657f	4206	Zgornje Jezersko
00050000-5697-953a-18ee-4a46a47bd766	2285	Zgornji Leskovec
00050000-5697-953a-7b1d-69b20610755c	1432	Zidani Most
00050000-5697-953a-c150-2e0e3ba60ae9	3214	Zreče
00050000-5697-953a-d54d-b92814f87bbf	4209	Žabnica
00050000-5697-953a-2ee6-fbbdaf09c6f5	3310	Žalec
00050000-5697-953a-4c79-f229ec33c09f	4228	Železniki
00050000-5697-953a-b439-8ddc3bacdf74	2287	Žetale
00050000-5697-953a-149b-00965ff0088e	4226	Žiri
00050000-5697-953a-8b29-85f88db385c7	4274	Žirovnica
00050000-5697-953a-9206-b280feb1a579	8360	Žužemberk
\.


--
-- TOC entry 3199 (class 0 OID 36292240)
-- Dependencies: 243
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 36291810)
-- Dependencies: 216
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 36291541)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5697-953e-bf1d-7424d278ed17	00080000-5697-953e-6168-536df66b025e	\N	00040000-5697-953b-7157-48936302ac30	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5697-953e-5762-7361b3a148be	00080000-5697-953e-6168-536df66b025e	\N	00040000-5697-953b-7157-48936302ac30	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5697-953e-5401-066feef9bd35	00080000-5697-953e-9e02-ac162a213de3	\N	00040000-5697-953b-7157-48936302ac30	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3158 (class 0 OID 36291679)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5697-953b-d286-a3814f91a2c5	novo leto	1	1	\N	t
00430000-5697-953b-894e-4ffd1a8082ce	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5697-953b-5f47-ba5a69cfa1ff	dan upora proti okupatorju	27	4	\N	t
00430000-5697-953b-5ef7-1c45ace7f049	praznik dela	1	5	\N	t
00430000-5697-953b-b91c-9124971f43cf	praznik dela	2	5	\N	t
00430000-5697-953b-3ceb-ace50468f4c1	dan Primoža Trubarja	8	6	\N	f
00430000-5697-953b-6484-523929135259	dan državnosti	25	6	\N	t
00430000-5697-953b-5f7a-46b80454e910	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5697-953b-5c72-273b8ecf7841	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5697-953b-6184-79d98c13ebab	dan suverenosti	25	10	\N	f
00430000-5697-953b-ca26-3b0fed9d7888	dan spomina na mrtve	1	11	\N	t
00430000-5697-953b-d0b9-38770ac55fbc	dan Rudolfa Maistra	23	11	\N	f
00430000-5697-953b-791a-4ae6efefac4f	božič	25	12	\N	t
00430000-5697-953b-5152-f4ce648a14a4	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5697-953b-2798-482bbf6995af	Marijino vnebovzetje	15	8	\N	t
00430000-5697-953b-5ec8-2ab92c5aa433	dan reformacije	31	10	\N	t
00430000-5697-953b-c7ca-2a936f26c403	velikonočna nedelja	27	3	2016	t
00430000-5697-953b-fa5a-9e8d4efa4af9	velikonočna nedelja	16	4	2017	t
00430000-5697-953b-4ef4-0f5ced4fc223	velikonočna nedelja	1	4	2018	t
00430000-5697-953b-81ef-67b66e1366bb	velikonočna nedelja	21	4	2019	t
00430000-5697-953b-00d3-9ed720487b45	velikonočna nedelja	12	4	2020	t
00430000-5697-953b-f1ab-3668819f8893	velikonočna nedelja	4	4	2021	t
00430000-5697-953b-5079-cb9c25da6220	velikonočna nedelja	17	4	2022	t
00430000-5697-953b-dbc0-6752f03d631a	velikonočna nedelja	9	4	2023	t
00430000-5697-953b-9816-66d6f643b354	velikonočna nedelja	31	3	2024	t
00430000-5697-953b-a9fb-3eeb9f843b85	velikonočna nedelja	20	4	2025	t
00430000-5697-953b-a92f-45dd4fba9c50	velikonočna nedelja	5	4	2026	t
00430000-5697-953b-e9a1-3a40093212bd	velikonočna nedelja	28	3	2027	t
00430000-5697-953b-882d-ce396cab6daa	velikonočna nedelja	16	4	2028	t
00430000-5697-953b-33f0-2a8ab85f5751	velikonočna nedelja	1	4	2029	t
00430000-5697-953b-4463-72f35ddf1948	velikonočna nedelja	21	4	2030	t
00430000-5697-953b-f46c-28a370dac6d9	velikonočni ponedeljek	28	3	2016	t
00430000-5697-953b-08f7-c352800ddacc	velikonočni ponedeljek	17	4	2017	t
00430000-5697-953b-b974-62cb67ce7217	velikonočni ponedeljek	2	4	2018	t
00430000-5697-953b-f2a2-213ad67a3787	velikonočni ponedeljek	22	4	2019	t
00430000-5697-953b-a9a7-47a4589b3a72	velikonočni ponedeljek	13	4	2020	t
00430000-5697-953b-3e54-b09b3e090649	velikonočni ponedeljek	5	4	2021	t
00430000-5697-953b-7aac-9e1383734983	velikonočni ponedeljek	18	4	2022	t
00430000-5697-953b-70de-7069f8887bb6	velikonočni ponedeljek	10	4	2023	t
00430000-5697-953b-4c75-e2b4285bd798	velikonočni ponedeljek	1	4	2024	t
00430000-5697-953b-65c2-8671c771c679	velikonočni ponedeljek	21	4	2025	t
00430000-5697-953b-fa70-c34828bda694	velikonočni ponedeljek	6	4	2026	t
00430000-5697-953b-27ee-88515042da81	velikonočni ponedeljek	29	3	2027	t
00430000-5697-953b-ff69-49ac2855bc53	velikonočni ponedeljek	17	4	2028	t
00430000-5697-953b-c206-b98a6761221b	velikonočni ponedeljek	2	4	2029	t
00430000-5697-953b-c486-1f14c867e5b8	velikonočni ponedeljek	22	4	2030	t
00430000-5697-953b-ef12-06d61a35c528	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5697-953b-c116-cf45a98d3461	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5697-953b-77b0-dd4409e09912	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5697-953b-9e9c-04f44f22b80a	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5697-953b-4f18-65e116d31bfc	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5697-953b-1f57-429b64404c6a	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5697-953b-2662-4969b9f769c6	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5697-953b-8236-e313a383cdcc	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5697-953b-dedf-6e6fd3b8b01c	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5697-953b-f398-a33768341f4c	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5697-953b-74e5-a4b593e6674d	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5697-953b-f119-2f082d8addcd	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5697-953b-5bc5-cf1c4adc765b	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5697-953b-aa92-4e6235a32d81	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5697-953b-e08e-3f19aaa932b2	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3154 (class 0 OID 36291645)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 36291654)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 36291776)
-- Dependencies: 212
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 36291822)
-- Dependencies: 218
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 36292254)
-- Dependencies: 244
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 36292264)
-- Dependencies: 245
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5697-953e-bc96-92fc45fa6b67	00080000-5697-953e-ed76-6c21918906a3	0987	AK
00190000-5697-953e-5eab-6ca8c4f260e7	00080000-5697-953e-9e02-ac162a213de3	0989	AK
00190000-5697-953e-67a1-28183910225e	00080000-5697-953e-a4d1-b5c1d2f67bc3	0986	AK
00190000-5697-953e-5edd-242ace30ab28	00080000-5697-953e-d503-05c7c4a2449e	0984	AK
00190000-5697-953e-730c-1173d5786a4a	00080000-5697-953e-b09b-fa54268fdf6a	0983	AK
00190000-5697-953e-1953-0d4133123607	00080000-5697-953e-d15f-f568a5354caf	0982	AK
00190000-5697-9540-0fdc-fdf3a4ff3f49	00080000-5697-9540-60cc-ffb9526ded09	1001	AK
\.


--
-- TOC entry 3198 (class 0 OID 36292153)
-- Dependencies: 242
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5697-953e-91d3-78aaa9d8d430	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3202 (class 0 OID 36292272)
-- Dependencies: 246
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 36291851)
-- Dependencies: 222
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5697-953d-efad-24f20869983e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5697-953d-fbb7-7a3a83d62ba5	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5697-953d-511c-f35969e43663	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5697-953d-7689-a886585d8f05	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5697-953d-c943-721d677b0ad7	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5697-953d-d1e0-e2c546c7a09a	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5697-953d-ba7f-23528362e1db	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3170 (class 0 OID 36291795)
-- Dependencies: 214
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 36291785)
-- Dependencies: 213
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 36291992)
-- Dependencies: 235
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 36291922)
-- Dependencies: 229
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 36291619)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 36291381)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5697-9540-60cc-ffb9526ded09	00010000-5697-953c-74a9-fb16633d6c64	2016-01-14 13:32:00	INS	a:0:{}
2	App\\Entity\\Option	00000000-5697-9540-ff6e-efa9de955ffa	00010000-5697-953c-74a9-fb16633d6c64	2016-01-14 13:32:00	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5697-9540-0fdc-fdf3a4ff3f49	00010000-5697-953c-74a9-fb16633d6c64	2016-01-14 13:32:00	INS	a:0:{}
\.


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3179 (class 0 OID 36291864)
-- Dependencies: 223
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 36291419)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5697-953b-bb84-09f0646dcbc3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5697-953b-8ffc-67bd73818d48	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5697-953b-d0c1-f0a42b9bbd89	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5697-953b-9e5c-2d93791d258b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5697-953b-3222-07eac3c10ee9	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5697-953b-ceb1-9814804314c6	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5697-953b-ae74-3d748c3e8617	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5697-953b-73cb-20fae959f72e	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5697-953b-51a0-c166dc5c175e	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-953b-1b1a-fd922d3b7a1c	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-953b-32ba-b17254f31035	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-953b-5a66-00e05d830dcd	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-953b-4dbd-9966b9857c0e	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-953b-fb20-dff5bcc0e462	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-953b-adf3-7c368197f327	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-953b-b91d-e272be50cbdc	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-953b-5d7b-3effbdf70e3b	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5697-953b-a2f4-978b6da312cf	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5697-953b-906a-37d82b01dbec	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5697-953b-2b1c-e2922a8ec34d	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5697-953b-2e6a-39a168397053	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-953b-6839-76feeb3a5dcd	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-953b-35ea-70fcc73ef327	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-953b-865c-a0c24007cb66	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-953b-8994-0fceb7842b94	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5697-953b-0f63-31967404d7ff	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5697-953b-15ae-a7d5e14dd378	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5697-953b-761d-98eec401f2ea	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5697-953b-631b-b7564e9f911e	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5697-953b-4716-40611764aff3	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5697-953b-2551-2bcb4fd40b0b	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-953b-a0b9-5f6c30bb0dcc	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-953b-4cac-7c56037a936f	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5697-953b-641f-7974d8599a26	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5697-953b-50ca-ded42b166484	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5697-953b-b121-a2c58f114cc6	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5697-953b-1996-dedf7ccc04f7	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-953b-403b-32c80120cf42	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-953b-149a-a91a47990283	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5697-953b-e6ed-b654f0a90144	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-953b-3708-b7066b5e83d0	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-953b-67d2-711b3f701619	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5697-953b-3f22-05c19e2d82c3	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-953b-1b7d-a54c67125a75	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-953b-0127-f5fcd2bdba0f	direktor	minimalne pravice za direktorja	t
00020000-5697-953b-ca81-8a2369d55206	arhivar	arhivar	t
00020000-5697-953b-692c-696c951e2255	dramaturg	dramaturg	t
00020000-5697-953b-f508-ee04fc13934d	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5697-953b-eb38-048c6ed3f55f	poslovni-sekretar	poslovni sekretar	t
00020000-5697-953b-fa3e-b9f5d00bf27b	vodja-tehnike	vodja tehnike	t
00020000-5697-953c-df32-c13b333544e9	racunovodja	računovodja	t
00020000-5697-953d-e616-53b42a5aa73d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5697-953d-4a37-0e2d42b0485b	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-797c-783e8576cf19	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-7f6a-d22fcf5e6d36	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-66fa-c697aa798d24	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-d729-9ffbd6247f86	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-d321-23427b51a799	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-6b0b-0754ea14f51c	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5697-953d-37a0-0b6ec85e4394	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5697-953d-da46-5a909e7f97ac	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-8866-48c8fa6a9c22	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-c6aa-fdfc5d7ad129	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-2650-e946df546500	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-0a8c-e0bb5ee990cb	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-aed5-2c2558128e96	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-f0a1-5dbb7c1f5eec	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-ac12-eae6fd6bf198	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-33ad-a6e01933e81b	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-efa2-29ea24e3e41e	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-a517-95ff19cda91f	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5697-953d-a27d-9ef11f992dba	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-595f-bfa83e53831d	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-7aac-f1454c1cbffe	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-6ba2-5afba42997b7	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-789a-660b8f66cc4d	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-4806-e0f652a9a142	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-02ee-ac947af21c8f	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-7e5f-47057528b3a3	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-999e-bf836451a98c	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-0345-79d8e8a2c767	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-4614-ac0142206be9	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-6cbf-b29d20df511f	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-6a26-58937992ff9e	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-b9b0-df1d6a49cd2a	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-34bf-b2b17b0d8d29	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-d50c-23243ba31798	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5697-953d-7d9c-4219b7bbcfb0	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5697-953d-c5d2-2365b9d5e241	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5697-953d-4279-e2ed7918e8a2	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3133 (class 0 OID 36291403)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5697-953c-dde3-200429c34d75	00020000-5697-953b-d0c1-f0a42b9bbd89
00010000-5697-953c-74a9-fb16633d6c64	00020000-5697-953b-d0c1-f0a42b9bbd89
00010000-5697-953d-2b0a-22131558c7ac	00020000-5697-953d-e616-53b42a5aa73d
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-4a37-0e2d42b0485b
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-d729-9ffbd6247f86
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-da46-5a909e7f97ac
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-c6aa-fdfc5d7ad129
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-0a8c-e0bb5ee990cb
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-efa2-29ea24e3e41e
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-7f6a-d22fcf5e6d36
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-a27d-9ef11f992dba
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-6ba2-5afba42997b7
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-4806-e0f652a9a142
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-7e5f-47057528b3a3
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-0345-79d8e8a2c767
00010000-5697-953d-5f67-dd3638c0b27b	00020000-5697-953d-b9b0-df1d6a49cd2a
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-4a37-0e2d42b0485b
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-797c-783e8576cf19
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-7f6a-d22fcf5e6d36
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-66fa-c697aa798d24
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-0a8c-e0bb5ee990cb
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-ac12-eae6fd6bf198
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-a27d-9ef11f992dba
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-6ba2-5afba42997b7
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-4806-e0f652a9a142
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-7e5f-47057528b3a3
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-0345-79d8e8a2c767
00010000-5697-953d-7bfd-a2e638c19e68	00020000-5697-953d-b9b0-df1d6a49cd2a
00010000-5697-953e-7811-0f43bf9a861f	00020000-5697-953d-4a37-0e2d42b0485b
00010000-5697-953e-7811-0f43bf9a861f	00020000-5697-953d-797c-783e8576cf19
00010000-5697-953e-7811-0f43bf9a861f	00020000-5697-953d-7f6a-d22fcf5e6d36
00010000-5697-953e-7811-0f43bf9a861f	00020000-5697-953d-66fa-c697aa798d24
00010000-5697-953e-7811-0f43bf9a861f	00020000-5697-953d-c6aa-fdfc5d7ad129
00010000-5697-953e-7811-0f43bf9a861f	00020000-5697-953d-0a8c-e0bb5ee990cb
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-797c-783e8576cf19
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-d321-23427b51a799
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-8866-48c8fa6a9c22
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-2650-e946df546500
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-c6aa-fdfc5d7ad129
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-33ad-a6e01933e81b
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-0a8c-e0bb5ee990cb
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-aed5-2c2558128e96
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-a27d-9ef11f992dba
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-595f-bfa83e53831d
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-6ba2-5afba42997b7
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-789a-660b8f66cc4d
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-4806-e0f652a9a142
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-02ee-ac947af21c8f
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-7e5f-47057528b3a3
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-999e-bf836451a98c
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-0345-79d8e8a2c767
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-4614-ac0142206be9
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-b9b0-df1d6a49cd2a
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-34bf-b2b17b0d8d29
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-7d9c-4219b7bbcfb0
00010000-5697-953e-d2f6-c53f1e04dcc3	00020000-5697-953d-c5d2-2365b9d5e241
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-797c-783e8576cf19
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-d321-23427b51a799
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-37a0-0b6ec85e4394
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-8866-48c8fa6a9c22
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-2650-e946df546500
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-c6aa-fdfc5d7ad129
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-33ad-a6e01933e81b
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-0a8c-e0bb5ee990cb
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-aed5-2c2558128e96
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-f0a1-5dbb7c1f5eec
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-a27d-9ef11f992dba
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-595f-bfa83e53831d
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-7aac-f1454c1cbffe
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-6ba2-5afba42997b7
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-789a-660b8f66cc4d
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-4806-e0f652a9a142
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-02ee-ac947af21c8f
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-7e5f-47057528b3a3
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-999e-bf836451a98c
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-0345-79d8e8a2c767
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-4614-ac0142206be9
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-b9b0-df1d6a49cd2a
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-34bf-b2b17b0d8d29
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-d50c-23243ba31798
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-7d9c-4219b7bbcfb0
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-c5d2-2365b9d5e241
00010000-5697-953e-391e-50eb9c18fbfe	00020000-5697-953d-4279-e2ed7918e8a2
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-797c-783e8576cf19
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-7f6a-d22fcf5e6d36
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-d321-23427b51a799
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-6b0b-0754ea14f51c
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-37a0-0b6ec85e4394
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-d729-9ffbd6247f86
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-8866-48c8fa6a9c22
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-2650-e946df546500
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-c6aa-fdfc5d7ad129
00010000-5697-953e-9bf6-1d33cdba7d1f	00020000-5697-953d-33ad-a6e01933e81b
00010000-5697-953e-3304-f168fd9fc357	00020000-5697-953d-4a37-0e2d42b0485b
00010000-5697-953e-3304-f168fd9fc357	00020000-5697-953d-66fa-c697aa798d24
00010000-5697-953e-3304-f168fd9fc357	00020000-5697-953d-d729-9ffbd6247f86
00010000-5697-953e-3304-f168fd9fc357	00020000-5697-953d-da46-5a909e7f97ac
00010000-5697-953e-3304-f168fd9fc357	00020000-5697-953d-c6aa-fdfc5d7ad129
00010000-5697-953e-3304-f168fd9fc357	00020000-5697-953d-0a8c-e0bb5ee990cb
00010000-5697-953e-3304-f168fd9fc357	00020000-5697-953d-efa2-29ea24e3e41e
00010000-5697-953e-3304-f168fd9fc357	00020000-5697-953d-6cbf-b29d20df511f
00010000-5697-953e-faea-ca45bae2221e	00020000-5697-953d-a517-95ff19cda91f
00010000-5697-953e-bc21-9deacbfc8481	00020000-5697-953b-0127-f5fcd2bdba0f
00010000-5697-953e-63b7-7fd166c500f7	00020000-5697-953b-ca81-8a2369d55206
00010000-5697-953e-1ea7-ef849256923e	00020000-5697-953b-692c-696c951e2255
00010000-5697-953e-a093-1bb5ada4343f	00020000-5697-953b-f508-ee04fc13934d
00010000-5697-953e-840d-a70ff10ae13c	00020000-5697-953b-eb38-048c6ed3f55f
00010000-5697-953e-ddf3-e21c3e344b26	00020000-5697-953b-fa3e-b9f5d00bf27b
00010000-5697-953e-64d4-7ce85bf46a29	00020000-5697-953c-df32-c13b333544e9
\.


--
-- TOC entry 3181 (class 0 OID 36291878)
-- Dependencies: 225
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 36291816)
-- Dependencies: 217
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 36291739)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5697-953d-5132-af4616e00ee2	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5697-953d-e043-6b2886197956	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5697-953d-6cb4-2cadc551e638	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3129 (class 0 OID 36291368)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5697-953b-ef52-2806705d5794	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5697-953b-e3b7-b01b0c0cebee	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5697-953b-db67-441215c72584	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5697-953b-6022-2c1dd722580c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5697-953b-1e23-d38749571598	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3128 (class 0 OID 36291360)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5697-953b-4781-0024af6b1d63	00230000-5697-953b-6022-2c1dd722580c	popa
00240000-5697-953b-3b46-62ae7ae390c0	00230000-5697-953b-6022-2c1dd722580c	oseba
00240000-5697-953b-bda6-6a6f0afb7e72	00230000-5697-953b-6022-2c1dd722580c	tippopa
00240000-5697-953b-c92f-d0f79271ae27	00230000-5697-953b-6022-2c1dd722580c	organizacijskaenota
00240000-5697-953b-631b-d231e9541ecb	00230000-5697-953b-6022-2c1dd722580c	sezona
00240000-5697-953b-df5f-9a798b71d043	00230000-5697-953b-6022-2c1dd722580c	tipvaje
00240000-5697-953b-1d17-e4d11410b4f0	00230000-5697-953b-6022-2c1dd722580c	tipdodatka
00240000-5697-953b-c430-42592bcba74e	00230000-5697-953b-e3b7-b01b0c0cebee	prostor
00240000-5697-953b-bc3c-87cc83728050	00230000-5697-953b-6022-2c1dd722580c	besedilo
00240000-5697-953b-2e10-9e692b1d43c0	00230000-5697-953b-6022-2c1dd722580c	uprizoritev
00240000-5697-953b-8986-8f2b0027d94b	00230000-5697-953b-6022-2c1dd722580c	funkcija
00240000-5697-953b-bd41-3024e99b3464	00230000-5697-953b-6022-2c1dd722580c	tipfunkcije
00240000-5697-953b-4391-6e6da8816a93	00230000-5697-953b-6022-2c1dd722580c	alternacija
00240000-5697-953b-8aa3-34d50ec1c144	00230000-5697-953b-ef52-2806705d5794	pogodba
00240000-5697-953b-c21e-2cc5a6c5abdb	00230000-5697-953b-6022-2c1dd722580c	zaposlitev
00240000-5697-953b-3772-57122a5a216f	00230000-5697-953b-6022-2c1dd722580c	zvrstuprizoritve
00240000-5697-953b-eb45-29b8ca020ea8	00230000-5697-953b-ef52-2806705d5794	programdela
00240000-5697-953b-18cf-f0e1186d8fa2	00230000-5697-953b-6022-2c1dd722580c	zapis
\.


--
-- TOC entry 3127 (class 0 OID 36291355)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b44a3983-5f00-4748-9c4f-4a0811fa88ce	00240000-5697-953b-4781-0024af6b1d63	0	1001
\.


--
-- TOC entry 3187 (class 0 OID 36291939)
-- Dependencies: 231
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5697-953e-1000-be2067f904ed	000e0000-5697-953e-193f-8623a21549c6	00080000-5697-953e-6168-536df66b025e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5697-953b-f89f-bd029dcceb0b
00270000-5697-953e-495e-e5475deda215	000e0000-5697-953e-193f-8623a21549c6	00080000-5697-953e-6168-536df66b025e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5697-953b-f89f-bd029dcceb0b
\.


--
-- TOC entry 3143 (class 0 OID 36291503)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 36291749)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, zasedenost, virtzasedenost) FROM stdin;
001a0000-5697-953e-178d-2f0df69ebe85	00180000-5697-953e-7d0e-ae4cf0601ac4	000c0000-5697-953e-5471-08f915a451df	00090000-5697-953e-5fa4-30979214b8cb	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-953e-d1d2-ca687d09bfe9	00180000-5697-953e-7d0e-ae4cf0601ac4	000c0000-5697-953e-5be3-45974ed48281	00090000-5697-953e-e550-c00c54677d4d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-953e-fba5-07ade94f717d	00180000-5697-953e-7d0e-ae4cf0601ac4	000c0000-5697-953e-d301-b29040691e19	00090000-5697-953e-ada5-813a2e643638	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-953e-6ba1-58fa1b9b9a44	00180000-5697-953e-7d0e-ae4cf0601ac4	000c0000-5697-953e-b3f5-9d121db81e35	00090000-5697-953e-151e-24a0bb698e69	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-953e-279f-5c532c2f8c39	00180000-5697-953e-7d0e-ae4cf0601ac4	000c0000-5697-953e-4936-267756067bdb	00090000-5697-953e-6140-74f0b3380317	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-953e-ec00-a0c9630804fb	00180000-5697-953e-005d-1e173f011663	\N	00090000-5697-953e-6140-74f0b3380317	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N
001a0000-5697-953e-6cc2-397013c39687	00180000-5697-953e-005d-1e173f011663	\N	00090000-5697-953e-e550-c00c54677d4d	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N
\.


--
-- TOC entry 3167 (class 0 OID 36291766)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5697-953b-3812-f66a322d5aba	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5697-953b-dc30-05abee0c31ee	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5697-953b-7ade-47172a03d247	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5697-953b-3e44-3318c433891c	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5697-953b-0a16-a342038ae2c5	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5697-953b-3ab4-6977c41b4d1f	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3190 (class 0 OID 36291980)
-- Dependencies: 234
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5697-953a-d87a-c94fce2f00cf	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5697-953a-9085-768a2d8dd2b8	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5697-953a-5abd-75a4f4d6ef77	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5697-953a-516d-847647f607da	04	Režija	Režija	Režija	umetnik	30
000f0000-5697-953a-f563-63ade0537449	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5697-953a-d940-ffc0ad3572bf	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5697-953a-25da-ed770bcda2ca	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5697-953a-3ab5-d546a759a867	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5697-953a-dc4e-fd1664d90429	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5697-953a-d321-8899cd32c192	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5697-953a-7dc4-3c88a144dc84	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5697-953a-843d-6f14d9cd2ce9	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5697-953a-71f4-6c2679d07a41	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5697-953a-de74-3cdef9eebcbe	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5697-953a-b6d6-ea5863b395b9	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5697-953a-e9c7-87ce8abbb350	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5697-953a-ace7-83f9adfffce9	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5697-953a-f9ee-e591eb3f4eb1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5697-953a-e3aa-0c7771248851	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3140 (class 0 OID 36291454)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5697-953d-7101-80440cd603d8	0001	šola	osnovna ali srednja šola
00400000-5697-953d-3d01-0c7a72e9fb6e	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5697-953d-d53e-8a5bbcf67b2a	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3203 (class 0 OID 36292284)
-- Dependencies: 247
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5697-953a-6ecf-4739480700e2	01	Velika predstava	f	1.00	1.00
002b0000-5697-953a-aa3c-ffe9478fde85	02	Mala predstava	f	0.50	0.50
002b0000-5697-953a-61db-ae75916023a2	03	Mala koprodukcija	t	0.40	1.00
002b0000-5697-953a-137d-910f95416b27	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5697-953a-6ec6-f5fa177264ea	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3163 (class 0 OID 36291729)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5697-953a-2f14-b1a8759902cd	0001	prva vaja	prva vaja
00420000-5697-953a-1867-9981380e7b1d	0002	tehnična vaja	tehnična vaja
00420000-5697-953a-5793-af855f70fd2b	0003	lučna vaja	lučna vaja
00420000-5697-953a-7068-829b044d30fc	0004	kostumska vaja	kostumska vaja
00420000-5697-953a-150a-aa386950c616	0005	foto vaja	foto vaja
00420000-5697-953a-0616-bb821d890caf	0006	1. glavna vaja	1. glavna vaja
00420000-5697-953a-81aa-45bf387465c1	0007	2. glavna vaja	2. glavna vaja
00420000-5697-953a-08c4-382e9e7cd4e9	0008	1. generalka	1. generalka
00420000-5697-953a-5c1a-4cf658ebd0c3	0009	2. generalka	2. generalka
00420000-5697-953a-48a8-dd116d33eeda	0010	odprta generalka	odprta generalka
00420000-5697-953a-80ac-93282b06c362	0011	obnovitvena vaja	obnovitvena vaja
00420000-5697-953a-948c-5696e44b21b5	0012	italijanka	krajša "obnovitvena" vaja
00420000-5697-953a-7be7-d3f844b9ad79	0013	pevska vaja	pevska vaja
00420000-5697-953a-f63f-f408a23cd915	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5697-953a-698a-bc73ea1a5bea	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5697-953a-57d8-f406d31ec9c1	0016	orientacijska vaja	orientacijska vaja
00420000-5697-953a-af10-b3c85bc39fcd	0017	situacijska vaja	situacijska vaja
00420000-5697-953a-184d-a973f763f347	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3149 (class 0 OID 36291576)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 36291390)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5697-953c-74a9-fb16633d6c64	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO5ZzsvoHACf3bXEkVoOTIph2k23JajhW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5697-953d-5bf6-8176530a0ca3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5697-953d-f0c3-95bb49ba3054	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5697-953d-0e14-b62267eaabc8	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5697-953d-788d-07f7ef3ef861	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5697-953d-f92b-a001eed089fb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5697-953d-5a2e-5d5bcb1cdfd2	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5697-953d-4e58-198c306a906c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5697-953d-ed38-7d7720e6888c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5697-953d-89f5-9d65fb4aa1a5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5697-953d-2b0a-22131558c7ac	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5697-953d-3035-545011c59a2a	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5697-953d-5f67-dd3638c0b27b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5697-953d-7bfd-a2e638c19e68	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5697-953e-7811-0f43bf9a861f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5697-953e-d2f6-c53f1e04dcc3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5697-953e-391e-50eb9c18fbfe	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5697-953e-9bf6-1d33cdba7d1f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5697-953e-3304-f168fd9fc357	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5697-953e-faea-ca45bae2221e	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5697-953e-bc21-9deacbfc8481	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5697-953e-63b7-7fd166c500f7	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5697-953e-1ea7-ef849256923e	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5697-953e-a093-1bb5ada4343f	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5697-953e-840d-a70ff10ae13c	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5697-953e-ddf3-e21c3e344b26	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5697-953e-64d4-7ce85bf46a29	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5697-953c-dde3-200429c34d75	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3194 (class 0 OID 36292030)
-- Dependencies: 238
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5697-953e-0955-d59d4821617e	00160000-5697-953d-64b1-7d36efb14fd1	\N	00140000-5697-953b-af54-78e7c08be8f5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5697-953d-c943-721d677b0ad7
000e0000-5697-953e-193f-8623a21549c6	00160000-5697-953d-8782-75766b6c36ae	\N	00140000-5697-953b-46d0-54d781494cc8	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5697-953d-d1e0-e2c546c7a09a
000e0000-5697-953e-dcff-8f530fd9cb9e	\N	\N	00140000-5697-953b-46d0-54d781494cc8	00190000-5697-953e-bc96-92fc45fa6b67	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-953d-c943-721d677b0ad7
000e0000-5697-953e-c2ce-02461c572dc0	\N	\N	00140000-5697-953b-46d0-54d781494cc8	00190000-5697-953e-bc96-92fc45fa6b67	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-953d-c943-721d677b0ad7
000e0000-5697-953e-a191-2c9a0a668290	\N	\N	00140000-5697-953b-46d0-54d781494cc8	00190000-5697-953e-bc96-92fc45fa6b67	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-5398-2fc23a12eed2	\N	\N	00140000-5697-953b-46d0-54d781494cc8	00190000-5697-953e-bc96-92fc45fa6b67	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-250d-1fa0e530eb06	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-ce2e-955f369e53d1	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-e210-9868835821b1	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-a392-bb5eea777b04	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-de7e-194484ec39f6	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-a548-5c063d18014b	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-3d7d-250ddbb8e3b3	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-863e-43ffb9c10021	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
000e0000-5697-953e-cd31-b6eaff0585cb	\N	\N	00140000-5697-953b-88fc-a39a9993dd81	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-953d-efad-24f20869983e
\.


--
-- TOC entry 3157 (class 0 OID 36291672)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5697-953e-f9f4-c14a59f7ca85	\N	000e0000-5697-953e-193f-8623a21549c6	1
00200000-5697-953e-651b-6aad2848dfd2	\N	000e0000-5697-953e-193f-8623a21549c6	2
00200000-5697-953e-3f86-d030df467ddf	\N	000e0000-5697-953e-193f-8623a21549c6	3
00200000-5697-953e-99b9-5d6499720ce1	\N	000e0000-5697-953e-193f-8623a21549c6	4
00200000-5697-953e-9d28-2da3c9ecb47d	\N	000e0000-5697-953e-193f-8623a21549c6	5
\.


--
-- TOC entry 3177 (class 0 OID 36291843)
-- Dependencies: 221
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 36291953)
-- Dependencies: 232
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5697-953b-9715-fd34c4c6da71	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5697-953b-5de5-af4f6c776880	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5697-953b-67c0-d0d086750c96	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5697-953b-f20d-c4d3a37a7750	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5697-953b-db32-341198a3f7eb	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5697-953b-aff2-ff6a80fbb84e	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5697-953b-c43c-1cf3e278b59e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5697-953b-a8cd-ce3100bc009d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5697-953b-f89f-bd029dcceb0b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5697-953b-0846-5e9cba7a0687	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5697-953b-716a-897c7fcc98d5	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5697-953b-a1b7-9f7fa18e09d6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5697-953b-962d-3e1f4818a5b3	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5697-953b-143b-1b936d5bfea1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5697-953b-7631-6982e9ed4c5b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5697-953b-a9c9-c3eec1c0b14e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5697-953b-ad59-b5ee7a6b900d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5697-953b-c184-5cbca0208e30	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5697-953b-66c3-3a358b9541a9	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5697-953b-693a-b4bb91c2a909	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5697-953b-ef5c-4a04be328a83	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5697-953b-d727-9bfd7938b2e2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5697-953b-701e-f399623da4fa	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5697-953b-fc49-cc864e60b565	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5697-953b-e25f-2bc2550351af	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5697-953b-0e71-045160e8e5f3	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5697-953b-939c-86334c675b2f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5697-953b-394a-d8a86dc908ab	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3206 (class 0 OID 36292334)
-- Dependencies: 250
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 36292303)
-- Dependencies: 249
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 36292346)
-- Dependencies: 251
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 36291915)
-- Dependencies: 228
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5697-953e-32fa-6f3fb7c079ff	00090000-5697-953e-e550-c00c54677d4d	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-953e-f67a-f92303b23f62	00090000-5697-953e-ada5-813a2e643638	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-953e-02f3-89297cc0191b	00090000-5697-953e-defd-ce518fb1a902	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-953e-c716-04d8c7a3c669	00090000-5697-953e-7a57-a6520f1daf80	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-953e-8b27-4c17e602cb88	00090000-5697-953e-ab76-0c66e1528aa2	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-953e-1c3f-1b5f213e0a34	00090000-5697-953e-a15d-bacb1e04e126	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3160 (class 0 OID 36291713)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 36292020)
-- Dependencies: 237
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5697-953b-af54-78e7c08be8f5	01	Drama	drama (SURS 01)
00140000-5697-953b-d264-662dd8672cf7	02	Opera	opera (SURS 02)
00140000-5697-953b-5b11-dc1f9e2c3877	03	Balet	balet (SURS 03)
00140000-5697-953b-ec50-d3b3cd2a154d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5697-953b-88fc-a39a9993dd81	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5697-953b-46d0-54d781494cc8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5697-953b-675e-cc8da24b4e7e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3183 (class 0 OID 36291905)
-- Dependencies: 227
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2608 (class 2606 OID 36291453)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 36292078)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 36292069)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 36291444)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 36291936)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 36291978)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 36292387)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 36291763)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 36291701)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 36291723)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 36291728)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 36292301)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 36291602)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 36292147)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 36291901)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 36291670)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 36291640)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 36291616)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 36291808)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 36292364)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 36292371)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2900 (class 2606 OID 36292395)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2758 (class 2606 OID 36291835)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 36291574)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 36291472)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 36291536)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 36291499)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 36291433)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2597 (class 2606 OID 36291418)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 36291841)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 36291877)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 36292015)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 36291527)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 36291562)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 36292252)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 36291814)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 36291552)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 36291686)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 36291658)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2675 (class 2606 OID 36291650)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 36291826)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 36292261)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 36292269)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 36292239)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 36292282)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 36291859)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 36291799)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 36291790)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 36292002)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 36291929)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 36291628)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 36291389)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 36291868)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 36291407)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2599 (class 2606 OID 36291427)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 36291886)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 36291821)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 36291747)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 36291377)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 36291365)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 36291359)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 36291949)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 36291508)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 36291755)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 36291773)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 36291989)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 36291461)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 36292294)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 36291736)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 36291587)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 36291402)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 36292048)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 36291676)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 36291849)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 36291961)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 36292344)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 36292328)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 36292352)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 36291919)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 36291717)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 36292028)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 36291913)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 1259 OID 36291711)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2692 (class 1259 OID 36291712)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2693 (class 1259 OID 36291710)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2694 (class 1259 OID 36291709)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2695 (class 1259 OID 36291708)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2801 (class 1259 OID 36291950)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2802 (class 1259 OID 36291951)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2803 (class 1259 OID 36291952)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2886 (class 1259 OID 36292366)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2887 (class 1259 OID 36292365)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2626 (class 1259 OID 36291529)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2627 (class 1259 OID 36291530)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2759 (class 1259 OID 36291842)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2873 (class 1259 OID 36292332)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2874 (class 1259 OID 36292331)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2875 (class 1259 OID 36292333)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2876 (class 1259 OID 36292330)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2877 (class 1259 OID 36292329)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2753 (class 1259 OID 36291828)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2754 (class 1259 OID 36291827)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2683 (class 1259 OID 36291677)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2684 (class 1259 OID 36291678)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2783 (class 1259 OID 36291902)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 36291904)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2785 (class 1259 OID 36291903)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 36291618)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 36291617)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 36292283)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2817 (class 1259 OID 36292017)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2818 (class 1259 OID 36292018)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2819 (class 1259 OID 36292019)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2883 (class 1259 OID 36292353)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2826 (class 1259 OID 36292053)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2827 (class 1259 OID 36292050)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2828 (class 1259 OID 36292054)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2829 (class 1259 OID 36292052)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2830 (class 1259 OID 36292051)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2648 (class 1259 OID 36291589)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 36291588)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 36291502)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2771 (class 1259 OID 36291869)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2601 (class 1259 OID 36291434)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2602 (class 1259 OID 36291435)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2776 (class 1259 OID 36291889)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2777 (class 1259 OID 36291888)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2778 (class 1259 OID 36291887)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2631 (class 1259 OID 36291539)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2632 (class 1259 OID 36291538)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2633 (class 1259 OID 36291540)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2671 (class 1259 OID 36291653)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2672 (class 1259 OID 36291651)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 36291652)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2581 (class 1259 OID 36291367)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2733 (class 1259 OID 36291794)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2734 (class 1259 OID 36291792)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2735 (class 1259 OID 36291791)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2736 (class 1259 OID 36291793)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 36291408)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 36291409)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2762 (class 1259 OID 36291850)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2896 (class 1259 OID 36292388)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2799 (class 1259 OID 36291938)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2800 (class 1259 OID 36291937)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2897 (class 1259 OID 36292396)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2898 (class 1259 OID 36292397)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2748 (class 1259 OID 36291815)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2793 (class 1259 OID 36291930)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2794 (class 1259 OID 36291931)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2846 (class 1259 OID 36292152)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2847 (class 1259 OID 36292151)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2848 (class 1259 OID 36292148)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2849 (class 1259 OID 36292149)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2850 (class 1259 OID 36292150)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2637 (class 1259 OID 36291554)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 36291553)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2639 (class 1259 OID 36291555)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2765 (class 1259 OID 36291863)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2766 (class 1259 OID 36291862)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2856 (class 1259 OID 36292262)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2857 (class 1259 OID 36292263)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2839 (class 1259 OID 36292082)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2840 (class 1259 OID 36292083)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2841 (class 1259 OID 36292080)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2842 (class 1259 OID 36292081)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2729 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2723 (class 1259 OID 36291764)
-- Name: idx_aab095ce1d25995; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce1d25995 ON dodatek USING btree (prisotnost_id);


--
-- TOC entry 2724 (class 1259 OID 36291765)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2789 (class 1259 OID 36291920)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2790 (class 1259 OID 36291921)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2739 (class 1259 OID 36291803)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2740 (class 1259 OID 36291802)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2741 (class 1259 OID 36291800)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2742 (class 1259 OID 36291801)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2836 (class 1259 OID 36292070)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2662 (class 1259 OID 36291629)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2665 (class 1259 OID 36291643)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2666 (class 1259 OID 36291642)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2667 (class 1259 OID 36291641)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 36291644)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2682 (class 1259 OID 36291671)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 36291659)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2677 (class 1259 OID 36291660)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2853 (class 1259 OID 36292253)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2872 (class 1259 OID 36292302)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2890 (class 1259 OID 36292372)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2891 (class 1259 OID 36292373)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 36291474)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 36291473)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2622 (class 1259 OID 36291509)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 36291510)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 36291718)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 36291758)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 36291757)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2718 (class 1259 OID 36291756)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 36291703)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2697 (class 1259 OID 36291704)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2698 (class 1259 OID 36291707)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2699 (class 1259 OID 36291702)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2700 (class 1259 OID 36291706)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2701 (class 1259 OID 36291705)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2630 (class 1259 OID 36291528)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 36291462)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 36291463)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2654 (class 1259 OID 36291603)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 36291605)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2656 (class 1259 OID 36291604)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2657 (class 1259 OID 36291606)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2747 (class 1259 OID 36291809)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2822 (class 1259 OID 36292016)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 36292049)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2813 (class 1259 OID 36291990)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2814 (class 1259 OID 36291991)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2620 (class 1259 OID 36291500)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 36291501)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2727 (class 1259 OID 36291774)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 36291775)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2786 (class 1259 OID 36291914)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 36291378)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 36291575)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2636 (class 1259 OID 36291537)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 36291366)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2869 (class 1259 OID 36292295)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2769 (class 1259 OID 36291861)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2770 (class 1259 OID 36291860)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 36291737)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 36291738)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2843 (class 1259 OID 36292079)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2732 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2644 (class 1259 OID 36291563)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 36292029)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2880 (class 1259 OID 36292345)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2862 (class 1259 OID 36292270)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2863 (class 1259 OID 36292271)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2810 (class 1259 OID 36291979)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2715 (class 1259 OID 36291748)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 36291428)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2940 (class 2606 OID 36292568)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2939 (class 2606 OID 36292573)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2934 (class 2606 OID 36292598)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2936 (class 2606 OID 36292588)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2941 (class 2606 OID 36292563)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2937 (class 2606 OID 36292583)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2935 (class 2606 OID 36292593)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2938 (class 2606 OID 36292578)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2981 (class 2606 OID 36292788)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2980 (class 2606 OID 36292793)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2979 (class 2606 OID 36292798)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 36292958)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 36292953)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 36292453)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2912 (class 2606 OID 36292458)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2962 (class 2606 OID 36292703)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3007 (class 2606 OID 36292938)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3008 (class 2606 OID 36292933)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3006 (class 2606 OID 36292943)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3009 (class 2606 OID 36292928)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 36292923)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2960 (class 2606 OID 36292698)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2961 (class 2606 OID 36292693)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2933 (class 2606 OID 36292553)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2932 (class 2606 OID 36292558)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2972 (class 2606 OID 36292743)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2970 (class 2606 OID 36292753)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2971 (class 2606 OID 36292748)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2922 (class 2606 OID 36292508)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2923 (class 2606 OID 36292503)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 36292683)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3004 (class 2606 OID 36292913)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2984 (class 2606 OID 36292803)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 36292808)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2982 (class 2606 OID 36292813)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3011 (class 2606 OID 36292948)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2986 (class 2606 OID 36292833)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 36292818)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2985 (class 2606 OID 36292838)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2987 (class 2606 OID 36292828)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2988 (class 2606 OID 36292823)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2920 (class 2606 OID 36292498)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2921 (class 2606 OID 36292493)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2908 (class 2606 OID 36292438)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2909 (class 2606 OID 36292433)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2966 (class 2606 OID 36292723)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2905 (class 2606 OID 36292413)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2904 (class 2606 OID 36292418)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2967 (class 2606 OID 36292738)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2968 (class 2606 OID 36292733)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2969 (class 2606 OID 36292728)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2915 (class 2606 OID 36292468)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2916 (class 2606 OID 36292463)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2914 (class 2606 OID 36292473)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2926 (class 2606 OID 36292533)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 36292523)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2927 (class 2606 OID 36292528)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2901 (class 2606 OID 36292398)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2950 (class 2606 OID 36292658)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2952 (class 2606 OID 36292648)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2953 (class 2606 OID 36292643)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2951 (class 2606 OID 36292653)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2903 (class 2606 OID 36292403)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 36292408)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2963 (class 2606 OID 36292708)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3016 (class 2606 OID 36292973)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 36292783)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 36292778)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3018 (class 2606 OID 36292978)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 36292983)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2959 (class 2606 OID 36292688)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2976 (class 2606 OID 36292768)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2975 (class 2606 OID 36292773)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2995 (class 2606 OID 36292888)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2996 (class 2606 OID 36292883)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 36292868)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2998 (class 2606 OID 36292873)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2997 (class 2606 OID 36292878)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2918 (class 2606 OID 36292483)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 36292478)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 36292488)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2964 (class 2606 OID 36292718)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2965 (class 2606 OID 36292713)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 36292898)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3001 (class 2606 OID 36292903)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2992 (class 2606 OID 36292858)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2991 (class 2606 OID 36292863)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2994 (class 2606 OID 36292848)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2993 (class 2606 OID 36292853)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2949 (class 2606 OID 36292633)
-- Name: fk_a8171cf610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT fk_a8171cf610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 36292638)
-- Name: fk_a8171cf65e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT fk_a8171cf65e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2947 (class 2606 OID 36292623)
-- Name: fk_aab095ce1d25995; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce1d25995 FOREIGN KEY (prisotnost_id) REFERENCES prisotnost(id);


--
-- TOC entry 2946 (class 2606 OID 36292628)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2974 (class 2606 OID 36292758)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 36292763)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2954 (class 2606 OID 36292678)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2955 (class 2606 OID 36292673)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2957 (class 2606 OID 36292663)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2956 (class 2606 OID 36292668)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2990 (class 2606 OID 36292843)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 36292513)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2925 (class 2606 OID 36292518)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 36292548)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2930 (class 2606 OID 36292538)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2929 (class 2606 OID 36292543)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3000 (class 2606 OID 36292893)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3003 (class 2606 OID 36292908)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 36292918)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3015 (class 2606 OID 36292963)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3014 (class 2606 OID 36292968)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2906 (class 2606 OID 36292428)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2907 (class 2606 OID 36292423)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2911 (class 2606 OID 36292443)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 36292448)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2942 (class 2606 OID 36292603)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 36292618)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 36292613)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2945 (class 2606 OID 36292608)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-14 13:32:01 CET

--
-- PostgreSQL database dump complete
--

