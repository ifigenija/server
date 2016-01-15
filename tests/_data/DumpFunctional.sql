--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-15 15:57:58 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 37017595)
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
-- TOC entry 241 (class 1259 OID 37018221)
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
-- TOC entry 240 (class 1259 OID 37018205)
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
-- TOC entry 183 (class 1259 OID 37017588)
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
-- TOC entry 182 (class 1259 OID 37017586)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 37018082)
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
-- TOC entry 234 (class 1259 OID 37018112)
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
-- TOC entry 255 (class 1259 OID 37018524)
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
-- TOC entry 212 (class 1259 OID 37017918)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 204 (class 1259 OID 37017837)
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
-- TOC entry 206 (class 1259 OID 37017869)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 37017874)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 37018446)
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
-- TOC entry 195 (class 1259 OID 37017740)
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
-- TOC entry 242 (class 1259 OID 37018234)
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
-- TOC entry 227 (class 1259 OID 37018040)
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
-- TOC entry 201 (class 1259 OID 37017811)
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
-- TOC entry 198 (class 1259 OID 37017780)
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
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 196 (class 1259 OID 37017757)
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
-- TOC entry 216 (class 1259 OID 37017954)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 37018504)
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
-- TOC entry 254 (class 1259 OID 37018517)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 37018539)
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
-- TOC entry 220 (class 1259 OID 37017979)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 37017714)
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
-- TOC entry 186 (class 1259 OID 37017614)
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
-- TOC entry 190 (class 1259 OID 37017681)
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
-- TOC entry 187 (class 1259 OID 37017625)
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
-- TOC entry 179 (class 1259 OID 37017560)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 37017579)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 37017986)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 37018020)
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
-- TOC entry 237 (class 1259 OID 37018153)
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
-- TOC entry 189 (class 1259 OID 37017661)
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
-- TOC entry 192 (class 1259 OID 37017706)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 37018390)
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
-- TOC entry 217 (class 1259 OID 37017960)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 191 (class 1259 OID 37017691)
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
-- TOC entry 203 (class 1259 OID 37017829)
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
-- TOC entry 199 (class 1259 OID 37017795)
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
-- TOC entry 200 (class 1259 OID 37017804)
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
-- TOC entry 219 (class 1259 OID 37017972)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 37018404)
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
-- TOC entry 246 (class 1259 OID 37018414)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 37018303)
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
-- TOC entry 247 (class 1259 OID 37018422)
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
-- TOC entry 223 (class 1259 OID 37018001)
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
-- TOC entry 215 (class 1259 OID 37017945)
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
-- TOC entry 214 (class 1259 OID 37017935)
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
-- TOC entry 236 (class 1259 OID 37018142)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 37018072)
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
-- TOC entry 197 (class 1259 OID 37017769)
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
-- TOC entry 176 (class 1259 OID 37017531)
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
-- TOC entry 175 (class 1259 OID 37017529)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 37018014)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 180 (class 1259 OID 37017569)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 37017553)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 37018028)
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
-- TOC entry 218 (class 1259 OID 37017966)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 37017889)
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
-- TOC entry 174 (class 1259 OID 37017518)
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
-- TOC entry 173 (class 1259 OID 37017510)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 172 (class 1259 OID 37017505)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 37018089)
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
-- TOC entry 188 (class 1259 OID 37017653)
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
-- TOC entry 211 (class 1259 OID 37017908)
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
-- TOC entry 213 (class 1259 OID 37017925)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 37018130)
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
-- TOC entry 185 (class 1259 OID 37017604)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 37018434)
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
-- TOC entry 208 (class 1259 OID 37017879)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 194 (class 1259 OID 37017726)
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
-- TOC entry 177 (class 1259 OID 37017540)
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
-- TOC entry 239 (class 1259 OID 37018180)
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
-- TOC entry 210 (class 1259 OID 37017899)
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
-- TOC entry 202 (class 1259 OID 37017822)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 37017993)
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
-- TOC entry 233 (class 1259 OID 37018103)
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
-- TOC entry 251 (class 1259 OID 37018484)
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
-- TOC entry 250 (class 1259 OID 37018453)
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
-- TOC entry 252 (class 1259 OID 37018496)
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
-- TOC entry 229 (class 1259 OID 37018065)
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
-- TOC entry 205 (class 1259 OID 37017863)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 37018170)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 37018055)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 37017591)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 37017534)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3150 (class 0 OID 37017595)
-- Dependencies: 184
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5699-08f3-160c-bb98a63ea683	10	30	Otroci	Abonma za otroke	200
000a0000-5699-08f3-17d8-48d2980370d2	20	60	Mladina	Abonma za mladino	400
000a0000-5699-08f3-0703-c76046abacdf	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3207 (class 0 OID 37018221)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5699-08f4-17ea-caa4c605c080	000d0000-5699-08f3-f802-6f612452eb54	\N	00090000-5699-08f3-df1a-bfc47513f3db	000b0000-5699-08f3-ffa9-60e79a325101	0001	f	\N	\N	\N	3	t	t	t
000c0000-5699-08f4-4177-e472d1dd85cf	000d0000-5699-08f3-01f7-0df6c6473716	00100000-5699-08f3-66cf-a2c19b1ad5ea	00090000-5699-08f3-546a-b81a0ab36a71	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5699-08f4-8ab7-667da938c232	000d0000-5699-08f3-7495-f35689732623	00100000-5699-08f3-8f8f-d07934583d18	00090000-5699-08f3-d1a9-d43c9d6dfe31	\N	0003	t	\N	2016-01-15	\N	2	t	f	f
000c0000-5699-08f4-adc5-b287925e5de4	000d0000-5699-08f3-0d2f-ed0b444b7932	\N	00090000-5699-08f3-40e1-e3e23df9e83f	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5699-08f4-7a80-9e071a364224	000d0000-5699-08f3-a20f-f6f13f49ea60	\N	00090000-5699-08f3-9511-947f2d3119fe	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5699-08f4-5d5f-734170992030	000d0000-5699-08f3-8381-04e6be90ef17	\N	00090000-5699-08f3-6273-b9c1eb3e4994	000b0000-5699-08f3-86ac-0c5f90907571	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5699-08f4-4e74-92196ed6bd92	000d0000-5699-08f3-3a7a-fc3ed860b1e4	00100000-5699-08f3-18d5-426fbc29736d	00090000-5699-08f3-3ded-6055312a987f	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5699-08f4-0c00-024442602218	000d0000-5699-08f3-88a7-82f93df4343d	\N	00090000-5699-08f3-ed06-373aabde8c9f	000b0000-5699-08f3-f992-28f5c61556c0	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5699-08f4-421c-1ccb2dbe18ba	000d0000-5699-08f3-3a7a-fc3ed860b1e4	00100000-5699-08f3-b198-0b8348b4c76d	00090000-5699-08f3-19df-434e8fbe5ca8	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5699-08f4-9410-6a650ef68b2b	000d0000-5699-08f3-3a7a-fc3ed860b1e4	00100000-5699-08f3-ceab-35740d465c23	00090000-5699-08f3-a829-2a8bc3d3ed91	\N	0010	t	\N	2016-01-15	\N	16	f	f	t
000c0000-5699-08f4-e392-b92eb9e07241	000d0000-5699-08f3-3a7a-fc3ed860b1e4	00100000-5699-08f3-1c4e-ca8438937a30	00090000-5699-08f3-a6f2-8bc2eeca3499	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5699-08f4-b0b1-7118b0c196d2	000d0000-5699-08f3-9f6a-cbc0ca0fba30	00100000-5699-08f3-66cf-a2c19b1ad5ea	00090000-5699-08f3-546a-b81a0ab36a71	000b0000-5699-08f3-cd06-4de6088990f9	0012	t	\N	\N	\N	2	t	t	t
000c0000-5699-08f4-f340-4ca63b8e1176	000d0000-5699-08f3-363c-9cfb5c661f35	\N	00090000-5699-08f3-ed06-373aabde8c9f	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-0857-f025a9fa11ec	000d0000-5699-08f3-363c-9cfb5c661f35	\N	00090000-5699-08f3-3026-823b5bd585f3	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5699-08f4-1ecb-f41fc9197d7f	000d0000-5699-08f3-4e06-a052b9ced15c	00100000-5699-08f3-8f8f-d07934583d18	00090000-5699-08f3-d1a9-d43c9d6dfe31	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-77d3-1fb8bbf7e7ca	000d0000-5699-08f3-4e06-a052b9ced15c	\N	00090000-5699-08f3-3026-823b5bd585f3	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5699-08f4-46d4-bdf45b547548	000d0000-5699-08f3-2253-e74aacaec3f6	\N	00090000-5699-08f3-3026-823b5bd585f3	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-9ec0-388c4e529a72	000d0000-5699-08f3-2253-e74aacaec3f6	\N	00090000-5699-08f3-ed06-373aabde8c9f	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5699-08f4-8e05-43534d9ea6e1	000d0000-5699-08f3-bcbc-effc85f85a60	00100000-5699-08f3-18d5-426fbc29736d	00090000-5699-08f3-3ded-6055312a987f	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-1424-83a8ed756f57	000d0000-5699-08f3-bcbc-effc85f85a60	\N	00090000-5699-08f3-3026-823b5bd585f3	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5699-08f4-ad61-c60b2d8512ab	000d0000-5699-08f3-014b-33b12b604fd2	\N	00090000-5699-08f3-3026-823b5bd585f3	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-c06b-1bebb4f9a3de	000d0000-5699-08f3-014b-33b12b604fd2	00100000-5699-08f3-18d5-426fbc29736d	00090000-5699-08f3-3ded-6055312a987f	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5699-08f4-9a84-76becae72229	000d0000-5699-08f3-b87d-c22a33b243ef	\N	00090000-5699-08f3-3026-823b5bd585f3	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-82dd-833359c274f4	000d0000-5699-08f3-8fa2-520232db44fc	\N	00090000-5699-08f3-ed06-373aabde8c9f	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-d8cb-415ac2650ddb	000d0000-5699-08f3-fa25-e1cb692c4c73	\N	00090000-5699-08f3-ed06-373aabde8c9f	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-dea8-1391d6f76d74	000d0000-5699-08f3-fa25-e1cb692c4c73	00100000-5699-08f3-8f8f-d07934583d18	00090000-5699-08f3-d1a9-d43c9d6dfe31	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5699-08f4-303e-786974f812c0	000d0000-5699-08f3-6d21-a51170f2360e	\N	00090000-5699-08f3-1b4c-cfb44082e7fb	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5699-08f4-ba8f-18db73774c1c	000d0000-5699-08f3-6d21-a51170f2360e	\N	00090000-5699-08f3-304f-cabe57b988f1	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5699-08f4-f425-f1bc08a59850	000d0000-5699-08f3-5740-f454f16a6ac3	\N	00090000-5699-08f3-ed06-373aabde8c9f	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5699-08f4-2a72-ac98e1016444	000d0000-5699-08f3-5740-f454f16a6ac3	00100000-5699-08f3-8f8f-d07934583d18	00090000-5699-08f3-d1a9-d43c9d6dfe31	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5699-08f4-ac1a-8c14ecf4c96a	000d0000-5699-08f3-5740-f454f16a6ac3	\N	00090000-5699-08f3-304f-cabe57b988f1	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5699-08f4-a201-85cc38d7fdd7	000d0000-5699-08f3-5740-f454f16a6ac3	\N	00090000-5699-08f3-1b4c-cfb44082e7fb	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5699-08f4-0920-d1f44e50b23b	000d0000-5699-08f3-c610-75614d9244ad	\N	00090000-5699-08f3-ed06-373aabde8c9f	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5699-08f4-4e70-e3aea41f75b6	000d0000-5699-08f3-95f1-50adb0a70697	00100000-5699-08f3-8f8f-d07934583d18	00090000-5699-08f3-d1a9-d43c9d6dfe31	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5699-08f4-d446-1b4544a8ea10	000d0000-5699-08f3-95f1-50adb0a70697	\N	00090000-5699-08f3-3026-823b5bd585f3	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3206 (class 0 OID 37018205)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 37017588)
-- Dependencies: 183
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 37018082)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5699-08f3-9952-1303450648e9	00160000-5699-08f3-cdea-f6ca1cae98f6	00090000-5699-08f3-304f-cabe57b988f1	aizv	10	t
003d0000-5699-08f3-c049-758ceed208af	00160000-5699-08f3-cdea-f6ca1cae98f6	00090000-5699-08f3-b4c4-5578c66f7cf7	apri	14	t
003d0000-5699-08f3-37c1-c32924acbee1	00160000-5699-08f3-1b15-68cbdfd84923	00090000-5699-08f3-1b4c-cfb44082e7fb	aizv	11	t
003d0000-5699-08f3-506a-0a63795fdb94	00160000-5699-08f3-48f1-61f38b0d5bff	00090000-5699-08f3-204e-4b13dbf64da1	aizv	12	t
003d0000-5699-08f3-4e9c-6b1fe72cabc7	00160000-5699-08f3-cdea-f6ca1cae98f6	00090000-5699-08f3-3026-823b5bd585f3	apri	18	f
\.


--
-- TOC entry 3200 (class 0 OID 37018112)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5699-08f3-cdea-f6ca1cae98f6	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5699-08f3-1b15-68cbdfd84923	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5699-08f3-48f1-61f38b0d5bff	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3221 (class 0 OID 37018524)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 37017918)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 37017837)
-- Dependencies: 204
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5699-08f4-d4ba-1f97f4235c75	\N	\N	00200000-5699-08f3-2226-4aa4c2b10ef3	\N	\N	\N	00220000-5699-08f3-3432-a6e5b15f1947	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5699-08f4-2467-f62fcaad1a55	\N	\N	00200000-5699-08f3-d961-8b5e4caeaf20	\N	\N	\N	00220000-5699-08f3-3432-a6e5b15f1947	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5699-08f4-75d7-b0a47b2eb4a9	\N	\N	00200000-5699-08f3-de2e-886ea4dcafed	\N	\N	\N	00220000-5699-08f3-36d8-0ec844c1991e	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5699-08f4-a594-a393d5624b8c	\N	\N	00200000-5699-08f4-95b5-78ea1a191024	\N	\N	\N	00220000-5699-08f3-4a13-24b30778c90b	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5699-08f4-da2e-713a9acf5a1b	\N	\N	00200000-5699-08f4-69ed-4744fd56541f	\N	\N	\N	00220000-5699-08f3-f8a3-816510100190	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3172 (class 0 OID 37017869)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 37017874)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 37018446)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 37017740)
-- Dependencies: 195
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5699-08f0-f6b5-589de40e3e9e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5699-08f0-6d29-c71b7b06e657	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5699-08f0-4b39-c067bb747079	AL	ALB	008	Albania 	Albanija	\N
00040000-5699-08f0-fa44-bc8c6fdeddc4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5699-08f0-0929-167ca4d6c9ce	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5699-08f0-7090-f5b2db6794c4	AD	AND	020	Andorra 	Andora	\N
00040000-5699-08f0-5597-a16bbfbd8b78	AO	AGO	024	Angola 	Angola	\N
00040000-5699-08f0-8155-67d5c44f7faf	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5699-08f0-1778-edf442c1c8ef	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5699-08f0-fd29-31daa0965af9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5699-08f0-b5e2-7636a2e8e504	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5699-08f0-31bf-e3bfadf84159	AM	ARM	051	Armenia 	Armenija	\N
00040000-5699-08f0-0fc7-2ac3060743c0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5699-08f0-a862-b0f1330b7ba7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5699-08f0-c735-4f5a712be1b4	AT	AUT	040	Austria 	Avstrija	\N
00040000-5699-08f0-293f-9441fc0074f1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5699-08f0-4525-b25340b0aad1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5699-08f0-406e-18667d98b484	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5699-08f0-cac9-08d0db7363d1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5699-08f0-b47a-44c4fbe6ee92	BB	BRB	052	Barbados 	Barbados	\N
00040000-5699-08f0-80b0-018a96575612	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5699-08f0-8a08-d21c71d83454	BE	BEL	056	Belgium 	Belgija	\N
00040000-5699-08f0-50cf-23534ca36071	BZ	BLZ	084	Belize 	Belize	\N
00040000-5699-08f0-921c-de18bd433b0e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5699-08f0-d118-a8384d291caa	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5699-08f0-6f37-a0eb56dd3347	BT	BTN	064	Bhutan 	Butan	\N
00040000-5699-08f0-8c07-565e3d970653	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5699-08f0-c40d-468184be7c0a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5699-08f0-52fc-e80ad73dbb30	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5699-08f0-a7ca-12eb759dc6ed	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5699-08f0-805c-6c1da9ae8f27	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5699-08f0-f1e2-e702844c8521	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5699-08f0-7be7-6b5eda49d43d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5699-08f0-628d-ce46554b9f29	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5699-08f0-173a-d809d79ef67c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5699-08f0-10c7-b0fb5c4b8ae6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5699-08f0-7ba3-1713ce7110a5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5699-08f0-9f04-38a31637ca09	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5699-08f0-1959-7a0e27cda2f2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5699-08f0-629c-70679b633cce	CA	CAN	124	Canada 	Kanada	\N
00040000-5699-08f0-03dd-0d65cd82c39f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5699-08f0-fb76-b6f04570afa2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5699-08f0-9d9b-720d0abb3139	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5699-08f0-f5ca-466357a9d34f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5699-08f0-1183-8f95ce6fe30c	CL	CHL	152	Chile 	Čile	\N
00040000-5699-08f0-145a-b016bd58e605	CN	CHN	156	China 	Kitajska	\N
00040000-5699-08f0-c20d-310fc8d24a96	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5699-08f0-6617-8a7131e3ee45	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5699-08f0-7f6d-b292bdd29e46	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5699-08f0-826a-29418df09905	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5699-08f0-c826-c4dd05690128	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5699-08f0-c8ae-b629e93cdc5e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5699-08f0-515f-6e4d85adaa21	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5699-08f0-00f1-3a9d69222d50	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5699-08f0-4f4f-412aa4343113	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5699-08f0-ff23-1844a661614e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5699-08f0-bca6-36f7eb17fa84	CU	CUB	192	Cuba 	Kuba	\N
00040000-5699-08f0-4c2f-3c7c0c3f2b3c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5699-08f0-e7f8-3e10ded19df1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5699-08f0-f5b6-51529b2793fc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5699-08f0-d230-f732df8828ec	DK	DNK	208	Denmark 	Danska	\N
00040000-5699-08f0-20cd-da1812e3c7dd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5699-08f0-1677-7f20929d0ba7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5699-08f0-d959-930326280c9a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5699-08f0-d65b-19a9c0766b1a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5699-08f0-4844-eda92346c2ce	EG	EGY	818	Egypt 	Egipt	\N
00040000-5699-08f0-8d3c-247d626a22c4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5699-08f0-95a8-d978f4c6dedb	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5699-08f0-0e99-8d300175b639	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5699-08f0-11d3-2923607e4c10	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5699-08f0-887b-d68feb1832b2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5699-08f0-6f68-c58af426d183	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5699-08f0-13de-368c199f8251	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5699-08f0-17d0-3b68e93f8963	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5699-08f0-02de-58ef151c2ba2	FI	FIN	246	Finland 	Finska	\N
00040000-5699-08f0-aea7-20f173aaf2a6	FR	FRA	250	France 	Francija	\N
00040000-5699-08f0-bfb6-53ba39ed90f9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5699-08f0-f934-a676b704efa5	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5699-08f0-bb27-a239376f45bf	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5699-08f0-f03e-164b31d02201	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5699-08f0-cf37-6e37f7f4acf4	GA	GAB	266	Gabon 	Gabon	\N
00040000-5699-08f0-03fe-0d25455574ad	GM	GMB	270	Gambia 	Gambija	\N
00040000-5699-08f0-ebcc-b9e0b6bf451f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5699-08f0-6450-766e5cb17996	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5699-08f0-3fa3-79833675d8b7	GH	GHA	288	Ghana 	Gana	\N
00040000-5699-08f0-e153-b3d289c9ad1d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5699-08f0-034d-d65bf0cc338f	GR	GRC	300	Greece 	Grčija	\N
00040000-5699-08f0-7154-74073a93b290	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5699-08f0-910b-c41105b4559b	GD	GRD	308	Grenada 	Grenada	\N
00040000-5699-08f0-693d-67314c86ab66	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5699-08f0-f08b-0a324ea47d47	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5699-08f0-3314-582857aa3b6a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5699-08f0-d467-57f0e6587928	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5699-08f0-f5b8-2d01235de3e4	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5699-08f0-3a90-174e2b0e0d25	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5699-08f0-d0e4-8215dadd50e8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5699-08f0-536f-0b3176f69f38	HT	HTI	332	Haiti 	Haiti	\N
00040000-5699-08f0-6603-c35c4792640d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5699-08f0-ac9b-3c91ce234575	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5699-08f0-104e-32b6831422b8	HN	HND	340	Honduras 	Honduras	\N
00040000-5699-08f0-a6a5-f69c48d6ec7f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5699-08f0-6ca0-974b3ffa745a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5699-08f0-b822-f585cd119701	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5699-08f0-3d7b-98da2fb31809	IN	IND	356	India 	Indija	\N
00040000-5699-08f0-17d5-1bd8aee2d05c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5699-08f0-9426-a1f739ae3773	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5699-08f0-1fdc-35754e660c66	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5699-08f0-844f-16e3261e243c	IE	IRL	372	Ireland 	Irska	\N
00040000-5699-08f0-0171-0d0313926362	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5699-08f0-6f99-fc71f503fd42	IL	ISR	376	Israel 	Izrael	\N
00040000-5699-08f0-ed6b-480f19d13afd	IT	ITA	380	Italy 	Italija	\N
00040000-5699-08f0-1730-dcf92d108aa6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5699-08f0-3ea4-4d696b8cdb54	JP	JPN	392	Japan 	Japonska	\N
00040000-5699-08f0-cb17-e6a97a7dc7ed	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5699-08f0-abc3-e35b2b650c72	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5699-08f0-b34a-fb0f0fd98b8f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5699-08f0-b3b5-19c1404ef6e4	KE	KEN	404	Kenya 	Kenija	\N
00040000-5699-08f0-6992-373faa805507	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5699-08f0-2007-9ffa1cd6549e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5699-08f0-ca1b-44a1f194996a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5699-08f0-0538-4d9bb2164b3c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5699-08f0-6b4e-9814e96d8905	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5699-08f0-7b4a-a86f567e8240	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5699-08f0-b06e-f6080a267adb	LV	LVA	428	Latvia 	Latvija	\N
00040000-5699-08f0-7706-9f0e55974b04	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5699-08f0-7af3-f49b9e479ab0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5699-08f0-c763-5174e09eddd8	LR	LBR	430	Liberia 	Liberija	\N
00040000-5699-08f0-cbd6-39e81a516263	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5699-08f0-c22e-daa3b36f07f0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5699-08f0-b93e-025f428122c3	LT	LTU	440	Lithuania 	Litva	\N
00040000-5699-08f0-ebef-28ec618436c5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5699-08f0-dbed-55412386d388	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5699-08f0-7f35-bd516d5fbb00	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5699-08f0-dc5c-b0e3565f7034	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5699-08f0-629d-8783bff9e6b8	MW	MWI	454	Malawi 	Malavi	\N
00040000-5699-08f0-8e5d-777d78672dd5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5699-08f0-11e4-5ee613ed0dd3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5699-08f0-6e0b-d0f2b7697abb	ML	MLI	466	Mali 	Mali	\N
00040000-5699-08f0-4fd1-fc90db57a693	MT	MLT	470	Malta 	Malta	\N
00040000-5699-08f0-072f-942168f0a69e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5699-08f0-0a21-b72919f78525	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5699-08f0-e46a-77d8e49e5e21	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5699-08f0-f373-46979aaf34f7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5699-08f0-0be9-46ef4bbf090f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5699-08f0-32fe-d1f684285331	MX	MEX	484	Mexico 	Mehika	\N
00040000-5699-08f0-5fc7-497056df7edc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5699-08f0-8632-c6fecb540a15	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5699-08f0-1a3b-372277657a0d	MC	MCO	492	Monaco 	Monako	\N
00040000-5699-08f0-24ce-52f73d1a1611	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5699-08f0-2f7e-5ab7e55df04e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5699-08f0-c1f5-2111e5087477	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5699-08f0-ad0c-979abe63150d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5699-08f0-b454-3bb07eca426e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5699-08f0-5151-832ab5e4fa1f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5699-08f0-62d7-49b5d9b5268f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5699-08f0-ae78-6a506f756ec5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5699-08f0-72a7-c2a995d91038	NP	NPL	524	Nepal 	Nepal	\N
00040000-5699-08f0-5799-e5ed330ca396	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5699-08f0-3b0a-667e8517880c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5699-08f0-744c-dc54382f2ebd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5699-08f0-1667-d203e3e3e137	NE	NER	562	Niger 	Niger 	\N
00040000-5699-08f0-69a4-00232bde8dbc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5699-08f0-7a51-1bee6e834a12	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5699-08f0-9c95-b14d04a89f3c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5699-08f0-c163-5a6ec86ffdcd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5699-08f0-019a-d422673c46d4	NO	NOR	578	Norway 	Norveška	\N
00040000-5699-08f0-7181-a9d43718f1c6	OM	OMN	512	Oman 	Oman	\N
00040000-5699-08f0-b9fc-b1f92a7c9ca4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5699-08f0-77fc-7e23aa578666	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5699-08f0-1006-7590e606b66f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5699-08f0-ae29-8bc939095b25	PA	PAN	591	Panama 	Panama	\N
00040000-5699-08f0-5677-61b2ba27626f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5699-08f0-1c70-ee39de23169c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5699-08f0-9db6-25109f2a69e9	PE	PER	604	Peru 	Peru	\N
00040000-5699-08f0-64ce-2ca00d12bdae	PH	PHL	608	Philippines 	Filipini	\N
00040000-5699-08f0-d9ec-8c925382ab4d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5699-08f0-4510-5dd4df137478	PL	POL	616	Poland 	Poljska	\N
00040000-5699-08f0-91e2-512417adfe5f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5699-08f0-cc12-8afccc9eb6ca	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5699-08f0-36ee-6fe7b7635018	QA	QAT	634	Qatar 	Katar	\N
00040000-5699-08f0-c28b-c4435582544b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5699-08f0-56e2-a72804b44efa	RO	ROU	642	Romania 	Romunija	\N
00040000-5699-08f0-1e4d-b2fd109c5f0b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5699-08f0-3894-b7310ba66591	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5699-08f0-4dfa-0b31d6ebe220	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5699-08f0-d84c-1189a46ef725	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5699-08f0-67e6-fd7ccde02a12	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5699-08f0-1142-5d960a9f03f6	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5699-08f0-7d51-c07877e12f11	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5699-08f0-7466-ca43ecca6528	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5699-08f0-cb13-8f0017803c4e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5699-08f0-2b01-cfe5c674f8b6	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5699-08f0-75b7-a838b79fda07	SM	SMR	674	San Marino 	San Marino	\N
00040000-5699-08f0-054c-15838238dfb7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5699-08f0-6896-a11210be81cb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5699-08f0-9b1c-f9d5d8159308	SN	SEN	686	Senegal 	Senegal	\N
00040000-5699-08f0-f7d8-be5158091097	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5699-08f0-4bde-71074f76b972	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5699-08f0-0e15-192ffc99c90e	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5699-08f0-4fdc-f098b7f1ddf2	SG	SGP	702	Singapore 	Singapur	\N
00040000-5699-08f0-22dc-68a120002fb2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5699-08f0-8009-01d29fbdbe3e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5699-08f0-f90b-bdd3823040b5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5699-08f0-0ec4-56958c551354	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5699-08f0-e78f-b10fa3d510d1	SO	SOM	706	Somalia 	Somalija	\N
00040000-5699-08f0-aa4e-6429b3846187	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5699-08f0-ed36-ef0078758c4a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5699-08f0-563e-32c57e38d53c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5699-08f0-d7a5-4c5043a84225	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5699-08f0-386e-11410b1d6731	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5699-08f0-99fd-5e9a6755a5a1	SD	SDN	729	Sudan 	Sudan	\N
00040000-5699-08f0-0109-d4c66d9d67a7	SR	SUR	740	Suriname 	Surinam	\N
00040000-5699-08f0-e5d2-94748240aa29	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5699-08f0-850b-7490281cb48d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5699-08f0-2720-0730504b0c52	SE	SWE	752	Sweden 	Švedska	\N
00040000-5699-08f0-7e00-689df16d12f4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5699-08f0-c9f8-dcc7e2f3a5cc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5699-08f0-667f-8ad3f52fc5cb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5699-08f0-9731-3dd538d8887e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5699-08f0-9159-903d7fe38e80	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5699-08f0-b156-7aafdc0ec752	TH	THA	764	Thailand 	Tajska	\N
00040000-5699-08f0-0653-7cb54864aaf6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5699-08f0-f957-67b5d7f28027	TG	TGO	768	Togo 	Togo	\N
00040000-5699-08f0-3006-d12a0a82a489	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5699-08f0-4f58-2722913166a8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5699-08f0-acc1-36a1904abf9f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5699-08f0-4756-f065f6fbf405	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5699-08f0-afe0-7d4dd37ae05c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5699-08f0-adac-7c40d64a5b73	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5699-08f0-2c44-0c4b8e648212	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5699-08f0-ed3d-53eb74c50dd9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5699-08f0-8f8b-1d6a08e990fc	UG	UGA	800	Uganda 	Uganda	\N
00040000-5699-08f0-b953-e59486512df8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5699-08f0-17b8-b49cfefd509b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5699-08f0-4dc1-37d6f3fa45dd	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5699-08f0-4ea9-46a1ebbc6f03	US	USA	840	United States 	Združene države Amerike	\N
00040000-5699-08f0-0842-fa1a952fb266	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5699-08f0-1f45-87cd8dc396bf	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5699-08f0-6050-00ebd74f1450	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5699-08f0-6db4-8db08d960987	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5699-08f0-22f5-03c23887200c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5699-08f0-fe16-10384a2aedd1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5699-08f0-4dbb-104d5b8909d3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5699-08f0-f1ce-9abc7bda66d5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5699-08f0-2f17-282de52615b0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5699-08f0-087a-2ff923f3cbe0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5699-08f0-5347-fd5b454e51f6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5699-08f0-83a4-dc33879a5b29	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5699-08f0-9c8c-67a94fee0313	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3208 (class 0 OID 37018234)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5699-08f4-8ce4-f304f030beca	000e0000-5699-08f3-2c89-4f9cc0db243f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5699-08f0-9583-2317d0e5ea4a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5699-08f4-19ea-9292511b92d2	000e0000-5699-08f3-a043-e7e16aee62a0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5699-08f0-aea7-852f59344178	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5699-08f4-cbf3-f3226d1eb747	000e0000-5699-08f3-1984-b882d8e04411	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5699-08f0-9583-2317d0e5ea4a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5699-08f4-7242-734a85517210	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5699-08f4-fa0b-bd7be92ba426	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3193 (class 0 OID 37018040)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5699-08f3-3610-f4d247dd77e2	000e0000-5699-08f3-a043-e7e16aee62a0	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-5699-08f0-ad3e-eebca2bdc358
000d0000-5699-08f3-3ee0-195c69a7086d	000e0000-5699-08f3-5dca-3e4a579c7fd9	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5699-08f0-2f47-802b79ca1eff
000d0000-5699-08f3-4a94-f375f06fb871	000e0000-5699-08f3-5dca-3e4a579c7fd9	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-f802-6f612452eb54	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-17ea-caa4c605c080	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5699-08f0-2f47-802b79ca1eff
000d0000-5699-08f3-01f7-0df6c6473716	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-4177-e472d1dd85cf	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-7495-f35689732623	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-8ab7-667da938c232	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5699-08f0-9e70-f0e3baebdec0
000d0000-5699-08f3-0d2f-ed0b444b7932	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-adc5-b287925e5de4	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5699-08f0-ad3e-eebca2bdc358
000d0000-5699-08f3-a20f-f6f13f49ea60	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-7a80-9e071a364224	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5699-08f0-ad3e-eebca2bdc358
000d0000-5699-08f3-8381-04e6be90ef17	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-5d5f-734170992030	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5699-08f0-2f47-802b79ca1eff
000d0000-5699-08f3-3a7a-fc3ed860b1e4	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-421c-1ccb2dbe18ba	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5699-08f0-2f47-802b79ca1eff
000d0000-5699-08f3-88a7-82f93df4343d	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-0c00-024442602218	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5699-08f0-6227-af1899ffb620
000d0000-5699-08f3-9f6a-cbc0ca0fba30	000e0000-5699-08f3-a043-e7e16aee62a0	000c0000-5699-08f4-b0b1-7118b0c196d2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5699-08f0-7dee-37fca7ef7b1b
000d0000-5699-08f3-363c-9cfb5c661f35	000e0000-5699-08f3-a825-561e529e4e5f	000c0000-5699-08f4-f340-4ca63b8e1176	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-4e06-a052b9ced15c	000e0000-5699-08f3-1ae7-d4dba8c46527	000c0000-5699-08f4-1ecb-f41fc9197d7f	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-2253-e74aacaec3f6	000e0000-5699-08f3-1ae7-d4dba8c46527	000c0000-5699-08f4-46d4-bdf45b547548	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-bcbc-effc85f85a60	000e0000-5699-08f3-d432-36f6da40dad2	000c0000-5699-08f4-8e05-43534d9ea6e1	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-014b-33b12b604fd2	000e0000-5699-08f3-0959-f6ab9b0f01a2	000c0000-5699-08f4-ad61-c60b2d8512ab	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-b87d-c22a33b243ef	000e0000-5699-08f3-26fb-81bcd6141ef2	000c0000-5699-08f4-9a84-76becae72229	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-8fa2-520232db44fc	000e0000-5699-08f3-f179-8cd6d7f1da70	000c0000-5699-08f4-82dd-833359c274f4	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-fa25-e1cb692c4c73	000e0000-5699-08f3-ae01-ab1c61a3d615	000c0000-5699-08f4-d8cb-415ac2650ddb	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-6d21-a51170f2360e	000e0000-5699-08f3-8c5a-ac2c13643785	000c0000-5699-08f4-303e-786974f812c0	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-5740-f454f16a6ac3	000e0000-5699-08f3-8c5a-ac2c13643785	000c0000-5699-08f4-f425-f1bc08a59850	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-c610-75614d9244ad	000e0000-5699-08f3-2c84-4bedc52de646	000c0000-5699-08f4-0920-d1f44e50b23b	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
000d0000-5699-08f3-95f1-50adb0a70697	000e0000-5699-08f3-2c84-4bedc52de646	000c0000-5699-08f4-4e70-e3aea41f75b6	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5699-08f0-9412-ffc657e36272
\.


--
-- TOC entry 3167 (class 0 OID 37017811)
-- Dependencies: 201
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 37017780)
-- Dependencies: 198
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 37017757)
-- Dependencies: 196
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5699-08f3-45d4-b9cc3d84411e	00080000-5699-08f3-f321-25df2abc6288	00090000-5699-08f3-a829-2a8bc3d3ed91	AK		igralka
\.


--
-- TOC entry 3182 (class 0 OID 37017954)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 37018504)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5699-08f3-38ac-648c7c8857e5	00010000-5699-08f1-2d2b-cec5e5b02d23	\N	Prva mapa	Root mapa	2016-01-15 15:57:55	2016-01-15 15:57:55	R	\N	\N
\.


--
-- TOC entry 3220 (class 0 OID 37018517)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 37018539)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 34548309)
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
-- TOC entry 3186 (class 0 OID 37017979)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 37017714)
-- Dependencies: 193
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5699-08f1-9ad2-db070111d36d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5699-08f1-51e9-14acb31c19c1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5699-08f1-5361-eeb967d44a3e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5699-08f1-11dd-c6e1afc2edc3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5699-08f1-eecd-c1e2261788c8	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5699-08f1-badb-3f58039b32fb	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5699-08f1-d233-98d3851d29a4	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-5699-08f1-996a-6300200be7d4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5699-08f1-fcd2-5577c72e1ff6	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5699-08f1-5ae5-ffa39a7e5e6e	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5699-08f1-96fd-081dbfa81e4f	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5699-08f1-f573-af53ae72568d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5699-08f1-a7de-1a791ee8404e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5699-08f1-dfc9-90855815d5d4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5699-08f1-c1dc-6658130f504e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5699-08f3-3be7-2e00e719eefb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5699-08f3-81a5-d4e708a11bb8	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5699-08f3-0edb-7f21ab81c5ee	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5699-08f3-297f-6d7455d53fc7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5699-08f3-11c0-576a04774593	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5699-08f5-6e48-5d4bc122e50f	application.tenant.maticnopodjetje	string	s:36:"00080000-5699-08f5-f4fa-33dce8472170";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3152 (class 0 OID 37017614)
-- Dependencies: 186
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5699-08f3-820b-4fdf116b1036	00000000-5699-08f3-3be7-2e00e719eefb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5699-08f3-1cc2-8ffa58095dfb	00000000-5699-08f3-3be7-2e00e719eefb	00010000-5699-08f1-2d2b-cec5e5b02d23	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5699-08f3-41e6-c09adedf34b6	00000000-5699-08f3-81a5-d4e708a11bb8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3156 (class 0 OID 37017681)
-- Dependencies: 190
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5699-08f3-ac1c-58f526b698ea	\N	00100000-5699-08f3-66cf-a2c19b1ad5ea	00100000-5699-08f3-8f8f-d07934583d18	01	Gledališče Nimbis
00410000-5699-08f3-920e-783f14011525	00410000-5699-08f3-ac1c-58f526b698ea	00100000-5699-08f3-66cf-a2c19b1ad5ea	00100000-5699-08f3-8f8f-d07934583d18	02	Tehnika
\.


--
-- TOC entry 3153 (class 0 OID 37017625)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5699-08f3-df1a-bfc47513f3db	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5699-08f3-40e1-e3e23df9e83f	00010000-5699-08f3-73eb-41d13e988c37	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5699-08f3-d1a9-d43c9d6dfe31	00010000-5699-08f3-9931-406cc14f0ab8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5699-08f3-19df-434e8fbe5ca8	00010000-5699-08f3-1ee4-3b82ad3ec450	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5699-08f3-7b22-78595b562b2f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5699-08f3-6273-b9c1eb3e4994	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5699-08f3-a6f2-8bc2eeca3499	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5699-08f3-3ded-6055312a987f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5699-08f3-a829-2a8bc3d3ed91	00010000-5699-08f3-4a95-d3e8c8becd84	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5699-08f3-546a-b81a0ab36a71	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5699-08f3-22a0-717f7b76ded9	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5699-08f3-9511-947f2d3119fe	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5699-08f3-ed06-373aabde8c9f	00010000-5699-08f3-2f3d-0c8432cea69c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5699-08f3-304f-cabe57b988f1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-08f3-b4c4-5578c66f7cf7	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-08f3-1b4c-cfb44082e7fb	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-08f3-204e-4b13dbf64da1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5699-08f3-3026-823b5bd585f3	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5699-08f3-ae35-2b7d842a50a8	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-08f3-e380-bab727e44472	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-08f3-db37-6cae1ffb6907	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 37017560)
-- Dependencies: 179
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5699-08f1-de3e-1288c71df60f	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5699-08f1-0ed0-fac767be579b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5699-08f1-d39e-b693d68cfe04	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5699-08f1-7b11-93bb66356ade	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5699-08f1-33b0-0360f97821e4	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5699-08f1-2650-acab6fa97c01	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5699-08f1-7422-ad1145c6219e	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5699-08f1-ef2c-6594844df01e	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5699-08f1-daec-7b6a21dcee99	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5699-08f1-94c4-3e41e7893ec5	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5699-08f1-ab07-80fbf0df6b27	Abonma-read	Abonma - branje	t
00030000-5699-08f1-32a6-a8e7d0bf00b6	Abonma-write	Abonma - spreminjanje	t
00030000-5699-08f1-2803-c3b71fdc8e0f	Alternacija-read	Alternacija - branje	t
00030000-5699-08f1-d8e0-26e8ed468bd9	Alternacija-write	Alternacija - spreminjanje	t
00030000-5699-08f1-d12f-143f88ac7b27	Arhivalija-read	Arhivalija - branje	t
00030000-5699-08f1-90aa-6bb990721e46	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5699-08f1-b796-4c66df8b4be8	AuthStorage-read	AuthStorage - branje	t
00030000-5699-08f1-733f-67a84ad34bbb	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5699-08f1-3779-2ec320268864	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5699-08f1-9cc5-11ac2726362c	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5699-08f1-64cc-c4f4fee71af0	Besedilo-read	Besedilo - branje	t
00030000-5699-08f1-0d90-0cd997bcd7da	Besedilo-write	Besedilo - spreminjanje	t
00030000-5699-08f1-e174-5f44c7ce70b0	Dodatek-read	Dodatek - branje	t
00030000-5699-08f1-b774-dfc1b211bad0	Dodatek-write	Dodatek - spreminjanje	t
00030000-5699-08f1-a114-76d2694b23fe	Dogodek-read	Dogodek - branje	t
00030000-5699-08f1-1a69-9825465d8ffd	Dogodek-write	Dogodek - spreminjanje	t
00030000-5699-08f1-ecca-f0f3fa214e21	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5699-08f1-27ed-01484ec70656	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5699-08f1-0b10-8e4d0af375c1	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5699-08f1-3ef7-931a68cbeef5	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5699-08f1-091b-9feb26366996	DogodekTrait-read	DogodekTrait - branje	t
00030000-5699-08f1-2ec6-7f9f0880546c	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5699-08f1-a44f-aa5bdd3ba26d	DrugiVir-read	DrugiVir - branje	t
00030000-5699-08f1-d911-01fdedcb317d	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5699-08f1-dbcd-51e489d6d11c	Drzava-read	Drzava - branje	t
00030000-5699-08f1-87e4-91568b5bb981	Drzava-write	Drzava - spreminjanje	t
00030000-5699-08f1-bcdf-8e9202f1e88a	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5699-08f1-b5be-102d0fb47c11	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5699-08f1-29fb-f68bb965f754	Funkcija-read	Funkcija - branje	t
00030000-5699-08f1-b77b-8dddbf0a42a6	Funkcija-write	Funkcija - spreminjanje	t
00030000-5699-08f1-b149-51a246eab2ff	Gostovanje-read	Gostovanje - branje	t
00030000-5699-08f1-458f-09a7a830007d	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5699-08f1-77e0-7722f2c5aa3b	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5699-08f1-b398-8eb535d9a0e2	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5699-08f1-8745-6c3cf6b74680	Kupec-read	Kupec - branje	t
00030000-5699-08f1-b0ce-8ddeed7cff6c	Kupec-write	Kupec - spreminjanje	t
00030000-5699-08f1-3b1f-88d60d6de8de	NacinPlacina-read	NacinPlacina - branje	t
00030000-5699-08f1-30b4-3f59be7a8312	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5699-08f1-6b43-d8f7175e1f0a	Option-read	Option - branje	t
00030000-5699-08f1-32d9-01049700f374	Option-write	Option - spreminjanje	t
00030000-5699-08f1-fd89-8f8e7c780ee0	OptionValue-read	OptionValue - branje	t
00030000-5699-08f1-72b1-1c1de1bfd7e4	OptionValue-write	OptionValue - spreminjanje	t
00030000-5699-08f1-32bf-6e19abaa2cd0	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5699-08f1-647f-f721f02c0388	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5699-08f1-0474-8d5e7d833f3c	Oseba-read	Oseba - branje	t
00030000-5699-08f1-9d79-90ff4e937328	Oseba-write	Oseba - spreminjanje	t
00030000-5699-08f1-444a-e065fe91f53b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5699-08f1-e17b-f9abc227f188	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5699-08f1-9a2d-1fc27360e699	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5699-08f1-4362-6c16fefced20	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5699-08f1-3f90-c62fdfcc27d8	Pogodba-read	Pogodba - branje	t
00030000-5699-08f1-a75e-5d78539e46fc	Pogodba-write	Pogodba - spreminjanje	t
00030000-5699-08f1-fc82-8bf7e6be662d	Popa-read	Popa - branje	t
00030000-5699-08f1-1b4b-038b07281093	Popa-write	Popa - spreminjanje	t
00030000-5699-08f1-65bc-83215da6fd48	Posta-read	Posta - branje	t
00030000-5699-08f1-7822-bdcc694c6200	Posta-write	Posta - spreminjanje	t
00030000-5699-08f1-bb3b-73d5a24ea24f	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5699-08f1-84ae-b97e337fae4d	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5699-08f1-1913-7d0fe0777060	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5699-08f1-9617-d42e9466fa82	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5699-08f1-422c-9f2822dec6bf	PostniNaslov-read	PostniNaslov - branje	t
00030000-5699-08f1-f20b-90a360fe1349	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5699-08f1-833d-4490a3ba1e45	Praznik-read	Praznik - branje	t
00030000-5699-08f1-1a9d-3ab03b97c381	Praznik-write	Praznik - spreminjanje	t
00030000-5699-08f1-9658-1d6fecd2fc90	Predstava-read	Predstava - branje	t
00030000-5699-08f1-7eca-0eaa10ca2cec	Predstava-write	Predstava - spreminjanje	t
00030000-5699-08f1-0773-8ac58ff61cd5	Ura-read	Ura - branje	t
00030000-5699-08f1-a80e-019ba0c3d271	Ura-write	Ura - spreminjanje	t
00030000-5699-08f1-22ac-25bac7e6f4c3	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5699-08f1-9e29-95395c2278e4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5699-08f1-513c-fd092a7899f4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5699-08f1-3bb2-1404ddf57a22	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5699-08f1-6ec6-848b8a774114	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5699-08f1-01f3-6cb539070169	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5699-08f1-83d6-211396c96d57	ProgramDela-read	ProgramDela - branje	t
00030000-5699-08f1-470b-e526d097de97	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5699-08f1-9ffd-648cfa43574c	ProgramFestival-read	ProgramFestival - branje	t
00030000-5699-08f1-de94-e2ddd68a9f2b	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5699-08f1-ede5-de278214980b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5699-08f1-1f05-6c5bd35f7104	Datoteka-write	Datoteka - spreminjanje	t
00030000-5699-08f1-d3f0-3680c7a85563	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5699-08f1-d367-6ef5074aa959	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5699-08f1-bc8a-0f3e40c48ec5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5699-08f1-7eaf-85480df24e8b	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5699-08f1-f098-cfe6b8205968	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5699-08f1-2c36-637fc922ff95	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5699-08f1-5c19-e7a27baf1b56	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5699-08f1-0bbe-6044e8791844	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5699-08f1-96d6-8f2aa5a8ce5e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5699-08f1-c9d6-8e80f59c7115	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5699-08f1-d2be-d1b0f4d51c4e	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5699-08f1-5095-be7f3fa9d4da	ProgramRazno-read	ProgramRazno - branje	t
00030000-5699-08f1-acf2-2dc0bf707955	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5699-08f1-e338-3603472c8c39	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5699-08f1-179b-05b016442820	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5699-08f1-3689-162689fbd374	Prostor-read	Prostor - branje	t
00030000-5699-08f1-5ded-6873f0fd48fc	Prostor-write	Prostor - spreminjanje	t
00030000-5699-08f1-dc13-e0706dbbf5f6	Racun-read	Racun - branje	t
00030000-5699-08f1-c8db-f6fa52c56457	Racun-write	Racun - spreminjanje	t
00030000-5699-08f1-6ad1-09ba4087518d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5699-08f1-cf46-822a34a8bbb0	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5699-08f1-abb0-bb0906ec00c8	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5699-08f1-fe75-1f67f2fffff7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5699-08f1-b685-ae3d5c402d30	Rekvizit-read	Rekvizit - branje	t
00030000-5699-08f1-05c2-d428749ce960	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5699-08f1-5564-d54ee73b5519	Revizija-read	Revizija - branje	t
00030000-5699-08f1-a793-51843494d43a	Revizija-write	Revizija - spreminjanje	t
00030000-5699-08f1-ebd6-a4168da06ccc	Rezervacija-read	Rezervacija - branje	t
00030000-5699-08f1-c79f-3c3b3aa55724	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5699-08f1-6e31-9c421fc1717f	SedezniRed-read	SedezniRed - branje	t
00030000-5699-08f1-aae1-e494a0270b8c	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5699-08f1-bf45-e1c26688fa89	Sedez-read	Sedez - branje	t
00030000-5699-08f1-8198-52730db217fd	Sedez-write	Sedez - spreminjanje	t
00030000-5699-08f1-c83a-37582247bd11	Sezona-read	Sezona - branje	t
00030000-5699-08f1-8ced-df5b3c9eb805	Sezona-write	Sezona - spreminjanje	t
00030000-5699-08f1-62c7-71b5155877aa	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5699-08f1-dd7f-62bdd571667b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5699-08f1-d9ee-1b9d60ec3144	Telefonska-read	Telefonska - branje	t
00030000-5699-08f1-cd44-cac6bce57288	Telefonska-write	Telefonska - spreminjanje	t
00030000-5699-08f1-9a34-32ecb014030d	TerminStoritve-read	TerminStoritve - branje	t
00030000-5699-08f1-93fe-f7de1c3df856	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5699-08f1-1a3c-29f4bce739c4	TipDodatka-read	TipDodatka - branje	t
00030000-5699-08f1-e199-4924374dbad3	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5699-08f1-2c36-379963e40620	TipFunkcije-read	TipFunkcije - branje	t
00030000-5699-08f1-773e-7b63b1cc3eaf	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5699-08f1-5e55-d31b95d79f15	TipPopa-read	TipPopa - branje	t
00030000-5699-08f1-a9ba-e2967cbc84ff	TipPopa-write	TipPopa - spreminjanje	t
00030000-5699-08f1-c2bd-e0f87334f1e0	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5699-08f1-19ed-6d7501d9ed6d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5699-08f1-c71f-e4a42a0202b6	TipVaje-read	TipVaje - branje	t
00030000-5699-08f1-c70f-82e53914cf3e	TipVaje-write	TipVaje - spreminjanje	t
00030000-5699-08f1-f970-ed317dc95f8b	Trr-read	Trr - branje	t
00030000-5699-08f1-c0e6-5de558e4e5ca	Trr-write	Trr - spreminjanje	t
00030000-5699-08f1-b059-a0a9b762fb79	Uprizoritev-read	Uprizoritev - branje	t
00030000-5699-08f1-55cd-129f615b9216	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5699-08f1-d95e-904e5d426941	Vaja-read	Vaja - branje	t
00030000-5699-08f1-aaf2-5e4bcd30d391	Vaja-write	Vaja - spreminjanje	t
00030000-5699-08f1-c305-1ad6746ef1e0	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5699-08f1-b822-f762a0054610	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5699-08f1-5bb7-09b97834e415	VrstaStroska-read	VrstaStroska - branje	t
00030000-5699-08f1-c284-6c38038e691d	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5699-08f1-6c4b-540cebadadd1	Zaposlitev-read	Zaposlitev - branje	t
00030000-5699-08f1-1529-ab2640e575c5	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5699-08f1-235f-7309afbcb67d	Zasedenost-read	Zasedenost - branje	t
00030000-5699-08f1-dad9-fe55ed770d9e	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5699-08f1-f68d-377c61845ffb	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5699-08f1-f6cc-7c6ecafe3657	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5699-08f1-7dd3-1a754e15b8a6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5699-08f1-3ce0-529845612b3a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5699-08f1-11ba-bb01dfd66ef1	Job-read	Branje opravil - samo zase - branje	t
00030000-5699-08f1-b319-6975c1525faf	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5699-08f1-cf89-c94dd7d6f956	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5699-08f1-a684-e3fa2c32b2e3	Report-read	Report - branje	t
00030000-5699-08f1-3d76-ce7424028ffa	Report-write	Report - spreminjanje	t
00030000-5699-08f1-2b61-f06cbdab817b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5699-08f1-c387-30e3410e160d	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5699-08f1-3255-157c981d85fc	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5699-08f1-5e32-da78eaebd1ed	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5699-08f1-9991-8bd6a3247f82	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5699-08f1-13d9-f890cbf091af	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5699-08f1-3f39-40c426b35c61	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5699-08f1-8cd5-890ebee0e404	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5699-08f1-bab8-bd06667e2358	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5699-08f1-647d-e6d0cbb66ac8	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5699-08f1-e092-0beb9494ad8e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5699-08f1-5bde-9adaae48cd93	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5699-08f1-2c0d-6421ec5e1f85	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5699-08f1-270f-b906d89565f1	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3147 (class 0 OID 37017579)
-- Dependencies: 181
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5699-08f1-6a3f-38c9776cb7ca	00030000-5699-08f1-0ed0-fac767be579b
00020000-5699-08f1-6a3f-38c9776cb7ca	00030000-5699-08f1-de3e-1288c71df60f
00020000-5699-08f1-7f5a-f7f5a5328998	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-9cc5-11ac2726362c
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-0d90-0cd997bcd7da
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-3a28-e993136a87e9	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-16c5-438b4c11a494	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f1-16c5-438b4c11a494	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-16c5-438b4c11a494	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-16c5-438b4c11a494	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-16c5-438b4c11a494	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-16c5-438b4c11a494	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-0854-5b18040374e3	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-0854-5b18040374e3	00030000-5699-08f1-1529-ab2640e575c5
00020000-5699-08f1-0854-5b18040374e3	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-0854-5b18040374e3	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f1-0854-5b18040374e3	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-0854-5b18040374e3	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-0854-5b18040374e3	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-f3ea-cdeab9fa67bd	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-f3ea-cdeab9fa67bd	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-f3ea-cdeab9fa67bd	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-88e9-f7cfa91902f7	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-88e9-f7cfa91902f7	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-88e9-f7cfa91902f7	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-88e9-f7cfa91902f7	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-88e9-f7cfa91902f7	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-88e9-f7cfa91902f7	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-88e9-f7cfa91902f7	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-88e9-f7cfa91902f7	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-ce0a-88830e5900f3	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-ce0a-88830e5900f3	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-ce0a-88830e5900f3	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-ce0a-88830e5900f3	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-c0e6-5de558e4e5ca
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-f20b-90a360fe1349
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-cd44-cac6bce57288
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-dffb-b560a8195c51	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-dd47-9158da030eea	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-dd47-9158da030eea	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-dd47-9158da030eea	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-dd47-9158da030eea	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-dd47-9158da030eea	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-dd47-9158da030eea	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-dd47-9158da030eea	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-cd44-cac6bce57288
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-f20b-90a360fe1349
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-c0e6-5de558e4e5ca
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-1b4b-038b07281093
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-b398-8eb535d9a0e2
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-01f3-6cb539070169
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-18a1-d88de68c1b82	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-59cc-fa012d57e898	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-101b-9d1d763519c4	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-101b-9d1d763519c4	00030000-5699-08f1-a9ba-e2967cbc84ff
00020000-5699-08f1-f957-24764dd2ce12	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-4381-d933b6c31b26	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-4381-d933b6c31b26	00030000-5699-08f1-7822-bdcc694c6200
00020000-5699-08f1-fb58-f08574ab73b7	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-05e6-869b38f33fb5	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-05e6-869b38f33fb5	00030000-5699-08f1-87e4-91568b5bb981
00020000-5699-08f1-50b3-3ca5be6c69bb	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-7567-e43441730d03	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f1-7567-e43441730d03	00030000-5699-08f1-3ce0-529845612b3a
00020000-5699-08f1-5823-2c8fedfd49a0	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f1-bc1d-9c6da7fb3c94	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-bc1d-9c6da7fb3c94	00030000-5699-08f1-f6cc-7c6ecafe3657
00020000-5699-08f1-2068-70049cf774ea	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-bc29-50d88485e045	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f1-bc29-50d88485e045	00030000-5699-08f1-32a6-a8e7d0bf00b6
00020000-5699-08f1-32a2-9c99c39bd62f	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f1-053b-f7e4631acebe	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-053b-f7e4631acebe	00030000-5699-08f1-5ded-6873f0fd48fc
00020000-5699-08f1-053b-f7e4631acebe	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-053b-f7e4631acebe	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-053b-f7e4631acebe	00030000-5699-08f1-f20b-90a360fe1349
00020000-5699-08f1-053b-f7e4631acebe	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-c5c6-e84016aaf43e	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-c5c6-e84016aaf43e	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-c5c6-e84016aaf43e	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-9580-8ed81e6b8a3f	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-9580-8ed81e6b8a3f	00030000-5699-08f1-c284-6c38038e691d
00020000-5699-08f1-bb78-019419326a7f	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-647f-f721f02c0388
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-db15-a4ecd36a9e30	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-eddb-fbcbcebc05da	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-eddb-fbcbcebc05da	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-eddb-fbcbcebc05da	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-eddb-fbcbcebc05da	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-eddb-fbcbcebc05da	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-a8d5-7b5c77334458	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f1-a8d5-7b5c77334458	00030000-5699-08f1-c70f-82e53914cf3e
00020000-5699-08f1-4d7a-0b70e9a5c3da	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-7422-ad1145c6219e
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-ef2c-6594844df01e
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-83d6-211396c96d57
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-470b-e526d097de97
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-9ffd-648cfa43574c
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-de94-e2ddd68a9f2b
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-ede5-de278214980b
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-d3f0-3680c7a85563
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-d367-6ef5074aa959
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-bc8a-0f3e40c48ec5
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-7eaf-85480df24e8b
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-f098-cfe6b8205968
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-2c36-637fc922ff95
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-5c19-e7a27baf1b56
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-0bbe-6044e8791844
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-96d6-8f2aa5a8ce5e
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-c9d6-8e80f59c7115
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-d2be-d1b0f4d51c4e
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-5095-be7f3fa9d4da
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-acf2-2dc0bf707955
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-e338-3603472c8c39
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-179b-05b016442820
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-3bb2-1404ddf57a22
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-d911-01fdedcb317d
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-84ae-b97e337fae4d
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-b319-6975c1525faf
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-a44f-aa5bdd3ba26d
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-513c-fd092a7899f4
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-bb3b-73d5a24ea24f
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-11ba-bb01dfd66ef1
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-5bc1-2458ea1ea632	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-83d6-211396c96d57
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-9ffd-648cfa43574c
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-ede5-de278214980b
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-d367-6ef5074aa959
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-7eaf-85480df24e8b
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-2c36-637fc922ff95
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-0bbe-6044e8791844
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-c9d6-8e80f59c7115
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-5095-be7f3fa9d4da
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-e338-3603472c8c39
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-513c-fd092a7899f4
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-a44f-aa5bdd3ba26d
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-bb3b-73d5a24ea24f
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-11ba-bb01dfd66ef1
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-c800-ea26bcb8602c	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-55cd-129f615b9216
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-94c4-3e41e7893ec5
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-5084-b3a004b93a20	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-e8f7-96b041972d50	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-366b-e854c04cb13d	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-366b-e854c04cb13d	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-366b-e854c04cb13d	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-366b-e854c04cb13d	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f1-366b-e854c04cb13d	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-366b-e854c04cb13d	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-366b-e854c04cb13d	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-366b-e854c04cb13d	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-a75e-5d78539e46fc
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-dd7f-62bdd571667b
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-1f25-0fb16c4cd7d5	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-0925-f75bf7b10c83	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-77ee-99948d343c3e	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-77ee-99948d343c3e	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-77ee-99948d343c3e	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-77ee-99948d343c3e	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-77ee-99948d343c3e	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-77ee-99948d343c3e	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-77ee-99948d343c3e	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-c44e-3199050d1de1	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-c44e-3199050d1de1	00030000-5699-08f1-dd7f-62bdd571667b
00020000-5699-08f1-c44e-3199050d1de1	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-c44e-3199050d1de1	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-04ae-405e5dd4975a	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-04ae-405e5dd4975a	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-9cc5-11ac2726362c
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-0d90-0cd997bcd7da
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-a44f-aa5bdd3ba26d
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-d911-01fdedcb317d
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-94c4-3e41e7893ec5
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-11ba-bb01dfd66ef1
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-b319-6975c1525faf
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-a75e-5d78539e46fc
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-bb3b-73d5a24ea24f
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-84ae-b97e337fae4d
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-513c-fd092a7899f4
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-3bb2-1404ddf57a22
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-7422-ad1145c6219e
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-83d6-211396c96d57
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-ef2c-6594844df01e
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-470b-e526d097de97
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-9ffd-648cfa43574c
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-de94-e2ddd68a9f2b
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-ede5-de278214980b
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-d3f0-3680c7a85563
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-d367-6ef5074aa959
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-bc8a-0f3e40c48ec5
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-7eaf-85480df24e8b
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-f098-cfe6b8205968
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-2c36-637fc922ff95
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-5c19-e7a27baf1b56
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-0bbe-6044e8791844
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-96d6-8f2aa5a8ce5e
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-c9d6-8e80f59c7115
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-d2be-d1b0f4d51c4e
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-5095-be7f3fa9d4da
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-acf2-2dc0bf707955
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-e338-3603472c8c39
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-179b-05b016442820
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-dd7f-62bdd571667b
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-55cd-129f615b9216
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-ed57-3f3d39b0d77d	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-9cc5-11ac2726362c
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-0d90-0cd997bcd7da
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-e549-9b563d206c82	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-9cc5-11ac2726362c
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-0d90-0cd997bcd7da
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-94c4-3e41e7893ec5
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-55cd-129f615b9216
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-c16f-374b0ccd4974	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-9cc5-11ac2726362c
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-0d90-0cd997bcd7da
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-a44f-aa5bdd3ba26d
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-d911-01fdedcb317d
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-94c4-3e41e7893ec5
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-11ba-bb01dfd66ef1
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-b319-6975c1525faf
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-b398-8eb535d9a0e2
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-a75e-5d78539e46fc
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-1b4b-038b07281093
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-bb3b-73d5a24ea24f
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-84ae-b97e337fae4d
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-f20b-90a360fe1349
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-513c-fd092a7899f4
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-3bb2-1404ddf57a22
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-01f3-6cb539070169
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-7422-ad1145c6219e
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-83d6-211396c96d57
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-ef2c-6594844df01e
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-470b-e526d097de97
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-9ffd-648cfa43574c
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-de94-e2ddd68a9f2b
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-ede5-de278214980b
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-d3f0-3680c7a85563
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-d367-6ef5074aa959
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-bc8a-0f3e40c48ec5
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-7eaf-85480df24e8b
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-f098-cfe6b8205968
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-2c36-637fc922ff95
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-5c19-e7a27baf1b56
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-0bbe-6044e8791844
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-96d6-8f2aa5a8ce5e
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-c9d6-8e80f59c7115
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-d2be-d1b0f4d51c4e
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-5095-be7f3fa9d4da
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-acf2-2dc0bf707955
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-e338-3603472c8c39
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-179b-05b016442820
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-dd7f-62bdd571667b
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-cd44-cac6bce57288
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-c0e6-5de558e4e5ca
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-55cd-129f615b9216
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-1529-ab2640e575c5
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-a4f9-a2255ec77969	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-9cc5-11ac2726362c
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-0d90-0cd997bcd7da
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-94c4-3e41e7893ec5
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-b398-8eb535d9a0e2
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-1b4b-038b07281093
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-f20b-90a360fe1349
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-01f3-6cb539070169
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-cd44-cac6bce57288
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-c0e6-5de558e4e5ca
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-55cd-129f615b9216
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-1529-ab2640e575c5
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-8fad-1d5584b5aff6	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-d0a2-9330345cd881	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-a44f-aa5bdd3ba26d
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-d911-01fdedcb317d
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-11ba-bb01dfd66ef1
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-b319-6975c1525faf
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-b398-8eb535d9a0e2
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-647f-f721f02c0388
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-a75e-5d78539e46fc
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-1b4b-038b07281093
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-bb3b-73d5a24ea24f
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-84ae-b97e337fae4d
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-f20b-90a360fe1349
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-513c-fd092a7899f4
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-3bb2-1404ddf57a22
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-01f3-6cb539070169
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-7422-ad1145c6219e
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-83d6-211396c96d57
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-ef2c-6594844df01e
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-470b-e526d097de97
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-9ffd-648cfa43574c
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-de94-e2ddd68a9f2b
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-ede5-de278214980b
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-d3f0-3680c7a85563
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-d367-6ef5074aa959
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-bc8a-0f3e40c48ec5
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-7eaf-85480df24e8b
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-f098-cfe6b8205968
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-2c36-637fc922ff95
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-5c19-e7a27baf1b56
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-0bbe-6044e8791844
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-96d6-8f2aa5a8ce5e
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-c9d6-8e80f59c7115
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-d2be-d1b0f4d51c4e
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-5095-be7f3fa9d4da
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-acf2-2dc0bf707955
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-e338-3603472c8c39
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-179b-05b016442820
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-dd7f-62bdd571667b
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-cd44-cac6bce57288
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-c0e6-5de558e4e5ca
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-c284-6c38038e691d
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-1529-ab2640e575c5
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f1-a895-d9e20e088b4a	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-de3e-1288c71df60f
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-0ed0-fac767be579b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-ab07-80fbf0df6b27
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-32a6-a8e7d0bf00b6
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d12f-143f88ac7b27
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-90aa-6bb990721e46
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b796-4c66df8b4be8
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-733f-67a84ad34bbb
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3779-2ec320268864
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9cc5-11ac2726362c
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-64cc-c4f4fee71af0
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-0d90-0cd997bcd7da
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-a114-76d2694b23fe
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-7b11-93bb66356ade
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-ecca-f0f3fa214e21
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-27ed-01484ec70656
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-0b10-8e4d0af375c1
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3ef7-931a68cbeef5
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-091b-9feb26366996
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-2ec6-7f9f0880546c
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-1a69-9825465d8ffd
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-a44f-aa5bdd3ba26d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d911-01fdedcb317d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-dbcd-51e489d6d11c
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-87e4-91568b5bb981
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-bcdf-8e9202f1e88a
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b5be-102d0fb47c11
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-94c4-3e41e7893ec5
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b149-51a246eab2ff
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-458f-09a7a830007d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-cf89-c94dd7d6f956
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-11ba-bb01dfd66ef1
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b319-6975c1525faf
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-77e0-7722f2c5aa3b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b398-8eb535d9a0e2
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-8745-6c3cf6b74680
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b0ce-8ddeed7cff6c
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3f39-40c426b35c61
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-13d9-f890cbf091af
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c387-30e3410e160d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3255-157c981d85fc
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-5e32-da78eaebd1ed
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9991-8bd6a3247f82
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3b1f-88d60d6de8de
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-30b4-3f59be7a8312
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-6b43-d8f7175e1f0a
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-fd89-8f8e7c780ee0
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-72b1-1c1de1bfd7e4
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-32d9-01049700f374
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-32bf-6e19abaa2cd0
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-647f-f721f02c0388
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-444a-e065fe91f53b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-e17b-f9abc227f188
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9a2d-1fc27360e699
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-4362-6c16fefced20
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-a75e-5d78539e46fc
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-1b4b-038b07281093
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-65bc-83215da6fd48
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-bb3b-73d5a24ea24f
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-84ae-b97e337fae4d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-1913-7d0fe0777060
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9617-d42e9466fa82
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-7822-bdcc694c6200
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-f20b-90a360fe1349
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-833d-4490a3ba1e45
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-1a9d-3ab03b97c381
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9658-1d6fecd2fc90
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-7eca-0eaa10ca2cec
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-22ac-25bac7e6f4c3
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9e29-95395c2278e4
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-513c-fd092a7899f4
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3bb2-1404ddf57a22
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-6ec6-848b8a774114
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-01f3-6cb539070169
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-7422-ad1145c6219e
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-83d6-211396c96d57
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-ef2c-6594844df01e
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-470b-e526d097de97
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9ffd-648cfa43574c
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-de94-e2ddd68a9f2b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-ede5-de278214980b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d3f0-3680c7a85563
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d367-6ef5074aa959
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-bc8a-0f3e40c48ec5
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-7eaf-85480df24e8b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-f098-cfe6b8205968
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-2c36-637fc922ff95
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-5c19-e7a27baf1b56
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-0bbe-6044e8791844
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-96d6-8f2aa5a8ce5e
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c9d6-8e80f59c7115
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d2be-d1b0f4d51c4e
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-5095-be7f3fa9d4da
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-acf2-2dc0bf707955
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-e338-3603472c8c39
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-179b-05b016442820
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3689-162689fbd374
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-5ded-6873f0fd48fc
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-dc13-e0706dbbf5f6
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c8db-f6fa52c56457
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-6ad1-09ba4087518d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-cf46-822a34a8bbb0
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-abb0-bb0906ec00c8
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-fe75-1f67f2fffff7
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b685-ae3d5c402d30
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-05c2-d428749ce960
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-a684-e3fa2c32b2e3
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3d76-ce7424028ffa
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-5564-d54ee73b5519
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-a793-51843494d43a
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-ebd6-a4168da06ccc
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c79f-3c3b3aa55724
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-6e31-9c421fc1717f
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-aae1-e494a0270b8c
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-bf45-e1c26688fa89
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-8198-52730db217fd
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c83a-37582247bd11
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-8ced-df5b3c9eb805
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-2b61-f06cbdab817b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-dd7f-62bdd571667b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-cd44-cac6bce57288
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-9a34-32ecb014030d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d39e-b693d68cfe04
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-93fe-f7de1c3df856
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-2c36-379963e40620
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-773e-7b63b1cc3eaf
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-5e55-d31b95d79f15
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-a9ba-e2967cbc84ff
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c2bd-e0f87334f1e0
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-19ed-6d7501d9ed6d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c71f-e4a42a0202b6
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c70f-82e53914cf3e
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c0e6-5de558e4e5ca
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-55cd-129f615b9216
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-d95e-904e5d426941
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-aaf2-5e4bcd30d391
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c305-1ad6746ef1e0
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-b822-f762a0054610
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-5bb7-09b97834e415
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-c284-6c38038e691d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-2c0d-6421ec5e1f85
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-5bde-9adaae48cd93
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-1529-ab2640e575c5
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-235f-7309afbcb67d
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-dad9-fe55ed770d9e
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-f68d-377c61845ffb
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-f6cc-7c6ecafe3657
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-7dd3-1a754e15b8a6
00020000-5699-08f3-d68a-7b8607ec73a9	00030000-5699-08f1-3ce0-529845612b3a
00020000-5699-08f3-0ea5-45ff1ccca8e4	00030000-5699-08f1-e092-0beb9494ad8e
00020000-5699-08f3-9cc4-83f30b5fe895	00030000-5699-08f1-647d-e6d0cbb66ac8
00020000-5699-08f3-0e07-aee8000e6dbf	00030000-5699-08f1-55cd-129f615b9216
00020000-5699-08f3-3f52-4dc5797c911b	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f3-bb4b-c46e877008d6	00030000-5699-08f1-3255-157c981d85fc
00020000-5699-08f3-5af0-e0dc5f2bd6a4	00030000-5699-08f1-5e32-da78eaebd1ed
00020000-5699-08f3-303d-157e8ca2a293	00030000-5699-08f1-9991-8bd6a3247f82
00020000-5699-08f3-e750-f4e56f08eae7	00030000-5699-08f1-c387-30e3410e160d
00020000-5699-08f3-2513-b5c8ab29aa21	00030000-5699-08f1-3f39-40c426b35c61
00020000-5699-08f3-be36-9d070c2eba96	00030000-5699-08f1-13d9-f890cbf091af
00020000-5699-08f3-0527-c96f28116d19	00030000-5699-08f1-bab8-bd06667e2358
00020000-5699-08f3-a74a-3f69e7a1fec4	00030000-5699-08f1-8cd5-890ebee0e404
00020000-5699-08f3-554d-3d57fa0de189	00030000-5699-08f1-0474-8d5e7d833f3c
00020000-5699-08f3-27d0-4e95a4e9c433	00030000-5699-08f1-9d79-90ff4e937328
00020000-5699-08f3-5bf2-76abc46bed16	00030000-5699-08f1-33b0-0360f97821e4
00020000-5699-08f3-5bbf-82d77eaec415	00030000-5699-08f1-2650-acab6fa97c01
00020000-5699-08f3-3e82-24e2546e066c	00030000-5699-08f1-1f05-6c5bd35f7104
00020000-5699-08f3-f585-929899ef8084	00030000-5699-08f1-270f-b906d89565f1
00020000-5699-08f3-6539-fc8913cf4e76	00030000-5699-08f1-fc82-8bf7e6be662d
00020000-5699-08f3-6539-fc8913cf4e76	00030000-5699-08f1-1b4b-038b07281093
00020000-5699-08f3-6539-fc8913cf4e76	00030000-5699-08f1-b059-a0a9b762fb79
00020000-5699-08f3-ac57-5f617cf4e516	00030000-5699-08f1-f970-ed317dc95f8b
00020000-5699-08f3-6646-bcbf67939852	00030000-5699-08f1-c0e6-5de558e4e5ca
00020000-5699-08f3-8f2a-aa6dc2403267	00030000-5699-08f1-2b61-f06cbdab817b
00020000-5699-08f3-e855-3edf094ecc65	00030000-5699-08f1-d9ee-1b9d60ec3144
00020000-5699-08f3-17a9-7eb7e0019e63	00030000-5699-08f1-cd44-cac6bce57288
00020000-5699-08f3-d633-48cc99e22b43	00030000-5699-08f1-422c-9f2822dec6bf
00020000-5699-08f3-ab06-39cf2eaa50e7	00030000-5699-08f1-f20b-90a360fe1349
00020000-5699-08f3-4dbc-058bb2ff3df7	00030000-5699-08f1-6c4b-540cebadadd1
00020000-5699-08f3-c3d0-b2013ec0e9e9	00030000-5699-08f1-1529-ab2640e575c5
00020000-5699-08f3-e866-29ae106527d9	00030000-5699-08f1-3f90-c62fdfcc27d8
00020000-5699-08f3-81f4-7fd9ac54ff51	00030000-5699-08f1-a75e-5d78539e46fc
00020000-5699-08f3-617b-bd0fd5fddf1b	00030000-5699-08f1-62c7-71b5155877aa
00020000-5699-08f3-b876-3f01ad1ebafd	00030000-5699-08f1-dd7f-62bdd571667b
00020000-5699-08f3-a5fd-6f9beedab200	00030000-5699-08f1-2803-c3b71fdc8e0f
00020000-5699-08f3-9145-4a2c192310a2	00030000-5699-08f1-d8e0-26e8ed468bd9
00020000-5699-08f3-4823-ecf3c9cc7c9f	00030000-5699-08f1-daec-7b6a21dcee99
00020000-5699-08f3-95ce-032ffa6cb0c6	00030000-5699-08f1-29fb-f68bb965f754
00020000-5699-08f3-4fba-6e72d06be161	00030000-5699-08f1-b77b-8dddbf0a42a6
00020000-5699-08f3-264c-82ffc627f888	00030000-5699-08f1-94c4-3e41e7893ec5
\.


--
-- TOC entry 3187 (class 0 OID 37017986)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 37018020)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 37018153)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5699-08f3-ffa9-60e79a325101	00090000-5699-08f3-df1a-bfc47513f3db	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5699-08f3-86ac-0c5f90907571	00090000-5699-08f3-6273-b9c1eb3e4994	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5699-08f3-f992-28f5c61556c0	00090000-5699-08f3-ed06-373aabde8c9f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5699-08f3-cd06-4de6088990f9	00090000-5699-08f3-546a-b81a0ab36a71	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3155 (class 0 OID 37017661)
-- Dependencies: 189
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5699-08f3-f321-25df2abc6288	\N	00040000-5699-08f0-f90b-bdd3823040b5	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-08f3-26cb-c84131c2c5a5	\N	00040000-5699-08f0-f90b-bdd3823040b5	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5699-08f3-770f-520324114263	\N	00040000-5699-08f0-f90b-bdd3823040b5	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-08f3-dd25-373be00aaae5	\N	00040000-5699-08f0-f90b-bdd3823040b5	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-08f3-3a4b-2957f8fb3e0a	\N	00040000-5699-08f0-f90b-bdd3823040b5	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-08f3-68a5-ba05faadd4b2	\N	00040000-5699-08f0-b5e2-7636a2e8e504	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-08f3-960f-1b405fcddea0	\N	00040000-5699-08f0-ff23-1844a661614e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-08f3-4bd4-10ecc41c126c	\N	00040000-5699-08f0-c735-4f5a712be1b4	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-08f3-6d87-568a7841b9af	\N	00040000-5699-08f0-6450-766e5cb17996	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-08f5-f4fa-33dce8472170	\N	00040000-5699-08f0-f90b-bdd3823040b5	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3158 (class 0 OID 37017706)
-- Dependencies: 192
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5699-08f0-f048-b1767019e6b6	8341	Adlešiči
00050000-5699-08f0-0562-a9e5048124be	5270	Ajdovščina
00050000-5699-08f0-54db-d7cff0eaf337	6280	Ankaran/Ancarano
00050000-5699-08f0-0c98-641ce6eae1f6	9253	Apače
00050000-5699-08f0-edef-2f579651878f	8253	Artiče
00050000-5699-08f0-b517-7c3ad79dca3d	4275	Begunje na Gorenjskem
00050000-5699-08f0-5643-4b7f0384be7c	1382	Begunje pri Cerknici
00050000-5699-08f0-fe25-b9e1f5cdff51	9231	Beltinci
00050000-5699-08f0-43c5-8909b1acd091	2234	Benedikt
00050000-5699-08f0-711e-2f7be05c36b2	2345	Bistrica ob Dravi
00050000-5699-08f0-807f-4e88f4b01685	3256	Bistrica ob Sotli
00050000-5699-08f0-62f7-f7a58496a8cb	8259	Bizeljsko
00050000-5699-08f0-4ae2-d038ab41cee7	1223	Blagovica
00050000-5699-08f0-5fb5-aec22a842abc	8283	Blanca
00050000-5699-08f0-7ac4-f0fec1a7ff33	4260	Bled
00050000-5699-08f0-f0dc-1f4d949e4983	4273	Blejska Dobrava
00050000-5699-08f0-9cac-ef5f7bd34bfc	9265	Bodonci
00050000-5699-08f0-3e87-0238659ff5ed	9222	Bogojina
00050000-5699-08f0-74d8-b9d081be69ee	4263	Bohinjska Bela
00050000-5699-08f0-ed2e-59e06fea9bf8	4264	Bohinjska Bistrica
00050000-5699-08f0-11d1-d584606f7f81	4265	Bohinjsko jezero
00050000-5699-08f0-e598-49014a3ab726	1353	Borovnica
00050000-5699-08f0-ba0d-9595e762d7ad	8294	Boštanj
00050000-5699-08f0-c744-ab87bde30585	5230	Bovec
00050000-5699-08f0-7498-85cad78ba9fc	5295	Branik
00050000-5699-08f0-6754-3edd1a2d247c	3314	Braslovče
00050000-5699-08f0-6b3f-352b8a141c9b	5223	Breginj
00050000-5699-08f0-ee75-209be1983146	8280	Brestanica
00050000-5699-08f0-1b6d-8f74aa35fe32	2354	Bresternica
00050000-5699-08f0-2540-12f38c9e2e8a	4243	Brezje
00050000-5699-08f0-040c-176feae724da	1351	Brezovica pri Ljubljani
00050000-5699-08f0-9b2e-e461f08d46b1	8250	Brežice
00050000-5699-08f0-5ae7-62452168c605	4210	Brnik - Aerodrom
00050000-5699-08f0-5aa4-83a3ad5490d8	8321	Brusnice
00050000-5699-08f0-3518-c088f069826e	3255	Buče
00050000-5699-08f0-87c5-11fc3261a079	8276	Bučka 
00050000-5699-08f0-69a4-015832ccfd76	9261	Cankova
00050000-5699-08f0-8fc2-9c8c9c692f3e	3000	Celje 
00050000-5699-08f0-df55-f563d94f17f5	3001	Celje - poštni predali
00050000-5699-08f0-af90-db4727b9ce32	4207	Cerklje na Gorenjskem
00050000-5699-08f0-91c8-9a22957d9e30	8263	Cerklje ob Krki
00050000-5699-08f0-6342-0ff7d7e926c9	1380	Cerknica
00050000-5699-08f0-311b-5ac68d6b9da0	5282	Cerkno
00050000-5699-08f0-8ed0-3a8542d84de9	2236	Cerkvenjak
00050000-5699-08f0-9346-746b2e2a1d43	2215	Ceršak
00050000-5699-08f0-b90a-3172151c3801	2326	Cirkovce
00050000-5699-08f0-8ff2-76d38c71660f	2282	Cirkulane
00050000-5699-08f0-e7b2-204f5e990f35	5273	Col
00050000-5699-08f0-58fd-0446b05b4072	8251	Čatež ob Savi
00050000-5699-08f0-7764-e359214d04c3	1413	Čemšenik
00050000-5699-08f0-612b-5a3233a56369	5253	Čepovan
00050000-5699-08f0-b4c9-a3efc03831d9	9232	Črenšovci
00050000-5699-08f0-8e14-f763538671d5	2393	Črna na Koroškem
00050000-5699-08f0-b5bb-8fc85fb67311	6275	Črni Kal
00050000-5699-08f0-5d84-57053c29fa6b	5274	Črni Vrh nad Idrijo
00050000-5699-08f0-2f7d-fde16e62ffa6	5262	Črniče
00050000-5699-08f0-6515-c98bc4d2f874	8340	Črnomelj
00050000-5699-08f0-235f-7409349f0e71	6271	Dekani
00050000-5699-08f0-e555-941b91068aba	5210	Deskle
00050000-5699-08f0-0b53-53c85851afb1	2253	Destrnik
00050000-5699-08f0-6f80-7243f7829e56	6215	Divača
00050000-5699-08f0-8610-4695d1557adc	1233	Dob
00050000-5699-08f0-3551-8b2dcad230d2	3224	Dobje pri Planini
00050000-5699-08f0-49fd-dcddae5b71fc	8257	Dobova
00050000-5699-08f0-b121-6576a5ff7f76	1423	Dobovec
00050000-5699-08f0-41b1-757278b2e3d2	5263	Dobravlje
00050000-5699-08f0-008d-661f60f95170	3204	Dobrna
00050000-5699-08f0-7fc2-44c23be2738a	8211	Dobrnič
00050000-5699-08f0-933a-09e61673c821	1356	Dobrova
00050000-5699-08f0-ad31-94d9422ffc3a	9223	Dobrovnik/Dobronak 
00050000-5699-08f0-44a8-9ee39e9e6da1	5212	Dobrovo v Brdih
00050000-5699-08f0-9339-9c83af614920	1431	Dol pri Hrastniku
00050000-5699-08f0-de5e-dee22cb8e8b6	1262	Dol pri Ljubljani
00050000-5699-08f0-5215-24c8f25e5694	1273	Dole pri Litiji
00050000-5699-08f0-761d-b49a1d410071	1331	Dolenja vas
00050000-5699-08f0-a034-6d5779635038	8350	Dolenjske Toplice
00050000-5699-08f0-7dd1-c7c3cc8475b3	1230	Domžale
00050000-5699-08f0-3614-81c814b777e4	2252	Dornava
00050000-5699-08f0-5ffe-fbb35a65cb9d	5294	Dornberk
00050000-5699-08f0-2297-2f82ad3f0df8	1319	Draga
00050000-5699-08f0-dbeb-7bbd0f6d3264	8343	Dragatuš
00050000-5699-08f0-6c88-1d3e5a2ca3d0	3222	Dramlje
00050000-5699-08f0-7b31-703dc200dc8c	2370	Dravograd
00050000-5699-08f0-b013-2b3bd27b7c2b	4203	Duplje
00050000-5699-08f0-5e7a-9704a0c4d9a0	6221	Dutovlje
00050000-5699-08f0-e3cb-ecf54c5a3cd4	8361	Dvor
00050000-5699-08f0-7f43-9143dc2de5dd	2343	Fala
00050000-5699-08f0-75c5-9257110d634c	9208	Fokovci
00050000-5699-08f0-858a-3cfc9a66b20f	2313	Fram
00050000-5699-08f0-12f0-70fbfe5c3f2b	3213	Frankolovo
00050000-5699-08f0-2530-bb1989dfe9fc	1274	Gabrovka
00050000-5699-08f0-06e1-caff792e0400	8254	Globoko
00050000-5699-08f0-eb8d-334a8cded071	5275	Godovič
00050000-5699-08f0-f891-c7aac73f3754	4204	Golnik
00050000-5699-08f0-797d-ffd0b0b799b6	3303	Gomilsko
00050000-5699-08f0-5f17-85f7603f05b1	4224	Gorenja vas
00050000-5699-08f0-e525-db63be8ba1ec	3263	Gorica pri Slivnici
00050000-5699-08f0-d61c-3bde8f315796	2272	Gorišnica
00050000-5699-08f0-427f-ac310ce70bb4	9250	Gornja Radgona
00050000-5699-08f0-9ebb-2a96ed08329b	3342	Gornji Grad
00050000-5699-08f0-65e2-05a316ae2293	4282	Gozd Martuljek
00050000-5699-08f0-06be-767f1f478c75	6272	Gračišče
00050000-5699-08f0-07fe-e848ef976ece	9264	Grad
00050000-5699-08f0-84c5-ae621354dfc7	8332	Gradac
00050000-5699-08f0-c6c4-c157cefb60b1	1384	Grahovo
00050000-5699-08f0-c4a6-c77762e8de74	5242	Grahovo ob Bači
00050000-5699-08f0-57b2-49b9fabc464d	5251	Grgar
00050000-5699-08f0-131c-7508a50b7a9c	3302	Griže
00050000-5699-08f0-ad3f-052b76432e95	3231	Grobelno
00050000-5699-08f0-619b-723e70e7e51d	1290	Grosuplje
00050000-5699-08f0-cd98-6da1f2841126	2288	Hajdina
00050000-5699-08f0-8ceb-fb95c0b5bb1e	8362	Hinje
00050000-5699-08f0-074a-f93283467aa8	2311	Hoče
00050000-5699-08f0-4a7b-dd2c4a18ca44	9205	Hodoš/Hodos
00050000-5699-08f0-5313-fcf1fbafcd1c	1354	Horjul
00050000-5699-08f0-c788-3edf673f447b	1372	Hotedršica
00050000-5699-08f0-c1fc-4d08f407cfd9	1430	Hrastnik
00050000-5699-08f0-ff12-262968f70032	6225	Hruševje
00050000-5699-08f0-be03-bd9fab033c9f	4276	Hrušica
00050000-5699-08f0-354a-559f66b8fb77	5280	Idrija
00050000-5699-08f0-0a22-2422784845de	1292	Ig
00050000-5699-08f0-8bc6-98c7e20e5888	6250	Ilirska Bistrica
00050000-5699-08f0-450c-af1248202a49	6251	Ilirska Bistrica-Trnovo
00050000-5699-08f0-4ae7-26610de7e3a5	1295	Ivančna Gorica
00050000-5699-08f0-08af-db1da5d1c3bc	2259	Ivanjkovci
00050000-5699-08f0-6e75-50d7ef7a73a7	1411	Izlake
00050000-5699-08f0-91cf-6363d01f0982	6310	Izola/Isola
00050000-5699-08f0-8746-778916d8f817	2222	Jakobski Dol
00050000-5699-08f0-f711-1df25d2c8d0d	2221	Jarenina
00050000-5699-08f0-9bf4-0763fa0e63e9	6254	Jelšane
00050000-5699-08f0-7f1c-1c6371d858f6	4270	Jesenice
00050000-5699-08f0-4e8b-4d1a051e0702	8261	Jesenice na Dolenjskem
00050000-5699-08f0-a5ea-12934351035b	3273	Jurklošter
00050000-5699-08f0-f227-05994e609ac6	2223	Jurovski Dol
00050000-5699-08f0-647c-2cd6b071e641	2256	Juršinci
00050000-5699-08f0-db86-b9e86b4a731b	5214	Kal nad Kanalom
00050000-5699-08f0-0ac6-5b14898bc3b2	3233	Kalobje
00050000-5699-08f0-1627-4eda8224b407	4246	Kamna Gorica
00050000-5699-08f0-97d3-8aa27625c71f	2351	Kamnica
00050000-5699-08f0-bae9-8b929868e0a0	1241	Kamnik
00050000-5699-08f0-92db-63d40e721218	5213	Kanal
00050000-5699-08f0-cf46-05d0014cd293	8258	Kapele
00050000-5699-08f0-edba-43b050017385	2362	Kapla
00050000-5699-08f0-6006-44e960260d80	2325	Kidričevo
00050000-5699-08f0-ecdd-615700f6860a	1412	Kisovec
00050000-5699-08f0-e31d-932d50c6063c	6253	Knežak
00050000-5699-08f0-c01b-00981d84b521	5222	Kobarid
00050000-5699-08f0-7f73-2533dcb4474a	9227	Kobilje
00050000-5699-08f0-1d51-21d1535a27f5	1330	Kočevje
00050000-5699-08f0-d517-3719a60b80d4	1338	Kočevska Reka
00050000-5699-08f0-623e-0ad47c9ebfc8	2276	Kog
00050000-5699-08f0-a8ba-39f3c63d50f8	5211	Kojsko
00050000-5699-08f0-68e2-2cc190f79f7a	6223	Komen
00050000-5699-08f0-f63c-0938364efa11	1218	Komenda
00050000-5699-08f0-0715-b7a9a01e8716	6000	Koper/Capodistria 
00050000-5699-08f0-ee39-2b1c5de01b28	6001	Koper/Capodistria - poštni predali
00050000-5699-08f0-4d10-995c11e5161d	8282	Koprivnica
00050000-5699-08f0-aaf2-67f824be4894	5296	Kostanjevica na Krasu
00050000-5699-08f0-4b99-820a22cecd53	8311	Kostanjevica na Krki
00050000-5699-08f0-8268-af5dea6614da	1336	Kostel
00050000-5699-08f0-33bf-f5346fa3e80b	6256	Košana
00050000-5699-08f0-fdce-f1ef1daf8659	2394	Kotlje
00050000-5699-08f0-cfea-a3b8d0576278	6240	Kozina
00050000-5699-08f0-289d-431149f35b2e	3260	Kozje
00050000-5699-08f0-3811-df7e17c05d21	4000	Kranj 
00050000-5699-08f0-1f07-6053517cee30	4001	Kranj - poštni predali
00050000-5699-08f0-7bed-d57fa9c31f5c	4280	Kranjska Gora
00050000-5699-08f0-ad28-95eb8a134515	1281	Kresnice
00050000-5699-08f0-84e6-2e6157b23fc8	4294	Križe
00050000-5699-08f0-41eb-a7fce52079cc	9206	Križevci
00050000-5699-08f0-848f-41628d8f1444	9242	Križevci pri Ljutomeru
00050000-5699-08f0-4a5f-4abe5d2884aa	1301	Krka
00050000-5699-08f0-38ab-7b7959f17aee	8296	Krmelj
00050000-5699-08f0-5ed8-0881d50ee6a5	4245	Kropa
00050000-5699-08f0-3b7d-b354b8d0b137	8262	Krška vas
00050000-5699-08f0-931b-3d359f68ccec	8270	Krško
00050000-5699-08f0-36f6-85fd68a93602	9263	Kuzma
00050000-5699-08f0-b4c8-f3daa2ba9bcf	2318	Laporje
00050000-5699-08f0-8938-44f98ab8dc33	3270	Laško
00050000-5699-08f0-45fe-3023e6417ec6	1219	Laze v Tuhinju
00050000-5699-08f0-147e-dd721ad7d1d0	2230	Lenart v Slovenskih goricah
00050000-5699-08f0-895c-fa5d03a35693	9220	Lendava/Lendva
00050000-5699-08f0-c899-fc3224fcf3f1	4248	Lesce
00050000-5699-08f0-c79f-ec92d84c67bc	3261	Lesično
00050000-5699-08f0-50e6-697764e15f27	8273	Leskovec pri Krškem
00050000-5699-08f0-7593-a35860b61e7a	2372	Libeliče
00050000-5699-08f0-9bbe-4400378a828a	2341	Limbuš
00050000-5699-08f0-cb83-50fae2dfd238	1270	Litija
00050000-5699-08f0-3065-5d79a695612a	3202	Ljubečna
00050000-5699-08f0-d6bb-20be29c95eef	1000	Ljubljana 
00050000-5699-08f0-3851-c379ed266175	1001	Ljubljana - poštni predali
00050000-5699-08f0-bea4-e669d838b1a6	1231	Ljubljana - Črnuče
00050000-5699-08f0-5407-6879816f49c6	1261	Ljubljana - Dobrunje
00050000-5699-08f0-53e0-9cc3a7b6b317	1260	Ljubljana - Polje
00050000-5699-08f0-0cf4-4c948ffdfe7b	1210	Ljubljana - Šentvid
00050000-5699-08f0-0e3b-7d752719015a	1211	Ljubljana - Šmartno
00050000-5699-08f0-d14e-39a517dfbbe0	3333	Ljubno ob Savinji
00050000-5699-08f0-cd5d-cd874922bbec	9240	Ljutomer
00050000-5699-08f0-0b52-99e1145fb62c	3215	Loče
00050000-5699-08f0-c6e3-d2dd7ff79f9f	5231	Log pod Mangartom
00050000-5699-08f0-8c2e-8f393c0d799c	1358	Log pri Brezovici
00050000-5699-08f0-30b6-f4d3cfa8b884	1370	Logatec
00050000-5699-08f0-8138-4967c2f4f92a	1371	Logatec
00050000-5699-08f0-5230-df970d4b6cd4	1434	Loka pri Zidanem Mostu
00050000-5699-08f0-1ba4-9a1d7d67d083	3223	Loka pri Žusmu
00050000-5699-08f0-c2ae-9c99e1e3a026	6219	Lokev
00050000-5699-08f0-ef3f-cd53dc108fee	1318	Loški Potok
00050000-5699-08f0-75cb-56abf0115cbf	2324	Lovrenc na Dravskem polju
00050000-5699-08f0-841a-a529e85eca79	2344	Lovrenc na Pohorju
00050000-5699-08f0-5a5a-aa198f8c3d26	3334	Luče
00050000-5699-08f0-16a9-855def95abb5	1225	Lukovica
00050000-5699-08f0-edf1-d106edefe9e2	9202	Mačkovci
00050000-5699-08f0-d76a-b2d058aef474	2322	Majšperk
00050000-5699-08f0-8c5c-5db703a531c3	2321	Makole
00050000-5699-08f0-15d3-81d49d82d560	9243	Mala Nedelja
00050000-5699-08f0-befe-9d9e7a8dab21	2229	Malečnik
00050000-5699-08f0-3889-4287738b71cd	6273	Marezige
00050000-5699-08f0-2cae-3feee3dd0181	2000	Maribor 
00050000-5699-08f0-931b-19067ddedf73	2001	Maribor - poštni predali
00050000-5699-08f0-e1dd-b9aee565e7a4	2206	Marjeta na Dravskem polju
00050000-5699-08f0-296f-e7f595489499	2281	Markovci
00050000-5699-08f0-24d1-4042e04a260c	9221	Martjanci
00050000-5699-08f0-a1d8-f3428a5953a2	6242	Materija
00050000-5699-08f0-e4e2-9b9407db9b39	4211	Mavčiče
00050000-5699-08f0-8540-c0b0d9d46d7e	1215	Medvode
00050000-5699-08f0-e64f-6cabdc130bbe	1234	Mengeš
00050000-5699-08f0-19a7-9b71bca56821	8330	Metlika
00050000-5699-08f0-4caf-a81dafde2750	2392	Mežica
00050000-5699-08f0-acf6-3cac0e14fdf0	2204	Miklavž na Dravskem polju
00050000-5699-08f0-59da-b27ebfbbae3f	2275	Miklavž pri Ormožu
00050000-5699-08f0-70d6-0e26aba8a751	5291	Miren
00050000-5699-08f0-6ee4-6ffac71647b6	8233	Mirna
00050000-5699-08f0-fbaf-4363a29b40db	8216	Mirna Peč
00050000-5699-08f0-b77b-e089a5ab4803	2382	Mislinja
00050000-5699-08f0-8e61-a3df16691783	4281	Mojstrana
00050000-5699-08f0-d267-fdf8ed5fa705	8230	Mokronog
00050000-5699-08f0-51d2-8088565f476a	1251	Moravče
00050000-5699-08f0-52d9-2c1429ea21d9	9226	Moravske Toplice
00050000-5699-08f0-1fb9-a1540080ea70	5216	Most na Soči
00050000-5699-08f0-7b7e-671d1bbb2962	1221	Motnik
00050000-5699-08f0-ab49-3e1f7e34af3d	3330	Mozirje
00050000-5699-08f0-0f73-a1b3c04dcf36	9000	Murska Sobota 
00050000-5699-08f0-8559-608e3c6b7692	9001	Murska Sobota - poštni predali
00050000-5699-08f0-cf93-4301eaab4ea8	2366	Muta
00050000-5699-08f0-05bc-c92bff310d3d	4202	Naklo
00050000-5699-08f0-8899-3bcdd16682f8	3331	Nazarje
00050000-5699-08f0-bd74-13cebfdc911e	1357	Notranje Gorice
00050000-5699-08f0-35e1-8542bb5c62b6	3203	Nova Cerkev
00050000-5699-08f0-b10c-28be3dc96c67	5000	Nova Gorica 
00050000-5699-08f0-94fc-e82f98e34778	5001	Nova Gorica - poštni predali
00050000-5699-08f0-89ee-fa9c0c6c1a7c	1385	Nova vas
00050000-5699-08f0-459e-6746750f06e5	8000	Novo mesto
00050000-5699-08f0-832e-48682bb962a9	8001	Novo mesto - poštni predali
00050000-5699-08f0-367e-0a7bedeb4428	6243	Obrov
00050000-5699-08f0-9bb8-c68b32cd40a2	9233	Odranci
00050000-5699-08f0-25c3-539f86f5e799	2317	Oplotnica
00050000-5699-08f0-1220-0be3c3f46a12	2312	Orehova vas
00050000-5699-08f0-3186-686bf165a9fa	2270	Ormož
00050000-5699-08f0-440c-e5e0b12255e0	1316	Ortnek
00050000-5699-08f0-79f1-bae396b7e940	1337	Osilnica
00050000-5699-08f0-d9c6-c48af674e52e	8222	Otočec
00050000-5699-08f0-f01c-90c710a5f952	2361	Ožbalt
00050000-5699-08f0-2b02-a8a901a97044	2231	Pernica
00050000-5699-08f0-3b31-d5cd6f2079e5	2211	Pesnica pri Mariboru
00050000-5699-08f0-1ca3-7c9d1a968c52	9203	Petrovci
00050000-5699-08f0-0d1d-9dd7b48cdda2	3301	Petrovče
00050000-5699-08f0-3487-aa4bb0fccfe1	6330	Piran/Pirano
00050000-5699-08f0-8797-f343745e34d5	8255	Pišece
00050000-5699-08f0-7b65-09ad43c5abd4	6257	Pivka
00050000-5699-08f0-ef3f-b2aad2bdd82d	6232	Planina
00050000-5699-08f0-f433-d072878dd6bd	3225	Planina pri Sevnici
00050000-5699-08f0-995d-c2a398c0a6f5	6276	Pobegi
00050000-5699-08f0-3383-df3754ba15fb	8312	Podbočje
00050000-5699-08f0-3b70-0d9628c1c25b	5243	Podbrdo
00050000-5699-08f0-b494-607682f543bb	3254	Podčetrtek
00050000-5699-08f0-3f4c-2f6de418cbfd	2273	Podgorci
00050000-5699-08f0-fe99-4b19250d6767	6216	Podgorje
00050000-5699-08f0-4069-ac3d292eee85	2381	Podgorje pri Slovenj Gradcu
00050000-5699-08f0-85ec-7ef7c990d3c1	6244	Podgrad
00050000-5699-08f0-0f73-f12c0da18f74	1414	Podkum
00050000-5699-08f0-1f4a-a89dd3c1026a	2286	Podlehnik
00050000-5699-08f0-5424-28299ff76588	5272	Podnanos
00050000-5699-08f0-b993-ffdb9b2f3dd2	4244	Podnart
00050000-5699-08f0-c5b2-98f56f9f6bff	3241	Podplat
00050000-5699-08f0-1503-e3483c9217d8	3257	Podsreda
00050000-5699-08f0-9cf3-c8f08a36d836	2363	Podvelka
00050000-5699-08f0-6e71-73c414aea642	2208	Pohorje
00050000-5699-08f0-ec8f-f432c98c6a84	2257	Polenšak
00050000-5699-08f0-6241-c648ed22f05a	1355	Polhov Gradec
00050000-5699-08f0-777b-45d86f18dc66	4223	Poljane nad Škofjo Loko
00050000-5699-08f0-4127-3b1316679bcd	2319	Poljčane
00050000-5699-08f0-a84f-9db94bf5b5a4	1272	Polšnik
00050000-5699-08f0-5982-586f69b35206	3313	Polzela
00050000-5699-08f0-d6af-7fc16bf27abf	3232	Ponikva
00050000-5699-08f0-a8d2-bb5b028a5c7d	6320	Portorož/Portorose
00050000-5699-08f0-0e8a-70c0c4bb4717	6230	Postojna
00050000-5699-08f0-b2a3-f9bf9b9408ac	2331	Pragersko
00050000-5699-08f0-3d4b-a1847de899db	3312	Prebold
00050000-5699-08f0-4f88-c95e0320c3b1	4205	Preddvor
00050000-5699-08f0-60db-caccdfd6f0e1	6255	Prem
00050000-5699-08f0-6ee1-f73fed729181	1352	Preserje
00050000-5699-08f0-16a5-c770309b343e	6258	Prestranek
00050000-5699-08f0-4766-c1b6771249eb	2391	Prevalje
00050000-5699-08f0-78ed-fbc025e5ef53	3262	Prevorje
00050000-5699-08f0-d317-708bf19dabd8	1276	Primskovo 
00050000-5699-08f0-7fae-a4a6992d7b45	3253	Pristava pri Mestinju
00050000-5699-08f0-fe6e-953377ce42db	9207	Prosenjakovci/Partosfalva
00050000-5699-08f0-576a-68ad151b288a	5297	Prvačina
00050000-5699-08f0-fddd-e2069bd96056	2250	Ptuj
00050000-5699-08f0-de37-660efd458133	2323	Ptujska Gora
00050000-5699-08f0-3942-ef729ff6c82a	9201	Puconci
00050000-5699-08f0-55a9-7081d2368814	2327	Rače
00050000-5699-08f0-90e0-8011ced3b2ec	1433	Radeče
00050000-5699-08f0-614f-fce2a41034e1	9252	Radenci
00050000-5699-08f0-6a5a-a5bd6758c04c	2360	Radlje ob Dravi
00050000-5699-08f0-4b37-e44e6009ef53	1235	Radomlje
00050000-5699-08f0-677a-f45d3cb58156	4240	Radovljica
00050000-5699-08f0-e01d-fe7795f63486	8274	Raka
00050000-5699-08f0-819a-92d5d591d779	1381	Rakek
00050000-5699-08f0-fc6c-24725fdb1c78	4283	Rateče - Planica
00050000-5699-08f0-d417-d073731f9551	2390	Ravne na Koroškem
00050000-5699-08f0-9db4-bb674f6119fd	9246	Razkrižje
00050000-5699-08f0-f57f-5464c7fef336	3332	Rečica ob Savinji
00050000-5699-08f0-4dc8-e16f75a93c81	5292	Renče
00050000-5699-08f0-6cc6-01ae683adcc6	1310	Ribnica
00050000-5699-08f0-9df8-dad63a86bd91	2364	Ribnica na Pohorju
00050000-5699-08f0-9a46-77eaaa036662	3272	Rimske Toplice
00050000-5699-08f0-d163-f6afabee3c95	1314	Rob
00050000-5699-08f0-def0-9abbc35c289e	5215	Ročinj
00050000-5699-08f0-3956-32818548d5f8	3250	Rogaška Slatina
00050000-5699-08f0-e4a9-7caf2dd81884	9262	Rogašovci
00050000-5699-08f0-6814-518f207ae4b2	3252	Rogatec
00050000-5699-08f0-37bf-c79c893991f5	1373	Rovte
00050000-5699-08f0-7c5f-53582489b9e2	2342	Ruše
00050000-5699-08f0-0b47-c4fd427de9af	1282	Sava
00050000-5699-08f0-6fe8-a74fc1215445	6333	Sečovlje/Sicciole
00050000-5699-08f0-4b7b-fc6552d9bbcd	4227	Selca
00050000-5699-08f0-ebe7-a8eb3dac2952	2352	Selnica ob Dravi
00050000-5699-08f0-3bd5-2d3ad07d8c18	8333	Semič
00050000-5699-08f0-70b4-ec695a62cb58	8281	Senovo
00050000-5699-08f0-5b75-6e117448d4ea	6224	Senožeče
00050000-5699-08f0-cad7-e3891df4319a	8290	Sevnica
00050000-5699-08f0-2b01-c71b07abc7ee	6210	Sežana
00050000-5699-08f0-dea2-fd72b23b25c1	2214	Sladki Vrh
00050000-5699-08f0-5b35-1b2e34f0b3af	5283	Slap ob Idrijci
00050000-5699-08f0-1727-2ea225c18850	2380	Slovenj Gradec
00050000-5699-08f0-71cd-03f6a86f55ed	2310	Slovenska Bistrica
00050000-5699-08f0-d59c-f9da7e995f65	3210	Slovenske Konjice
00050000-5699-08f0-9988-4158618352cb	1216	Smlednik
00050000-5699-08f0-6d7f-9e6a3ea2becf	5232	Soča
00050000-5699-08f0-f118-b40e6f1f4604	1317	Sodražica
00050000-5699-08f0-a5a8-07dc2ab63a4f	3335	Solčava
00050000-5699-08f0-b188-2a1851fdb635	5250	Solkan
00050000-5699-08f0-7c9c-7ff59088b203	4229	Sorica
00050000-5699-08f0-3d1f-dd5d97465d7c	4225	Sovodenj
00050000-5699-08f0-18dc-b9d14771d15c	5281	Spodnja Idrija
00050000-5699-08f0-5302-680c029d771a	2241	Spodnji Duplek
00050000-5699-08f0-8713-de13a0196747	9245	Spodnji Ivanjci
00050000-5699-08f0-5ed3-1ba109a4787c	2277	Središče ob Dravi
00050000-5699-08f0-6704-cda15781c1a5	4267	Srednja vas v Bohinju
00050000-5699-08f0-dcaa-1cc244971de2	8256	Sromlje 
00050000-5699-08f0-d4f0-e6335a2eb502	5224	Srpenica
00050000-5699-08f0-7d3e-42a172cda68a	1242	Stahovica
00050000-5699-08f0-803e-84ef419941b0	1332	Stara Cerkev
00050000-5699-08f0-cd86-85b879b4834c	8342	Stari trg ob Kolpi
00050000-5699-08f0-1764-c5387af98f63	1386	Stari trg pri Ložu
00050000-5699-08f0-9373-92b68225bd02	2205	Starše
00050000-5699-08f0-9e7c-298f6e22744b	2289	Stoperce
00050000-5699-08f0-356d-9984119cb99f	8322	Stopiče
00050000-5699-08f0-0872-a23a5b2f5ba9	3206	Stranice
00050000-5699-08f0-c11a-ee3fcb3ba412	8351	Straža
00050000-5699-08f0-f9d6-2196c53c947e	1313	Struge
00050000-5699-08f0-6010-740992684757	8293	Studenec
00050000-5699-08f0-9dae-c3cccf5d1add	8331	Suhor
00050000-5699-08f0-0a25-70fa43b70f34	2233	Sv. Ana v Slovenskih goricah
00050000-5699-08f0-02f4-f15bd93318fa	2235	Sv. Trojica v Slovenskih goricah
00050000-5699-08f0-b655-f0bdc3eaafc1	2353	Sveti Duh na Ostrem Vrhu
00050000-5699-08f0-49b0-a7c19b455458	9244	Sveti Jurij ob Ščavnici
00050000-5699-08f0-241c-e24f65311fb7	3264	Sveti Štefan
00050000-5699-08f0-c717-b522a7a4d8e2	2258	Sveti Tomaž
00050000-5699-08f0-071d-a5bc42444cd5	9204	Šalovci
00050000-5699-08f0-ada1-d20368ae3cc2	5261	Šempas
00050000-5699-08f0-6b9d-2c62776de06d	5290	Šempeter pri Gorici
00050000-5699-08f0-8b74-767657f78752	3311	Šempeter v Savinjski dolini
00050000-5699-08f0-b888-7db8058e0a66	4208	Šenčur
00050000-5699-08f0-fc19-ec23cc619a6b	2212	Šentilj v Slovenskih goricah
00050000-5699-08f0-0f42-121ac2fbdac3	8297	Šentjanž
00050000-5699-08f0-ca92-a51182213b05	2373	Šentjanž pri Dravogradu
00050000-5699-08f0-73b8-bd334d392faf	8310	Šentjernej
00050000-5699-08f0-b190-18ee68b0e318	3230	Šentjur
00050000-5699-08f0-2ed9-9d902aaa605e	3271	Šentrupert
00050000-5699-08f0-936c-575b9e7e4373	8232	Šentrupert
00050000-5699-08f0-650e-9ba9ae692d34	1296	Šentvid pri Stični
00050000-5699-08f0-aa63-e5b8c4e854b2	8275	Škocjan
00050000-5699-08f0-fe1f-ce357ce57a54	6281	Škofije
00050000-5699-08f0-0ebe-b1b080c626cb	4220	Škofja Loka
00050000-5699-08f0-b16a-6d98e22668e5	3211	Škofja vas
00050000-5699-08f0-252e-dc4511b0b5c1	1291	Škofljica
00050000-5699-08f0-2a9c-edd9703d6a9e	6274	Šmarje
00050000-5699-08f0-8521-dfa5f24e307c	1293	Šmarje - Sap
00050000-5699-08f0-7587-f7975098df9f	3240	Šmarje pri Jelšah
00050000-5699-08f0-d93e-2b5ca1de9734	8220	Šmarješke Toplice
00050000-5699-08f0-cb07-7ff14b0978c3	2315	Šmartno na Pohorju
00050000-5699-08f0-07d3-09224ac3451a	3341	Šmartno ob Dreti
00050000-5699-08f0-ed76-0a8252c88a14	3327	Šmartno ob Paki
00050000-5699-08f0-2107-e33728d6626b	1275	Šmartno pri Litiji
00050000-5699-08f0-6924-6201816c5215	2383	Šmartno pri Slovenj Gradcu
00050000-5699-08f0-7e89-f0675c006df0	3201	Šmartno v Rožni dolini
00050000-5699-08f0-707b-65fb1b4879eb	3325	Šoštanj
00050000-5699-08f0-1459-3492b2e987d8	6222	Štanjel
00050000-5699-08f0-82ce-c01145dbeb87	3220	Štore
00050000-5699-08f0-5586-caaa76e33951	3304	Tabor
00050000-5699-08f0-a8b1-3ffe5d4cdd39	3221	Teharje
00050000-5699-08f0-2fb2-f7098513e76d	9251	Tišina
00050000-5699-08f0-243f-7804712101c7	5220	Tolmin
00050000-5699-08f0-91bc-a6b3e85d6533	3326	Topolšica
00050000-5699-08f0-457b-0d579d490ce9	2371	Trbonje
00050000-5699-08f0-8848-83e42b69558c	1420	Trbovlje
00050000-5699-08f0-8e16-d2af78a5447f	8231	Trebelno 
00050000-5699-08f0-de10-797aa78cad4b	8210	Trebnje
00050000-5699-08f0-7bc9-510dcc0e6eb5	5252	Trnovo pri Gorici
00050000-5699-08f0-df5d-67ae410c5cea	2254	Trnovska vas
00050000-5699-08f0-7ea8-b41262261ae1	1222	Trojane
00050000-5699-08f0-bc6b-6abb488cbbe8	1236	Trzin
00050000-5699-08f0-1307-0ed549105d39	4290	Tržič
00050000-5699-08f0-de21-52421efd848f	8295	Tržišče
00050000-5699-08f0-64f0-4b3114029e3a	1311	Turjak
00050000-5699-08f0-840b-c0edb1c3f823	9224	Turnišče
00050000-5699-08f0-70e0-fedfc6712511	8323	Uršna sela
00050000-5699-08f0-f94e-80c337a09a9f	1252	Vače
00050000-5699-08f0-ac05-9a590c567e3c	3320	Velenje 
00050000-5699-08f0-11a9-7a238fa4a685	3322	Velenje - poštni predali
00050000-5699-08f0-e508-c7fbf094d942	8212	Velika Loka
00050000-5699-08f0-7989-22005fed66ab	2274	Velika Nedelja
00050000-5699-08f0-686c-b95df561d0a7	9225	Velika Polana
00050000-5699-08f0-39c8-8bc4b75c0a32	1315	Velike Lašče
00050000-5699-08f0-030d-d2f4ccd410c8	8213	Veliki Gaber
00050000-5699-08f0-3032-7a10b25f9bed	9241	Veržej
00050000-5699-08f0-810a-a2f321c7be63	1312	Videm - Dobrepolje
00050000-5699-08f0-1c85-e215f720752e	2284	Videm pri Ptuju
00050000-5699-08f0-737e-1a902abb98bf	8344	Vinica
00050000-5699-08f0-11c9-0ccba191cc54	5271	Vipava
00050000-5699-08f0-61c1-ea7fecf06284	4212	Visoko
00050000-5699-08f0-5304-55d4ca4ca6fb	1294	Višnja Gora
00050000-5699-08f0-0689-98493355dffc	3205	Vitanje
00050000-5699-08f0-0b2e-e0732ef11918	2255	Vitomarci
00050000-5699-08f0-d981-b76b8d1db4ab	1217	Vodice
00050000-5699-08f0-e5f9-3dbc17928eaa	3212	Vojnik\t
00050000-5699-08f0-f717-04f655db6e9f	5293	Volčja Draga
00050000-5699-08f0-3810-915fdd9c77dc	2232	Voličina
00050000-5699-08f0-bb91-7772a3ebbb27	3305	Vransko
00050000-5699-08f0-ce88-69a904adfe66	6217	Vremski Britof
00050000-5699-08f0-5051-42a6c63d1695	1360	Vrhnika
00050000-5699-08f0-0ba9-dab85f281224	2365	Vuhred
00050000-5699-08f0-9286-1f8db2fd5464	2367	Vuzenica
00050000-5699-08f0-743a-1b48ef1c276c	8292	Zabukovje 
00050000-5699-08f0-1289-b54d8cb60504	1410	Zagorje ob Savi
00050000-5699-08f0-5e4e-90651b5abe6c	1303	Zagradec
00050000-5699-08f0-2119-86f0190e99b7	2283	Zavrč
00050000-5699-08f0-ef58-9e55383548f1	8272	Zdole 
00050000-5699-08f0-58c7-eaec1fc545b0	4201	Zgornja Besnica
00050000-5699-08f0-d3f6-47fb564673bc	2242	Zgornja Korena
00050000-5699-08f0-c110-b39bd7126f1a	2201	Zgornja Kungota
00050000-5699-08f0-5e43-3888cab45944	2316	Zgornja Ložnica
00050000-5699-08f0-f5c9-ed51133491d0	2314	Zgornja Polskava
00050000-5699-08f0-c96b-17cc1705c03e	2213	Zgornja Velka
00050000-5699-08f0-2024-5ee79c8dcc2d	4247	Zgornje Gorje
00050000-5699-08f0-104a-36c3d10c5bd8	4206	Zgornje Jezersko
00050000-5699-08f0-9087-11e9d3567c2b	2285	Zgornji Leskovec
00050000-5699-08f0-9efe-3dc29b3313d5	1432	Zidani Most
00050000-5699-08f0-0523-905c38855901	3214	Zreče
00050000-5699-08f0-5127-b30b1f8aee95	4209	Žabnica
00050000-5699-08f0-a26c-1822afc0c934	3310	Žalec
00050000-5699-08f0-3b90-2124e4fb3667	4228	Železniki
00050000-5699-08f0-3e8c-54a1af9b8136	2287	Žetale
00050000-5699-08f0-d0b5-d58665f11049	4226	Žiri
00050000-5699-08f0-a543-f54ebb490613	4274	Žirovnica
00050000-5699-08f0-c21c-c24b9c78abc3	8360	Žužemberk
\.


--
-- TOC entry 3210 (class 0 OID 37018390)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 37017960)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 37017691)
-- Dependencies: 191
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5699-08f3-c0c4-23195de22dba	00080000-5699-08f3-f321-25df2abc6288	\N	00040000-5699-08f0-f90b-bdd3823040b5	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5699-08f3-66c8-f79fe33e1cfa	00080000-5699-08f3-f321-25df2abc6288	\N	00040000-5699-08f0-f90b-bdd3823040b5	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5699-08f3-0f65-dd9e9065ceef	00080000-5699-08f3-26cb-c84131c2c5a5	\N	00040000-5699-08f0-f90b-bdd3823040b5	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3169 (class 0 OID 37017829)
-- Dependencies: 203
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5699-08f1-dd2e-9496e6efbb06	novo leto	1	1	\N	t
00430000-5699-08f1-c402-191d43f6c6ba	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5699-08f1-e121-0c428ea95e25	dan upora proti okupatorju	27	4	\N	t
00430000-5699-08f1-e4f9-ff8154ac21f5	praznik dela	1	5	\N	t
00430000-5699-08f1-5c84-750f3d5208c5	praznik dela	2	5	\N	t
00430000-5699-08f1-4291-667df070e2a8	dan Primoža Trubarja	8	6	\N	f
00430000-5699-08f1-2b38-f7794eade378	dan državnosti	25	6	\N	t
00430000-5699-08f1-dbee-02202f6877b0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5699-08f1-7fc2-7ecce5be3b96	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5699-08f1-952a-21c54f262199	dan suverenosti	25	10	\N	f
00430000-5699-08f1-8161-9026745c145c	dan spomina na mrtve	1	11	\N	t
00430000-5699-08f1-86d1-54bd8537edc0	dan Rudolfa Maistra	23	11	\N	f
00430000-5699-08f1-537d-398070c0218c	božič	25	12	\N	t
00430000-5699-08f1-25a4-af2be330b5a9	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5699-08f1-7750-5cd4dd6c991f	Marijino vnebovzetje	15	8	\N	t
00430000-5699-08f1-ff26-23d0c3ed39c1	dan reformacije	31	10	\N	t
00430000-5699-08f1-02d1-bc11a8b83525	velikonočna nedelja	27	3	2016	t
00430000-5699-08f1-89a8-31b65104d66c	velikonočna nedelja	16	4	2017	t
00430000-5699-08f1-ed7b-a621504a6fd4	velikonočna nedelja	1	4	2018	t
00430000-5699-08f1-b7fe-bba7179e0621	velikonočna nedelja	21	4	2019	t
00430000-5699-08f1-ba7b-9f5b618ae5bd	velikonočna nedelja	12	4	2020	t
00430000-5699-08f1-198a-35609e16d0ef	velikonočna nedelja	4	4	2021	t
00430000-5699-08f1-e75b-665d3519c905	velikonočna nedelja	17	4	2022	t
00430000-5699-08f1-2b8e-99275603f33f	velikonočna nedelja	9	4	2023	t
00430000-5699-08f1-6d72-84c86c78a0b6	velikonočna nedelja	31	3	2024	t
00430000-5699-08f1-6f34-b5a6d987cdb9	velikonočna nedelja	20	4	2025	t
00430000-5699-08f1-4d9f-0f8083f30450	velikonočna nedelja	5	4	2026	t
00430000-5699-08f1-2e81-647ca302636d	velikonočna nedelja	28	3	2027	t
00430000-5699-08f1-436d-52620953355c	velikonočna nedelja	16	4	2028	t
00430000-5699-08f1-3c65-39777bb44f64	velikonočna nedelja	1	4	2029	t
00430000-5699-08f1-39a9-c09f38ed045e	velikonočna nedelja	21	4	2030	t
00430000-5699-08f1-7cea-df39c8df0b2e	velikonočni ponedeljek	28	3	2016	t
00430000-5699-08f1-755b-e22e523af2a0	velikonočni ponedeljek	17	4	2017	t
00430000-5699-08f1-5614-3c0a737d6bdc	velikonočni ponedeljek	2	4	2018	t
00430000-5699-08f1-77a9-a63996de9216	velikonočni ponedeljek	22	4	2019	t
00430000-5699-08f1-0c81-ad7baacf1a46	velikonočni ponedeljek	13	4	2020	t
00430000-5699-08f1-c2c9-3d641099efe8	velikonočni ponedeljek	5	4	2021	t
00430000-5699-08f1-83b8-453489ce3e55	velikonočni ponedeljek	18	4	2022	t
00430000-5699-08f1-d417-40c1aecbbe94	velikonočni ponedeljek	10	4	2023	t
00430000-5699-08f1-016e-d8049839910b	velikonočni ponedeljek	1	4	2024	t
00430000-5699-08f1-356b-d9ac84e391f0	velikonočni ponedeljek	21	4	2025	t
00430000-5699-08f1-9b1f-b279457d7842	velikonočni ponedeljek	6	4	2026	t
00430000-5699-08f1-c14b-1ec1e2261243	velikonočni ponedeljek	29	3	2027	t
00430000-5699-08f1-734f-f80b8d7f635a	velikonočni ponedeljek	17	4	2028	t
00430000-5699-08f1-6ce4-eb089ba9ae46	velikonočni ponedeljek	2	4	2029	t
00430000-5699-08f1-abe1-a6969681a3d5	velikonočni ponedeljek	22	4	2030	t
00430000-5699-08f1-19a0-4cc5e40f4b6a	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5699-08f1-49a4-4d94abc9bda2	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5699-08f1-07b5-ab2155975a85	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5699-08f1-40ba-e68e53182b84	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5699-08f1-815b-dd8004e49f57	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5699-08f1-87a5-1735e09146ef	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5699-08f1-6da8-1c17995aebcf	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5699-08f1-819d-223c11866204	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5699-08f1-5a47-0e49dc6b5c70	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5699-08f1-cbd0-528c3dc0aa08	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5699-08f1-224d-1f1e91be6db6	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5699-08f1-b537-44cddc4d250b	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5699-08f1-c7ee-27bc1f1dfb75	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5699-08f1-f2b6-b78f57f9e45d	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5699-08f1-e75b-577934af3f50	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3165 (class 0 OID 37017795)
-- Dependencies: 199
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 37017804)
-- Dependencies: 200
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 37017972)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 37018404)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 37018414)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5699-08f3-df5c-61119c4f2e6e	00080000-5699-08f3-770f-520324114263	0987	AK
00190000-5699-08f3-02c7-428411589c8e	00080000-5699-08f3-26cb-c84131c2c5a5	0989	AK
00190000-5699-08f3-79e5-2cd49194cc83	00080000-5699-08f3-dd25-373be00aaae5	0986	AK
00190000-5699-08f3-564b-7eb954d700ee	00080000-5699-08f3-68a5-ba05faadd4b2	0984	AK
00190000-5699-08f3-7454-376c0b1e4f64	00080000-5699-08f3-960f-1b405fcddea0	0983	AK
00190000-5699-08f3-3451-500536afdf9d	00080000-5699-08f3-4bd4-10ecc41c126c	0982	AK
00190000-5699-08f5-c0a4-7f892b459169	00080000-5699-08f5-f4fa-33dce8472170	1001	AK
\.


--
-- TOC entry 3209 (class 0 OID 37018303)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5699-08f4-5371-e281ae4b4c94	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3213 (class 0 OID 37018422)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 37018001)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5699-08f3-76c6-e39062562c8c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5699-08f3-36d8-0ec844c1991e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5699-08f3-4a13-24b30778c90b	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5699-08f3-1c4f-826756ec32aa	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5699-08f3-3432-a6e5b15f1947	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5699-08f3-f8a3-816510100190	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5699-08f3-1ab6-848ad00bf80b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3181 (class 0 OID 37017945)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 37017935)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 37018142)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 37018072)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 37017769)
-- Dependencies: 197
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 37017531)
-- Dependencies: 176
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5699-08f5-f4fa-33dce8472170	00010000-5699-08f1-6681-27aa82f0f297	2016-01-15 15:57:57	INS	a:0:{}
2	App\\Entity\\Option	00000000-5699-08f5-6e48-5d4bc122e50f	00010000-5699-08f1-6681-27aa82f0f297	2016-01-15 15:57:57	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5699-08f5-c0a4-7f892b459169	00010000-5699-08f1-6681-27aa82f0f297	2016-01-15 15:57:57	INS	a:0:{}
\.


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3190 (class 0 OID 37018014)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 37017569)
-- Dependencies: 180
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5699-08f1-6a3f-38c9776cb7ca	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5699-08f1-7f5a-f7f5a5328998	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5699-08f1-12bc-d3079ada6acb	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5699-08f1-b935-10fb5143f555	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5699-08f1-3a28-e993136a87e9	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5699-08f1-16c5-438b4c11a494	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5699-08f1-0854-5b18040374e3	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5699-08f1-f3ea-cdeab9fa67bd	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5699-08f1-88e9-f7cfa91902f7	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5699-08f1-ce0a-88830e5900f3	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5699-08f1-dffb-b560a8195c51	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5699-08f1-dd47-9158da030eea	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5699-08f1-18a1-d88de68c1b82	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5699-08f1-59cc-fa012d57e898	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5699-08f1-101b-9d1d763519c4	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5699-08f1-f957-24764dd2ce12	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5699-08f1-4381-d933b6c31b26	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5699-08f1-fb58-f08574ab73b7	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5699-08f1-05e6-869b38f33fb5	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5699-08f1-50b3-3ca5be6c69bb	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5699-08f1-7567-e43441730d03	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5699-08f1-5823-2c8fedfd49a0	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5699-08f1-bc1d-9c6da7fb3c94	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5699-08f1-2068-70049cf774ea	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5699-08f1-bc29-50d88485e045	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5699-08f1-32a2-9c99c39bd62f	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5699-08f1-053b-f7e4631acebe	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5699-08f1-c5c6-e84016aaf43e	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5699-08f1-9580-8ed81e6b8a3f	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5699-08f1-bb78-019419326a7f	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5699-08f1-db15-a4ecd36a9e30	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5699-08f1-eddb-fbcbcebc05da	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5699-08f1-a8d5-7b5c77334458	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5699-08f1-4d7a-0b70e9a5c3da	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5699-08f1-5bc1-2458ea1ea632	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5699-08f1-c800-ea26bcb8602c	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5699-08f1-5084-b3a004b93a20	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5699-08f1-e8f7-96b041972d50	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5699-08f1-366b-e854c04cb13d	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5699-08f1-1f25-0fb16c4cd7d5	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5699-08f1-0925-f75bf7b10c83	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5699-08f1-77ee-99948d343c3e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5699-08f1-c44e-3199050d1de1	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5699-08f1-04ae-405e5dd4975a	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5699-08f1-ed57-3f3d39b0d77d	direktor	minimalne pravice za direktorja	t
00020000-5699-08f1-e549-9b563d206c82	arhivar	arhivar	t
00020000-5699-08f1-c16f-374b0ccd4974	dramaturg	dramaturg	t
00020000-5699-08f1-a4f9-a2255ec77969	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5699-08f1-8fad-1d5584b5aff6	poslovni-sekretar	poslovni sekretar	t
00020000-5699-08f1-d0a2-9330345cd881	vodja-tehnike	vodja tehnike	t
00020000-5699-08f1-a895-d9e20e088b4a	racunovodja	računovodja	t
00020000-5699-08f3-d68a-7b8607ec73a9	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5699-08f3-0ea5-45ff1ccca8e4	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-9cc4-83f30b5fe895	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-0e07-aee8000e6dbf	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-3f52-4dc5797c911b	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-bb4b-c46e877008d6	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-5af0-e0dc5f2bd6a4	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-303d-157e8ca2a293	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-e750-f4e56f08eae7	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-2513-b5c8ab29aa21	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-be36-9d070c2eba96	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-0527-c96f28116d19	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-a74a-3f69e7a1fec4	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-554d-3d57fa0de189	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-27d0-4e95a4e9c433	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-5bf2-76abc46bed16	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-5bbf-82d77eaec415	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-3e82-24e2546e066c	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-f585-929899ef8084	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-6539-fc8913cf4e76	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5699-08f3-ac57-5f617cf4e516	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-6646-bcbf67939852	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-8f2a-aa6dc2403267	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-e855-3edf094ecc65	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-17a9-7eb7e0019e63	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-d633-48cc99e22b43	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-ab06-39cf2eaa50e7	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-4dbc-058bb2ff3df7	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-c3d0-b2013ec0e9e9	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-e866-29ae106527d9	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-81f4-7fd9ac54ff51	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-617b-bd0fd5fddf1b	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-b876-3f01ad1ebafd	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-a5fd-6f9beedab200	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-9145-4a2c192310a2	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-4823-ecf3c9cc7c9f	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-95ce-032ffa6cb0c6	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-4fba-6e72d06be161	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5699-08f3-264c-82ffc627f888	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3144 (class 0 OID 37017553)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5699-08f1-2d2b-cec5e5b02d23	00020000-5699-08f1-12bc-d3079ada6acb
00010000-5699-08f1-6681-27aa82f0f297	00020000-5699-08f1-12bc-d3079ada6acb
00010000-5699-08f3-8c1e-38cacbd8125b	00020000-5699-08f3-d68a-7b8607ec73a9
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-0ea5-45ff1ccca8e4
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-bb4b-c46e877008d6
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-2513-b5c8ab29aa21
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-0527-c96f28116d19
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-554d-3d57fa0de189
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-f585-929899ef8084
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-0e07-aee8000e6dbf
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-ac57-5f617cf4e516
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-e855-3edf094ecc65
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-d633-48cc99e22b43
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-4dbc-058bb2ff3df7
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-e866-29ae106527d9
00010000-5699-08f3-9605-34329007e211	00020000-5699-08f3-a5fd-6f9beedab200
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-0ea5-45ff1ccca8e4
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-9cc4-83f30b5fe895
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-0e07-aee8000e6dbf
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-3f52-4dc5797c911b
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-554d-3d57fa0de189
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-5bbf-82d77eaec415
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-ac57-5f617cf4e516
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-e855-3edf094ecc65
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-d633-48cc99e22b43
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-4dbc-058bb2ff3df7
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-e866-29ae106527d9
00010000-5699-08f3-014b-a73cf242677e	00020000-5699-08f3-a5fd-6f9beedab200
00010000-5699-08f3-9833-ca2fd18155ce	00020000-5699-08f3-0ea5-45ff1ccca8e4
00010000-5699-08f3-9833-ca2fd18155ce	00020000-5699-08f3-9cc4-83f30b5fe895
00010000-5699-08f3-9833-ca2fd18155ce	00020000-5699-08f3-0e07-aee8000e6dbf
00010000-5699-08f3-9833-ca2fd18155ce	00020000-5699-08f3-3f52-4dc5797c911b
00010000-5699-08f3-9833-ca2fd18155ce	00020000-5699-08f3-0527-c96f28116d19
00010000-5699-08f3-9833-ca2fd18155ce	00020000-5699-08f3-554d-3d57fa0de189
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-9cc4-83f30b5fe895
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-5af0-e0dc5f2bd6a4
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-be36-9d070c2eba96
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-a74a-3f69e7a1fec4
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-0527-c96f28116d19
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-3e82-24e2546e066c
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-554d-3d57fa0de189
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-27d0-4e95a4e9c433
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-ac57-5f617cf4e516
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-6646-bcbf67939852
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-e855-3edf094ecc65
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-17a9-7eb7e0019e63
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-d633-48cc99e22b43
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-ab06-39cf2eaa50e7
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-4dbc-058bb2ff3df7
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-c3d0-b2013ec0e9e9
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-e866-29ae106527d9
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-81f4-7fd9ac54ff51
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-a5fd-6f9beedab200
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-9145-4a2c192310a2
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-95ce-032ffa6cb0c6
00010000-5699-08f3-495a-1f218be58dbd	00020000-5699-08f3-4fba-6e72d06be161
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-9cc4-83f30b5fe895
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-5af0-e0dc5f2bd6a4
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-e750-f4e56f08eae7
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-be36-9d070c2eba96
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-a74a-3f69e7a1fec4
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-0527-c96f28116d19
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-3e82-24e2546e066c
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-554d-3d57fa0de189
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-27d0-4e95a4e9c433
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-5bf2-76abc46bed16
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-ac57-5f617cf4e516
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-6646-bcbf67939852
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-8f2a-aa6dc2403267
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-e855-3edf094ecc65
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-17a9-7eb7e0019e63
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-d633-48cc99e22b43
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-ab06-39cf2eaa50e7
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-4dbc-058bb2ff3df7
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-c3d0-b2013ec0e9e9
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-e866-29ae106527d9
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-81f4-7fd9ac54ff51
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-a5fd-6f9beedab200
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-9145-4a2c192310a2
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-4823-ecf3c9cc7c9f
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-95ce-032ffa6cb0c6
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-4fba-6e72d06be161
00010000-5699-08f3-b5de-a8239b30834f	00020000-5699-08f3-264c-82ffc627f888
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-9cc4-83f30b5fe895
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-0e07-aee8000e6dbf
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-5af0-e0dc5f2bd6a4
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-303d-157e8ca2a293
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-e750-f4e56f08eae7
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-bb4b-c46e877008d6
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-be36-9d070c2eba96
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-a74a-3f69e7a1fec4
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-0527-c96f28116d19
00010000-5699-08f3-7f52-fc4657f1ffa6	00020000-5699-08f3-3e82-24e2546e066c
00010000-5699-08f3-35c1-2c377c645440	00020000-5699-08f3-0ea5-45ff1ccca8e4
00010000-5699-08f3-35c1-2c377c645440	00020000-5699-08f3-3f52-4dc5797c911b
00010000-5699-08f3-35c1-2c377c645440	00020000-5699-08f3-bb4b-c46e877008d6
00010000-5699-08f3-35c1-2c377c645440	00020000-5699-08f3-2513-b5c8ab29aa21
00010000-5699-08f3-35c1-2c377c645440	00020000-5699-08f3-0527-c96f28116d19
00010000-5699-08f3-35c1-2c377c645440	00020000-5699-08f3-554d-3d57fa0de189
00010000-5699-08f3-35c1-2c377c645440	00020000-5699-08f3-f585-929899ef8084
00010000-5699-08f3-35c1-2c377c645440	00020000-5699-08f3-617b-bd0fd5fddf1b
00010000-5699-08f3-37d5-1dfd42077c62	00020000-5699-08f3-6539-fc8913cf4e76
00010000-5699-08f3-33d0-ef946100d7f3	00020000-5699-08f1-ed57-3f3d39b0d77d
00010000-5699-08f3-78b7-12ae0353b6b2	00020000-5699-08f1-e549-9b563d206c82
00010000-5699-08f3-8cbb-5576043e5083	00020000-5699-08f1-c16f-374b0ccd4974
00010000-5699-08f3-e0f5-b2439ecad740	00020000-5699-08f1-a4f9-a2255ec77969
00010000-5699-08f3-dfd9-7ef41a6160e3	00020000-5699-08f1-8fad-1d5584b5aff6
00010000-5699-08f3-0316-e16cf02deed3	00020000-5699-08f1-d0a2-9330345cd881
00010000-5699-08f3-925d-36b209145179	00020000-5699-08f1-a895-d9e20e088b4a
\.


--
-- TOC entry 3192 (class 0 OID 37018028)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 37017966)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 37017889)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5699-08f3-59f1-0d10b1258ce1	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5699-08f3-42b8-2f261fe62e71	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5699-08f3-7b26-4a76f3538043	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3140 (class 0 OID 37017518)
-- Dependencies: 174
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5699-08f0-0090-209eb3de1fe4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5699-08f0-0631-fdeefb6af4fe	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5699-08f0-9a50-9227793aa758	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5699-08f0-9676-f325740207a8	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5699-08f0-becc-f029d4e9b710	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3139 (class 0 OID 37017510)
-- Dependencies: 173
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5699-08f0-c049-59616e5cb3a4	00230000-5699-08f0-9676-f325740207a8	popa
00240000-5699-08f0-a7fc-96e3e119a930	00230000-5699-08f0-9676-f325740207a8	oseba
00240000-5699-08f0-b3a5-a9885d7779a4	00230000-5699-08f0-9676-f325740207a8	tippopa
00240000-5699-08f0-cecb-965406eff623	00230000-5699-08f0-9676-f325740207a8	organizacijskaenota
00240000-5699-08f0-8155-5dac5ca2a128	00230000-5699-08f0-9676-f325740207a8	sezona
00240000-5699-08f0-acba-c94526ae365b	00230000-5699-08f0-9676-f325740207a8	tipvaje
00240000-5699-08f0-3683-5840e4d76c0f	00230000-5699-08f0-9676-f325740207a8	tipdodatka
00240000-5699-08f0-a9cd-c4f0a0389f90	00230000-5699-08f0-0631-fdeefb6af4fe	prostor
00240000-5699-08f0-1738-e6cd2bbf153b	00230000-5699-08f0-9676-f325740207a8	besedilo
00240000-5699-08f0-ae89-43cd1679491a	00230000-5699-08f0-9676-f325740207a8	uprizoritev
00240000-5699-08f0-3260-5b887bee1c27	00230000-5699-08f0-9676-f325740207a8	funkcija
00240000-5699-08f0-2327-0bf4a89537ff	00230000-5699-08f0-9676-f325740207a8	tipfunkcije
00240000-5699-08f0-c1f1-52b9bd7a344f	00230000-5699-08f0-9676-f325740207a8	alternacija
00240000-5699-08f0-9711-0e2efce43ecb	00230000-5699-08f0-0090-209eb3de1fe4	pogodba
00240000-5699-08f0-0bc2-9caafb1ec0d1	00230000-5699-08f0-9676-f325740207a8	zaposlitev
00240000-5699-08f0-7604-e7108245175a	00230000-5699-08f0-9676-f325740207a8	zvrstuprizoritve
00240000-5699-08f0-e8eb-eb7f2316f5a9	00230000-5699-08f0-0090-209eb3de1fe4	programdela
00240000-5699-08f0-8f9d-2628a2eb037d	00230000-5699-08f0-9676-f325740207a8	zapis
\.


--
-- TOC entry 3138 (class 0 OID 37017505)
-- Dependencies: 172
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
80f052f4-a9cb-4d5f-8037-50fc1bb88705	00240000-5699-08f0-c049-59616e5cb3a4	0	1001
\.


--
-- TOC entry 3198 (class 0 OID 37018089)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5699-08f4-947d-45661b9bd0d4	000e0000-5699-08f3-a043-e7e16aee62a0	00080000-5699-08f3-f321-25df2abc6288	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5699-08f1-9455-770a39dbf8ef
00270000-5699-08f4-edfe-d7066b326a0d	000e0000-5699-08f3-a043-e7e16aee62a0	00080000-5699-08f3-f321-25df2abc6288	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5699-08f1-9455-770a39dbf8ef
\.


--
-- TOC entry 3154 (class 0 OID 37017653)
-- Dependencies: 188
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 37017908)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-5699-08f4-7326-d5b3b752047c	00180000-5699-08f4-d4ba-1f97f4235c75	000c0000-5699-08f4-17ea-caa4c605c080	00090000-5699-08f3-df1a-bfc47513f3db	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-08f4-5451-2c63b7ba8893	00180000-5699-08f4-d4ba-1f97f4235c75	000c0000-5699-08f4-4177-e472d1dd85cf	00090000-5699-08f3-546a-b81a0ab36a71	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-08f4-a1cb-15f494b83345	00180000-5699-08f4-d4ba-1f97f4235c75	000c0000-5699-08f4-8ab7-667da938c232	00090000-5699-08f3-d1a9-d43c9d6dfe31	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-08f4-d1ee-d5b4e00c955d	00180000-5699-08f4-d4ba-1f97f4235c75	000c0000-5699-08f4-adc5-b287925e5de4	00090000-5699-08f3-40e1-e3e23df9e83f	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-08f4-f59c-83023edf99bb	00180000-5699-08f4-d4ba-1f97f4235c75	000c0000-5699-08f4-7a80-9e071a364224	00090000-5699-08f3-9511-947f2d3119fe	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-08f4-f516-7e545ec8a002	00180000-5699-08f4-75d7-b0a47b2eb4a9	\N	00090000-5699-08f3-9511-947f2d3119fe	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-5699-08f4-642d-28f36d86a921	00180000-5699-08f4-75d7-b0a47b2eb4a9	\N	00090000-5699-08f3-546a-b81a0ab36a71	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3179 (class 0 OID 37017925)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5699-08f0-a205-52082bb7e7e6	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5699-08f0-fb87-27e607d630a6	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5699-08f0-dabe-7ffa5b78a04a	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5699-08f0-9ac5-4886dfe55806	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5699-08f0-202d-fdacbec9a833	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5699-08f0-ef70-176925985dd7	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3201 (class 0 OID 37018130)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5699-08f0-7dee-37fca7ef7b1b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5699-08f0-6d69-670d4622950e	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5699-08f0-9af1-12cde16a38c4	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5699-08f0-9412-ffc657e36272	04	Režija	Režija	Režija	umetnik	30
000f0000-5699-08f0-9def-a42bb408186b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5699-08f0-d7b9-91ba23fec6a3	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5699-08f0-639b-119eb891b8e1	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5699-08f0-20de-76300b7cac04	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5699-08f0-c2ce-e230b727a704	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5699-08f0-0164-772e0788a5f3	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5699-08f0-6227-af1899ffb620	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5699-08f0-1cba-1ae1edc7b721	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5699-08f0-f4ef-a8776c75359f	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5699-08f0-7c2d-ae44932cec1f	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5699-08f0-2f47-802b79ca1eff	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5699-08f0-fbb1-fd40211b41d0	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5699-08f0-ad3e-eebca2bdc358	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5699-08f0-9e70-f0e3baebdec0	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5699-08f0-e0ba-3cd4afac4098	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3151 (class 0 OID 37017604)
-- Dependencies: 185
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5699-08f3-ee5b-84cbae5a63fa	0001	šola	osnovna ali srednja šola
00400000-5699-08f3-cd47-7a7a8f9403a5	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5699-08f3-c6ef-67a37a51b55b	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3214 (class 0 OID 37018434)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5699-08f0-ed4e-6a1089e59514	01	Velika predstava	f	1.00	1.00
002b0000-5699-08f0-0402-88069de48c53	02	Mala predstava	f	0.50	0.50
002b0000-5699-08f0-1f55-aeb91df5dc3a	03	Mala koprodukcija	t	0.40	1.00
002b0000-5699-08f0-9583-2317d0e5ea4a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5699-08f0-aea7-852f59344178	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3174 (class 0 OID 37017879)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5699-08f0-4fea-0d686c3c17b3	0001	prva vaja	prva vaja
00420000-5699-08f0-c788-41653406d7f0	0002	tehnična vaja	tehnična vaja
00420000-5699-08f0-7f2f-758001478f2c	0003	lučna vaja	lučna vaja
00420000-5699-08f0-e3d4-354dcee714b0	0004	kostumska vaja	kostumska vaja
00420000-5699-08f0-1108-f6ae8686da24	0005	foto vaja	foto vaja
00420000-5699-08f0-6529-ff2d1f713dba	0006	1. glavna vaja	1. glavna vaja
00420000-5699-08f0-5dea-eeb5c5f32037	0007	2. glavna vaja	2. glavna vaja
00420000-5699-08f0-6c34-eee7b30a62bd	0008	1. generalka	1. generalka
00420000-5699-08f0-712a-a7451f00b04c	0009	2. generalka	2. generalka
00420000-5699-08f0-7881-82a58ba79030	0010	odprta generalka	odprta generalka
00420000-5699-08f0-7149-5ee22b0c0501	0011	obnovitvena vaja	obnovitvena vaja
00420000-5699-08f0-e79a-09c263b228cc	0012	italijanka	krajša "obnovitvena" vaja
00420000-5699-08f0-e432-58bdf7036a3b	0013	pevska vaja	pevska vaja
00420000-5699-08f0-bf4f-20eb34da0edd	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5699-08f0-19bd-da426f8b0878	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5699-08f0-eea3-e290af185090	0016	orientacijska vaja	orientacijska vaja
00420000-5699-08f0-02ed-f512066fcf22	0017	situacijska vaja	situacijska vaja
00420000-5699-08f0-5ff0-22a14dbc5f79	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3160 (class 0 OID 37017726)
-- Dependencies: 194
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 37017540)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5699-08f1-6681-27aa82f0f297	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROSzb4ycSkkxUhgUf6XhUOK0pCx8Y5f7.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5699-08f3-9931-406cc14f0ab8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5699-08f3-73eb-41d13e988c37	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5699-08f3-4a95-d3e8c8becd84	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5699-08f3-2f3d-0c8432cea69c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5699-08f3-1ee4-3b82ad3ec450	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5699-08f3-74e3-da61208095ae	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5699-08f3-9c0c-9f30d17aaed8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5699-08f3-9041-f2e9ea9b3419	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5699-08f3-200a-c45a30ef38fd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5699-08f3-8c1e-38cacbd8125b	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5699-08f3-2a3c-c57e5e1ec2e6	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5699-08f3-9605-34329007e211	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5699-08f3-014b-a73cf242677e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5699-08f3-9833-ca2fd18155ce	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5699-08f3-495a-1f218be58dbd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5699-08f3-b5de-a8239b30834f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5699-08f3-7f52-fc4657f1ffa6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5699-08f3-35c1-2c377c645440	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5699-08f3-37d5-1dfd42077c62	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5699-08f3-33d0-ef946100d7f3	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5699-08f3-78b7-12ae0353b6b2	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5699-08f3-8cbb-5576043e5083	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5699-08f3-e0f5-b2439ecad740	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5699-08f3-dfd9-7ef41a6160e3	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5699-08f3-0316-e16cf02deed3	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5699-08f3-925d-36b209145179	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5699-08f1-2d2b-cec5e5b02d23	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3205 (class 0 OID 37018180)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5699-08f3-2c89-4f9cc0db243f	00160000-5699-08f3-cdea-f6ca1cae98f6	\N	00140000-5699-08f0-ae54-a6136c3bd329	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5699-08f3-3432-a6e5b15f1947
000e0000-5699-08f3-a043-e7e16aee62a0	00160000-5699-08f3-48f1-61f38b0d5bff	\N	00140000-5699-08f0-0dec-50728f791296	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5699-08f3-f8a3-816510100190
000e0000-5699-08f3-1984-b882d8e04411	\N	\N	00140000-5699-08f0-0dec-50728f791296	00190000-5699-08f3-df5c-61119c4f2e6e	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5699-08f3-3432-a6e5b15f1947
000e0000-5699-08f3-ffd4-f5355dfe035a	\N	\N	00140000-5699-08f0-0dec-50728f791296	00190000-5699-08f3-df5c-61119c4f2e6e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5699-08f3-3432-a6e5b15f1947
000e0000-5699-08f3-5dca-3e4a579c7fd9	\N	\N	00140000-5699-08f0-0dec-50728f791296	00190000-5699-08f3-df5c-61119c4f2e6e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-19a8-1a258b4a1e76	\N	\N	00140000-5699-08f0-0dec-50728f791296	00190000-5699-08f3-df5c-61119c4f2e6e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-a825-561e529e4e5f	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-1ae7-d4dba8c46527	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-d432-36f6da40dad2	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-0959-f6ab9b0f01a2	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-26fb-81bcd6141ef2	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-f179-8cd6d7f1da70	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-ae01-ab1c61a3d615	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-8c5a-ac2c13643785	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
000e0000-5699-08f3-2c84-4bedc52de646	\N	\N	00140000-5699-08f0-0344-b2c72ead0a48	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-08f3-76c6-e39062562c8c
\.


--
-- TOC entry 3176 (class 0 OID 37017899)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 37017822)
-- Dependencies: 202
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5699-08f3-2226-4aa4c2b10ef3	\N	000e0000-5699-08f3-a043-e7e16aee62a0	1
00200000-5699-08f3-d961-8b5e4caeaf20	\N	000e0000-5699-08f3-a043-e7e16aee62a0	2
00200000-5699-08f3-de2e-886ea4dcafed	\N	000e0000-5699-08f3-a043-e7e16aee62a0	3
00200000-5699-08f4-95b5-78ea1a191024	\N	000e0000-5699-08f3-a043-e7e16aee62a0	4
00200000-5699-08f4-69ed-4744fd56541f	\N	000e0000-5699-08f3-a043-e7e16aee62a0	5
\.


--
-- TOC entry 3188 (class 0 OID 37017993)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 37018103)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5699-08f1-a77b-764d5a9949e5	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5699-08f1-7b27-0e0dcc221149	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5699-08f1-39a2-b810d8e496b5	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5699-08f1-2d8c-e336cd4d52ae	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5699-08f1-6fe5-c72ea13d1876	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5699-08f1-bdf6-bb073c864df4	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5699-08f1-1379-f86749e84492	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5699-08f1-69fa-16b3e8546ef2	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5699-08f1-9455-770a39dbf8ef	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5699-08f1-bbc9-250d73356b4c	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5699-08f1-44b4-0d059f5da9af	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5699-08f1-9d99-c2e4e99363ed	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5699-08f1-94d5-c9246c1a38f6	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5699-08f1-ba77-43840e3c13f1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5699-08f1-cf03-a87fbd14b831	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5699-08f1-36f6-8be2c4341a01	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5699-08f1-9122-cd05f43ac43e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5699-08f1-a9fa-07d6a20b6cc5	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5699-08f1-a50c-9cc4d12c5c12	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5699-08f1-fc06-a563cae3c98e	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5699-08f1-3f5c-eeba76769c76	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5699-08f1-e06c-42cbdf992d10	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5699-08f1-6e4c-dec82b71ffb3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5699-08f1-0647-717f7159731f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5699-08f1-33a2-5bfe0780dc6d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5699-08f1-72f6-fa4eddfd93b8	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5699-08f1-6230-4cd3793b1f38	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5699-08f1-564b-7e9b06adfbe0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3217 (class 0 OID 37018484)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 37018453)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 37018496)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 37018065)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5699-08f3-66cf-a2c19b1ad5ea	00090000-5699-08f3-546a-b81a0ab36a71	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-08f3-8f8f-d07934583d18	00090000-5699-08f3-d1a9-d43c9d6dfe31	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-08f3-18d5-426fbc29736d	00090000-5699-08f3-3ded-6055312a987f	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-08f3-b198-0b8348b4c76d	00090000-5699-08f3-19df-434e8fbe5ca8	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-08f3-ceab-35740d465c23	00090000-5699-08f3-a829-2a8bc3d3ed91	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-08f3-1c4e-ca8438937a30	00090000-5699-08f3-a6f2-8bc2eeca3499	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3171 (class 0 OID 37017863)
-- Dependencies: 205
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 37018170)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5699-08f0-ae54-a6136c3bd329	01	Drama	drama (SURS 01)
00140000-5699-08f0-6681-39ad1187e77f	02	Opera	opera (SURS 02)
00140000-5699-08f0-0075-26ab13b0e00b	03	Balet	balet (SURS 03)
00140000-5699-08f0-2255-05a3c5541781	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5699-08f0-0344-b2c72ead0a48	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5699-08f0-0dec-50728f791296	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5699-08f0-eb35-12e344826ef1	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3194 (class 0 OID 37018055)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2618 (class 2606 OID 37017603)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 37018228)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 37018219)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 37017594)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 37018086)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 37018128)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 37018537)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 37017922)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 37017851)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 37017873)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 37017878)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 37018451)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 37017752)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 37018297)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 37018051)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 37017820)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 37017790)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 37017766)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 37017958)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 37018514)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 37018521)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2910 (class 2606 OID 37018545)
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
-- TOC entry 2768 (class 2606 OID 37017985)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 37017724)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 37017622)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 37017686)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 37017649)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 37017583)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2607 (class 2606 OID 37017568)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 37017991)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 37018027)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 37018165)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 37017677)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 37017712)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 37018402)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 37017964)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 37017702)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 37017836)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 37017808)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2685 (class 2606 OID 37017800)
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
-- TOC entry 2766 (class 2606 OID 37017976)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 37018411)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 37018419)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 37018389)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 37018432)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 37018009)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 37017949)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 37017940)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 37018152)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 37018079)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 37017778)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 37017539)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 37018018)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 37017557)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2609 (class 2606 OID 37017577)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 37018036)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 37017971)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 37017897)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 37017527)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 37017515)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 37017509)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 37018099)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 37017658)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 37017914)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 37017932)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 37018139)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 37017611)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 37018444)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 37017886)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 37017737)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 37017552)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 37018198)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 37017905)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 37017826)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 37017999)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 37018111)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 37018494)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 37018478)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 37018502)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 37018069)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 37018178)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 37018063)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 1259 OID 37017861)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2702 (class 1259 OID 37017862)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2703 (class 1259 OID 37017860)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2704 (class 1259 OID 37017859)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2705 (class 1259 OID 37017858)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2811 (class 1259 OID 37018100)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2812 (class 1259 OID 37018101)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2813 (class 1259 OID 37018102)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2896 (class 1259 OID 37018516)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2897 (class 1259 OID 37018515)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2636 (class 1259 OID 37017679)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2637 (class 1259 OID 37017680)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2769 (class 1259 OID 37017992)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2883 (class 1259 OID 37018482)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2884 (class 1259 OID 37018481)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2885 (class 1259 OID 37018483)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2886 (class 1259 OID 37018480)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2887 (class 1259 OID 37018479)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2763 (class 1259 OID 37017978)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2764 (class 1259 OID 37017977)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2693 (class 1259 OID 37017827)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2694 (class 1259 OID 37017828)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 37018052)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 37018054)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2795 (class 1259 OID 37018053)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2668 (class 1259 OID 37017768)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 37017767)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2874 (class 1259 OID 37018433)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2827 (class 1259 OID 37018167)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2828 (class 1259 OID 37018168)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 37018169)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2893 (class 1259 OID 37018503)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2836 (class 1259 OID 37018203)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2837 (class 1259 OID 37018200)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2838 (class 1259 OID 37018204)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2839 (class 1259 OID 37018202)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2840 (class 1259 OID 37018201)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2658 (class 1259 OID 37017739)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 37017738)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2627 (class 1259 OID 37017652)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2781 (class 1259 OID 37018019)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2611 (class 1259 OID 37017584)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 37017585)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2786 (class 1259 OID 37018039)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2787 (class 1259 OID 37018038)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2788 (class 1259 OID 37018037)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2641 (class 1259 OID 37017689)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2642 (class 1259 OID 37017688)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2643 (class 1259 OID 37017690)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2681 (class 1259 OID 37017803)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2682 (class 1259 OID 37017801)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2683 (class 1259 OID 37017802)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2591 (class 1259 OID 37017517)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2743 (class 1259 OID 37017944)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2744 (class 1259 OID 37017942)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2745 (class 1259 OID 37017941)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2746 (class 1259 OID 37017943)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2602 (class 1259 OID 37017558)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 37017559)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2772 (class 1259 OID 37018000)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2906 (class 1259 OID 37018538)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2809 (class 1259 OID 37018088)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2810 (class 1259 OID 37018087)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2907 (class 1259 OID 37018546)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2908 (class 1259 OID 37018547)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2758 (class 1259 OID 37017965)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2803 (class 1259 OID 37018080)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2804 (class 1259 OID 37018081)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2856 (class 1259 OID 37018302)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2857 (class 1259 OID 37018301)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2858 (class 1259 OID 37018298)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2859 (class 1259 OID 37018299)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2860 (class 1259 OID 37018300)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2647 (class 1259 OID 37017704)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 37017703)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2649 (class 1259 OID 37017705)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2775 (class 1259 OID 37018013)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2776 (class 1259 OID 37018012)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 37018412)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2867 (class 1259 OID 37018413)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2849 (class 1259 OID 37018232)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2850 (class 1259 OID 37018233)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2851 (class 1259 OID 37018230)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2852 (class 1259 OID 37018231)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2737 (class 1259 OID 37017923)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2738 (class 1259 OID 37017924)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2799 (class 1259 OID 37018070)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2800 (class 1259 OID 37018071)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2726 (class 1259 OID 37017906)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 37017953)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2750 (class 1259 OID 37017952)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 37017950)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2752 (class 1259 OID 37017951)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2846 (class 1259 OID 37018220)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 37017779)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2675 (class 1259 OID 37017793)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2676 (class 1259 OID 37017792)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2677 (class 1259 OID 37017791)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2678 (class 1259 OID 37017794)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2692 (class 1259 OID 37017821)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2686 (class 1259 OID 37017809)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2687 (class 1259 OID 37017810)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2863 (class 1259 OID 37018403)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2882 (class 1259 OID 37018452)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2900 (class 1259 OID 37018522)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2901 (class 1259 OID 37018523)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2623 (class 1259 OID 37017624)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2624 (class 1259 OID 37017623)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2632 (class 1259 OID 37017659)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 37017660)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 37017917)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 37017916)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2732 (class 1259 OID 37017915)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2706 (class 1259 OID 37017853)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2707 (class 1259 OID 37017854)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2708 (class 1259 OID 37017857)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2709 (class 1259 OID 37017852)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2710 (class 1259 OID 37017856)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2711 (class 1259 OID 37017855)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2640 (class 1259 OID 37017678)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 37017612)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 37017613)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2664 (class 1259 OID 37017753)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 37017755)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2666 (class 1259 OID 37017754)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2667 (class 1259 OID 37017756)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2757 (class 1259 OID 37017959)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 37018166)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2841 (class 1259 OID 37018199)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 37018140)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 37018141)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 37017650)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 37017651)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2741 (class 1259 OID 37017933)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2742 (class 1259 OID 37017934)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2796 (class 1259 OID 37018064)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 37017528)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 37017725)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 37017687)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 37017516)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2879 (class 1259 OID 37018445)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2779 (class 1259 OID 37018011)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2780 (class 1259 OID 37018010)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 37017887)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 37017888)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2853 (class 1259 OID 37018229)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2727 (class 1259 OID 37017907)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2654 (class 1259 OID 37017713)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2833 (class 1259 OID 37018179)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2890 (class 1259 OID 37018495)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2872 (class 1259 OID 37018420)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2873 (class 1259 OID 37018421)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2820 (class 1259 OID 37018129)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2725 (class 1259 OID 37017898)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 37017578)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2950 (class 2606 OID 37018718)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2949 (class 2606 OID 37018723)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2944 (class 2606 OID 37018748)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2946 (class 2606 OID 37018738)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2951 (class 2606 OID 37018713)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 37018733)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 37018743)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2948 (class 2606 OID 37018728)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2991 (class 2606 OID 37018938)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2990 (class 2606 OID 37018943)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2989 (class 2606 OID 37018948)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3022 (class 2606 OID 37019108)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3023 (class 2606 OID 37019103)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2923 (class 2606 OID 37018603)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2922 (class 2606 OID 37018608)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 37018853)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3017 (class 2606 OID 37019088)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3018 (class 2606 OID 37019083)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 37019093)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3019 (class 2606 OID 37019078)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3020 (class 2606 OID 37019073)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2970 (class 2606 OID 37018848)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2971 (class 2606 OID 37018843)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2943 (class 2606 OID 37018703)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 37018708)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2982 (class 2606 OID 37018893)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 37018903)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2981 (class 2606 OID 37018898)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2932 (class 2606 OID 37018658)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2933 (class 2606 OID 37018653)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 37018833)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3014 (class 2606 OID 37019063)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 37018953)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2993 (class 2606 OID 37018958)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 37018963)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3021 (class 2606 OID 37019098)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2996 (class 2606 OID 37018983)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2999 (class 2606 OID 37018968)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2995 (class 2606 OID 37018988)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 37018978)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2998 (class 2606 OID 37018973)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2930 (class 2606 OID 37018648)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 37018643)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 37018588)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2919 (class 2606 OID 37018583)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 37018873)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2915 (class 2606 OID 37018563)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2914 (class 2606 OID 37018568)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2977 (class 2606 OID 37018888)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 37018883)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2979 (class 2606 OID 37018878)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2925 (class 2606 OID 37018618)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2926 (class 2606 OID 37018613)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 37018623)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2936 (class 2606 OID 37018683)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 37018673)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 37018678)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2911 (class 2606 OID 37018548)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2960 (class 2606 OID 37018808)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2962 (class 2606 OID 37018798)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2963 (class 2606 OID 37018793)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2961 (class 2606 OID 37018803)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 37018553)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2912 (class 2606 OID 37018558)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2973 (class 2606 OID 37018858)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3026 (class 2606 OID 37019123)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 37018933)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 37018928)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3028 (class 2606 OID 37019128)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3027 (class 2606 OID 37019133)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2969 (class 2606 OID 37018838)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2986 (class 2606 OID 37018918)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2985 (class 2606 OID 37018923)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3005 (class 2606 OID 37019038)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 37019033)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3009 (class 2606 OID 37019018)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3008 (class 2606 OID 37019023)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3007 (class 2606 OID 37019028)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2928 (class 2606 OID 37018633)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 37018628)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 37018638)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 37018868)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2975 (class 2606 OID 37018863)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 37019048)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3011 (class 2606 OID 37019053)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3002 (class 2606 OID 37019008)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3001 (class 2606 OID 37019013)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3004 (class 2606 OID 37018998)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3003 (class 2606 OID 37019003)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2959 (class 2606 OID 37018783)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2958 (class 2606 OID 37018788)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2984 (class 2606 OID 37018908)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 37018913)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2954 (class 2606 OID 37018758)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 37018763)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2964 (class 2606 OID 37018828)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2965 (class 2606 OID 37018823)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2967 (class 2606 OID 37018813)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2966 (class 2606 OID 37018818)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3000 (class 2606 OID 37018993)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 37018663)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2935 (class 2606 OID 37018668)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 37018698)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 37018688)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 37018693)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 37019043)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3013 (class 2606 OID 37019058)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3015 (class 2606 OID 37019068)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3025 (class 2606 OID 37019113)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3024 (class 2606 OID 37019118)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2916 (class 2606 OID 37018578)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2917 (class 2606 OID 37018573)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2921 (class 2606 OID 37018593)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 37018598)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 37018753)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 37018778)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 37018773)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2957 (class 2606 OID 37018768)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-15 15:57:59 CET

--
-- PostgreSQL database dump complete
--

