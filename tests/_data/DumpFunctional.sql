--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-27 11:25:43 CET

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
-- TOC entry 185 (class 1259 OID 40846724)
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
-- TOC entry 241 (class 1259 OID 40847342)
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
-- TOC entry 240 (class 1259 OID 40847326)
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
-- TOC entry 184 (class 1259 OID 40846717)
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
-- TOC entry 183 (class 1259 OID 40846715)
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
-- TOC entry 231 (class 1259 OID 40847203)
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
-- TOC entry 234 (class 1259 OID 40847233)
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
-- TOC entry 255 (class 1259 OID 40847645)
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
-- TOC entry 212 (class 1259 OID 40847039)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 40846965)
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
-- TOC entry 206 (class 1259 OID 40846990)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 40846995)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 40847567)
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
-- TOC entry 196 (class 1259 OID 40846870)
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
-- TOC entry 242 (class 1259 OID 40847355)
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
-- TOC entry 227 (class 1259 OID 40847161)
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
-- TOC entry 202 (class 1259 OID 40846939)
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
-- TOC entry 199 (class 1259 OID 40846910)
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
-- TOC entry 197 (class 1259 OID 40846887)
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
-- TOC entry 216 (class 1259 OID 40847075)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 40847625)
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
-- TOC entry 254 (class 1259 OID 40847638)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 40847660)
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
-- TOC entry 220 (class 1259 OID 40847099)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 40846844)
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
-- TOC entry 187 (class 1259 OID 40846744)
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
-- TOC entry 191 (class 1259 OID 40846811)
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
-- TOC entry 188 (class 1259 OID 40846755)
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
-- TOC entry 180 (class 1259 OID 40846689)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 40846708)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 40847106)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 40847141)
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
-- TOC entry 237 (class 1259 OID 40847274)
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
-- TOC entry 190 (class 1259 OID 40846791)
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
-- TOC entry 193 (class 1259 OID 40846836)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 40847511)
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
-- TOC entry 217 (class 1259 OID 40847081)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 40846821)
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
-- TOC entry 204 (class 1259 OID 40846957)
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
-- TOC entry 200 (class 1259 OID 40846925)
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
-- TOC entry 201 (class 1259 OID 40846932)
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
-- TOC entry 219 (class 1259 OID 40847093)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 40847525)
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
-- TOC entry 246 (class 1259 OID 40847535)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 40847424)
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
-- TOC entry 247 (class 1259 OID 40847543)
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
-- TOC entry 223 (class 1259 OID 40847121)
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
-- TOC entry 215 (class 1259 OID 40847066)
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
-- TOC entry 214 (class 1259 OID 40847056)
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
-- TOC entry 236 (class 1259 OID 40847263)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 40847193)
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
-- TOC entry 198 (class 1259 OID 40846899)
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
-- TOC entry 177 (class 1259 OID 40846660)
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
-- TOC entry 176 (class 1259 OID 40846658)
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
-- TOC entry 224 (class 1259 OID 40847135)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 40846698)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 40846682)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 40847149)
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
-- TOC entry 218 (class 1259 OID 40847087)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 40847010)
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
-- TOC entry 175 (class 1259 OID 40846647)
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
-- TOC entry 174 (class 1259 OID 40846639)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 40846634)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 40847210)
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
-- TOC entry 189 (class 1259 OID 40846783)
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
-- TOC entry 211 (class 1259 OID 40847029)
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
-- TOC entry 213 (class 1259 OID 40847046)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 40847251)
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
-- TOC entry 186 (class 1259 OID 40846734)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 40847555)
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
-- TOC entry 208 (class 1259 OID 40847000)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 40846856)
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
-- TOC entry 178 (class 1259 OID 40846669)
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
-- TOC entry 239 (class 1259 OID 40847301)
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
-- TOC entry 210 (class 1259 OID 40847020)
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
-- TOC entry 203 (class 1259 OID 40846950)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 40847113)
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
-- TOC entry 233 (class 1259 OID 40847224)
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
-- TOC entry 251 (class 1259 OID 40847605)
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
-- TOC entry 250 (class 1259 OID 40847574)
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
-- TOC entry 252 (class 1259 OID 40847617)
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
-- TOC entry 229 (class 1259 OID 40847186)
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
-- TOC entry 238 (class 1259 OID 40847291)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 40847176)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 40846720)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 40846663)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 40846724)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a8-9b22-b3a0-3c8489d83046	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a8-9b22-cb22-b8c02a99c779	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a8-9b22-fa6f-ff31b951039a	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 40847342)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a8-9b23-3972-1f57029bb2a7	000d0000-56a8-9b23-5cd2-d1ad27d87813	\N	00090000-56a8-9b22-ae6c-9213c6e40e95	000b0000-56a8-9b22-6cea-7cbe289efcb0	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a8-9b23-b769-81d0a1954489	000d0000-56a8-9b23-20bd-a8a352fd3356	00100000-56a8-9b22-a74c-8313d29c5753	00090000-56a8-9b22-715a-0a66bbfc5809	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a8-9b23-0a89-20a520e6957e	000d0000-56a8-9b23-0ad9-244b2667498e	00100000-56a8-9b22-57a8-3fe40546c9d2	00090000-56a8-9b22-0550-b8179cbb42d1	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a8-9b23-9753-e482b8a5298e	000d0000-56a8-9b23-477f-3a752c87dce0	\N	00090000-56a8-9b22-8a40-e83b7f42a826	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a8-9b23-704f-a00ef21696d7	000d0000-56a8-9b23-34b5-f6f0991f2095	\N	00090000-56a8-9b22-5720-6594aaf90f8c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a8-9b23-665b-9f0110e2ccb7	000d0000-56a8-9b23-e487-de61f38d4766	\N	00090000-56a8-9b22-7d3f-1dad436f80c9	000b0000-56a8-9b22-4fb7-ba0827fe8bf2	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a8-9b24-6e1e-9a70d8f7a23b	000d0000-56a8-9b23-4f6a-56157421caf5	00100000-56a8-9b22-d4b9-4c41d0196367	00090000-56a8-9b22-2f52-4ed23a905533	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a8-9b24-5fde-aeed95d65bfb	000d0000-56a8-9b23-85ee-42319af744b9	\N	00090000-56a8-9b22-1850-53b50e87ffdf	000b0000-56a8-9b22-7b1d-1966eddd80b4	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a8-9b24-d352-f817a3d05951	000d0000-56a8-9b23-4f6a-56157421caf5	00100000-56a8-9b22-a413-d113cb931c78	00090000-56a8-9b22-5c9e-21ea0e3f1b21	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a8-9b24-2c95-b64b40b9f078	000d0000-56a8-9b23-4f6a-56157421caf5	00100000-56a8-9b22-9bdb-5699ead58454	00090000-56a8-9b22-4656-bf23527f3964	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a8-9b24-d7fb-b5df1ea2217e	000d0000-56a8-9b23-4f6a-56157421caf5	00100000-56a8-9b22-3dbb-2bb8378f6f62	00090000-56a8-9b22-448e-2230cf3ad685	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a8-9b24-57c2-718e26eaf5d2	000d0000-56a8-9b23-28dc-d775066aa081	00100000-56a8-9b22-a74c-8313d29c5753	00090000-56a8-9b22-715a-0a66bbfc5809	000b0000-56a8-9b22-cb10-71ef5480b3cf	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a8-9b24-bfca-8c9e6b676f5b	000d0000-56a8-9b23-bd1d-898099b42e5e	\N	00090000-56a8-9b22-1850-53b50e87ffdf	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-6b2b-7fa3b71061fc	000d0000-56a8-9b23-bd1d-898099b42e5e	\N	00090000-56a8-9b22-023a-8c91dd7cbf2a	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a8-9b24-9839-394ef5fb51ed	000d0000-56a8-9b23-f3d2-2e4d868613c3	00100000-56a8-9b22-57a8-3fe40546c9d2	00090000-56a8-9b22-0550-b8179cbb42d1	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-498b-3b71d0fa6d97	000d0000-56a8-9b23-f3d2-2e4d868613c3	\N	00090000-56a8-9b22-023a-8c91dd7cbf2a	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a8-9b24-3db6-2cec9cd5a712	000d0000-56a8-9b23-5d79-adae5b8ca53b	\N	00090000-56a8-9b22-023a-8c91dd7cbf2a	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-7d1a-4bc5f363269b	000d0000-56a8-9b23-5d79-adae5b8ca53b	\N	00090000-56a8-9b22-1850-53b50e87ffdf	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a8-9b24-c903-d1e088945bf9	000d0000-56a8-9b23-e4cc-e7aa4a06516b	00100000-56a8-9b22-d4b9-4c41d0196367	00090000-56a8-9b22-2f52-4ed23a905533	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-0652-ea142e3e505d	000d0000-56a8-9b23-e4cc-e7aa4a06516b	\N	00090000-56a8-9b22-023a-8c91dd7cbf2a	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a8-9b24-228f-1b6f51a7dabd	000d0000-56a8-9b23-4c9b-ccef35325067	\N	00090000-56a8-9b22-023a-8c91dd7cbf2a	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-bf3e-737212f2e017	000d0000-56a8-9b23-4c9b-ccef35325067	00100000-56a8-9b22-d4b9-4c41d0196367	00090000-56a8-9b22-2f52-4ed23a905533	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a8-9b24-c155-b645dd483149	000d0000-56a8-9b23-a6bf-8b6b2d586054	\N	00090000-56a8-9b22-023a-8c91dd7cbf2a	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-a1dd-7cd0207224af	000d0000-56a8-9b23-602e-c6d6c4b3418c	\N	00090000-56a8-9b22-1850-53b50e87ffdf	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-e5f2-339eefea6530	000d0000-56a8-9b23-2353-f83a291b1610	\N	00090000-56a8-9b22-1850-53b50e87ffdf	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-2338-93e3eb559e1b	000d0000-56a8-9b23-2353-f83a291b1610	00100000-56a8-9b22-57a8-3fe40546c9d2	00090000-56a8-9b22-0550-b8179cbb42d1	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a8-9b24-d6ec-a35569efb4b5	000d0000-56a8-9b23-e4c9-4d4ed97a6504	\N	00090000-56a8-9b22-2ab1-720c2be244a1	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a8-9b24-8ad8-f268dec8600f	000d0000-56a8-9b23-e4c9-4d4ed97a6504	\N	00090000-56a8-9b22-3fb0-ab5c4780c130	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a8-9b24-8469-7c9e6525c11e	000d0000-56a8-9b23-3a35-c6f78f34fee7	\N	00090000-56a8-9b22-1850-53b50e87ffdf	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a8-9b24-f9b5-56eb35a666ae	000d0000-56a8-9b23-3a35-c6f78f34fee7	00100000-56a8-9b22-57a8-3fe40546c9d2	00090000-56a8-9b22-0550-b8179cbb42d1	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a8-9b24-1ae0-187af497f09c	000d0000-56a8-9b23-3a35-c6f78f34fee7	\N	00090000-56a8-9b22-3fb0-ab5c4780c130	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a8-9b24-bf14-4e7dd2e27eb3	000d0000-56a8-9b23-3a35-c6f78f34fee7	\N	00090000-56a8-9b22-2ab1-720c2be244a1	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a8-9b24-55b3-bf7cc385967f	000d0000-56a8-9b23-f62f-a0b1be8105da	\N	00090000-56a8-9b22-1850-53b50e87ffdf	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a8-9b24-675d-3b1d53ac9808	000d0000-56a8-9b23-af49-751cab1eeda3	00100000-56a8-9b22-57a8-3fe40546c9d2	00090000-56a8-9b22-0550-b8179cbb42d1	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a8-9b24-7545-5ae2e239c131	000d0000-56a8-9b23-af49-751cab1eeda3	\N	00090000-56a8-9b22-023a-8c91dd7cbf2a	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 40847326)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 40846717)
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
-- TOC entry 3191 (class 0 OID 40847203)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a8-9b23-2b15-db7418a68a51	00160000-56a8-9b22-fff1-da60d340f6b4	00090000-56a8-9b22-3fb0-ab5c4780c130	aizv	10	t
003d0000-56a8-9b23-d7bf-1a7540431384	00160000-56a8-9b22-fff1-da60d340f6b4	00090000-56a8-9b22-a1d2-f5726054d619	apri	14	t
003d0000-56a8-9b23-ad38-16de6d05749c	00160000-56a8-9b22-65a3-768061c9dc7e	00090000-56a8-9b22-2ab1-720c2be244a1	aizv	11	t
003d0000-56a8-9b23-c933-789406dfea90	00160000-56a8-9b22-be5d-2cf1376dd3bd	00090000-56a8-9b22-9049-e8e85e4e6759	aizv	12	t
003d0000-56a8-9b23-bfcb-01870b7c5098	00160000-56a8-9b22-fff1-da60d340f6b4	00090000-56a8-9b22-023a-8c91dd7cbf2a	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 40847233)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a8-9b22-fff1-da60d340f6b4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a8-9b22-65a3-768061c9dc7e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a8-9b22-be5d-2cf1376dd3bd	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 40847645)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 40847039)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 40846965)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a8-9b23-f038-86a0a9f59433	\N	\N	\N	\N	00440000-56a8-9b23-4835-ee8808db58f5	00220000-56a8-9b22-a75e-ea999513a984	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a8-9b23-f112-0bc59f04e75a	\N	\N	\N	\N	00440000-56a8-9b23-551e-c7bfef57d865	00220000-56a8-9b22-bd4b-1f04cc3326e7	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a8-9b23-b3ba-edb61fb9da18	\N	\N	\N	001e0000-56a8-9b23-fe2a-48e96a1be7b9	\N	00220000-56a8-9b22-a75e-ea999513a984	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a8-9b23-aecf-24f9322f9b8c	\N	\N	\N	001e0000-56a8-9b23-eb24-80cf8a4a63e7	\N	00220000-56a8-9b22-bd4b-1f04cc3326e7	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a8-9b23-dd68-b52005abc9e1	\N	00200000-56a8-9b23-cce9-c0212119b9cb	\N	\N	\N	00220000-56a8-9b22-0e02-c77bd5c46899	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N
00180000-56a8-9b23-f3ae-a4d4fa93612c	\N	00200000-56a8-9b23-dd4d-7830de1f61fe	\N	\N	\N	00220000-56a8-9b22-0e02-c77bd5c46899	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N
00180000-56a8-9b23-0329-1dc536e52931	\N	00200000-56a8-9b23-6d4c-d30588de7f26	\N	\N	\N	00220000-56a8-9b22-bd4b-1f04cc3326e7	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N
00180000-56a8-9b23-b5bb-3950375e073a	\N	00200000-56a8-9b23-cdb2-dd18bba0676d	\N	\N	\N	00220000-56a8-9b22-1a26-a11c00c8f3b8	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N
00180000-56a8-9b23-f476-c775d4d52f61	\N	00200000-56a8-9b23-74ac-8559056f40e5	\N	\N	\N	00220000-56a8-9b22-a060-803da25323a4	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N
00180000-56a8-9b23-4ad1-93340817957b	\N	00200000-56a8-9b23-f4ac-48b223f249b3	\N	\N	\N	00220000-56a8-9b22-bd4b-1f04cc3326e7	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N
00180000-56a8-9b23-a4cb-b04038799b21	\N	00200000-56a8-9b23-5859-d15241b020c0	\N	\N	\N	00220000-56a8-9b22-a060-803da25323a4	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N
00180000-56a8-9b23-45b5-fefb53d5d137	\N	00200000-56a8-9b23-ac33-b749e60ebecb	\N	\N	\N	00220000-56a8-9b22-a060-803da25323a4	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N
00180000-56a8-9b23-ee76-7d2cb693ddcf	\N	00200000-56a8-9b23-73b6-9231876241b4	\N	\N	\N	00220000-56a8-9b22-0e02-c77bd5c46899	001f0000-56a8-9b22-7bac-cd58a9e4aba3	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N
00180000-56a8-9b23-23b4-86ac7755a988	\N	00200000-56a8-9b23-976a-0c4802f597cf	\N	\N	\N	00220000-56a8-9b22-0e02-c77bd5c46899	001f0000-56a8-9b22-7bac-cd58a9e4aba3	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N
00180000-56a8-9b23-291b-2739416a701d	001b0000-56a8-9b23-9f05-e1c952c71315	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-7bac-cd58a9e4aba3	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N
00180000-56a8-9b23-f9a1-2a9d6b069b04	001b0000-56a8-9b23-7c1f-2ed857df97d4	\N	\N	\N	\N	00220000-56a8-9b22-bd4b-1f04cc3326e7	001f0000-56a8-9b22-7bac-cd58a9e4aba3	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N
00180000-56a8-9b23-1c72-6a07856665e4	001b0000-56a8-9b23-9508-f3f34e634012	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-7bac-cd58a9e4aba3	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N
00180000-56a8-9b23-8967-26c97ec190a3	001b0000-56a8-9b23-bcc7-7cefb70c758e	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N
00180000-56a8-9b23-ae54-149507e55f63	001b0000-56a8-9b23-4dbe-d63591e29e2e	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-64c5-fbcd0e840aa4	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N
00180000-56a8-9b23-64d8-a20242b77890	001b0000-56a8-9b23-d212-d03cff631733	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-64c5-fbcd0e840aa4	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N
00180000-56a8-9b23-9936-e777aa9af572	001b0000-56a8-9b23-95a7-49ec43474acc	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-7bac-cd58a9e4aba3	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N
00180000-56a8-9b23-5457-f4e73471b719	001b0000-56a8-9b23-aa02-01437b3fa324	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-64c5-fbcd0e840aa4	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N
00180000-56a8-9b23-6df2-43d2f725831d	001b0000-56a8-9b23-4b32-7e4068313df4	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N
00180000-56a8-9b23-3849-8875f70224a9	001b0000-56a8-9b23-271e-30d84705b6af	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N
00180000-56a8-9b23-43ba-1766663811c1	001b0000-56a8-9b23-fcd0-b3aeaebe266d	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-64c5-fbcd0e840aa4	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N
00180000-56a8-9b23-c8c8-3b8f797db365	001b0000-56a8-9b23-5d99-44e91ea83460	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-6ef1-5ace10446d7d	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N
00180000-56a8-9b23-fea1-151577fcaa7f	001b0000-56a8-9b23-93be-d23eb163f9c2	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-6ef1-5ace10446d7d	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N
00180000-56a8-9b23-cf13-8480d029b601	001b0000-56a8-9b23-6d04-b029fa299fdf	\N	\N	\N	\N	00220000-56a8-9b22-a75e-ea999513a984	001f0000-56a8-9b22-64c5-fbcd0e840aa4	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N
\.


--
-- TOC entry 3166 (class 0 OID 40846990)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a8-9b23-fe2a-48e96a1be7b9
001e0000-56a8-9b23-eb24-80cf8a4a63e7
\.


--
-- TOC entry 3167 (class 0 OID 40846995)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a8-9b23-4835-ee8808db58f5
00440000-56a8-9b23-551e-c7bfef57d865
\.


--
-- TOC entry 3209 (class 0 OID 40847567)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 40846870)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a8-9b1e-c3bb-6eb513aa0b38	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a8-9b1e-1e88-842da1223f1c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a8-9b1e-37c4-6def76ad38de	AL	ALB	008	Albania 	Albanija	\N
00040000-56a8-9b1e-6299-e4415d958583	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a8-9b1e-8bc2-3dc51376a6f0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a8-9b1e-cfb4-2b691d68a7e2	AD	AND	020	Andorra 	Andora	\N
00040000-56a8-9b1e-131a-f72f1301f6c9	AO	AGO	024	Angola 	Angola	\N
00040000-56a8-9b1e-e2d8-b53863b3a74b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a8-9b1e-9c62-7e502681f2a4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a8-9b1e-7428-aaaa4f14dc76	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a8-9b1e-ee64-22792b6a01a2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a8-9b1e-9e6a-c0d74f65067f	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a8-9b1e-b6fd-34304eeaebe1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a8-9b1e-b0b7-a7d03c955437	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a8-9b1e-3032-22646fc8d056	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a8-9b1e-0c5e-84e6b7e441e3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a8-9b1e-2205-755441be7a9f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a8-9b1e-3597-1574c1749925	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a8-9b1e-d255-b3f29320a47d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a8-9b1e-2538-ec6f386b2e69	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a8-9b1e-6b76-bac6484851bd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a8-9b1e-07e9-f61332d52ad4	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a8-9b1e-ef41-799601993461	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a8-9b1e-0186-8a260ce46e4c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a8-9b1e-aab8-4358a4e32082	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a8-9b1e-3509-dc060175939c	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a8-9b1e-f177-2f72167dd47f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a8-9b1e-2ce6-42d271785a96	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a8-9b1e-4ced-64675c6657ca	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a8-9b1e-68d9-32057b5f608d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a8-9b1e-9a5f-34ecedf4ce55	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a8-9b1e-684d-fffe3bfb6da8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a8-9b1e-b114-861e2843ae2b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a8-9b1e-3550-cab30e67a5dd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a8-9b1e-6a22-2e09af1d6cef	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a8-9b1e-ba43-e3d92c516ecc	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a8-9b1e-24ee-fafba04b50f8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a8-9b1e-b7d8-47c1118a4243	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a8-9b1e-8255-e832251974a2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a8-9b1e-cc78-58a9ca36e27b	CA	CAN	124	Canada 	Kanada	\N
00040000-56a8-9b1e-4754-ace4a074231b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a8-9b1e-aac6-1151f30f9a83	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a8-9b1e-d694-bdf704c4bda0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a8-9b1e-a360-1d8b843186fb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a8-9b1e-9807-a161d808fd64	CL	CHL	152	Chile 	Čile	\N
00040000-56a8-9b1e-88cb-c788f8a673ad	CN	CHN	156	China 	Kitajska	\N
00040000-56a8-9b1e-7aa6-3cec0936e204	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a8-9b1e-5d67-35ff076b5b0f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a8-9b1e-80e5-aec9740bfc97	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a8-9b1e-5457-d54b099e8229	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a8-9b1e-d5a3-ef8a7a921139	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a8-9b1e-02eb-c94c83d8339c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a8-9b1e-d962-f54e5c86cfa9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a8-9b1e-cf23-c5f544bcfcbc	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a8-9b1e-a769-05a764c377b3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a8-9b1e-a73b-cea8588e7b38	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a8-9b1e-6e01-f88daec4c41c	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a8-9b1e-31b6-9197bb9dc68e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a8-9b1f-8d21-ee9cf6827711	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a8-9b1f-8310-96e37ee6fddc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a8-9b1f-b15a-294a4f5a6fe3	DK	DNK	208	Denmark 	Danska	\N
00040000-56a8-9b1f-95e3-5c41ea0e74ce	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a8-9b1f-1116-8a732c586241	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a8-9b1f-b72b-95724562cd61	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a8-9b1f-bfa1-436384331be3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a8-9b1f-c404-cd18cb2fa0d7	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a8-9b1f-0227-eee249750b5d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a8-9b1f-a91d-a4bf5d9b2e47	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a8-9b1f-8a0f-59e99ab6ac30	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a8-9b1f-0c25-38963bf2e4be	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a8-9b1f-21d3-673c5701e9b4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a8-9b1f-7a38-0b2f015cafb9	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a8-9b1f-577f-f191c43ac285	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a8-9b1f-1dc5-abf522983840	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a8-9b1f-8b4c-e379da696204	FI	FIN	246	Finland 	Finska	\N
00040000-56a8-9b1f-5928-7ad555222327	FR	FRA	250	France 	Francija	\N
00040000-56a8-9b1f-9b7d-d15945f24603	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a8-9b1f-7388-d2f65f1fe2ef	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a8-9b1f-285c-146cddbeded2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a8-9b1f-0e72-3211b3cf0b48	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a8-9b1f-8813-2560425b2842	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a8-9b1f-9c67-03cc93e84d32	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a8-9b1f-14ea-b348d5f5fece	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a8-9b1f-516b-2457999aabb6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a8-9b1f-44cd-d7702100f623	GH	GHA	288	Ghana 	Gana	\N
00040000-56a8-9b1f-3541-89a82978a348	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a8-9b1f-393e-38e208ffd1ac	GR	GRC	300	Greece 	Grčija	\N
00040000-56a8-9b1f-593b-c48349ab8df3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a8-9b1f-5e5c-906aacf8e553	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a8-9b1f-8ff4-36acc4c7da82	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a8-9b1f-10b3-c2b8cb0f4b83	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a8-9b1f-b42a-445d9d9aa675	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a8-9b1f-2f75-b73a3adbc690	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a8-9b1f-015c-a1c04337ea3c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a8-9b1f-dec7-2009cb47e897	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a8-9b1f-a874-6609f1f0dc42	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a8-9b1f-e0be-bbee001d6d47	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a8-9b1f-64d6-e372306abde1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a8-9b1f-0d98-cd60b7c21593	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a8-9b1f-253d-6010bd47e16d	HN	HND	340	Honduras 	Honduras	\N
00040000-56a8-9b1f-4f03-60ebfe131638	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a8-9b1f-2500-9c5b7b73a549	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a8-9b1f-ebae-73a3f13b392f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a8-9b1f-fb52-6960a9afd3c9	IN	IND	356	India 	Indija	\N
00040000-56a8-9b1f-327f-fdeaa78f745e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a8-9b1f-81c1-942c5e2a2bc0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a8-9b1f-eb08-1f02c49c002b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a8-9b1f-305c-0144d3207fb6	IE	IRL	372	Ireland 	Irska	\N
00040000-56a8-9b1f-6f2d-2ea2f43076c9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a8-9b1f-2d2f-e509517f06ef	IL	ISR	376	Israel 	Izrael	\N
00040000-56a8-9b1f-26c3-5a042699989b	IT	ITA	380	Italy 	Italija	\N
00040000-56a8-9b1f-44b5-b6bb7aacc52d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a8-9b1f-22dd-fee54768b0bc	JP	JPN	392	Japan 	Japonska	\N
00040000-56a8-9b1f-84f2-daea9a3e521b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a8-9b1f-73bc-901c9094eb1e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a8-9b1f-28d0-5affea1af1c9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a8-9b1f-37be-b0b84f1be3cd	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a8-9b1f-9a64-a596bd504b2a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a8-9b1f-b9bf-c1e235bc7d06	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a8-9b1f-ec8f-6c0c74110634	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a8-9b1f-31f8-3d5df96a3583	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a8-9b1f-582c-b2d6214e2c3b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a8-9b1f-bee9-796cac8c3a6e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a8-9b1f-4c2e-850ae5838566	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a8-9b1f-9dea-1f39ce644040	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a8-9b1f-4328-51b07477e40c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a8-9b1f-1f69-7fce12083d1a	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a8-9b1f-5fbf-6858fed56e4f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a8-9b1f-5753-b602c76227a8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a8-9b1f-408c-c3c0f8fcb2d3	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a8-9b1f-4b5a-4b7e540a5ff2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a8-9b1f-cc72-e6f5376546de	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a8-9b1f-250b-4095398f320c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a8-9b1f-5d06-f6c5bebddb96	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a8-9b1f-2251-1aee210f417a	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a8-9b1f-b0cb-e010824342a0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a8-9b1f-5880-60b96181f81b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a8-9b1f-b396-f92c7fa18413	ML	MLI	466	Mali 	Mali	\N
00040000-56a8-9b1f-a92b-dac7f4064e47	MT	MLT	470	Malta 	Malta	\N
00040000-56a8-9b1f-a4b3-dbfc442e4818	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a8-9b1f-a913-ae1693ba1fcc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a8-9b1f-d47a-ab2546514c13	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a8-9b1f-e46a-6e63905a9968	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a8-9b1f-664a-c092b77997e4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a8-9b1f-61b1-69bf87f4a6db	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a8-9b1f-35d0-29c558ae0584	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a8-9b1f-a5cd-cb58f8db542b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a8-9b1f-d2b8-25e779a87355	MC	MCO	492	Monaco 	Monako	\N
00040000-56a8-9b1f-9255-5036e7fb8317	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a8-9b1f-c001-30322666ea44	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a8-9b1f-052e-821ed3a7bd76	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a8-9b1f-f32a-e65cb6714126	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a8-9b1f-509a-32b56d20e63c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a8-9b1f-2a20-26d07ace8353	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a8-9b1f-db49-9b4843c3b296	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a8-9b1f-2783-ce54938687d8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a8-9b1f-2da6-ef0694959c76	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a8-9b1f-bc15-2fefaf1dcb63	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a8-9b1f-480f-11dce41a9383	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a8-9b1f-fe25-84a3dee03802	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a8-9b1f-9aa7-c5e38ce74808	NE	NER	562	Niger 	Niger 	\N
00040000-56a8-9b1f-63f3-8c48510b07cf	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a8-9b1f-eae4-7a8fc8142efa	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a8-9b1f-ed61-34d1f2343826	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a8-9b1f-6cef-619b41e4f6cb	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a8-9b1f-5d91-ec1819dba42d	NO	NOR	578	Norway 	Norveška	\N
00040000-56a8-9b1f-83a6-54170a0b2990	OM	OMN	512	Oman 	Oman	\N
00040000-56a8-9b1f-7840-e2952b3a195a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a8-9b1f-7d3e-fe0b52bdce03	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a8-9b1f-7ad9-bb9d9358dc4d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a8-9b1f-b5ee-b36774d7fe7d	PA	PAN	591	Panama 	Panama	\N
00040000-56a8-9b1f-92d3-8565cabaf593	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a8-9b1f-41a1-4aaa7692087d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a8-9b1f-6a1c-034188a1bd18	PE	PER	604	Peru 	Peru	\N
00040000-56a8-9b1f-2df7-53b65e27e5ab	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a8-9b1f-8c30-ee6caf6bf658	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a8-9b1f-c074-b11f46e9acc6	PL	POL	616	Poland 	Poljska	\N
00040000-56a8-9b1f-60d9-3fa903ba3f07	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a8-9b1f-999b-552d386be4b7	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a8-9b1f-3a3d-64376ff150c6	QA	QAT	634	Qatar 	Katar	\N
00040000-56a8-9b1f-a257-8600c65206f4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a8-9b1f-6cdb-312d89bb1325	RO	ROU	642	Romania 	Romunija	\N
00040000-56a8-9b1f-6d24-aefdce0613b5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a8-9b1f-f792-d6eae3cd592b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a8-9b1f-a3b2-cd1022c7fb00	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a8-9b1f-522e-cb03f3fc8f70	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a8-9b1f-9531-95f83b454aac	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a8-9b1f-04f3-718b895b956b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a8-9b1f-9057-c326e18f198d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a8-9b1f-0123-128e737507e9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a8-9b1f-5b6c-fd07c3945012	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a8-9b1f-5ffa-ce6564b66239	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a8-9b1f-e64b-f0f34d9f923f	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a8-9b1f-bff5-70d74d9d4c81	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a8-9b1f-cf5f-2414614bbbf6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a8-9b1f-ba05-fb80170864cd	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a8-9b1f-0d92-c642d2e1a02a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a8-9b1f-fe28-44470fd3a207	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a8-9b1f-88d9-58ab7a48d92b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a8-9b1f-947f-72ea9798dd6c	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a8-9b1f-8bf4-e85605cbbc08	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a8-9b1f-310b-7f8f78950519	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a8-9b1f-1a23-dd37d2abb3a6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a8-9b1f-8e0e-78634146180a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a8-9b1f-5f03-8ec8a6e7d5c6	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a8-9b1f-ff29-5dbe91f7d6f7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a8-9b1f-d00e-c033cf0b234d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a8-9b1f-b3f7-108eef8ec991	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a8-9b1f-9089-61058743175a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a8-9b1f-15f7-2ead007c50b2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a8-9b1f-c7af-ec00ad43dbaf	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a8-9b1f-baaf-90f37963adf6	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a8-9b1f-b21e-5fbb41221f2f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a8-9b1f-e7f0-aaea91b5ae58	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a8-9b1f-9f81-95c9b5b440ee	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a8-9b1f-1445-931750849c6e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a8-9b1f-c381-19c1d64f33a1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a8-9b1f-3eb8-d9290d921923	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a8-9b1f-f026-63dd1a2d93e6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a8-9b1f-935c-3b3368c1ec31	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a8-9b1f-743f-33c7f6ca0da9	TH	THA	764	Thailand 	Tajska	\N
00040000-56a8-9b1f-79bc-c77f9aaf5aa6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a8-9b1f-1b65-fdedcfd17e8c	TG	TGO	768	Togo 	Togo	\N
00040000-56a8-9b1f-c531-58818b75ce78	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a8-9b1f-14f5-25ffb40d6aba	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a8-9b1f-8b93-41afd1ebcf82	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a8-9b1f-2923-64e84fa1a962	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a8-9b1f-45b0-b8e059d9138d	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a8-9b1f-2731-831323e3107c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a8-9b1f-6647-7a2bb463ee02	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a8-9b1f-61c3-bd73d4bab78c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a8-9b1f-d409-a95ddadbac80	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a8-9b1f-8fde-a7e8558ee385	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a8-9b1f-3c0c-0ae9272a69b6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a8-9b1f-96f5-53a8e896357a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a8-9b1f-aa75-7d73b033973d	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a8-9b1f-a06e-5a6e5fd197d3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a8-9b1f-3c7d-b68941c6638e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a8-9b1f-e735-1a397aa2d08e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a8-9b1f-f4a0-dbdc64193720	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a8-9b1f-10af-934e35ab35ee	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a8-9b1f-081b-4f76d573413f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a8-9b1f-29c8-0b21a0f349cb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a8-9b1f-f719-1062203067a1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a8-9b1f-f6ad-0710a78b9f86	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a8-9b1f-2b7c-d5fff5407d57	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a8-9b1f-49f4-05ab00d3ebb4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a8-9b1f-4bc2-e896ba7d2d47	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a8-9b1f-2e3d-4de7a3ebee64	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 40847355)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a8-9b23-8c11-8ad84103d0a3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a8-9b23-35fd-04f206b2621e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-9b23-306b-c3f241ebebd4	000e0000-56a8-9b23-40cd-e2deab7a471a	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-9b1e-e2d4-bd88ff2bde91	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-9b23-acc8-d013d6c93dff	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-9b1e-dc36-a9bac793da9f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-9b23-5064-b89bf4c857b4	000e0000-56a8-9b23-e032-a4ad40be6745	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-9b1e-e2d4-bd88ff2bde91	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 40847161)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a8-9b23-f2e3-7573c4c24fb9	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a8-9b1e-3c34-98ecf3590978
000d0000-56a8-9b23-035d-eb4136e780d0	000e0000-56a8-9b23-eb19-27535f1b0e79	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-9b1e-aa70-40c99028d7a4
000d0000-56a8-9b23-aa45-7eff39f86b4d	000e0000-56a8-9b23-eb19-27535f1b0e79	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-5cd2-d1ad27d87813	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b23-3972-1f57029bb2a7	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-9b1e-aa70-40c99028d7a4
000d0000-56a8-9b23-20bd-a8a352fd3356	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b23-b769-81d0a1954489	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-0ad9-244b2667498e	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b23-0a89-20a520e6957e	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a8-9b1e-8e7b-d878b9c238fa
000d0000-56a8-9b23-477f-3a752c87dce0	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b23-9753-e482b8a5298e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a8-9b1e-3c34-98ecf3590978
000d0000-56a8-9b23-34b5-f6f0991f2095	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b23-704f-a00ef21696d7	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a8-9b1e-3c34-98ecf3590978
000d0000-56a8-9b23-e487-de61f38d4766	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b23-665b-9f0110e2ccb7	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-9b1e-aa70-40c99028d7a4
000d0000-56a8-9b23-4f6a-56157421caf5	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b24-d352-f817a3d05951	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a8-9b1e-aa70-40c99028d7a4
000d0000-56a8-9b23-85ee-42319af744b9	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b24-5fde-aeed95d65bfb	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a8-9b1e-7421-da30aad19a06
000d0000-56a8-9b23-28dc-d775066aa081	000e0000-56a8-9b23-ba6f-03bf4b468d02	000c0000-56a8-9b24-57c2-718e26eaf5d2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a8-9b1e-b441-892639de1961
000d0000-56a8-9b23-bd1d-898099b42e5e	000e0000-56a8-9b23-943d-70009810196f	000c0000-56a8-9b24-bfca-8c9e6b676f5b	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-f3d2-2e4d868613c3	000e0000-56a8-9b23-dd7f-f18fb5cfcdcb	000c0000-56a8-9b24-9839-394ef5fb51ed	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-5d79-adae5b8ca53b	000e0000-56a8-9b23-dd7f-f18fb5cfcdcb	000c0000-56a8-9b24-3db6-2cec9cd5a712	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-e4cc-e7aa4a06516b	000e0000-56a8-9b23-3415-a3dd73bd1e26	000c0000-56a8-9b24-c903-d1e088945bf9	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-4c9b-ccef35325067	000e0000-56a8-9b23-481d-264dae458451	000c0000-56a8-9b24-228f-1b6f51a7dabd	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-a6bf-8b6b2d586054	000e0000-56a8-9b23-dde2-1a799f72a013	000c0000-56a8-9b24-c155-b645dd483149	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-602e-c6d6c4b3418c	000e0000-56a8-9b23-ab49-b9931a53d97b	000c0000-56a8-9b24-a1dd-7cd0207224af	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-2353-f83a291b1610	000e0000-56a8-9b23-ceca-c67811c484f4	000c0000-56a8-9b24-e5f2-339eefea6530	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-e4c9-4d4ed97a6504	000e0000-56a8-9b23-66a9-6b0ea902d289	000c0000-56a8-9b24-d6ec-a35569efb4b5	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-3a35-c6f78f34fee7	000e0000-56a8-9b23-66a9-6b0ea902d289	000c0000-56a8-9b24-8469-7c9e6525c11e	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-f62f-a0b1be8105da	000e0000-56a8-9b23-350a-aef33fcfb833	000c0000-56a8-9b24-55b3-bf7cc385967f	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
000d0000-56a8-9b23-af49-751cab1eeda3	000e0000-56a8-9b23-350a-aef33fcfb833	000c0000-56a8-9b24-675d-3b1d53ac9808	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a8-9b1e-62ad-f80f2a5aed59
\.


--
-- TOC entry 3162 (class 0 OID 40846939)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40846910)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 40846887)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a8-9b23-0fae-05edf050aa03	00080000-56a8-9b22-44c8-6ef32525f4dd	00090000-56a8-9b22-4656-bf23527f3964	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 40847075)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 40847625)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a8-9b22-d6f8-8c853f4b0a82	00010000-56a8-9b20-1641-e8d6e793a51b	\N	Prva mapa	Root mapa	2016-01-27 11:25:38	2016-01-27 11:25:38	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 40847638)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 40847660)
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
-- TOC entry 3180 (class 0 OID 40847099)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 40846844)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a8-9b20-364a-e0fada89cbcc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a8-9b20-82c2-221c1a8a54e4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a8-9b20-64df-3303ccdd6cfd	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a8-9b20-99d0-012436a546c5	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a8-9b20-e0fa-7e0f3badb542	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a8-9b20-051c-d1088d98ac81	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a8-9b20-1ebe-831782ded2db	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a8-9b20-d1c5-e13cb915be14	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a8-9b20-c329-89f23b780434	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a8-9b20-4d82-ff69557d1e26	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a8-9b20-7d17-27b38be27ca7	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a8-9b20-b2f0-f2c5fc05bdbf	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a8-9b20-8a54-52293644ef21	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a8-9b20-6c6f-035c1e797493	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a8-9b20-bdb5-bf55005c9efc	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a8-9b20-b62c-ea625988600e	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a8-9b20-c2aa-c3a92c3e24f0	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a8-9b21-8592-9621215fa3d1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a8-9b22-7971-b12cb4b86f9b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a8-9b22-eb7e-e4be788c8aa3	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a8-9b22-9e41-0e95f37d3ab1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a8-9b22-4dd0-e7425deda82b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a8-9b25-b685-12ef8d309ab1	application.tenant.maticnopodjetje	string	s:36:"00080000-56a8-9b25-a1a5-0bcebea5923a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 40846744)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a8-9b21-265a-a90955fcedfb	00000000-56a8-9b21-8592-9621215fa3d1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a8-9b22-cf29-83f5a5816f3e	00000000-56a8-9b21-8592-9621215fa3d1	00010000-56a8-9b20-1641-e8d6e793a51b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a8-9b22-c16d-600c3c1a8433	00000000-56a8-9b22-7971-b12cb4b86f9b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 40846811)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a8-9b23-8fb1-1cc2e6f13ca7	\N	00100000-56a8-9b22-a74c-8313d29c5753	00100000-56a8-9b22-57a8-3fe40546c9d2	01	Gledališče Nimbis
00410000-56a8-9b23-073d-308f12329cdf	00410000-56a8-9b23-8fb1-1cc2e6f13ca7	00100000-56a8-9b22-a74c-8313d29c5753	00100000-56a8-9b22-57a8-3fe40546c9d2	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 40846755)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a8-9b22-ae6c-9213c6e40e95	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a8-9b22-8a40-e83b7f42a826	00010000-56a8-9b22-b795-67d38d3b5edc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a8-9b22-0550-b8179cbb42d1	00010000-56a8-9b22-6b5a-37174075e1a0	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a8-9b22-5c9e-21ea0e3f1b21	00010000-56a8-9b22-20fa-0a88c07a2ea6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a8-9b22-10a7-d1717d512105	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a8-9b22-7d3f-1dad436f80c9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a8-9b22-448e-2230cf3ad685	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a8-9b22-2f52-4ed23a905533	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a8-9b22-4656-bf23527f3964	00010000-56a8-9b22-025d-cc8d19a61e70	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a8-9b22-715a-0a66bbfc5809	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a8-9b22-24ee-28babe469259	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-9b22-5720-6594aaf90f8c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a8-9b22-1850-53b50e87ffdf	00010000-56a8-9b22-8203-81bbcbac1c7f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-9b22-3fb0-ab5c4780c130	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-9b22-a1d2-f5726054d619	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-9b22-2ab1-720c2be244a1	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-9b22-9049-e8e85e4e6759	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-9b22-023a-8c91dd7cbf2a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-9b22-2fd6-f6d2675b7b51	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-9b22-dc15-c96417d6a2bd	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-9b22-3183-570c4d56019d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 40846689)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a8-9b1f-61cc-950e1ea7ed36	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a8-9b1f-f5f1-611951984577	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a8-9b1f-cc0c-3478452675c9	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a8-9b1f-d9e6-417322911ef3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a8-9b1f-b6bc-be0998c817ce	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a8-9b1f-ce2e-3704fba6c3ec	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a8-9b1f-22e8-59e4079fc2c0	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a8-9b1f-f386-122e7bc1bdcb	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a8-9b1f-7773-caa624ceb5af	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a8-9b1f-2398-7a07b02a8090	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a8-9b1f-a331-3949ce6c0852	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a8-9b1f-3454-70bab66f5448	Abonma-read	Abonma - branje	t
00030000-56a8-9b1f-9fa1-a9f4c70f37c6	Abonma-write	Abonma - spreminjanje	t
00030000-56a8-9b1f-c643-7c05194f04b5	Alternacija-read	Alternacija - branje	t
00030000-56a8-9b1f-0c36-30b12c27f060	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a8-9b1f-d641-7b3576eee434	Arhivalija-read	Arhivalija - branje	t
00030000-56a8-9b1f-4643-5a2a6a2fbefa	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a8-9b1f-2492-4caec0139d39	AuthStorage-read	AuthStorage - branje	t
00030000-56a8-9b1f-117e-7c9c8094c726	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a8-9b1f-f6ce-84b3398c4d7b	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a8-9b1f-3663-a12f7d1f9b57	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a8-9b1f-c167-eef8dabd10fc	Besedilo-read	Besedilo - branje	t
00030000-56a8-9b1f-0222-50b80d818897	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a8-9b1f-6938-66970b9d8fbe	Dodatek-read	Dodatek - branje	t
00030000-56a8-9b1f-40fe-fee8a5a8a825	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a8-9b1f-8541-9285dcd00147	Dogodek-read	Dogodek - branje	t
00030000-56a8-9b1f-37e8-5dc50ec35661	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a8-9b1f-3ea2-ecf45f463da0	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a8-9b1f-fb4b-ca705a914d26	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a8-9b1f-817d-1134884e07f1	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a8-9b1f-013f-a591ec81ced8	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a8-9b1f-60dd-a5b8039a8fd7	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a8-9b1f-7197-5881266c0233	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a8-9b1f-555f-fdf5e495a32f	DrugiVir-read	DrugiVir - branje	t
00030000-56a8-9b1f-6636-d04194b49829	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a8-9b1f-bd44-e1c2a5030b5f	Drzava-read	Drzava - branje	t
00030000-56a8-9b1f-e628-c757cf9afd2a	Drzava-write	Drzava - spreminjanje	t
00030000-56a8-9b1f-a15c-4504a76438f0	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a8-9b1f-b937-c0d5eca6243d	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a8-9b1f-b274-47e0135aa974	Funkcija-read	Funkcija - branje	t
00030000-56a8-9b1f-aa03-33b289da4cfe	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a8-9b1f-b541-6095dfc83598	Gostovanje-read	Gostovanje - branje	t
00030000-56a8-9b1f-960a-99be7ce8d269	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a8-9b1f-a42f-b1d0ff7be59c	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a8-9b1f-cd40-da4ad66029b1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a8-9b1f-926d-3666c312a2e7	Kupec-read	Kupec - branje	t
00030000-56a8-9b1f-8c41-6ee5c810bfb0	Kupec-write	Kupec - spreminjanje	t
00030000-56a8-9b1f-3d72-1b0b50a5e55e	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a8-9b1f-72ab-ec44a20c8b75	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a8-9b1f-e2b5-b333b5c33781	Option-read	Option - branje	t
00030000-56a8-9b1f-b80d-19a9cb24fd5a	Option-write	Option - spreminjanje	t
00030000-56a8-9b1f-f8d5-6cba3914b76f	OptionValue-read	OptionValue - branje	t
00030000-56a8-9b1f-e46b-fdd05ad11ba7	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a8-9b1f-ab91-3b89b8645711	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a8-9b1f-c993-3c172f2724ab	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a8-9b1f-5334-343e514a3216	Oseba-read	Oseba - branje	t
00030000-56a8-9b1f-9e30-7823e9afc256	Oseba-write	Oseba - spreminjanje	t
00030000-56a8-9b1f-a61d-fa198568e393	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a8-9b1f-25a8-e84282385231	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a8-9b1f-e58c-2278ba615b53	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a8-9b1f-a42f-130296d75796	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a8-9b1f-02f8-d5d62de353c5	Pogodba-read	Pogodba - branje	t
00030000-56a8-9b1f-cdf6-9aa627d6927f	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a8-9b1f-8076-4d601feed313	Popa-read	Popa - branje	t
00030000-56a8-9b1f-7af6-667d07a64863	Popa-write	Popa - spreminjanje	t
00030000-56a8-9b1f-bcdd-ec33aa57d712	Posta-read	Posta - branje	t
00030000-56a8-9b1f-f238-e742b7af9027	Posta-write	Posta - spreminjanje	t
00030000-56a8-9b1f-0b4d-4b084c366f5b	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a8-9b1f-eeb1-9deda605ef6e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a8-9b1f-8a36-623f87f6ca37	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a8-9b1f-27b2-bb0b21901e4d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a8-9b1f-a516-fc9d58a1a128	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a8-9b1f-ba55-cc307b270a27	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a8-9b1f-d462-c28035fb6e35	Praznik-read	Praznik - branje	t
00030000-56a8-9b1f-a5aa-db3dc5d22a51	Praznik-write	Praznik - spreminjanje	t
00030000-56a8-9b1f-a88f-d9d98553c396	Predstava-read	Predstava - branje	t
00030000-56a8-9b1f-8aff-d4cf7c724e66	Predstava-write	Predstava - spreminjanje	t
00030000-56a8-9b1f-bd3d-bacd83627acd	Ura-read	Ura - branje	t
00030000-56a8-9b1f-b091-1789775da454	Ura-write	Ura - spreminjanje	t
00030000-56a8-9b1f-193e-2333006bcab3	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a8-9b1f-7e15-558d9ddecc5c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a8-9b1f-aef6-6cc5e86b1304	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a8-9b1f-61a4-6148cdec9f79	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a8-9b1f-476a-fdb425d4dca2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a8-9b1f-4b38-a348a7ee1ee1	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a8-9b1f-d6bb-7e6f56b7ce1d	ProgramDela-read	ProgramDela - branje	t
00030000-56a8-9b1f-3099-cdb24f28973c	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a8-9b1f-3815-af630a1bb889	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a8-9b1f-04e1-4de04a609d6b	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a8-9b1f-d694-6e16ffa9faaf	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a8-9b1f-d002-6bdbb96eb57a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a8-9b1f-056f-285663d535ea	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a8-9b1f-a6ef-950d133944bc	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a8-9b1f-e2af-54760fdd6d5b	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a8-9b1f-6e2f-b60d24159694	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a8-9b1f-bc09-301d1145027f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a8-9b1f-3b8c-aee9c31f3f1f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a8-9b1f-a7fd-292979ce711e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a8-9b1f-da1a-556c65bfb4ad	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a8-9b1f-5ccc-b5dbe6998c83	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a8-9b1f-1276-d19a1c129fee	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a8-9b1f-88db-e93ae984a9a7	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a8-9b1f-7f97-4ff5fb1f8467	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a8-9b1f-ab7b-a5b6e03c5a18	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a8-9b1f-f007-c15ee57b88c9	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a8-9b1f-3ba4-8ae797c1866e	Prostor-read	Prostor - branje	t
00030000-56a8-9b1f-6620-8a15f8fca60b	Prostor-write	Prostor - spreminjanje	t
00030000-56a8-9b1f-6286-b8dac5ef1fab	Racun-read	Racun - branje	t
00030000-56a8-9b1f-a334-cdcf2d791285	Racun-write	Racun - spreminjanje	t
00030000-56a8-9b1f-cf8a-4f1e8373e86b	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a8-9b1f-8e43-bf851aff583a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a8-9b1f-3bcf-71564a920cba	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a8-9b1f-61ef-a4976aceec8f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a8-9b1f-3540-48d12c3fa651	Rekvizit-read	Rekvizit - branje	t
00030000-56a8-9b1f-1dcb-f68c902c642e	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a8-9b1f-dfc7-784e82ae5d01	Revizija-read	Revizija - branje	t
00030000-56a8-9b1f-3b44-f40675a24c3e	Revizija-write	Revizija - spreminjanje	t
00030000-56a8-9b1f-817b-56d3d74a56c9	Rezervacija-read	Rezervacija - branje	t
00030000-56a8-9b1f-10fb-6fdc24252346	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a8-9b1f-1d31-fdb6b8b80a3d	SedezniRed-read	SedezniRed - branje	t
00030000-56a8-9b1f-e85c-0397de1d600d	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a8-9b1f-946d-14dc9c65c3a3	Sedez-read	Sedez - branje	t
00030000-56a8-9b1f-8076-2be4329de07c	Sedez-write	Sedez - spreminjanje	t
00030000-56a8-9b1f-e6e6-702f0cd37933	Sezona-read	Sezona - branje	t
00030000-56a8-9b1f-e34a-25ad7a4d61e2	Sezona-write	Sezona - spreminjanje	t
00030000-56a8-9b1f-cba5-43bd7cb2e6b0	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a8-9b1f-fa6e-a8b4bb58407c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a8-9b1f-df60-7663bd452353	Telefonska-read	Telefonska - branje	t
00030000-56a8-9b1f-b7da-495049c4a985	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a8-9b1f-8b34-7ac863d86773	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a8-9b1f-d6de-fd8ab1a02780	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a8-9b1f-67ca-28b3d9a2c66b	TipDodatka-read	TipDodatka - branje	t
00030000-56a8-9b1f-f937-444f7fc9b074	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a8-9b1f-0a6e-5c421c3343c1	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a8-9b1f-4b7d-3e5945b79b37	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a8-9b1f-d603-913f62bb7d90	TipPopa-read	TipPopa - branje	t
00030000-56a8-9b1f-3274-f1b6d45ecd58	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a8-9b1f-1d6e-cfa61bdbca15	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a8-9b1f-940a-b30bbc36c754	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a8-9b1f-f70f-d6d8685e8ce0	TipVaje-read	TipVaje - branje	t
00030000-56a8-9b1f-b557-61be8244d84d	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a8-9b1f-33cf-d7f5038cba65	Trr-read	Trr - branje	t
00030000-56a8-9b1f-7248-9d255dbe9566	Trr-write	Trr - spreminjanje	t
00030000-56a8-9b1f-b983-721cff1d960b	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a8-9b1f-26e4-f7d209ea78eb	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a8-9b1f-b3ff-01b55e8b2867	Vaja-read	Vaja - branje	t
00030000-56a8-9b1f-87ba-b45d31ac5f75	Vaja-write	Vaja - spreminjanje	t
00030000-56a8-9b1f-02df-637020849cbd	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a8-9b1f-a1fd-04acb9866fcd	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a8-9b1f-1150-a5f926a12cbe	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a8-9b1f-f9d2-595879fed633	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a8-9b1f-5080-19c4f7c2e82d	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a8-9b1f-83a0-9d1ccb77ae81	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a8-9b1f-f125-174fc6ea7192	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a8-9b1f-5b74-f8fe9ce48144	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a8-9b1f-b9ef-41fc31be4aed	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a8-9b1f-e8ad-e2e1259c045d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a8-9b1f-3c8a-5be2d60dbfa2	Job-read	Branje opravil - samo zase - branje	t
00030000-56a8-9b1f-9a24-7b4d27abd34b	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a8-9b1f-8af9-90efda6812f6	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a8-9b1f-8733-bcf2a0aecbbe	Report-read	Report - branje	t
00030000-56a8-9b1f-dfda-d17f85c99aa9	Report-write	Report - spreminjanje	t
00030000-56a8-9b1f-1278-c72085126ca7	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a8-9b1f-fe6e-4d9480fd6cb3	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a8-9b1f-03bf-5f5962015d18	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a8-9b1f-347b-8de32b262339	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a8-9b1f-ee12-021590f554ec	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a8-9b1f-a5df-c37011a11230	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a8-9b1f-c8f2-aaa29d1e4ebe	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a8-9b1f-6326-d7ae93acd5b2	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a8-9b1f-42f2-ad5e962899d4	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a8-9b1f-5d5d-922b6831fc0c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a8-9b1f-fad7-7c4cd977e784	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a8-9b1f-a86e-f36daaff325f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a8-9b1f-cdce-f06cb209ff97	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a8-9b1f-fc91-2f35c8bd0a4d	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a8-9b1f-7cc8-c9129e639480	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 40846708)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a8-9b1f-05db-377fa0e2c351	00030000-56a8-9b1f-f5f1-611951984577
00020000-56a8-9b1f-05db-377fa0e2c351	00030000-56a8-9b1f-61cc-950e1ea7ed36
00020000-56a8-9b1f-92f2-2ae92778628b	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-3663-a12f7d1f9b57
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-0222-50b80d818897
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-311e-5a5011860b10	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-7a10-b5db3d318f15	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b1f-7a10-b5db3d318f15	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b1f-7a10-b5db3d318f15	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-7a10-b5db3d318f15	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-7a10-b5db3d318f15	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-7a10-b5db3d318f15	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-79c3-adfe735145ce	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b1f-79c3-adfe735145ce	00030000-56a8-9b1f-83a0-9d1ccb77ae81
00020000-56a8-9b1f-79c3-adfe735145ce	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b1f-79c3-adfe735145ce	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b1f-79c3-adfe735145ce	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-79c3-adfe735145ce	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b1f-79c3-adfe735145ce	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b1f-f12f-161f38b709b7	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b1f-f12f-161f38b709b7	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b1f-f12f-161f38b709b7	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b1f-f24c-1139e3388f5a	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b1f-f24c-1139e3388f5a	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-f24c-1139e3388f5a	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-f24c-1139e3388f5a	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b1f-f24c-1139e3388f5a	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-f24c-1139e3388f5a	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b1f-f24c-1139e3388f5a	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-f24c-1139e3388f5a	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b1f-2905-396dea2d0b8c	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-2905-396dea2d0b8c	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-2905-396dea2d0b8c	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-2905-396dea2d0b8c	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-7248-9d255dbe9566
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-ba55-cc307b270a27
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-b7da-495049c4a985
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-c849-b29f016613e1	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-b282-5f74167f9727	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-b282-5f74167f9727	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b1f-b282-5f74167f9727	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b1f-b282-5f74167f9727	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b1f-b282-5f74167f9727	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b1f-b282-5f74167f9727	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-b282-5f74167f9727	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-b7da-495049c4a985
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-ba55-cc307b270a27
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-7248-9d255dbe9566
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-7af6-667d07a64863
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-cd40-da4ad66029b1
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-4b38-a348a7ee1ee1
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-ae25-1eab3ef3842a	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-7046-212976921410	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b1f-8a96-46f2aa161f8b	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b1f-8a96-46f2aa161f8b	00030000-56a8-9b1f-3274-f1b6d45ecd58
00020000-56a8-9b1f-decc-221546e2952c	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b1f-2b49-85194fe8d196	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b1f-2b49-85194fe8d196	00030000-56a8-9b1f-f238-e742b7af9027
00020000-56a8-9b1f-8bc2-2e1ea23e311f	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b1f-e190-4a19bb500d68	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-e190-4a19bb500d68	00030000-56a8-9b1f-e628-c757cf9afd2a
00020000-56a8-9b1f-a1da-1f089d5404ea	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-ed24-0414a872b097	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b1f-ed24-0414a872b097	00030000-56a8-9b1f-e8ad-e2e1259c045d
00020000-56a8-9b1f-fdce-2f7b43dca21f	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b1f-9ec5-4345fa156691	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b1f-9ec5-4345fa156691	00030000-56a8-9b1f-5b74-f8fe9ce48144
00020000-56a8-9b1f-845a-b1abfe99bd5a	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b1f-5f1c-c056fd470d6b	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b1f-5f1c-c056fd470d6b	00030000-56a8-9b1f-9fa1-a9f4c70f37c6
00020000-56a8-9b1f-9c56-99226c520411	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b1f-c3ed-4bff01b0eaef	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b1f-c3ed-4bff01b0eaef	00030000-56a8-9b1f-6620-8a15f8fca60b
00020000-56a8-9b1f-c3ed-4bff01b0eaef	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b1f-c3ed-4bff01b0eaef	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b1f-c3ed-4bff01b0eaef	00030000-56a8-9b1f-ba55-cc307b270a27
00020000-56a8-9b1f-c3ed-4bff01b0eaef	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-5475-98391ddda8c9	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b1f-5475-98391ddda8c9	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b1f-5475-98391ddda8c9	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b1f-ce60-661a8c332e05	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b1f-ce60-661a8c332e05	00030000-56a8-9b1f-f9d2-595879fed633
00020000-56a8-9b1f-a3da-61cee7b4e173	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-c993-3c172f2724ab
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b1f-137d-1e865d004164	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-4269-abbc9688d20d	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b1f-4269-abbc9688d20d	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b1f-4269-abbc9688d20d	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-4269-abbc9688d20d	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-4269-abbc9688d20d	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-a391-2a413542b337	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b1f-a391-2a413542b337	00030000-56a8-9b1f-b557-61be8244d84d
00020000-56a8-9b1f-701b-54465624c72f	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-22e8-59e4079fc2c0
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-f386-122e7bc1bdcb
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-d6bb-7e6f56b7ce1d
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-3099-cdb24f28973c
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-3815-af630a1bb889
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-04e1-4de04a609d6b
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-d694-6e16ffa9faaf
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-d002-6bdbb96eb57a
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-056f-285663d535ea
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-a6ef-950d133944bc
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-e2af-54760fdd6d5b
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-6e2f-b60d24159694
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-bc09-301d1145027f
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-3b8c-aee9c31f3f1f
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-a7fd-292979ce711e
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-da1a-556c65bfb4ad
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-5ccc-b5dbe6998c83
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-1276-d19a1c129fee
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-88db-e93ae984a9a7
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-7f97-4ff5fb1f8467
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-ab7b-a5b6e03c5a18
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-f007-c15ee57b88c9
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-61a4-6148cdec9f79
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-6636-d04194b49829
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-eeb1-9deda605ef6e
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-9a24-7b4d27abd34b
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-555f-fdf5e495a32f
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-aef6-6cc5e86b1304
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-0b4d-4b084c366f5b
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-3c8a-5be2d60dbfa2
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-5844-c1eb5e80ecb8	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-d6bb-7e6f56b7ce1d
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-3815-af630a1bb889
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-d694-6e16ffa9faaf
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-056f-285663d535ea
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-e2af-54760fdd6d5b
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-bc09-301d1145027f
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-a7fd-292979ce711e
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-5ccc-b5dbe6998c83
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-88db-e93ae984a9a7
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-ab7b-a5b6e03c5a18
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-aef6-6cc5e86b1304
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-555f-fdf5e495a32f
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-0b4d-4b084c366f5b
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-3c8a-5be2d60dbfa2
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-82ad-126c5f7bb8e0	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-26e4-f7d209ea78eb
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-2398-7a07b02a8090
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-fbb5-606163f56882	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b1f-e474-585c68b8a9d9	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b1f-a7f1-967df5bdf02c	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b1f-a7f1-967df5bdf02c	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b1f-a7f1-967df5bdf02c	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b1f-a7f1-967df5bdf02c	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b1f-a7f1-967df5bdf02c	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-a7f1-967df5bdf02c	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b1f-a7f1-967df5bdf02c	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b1f-a7f1-967df5bdf02c	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-cdf6-9aa627d6927f
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-fa6e-a8b4bb58407c
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b1f-0fe9-7894890c5f41	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-5721-509796f3e034	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-718d-071ae30db099	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-718d-071ae30db099	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-718d-071ae30db099	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-718d-071ae30db099	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b20-718d-071ae30db099	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-718d-071ae30db099	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-718d-071ae30db099	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-2f69-7caec18ff8f9	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-2f69-7caec18ff8f9	00030000-56a8-9b1f-fa6e-a8b4bb58407c
00020000-56a8-9b20-2f69-7caec18ff8f9	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-2f69-7caec18ff8f9	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-61e2-2da65afbb2ba	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-61e2-2da65afbb2ba	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-3663-a12f7d1f9b57
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-0222-50b80d818897
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-555f-fdf5e495a32f
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-6636-d04194b49829
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-2398-7a07b02a8090
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-3c8a-5be2d60dbfa2
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-9a24-7b4d27abd34b
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-cdf6-9aa627d6927f
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-0b4d-4b084c366f5b
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-eeb1-9deda605ef6e
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-aef6-6cc5e86b1304
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-61a4-6148cdec9f79
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-22e8-59e4079fc2c0
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-d6bb-7e6f56b7ce1d
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-f386-122e7bc1bdcb
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-3099-cdb24f28973c
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-3815-af630a1bb889
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-04e1-4de04a609d6b
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-d694-6e16ffa9faaf
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-d002-6bdbb96eb57a
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-056f-285663d535ea
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-a6ef-950d133944bc
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-e2af-54760fdd6d5b
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-6e2f-b60d24159694
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-bc09-301d1145027f
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-3b8c-aee9c31f3f1f
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-a7fd-292979ce711e
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-da1a-556c65bfb4ad
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-5ccc-b5dbe6998c83
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-1276-d19a1c129fee
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-88db-e93ae984a9a7
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-7f97-4ff5fb1f8467
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-ab7b-a5b6e03c5a18
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-f007-c15ee57b88c9
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-fa6e-a8b4bb58407c
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-26e4-f7d209ea78eb
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b20-d19f-e85711217379	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-3663-a12f7d1f9b57
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-0222-50b80d818897
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b20-fe24-58cd357756e5	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-3663-a12f7d1f9b57
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-0222-50b80d818897
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-2398-7a07b02a8090
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-26e4-f7d209ea78eb
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b20-6e9f-ba15158ca7c5	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-3663-a12f7d1f9b57
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-0222-50b80d818897
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-555f-fdf5e495a32f
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-6636-d04194b49829
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-2398-7a07b02a8090
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-3c8a-5be2d60dbfa2
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-9a24-7b4d27abd34b
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-cd40-da4ad66029b1
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-cdf6-9aa627d6927f
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-7af6-667d07a64863
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-0b4d-4b084c366f5b
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-eeb1-9deda605ef6e
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-ba55-cc307b270a27
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-aef6-6cc5e86b1304
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-61a4-6148cdec9f79
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-4b38-a348a7ee1ee1
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-22e8-59e4079fc2c0
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-d6bb-7e6f56b7ce1d
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-f386-122e7bc1bdcb
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-3099-cdb24f28973c
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-3815-af630a1bb889
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-04e1-4de04a609d6b
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-d694-6e16ffa9faaf
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-d002-6bdbb96eb57a
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-056f-285663d535ea
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-a6ef-950d133944bc
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-e2af-54760fdd6d5b
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-6e2f-b60d24159694
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-bc09-301d1145027f
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-3b8c-aee9c31f3f1f
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-a7fd-292979ce711e
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-da1a-556c65bfb4ad
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-5ccc-b5dbe6998c83
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-1276-d19a1c129fee
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-88db-e93ae984a9a7
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-7f97-4ff5fb1f8467
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-ab7b-a5b6e03c5a18
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-f007-c15ee57b88c9
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-fa6e-a8b4bb58407c
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-b7da-495049c4a985
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-7248-9d255dbe9566
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-26e4-f7d209ea78eb
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-83a0-9d1ccb77ae81
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b20-9a87-65fb6d711952	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-3663-a12f7d1f9b57
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-0222-50b80d818897
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-2398-7a07b02a8090
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-cd40-da4ad66029b1
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-7af6-667d07a64863
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-ba55-cc307b270a27
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-4b38-a348a7ee1ee1
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-b7da-495049c4a985
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-7248-9d255dbe9566
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-26e4-f7d209ea78eb
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-83a0-9d1ccb77ae81
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b20-a111-3168edb65ea9	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b20-ceea-d1cf0fde045a	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-555f-fdf5e495a32f
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-6636-d04194b49829
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-3c8a-5be2d60dbfa2
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-9a24-7b4d27abd34b
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-cd40-da4ad66029b1
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-c993-3c172f2724ab
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-cdf6-9aa627d6927f
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-7af6-667d07a64863
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-0b4d-4b084c366f5b
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-eeb1-9deda605ef6e
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-ba55-cc307b270a27
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-aef6-6cc5e86b1304
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-61a4-6148cdec9f79
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-4b38-a348a7ee1ee1
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-22e8-59e4079fc2c0
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-d6bb-7e6f56b7ce1d
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-f386-122e7bc1bdcb
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-3099-cdb24f28973c
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-3815-af630a1bb889
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-04e1-4de04a609d6b
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-d694-6e16ffa9faaf
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-d002-6bdbb96eb57a
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-056f-285663d535ea
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-a6ef-950d133944bc
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-e2af-54760fdd6d5b
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-6e2f-b60d24159694
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-bc09-301d1145027f
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-3b8c-aee9c31f3f1f
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-a7fd-292979ce711e
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-da1a-556c65bfb4ad
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-5ccc-b5dbe6998c83
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-1276-d19a1c129fee
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-88db-e93ae984a9a7
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-7f97-4ff5fb1f8467
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-ab7b-a5b6e03c5a18
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-f007-c15ee57b88c9
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-fa6e-a8b4bb58407c
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-b7da-495049c4a985
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-7248-9d255dbe9566
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-f9d2-595879fed633
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-83a0-9d1ccb77ae81
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b20-eeeb-8a31f07c6b2f	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-61cc-950e1ea7ed36
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f5f1-611951984577
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3454-70bab66f5448
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-9fa1-a9f4c70f37c6
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-d641-7b3576eee434
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-4643-5a2a6a2fbefa
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-2492-4caec0139d39
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-117e-7c9c8094c726
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f6ce-84b3398c4d7b
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3663-a12f7d1f9b57
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-c167-eef8dabd10fc
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-0222-50b80d818897
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8541-9285dcd00147
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-d9e6-417322911ef3
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3ea2-ecf45f463da0
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-fb4b-ca705a914d26
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-817d-1134884e07f1
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-013f-a591ec81ced8
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-60dd-a5b8039a8fd7
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-7197-5881266c0233
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-37e8-5dc50ec35661
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-555f-fdf5e495a32f
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-6636-d04194b49829
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-bd44-e1c2a5030b5f
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e628-c757cf9afd2a
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a15c-4504a76438f0
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b937-c0d5eca6243d
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-2398-7a07b02a8090
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b541-6095dfc83598
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-960a-99be7ce8d269
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8af9-90efda6812f6
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3c8a-5be2d60dbfa2
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-9a24-7b4d27abd34b
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a42f-b1d0ff7be59c
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-cd40-da4ad66029b1
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-926d-3666c312a2e7
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8c41-6ee5c810bfb0
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-c8f2-aaa29d1e4ebe
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a5df-c37011a11230
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-fe6e-4d9480fd6cb3
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-03bf-5f5962015d18
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-347b-8de32b262339
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-ee12-021590f554ec
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3d72-1b0b50a5e55e
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-72ab-ec44a20c8b75
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e2b5-b333b5c33781
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f8d5-6cba3914b76f
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e46b-fdd05ad11ba7
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a331-3949ce6c0852
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b80d-19a9cb24fd5a
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-ab91-3b89b8645711
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-c993-3c172f2724ab
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a61d-fa198568e393
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-25a8-e84282385231
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e58c-2278ba615b53
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a42f-130296d75796
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-cdf6-9aa627d6927f
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-7af6-667d07a64863
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-bcdd-ec33aa57d712
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-0b4d-4b084c366f5b
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-eeb1-9deda605ef6e
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8a36-623f87f6ca37
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-27b2-bb0b21901e4d
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f238-e742b7af9027
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-ba55-cc307b270a27
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-d462-c28035fb6e35
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a5aa-db3dc5d22a51
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a88f-d9d98553c396
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8aff-d4cf7c724e66
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-193e-2333006bcab3
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-7e15-558d9ddecc5c
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-aef6-6cc5e86b1304
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-61a4-6148cdec9f79
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-476a-fdb425d4dca2
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-4b38-a348a7ee1ee1
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-22e8-59e4079fc2c0
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-d6bb-7e6f56b7ce1d
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f386-122e7bc1bdcb
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3099-cdb24f28973c
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3815-af630a1bb889
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-04e1-4de04a609d6b
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-d694-6e16ffa9faaf
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-d002-6bdbb96eb57a
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-056f-285663d535ea
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a6ef-950d133944bc
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e2af-54760fdd6d5b
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-6e2f-b60d24159694
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-bc09-301d1145027f
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3b8c-aee9c31f3f1f
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a7fd-292979ce711e
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-da1a-556c65bfb4ad
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-5ccc-b5dbe6998c83
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-1276-d19a1c129fee
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-88db-e93ae984a9a7
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-7f97-4ff5fb1f8467
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-ab7b-a5b6e03c5a18
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f007-c15ee57b88c9
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3ba4-8ae797c1866e
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-6620-8a15f8fca60b
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-6286-b8dac5ef1fab
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a334-cdcf2d791285
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-cf8a-4f1e8373e86b
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8e43-bf851aff583a
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3bcf-71564a920cba
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-61ef-a4976aceec8f
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3540-48d12c3fa651
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-1dcb-f68c902c642e
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8733-bcf2a0aecbbe
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-dfda-d17f85c99aa9
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-dfc7-784e82ae5d01
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3b44-f40675a24c3e
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-817b-56d3d74a56c9
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-10fb-6fdc24252346
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-1d31-fdb6b8b80a3d
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e85c-0397de1d600d
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-946d-14dc9c65c3a3
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8076-2be4329de07c
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e6e6-702f0cd37933
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e34a-25ad7a4d61e2
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-1278-c72085126ca7
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-fa6e-a8b4bb58407c
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b7da-495049c4a985
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-8b34-7ac863d86773
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-cc0c-3478452675c9
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-d6de-fd8ab1a02780
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-0a6e-5c421c3343c1
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-4b7d-3e5945b79b37
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-d603-913f62bb7d90
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-3274-f1b6d45ecd58
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-1d6e-cfa61bdbca15
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-940a-b30bbc36c754
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f70f-d6d8685e8ce0
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b557-61be8244d84d
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-7248-9d255dbe9566
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-26e4-f7d209ea78eb
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b3ff-01b55e8b2867
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-87ba-b45d31ac5f75
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-02df-637020849cbd
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a1fd-04acb9866fcd
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-1150-a5f926a12cbe
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f9d2-595879fed633
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-cdce-f06cb209ff97
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-a86e-f36daaff325f
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-83a0-9d1ccb77ae81
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-f125-174fc6ea7192
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-5b74-f8fe9ce48144
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-b9ef-41fc31be4aed
00020000-56a8-9b22-5dc4-9977e0ba8cb4	00030000-56a8-9b1f-e8ad-e2e1259c045d
00020000-56a8-9b22-6ff7-d51694e51d5e	00030000-56a8-9b1f-fad7-7c4cd977e784
00020000-56a8-9b22-8bf1-7a4219e1b755	00030000-56a8-9b1f-5d5d-922b6831fc0c
00020000-56a8-9b22-e869-5daffcf547f7	00030000-56a8-9b1f-26e4-f7d209ea78eb
00020000-56a8-9b22-c3bd-9105c2dde62f	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b22-50a9-99b94d2c912f	00030000-56a8-9b1f-03bf-5f5962015d18
00020000-56a8-9b22-02f4-0aba9480dcca	00030000-56a8-9b1f-347b-8de32b262339
00020000-56a8-9b22-9556-72a31cd890a1	00030000-56a8-9b1f-ee12-021590f554ec
00020000-56a8-9b22-2456-d6913c24c957	00030000-56a8-9b1f-fe6e-4d9480fd6cb3
00020000-56a8-9b22-b7fa-4194a6865d24	00030000-56a8-9b1f-c8f2-aaa29d1e4ebe
00020000-56a8-9b22-a49e-4f3cc65cac11	00030000-56a8-9b1f-a5df-c37011a11230
00020000-56a8-9b22-9f2f-ca72a89a48e2	00030000-56a8-9b1f-42f2-ad5e962899d4
00020000-56a8-9b22-2887-abfe7ce3b5b4	00030000-56a8-9b1f-6326-d7ae93acd5b2
00020000-56a8-9b22-95ed-7a00d7085d90	00030000-56a8-9b1f-5334-343e514a3216
00020000-56a8-9b22-98d1-f5d5f3ece34e	00030000-56a8-9b1f-9e30-7823e9afc256
00020000-56a8-9b22-58d0-9a57081bcb9f	00030000-56a8-9b1f-b6bc-be0998c817ce
00020000-56a8-9b22-eb34-68dd211a424c	00030000-56a8-9b1f-ce2e-3704fba6c3ec
00020000-56a8-9b22-537b-0d07acb67954	00030000-56a8-9b1f-fc91-2f35c8bd0a4d
00020000-56a8-9b22-9d14-50c490d6d730	00030000-56a8-9b1f-7cc8-c9129e639480
00020000-56a8-9b22-056e-e24e960a2ccb	00030000-56a8-9b1f-8076-4d601feed313
00020000-56a8-9b22-056e-e24e960a2ccb	00030000-56a8-9b1f-7af6-667d07a64863
00020000-56a8-9b22-056e-e24e960a2ccb	00030000-56a8-9b1f-b983-721cff1d960b
00020000-56a8-9b22-a41c-0a38409cd38e	00030000-56a8-9b1f-33cf-d7f5038cba65
00020000-56a8-9b22-bbdb-5d64ad40d7d9	00030000-56a8-9b1f-7248-9d255dbe9566
00020000-56a8-9b22-f4b7-1a1f35bca3bf	00030000-56a8-9b1f-1278-c72085126ca7
00020000-56a8-9b22-a82d-1fe466f9cb38	00030000-56a8-9b1f-df60-7663bd452353
00020000-56a8-9b22-379f-543626721276	00030000-56a8-9b1f-b7da-495049c4a985
00020000-56a8-9b22-efee-5dfe7dc29d7f	00030000-56a8-9b1f-a516-fc9d58a1a128
00020000-56a8-9b22-c8fa-b4b448105df5	00030000-56a8-9b1f-ba55-cc307b270a27
00020000-56a8-9b22-9e98-560576148fe3	00030000-56a8-9b1f-5080-19c4f7c2e82d
00020000-56a8-9b22-eacc-a83596f8dc10	00030000-56a8-9b1f-83a0-9d1ccb77ae81
00020000-56a8-9b22-529a-928d986a8dd6	00030000-56a8-9b1f-02f8-d5d62de353c5
00020000-56a8-9b22-0aa8-f22bf1481243	00030000-56a8-9b1f-cdf6-9aa627d6927f
00020000-56a8-9b22-e451-45a6345aa09c	00030000-56a8-9b1f-cba5-43bd7cb2e6b0
00020000-56a8-9b22-3ccf-a71ccaeb04d3	00030000-56a8-9b1f-fa6e-a8b4bb58407c
00020000-56a8-9b22-5d1b-cff6e8c16682	00030000-56a8-9b1f-c643-7c05194f04b5
00020000-56a8-9b22-e1d2-e2f52864d68a	00030000-56a8-9b1f-0c36-30b12c27f060
00020000-56a8-9b22-e589-1a6a6463450b	00030000-56a8-9b1f-7773-caa624ceb5af
00020000-56a8-9b22-189f-c690c311a9ca	00030000-56a8-9b1f-b274-47e0135aa974
00020000-56a8-9b22-0b25-4dd20b406775	00030000-56a8-9b1f-aa03-33b289da4cfe
00020000-56a8-9b22-f15f-16d71edb372e	00030000-56a8-9b1f-2398-7a07b02a8090
\.


--
-- TOC entry 3181 (class 0 OID 40847106)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 40847141)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 40847274)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a8-9b22-6cea-7cbe289efcb0	00090000-56a8-9b22-ae6c-9213c6e40e95	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a8-9b22-4fb7-ba0827fe8bf2	00090000-56a8-9b22-7d3f-1dad436f80c9	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a8-9b22-7b1d-1966eddd80b4	00090000-56a8-9b22-1850-53b50e87ffdf	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a8-9b22-cb10-71ef5480b3cf	00090000-56a8-9b22-715a-0a66bbfc5809	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 40846791)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a8-9b22-44c8-6ef32525f4dd	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-9b22-29c8-1667faf6c930	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a8-9b22-f643-972037c74e75	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-9b22-9f03-a2497d6be150	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-9b22-ef77-60475c5c618c	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-9b22-6026-4da7f5bf6c01	\N	00040000-56a8-9b1e-ee64-22792b6a01a2	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-9b22-8389-79f535d865e7	\N	00040000-56a8-9b1e-a73b-cea8588e7b38	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-9b22-b071-1a9b3c23cb41	\N	00040000-56a8-9b1e-3032-22646fc8d056	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-9b22-2c8d-637c7aed1bc8	\N	00040000-56a8-9b1f-516b-2457999aabb6	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-9b25-a1a5-0bcebea5923a	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 40846836)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a8-9b1e-7ef4-eaf506e03ba7	8341	Adlešiči
00050000-56a8-9b1e-9c5f-d8981da8d519	5270	Ajdovščina
00050000-56a8-9b1e-999a-723eb8f21b29	6280	Ankaran/Ancarano
00050000-56a8-9b1e-130a-cc7f6b12761d	9253	Apače
00050000-56a8-9b1e-06ec-ef06d757b2d2	8253	Artiče
00050000-56a8-9b1e-d29f-3aeb7ee5179d	4275	Begunje na Gorenjskem
00050000-56a8-9b1e-0c39-daa98a5a8918	1382	Begunje pri Cerknici
00050000-56a8-9b1e-7aba-d74477fe965d	9231	Beltinci
00050000-56a8-9b1e-358c-54a60edc691a	2234	Benedikt
00050000-56a8-9b1e-ea7e-434100869f77	2345	Bistrica ob Dravi
00050000-56a8-9b1e-ebb3-fd0fe650aa6b	3256	Bistrica ob Sotli
00050000-56a8-9b1e-b83c-7928c8d5a5fa	8259	Bizeljsko
00050000-56a8-9b1e-4808-31a0a24c7c75	1223	Blagovica
00050000-56a8-9b1e-441a-2144b37a43b4	8283	Blanca
00050000-56a8-9b1e-4133-fbc30479b889	4260	Bled
00050000-56a8-9b1e-de5e-8791530c9f7e	4273	Blejska Dobrava
00050000-56a8-9b1e-3c7b-07a2bbbe169e	9265	Bodonci
00050000-56a8-9b1e-ed1b-f60ca83e4739	9222	Bogojina
00050000-56a8-9b1e-1db6-f7104eb819d9	4263	Bohinjska Bela
00050000-56a8-9b1e-21e5-adf9f911f48f	4264	Bohinjska Bistrica
00050000-56a8-9b1e-5e75-a0a5924d972a	4265	Bohinjsko jezero
00050000-56a8-9b1e-47a6-ba26edfd43cc	1353	Borovnica
00050000-56a8-9b1e-fb10-f356cc9c3ecc	8294	Boštanj
00050000-56a8-9b1e-ab26-495086fa8f87	5230	Bovec
00050000-56a8-9b1e-bd95-bef1e6db3001	5295	Branik
00050000-56a8-9b1e-9926-ee256195eeec	3314	Braslovče
00050000-56a8-9b1e-cd33-885461a64a31	5223	Breginj
00050000-56a8-9b1e-d9d7-fda975935f16	8280	Brestanica
00050000-56a8-9b1e-6745-5e4e8bb0e024	2354	Bresternica
00050000-56a8-9b1e-6308-7f4218b159b5	4243	Brezje
00050000-56a8-9b1e-5e43-034b5b6712f1	1351	Brezovica pri Ljubljani
00050000-56a8-9b1e-7bcd-d3eb14143545	8250	Brežice
00050000-56a8-9b1e-50cc-9c746b141743	4210	Brnik - Aerodrom
00050000-56a8-9b1e-3532-ef9dc33bb71d	8321	Brusnice
00050000-56a8-9b1e-d6eb-740b426bb6b0	3255	Buče
00050000-56a8-9b1e-9754-31bb4337de5b	8276	Bučka 
00050000-56a8-9b1e-0015-4fe245bf4cd3	9261	Cankova
00050000-56a8-9b1e-f33d-f90da5f014aa	3000	Celje 
00050000-56a8-9b1e-b375-17f3c6c9f05f	3001	Celje - poštni predali
00050000-56a8-9b1e-2921-354b6ed868d3	4207	Cerklje na Gorenjskem
00050000-56a8-9b1e-c665-5fbb7f845247	8263	Cerklje ob Krki
00050000-56a8-9b1e-0138-c0e58c15b546	1380	Cerknica
00050000-56a8-9b1e-c9ce-a1c0a1ce870d	5282	Cerkno
00050000-56a8-9b1e-bdbd-a56114a46df8	2236	Cerkvenjak
00050000-56a8-9b1e-2ad5-bb05d9c5d6b3	2215	Ceršak
00050000-56a8-9b1e-5c0a-935bb57017e0	2326	Cirkovce
00050000-56a8-9b1e-9143-d31f143b41b2	2282	Cirkulane
00050000-56a8-9b1e-2698-3bf66ff5f8e2	5273	Col
00050000-56a8-9b1e-b9ae-5cd48e144388	8251	Čatež ob Savi
00050000-56a8-9b1e-830a-5aa479f8e21e	1413	Čemšenik
00050000-56a8-9b1e-1845-5a0ee9247ee2	5253	Čepovan
00050000-56a8-9b1e-fcf1-01751dd3858e	9232	Črenšovci
00050000-56a8-9b1e-ddf8-f67f40b2cd97	2393	Črna na Koroškem
00050000-56a8-9b1e-0143-47cbc5396292	6275	Črni Kal
00050000-56a8-9b1e-a1c2-7d48b2ea272f	5274	Črni Vrh nad Idrijo
00050000-56a8-9b1e-11ff-e2afe4830eec	5262	Črniče
00050000-56a8-9b1e-804c-0edfb3cace8e	8340	Črnomelj
00050000-56a8-9b1e-f794-38c8d94f20d0	6271	Dekani
00050000-56a8-9b1e-dce4-a4fbeeae60d4	5210	Deskle
00050000-56a8-9b1e-c53c-59e6a48508b5	2253	Destrnik
00050000-56a8-9b1e-2e3a-930cf5c41bf6	6215	Divača
00050000-56a8-9b1e-ce57-afb8ab159d97	1233	Dob
00050000-56a8-9b1e-7be7-920076399663	3224	Dobje pri Planini
00050000-56a8-9b1e-55a7-45a84ec76f1a	8257	Dobova
00050000-56a8-9b1e-3185-ebd793e08f46	1423	Dobovec
00050000-56a8-9b1e-8269-e260945c2da6	5263	Dobravlje
00050000-56a8-9b1e-d0b9-ecc551e3d863	3204	Dobrna
00050000-56a8-9b1e-64b4-33900e6f8e62	8211	Dobrnič
00050000-56a8-9b1e-be9e-1d189497f530	1356	Dobrova
00050000-56a8-9b1e-b578-f8c9c848d755	9223	Dobrovnik/Dobronak 
00050000-56a8-9b1e-b19c-247fe54ed956	5212	Dobrovo v Brdih
00050000-56a8-9b1e-638f-fcfc0928085e	1431	Dol pri Hrastniku
00050000-56a8-9b1e-1e58-43968187fc48	1262	Dol pri Ljubljani
00050000-56a8-9b1e-ed69-c13dfbe4c7cc	1273	Dole pri Litiji
00050000-56a8-9b1e-cd8f-294d5ffa0399	1331	Dolenja vas
00050000-56a8-9b1e-52e9-ee53c7b0ad2f	8350	Dolenjske Toplice
00050000-56a8-9b1e-f142-af1f0d0cd26f	1230	Domžale
00050000-56a8-9b1e-3395-7f7b94c09461	2252	Dornava
00050000-56a8-9b1e-e780-f789780e146a	5294	Dornberk
00050000-56a8-9b1e-1abf-5ec8c86eda96	1319	Draga
00050000-56a8-9b1e-f1cd-c7558c1317d7	8343	Dragatuš
00050000-56a8-9b1e-8bbd-cd71cc261718	3222	Dramlje
00050000-56a8-9b1e-8092-d580d9f60951	2370	Dravograd
00050000-56a8-9b1e-3cd0-25042dcdb183	4203	Duplje
00050000-56a8-9b1e-6b01-23ee4a41707a	6221	Dutovlje
00050000-56a8-9b1e-e7f3-e5ef7c91fb2e	8361	Dvor
00050000-56a8-9b1e-2d4b-136dacf00f4a	2343	Fala
00050000-56a8-9b1e-e587-b3809c93eebf	9208	Fokovci
00050000-56a8-9b1e-a190-a1b25c175712	2313	Fram
00050000-56a8-9b1e-ce11-1b64c60d8a78	3213	Frankolovo
00050000-56a8-9b1e-35b9-9e8dd231b459	1274	Gabrovka
00050000-56a8-9b1e-033c-72e6c6276279	8254	Globoko
00050000-56a8-9b1e-6b3a-cd9e70f7b786	5275	Godovič
00050000-56a8-9b1e-6274-0bcd23e97fc1	4204	Golnik
00050000-56a8-9b1e-99e6-7546fc2e414c	3303	Gomilsko
00050000-56a8-9b1e-88cb-2a322de028df	4224	Gorenja vas
00050000-56a8-9b1e-1f38-1b5b2edd2a8e	3263	Gorica pri Slivnici
00050000-56a8-9b1e-74ec-3c1ffaf92d58	2272	Gorišnica
00050000-56a8-9b1e-050a-04a03a20bc3e	9250	Gornja Radgona
00050000-56a8-9b1e-c866-0cd91a2d0955	3342	Gornji Grad
00050000-56a8-9b1e-e803-2476eead1325	4282	Gozd Martuljek
00050000-56a8-9b1e-ed34-2445741fa85f	6272	Gračišče
00050000-56a8-9b1e-731d-5622588c085f	9264	Grad
00050000-56a8-9b1e-300b-59f0f4c23a24	8332	Gradac
00050000-56a8-9b1e-cfbb-27e77a1e550d	1384	Grahovo
00050000-56a8-9b1e-3fd1-1482d85da275	5242	Grahovo ob Bači
00050000-56a8-9b1e-ddc8-fc3a8e626616	5251	Grgar
00050000-56a8-9b1e-88a8-65be3c8f8332	3302	Griže
00050000-56a8-9b1e-b444-7cec914cd339	3231	Grobelno
00050000-56a8-9b1e-0bb7-13f2db630ff5	1290	Grosuplje
00050000-56a8-9b1e-d937-e058f1861c4a	2288	Hajdina
00050000-56a8-9b1e-2308-6ac196c84a6e	8362	Hinje
00050000-56a8-9b1e-3186-065623b94293	2311	Hoče
00050000-56a8-9b1e-02c9-516139c567b1	9205	Hodoš/Hodos
00050000-56a8-9b1e-c7b7-eaa6fb1fa07e	1354	Horjul
00050000-56a8-9b1e-427f-a4b06b0b9fff	1372	Hotedršica
00050000-56a8-9b1e-8f33-7e9831d6b7ba	1430	Hrastnik
00050000-56a8-9b1e-3fae-9798a16cb2b4	6225	Hruševje
00050000-56a8-9b1e-9481-a893448abf2a	4276	Hrušica
00050000-56a8-9b1e-e05a-b01a73ac2c20	5280	Idrija
00050000-56a8-9b1e-5e60-096b3c0cba57	1292	Ig
00050000-56a8-9b1e-3814-b6194b9e6828	6250	Ilirska Bistrica
00050000-56a8-9b1e-7ea2-de6333a7373d	6251	Ilirska Bistrica-Trnovo
00050000-56a8-9b1e-1655-74d81bdf31b3	1295	Ivančna Gorica
00050000-56a8-9b1e-ed0a-d7c79da1b35a	2259	Ivanjkovci
00050000-56a8-9b1e-79d4-06ee805ad1cb	1411	Izlake
00050000-56a8-9b1e-4b6f-903ee05bcb65	6310	Izola/Isola
00050000-56a8-9b1e-3875-1ef7d3fa5fbe	2222	Jakobski Dol
00050000-56a8-9b1e-0437-d74c6cfcebf8	2221	Jarenina
00050000-56a8-9b1e-f159-32fd19635c70	6254	Jelšane
00050000-56a8-9b1e-7b60-48cafb439a88	4270	Jesenice
00050000-56a8-9b1e-df10-12ed6bc4032f	8261	Jesenice na Dolenjskem
00050000-56a8-9b1e-75cb-acc622514dab	3273	Jurklošter
00050000-56a8-9b1e-d1d9-bba545adc509	2223	Jurovski Dol
00050000-56a8-9b1e-6640-012bc5c27cba	2256	Juršinci
00050000-56a8-9b1e-ab11-8624f5193c0d	5214	Kal nad Kanalom
00050000-56a8-9b1e-90dd-8e7945ee562d	3233	Kalobje
00050000-56a8-9b1e-03be-174f3eda7e5f	4246	Kamna Gorica
00050000-56a8-9b1e-c1f9-a3e45af34a5b	2351	Kamnica
00050000-56a8-9b1e-da99-6a578c3e6c96	1241	Kamnik
00050000-56a8-9b1e-9894-b00c3a585284	5213	Kanal
00050000-56a8-9b1e-3f23-48e242f9ddd2	8258	Kapele
00050000-56a8-9b1e-a734-e9a8adf89a2b	2362	Kapla
00050000-56a8-9b1e-c664-1399a5a35a63	2325	Kidričevo
00050000-56a8-9b1e-d2cd-40920ed5e929	1412	Kisovec
00050000-56a8-9b1e-a5a1-809ffd1111d6	6253	Knežak
00050000-56a8-9b1e-b475-b3bbdd74f7db	5222	Kobarid
00050000-56a8-9b1e-0dbc-306bce451400	9227	Kobilje
00050000-56a8-9b1e-2ab6-9a6f733e5d23	1330	Kočevje
00050000-56a8-9b1e-2bb9-6a408a3d51f6	1338	Kočevska Reka
00050000-56a8-9b1e-9915-59869a31d6f7	2276	Kog
00050000-56a8-9b1e-1337-3caadd6f1610	5211	Kojsko
00050000-56a8-9b1e-e3b9-70b267a62d9e	6223	Komen
00050000-56a8-9b1e-1b08-442dd72875fd	1218	Komenda
00050000-56a8-9b1e-5709-816015d22f9b	6000	Koper/Capodistria 
00050000-56a8-9b1e-0a60-94c7a8b427c5	6001	Koper/Capodistria - poštni predali
00050000-56a8-9b1e-7197-a38361abdd3c	8282	Koprivnica
00050000-56a8-9b1e-5c25-b22c79abaaff	5296	Kostanjevica na Krasu
00050000-56a8-9b1e-112a-de6fe26ccdf8	8311	Kostanjevica na Krki
00050000-56a8-9b1e-a64e-008d84efa31d	1336	Kostel
00050000-56a8-9b1e-df5d-e81ebb5887ca	6256	Košana
00050000-56a8-9b1e-4244-daad42e9dafa	2394	Kotlje
00050000-56a8-9b1e-c24f-d3b9986f62a8	6240	Kozina
00050000-56a8-9b1e-b64c-5108a72bd6da	3260	Kozje
00050000-56a8-9b1e-53ad-65286f221ba2	4000	Kranj 
00050000-56a8-9b1e-28cc-faf6d328e077	4001	Kranj - poštni predali
00050000-56a8-9b1e-9a97-cf49daa05a3c	4280	Kranjska Gora
00050000-56a8-9b1e-05db-edba4811050d	1281	Kresnice
00050000-56a8-9b1e-456f-34808e0e7bdb	4294	Križe
00050000-56a8-9b1e-85f2-6ef956af228e	9206	Križevci
00050000-56a8-9b1e-40e1-eb11989a1e0c	9242	Križevci pri Ljutomeru
00050000-56a8-9b1e-5d8f-56b1065f5fc7	1301	Krka
00050000-56a8-9b1e-30c9-fab1df425dc8	8296	Krmelj
00050000-56a8-9b1e-31f6-c8f487514c71	4245	Kropa
00050000-56a8-9b1e-2f76-9554912db759	8262	Krška vas
00050000-56a8-9b1e-b52a-c15aadd5b301	8270	Krško
00050000-56a8-9b1e-c390-c9d85394f235	9263	Kuzma
00050000-56a8-9b1e-645a-c07e5d16689f	2318	Laporje
00050000-56a8-9b1e-cecc-9ab09edff2e9	3270	Laško
00050000-56a8-9b1e-d838-aa68dbcd1b4c	1219	Laze v Tuhinju
00050000-56a8-9b1e-1672-2e68097efc27	2230	Lenart v Slovenskih goricah
00050000-56a8-9b1e-1625-663eb392dbfb	9220	Lendava/Lendva
00050000-56a8-9b1e-9daa-ed6ecc95b5a2	4248	Lesce
00050000-56a8-9b1e-0783-fa24a25f46f0	3261	Lesično
00050000-56a8-9b1e-6846-44c4c3ec20f8	8273	Leskovec pri Krškem
00050000-56a8-9b1e-f40e-aab75121314e	2372	Libeliče
00050000-56a8-9b1e-064d-cfbfde56aa1b	2341	Limbuš
00050000-56a8-9b1e-bc81-a70dbd465434	1270	Litija
00050000-56a8-9b1e-1f6c-70b2d9b9a630	3202	Ljubečna
00050000-56a8-9b1e-4e69-c083572f23cc	1000	Ljubljana 
00050000-56a8-9b1e-bb3f-514c6cd53141	1001	Ljubljana - poštni predali
00050000-56a8-9b1e-0f1e-abe1cd295e2b	1231	Ljubljana - Črnuče
00050000-56a8-9b1e-9f41-4cf65a53e617	1261	Ljubljana - Dobrunje
00050000-56a8-9b1e-84c2-cd2802e53fb0	1260	Ljubljana - Polje
00050000-56a8-9b1e-f684-d35ae278b729	1210	Ljubljana - Šentvid
00050000-56a8-9b1e-b1f5-536932179f0e	1211	Ljubljana - Šmartno
00050000-56a8-9b1e-2b93-2ad4cd3cf040	3333	Ljubno ob Savinji
00050000-56a8-9b1e-4508-632bcee4c652	9240	Ljutomer
00050000-56a8-9b1e-ecf7-b13ba7e3cc9e	3215	Loče
00050000-56a8-9b1e-b4df-5abb7c8ff524	5231	Log pod Mangartom
00050000-56a8-9b1e-c811-940397bb18bc	1358	Log pri Brezovici
00050000-56a8-9b1e-82a5-9bc4740436f0	1370	Logatec
00050000-56a8-9b1e-f8dc-e0e0ce9e59bc	1371	Logatec
00050000-56a8-9b1e-732f-b505b2c27ff1	1434	Loka pri Zidanem Mostu
00050000-56a8-9b1e-0c1d-86592482f667	3223	Loka pri Žusmu
00050000-56a8-9b1e-a00e-5caaf616098a	6219	Lokev
00050000-56a8-9b1e-8b3d-bf1ffd4e3aa8	1318	Loški Potok
00050000-56a8-9b1e-44ac-a918f5e9874e	2324	Lovrenc na Dravskem polju
00050000-56a8-9b1e-acfc-1c4b3a773855	2344	Lovrenc na Pohorju
00050000-56a8-9b1e-bd8f-6eca17e9a909	3334	Luče
00050000-56a8-9b1e-2459-df05b9b78a8c	1225	Lukovica
00050000-56a8-9b1e-c8f7-fbb64f683301	9202	Mačkovci
00050000-56a8-9b1e-5bae-4866676998bd	2322	Majšperk
00050000-56a8-9b1e-c248-11ae89407c35	2321	Makole
00050000-56a8-9b1e-58f0-f0ba0727798e	9243	Mala Nedelja
00050000-56a8-9b1e-93b0-d953a3235430	2229	Malečnik
00050000-56a8-9b1e-89b2-673e4c112584	6273	Marezige
00050000-56a8-9b1e-c6ca-3a8402c2eca1	2000	Maribor 
00050000-56a8-9b1e-db34-a75955df48ac	2001	Maribor - poštni predali
00050000-56a8-9b1e-3095-e0ece2280d15	2206	Marjeta na Dravskem polju
00050000-56a8-9b1e-e8c2-e1e7491f3197	2281	Markovci
00050000-56a8-9b1e-405a-7de441dbdbad	9221	Martjanci
00050000-56a8-9b1e-ddc8-8c7472750c17	6242	Materija
00050000-56a8-9b1e-9190-7243afb3d23e	4211	Mavčiče
00050000-56a8-9b1e-d2ae-077b9cf8233c	1215	Medvode
00050000-56a8-9b1e-aacc-40fe1b54f471	1234	Mengeš
00050000-56a8-9b1e-16ed-eabafeb3506c	8330	Metlika
00050000-56a8-9b1e-cf79-95e22f6bbdd2	2392	Mežica
00050000-56a8-9b1e-d2be-103a0a738cfc	2204	Miklavž na Dravskem polju
00050000-56a8-9b1e-e2b4-1bf1a321f73b	2275	Miklavž pri Ormožu
00050000-56a8-9b1e-289f-35879de528f0	5291	Miren
00050000-56a8-9b1e-6655-0b361e4dd23f	8233	Mirna
00050000-56a8-9b1e-b657-d096b36f20ea	8216	Mirna Peč
00050000-56a8-9b1e-5043-0ead30360f17	2382	Mislinja
00050000-56a8-9b1e-68d5-7c18089a8866	4281	Mojstrana
00050000-56a8-9b1e-4aaa-b44f966c8b2c	8230	Mokronog
00050000-56a8-9b1e-7055-2e484d94d59d	1251	Moravče
00050000-56a8-9b1e-5cb0-d0aa23294837	9226	Moravske Toplice
00050000-56a8-9b1e-f2a0-faf0f2774a64	5216	Most na Soči
00050000-56a8-9b1e-665d-a01f043cf5c6	1221	Motnik
00050000-56a8-9b1e-17c9-5bfc3f6316de	3330	Mozirje
00050000-56a8-9b1e-cf30-b911ef6fb211	9000	Murska Sobota 
00050000-56a8-9b1e-25c5-9b3886f00096	9001	Murska Sobota - poštni predali
00050000-56a8-9b1e-7b45-1713d0a0ecbf	2366	Muta
00050000-56a8-9b1e-ba93-6861cf8eeb29	4202	Naklo
00050000-56a8-9b1e-7e9c-cd97de0cf4ef	3331	Nazarje
00050000-56a8-9b1e-9fe9-55da37bd92e0	1357	Notranje Gorice
00050000-56a8-9b1e-1f82-c2d93aab7518	3203	Nova Cerkev
00050000-56a8-9b1e-2861-0166eaede742	5000	Nova Gorica 
00050000-56a8-9b1e-070c-f4154fa6e50c	5001	Nova Gorica - poštni predali
00050000-56a8-9b1e-3b82-6d8a140db383	1385	Nova vas
00050000-56a8-9b1e-b2dd-0ae7bf9072a9	8000	Novo mesto
00050000-56a8-9b1e-94c8-2488190cb524	8001	Novo mesto - poštni predali
00050000-56a8-9b1e-5093-19a5fc6c3ec1	6243	Obrov
00050000-56a8-9b1e-4553-924bb566c8aa	9233	Odranci
00050000-56a8-9b1e-cec5-4ded18232ac6	2317	Oplotnica
00050000-56a8-9b1e-6bc1-9766082f32a9	2312	Orehova vas
00050000-56a8-9b1e-edbe-0e0b79277584	2270	Ormož
00050000-56a8-9b1e-c7aa-c310990c56e4	1316	Ortnek
00050000-56a8-9b1e-0042-7d102ceeabc5	1337	Osilnica
00050000-56a8-9b1e-dfc4-14be7229c9fc	8222	Otočec
00050000-56a8-9b1e-0bff-cd7156278581	2361	Ožbalt
00050000-56a8-9b1e-cb6c-b7d028e8dc23	2231	Pernica
00050000-56a8-9b1e-c536-768337659db2	2211	Pesnica pri Mariboru
00050000-56a8-9b1e-b41d-d833286af264	9203	Petrovci
00050000-56a8-9b1e-2b5b-587f213c1e78	3301	Petrovče
00050000-56a8-9b1e-2a5c-8b7d92ef6171	6330	Piran/Pirano
00050000-56a8-9b1e-2ae9-efdcd8d24d45	8255	Pišece
00050000-56a8-9b1e-07a5-e3f43469c54a	6257	Pivka
00050000-56a8-9b1e-bcb7-cb78e6fee3d0	6232	Planina
00050000-56a8-9b1e-7f6c-1c5406266d4a	3225	Planina pri Sevnici
00050000-56a8-9b1e-e063-77114ab2c912	6276	Pobegi
00050000-56a8-9b1e-619e-a174a0290766	8312	Podbočje
00050000-56a8-9b1e-f624-5d0c3dab1ec2	5243	Podbrdo
00050000-56a8-9b1e-5292-24fd4fcc6d27	3254	Podčetrtek
00050000-56a8-9b1e-910b-6ba58b13dee5	2273	Podgorci
00050000-56a8-9b1e-b4a7-606d4d026510	6216	Podgorje
00050000-56a8-9b1e-bf1c-2ebf720f8b1d	2381	Podgorje pri Slovenj Gradcu
00050000-56a8-9b1e-f865-584e67e5c67a	6244	Podgrad
00050000-56a8-9b1e-6ccc-080673c77bbf	1414	Podkum
00050000-56a8-9b1e-af59-9e14056bc114	2286	Podlehnik
00050000-56a8-9b1e-ff94-869b38cbc808	5272	Podnanos
00050000-56a8-9b1e-2d06-39abaea20204	4244	Podnart
00050000-56a8-9b1e-4ced-e5ed3c553d7b	3241	Podplat
00050000-56a8-9b1e-54ac-be8c9e06fd4f	3257	Podsreda
00050000-56a8-9b1e-1cca-ce53878fbbd7	2363	Podvelka
00050000-56a8-9b1e-d11d-9cd518e51ad4	2208	Pohorje
00050000-56a8-9b1e-b800-87aee286f608	2257	Polenšak
00050000-56a8-9b1e-e6e2-6b4b54a23ee2	1355	Polhov Gradec
00050000-56a8-9b1e-1380-fd0ec3730678	4223	Poljane nad Škofjo Loko
00050000-56a8-9b1e-3cd7-ed25cb79d91e	2319	Poljčane
00050000-56a8-9b1e-1a5a-2c4081869b7b	1272	Polšnik
00050000-56a8-9b1e-b0d0-374d041ee242	3313	Polzela
00050000-56a8-9b1e-fa34-e5c14e61760e	3232	Ponikva
00050000-56a8-9b1e-a6fc-09a0b13798df	6320	Portorož/Portorose
00050000-56a8-9b1e-c3ce-3737176509db	6230	Postojna
00050000-56a8-9b1e-fdac-7cfa648b0807	2331	Pragersko
00050000-56a8-9b1e-2ac0-7985e073a638	3312	Prebold
00050000-56a8-9b1e-5be8-810451258630	4205	Preddvor
00050000-56a8-9b1e-f9ff-d00a63e06b5d	6255	Prem
00050000-56a8-9b1e-125e-439c7c52df90	1352	Preserje
00050000-56a8-9b1e-e036-2d1425e9512b	6258	Prestranek
00050000-56a8-9b1e-93cb-2bd5975e46b9	2391	Prevalje
00050000-56a8-9b1e-45b1-ca5b32262f67	3262	Prevorje
00050000-56a8-9b1e-2b36-ba90eadb2922	1276	Primskovo 
00050000-56a8-9b1e-f1d7-0fa4562f5e3c	3253	Pristava pri Mestinju
00050000-56a8-9b1e-6112-2c4e799296d7	9207	Prosenjakovci/Partosfalva
00050000-56a8-9b1e-9adc-55957cbcdfe4	5297	Prvačina
00050000-56a8-9b1e-4d1f-b042165bdb08	2250	Ptuj
00050000-56a8-9b1e-1dab-74052a534231	2323	Ptujska Gora
00050000-56a8-9b1e-da73-855d8f809514	9201	Puconci
00050000-56a8-9b1e-0972-c7c99f05602b	2327	Rače
00050000-56a8-9b1e-a3e8-41f9ff0699d0	1433	Radeče
00050000-56a8-9b1e-5036-1c576fb0b656	9252	Radenci
00050000-56a8-9b1e-5bb8-dd99740856f3	2360	Radlje ob Dravi
00050000-56a8-9b1e-3eaa-426511e85453	1235	Radomlje
00050000-56a8-9b1e-18d4-9a05d8579675	4240	Radovljica
00050000-56a8-9b1e-bf8b-c2aef046d827	8274	Raka
00050000-56a8-9b1e-d008-9107f1bda052	1381	Rakek
00050000-56a8-9b1e-66c5-fe6c8bc8cc7d	4283	Rateče - Planica
00050000-56a8-9b1e-d031-c7e4eca2efdf	2390	Ravne na Koroškem
00050000-56a8-9b1e-6361-fe71f6b003c0	9246	Razkrižje
00050000-56a8-9b1e-3dc0-46bc30c87744	3332	Rečica ob Savinji
00050000-56a8-9b1e-36cd-f7a7f61bfe5e	5292	Renče
00050000-56a8-9b1e-6217-f501c50144fe	1310	Ribnica
00050000-56a8-9b1e-e4a4-66ca741a5a93	2364	Ribnica na Pohorju
00050000-56a8-9b1e-76cf-9bc6322ed20b	3272	Rimske Toplice
00050000-56a8-9b1e-139f-de9fa6dcef02	1314	Rob
00050000-56a8-9b1e-a25a-42f16325007f	5215	Ročinj
00050000-56a8-9b1e-6498-28045dbe4b76	3250	Rogaška Slatina
00050000-56a8-9b1e-9ebd-3eb07235948c	9262	Rogašovci
00050000-56a8-9b1e-7494-1951dcff9b73	3252	Rogatec
00050000-56a8-9b1e-89c0-fd45b4b2e492	1373	Rovte
00050000-56a8-9b1e-e86c-84aac46fd070	2342	Ruše
00050000-56a8-9b1e-8810-98d4285cd7d4	1282	Sava
00050000-56a8-9b1e-143e-225816c18357	6333	Sečovlje/Sicciole
00050000-56a8-9b1e-33a8-dd46fc829bcb	4227	Selca
00050000-56a8-9b1e-da2f-6420ac9de07f	2352	Selnica ob Dravi
00050000-56a8-9b1e-fb82-c4b7a158b1cc	8333	Semič
00050000-56a8-9b1e-d5f0-33b0b45b6a7c	8281	Senovo
00050000-56a8-9b1e-53cc-3cc8b3f892b6	6224	Senožeče
00050000-56a8-9b1e-a136-c1c8186887f1	8290	Sevnica
00050000-56a8-9b1e-a3a6-cb7f25859a74	6210	Sežana
00050000-56a8-9b1e-c324-95e96e9fa2ce	2214	Sladki Vrh
00050000-56a8-9b1e-1209-5c1813c2cc2c	5283	Slap ob Idrijci
00050000-56a8-9b1e-c734-1d56059c5a9f	2380	Slovenj Gradec
00050000-56a8-9b1e-c222-a27563cebcbf	2310	Slovenska Bistrica
00050000-56a8-9b1e-4a8d-85e214434001	3210	Slovenske Konjice
00050000-56a8-9b1e-ef94-a67cad5dcbc9	1216	Smlednik
00050000-56a8-9b1e-ac82-f9855b9da57b	5232	Soča
00050000-56a8-9b1e-7b9c-25c386f67a0d	1317	Sodražica
00050000-56a8-9b1e-2b2e-ad2a5ef36580	3335	Solčava
00050000-56a8-9b1e-b18e-8cc77431ff05	5250	Solkan
00050000-56a8-9b1e-0fcc-6c84fc7c407e	4229	Sorica
00050000-56a8-9b1e-fe39-d841d5d297bc	4225	Sovodenj
00050000-56a8-9b1e-10bd-1769f3f05359	5281	Spodnja Idrija
00050000-56a8-9b1e-52b6-0f2ce3b385bc	2241	Spodnji Duplek
00050000-56a8-9b1e-133a-a68fa62c27d4	9245	Spodnji Ivanjci
00050000-56a8-9b1e-5be6-c5f642dcc274	2277	Središče ob Dravi
00050000-56a8-9b1e-358d-463b6b78f96c	4267	Srednja vas v Bohinju
00050000-56a8-9b1e-4d2d-2b117692b639	8256	Sromlje 
00050000-56a8-9b1e-2e54-2bdf96bbd7a7	5224	Srpenica
00050000-56a8-9b1e-10ad-00751557c8e2	1242	Stahovica
00050000-56a8-9b1e-7a0b-1adacb8d548b	1332	Stara Cerkev
00050000-56a8-9b1e-438d-1b19f5bcedca	8342	Stari trg ob Kolpi
00050000-56a8-9b1e-fed9-6553c65527df	1386	Stari trg pri Ložu
00050000-56a8-9b1e-5fff-3f442e0fdf56	2205	Starše
00050000-56a8-9b1e-c879-38033a29468e	2289	Stoperce
00050000-56a8-9b1e-8e29-afa527212c36	8322	Stopiče
00050000-56a8-9b1e-961b-7b75ccefdec9	3206	Stranice
00050000-56a8-9b1e-bc73-7415ec7f6907	8351	Straža
00050000-56a8-9b1e-3fdd-816bf88d398e	1313	Struge
00050000-56a8-9b1e-ee32-11a92fb4b2da	8293	Studenec
00050000-56a8-9b1e-c389-ba064a59c6f0	8331	Suhor
00050000-56a8-9b1e-909e-378a7cddac91	2233	Sv. Ana v Slovenskih goricah
00050000-56a8-9b1e-336b-5b6077c6110e	2235	Sv. Trojica v Slovenskih goricah
00050000-56a8-9b1e-1b0c-f435a4b1fa8b	2353	Sveti Duh na Ostrem Vrhu
00050000-56a8-9b1e-6267-aa869d455a22	9244	Sveti Jurij ob Ščavnici
00050000-56a8-9b1e-5f06-c0eb784a84d3	3264	Sveti Štefan
00050000-56a8-9b1e-43f3-b6819d2baa99	2258	Sveti Tomaž
00050000-56a8-9b1e-fdf7-9955c44435f6	9204	Šalovci
00050000-56a8-9b1e-e3e5-9d6954b48e78	5261	Šempas
00050000-56a8-9b1e-4be4-8c7af0978f4a	5290	Šempeter pri Gorici
00050000-56a8-9b1e-c136-b53f34946bd1	3311	Šempeter v Savinjski dolini
00050000-56a8-9b1e-db34-3c7b19c3c110	4208	Šenčur
00050000-56a8-9b1e-c033-63a4e038e46e	2212	Šentilj v Slovenskih goricah
00050000-56a8-9b1e-51cd-6dbe308c3262	8297	Šentjanž
00050000-56a8-9b1e-a23b-9f926d965d79	2373	Šentjanž pri Dravogradu
00050000-56a8-9b1e-35fa-7334a1f3b121	8310	Šentjernej
00050000-56a8-9b1e-12ec-459acc02e4f2	3230	Šentjur
00050000-56a8-9b1e-2585-a2f09c1866af	3271	Šentrupert
00050000-56a8-9b1e-c505-b4eb92049cc5	8232	Šentrupert
00050000-56a8-9b1e-532a-83bd0e4943fd	1296	Šentvid pri Stični
00050000-56a8-9b1e-33eb-4cfa1365085d	8275	Škocjan
00050000-56a8-9b1e-5bb1-d4d1d7b09783	6281	Škofije
00050000-56a8-9b1e-ca35-556ca6286bbd	4220	Škofja Loka
00050000-56a8-9b1e-c65c-a5554bb5241d	3211	Škofja vas
00050000-56a8-9b1e-f69b-875cb9874174	1291	Škofljica
00050000-56a8-9b1e-3b76-ce2aad77ae8e	6274	Šmarje
00050000-56a8-9b1e-fb59-c191eef89536	1293	Šmarje - Sap
00050000-56a8-9b1e-da2c-832e52f8c2e3	3240	Šmarje pri Jelšah
00050000-56a8-9b1e-0b1d-a8b6e90e494f	8220	Šmarješke Toplice
00050000-56a8-9b1e-756f-a48845a89e16	2315	Šmartno na Pohorju
00050000-56a8-9b1e-c75f-0bf80297d1f5	3341	Šmartno ob Dreti
00050000-56a8-9b1e-861b-4753a49f1312	3327	Šmartno ob Paki
00050000-56a8-9b1e-0578-84f17d0b0c07	1275	Šmartno pri Litiji
00050000-56a8-9b1e-034e-66c9a0603a22	2383	Šmartno pri Slovenj Gradcu
00050000-56a8-9b1e-38fb-ddcd3735301b	3201	Šmartno v Rožni dolini
00050000-56a8-9b1e-666c-91f6bc889afe	3325	Šoštanj
00050000-56a8-9b1e-d882-be037d04b5ea	6222	Štanjel
00050000-56a8-9b1e-af43-1724298180b9	3220	Štore
00050000-56a8-9b1e-5077-319b47286636	3304	Tabor
00050000-56a8-9b1e-1d67-44b24a280cc8	3221	Teharje
00050000-56a8-9b1e-47f8-16182b7e59ad	9251	Tišina
00050000-56a8-9b1e-82ed-5b13e525e5e4	5220	Tolmin
00050000-56a8-9b1e-09c8-a9843b354866	3326	Topolšica
00050000-56a8-9b1e-6f54-78e1d2a44a78	2371	Trbonje
00050000-56a8-9b1e-5b56-8ff5681117bd	1420	Trbovlje
00050000-56a8-9b1e-1642-e8b203f0d588	8231	Trebelno 
00050000-56a8-9b1e-b5fe-adb129196b95	8210	Trebnje
00050000-56a8-9b1e-8e74-3828628a6dc4	5252	Trnovo pri Gorici
00050000-56a8-9b1e-56c7-d0fcf83d9078	2254	Trnovska vas
00050000-56a8-9b1e-4306-382572edbf8c	1222	Trojane
00050000-56a8-9b1e-2abe-ae0c261f02b3	1236	Trzin
00050000-56a8-9b1e-45e5-27b3bbff116a	4290	Tržič
00050000-56a8-9b1e-bbb3-01388eb8f1cd	8295	Tržišče
00050000-56a8-9b1e-6bd2-f23baf064b28	1311	Turjak
00050000-56a8-9b1e-0559-7d29e64078e3	9224	Turnišče
00050000-56a8-9b1e-a921-de7fb1c6181e	8323	Uršna sela
00050000-56a8-9b1e-cbeb-9931f3416123	1252	Vače
00050000-56a8-9b1e-c5ae-fb5696cff392	3320	Velenje 
00050000-56a8-9b1e-c733-ee77518a283c	3322	Velenje - poštni predali
00050000-56a8-9b1e-7c7a-e1a2445e0e13	8212	Velika Loka
00050000-56a8-9b1e-aca0-f15c5e7406a5	2274	Velika Nedelja
00050000-56a8-9b1e-b93f-fb0e42cb345a	9225	Velika Polana
00050000-56a8-9b1e-b98c-ffadccdbb55d	1315	Velike Lašče
00050000-56a8-9b1e-fef7-4751c01d0268	8213	Veliki Gaber
00050000-56a8-9b1e-0dc8-6a74a475d027	9241	Veržej
00050000-56a8-9b1e-abe3-e0f6ce4a2cb9	1312	Videm - Dobrepolje
00050000-56a8-9b1e-c4df-8ebc0bd10c2e	2284	Videm pri Ptuju
00050000-56a8-9b1e-9778-3ee902ab4597	8344	Vinica
00050000-56a8-9b1e-0a2b-267f687784ff	5271	Vipava
00050000-56a8-9b1e-5cc2-ace7c110f2d6	4212	Visoko
00050000-56a8-9b1e-ada3-c506390c9037	1294	Višnja Gora
00050000-56a8-9b1e-7521-6fb16aac0e0a	3205	Vitanje
00050000-56a8-9b1e-54ca-37ca4c31861c	2255	Vitomarci
00050000-56a8-9b1e-0736-7d1d6c74ad17	1217	Vodice
00050000-56a8-9b1e-fe89-7ad60bd84bb1	3212	Vojnik\t
00050000-56a8-9b1e-80eb-194ba4120f2f	5293	Volčja Draga
00050000-56a8-9b1e-1114-e2cfe3e56088	2232	Voličina
00050000-56a8-9b1e-c4d1-fce972f42392	3305	Vransko
00050000-56a8-9b1e-828c-d1a10e8c0b78	6217	Vremski Britof
00050000-56a8-9b1e-f5e0-4287b10e7410	1360	Vrhnika
00050000-56a8-9b1e-a47a-4a5546bc03ee	2365	Vuhred
00050000-56a8-9b1e-5f75-4035d7704367	2367	Vuzenica
00050000-56a8-9b1e-3db5-9255b00c4e3c	8292	Zabukovje 
00050000-56a8-9b1e-1f9a-3aeb588d9724	1410	Zagorje ob Savi
00050000-56a8-9b1e-3777-a0adb459025f	1303	Zagradec
00050000-56a8-9b1e-b8da-9abd27d60ca3	2283	Zavrč
00050000-56a8-9b1e-0d24-c0a37b671eaa	8272	Zdole 
00050000-56a8-9b1e-c2f4-8d347b9cfd2d	4201	Zgornja Besnica
00050000-56a8-9b1e-2187-abb8cb709171	2242	Zgornja Korena
00050000-56a8-9b1e-19d2-67fd259d840a	2201	Zgornja Kungota
00050000-56a8-9b1e-4bdc-2f234e864f40	2316	Zgornja Ložnica
00050000-56a8-9b1e-cd3c-8ed6b673d155	2314	Zgornja Polskava
00050000-56a8-9b1e-78fb-80333fd0731b	2213	Zgornja Velka
00050000-56a8-9b1e-4135-33a30e82bd44	4247	Zgornje Gorje
00050000-56a8-9b1e-d1bb-96e10f69affd	4206	Zgornje Jezersko
00050000-56a8-9b1e-a62d-6f4b9d42bae7	2285	Zgornji Leskovec
00050000-56a8-9b1e-608c-3e948f64a17a	1432	Zidani Most
00050000-56a8-9b1e-632b-92fca97ee7a3	3214	Zreče
00050000-56a8-9b1e-487b-87acd7f8b97b	4209	Žabnica
00050000-56a8-9b1e-176b-8ca66bf3ae6e	3310	Žalec
00050000-56a8-9b1e-23a4-4ecbd0bb3e3f	4228	Železniki
00050000-56a8-9b1e-3534-908f5de3fb7f	2287	Žetale
00050000-56a8-9b1e-ebdb-8f7cf184f4a1	4226	Žiri
00050000-56a8-9b1e-fa59-50b533aafaed	4274	Žirovnica
00050000-56a8-9b1e-e23f-079f45ef22a8	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 40847511)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 40847081)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 40846821)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a8-9b22-45aa-b601d14ba69c	00080000-56a8-9b22-44c8-6ef32525f4dd	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a8-9b22-7772-2f5411741cee	00080000-56a8-9b22-44c8-6ef32525f4dd	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a8-9b22-8e6d-a894317db7fe	00080000-56a8-9b22-29c8-1667faf6c930	\N	00040000-56a8-9b1f-1a23-dd37d2abb3a6	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 40846957)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a8-9b1f-dc12-0a5f440c0e12	novo leto	1	1	\N	t
00430000-56a8-9b1f-596d-f63dab14602e	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a8-9b1f-aeac-be0a48a20e3f	dan upora proti okupatorju	27	4	\N	t
00430000-56a8-9b1f-af5a-1123df5e3fb5	praznik dela	1	5	\N	t
00430000-56a8-9b1f-a9a1-b6f130c31436	praznik dela	2	5	\N	t
00430000-56a8-9b1f-de0d-fb2ffa8b2bb4	dan Primoža Trubarja	8	6	\N	f
00430000-56a8-9b1f-70e1-dede68798154	dan državnosti	25	6	\N	t
00430000-56a8-9b1f-03f2-3a9330a1ba36	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a8-9b1f-0cee-8c673d36c3a3	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a8-9b1f-0235-82f1f684f49d	dan suverenosti	25	10	\N	f
00430000-56a8-9b1f-5519-29c2dd80c0f3	dan spomina na mrtve	1	11	\N	t
00430000-56a8-9b1f-5edd-051e6b3367ca	dan Rudolfa Maistra	23	11	\N	f
00430000-56a8-9b1f-26fd-e1c89b65c2ce	božič	25	12	\N	t
00430000-56a8-9b1f-f465-11c0449cbcec	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a8-9b1f-9d55-7ee801d31f16	Marijino vnebovzetje	15	8	\N	t
00430000-56a8-9b1f-ece0-3059290fbe20	dan reformacije	31	10	\N	t
00430000-56a8-9b1f-253b-7a9f7b9431ac	velikonočna nedelja	27	3	2016	t
00430000-56a8-9b1f-6c94-4a609d3546e3	velikonočna nedelja	16	4	2017	t
00430000-56a8-9b1f-a2de-2ae493cc6605	velikonočna nedelja	1	4	2018	t
00430000-56a8-9b1f-ac92-dec8409a6e88	velikonočna nedelja	21	4	2019	t
00430000-56a8-9b1f-6d64-fa5cdb058b39	velikonočna nedelja	12	4	2020	t
00430000-56a8-9b1f-787b-548924575a00	velikonočna nedelja	4	4	2021	t
00430000-56a8-9b1f-a223-6d43a501b0db	velikonočna nedelja	17	4	2022	t
00430000-56a8-9b1f-1a72-4cdeca86f81e	velikonočna nedelja	9	4	2023	t
00430000-56a8-9b1f-60d6-0b3f51f5b60b	velikonočna nedelja	31	3	2024	t
00430000-56a8-9b1f-002d-f6b8ed096d40	velikonočna nedelja	20	4	2025	t
00430000-56a8-9b1f-d201-8fa652e9d314	velikonočna nedelja	5	4	2026	t
00430000-56a8-9b1f-3210-18531ebce8e0	velikonočna nedelja	28	3	2027	t
00430000-56a8-9b1f-6f42-55930ae348d6	velikonočna nedelja	16	4	2028	t
00430000-56a8-9b1f-9085-a75773007f37	velikonočna nedelja	1	4	2029	t
00430000-56a8-9b1f-30e7-91006fe0f502	velikonočna nedelja	21	4	2030	t
00430000-56a8-9b1f-937a-c10605d20749	velikonočni ponedeljek	28	3	2016	t
00430000-56a8-9b1f-e5ba-c9f409c72b1d	velikonočni ponedeljek	17	4	2017	t
00430000-56a8-9b1f-7ecc-f4c931b6a2ab	velikonočni ponedeljek	2	4	2018	t
00430000-56a8-9b1f-f428-12fbe8f895c7	velikonočni ponedeljek	22	4	2019	t
00430000-56a8-9b1f-8254-87bd59852768	velikonočni ponedeljek	13	4	2020	t
00430000-56a8-9b1f-0ed1-fab727fb5b8e	velikonočni ponedeljek	5	4	2021	t
00430000-56a8-9b1f-569e-4267ccc009d1	velikonočni ponedeljek	18	4	2022	t
00430000-56a8-9b1f-16c4-80963f835900	velikonočni ponedeljek	10	4	2023	t
00430000-56a8-9b1f-4b5f-7ce83f88e0ea	velikonočni ponedeljek	1	4	2024	t
00430000-56a8-9b1f-e78f-470d65bf3528	velikonočni ponedeljek	21	4	2025	t
00430000-56a8-9b1f-f8fa-c43d9b38980e	velikonočni ponedeljek	6	4	2026	t
00430000-56a8-9b1f-d9f7-b28c85cd744e	velikonočni ponedeljek	29	3	2027	t
00430000-56a8-9b1f-ecdb-7828be5b990c	velikonočni ponedeljek	17	4	2028	t
00430000-56a8-9b1f-fd0e-6bb2623de8a3	velikonočni ponedeljek	2	4	2029	t
00430000-56a8-9b1f-71b1-11bee0974ec0	velikonočni ponedeljek	22	4	2030	t
00430000-56a8-9b1f-a5f1-4f665cce7740	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a8-9b1f-75b7-e1a9766efb71	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a8-9b1f-c81d-3eb4466a8511	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a8-9b1f-ff0e-1b4f4c275846	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a8-9b1f-a1a4-f8d8daf6c65f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a8-9b1f-e4b7-b214f1deac4e	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a8-9b1f-328b-64da7ad20ad0	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a8-9b1f-6ab5-01706fe13e1a	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a8-9b1f-87f1-58f2fcc9d100	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a8-9b1f-eac6-f62f5faba770	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a8-9b1f-cb1f-0a690a71e276	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a8-9b1f-f977-bf56532a369f	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a8-9b1f-969e-716a9146a92f	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a8-9b1f-0bc6-c8b4ea596d44	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a8-9b1f-7d11-3ef323ad6eb0	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 40846925)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56a8-9b23-bcc7-7cefb70c758e	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	1	1	\N
001b0000-56a8-9b23-4b32-7e4068313df4	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	1	2	\N
001b0000-56a8-9b23-9f05-e1c952c71315	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	1	3	1
001b0000-56a8-9b23-7c1f-2ed857df97d4	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	2	4	2
001b0000-56a8-9b23-9508-f3f34e634012	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	4	5	3
001b0000-56a8-9b23-271e-30d84705b6af	000e0000-56a8-9b23-40cd-e2deab7a471a	\N	1	1	\N
001b0000-56a8-9b23-95a7-49ec43474acc	000e0000-56a8-9b23-40cd-e2deab7a471a	\N	3	2	1
001b0000-56a8-9b23-fcd0-b3aeaebe266d	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	1	6	1
001b0000-56a8-9b23-4dbe-d63591e29e2e	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	3	7	2
001b0000-56a8-9b23-aa02-01437b3fa324	000e0000-56a8-9b23-40cd-e2deab7a471a	\N	2	3	1
001b0000-56a8-9b23-5d99-44e91ea83460	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	2	9	1
001b0000-56a8-9b23-6d04-b029fa299fdf	000e0000-56a8-9b23-40cd-e2deab7a471a	\N	4	4	2
001b0000-56a8-9b23-d212-d03cff631733	000e0000-56a8-9b23-ba6f-03bf4b468d02	\N	5	8	3
001b0000-56a8-9b23-93be-d23eb163f9c2	000e0000-56a8-9b23-40cd-e2deab7a471a	\N	1	5	1
\.


--
-- TOC entry 3161 (class 0 OID 40846932)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a8-9b23-9f05-e1c952c71315	000a0000-56a8-9b22-b3a0-3c8489d83046
001b0000-56a8-9b23-9f05-e1c952c71315	000a0000-56a8-9b22-cb22-b8c02a99c779
001b0000-56a8-9b23-7c1f-2ed857df97d4	000a0000-56a8-9b22-cb22-b8c02a99c779
001b0000-56a8-9b23-7c1f-2ed857df97d4	000a0000-56a8-9b22-fa6f-ff31b951039a
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 40847093)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 40847525)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 40847535)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a8-9b22-0072-ff6ea851c36e	00080000-56a8-9b22-f643-972037c74e75	0987	AK
00190000-56a8-9b22-5d15-440b0f3b2c4c	00080000-56a8-9b22-29c8-1667faf6c930	0989	AK
00190000-56a8-9b22-41d8-f4c01cbdb0a2	00080000-56a8-9b22-9f03-a2497d6be150	0986	AK
00190000-56a8-9b22-6701-0b3943a8fd58	00080000-56a8-9b22-6026-4da7f5bf6c01	0984	AK
00190000-56a8-9b22-10c6-1b106a13147a	00080000-56a8-9b22-8389-79f535d865e7	0983	AK
00190000-56a8-9b22-e7a4-8769136345c6	00080000-56a8-9b22-b071-1a9b3c23cb41	0982	AK
00190000-56a8-9b25-8286-069283856072	00080000-56a8-9b25-a1a5-0bcebea5923a	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 40847424)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a8-9b23-820c-f6e7224dea8f	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 40847543)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 40847121)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a8-9b22-a75e-ea999513a984	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a8-9b22-bd4b-1f04cc3326e7	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a8-9b22-1a26-a11c00c8f3b8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a8-9b22-f36d-784181a157d6	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a8-9b22-0e02-c77bd5c46899	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a8-9b22-a060-803da25323a4	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a8-9b22-2734-8518c3d8576f	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 40847066)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 40847056)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 40847263)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 40847193)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 40846899)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 40846660)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a8-9b25-a1a5-0bcebea5923a	00010000-56a8-9b20-44f8-e7b9066a529a	2016-01-27 11:25:41	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a8-9b25-b685-12ef8d309ab1	00010000-56a8-9b20-44f8-e7b9066a529a	2016-01-27 11:25:41	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a8-9b25-8286-069283856072	00010000-56a8-9b20-44f8-e7b9066a529a	2016-01-27 11:25:41	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 40847135)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 40846698)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a8-9b1f-05db-377fa0e2c351	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a8-9b1f-92f2-2ae92778628b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a8-9b1f-f8ff-f75c0a20bc9e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a8-9b1f-c783-6ee1a7aa7904	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a8-9b1f-311e-5a5011860b10	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a8-9b1f-7a10-b5db3d318f15	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a8-9b1f-79c3-adfe735145ce	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a8-9b1f-f12f-161f38b709b7	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a8-9b1f-f24c-1139e3388f5a	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-9b1f-2905-396dea2d0b8c	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-9b1f-c849-b29f016613e1	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-9b1f-b282-5f74167f9727	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-9b1f-ae25-1eab3ef3842a	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a8-9b1f-7046-212976921410	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a8-9b1f-8a96-46f2aa161f8b	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a8-9b1f-decc-221546e2952c	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a8-9b1f-2b49-85194fe8d196	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a8-9b1f-8bc2-2e1ea23e311f	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a8-9b1f-e190-4a19bb500d68	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a8-9b1f-a1da-1f089d5404ea	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a8-9b1f-ed24-0414a872b097	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a8-9b1f-fdce-2f7b43dca21f	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a8-9b1f-9ec5-4345fa156691	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a8-9b1f-845a-b1abfe99bd5a	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a8-9b1f-5f1c-c056fd470d6b	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a8-9b1f-9c56-99226c520411	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a8-9b1f-c3ed-4bff01b0eaef	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a8-9b1f-5475-98391ddda8c9	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a8-9b1f-ce60-661a8c332e05	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a8-9b1f-a3da-61cee7b4e173	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a8-9b1f-137d-1e865d004164	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a8-9b1f-4269-abbc9688d20d	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a8-9b1f-a391-2a413542b337	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a8-9b1f-701b-54465624c72f	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a8-9b1f-5844-c1eb5e80ecb8	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a8-9b1f-82ad-126c5f7bb8e0	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a8-9b1f-fbb5-606163f56882	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a8-9b1f-e474-585c68b8a9d9	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a8-9b1f-a7f1-967df5bdf02c	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a8-9b1f-0fe9-7894890c5f41	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a8-9b20-5721-509796f3e034	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a8-9b20-718d-071ae30db099	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a8-9b20-2f69-7caec18ff8f9	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a8-9b20-61e2-2da65afbb2ba	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a8-9b20-d19f-e85711217379	direktor	minimalne pravice za direktorja	t
00020000-56a8-9b20-fe24-58cd357756e5	arhivar	arhivar	t
00020000-56a8-9b20-6e9f-ba15158ca7c5	dramaturg	dramaturg	t
00020000-56a8-9b20-9a87-65fb6d711952	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a8-9b20-a111-3168edb65ea9	poslovni-sekretar	poslovni sekretar	t
00020000-56a8-9b20-ceea-d1cf0fde045a	vodja-tehnike	vodja tehnike	t
00020000-56a8-9b20-eeeb-8a31f07c6b2f	racunovodja	računovodja	t
00020000-56a8-9b22-5dc4-9977e0ba8cb4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a8-9b22-6ff7-d51694e51d5e	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-8bf1-7a4219e1b755	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-e869-5daffcf547f7	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-c3bd-9105c2dde62f	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-50a9-99b94d2c912f	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-02f4-0aba9480dcca	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-9556-72a31cd890a1	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-2456-d6913c24c957	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-b7fa-4194a6865d24	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-a49e-4f3cc65cac11	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-9f2f-ca72a89a48e2	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-2887-abfe7ce3b5b4	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-95ed-7a00d7085d90	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-98d1-f5d5f3ece34e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-58d0-9a57081bcb9f	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-eb34-68dd211a424c	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-537b-0d07acb67954	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-9d14-50c490d6d730	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-056e-e24e960a2ccb	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a8-9b22-a41c-0a38409cd38e	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-bbdb-5d64ad40d7d9	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-f4b7-1a1f35bca3bf	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-a82d-1fe466f9cb38	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-379f-543626721276	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-efee-5dfe7dc29d7f	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-c8fa-b4b448105df5	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-9e98-560576148fe3	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-eacc-a83596f8dc10	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-529a-928d986a8dd6	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-0aa8-f22bf1481243	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-e451-45a6345aa09c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-3ccf-a71ccaeb04d3	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-5d1b-cff6e8c16682	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-e1d2-e2f52864d68a	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-e589-1a6a6463450b	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-189f-c690c311a9ca	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-0b25-4dd20b406775	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a8-9b22-f15f-16d71edb372e	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 40846682)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a8-9b20-1641-e8d6e793a51b	00020000-56a8-9b1f-f8ff-f75c0a20bc9e
00010000-56a8-9b20-44f8-e7b9066a529a	00020000-56a8-9b1f-f8ff-f75c0a20bc9e
00010000-56a8-9b22-ab98-95669479b28a	00020000-56a8-9b22-5dc4-9977e0ba8cb4
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-6ff7-d51694e51d5e
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-50a9-99b94d2c912f
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-b7fa-4194a6865d24
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-9f2f-ca72a89a48e2
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-95ed-7a00d7085d90
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-9d14-50c490d6d730
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-e869-5daffcf547f7
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-a41c-0a38409cd38e
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-a82d-1fe466f9cb38
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-efee-5dfe7dc29d7f
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-9e98-560576148fe3
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-529a-928d986a8dd6
00010000-56a8-9b22-52cd-9c35ffca7a12	00020000-56a8-9b22-5d1b-cff6e8c16682
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-6ff7-d51694e51d5e
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-8bf1-7a4219e1b755
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-e869-5daffcf547f7
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-c3bd-9105c2dde62f
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-95ed-7a00d7085d90
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-eb34-68dd211a424c
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-a41c-0a38409cd38e
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-a82d-1fe466f9cb38
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-efee-5dfe7dc29d7f
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-9e98-560576148fe3
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-529a-928d986a8dd6
00010000-56a8-9b22-4500-23f9baf4dd5c	00020000-56a8-9b22-5d1b-cff6e8c16682
00010000-56a8-9b22-3dcc-27598f5c1cef	00020000-56a8-9b22-6ff7-d51694e51d5e
00010000-56a8-9b22-3dcc-27598f5c1cef	00020000-56a8-9b22-8bf1-7a4219e1b755
00010000-56a8-9b22-3dcc-27598f5c1cef	00020000-56a8-9b22-e869-5daffcf547f7
00010000-56a8-9b22-3dcc-27598f5c1cef	00020000-56a8-9b22-c3bd-9105c2dde62f
00010000-56a8-9b22-3dcc-27598f5c1cef	00020000-56a8-9b22-9f2f-ca72a89a48e2
00010000-56a8-9b22-3dcc-27598f5c1cef	00020000-56a8-9b22-95ed-7a00d7085d90
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-8bf1-7a4219e1b755
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-02f4-0aba9480dcca
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-a49e-4f3cc65cac11
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-2887-abfe7ce3b5b4
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-9f2f-ca72a89a48e2
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-537b-0d07acb67954
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-95ed-7a00d7085d90
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-98d1-f5d5f3ece34e
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-a41c-0a38409cd38e
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-bbdb-5d64ad40d7d9
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-a82d-1fe466f9cb38
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-379f-543626721276
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-efee-5dfe7dc29d7f
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-c8fa-b4b448105df5
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-9e98-560576148fe3
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-eacc-a83596f8dc10
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-529a-928d986a8dd6
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-0aa8-f22bf1481243
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-5d1b-cff6e8c16682
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-e1d2-e2f52864d68a
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-189f-c690c311a9ca
00010000-56a8-9b22-862b-8454afa27947	00020000-56a8-9b22-0b25-4dd20b406775
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-8bf1-7a4219e1b755
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-02f4-0aba9480dcca
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-2456-d6913c24c957
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-a49e-4f3cc65cac11
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-2887-abfe7ce3b5b4
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-9f2f-ca72a89a48e2
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-537b-0d07acb67954
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-95ed-7a00d7085d90
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-98d1-f5d5f3ece34e
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-58d0-9a57081bcb9f
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-a41c-0a38409cd38e
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-bbdb-5d64ad40d7d9
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-f4b7-1a1f35bca3bf
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-a82d-1fe466f9cb38
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-379f-543626721276
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-efee-5dfe7dc29d7f
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-c8fa-b4b448105df5
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-9e98-560576148fe3
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-eacc-a83596f8dc10
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-529a-928d986a8dd6
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-0aa8-f22bf1481243
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-5d1b-cff6e8c16682
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-e1d2-e2f52864d68a
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-e589-1a6a6463450b
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-189f-c690c311a9ca
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-0b25-4dd20b406775
00010000-56a8-9b22-8225-e9a7808bb64a	00020000-56a8-9b22-f15f-16d71edb372e
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-8bf1-7a4219e1b755
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-e869-5daffcf547f7
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-02f4-0aba9480dcca
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-9556-72a31cd890a1
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-2456-d6913c24c957
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-50a9-99b94d2c912f
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-a49e-4f3cc65cac11
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-2887-abfe7ce3b5b4
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-9f2f-ca72a89a48e2
00010000-56a8-9b22-cd27-4c5101a8270a	00020000-56a8-9b22-537b-0d07acb67954
00010000-56a8-9b22-5d95-7aec26a8f7ec	00020000-56a8-9b22-6ff7-d51694e51d5e
00010000-56a8-9b22-5d95-7aec26a8f7ec	00020000-56a8-9b22-c3bd-9105c2dde62f
00010000-56a8-9b22-5d95-7aec26a8f7ec	00020000-56a8-9b22-50a9-99b94d2c912f
00010000-56a8-9b22-5d95-7aec26a8f7ec	00020000-56a8-9b22-b7fa-4194a6865d24
00010000-56a8-9b22-5d95-7aec26a8f7ec	00020000-56a8-9b22-9f2f-ca72a89a48e2
00010000-56a8-9b22-5d95-7aec26a8f7ec	00020000-56a8-9b22-95ed-7a00d7085d90
00010000-56a8-9b22-5d95-7aec26a8f7ec	00020000-56a8-9b22-9d14-50c490d6d730
00010000-56a8-9b22-5d95-7aec26a8f7ec	00020000-56a8-9b22-e451-45a6345aa09c
00010000-56a8-9b22-39b3-4fb5a8f0d0f4	00020000-56a8-9b22-056e-e24e960a2ccb
00010000-56a8-9b22-df88-feb10cd40a9d	00020000-56a8-9b20-d19f-e85711217379
00010000-56a8-9b22-dcd0-67f1d260f438	00020000-56a8-9b20-fe24-58cd357756e5
00010000-56a8-9b22-f9bf-bb4503ce736a	00020000-56a8-9b20-6e9f-ba15158ca7c5
00010000-56a8-9b22-25ce-808325b3c523	00020000-56a8-9b20-9a87-65fb6d711952
00010000-56a8-9b22-8461-43a1777aebda	00020000-56a8-9b20-a111-3168edb65ea9
00010000-56a8-9b22-ac4b-eaacffe31a4c	00020000-56a8-9b20-ceea-d1cf0fde045a
00010000-56a8-9b22-cfca-aedf7b4f39e3	00020000-56a8-9b20-eeeb-8a31f07c6b2f
\.


--
-- TOC entry 3186 (class 0 OID 40847149)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 40847087)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 40847010)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a8-9b22-7bac-cd58a9e4aba3	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a8-9b22-64c5-fbcd0e840aa4	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a8-9b22-6ef1-5ace10446d7d	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a8-9b22-c366-f3facfbac7ad	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 40846647)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a8-9b1e-29a6-e4a31d4bff10	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a8-9b1e-c55f-7020ad64f411	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a8-9b1e-3b16-f6e8296aefd7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a8-9b1e-971c-cc6d23137991	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a8-9b1e-25ee-ef25a6d3c4fd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 40846639)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a8-9b1e-e5a1-bcf2363b2e93	00230000-56a8-9b1e-971c-cc6d23137991	popa
00240000-56a8-9b1e-141e-41411077c1f9	00230000-56a8-9b1e-971c-cc6d23137991	oseba
00240000-56a8-9b1e-3de5-c7353f16b888	00230000-56a8-9b1e-971c-cc6d23137991	tippopa
00240000-56a8-9b1e-5ef4-fb6246fb00ae	00230000-56a8-9b1e-971c-cc6d23137991	organizacijskaenota
00240000-56a8-9b1e-e9fc-5cd7f9da4c1a	00230000-56a8-9b1e-971c-cc6d23137991	sezona
00240000-56a8-9b1e-1148-774e03b83550	00230000-56a8-9b1e-971c-cc6d23137991	tipvaje
00240000-56a8-9b1e-dec8-b5d702b6ec6b	00230000-56a8-9b1e-971c-cc6d23137991	tipdodatka
00240000-56a8-9b1e-35d5-4c62b4f7a41d	00230000-56a8-9b1e-c55f-7020ad64f411	prostor
00240000-56a8-9b1e-49f8-32cd82c5245b	00230000-56a8-9b1e-971c-cc6d23137991	besedilo
00240000-56a8-9b1e-0075-78c1c6403722	00230000-56a8-9b1e-971c-cc6d23137991	uprizoritev
00240000-56a8-9b1e-07bb-0431e5811cc3	00230000-56a8-9b1e-971c-cc6d23137991	funkcija
00240000-56a8-9b1e-2977-cef58d41d41a	00230000-56a8-9b1e-971c-cc6d23137991	tipfunkcije
00240000-56a8-9b1e-265f-17a22a5a0d15	00230000-56a8-9b1e-971c-cc6d23137991	alternacija
00240000-56a8-9b1e-ac6e-5978ee1d8841	00230000-56a8-9b1e-29a6-e4a31d4bff10	pogodba
00240000-56a8-9b1e-429b-0d4ca162657e	00230000-56a8-9b1e-971c-cc6d23137991	zaposlitev
00240000-56a8-9b1e-e6fd-8371eb7fd5f6	00230000-56a8-9b1e-971c-cc6d23137991	zvrstuprizoritve
00240000-56a8-9b1e-0a6d-3f5c6322bbc9	00230000-56a8-9b1e-29a6-e4a31d4bff10	programdela
00240000-56a8-9b1e-9c32-d4180786f326	00230000-56a8-9b1e-971c-cc6d23137991	zapis
\.


--
-- TOC entry 3133 (class 0 OID 40846634)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
1ff69e5c-4ffc-4c5a-94cd-d15931a107b0	00240000-56a8-9b1e-e5a1-bcf2363b2e93	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 40847210)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a8-9b23-ac0a-dbb8902a55db	000e0000-56a8-9b23-ba6f-03bf4b468d02	00080000-56a8-9b22-44c8-6ef32525f4dd	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a8-9b1f-d469-896a4931327e
00270000-56a8-9b23-af74-24fd8b67dfc3	000e0000-56a8-9b23-ba6f-03bf4b468d02	00080000-56a8-9b22-44c8-6ef32525f4dd	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a8-9b1f-d469-896a4931327e
\.


--
-- TOC entry 3149 (class 0 OID 40846783)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 40847029)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a8-9b24-b571-18d8957ea153	00180000-56a8-9b23-dd68-b52005abc9e1	000c0000-56a8-9b23-3972-1f57029bb2a7	00090000-56a8-9b22-ae6c-9213c6e40e95	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-9b24-5d49-3635eee4aa51	00180000-56a8-9b23-dd68-b52005abc9e1	000c0000-56a8-9b23-b769-81d0a1954489	00090000-56a8-9b22-715a-0a66bbfc5809	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-9b24-9733-2af0979926e1	00180000-56a8-9b23-dd68-b52005abc9e1	000c0000-56a8-9b23-0a89-20a520e6957e	00090000-56a8-9b22-0550-b8179cbb42d1	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-9b24-1f84-96583edcb0ef	00180000-56a8-9b23-dd68-b52005abc9e1	000c0000-56a8-9b23-9753-e482b8a5298e	00090000-56a8-9b22-8a40-e83b7f42a826	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-9b24-39cd-7987bbb86d68	00180000-56a8-9b23-dd68-b52005abc9e1	000c0000-56a8-9b23-704f-a00ef21696d7	00090000-56a8-9b22-5720-6594aaf90f8c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-9b24-3143-d7a493f222ec	00180000-56a8-9b23-291b-2739416a701d	\N	00090000-56a8-9b22-5720-6594aaf90f8c	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a8-9b24-e410-646741a5cb47	00180000-56a8-9b23-0329-1dc536e52931	\N	00090000-56a8-9b22-715a-0a66bbfc5809	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a8-9b24-d951-a5c4994b5591	00180000-56a8-9b23-dd68-b52005abc9e1	\N	00090000-56a8-9b22-3fb0-ab5c4780c130	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 40847046)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a8-9b1e-f81e-5c95f374b5a6	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a8-9b1e-ffc0-4403bb43f20d	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a8-9b1e-d5bd-97e1b1d3cced	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a8-9b1e-188c-5289dcc419bf	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a8-9b1e-a3ae-65612d6db520	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a8-9b1e-308a-d330db6df554	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 40847251)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a8-9b1e-b441-892639de1961	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a8-9b1e-e9fc-1c64bebbe760	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a8-9b1e-2e8a-69aeaa392ce2	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a8-9b1e-62ad-f80f2a5aed59	04	Režija	Režija	Režija	umetnik	30
000f0000-56a8-9b1e-04ea-76440f6e1b09	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a8-9b1e-a956-f12d23742686	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a8-9b1e-d015-1997b4d130a7	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a8-9b1e-e152-4900048ebb81	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a8-9b1e-c8f3-defc82cc5128	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a8-9b1e-3656-b43c9b1fd82b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a8-9b1e-7421-da30aad19a06	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a8-9b1e-fc9e-c23f334ebe68	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a8-9b1e-c80e-b932d9b5111a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a8-9b1e-c716-c2e06710f5db	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a8-9b1e-aa70-40c99028d7a4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a8-9b1e-81da-bac0270f9e7d	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a8-9b1e-3c34-98ecf3590978	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a8-9b1e-8e7b-d878b9c238fa	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a8-9b1e-5f5c-0acac2b254e8	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 40846734)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a8-9b22-3242-830fefc26e62	0001	šola	osnovna ali srednja šola
00400000-56a8-9b22-59c3-ba0aedfcfc95	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a8-9b22-3a12-327acdd7f122	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 40847555)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a8-9b1e-7f07-625f72818b3e	01	Velika predstava	f	1.00	1.00
002b0000-56a8-9b1e-f47f-4138a4ebf0a9	02	Mala predstava	f	0.50	0.50
002b0000-56a8-9b1e-8471-b9a4c5c3fe38	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a8-9b1e-e2d4-bd88ff2bde91	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a8-9b1e-dc36-a9bac793da9f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 40847000)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a8-9b1e-4694-3e2f11b88879	0001	prva vaja	prva vaja
00420000-56a8-9b1e-b7cc-cc25cfce6cfb	0002	tehnična vaja	tehnična vaja
00420000-56a8-9b1e-3c24-d09f8b4418bb	0003	lučna vaja	lučna vaja
00420000-56a8-9b1e-e68e-67c6ea4193b1	0004	kostumska vaja	kostumska vaja
00420000-56a8-9b1e-ae49-20a3bec85126	0005	foto vaja	foto vaja
00420000-56a8-9b1e-6db0-ede5869f8a86	0006	1. glavna vaja	1. glavna vaja
00420000-56a8-9b1e-d0af-815670b0adeb	0007	2. glavna vaja	2. glavna vaja
00420000-56a8-9b1e-fecb-97418bb90f14	0008	1. generalka	1. generalka
00420000-56a8-9b1e-9d62-31b3307e3941	0009	2. generalka	2. generalka
00420000-56a8-9b1e-c579-8a139a61bc63	0010	odprta generalka	odprta generalka
00420000-56a8-9b1e-2f37-5f10cbd7f941	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a8-9b1e-36c1-42ae24a007a8	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a8-9b1e-2d12-908931a63b99	0013	pevska vaja	pevska vaja
00420000-56a8-9b1e-988e-64a55f18a3aa	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a8-9b1e-d75c-a7f48f50d9f4	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a8-9b1e-967b-3a31f7ea4597	0016	orientacijska vaja	orientacijska vaja
00420000-56a8-9b1e-887c-97a06a14a2f7	0017	situacijska vaja	situacijska vaja
00420000-56a8-9b1e-0856-815d8718ba5b	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 40846856)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 40846669)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a8-9b20-44f8-e7b9066a529a	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROic8pDJeKMbyfdiIAv9ZHJ9Lhwwr2b6.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-6b5a-37174075e1a0	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-b795-67d38d3b5edc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-025d-cc8d19a61e70	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-8203-81bbcbac1c7f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-20fa-0a88c07a2ea6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-a09e-0cbccde11ec2	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-73ea-32ab6fcc0fd2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-5a1e-cf429e6fddb2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-5d07-7f5e12c71500	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-ab98-95669479b28a	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-fd7a-58b8c0b2cdc5	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-52cd-9c35ffca7a12	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-4500-23f9baf4dd5c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-3dcc-27598f5c1cef	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-862b-8454afa27947	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-8225-e9a7808bb64a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-cd27-4c5101a8270a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-5d95-7aec26a8f7ec	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-39b3-4fb5a8f0d0f4	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-df88-feb10cd40a9d	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-dcd0-67f1d260f438	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-f9bf-bb4503ce736a	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-25ce-808325b3c523	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-8461-43a1777aebda	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-ac4b-eaacffe31a4c	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a8-9b22-cfca-aedf7b4f39e3	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a8-9b20-1641-e8d6e793a51b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 40847301)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a8-9b23-40cd-e2deab7a471a	00160000-56a8-9b22-fff1-da60d340f6b4	\N	00140000-56a8-9b1e-cd87-58cd527c5939	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a8-9b22-0e02-c77bd5c46899
000e0000-56a8-9b23-ba6f-03bf4b468d02	00160000-56a8-9b22-be5d-2cf1376dd3bd	\N	00140000-56a8-9b1e-6f95-84927a791e23	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a8-9b22-a060-803da25323a4
000e0000-56a8-9b23-e032-a4ad40be6745	\N	\N	00140000-56a8-9b1e-6f95-84927a791e23	00190000-56a8-9b22-0072-ff6ea851c36e	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a8-9b22-0e02-c77bd5c46899
000e0000-56a8-9b23-2e16-6259f444e5cc	\N	\N	00140000-56a8-9b1e-6f95-84927a791e23	00190000-56a8-9b22-0072-ff6ea851c36e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a8-9b22-0e02-c77bd5c46899
000e0000-56a8-9b23-eb19-27535f1b0e79	\N	\N	00140000-56a8-9b1e-6f95-84927a791e23	00190000-56a8-9b22-0072-ff6ea851c36e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-2c2c-88bba21ee35f	\N	\N	00140000-56a8-9b1e-6f95-84927a791e23	00190000-56a8-9b22-0072-ff6ea851c36e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-943d-70009810196f	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-dd7f-f18fb5cfcdcb	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-3415-a3dd73bd1e26	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-481d-264dae458451	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-dde2-1a799f72a013	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-ab49-b9931a53d97b	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-ceca-c67811c484f4	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-66a9-6b0ea902d289	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
000e0000-56a8-9b23-350a-aef33fcfb833	\N	\N	00140000-56a8-9b1e-50b3-baf4b68f009d	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-9b22-a75e-ea999513a984
\.


--
-- TOC entry 3170 (class 0 OID 40847020)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40846950)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a8-9b23-f4ac-48b223f249b3	\N	000e0000-56a8-9b23-40cd-e2deab7a471a	1
00200000-56a8-9b23-ac33-b749e60ebecb	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	1
00200000-56a8-9b23-cce9-c0212119b9cb	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	3
00200000-56a8-9b23-dd4d-7830de1f61fe	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	4
00200000-56a8-9b23-5859-d15241b020c0	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	2
00200000-56a8-9b23-73b6-9231876241b4	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	8
00200000-56a8-9b23-cdb2-dd18bba0676d	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	7
00200000-56a8-9b23-976a-0c4802f597cf	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	9
00200000-56a8-9b23-6d4c-d30588de7f26	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	6
00200000-56a8-9b23-74ac-8559056f40e5	\N	000e0000-56a8-9b23-ba6f-03bf4b468d02	5
\.


--
-- TOC entry 3182 (class 0 OID 40847113)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 40847224)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a8-9b1f-897c-9f0cb145adc6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a8-9b1f-bef9-ea80a7282055	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a8-9b1f-2f26-b46966f75b2e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a8-9b1f-836a-0bac8c95665e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a8-9b1f-4b45-715f2ba720a3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a8-9b1f-d9da-66c7d18858a5	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a8-9b1f-1b1c-95a1a06d4f0e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a8-9b1f-f738-727c1b312224	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a8-9b1f-d469-896a4931327e	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a8-9b1f-472b-5eebf015dccf	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a8-9b1f-0ccb-91db4df70352	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a8-9b1f-9b70-20486d02edd9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a8-9b1f-afc8-a21043dad81e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a8-9b1f-2e24-dd3470c74b8f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a8-9b1f-7e2a-3b0ddb6530dd	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a8-9b1f-c8ae-9f817fe28deb	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a8-9b1f-b49e-557b6dbc944b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a8-9b1f-0a49-72db83698352	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a8-9b1f-4a40-607742d661ca	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a8-9b1f-894e-de7168a4ef95	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a8-9b1f-5258-13238cf01111	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a8-9b1f-e058-85b45825d6d2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a8-9b1f-e000-801aa49560a3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a8-9b1f-fa71-583ab30172ca	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a8-9b1f-21af-488dd9635d7a	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a8-9b1f-ee1d-6e737f82f591	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a8-9b1f-aad2-3f9e120c4c3e	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a8-9b1f-a7cc-b67003398642	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 40847605)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 40847574)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 40847617)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 40847186)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a8-9b22-a74c-8313d29c5753	00090000-56a8-9b22-715a-0a66bbfc5809	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-9b22-57a8-3fe40546c9d2	00090000-56a8-9b22-0550-b8179cbb42d1	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-9b22-d4b9-4c41d0196367	00090000-56a8-9b22-2f52-4ed23a905533	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-9b22-a413-d113cb931c78	00090000-56a8-9b22-5c9e-21ea0e3f1b21	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-9b22-9bdb-5699ead58454	00090000-56a8-9b22-4656-bf23527f3964	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-9b22-3dbb-2bb8378f6f62	00090000-56a8-9b22-448e-2230cf3ad685	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 40847291)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a8-9b1e-cd87-58cd527c5939	01	Drama	drama (SURS 01)
00140000-56a8-9b1e-edba-252f55248355	02	Opera	opera (SURS 02)
00140000-56a8-9b1e-c5dc-36745c4cee85	03	Balet	balet (SURS 03)
00140000-56a8-9b1e-f834-6e7befc0149c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a8-9b1e-50b3-baf4b68f009d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a8-9b1e-6f95-84927a791e23	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a8-9b1e-17c8-cf72d444f1a2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 40847176)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 40846733)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 40847349)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 40847340)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 40846723)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 40847207)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 40847249)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 40847658)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 40847043)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 40846979)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 40846994)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 40846999)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 40847572)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 40846882)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 40847418)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 40847172)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 40846948)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 40846920)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 40846896)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 40847079)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 40847635)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 40847642)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 40847666)
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
-- TOC entry 2766 (class 2606 OID 40847105)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 40846854)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 40846752)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 40846816)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 40846779)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 40846712)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 40846697)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 40847111)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 40847148)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 40847286)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 40846807)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 40846842)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 40847523)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 40847085)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 40846832)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 40846964)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 40846936)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 40846929)
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
-- TOC entry 2764 (class 2606 OID 40847097)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 40847532)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 40847540)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 40847510)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 40847553)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 40847130)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 40847070)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 40847061)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 40847273)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 40847200)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 40846908)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 40846668)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 40847139)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 40846686)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 40846706)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 40847157)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 40847092)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 40847018)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 40846656)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 40846644)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 40846638)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 40847220)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 40846788)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 40847035)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 40847053)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 40847260)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 40846741)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 40847565)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 40847007)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 40846867)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 40846681)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 40847319)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 40847026)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 40846954)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 40847119)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 40847232)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 40847615)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 40847599)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 40847623)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 40847190)
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
-- TOC entry 2833 (class 2606 OID 40847299)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 40847184)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 40846988)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 40846989)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 40846987)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 40846986)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 40846985)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 40847221)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 40847222)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 40847223)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 40847637)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 40847636)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 40846809)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 40846810)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 40847112)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 40847603)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 40847602)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 40847604)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 40847601)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 40847600)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 40847098)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 40846955)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 40846956)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 40847173)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 40847175)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 40847174)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 40846898)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 40846897)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 40847554)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 40847288)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 40847289)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 40847290)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 40847624)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 40847324)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 40847321)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 40847325)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 40847323)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 40847322)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 40846869)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 40846868)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 40846782)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 40847140)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 40846713)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 40846714)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 40847160)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 40847159)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 40847158)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 40846819)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 40846818)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 40846820)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 40846930)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 40846931)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 40846646)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 40847065)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 40847063)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 40847062)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 40847064)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 40846687)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 40846688)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 40847120)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 40847659)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 40847209)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 40847208)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 40847667)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 40847668)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 40847086)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 40847201)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 40847202)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 40847423)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 40847422)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 40847419)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 40847420)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 40847421)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 40846834)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 40846833)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 40846835)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 40847134)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 40847133)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 40847533)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 40847534)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 40847353)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 40847354)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 40847351)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 40847352)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 40847044)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 40847045)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 40847191)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 40847192)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 40847027)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 40847074)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 40847073)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 40847071)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 40847072)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 40847341)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 40846909)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 40846923)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 40846922)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 40846921)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 40846924)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 40846949)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 40846937)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 40846938)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 40847524)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 40847573)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 40847643)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 40847644)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 40846754)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 40846753)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 40846789)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 40846790)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 40847038)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 40847037)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 40847036)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 40846981)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 40846984)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 40846980)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 40846983)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 40846982)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 40846808)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 40846742)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 40846743)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 40846883)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 40846885)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 40846884)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 40846886)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 40847080)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 40847287)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 40847320)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 40847261)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 40847262)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 40846780)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 40846781)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 40847054)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 40847055)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 40847185)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 40846657)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 40846855)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 40846817)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 40846645)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 40847566)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 40847132)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 40847131)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 40847008)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 40847009)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 40847350)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 40847028)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 40846843)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 40847300)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 40847616)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 40847541)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 40847542)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 40847250)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 40847019)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 40846707)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 40847834)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 40847859)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 40847849)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 40847829)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 40847844)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 40847854)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 40847839)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 40848039)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 40848044)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 40848049)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 40848209)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 40848204)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 40847724)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 40847729)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 40847954)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 40848189)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 40848184)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 40848194)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 40848179)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 40848174)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 40847949)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 40847819)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 40847824)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 40847994)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 40848004)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 40847999)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 40847779)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 40847774)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 40847939)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 40848164)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 40848054)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 40848059)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 40848064)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 40848199)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 40848084)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 40848069)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 40848089)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 40848079)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 40848074)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 40847769)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 40847764)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 40847709)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 40847704)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 40847974)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 40847684)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 40847689)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 40847989)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 40847984)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 40847979)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 40847739)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 40847734)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 40847744)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 40847794)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 40847799)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 40847669)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 40847914)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 40847904)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 40847899)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 40847909)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 40847674)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 40847679)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 40847959)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 40848224)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 40848034)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 40848029)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 40848229)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 40848234)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 40847944)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 40848019)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 40848024)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 40848139)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 40848134)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 40848119)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 40848124)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 40848129)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 40847754)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 40847749)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 40847759)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 40847969)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 40847964)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 40848149)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 40848154)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 40848109)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 40848114)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 40848099)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 40848104)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 40847889)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 40847894)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 40848009)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 40848014)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 40847864)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 40847869)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 40847934)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 40847929)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 40847919)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 40847924)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 40848094)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 40847784)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 40847789)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 40847814)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 40847804)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 40847809)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 40848144)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 40848159)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 40848169)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 40848214)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 40848219)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 40847699)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 40847694)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 40847714)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 40847719)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 40847884)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 40847879)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 40847874)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-27 11:25:43 CET

--
-- PostgreSQL database dump complete
--

