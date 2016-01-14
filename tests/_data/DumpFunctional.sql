--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-14 12:48:29 CET

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
-- TOC entry 183 (class 1259 OID 36234086)
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
-- TOC entry 240 (class 1259 OID 36234712)
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
-- TOC entry 239 (class 1259 OID 36234696)
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
-- TOC entry 182 (class 1259 OID 36234079)
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
-- TOC entry 181 (class 1259 OID 36234077)
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
-- TOC entry 230 (class 1259 OID 36234573)
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
-- TOC entry 233 (class 1259 OID 36234603)
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
-- TOC entry 254 (class 1259 OID 36235015)
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
-- TOC entry 210 (class 1259 OID 36234400)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    prisotnost_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 203 (class 1259 OID 36234328)
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
-- TOC entry 205 (class 1259 OID 36234360)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 36234365)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 36234937)
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
-- TOC entry 194 (class 1259 OID 36234231)
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
-- TOC entry 241 (class 1259 OID 36234725)
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
-- TOC entry 226 (class 1259 OID 36234531)
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
-- TOC entry 200 (class 1259 OID 36234302)
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
-- TOC entry 197 (class 1259 OID 36234271)
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
-- TOC entry 195 (class 1259 OID 36234248)
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
-- TOC entry 215 (class 1259 OID 36234445)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 252 (class 1259 OID 36234995)
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
-- TOC entry 253 (class 1259 OID 36235008)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 36235030)
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
-- TOC entry 219 (class 1259 OID 36234470)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 36234205)
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
-- TOC entry 185 (class 1259 OID 36234105)
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
-- TOC entry 189 (class 1259 OID 36234172)
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
-- TOC entry 186 (class 1259 OID 36234116)
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
-- TOC entry 178 (class 1259 OID 36234051)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 36234070)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 36234477)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 36234511)
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
-- TOC entry 236 (class 1259 OID 36234644)
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
-- TOC entry 188 (class 1259 OID 36234152)
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
-- TOC entry 191 (class 1259 OID 36234197)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 36234881)
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
-- TOC entry 216 (class 1259 OID 36234451)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 36234182)
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
-- TOC entry 202 (class 1259 OID 36234320)
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
-- TOC entry 198 (class 1259 OID 36234286)
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
-- TOC entry 199 (class 1259 OID 36234295)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 36234417)
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
-- TOC entry 218 (class 1259 OID 36234463)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 36234895)
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
-- TOC entry 245 (class 1259 OID 36234905)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 36234794)
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
-- TOC entry 246 (class 1259 OID 36234913)
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
-- TOC entry 222 (class 1259 OID 36234492)
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
-- TOC entry 214 (class 1259 OID 36234436)
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
-- TOC entry 213 (class 1259 OID 36234426)
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
-- TOC entry 235 (class 1259 OID 36234633)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 36234563)
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
-- TOC entry 196 (class 1259 OID 36234260)
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
-- TOC entry 175 (class 1259 OID 36234022)
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
-- TOC entry 174 (class 1259 OID 36234020)
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
-- TOC entry 223 (class 1259 OID 36234505)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 36234060)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 36234044)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 36234519)
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
-- TOC entry 217 (class 1259 OID 36234457)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 36234380)
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
-- TOC entry 173 (class 1259 OID 36234009)
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
-- TOC entry 172 (class 1259 OID 36234001)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 36233996)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 231 (class 1259 OID 36234580)
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
-- TOC entry 187 (class 1259 OID 36234144)
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
-- TOC entry 209 (class 1259 OID 36234390)
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
-- TOC entry 211 (class 1259 OID 36234407)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 234 (class 1259 OID 36234621)
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
-- TOC entry 184 (class 1259 OID 36234095)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 247 (class 1259 OID 36234925)
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
-- TOC entry 207 (class 1259 OID 36234370)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 36234217)
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
-- TOC entry 176 (class 1259 OID 36234031)
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
-- TOC entry 238 (class 1259 OID 36234671)
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
-- TOC entry 201 (class 1259 OID 36234313)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 221 (class 1259 OID 36234484)
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
-- TOC entry 232 (class 1259 OID 36234594)
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
-- TOC entry 250 (class 1259 OID 36234975)
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
-- TOC entry 249 (class 1259 OID 36234944)
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
-- TOC entry 251 (class 1259 OID 36234987)
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
-- TOC entry 228 (class 1259 OID 36234556)
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
-- TOC entry 204 (class 1259 OID 36234354)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 237 (class 1259 OID 36234661)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 227 (class 1259 OID 36234546)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2252 (class 2604 OID 36234082)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 36234025)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3139 (class 0 OID 36234086)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5697-8b09-fba7-b28b3d35c310	10	30	Otroci	Abonma za otroke	200
000a0000-5697-8b09-9b2e-ef9c6bf2e689	20	60	Mladina	Abonma za mladino	400
000a0000-5697-8b09-3b37-28a119a79393	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3196 (class 0 OID 36234712)
-- Dependencies: 240
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5697-8b0a-e066-128d6c8a6793	000d0000-5697-8b0a-0a9a-dea9a2a3ff12	\N	00090000-5697-8b09-cd76-f25e6c9d7844	000b0000-5697-8b09-d5b2-b0d5405d9c7c	0001	f	\N	\N	\N	3	t	t	t
000c0000-5697-8b0a-a516-e79581fc0dec	000d0000-5697-8b0a-d1bd-aedd2ee6dacd	00100000-5697-8b09-2686-b182c8b36f47	00090000-5697-8b09-8aef-49ee70ab18e0	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5697-8b0a-69a7-ab1aa6bf2fe9	000d0000-5697-8b0a-c95c-975c6210d131	00100000-5697-8b09-c452-e27f78bd6d32	00090000-5697-8b09-a484-b1cc011b60eb	\N	0003	t	\N	2016-01-14	\N	2	t	f	f
000c0000-5697-8b0a-3acb-e17115fae43d	000d0000-5697-8b0a-abae-3fbf98161464	\N	00090000-5697-8b09-d7b2-92820ee7fc92	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5697-8b0a-ed44-6d7324f53248	000d0000-5697-8b0a-8d5f-d15258e4f952	\N	00090000-5697-8b09-6ae8-815d581e1541	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5697-8b0a-1c80-9636ee665b37	000d0000-5697-8b0a-0dbf-deeebc47cf9e	\N	00090000-5697-8b09-4f53-9544a86e8966	000b0000-5697-8b09-7076-53882d5b1720	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5697-8b0a-7bb4-5a127af7ed65	000d0000-5697-8b0a-a69e-cbb3039d7184	00100000-5697-8b09-0b62-57e0b8b544f3	00090000-5697-8b09-93e0-9fe337fca174	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5697-8b0a-516c-b5a8c1285466	000d0000-5697-8b0a-0f68-6a0f0311b800	\N	00090000-5697-8b09-f1a3-e9f076cd35ac	000b0000-5697-8b09-e254-daeae6fe0c00	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5697-8b0a-775b-5769087ea384	000d0000-5697-8b0a-a69e-cbb3039d7184	00100000-5697-8b09-ed0c-c387143613d4	00090000-5697-8b09-a20f-29bca03c0dbe	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5697-8b0a-64b3-6bdbe65ce6dc	000d0000-5697-8b0a-a69e-cbb3039d7184	00100000-5697-8b09-18b8-47c79f9ae8d8	00090000-5697-8b09-2262-6f6111feadc2	\N	0010	t	\N	2016-01-14	\N	16	f	f	t
000c0000-5697-8b0a-f8d6-dfa0e823d7d8	000d0000-5697-8b0a-a69e-cbb3039d7184	00100000-5697-8b09-40eb-57cac78624be	00090000-5697-8b09-6857-4232c87d013e	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5697-8b0a-e41a-332c42bf742a	000d0000-5697-8b0a-469b-a9eefe150ea8	00100000-5697-8b09-2686-b182c8b36f47	00090000-5697-8b09-8aef-49ee70ab18e0	000b0000-5697-8b09-ac13-3cd04e9fdd8e	0012	t	\N	\N	\N	2	t	t	t
000c0000-5697-8b0a-fea0-d9ec8ecffe36	000d0000-5697-8b0a-7f0e-89362113f9ea	\N	00090000-5697-8b09-f1a3-e9f076cd35ac	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-5b32-a9d6d3a4be94	000d0000-5697-8b0a-7f0e-89362113f9ea	\N	00090000-5697-8b09-1b5d-edfb5f15d247	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5697-8b0a-5fca-772f2dfdea43	000d0000-5697-8b0a-c1aa-dbbcb60c7013	00100000-5697-8b09-c452-e27f78bd6d32	00090000-5697-8b09-a484-b1cc011b60eb	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-f7e6-a82f8c8032ed	000d0000-5697-8b0a-c1aa-dbbcb60c7013	\N	00090000-5697-8b09-1b5d-edfb5f15d247	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5697-8b0a-ac02-ac65bd2cc003	000d0000-5697-8b0a-8168-6f2f55c161c4	\N	00090000-5697-8b09-1b5d-edfb5f15d247	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-d5f0-6902c10b34f8	000d0000-5697-8b0a-8168-6f2f55c161c4	\N	00090000-5697-8b09-f1a3-e9f076cd35ac	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5697-8b0a-772e-d73583675378	000d0000-5697-8b0a-6b4f-348bb3524a8e	00100000-5697-8b09-0b62-57e0b8b544f3	00090000-5697-8b09-93e0-9fe337fca174	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-3291-62ee967ecc0d	000d0000-5697-8b0a-6b4f-348bb3524a8e	\N	00090000-5697-8b09-1b5d-edfb5f15d247	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5697-8b0a-f765-85d810b95830	000d0000-5697-8b0a-0c68-78fb399c4fed	\N	00090000-5697-8b09-1b5d-edfb5f15d247	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-fb2f-ae39fc148d2b	000d0000-5697-8b0a-0c68-78fb399c4fed	00100000-5697-8b09-0b62-57e0b8b544f3	00090000-5697-8b09-93e0-9fe337fca174	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5697-8b0a-9d46-e5c51c05ec6d	000d0000-5697-8b0a-91b4-0120784de2f3	\N	00090000-5697-8b09-1b5d-edfb5f15d247	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-df08-019e2fc849a2	000d0000-5697-8b0a-251a-447bb6305380	\N	00090000-5697-8b09-f1a3-e9f076cd35ac	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-09c2-6c6b9d9e9e66	000d0000-5697-8b0a-1bbf-6e2ee152e95a	\N	00090000-5697-8b09-f1a3-e9f076cd35ac	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-f0f6-1cad8fcfef2a	000d0000-5697-8b0a-1bbf-6e2ee152e95a	00100000-5697-8b09-c452-e27f78bd6d32	00090000-5697-8b09-a484-b1cc011b60eb	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5697-8b0a-c773-55c298e41a86	000d0000-5697-8b0a-0383-58b7ebcc5fe4	\N	00090000-5697-8b09-32f4-4e7a737af132	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5697-8b0a-f7d4-c1e5369aaec5	000d0000-5697-8b0a-0383-58b7ebcc5fe4	\N	00090000-5697-8b09-61af-a076d144d6e7	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5697-8b0a-5005-b9643808e4c2	000d0000-5697-8b0a-27f6-32f607cc70f8	\N	00090000-5697-8b09-f1a3-e9f076cd35ac	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5697-8b0a-cd61-721c9e712e79	000d0000-5697-8b0a-27f6-32f607cc70f8	00100000-5697-8b09-c452-e27f78bd6d32	00090000-5697-8b09-a484-b1cc011b60eb	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5697-8b0a-cd43-9e0d26753c8a	000d0000-5697-8b0a-27f6-32f607cc70f8	\N	00090000-5697-8b09-61af-a076d144d6e7	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5697-8b0a-51bf-743c06b6a2f0	000d0000-5697-8b0a-27f6-32f607cc70f8	\N	00090000-5697-8b09-32f4-4e7a737af132	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5697-8b0a-4a04-00dae387fa74	000d0000-5697-8b0a-83de-d7553b844e45	\N	00090000-5697-8b09-f1a3-e9f076cd35ac	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5697-8b0a-fd3a-40f7300a76c1	000d0000-5697-8b0a-dfa4-8590e8ce33e0	00100000-5697-8b09-c452-e27f78bd6d32	00090000-5697-8b09-a484-b1cc011b60eb	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5697-8b0a-f8b7-0e79a8c199e8	000d0000-5697-8b0a-dfa4-8590e8ce33e0	\N	00090000-5697-8b09-1b5d-edfb5f15d247	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3195 (class 0 OID 36234696)
-- Dependencies: 239
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 36234079)
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
-- TOC entry 3186 (class 0 OID 36234573)
-- Dependencies: 230
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5697-8b09-6429-b3b0dc4cc160	00160000-5697-8b09-468f-6b0dc49a6d82	00090000-5697-8b09-61af-a076d144d6e7	aizv	10	t
003d0000-5697-8b09-4f26-d0b2e9ad3c62	00160000-5697-8b09-468f-6b0dc49a6d82	00090000-5697-8b09-590c-9fad944e2e1d	apri	14	t
003d0000-5697-8b09-b593-2f7e481892af	00160000-5697-8b09-c928-f70267267273	00090000-5697-8b09-32f4-4e7a737af132	aizv	11	t
003d0000-5697-8b0a-f7b4-8827f0234328	00160000-5697-8b09-e465-1326c333acb4	00090000-5697-8b09-81b1-2f53cc915b69	aizv	12	t
003d0000-5697-8b0a-17a1-e0423c4aab78	00160000-5697-8b09-468f-6b0dc49a6d82	00090000-5697-8b09-1b5d-edfb5f15d247	apri	18	f
\.


--
-- TOC entry 3189 (class 0 OID 36234603)
-- Dependencies: 233
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5697-8b09-468f-6b0dc49a6d82	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5697-8b09-c928-f70267267273	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5697-8b09-e465-1326c333acb4	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3210 (class 0 OID 36235015)
-- Dependencies: 254
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 36234400)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, prisotnost_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 36234328)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5697-8b0a-851a-bda53ca489da	\N	\N	00200000-5697-8b0a-590d-4d79fc98f882	\N	\N	\N	00220000-5697-8b09-cce1-e8da58b37423	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5697-8b0a-e133-64368e846cbc	\N	\N	00200000-5697-8b0a-1181-806e5e31176c	\N	\N	\N	00220000-5697-8b09-cce1-e8da58b37423	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5697-8b0a-65dc-b8208b7f7d13	\N	\N	00200000-5697-8b0a-16f6-c7099b1339d3	\N	\N	\N	00220000-5697-8b09-b518-003504c6d132	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5697-8b0a-4d4c-316f2357f1d3	\N	\N	00200000-5697-8b0a-0c82-07628b0205b9	\N	\N	\N	00220000-5697-8b09-9379-94a9757d05de	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5697-8b0a-18bd-54e8bf880abc	\N	\N	00200000-5697-8b0a-7629-0b787b1386e7	\N	\N	\N	00220000-5697-8b09-692c-4536bbaac7c5	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3161 (class 0 OID 36234360)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 36234365)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 36234937)
-- Dependencies: 248
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 36234231)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5697-8b06-c695-f8e82e411687	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5697-8b06-930b-4804a8bd9498	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5697-8b06-f6ab-b8af2282d443	AL	ALB	008	Albania 	Albanija	\N
00040000-5697-8b06-d703-47e2c4d19a7e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5697-8b06-0524-bfa642c6d8f8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5697-8b06-36d6-0b728728cfa2	AD	AND	020	Andorra 	Andora	\N
00040000-5697-8b06-8730-514723041810	AO	AGO	024	Angola 	Angola	\N
00040000-5697-8b06-f077-29148e567c9a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5697-8b06-3a97-5e869f48533c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5697-8b06-13c6-fc44a869bac6	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-8b06-7b5e-6e0a14c79dca	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5697-8b06-2ca2-980c2d84090e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5697-8b06-2e37-49f3c249c459	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5697-8b06-3f5b-4443bb8655e9	AU	AUS	036	Australia 	Avstralija	\N
00040000-5697-8b06-a48f-026d2fb06248	AT	AUT	040	Austria 	Avstrija	\N
00040000-5697-8b06-2bda-56c0bf14736d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5697-8b06-cab2-cc1ff9065934	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5697-8b06-5ddf-7f1558ae95a3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5697-8b06-8cf7-d40d639fbcf2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5697-8b06-b002-1dec7f68d62c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5697-8b06-6731-efaf89794bdf	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5697-8b06-d8c5-9438abeab109	BE	BEL	056	Belgium 	Belgija	\N
00040000-5697-8b06-4793-7e2b380960ca	BZ	BLZ	084	Belize 	Belize	\N
00040000-5697-8b06-515c-1a4d57c4223c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5697-8b06-e99c-a3e54018abee	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5697-8b06-96da-90ea9c75af04	BT	BTN	064	Bhutan 	Butan	\N
00040000-5697-8b06-7882-76dae7dc23d3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5697-8b06-7caf-5c0aaadb3374	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5697-8b06-0c55-67c9b676e632	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5697-8b06-352e-d5adadee3a05	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5697-8b06-7a5d-8b9290f541a6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5697-8b06-91f1-3582a8bde583	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5697-8b06-e91c-3cfdc036badb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5697-8b06-13ea-0343ef7d4fe5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5697-8b06-6958-4f2e8164aed3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5697-8b06-f352-dc640dbf6ecb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5697-8b06-8da7-ad13edef83a0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5697-8b06-8c3b-501183136468	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5697-8b06-a641-314e207744e8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5697-8b06-bb63-b7a4f0d6a2d5	CA	CAN	124	Canada 	Kanada	\N
00040000-5697-8b06-4121-492ea6e8eae0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5697-8b06-e16b-e0ce1b44e897	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5697-8b06-015f-1bd2c115a8b9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5697-8b06-486a-72b0fa5a71f3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5697-8b06-0048-8289a1af38dc	CL	CHL	152	Chile 	Čile	\N
00040000-5697-8b06-c2ec-05ff7da29799	CN	CHN	156	China 	Kitajska	\N
00040000-5697-8b06-9ca4-db1d011324bc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5697-8b06-5ad0-fa7b980c0ebf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5697-8b06-5cff-6f8cd96ed209	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5697-8b06-8dc7-d29a992090b3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5697-8b06-169c-2eaa45fedde7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5697-8b06-ac7e-7c6f268b4650	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5697-8b06-3f3b-63810c9e2ae4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5697-8b06-77ba-bf035ae9a88a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5697-8b06-3746-535cbb509f6f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5697-8b06-1042-0b817d85de9a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5697-8b06-7ee6-3a18e18c4644	CU	CUB	192	Cuba 	Kuba	\N
00040000-5697-8b06-36c4-9a10012ca758	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5697-8b06-4ba2-7fe639d9d6c7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5697-8b06-209b-7939e57422e7	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5697-8b06-624c-7554c94b1b64	DK	DNK	208	Denmark 	Danska	\N
00040000-5697-8b06-91d8-43c276011fbe	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5697-8b06-4f00-424b6d483c66	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-8b06-31b4-7e42e671c7d2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5697-8b06-a27e-4c4be8577554	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5697-8b06-3f0d-bac327d85280	EG	EGY	818	Egypt 	Egipt	\N
00040000-5697-8b06-03ee-3bac2e20d221	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5697-8b06-23ce-c6bbc43aad32	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5697-8b06-b4e1-7d73662eb173	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5697-8b06-fbdb-024de801f762	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5697-8b06-f8bf-0654c19d9433	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5697-8b06-43c8-4ed23a1d8b28	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5697-8b06-9b5e-fa1943f5ccf0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5697-8b06-4273-81dc289c56a8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5697-8b06-0799-e7611adbcb26	FI	FIN	246	Finland 	Finska	\N
00040000-5697-8b06-3712-9e93ac431309	FR	FRA	250	France 	Francija	\N
00040000-5697-8b06-c653-942f4a5da8fd	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5697-8b06-253f-ad8db99ea9c0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5697-8b06-dd77-db1ea5e38a3d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5697-8b06-a09c-b3d7470a89ff	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5697-8b06-0ae9-c2100a62c157	GA	GAB	266	Gabon 	Gabon	\N
00040000-5697-8b06-d09c-fcfc4539e324	GM	GMB	270	Gambia 	Gambija	\N
00040000-5697-8b06-d0db-1508757f5180	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5697-8b06-222c-2f70089bb379	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5697-8b06-1487-6770916a85f1	GH	GHA	288	Ghana 	Gana	\N
00040000-5697-8b06-bdf6-a23d97f68253	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5697-8b06-0517-6e5a600c9163	GR	GRC	300	Greece 	Grčija	\N
00040000-5697-8b06-fd7e-210d079a0b24	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5697-8b06-9386-abf843dd9867	GD	GRD	308	Grenada 	Grenada	\N
00040000-5697-8b06-abbb-a33d86a65433	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5697-8b06-89ec-dce0caffe629	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5697-8b06-4165-139e504c9940	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5697-8b06-9b10-fe459a015543	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5697-8b06-d335-2d1887028885	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5697-8b06-5a38-3ceab43b0988	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5697-8b06-28b5-ce3841299eaf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5697-8b06-42f0-355ba0c5aeaf	HT	HTI	332	Haiti 	Haiti	\N
00040000-5697-8b06-4f42-729ba04191ce	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5697-8b06-b4bf-7fb4e5b070cd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5697-8b06-5a8a-5eda5799a3d0	HN	HND	340	Honduras 	Honduras	\N
00040000-5697-8b06-2b51-34150659de03	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5697-8b06-32c8-f0e9c23aa024	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5697-8b06-95b6-a9d56d4a50e5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5697-8b06-8d06-9f2bae683ce7	IN	IND	356	India 	Indija	\N
00040000-5697-8b06-7740-53badc621fdd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5697-8b06-80ce-2b3783502097	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5697-8b06-0d2f-85325cdaac33	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5697-8b06-922a-aaff51aa39e8	IE	IRL	372	Ireland 	Irska	\N
00040000-5697-8b06-0eea-37177a5263b1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5697-8b06-d39d-032fdfe1c792	IL	ISR	376	Israel 	Izrael	\N
00040000-5697-8b06-7da5-0da01253f74e	IT	ITA	380	Italy 	Italija	\N
00040000-5697-8b06-f0e1-57d2e0c274cb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5697-8b06-7a8c-8c62675d3251	JP	JPN	392	Japan 	Japonska	\N
00040000-5697-8b06-3790-550a29114ac3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5697-8b06-4f29-cd25685eb32e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5697-8b06-ac3b-c36cb5e85e2c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5697-8b06-4718-0c92981b5f7b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5697-8b06-3dba-c217e2aa117c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5697-8b06-17f7-4c4c06d5970d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5697-8b06-6a47-9a069ad76f26	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5697-8b06-e0f6-9b5fc29c2a50	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5697-8b06-673b-58d1ed2a6a42	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5697-8b06-88e5-f3e7ce737189	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5697-8b06-f8db-004aad41d56f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5697-8b06-fcb6-0524a0c2373c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5697-8b06-99f0-42084fd33022	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5697-8b06-9c2b-6d1bf2054497	LR	LBR	430	Liberia 	Liberija	\N
00040000-5697-8b06-e6a7-1d6552f221dd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5697-8b06-30e3-da1f1d6154e0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5697-8b06-5309-b2fd64137ebd	LT	LTU	440	Lithuania 	Litva	\N
00040000-5697-8b06-b19d-5e5387046686	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5697-8b06-a501-6c12a0e2aa76	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5697-8b06-1074-4d404058035e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5697-8b06-9851-412f5350d38e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5697-8b06-1032-f64fa12faee4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5697-8b06-5120-bb3b2bf3dc0d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5697-8b06-a443-a17170b1357e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5697-8b06-b56d-c7fa80b4b101	ML	MLI	466	Mali 	Mali	\N
00040000-5697-8b06-b7b2-172a7ac6ab46	MT	MLT	470	Malta 	Malta	\N
00040000-5697-8b06-d9f2-ea7d121af8a3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5697-8b06-cae5-e9e039e884bc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5697-8b06-3821-3a391c2a756c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5697-8b06-2ffc-b2907711492a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5697-8b06-a010-f0772da5d306	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5697-8b06-1a90-c18b939ea044	MX	MEX	484	Mexico 	Mehika	\N
00040000-5697-8b06-49c2-e2c846127700	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5697-8b06-8d89-d38ae8198845	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5697-8b06-a208-295c51f1310a	MC	MCO	492	Monaco 	Monako	\N
00040000-5697-8b06-7904-9d3d80bb86e6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5697-8b06-c17b-795fb3c17434	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5697-8b06-c654-a3b4b9e42d11	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5697-8b06-8003-a8bf591eabee	MA	MAR	504	Morocco 	Maroko	\N
00040000-5697-8b06-6c04-2d3062f95bf3	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5697-8b06-f49d-828220706d25	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5697-8b06-c54d-35eb649a6d89	NA	NAM	516	Namibia 	Namibija	\N
00040000-5697-8b06-d875-76ea59588428	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5697-8b06-9597-70b8bc5d7bfc	NP	NPL	524	Nepal 	Nepal	\N
00040000-5697-8b06-9a6a-30a604bbcd53	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5697-8b06-0658-a4aea9e57ac7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5697-8b06-131c-ecd767c775c4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5697-8b06-daae-8ada37f9175d	NE	NER	562	Niger 	Niger 	\N
00040000-5697-8b06-3f72-b8e8e1c9f09c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5697-8b06-2373-dccbaa88e631	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5697-8b06-7dc9-576de335d7c8	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5697-8b06-94f3-b7f3f33841a7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5697-8b06-674e-e07f47251ac2	NO	NOR	578	Norway 	Norveška	\N
00040000-5697-8b06-48b7-96965d8a59cd	OM	OMN	512	Oman 	Oman	\N
00040000-5697-8b06-b4a6-ee2b8b097ddb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5697-8b06-e4f2-fb3f4f811ebd	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5697-8b06-83f4-776f118ed72b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5697-8b06-90f5-b760893c09d7	PA	PAN	591	Panama 	Panama	\N
00040000-5697-8b06-9999-4b8d5b49a8d1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5697-8b06-878d-3e938fe281b7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5697-8b06-d1cd-0c691034a1c4	PE	PER	604	Peru 	Peru	\N
00040000-5697-8b06-fbcd-b47bba152542	PH	PHL	608	Philippines 	Filipini	\N
00040000-5697-8b06-d51e-1137e8ceba35	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5697-8b06-2cbc-cab3d1fd9d69	PL	POL	616	Poland 	Poljska	\N
00040000-5697-8b06-95b3-8b1e84c1294d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5697-8b06-3f55-9f08a0a090e0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5697-8b06-28b0-916063ce7d11	QA	QAT	634	Qatar 	Katar	\N
00040000-5697-8b06-4193-cfbb824100a5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5697-8b06-fbb6-050db22afa42	RO	ROU	642	Romania 	Romunija	\N
00040000-5697-8b06-99a0-b4466d25daab	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5697-8b06-7f16-4cf571d3299d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5697-8b06-0f98-3a7f199eef2a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5697-8b06-4fa6-7a2bed99291d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5697-8b06-25ff-1635d150bb1f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5697-8b06-1e92-8e38696c07ad	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5697-8b06-4d6e-fce7be16ab84	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5697-8b06-64e2-6321240d0ca9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5697-8b06-1282-214884de6138	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5697-8b06-508b-01f60a68dc8c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5697-8b06-143d-fefe3127f37a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5697-8b06-2fb2-54a481ae82b2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5697-8b06-205f-e922e356c8ee	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5697-8b06-3fde-e632606c0248	SN	SEN	686	Senegal 	Senegal	\N
00040000-5697-8b06-356c-890c609a8b4d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5697-8b06-ddbb-fabf0c49056c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5697-8b06-fa28-4876fe2b02b5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5697-8b06-91a9-c5de668f8837	SG	SGP	702	Singapore 	Singapur	\N
00040000-5697-8b06-bf74-344348c02a2a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5697-8b06-45d1-574a1f820fff	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5697-8b06-53a8-3306f2689853	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5697-8b06-596a-1438958f6bea	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5697-8b06-5ca5-73a0578c407b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5697-8b06-b792-115b3bd311da	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5697-8b06-08d4-ab26d6e53d21	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5697-8b06-b785-33db1f42bea5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5697-8b06-4ce4-73998cd71b4c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5697-8b06-9a4b-5c9277a08642	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5697-8b06-255e-da49fea3f89c	SD	SDN	729	Sudan 	Sudan	\N
00040000-5697-8b06-03a2-ea3a1532483e	SR	SUR	740	Suriname 	Surinam	\N
00040000-5697-8b06-b5e2-2c8f1b5e1a6e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5697-8b06-bbf5-7270f8e8dc13	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5697-8b06-3872-781a3afadace	SE	SWE	752	Sweden 	Švedska	\N
00040000-5697-8b06-7711-77a3ae993102	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5697-8b06-a40d-8c1f6e7c098e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5697-8b06-2738-217502a676e0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5697-8b06-bea7-9bc81db3fc2b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5697-8b06-7102-0f27f2c74edb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5697-8b06-13c1-264a84998d19	TH	THA	764	Thailand 	Tajska	\N
00040000-5697-8b06-04c2-e33290b8151e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5697-8b06-82cb-f080ddb6b3e1	TG	TGO	768	Togo 	Togo	\N
00040000-5697-8b06-bf48-b172dd7413e4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5697-8b06-51b8-7e2d5cfb73af	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5697-8b06-92f0-43db8b1026dd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5697-8b06-577d-c4f93ee3f89a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5697-8b06-a5d7-c35784527d3c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5697-8b06-8086-814f048f723c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5697-8b06-84d4-1305160c76ca	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-8b06-bede-57f81ccb1738	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5697-8b06-245c-a9d0ed08aa70	UG	UGA	800	Uganda 	Uganda	\N
00040000-5697-8b06-4e34-3e982817ce2c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5697-8b06-66ca-82d94d496cac	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5697-8b06-3352-c6e0ff7f1e59	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5697-8b06-331b-5cc2582b38d6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5697-8b06-e05c-7fd5b75f9f26	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5697-8b06-854f-7c3000e6a129	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5697-8b06-0893-9ad21f0aa27c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5697-8b06-547b-29f4fc322f7a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5697-8b06-7e9c-dd98ba454829	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5697-8b06-bf0a-e36c1429b043	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5697-8b06-c016-1b32d6ef56ca	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-8b06-a140-8a3ce800576d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5697-8b06-9332-c6acf4365a63	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5697-8b06-f6dc-3a4d855304dd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5697-8b06-7936-0830f7c51248	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5697-8b06-fef7-6425d9102813	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5697-8b06-56df-49573576407a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3197 (class 0 OID 36234725)
-- Dependencies: 241
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5697-8b0a-f945-d962c7a669bf	000e0000-5697-8b0a-2654-c6f4aa950555	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-8b06-e9fd-f2dd90683d64	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-8b0a-0da6-1bedf84116ec	000e0000-5697-8b0a-be0b-8c9791c2ba27	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-8b06-4a19-520100a0cad8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-8b0a-23fd-51f2d62fbecf	000e0000-5697-8b0a-5de2-82ccc4ee5ff1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-8b06-e9fd-f2dd90683d64	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-8b0a-27e8-8e1a43f91785	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-8b0a-9aaf-7b835f824639	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3182 (class 0 OID 36234531)
-- Dependencies: 226
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5697-8b0a-c829-ed8175f64240	000e0000-5697-8b0a-5b45-cd095e402952	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-8b06-c23c-cff4f882ed5f
000d0000-5697-8b0a-c29f-54348a881548	000e0000-5697-8b0a-5b45-cd095e402952	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-0a9a-dea9a2a3ff12	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-e066-128d6c8a6793	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-8b06-c23c-cff4f882ed5f
000d0000-5697-8b0a-d1bd-aedd2ee6dacd	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-a516-e79581fc0dec	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-c95c-975c6210d131	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-69a7-ab1aa6bf2fe9	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5697-8b06-212a-f6df38a5a4f0
000d0000-5697-8b0a-abae-3fbf98161464	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-3acb-e17115fae43d	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5697-8b06-a19c-e121a2f6f74c
000d0000-5697-8b0a-8d5f-d15258e4f952	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-ed44-6d7324f53248	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5697-8b06-a19c-e121a2f6f74c
000d0000-5697-8b0a-0dbf-deeebc47cf9e	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-1c80-9636ee665b37	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-8b06-c23c-cff4f882ed5f
000d0000-5697-8b0a-a69e-cbb3039d7184	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-775b-5769087ea384	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5697-8b06-c23c-cff4f882ed5f
000d0000-5697-8b0a-0f68-6a0f0311b800	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-516c-b5a8c1285466	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5697-8b06-ce6c-6d17cae4bcab
000d0000-5697-8b0a-469b-a9eefe150ea8	000e0000-5697-8b0a-be0b-8c9791c2ba27	000c0000-5697-8b0a-e41a-332c42bf742a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5697-8b06-204a-917ab1b0faf7
000d0000-5697-8b0a-7f0e-89362113f9ea	000e0000-5697-8b0a-902a-6db4ba92812f	000c0000-5697-8b0a-fea0-d9ec8ecffe36	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-c1aa-dbbcb60c7013	000e0000-5697-8b0a-3c5d-fa89b393d418	000c0000-5697-8b0a-5fca-772f2dfdea43	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-8168-6f2f55c161c4	000e0000-5697-8b0a-3c5d-fa89b393d418	000c0000-5697-8b0a-ac02-ac65bd2cc003	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-6b4f-348bb3524a8e	000e0000-5697-8b0a-59d3-ab5096b93147	000c0000-5697-8b0a-772e-d73583675378	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-0c68-78fb399c4fed	000e0000-5697-8b0a-d7ed-03717daac86e	000c0000-5697-8b0a-f765-85d810b95830	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-91b4-0120784de2f3	000e0000-5697-8b0a-fcb8-ada74cf1c20f	000c0000-5697-8b0a-9d46-e5c51c05ec6d	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-251a-447bb6305380	000e0000-5697-8b0a-dfad-f1f81502afab	000c0000-5697-8b0a-df08-019e2fc849a2	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-1bbf-6e2ee152e95a	000e0000-5697-8b0a-a87d-df35d624e0bb	000c0000-5697-8b0a-09c2-6c6b9d9e9e66	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-0383-58b7ebcc5fe4	000e0000-5697-8b0a-9092-144686a40dda	000c0000-5697-8b0a-c773-55c298e41a86	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-27f6-32f607cc70f8	000e0000-5697-8b0a-9092-144686a40dda	000c0000-5697-8b0a-5005-b9643808e4c2	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-83de-d7553b844e45	000e0000-5697-8b0a-4c01-1f730048fb1c	000c0000-5697-8b0a-4a04-00dae387fa74	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
000d0000-5697-8b0a-dfa4-8590e8ce33e0	000e0000-5697-8b0a-4c01-1f730048fb1c	000c0000-5697-8b0a-fd3a-40f7300a76c1	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5697-8b06-da5f-7841453b995c
\.


--
-- TOC entry 3156 (class 0 OID 36234302)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 36234271)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 36234248)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5697-8b09-988a-3055ae3614dd	00080000-5697-8b09-e031-63a8e59ce697	00090000-5697-8b09-2262-6f6111feadc2	AK		igralka
\.


--
-- TOC entry 3171 (class 0 OID 36234445)
-- Dependencies: 215
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 36234995)
-- Dependencies: 252
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5697-8b09-485c-f3e5cb95ddd9	00010000-5697-8b07-de14-6faf2629558a	\N	Prva mapa	Root mapa	2016-01-14 12:48:25	2016-01-14 12:48:25	R	\N	\N
\.


--
-- TOC entry 3209 (class 0 OID 36235008)
-- Dependencies: 253
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 36235030)
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
-- TOC entry 3175 (class 0 OID 36234470)
-- Dependencies: 219
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 36234205)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5697-8b07-6c4e-22e3f705665a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5697-8b07-5be1-1ece4dca2670	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5697-8b07-31a1-bfff7ad12374	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5697-8b07-4939-725e9885a806	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5697-8b07-b725-00e8dcfd3ab2	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5697-8b07-13ff-2bc49f44fd9d	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5697-8b07-ca0b-c07a80af83ae	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5697-8b07-b414-ea007488ebed	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-8b07-542b-d44da5c80f18	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-8b07-792a-df46d7ac769d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5697-8b07-d002-6dbe6e4f7b2f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5697-8b07-a640-5f48737f5610	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5697-8b07-d42e-e39f41b15037	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5697-8b07-7d9c-a99fcdde2974	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5697-8b09-8ec0-869209e71d31	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5697-8b09-c533-be0e3b93753f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5697-8b09-eefe-02d5ace2a03f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5697-8b09-77ea-b92607b10c48	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5697-8b09-9b66-a7683966f0bc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5697-8b0b-5e4f-30668518b48a	application.tenant.maticnopodjetje	string	s:36:"00080000-5697-8b0b-1a83-722d0df9b8a8";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3141 (class 0 OID 36234105)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5697-8b09-b8c3-ccf625eb0c50	00000000-5697-8b09-8ec0-869209e71d31	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5697-8b09-4458-28deeb5a3756	00000000-5697-8b09-8ec0-869209e71d31	00010000-5697-8b07-de14-6faf2629558a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5697-8b09-317c-5a122b5bfc89	00000000-5697-8b09-c533-be0e3b93753f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3145 (class 0 OID 36234172)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5697-8b09-b02c-2a4d6ae16a88	\N	00100000-5697-8b09-2686-b182c8b36f47	00100000-5697-8b09-c452-e27f78bd6d32	01	Gledališče Nimbis
00410000-5697-8b09-1e79-ce7bd1b8f723	00410000-5697-8b09-b02c-2a4d6ae16a88	00100000-5697-8b09-2686-b182c8b36f47	00100000-5697-8b09-c452-e27f78bd6d32	02	Tehnika
\.


--
-- TOC entry 3142 (class 0 OID 36234116)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5697-8b09-cd76-f25e6c9d7844	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5697-8b09-d7b2-92820ee7fc92	00010000-5697-8b09-2753-269ae3c5fb6e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5697-8b09-a484-b1cc011b60eb	00010000-5697-8b09-53e1-704cdab76353	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5697-8b09-a20f-29bca03c0dbe	00010000-5697-8b09-66d3-18337799612f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5697-8b09-8aef-26340494b34c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5697-8b09-4f53-9544a86e8966	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5697-8b09-6857-4232c87d013e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5697-8b09-93e0-9fe337fca174	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5697-8b09-2262-6f6111feadc2	00010000-5697-8b09-9f3c-a5609fd81395	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5697-8b09-8aef-49ee70ab18e0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5697-8b09-d9c3-8f0eb08029d1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-8b09-6ae8-815d581e1541	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5697-8b09-f1a3-e9f076cd35ac	00010000-5697-8b09-b0a4-c4f71fdbbd16	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-8b09-61af-a076d144d6e7	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-8b09-590c-9fad944e2e1d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-8b09-32f4-4e7a737af132	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-8b09-81b1-2f53cc915b69	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-8b09-1b5d-edfb5f15d247	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-8b09-794d-5f498609f07d	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-8b09-a40a-563c2be91303	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-8b09-4761-9ee724deefe0	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3134 (class 0 OID 36234051)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5697-8b06-6cec-b9c29364f112	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5697-8b06-fd49-6109c1d5ff5c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5697-8b06-ea5d-aead0975b75d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5697-8b06-4a32-c69e19863e13	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5697-8b06-dcd9-df42a194ca48	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5697-8b06-9538-69202dea98f1	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5697-8b06-df03-481a90df304d	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5697-8b06-93ad-15602790a301	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5697-8b06-7701-1b907a000945	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5697-8b06-547d-0fd86772ba2f	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5697-8b06-00d3-24e2f86df079	Abonma-read	Abonma - branje	t
00030000-5697-8b06-3ccd-e51da1c68f66	Abonma-write	Abonma - spreminjanje	t
00030000-5697-8b06-90e4-e9ab36b7eb8d	Alternacija-read	Alternacija - branje	t
00030000-5697-8b06-7054-8ee1b99730af	Alternacija-write	Alternacija - spreminjanje	t
00030000-5697-8b06-ea1c-5ddd86035e44	Arhivalija-read	Arhivalija - branje	t
00030000-5697-8b06-7586-20395b540df4	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5697-8b06-0d6b-23494554fc45	AuthStorage-read	AuthStorage - branje	t
00030000-5697-8b06-8de5-f054dcc987c8	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5697-8b06-6e49-92d364e7a899	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5697-8b06-8d5c-3309ad8edf7c	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5697-8b06-319a-252b0e2b06e1	Besedilo-read	Besedilo - branje	t
00030000-5697-8b06-e808-db293a19d075	Besedilo-write	Besedilo - spreminjanje	t
00030000-5697-8b06-20ca-f9dfcd30e8f5	Dodatek-read	Dodatek - branje	t
00030000-5697-8b06-d3ea-734c1379d941	Dodatek-write	Dodatek - spreminjanje	t
00030000-5697-8b06-6fa3-3aaa49790960	Dogodek-read	Dogodek - branje	t
00030000-5697-8b06-cd7d-9171e06c1104	Dogodek-write	Dogodek - spreminjanje	t
00030000-5697-8b06-3d1f-6cb15b7a0d5d	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5697-8b06-55cf-37f3346a00ef	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5697-8b06-63da-a8c9ca8593a7	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5697-8b06-ee23-aaef1e756db1	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5697-8b06-71f0-8efc728f94d6	DogodekTrait-read	DogodekTrait - branje	t
00030000-5697-8b06-60e5-e51dd157b6aa	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5697-8b06-bf9d-1e5c8fe7816f	DrugiVir-read	DrugiVir - branje	t
00030000-5697-8b06-6ffa-326a0ee69718	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5697-8b06-694b-7417a7032219	Drzava-read	Drzava - branje	t
00030000-5697-8b06-cac9-ba04a8aa35cd	Drzava-write	Drzava - spreminjanje	t
00030000-5697-8b06-4a0e-c370850cc906	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5697-8b06-5e1c-86cfada4d3b4	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5697-8b06-84e6-acb6f599f58d	Funkcija-read	Funkcija - branje	t
00030000-5697-8b06-a5d0-a157b9fe5417	Funkcija-write	Funkcija - spreminjanje	t
00030000-5697-8b06-b3c5-2dd1b47fc9d4	Gostovanje-read	Gostovanje - branje	t
00030000-5697-8b06-89cf-d5c6a36d4e01	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5697-8b06-95b0-8ad0b48dd9f4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5697-8b06-4ea2-727c960eed2c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5697-8b06-ee90-464805226ebc	Kupec-read	Kupec - branje	t
00030000-5697-8b06-568a-c3252843a789	Kupec-write	Kupec - spreminjanje	t
00030000-5697-8b06-e92e-c2601c33801a	NacinPlacina-read	NacinPlacina - branje	t
00030000-5697-8b06-07ae-0ee76333d369	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5697-8b06-12c3-d5fad6881f27	Option-read	Option - branje	t
00030000-5697-8b06-8c48-6e63c8bb6cd6	Option-write	Option - spreminjanje	t
00030000-5697-8b06-4a49-9b936c4a96cc	OptionValue-read	OptionValue - branje	t
00030000-5697-8b06-a7da-71238db90c26	OptionValue-write	OptionValue - spreminjanje	t
00030000-5697-8b06-ccad-fc161b237a4d	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5697-8b06-b8bc-efe0a2d6fbb8	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5697-8b06-2e5d-10c2a33304db	Oseba-read	Oseba - branje	t
00030000-5697-8b06-7c32-2ab7b216f259	Oseba-write	Oseba - spreminjanje	t
00030000-5697-8b06-ae00-fc7bc70b598e	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5697-8b06-40d0-645c98273ff2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5697-8b06-63ad-bb73e2e544c8	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5697-8b06-5d6d-b0f71e0d6bf2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5697-8b06-87f2-3b71992c7994	Pogodba-read	Pogodba - branje	t
00030000-5697-8b06-9127-e36dfc12c858	Pogodba-write	Pogodba - spreminjanje	t
00030000-5697-8b06-60d6-116be0ac5b45	Popa-read	Popa - branje	t
00030000-5697-8b06-dbe4-c3228e1d4e57	Popa-write	Popa - spreminjanje	t
00030000-5697-8b06-61b2-0807d0380160	Posta-read	Posta - branje	t
00030000-5697-8b06-2943-a2cdbd4867e7	Posta-write	Posta - spreminjanje	t
00030000-5697-8b06-6190-3845be188aba	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5697-8b06-88a4-4eefdac8e85d	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5697-8b06-1c7a-d4673a3c8d70	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5697-8b06-1751-64390b0f865b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5697-8b06-adcc-79c3fb0030a0	PostniNaslov-read	PostniNaslov - branje	t
00030000-5697-8b06-7791-0c3712f7f018	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5697-8b06-bab7-6033f30f7d88	Praznik-read	Praznik - branje	t
00030000-5697-8b06-1e5f-6213adcda5fe	Praznik-write	Praznik - spreminjanje	t
00030000-5697-8b06-56e1-1b56c5c0d3b0	Predstava-read	Predstava - branje	t
00030000-5697-8b06-ad4d-cbb4542260c8	Predstava-write	Predstava - spreminjanje	t
00030000-5697-8b06-19d6-f7e740a66be9	Prisotnost-read	Prisotnost - branje	t
00030000-5697-8b06-e6b9-54006514b5cd	Prisotnost-write	Prisotnost - spreminjanje	t
00030000-5697-8b06-4c67-4a8a1b64acdf	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5697-8b06-6745-2e56737b4faf	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5697-8b06-f0a9-d3f1817e3a47	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5697-8b06-9404-efeaa28e9939	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5697-8b06-f601-2e73dadf0198	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5697-8b06-4d1f-2ea00879af4e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5697-8b06-009a-6594691f6bd4	ProgramDela-read	ProgramDela - branje	t
00030000-5697-8b06-e80e-8ccba5d40da7	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5697-8b06-1eac-796b0c1cbd12	ProgramFestival-read	ProgramFestival - branje	t
00030000-5697-8b06-22a9-71e0c0b385bf	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5697-8b06-0f61-1cc956b15b53	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5697-8b06-86de-2dacd846c5b5	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5697-8b06-0e3e-3c3c9d8bc8fc	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5697-8b06-33ac-cb42c0968bfa	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5697-8b06-0183-2bd27d68ccc1	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5697-8b06-f6bb-6ec7c62a12fe	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5697-8b06-7e81-71bfde14625d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5697-8b06-c19b-5914182e5b8a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5697-8b06-029e-8d5fa0192660	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5697-8b06-3d60-5ac4cc16882e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5697-8b06-7cd1-d1b2271dd299	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5697-8b06-3331-759564cc2f1f	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5697-8b06-a3be-cf446593d52a	ProgramRazno-read	ProgramRazno - branje	t
00030000-5697-8b06-56b4-969774997bc6	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5697-8b06-2879-a2603baa5218	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5697-8b06-1589-f8c4f6a08c79	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5697-8b06-2ef3-b2650cdd2931	Prostor-read	Prostor - branje	t
00030000-5697-8b06-31e7-21436439116a	Prostor-write	Prostor - spreminjanje	t
00030000-5697-8b06-e0c1-c05d9e648196	Racun-read	Racun - branje	t
00030000-5697-8b06-4e21-0c25b4829b11	Racun-write	Racun - spreminjanje	t
00030000-5697-8b06-1373-279faebad950	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5697-8b06-fd40-52edb5ffc03a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5697-8b06-be79-19fa28ba002c	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5697-8b06-d1ca-ee56a2469364	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5697-8b06-d8a3-9d312f14199a	Rekvizit-read	Rekvizit - branje	t
00030000-5697-8b06-2c00-8a76d3c0ec74	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5697-8b06-eb7f-01474db18fa7	Revizija-read	Revizija - branje	t
00030000-5697-8b06-7f5e-1cd760fd79d3	Revizija-write	Revizija - spreminjanje	t
00030000-5697-8b06-8f08-82f593aafc2a	Rezervacija-read	Rezervacija - branje	t
00030000-5697-8b06-0f8f-4f0ba8d267e0	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5697-8b06-a13b-081fa5bc3e46	SedezniRed-read	SedezniRed - branje	t
00030000-5697-8b06-442a-dd75e854caaa	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5697-8b06-9945-5da40ccbd97c	Sedez-read	Sedez - branje	t
00030000-5697-8b06-903f-22099eb0dce0	Sedez-write	Sedez - spreminjanje	t
00030000-5697-8b06-4185-47c408801be6	Sezona-read	Sezona - branje	t
00030000-5697-8b06-df97-ccfad399c0d2	Sezona-write	Sezona - spreminjanje	t
00030000-5697-8b06-3f28-830e2e971e53	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5697-8b06-c3d0-f946a1fa83d2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5697-8b06-febe-db9529297cf0	Telefonska-read	Telefonska - branje	t
00030000-5697-8b06-2c0f-be03a22a3c4a	Telefonska-write	Telefonska - spreminjanje	t
00030000-5697-8b06-2cb4-31db664113cc	TerminStoritve-read	TerminStoritve - branje	t
00030000-5697-8b06-380b-267f50868909	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5697-8b06-aeb7-a586b6953977	TipDodatka-read	TipDodatka - branje	t
00030000-5697-8b06-e17f-b549a3977bf4	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5697-8b06-13b2-0110fe7be731	TipFunkcije-read	TipFunkcije - branje	t
00030000-5697-8b06-cc77-ee291de08f93	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5697-8b06-4401-412cb120bd3d	TipPopa-read	TipPopa - branje	t
00030000-5697-8b06-6178-730a64df61e6	TipPopa-write	TipPopa - spreminjanje	t
00030000-5697-8b06-1d4f-67342136e380	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5697-8b06-bed0-a471a0fa6f99	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5697-8b06-fc60-a27c767ef583	TipVaje-read	TipVaje - branje	t
00030000-5697-8b06-27a1-8c1d978b868e	TipVaje-write	TipVaje - spreminjanje	t
00030000-5697-8b06-2f1d-75403d803527	Trr-read	Trr - branje	t
00030000-5697-8b06-7c3b-32fcb9fc6957	Trr-write	Trr - spreminjanje	t
00030000-5697-8b06-582a-21ee08e68eff	Uprizoritev-read	Uprizoritev - branje	t
00030000-5697-8b06-3bfb-28735156fdeb	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5697-8b06-7897-d03e6fd141d3	Vaja-read	Vaja - branje	t
00030000-5697-8b06-f5d5-c19bb6ee18c7	Vaja-write	Vaja - spreminjanje	t
00030000-5697-8b06-0a00-8a91248805ab	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5697-8b06-2012-391acdd84243	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5697-8b06-9e49-5125b39a27f6	VrstaStroska-read	VrstaStroska - branje	t
00030000-5697-8b06-aa76-c1970f5614ff	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5697-8b06-1a3f-3298fadab3c4	Zaposlitev-read	Zaposlitev - branje	t
00030000-5697-8b06-1948-b389b23af66f	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5697-8b06-df9e-b5c02f52dd23	Zasedenost-read	Zasedenost - branje	t
00030000-5697-8b06-4f64-485667221488	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5697-8b06-8825-fa388388b724	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5697-8b06-c554-4ad229e1443c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5697-8b06-5e22-570399f41cae	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5697-8b06-25dc-69b20eb4a65f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5697-8b06-b9b8-b013a8d8d071	Job-read	Branje opravil - samo zase - branje	t
00030000-5697-8b06-f465-0cc12fdc2488	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5697-8b06-2ff3-1abc74e52fa2	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5697-8b06-2e59-1f9d487a23eb	Report-read	Report - branje	t
00030000-5697-8b06-696c-c911ea3a6b1b	Report-write	Report - spreminjanje	t
00030000-5697-8b06-7c2c-07430fe315b6	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5697-8b06-ed2e-bccd81bd0cff	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5697-8b06-7125-6921bf0e0ec0	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5697-8b06-9d55-0cd08f826ece	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5697-8b06-d454-9144ef8203d4	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5697-8b06-912f-1984880488ab	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5697-8b06-a9fb-cc8af2c53eb1	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5697-8b06-5866-efe8e09f7ef8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-8b06-88e7-2d14c903e933	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-8b06-b8af-27cfe594a613	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-8b06-18b5-bfbb89f9541c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-8b06-f0f7-1b0442804526	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5697-8b06-2fff-a7ef6daa06f9	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5697-8b06-7a8e-1cc7b4dfd839	Datoteka-write	Datoteka - spreminjanje	t
00030000-5697-8b06-bb78-6552afa36b35	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3136 (class 0 OID 36234070)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5697-8b07-53b9-e5ea4c153060	00030000-5697-8b06-fd49-6109c1d5ff5c
00020000-5697-8b07-53b9-e5ea4c153060	00030000-5697-8b06-6cec-b9c29364f112
00020000-5697-8b07-bdf1-d4ca4ce9d74c	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-8d5c-3309ad8edf7c
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-e808-db293a19d075
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-8ad7-2fdc594fc791	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-d443-0a4bd4449637	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b07-d443-0a4bd4449637	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-d443-0a4bd4449637	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-d443-0a4bd4449637	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-d443-0a4bd4449637	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-d443-0a4bd4449637	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-7a93-ad8229a571dd	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-7a93-ad8229a571dd	00030000-5697-8b06-1948-b389b23af66f
00020000-5697-8b07-7a93-ad8229a571dd	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-7a93-ad8229a571dd	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b07-7a93-ad8229a571dd	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-7a93-ad8229a571dd	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-7a93-ad8229a571dd	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-bc88-049abf81aeb9	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-bc88-049abf81aeb9	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-bc88-049abf81aeb9	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-1991-696032dc00ee	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-1991-696032dc00ee	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-1991-696032dc00ee	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-1991-696032dc00ee	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-1991-696032dc00ee	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-1991-696032dc00ee	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-1991-696032dc00ee	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-1991-696032dc00ee	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-7d77-f8a8d92823f4	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-7d77-f8a8d92823f4	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-7d77-f8a8d92823f4	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-7d77-f8a8d92823f4	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-7c3b-32fcb9fc6957
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-7791-0c3712f7f018
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-2c0f-be03a22a3c4a
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-4ccf-c2560487a1d8	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-0470-f6959f4a1838	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-0470-f6959f4a1838	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-0470-f6959f4a1838	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-0470-f6959f4a1838	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-0470-f6959f4a1838	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-0470-f6959f4a1838	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-0470-f6959f4a1838	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-2c0f-be03a22a3c4a
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-7791-0c3712f7f018
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-7c3b-32fcb9fc6957
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-dbe4-c3228e1d4e57
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-4ea2-727c960eed2c
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-4d1f-2ea00879af4e
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-3034-58adc977e551	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-dacc-ae254167539c	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-6c64-567bee825022	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-6c64-567bee825022	00030000-5697-8b06-6178-730a64df61e6
00020000-5697-8b07-bdb1-f755c87852c7	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-cf63-696f483ffb51	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-cf63-696f483ffb51	00030000-5697-8b06-2943-a2cdbd4867e7
00020000-5697-8b07-3423-a85698fb9178	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-c623-03e9a75323ac	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-c623-03e9a75323ac	00030000-5697-8b06-cac9-ba04a8aa35cd
00020000-5697-8b07-ea17-5b60d69079fe	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-61a1-0d4112bc52b3	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b07-61a1-0d4112bc52b3	00030000-5697-8b06-25dc-69b20eb4a65f
00020000-5697-8b07-498c-dcfdd7543c0e	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b07-90b9-17732848f627	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-90b9-17732848f627	00030000-5697-8b06-c554-4ad229e1443c
00020000-5697-8b07-931b-57668b6068ea	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-2f42-58a7c92dea01	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b07-2f42-58a7c92dea01	00030000-5697-8b06-3ccd-e51da1c68f66
00020000-5697-8b07-5714-5503829a6adc	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b07-f330-9ebbd07c4998	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-f330-9ebbd07c4998	00030000-5697-8b06-31e7-21436439116a
00020000-5697-8b07-f330-9ebbd07c4998	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-f330-9ebbd07c4998	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-f330-9ebbd07c4998	00030000-5697-8b06-7791-0c3712f7f018
00020000-5697-8b07-f330-9ebbd07c4998	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-72ac-0ee0389dbd4e	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-72ac-0ee0389dbd4e	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-72ac-0ee0389dbd4e	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-800a-9faeb8f3a69d	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-800a-9faeb8f3a69d	00030000-5697-8b06-aa76-c1970f5614ff
00020000-5697-8b07-48b2-8a165bfe5dcd	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-b8bc-efe0a2d6fbb8
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-25fc-039b830a32ac	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-7096-aa955934909e	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-7096-aa955934909e	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-7096-aa955934909e	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-7096-aa955934909e	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-7096-aa955934909e	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-2f7c-e30a2ec10fbb	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b07-2f7c-e30a2ec10fbb	00030000-5697-8b06-27a1-8c1d978b868e
00020000-5697-8b07-626d-1143aed1aa06	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-df03-481a90df304d
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-93ad-15602790a301
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-009a-6594691f6bd4
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-e80e-8ccba5d40da7
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-1eac-796b0c1cbd12
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-22a9-71e0c0b385bf
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-0f61-1cc956b15b53
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-86de-2dacd846c5b5
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-0e3e-3c3c9d8bc8fc
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-33ac-cb42c0968bfa
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-0183-2bd27d68ccc1
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-f6bb-6ec7c62a12fe
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-7e81-71bfde14625d
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-c19b-5914182e5b8a
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-029e-8d5fa0192660
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-3d60-5ac4cc16882e
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-7cd1-d1b2271dd299
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-3331-759564cc2f1f
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-a3be-cf446593d52a
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-56b4-969774997bc6
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-2879-a2603baa5218
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-1589-f8c4f6a08c79
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-9404-efeaa28e9939
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-6ffa-326a0ee69718
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-88a4-4eefdac8e85d
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-f465-0cc12fdc2488
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-bf9d-1e5c8fe7816f
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-f0a9-d3f1817e3a47
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-6190-3845be188aba
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-b9b8-b013a8d8d071
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-b4fc-597a3b8495c5	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-009a-6594691f6bd4
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-1eac-796b0c1cbd12
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-0f61-1cc956b15b53
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-0e3e-3c3c9d8bc8fc
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-0183-2bd27d68ccc1
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-7e81-71bfde14625d
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-029e-8d5fa0192660
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-7cd1-d1b2271dd299
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-a3be-cf446593d52a
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-2879-a2603baa5218
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-f0a9-d3f1817e3a47
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-bf9d-1e5c8fe7816f
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-6190-3845be188aba
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-b9b8-b013a8d8d071
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-ffcf-1aad99fdc88b	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-3bfb-28735156fdeb
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-547d-0fd86772ba2f
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-e605-14699b1f6f51	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-e887-b34a46e4d12f	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-6e63-2b6dfaa28a04	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-6e63-2b6dfaa28a04	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-6e63-2b6dfaa28a04	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-6e63-2b6dfaa28a04	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b07-6e63-2b6dfaa28a04	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-6e63-2b6dfaa28a04	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-6e63-2b6dfaa28a04	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-6e63-2b6dfaa28a04	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-9127-e36dfc12c858
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-c3d0-f946a1fa83d2
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-e650-aa1ebeb041e9	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-af8f-88ded6788f60	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-3c06-ef526ca93cec	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-3c06-ef526ca93cec	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-3c06-ef526ca93cec	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-3c06-ef526ca93cec	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-3c06-ef526ca93cec	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-3c06-ef526ca93cec	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-3c06-ef526ca93cec	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-8e78-3ee7bb794343	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-8e78-3ee7bb794343	00030000-5697-8b06-c3d0-f946a1fa83d2
00020000-5697-8b07-8e78-3ee7bb794343	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-8e78-3ee7bb794343	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-ef39-b0d34d6b13fd	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-ef39-b0d34d6b13fd	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-8d5c-3309ad8edf7c
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-e808-db293a19d075
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-bf9d-1e5c8fe7816f
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-6ffa-326a0ee69718
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-547d-0fd86772ba2f
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-b9b8-b013a8d8d071
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-f465-0cc12fdc2488
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-9127-e36dfc12c858
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-6190-3845be188aba
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-88a4-4eefdac8e85d
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-f0a9-d3f1817e3a47
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-9404-efeaa28e9939
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-df03-481a90df304d
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-009a-6594691f6bd4
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-93ad-15602790a301
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-e80e-8ccba5d40da7
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-1eac-796b0c1cbd12
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-22a9-71e0c0b385bf
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-0f61-1cc956b15b53
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-86de-2dacd846c5b5
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-0e3e-3c3c9d8bc8fc
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-33ac-cb42c0968bfa
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-0183-2bd27d68ccc1
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-f6bb-6ec7c62a12fe
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-7e81-71bfde14625d
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-c19b-5914182e5b8a
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-029e-8d5fa0192660
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-3d60-5ac4cc16882e
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-7cd1-d1b2271dd299
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-3331-759564cc2f1f
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-a3be-cf446593d52a
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-56b4-969774997bc6
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-2879-a2603baa5218
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-1589-f8c4f6a08c79
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-c3d0-f946a1fa83d2
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-3bfb-28735156fdeb
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-74b7-d93eff7c3ca0	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-8d5c-3309ad8edf7c
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-e808-db293a19d075
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-05c7-27060958e910	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-8d5c-3309ad8edf7c
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-e808-db293a19d075
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-547d-0fd86772ba2f
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-3bfb-28735156fdeb
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-c103-f1ed30894272	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-8d5c-3309ad8edf7c
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-e808-db293a19d075
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-bf9d-1e5c8fe7816f
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-6ffa-326a0ee69718
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-547d-0fd86772ba2f
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-b9b8-b013a8d8d071
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-f465-0cc12fdc2488
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-4ea2-727c960eed2c
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-9127-e36dfc12c858
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-dbe4-c3228e1d4e57
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-6190-3845be188aba
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-88a4-4eefdac8e85d
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-7791-0c3712f7f018
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-f0a9-d3f1817e3a47
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-9404-efeaa28e9939
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-4d1f-2ea00879af4e
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-df03-481a90df304d
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-009a-6594691f6bd4
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-93ad-15602790a301
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-e80e-8ccba5d40da7
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-1eac-796b0c1cbd12
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-22a9-71e0c0b385bf
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-0f61-1cc956b15b53
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-86de-2dacd846c5b5
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-0e3e-3c3c9d8bc8fc
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-33ac-cb42c0968bfa
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-0183-2bd27d68ccc1
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-f6bb-6ec7c62a12fe
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-7e81-71bfde14625d
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-c19b-5914182e5b8a
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-029e-8d5fa0192660
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-3d60-5ac4cc16882e
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-7cd1-d1b2271dd299
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-3331-759564cc2f1f
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-a3be-cf446593d52a
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-56b4-969774997bc6
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-2879-a2603baa5218
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-1589-f8c4f6a08c79
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-c3d0-f946a1fa83d2
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-2c0f-be03a22a3c4a
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-7c3b-32fcb9fc6957
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-3bfb-28735156fdeb
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-1948-b389b23af66f
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-eeed-86b0c274b8f8	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-8d5c-3309ad8edf7c
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-e808-db293a19d075
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-547d-0fd86772ba2f
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-4ea2-727c960eed2c
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-dbe4-c3228e1d4e57
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-7791-0c3712f7f018
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-4d1f-2ea00879af4e
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-2c0f-be03a22a3c4a
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-7c3b-32fcb9fc6957
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-3bfb-28735156fdeb
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-1948-b389b23af66f
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-266a-c87ec09f399f	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-d7be-9f9abaa02165	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-bf9d-1e5c8fe7816f
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-6ffa-326a0ee69718
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-b9b8-b013a8d8d071
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-f465-0cc12fdc2488
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-4ea2-727c960eed2c
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-b8bc-efe0a2d6fbb8
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-9127-e36dfc12c858
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-dbe4-c3228e1d4e57
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-6190-3845be188aba
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-88a4-4eefdac8e85d
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-7791-0c3712f7f018
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-f0a9-d3f1817e3a47
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-9404-efeaa28e9939
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-4d1f-2ea00879af4e
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-df03-481a90df304d
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-009a-6594691f6bd4
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-93ad-15602790a301
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-e80e-8ccba5d40da7
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-1eac-796b0c1cbd12
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-22a9-71e0c0b385bf
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-0f61-1cc956b15b53
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-86de-2dacd846c5b5
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-0e3e-3c3c9d8bc8fc
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-33ac-cb42c0968bfa
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-0183-2bd27d68ccc1
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-f6bb-6ec7c62a12fe
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-7e81-71bfde14625d
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-c19b-5914182e5b8a
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-029e-8d5fa0192660
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-3d60-5ac4cc16882e
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-7cd1-d1b2271dd299
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-3331-759564cc2f1f
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-a3be-cf446593d52a
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-56b4-969774997bc6
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-2879-a2603baa5218
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-1589-f8c4f6a08c79
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-c3d0-f946a1fa83d2
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-2c0f-be03a22a3c4a
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-7c3b-32fcb9fc6957
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-aa76-c1970f5614ff
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-1948-b389b23af66f
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b07-6dd4-45946cd0c467	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-6cec-b9c29364f112
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-fd49-6109c1d5ff5c
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-00d3-24e2f86df079
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-3ccd-e51da1c68f66
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-ea1c-5ddd86035e44
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7586-20395b540df4
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-0d6b-23494554fc45
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-8de5-f054dcc987c8
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-6e49-92d364e7a899
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-8d5c-3309ad8edf7c
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-319a-252b0e2b06e1
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-e808-db293a19d075
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-6fa3-3aaa49790960
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4a32-c69e19863e13
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-3d1f-6cb15b7a0d5d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-55cf-37f3346a00ef
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-63da-a8c9ca8593a7
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-ee23-aaef1e756db1
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-71f0-8efc728f94d6
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-60e5-e51dd157b6aa
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-cd7d-9171e06c1104
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-bf9d-1e5c8fe7816f
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-6ffa-326a0ee69718
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-694b-7417a7032219
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-cac9-ba04a8aa35cd
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4a0e-c370850cc906
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-5e1c-86cfada4d3b4
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-547d-0fd86772ba2f
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-b3c5-2dd1b47fc9d4
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-89cf-d5c6a36d4e01
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2ff3-1abc74e52fa2
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-b9b8-b013a8d8d071
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-f465-0cc12fdc2488
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-95b0-8ad0b48dd9f4
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4ea2-727c960eed2c
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-ee90-464805226ebc
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-568a-c3252843a789
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-a9fb-cc8af2c53eb1
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-912f-1984880488ab
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-ed2e-bccd81bd0cff
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7125-6921bf0e0ec0
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-9d55-0cd08f826ece
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-d454-9144ef8203d4
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-e92e-c2601c33801a
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-07ae-0ee76333d369
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-12c3-d5fad6881f27
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4a49-9b936c4a96cc
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-a7da-71238db90c26
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-8c48-6e63c8bb6cd6
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-ccad-fc161b237a4d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-b8bc-efe0a2d6fbb8
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-ae00-fc7bc70b598e
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-40d0-645c98273ff2
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-63ad-bb73e2e544c8
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-5d6d-b0f71e0d6bf2
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-9127-e36dfc12c858
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-dbe4-c3228e1d4e57
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-61b2-0807d0380160
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-6190-3845be188aba
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-88a4-4eefdac8e85d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1c7a-d4673a3c8d70
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1751-64390b0f865b
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2943-a2cdbd4867e7
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7791-0c3712f7f018
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-bab7-6033f30f7d88
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1e5f-6213adcda5fe
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-56e1-1b56c5c0d3b0
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-ad4d-cbb4542260c8
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4c67-4a8a1b64acdf
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-6745-2e56737b4faf
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-f0a9-d3f1817e3a47
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-9404-efeaa28e9939
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-f601-2e73dadf0198
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4d1f-2ea00879af4e
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-df03-481a90df304d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-009a-6594691f6bd4
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-93ad-15602790a301
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-e80e-8ccba5d40da7
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1eac-796b0c1cbd12
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-22a9-71e0c0b385bf
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-0f61-1cc956b15b53
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-86de-2dacd846c5b5
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-0e3e-3c3c9d8bc8fc
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-33ac-cb42c0968bfa
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-0183-2bd27d68ccc1
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-f6bb-6ec7c62a12fe
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7e81-71bfde14625d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-c19b-5914182e5b8a
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-029e-8d5fa0192660
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-3d60-5ac4cc16882e
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7cd1-d1b2271dd299
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-3331-759564cc2f1f
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-a3be-cf446593d52a
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-56b4-969774997bc6
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2879-a2603baa5218
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1589-f8c4f6a08c79
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2ef3-b2650cdd2931
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-31e7-21436439116a
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-e0c1-c05d9e648196
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4e21-0c25b4829b11
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1373-279faebad950
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-fd40-52edb5ffc03a
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-be79-19fa28ba002c
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-d1ca-ee56a2469364
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-d8a3-9d312f14199a
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2c00-8a76d3c0ec74
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2e59-1f9d487a23eb
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-696c-c911ea3a6b1b
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-eb7f-01474db18fa7
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7f5e-1cd760fd79d3
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-8f08-82f593aafc2a
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-0f8f-4f0ba8d267e0
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-a13b-081fa5bc3e46
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-442a-dd75e854caaa
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-9945-5da40ccbd97c
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-903f-22099eb0dce0
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4185-47c408801be6
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-df97-ccfad399c0d2
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7c2c-07430fe315b6
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-c3d0-f946a1fa83d2
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2c0f-be03a22a3c4a
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2cb4-31db664113cc
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-ea5d-aead0975b75d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-380b-267f50868909
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-13b2-0110fe7be731
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-cc77-ee291de08f93
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4401-412cb120bd3d
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-6178-730a64df61e6
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1d4f-67342136e380
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-bed0-a471a0fa6f99
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-fc60-a27c767ef583
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-27a1-8c1d978b868e
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7c3b-32fcb9fc6957
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-3bfb-28735156fdeb
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-7897-d03e6fd141d3
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-f5d5-c19bb6ee18c7
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-0a00-8a91248805ab
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2012-391acdd84243
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-9e49-5125b39a27f6
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-aa76-c1970f5614ff
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-2fff-a7ef6daa06f9
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-f0f7-1b0442804526
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-1948-b389b23af66f
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-df9e-b5c02f52dd23
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-4f64-485667221488
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-8825-fa388388b724
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-c554-4ad229e1443c
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-5e22-570399f41cae
00020000-5697-8b09-ea30-4733dec96986	00030000-5697-8b06-25dc-69b20eb4a65f
00020000-5697-8b09-7acf-14f5f79e621a	00030000-5697-8b06-18b5-bfbb89f9541c
00020000-5697-8b09-3ad5-df6872673968	00030000-5697-8b06-b8af-27cfe594a613
00020000-5697-8b09-d706-2d0a8def198c	00030000-5697-8b06-3bfb-28735156fdeb
00020000-5697-8b09-ee48-d4170c85038d	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b09-28d3-e96838080938	00030000-5697-8b06-7125-6921bf0e0ec0
00020000-5697-8b09-baf5-7527428d7509	00030000-5697-8b06-9d55-0cd08f826ece
00020000-5697-8b09-5879-b27c71841e31	00030000-5697-8b06-d454-9144ef8203d4
00020000-5697-8b09-dbba-e49c3872e8c3	00030000-5697-8b06-ed2e-bccd81bd0cff
00020000-5697-8b09-5001-43656538eb62	00030000-5697-8b06-a9fb-cc8af2c53eb1
00020000-5697-8b09-3f67-407be72cbc3f	00030000-5697-8b06-912f-1984880488ab
00020000-5697-8b09-eb7e-3136ded0475c	00030000-5697-8b06-88e7-2d14c903e933
00020000-5697-8b09-4dfe-3cb35d6d37c7	00030000-5697-8b06-5866-efe8e09f7ef8
00020000-5697-8b09-6745-1a2c4bf2ea54	00030000-5697-8b06-2e5d-10c2a33304db
00020000-5697-8b09-8c5e-8ce5e33fa7b5	00030000-5697-8b06-7c32-2ab7b216f259
00020000-5697-8b09-7db0-2328e2e947ab	00030000-5697-8b06-dcd9-df42a194ca48
00020000-5697-8b09-3884-97334e13c26c	00030000-5697-8b06-9538-69202dea98f1
00020000-5697-8b09-76a4-9d3481cd0194	00030000-5697-8b06-7a8e-1cc7b4dfd839
00020000-5697-8b09-a207-7f695dfccf22	00030000-5697-8b06-bb78-6552afa36b35
00020000-5697-8b09-8af1-732505dde413	00030000-5697-8b06-60d6-116be0ac5b45
00020000-5697-8b09-8af1-732505dde413	00030000-5697-8b06-dbe4-c3228e1d4e57
00020000-5697-8b09-8af1-732505dde413	00030000-5697-8b06-582a-21ee08e68eff
00020000-5697-8b09-0c75-5366eb170072	00030000-5697-8b06-2f1d-75403d803527
00020000-5697-8b09-bb20-72b1050afe47	00030000-5697-8b06-7c3b-32fcb9fc6957
00020000-5697-8b09-2a1a-7c182774ead5	00030000-5697-8b06-7c2c-07430fe315b6
00020000-5697-8b09-a13d-f5290375ccac	00030000-5697-8b06-febe-db9529297cf0
00020000-5697-8b09-8e70-8940c7cb8250	00030000-5697-8b06-2c0f-be03a22a3c4a
00020000-5697-8b09-1e70-e231bad8c42e	00030000-5697-8b06-adcc-79c3fb0030a0
00020000-5697-8b09-bdc3-248331ec6d41	00030000-5697-8b06-7791-0c3712f7f018
00020000-5697-8b09-82f2-bd8ca0e68b97	00030000-5697-8b06-1a3f-3298fadab3c4
00020000-5697-8b09-a32e-1cb5c5a62e51	00030000-5697-8b06-1948-b389b23af66f
00020000-5697-8b09-e607-df38eba854b9	00030000-5697-8b06-87f2-3b71992c7994
00020000-5697-8b09-b75f-3024e6775c68	00030000-5697-8b06-9127-e36dfc12c858
00020000-5697-8b09-9a6f-bd780d1d3852	00030000-5697-8b06-3f28-830e2e971e53
00020000-5697-8b09-d464-e745127ce784	00030000-5697-8b06-c3d0-f946a1fa83d2
00020000-5697-8b09-d4dd-b954a684dd26	00030000-5697-8b06-90e4-e9ab36b7eb8d
00020000-5697-8b09-cb4c-80a7e6cd35ab	00030000-5697-8b06-7054-8ee1b99730af
00020000-5697-8b09-1c3f-d53786e252b7	00030000-5697-8b06-7701-1b907a000945
00020000-5697-8b09-0d1e-834c444e0c32	00030000-5697-8b06-84e6-acb6f599f58d
00020000-5697-8b09-caae-0983259fcd4c	00030000-5697-8b06-a5d0-a157b9fe5417
00020000-5697-8b09-aa75-caa9b5359e34	00030000-5697-8b06-547d-0fd86772ba2f
\.


--
-- TOC entry 3176 (class 0 OID 36234477)
-- Dependencies: 220
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 36234511)
-- Dependencies: 224
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 36234644)
-- Dependencies: 236
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5697-8b09-d5b2-b0d5405d9c7c	00090000-5697-8b09-cd76-f25e6c9d7844	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5697-8b09-7076-53882d5b1720	00090000-5697-8b09-4f53-9544a86e8966	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5697-8b09-e254-daeae6fe0c00	00090000-5697-8b09-f1a3-e9f076cd35ac	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5697-8b09-ac13-3cd04e9fdd8e	00090000-5697-8b09-8aef-49ee70ab18e0	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3144 (class 0 OID 36234152)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5697-8b09-e031-63a8e59ce697	\N	00040000-5697-8b06-53a8-3306f2689853	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-8b09-0fb1-0aa5eeb525d5	\N	00040000-5697-8b06-53a8-3306f2689853	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5697-8b09-8a45-ae007cdcfcee	\N	00040000-5697-8b06-53a8-3306f2689853	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-8b09-06c2-db713b7c916d	\N	00040000-5697-8b06-53a8-3306f2689853	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-8b09-36d8-728c162f5c67	\N	00040000-5697-8b06-53a8-3306f2689853	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-8b09-02f8-60da5a814614	\N	00040000-5697-8b06-7b5e-6e0a14c79dca	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-8b09-e1eb-cb225acd41ba	\N	00040000-5697-8b06-1042-0b817d85de9a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-8b09-8b9e-b535d2428ac1	\N	00040000-5697-8b06-a48f-026d2fb06248	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-8b09-fbbb-11070c540132	\N	00040000-5697-8b06-222c-2f70089bb379	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-8b0b-1a83-722d0df9b8a8	\N	00040000-5697-8b06-53a8-3306f2689853	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3147 (class 0 OID 36234197)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5697-8b05-311c-bf9730ec7378	8341	Adlešiči
00050000-5697-8b05-3979-16939cd7a397	5270	Ajdovščina
00050000-5697-8b05-be51-e5a4684ff310	6280	Ankaran/Ancarano
00050000-5697-8b05-6c98-92982b0dc8a7	9253	Apače
00050000-5697-8b05-ccf3-c27e080865c1	8253	Artiče
00050000-5697-8b05-028e-efc4fbb8eccd	4275	Begunje na Gorenjskem
00050000-5697-8b05-bedb-2a0aae947f58	1382	Begunje pri Cerknici
00050000-5697-8b05-b3be-5f8da5bf05a8	9231	Beltinci
00050000-5697-8b05-31f1-a74cad9634e9	2234	Benedikt
00050000-5697-8b05-d2f8-aceefe9d81fb	2345	Bistrica ob Dravi
00050000-5697-8b05-90ba-487314ac903f	3256	Bistrica ob Sotli
00050000-5697-8b05-a417-7eb2e7949fa0	8259	Bizeljsko
00050000-5697-8b05-0db2-f60914c7c3c1	1223	Blagovica
00050000-5697-8b05-93cf-a3b98f53ee76	8283	Blanca
00050000-5697-8b05-6a50-8e6102b5809f	4260	Bled
00050000-5697-8b05-3da3-dd1d3c332b5d	4273	Blejska Dobrava
00050000-5697-8b05-5cef-08ef19e0d279	9265	Bodonci
00050000-5697-8b05-1106-a83d631c7664	9222	Bogojina
00050000-5697-8b05-189f-76d341c58148	4263	Bohinjska Bela
00050000-5697-8b05-772d-2f8cd7abf20c	4264	Bohinjska Bistrica
00050000-5697-8b05-b5f6-2e734d948b93	4265	Bohinjsko jezero
00050000-5697-8b05-ad79-0e8c541d49d4	1353	Borovnica
00050000-5697-8b05-86ca-5b7ea50ac22b	8294	Boštanj
00050000-5697-8b05-0571-3d39612f2e7b	5230	Bovec
00050000-5697-8b05-12ec-517050a4d20c	5295	Branik
00050000-5697-8b05-d3a1-7422a073cef2	3314	Braslovče
00050000-5697-8b05-9c55-98e1b986c98a	5223	Breginj
00050000-5697-8b05-55c5-6c5247c7d84a	8280	Brestanica
00050000-5697-8b05-f056-2c7783a4e63e	2354	Bresternica
00050000-5697-8b05-8cff-64bbb761e670	4243	Brezje
00050000-5697-8b05-844e-6d77929d0bef	1351	Brezovica pri Ljubljani
00050000-5697-8b05-bc73-ff27aa2402ce	8250	Brežice
00050000-5697-8b05-7994-5c588810366b	4210	Brnik - Aerodrom
00050000-5697-8b05-82d1-a229e30005c8	8321	Brusnice
00050000-5697-8b05-2dde-a4f6c62c9285	3255	Buče
00050000-5697-8b05-b147-9f7d7b09007a	8276	Bučka 
00050000-5697-8b05-6cf9-28c104925138	9261	Cankova
00050000-5697-8b05-6c58-dff43666a659	3000	Celje 
00050000-5697-8b05-47cf-5dcf80b72d46	3001	Celje - poštni predali
00050000-5697-8b05-4060-070e8744301c	4207	Cerklje na Gorenjskem
00050000-5697-8b05-f0a4-8519e7571acd	8263	Cerklje ob Krki
00050000-5697-8b05-facb-06ee6bb0bddd	1380	Cerknica
00050000-5697-8b05-6230-dba0ce0ebfb1	5282	Cerkno
00050000-5697-8b05-07fe-1ee2a4713282	2236	Cerkvenjak
00050000-5697-8b05-b1dd-f384627ade6e	2215	Ceršak
00050000-5697-8b05-d51b-887010163df0	2326	Cirkovce
00050000-5697-8b05-3cbb-80dc4f1cf3ed	2282	Cirkulane
00050000-5697-8b05-9827-a9a0860bced0	5273	Col
00050000-5697-8b05-7bf4-a1918b2e0c40	8251	Čatež ob Savi
00050000-5697-8b05-b731-d48862f085de	1413	Čemšenik
00050000-5697-8b05-02d7-5c96cf9683bf	5253	Čepovan
00050000-5697-8b05-846b-688630def90f	9232	Črenšovci
00050000-5697-8b05-fa17-32b2ecca6f6f	2393	Črna na Koroškem
00050000-5697-8b05-de6a-c2c4eac2a6ac	6275	Črni Kal
00050000-5697-8b05-9a85-b5b01f216865	5274	Črni Vrh nad Idrijo
00050000-5697-8b05-e1c7-eda454ddcbed	5262	Črniče
00050000-5697-8b05-7aa4-80f217ac1538	8340	Črnomelj
00050000-5697-8b05-e30b-5ef7f3d3e4e8	6271	Dekani
00050000-5697-8b05-f1f1-c93a44c13c22	5210	Deskle
00050000-5697-8b05-7baa-9a7117a40dc3	2253	Destrnik
00050000-5697-8b05-caa7-7f3cf6dc6884	6215	Divača
00050000-5697-8b05-bf5c-ffb6bb767cb6	1233	Dob
00050000-5697-8b05-4416-6a48d44be8da	3224	Dobje pri Planini
00050000-5697-8b05-4c47-43c50f8bac3d	8257	Dobova
00050000-5697-8b05-cb7f-e2b791a34721	1423	Dobovec
00050000-5697-8b05-58d6-afaf7379e64b	5263	Dobravlje
00050000-5697-8b05-d4e5-b7a485409fe1	3204	Dobrna
00050000-5697-8b05-fde5-fa3e19e25e97	8211	Dobrnič
00050000-5697-8b05-38ca-f7b811c38884	1356	Dobrova
00050000-5697-8b05-6a75-c7ed02ae226e	9223	Dobrovnik/Dobronak 
00050000-5697-8b05-18c1-e2f803e0f76b	5212	Dobrovo v Brdih
00050000-5697-8b05-4afc-11872ea72f47	1431	Dol pri Hrastniku
00050000-5697-8b05-8522-19cfd5775c04	1262	Dol pri Ljubljani
00050000-5697-8b05-9c9c-6b1bba9c20db	1273	Dole pri Litiji
00050000-5697-8b05-b769-a03f07505057	1331	Dolenja vas
00050000-5697-8b05-a7bb-cce29e4259be	8350	Dolenjske Toplice
00050000-5697-8b05-4f5a-497d02945e79	1230	Domžale
00050000-5697-8b05-804a-d54cdd9ebc49	2252	Dornava
00050000-5697-8b05-2453-732264f69c10	5294	Dornberk
00050000-5697-8b05-c308-02f8b0ada75a	1319	Draga
00050000-5697-8b05-dbce-5c667a1de926	8343	Dragatuš
00050000-5697-8b05-37f8-b1f155dcc657	3222	Dramlje
00050000-5697-8b05-e105-0ce72a7d8059	2370	Dravograd
00050000-5697-8b05-3837-5687ae4f3fb7	4203	Duplje
00050000-5697-8b05-b798-b661aa13856c	6221	Dutovlje
00050000-5697-8b05-47cc-b18483e8153e	8361	Dvor
00050000-5697-8b05-b0ac-fe2f6e8b44b0	2343	Fala
00050000-5697-8b05-5bc0-71f21ba49342	9208	Fokovci
00050000-5697-8b05-7aea-31b3386cb960	2313	Fram
00050000-5697-8b05-6f50-1df42064de05	3213	Frankolovo
00050000-5697-8b05-fc81-dec4ab9ab53c	1274	Gabrovka
00050000-5697-8b05-6ca9-fd7e1f5c3a4b	8254	Globoko
00050000-5697-8b05-384e-7222a74f7a60	5275	Godovič
00050000-5697-8b05-5898-16f2574df36b	4204	Golnik
00050000-5697-8b05-f0fd-956df913170f	3303	Gomilsko
00050000-5697-8b05-b3b3-6ce72ed881da	4224	Gorenja vas
00050000-5697-8b05-1c7d-b390a0b80fc2	3263	Gorica pri Slivnici
00050000-5697-8b05-e2ad-82641d799085	2272	Gorišnica
00050000-5697-8b05-dbed-798f644e4087	9250	Gornja Radgona
00050000-5697-8b05-87db-018c88bd7d3d	3342	Gornji Grad
00050000-5697-8b05-1281-f130305b2a43	4282	Gozd Martuljek
00050000-5697-8b05-4ff8-20dc15c3591d	6272	Gračišče
00050000-5697-8b05-04af-a5f2eb8604ab	9264	Grad
00050000-5697-8b05-2538-2a9300d3c2a8	8332	Gradac
00050000-5697-8b05-5e9c-8c1437dc9c93	1384	Grahovo
00050000-5697-8b05-6ff1-d0baf9d413ef	5242	Grahovo ob Bači
00050000-5697-8b05-8dd1-908de4e8c340	5251	Grgar
00050000-5697-8b05-5ea6-7b247faaeef9	3302	Griže
00050000-5697-8b05-9ed2-1145ff8bfaa3	3231	Grobelno
00050000-5697-8b05-04ae-b81b5fda719d	1290	Grosuplje
00050000-5697-8b05-03f3-d0fc6d22b306	2288	Hajdina
00050000-5697-8b05-a568-773cd032d041	8362	Hinje
00050000-5697-8b05-92fd-7eaa8e547b0a	2311	Hoče
00050000-5697-8b05-3de1-2a7d1222d18e	9205	Hodoš/Hodos
00050000-5697-8b05-e04d-565339427ff3	1354	Horjul
00050000-5697-8b05-6173-a68fab427f62	1372	Hotedršica
00050000-5697-8b05-2f4e-0ebd368539a4	1430	Hrastnik
00050000-5697-8b05-4f39-2907b5863880	6225	Hruševje
00050000-5697-8b05-35db-39e7f648bc1e	4276	Hrušica
00050000-5697-8b05-d66e-a07201722ecf	5280	Idrija
00050000-5697-8b05-b072-7aa04a7fd5fb	1292	Ig
00050000-5697-8b05-a811-3940d311f0ce	6250	Ilirska Bistrica
00050000-5697-8b05-0758-8b432ae224f8	6251	Ilirska Bistrica-Trnovo
00050000-5697-8b05-a628-dd70125c3664	1295	Ivančna Gorica
00050000-5697-8b05-af55-94e815b37b94	2259	Ivanjkovci
00050000-5697-8b05-c57c-e292db040d72	1411	Izlake
00050000-5697-8b05-e937-52e968ae16d6	6310	Izola/Isola
00050000-5697-8b05-b99b-4992cd0663b5	2222	Jakobski Dol
00050000-5697-8b05-0677-7297cc51c1f1	2221	Jarenina
00050000-5697-8b05-fd85-018eddc672fe	6254	Jelšane
00050000-5697-8b05-dd9b-66bbffed0468	4270	Jesenice
00050000-5697-8b05-9721-814cf7f80216	8261	Jesenice na Dolenjskem
00050000-5697-8b05-1eb9-cc9a4a3ef56f	3273	Jurklošter
00050000-5697-8b05-f39c-51658267c4f3	2223	Jurovski Dol
00050000-5697-8b05-eb97-3da15824ea8b	2256	Juršinci
00050000-5697-8b05-053f-162a2665638c	5214	Kal nad Kanalom
00050000-5697-8b05-b301-247a0fb56cd3	3233	Kalobje
00050000-5697-8b05-b549-aa4432bc874d	4246	Kamna Gorica
00050000-5697-8b05-829b-acc17611543d	2351	Kamnica
00050000-5697-8b05-35c1-edb4ec0c3db1	1241	Kamnik
00050000-5697-8b05-1648-396ace01809a	5213	Kanal
00050000-5697-8b05-0061-4f44e00e6734	8258	Kapele
00050000-5697-8b05-51a9-b9c40f8b0c87	2362	Kapla
00050000-5697-8b05-bb00-3ee068ef25c5	2325	Kidričevo
00050000-5697-8b05-76c7-55dc7919321e	1412	Kisovec
00050000-5697-8b05-4b84-668e2f257f83	6253	Knežak
00050000-5697-8b05-bc86-c145c8d3f105	5222	Kobarid
00050000-5697-8b05-69f4-2bc5a6ab4ef2	9227	Kobilje
00050000-5697-8b05-f70d-e1fbc3d377b3	1330	Kočevje
00050000-5697-8b05-b882-7344c2039466	1338	Kočevska Reka
00050000-5697-8b05-a8dd-44ce41db8cf7	2276	Kog
00050000-5697-8b05-21dd-f397ca6fbb23	5211	Kojsko
00050000-5697-8b05-999b-6aee7a8d0499	6223	Komen
00050000-5697-8b05-8f14-e7812edd36d5	1218	Komenda
00050000-5697-8b05-a5f8-bf73d0f6503c	6000	Koper/Capodistria 
00050000-5697-8b05-6fcc-12ad2c8edca3	6001	Koper/Capodistria - poštni predali
00050000-5697-8b05-b62e-57ac0778793d	8282	Koprivnica
00050000-5697-8b05-8e4b-af3e2ae52217	5296	Kostanjevica na Krasu
00050000-5697-8b05-5b0b-27761ebb5858	8311	Kostanjevica na Krki
00050000-5697-8b05-7ffb-134532c018b7	1336	Kostel
00050000-5697-8b05-d2f9-2bb46a0c853a	6256	Košana
00050000-5697-8b05-341a-6da03752e4cf	2394	Kotlje
00050000-5697-8b05-20f4-2c5177b4af61	6240	Kozina
00050000-5697-8b05-30fd-39f80208a223	3260	Kozje
00050000-5697-8b05-55e3-ffa1a483082a	4000	Kranj 
00050000-5697-8b05-54f8-fff2207a2e35	4001	Kranj - poštni predali
00050000-5697-8b05-ec46-50fcb7d0af9e	4280	Kranjska Gora
00050000-5697-8b05-7d58-a6b78ce6590a	1281	Kresnice
00050000-5697-8b05-01ce-d215deba065d	4294	Križe
00050000-5697-8b05-d012-889275d07deb	9206	Križevci
00050000-5697-8b05-f2ce-45a5d3bb4d31	9242	Križevci pri Ljutomeru
00050000-5697-8b05-036f-447603f43355	1301	Krka
00050000-5697-8b05-cd42-a76c62fc57a0	8296	Krmelj
00050000-5697-8b05-8a6e-de53b356a906	4245	Kropa
00050000-5697-8b05-a466-07f9e213177a	8262	Krška vas
00050000-5697-8b05-8e59-2efcfc8c4e6e	8270	Krško
00050000-5697-8b05-47e4-cca7af262e6e	9263	Kuzma
00050000-5697-8b05-a141-a38fc38e3e37	2318	Laporje
00050000-5697-8b05-6bae-4d8620d38b1a	3270	Laško
00050000-5697-8b05-46a2-fde04a72e326	1219	Laze v Tuhinju
00050000-5697-8b05-0632-0b2823809f29	2230	Lenart v Slovenskih goricah
00050000-5697-8b05-42c1-49c40cf6e196	9220	Lendava/Lendva
00050000-5697-8b05-0c78-e47b3c6a5f32	4248	Lesce
00050000-5697-8b05-72ed-963f3d131ac5	3261	Lesično
00050000-5697-8b05-8824-021865f133b6	8273	Leskovec pri Krškem
00050000-5697-8b05-9f61-dd93a07c1844	2372	Libeliče
00050000-5697-8b05-59a9-de64ab1c71e3	2341	Limbuš
00050000-5697-8b05-41a0-86c40e5a011c	1270	Litija
00050000-5697-8b05-b97d-bf472b610747	3202	Ljubečna
00050000-5697-8b05-8f0d-1a41c3b8e1a8	1000	Ljubljana 
00050000-5697-8b05-28db-929990f6ee5c	1001	Ljubljana - poštni predali
00050000-5697-8b05-f609-01371d42e033	1231	Ljubljana - Črnuče
00050000-5697-8b05-8029-56fed63255cb	1261	Ljubljana - Dobrunje
00050000-5697-8b05-f1cd-ea3209ac23d5	1260	Ljubljana - Polje
00050000-5697-8b05-6f5b-171252f5b19e	1210	Ljubljana - Šentvid
00050000-5697-8b05-cac3-31246a7f7abb	1211	Ljubljana - Šmartno
00050000-5697-8b05-627e-acd02caba1b4	3333	Ljubno ob Savinji
00050000-5697-8b05-61fa-02b2a341f47a	9240	Ljutomer
00050000-5697-8b05-ebd3-4fc68adcfb61	3215	Loče
00050000-5697-8b05-8c95-4d1ef5fbe164	5231	Log pod Mangartom
00050000-5697-8b05-631c-fe91a5cbbbdf	1358	Log pri Brezovici
00050000-5697-8b05-6bce-af8eedd670e5	1370	Logatec
00050000-5697-8b05-559f-48e1f56cedb2	1371	Logatec
00050000-5697-8b05-485c-c13c8c02bb09	1434	Loka pri Zidanem Mostu
00050000-5697-8b05-393d-bfed7af34fdc	3223	Loka pri Žusmu
00050000-5697-8b05-c983-e756cc75a7a6	6219	Lokev
00050000-5697-8b05-e154-8559241ba8bd	1318	Loški Potok
00050000-5697-8b05-1726-14edbe9ca18c	2324	Lovrenc na Dravskem polju
00050000-5697-8b05-e7c8-4602e4a85aa5	2344	Lovrenc na Pohorju
00050000-5697-8b05-591d-64c4f5dd14ae	3334	Luče
00050000-5697-8b05-c155-6da58c922122	1225	Lukovica
00050000-5697-8b05-e375-499c5072ea46	9202	Mačkovci
00050000-5697-8b05-e898-8946d92b0625	2322	Majšperk
00050000-5697-8b05-5fc6-9b31a55637b8	2321	Makole
00050000-5697-8b05-dd04-da40a6b74369	9243	Mala Nedelja
00050000-5697-8b05-a700-583e29141b42	2229	Malečnik
00050000-5697-8b05-0093-bc159d5cbc28	6273	Marezige
00050000-5697-8b05-7391-707c038747ca	2000	Maribor 
00050000-5697-8b05-10c6-ac87a1fc06d9	2001	Maribor - poštni predali
00050000-5697-8b05-95ba-5e0115f78cd1	2206	Marjeta na Dravskem polju
00050000-5697-8b05-6e54-bd7113187caa	2281	Markovci
00050000-5697-8b05-75e1-fecd871b398d	9221	Martjanci
00050000-5697-8b05-75e2-a8c3019ccd89	6242	Materija
00050000-5697-8b05-51ba-237e066792f6	4211	Mavčiče
00050000-5697-8b05-2821-1d73bcb512fc	1215	Medvode
00050000-5697-8b05-776e-b08530e1e979	1234	Mengeš
00050000-5697-8b05-b9a8-420d55a5a7b6	8330	Metlika
00050000-5697-8b05-c72c-b03108b021ac	2392	Mežica
00050000-5697-8b05-a677-11c958da9ad6	2204	Miklavž na Dravskem polju
00050000-5697-8b05-7b9e-295fac9e966b	2275	Miklavž pri Ormožu
00050000-5697-8b05-28b8-7fdb1dd689e8	5291	Miren
00050000-5697-8b05-a83f-386ccf8c5e9c	8233	Mirna
00050000-5697-8b05-be83-e2831dd17f50	8216	Mirna Peč
00050000-5697-8b05-35e6-9b3bc6453827	2382	Mislinja
00050000-5697-8b05-2eee-c923209cc44f	4281	Mojstrana
00050000-5697-8b05-5599-9abc3eea6a98	8230	Mokronog
00050000-5697-8b05-c376-78374f0ee494	1251	Moravče
00050000-5697-8b05-c637-7d7be49d2624	9226	Moravske Toplice
00050000-5697-8b05-fc62-d85e2381abdd	5216	Most na Soči
00050000-5697-8b05-fb3c-882615943be9	1221	Motnik
00050000-5697-8b05-610f-73c1a9c3aaac	3330	Mozirje
00050000-5697-8b05-8fdd-ccaa2df4be03	9000	Murska Sobota 
00050000-5697-8b05-2342-fab595e9aef7	9001	Murska Sobota - poštni predali
00050000-5697-8b05-e3f1-2d37d5efd854	2366	Muta
00050000-5697-8b05-8d02-a30351166eb5	4202	Naklo
00050000-5697-8b05-28b1-b3085db2d2e1	3331	Nazarje
00050000-5697-8b05-0f85-95ea6672d429	1357	Notranje Gorice
00050000-5697-8b05-a976-9af00b7f985a	3203	Nova Cerkev
00050000-5697-8b05-ebdf-4c3cf73bab85	5000	Nova Gorica 
00050000-5697-8b05-fd1e-fcc60a9f9ba6	5001	Nova Gorica - poštni predali
00050000-5697-8b05-dcb1-ca95419ea918	1385	Nova vas
00050000-5697-8b05-fadd-e653580ada30	8000	Novo mesto
00050000-5697-8b05-d4ee-c79ed9bbe655	8001	Novo mesto - poštni predali
00050000-5697-8b05-2196-8006fa27fcaa	6243	Obrov
00050000-5697-8b05-208d-c78b8252b370	9233	Odranci
00050000-5697-8b05-365a-b02de177c078	2317	Oplotnica
00050000-5697-8b05-b72d-236c09ec5f9b	2312	Orehova vas
00050000-5697-8b05-19f8-f85ff5fd45ff	2270	Ormož
00050000-5697-8b05-6b7b-9cb2fbca39b8	1316	Ortnek
00050000-5697-8b05-41de-6a536955cbaf	1337	Osilnica
00050000-5697-8b05-ca87-62852e5420f0	8222	Otočec
00050000-5697-8b05-d55a-f207e640e3a3	2361	Ožbalt
00050000-5697-8b05-4400-24a9c4e254e5	2231	Pernica
00050000-5697-8b05-2e00-882704f9fb09	2211	Pesnica pri Mariboru
00050000-5697-8b05-7d7e-1c270f87fc46	9203	Petrovci
00050000-5697-8b05-e76b-73d653d79758	3301	Petrovče
00050000-5697-8b05-2131-19351b3caed6	6330	Piran/Pirano
00050000-5697-8b05-8e5b-641f36a6d883	8255	Pišece
00050000-5697-8b05-e7f2-0c4aa9b79e88	6257	Pivka
00050000-5697-8b05-bafe-b8fdedfcdad2	6232	Planina
00050000-5697-8b05-82f3-e220de3142a2	3225	Planina pri Sevnici
00050000-5697-8b05-be62-763859bf1702	6276	Pobegi
00050000-5697-8b05-eb95-7d2ca7422068	8312	Podbočje
00050000-5697-8b05-5490-e0a3bd679a64	5243	Podbrdo
00050000-5697-8b05-17c7-9e3cb204f8b3	3254	Podčetrtek
00050000-5697-8b05-1f4d-d61574d430ec	2273	Podgorci
00050000-5697-8b05-4318-e7a88381a1e5	6216	Podgorje
00050000-5697-8b05-6328-7f41a1ff018b	2381	Podgorje pri Slovenj Gradcu
00050000-5697-8b06-b8fb-aa1a2e6c9d7f	6244	Podgrad
00050000-5697-8b06-d9bd-578a15820c25	1414	Podkum
00050000-5697-8b06-62db-2bfc4c285def	2286	Podlehnik
00050000-5697-8b06-6e03-99541957bf67	5272	Podnanos
00050000-5697-8b06-e427-e18e21e2b9a6	4244	Podnart
00050000-5697-8b06-a9cd-2a4063176033	3241	Podplat
00050000-5697-8b06-7b20-66c55de56f3a	3257	Podsreda
00050000-5697-8b06-be7c-160424a98c2d	2363	Podvelka
00050000-5697-8b06-60ae-81f15140e375	2208	Pohorje
00050000-5697-8b06-0654-1067c8fb5cc4	2257	Polenšak
00050000-5697-8b06-695b-1ae63ae2b876	1355	Polhov Gradec
00050000-5697-8b06-941e-6f22dbc230a3	4223	Poljane nad Škofjo Loko
00050000-5697-8b06-2445-03c486fad614	2319	Poljčane
00050000-5697-8b06-7b02-6228fa63d165	1272	Polšnik
00050000-5697-8b06-fb16-43575705874d	3313	Polzela
00050000-5697-8b06-a4f8-31ba5d67d4d5	3232	Ponikva
00050000-5697-8b06-a236-ac779f7482af	6320	Portorož/Portorose
00050000-5697-8b06-6414-bbe5d7e7c8e5	6230	Postojna
00050000-5697-8b06-4046-834afef4c937	2331	Pragersko
00050000-5697-8b06-9f0b-3ec06026ef09	3312	Prebold
00050000-5697-8b06-4067-5ef1f15b9c57	4205	Preddvor
00050000-5697-8b06-9ad2-6043014a7a12	6255	Prem
00050000-5697-8b06-7f00-f1c3174d71e4	1352	Preserje
00050000-5697-8b06-35ed-0d12fd8b2fba	6258	Prestranek
00050000-5697-8b06-aa28-e1b95557963d	2391	Prevalje
00050000-5697-8b06-5adb-2e7a046fde0f	3262	Prevorje
00050000-5697-8b06-853c-80ea9b6b1559	1276	Primskovo 
00050000-5697-8b06-f0d1-71f4c8dc1233	3253	Pristava pri Mestinju
00050000-5697-8b06-893a-32b188eddedf	9207	Prosenjakovci/Partosfalva
00050000-5697-8b06-2eed-c70958d21a2f	5297	Prvačina
00050000-5697-8b06-dfbf-737a7b76e1d2	2250	Ptuj
00050000-5697-8b06-bcd2-05905545ae57	2323	Ptujska Gora
00050000-5697-8b06-d869-e35904bd740d	9201	Puconci
00050000-5697-8b06-31cb-49d080199ebf	2327	Rače
00050000-5697-8b06-51b8-77e826d5e8f8	1433	Radeče
00050000-5697-8b06-f927-a6bca5c072b0	9252	Radenci
00050000-5697-8b06-d7bd-1cad748a20f5	2360	Radlje ob Dravi
00050000-5697-8b06-70d4-8a3aedcc5b69	1235	Radomlje
00050000-5697-8b06-b180-55f0e87ee3ce	4240	Radovljica
00050000-5697-8b06-d444-9dd19ea733c6	8274	Raka
00050000-5697-8b06-b49b-c35282c11d0c	1381	Rakek
00050000-5697-8b06-36b2-7ddb4e70dcfc	4283	Rateče - Planica
00050000-5697-8b06-bb3e-faa246aff98d	2390	Ravne na Koroškem
00050000-5697-8b06-52ff-0004400a8b5f	9246	Razkrižje
00050000-5697-8b06-7f1e-d659a1d5bc62	3332	Rečica ob Savinji
00050000-5697-8b06-1749-a762549f8b96	5292	Renče
00050000-5697-8b06-66cc-7b1a8ca6b2fb	1310	Ribnica
00050000-5697-8b06-7c86-83e7e0390c2b	2364	Ribnica na Pohorju
00050000-5697-8b06-00fb-287e012186e3	3272	Rimske Toplice
00050000-5697-8b06-2747-79b30aa15ca7	1314	Rob
00050000-5697-8b06-a94a-57eb6af93b48	5215	Ročinj
00050000-5697-8b06-355a-16ee9c6c7d69	3250	Rogaška Slatina
00050000-5697-8b06-6644-c735dd3beb3c	9262	Rogašovci
00050000-5697-8b06-8afd-d8e10923d20c	3252	Rogatec
00050000-5697-8b06-696b-765cae5c127b	1373	Rovte
00050000-5697-8b06-3dce-3dde87e83f14	2342	Ruše
00050000-5697-8b06-2e91-2e698602c26e	1282	Sava
00050000-5697-8b06-1644-2504a749fc2a	6333	Sečovlje/Sicciole
00050000-5697-8b06-029e-b3bbf27db20f	4227	Selca
00050000-5697-8b06-d715-d3d39b29a143	2352	Selnica ob Dravi
00050000-5697-8b06-e53d-2d0dbf7ba619	8333	Semič
00050000-5697-8b06-99fd-dfb2ec39dcad	8281	Senovo
00050000-5697-8b06-74ce-7c969d5c55ad	6224	Senožeče
00050000-5697-8b06-5f49-ef63169c2bc0	8290	Sevnica
00050000-5697-8b06-b14e-8f14e01e70fc	6210	Sežana
00050000-5697-8b06-5a66-d95a53300502	2214	Sladki Vrh
00050000-5697-8b06-8284-d628fb32200f	5283	Slap ob Idrijci
00050000-5697-8b06-5e34-85877164061b	2380	Slovenj Gradec
00050000-5697-8b06-62e8-d60d2b459148	2310	Slovenska Bistrica
00050000-5697-8b06-a154-4d4765e293e1	3210	Slovenske Konjice
00050000-5697-8b06-01d9-fa16078be029	1216	Smlednik
00050000-5697-8b06-0007-675d5e02cb1c	5232	Soča
00050000-5697-8b06-86b4-eb569177d18a	1317	Sodražica
00050000-5697-8b06-da8b-a31932ee24a8	3335	Solčava
00050000-5697-8b06-7f44-64c561bade8a	5250	Solkan
00050000-5697-8b06-878a-114f07d2ac78	4229	Sorica
00050000-5697-8b06-d9c0-75c17b12ff6d	4225	Sovodenj
00050000-5697-8b06-cd02-91099b8a51fa	5281	Spodnja Idrija
00050000-5697-8b06-c1d0-454567bd2589	2241	Spodnji Duplek
00050000-5697-8b06-b629-d9ad9b7da4cc	9245	Spodnji Ivanjci
00050000-5697-8b06-7cc6-261aaf19c73b	2277	Središče ob Dravi
00050000-5697-8b06-d4cc-5004628e23b8	4267	Srednja vas v Bohinju
00050000-5697-8b06-443e-a34f5679f045	8256	Sromlje 
00050000-5697-8b06-4c07-3185dad72935	5224	Srpenica
00050000-5697-8b06-e4f0-e5bcbfb23249	1242	Stahovica
00050000-5697-8b06-723c-768fb8e57961	1332	Stara Cerkev
00050000-5697-8b06-5ad5-971d676b5a2c	8342	Stari trg ob Kolpi
00050000-5697-8b06-5240-f5317ef95349	1386	Stari trg pri Ložu
00050000-5697-8b06-9cd1-3b30ebf46ac5	2205	Starše
00050000-5697-8b06-7a8b-a0d5b41f224b	2289	Stoperce
00050000-5697-8b06-1807-5738116c3997	8322	Stopiče
00050000-5697-8b06-bdd9-b4a213b36421	3206	Stranice
00050000-5697-8b06-0b28-24994ca649f2	8351	Straža
00050000-5697-8b06-a5d4-bd8b252609ca	1313	Struge
00050000-5697-8b06-ee1d-5d675df7a658	8293	Studenec
00050000-5697-8b06-2f8d-03e765161612	8331	Suhor
00050000-5697-8b06-4f91-0323a5b00088	2233	Sv. Ana v Slovenskih goricah
00050000-5697-8b06-4364-c8a104617590	2235	Sv. Trojica v Slovenskih goricah
00050000-5697-8b06-6eda-7b5df86b08f5	2353	Sveti Duh na Ostrem Vrhu
00050000-5697-8b06-78b0-f7c00f3a53c8	9244	Sveti Jurij ob Ščavnici
00050000-5697-8b06-3a8d-d17d53f79568	3264	Sveti Štefan
00050000-5697-8b06-e2b1-d805a722647f	2258	Sveti Tomaž
00050000-5697-8b06-46a8-570d7259b800	9204	Šalovci
00050000-5697-8b06-0e70-ea3377103766	5261	Šempas
00050000-5697-8b06-e839-a76761e1f8fe	5290	Šempeter pri Gorici
00050000-5697-8b06-c45f-e7f265d5450a	3311	Šempeter v Savinjski dolini
00050000-5697-8b06-0c39-80e6994d6567	4208	Šenčur
00050000-5697-8b06-58c0-3bab94304efa	2212	Šentilj v Slovenskih goricah
00050000-5697-8b06-23c6-ae5811685815	8297	Šentjanž
00050000-5697-8b06-ffa3-d6b5787aa2a9	2373	Šentjanž pri Dravogradu
00050000-5697-8b06-ff7c-99fa5b651293	8310	Šentjernej
00050000-5697-8b06-cdea-5a2ef52e019b	3230	Šentjur
00050000-5697-8b06-55d9-f83066a611b8	3271	Šentrupert
00050000-5697-8b06-a786-837c3181b896	8232	Šentrupert
00050000-5697-8b06-3488-f1b07a649886	1296	Šentvid pri Stični
00050000-5697-8b06-f589-8a85f16c19d7	8275	Škocjan
00050000-5697-8b06-1f93-431123cc1bb2	6281	Škofije
00050000-5697-8b06-88ce-47a3555f101a	4220	Škofja Loka
00050000-5697-8b06-77d2-9ccec9a0cbf1	3211	Škofja vas
00050000-5697-8b06-0a0a-26f7b8be20bc	1291	Škofljica
00050000-5697-8b06-6107-01e09384ef23	6274	Šmarje
00050000-5697-8b06-c898-1fc34e227428	1293	Šmarje - Sap
00050000-5697-8b06-3032-5dbcd7acb00e	3240	Šmarje pri Jelšah
00050000-5697-8b06-30b3-dc03e9667869	8220	Šmarješke Toplice
00050000-5697-8b06-670d-123b78165626	2315	Šmartno na Pohorju
00050000-5697-8b06-b61a-c96dd539b550	3341	Šmartno ob Dreti
00050000-5697-8b06-bb9c-9e3943b0b1ac	3327	Šmartno ob Paki
00050000-5697-8b06-6316-65bbb8cc2bcf	1275	Šmartno pri Litiji
00050000-5697-8b06-d511-57c846677bf1	2383	Šmartno pri Slovenj Gradcu
00050000-5697-8b06-8a72-d88e1ac17e2f	3201	Šmartno v Rožni dolini
00050000-5697-8b06-cca8-7977d36ec07a	3325	Šoštanj
00050000-5697-8b06-aaf9-7630d9301dc0	6222	Štanjel
00050000-5697-8b06-5a66-ed30d312849e	3220	Štore
00050000-5697-8b06-854d-c85b712f4076	3304	Tabor
00050000-5697-8b06-3932-225625ea3b80	3221	Teharje
00050000-5697-8b06-e30f-3bd9c3718963	9251	Tišina
00050000-5697-8b06-b232-84ac68c9d6d8	5220	Tolmin
00050000-5697-8b06-1056-1b7a58e6c4f5	3326	Topolšica
00050000-5697-8b06-46ce-eeeb18ee4084	2371	Trbonje
00050000-5697-8b06-153b-b07160513a52	1420	Trbovlje
00050000-5697-8b06-a640-ae0181b0d9f8	8231	Trebelno 
00050000-5697-8b06-2baf-9b3cab7f643f	8210	Trebnje
00050000-5697-8b06-04ee-401db94f645a	5252	Trnovo pri Gorici
00050000-5697-8b06-018e-c7cc54a8ff25	2254	Trnovska vas
00050000-5697-8b06-faa6-01895e604c5b	1222	Trojane
00050000-5697-8b06-a60d-e542e4dd0cf9	1236	Trzin
00050000-5697-8b06-4da6-e13d082d56d4	4290	Tržič
00050000-5697-8b06-d53d-2d9e3d35ccfa	8295	Tržišče
00050000-5697-8b06-df11-77f470e62895	1311	Turjak
00050000-5697-8b06-3a48-ead377c544d0	9224	Turnišče
00050000-5697-8b06-fb02-783f2ae0e53f	8323	Uršna sela
00050000-5697-8b06-c1c2-f81462365bd2	1252	Vače
00050000-5697-8b06-c411-06f5991abd61	3320	Velenje 
00050000-5697-8b06-0e8a-763d5fbf1f15	3322	Velenje - poštni predali
00050000-5697-8b06-04a8-157e7e501943	8212	Velika Loka
00050000-5697-8b06-f048-32b3b34757da	2274	Velika Nedelja
00050000-5697-8b06-2472-b9fe1d1a0ad1	9225	Velika Polana
00050000-5697-8b06-e002-669451bf23b7	1315	Velike Lašče
00050000-5697-8b06-96f7-5dbda006d752	8213	Veliki Gaber
00050000-5697-8b06-f213-9009eec83421	9241	Veržej
00050000-5697-8b06-ec71-ff8302c56992	1312	Videm - Dobrepolje
00050000-5697-8b06-cea5-260ea0352295	2284	Videm pri Ptuju
00050000-5697-8b06-1d5d-ccfe577ed93d	8344	Vinica
00050000-5697-8b06-b6fb-90c657d5fd09	5271	Vipava
00050000-5697-8b06-fb61-e98a49e2e6cf	4212	Visoko
00050000-5697-8b06-4ef2-3738c2a230f8	1294	Višnja Gora
00050000-5697-8b06-de9d-86dea67d31db	3205	Vitanje
00050000-5697-8b06-6dec-ab15d648bab3	2255	Vitomarci
00050000-5697-8b06-7e3b-e6a34982732d	1217	Vodice
00050000-5697-8b06-2d4b-29ed73f8a042	3212	Vojnik\t
00050000-5697-8b06-d2a8-4c2e7ae7f84b	5293	Volčja Draga
00050000-5697-8b06-4d4f-9ea7df8e697a	2232	Voličina
00050000-5697-8b06-e5ef-be3f9b3110ab	3305	Vransko
00050000-5697-8b06-4003-14b8e1d4d24d	6217	Vremski Britof
00050000-5697-8b06-6f7c-fa663f7e96e2	1360	Vrhnika
00050000-5697-8b06-2d4b-974cae113fa2	2365	Vuhred
00050000-5697-8b06-7afc-f22daa71af37	2367	Vuzenica
00050000-5697-8b06-0d95-5761f8289a16	8292	Zabukovje 
00050000-5697-8b06-8067-11a0ef0cc8cf	1410	Zagorje ob Savi
00050000-5697-8b06-0fd9-d37af5f08af4	1303	Zagradec
00050000-5697-8b06-b568-dd44b47e0197	2283	Zavrč
00050000-5697-8b06-e3f5-3c0ada41467c	8272	Zdole 
00050000-5697-8b06-34fe-f86fec557ed5	4201	Zgornja Besnica
00050000-5697-8b06-0425-4a1981223122	2242	Zgornja Korena
00050000-5697-8b06-4fdc-47e2184bdf97	2201	Zgornja Kungota
00050000-5697-8b06-e25e-9fc6df492de2	2316	Zgornja Ložnica
00050000-5697-8b06-16e1-d6a9d2783953	2314	Zgornja Polskava
00050000-5697-8b06-0235-ed8b476e42fd	2213	Zgornja Velka
00050000-5697-8b06-9035-2ecde75a2874	4247	Zgornje Gorje
00050000-5697-8b06-6764-f7a41220ac7f	4206	Zgornje Jezersko
00050000-5697-8b06-808b-75c432f66190	2285	Zgornji Leskovec
00050000-5697-8b06-6fb7-e1ab54b9c23c	1432	Zidani Most
00050000-5697-8b06-af0a-7bd7bb449471	3214	Zreče
00050000-5697-8b06-0963-f5cdee2478bb	4209	Žabnica
00050000-5697-8b06-ed4d-9b08da2225b7	3310	Žalec
00050000-5697-8b06-eaa8-be71a72d19e1	4228	Železniki
00050000-5697-8b06-cf9d-ed85cc111ea9	2287	Žetale
00050000-5697-8b06-81a8-06d9c0bd5e3d	4226	Žiri
00050000-5697-8b06-9a4b-706c04f3f948	4274	Žirovnica
00050000-5697-8b06-b7a6-23ed64d6f01c	8360	Žužemberk
\.


--
-- TOC entry 3199 (class 0 OID 36234881)
-- Dependencies: 243
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 36234451)
-- Dependencies: 216
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 36234182)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5697-8b09-a981-536fa1199857	00080000-5697-8b09-e031-63a8e59ce697	\N	00040000-5697-8b06-53a8-3306f2689853	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5697-8b09-5822-5cf879449b61	00080000-5697-8b09-e031-63a8e59ce697	\N	00040000-5697-8b06-53a8-3306f2689853	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5697-8b09-5dec-553e824322bf	00080000-5697-8b09-0fb1-0aa5eeb525d5	\N	00040000-5697-8b06-53a8-3306f2689853	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3158 (class 0 OID 36234320)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5697-8b06-c718-1498ae14fd6d	novo leto	1	1	\N	t
00430000-5697-8b06-f84a-04905cd2d130	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5697-8b06-1949-73188a0a0cb1	dan upora proti okupatorju	27	4	\N	t
00430000-5697-8b06-b2c4-a20b1f2073b6	praznik dela	1	5	\N	t
00430000-5697-8b06-87a2-dd13d5d505fb	praznik dela	2	5	\N	t
00430000-5697-8b06-52ca-8e2e5eb5c742	dan Primoža Trubarja	8	6	\N	f
00430000-5697-8b06-2545-513300e218e4	dan državnosti	25	6	\N	t
00430000-5697-8b06-ff91-53f943fd3b94	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5697-8b06-9239-539cffdc740b	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5697-8b06-6413-173d2552da12	dan suverenosti	25	10	\N	f
00430000-5697-8b06-1a12-64957c8b4ac6	dan spomina na mrtve	1	11	\N	t
00430000-5697-8b06-1bb8-a66ba1f27d66	dan Rudolfa Maistra	23	11	\N	f
00430000-5697-8b06-b4f5-95b6079fc3a7	božič	25	12	\N	t
00430000-5697-8b06-4da2-b373c98c60f6	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5697-8b06-a2e9-1bc035cad052	Marijino vnebovzetje	15	8	\N	t
00430000-5697-8b06-7a52-4977442aadb5	dan reformacije	31	10	\N	t
00430000-5697-8b06-3e1d-6b6314c8624c	velikonočna nedelja	27	3	2016	t
00430000-5697-8b06-66fe-83c218902172	velikonočna nedelja	16	4	2017	t
00430000-5697-8b06-a6ad-2530e46e11b5	velikonočna nedelja	1	4	2018	t
00430000-5697-8b06-e2f4-ab0ac0c8f896	velikonočna nedelja	21	4	2019	t
00430000-5697-8b06-5f4a-aab237400378	velikonočna nedelja	12	4	2020	t
00430000-5697-8b06-59d1-f62df8dc615a	velikonočna nedelja	4	4	2021	t
00430000-5697-8b06-01e7-eb708f74a50b	velikonočna nedelja	17	4	2022	t
00430000-5697-8b06-ecfa-e7ce6ce9d2b9	velikonočna nedelja	9	4	2023	t
00430000-5697-8b06-6a86-b43da555f785	velikonočna nedelja	31	3	2024	t
00430000-5697-8b06-c9ca-e90ef1bde3ca	velikonočna nedelja	20	4	2025	t
00430000-5697-8b06-36f9-506d746814f6	velikonočna nedelja	5	4	2026	t
00430000-5697-8b06-4f2d-57255e955fd8	velikonočna nedelja	28	3	2027	t
00430000-5697-8b06-0016-fffebd6c0d74	velikonočna nedelja	16	4	2028	t
00430000-5697-8b06-5784-514f7e3a3835	velikonočna nedelja	1	4	2029	t
00430000-5697-8b06-dac2-a37144ee776d	velikonočna nedelja	21	4	2030	t
00430000-5697-8b06-7771-245533696666	velikonočni ponedeljek	28	3	2016	t
00430000-5697-8b06-91d0-5729476be507	velikonočni ponedeljek	17	4	2017	t
00430000-5697-8b06-95c4-219a460ba949	velikonočni ponedeljek	2	4	2018	t
00430000-5697-8b06-e042-70e8cac959e0	velikonočni ponedeljek	22	4	2019	t
00430000-5697-8b06-0a3d-7cce944bdd8e	velikonočni ponedeljek	13	4	2020	t
00430000-5697-8b06-fc2f-f97bf494e6bc	velikonočni ponedeljek	5	4	2021	t
00430000-5697-8b06-1ff7-af8c3eeb114e	velikonočni ponedeljek	18	4	2022	t
00430000-5697-8b06-2fe0-d26c497fd77b	velikonočni ponedeljek	10	4	2023	t
00430000-5697-8b06-726f-a87f5c994921	velikonočni ponedeljek	1	4	2024	t
00430000-5697-8b06-ad77-bb279b8b3f96	velikonočni ponedeljek	21	4	2025	t
00430000-5697-8b06-3798-40b07ff4f815	velikonočni ponedeljek	6	4	2026	t
00430000-5697-8b06-870e-ec9af256659e	velikonočni ponedeljek	29	3	2027	t
00430000-5697-8b06-3c73-3c8b75e1060a	velikonočni ponedeljek	17	4	2028	t
00430000-5697-8b06-a958-77cb4665526d	velikonočni ponedeljek	2	4	2029	t
00430000-5697-8b06-5a1e-4a8a164a64ae	velikonočni ponedeljek	22	4	2030	t
00430000-5697-8b06-0094-e3a3dfb88a08	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5697-8b06-0b2e-de3e2e2c8429	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5697-8b06-4042-eb15a3febbad	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5697-8b06-19a8-9d7669a704bb	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5697-8b06-0243-b6116607154a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5697-8b06-4ca1-84795490c2f3	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5697-8b06-d163-a4c961e05260	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5697-8b06-04b2-f408a6e25f85	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5697-8b06-5c46-ea590d36e9d5	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5697-8b06-5b95-2237af98bd28	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5697-8b06-ec88-75da0812225e	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5697-8b06-47e8-165e49dc90ba	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5697-8b06-a982-ccff12d69d09	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5697-8b06-dcf6-7179263c3fe4	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5697-8b06-f1c9-ecacdbd7e0c2	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3154 (class 0 OID 36234286)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 36234295)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 36234417)
-- Dependencies: 212
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 36234463)
-- Dependencies: 218
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 36234895)
-- Dependencies: 244
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 36234905)
-- Dependencies: 245
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5697-8b09-511d-9468f2145c2a	00080000-5697-8b09-8a45-ae007cdcfcee	0987	AK
00190000-5697-8b09-a21c-0490455bf1e9	00080000-5697-8b09-0fb1-0aa5eeb525d5	0989	AK
00190000-5697-8b09-80c5-32fee36148c1	00080000-5697-8b09-06c2-db713b7c916d	0986	AK
00190000-5697-8b09-b660-d9607882fa12	00080000-5697-8b09-02f8-60da5a814614	0984	AK
00190000-5697-8b09-5db2-537661b3e60c	00080000-5697-8b09-e1eb-cb225acd41ba	0983	AK
00190000-5697-8b09-963b-9d664c8bfce7	00080000-5697-8b09-8b9e-b535d2428ac1	0982	AK
00190000-5697-8b0b-433a-7e9597dfc909	00080000-5697-8b0b-1a83-722d0df9b8a8	1001	AK
\.


--
-- TOC entry 3198 (class 0 OID 36234794)
-- Dependencies: 242
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5697-8b0a-0905-589d80e3da1e	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3202 (class 0 OID 36234913)
-- Dependencies: 246
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 36234492)
-- Dependencies: 222
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5697-8b09-c468-567e57c4aafb	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5697-8b09-b518-003504c6d132	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5697-8b09-9379-94a9757d05de	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5697-8b09-1df5-235efb3df4c0	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5697-8b09-cce1-e8da58b37423	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5697-8b09-692c-4536bbaac7c5	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5697-8b09-306e-bb81bd2ccb32	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3170 (class 0 OID 36234436)
-- Dependencies: 214
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 36234426)
-- Dependencies: 213
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 36234633)
-- Dependencies: 235
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 36234563)
-- Dependencies: 229
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 36234260)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 36234022)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5697-8b0b-1a83-722d0df9b8a8	00010000-5697-8b07-ecf5-914031848478	2016-01-14 12:48:27	INS	a:0:{}
2	App\\Entity\\Option	00000000-5697-8b0b-5e4f-30668518b48a	00010000-5697-8b07-ecf5-914031848478	2016-01-14 12:48:27	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5697-8b0b-433a-7e9597dfc909	00010000-5697-8b07-ecf5-914031848478	2016-01-14 12:48:27	INS	a:0:{}
\.


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3179 (class 0 OID 36234505)
-- Dependencies: 223
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 36234060)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5697-8b07-53b9-e5ea4c153060	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5697-8b07-bdf1-d4ca4ce9d74c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5697-8b07-be35-f61afcfddd3a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5697-8b07-ade8-93169e72c80e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5697-8b07-8ad7-2fdc594fc791	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5697-8b07-d443-0a4bd4449637	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5697-8b07-7a93-ad8229a571dd	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5697-8b07-bc88-049abf81aeb9	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5697-8b07-1991-696032dc00ee	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-8b07-7d77-f8a8d92823f4	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-8b07-4ccf-c2560487a1d8	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-8b07-0470-f6959f4a1838	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-8b07-3034-58adc977e551	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-8b07-dacc-ae254167539c	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-8b07-6c64-567bee825022	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-8b07-bdb1-f755c87852c7	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-8b07-cf63-696f483ffb51	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5697-8b07-3423-a85698fb9178	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5697-8b07-c623-03e9a75323ac	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5697-8b07-ea17-5b60d69079fe	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5697-8b07-61a1-0d4112bc52b3	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-8b07-498c-dcfdd7543c0e	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-8b07-90b9-17732848f627	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-8b07-931b-57668b6068ea	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-8b07-2f42-58a7c92dea01	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5697-8b07-5714-5503829a6adc	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5697-8b07-f330-9ebbd07c4998	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5697-8b07-72ac-0ee0389dbd4e	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5697-8b07-800a-9faeb8f3a69d	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5697-8b07-48b2-8a165bfe5dcd	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5697-8b07-25fc-039b830a32ac	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-8b07-7096-aa955934909e	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-8b07-2f7c-e30a2ec10fbb	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5697-8b07-626d-1143aed1aa06	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5697-8b07-b4fc-597a3b8495c5	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5697-8b07-ffcf-1aad99fdc88b	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5697-8b07-e605-14699b1f6f51	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-8b07-e887-b34a46e4d12f	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-8b07-6e63-2b6dfaa28a04	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5697-8b07-e650-aa1ebeb041e9	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-8b07-af8f-88ded6788f60	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-8b07-3c06-ef526ca93cec	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5697-8b07-8e78-3ee7bb794343	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-8b07-ef39-b0d34d6b13fd	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-8b07-74b7-d93eff7c3ca0	direktor	minimalne pravice za direktorja	t
00020000-5697-8b07-05c7-27060958e910	arhivar	arhivar	t
00020000-5697-8b07-c103-f1ed30894272	dramaturg	dramaturg	t
00020000-5697-8b07-eeed-86b0c274b8f8	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5697-8b07-266a-c87ec09f399f	poslovni-sekretar	poslovni sekretar	t
00020000-5697-8b07-d7be-9f9abaa02165	vodja-tehnike	vodja tehnike	t
00020000-5697-8b07-6dd4-45946cd0c467	racunovodja	računovodja	t
00020000-5697-8b09-ea30-4733dec96986	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5697-8b09-7acf-14f5f79e621a	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-3ad5-df6872673968	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-d706-2d0a8def198c	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-ee48-d4170c85038d	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-28d3-e96838080938	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-baf5-7527428d7509	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-5879-b27c71841e31	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-dbba-e49c3872e8c3	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-5001-43656538eb62	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-3f67-407be72cbc3f	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-eb7e-3136ded0475c	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-4dfe-3cb35d6d37c7	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-6745-1a2c4bf2ea54	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-8c5e-8ce5e33fa7b5	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-7db0-2328e2e947ab	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-3884-97334e13c26c	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-76a4-9d3481cd0194	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-a207-7f695dfccf22	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-8af1-732505dde413	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5697-8b09-0c75-5366eb170072	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-bb20-72b1050afe47	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-2a1a-7c182774ead5	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-a13d-f5290375ccac	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-8e70-8940c7cb8250	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-1e70-e231bad8c42e	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-bdc3-248331ec6d41	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-82f2-bd8ca0e68b97	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-a32e-1cb5c5a62e51	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-e607-df38eba854b9	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-b75f-3024e6775c68	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-9a6f-bd780d1d3852	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-d464-e745127ce784	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-d4dd-b954a684dd26	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-cb4c-80a7e6cd35ab	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-1c3f-d53786e252b7	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-0d1e-834c444e0c32	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-caae-0983259fcd4c	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5697-8b09-aa75-caa9b5359e34	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3133 (class 0 OID 36234044)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5697-8b07-de14-6faf2629558a	00020000-5697-8b07-be35-f61afcfddd3a
00010000-5697-8b07-ecf5-914031848478	00020000-5697-8b07-be35-f61afcfddd3a
00010000-5697-8b09-953d-8d4ef61d8743	00020000-5697-8b09-ea30-4733dec96986
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-7acf-14f5f79e621a
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-28d3-e96838080938
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-5001-43656538eb62
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-eb7e-3136ded0475c
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-6745-1a2c4bf2ea54
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-a207-7f695dfccf22
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-d706-2d0a8def198c
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-0c75-5366eb170072
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-a13d-f5290375ccac
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-1e70-e231bad8c42e
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-82f2-bd8ca0e68b97
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-e607-df38eba854b9
00010000-5697-8b09-8456-66a7bd767531	00020000-5697-8b09-d4dd-b954a684dd26
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-7acf-14f5f79e621a
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-3ad5-df6872673968
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-d706-2d0a8def198c
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-ee48-d4170c85038d
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-6745-1a2c4bf2ea54
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-3884-97334e13c26c
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-0c75-5366eb170072
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-a13d-f5290375ccac
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-1e70-e231bad8c42e
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-82f2-bd8ca0e68b97
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-e607-df38eba854b9
00010000-5697-8b09-ccab-907c9c234ff6	00020000-5697-8b09-d4dd-b954a684dd26
00010000-5697-8b09-2971-f6411cca7eda	00020000-5697-8b09-7acf-14f5f79e621a
00010000-5697-8b09-2971-f6411cca7eda	00020000-5697-8b09-3ad5-df6872673968
00010000-5697-8b09-2971-f6411cca7eda	00020000-5697-8b09-d706-2d0a8def198c
00010000-5697-8b09-2971-f6411cca7eda	00020000-5697-8b09-ee48-d4170c85038d
00010000-5697-8b09-2971-f6411cca7eda	00020000-5697-8b09-eb7e-3136ded0475c
00010000-5697-8b09-2971-f6411cca7eda	00020000-5697-8b09-6745-1a2c4bf2ea54
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-3ad5-df6872673968
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-baf5-7527428d7509
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-3f67-407be72cbc3f
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-4dfe-3cb35d6d37c7
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-eb7e-3136ded0475c
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-76a4-9d3481cd0194
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-6745-1a2c4bf2ea54
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-8c5e-8ce5e33fa7b5
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-0c75-5366eb170072
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-bb20-72b1050afe47
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-a13d-f5290375ccac
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-8e70-8940c7cb8250
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-1e70-e231bad8c42e
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-bdc3-248331ec6d41
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-82f2-bd8ca0e68b97
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-a32e-1cb5c5a62e51
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-e607-df38eba854b9
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-b75f-3024e6775c68
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-d4dd-b954a684dd26
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-cb4c-80a7e6cd35ab
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-0d1e-834c444e0c32
00010000-5697-8b09-bdbb-77f1508b2a87	00020000-5697-8b09-caae-0983259fcd4c
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-3ad5-df6872673968
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-baf5-7527428d7509
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-dbba-e49c3872e8c3
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-3f67-407be72cbc3f
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-4dfe-3cb35d6d37c7
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-eb7e-3136ded0475c
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-76a4-9d3481cd0194
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-6745-1a2c4bf2ea54
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-8c5e-8ce5e33fa7b5
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-7db0-2328e2e947ab
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-0c75-5366eb170072
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-bb20-72b1050afe47
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-2a1a-7c182774ead5
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-a13d-f5290375ccac
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-8e70-8940c7cb8250
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-1e70-e231bad8c42e
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-bdc3-248331ec6d41
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-82f2-bd8ca0e68b97
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-a32e-1cb5c5a62e51
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-e607-df38eba854b9
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-b75f-3024e6775c68
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-d4dd-b954a684dd26
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-cb4c-80a7e6cd35ab
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-1c3f-d53786e252b7
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-0d1e-834c444e0c32
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-caae-0983259fcd4c
00010000-5697-8b09-24c5-f7171f44f75c	00020000-5697-8b09-aa75-caa9b5359e34
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-3ad5-df6872673968
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-d706-2d0a8def198c
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-baf5-7527428d7509
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-5879-b27c71841e31
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-dbba-e49c3872e8c3
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-28d3-e96838080938
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-3f67-407be72cbc3f
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-4dfe-3cb35d6d37c7
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-eb7e-3136ded0475c
00010000-5697-8b09-b8f3-11e9fb86e97e	00020000-5697-8b09-76a4-9d3481cd0194
00010000-5697-8b09-9bf9-f84681df9dbc	00020000-5697-8b09-7acf-14f5f79e621a
00010000-5697-8b09-9bf9-f84681df9dbc	00020000-5697-8b09-ee48-d4170c85038d
00010000-5697-8b09-9bf9-f84681df9dbc	00020000-5697-8b09-28d3-e96838080938
00010000-5697-8b09-9bf9-f84681df9dbc	00020000-5697-8b09-5001-43656538eb62
00010000-5697-8b09-9bf9-f84681df9dbc	00020000-5697-8b09-eb7e-3136ded0475c
00010000-5697-8b09-9bf9-f84681df9dbc	00020000-5697-8b09-6745-1a2c4bf2ea54
00010000-5697-8b09-9bf9-f84681df9dbc	00020000-5697-8b09-a207-7f695dfccf22
00010000-5697-8b09-9bf9-f84681df9dbc	00020000-5697-8b09-9a6f-bd780d1d3852
00010000-5697-8b09-268e-2bf8a178e8a0	00020000-5697-8b09-8af1-732505dde413
00010000-5697-8b09-41d1-36ba9e5b942a	00020000-5697-8b07-74b7-d93eff7c3ca0
00010000-5697-8b09-1546-f02edcbe3d5a	00020000-5697-8b07-05c7-27060958e910
00010000-5697-8b09-434e-d82f2cc2c83e	00020000-5697-8b07-c103-f1ed30894272
00010000-5697-8b09-9558-de7a024aa47e	00020000-5697-8b07-eeed-86b0c274b8f8
00010000-5697-8b09-ec8c-dbdb87ba9d3d	00020000-5697-8b07-266a-c87ec09f399f
00010000-5697-8b09-1a5e-d90f2b10674c	00020000-5697-8b07-d7be-9f9abaa02165
00010000-5697-8b09-2729-e89769da4da6	00020000-5697-8b07-6dd4-45946cd0c467
\.


--
-- TOC entry 3181 (class 0 OID 36234519)
-- Dependencies: 225
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 36234457)
-- Dependencies: 217
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 36234380)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5697-8b09-214c-5419a8bbc6e1	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5697-8b09-6dde-bf322b8586d4	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5697-8b09-90bf-0d81fb33afa9	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3129 (class 0 OID 36234009)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5697-8b06-ab2b-faf2d767bb3e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5697-8b06-0bf3-08c8c293ec4a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5697-8b06-35a4-16e9d98a7f61	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5697-8b06-cb39-01eb697fda38	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5697-8b06-7881-69e36d71b465	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3128 (class 0 OID 36234001)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5697-8b06-ad20-9a7b734c1b48	00230000-5697-8b06-cb39-01eb697fda38	popa
00240000-5697-8b06-54be-e376e393ae19	00230000-5697-8b06-cb39-01eb697fda38	oseba
00240000-5697-8b06-216a-037e9f893076	00230000-5697-8b06-cb39-01eb697fda38	tippopa
00240000-5697-8b06-6ee8-f5410c3bb3b3	00230000-5697-8b06-cb39-01eb697fda38	organizacijskaenota
00240000-5697-8b06-f2d2-20bd03657b71	00230000-5697-8b06-cb39-01eb697fda38	sezona
00240000-5697-8b06-8088-1d9253b102f2	00230000-5697-8b06-cb39-01eb697fda38	tipvaje
00240000-5697-8b06-a19a-a406f9e72d3a	00230000-5697-8b06-cb39-01eb697fda38	tipdodatka
00240000-5697-8b06-9719-561edab2c31e	00230000-5697-8b06-0bf3-08c8c293ec4a	prostor
00240000-5697-8b06-92ea-828d0a6670e8	00230000-5697-8b06-cb39-01eb697fda38	besedilo
00240000-5697-8b06-737f-9a2413648633	00230000-5697-8b06-cb39-01eb697fda38	uprizoritev
00240000-5697-8b06-852e-3f0991a5c644	00230000-5697-8b06-cb39-01eb697fda38	funkcija
00240000-5697-8b06-d5e7-460a85fedbe8	00230000-5697-8b06-cb39-01eb697fda38	tipfunkcije
00240000-5697-8b06-85a2-4b6fda597d0e	00230000-5697-8b06-cb39-01eb697fda38	alternacija
00240000-5697-8b06-36da-d7042eac1bca	00230000-5697-8b06-ab2b-faf2d767bb3e	pogodba
00240000-5697-8b06-8f7d-623f13d2480e	00230000-5697-8b06-cb39-01eb697fda38	zaposlitev
00240000-5697-8b06-f6a2-70a988da0fe0	00230000-5697-8b06-cb39-01eb697fda38	zvrstuprizoritve
00240000-5697-8b06-9d60-084516849ce5	00230000-5697-8b06-ab2b-faf2d767bb3e	programdela
00240000-5697-8b06-5c23-36328a066826	00230000-5697-8b06-cb39-01eb697fda38	zapis
\.


--
-- TOC entry 3127 (class 0 OID 36233996)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
32f7733f-7740-4e8c-a843-1fcff3c8a5f0	00240000-5697-8b06-ad20-9a7b734c1b48	0	1001
\.


--
-- TOC entry 3187 (class 0 OID 36234580)
-- Dependencies: 231
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5697-8b0a-f211-4a6209792019	000e0000-5697-8b0a-be0b-8c9791c2ba27	00080000-5697-8b09-e031-63a8e59ce697	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5697-8b06-3163-83f3ab80817d
00270000-5697-8b0a-32d6-b9b654bfa8aa	000e0000-5697-8b0a-be0b-8c9791c2ba27	00080000-5697-8b09-e031-63a8e59ce697	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5697-8b06-3163-83f3ab80817d
\.


--
-- TOC entry 3143 (class 0 OID 36234144)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 36234390)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, zasedenost, virtzasedenost) FROM stdin;
001a0000-5697-8b0a-3fee-58f4010be6b5	00180000-5697-8b0a-851a-bda53ca489da	000c0000-5697-8b0a-e066-128d6c8a6793	00090000-5697-8b09-cd76-f25e6c9d7844	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-8b0a-22a5-93777df806ee	00180000-5697-8b0a-851a-bda53ca489da	000c0000-5697-8b0a-a516-e79581fc0dec	00090000-5697-8b09-8aef-49ee70ab18e0	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-8b0a-f235-27ff2bdedd9c	00180000-5697-8b0a-851a-bda53ca489da	000c0000-5697-8b0a-69a7-ab1aa6bf2fe9	00090000-5697-8b09-a484-b1cc011b60eb	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-8b0a-a092-8c8c8d458e99	00180000-5697-8b0a-851a-bda53ca489da	000c0000-5697-8b0a-3acb-e17115fae43d	00090000-5697-8b09-d7b2-92820ee7fc92	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-8b0a-d162-d6ff18a3b5f9	00180000-5697-8b0a-851a-bda53ca489da	000c0000-5697-8b0a-ed44-6d7324f53248	00090000-5697-8b09-6ae8-815d581e1541	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-8b0a-7e01-3af72297e803	00180000-5697-8b0a-65dc-b8208b7f7d13	\N	00090000-5697-8b09-6ae8-815d581e1541	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N
001a0000-5697-8b0a-594b-2f20726226b5	00180000-5697-8b0a-65dc-b8208b7f7d13	\N	00090000-5697-8b09-8aef-49ee70ab18e0	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N
\.


--
-- TOC entry 3167 (class 0 OID 36234407)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5697-8b06-b17e-cad618b00f3f	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5697-8b06-ec18-f4c23ddd1a6e	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5697-8b06-6083-70db07fa3aca	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5697-8b06-8351-b3df2ad81ac6	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5697-8b06-7070-9936b8276c6b	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5697-8b06-5b3a-7459958d60c7	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3190 (class 0 OID 36234621)
-- Dependencies: 234
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5697-8b06-204a-917ab1b0faf7	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5697-8b06-8a87-bfb232834471	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5697-8b06-4fb6-b42fc29356c0	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5697-8b06-da5f-7841453b995c	04	Režija	Režija	Režija	umetnik	30
000f0000-5697-8b06-bc53-0f8fd17107dc	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5697-8b06-8c2f-5d719a1707eb	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5697-8b06-9114-0093bb253e76	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5697-8b06-977f-e235840aad96	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5697-8b06-c3ce-d366ed53873e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5697-8b06-99c1-e96591b02054	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5697-8b06-ce6c-6d17cae4bcab	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5697-8b06-d499-8b323d017dba	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5697-8b06-f5ec-686b501e5624	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5697-8b06-c71d-b31239ea8a8b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5697-8b06-c23c-cff4f882ed5f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5697-8b06-5612-656f1c87c5cc	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5697-8b06-a19c-e121a2f6f74c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5697-8b06-212a-f6df38a5a4f0	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5697-8b06-7851-1a1c30cdeb7a	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3140 (class 0 OID 36234095)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5697-8b09-2c5a-b549def7ab05	0001	šola	osnovna ali srednja šola
00400000-5697-8b09-d3c2-f77ad8d19530	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5697-8b09-3d28-949e82a3d6f2	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3203 (class 0 OID 36234925)
-- Dependencies: 247
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5697-8b06-1905-bb3cd27a71a6	01	Velika predstava	f	1.00	1.00
002b0000-5697-8b06-b46a-4443fc7129fa	02	Mala predstava	f	0.50	0.50
002b0000-5697-8b06-70e1-c335886b9b4a	03	Mala koprodukcija	t	0.40	1.00
002b0000-5697-8b06-e9fd-f2dd90683d64	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5697-8b06-4a19-520100a0cad8	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3163 (class 0 OID 36234370)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5697-8b06-cde1-ba81353168d8	0001	prva vaja	prva vaja
00420000-5697-8b06-5422-b8d8e39d2519	0002	tehnična vaja	tehnična vaja
00420000-5697-8b06-62db-6eb29fe6447d	0003	lučna vaja	lučna vaja
00420000-5697-8b06-cb41-bd48df4f4902	0004	kostumska vaja	kostumska vaja
00420000-5697-8b06-726b-4490489d03a0	0005	foto vaja	foto vaja
00420000-5697-8b06-7af0-429d37545afd	0006	1. glavna vaja	1. glavna vaja
00420000-5697-8b06-8645-c34b009b5c9b	0007	2. glavna vaja	2. glavna vaja
00420000-5697-8b06-65e3-6166224613bc	0008	1. generalka	1. generalka
00420000-5697-8b06-291e-409c4ce32133	0009	2. generalka	2. generalka
00420000-5697-8b06-856e-4b38a79da8aa	0010	odprta generalka	odprta generalka
00420000-5697-8b06-20c8-912f9e3973f5	0011	obnovitvena vaja	obnovitvena vaja
00420000-5697-8b06-20ee-06f4c45c626e	0012	italijanka	krajša "obnovitvena" vaja
00420000-5697-8b06-70cb-f427540b09f5	0013	pevska vaja	pevska vaja
00420000-5697-8b06-5a44-c171d4d1ef20	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5697-8b06-ab76-d4a1d6c833ea	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5697-8b06-3768-6378dc0923d2	0016	orientacijska vaja	orientacijska vaja
00420000-5697-8b06-8639-364481335f63	0017	situacijska vaja	situacijska vaja
00420000-5697-8b06-7d48-6c50d6df629e	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3149 (class 0 OID 36234217)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 36234031)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5697-8b07-ecf5-914031848478	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROJfEzgWoA7s0qtFmUIBBP96/bzYq4GHW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5697-8b09-53e1-704cdab76353	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5697-8b09-2753-269ae3c5fb6e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5697-8b09-9f3c-a5609fd81395	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5697-8b09-b0a4-c4f71fdbbd16	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5697-8b09-66d3-18337799612f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5697-8b09-034d-629c4ac6fd46	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5697-8b09-6765-0c8a00aebd84	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5697-8b09-e7ee-285b5a7d18a9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5697-8b09-ca76-f2b6a6d0326e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5697-8b09-953d-8d4ef61d8743	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5697-8b09-0493-03a6cf9a7595	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5697-8b09-8456-66a7bd767531	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5697-8b09-ccab-907c9c234ff6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5697-8b09-2971-f6411cca7eda	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5697-8b09-bdbb-77f1508b2a87	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5697-8b09-24c5-f7171f44f75c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5697-8b09-b8f3-11e9fb86e97e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5697-8b09-9bf9-f84681df9dbc	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5697-8b09-268e-2bf8a178e8a0	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5697-8b09-41d1-36ba9e5b942a	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5697-8b09-1546-f02edcbe3d5a	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5697-8b09-434e-d82f2cc2c83e	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5697-8b09-9558-de7a024aa47e	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5697-8b09-ec8c-dbdb87ba9d3d	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5697-8b09-1a5e-d90f2b10674c	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5697-8b09-2729-e89769da4da6	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5697-8b07-de14-6faf2629558a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3194 (class 0 OID 36234671)
-- Dependencies: 238
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5697-8b0a-2654-c6f4aa950555	00160000-5697-8b09-468f-6b0dc49a6d82	\N	00140000-5697-8b06-9d3b-bef75bdc689c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5697-8b09-cce1-e8da58b37423
000e0000-5697-8b0a-be0b-8c9791c2ba27	00160000-5697-8b09-e465-1326c333acb4	\N	00140000-5697-8b06-46b2-3d0b29ddd436	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5697-8b09-692c-4536bbaac7c5
000e0000-5697-8b0a-5de2-82ccc4ee5ff1	\N	\N	00140000-5697-8b06-46b2-3d0b29ddd436	00190000-5697-8b09-511d-9468f2145c2a	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-8b09-cce1-e8da58b37423
000e0000-5697-8b0a-94f5-794142394df8	\N	\N	00140000-5697-8b06-46b2-3d0b29ddd436	00190000-5697-8b09-511d-9468f2145c2a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-8b09-cce1-e8da58b37423
000e0000-5697-8b0a-5b45-cd095e402952	\N	\N	00140000-5697-8b06-46b2-3d0b29ddd436	00190000-5697-8b09-511d-9468f2145c2a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-6766-318bf4b9e1fb	\N	\N	00140000-5697-8b06-46b2-3d0b29ddd436	00190000-5697-8b09-511d-9468f2145c2a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-902a-6db4ba92812f	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-3c5d-fa89b393d418	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-59d3-ab5096b93147	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-d7ed-03717daac86e	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-fcb8-ada74cf1c20f	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-dfad-f1f81502afab	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-a87d-df35d624e0bb	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-9092-144686a40dda	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
000e0000-5697-8b0a-4c01-1f730048fb1c	\N	\N	00140000-5697-8b06-1bbf-2f513ce285d9	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-8b09-c468-567e57c4aafb
\.


--
-- TOC entry 3157 (class 0 OID 36234313)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5697-8b0a-590d-4d79fc98f882	\N	000e0000-5697-8b0a-be0b-8c9791c2ba27	1
00200000-5697-8b0a-1181-806e5e31176c	\N	000e0000-5697-8b0a-be0b-8c9791c2ba27	2
00200000-5697-8b0a-16f6-c7099b1339d3	\N	000e0000-5697-8b0a-be0b-8c9791c2ba27	3
00200000-5697-8b0a-0c82-07628b0205b9	\N	000e0000-5697-8b0a-be0b-8c9791c2ba27	4
00200000-5697-8b0a-7629-0b787b1386e7	\N	000e0000-5697-8b0a-be0b-8c9791c2ba27	5
\.


--
-- TOC entry 3177 (class 0 OID 36234484)
-- Dependencies: 221
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 36234594)
-- Dependencies: 232
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5697-8b06-355b-e7603a877de0	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5697-8b06-4848-c0d891ad8717	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5697-8b06-19c3-68e0aa5f730e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5697-8b06-586a-8c59876d5822	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5697-8b06-8ee5-9952a16f1477	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5697-8b06-a9a3-5ca116a71f7a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5697-8b06-9dc4-84d570aeb54d	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5697-8b06-35d7-e2731aa5a91b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5697-8b06-3163-83f3ab80817d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5697-8b06-6a7d-b8fe0c2e02d5	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5697-8b06-ee76-3ce3cc562a27	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5697-8b06-73d0-c10b7c17e502	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5697-8b06-917d-eed800777405	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5697-8b06-c287-84be0f25c989	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5697-8b06-37e7-1f6a532a529c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5697-8b06-a0a5-0cdf33bb7853	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5697-8b06-3c3d-52caed42bccd	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5697-8b06-88cb-872d54277c01	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5697-8b06-aeac-9db55ab9bed7	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5697-8b06-e159-029304a46b58	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5697-8b06-8705-4e71937981ad	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5697-8b06-bee0-32d76ac45851	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5697-8b06-b85c-569d1f43bea6	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5697-8b06-8a89-fbcc40c2c471	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5697-8b06-723d-b7f902a5c793	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5697-8b06-f811-c0a236d6ae0d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5697-8b06-8fa0-37c1f184068d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5697-8b06-7fec-a343c61f034f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3206 (class 0 OID 36234975)
-- Dependencies: 250
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 36234944)
-- Dependencies: 249
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 36234987)
-- Dependencies: 251
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 36234556)
-- Dependencies: 228
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5697-8b09-2686-b182c8b36f47	00090000-5697-8b09-8aef-49ee70ab18e0	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-8b09-c452-e27f78bd6d32	00090000-5697-8b09-a484-b1cc011b60eb	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-8b09-0b62-57e0b8b544f3	00090000-5697-8b09-93e0-9fe337fca174	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-8b09-ed0c-c387143613d4	00090000-5697-8b09-a20f-29bca03c0dbe	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-8b09-18b8-47c79f9ae8d8	00090000-5697-8b09-2262-6f6111feadc2	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-8b09-40eb-57cac78624be	00090000-5697-8b09-6857-4232c87d013e	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3160 (class 0 OID 36234354)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 36234661)
-- Dependencies: 237
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5697-8b06-9d3b-bef75bdc689c	01	Drama	drama (SURS 01)
00140000-5697-8b06-584e-cbd992887e74	02	Opera	opera (SURS 02)
00140000-5697-8b06-498e-c8c9786dcd5c	03	Balet	balet (SURS 03)
00140000-5697-8b06-f7ff-35f1d517d93e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5697-8b06-1bbf-2f513ce285d9	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5697-8b06-46b2-3d0b29ddd436	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5697-8b06-04d6-b886ef0a1fdd	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3183 (class 0 OID 36234546)
-- Dependencies: 227
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2608 (class 2606 OID 36234094)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 36234719)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 36234710)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 36234085)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 36234577)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 36234619)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 36235028)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 36234404)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 36234342)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 36234364)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 36234369)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 36234942)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 36234243)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 36234788)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 36234542)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 36234311)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 36234281)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 36234257)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 36234449)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 36235005)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 36235012)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2900 (class 2606 OID 36235036)
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
-- TOC entry 2758 (class 2606 OID 36234476)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 36234215)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 36234113)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 36234177)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 36234140)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 36234074)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2597 (class 2606 OID 36234059)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 36234482)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 36234518)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 36234656)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 36234168)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 36234203)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 36234893)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 36234455)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 36234193)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 36234327)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 36234299)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2675 (class 2606 OID 36234291)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 36234423)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 36234467)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 36234902)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 36234910)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 36234880)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 36234923)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 36234500)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 36234440)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 36234431)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 36234643)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 36234570)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 36234269)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 36234030)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 36234509)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 36234048)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2599 (class 2606 OID 36234068)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 36234527)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 36234462)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 36234388)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 36234018)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 36234006)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 36234000)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 36234590)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 36234149)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 36234396)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 36234414)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 36234630)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 36234102)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 36234935)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 36234377)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 36234228)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 36234043)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 36234689)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 36234317)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 36234490)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 36234602)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 36234985)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 36234969)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 36234993)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 36234560)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 36234358)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 36234669)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 36234554)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 1259 OID 36234352)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2692 (class 1259 OID 36234353)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2693 (class 1259 OID 36234351)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2694 (class 1259 OID 36234350)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2695 (class 1259 OID 36234349)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2801 (class 1259 OID 36234591)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2802 (class 1259 OID 36234592)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2803 (class 1259 OID 36234593)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2886 (class 1259 OID 36235007)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2887 (class 1259 OID 36235006)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2626 (class 1259 OID 36234170)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2627 (class 1259 OID 36234171)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2759 (class 1259 OID 36234483)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2873 (class 1259 OID 36234973)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2874 (class 1259 OID 36234972)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2875 (class 1259 OID 36234974)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2876 (class 1259 OID 36234971)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2877 (class 1259 OID 36234970)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2753 (class 1259 OID 36234469)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2754 (class 1259 OID 36234468)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2683 (class 1259 OID 36234318)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2684 (class 1259 OID 36234319)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2783 (class 1259 OID 36234543)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 36234545)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2785 (class 1259 OID 36234544)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 36234259)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 36234258)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 36234924)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2817 (class 1259 OID 36234658)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2818 (class 1259 OID 36234659)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2819 (class 1259 OID 36234660)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2883 (class 1259 OID 36234994)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2826 (class 1259 OID 36234694)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2827 (class 1259 OID 36234691)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2828 (class 1259 OID 36234695)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2829 (class 1259 OID 36234693)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2830 (class 1259 OID 36234692)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2648 (class 1259 OID 36234230)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 36234229)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 36234143)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2771 (class 1259 OID 36234510)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2601 (class 1259 OID 36234075)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2602 (class 1259 OID 36234076)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2776 (class 1259 OID 36234530)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2777 (class 1259 OID 36234529)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2778 (class 1259 OID 36234528)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2631 (class 1259 OID 36234180)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2632 (class 1259 OID 36234179)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2633 (class 1259 OID 36234181)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2671 (class 1259 OID 36234294)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2672 (class 1259 OID 36234292)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 36234293)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2581 (class 1259 OID 36234008)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2733 (class 1259 OID 36234435)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2734 (class 1259 OID 36234433)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2735 (class 1259 OID 36234432)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2736 (class 1259 OID 36234434)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 36234049)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 36234050)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2762 (class 1259 OID 36234491)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2896 (class 1259 OID 36235029)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2799 (class 1259 OID 36234579)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2800 (class 1259 OID 36234578)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2897 (class 1259 OID 36235037)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2898 (class 1259 OID 36235038)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2748 (class 1259 OID 36234456)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2793 (class 1259 OID 36234571)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2794 (class 1259 OID 36234572)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2846 (class 1259 OID 36234793)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2847 (class 1259 OID 36234792)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2848 (class 1259 OID 36234789)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2849 (class 1259 OID 36234790)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2850 (class 1259 OID 36234791)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2637 (class 1259 OID 36234195)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 36234194)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2639 (class 1259 OID 36234196)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2765 (class 1259 OID 36234504)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2766 (class 1259 OID 36234503)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2856 (class 1259 OID 36234903)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2857 (class 1259 OID 36234904)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2839 (class 1259 OID 36234723)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2840 (class 1259 OID 36234724)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2841 (class 1259 OID 36234721)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2842 (class 1259 OID 36234722)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2729 (class 1259 OID 36234424)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2723 (class 1259 OID 36234405)
-- Name: idx_aab095ce1d25995; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce1d25995 ON dodatek USING btree (prisotnost_id);


--
-- TOC entry 2724 (class 1259 OID 36234406)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2789 (class 1259 OID 36234561)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2790 (class 1259 OID 36234562)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2739 (class 1259 OID 36234444)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2740 (class 1259 OID 36234443)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2741 (class 1259 OID 36234441)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2742 (class 1259 OID 36234442)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2836 (class 1259 OID 36234711)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2662 (class 1259 OID 36234270)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2665 (class 1259 OID 36234284)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2666 (class 1259 OID 36234283)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2667 (class 1259 OID 36234282)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 36234285)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2682 (class 1259 OID 36234312)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 36234300)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2677 (class 1259 OID 36234301)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2853 (class 1259 OID 36234894)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2872 (class 1259 OID 36234943)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2890 (class 1259 OID 36235013)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2891 (class 1259 OID 36235014)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 36234115)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 36234114)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2622 (class 1259 OID 36234150)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 36234151)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 36234359)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 36234399)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 36234398)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2718 (class 1259 OID 36234397)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 36234344)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2697 (class 1259 OID 36234345)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2698 (class 1259 OID 36234348)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2699 (class 1259 OID 36234343)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2700 (class 1259 OID 36234347)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2701 (class 1259 OID 36234346)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2630 (class 1259 OID 36234169)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 36234103)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 36234104)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2654 (class 1259 OID 36234244)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 36234246)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2656 (class 1259 OID 36234245)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2657 (class 1259 OID 36234247)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2747 (class 1259 OID 36234450)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2822 (class 1259 OID 36234657)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 36234690)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2813 (class 1259 OID 36234631)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2814 (class 1259 OID 36234632)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2620 (class 1259 OID 36234141)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 36234142)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2727 (class 1259 OID 36234415)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 36234416)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2786 (class 1259 OID 36234555)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 36234019)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 36234216)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2636 (class 1259 OID 36234178)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 36234007)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2869 (class 1259 OID 36234936)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2769 (class 1259 OID 36234502)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2770 (class 1259 OID 36234501)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 36234378)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 36234379)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2843 (class 1259 OID 36234720)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2732 (class 1259 OID 36234425)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2644 (class 1259 OID 36234204)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 36234670)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2880 (class 1259 OID 36234986)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2862 (class 1259 OID 36234911)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2863 (class 1259 OID 36234912)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2810 (class 1259 OID 36234620)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2715 (class 1259 OID 36234389)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 36234069)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2935 (class 2606 OID 36235209)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2936 (class 2606 OID 36235214)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 36235239)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2939 (class 2606 OID 36235229)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2934 (class 2606 OID 36235204)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2938 (class 2606 OID 36235224)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2940 (class 2606 OID 36235234)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2937 (class 2606 OID 36235219)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2979 (class 2606 OID 36235429)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2980 (class 2606 OID 36235434)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2981 (class 2606 OID 36235439)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3013 (class 2606 OID 36235599)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3012 (class 2606 OID 36235594)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2912 (class 2606 OID 36235094)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2913 (class 2606 OID 36235099)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2962 (class 2606 OID 36235344)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3009 (class 2606 OID 36235579)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3008 (class 2606 OID 36235574)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 36235584)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3007 (class 2606 OID 36235569)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3006 (class 2606 OID 36235564)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2961 (class 2606 OID 36235339)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2960 (class 2606 OID 36235334)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2932 (class 2606 OID 36235194)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2933 (class 2606 OID 36235199)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2970 (class 2606 OID 36235384)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2972 (class 2606 OID 36235394)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2971 (class 2606 OID 36235389)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2923 (class 2606 OID 36235149)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2922 (class 2606 OID 36235144)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 36235324)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3004 (class 2606 OID 36235554)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2982 (class 2606 OID 36235444)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 36235449)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 36235454)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3011 (class 2606 OID 36235589)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2988 (class 2606 OID 36235474)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2985 (class 2606 OID 36235459)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 36235479)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2987 (class 2606 OID 36235469)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2986 (class 2606 OID 36235464)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2921 (class 2606 OID 36235139)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 36235134)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2909 (class 2606 OID 36235079)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2908 (class 2606 OID 36235074)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2966 (class 2606 OID 36235364)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2904 (class 2606 OID 36235054)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2905 (class 2606 OID 36235059)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2969 (class 2606 OID 36235379)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2968 (class 2606 OID 36235374)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2967 (class 2606 OID 36235369)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2915 (class 2606 OID 36235109)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2914 (class 2606 OID 36235104)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2916 (class 2606 OID 36235114)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2928 (class 2606 OID 36235174)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 36235164)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2927 (class 2606 OID 36235169)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2901 (class 2606 OID 36235039)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2953 (class 2606 OID 36235299)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2951 (class 2606 OID 36235289)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2950 (class 2606 OID 36235284)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2952 (class 2606 OID 36235294)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2902 (class 2606 OID 36235044)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2903 (class 2606 OID 36235049)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2963 (class 2606 OID 36235349)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3016 (class 2606 OID 36235614)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2978 (class 2606 OID 36235424)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 36235419)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3017 (class 2606 OID 36235619)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3018 (class 2606 OID 36235624)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2959 (class 2606 OID 36235329)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2975 (class 2606 OID 36235409)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2976 (class 2606 OID 36235414)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 36235529)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2998 (class 2606 OID 36235524)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2995 (class 2606 OID 36235509)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2996 (class 2606 OID 36235514)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2997 (class 2606 OID 36235519)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2918 (class 2606 OID 36235124)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2917 (class 2606 OID 36235119)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 36235129)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 36235359)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2964 (class 2606 OID 36235354)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 36235539)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3002 (class 2606 OID 36235544)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2993 (class 2606 OID 36235499)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2994 (class 2606 OID 36235504)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2991 (class 2606 OID 36235489)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2992 (class 2606 OID 36235494)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2948 (class 2606 OID 36235274)
-- Name: fk_a8171cf610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT fk_a8171cf610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 36235279)
-- Name: fk_a8171cf65e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT fk_a8171cf65e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2946 (class 2606 OID 36235264)
-- Name: fk_aab095ce1d25995; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce1d25995 FOREIGN KEY (prisotnost_id) REFERENCES prisotnost(id);


--
-- TOC entry 2947 (class 2606 OID 36235269)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2973 (class 2606 OID 36235399)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2974 (class 2606 OID 36235404)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2957 (class 2606 OID 36235319)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2956 (class 2606 OID 36235314)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2954 (class 2606 OID 36235304)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2955 (class 2606 OID 36235309)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2990 (class 2606 OID 36235484)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 36235154)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2925 (class 2606 OID 36235159)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 36235189)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 36235179)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2930 (class 2606 OID 36235184)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3000 (class 2606 OID 36235534)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3003 (class 2606 OID 36235549)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 36235559)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3014 (class 2606 OID 36235604)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3015 (class 2606 OID 36235609)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2907 (class 2606 OID 36235069)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2906 (class 2606 OID 36235064)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2910 (class 2606 OID 36235084)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2911 (class 2606 OID 36235089)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2942 (class 2606 OID 36235244)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 36235259)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 36235254)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2943 (class 2606 OID 36235249)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-14 12:48:29 CET

--
-- PostgreSQL database dump complete
--

