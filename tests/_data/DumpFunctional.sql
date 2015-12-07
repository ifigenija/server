--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-07 16:54:35 CET

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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 31122861)
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
-- TOC entry 237 (class 1259 OID 31123475)
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
-- TOC entry 236 (class 1259 OID 31123458)
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
-- TOC entry 182 (class 1259 OID 31122854)
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
-- TOC entry 181 (class 1259 OID 31122852)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 31123335)
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
-- TOC entry 230 (class 1259 OID 31123365)
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
-- TOC entry 251 (class 1259 OID 31123768)
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
-- TOC entry 203 (class 1259 OID 31123109)
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
-- TOC entry 205 (class 1259 OID 31123141)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 31123146)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 31123690)
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
-- TOC entry 194 (class 1259 OID 31123006)
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
-- TOC entry 238 (class 1259 OID 31123488)
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
-- TOC entry 223 (class 1259 OID 31123289)
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
-- TOC entry 200 (class 1259 OID 31123080)
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
-- TOC entry 197 (class 1259 OID 31123046)
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
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 31123023)
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
-- TOC entry 212 (class 1259 OID 31123203)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 31123748)
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
-- TOC entry 250 (class 1259 OID 31123761)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 31123783)
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
-- TOC entry 216 (class 1259 OID 31123228)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 31122980)
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
-- TOC entry 185 (class 1259 OID 31122880)
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
-- TOC entry 189 (class 1259 OID 31122947)
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
-- TOC entry 186 (class 1259 OID 31122891)
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
-- TOC entry 178 (class 1259 OID 31122826)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 31122845)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 31123235)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 31123269)
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
-- TOC entry 233 (class 1259 OID 31123406)
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
-- TOC entry 188 (class 1259 OID 31122927)
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
-- TOC entry 191 (class 1259 OID 31122972)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 31123634)
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
-- TOC entry 213 (class 1259 OID 31123209)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 31122957)
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
-- TOC entry 202 (class 1259 OID 31123101)
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
-- TOC entry 198 (class 1259 OID 31123061)
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
-- TOC entry 199 (class 1259 OID 31123073)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 31123221)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 31123648)
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
-- TOC entry 242 (class 1259 OID 31123658)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 31123557)
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
-- TOC entry 243 (class 1259 OID 31123666)
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
-- TOC entry 219 (class 1259 OID 31123250)
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
-- TOC entry 211 (class 1259 OID 31123194)
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
-- TOC entry 210 (class 1259 OID 31123184)
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
-- TOC entry 232 (class 1259 OID 31123395)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 31123325)
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
-- TOC entry 196 (class 1259 OID 31123035)
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
-- TOC entry 175 (class 1259 OID 31122797)
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
-- TOC entry 174 (class 1259 OID 31122795)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 31123263)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 31122835)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 31122819)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 31123277)
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
-- TOC entry 214 (class 1259 OID 31123215)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 31123161)
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
-- TOC entry 173 (class 1259 OID 31122784)
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
-- TOC entry 172 (class 1259 OID 31122776)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 31122771)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 31123342)
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
-- TOC entry 187 (class 1259 OID 31122919)
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
-- TOC entry 209 (class 1259 OID 31123171)
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
-- TOC entry 231 (class 1259 OID 31123383)
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
-- TOC entry 184 (class 1259 OID 31122870)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 31123678)
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
-- TOC entry 207 (class 1259 OID 31123151)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 31122992)
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
-- TOC entry 176 (class 1259 OID 31122806)
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
-- TOC entry 235 (class 1259 OID 31123433)
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
-- TOC entry 201 (class 1259 OID 31123091)
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
-- TOC entry 218 (class 1259 OID 31123242)
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
-- TOC entry 229 (class 1259 OID 31123356)
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
-- TOC entry 247 (class 1259 OID 31123728)
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
-- TOC entry 246 (class 1259 OID 31123697)
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
-- TOC entry 248 (class 1259 OID 31123740)
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
-- TOC entry 225 (class 1259 OID 31123314)
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
-- TOC entry 204 (class 1259 OID 31123135)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 31123423)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 31123304)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 31122857)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 31122800)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 31122861)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5665-abb7-dae1-29d90f3f8b4f	10	30	Otroci	Abonma za otroke	200
000a0000-5665-abb7-c3a1-a916de6605d9	20	60	Mladina	Abonma za mladino	400
000a0000-5665-abb7-7938-93facfe12037	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 31123475)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5665-abb8-17a4-a076f3415a67	000d0000-5665-abb7-300b-95ea12e1c086	\N	00090000-5665-abb7-f6f9-689cd3d891df	000b0000-5665-abb7-a713-a6bbfea43c96	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5665-abb8-8ea8-09fb1cb0efbc	000d0000-5665-abb7-d30c-2cac99c095c7	00100000-5665-abb7-6b60-1bc8d4a86aa8	00090000-5665-abb7-e284-2759eff8abe6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5665-abb8-0ba7-e11ca88a26c5	000d0000-5665-abb7-21c7-4224c4b0969d	00100000-5665-abb7-c6ac-e296e250426c	00090000-5665-abb7-9a2e-7dac093a6dab	\N	0003	t	\N	2015-12-07	\N	2	t	\N	f	f
000c0000-5665-abb8-8112-f80c4a9bf9b0	000d0000-5665-abb7-c4db-ee6633da0fad	\N	00090000-5665-abb7-cdfd-6ca562d7e266	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5665-abb8-f20d-cd5bb774dd23	000d0000-5665-abb7-b094-f35c148d7c81	\N	00090000-5665-abb7-4464-b4c3bca5a6fd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5665-abb8-e948-454a5de3a14c	000d0000-5665-abb8-3c8a-c6352dbfa506	\N	00090000-5665-abb7-af83-fea1cd53951c	000b0000-5665-abb7-49b9-93c3abea267e	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5665-abb8-a64c-9c0b0b06f611	000d0000-5665-abb7-cd7a-a8d129373255	00100000-5665-abb7-9b0a-9eb2c4518c53	00090000-5665-abb7-7431-1c389bfb9bac	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5665-abb8-ef82-0236aaa1cd43	000d0000-5665-abb8-d432-50dad51185bb	\N	00090000-5665-abb7-0c8b-1a65bd242b66	000b0000-5665-abb7-4a79-98bfb5a322f9	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5665-abb8-0336-9a5c6dc39942	000d0000-5665-abb7-cd7a-a8d129373255	00100000-5665-abb7-f027-adf3334a15c8	00090000-5665-abb7-43e0-94a06c2df8ac	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5665-abb8-191b-92e1fa1be979	000d0000-5665-abb7-cd7a-a8d129373255	00100000-5665-abb7-25e2-7dd922d6d554	00090000-5665-abb7-b555-94ac32f304a0	\N	0010	t	\N	2015-12-07	\N	16	f	\N	f	t
000c0000-5665-abb8-375f-1dbed303408e	000d0000-5665-abb7-cd7a-a8d129373255	00100000-5665-abb7-a9e1-fe6594354740	00090000-5665-abb7-b7b2-38a947f0743a	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5665-abb8-3028-c3914347ba69	000d0000-5665-abb8-a08b-79bda281503d	00100000-5665-abb7-6b60-1bc8d4a86aa8	00090000-5665-abb7-e284-2759eff8abe6	000b0000-5665-abb7-9263-a7189714b53c	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 31123458)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 31122854)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3151 (class 0 OID 31123335)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5665-abb7-51cc-fc3863e16497	00160000-5665-abb7-ccc6-3db9de81ea59	00090000-5665-abb7-e083-e31632a3f8ff	aizv	10	t
003d0000-5665-abb7-73bc-dbca83b60b99	00160000-5665-abb7-ccc6-3db9de81ea59	00090000-5665-abb7-a84a-b8bc7cf0f3ca	apri	14	t
003d0000-5665-abb7-efd6-a27ecab7cee0	00160000-5665-abb7-fed5-31983256f16e	00090000-5665-abb7-03f6-576311a82dec	aizv	11	t
003d0000-5665-abb7-288a-5b7410a51e28	00160000-5665-abb7-1b63-4d47d3aa3454	00090000-5665-abb7-5945-65d9dbc093c5	aizv	12	t
003d0000-5665-abb7-5314-6b7d4f46612d	00160000-5665-abb7-ccc6-3db9de81ea59	00090000-5665-abb7-1336-c9160ddef4a4	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 31123365)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5665-abb7-ccc6-3db9de81ea59	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5665-abb7-fed5-31983256f16e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5665-abb7-1b63-4d47d3aa3454	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 31123768)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 31123109)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5665-abb8-84b1-cf672979b137	\N	\N	00200000-5665-abb8-f09c-3ae242aa076a	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5665-abb8-0552-cdfa9efffd72	\N	\N	00200000-5665-abb8-3ab5-c078ee9de50a	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5665-abb8-e673-529ea5a79df6	\N	\N	00200000-5665-abb8-f484-15f356f9a44f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5665-abb8-0e0a-a9decfed3cd6	\N	\N	00200000-5665-abb8-d743-d2723c16d9f5	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5665-abb8-a3d9-b8c008dcb5f0	\N	\N	00200000-5665-abb8-a848-6570e6b1b98f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 31123141)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 31123146)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 31123690)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 31123006)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5665-abb5-71fe-69c0a35e66a0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5665-abb5-d2a9-e9ccc7479f14	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5665-abb5-3b77-d797f9f9424c	AL	ALB	008	Albania 	Albanija	\N
00040000-5665-abb5-1754-d698327a177e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5665-abb5-eead-de384ee3e68a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5665-abb5-df85-a437a309d2ac	AD	AND	020	Andorra 	Andora	\N
00040000-5665-abb5-c222-a276f7397929	AO	AGO	024	Angola 	Angola	\N
00040000-5665-abb5-28a6-5c5a2d142aad	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5665-abb5-054c-6623a0fbf244	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5665-abb5-b92c-6e7c002fd072	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5665-abb5-c4a9-4f3fa97f3b40	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5665-abb5-0814-8f424f90a928	AM	ARM	051	Armenia 	Armenija	\N
00040000-5665-abb5-a7d1-2ef4cab157d0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5665-abb5-2fc7-109b2ea4229f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5665-abb5-2fd0-987cc6a38e83	AT	AUT	040	Austria 	Avstrija	\N
00040000-5665-abb5-d345-f7efc5f632a8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5665-abb5-cda0-9c057e4bb42c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5665-abb5-53c2-480e3bbb5f33	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5665-abb5-38c9-9ea7f3a756b1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5665-abb5-fa40-605261c94d21	BB	BRB	052	Barbados 	Barbados	\N
00040000-5665-abb5-a639-2b5f4628216d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5665-abb5-5015-0a8b4b30482a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5665-abb5-abee-e9655eddf946	BZ	BLZ	084	Belize 	Belize	\N
00040000-5665-abb5-c964-e78a9a079ae9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5665-abb5-b20e-025da3c8fa23	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5665-abb5-a4c8-afb3720d9564	BT	BTN	064	Bhutan 	Butan	\N
00040000-5665-abb5-a8a5-2a52cfc1f09c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5665-abb5-f2ff-869226a8ad3f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5665-abb5-461c-74443a5a2a13	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5665-abb5-fa0c-d0252d7b0ba9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5665-abb5-a755-9f5416142601	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5665-abb5-49d1-c0cd731257b3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5665-abb5-7fdb-e03d44680d18	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5665-abb5-3f62-e163579157fd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5665-abb5-9e09-2e16af7989ff	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5665-abb5-c76f-b81a40ef17cd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5665-abb5-826f-3bec5bdb74f4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5665-abb5-7acd-448508232e9a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5665-abb5-d197-8de387a16950	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5665-abb5-8b8d-0b8239a3d1e5	CA	CAN	124	Canada 	Kanada	\N
00040000-5665-abb5-a245-b6d399d9aa33	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5665-abb5-dce1-54f6e28325a4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5665-abb5-9325-75318339b18b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5665-abb5-192f-34e2193cb86f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5665-abb5-4ce8-9c3f5b29e503	CL	CHL	152	Chile 	Čile	\N
00040000-5665-abb5-978c-9e80a5a4e365	CN	CHN	156	China 	Kitajska	\N
00040000-5665-abb5-2bca-6a53dfe19d7e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5665-abb5-0307-25ad99068275	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5665-abb5-0d68-bb133b94e459	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5665-abb5-b255-f727c5360c2a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5665-abb5-41d0-d0edb9d1765e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5665-abb5-a692-127e620e89e5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5665-abb5-5de2-e23a6d1b0860	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5665-abb5-9ac6-c40a3e35bc38	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5665-abb5-dc9c-4e64d2a008e5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5665-abb5-5824-72c8e60c37a1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5665-abb5-39a6-c7ca9c6732d0	CU	CUB	192	Cuba 	Kuba	\N
00040000-5665-abb5-3a69-dee5307d6639	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5665-abb5-a0ca-948f5ef919e7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5665-abb5-4122-4e2fb28d7792	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5665-abb5-d8fb-a2e144f81736	DK	DNK	208	Denmark 	Danska	\N
00040000-5665-abb5-92b0-267b50a01bc7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5665-abb5-1d97-1cd368bbd7b0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5665-abb5-3987-1be216d6e87b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5665-abb5-4e9e-0a423d3ed02e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5665-abb5-c413-cc26a4c5ef3e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5665-abb5-088c-67cee8d9d4ae	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5665-abb5-a5a5-4ba0bef5ad69	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5665-abb5-652b-d4c5d59ad3a6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5665-abb5-451e-3abce07d1fac	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5665-abb5-61c7-b88159b874d7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5665-abb5-96d4-40e881a68412	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5665-abb5-488c-7dbb4547998e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5665-abb5-d803-98ae5b2e1db9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5665-abb5-8dda-e4fe3ebb13e3	FI	FIN	246	Finland 	Finska	\N
00040000-5665-abb5-becd-0b3b806baf0c	FR	FRA	250	France 	Francija	\N
00040000-5665-abb5-132c-79b4d3d65cd5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5665-abb5-5f3f-6386d44ce8d0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5665-abb5-f981-5f2c1568bce3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5665-abb5-fd53-357e0097f52f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5665-abb5-9181-0025ccdaa084	GA	GAB	266	Gabon 	Gabon	\N
00040000-5665-abb5-3d4a-39398a57d901	GM	GMB	270	Gambia 	Gambija	\N
00040000-5665-abb5-ffa6-59a0cc4748fe	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5665-abb5-8677-64fac346b3ff	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5665-abb5-9fba-78048fe087d2	GH	GHA	288	Ghana 	Gana	\N
00040000-5665-abb5-bc24-9673129cd72d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5665-abb5-222a-d19974577b75	GR	GRC	300	Greece 	Grčija	\N
00040000-5665-abb5-50d1-73dc7a503a6e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5665-abb5-4fc1-fd81e7722c0a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5665-abb5-496e-678e9e58f598	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5665-abb5-6cd4-9a01b802f8b4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5665-abb5-a467-d9e3dbef3452	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5665-abb5-3187-f99de473f4a8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5665-abb5-1c55-0adbbe3c55bf	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5665-abb5-8f85-f3773af6ed21	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5665-abb5-f78f-9d4a9be714e8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5665-abb5-6c09-9591bbeb6dad	HT	HTI	332	Haiti 	Haiti	\N
00040000-5665-abb5-007e-57306561ea58	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5665-abb5-7133-4da56fdaddfe	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5665-abb5-45a4-ffe6439a3e03	HN	HND	340	Honduras 	Honduras	\N
00040000-5665-abb5-2381-f1f6c0514cd6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5665-abb5-9a61-310f1857c2d0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5665-abb5-911a-899f72c7483b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5665-abb5-5ad4-bc4a8db733ff	IN	IND	356	India 	Indija	\N
00040000-5665-abb5-1a2d-4db5990328bb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5665-abb5-7c82-6e7bc4b3ad21	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5665-abb5-9cd5-5c4018a50ff5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5665-abb5-43b7-806c6e5e7cc4	IE	IRL	372	Ireland 	Irska	\N
00040000-5665-abb5-6943-eb49805de662	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5665-abb5-0d24-4c70d78a4b80	IL	ISR	376	Israel 	Izrael	\N
00040000-5665-abb5-86ba-db737942dcf0	IT	ITA	380	Italy 	Italija	\N
00040000-5665-abb5-9c23-c00a041e9a04	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5665-abb5-ec79-3c779437c0ac	JP	JPN	392	Japan 	Japonska	\N
00040000-5665-abb5-1896-db3febb0eb45	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5665-abb5-3a68-055f589db818	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5665-abb5-74c2-0183d347644a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5665-abb5-b9ee-ed76122f4ccc	KE	KEN	404	Kenya 	Kenija	\N
00040000-5665-abb5-4e5f-ab1a767ff73f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5665-abb5-3abe-a5674416d897	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5665-abb5-591a-f8bb116e6870	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5665-abb5-6463-50cf8a55520f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5665-abb5-8e70-9df7077b93bb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5665-abb5-a360-25a6e5be2fa5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5665-abb5-af07-a8dc370779ad	LV	LVA	428	Latvia 	Latvija	\N
00040000-5665-abb5-e985-a13b240b1d1a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5665-abb5-bfe0-d4c2897b5011	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5665-abb5-b289-c3aae253551f	LR	LBR	430	Liberia 	Liberija	\N
00040000-5665-abb5-d1b6-1a142c3858e1	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5665-abb5-1d18-2bd43d925ba4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5665-abb5-bdcb-dc7c18170591	LT	LTU	440	Lithuania 	Litva	\N
00040000-5665-abb5-fb79-34fb6e299338	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5665-abb5-4620-54ba5077b1da	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5665-abb5-ac22-d3caa111fa86	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5665-abb5-9657-002a98ee9878	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5665-abb5-fe0d-51b57e820add	MW	MWI	454	Malawi 	Malavi	\N
00040000-5665-abb5-e0d3-f2285c39996d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5665-abb5-142c-93efb276d1a2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5665-abb5-4f34-027555c64087	ML	MLI	466	Mali 	Mali	\N
00040000-5665-abb5-116c-e2a4696cdd17	MT	MLT	470	Malta 	Malta	\N
00040000-5665-abb5-b6b1-b9ed6f0da278	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5665-abb5-ead4-50e4adf1e1fa	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5665-abb5-3535-101107ec8f9a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5665-abb5-0275-0c3824d24b95	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5665-abb5-11d9-56e4e0b87389	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5665-abb5-a0d6-89d8e7ea14c3	MX	MEX	484	Mexico 	Mehika	\N
00040000-5665-abb5-5129-0a01cc8964a5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5665-abb5-a2ea-21f74a98448f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5665-abb5-be6c-1d4b27cc7500	MC	MCO	492	Monaco 	Monako	\N
00040000-5665-abb5-d0c0-ee7705103372	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5665-abb5-7c60-cc5d9a872fea	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5665-abb5-f932-2ce11100c1b0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5665-abb5-f7bb-0643c8620477	MA	MAR	504	Morocco 	Maroko	\N
00040000-5665-abb5-4eb4-8430f55fc0b2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5665-abb5-5209-ee4b3dc82446	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5665-abb5-0935-e20e6d8f1371	NA	NAM	516	Namibia 	Namibija	\N
00040000-5665-abb5-3a8e-0f74d02dc4e6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5665-abb5-3928-03c6a1c379da	NP	NPL	524	Nepal 	Nepal	\N
00040000-5665-abb5-dfcf-acd664a047a9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5665-abb5-5ff6-5ae91023a8f4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5665-abb5-d041-faec2cb7c1d4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5665-abb5-5084-6eebe3dd61dc	NE	NER	562	Niger 	Niger 	\N
00040000-5665-abb5-e171-5689bdccbb82	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5665-abb5-248f-0b1acd346d3e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5665-abb5-a9e0-19da29fade52	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5665-abb5-6590-e837b33e6578	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5665-abb5-78a5-f6524e285222	NO	NOR	578	Norway 	Norveška	\N
00040000-5665-abb5-4b52-02c8ab153667	OM	OMN	512	Oman 	Oman	\N
00040000-5665-abb5-0b1e-2c52c7f74d08	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5665-abb5-2a5b-31bd38f083df	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5665-abb5-e3eb-dab3cf444755	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5665-abb5-39bf-7ede65ac7080	PA	PAN	591	Panama 	Panama	\N
00040000-5665-abb5-689a-048e43cb22e5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5665-abb5-b15d-b0b2981d7741	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5665-abb5-c0ab-0c3f941fdcac	PE	PER	604	Peru 	Peru	\N
00040000-5665-abb5-2e4c-f3bfd7ad1725	PH	PHL	608	Philippines 	Filipini	\N
00040000-5665-abb5-d10f-81119e01a16f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5665-abb5-8a92-b47951abd5a7	PL	POL	616	Poland 	Poljska	\N
00040000-5665-abb5-14de-b165604575fe	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5665-abb5-3ac9-bf677df78e7b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5665-abb5-d082-78f85101e111	QA	QAT	634	Qatar 	Katar	\N
00040000-5665-abb5-6cee-f7b7c4c47058	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5665-abb5-3237-37ee75d3f427	RO	ROU	642	Romania 	Romunija	\N
00040000-5665-abb5-03d2-19852f02a31a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5665-abb5-9e1f-1a20288d6604	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5665-abb5-1876-e0c5b26c51c8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5665-abb5-c17d-c32e66b10972	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5665-abb5-5071-03eacfafa76a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5665-abb5-b0cb-7d2c1e30edd1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5665-abb5-71fc-67369115865f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5665-abb5-e30f-ece6df4eb5ad	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5665-abb5-b23c-a84074eb8970	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5665-abb5-1c98-5a31927fe9a8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5665-abb5-f132-c4f7952c910f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5665-abb5-613c-17bc2cd5c88d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5665-abb5-3506-9b5d8f892706	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5665-abb5-cbd9-4286ea5ebd3f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5665-abb5-434e-b7f81d84510f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5665-abb5-906e-091482c2f037	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5665-abb5-5182-cd98773429e9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5665-abb5-4e8a-698ea31331c9	SG	SGP	702	Singapore 	Singapur	\N
00040000-5665-abb5-a6d8-d0aada5c107d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5665-abb5-73ae-5a0447cb74be	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5665-abb5-899b-130de6f8478a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5665-abb5-b7c1-eaf0ad82edc4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5665-abb5-4e70-4a4c7af9a95d	SO	SOM	706	Somalia 	Somalija	\N
00040000-5665-abb5-ac94-f59c774ffbf5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5665-abb5-a5df-0d9226da1eb3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5665-abb5-4a9f-3fde45df7eb1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5665-abb5-5065-52e7100f4d52	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5665-abb5-dce7-34da2d11b8d7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5665-abb5-54fb-6ac9b7aa83ee	SD	SDN	729	Sudan 	Sudan	\N
00040000-5665-abb5-9b1e-ef32d645eb86	SR	SUR	740	Suriname 	Surinam	\N
00040000-5665-abb5-15a7-ac0baec4525a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5665-abb5-6230-c8f96030e512	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5665-abb5-fe04-afe4d962c1da	SE	SWE	752	Sweden 	Švedska	\N
00040000-5665-abb5-dce3-b4e2a5b9d890	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5665-abb5-515f-0413c5db5bfd	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5665-abb5-68b0-c8295f99f06b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5665-abb5-a0b1-3297afaf828d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5665-abb5-0352-f11cdf6b3d93	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5665-abb5-4931-29b1a2ae7a79	TH	THA	764	Thailand 	Tajska	\N
00040000-5665-abb5-4da5-763f5b298b76	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5665-abb5-5d25-20806ecf5215	TG	TGO	768	Togo 	Togo	\N
00040000-5665-abb5-490a-b77c77ad834f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5665-abb5-ebe7-cf67aaeba5df	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5665-abb5-40ca-483677d7b2c7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5665-abb5-abf2-4f3fee521f44	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5665-abb5-eba6-c8f842eb2446	TR	TUR	792	Turkey 	Turčija	\N
00040000-5665-abb5-c0fe-841d27ab110e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5665-abb5-2f05-4b083d1cd485	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5665-abb5-2cc1-b8ca7d59f1db	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5665-abb5-356a-b82ddedac68f	UG	UGA	800	Uganda 	Uganda	\N
00040000-5665-abb5-c41a-aaba35925775	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5665-abb5-22a3-df6d1e324b06	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5665-abb5-32cd-9dd5144bc793	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5665-abb5-297e-f69b40a23d86	US	USA	840	United States 	Združene države Amerike	\N
00040000-5665-abb5-403f-4b9d12533e05	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5665-abb5-3388-d3a24114be42	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5665-abb5-64fc-a7b60106100e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5665-abb5-0c57-b5ed94c6d973	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5665-abb5-8aeb-4070808d6f83	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5665-abb5-35ec-ebfbe71edb20	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5665-abb5-b243-746c6b962764	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5665-abb5-5859-d425b7e9f041	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5665-abb5-fb27-ca3ffe9851fa	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5665-abb5-a430-ff853514b378	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5665-abb5-154f-0bb401dc4711	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5665-abb5-9753-d38d6d9c103f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5665-abb5-7ff3-62be5602c153	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 31123488)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5665-abb8-1b67-2fdb06e0e726	000e0000-5665-abb7-a893-abb2433458a7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-abb5-1efc-6d984d2e51f7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5665-abb8-533f-e42efb9db11f	000e0000-5665-abb7-f766-894ffcdb377e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-abb5-d281-4bd19bb63130	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5665-abb8-287f-75cbca34e727	000e0000-5665-abb7-cbcb-0deba4738864	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-abb5-1efc-6d984d2e51f7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5665-abb8-b253-aa3219d62e84	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5665-abb8-885a-99fa5db2fd83	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 31123289)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5665-abb7-cd7a-a8d129373255	000e0000-5665-abb7-f766-894ffcdb377e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5665-abb5-5727-7c1afb49ad5e
000d0000-5665-abb7-300b-95ea12e1c086	000e0000-5665-abb7-f766-894ffcdb377e	000c0000-5665-abb8-17a4-a076f3415a67	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5665-abb5-5727-7c1afb49ad5e
000d0000-5665-abb7-d30c-2cac99c095c7	000e0000-5665-abb7-f766-894ffcdb377e	000c0000-5665-abb8-8ea8-09fb1cb0efbc	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5665-abb5-dfce-6bd964c5913f
000d0000-5665-abb7-21c7-4224c4b0969d	000e0000-5665-abb7-f766-894ffcdb377e	000c0000-5665-abb8-0ba7-e11ca88a26c5	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5665-abb5-1880-9cf2d905a76a
000d0000-5665-abb7-c4db-ee6633da0fad	000e0000-5665-abb7-f766-894ffcdb377e	000c0000-5665-abb8-8112-f80c4a9bf9b0	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5665-abb5-a97d-520da139fc3d
000d0000-5665-abb7-b094-f35c148d7c81	000e0000-5665-abb7-f766-894ffcdb377e	000c0000-5665-abb8-f20d-cd5bb774dd23	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5665-abb5-a97d-520da139fc3d
000d0000-5665-abb8-3c8a-c6352dbfa506	000e0000-5665-abb7-f766-894ffcdb377e	000c0000-5665-abb8-e948-454a5de3a14c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5665-abb5-5727-7c1afb49ad5e
000d0000-5665-abb8-d432-50dad51185bb	000e0000-5665-abb7-f766-894ffcdb377e	000c0000-5665-abb8-ef82-0236aaa1cd43	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5665-abb5-7ad2-8734dc42457b
000d0000-5665-abb8-a08b-79bda281503d	000e0000-5665-abb7-f766-894ffcdb377e	000c0000-5665-abb8-3028-c3914347ba69	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5665-abb5-1e32-698923e172c7
\.


--
-- TOC entry 3124 (class 0 OID 31123080)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 31123046)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 31123023)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5665-abb7-db64-4fd7abde3269	00080000-5665-abb7-5a4e-a9672f612b28	00090000-5665-abb7-b555-94ac32f304a0	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 31123203)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 31123748)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5665-abb7-e1a9-76e30a15c604	00010000-5665-abb5-ed41-870e0deb772b	\N	Prva mapa	Root mapa	2015-12-07 16:54:31	2015-12-07 16:54:31	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 31123761)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 31123783)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25231831)
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
-- TOC entry 3140 (class 0 OID 31123228)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 31122980)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5665-abb5-b552-32445260c595	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5665-abb5-91b1-bfe1be3b6cca	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5665-abb5-27ca-6fb83e191fce	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5665-abb5-3559-93f67b64b762	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5665-abb5-cb72-6ed6594e3b5e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5665-abb5-2b25-f32ddb1655e3	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5665-abb5-ef45-ec70199b5f05	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5665-abb5-c8c7-878961e9bf95	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5665-abb5-4c56-2128e170fda0	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5665-abb5-4e18-1ac259c7c7ae	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5665-abb5-bddf-16daeabaa00a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5665-abb5-9afb-f0cd121d7f93	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5665-abb5-fae7-e7e6a783ad1f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5665-abb5-142e-66645ad2c14b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5665-abb7-8b0e-668b7e60d875	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5665-abb7-9a37-e02cd0351aa9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5665-abb7-5718-9e2bebd384d1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5665-abb7-6dec-1d1a7558a88a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5665-abb7-9a0d-3bf0929eac93	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5665-abb9-0d20-e4f5a5c4c052	application.tenant.maticnopodjetje	string	s:36:"00080000-5665-abb9-2dd3-d495f0e5c7d5";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 31122880)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5665-abb7-0359-f74e4e86877e	00000000-5665-abb7-8b0e-668b7e60d875	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5665-abb7-79ca-30540a7d34c3	00000000-5665-abb7-8b0e-668b7e60d875	00010000-5665-abb5-ed41-870e0deb772b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5665-abb7-9b0b-c5a28dd41f80	00000000-5665-abb7-9a37-e02cd0351aa9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 31122947)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5665-abb7-d4dd-80a2b47b9e6f	\N	00100000-5665-abb7-6b60-1bc8d4a86aa8	00100000-5665-abb7-c6ac-e296e250426c	01	Gledališče Nimbis
00410000-5665-abb7-6bb8-11ca32880a9c	00410000-5665-abb7-d4dd-80a2b47b9e6f	00100000-5665-abb7-6b60-1bc8d4a86aa8	00100000-5665-abb7-c6ac-e296e250426c	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 31122891)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5665-abb7-f6f9-689cd3d891df	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5665-abb7-cdfd-6ca562d7e266	00010000-5665-abb7-9b48-3fc622d9ba5a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5665-abb7-9a2e-7dac093a6dab	00010000-5665-abb7-8b61-c4c493b8fea5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5665-abb7-43e0-94a06c2df8ac	00010000-5665-abb7-9438-81d2499fa621	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5665-abb7-bd38-4870fd96f14e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5665-abb7-af83-fea1cd53951c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5665-abb7-b7b2-38a947f0743a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5665-abb7-7431-1c389bfb9bac	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5665-abb7-b555-94ac32f304a0	00010000-5665-abb7-aa11-90b7d0a689ba	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5665-abb7-e284-2759eff8abe6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5665-abb7-487d-92de1e3aae87	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5665-abb7-4464-b4c3bca5a6fd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5665-abb7-0c8b-1a65bd242b66	00010000-5665-abb7-842f-15af04fd04da	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5665-abb7-e083-e31632a3f8ff	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-abb7-a84a-b8bc7cf0f3ca	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-abb7-03f6-576311a82dec	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-abb7-5945-65d9dbc093c5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5665-abb7-1336-c9160ddef4a4	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5665-abb7-6ab8-59112775d5fc	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-abb7-970b-f7adab61c5fb	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-abb7-b0a8-1f65e29e9dca	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 31122826)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5665-abb5-b634-efbdfac12fd4	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5665-abb5-4141-c11eb87690b8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5665-abb5-521f-5fd88c779021	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5665-abb5-40d1-1fbdcf768f61	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5665-abb5-40cc-7373675d98c3	Oseba-vse	Oseba - spreminjanje osebnih podatkov	t
00030000-5665-abb5-1d8b-095bd66db4ef	Oseba-readVse	Oseba - branje tudi osebnih podatkov	t
00030000-5665-abb5-34a5-a1fa40b68b15	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5665-abb5-718c-d769bea3b356	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5665-abb5-dffc-211c340b50c4	Abonma-read	Abonma - branje	t
00030000-5665-abb5-a30d-335bc24d77de	Abonma-write	Abonma - spreminjanje	t
00030000-5665-abb5-e149-f3835806175a	Alternacija-read	Alternacija - branje	t
00030000-5665-abb5-a48e-f91c8804bcd9	Alternacija-write	Alternacija - spreminjanje	t
00030000-5665-abb5-1777-35688f1b8266	Arhivalija-read	Arhivalija - branje	t
00030000-5665-abb5-d9bf-9130cc93d0ae	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5665-abb5-6005-171d3952bdb1	AuthStorage-read	AuthStorage - branje	t
00030000-5665-abb5-c4fd-0a0af639e1a0	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5665-abb5-a7c0-fabe902f35d7	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5665-abb5-c1dd-f207e5088a77	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5665-abb5-d2e2-a3fd99b614ed	Besedilo-read	Besedilo - branje	t
00030000-5665-abb5-c94e-37b967cf159c	Besedilo-write	Besedilo - spreminjanje	t
00030000-5665-abb5-6c3e-6ac5cbe269f6	Dogodek-read	Dogodek - branje	t
00030000-5665-abb5-6056-e353f2a974ba	Dogodek-write	Dogodek - spreminjanje	t
00030000-5665-abb5-902b-23c888bf4430	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5665-abb5-5a9d-4775ac75da83	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5665-abb5-eac6-ff56d83d7d55	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5665-abb5-6e05-68e3e9df1fd4	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5665-abb5-42f1-4c45ca7b49b0	DogodekTrait-read	DogodekTrait - branje	t
00030000-5665-abb5-202b-eb6e0afe87d8	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5665-abb5-b973-2f75ead1cb64	DrugiVir-read	DrugiVir - branje	t
00030000-5665-abb5-c4e1-795e808c4964	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5665-abb5-374e-7704c2e20121	Drzava-read	Drzava - branje	t
00030000-5665-abb5-9449-f3f78543ba5b	Drzava-write	Drzava - spreminjanje	t
00030000-5665-abb5-9fe1-3fd1b839fd0b	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5665-abb5-5eae-3fc60f67c5de	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5665-abb5-3ef1-726be3957090	Funkcija-read	Funkcija - branje	t
00030000-5665-abb5-6a24-ead1a945cae5	Funkcija-write	Funkcija - spreminjanje	t
00030000-5665-abb5-3557-430e7e45cce8	Gostovanje-read	Gostovanje - branje	t
00030000-5665-abb5-7d8f-a6e1f515b955	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5665-abb5-0457-3e1f9cf526b4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5665-abb5-b619-9695fd26ffa5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5665-abb5-64b4-fe1a6fa8e2ed	Kupec-read	Kupec - branje	t
00030000-5665-abb5-ac64-31dade27fc27	Kupec-write	Kupec - spreminjanje	t
00030000-5665-abb5-fc93-9398b7f33468	NacinPlacina-read	NacinPlacina - branje	t
00030000-5665-abb5-30ee-1de85e1cafa8	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5665-abb5-1831-349ea02da8e8	Option-read	Option - branje	t
00030000-5665-abb5-7281-346ecfd3aa81	Option-write	Option - spreminjanje	t
00030000-5665-abb5-a268-722f1d58f857	OptionValue-read	OptionValue - branje	t
00030000-5665-abb5-ed10-13309bb413ce	OptionValue-write	OptionValue - spreminjanje	t
00030000-5665-abb5-cc36-f3793ffb7656	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5665-abb5-602e-5218b6f397e6	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5665-abb5-42a1-4189a0e682fd	Oseba-read	Oseba - branje	t
00030000-5665-abb5-d2da-9a782feee5b6	Oseba-write	Oseba - spreminjanje	t
00030000-5665-abb5-334c-f04b47b1e0ac	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5665-abb5-cee0-e4f25211f583	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5665-abb5-7eaf-6a5632f0a494	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5665-abb5-f83a-3f6421c35b5c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5665-abb5-1b69-594675617055	Pogodba-read	Pogodba - branje	t
00030000-5665-abb5-f815-aa60484a31c5	Pogodba-write	Pogodba - spreminjanje	t
00030000-5665-abb5-6ad6-8954a261a55b	Popa-read	Popa - branje	t
00030000-5665-abb5-2b13-347241513376	Popa-write	Popa - spreminjanje	t
00030000-5665-abb5-2b68-6656f5bc530b	Posta-read	Posta - branje	t
00030000-5665-abb5-6560-463b5d4939e2	Posta-write	Posta - spreminjanje	t
00030000-5665-abb5-7618-7dca322266f8	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5665-abb5-8d98-4266ce89083e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5665-abb5-31bc-9526ffdabf47	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5665-abb5-3622-5cd6d2dc1a69	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5665-abb5-0260-c1ea42ff2630	PostniNaslov-read	PostniNaslov - branje	t
00030000-5665-abb5-d466-0330071ef0de	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5665-abb5-edec-7b7df64e0cea	Praznik-read	Praznik - branje	t
00030000-5665-abb5-53e3-c102a6f7472b	Praznik-write	Praznik - spreminjanje	t
00030000-5665-abb5-71e6-34436de48df0	Predstava-read	Predstava - branje	t
00030000-5665-abb5-9594-c098a074d4c1	Predstava-write	Predstava - spreminjanje	t
00030000-5665-abb5-218a-27f820bdcef3	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5665-abb5-7b20-5b5139cb7ab5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5665-abb5-e0be-e0623c51d4e5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5665-abb5-a5b8-e1bea4b3c1a0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5665-abb5-7395-85314b9def3d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5665-abb5-2d62-91c6e2948844	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5665-abb5-16f1-697177709663	ProgramDela-read	ProgramDela - branje	t
00030000-5665-abb5-b202-2388169e19a0	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5665-abb5-d854-ae9aba5a68b7	ProgramFestival-read	ProgramFestival - branje	t
00030000-5665-abb5-9af0-a847064418ac	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5665-abb5-65c1-d849127dd814	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5665-abb5-d977-5eacfd310210	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5665-abb5-5922-3540f5065e7c	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5665-abb5-64f0-5bfd2e6dea48	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5665-abb5-75d2-2cca64a6b86b	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5665-abb5-c2fe-e283c7106466	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5665-abb5-d399-3c809108fca7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5665-abb5-b831-60a737f73c1e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5665-abb5-5718-8504964dc521	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5665-abb5-44f4-e0a47114095d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5665-abb5-9b56-98b3c90ec2bb	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5665-abb5-c93c-bcd98a0f6ac5	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5665-abb5-227e-84519b10cb3a	ProgramRazno-read	ProgramRazno - branje	t
00030000-5665-abb5-4f33-d02cfe42efd1	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5665-abb5-1b7f-f628f9752ecc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5665-abb5-2845-c9f56a7ff2b2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5665-abb5-d92d-2d2c6a0c373e	Prostor-read	Prostor - branje	t
00030000-5665-abb5-5e6a-5ddd3abc0282	Prostor-write	Prostor - spreminjanje	t
00030000-5665-abb5-26eb-4760bc6c3e8d	Racun-read	Racun - branje	t
00030000-5665-abb5-36a8-1038995375f6	Racun-write	Racun - spreminjanje	t
00030000-5665-abb5-5a66-0736b72d727d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5665-abb5-58b1-4055c64dc3ed	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5665-abb5-6e89-d7320aa30b38	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5665-abb5-2c49-900866057bb9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5665-abb5-91b5-aa752df18e16	Rekvizit-read	Rekvizit - branje	t
00030000-5665-abb5-ec4f-d3255c9c9e95	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5665-abb5-e157-7c09633912c5	Revizija-read	Revizija - branje	t
00030000-5665-abb5-de17-c7b98e7560bf	Revizija-write	Revizija - spreminjanje	t
00030000-5665-abb5-acab-e4c11da0ae87	Rezervacija-read	Rezervacija - branje	t
00030000-5665-abb5-7337-dffe36945eaa	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5665-abb5-c4d7-4c6c21e2b521	SedezniRed-read	SedezniRed - branje	t
00030000-5665-abb5-b5d5-cfcd05805cb9	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5665-abb5-657c-92ebedbe7c06	Sedez-read	Sedez - branje	t
00030000-5665-abb5-98ef-b6d76f0a5894	Sedez-write	Sedez - spreminjanje	t
00030000-5665-abb5-bfa7-111aa64b218b	Sezona-read	Sezona - branje	t
00030000-5665-abb5-a845-2face1cc21db	Sezona-write	Sezona - spreminjanje	t
00030000-5665-abb5-a80d-5af9883209e4	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5665-abb5-faf9-4ffb9c84dbef	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5665-abb5-ef36-2ec32c93fbc6	Telefonska-read	Telefonska - branje	t
00030000-5665-abb5-d981-c0cd41f39b27	Telefonska-write	Telefonska - spreminjanje	t
00030000-5665-abb5-2d12-a67b93549d3c	TerminStoritve-read	TerminStoritve - branje	t
00030000-5665-abb5-ad71-8de50f41356e	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5665-abb5-d0d8-5e8e9642776e	TipFunkcije-read	TipFunkcije - branje	t
00030000-5665-abb5-77cc-3c12cb81df09	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5665-abb5-f53a-8da2a526954d	TipPopa-read	TipPopa - branje	t
00030000-5665-abb5-03fc-2165705373db	TipPopa-write	TipPopa - spreminjanje	t
00030000-5665-abb5-6108-ac1f1644c987	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5665-abb5-a027-0fe591491299	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5665-abb5-c38b-e56eca60fc2e	TipVaje-read	TipVaje - branje	t
00030000-5665-abb5-aaa2-c9d670ca0295	TipVaje-write	TipVaje - spreminjanje	t
00030000-5665-abb5-dd10-1695db0999b6	Trr-read	Trr - branje	t
00030000-5665-abb5-b53a-5093bd119144	Trr-write	Trr - spreminjanje	t
00030000-5665-abb5-abf8-fc2c16038f05	Uprizoritev-read	Uprizoritev - branje	t
00030000-5665-abb5-77b9-5c9a5eaee046	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5665-abb5-470d-74a58f2819e9	Vaja-read	Vaja - branje	t
00030000-5665-abb5-4bc0-107ec4204cc1	Vaja-write	Vaja - spreminjanje	t
00030000-5665-abb5-1c45-f3bc15249899	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5665-abb5-c003-7ff7437e323c	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5665-abb5-311d-8ca429b66af9	VrstaStroska-read	VrstaStroska - branje	t
00030000-5665-abb5-32c4-7091fc6be0b1	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5665-abb5-3674-fae2a9809421	Zaposlitev-read	Zaposlitev - branje	t
00030000-5665-abb5-2afb-6e6bbca9ae44	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5665-abb5-a967-063808a0dc22	Zasedenost-read	Zasedenost - branje	t
00030000-5665-abb5-60ae-faa4ae9a1c20	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5665-abb5-13a7-ab13ccaaac0c	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5665-abb5-9018-469cb314b966	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5665-abb5-b372-47d454966bba	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5665-abb5-e211-e22d03b55b08	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5665-abb5-18c4-bf4816b622f4	Job-read	Branje opravil - samo zase - branje	t
00030000-5665-abb5-ad53-d82ed5c0cee5	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5665-abb5-7399-443e0baed304	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5665-abb5-7ce4-514126a34de0	Report-read	Report - branje	t
00030000-5665-abb5-b7f9-c86b899ae952	Report-write	Report - spreminjanje	t
00030000-5665-abb5-2289-83e7a66f873a	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5665-abb5-095d-d8883d7aeaa6	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5665-abb5-1b2f-1cb63df249b7	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5665-abb5-6f6b-494ef0859d36	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5665-abb5-3888-4d012d50b700	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5665-abb5-fbd1-afe6aaa749b9	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5665-abb5-70c0-72f8d7b1afdc	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5665-abb5-b488-bb2843b909f7	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5665-abb5-9bc6-f19f9f0d6275	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5665-abb5-2827-b6b4117bccd6	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5665-abb5-9a84-69d3f75df895	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5665-abb5-d01b-de3f83600438	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5665-abb5-862d-d44681868bd5	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5665-abb5-af2f-3e945ebf1492	Datoteka-write	Datoteka - spreminjanje	t
00030000-5665-abb5-de62-6e69033d912c	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 31122845)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5665-abb5-bf3c-aaa0a124953a	00030000-5665-abb5-4141-c11eb87690b8
00020000-5665-abb5-bf3c-aaa0a124953a	00030000-5665-abb5-b634-efbdfac12fd4
00020000-5665-abb5-cf62-3b2005a7b746	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-c1dd-f207e5088a77
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-c94e-37b967cf159c
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-a7c0-fabe902f35d7
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-d2e2-a3fd99b614ed
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-c11e-812eda229497	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-6aa0-f3611b62ee23	00030000-5665-abb5-a7c0-fabe902f35d7
00020000-5665-abb5-6aa0-f3611b62ee23	00030000-5665-abb5-d2e2-a3fd99b614ed
00020000-5665-abb5-6aa0-f3611b62ee23	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-6aa0-f3611b62ee23	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-6aa0-f3611b62ee23	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-74fa-6e2ccc67bd80	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-74fa-6e2ccc67bd80	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb5-74fa-6e2ccc67bd80	00030000-5665-abb5-2afb-6e6bbca9ae44
00020000-5665-abb5-74fa-6e2ccc67bd80	00030000-5665-abb5-cc36-f3793ffb7656
00020000-5665-abb5-3f11-41df529619b9	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb5-3f11-41df529619b9	00030000-5665-abb5-cc36-f3793ffb7656
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-d2da-9a782feee5b6
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-d466-0330071ef0de
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-ef36-2ec32c93fbc6
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-d981-c0cd41f39b27
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-5b40-281a127c87f4	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb5-364c-e5a54c2f16c4	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-364c-e5a54c2f16c4	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-364c-e5a54c2f16c4	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb5-364c-e5a54c2f16c4	00030000-5665-abb5-ef36-2ec32c93fbc6
00020000-5665-abb5-364c-e5a54c2f16c4	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-364c-e5a54c2f16c4	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-364c-e5a54c2f16c4	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-fddd-315f48741025	00030000-5665-abb5-d2da-9a782feee5b6
00020000-5665-abb5-fddd-315f48741025	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-fddd-315f48741025	00030000-5665-abb5-1d8b-095bd66db4ef
00020000-5665-abb5-fddd-315f48741025	00030000-5665-abb5-40cc-7373675d98c3
00020000-5665-abb5-fddd-315f48741025	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb5-fddd-315f48741025	00030000-5665-abb5-b53a-5093bd119144
00020000-5665-abb5-fddd-315f48741025	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-dd47-3d37709a572d	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-dd47-3d37709a572d	00030000-5665-abb5-1d8b-095bd66db4ef
00020000-5665-abb5-dd47-3d37709a572d	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb5-dd47-3d37709a572d	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-ef36-2ec32c93fbc6
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-0457-3e1f9cf526b4
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-d981-c0cd41f39b27
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-d466-0330071ef0de
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-b53a-5093bd119144
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-2b13-347241513376
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-b619-9695fd26ffa5
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-2d62-91c6e2948844
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-b7c5-d47ed0068432	00030000-5665-abb5-f53a-8da2a526954d
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-ef36-2ec32c93fbc6
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-0457-3e1f9cf526b4
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-ecfd-269582aa4f4a	00030000-5665-abb5-f53a-8da2a526954d
00020000-5665-abb5-14ec-083b747a552c	00030000-5665-abb5-f53a-8da2a526954d
00020000-5665-abb5-14ec-083b747a552c	00030000-5665-abb5-03fc-2165705373db
00020000-5665-abb5-6772-a63a076c6850	00030000-5665-abb5-f53a-8da2a526954d
00020000-5665-abb5-1a1b-a0a5830e904e	00030000-5665-abb5-2b68-6656f5bc530b
00020000-5665-abb5-1a1b-a0a5830e904e	00030000-5665-abb5-6560-463b5d4939e2
00020000-5665-abb5-df37-b2f1fe1d875c	00030000-5665-abb5-2b68-6656f5bc530b
00020000-5665-abb5-7249-464875168544	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-7249-464875168544	00030000-5665-abb5-9449-f3f78543ba5b
00020000-5665-abb5-7103-43428903f318	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-4a76-86cd58d663c4	00030000-5665-abb5-b372-47d454966bba
00020000-5665-abb5-4a76-86cd58d663c4	00030000-5665-abb5-e211-e22d03b55b08
00020000-5665-abb5-0dc1-9f9b022dc4fc	00030000-5665-abb5-b372-47d454966bba
00020000-5665-abb5-4703-f5a8ebf21fc0	00030000-5665-abb5-13a7-ab13ccaaac0c
00020000-5665-abb5-4703-f5a8ebf21fc0	00030000-5665-abb5-9018-469cb314b966
00020000-5665-abb5-ef41-fdff29da86d7	00030000-5665-abb5-13a7-ab13ccaaac0c
00020000-5665-abb5-d632-b9e92cd565ef	00030000-5665-abb5-dffc-211c340b50c4
00020000-5665-abb5-d632-b9e92cd565ef	00030000-5665-abb5-a30d-335bc24d77de
00020000-5665-abb5-d001-1e87058cb444	00030000-5665-abb5-dffc-211c340b50c4
00020000-5665-abb5-7f35-94270502fa5a	00030000-5665-abb5-d92d-2d2c6a0c373e
00020000-5665-abb5-7f35-94270502fa5a	00030000-5665-abb5-5e6a-5ddd3abc0282
00020000-5665-abb5-7f35-94270502fa5a	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-7f35-94270502fa5a	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb5-7f35-94270502fa5a	00030000-5665-abb5-d466-0330071ef0de
00020000-5665-abb5-7f35-94270502fa5a	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-d61c-4daa320dff17	00030000-5665-abb5-d92d-2d2c6a0c373e
00020000-5665-abb5-d61c-4daa320dff17	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-d61c-4daa320dff17	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb5-eae0-e2137aebec7e	00030000-5665-abb5-311d-8ca429b66af9
00020000-5665-abb5-eae0-e2137aebec7e	00030000-5665-abb5-32c4-7091fc6be0b1
00020000-5665-abb5-01e0-2d179a3807d3	00030000-5665-abb5-311d-8ca429b66af9
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-602e-5218b6f397e6
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-cc36-f3793ffb7656
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb5-ed4b-111483a63e16	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-c920-8a40c1b6dee5	00030000-5665-abb5-cc36-f3793ffb7656
00020000-5665-abb5-c920-8a40c1b6dee5	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb5-c920-8a40c1b6dee5	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-c920-8a40c1b6dee5	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-c920-8a40c1b6dee5	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-2d28-6ba6969e00e2	00030000-5665-abb5-c38b-e56eca60fc2e
00020000-5665-abb5-2d28-6ba6969e00e2	00030000-5665-abb5-aaa2-c9d670ca0295
00020000-5665-abb5-3b5f-772d67c993df	00030000-5665-abb5-c38b-e56eca60fc2e
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-34a5-a1fa40b68b15
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-718c-d769bea3b356
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-16f1-697177709663
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-b202-2388169e19a0
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-d854-ae9aba5a68b7
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-9af0-a847064418ac
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-65c1-d849127dd814
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-d977-5eacfd310210
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-5922-3540f5065e7c
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-64f0-5bfd2e6dea48
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-75d2-2cca64a6b86b
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-c2fe-e283c7106466
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-d399-3c809108fca7
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-b831-60a737f73c1e
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-5718-8504964dc521
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-44f4-e0a47114095d
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-9b56-98b3c90ec2bb
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-c93c-bcd98a0f6ac5
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-227e-84519b10cb3a
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-4f33-d02cfe42efd1
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-1b7f-f628f9752ecc
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-2845-c9f56a7ff2b2
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-a5b8-e1bea4b3c1a0
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-c4e1-795e808c4964
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-8d98-4266ce89083e
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-ad53-d82ed5c0cee5
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-b973-2f75ead1cb64
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-e0be-e0623c51d4e5
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-7618-7dca322266f8
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-311d-8ca429b66af9
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-a80d-5af9883209e4
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-3ef1-726be3957090
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-e149-f3835806175a
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-d0d8-5e8e9642776e
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-1b69-594675617055
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-18c4-bf4816b622f4
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-37be-93305b12e29a	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-16f1-697177709663
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-d854-ae9aba5a68b7
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-65c1-d849127dd814
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-5922-3540f5065e7c
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-75d2-2cca64a6b86b
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-d399-3c809108fca7
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-5718-8504964dc521
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-9b56-98b3c90ec2bb
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-227e-84519b10cb3a
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-1b7f-f628f9752ecc
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-e0be-e0623c51d4e5
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-b973-2f75ead1cb64
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-7618-7dca322266f8
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-18c4-bf4816b622f4
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-2617-d64e58137804	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-77b9-5c9a5eaee046
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-e149-f3835806175a
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-a48e-f91c8804bcd9
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-d2e2-a3fd99b614ed
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-3ef1-726be3957090
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-6a24-ead1a945cae5
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-d0d8-5e8e9642776e
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-a587-33f4a11b98d6	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-e149-f3835806175a
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-d2e2-a3fd99b614ed
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-3ef1-726be3957090
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-d0d8-5e8e9642776e
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb5-21bc-44f904ab3517	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-e149-f3835806175a
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-a48e-f91c8804bcd9
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-3ef1-726be3957090
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-1b69-594675617055
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-f815-aa60484a31c5
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-a80d-5af9883209e4
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-faf9-4ffb9c84dbef
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-d0d8-5e8e9642776e
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-c242-7bd3296ed15f	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-e149-f3835806175a
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-3ef1-726be3957090
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-1b69-594675617055
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-a80d-5af9883209e4
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-d0d8-5e8e9642776e
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-f9c4-755bac3dcdf2	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb5-fcd9-2ed2d54280c9	00030000-5665-abb5-a80d-5af9883209e4
00020000-5665-abb5-fcd9-2ed2d54280c9	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-fcd9-2ed2d54280c9	00030000-5665-abb5-3ef1-726be3957090
00020000-5665-abb5-fcd9-2ed2d54280c9	00030000-5665-abb5-1b69-594675617055
00020000-5665-abb5-fcd9-2ed2d54280c9	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-fcd9-2ed2d54280c9	00030000-5665-abb5-d0d8-5e8e9642776e
00020000-5665-abb5-fcd9-2ed2d54280c9	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-42cd-c06f24a667a6	00030000-5665-abb5-a80d-5af9883209e4
00020000-5665-abb5-42cd-c06f24a667a6	00030000-5665-abb5-faf9-4ffb9c84dbef
00020000-5665-abb5-42cd-c06f24a667a6	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-42cd-c06f24a667a6	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-b69a-80329980f79b	00030000-5665-abb5-a80d-5af9883209e4
00020000-5665-abb5-b69a-80329980f79b	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-dffc-211c340b50c4
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-e149-f3835806175a
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-a7c0-fabe902f35d7
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-c1dd-f207e5088a77
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-d2e2-a3fd99b614ed
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-c94e-37b967cf159c
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-3ef1-726be3957090
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-0457-3e1f9cf526b4
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-cc36-f3793ffb7656
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-d2da-9a782feee5b6
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-2b68-6656f5bc530b
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-d466-0330071ef0de
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-d92d-2d2c6a0c373e
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-ef36-2ec32c93fbc6
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-d981-c0cd41f39b27
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-d0d8-5e8e9642776e
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-f53a-8da2a526954d
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-c38b-e56eca60fc2e
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-311d-8ca429b66af9
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-13a7-ab13ccaaac0c
00020000-5665-abb5-ffde-e56bc4ca5dfa	00030000-5665-abb5-b372-47d454966bba
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b634-efbdfac12fd4
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-4141-c11eb87690b8
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-dffc-211c340b50c4
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a30d-335bc24d77de
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-e149-f3835806175a
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a48e-f91c8804bcd9
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-1777-35688f1b8266
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d9bf-9130cc93d0ae
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6005-171d3952bdb1
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c4fd-0a0af639e1a0
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a7c0-fabe902f35d7
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c1dd-f207e5088a77
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d2e2-a3fd99b614ed
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c94e-37b967cf159c
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6c3e-6ac5cbe269f6
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-40d1-1fbdcf768f61
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6056-e353f2a974ba
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-902b-23c888bf4430
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-5a9d-4775ac75da83
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-eac6-ff56d83d7d55
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6e05-68e3e9df1fd4
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b973-2f75ead1cb64
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c4e1-795e808c4964
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-374e-7704c2e20121
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-9449-f3f78543ba5b
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-9fe1-3fd1b839fd0b
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-5eae-3fc60f67c5de
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-3ef1-726be3957090
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6a24-ead1a945cae5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-3557-430e7e45cce8
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7d8f-a6e1f515b955
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7399-443e0baed304
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-18c4-bf4816b622f4
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-ad53-d82ed5c0cee5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-0457-3e1f9cf526b4
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b619-9695fd26ffa5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-64b4-fe1a6fa8e2ed
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-ac64-31dade27fc27
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-095d-d8883d7aeaa6
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-1b2f-1cb63df249b7
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6f6b-494ef0859d36
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-3888-4d012d50b700
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-70c0-72f8d7b1afdc
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-fbd1-afe6aaa749b9
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-fc93-9398b7f33468
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-30ee-1de85e1cafa8
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-1831-349ea02da8e8
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7281-346ecfd3aa81
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a268-722f1d58f857
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-ed10-13309bb413ce
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-cc36-f3793ffb7656
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-602e-5218b6f397e6
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-40cc-7373675d98c3
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d2da-9a782feee5b6
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-334c-f04b47b1e0ac
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-cee0-e4f25211f583
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7eaf-6a5632f0a494
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-f83a-3f6421c35b5c
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-1b69-594675617055
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-f815-aa60484a31c5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2b13-347241513376
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2b68-6656f5bc530b
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6560-463b5d4939e2
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7618-7dca322266f8
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-8d98-4266ce89083e
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-31bc-9526ffdabf47
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-3622-5cd6d2dc1a69
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d466-0330071ef0de
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-edec-7b7df64e0cea
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-53e3-c102a6f7472b
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-71e6-34436de48df0
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-9594-c098a074d4c1
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-218a-27f820bdcef3
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7b20-5b5139cb7ab5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-e0be-e0623c51d4e5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a5b8-e1bea4b3c1a0
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7395-85314b9def3d
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2d62-91c6e2948844
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-34a5-a1fa40b68b15
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-16f1-697177709663
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-718c-d769bea3b356
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b202-2388169e19a0
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d854-ae9aba5a68b7
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-9af0-a847064418ac
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-65c1-d849127dd814
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d977-5eacfd310210
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-5922-3540f5065e7c
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-64f0-5bfd2e6dea48
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-75d2-2cca64a6b86b
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c2fe-e283c7106466
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d399-3c809108fca7
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b831-60a737f73c1e
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-5718-8504964dc521
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-44f4-e0a47114095d
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-9b56-98b3c90ec2bb
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c93c-bcd98a0f6ac5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-227e-84519b10cb3a
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-4f33-d02cfe42efd1
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-1b7f-f628f9752ecc
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2845-c9f56a7ff2b2
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d92d-2d2c6a0c373e
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-5e6a-5ddd3abc0282
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-26eb-4760bc6c3e8d
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-36a8-1038995375f6
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-5a66-0736b72d727d
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-58b1-4055c64dc3ed
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-91b5-aa752df18e16
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-ec4f-d3255c9c9e95
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6e89-d7320aa30b38
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2c49-900866057bb9
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7ce4-514126a34de0
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b7f9-c86b899ae952
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-e157-7c09633912c5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-de17-c7b98e7560bf
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-acab-e4c11da0ae87
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-7337-dffe36945eaa
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-657c-92ebedbe7c06
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-98ef-b6d76f0a5894
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c4d7-4c6c21e2b521
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b5d5-cfcd05805cb9
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-bfa7-111aa64b218b
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a845-2face1cc21db
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2289-83e7a66f873a
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a80d-5af9883209e4
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-faf9-4ffb9c84dbef
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-ef36-2ec32c93fbc6
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d981-c0cd41f39b27
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2d12-a67b93549d3c
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-521f-5fd88c779021
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-ad71-8de50f41356e
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d0d8-5e8e9642776e
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-77cc-3c12cb81df09
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-f53a-8da2a526954d
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-03fc-2165705373db
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-6108-ac1f1644c987
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a027-0fe591491299
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c38b-e56eca60fc2e
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-aaa2-c9d670ca0295
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b53a-5093bd119144
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-77b9-5c9a5eaee046
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-470d-74a58f2819e9
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-4bc0-107ec4204cc1
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-1c45-f3bc15249899
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-c003-7ff7437e323c
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-311d-8ca429b66af9
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-32c4-7091fc6be0b1
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-862d-d44681868bd5
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-d01b-de3f83600438
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-2afb-6e6bbca9ae44
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-a967-063808a0dc22
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-60ae-faa4ae9a1c20
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-13a7-ab13ccaaac0c
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-9018-469cb314b966
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-b372-47d454966bba
00020000-5665-abb7-991a-4e1bc0043daa	00030000-5665-abb5-e211-e22d03b55b08
00020000-5665-abb7-5d3f-671ceab558a6	00030000-5665-abb5-9a84-69d3f75df895
00020000-5665-abb7-2c27-19e6e439d4d6	00030000-5665-abb5-2827-b6b4117bccd6
00020000-5665-abb7-3c0d-4b606c16658d	00030000-5665-abb5-77b9-5c9a5eaee046
00020000-5665-abb7-1aae-768bc76e2530	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb7-338a-f5d0e3d22357	00030000-5665-abb5-1b2f-1cb63df249b7
00020000-5665-abb7-ed53-a6da93638f49	00030000-5665-abb5-6f6b-494ef0859d36
00020000-5665-abb7-7921-2b240abcecb8	00030000-5665-abb5-3888-4d012d50b700
00020000-5665-abb7-b6c9-7bd0763806e0	00030000-5665-abb5-095d-d8883d7aeaa6
00020000-5665-abb7-0f66-51426f2ebc9a	00030000-5665-abb5-70c0-72f8d7b1afdc
00020000-5665-abb7-6837-a2984b5dfc77	00030000-5665-abb5-fbd1-afe6aaa749b9
00020000-5665-abb7-2bb6-38e794826705	00030000-5665-abb5-9bc6-f19f9f0d6275
00020000-5665-abb7-745f-a1893ea7446a	00030000-5665-abb5-b488-bb2843b909f7
00020000-5665-abb7-8696-a243c37b0357	00030000-5665-abb5-42a1-4189a0e682fd
00020000-5665-abb7-8e4d-34ef980eaa2e	00030000-5665-abb5-d2da-9a782feee5b6
00020000-5665-abb7-44d1-a425ff350c9a	00030000-5665-abb5-40cc-7373675d98c3
00020000-5665-abb7-6d3f-fed935762c8f	00030000-5665-abb5-1d8b-095bd66db4ef
00020000-5665-abb7-824a-e89810f8ca5a	00030000-5665-abb5-af2f-3e945ebf1492
00020000-5665-abb7-040b-14965a8267bc	00030000-5665-abb5-de62-6e69033d912c
00020000-5665-abb7-5c27-1932b41e0dd6	00030000-5665-abb5-6ad6-8954a261a55b
00020000-5665-abb7-5c27-1932b41e0dd6	00030000-5665-abb5-2b13-347241513376
00020000-5665-abb7-5c27-1932b41e0dd6	00030000-5665-abb5-abf8-fc2c16038f05
00020000-5665-abb7-07e4-612868903b35	00030000-5665-abb5-dd10-1695db0999b6
00020000-5665-abb7-4150-043084e6fc88	00030000-5665-abb5-b53a-5093bd119144
00020000-5665-abb7-1eed-3651c46d1de2	00030000-5665-abb5-2289-83e7a66f873a
00020000-5665-abb7-d67b-0627d8750331	00030000-5665-abb5-ef36-2ec32c93fbc6
00020000-5665-abb7-d2fc-d303b3a7aab0	00030000-5665-abb5-d981-c0cd41f39b27
00020000-5665-abb7-6fc5-5c309cabfe9c	00030000-5665-abb5-0260-c1ea42ff2630
00020000-5665-abb7-a19d-c390c93ede41	00030000-5665-abb5-d466-0330071ef0de
00020000-5665-abb7-0d10-736f59348dbd	00030000-5665-abb5-3674-fae2a9809421
00020000-5665-abb7-1872-ed57234f3641	00030000-5665-abb5-2afb-6e6bbca9ae44
\.


--
-- TOC entry 3141 (class 0 OID 31123235)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 31123269)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 31123406)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5665-abb7-a713-a6bbfea43c96	00090000-5665-abb7-f6f9-689cd3d891df	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5665-abb7-49b9-93c3abea267e	00090000-5665-abb7-af83-fea1cd53951c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5665-abb7-4a79-98bfb5a322f9	00090000-5665-abb7-0c8b-1a65bd242b66	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5665-abb7-9263-a7189714b53c	00090000-5665-abb7-e284-2759eff8abe6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 31122927)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5665-abb7-5a4e-a9672f612b28	\N	00040000-5665-abb5-899b-130de6f8478a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-abb7-00b1-a8fb8dbf481a	\N	00040000-5665-abb5-899b-130de6f8478a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5665-abb7-058d-258fb54e3c32	\N	00040000-5665-abb5-899b-130de6f8478a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-abb7-9a38-cbe4a1f9a469	\N	00040000-5665-abb5-899b-130de6f8478a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-abb7-bb36-558b8674c10d	\N	00040000-5665-abb5-899b-130de6f8478a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-abb7-3e9b-1150cfe78978	\N	00040000-5665-abb5-c4a9-4f3fa97f3b40	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-abb7-a274-3b54af4f1d93	\N	00040000-5665-abb5-5824-72c8e60c37a1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-abb7-53fe-2e03b7ac3ff7	\N	00040000-5665-abb5-2fd0-987cc6a38e83	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-abb7-3f6e-30ea98173b5c	\N	00040000-5665-abb5-8677-64fac346b3ff	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-abb9-2dd3-d495f0e5c7d5	\N	00040000-5665-abb5-899b-130de6f8478a	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 31122972)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5665-abb4-1880-4239ce0b13e4	8341	Adlešiči
00050000-5665-abb4-3204-b51cc0006b93	5270	Ajdovščina
00050000-5665-abb4-6a57-d2116102ad52	6280	Ankaran/Ancarano
00050000-5665-abb4-bf75-33176031d5a4	9253	Apače
00050000-5665-abb4-befc-c1a7a6e7eec5	8253	Artiče
00050000-5665-abb4-3bf8-bf9bc44cdb59	4275	Begunje na Gorenjskem
00050000-5665-abb4-d001-230a851ad612	1382	Begunje pri Cerknici
00050000-5665-abb4-a274-0c66490d0c0b	9231	Beltinci
00050000-5665-abb4-0b7f-ae8bccacd853	2234	Benedikt
00050000-5665-abb4-7435-6fb8cfd78efe	2345	Bistrica ob Dravi
00050000-5665-abb4-9ac3-b65208739e97	3256	Bistrica ob Sotli
00050000-5665-abb4-d20e-aa0472df9eda	8259	Bizeljsko
00050000-5665-abb4-f507-ddee4a75e6f7	1223	Blagovica
00050000-5665-abb4-e395-ede3b1b4a6a4	8283	Blanca
00050000-5665-abb4-4be6-42bbb8141323	4260	Bled
00050000-5665-abb4-9167-4dc8061143e9	4273	Blejska Dobrava
00050000-5665-abb4-7099-1f066271b3ac	9265	Bodonci
00050000-5665-abb4-64e5-0a6a0906faa9	9222	Bogojina
00050000-5665-abb4-b0fd-4433765ca584	4263	Bohinjska Bela
00050000-5665-abb4-7025-0fa1eae7a1db	4264	Bohinjska Bistrica
00050000-5665-abb4-ff18-eb2e8acc13c3	4265	Bohinjsko jezero
00050000-5665-abb4-711f-2eee0b6e5e6e	1353	Borovnica
00050000-5665-abb4-ab50-37715715e2e4	8294	Boštanj
00050000-5665-abb4-33f0-c6c9dc2f0111	5230	Bovec
00050000-5665-abb4-4d7a-9463d4e5ee71	5295	Branik
00050000-5665-abb4-4e42-3285ce83558f	3314	Braslovče
00050000-5665-abb4-19cb-d26fe04b3b6e	5223	Breginj
00050000-5665-abb4-f73d-930e9af940de	8280	Brestanica
00050000-5665-abb4-5aab-4f762b5ee923	2354	Bresternica
00050000-5665-abb4-fb0e-6478bc8b94fb	4243	Brezje
00050000-5665-abb4-a521-ee1b226c588b	1351	Brezovica pri Ljubljani
00050000-5665-abb4-a1ca-c70c6c9279c8	8250	Brežice
00050000-5665-abb4-4b0d-af838871e888	4210	Brnik - Aerodrom
00050000-5665-abb4-6964-6e3770740c95	8321	Brusnice
00050000-5665-abb4-7c50-d14a4034ff44	3255	Buče
00050000-5665-abb4-a8a1-a183725a73bb	8276	Bučka 
00050000-5665-abb4-3ecd-c984345a9dcc	9261	Cankova
00050000-5665-abb4-92bb-9717625cfe20	3000	Celje 
00050000-5665-abb4-dd41-cccb539f1041	3001	Celje - poštni predali
00050000-5665-abb4-9ee5-22ec8eec9f15	4207	Cerklje na Gorenjskem
00050000-5665-abb4-ec22-74e9c4bb8516	8263	Cerklje ob Krki
00050000-5665-abb4-6cad-499b52ace29f	1380	Cerknica
00050000-5665-abb4-298d-9c3f3e986584	5282	Cerkno
00050000-5665-abb4-3aed-3b6d44f5b450	2236	Cerkvenjak
00050000-5665-abb4-037d-9d3887827584	2215	Ceršak
00050000-5665-abb4-e9c2-9a38822cb326	2326	Cirkovce
00050000-5665-abb4-b129-f559b23c2761	2282	Cirkulane
00050000-5665-abb4-c231-c24500fc2081	5273	Col
00050000-5665-abb4-d7ae-f56d47d2a081	8251	Čatež ob Savi
00050000-5665-abb4-d798-8d1889a2ed96	1413	Čemšenik
00050000-5665-abb4-9714-7494c40e2a12	5253	Čepovan
00050000-5665-abb4-b472-4787dccfb779	9232	Črenšovci
00050000-5665-abb4-f9bd-a336b936784f	2393	Črna na Koroškem
00050000-5665-abb4-e638-36ef772d7a71	6275	Črni Kal
00050000-5665-abb4-6a8c-23d5ce8a2406	5274	Črni Vrh nad Idrijo
00050000-5665-abb4-5c67-802bfb9152d6	5262	Črniče
00050000-5665-abb4-2d88-0d4b6a8150d2	8340	Črnomelj
00050000-5665-abb4-3814-417b79c8fe79	6271	Dekani
00050000-5665-abb4-d8c0-a9064550c5a9	5210	Deskle
00050000-5665-abb4-1dab-b7edcb9bafcf	2253	Destrnik
00050000-5665-abb4-8daa-7abb086f47bd	6215	Divača
00050000-5665-abb4-7f3f-6291a52e09c9	1233	Dob
00050000-5665-abb4-e07a-0c88a6474229	3224	Dobje pri Planini
00050000-5665-abb4-3ac9-0f3c10d981e1	8257	Dobova
00050000-5665-abb4-3e5d-87fbd4ab1906	1423	Dobovec
00050000-5665-abb4-ab4d-69aeecd95c0a	5263	Dobravlje
00050000-5665-abb4-a5ed-e50d7ba6737d	3204	Dobrna
00050000-5665-abb4-0e04-30d84c298810	8211	Dobrnič
00050000-5665-abb4-2a5e-393c80ee1db2	1356	Dobrova
00050000-5665-abb4-cecf-2bccc3dcb441	9223	Dobrovnik/Dobronak 
00050000-5665-abb4-b2a9-53e7a41a8ebc	5212	Dobrovo v Brdih
00050000-5665-abb4-6649-60297328e5df	1431	Dol pri Hrastniku
00050000-5665-abb4-bb68-8533a210c08a	1262	Dol pri Ljubljani
00050000-5665-abb4-9876-b1e0222aef7e	1273	Dole pri Litiji
00050000-5665-abb4-c12b-d6c0cc708a15	1331	Dolenja vas
00050000-5665-abb4-894f-957887621618	8350	Dolenjske Toplice
00050000-5665-abb4-a609-31ac86470400	1230	Domžale
00050000-5665-abb4-8352-654207d02483	2252	Dornava
00050000-5665-abb4-a56f-3a29d11b9128	5294	Dornberk
00050000-5665-abb4-0dbc-a16b3d267c76	1319	Draga
00050000-5665-abb4-0acb-b2c268633877	8343	Dragatuš
00050000-5665-abb4-8b22-6ca074948582	3222	Dramlje
00050000-5665-abb4-7c65-fadb0a09542d	2370	Dravograd
00050000-5665-abb4-4a4f-aee87dd39074	4203	Duplje
00050000-5665-abb4-f832-9b64dfcfcd92	6221	Dutovlje
00050000-5665-abb4-e13a-489bc2859ec9	8361	Dvor
00050000-5665-abb4-5b69-61fd04a0b774	2343	Fala
00050000-5665-abb4-1a5b-2721fce7bc24	9208	Fokovci
00050000-5665-abb4-bbc7-8a7f28f0425c	2313	Fram
00050000-5665-abb4-95b5-ff66705608df	3213	Frankolovo
00050000-5665-abb4-9a19-b3516149d34f	1274	Gabrovka
00050000-5665-abb4-60a6-0c7f81fb0965	8254	Globoko
00050000-5665-abb4-74d8-3ca3dcd8a983	5275	Godovič
00050000-5665-abb4-51b4-eed06e475eaf	4204	Golnik
00050000-5665-abb4-da77-99744f9aa8f0	3303	Gomilsko
00050000-5665-abb4-dfb0-26a701ad9fca	4224	Gorenja vas
00050000-5665-abb4-3a5a-a064017eec8b	3263	Gorica pri Slivnici
00050000-5665-abb4-3c72-601e4f86f8fe	2272	Gorišnica
00050000-5665-abb4-08de-7a5263f86f94	9250	Gornja Radgona
00050000-5665-abb4-d817-828fd18b2cea	3342	Gornji Grad
00050000-5665-abb4-2fdd-187649ccc3dd	4282	Gozd Martuljek
00050000-5665-abb4-5298-1ed690c4051a	6272	Gračišče
00050000-5665-abb4-d348-30602f6979da	9264	Grad
00050000-5665-abb4-d88f-b97037d9aacf	8332	Gradac
00050000-5665-abb4-2f75-9a67942a09b1	1384	Grahovo
00050000-5665-abb4-068e-e77e495701e3	5242	Grahovo ob Bači
00050000-5665-abb4-10d2-43f3f72d500d	5251	Grgar
00050000-5665-abb4-887d-74c76b27aa73	3302	Griže
00050000-5665-abb4-1d66-f15db6a20ee8	3231	Grobelno
00050000-5665-abb4-84d1-cc34f506bfd4	1290	Grosuplje
00050000-5665-abb4-1e56-d57fa0eb67a6	2288	Hajdina
00050000-5665-abb4-501c-789d67d508f2	8362	Hinje
00050000-5665-abb4-2864-8dd38f726e9b	2311	Hoče
00050000-5665-abb4-23ae-129f81b08b76	9205	Hodoš/Hodos
00050000-5665-abb4-5aa6-2652424b9be3	1354	Horjul
00050000-5665-abb4-b3ee-3d64bae5d108	1372	Hotedršica
00050000-5665-abb4-1ee1-bc5ca65f7f04	1430	Hrastnik
00050000-5665-abb4-492e-89c4a477ccd6	6225	Hruševje
00050000-5665-abb4-1d25-15b00279fb0a	4276	Hrušica
00050000-5665-abb4-ae88-3512988934fd	5280	Idrija
00050000-5665-abb4-6bc8-b5be78bbb7a0	1292	Ig
00050000-5665-abb4-2732-f8f526189bba	6250	Ilirska Bistrica
00050000-5665-abb4-ce1b-fe04a1ca3c0d	6251	Ilirska Bistrica-Trnovo
00050000-5665-abb4-a1da-4af0465fe661	1295	Ivančna Gorica
00050000-5665-abb4-9e3a-55b13d3b49c1	2259	Ivanjkovci
00050000-5665-abb4-0338-03a978b713f1	1411	Izlake
00050000-5665-abb4-e6f0-9d4bdfe9315a	6310	Izola/Isola
00050000-5665-abb4-443f-428d7512922f	2222	Jakobski Dol
00050000-5665-abb4-fb0e-3c5a9052092f	2221	Jarenina
00050000-5665-abb4-d323-789657bbb896	6254	Jelšane
00050000-5665-abb4-7bf9-b719cea44008	4270	Jesenice
00050000-5665-abb4-6a9b-8ad382c137d0	8261	Jesenice na Dolenjskem
00050000-5665-abb4-55b2-520be24c9713	3273	Jurklošter
00050000-5665-abb4-119a-a367f4bcaf7c	2223	Jurovski Dol
00050000-5665-abb4-6026-6ac92827a831	2256	Juršinci
00050000-5665-abb4-10e5-db827a0df60d	5214	Kal nad Kanalom
00050000-5665-abb4-6172-454e1407bce2	3233	Kalobje
00050000-5665-abb4-0ce3-115f7701311a	4246	Kamna Gorica
00050000-5665-abb4-1912-d8d95e204fa0	2351	Kamnica
00050000-5665-abb4-cda6-d88915202b98	1241	Kamnik
00050000-5665-abb4-e01b-fb9c97be1093	5213	Kanal
00050000-5665-abb4-2af7-8ade56e39cf0	8258	Kapele
00050000-5665-abb4-da6c-5038f418fe8e	2362	Kapla
00050000-5665-abb4-b981-a3a768da92ad	2325	Kidričevo
00050000-5665-abb4-ed55-e8f6e187a7f7	1412	Kisovec
00050000-5665-abb4-9af3-753584d02519	6253	Knežak
00050000-5665-abb4-4e05-8547b0930d6d	5222	Kobarid
00050000-5665-abb4-92ab-bae8adea91c4	9227	Kobilje
00050000-5665-abb4-de77-7dc3bf11796b	1330	Kočevje
00050000-5665-abb4-fe1a-6970efdee8c1	1338	Kočevska Reka
00050000-5665-abb4-323b-9ecc4fbc0a11	2276	Kog
00050000-5665-abb4-3485-dd14c79d4b17	5211	Kojsko
00050000-5665-abb4-4ee4-ecd463998899	6223	Komen
00050000-5665-abb4-399f-10c03eb060a7	1218	Komenda
00050000-5665-abb4-3432-bda5709af7f6	6000	Koper/Capodistria 
00050000-5665-abb4-29b5-4b524014d444	6001	Koper/Capodistria - poštni predali
00050000-5665-abb4-0ac0-652cb8e632d3	8282	Koprivnica
00050000-5665-abb4-7729-533f44a41dc1	5296	Kostanjevica na Krasu
00050000-5665-abb4-d9ba-03a3704daa09	8311	Kostanjevica na Krki
00050000-5665-abb4-c5ca-292a0c98b44a	1336	Kostel
00050000-5665-abb4-1452-8dcf8529462b	6256	Košana
00050000-5665-abb4-91c3-78b1678cc6a8	2394	Kotlje
00050000-5665-abb4-2a26-7a5350b298cc	6240	Kozina
00050000-5665-abb4-781a-fbd83baca645	3260	Kozje
00050000-5665-abb4-e4c5-31a32c7a3ebd	4000	Kranj 
00050000-5665-abb4-5e36-4161aa954736	4001	Kranj - poštni predali
00050000-5665-abb4-d164-dc8f2213cb69	4280	Kranjska Gora
00050000-5665-abb4-805a-b01c26711f30	1281	Kresnice
00050000-5665-abb4-569e-e3abd569512a	4294	Križe
00050000-5665-abb4-c415-b52490aff9ec	9206	Križevci
00050000-5665-abb4-f8f4-f23c56ebf862	9242	Križevci pri Ljutomeru
00050000-5665-abb4-1939-28a39e1cbe91	1301	Krka
00050000-5665-abb4-243b-2561cc07585b	8296	Krmelj
00050000-5665-abb4-4c1a-0e2d88cf2058	4245	Kropa
00050000-5665-abb4-d7f4-29f1e6bd9bee	8262	Krška vas
00050000-5665-abb4-c1e5-54473e03e5e6	8270	Krško
00050000-5665-abb4-7fe2-1c70263f7a1b	9263	Kuzma
00050000-5665-abb4-c416-41acbb85492f	2318	Laporje
00050000-5665-abb4-7ee3-c6bc77f679c2	3270	Laško
00050000-5665-abb4-95d5-5c86800de760	1219	Laze v Tuhinju
00050000-5665-abb4-cef7-e8b53e27bd2e	2230	Lenart v Slovenskih goricah
00050000-5665-abb4-8f7b-620e39f36470	9220	Lendava/Lendva
00050000-5665-abb4-ab8d-e5d7860e568e	4248	Lesce
00050000-5665-abb4-1787-41f4f1a5e97b	3261	Lesično
00050000-5665-abb4-1c0e-2017ca7dc66d	8273	Leskovec pri Krškem
00050000-5665-abb4-c400-eee2c6426c92	2372	Libeliče
00050000-5665-abb4-6949-d09445476ecc	2341	Limbuš
00050000-5665-abb4-703e-610ce3917189	1270	Litija
00050000-5665-abb4-5174-60d2ce127615	3202	Ljubečna
00050000-5665-abb4-6bd1-4659672450de	1000	Ljubljana 
00050000-5665-abb4-b4c6-54d4061e4d96	1001	Ljubljana - poštni predali
00050000-5665-abb4-b332-d97de788dc3b	1231	Ljubljana - Črnuče
00050000-5665-abb4-05aa-128407473f2b	1261	Ljubljana - Dobrunje
00050000-5665-abb4-58e4-eeb57c589cef	1260	Ljubljana - Polje
00050000-5665-abb4-e71e-aec06d2a8fdf	1210	Ljubljana - Šentvid
00050000-5665-abb4-0c11-bd1f376a79db	1211	Ljubljana - Šmartno
00050000-5665-abb4-0e44-0f680833b998	3333	Ljubno ob Savinji
00050000-5665-abb4-e044-c276e5175ea2	9240	Ljutomer
00050000-5665-abb4-14ff-5f9a7bc8d92f	3215	Loče
00050000-5665-abb4-5dbf-031881c5d530	5231	Log pod Mangartom
00050000-5665-abb4-3e08-aa296c022707	1358	Log pri Brezovici
00050000-5665-abb4-f07a-8e38176c5ee2	1370	Logatec
00050000-5665-abb4-7653-ed1c0ee6016d	1371	Logatec
00050000-5665-abb4-bf06-6c047bf422d4	1434	Loka pri Zidanem Mostu
00050000-5665-abb4-24c1-5294b3a4e323	3223	Loka pri Žusmu
00050000-5665-abb4-312f-de013b8290f5	6219	Lokev
00050000-5665-abb4-e90a-28bd43205e9c	1318	Loški Potok
00050000-5665-abb4-ae4d-2a2fb08396e4	2324	Lovrenc na Dravskem polju
00050000-5665-abb4-9bc5-b3b64cedde83	2344	Lovrenc na Pohorju
00050000-5665-abb4-38b8-2bc8ab86e478	3334	Luče
00050000-5665-abb4-a62a-9a33f67025bf	1225	Lukovica
00050000-5665-abb4-23ca-df846c5f091f	9202	Mačkovci
00050000-5665-abb4-7eb3-889af0e1cdb6	2322	Majšperk
00050000-5665-abb4-134b-374af4464ba9	2321	Makole
00050000-5665-abb4-7f71-c50b89c20a48	9243	Mala Nedelja
00050000-5665-abb4-2924-ebb87e8a3f4c	2229	Malečnik
00050000-5665-abb4-f17a-bd1607e603ce	6273	Marezige
00050000-5665-abb4-d315-058016843e74	2000	Maribor 
00050000-5665-abb4-250e-40b02913be44	2001	Maribor - poštni predali
00050000-5665-abb4-acc3-cf7312646f4f	2206	Marjeta na Dravskem polju
00050000-5665-abb4-2894-2cf8bc3d4e3a	2281	Markovci
00050000-5665-abb4-d3f0-8b4f8df9dcba	9221	Martjanci
00050000-5665-abb4-d5d0-f42efee30e2a	6242	Materija
00050000-5665-abb4-d1ea-871914413436	4211	Mavčiče
00050000-5665-abb4-18ca-f1c29eca45e6	1215	Medvode
00050000-5665-abb4-9480-0a6cacb855e2	1234	Mengeš
00050000-5665-abb4-b5a8-2b3a71a9eea6	8330	Metlika
00050000-5665-abb4-f7cd-dba15c817eca	2392	Mežica
00050000-5665-abb4-1845-3cb7986a0c78	2204	Miklavž na Dravskem polju
00050000-5665-abb4-3011-49584a1400f6	2275	Miklavž pri Ormožu
00050000-5665-abb4-be6b-c791f945f658	5291	Miren
00050000-5665-abb4-0e93-9710880be861	8233	Mirna
00050000-5665-abb4-11e3-6010554776ac	8216	Mirna Peč
00050000-5665-abb4-23b1-b889f169006d	2382	Mislinja
00050000-5665-abb4-406d-9fdfde517260	4281	Mojstrana
00050000-5665-abb4-9529-7eec35d3d7c6	8230	Mokronog
00050000-5665-abb4-d6ad-d8d31c5ec698	1251	Moravče
00050000-5665-abb4-18b1-f64cd5ff50d9	9226	Moravske Toplice
00050000-5665-abb4-7f69-069000d2541c	5216	Most na Soči
00050000-5665-abb4-7537-f46a7557c32d	1221	Motnik
00050000-5665-abb4-a853-81f727656d4f	3330	Mozirje
00050000-5665-abb4-5014-d222a66e6c4d	9000	Murska Sobota 
00050000-5665-abb4-9421-707605061391	9001	Murska Sobota - poštni predali
00050000-5665-abb4-e454-168b7a388fee	2366	Muta
00050000-5665-abb4-57b2-e435a3b95578	4202	Naklo
00050000-5665-abb4-1173-495c5e23c212	3331	Nazarje
00050000-5665-abb4-819e-6ab87c404c56	1357	Notranje Gorice
00050000-5665-abb4-96f4-c77b39a21687	3203	Nova Cerkev
00050000-5665-abb4-dc7c-4125601fd43b	5000	Nova Gorica 
00050000-5665-abb4-347a-53ed67fd009f	5001	Nova Gorica - poštni predali
00050000-5665-abb4-871f-8cfc6070b2d3	1385	Nova vas
00050000-5665-abb4-092a-56549112afaa	8000	Novo mesto
00050000-5665-abb4-cf20-2a56accd3a49	8001	Novo mesto - poštni predali
00050000-5665-abb4-ec31-b44242dfe600	6243	Obrov
00050000-5665-abb4-a1df-c9235713efd3	9233	Odranci
00050000-5665-abb4-dae1-a014588242f6	2317	Oplotnica
00050000-5665-abb4-2072-035cb791225c	2312	Orehova vas
00050000-5665-abb4-a1e9-999b7dfc3254	2270	Ormož
00050000-5665-abb4-3e7c-335a10547ee5	1316	Ortnek
00050000-5665-abb4-009a-dbbb531627f3	1337	Osilnica
00050000-5665-abb4-954b-498cbd505232	8222	Otočec
00050000-5665-abb4-9372-b2fce819c814	2361	Ožbalt
00050000-5665-abb4-f323-cf96632545cc	2231	Pernica
00050000-5665-abb4-2162-e010d357c7b3	2211	Pesnica pri Mariboru
00050000-5665-abb4-a99e-02fa7c60040d	9203	Petrovci
00050000-5665-abb4-0e2c-11b9b4f4caf2	3301	Petrovče
00050000-5665-abb4-11d1-4928382de14c	6330	Piran/Pirano
00050000-5665-abb4-38eb-b5b2113fd35a	8255	Pišece
00050000-5665-abb4-a6e3-adc7dcdbd041	6257	Pivka
00050000-5665-abb4-70b7-12c25a4d69e2	6232	Planina
00050000-5665-abb4-5eca-9681c8d8fb34	3225	Planina pri Sevnici
00050000-5665-abb4-491f-251b2961b34a	6276	Pobegi
00050000-5665-abb4-9b80-260a08f6555e	8312	Podbočje
00050000-5665-abb4-96be-fd43b13fe652	5243	Podbrdo
00050000-5665-abb4-a0e0-967370f99436	3254	Podčetrtek
00050000-5665-abb4-a7e3-7910b0248060	2273	Podgorci
00050000-5665-abb4-ec80-00347fc58b30	6216	Podgorje
00050000-5665-abb4-5eb2-d01549f796ec	2381	Podgorje pri Slovenj Gradcu
00050000-5665-abb4-7b53-62ad9c7c93ba	6244	Podgrad
00050000-5665-abb4-c708-ed7783fe5428	1414	Podkum
00050000-5665-abb4-8447-3459f9a8acc6	2286	Podlehnik
00050000-5665-abb4-6dc8-9bd1c0cffe39	5272	Podnanos
00050000-5665-abb4-2d84-74afe0fc6350	4244	Podnart
00050000-5665-abb4-0816-2cdb9745de72	3241	Podplat
00050000-5665-abb4-8105-aca431484021	3257	Podsreda
00050000-5665-abb4-6244-97a06d98d65f	2363	Podvelka
00050000-5665-abb4-d335-e045cf8c76db	2208	Pohorje
00050000-5665-abb4-55f9-0ee3080210f8	2257	Polenšak
00050000-5665-abb4-3ad2-6aa522bbacd7	1355	Polhov Gradec
00050000-5665-abb4-6e9e-2cf93f268838	4223	Poljane nad Škofjo Loko
00050000-5665-abb4-d099-ece89ca35ffb	2319	Poljčane
00050000-5665-abb4-80bb-66e5eeabfe9b	1272	Polšnik
00050000-5665-abb4-cad1-85579f0de43a	3313	Polzela
00050000-5665-abb4-9b71-dd662d10f205	3232	Ponikva
00050000-5665-abb4-0083-18fe7f59bca4	6320	Portorož/Portorose
00050000-5665-abb4-e3f8-cb05b48f8e74	6230	Postojna
00050000-5665-abb4-8549-10d324a371fd	2331	Pragersko
00050000-5665-abb4-16cf-13fa1e69c3f6	3312	Prebold
00050000-5665-abb4-da87-ae0cf9e16047	4205	Preddvor
00050000-5665-abb4-147c-2526c47ca6db	6255	Prem
00050000-5665-abb4-0ed3-423da9325935	1352	Preserje
00050000-5665-abb4-2253-7dedbf9f4203	6258	Prestranek
00050000-5665-abb4-402b-a98cd68c9147	2391	Prevalje
00050000-5665-abb4-0cb5-395263437edb	3262	Prevorje
00050000-5665-abb4-965b-9016933b6a70	1276	Primskovo 
00050000-5665-abb4-63d3-ec279f03e44a	3253	Pristava pri Mestinju
00050000-5665-abb4-aada-2cbce1bb37d6	9207	Prosenjakovci/Partosfalva
00050000-5665-abb4-260d-2f246331a04c	5297	Prvačina
00050000-5665-abb4-60e3-0573db7a2f27	2250	Ptuj
00050000-5665-abb4-f2f1-bc704a4694c3	2323	Ptujska Gora
00050000-5665-abb4-7a00-ed004aa7be45	9201	Puconci
00050000-5665-abb4-d2ac-8387e61be3c0	2327	Rače
00050000-5665-abb4-deac-4457763096af	1433	Radeče
00050000-5665-abb4-5bbd-bf1984482734	9252	Radenci
00050000-5665-abb4-0935-db2421e132f2	2360	Radlje ob Dravi
00050000-5665-abb4-c739-351f77013d5d	1235	Radomlje
00050000-5665-abb4-8e5a-6f605f53774a	4240	Radovljica
00050000-5665-abb4-01a8-f07d695dfb50	8274	Raka
00050000-5665-abb4-7ad2-a8d4a03de37b	1381	Rakek
00050000-5665-abb4-ed86-a8a32ac6ba2f	4283	Rateče - Planica
00050000-5665-abb4-c2a6-d6c799396089	2390	Ravne na Koroškem
00050000-5665-abb4-ff19-5125249f4eb2	9246	Razkrižje
00050000-5665-abb4-f82c-d452ba5e0c10	3332	Rečica ob Savinji
00050000-5665-abb4-bff0-f79d607cd89f	5292	Renče
00050000-5665-abb4-dbe9-a446b88b31e6	1310	Ribnica
00050000-5665-abb4-2b88-6d0a6c7c31c3	2364	Ribnica na Pohorju
00050000-5665-abb4-a55b-9a90308f0d72	3272	Rimske Toplice
00050000-5665-abb4-45c9-eb89f393e18e	1314	Rob
00050000-5665-abb4-4cda-e0ea2a126b9f	5215	Ročinj
00050000-5665-abb4-e2f5-f813334ffc98	3250	Rogaška Slatina
00050000-5665-abb4-a65a-48c46bd6c501	9262	Rogašovci
00050000-5665-abb4-17b5-e77a286bf541	3252	Rogatec
00050000-5665-abb4-58f8-980d97cb89e5	1373	Rovte
00050000-5665-abb4-7c5c-34354339ac8f	2342	Ruše
00050000-5665-abb4-98d5-c717197e051d	1282	Sava
00050000-5665-abb4-08d8-5874efa6024a	6333	Sečovlje/Sicciole
00050000-5665-abb4-0376-3c3ef36b3504	4227	Selca
00050000-5665-abb4-3eb8-e4fc65ba0369	2352	Selnica ob Dravi
00050000-5665-abb4-11c1-77f36b6600b1	8333	Semič
00050000-5665-abb4-6268-0b3265a21e9a	8281	Senovo
00050000-5665-abb4-23b2-a2ed3cc91bbc	6224	Senožeče
00050000-5665-abb4-66a5-cf8115c02f66	8290	Sevnica
00050000-5665-abb4-5c30-6bb93e336efe	6210	Sežana
00050000-5665-abb4-2fa9-eb5557bb5d9c	2214	Sladki Vrh
00050000-5665-abb4-2f04-4d7863178a3e	5283	Slap ob Idrijci
00050000-5665-abb4-cb57-e614ffc3b9a6	2380	Slovenj Gradec
00050000-5665-abb4-af57-b37cf1015a12	2310	Slovenska Bistrica
00050000-5665-abb4-58e3-fd4db3f30f17	3210	Slovenske Konjice
00050000-5665-abb4-582b-4422d4ec0593	1216	Smlednik
00050000-5665-abb4-10ca-46f724e63009	5232	Soča
00050000-5665-abb4-d970-96b47af91b6c	1317	Sodražica
00050000-5665-abb4-a43c-e11e5fb55166	3335	Solčava
00050000-5665-abb4-9c60-6334b9d63184	5250	Solkan
00050000-5665-abb4-ce45-2da588e5fb05	4229	Sorica
00050000-5665-abb4-b79f-e4af5342801e	4225	Sovodenj
00050000-5665-abb4-fb70-b728732cdbee	5281	Spodnja Idrija
00050000-5665-abb4-c8b6-d1ae38157814	2241	Spodnji Duplek
00050000-5665-abb4-10cc-ddd90c103369	9245	Spodnji Ivanjci
00050000-5665-abb4-938b-3fff617a63ac	2277	Središče ob Dravi
00050000-5665-abb4-3cce-80ee34397826	4267	Srednja vas v Bohinju
00050000-5665-abb4-54bf-f47463906ca2	8256	Sromlje 
00050000-5665-abb4-59ec-ad017ad1a824	5224	Srpenica
00050000-5665-abb4-46f8-40c1bc17e46c	1242	Stahovica
00050000-5665-abb4-bf25-d8d5a8930aea	1332	Stara Cerkev
00050000-5665-abb4-50c4-cb57b442774a	8342	Stari trg ob Kolpi
00050000-5665-abb4-cf93-ec5ba971963e	1386	Stari trg pri Ložu
00050000-5665-abb4-88a9-900e32ee162a	2205	Starše
00050000-5665-abb4-6503-dcde870dbfa1	2289	Stoperce
00050000-5665-abb4-5e3c-64ab9971182d	8322	Stopiče
00050000-5665-abb4-b0c6-c52d6e4be0a0	3206	Stranice
00050000-5665-abb4-a331-a074ebb94aa9	8351	Straža
00050000-5665-abb4-ad5b-20ce8b3e466a	1313	Struge
00050000-5665-abb4-fa45-692ddfd01515	8293	Studenec
00050000-5665-abb4-a186-63fca59306fe	8331	Suhor
00050000-5665-abb4-41d9-c355a66c5436	2233	Sv. Ana v Slovenskih goricah
00050000-5665-abb4-17cf-085278407c5a	2235	Sv. Trojica v Slovenskih goricah
00050000-5665-abb4-668d-d10577f1b3ae	2353	Sveti Duh na Ostrem Vrhu
00050000-5665-abb4-ae96-1ea4f0da987f	9244	Sveti Jurij ob Ščavnici
00050000-5665-abb4-1afe-baad343cff58	3264	Sveti Štefan
00050000-5665-abb4-22db-04e2eb72f74f	2258	Sveti Tomaž
00050000-5665-abb4-1fc5-36a1ea4686a9	9204	Šalovci
00050000-5665-abb4-2fa0-78d306b668a7	5261	Šempas
00050000-5665-abb4-df22-812aa2a1671e	5290	Šempeter pri Gorici
00050000-5665-abb4-1b3c-ff7df1ec62cd	3311	Šempeter v Savinjski dolini
00050000-5665-abb4-4a26-56ca09f6e5eb	4208	Šenčur
00050000-5665-abb4-53a7-a2ff655e0422	2212	Šentilj v Slovenskih goricah
00050000-5665-abb4-f248-ca297ae99737	8297	Šentjanž
00050000-5665-abb4-3d88-a31ce96b0001	2373	Šentjanž pri Dravogradu
00050000-5665-abb4-c79e-a55dfcbb1494	8310	Šentjernej
00050000-5665-abb4-344e-c7f3b2a5e3c9	3230	Šentjur
00050000-5665-abb4-eaaa-c9fd34837228	3271	Šentrupert
00050000-5665-abb4-86b4-ad00448924d4	8232	Šentrupert
00050000-5665-abb4-357f-f427ae1a7f49	1296	Šentvid pri Stični
00050000-5665-abb4-e83c-e7ac15d06ab7	8275	Škocjan
00050000-5665-abb4-9865-e2fe18a16378	6281	Škofije
00050000-5665-abb4-b887-00c30bb76910	4220	Škofja Loka
00050000-5665-abb4-fa2f-d394779fbf9d	3211	Škofja vas
00050000-5665-abb4-82ac-de127b398726	1291	Škofljica
00050000-5665-abb4-1d50-66df15c4ec6c	6274	Šmarje
00050000-5665-abb4-ada2-1ed7574d4245	1293	Šmarje - Sap
00050000-5665-abb4-acb5-19e453b68974	3240	Šmarje pri Jelšah
00050000-5665-abb4-29bf-70511f9bd99f	8220	Šmarješke Toplice
00050000-5665-abb4-54e9-30277c29acd4	2315	Šmartno na Pohorju
00050000-5665-abb4-a1b3-a3656367632a	3341	Šmartno ob Dreti
00050000-5665-abb4-c35d-5e04ea228cc6	3327	Šmartno ob Paki
00050000-5665-abb4-0d34-6d30160d7922	1275	Šmartno pri Litiji
00050000-5665-abb4-fce8-e5ef0bf75c5a	2383	Šmartno pri Slovenj Gradcu
00050000-5665-abb4-356e-e9398ded4904	3201	Šmartno v Rožni dolini
00050000-5665-abb4-b703-491591081a58	3325	Šoštanj
00050000-5665-abb4-a3a4-f21a03e15e9e	6222	Štanjel
00050000-5665-abb4-4848-02e0276dbea3	3220	Štore
00050000-5665-abb4-b800-681516021ca9	3304	Tabor
00050000-5665-abb4-ac6c-374478eef205	3221	Teharje
00050000-5665-abb4-4a2f-c6d52cbe7d9a	9251	Tišina
00050000-5665-abb4-747b-c7798678fc94	5220	Tolmin
00050000-5665-abb4-d018-3f4ae01c8c46	3326	Topolšica
00050000-5665-abb4-7c3a-6084c0643239	2371	Trbonje
00050000-5665-abb4-3f9a-c6803298bcc5	1420	Trbovlje
00050000-5665-abb4-8641-17ca3f4236cf	8231	Trebelno 
00050000-5665-abb4-95ed-eea562272b27	8210	Trebnje
00050000-5665-abb4-8cf7-60d6658534b1	5252	Trnovo pri Gorici
00050000-5665-abb4-495d-70dcc3cc8b43	2254	Trnovska vas
00050000-5665-abb4-e3d0-11afdcc22177	1222	Trojane
00050000-5665-abb4-b12e-b0cb16aea3b8	1236	Trzin
00050000-5665-abb4-7b68-056c43767b7c	4290	Tržič
00050000-5665-abb4-c098-5fd370dfa166	8295	Tržišče
00050000-5665-abb4-a2d7-b2a21b84bd42	1311	Turjak
00050000-5665-abb4-863c-aaaeb123cb12	9224	Turnišče
00050000-5665-abb4-afc2-7f3145715d4b	8323	Uršna sela
00050000-5665-abb4-a159-702932c7b4b6	1252	Vače
00050000-5665-abb4-a320-496039a1174c	3320	Velenje 
00050000-5665-abb4-3a9d-55585be07ecc	3322	Velenje - poštni predali
00050000-5665-abb4-d50e-7c1f31e86425	8212	Velika Loka
00050000-5665-abb4-20e5-469469bad65b	2274	Velika Nedelja
00050000-5665-abb4-b1fe-7f2ad270e00f	9225	Velika Polana
00050000-5665-abb4-3f0b-ee29a43ed63e	1315	Velike Lašče
00050000-5665-abb4-a09f-9f7139980e49	8213	Veliki Gaber
00050000-5665-abb4-d00c-148df4896e9a	9241	Veržej
00050000-5665-abb4-9f2d-8d08bd84619c	1312	Videm - Dobrepolje
00050000-5665-abb4-531f-3608c74ebd0f	2284	Videm pri Ptuju
00050000-5665-abb4-3979-fe10ee1bd9d8	8344	Vinica
00050000-5665-abb4-b77d-a513d4140d45	5271	Vipava
00050000-5665-abb4-b163-a42f29573286	4212	Visoko
00050000-5665-abb4-ea70-f9c399ce59e4	1294	Višnja Gora
00050000-5665-abb4-8dc7-0afd27ff4284	3205	Vitanje
00050000-5665-abb4-ff5d-051742b0518b	2255	Vitomarci
00050000-5665-abb4-c136-b04ca54e57ff	1217	Vodice
00050000-5665-abb4-5d19-6ed6bc049c8e	3212	Vojnik\t
00050000-5665-abb4-2d7c-2060ea34c302	5293	Volčja Draga
00050000-5665-abb4-58fe-d1b06a09f262	2232	Voličina
00050000-5665-abb4-320a-96ec402449e2	3305	Vransko
00050000-5665-abb4-e734-eeec9c24fada	6217	Vremski Britof
00050000-5665-abb4-84b5-851d09e37c16	1360	Vrhnika
00050000-5665-abb4-27e6-36871c897e1b	2365	Vuhred
00050000-5665-abb4-4263-4aa9b3d3e5e3	2367	Vuzenica
00050000-5665-abb4-4676-3fa5923bfba4	8292	Zabukovje 
00050000-5665-abb4-373f-8e01c4fdd98c	1410	Zagorje ob Savi
00050000-5665-abb4-e714-321cfe03195f	1303	Zagradec
00050000-5665-abb4-fef7-5347820a6adc	2283	Zavrč
00050000-5665-abb4-bb3f-0aa37d324487	8272	Zdole 
00050000-5665-abb4-45d3-0a492dfff20c	4201	Zgornja Besnica
00050000-5665-abb4-e523-05b06b175368	2242	Zgornja Korena
00050000-5665-abb4-d6e2-dc0fc9a98178	2201	Zgornja Kungota
00050000-5665-abb4-dd90-aad3334220c2	2316	Zgornja Ložnica
00050000-5665-abb4-9b42-d655a89088ef	2314	Zgornja Polskava
00050000-5665-abb4-b944-e8a78d552e7a	2213	Zgornja Velka
00050000-5665-abb4-c92e-a5b9aa123e01	4247	Zgornje Gorje
00050000-5665-abb4-194f-b2bb7bc08a64	4206	Zgornje Jezersko
00050000-5665-abb4-282e-2bbb64de6c34	2285	Zgornji Leskovec
00050000-5665-abb4-962b-8d874cb1187e	1432	Zidani Most
00050000-5665-abb4-0bad-eaebe91308ea	3214	Zreče
00050000-5665-abb4-d447-507dbb7ff16d	4209	Žabnica
00050000-5665-abb4-aca9-078f3e6b11d2	3310	Žalec
00050000-5665-abb4-d1ae-b7d5ca13e36f	4228	Železniki
00050000-5665-abb4-c8c4-f965024e706b	2287	Žetale
00050000-5665-abb4-5a24-3120f89e2ba9	4226	Žiri
00050000-5665-abb4-1617-aa6713562663	4274	Žirovnica
00050000-5665-abb4-23f4-6ba357a38c90	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 31123634)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 31123209)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 31122957)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5665-abb7-a3f9-74a946748a91	00080000-5665-abb7-5a4e-a9672f612b28	\N	00040000-5665-abb5-899b-130de6f8478a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5665-abb7-2d99-cd6993f51349	00080000-5665-abb7-5a4e-a9672f612b28	\N	00040000-5665-abb5-899b-130de6f8478a	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5665-abb7-eeed-666bcb44206c	00080000-5665-abb7-00b1-a8fb8dbf481a	\N	00040000-5665-abb5-899b-130de6f8478a	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 31123101)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5665-abb5-13dd-f8de1de7160e	novo leto	1	1	\N	t
00430000-5665-abb5-89fa-f398990bc830	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5665-abb5-1564-8b051a329153	dan upora proti okupatorju	27	4	\N	t
00430000-5665-abb5-a3a1-f3dbecc106ee	praznik dela	1	5	\N	t
00430000-5665-abb5-360b-8e7dc6a098a5	praznik dela	2	5	\N	t
00430000-5665-abb5-d048-4a3e348647e6	dan Primoža Trubarja	8	6	\N	f
00430000-5665-abb5-529f-d6fbdfcb6b1e	dan državnosti	25	6	\N	t
00430000-5665-abb5-cca4-f9d3aa169461	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5665-abb5-a33d-1aa5849a9662	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5665-abb5-2c23-63e8ed488f5e	dan suverenosti	25	10	\N	f
00430000-5665-abb5-fa8c-fdca37be0a09	dan spomina na mrtve	1	11	\N	t
00430000-5665-abb5-1e76-483d465c9659	dan Rudolfa Maistra	23	11	\N	f
00430000-5665-abb5-9ce4-7e51929531f1	božič	25	12	\N	t
00430000-5665-abb5-8ca0-4755ea0afd39	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5665-abb5-45d5-9af60844e5c1	Marijino vnebovzetje	15	8	\N	t
00430000-5665-abb5-60e9-83fc075027a7	dan reformacije	31	10	\N	t
00430000-5665-abb5-40da-643ef6dedf6c	velikonočna nedelja	27	3	2016	t
00430000-5665-abb5-61b9-e50a9b28cfc4	velikonočna nedelja	16	4	2017	t
00430000-5665-abb5-bd98-ef153cf3cecc	velikonočna nedelja	1	4	2018	t
00430000-5665-abb5-49a1-80d38d1e0fd0	velikonočna nedelja	21	4	2019	t
00430000-5665-abb5-5bde-f59bf23b7f57	velikonočna nedelja	12	4	2020	t
00430000-5665-abb5-e27a-32dfc41bd4a1	velikonočna nedelja	4	4	2021	t
00430000-5665-abb5-3063-0d51e5231d2a	velikonočna nedelja	17	4	2022	t
00430000-5665-abb5-451d-15dc33553fdd	velikonočna nedelja	9	4	2023	t
00430000-5665-abb5-7246-e7c4b98c9110	velikonočna nedelja	31	3	2024	t
00430000-5665-abb5-40a6-11c91a08ce29	velikonočna nedelja	20	4	2025	t
00430000-5665-abb5-731a-f16d950eebb7	velikonočna nedelja	5	4	2026	t
00430000-5665-abb5-684d-72388c4cc773	velikonočna nedelja	28	3	2027	t
00430000-5665-abb5-1e03-e5dfae9067cc	velikonočna nedelja	16	4	2028	t
00430000-5665-abb5-5a9b-1ae253e1a616	velikonočna nedelja	1	4	2029	t
00430000-5665-abb5-784b-3af8f7fdb1b6	velikonočna nedelja	21	4	2030	t
00430000-5665-abb5-0a11-e05dc9616c18	velikonočni ponedeljek	28	3	2016	t
00430000-5665-abb5-e49f-0943184a8161	velikonočni ponedeljek	17	4	2017	t
00430000-5665-abb5-e1fe-8be0eab6f724	velikonočni ponedeljek	2	4	2018	t
00430000-5665-abb5-f7d0-79887610e13d	velikonočni ponedeljek	22	4	2019	t
00430000-5665-abb5-8103-787befcc7c77	velikonočni ponedeljek	13	4	2020	t
00430000-5665-abb5-fe25-1a328e7a9504	velikonočni ponedeljek	5	4	2021	t
00430000-5665-abb5-6a85-13d31a59227c	velikonočni ponedeljek	18	4	2022	t
00430000-5665-abb5-4e23-74fdade5bfff	velikonočni ponedeljek	10	4	2023	t
00430000-5665-abb5-5174-a0188f3db5d4	velikonočni ponedeljek	1	4	2024	t
00430000-5665-abb5-c06c-3f0335a4ab3e	velikonočni ponedeljek	21	4	2025	t
00430000-5665-abb5-e776-c653245d7c0b	velikonočni ponedeljek	6	4	2026	t
00430000-5665-abb5-77ba-c9ed23f8da44	velikonočni ponedeljek	29	3	2027	t
00430000-5665-abb5-3563-571f1a61d01f	velikonočni ponedeljek	17	4	2028	t
00430000-5665-abb5-76d9-d40c0addc2e0	velikonočni ponedeljek	2	4	2029	t
00430000-5665-abb5-a151-5aec75d50e0e	velikonočni ponedeljek	22	4	2030	t
00430000-5665-abb5-fbf0-fd45e5cbd87b	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5665-abb5-f934-d5807e011781	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5665-abb5-639c-14e663bf03bd	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5665-abb5-2314-7257f6f0e47f	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5665-abb5-592f-fcd159045a89	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5665-abb5-7890-4306bd8b0db6	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5665-abb5-ca51-bffbc6edcf4e	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5665-abb5-d548-fe5ac9c4193f	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5665-abb5-61bb-9ddd3184e2a4	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5665-abb5-7035-dce1f41066d5	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5665-abb5-a2b9-e384815c86b7	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5665-abb5-bad2-88873cee3bd4	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5665-abb5-f6d8-cfdd312808f6	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5665-abb5-8225-591d372d234c	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5665-abb5-1940-6e3c0eff236b	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 31123061)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 31123073)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 31123221)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 31123648)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 31123658)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5665-abb7-683b-2aa2f55d2f11	00080000-5665-abb7-058d-258fb54e3c32	0987	AK
00190000-5665-abb7-73d8-8fdf1924dcfb	00080000-5665-abb7-00b1-a8fb8dbf481a	0989	AK
00190000-5665-abb7-3a08-8aa6f0a149e2	00080000-5665-abb7-9a38-cbe4a1f9a469	0986	AK
00190000-5665-abb7-39b8-c1219fb8a8d0	00080000-5665-abb7-3e9b-1150cfe78978	0984	AK
00190000-5665-abb7-87ae-d4b4427dccd5	00080000-5665-abb7-a274-3b54af4f1d93	0983	AK
00190000-5665-abb7-e9df-9aeb28454705	00080000-5665-abb7-53fe-2e03b7ac3ff7	0982	AK
00190000-5665-abb9-febc-7cb648a85422	00080000-5665-abb9-2dd3-d495f0e5c7d5	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 31123557)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5665-abb8-a01b-0de67617dd86	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 31123666)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 31123250)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5665-abb7-0ee4-6431330fa87f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5665-abb7-b82c-6c2e438c12a1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5665-abb7-4a7b-6eb5b6da5fba	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5665-abb7-283d-39ec376fc38b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5665-abb7-73ea-ad86dc716e8b	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5665-abb7-1e47-a739d4f7dd25	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5665-abb7-d119-e02958b15724	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 31123194)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 31123184)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 31123395)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 31123325)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 31123035)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 31122797)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5665-abb9-2dd3-d495f0e5c7d5	00010000-5665-abb5-5ccf-731fef3808fe	2015-12-07 16:54:33	INS	a:0:{}
2	App\\Entity\\Option	00000000-5665-abb9-0d20-e4f5a5c4c052	00010000-5665-abb5-5ccf-731fef3808fe	2015-12-07 16:54:33	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5665-abb9-febc-7cb648a85422	00010000-5665-abb5-5ccf-731fef3808fe	2015-12-07 16:54:33	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 31123263)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 31122835)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5665-abb5-bf3c-aaa0a124953a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5665-abb5-cf62-3b2005a7b746	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5665-abb5-2846-ec366e58bf15	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5665-abb5-1c95-8850defa1f0d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5665-abb5-c11e-812eda229497	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5665-abb5-6aa0-f3611b62ee23	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5665-abb5-74fa-6e2ccc67bd80	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5665-abb5-3f11-41df529619b9	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5665-abb5-5b40-281a127c87f4	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-abb5-364c-e5a54c2f16c4	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-abb5-fddd-315f48741025	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-abb5-dd47-3d37709a572d	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-abb5-b7c5-d47ed0068432	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5665-abb5-ecfd-269582aa4f4a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5665-abb5-14ec-083b747a552c	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5665-abb5-6772-a63a076c6850	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5665-abb5-1a1b-a0a5830e904e	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5665-abb5-df37-b2f1fe1d875c	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5665-abb5-7249-464875168544	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5665-abb5-7103-43428903f318	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5665-abb5-4a76-86cd58d663c4	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5665-abb5-0dc1-9f9b022dc4fc	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5665-abb5-4703-f5a8ebf21fc0	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5665-abb5-ef41-fdff29da86d7	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5665-abb5-d632-b9e92cd565ef	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5665-abb5-d001-1e87058cb444	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5665-abb5-7f35-94270502fa5a	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5665-abb5-d61c-4daa320dff17	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5665-abb5-eae0-e2137aebec7e	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5665-abb5-01e0-2d179a3807d3	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5665-abb5-ed4b-111483a63e16	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5665-abb5-c920-8a40c1b6dee5	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5665-abb5-2d28-6ba6969e00e2	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5665-abb5-3b5f-772d67c993df	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5665-abb5-37be-93305b12e29a	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5665-abb5-2617-d64e58137804	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5665-abb5-a587-33f4a11b98d6	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5665-abb5-21bc-44f904ab3517	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5665-abb5-c242-7bd3296ed15f	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5665-abb5-f9c4-755bac3dcdf2	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5665-abb5-fcd9-2ed2d54280c9	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5665-abb5-42cd-c06f24a667a6	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5665-abb5-b69a-80329980f79b	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5665-abb5-ffde-e56bc4ca5dfa	arhivar	arhivar	t
00020000-5665-abb7-991a-4e1bc0043daa	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5665-abb7-5d3f-671ceab558a6	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-2c27-19e6e439d4d6	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-3c0d-4b606c16658d	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-1aae-768bc76e2530	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-338a-f5d0e3d22357	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-ed53-a6da93638f49	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-7921-2b240abcecb8	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-b6c9-7bd0763806e0	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-0f66-51426f2ebc9a	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-6837-a2984b5dfc77	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-2bb6-38e794826705	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-745f-a1893ea7446a	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-8696-a243c37b0357	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-8e4d-34ef980eaa2e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-44d1-a425ff350c9a	Oseba-vse	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-6d3f-fed935762c8f	Oseba-readVse	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-824a-e89810f8ca5a	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-040b-14965a8267bc	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-5c27-1932b41e0dd6	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5665-abb7-07e4-612868903b35	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-4150-043084e6fc88	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-1eed-3651c46d1de2	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-d67b-0627d8750331	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-d2fc-d303b3a7aab0	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-6fc5-5c309cabfe9c	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-a19d-c390c93ede41	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-0d10-736f59348dbd	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5665-abb7-1872-ed57234f3641	Zaposlitev-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 31122819)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5665-abb5-ed41-870e0deb772b	00020000-5665-abb5-2846-ec366e58bf15
00010000-5665-abb5-5ccf-731fef3808fe	00020000-5665-abb5-2846-ec366e58bf15
00010000-5665-abb7-a878-ccc6cf8138a5	00020000-5665-abb7-991a-4e1bc0043daa
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-5d3f-671ceab558a6
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-338a-f5d0e3d22357
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-0f66-51426f2ebc9a
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-2bb6-38e794826705
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-8696-a243c37b0357
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-040b-14965a8267bc
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-3c0d-4b606c16658d
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-07e4-612868903b35
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-d67b-0627d8750331
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-6fc5-5c309cabfe9c
00010000-5665-abb7-b2c5-43140d39a24e	00020000-5665-abb7-0d10-736f59348dbd
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-5d3f-671ceab558a6
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-2c27-19e6e439d4d6
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-3c0d-4b606c16658d
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-1aae-768bc76e2530
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-8696-a243c37b0357
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-6d3f-fed935762c8f
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-07e4-612868903b35
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-d67b-0627d8750331
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-6fc5-5c309cabfe9c
00010000-5665-abb7-0441-1a04e181f361	00020000-5665-abb7-0d10-736f59348dbd
00010000-5665-abb7-5705-c3b9700b87a1	00020000-5665-abb7-5d3f-671ceab558a6
00010000-5665-abb7-5705-c3b9700b87a1	00020000-5665-abb7-2c27-19e6e439d4d6
00010000-5665-abb7-5705-c3b9700b87a1	00020000-5665-abb7-3c0d-4b606c16658d
00010000-5665-abb7-5705-c3b9700b87a1	00020000-5665-abb7-1aae-768bc76e2530
00010000-5665-abb7-5705-c3b9700b87a1	00020000-5665-abb7-2bb6-38e794826705
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-2c27-19e6e439d4d6
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-ed53-a6da93638f49
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-6837-a2984b5dfc77
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-745f-a1893ea7446a
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-2bb6-38e794826705
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-824a-e89810f8ca5a
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-8696-a243c37b0357
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-8e4d-34ef980eaa2e
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-07e4-612868903b35
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-4150-043084e6fc88
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-d67b-0627d8750331
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-d2fc-d303b3a7aab0
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-6fc5-5c309cabfe9c
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-a19d-c390c93ede41
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-0d10-736f59348dbd
00010000-5665-abb7-8a4d-959991e573a7	00020000-5665-abb7-1872-ed57234f3641
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-2c27-19e6e439d4d6
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-ed53-a6da93638f49
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-b6c9-7bd0763806e0
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-6837-a2984b5dfc77
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-745f-a1893ea7446a
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-2bb6-38e794826705
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-824a-e89810f8ca5a
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-8696-a243c37b0357
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-8e4d-34ef980eaa2e
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-44d1-a425ff350c9a
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-07e4-612868903b35
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-4150-043084e6fc88
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-1eed-3651c46d1de2
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-d67b-0627d8750331
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-d2fc-d303b3a7aab0
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-6fc5-5c309cabfe9c
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-a19d-c390c93ede41
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-0d10-736f59348dbd
00010000-5665-abb7-219d-e82dd15c2815	00020000-5665-abb7-1872-ed57234f3641
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-2c27-19e6e439d4d6
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-3c0d-4b606c16658d
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-ed53-a6da93638f49
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-7921-2b240abcecb8
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-b6c9-7bd0763806e0
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-338a-f5d0e3d22357
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-6837-a2984b5dfc77
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-745f-a1893ea7446a
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-2bb6-38e794826705
00010000-5665-abb7-2e8c-06c61ffe7061	00020000-5665-abb7-824a-e89810f8ca5a
00010000-5665-abb7-9614-fbe42125ddeb	00020000-5665-abb7-5d3f-671ceab558a6
00010000-5665-abb7-9614-fbe42125ddeb	00020000-5665-abb7-1aae-768bc76e2530
00010000-5665-abb7-9614-fbe42125ddeb	00020000-5665-abb7-338a-f5d0e3d22357
00010000-5665-abb7-9614-fbe42125ddeb	00020000-5665-abb7-0f66-51426f2ebc9a
00010000-5665-abb7-9614-fbe42125ddeb	00020000-5665-abb7-2bb6-38e794826705
00010000-5665-abb7-9614-fbe42125ddeb	00020000-5665-abb7-8696-a243c37b0357
00010000-5665-abb7-9614-fbe42125ddeb	00020000-5665-abb7-040b-14965a8267bc
00010000-5665-abb7-74bb-4d5d39424013	00020000-5665-abb7-5c27-1932b41e0dd6
\.


--
-- TOC entry 3146 (class 0 OID 31123277)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 31123215)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 31123161)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5665-abb7-15e0-13ef680c988d	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5665-abb7-75ff-dd5a1f1df28a	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5665-abb7-5801-02e220cdfa4c	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 31122784)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5665-abb5-c1d2-dc044f890fde	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5665-abb5-7d1a-1cc460a886e9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5665-abb5-5b2f-91677567e6e7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5665-abb5-9654-271226901c41	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5665-abb5-61ba-13558f4d0da7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 31122776)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5665-abb5-9ef2-046b521bdcc5	00230000-5665-abb5-9654-271226901c41	popa
00240000-5665-abb5-ef7f-5abc0c6f8548	00230000-5665-abb5-9654-271226901c41	oseba
00240000-5665-abb5-be25-59603e65ef0b	00230000-5665-abb5-9654-271226901c41	tippopa
00240000-5665-abb5-8bac-9347ac93a389	00230000-5665-abb5-9654-271226901c41	organizacijskaenota
00240000-5665-abb5-9b42-bb86153ebaac	00230000-5665-abb5-9654-271226901c41	sezona
00240000-5665-abb5-3ece-0c6be4c5058d	00230000-5665-abb5-9654-271226901c41	tipvaje
00240000-5665-abb5-d7ba-0041e36f326b	00230000-5665-abb5-7d1a-1cc460a886e9	prostor
00240000-5665-abb5-5172-7ce7a346ce38	00230000-5665-abb5-9654-271226901c41	besedilo
00240000-5665-abb5-6496-d6011980dba6	00230000-5665-abb5-9654-271226901c41	uprizoritev
00240000-5665-abb5-9cce-f385f3f47f38	00230000-5665-abb5-9654-271226901c41	funkcija
00240000-5665-abb5-faa9-10af25ba752f	00230000-5665-abb5-9654-271226901c41	tipfunkcije
00240000-5665-abb5-5771-0442e962427e	00230000-5665-abb5-9654-271226901c41	alternacija
00240000-5665-abb5-299d-f7ed83047dac	00230000-5665-abb5-c1d2-dc044f890fde	pogodba
00240000-5665-abb5-33aa-b17f081cc8b7	00230000-5665-abb5-9654-271226901c41	zaposlitev
00240000-5665-abb5-c63d-05937582a2dd	00230000-5665-abb5-9654-271226901c41	zvrstuprizoritve
00240000-5665-abb5-354e-c8775d28df4c	00230000-5665-abb5-c1d2-dc044f890fde	programdela
00240000-5665-abb5-7130-745ebe162ad0	00230000-5665-abb5-9654-271226901c41	zapis
\.


--
-- TOC entry 3095 (class 0 OID 31122771)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d1b44a35-ff80-4117-8562-358389c44ed2	00240000-5665-abb5-9ef2-046b521bdcc5	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 31123342)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5665-abb8-5260-5c841b983bc7	000e0000-5665-abb7-f766-894ffcdb377e	00080000-5665-abb7-5a4e-a9672f612b28	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5665-abb5-f14b-ad0401419958
00270000-5665-abb8-0e63-816ceff17539	000e0000-5665-abb7-f766-894ffcdb377e	00080000-5665-abb7-5a4e-a9672f612b28	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5665-abb5-f14b-ad0401419958
\.


--
-- TOC entry 3111 (class 0 OID 31122919)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 31123171)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5665-abb8-71c6-8b5b7bb5c9f6	00180000-5665-abb8-84b1-cf672979b137	000c0000-5665-abb8-17a4-a076f3415a67	00090000-5665-abb7-f6f9-689cd3d891df	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-abb8-1b0b-cdcaebf8f49b	00180000-5665-abb8-84b1-cf672979b137	000c0000-5665-abb8-8ea8-09fb1cb0efbc	00090000-5665-abb7-e284-2759eff8abe6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-abb8-02a8-8f45c0da8fe8	00180000-5665-abb8-84b1-cf672979b137	000c0000-5665-abb8-0ba7-e11ca88a26c5	00090000-5665-abb7-9a2e-7dac093a6dab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-abb8-72e0-a10d7db30d66	00180000-5665-abb8-84b1-cf672979b137	000c0000-5665-abb8-8112-f80c4a9bf9b0	00090000-5665-abb7-cdfd-6ca562d7e266	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-abb8-c4ae-6b59200801c5	00180000-5665-abb8-84b1-cf672979b137	000c0000-5665-abb8-f20d-cd5bb774dd23	00090000-5665-abb7-4464-b4c3bca5a6fd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-abb8-345a-1dae2ba0d1df	00180000-5665-abb8-e673-529ea5a79df6	\N	00090000-5665-abb7-4464-b4c3bca5a6fd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5665-abb8-80a4-b6b22e389e8d	00180000-5665-abb8-e673-529ea5a79df6	\N	00090000-5665-abb7-e284-2759eff8abe6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 31123383)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5665-abb5-1e32-698923e172c7	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5665-abb5-1cfa-384bee6de08b	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5665-abb5-934b-eb650ffe8fd7	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5665-abb5-dfce-6bd964c5913f	04	Režija	Režija	Režija	umetnik	30
000f0000-5665-abb5-eddc-5c10d8b16f45	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5665-abb5-8a35-013f08479cc1	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5665-abb5-73db-81655dc9def0	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5665-abb5-899f-073a523c236c	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5665-abb5-7230-0d41793c8c07	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5665-abb5-89c6-ec8012c71373	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5665-abb5-7ad2-8734dc42457b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5665-abb5-acc6-a0a8cdd2c364	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5665-abb5-ff67-a428669bd824	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5665-abb5-1bfb-c347268d5e58	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5665-abb5-5727-7c1afb49ad5e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5665-abb5-9c68-b20b9760200c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5665-abb5-a97d-520da139fc3d	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5665-abb5-1880-9cf2d905a76a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 31122870)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5665-abb7-3ba9-8215f9ba1217	0001	šola	osnovna ali srednja šola
00400000-5665-abb7-126d-a3e4258b0f96	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5665-abb7-f356-bcce5318521f	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 31123678)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5665-abb5-1bc3-e9336ed199ef	01	Velika predstava	f	1.00	1.00
002b0000-5665-abb5-9c47-d7f909005f0a	02	Mala predstava	f	0.50	0.50
002b0000-5665-abb5-6240-abb85fde9c43	03	Mala koprodukcija	t	0.40	1.00
002b0000-5665-abb5-1efc-6d984d2e51f7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5665-abb5-d281-4bd19bb63130	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 31123151)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5665-abb5-c2b7-2476256741ef	0001	prva vaja	prva vaja
00420000-5665-abb5-ca7d-673d34809f38	0002	tehnična vaja	tehnična vaja
00420000-5665-abb5-dfd1-c39f5cada32c	0003	lučna vaja	lučna vaja
00420000-5665-abb5-8f04-d3f47780a178	0004	kostumska vaja	kostumska vaja
00420000-5665-abb5-f6e7-72c41c92c860	0005	foto vaja	foto vaja
00420000-5665-abb5-c2bd-c97cd91d97a0	0006	1. glavna vaja	1. glavna vaja
00420000-5665-abb5-d409-07464e42e990	0007	2. glavna vaja	2. glavna vaja
00420000-5665-abb5-5626-79e0d87f5a4a	0008	1. generalka	1. generalka
00420000-5665-abb5-91f2-a82567cd506c	0009	2. generalka	2. generalka
00420000-5665-abb5-d127-257572d1a712	0010	odprta generalka	odprta generalka
00420000-5665-abb5-143c-c9e460e211d1	0011	obnovitvena vaja	obnovitvena vaja
00420000-5665-abb5-1964-bbf61b0ae9da	0012	pevska vaja	pevska vaja
00420000-5665-abb5-97e9-3bff5ea9955b	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5665-abb5-f304-cfee9e512aae	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 31122992)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 31122806)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5665-abb5-5ccf-731fef3808fe	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROchG6z/Ll/6vsuJFk5.ugjGEpoLid8aa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5665-abb7-8b61-c4c493b8fea5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5665-abb7-9b48-3fc622d9ba5a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5665-abb7-aa11-90b7d0a689ba	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5665-abb7-842f-15af04fd04da	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5665-abb7-9438-81d2499fa621	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5665-abb7-af52-89951548ce48	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5665-abb7-56dc-8cee7165b3f5	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5665-abb7-3312-1fa0af3432fd	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5665-abb7-83ba-23cd6a48f31a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5665-abb7-a878-ccc6cf8138a5	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5665-abb7-453f-789aa902a8bf	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5665-abb7-b2c5-43140d39a24e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5665-abb7-0441-1a04e181f361	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5665-abb7-5705-c3b9700b87a1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5665-abb7-8a4d-959991e573a7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5665-abb7-219d-e82dd15c2815	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5665-abb7-2e8c-06c61ffe7061	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5665-abb7-9614-fbe42125ddeb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5665-abb7-74bb-4d5d39424013	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5665-abb5-ed41-870e0deb772b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 31123433)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5665-abb7-a893-abb2433458a7	00160000-5665-abb7-ccc6-3db9de81ea59	\N	00140000-5665-abb5-280f-be455cd7129c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5665-abb7-73ea-ad86dc716e8b
000e0000-5665-abb7-f766-894ffcdb377e	00160000-5665-abb7-1b63-4d47d3aa3454	\N	00140000-5665-abb5-3a1d-e32659aeb2c6	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5665-abb7-1e47-a739d4f7dd25
000e0000-5665-abb7-cbcb-0deba4738864	\N	\N	00140000-5665-abb5-3a1d-e32659aeb2c6	00190000-5665-abb7-683b-2aa2f55d2f11	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5665-abb7-73ea-ad86dc716e8b
000e0000-5665-abb7-3db9-ddb833a0dccc	\N	\N	00140000-5665-abb5-3a1d-e32659aeb2c6	00190000-5665-abb7-683b-2aa2f55d2f11	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5665-abb7-73ea-ad86dc716e8b
000e0000-5665-abb7-edb8-f4ebc975b235	\N	\N	00140000-5665-abb5-3a1d-e32659aeb2c6	00190000-5665-abb7-683b-2aa2f55d2f11	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5665-abb7-0ee4-6431330fa87f
000e0000-5665-abb7-0aaf-bea7e727d7bb	\N	\N	00140000-5665-abb5-3a1d-e32659aeb2c6	00190000-5665-abb7-683b-2aa2f55d2f11	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5665-abb7-0ee4-6431330fa87f
\.


--
-- TOC entry 3125 (class 0 OID 31123091)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5665-abb8-f09c-3ae242aa076a	\N	000e0000-5665-abb7-f766-894ffcdb377e	1	
00200000-5665-abb8-3ab5-c078ee9de50a	\N	000e0000-5665-abb7-f766-894ffcdb377e	2	
00200000-5665-abb8-f484-15f356f9a44f	\N	000e0000-5665-abb7-f766-894ffcdb377e	3	
00200000-5665-abb8-d743-d2723c16d9f5	\N	000e0000-5665-abb7-f766-894ffcdb377e	4	
00200000-5665-abb8-a848-6570e6b1b98f	\N	000e0000-5665-abb7-f766-894ffcdb377e	5	
\.


--
-- TOC entry 3142 (class 0 OID 31123242)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 31123356)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5665-abb5-5d25-1f546683763a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5665-abb5-2ff1-c1bc608eeb04	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5665-abb5-9683-b4a8eb8640a2	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5665-abb5-cc5b-b5985065799c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5665-abb5-b044-bc7205b55654	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5665-abb5-9b63-c96d2cf1f036	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5665-abb5-b80e-af1ae4bf5f76	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5665-abb5-f39a-aedbe8ca03cd	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5665-abb5-f14b-ad0401419958	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5665-abb5-fa0f-91a541c268f8	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5665-abb5-1d6b-36684d050f7d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5665-abb5-2416-ad47c2a6b78f	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5665-abb5-762c-6295980a1296	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5665-abb5-235c-491f124ebe17	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5665-abb5-f320-b5bf2959140b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5665-abb5-c8e3-b81e71a395ef	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5665-abb5-fd35-6a3c03a89bb5	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5665-abb5-162d-6e4026c80faf	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5665-abb5-641b-303cc4d0ebaa	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5665-abb5-97f1-7d5951a82ed4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5665-abb5-bff5-e969f748bd1c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5665-abb5-15ca-bc70f0ab62c5	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5665-abb5-c3a9-38b7b3ae34be	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5665-abb5-664a-2c64ffce0ac0	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5665-abb5-6a21-a4f36f3a291e	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5665-abb5-edaa-a17d228e49f2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5665-abb5-33df-c697ef0678a1	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5665-abb5-ecb9-936275e57372	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 31123728)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 31123697)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 31123740)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 31123314)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5665-abb7-6b60-1bc8d4a86aa8	00090000-5665-abb7-e284-2759eff8abe6	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-abb7-c6ac-e296e250426c	00090000-5665-abb7-9a2e-7dac093a6dab	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-abb7-9b0a-9eb2c4518c53	00090000-5665-abb7-7431-1c389bfb9bac	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-abb7-f027-adf3334a15c8	00090000-5665-abb7-43e0-94a06c2df8ac	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-abb7-25e2-7dd922d6d554	00090000-5665-abb7-b555-94ac32f304a0	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-abb7-a9e1-fe6594354740	00090000-5665-abb7-b7b2-38a947f0743a	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 31123135)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 31123423)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5665-abb5-280f-be455cd7129c	01	Drama	drama (SURS 01)
00140000-5665-abb5-7f3e-bc6d49b466a4	02	Opera	opera (SURS 02)
00140000-5665-abb5-ffeb-d6d9b554284e	03	Balet	balet (SURS 03)
00140000-5665-abb5-a6fb-6170aa7a34bf	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5665-abb5-eedc-1ff3700b6602	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5665-abb5-3a1d-e32659aeb2c6	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5665-abb5-4d7b-d899ec79926d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 31123304)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 31122869)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 31123482)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 31123472)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 31122860)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 31123339)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 31123381)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 31123781)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 31123123)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 31123145)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 31123150)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 31123695)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 31123018)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 31123551)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 31123300)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 31123089)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 31123056)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 31123032)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 31123207)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 31123758)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 31123765)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 31123789)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 31123234)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 31122990)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 31122888)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 31122952)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 31122915)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 31122849)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 31122834)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 31123240)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 31123276)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 31123418)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 31122943)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 31122978)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 31123646)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 31123213)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 31122968)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 31123108)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 31123077)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 31123069)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 31123225)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 31123655)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 31123663)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 31123633)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 31123676)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 31123258)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 31123198)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 31123189)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 31123405)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 31123332)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 31123044)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 31122805)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 31123267)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 31122823)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 31122843)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 31123285)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 31123220)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 31123169)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 31122793)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 31122781)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 31122775)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 31123352)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 31122924)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 31123180)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 31123392)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 31122877)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 31123688)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 31123158)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 31123003)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 31122818)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 31123451)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 31123098)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 31123248)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 31123364)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 31123738)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 31123722)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 31123746)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 31123322)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 31123139)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 31123431)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 31123312)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 31123133)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 31123134)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 31123132)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 31123131)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 31123130)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 31123353)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 31123354)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 31123355)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 31123760)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 31123759)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 31122945)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 31122946)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 31123241)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 31123726)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 31123725)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 31123727)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 31123724)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 31123723)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 31123227)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 31123226)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 31123099)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 31123100)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 31123301)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 31123303)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 31123302)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 31123034)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 31123033)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 31123677)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 31123420)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 31123421)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 31123422)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 31123747)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 31123456)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 31123453)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 31123457)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 31123455)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 31123454)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 31123005)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 31123004)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 31122918)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 31123268)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 31122850)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 31122851)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 31123288)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 31123287)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 31123286)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 31122955)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 31122954)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 31122956)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 31123072)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 31123070)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 31123071)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 31122783)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 31123193)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 31123191)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 31123190)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 31123192)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 31122824)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 31122825)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 31123249)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 31123782)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 31123341)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 31123340)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 31123790)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 31123791)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 31123214)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 31123333)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 31123334)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 31123556)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 31123555)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 31123552)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 31123553)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 31123554)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 31122970)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 31122969)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 31122971)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 31123262)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 31123261)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 31123656)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 31123657)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 31123486)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 31123487)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 31123484)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 31123485)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 31123323)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 31123324)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 31123202)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 31123201)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 31123199)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 31123200)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 31123474)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 31123473)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 31123045)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 31123059)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 31123058)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 31123057)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 31123060)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 31123090)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 31123078)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 31123079)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 31123647)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 31123696)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 31123766)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 31123767)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 31122890)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 31122889)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 31122925)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 31122926)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 31123140)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 31123183)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 31123182)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 31123181)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 31123125)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 31123126)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 31123129)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 31123124)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 31123128)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 31123127)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 31122944)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 31122878)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 31122879)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 31123019)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 31123021)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 31123020)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 31123022)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 31123208)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 31123419)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 31123452)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 31123393)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 31123394)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 31122916)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 31122917)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 31123313)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 31122794)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 31122991)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 31122953)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 31122782)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 31123689)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 31123260)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 31123259)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 31123159)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 31123160)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 31123483)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 31122979)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 31123432)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 31123739)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 31123664)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 31123665)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 31123382)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 31123170)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 31122844)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 31123962)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 31123967)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 31123992)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 31123982)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 31123957)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 31123977)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 31123987)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 31123972)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 31124162)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 31124167)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 31124172)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 31124337)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 31124332)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 31123847)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 31123852)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 31124077)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 31124317)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 31124312)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 31124322)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 31124307)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 31124302)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 31124072)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 31124067)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 31123947)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 31123952)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 31124117)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 31124127)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 31124122)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 31123902)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 31123897)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 31124057)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 31124292)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 31124177)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 31124182)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 31124187)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 31124327)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 31124207)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 31124192)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 31124212)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 31124202)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 31124197)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 31123892)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 31123887)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 31123832)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 31123827)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 31124097)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 31123807)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 31123812)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 31124112)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 31124107)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 31124102)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 31123862)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 31123857)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 31123867)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 31123927)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 31123917)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 31123922)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 31123792)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 31124032)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 31124022)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 31124017)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 31124027)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 31123797)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 31123802)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 31124082)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 31124352)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 31124157)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 31124152)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 31124357)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 31124362)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 31124062)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 31124142)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 31124147)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 31124267)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 31124262)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 31124247)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 31124252)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 31124257)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 31123877)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 31123872)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 31123882)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 31124092)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 31124087)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 31124277)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 31124282)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 31124237)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 31124242)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 31124227)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 31124232)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 31124132)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 31124137)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 31124052)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 31124047)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 31124037)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 31124042)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 31124222)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 31124217)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 31123907)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 31123912)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 31123942)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 31123932)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 31123937)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 31124272)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 31124287)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 31124297)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 31124342)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 31124347)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 31123822)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 31123817)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 31123837)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 31123842)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 31123997)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 31124012)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 31124007)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 31124002)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-07 16:54:35 CET

--
-- PostgreSQL database dump complete
--

