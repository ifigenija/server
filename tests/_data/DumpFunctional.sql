--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-13 13:16:51 CET

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
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 256
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 35855563)
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
-- TOC entry 240 (class 1259 OID 35856191)
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
-- TOC entry 239 (class 1259 OID 35856175)
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
-- TOC entry 182 (class 1259 OID 35855556)
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
-- TOC entry 181 (class 1259 OID 35855554)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 230 (class 1259 OID 35856052)
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
-- TOC entry 233 (class 1259 OID 35856082)
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
-- TOC entry 254 (class 1259 OID 35856494)
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
-- TOC entry 210 (class 1259 OID 35855880)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    prisotnost_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 203 (class 1259 OID 35855805)
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
-- TOC entry 205 (class 1259 OID 35855837)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 35855842)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 35856416)
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
-- TOC entry 194 (class 1259 OID 35855708)
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
-- TOC entry 241 (class 1259 OID 35856204)
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
-- TOC entry 226 (class 1259 OID 35856010)
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
-- TOC entry 200 (class 1259 OID 35855779)
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
-- TOC entry 197 (class 1259 OID 35855748)
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
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 35855725)
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
-- TOC entry 215 (class 1259 OID 35855924)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 252 (class 1259 OID 35856474)
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
-- TOC entry 253 (class 1259 OID 35856487)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 35856509)
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
-- TOC entry 219 (class 1259 OID 35855949)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 35855682)
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
-- TOC entry 185 (class 1259 OID 35855582)
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
-- TOC entry 189 (class 1259 OID 35855649)
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
-- TOC entry 186 (class 1259 OID 35855593)
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
-- TOC entry 178 (class 1259 OID 35855528)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 35855547)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 35855956)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 35855990)
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
-- TOC entry 236 (class 1259 OID 35856123)
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
-- TOC entry 188 (class 1259 OID 35855629)
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
-- TOC entry 191 (class 1259 OID 35855674)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 35856360)
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
-- TOC entry 216 (class 1259 OID 35855930)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 35855659)
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
-- TOC entry 202 (class 1259 OID 35855797)
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
-- TOC entry 198 (class 1259 OID 35855763)
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
-- TOC entry 199 (class 1259 OID 35855772)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 35855897)
-- Name: prisotnost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prisotnost (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 218 (class 1259 OID 35855942)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 35856374)
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
-- TOC entry 245 (class 1259 OID 35856384)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 35856273)
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
-- TOC entry 246 (class 1259 OID 35856392)
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
-- TOC entry 222 (class 1259 OID 35855971)
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
-- TOC entry 214 (class 1259 OID 35855915)
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
-- TOC entry 213 (class 1259 OID 35855905)
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
-- TOC entry 235 (class 1259 OID 35856112)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 35856042)
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
-- TOC entry 196 (class 1259 OID 35855737)
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
-- TOC entry 175 (class 1259 OID 35855499)
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
-- TOC entry 174 (class 1259 OID 35855497)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 223 (class 1259 OID 35855984)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 35855537)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 35855521)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 35855998)
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
-- TOC entry 217 (class 1259 OID 35855936)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 35855857)
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
-- TOC entry 173 (class 1259 OID 35855486)
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
-- TOC entry 172 (class 1259 OID 35855478)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 35855473)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 231 (class 1259 OID 35856059)
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
-- TOC entry 187 (class 1259 OID 35855621)
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
-- TOC entry 209 (class 1259 OID 35855867)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    prisotnost_id uuid,
    deltaplaniranzacetek character(20) DEFAULT NULL::bpchar,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planiranotraja numeric(15,2) DEFAULT NULL::numeric,
    dezurni boolean,
    gost boolean
);


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN terminstoritve.deltaplaniranzacetek; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN terminstoritve.deltaplaniranzacetek IS '(DC2Type:dateinterval)';


--
-- TOC entry 211 (class 1259 OID 35855887)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 234 (class 1259 OID 35856100)
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
-- TOC entry 184 (class 1259 OID 35855572)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 247 (class 1259 OID 35856404)
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
-- TOC entry 207 (class 1259 OID 35855847)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 35855694)
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
-- TOC entry 176 (class 1259 OID 35855508)
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
-- TOC entry 238 (class 1259 OID 35856150)
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
-- TOC entry 201 (class 1259 OID 35855790)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 221 (class 1259 OID 35855963)
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
-- TOC entry 232 (class 1259 OID 35856073)
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
-- TOC entry 250 (class 1259 OID 35856454)
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
-- TOC entry 249 (class 1259 OID 35856423)
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
-- TOC entry 251 (class 1259 OID 35856466)
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
-- TOC entry 228 (class 1259 OID 35856035)
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
-- TOC entry 204 (class 1259 OID 35855831)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 237 (class 1259 OID 35856140)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 227 (class 1259 OID 35856025)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2252 (class 2604 OID 35855559)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 35855502)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3141 (class 0 OID 35855563)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5696-402f-a58d-9e7b59150eda	10	30	Otroci	Abonma za otroke	200
000a0000-5696-402f-de7b-75129a3b6db7	20	60	Mladina	Abonma za mladino	400
000a0000-5696-402f-4718-37a11d07bb49	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3198 (class 0 OID 35856191)
-- Dependencies: 240
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5696-4030-cd4a-3f23d2ae8714	000d0000-5696-4030-dbc0-31d0dacc40a6	\N	00090000-5696-4030-44f8-4b44347bea49	000b0000-5696-4030-72fd-1bcee81e1e11	0001	f	\N	\N	\N	3	t	t	t
000c0000-5696-4030-4f56-aeeeb09be146	000d0000-5696-4030-1481-a3a493c1e3c4	00100000-5696-4030-71f6-51a4b42fd853	00090000-5696-4030-8eb3-bbe396913a42	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5696-4030-2ae6-9cd78d575514	000d0000-5696-4030-957e-ad115e1397c7	00100000-5696-4030-5acf-4f521179b095	00090000-5696-4030-2fdd-97710cdde3f8	\N	0003	t	\N	2016-01-13	\N	2	t	f	f
000c0000-5696-4030-45d5-192ebd2d6c1a	000d0000-5696-4030-11a0-f379e44423ca	\N	00090000-5696-4030-0866-9a46ee1ffbd9	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5696-4030-d666-172819eb4835	000d0000-5696-4030-9333-9d9bfa900d33	\N	00090000-5696-4030-a929-1f5992c9b235	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5696-4030-0370-150e8256a1bf	000d0000-5696-4030-b877-dcce74935772	\N	00090000-5696-4030-b4b5-edaed2d4e60f	000b0000-5696-4030-0beb-2079833c773e	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5696-4030-eef3-d896b2be1f1a	000d0000-5696-4030-50ce-198784388943	00100000-5696-4030-b588-c79d7cc53536	00090000-5696-4030-653e-c8821e822465	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5696-4030-578a-dad6796c7464	000d0000-5696-4030-9834-cdead47282aa	\N	00090000-5696-4030-7428-e311115c0600	000b0000-5696-4030-2c9b-6bb650f6bf64	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5696-4030-4f94-075fbcd0d590	000d0000-5696-4030-50ce-198784388943	00100000-5696-4030-80d0-a5468de63f6e	00090000-5696-4030-8eba-3fc2fcae668a	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5696-4030-e763-83919710442b	000d0000-5696-4030-50ce-198784388943	00100000-5696-4030-f3ed-d64b20600392	00090000-5696-4030-9c3f-c4a2533aabeb	\N	0010	t	\N	2016-01-13	\N	16	f	f	t
000c0000-5696-4030-99df-96f7df09ba39	000d0000-5696-4030-50ce-198784388943	00100000-5696-4030-020a-742850bd2796	00090000-5696-4030-a706-def26ba25694	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5696-4030-7c34-4521a64f0159	000d0000-5696-4030-1f5c-da519ff9841c	00100000-5696-4030-71f6-51a4b42fd853	00090000-5696-4030-8eb3-bbe396913a42	000b0000-5696-4030-b3e4-3ec295bcd1de	0012	t	\N	\N	\N	2	t	t	t
000c0000-5696-4030-2075-9747247f2854	000d0000-5696-4030-4525-425642ec55df	\N	00090000-5696-4030-7428-e311115c0600	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5696-4030-961e-ef0d43983225	000d0000-5696-4030-4525-425642ec55df	\N	00090000-5696-4030-78b6-c5698c37f366	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5696-4030-baf1-f51a85e1d64f	000d0000-5696-4030-d511-3ff5bb071c55	00100000-5696-4030-5acf-4f521179b095	00090000-5696-4030-2fdd-97710cdde3f8	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5696-4030-c07f-c4ee0e41d165	000d0000-5696-4030-d511-3ff5bb071c55	\N	00090000-5696-4030-78b6-c5698c37f366	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5696-4030-8efb-83e3071d1ff2	000d0000-5696-4030-d0d0-d7f5f5133dde	\N	00090000-5696-4030-78b6-c5698c37f366	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5696-4030-596f-6ac4bd4df351	000d0000-5696-4030-d0d0-d7f5f5133dde	\N	00090000-5696-4030-7428-e311115c0600	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5696-4030-5c62-3d7fc8482557	000d0000-5696-4030-80c5-03feb20e4ddc	00100000-5696-4030-b588-c79d7cc53536	00090000-5696-4030-653e-c8821e822465	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5696-4030-8bd6-33e532fad4a0	000d0000-5696-4030-80c5-03feb20e4ddc	\N	00090000-5696-4030-78b6-c5698c37f366	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5696-4030-b737-081e5df5e1f4	000d0000-5696-4030-05f8-848287b8f3a4	\N	00090000-5696-4030-78b6-c5698c37f366	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5696-4030-1d9e-59d7a2ef60ac	000d0000-5696-4030-05f8-848287b8f3a4	00100000-5696-4030-b588-c79d7cc53536	00090000-5696-4030-653e-c8821e822465	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5696-4030-93e4-bd5e84148490	000d0000-5696-4030-8744-267443b53be2	\N	00090000-5696-4030-78b6-c5698c37f366	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5696-4030-b5ac-7edc51ac0c68	000d0000-5696-4030-cd49-0fd7fb716ee0	\N	00090000-5696-4030-7428-e311115c0600	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5696-4030-f41b-aa7e4035fb01	000d0000-5696-4030-b245-73e73c2cbeec	\N	00090000-5696-4030-7428-e311115c0600	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5696-4030-bc29-3d2d5f3149da	000d0000-5696-4030-b245-73e73c2cbeec	00100000-5696-4030-5acf-4f521179b095	00090000-5696-4030-2fdd-97710cdde3f8	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5696-4030-0dfa-a33816b87166	000d0000-5696-4030-2123-f19ce766073a	\N	00090000-5696-4030-529c-3214a43f3010	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5696-4030-79ea-dc739b798ae9	000d0000-5696-4030-2123-f19ce766073a	\N	00090000-5696-4030-1095-90ed4eccb120	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5696-4030-0388-8fce594b7d73	000d0000-5696-4030-f653-7e92af5a4410	\N	00090000-5696-4030-7428-e311115c0600	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5696-4030-019b-750be36f2cbe	000d0000-5696-4030-f653-7e92af5a4410	00100000-5696-4030-5acf-4f521179b095	00090000-5696-4030-2fdd-97710cdde3f8	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5696-4030-a78a-0dcf478770e5	000d0000-5696-4030-f653-7e92af5a4410	\N	00090000-5696-4030-1095-90ed4eccb120	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5696-4030-a57a-df71bfb2a489	000d0000-5696-4030-f653-7e92af5a4410	\N	00090000-5696-4030-529c-3214a43f3010	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5696-4030-f6fc-e30b9c5e4e91	000d0000-5696-4030-f027-f0ac6bfb9a6e	\N	00090000-5696-4030-7428-e311115c0600	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5696-4030-71d3-c7925c9cf26f	000d0000-5696-4030-2cc9-a39366b45bda	00100000-5696-4030-5acf-4f521179b095	00090000-5696-4030-2fdd-97710cdde3f8	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5696-4030-e6ee-3addc9b08057	000d0000-5696-4030-2cc9-a39366b45bda	\N	00090000-5696-4030-78b6-c5698c37f366	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3197 (class 0 OID 35856175)
-- Dependencies: 239
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 35855556)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3188 (class 0 OID 35856052)
-- Dependencies: 230
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5696-4030-7ffc-157edb7d3c6c	00160000-5696-402f-1bb7-ef83963089b0	00090000-5696-4030-1095-90ed4eccb120	aizv	10	t
003d0000-5696-4030-f5d5-e40470f3174b	00160000-5696-402f-1bb7-ef83963089b0	00090000-5696-4030-98ae-fd085607f40e	apri	14	t
003d0000-5696-4030-cc55-f66ecbf2a504	00160000-5696-402f-570e-5c8d9379da2f	00090000-5696-4030-529c-3214a43f3010	aizv	11	t
003d0000-5696-4030-6297-ba114f93aab7	00160000-5696-402f-8317-3ec812cb9556	00090000-5696-4030-9885-6d6bd10bc72b	aizv	12	t
003d0000-5696-4030-8833-0a7c00125ea0	00160000-5696-402f-1bb7-ef83963089b0	00090000-5696-4030-78b6-c5698c37f366	apri	18	f
\.


--
-- TOC entry 3191 (class 0 OID 35856082)
-- Dependencies: 233
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5696-402f-1bb7-ef83963089b0	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5696-402f-570e-5c8d9379da2f	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5696-402f-8317-3ec812cb9556	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3212 (class 0 OID 35856494)
-- Dependencies: 254
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 35855880)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, prisotnost_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 35855805)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5696-4030-2878-a77f384fd883	\N	\N	00200000-5696-4030-0b17-75d1fc41875c	\N	\N	\N	00220000-5696-402f-7d44-91623447f585	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5696-4030-83c0-1cbd09031077	\N	\N	00200000-5696-4030-e53c-4fad596b1ed1	\N	\N	\N	00220000-5696-402f-7d44-91623447f585	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5696-4030-2b5c-7dd03c290504	\N	\N	00200000-5696-4030-5b81-95d9de3426d8	\N	\N	\N	00220000-5696-402f-e2c9-86f3eaa0df16	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5696-4030-25a1-f75ec86aa07a	\N	\N	00200000-5696-4030-4b25-665484def173	\N	\N	\N	00220000-5696-402f-131c-5adc885613dc	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5696-4030-c267-32e46851515f	\N	\N	00200000-5696-4030-2f95-6a1a665f3cff	\N	\N	\N	00220000-5696-402f-ed4d-3505f1b6b61d	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3163 (class 0 OID 35855837)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 35855842)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 35856416)
-- Dependencies: 248
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 35855708)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5696-402d-b6e1-d842804e5fd9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5696-402d-40d1-a8cb511db1ba	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5696-402d-3b0f-3e7ae439f178	AL	ALB	008	Albania 	Albanija	\N
00040000-5696-402d-1957-ef4b4f315541	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5696-402d-ad74-41387bfcee2a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5696-402d-9e50-0b176c757dd6	AD	AND	020	Andorra 	Andora	\N
00040000-5696-402d-c597-fdd32ce39178	AO	AGO	024	Angola 	Angola	\N
00040000-5696-402d-afaa-ad2eab771698	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5696-402d-462b-6b6f9a9c85bb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5696-402d-0c4a-fc34a7778c74	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5696-402d-c0a2-b57c0213700f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5696-402d-5bc5-ee33cb7cfb90	AM	ARM	051	Armenia 	Armenija	\N
00040000-5696-402d-fbae-74bd6f8fdf29	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5696-402d-31b9-366f9f49a519	AU	AUS	036	Australia 	Avstralija	\N
00040000-5696-402d-fc32-fc17386234bd	AT	AUT	040	Austria 	Avstrija	\N
00040000-5696-402d-2b25-5c64cd2a0cb5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5696-402d-b0a9-795e9cfba9c4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5696-402d-92d2-8823b62652bb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5696-402d-ff13-aa2b297ef63b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5696-402d-ec31-2919fed2b07a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5696-402d-7ce0-558a697a9f5f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5696-402d-27cb-1304ca89450f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5696-402d-8467-d542e170ef94	BZ	BLZ	084	Belize 	Belize	\N
00040000-5696-402d-9d17-cda822716793	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5696-402d-d401-f80533332674	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5696-402d-3e56-fcf4c2f22f59	BT	BTN	064	Bhutan 	Butan	\N
00040000-5696-402d-c396-79d2723b3354	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5696-402d-9da8-383d748d10a3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5696-402d-84bf-402d65d789a2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5696-402d-75de-1f564ae2ab07	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5696-402d-92db-f8f70d1bcb46	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5696-402d-a53a-c95408575ff6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5696-402d-4875-988a2e7e4a48	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5696-402d-dc19-a379a5f5cd2c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5696-402d-6f5c-444ec1a26f90	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5696-402d-e0a9-a39692166152	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5696-402d-36c9-64869543185b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5696-402d-6dc2-24a5526be0aa	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5696-402d-6a38-7e1fe16b03e7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5696-402d-3394-bf393b1dc0f5	CA	CAN	124	Canada 	Kanada	\N
00040000-5696-402d-8766-ad52513d99c4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5696-402d-54b0-226e44cc9272	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5696-402d-e822-6ce5fbf5a24e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5696-402d-40ee-606dff5c3968	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5696-402d-18a4-36deb4685dc9	CL	CHL	152	Chile 	Čile	\N
00040000-5696-402d-6b29-4c5358e795d7	CN	CHN	156	China 	Kitajska	\N
00040000-5696-402d-22b7-a9c31d8f616c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5696-402d-d242-295aa048e026	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5696-402d-0ab0-e465b29dc07f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5696-402d-1c53-156d151d2174	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5696-402d-4f57-518a153e0340	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5696-402d-1e99-c609cb135323	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5696-402d-a8c5-eb7874b54662	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5696-402d-bc22-4009ea809ac3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5696-402d-1b6a-76efc2b88c31	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5696-402d-3e81-f46f5ef31b4a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5696-402d-6707-30e9e3e2b513	CU	CUB	192	Cuba 	Kuba	\N
00040000-5696-402d-617b-6122dd542279	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5696-402d-8a70-68373a09d7d1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5696-402d-ad4a-b3148fcc78d1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5696-402d-8767-fe90b94b52bd	DK	DNK	208	Denmark 	Danska	\N
00040000-5696-402d-261e-b6cc2ca9fca9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5696-402d-a964-24d29a33b439	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5696-402d-4533-af98ed4bf761	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5696-402d-770a-65c53e1617a1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5696-402d-f327-8e7f418c67b5	EG	EGY	818	Egypt 	Egipt	\N
00040000-5696-402d-2619-67f1849a2157	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5696-402d-cf6f-6859f5b3d6bf	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5696-402d-5657-3698774b1236	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5696-402d-e555-64131e7efa4b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5696-402d-6c24-2f3a2ee51c6b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5696-402d-d8b0-e1c13f180722	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5696-402d-2be0-0f53cbfaf902	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5696-402d-f8e7-acb5336faf0d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5696-402d-4870-8b4a644af882	FI	FIN	246	Finland 	Finska	\N
00040000-5696-402d-9e86-30cfb3d71966	FR	FRA	250	France 	Francija	\N
00040000-5696-402d-3a41-de27c0f7f3a3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5696-402d-b6dd-92f2755303c9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5696-402d-9710-af360d2b9497	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5696-402d-292b-e9d28eb6e877	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5696-402d-b56a-2a2e9a376744	GA	GAB	266	Gabon 	Gabon	\N
00040000-5696-402d-6c81-71616c5c6e38	GM	GMB	270	Gambia 	Gambija	\N
00040000-5696-402d-1551-15c7e436b10d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5696-402d-1d94-dece9da165a2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5696-402d-be5b-d8e143da8450	GH	GHA	288	Ghana 	Gana	\N
00040000-5696-402d-32d8-89676e2c7e7a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5696-402d-f42d-d6ddae13e1c5	GR	GRC	300	Greece 	Grčija	\N
00040000-5696-402d-dc59-5d0f7bc9eca0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5696-402d-06bc-94bb57ebbdb4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5696-402d-f130-8cdcd7cf5e2e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5696-402d-e355-ef41c8cf9f62	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5696-402d-6c4b-1287bf44f9b7	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5696-402d-c6f5-6c51b6f31eae	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5696-402d-1a6c-042e3f96f5e4	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5696-402d-2219-ff4f0c5ed2ec	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5696-402d-3184-c5bbf10b895f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5696-402d-4746-404850345af1	HT	HTI	332	Haiti 	Haiti	\N
00040000-5696-402d-1fdc-24db8f9f9348	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5696-402d-7c77-3534f45209ba	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5696-402d-f7a2-7e36b4d6fdcf	HN	HND	340	Honduras 	Honduras	\N
00040000-5696-402d-76e4-23b8e6837642	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5696-402d-cf56-09e0a6399ec8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5696-402d-e7fa-8dbc6352e0b0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5696-402d-4ef6-735bc2fecbb3	IN	IND	356	India 	Indija	\N
00040000-5696-402d-e77d-92e7ee3c3e9a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5696-402d-2bdb-8868088e496f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5696-402d-ee4e-ac97e75c0839	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5696-402d-6b6b-e37611a461ef	IE	IRL	372	Ireland 	Irska	\N
00040000-5696-402d-64b6-20a3b91e1358	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5696-402d-c43b-86947ec1187f	IL	ISR	376	Israel 	Izrael	\N
00040000-5696-402d-2974-5ab6c5c6e876	IT	ITA	380	Italy 	Italija	\N
00040000-5696-402d-45b8-590d199c5ac6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5696-402d-8658-adb0c920aba6	JP	JPN	392	Japan 	Japonska	\N
00040000-5696-402d-4490-9e8b4693f87d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5696-402d-89c8-1363fa7d70e8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5696-402d-a70d-1f86f8c675da	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5696-402d-79f2-e8c9866d6b0c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5696-402d-d8a7-db6b00a27278	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5696-402d-d716-e0ddf70d4721	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5696-402d-0a38-03751d86c6e0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5696-402d-edfc-ee40c51e7a33	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5696-402d-597e-5b73fe3c3b55	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5696-402d-673a-ec18b6e2fa6f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5696-402d-2d99-f0dca06609ea	LV	LVA	428	Latvia 	Latvija	\N
00040000-5696-402d-162d-1efb4b64eec2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5696-402d-589c-6ac2bc15749a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5696-402d-c627-77b48768ebbc	LR	LBR	430	Liberia 	Liberija	\N
00040000-5696-402d-2258-548f44abb2c3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5696-402d-d6e3-a92792df6e7b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5696-402d-9d75-b4b2867eca60	LT	LTU	440	Lithuania 	Litva	\N
00040000-5696-402d-a91a-9a2f0ac65ce8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5696-402d-e6a3-7781af9b5e5e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5696-402d-9c94-2318f4c55385	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5696-402d-6f0d-45ed8171b5b2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5696-402d-1ee9-42fa8759a497	MW	MWI	454	Malawi 	Malavi	\N
00040000-5696-402d-576c-de1439fb07d4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5696-402d-28fc-63b8394b4f47	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5696-402d-3187-533537cbd921	ML	MLI	466	Mali 	Mali	\N
00040000-5696-402d-9178-cf040acd0ce2	MT	MLT	470	Malta 	Malta	\N
00040000-5696-402d-3c40-545af063f8d9	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5696-402d-8c3d-22adadb81d81	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5696-402d-6c9b-02bf2cb8d3a3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5696-402d-f2d8-ee01a08332d6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5696-402d-9309-f81d878702a2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5696-402d-d819-7561fa3d008e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5696-402d-fbca-8f3e86f8ea0d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5696-402d-2442-c07d99e93d75	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5696-402d-83da-27a3daa564d2	MC	MCO	492	Monaco 	Monako	\N
00040000-5696-402d-1807-2c2b74e7c653	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5696-402d-4687-04d766226849	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5696-402d-70b1-bc5ce2620597	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5696-402d-c2f3-332639098d59	MA	MAR	504	Morocco 	Maroko	\N
00040000-5696-402d-b406-b6f6625522b0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5696-402d-8a25-799d3750c4ee	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5696-402d-58bd-8bf938e4468b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5696-402d-8556-e938d6a5cb6c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5696-402d-163b-fa9cc0ea3d5a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5696-402d-a45d-8db74c6fed1b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5696-402d-8a6e-11f3ea1b43b9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5696-402d-0aa8-976b050c918c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5696-402d-4f65-f34e1572f6a3	NE	NER	562	Niger 	Niger 	\N
00040000-5696-402d-b573-28a5035fc66f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5696-402d-7501-0cf543a74f8a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5696-402d-4b9b-57fa09500855	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5696-402d-df26-e8b4815be5c9	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5696-402d-589b-714c48bf16bc	NO	NOR	578	Norway 	Norveška	\N
00040000-5696-402d-ab72-4839f986a12a	OM	OMN	512	Oman 	Oman	\N
00040000-5696-402d-ca72-fbcd78a7691d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5696-402d-0f2a-ea8ec675a2e1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5696-402d-7e31-5ab746922936	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5696-402d-f078-3a4c7bcc1955	PA	PAN	591	Panama 	Panama	\N
00040000-5696-402d-cd00-0317740b5281	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5696-402d-4f41-c6cf6dcc87fc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5696-402d-865d-bfb7f3905c8c	PE	PER	604	Peru 	Peru	\N
00040000-5696-402d-38ef-8eff12a57470	PH	PHL	608	Philippines 	Filipini	\N
00040000-5696-402d-9822-a842057dc355	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5696-402d-53a4-f014141010d7	PL	POL	616	Poland 	Poljska	\N
00040000-5696-402d-0f41-c55cbd159a18	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5696-402d-3dfa-12ae56d8e059	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5696-402d-fb9a-c4d1b03de9fe	QA	QAT	634	Qatar 	Katar	\N
00040000-5696-402d-4973-ad7a5e495a69	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5696-402d-c71b-19e16b0a9c49	RO	ROU	642	Romania 	Romunija	\N
00040000-5696-402d-b89c-e80336ebe2e3	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5696-402d-44c2-1bd962362de1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5696-402d-ad7a-422a662253c4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5696-402d-95b0-a8ad79f797e4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5696-402d-1d3c-cea0d288120a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5696-402d-6d5e-5b61512e18d2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5696-402d-ec8f-03a5db55238f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5696-402d-51a3-9b9e7f2c053f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5696-402d-0b9b-6097be7a791c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5696-402d-9b3c-c6bade4a57d1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5696-402d-73d9-b3de15980a2b	SM	SMR	674	San Marino 	San Marino	\N
00040000-5696-402d-5670-353a9b033ad0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5696-402d-9a8c-b1ac9854d6d7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5696-402d-e920-f668af364d12	SN	SEN	686	Senegal 	Senegal	\N
00040000-5696-402d-0b42-26c8d542dd96	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5696-402d-2321-4f319fc4095c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5696-402d-fe3d-9c371d1b8ab7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5696-402d-68d2-62d2ab723273	SG	SGP	702	Singapore 	Singapur	\N
00040000-5696-402d-cea5-6d078fbaa02e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5696-402d-3b8d-3e67eae87cae	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5696-402d-72fe-8ab474aee919	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5696-402d-ce27-f645cd171bef	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5696-402d-f907-5f9572200116	SO	SOM	706	Somalia 	Somalija	\N
00040000-5696-402d-a442-013689d133e9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5696-402d-7960-53446a63f140	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5696-402d-f6c1-a5605ec3f1cd	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5696-402d-43f1-512419e9ca09	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5696-402d-ae46-6e38abead4df	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5696-402d-4d0c-916c392ac258	SD	SDN	729	Sudan 	Sudan	\N
00040000-5696-402d-fcdb-4117ec34f0d6	SR	SUR	740	Suriname 	Surinam	\N
00040000-5696-402d-cd9c-26d25baf1825	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5696-402d-bdc7-5d3356c63145	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5696-402d-be49-9b9587b778c7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5696-402d-ca1c-7e75ce768dc2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5696-402d-8467-ed300055e6e3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5696-402d-6d90-1d38ea10da0a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5696-402d-9e01-33f40628d7d3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5696-402d-7b12-12542480c426	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5696-402d-bde6-e1b0f8a857bc	TH	THA	764	Thailand 	Tajska	\N
00040000-5696-402d-9803-d62f2389a537	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5696-402d-a014-38c952670383	TG	TGO	768	Togo 	Togo	\N
00040000-5696-402d-a379-f34fbece13a1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5696-402d-86f2-156dbef01c22	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5696-402d-b380-e30a1151ee1a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5696-402d-605d-dd0364037eef	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5696-402d-8f81-985b432c2ed2	TR	TUR	792	Turkey 	Turčija	\N
00040000-5696-402d-22d4-cbd38d3ac190	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5696-402d-1511-7952939642cd	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5696-402d-e90e-18f832dd5e81	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5696-402d-05ac-5c72502efdf1	UG	UGA	800	Uganda 	Uganda	\N
00040000-5696-402d-cb5f-8ff79eb45185	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5696-402d-aa94-f8d7cdbbad00	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5696-402d-505d-33e71f130d8b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5696-402d-6bf6-86124934fd4e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5696-402d-14da-7df61fbff105	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5696-402d-24aa-237e78e83f05	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5696-402d-386b-46c9e4221836	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5696-402d-decc-7497de3e6bdd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5696-402d-8e66-849a13e3a6b4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5696-402d-01b6-290b3da66148	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5696-402d-ecf9-fba5debf2c07	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5696-402d-a06a-3a9365b5cf3d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5696-402d-a60f-183810533607	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5696-402d-2e7f-0570aed3924d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5696-402d-008c-d9f374f993d7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5696-402d-6ef9-d01101ec0e26	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5696-402d-09ca-11a69000a2de	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3199 (class 0 OID 35856204)
-- Dependencies: 241
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5696-4030-6f0a-5e871d7782d1	000e0000-5696-4030-a251-78e580fc8f39	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5696-402c-c550-d71f65ab4e12	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5696-4030-090e-ce59af5a2b30	000e0000-5696-4030-ffd4-dd987168c8e3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5696-402c-ec3a-d5a7b563f310	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5696-4030-a05b-ede56fc5189b	000e0000-5696-4030-b480-86c9ea147162	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5696-402c-c550-d71f65ab4e12	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5696-4030-8cb7-183994010fd9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5696-4030-e7d7-60d364a79385	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3184 (class 0 OID 35856010)
-- Dependencies: 226
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5696-4030-d420-c3b6a76bd885	000e0000-5696-4030-9e1d-3ddb1261ae0c	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5696-402c-6f7b-11929b50d747
000d0000-5696-4030-cc13-5b6b858ea7a3	000e0000-5696-4030-9e1d-3ddb1261ae0c	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-dbc0-31d0dacc40a6	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-cd4a-3f23d2ae8714	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5696-402c-6f7b-11929b50d747
000d0000-5696-4030-1481-a3a493c1e3c4	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-4f56-aeeeb09be146	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-957e-ad115e1397c7	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-2ae6-9cd78d575514	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5696-402c-518e-38fafa379f62
000d0000-5696-4030-11a0-f379e44423ca	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-45d5-192ebd2d6c1a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5696-402c-23ce-3f561c505bd1
000d0000-5696-4030-9333-9d9bfa900d33	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-d666-172819eb4835	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5696-402c-23ce-3f561c505bd1
000d0000-5696-4030-b877-dcce74935772	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-0370-150e8256a1bf	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5696-402c-6f7b-11929b50d747
000d0000-5696-4030-50ce-198784388943	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-4f94-075fbcd0d590	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5696-402c-6f7b-11929b50d747
000d0000-5696-4030-9834-cdead47282aa	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-578a-dad6796c7464	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5696-402c-ed08-7a984883c9bf
000d0000-5696-4030-1f5c-da519ff9841c	000e0000-5696-4030-ffd4-dd987168c8e3	000c0000-5696-4030-7c34-4521a64f0159	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5696-402c-ce61-d75ba07ff2dd
000d0000-5696-4030-4525-425642ec55df	000e0000-5696-4030-3d0f-1ad17f66a9ac	000c0000-5696-4030-2075-9747247f2854	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-d511-3ff5bb071c55	000e0000-5696-4030-a7e2-ab41009c7d86	000c0000-5696-4030-baf1-f51a85e1d64f	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-d0d0-d7f5f5133dde	000e0000-5696-4030-a7e2-ab41009c7d86	000c0000-5696-4030-8efb-83e3071d1ff2	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-80c5-03feb20e4ddc	000e0000-5696-4030-3cf5-7a4db780dbdb	000c0000-5696-4030-5c62-3d7fc8482557	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-05f8-848287b8f3a4	000e0000-5696-4030-c345-217607348ca0	000c0000-5696-4030-b737-081e5df5e1f4	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-8744-267443b53be2	000e0000-5696-4030-47f5-4e970b601b35	000c0000-5696-4030-93e4-bd5e84148490	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-cd49-0fd7fb716ee0	000e0000-5696-4030-12f7-7d86a5740961	000c0000-5696-4030-b5ac-7edc51ac0c68	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-b245-73e73c2cbeec	000e0000-5696-4030-6123-e5dbc5e9a237	000c0000-5696-4030-f41b-aa7e4035fb01	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-2123-f19ce766073a	000e0000-5696-4030-ddf8-d939986f2ad0	000c0000-5696-4030-0dfa-a33816b87166	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-f653-7e92af5a4410	000e0000-5696-4030-ddf8-d939986f2ad0	000c0000-5696-4030-0388-8fce594b7d73	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-f027-f0ac6bfb9a6e	000e0000-5696-4030-05e4-77121ccd330b	000c0000-5696-4030-f6fc-e30b9c5e4e91	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
000d0000-5696-4030-2cc9-a39366b45bda	000e0000-5696-4030-05e4-77121ccd330b	000c0000-5696-4030-71d3-c7925c9cf26f	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5696-402c-b66f-be66870afafd
\.


--
-- TOC entry 3158 (class 0 OID 35855779)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 35855748)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 35855725)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5696-4030-d19d-da2251fc98b0	00080000-5696-402f-5fbe-7c31412b577c	00090000-5696-4030-9c3f-c4a2533aabeb	AK		igralka
\.


--
-- TOC entry 3173 (class 0 OID 35855924)
-- Dependencies: 215
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 35856474)
-- Dependencies: 252
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5696-4030-c0b8-6aff4aa84fc0	00010000-5696-402e-2184-ef847320cfab	\N	Prva mapa	Root mapa	2016-01-13 13:16:48	2016-01-13 13:16:48	R	\N	\N
\.


--
-- TOC entry 3211 (class 0 OID 35856487)
-- Dependencies: 253
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 35856509)
-- Dependencies: 255
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 34548309)
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
-- TOC entry 3177 (class 0 OID 35855949)
-- Dependencies: 219
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 35855682)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5696-402e-3765-6b3adc26f8ed	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5696-402e-852e-778ba130d8d4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5696-402e-2e7d-fe99c89a9e82	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5696-402e-781f-362dc264db8b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5696-402e-af20-6c28172c187b	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5696-402e-e8fa-3bdc6ed0b113	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5696-402e-ec3b-59dea8f82e82	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5696-402e-413f-d9ed71d592c3	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5696-402e-6c45-1b3b9b5bc388	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5696-402e-bd1c-ac2f8f9f87ee	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5696-402e-f930-55232f8c9cfc	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5696-402e-da62-171d933e2958	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5696-402e-16a0-af01a5503edc	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5696-402e-1d2e-e6b7dd335ac2	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5696-402f-4daf-020278050150	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5696-402f-11d3-a79c3de560a0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5696-402f-e0c1-091ce95be752	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5696-402f-8c27-f1a3ae336ca8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5696-402f-4512-4dad0c112c74	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5696-4031-14f7-c9df6e81cdb4	application.tenant.maticnopodjetje	string	s:36:"00080000-5696-4031-7e6b-7429555afe33";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3143 (class 0 OID 35855582)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5696-402f-0473-b4b28ac47bcf	00000000-5696-402f-4daf-020278050150	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5696-402f-acfa-525a1534084c	00000000-5696-402f-4daf-020278050150	00010000-5696-402e-2184-ef847320cfab	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5696-402f-eb38-324e870475cf	00000000-5696-402f-11d3-a79c3de560a0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3147 (class 0 OID 35855649)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5696-4030-5ece-51db55b5927e	\N	00100000-5696-4030-71f6-51a4b42fd853	00100000-5696-4030-5acf-4f521179b095	01	Gledališče Nimbis
00410000-5696-4030-3d2a-7ce371155d17	00410000-5696-4030-5ece-51db55b5927e	00100000-5696-4030-71f6-51a4b42fd853	00100000-5696-4030-5acf-4f521179b095	02	Tehnika
\.


--
-- TOC entry 3144 (class 0 OID 35855593)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5696-4030-44f8-4b44347bea49	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5696-4030-0866-9a46ee1ffbd9	00010000-5696-402f-0bb8-191ff078d852	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5696-4030-2fdd-97710cdde3f8	00010000-5696-402f-1120-1e773389b8b7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5696-4030-8eba-3fc2fcae668a	00010000-5696-402f-76ae-c11898c528d5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5696-4030-0824-0eb4b2183ea7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5696-4030-b4b5-edaed2d4e60f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5696-4030-a706-def26ba25694	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5696-4030-653e-c8821e822465	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5696-4030-9c3f-c4a2533aabeb	00010000-5696-402f-c8f2-d7bd9da04a92	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5696-4030-8eb3-bbe396913a42	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5696-4030-23ab-59abefa8f95f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5696-4030-a929-1f5992c9b235	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5696-4030-7428-e311115c0600	00010000-5696-402f-7d62-e56e575a0b9c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5696-4030-1095-90ed4eccb120	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-4030-98ae-fd085607f40e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-4030-529c-3214a43f3010	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-4030-9885-6d6bd10bc72b	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5696-4030-78b6-c5698c37f366	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5696-4030-334d-b42606f09fa4	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-4030-da8f-965ae54fa4ac	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-4030-f357-9a9b4f04a79b	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3136 (class 0 OID 35855528)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5696-402d-7d8b-9f3fad32f5f1	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5696-402d-8564-2f56ee61a3d4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5696-402d-e0b7-54dfb3072bb2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5696-402d-b9d7-61d532fc9bad	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5696-402d-44c0-957411a964e8	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5696-402d-ab02-67016c860c18	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5696-402d-b264-09a94d372692	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5696-402d-5eaa-5e1d7e2b9186	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5696-402d-0955-271f751d6e23	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5696-402d-8f58-8cffe9b1f6b4	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5696-402d-c9b9-efe21b85fc52	Abonma-read	Abonma - branje	t
00030000-5696-402d-66ec-a6427549d7fb	Abonma-write	Abonma - spreminjanje	t
00030000-5696-402d-ca00-dcd949a2d9b2	Alternacija-read	Alternacija - branje	t
00030000-5696-402d-03c1-76f4907d82fb	Alternacija-write	Alternacija - spreminjanje	t
00030000-5696-402d-a7e0-c81966b450ab	Arhivalija-read	Arhivalija - branje	t
00030000-5696-402d-8ade-c81949f18ab0	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5696-402d-5039-1cd1bdab75c2	AuthStorage-read	AuthStorage - branje	t
00030000-5696-402d-56ae-c03e42672eb2	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5696-402d-0031-03f362b8df71	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5696-402d-44fe-5bbdaf8d5e8f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5696-402d-9fca-5b2ac6a8ad94	Besedilo-read	Besedilo - branje	t
00030000-5696-402d-6fee-2b88b4271d64	Besedilo-write	Besedilo - spreminjanje	t
00030000-5696-402d-8d58-a2b991833d0b	Dodatek-read	Dodatek - branje	t
00030000-5696-402d-44ab-4cd7ca89ad73	Dodatek-write	Dodatek - spreminjanje	t
00030000-5696-402d-376f-41bbabb3498a	Dogodek-read	Dogodek - branje	t
00030000-5696-402d-cedf-b2711e022d82	Dogodek-write	Dogodek - spreminjanje	t
00030000-5696-402d-00cb-2dcf8bc60ff0	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5696-402d-98b2-e41ed00aeb8c	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5696-402d-dc13-340093d1d741	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5696-402d-1f54-736ff54a7211	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5696-402d-7b7c-f5ad5fa8afe1	DogodekTrait-read	DogodekTrait - branje	t
00030000-5696-402d-0aba-ec48a8d14f44	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5696-402d-03b0-4e7d8281e446	DrugiVir-read	DrugiVir - branje	t
00030000-5696-402d-f5a6-a8bc4524dd41	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5696-402d-aab9-9cf757cf297d	Drzava-read	Drzava - branje	t
00030000-5696-402d-394f-70865c704d45	Drzava-write	Drzava - spreminjanje	t
00030000-5696-402d-c2c3-7ee55f9fc353	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5696-402d-b610-33240b02379c	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5696-402d-d142-f313067de83d	Funkcija-read	Funkcija - branje	t
00030000-5696-402d-ae16-aafc57435d2f	Funkcija-write	Funkcija - spreminjanje	t
00030000-5696-402d-d6ad-fe0d5ab099ab	Gostovanje-read	Gostovanje - branje	t
00030000-5696-402d-8c71-c2806a0ce7c9	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5696-402d-af35-8e4cc9be3534	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5696-402d-4101-1e67dcadfa09	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5696-402d-59ba-60cf998103aa	Kupec-read	Kupec - branje	t
00030000-5696-402d-26e8-f0ad1b9809d6	Kupec-write	Kupec - spreminjanje	t
00030000-5696-402d-75c3-18250a52bf47	NacinPlacina-read	NacinPlacina - branje	t
00030000-5696-402d-c0ed-85b708b410b7	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5696-402d-e238-5ff4d50d8e89	Option-read	Option - branje	t
00030000-5696-402d-28da-04b24699f4eb	Option-write	Option - spreminjanje	t
00030000-5696-402d-c915-fc5bddbc31f7	OptionValue-read	OptionValue - branje	t
00030000-5696-402d-6283-4a4db9db084b	OptionValue-write	OptionValue - spreminjanje	t
00030000-5696-402d-ed1c-a797e305e2c7	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5696-402d-1946-e01bc25e1fbc	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5696-402d-f485-1d4072e84def	Oseba-read	Oseba - branje	t
00030000-5696-402d-9b2f-d18211c6c54f	Oseba-write	Oseba - spreminjanje	t
00030000-5696-402d-0add-dfb365e6b1d1	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5696-402d-083e-72e02fe592e8	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5696-402d-08b5-e21f22f5dec8	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5696-402d-524d-26e1757d78c0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5696-402d-6af2-36007905c1e7	Pogodba-read	Pogodba - branje	t
00030000-5696-402d-d010-209836b5fa5c	Pogodba-write	Pogodba - spreminjanje	t
00030000-5696-402d-e185-c0521c626087	Popa-read	Popa - branje	t
00030000-5696-402d-68b0-b3bc8d1ee614	Popa-write	Popa - spreminjanje	t
00030000-5696-402d-044f-26017511cfeb	Posta-read	Posta - branje	t
00030000-5696-402d-23a7-17eeba113b2d	Posta-write	Posta - spreminjanje	t
00030000-5696-402d-dfbd-97f6daff6ce0	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5696-402d-0c1d-dd599dc1dda0	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5696-402d-1449-9c13d5b96e47	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5696-402d-27d9-ae4edd305ec2	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5696-402d-ba02-a0ffa276ed47	PostniNaslov-read	PostniNaslov - branje	t
00030000-5696-402d-41d5-89d6ac51ef62	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5696-402d-2285-53d33a6a9ced	Praznik-read	Praznik - branje	t
00030000-5696-402d-865d-b1f997a9a05e	Praznik-write	Praznik - spreminjanje	t
00030000-5696-402d-c594-9d3d4e7b08d8	Predstava-read	Predstava - branje	t
00030000-5696-402d-3d0d-dbe62e6e798d	Predstava-write	Predstava - spreminjanje	t
00030000-5696-402d-60d0-9380b26890e9	Prisotnost-read	Prisotnost - branje	t
00030000-5696-402d-7644-421eef18dc90	Prisotnost-write	Prisotnost - spreminjanje	t
00030000-5696-402d-a4e0-fda1acce1959	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5696-402d-ec20-f2c016719b76	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5696-402d-eeb2-96874fc1477a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5696-402d-ae3a-f4c98d9a1d24	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5696-402d-944c-ff7f572be671	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5696-402d-f14e-946272aa873a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5696-402d-c8dc-9d5ef9fe13fb	ProgramDela-read	ProgramDela - branje	t
00030000-5696-402d-dec2-92fe04f63cb3	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5696-402d-6081-50f5a627de61	ProgramFestival-read	ProgramFestival - branje	t
00030000-5696-402d-a5c1-7a019dcc8240	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5696-402d-d53f-8dcc75f1d4b9	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5696-402d-36e9-27d2ac4bf371	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5696-402d-4599-8012d576c669	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5696-402d-1379-db5c259eab01	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5696-402d-355b-126dec71fb8a	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5696-402d-4880-34872c4f8d2d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5696-402d-dd93-1de83bf04692	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5696-402d-53e9-0f1d2d947119	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5696-402d-83b2-3c2c05634a1d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5696-402d-2e27-897244d82016	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5696-402d-e10a-ced4c157f034	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5696-402d-c8fe-838c2531911a	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5696-402d-ae4d-baacb993e71e	ProgramRazno-read	ProgramRazno - branje	t
00030000-5696-402d-cfe8-c15af0e92c6a	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5696-402d-12ad-80a92cabb8fe	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5696-402d-8c54-08208a581f4a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5696-402d-4ac6-a76e9e090bda	Prostor-read	Prostor - branje	t
00030000-5696-402d-ef16-86744b0d8b00	Prostor-write	Prostor - spreminjanje	t
00030000-5696-402d-7270-7ed46e49bf90	Racun-read	Racun - branje	t
00030000-5696-402d-2b5a-21ce6fec451d	Racun-write	Racun - spreminjanje	t
00030000-5696-402d-45c8-569c4a846f8d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5696-402d-2ff7-9a8f386c8220	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5696-402d-2e76-ba91e8c8a2af	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5696-402d-6b0c-5d7bdc1007f6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5696-402d-dcaa-3a971983eed2	Rekvizit-read	Rekvizit - branje	t
00030000-5696-402d-22e2-ce40997b7e10	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5696-402d-cde8-a31b0f65c4fb	Revizija-read	Revizija - branje	t
00030000-5696-402d-795f-8875ebcdfe57	Revizija-write	Revizija - spreminjanje	t
00030000-5696-402d-4607-4bb529bc95ee	Rezervacija-read	Rezervacija - branje	t
00030000-5696-402d-d4a9-d86176593295	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5696-402d-57e6-44513dd5bb1f	SedezniRed-read	SedezniRed - branje	t
00030000-5696-402d-2773-2554b5051726	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5696-402d-cc30-564f4c0fcdce	Sedez-read	Sedez - branje	t
00030000-5696-402d-162d-0ffe274a34b9	Sedez-write	Sedez - spreminjanje	t
00030000-5696-402d-e06b-5c7f2378339e	Sezona-read	Sezona - branje	t
00030000-5696-402d-daa7-bf082bb83a93	Sezona-write	Sezona - spreminjanje	t
00030000-5696-402d-dd11-16e9e1b83a0b	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5696-402d-194b-1ebee13a3357	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5696-402d-48b5-e50e7af4b552	Telefonska-read	Telefonska - branje	t
00030000-5696-402d-9c11-531e3d7e3900	Telefonska-write	Telefonska - spreminjanje	t
00030000-5696-402d-203c-ea561685e946	TerminStoritve-read	TerminStoritve - branje	t
00030000-5696-402d-25c4-99c958161d9b	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5696-402d-7f99-f6afb0fb186f	TipDodatka-read	TipDodatka - branje	t
00030000-5696-402d-656f-b9239c211150	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5696-402d-cbd7-61415c83364f	TipFunkcije-read	TipFunkcije - branje	t
00030000-5696-402d-a2d8-3fc31435d1e1	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5696-402d-9e71-bf6e02eaf50e	TipPopa-read	TipPopa - branje	t
00030000-5696-402d-814f-d3feef66d416	TipPopa-write	TipPopa - spreminjanje	t
00030000-5696-402d-19b5-5c4c6cb0b2ee	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5696-402d-f0f7-9cb82e98a447	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5696-402d-3222-24c421231dd3	TipVaje-read	TipVaje - branje	t
00030000-5696-402d-3110-d118641f6b2b	TipVaje-write	TipVaje - spreminjanje	t
00030000-5696-402d-618b-33d4f832b288	Trr-read	Trr - branje	t
00030000-5696-402d-7039-c04463200889	Trr-write	Trr - spreminjanje	t
00030000-5696-402d-15de-5d89041fce1b	Uprizoritev-read	Uprizoritev - branje	t
00030000-5696-402d-37a9-27443a8ecb89	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5696-402d-af5b-e31dbddf0213	Vaja-read	Vaja - branje	t
00030000-5696-402d-5d23-37b4eb60d3ef	Vaja-write	Vaja - spreminjanje	t
00030000-5696-402d-e29d-43e0ef350b49	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5696-402d-ba02-757a8496820a	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5696-402d-291b-d1f2f27a79c2	VrstaStroska-read	VrstaStroska - branje	t
00030000-5696-402d-3f14-131d31adee97	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5696-402d-702f-9da261321d1e	Zaposlitev-read	Zaposlitev - branje	t
00030000-5696-402d-b0ec-109625351eec	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5696-402d-72fa-2a07449eaed2	Zasedenost-read	Zasedenost - branje	t
00030000-5696-402d-2e49-1813b040aeb3	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5696-402d-fcd9-7b2c2c3b6e53	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5696-402d-5569-5e3c3ac8e704	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5696-402d-5fc1-59d89b1517fd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5696-402d-fc3c-6d3878ac1910	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5696-402d-94e4-3623dd9c4c64	Job-read	Branje opravil - samo zase - branje	t
00030000-5696-402d-2d26-5501134544f7	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5696-402d-8a3f-361d9e8d7434	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5696-402d-a665-2b2d70617260	Report-read	Report - branje	t
00030000-5696-402d-93cd-95e4ae9fd6f6	Report-write	Report - spreminjanje	t
00030000-5696-402d-3762-89dc3c5bd867	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5696-402d-d9ce-e620d9bc7791	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5696-402d-3b7c-c237401d4e9d	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5696-402d-3e9d-3851b13cb12f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5696-402d-da80-643dfeb47004	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5696-402d-6f5b-18ca5b527846	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5696-402d-77d0-23c18a15c43a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5696-402d-c1ed-10782f491f5b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5696-402d-53b2-63ef0a059e8a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5696-402d-40fb-ab218d81be86	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5696-402d-e026-ccbb51ecdd06	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5696-402d-38aa-07329249dd34	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5696-402d-f609-139ff6d75011	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5696-402d-032c-72b4495f7c50	Datoteka-write	Datoteka - spreminjanje	t
00030000-5696-402d-1262-dbab10b1ec39	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3138 (class 0 OID 35855547)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5696-402d-f3e8-a2bd38afa628	00030000-5696-402d-8564-2f56ee61a3d4
00020000-5696-402d-f3e8-a2bd38afa628	00030000-5696-402d-7d8b-9f3fad32f5f1
00020000-5696-402d-bf53-86ad0d4dab4c	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-44fe-5bbdaf8d5e8f
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-6fee-2b88b4271d64
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-3734-77db3b3979f4	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-7294-81dd1fa1d2ff	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402d-7294-81dd1fa1d2ff	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-7294-81dd1fa1d2ff	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-7294-81dd1fa1d2ff	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-7294-81dd1fa1d2ff	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-7294-81dd1fa1d2ff	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-f6e6-60fc832aec5f	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-f6e6-60fc832aec5f	00030000-5696-402d-b0ec-109625351eec
00020000-5696-402d-f6e6-60fc832aec5f	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-f6e6-60fc832aec5f	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402d-f6e6-60fc832aec5f	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-f6e6-60fc832aec5f	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-f6e6-60fc832aec5f	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-dba4-1d7e1fd4cd3d	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-dba4-1d7e1fd4cd3d	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-dba4-1d7e1fd4cd3d	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-9299-9ac6648294b6	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-9299-9ac6648294b6	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-9299-9ac6648294b6	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-9299-9ac6648294b6	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-9299-9ac6648294b6	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-9299-9ac6648294b6	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-9299-9ac6648294b6	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-9299-9ac6648294b6	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-5a13-01aa86c1ca79	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-5a13-01aa86c1ca79	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-5a13-01aa86c1ca79	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-5a13-01aa86c1ca79	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-7039-c04463200889
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-41d5-89d6ac51ef62
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-9c11-531e3d7e3900
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-7fbd-9c44c2bcd64f	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-3a42-0f463dac7fc3	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-3a42-0f463dac7fc3	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-3a42-0f463dac7fc3	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-3a42-0f463dac7fc3	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-3a42-0f463dac7fc3	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-3a42-0f463dac7fc3	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-3a42-0f463dac7fc3	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-9c11-531e3d7e3900
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-41d5-89d6ac51ef62
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-7039-c04463200889
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-68b0-b3bc8d1ee614
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-4101-1e67dcadfa09
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-f14e-946272aa873a
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-28b3-886588ee5079	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-cb8d-73ced83f022a	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-5907-e6c9a28e2744	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-5907-e6c9a28e2744	00030000-5696-402d-814f-d3feef66d416
00020000-5696-402d-316d-c87ce9cac1d0	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-852d-bf81cd58f648	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-852d-bf81cd58f648	00030000-5696-402d-23a7-17eeba113b2d
00020000-5696-402d-e3db-5742303ecd4a	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-85ed-67fc761184f9	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-85ed-67fc761184f9	00030000-5696-402d-394f-70865c704d45
00020000-5696-402d-5d46-f1bd6d7fb183	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-d9c1-035e8af1df11	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402d-d9c1-035e8af1df11	00030000-5696-402d-fc3c-6d3878ac1910
00020000-5696-402d-f078-7e047863d3b0	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402d-4f0f-43e1be95e92a	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-4f0f-43e1be95e92a	00030000-5696-402d-5569-5e3c3ac8e704
00020000-5696-402d-6b6b-4e0553aaca64	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-ece0-bde8074ab8f0	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402d-ece0-bde8074ab8f0	00030000-5696-402d-66ec-a6427549d7fb
00020000-5696-402d-9c05-4ba847040311	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402d-5ef0-98779294d1a0	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-5ef0-98779294d1a0	00030000-5696-402d-ef16-86744b0d8b00
00020000-5696-402d-5ef0-98779294d1a0	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-5ef0-98779294d1a0	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-5ef0-98779294d1a0	00030000-5696-402d-41d5-89d6ac51ef62
00020000-5696-402d-5ef0-98779294d1a0	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-0e47-61689e00164d	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-0e47-61689e00164d	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-0e47-61689e00164d	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-47ac-7aed57623fc1	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-47ac-7aed57623fc1	00030000-5696-402d-3f14-131d31adee97
00020000-5696-402d-f156-9ffaddd38484	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-1946-e01bc25e1fbc
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-1973-7f05737eb165	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-a662-d52f46378998	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-a662-d52f46378998	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-a662-d52f46378998	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-a662-d52f46378998	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-a662-d52f46378998	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-9dd7-d4f155672fe3	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402d-9dd7-d4f155672fe3	00030000-5696-402d-3110-d118641f6b2b
00020000-5696-402d-976b-e488ace8bb5f	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-b264-09a94d372692
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-5eaa-5e1d7e2b9186
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-c8dc-9d5ef9fe13fb
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-dec2-92fe04f63cb3
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-6081-50f5a627de61
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-a5c1-7a019dcc8240
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-d53f-8dcc75f1d4b9
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-36e9-27d2ac4bf371
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-4599-8012d576c669
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-1379-db5c259eab01
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-355b-126dec71fb8a
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-4880-34872c4f8d2d
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-dd93-1de83bf04692
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-53e9-0f1d2d947119
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-83b2-3c2c05634a1d
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-2e27-897244d82016
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-e10a-ced4c157f034
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-c8fe-838c2531911a
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-ae4d-baacb993e71e
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-cfe8-c15af0e92c6a
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-12ad-80a92cabb8fe
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-8c54-08208a581f4a
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-ae3a-f4c98d9a1d24
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-f5a6-a8bc4524dd41
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-0c1d-dd599dc1dda0
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-2d26-5501134544f7
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-03b0-4e7d8281e446
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-eeb2-96874fc1477a
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-dfbd-97f6daff6ce0
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-94e4-3623dd9c4c64
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-21c3-0f8e7cf2b2ff	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-c8dc-9d5ef9fe13fb
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-6081-50f5a627de61
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-d53f-8dcc75f1d4b9
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-4599-8012d576c669
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-355b-126dec71fb8a
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-dd93-1de83bf04692
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-83b2-3c2c05634a1d
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-e10a-ced4c157f034
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-ae4d-baacb993e71e
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-12ad-80a92cabb8fe
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-eeb2-96874fc1477a
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-03b0-4e7d8281e446
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-dfbd-97f6daff6ce0
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-94e4-3623dd9c4c64
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-9f86-197c925e2e6a	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-37a9-27443a8ecb89
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-8f58-8cffe9b1f6b4
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-1c5e-10e462f566a9	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-5418-de536fc21d01	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-af0f-abea3a8b372e	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-af0f-abea3a8b372e	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-af0f-abea3a8b372e	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-af0f-abea3a8b372e	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402d-af0f-abea3a8b372e	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-af0f-abea3a8b372e	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-af0f-abea3a8b372e	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-af0f-abea3a8b372e	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-d010-209836b5fa5c
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-194b-1ebee13a3357
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-9dca-74d9f56a8dfe	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-5511-5cef4fe39b49	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-def0-7110f07a1222	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-def0-7110f07a1222	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-def0-7110f07a1222	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-def0-7110f07a1222	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-def0-7110f07a1222	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-def0-7110f07a1222	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-def0-7110f07a1222	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-ba74-cc30caee67c7	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-ba74-cc30caee67c7	00030000-5696-402d-194b-1ebee13a3357
00020000-5696-402d-ba74-cc30caee67c7	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-ba74-cc30caee67c7	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-80fd-18049143bc60	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-80fd-18049143bc60	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-44fe-5bbdaf8d5e8f
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-6fee-2b88b4271d64
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-03b0-4e7d8281e446
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-f5a6-a8bc4524dd41
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-8f58-8cffe9b1f6b4
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-94e4-3623dd9c4c64
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-2d26-5501134544f7
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-d010-209836b5fa5c
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-dfbd-97f6daff6ce0
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-0c1d-dd599dc1dda0
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-eeb2-96874fc1477a
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-ae3a-f4c98d9a1d24
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-b264-09a94d372692
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-c8dc-9d5ef9fe13fb
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-5eaa-5e1d7e2b9186
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-dec2-92fe04f63cb3
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-6081-50f5a627de61
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-a5c1-7a019dcc8240
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-d53f-8dcc75f1d4b9
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-36e9-27d2ac4bf371
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-4599-8012d576c669
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-1379-db5c259eab01
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-355b-126dec71fb8a
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-4880-34872c4f8d2d
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-dd93-1de83bf04692
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-53e9-0f1d2d947119
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-83b2-3c2c05634a1d
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-2e27-897244d82016
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-e10a-ced4c157f034
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-c8fe-838c2531911a
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-ae4d-baacb993e71e
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-cfe8-c15af0e92c6a
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-12ad-80a92cabb8fe
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-8c54-08208a581f4a
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-194b-1ebee13a3357
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-37a9-27443a8ecb89
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-a772-085d9649fde9	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-44fe-5bbdaf8d5e8f
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-6fee-2b88b4271d64
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-9d7b-c5584853931d	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-44fe-5bbdaf8d5e8f
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-6fee-2b88b4271d64
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-8f58-8cffe9b1f6b4
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-37a9-27443a8ecb89
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-8f90-2eb783bfd1e6	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-44fe-5bbdaf8d5e8f
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-6fee-2b88b4271d64
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-03b0-4e7d8281e446
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-f5a6-a8bc4524dd41
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-8f58-8cffe9b1f6b4
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-94e4-3623dd9c4c64
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-2d26-5501134544f7
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-4101-1e67dcadfa09
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-d010-209836b5fa5c
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-68b0-b3bc8d1ee614
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-dfbd-97f6daff6ce0
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-0c1d-dd599dc1dda0
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-41d5-89d6ac51ef62
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-eeb2-96874fc1477a
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-ae3a-f4c98d9a1d24
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-f14e-946272aa873a
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-b264-09a94d372692
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-c8dc-9d5ef9fe13fb
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-5eaa-5e1d7e2b9186
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-dec2-92fe04f63cb3
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-6081-50f5a627de61
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-a5c1-7a019dcc8240
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-d53f-8dcc75f1d4b9
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-36e9-27d2ac4bf371
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-4599-8012d576c669
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-1379-db5c259eab01
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-355b-126dec71fb8a
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-4880-34872c4f8d2d
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-dd93-1de83bf04692
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-53e9-0f1d2d947119
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-83b2-3c2c05634a1d
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-2e27-897244d82016
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-e10a-ced4c157f034
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-c8fe-838c2531911a
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-ae4d-baacb993e71e
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-cfe8-c15af0e92c6a
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-12ad-80a92cabb8fe
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-8c54-08208a581f4a
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-194b-1ebee13a3357
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-9c11-531e3d7e3900
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-7039-c04463200889
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-37a9-27443a8ecb89
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-b0ec-109625351eec
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-f933-8b82a08c6e35	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-44fe-5bbdaf8d5e8f
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-6fee-2b88b4271d64
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-8f58-8cffe9b1f6b4
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-4101-1e67dcadfa09
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-68b0-b3bc8d1ee614
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-41d5-89d6ac51ef62
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-f14e-946272aa873a
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-9c11-531e3d7e3900
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-7039-c04463200889
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-37a9-27443a8ecb89
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-b0ec-109625351eec
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-a84b-e5556362cb38	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-1177-6d2afa26a241	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-03b0-4e7d8281e446
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-f5a6-a8bc4524dd41
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-d142-f313067de83d
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-94e4-3623dd9c4c64
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-2d26-5501134544f7
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-4101-1e67dcadfa09
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-1946-e01bc25e1fbc
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-d010-209836b5fa5c
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-e185-c0521c626087
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-68b0-b3bc8d1ee614
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-dfbd-97f6daff6ce0
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-0c1d-dd599dc1dda0
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-41d5-89d6ac51ef62
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-eeb2-96874fc1477a
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-ae3a-f4c98d9a1d24
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-f14e-946272aa873a
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-b264-09a94d372692
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-c8dc-9d5ef9fe13fb
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-5eaa-5e1d7e2b9186
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-dec2-92fe04f63cb3
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-6081-50f5a627de61
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-a5c1-7a019dcc8240
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-d53f-8dcc75f1d4b9
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-36e9-27d2ac4bf371
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-4599-8012d576c669
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-1379-db5c259eab01
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-355b-126dec71fb8a
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-4880-34872c4f8d2d
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-dd93-1de83bf04692
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-53e9-0f1d2d947119
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-83b2-3c2c05634a1d
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-2e27-897244d82016
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-e10a-ced4c157f034
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-c8fe-838c2531911a
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-ae4d-baacb993e71e
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-cfe8-c15af0e92c6a
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-12ad-80a92cabb8fe
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-8c54-08208a581f4a
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-194b-1ebee13a3357
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-9c11-531e3d7e3900
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-7039-c04463200889
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-3f14-131d31adee97
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-b0ec-109625351eec
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402d-863b-a49784756870	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-7d8b-9f3fad32f5f1
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-8564-2f56ee61a3d4
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-c9b9-efe21b85fc52
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-66ec-a6427549d7fb
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-a7e0-c81966b450ab
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-8ade-c81949f18ab0
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-5039-1cd1bdab75c2
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-56ae-c03e42672eb2
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-0031-03f362b8df71
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-44fe-5bbdaf8d5e8f
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-9fca-5b2ac6a8ad94
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-6fee-2b88b4271d64
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-376f-41bbabb3498a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-b9d7-61d532fc9bad
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-00cb-2dcf8bc60ff0
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-98b2-e41ed00aeb8c
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-dc13-340093d1d741
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-1f54-736ff54a7211
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-7b7c-f5ad5fa8afe1
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-0aba-ec48a8d14f44
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-cedf-b2711e022d82
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-03b0-4e7d8281e446
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-f5a6-a8bc4524dd41
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-aab9-9cf757cf297d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-394f-70865c704d45
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-c2c3-7ee55f9fc353
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-b610-33240b02379c
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-d142-f313067de83d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-8f58-8cffe9b1f6b4
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-d6ad-fe0d5ab099ab
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-8c71-c2806a0ce7c9
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-8a3f-361d9e8d7434
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-94e4-3623dd9c4c64
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-2d26-5501134544f7
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-af35-8e4cc9be3534
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-4101-1e67dcadfa09
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-59ba-60cf998103aa
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-26e8-f0ad1b9809d6
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-77d0-23c18a15c43a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-6f5b-18ca5b527846
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-d9ce-e620d9bc7791
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-3b7c-c237401d4e9d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-3e9d-3851b13cb12f
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-da80-643dfeb47004
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-75c3-18250a52bf47
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-c0ed-85b708b410b7
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-e238-5ff4d50d8e89
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-c915-fc5bddbc31f7
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-6283-4a4db9db084b
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-28da-04b24699f4eb
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ed1c-a797e305e2c7
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-1946-e01bc25e1fbc
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-0add-dfb365e6b1d1
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-083e-72e02fe592e8
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-08b5-e21f22f5dec8
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-524d-26e1757d78c0
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-d010-209836b5fa5c
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-e185-c0521c626087
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-68b0-b3bc8d1ee614
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-044f-26017511cfeb
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-dfbd-97f6daff6ce0
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-0c1d-dd599dc1dda0
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-1449-9c13d5b96e47
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-27d9-ae4edd305ec2
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-23a7-17eeba113b2d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-41d5-89d6ac51ef62
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-2285-53d33a6a9ced
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-865d-b1f997a9a05e
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-c594-9d3d4e7b08d8
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-3d0d-dbe62e6e798d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-a4e0-fda1acce1959
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ec20-f2c016719b76
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-eeb2-96874fc1477a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ae3a-f4c98d9a1d24
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-944c-ff7f572be671
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-f14e-946272aa873a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-b264-09a94d372692
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-c8dc-9d5ef9fe13fb
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-5eaa-5e1d7e2b9186
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-dec2-92fe04f63cb3
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-6081-50f5a627de61
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-a5c1-7a019dcc8240
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-d53f-8dcc75f1d4b9
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-36e9-27d2ac4bf371
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-4599-8012d576c669
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-1379-db5c259eab01
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-355b-126dec71fb8a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-4880-34872c4f8d2d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-dd93-1de83bf04692
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-53e9-0f1d2d947119
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-83b2-3c2c05634a1d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-2e27-897244d82016
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-e10a-ced4c157f034
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-c8fe-838c2531911a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ae4d-baacb993e71e
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-cfe8-c15af0e92c6a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-12ad-80a92cabb8fe
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-8c54-08208a581f4a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-4ac6-a76e9e090bda
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ef16-86744b0d8b00
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-7270-7ed46e49bf90
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-2b5a-21ce6fec451d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-45c8-569c4a846f8d
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-2ff7-9a8f386c8220
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-2e76-ba91e8c8a2af
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-6b0c-5d7bdc1007f6
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-dcaa-3a971983eed2
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-22e2-ce40997b7e10
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-a665-2b2d70617260
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-93cd-95e4ae9fd6f6
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-cde8-a31b0f65c4fb
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-795f-8875ebcdfe57
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-4607-4bb529bc95ee
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-d4a9-d86176593295
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-57e6-44513dd5bb1f
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-2773-2554b5051726
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-cc30-564f4c0fcdce
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-162d-0ffe274a34b9
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-e06b-5c7f2378339e
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-daa7-bf082bb83a93
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-3762-89dc3c5bd867
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-194b-1ebee13a3357
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-9c11-531e3d7e3900
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-203c-ea561685e946
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-e0b7-54dfb3072bb2
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-25c4-99c958161d9b
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-cbd7-61415c83364f
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-a2d8-3fc31435d1e1
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-9e71-bf6e02eaf50e
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-814f-d3feef66d416
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-19b5-5c4c6cb0b2ee
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-f0f7-9cb82e98a447
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-3222-24c421231dd3
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-3110-d118641f6b2b
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-7039-c04463200889
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-37a9-27443a8ecb89
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-af5b-e31dbddf0213
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-5d23-37b4eb60d3ef
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-e29d-43e0ef350b49
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-ba02-757a8496820a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-291b-d1f2f27a79c2
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-3f14-131d31adee97
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-f609-139ff6d75011
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-38aa-07329249dd34
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-b0ec-109625351eec
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-72fa-2a07449eaed2
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-2e49-1813b040aeb3
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-fcd9-7b2c2c3b6e53
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-5569-5e3c3ac8e704
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-5fc1-59d89b1517fd
00020000-5696-402f-035c-ae19cecbc098	00030000-5696-402d-fc3c-6d3878ac1910
00020000-5696-402f-1f25-fa5e8b1bd9a2	00030000-5696-402d-e026-ccbb51ecdd06
00020000-5696-402f-1dd4-401a46870939	00030000-5696-402d-40fb-ab218d81be86
00020000-5696-402f-7add-4312be3f9b62	00030000-5696-402d-37a9-27443a8ecb89
00020000-5696-402f-8552-a156b5071690	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402f-2c35-fec9774fbe34	00030000-5696-402d-3b7c-c237401d4e9d
00020000-5696-402f-3c3e-8578550e5e34	00030000-5696-402d-3e9d-3851b13cb12f
00020000-5696-402f-8c97-6302d4a4c1e0	00030000-5696-402d-da80-643dfeb47004
00020000-5696-402f-17d4-23aaea197ca1	00030000-5696-402d-d9ce-e620d9bc7791
00020000-5696-402f-737c-579c51a82216	00030000-5696-402d-77d0-23c18a15c43a
00020000-5696-402f-4b1d-2838fdb67e82	00030000-5696-402d-6f5b-18ca5b527846
00020000-5696-402f-dc54-419e6fa7217b	00030000-5696-402d-53b2-63ef0a059e8a
00020000-5696-402f-9980-086f30cf2d7d	00030000-5696-402d-c1ed-10782f491f5b
00020000-5696-402f-eb4d-963eaad04a94	00030000-5696-402d-f485-1d4072e84def
00020000-5696-402f-5918-e1fe1829ed5e	00030000-5696-402d-9b2f-d18211c6c54f
00020000-5696-402f-1ead-e8a339f43dca	00030000-5696-402d-44c0-957411a964e8
00020000-5696-402f-ebf9-a74332d22e2f	00030000-5696-402d-ab02-67016c860c18
00020000-5696-402f-42f1-ae821f78d98a	00030000-5696-402d-032c-72b4495f7c50
00020000-5696-402f-f234-5156c266fbab	00030000-5696-402d-1262-dbab10b1ec39
00020000-5696-402f-e24a-74a08d0ed9ed	00030000-5696-402d-e185-c0521c626087
00020000-5696-402f-e24a-74a08d0ed9ed	00030000-5696-402d-68b0-b3bc8d1ee614
00020000-5696-402f-e24a-74a08d0ed9ed	00030000-5696-402d-15de-5d89041fce1b
00020000-5696-402f-b296-690aa3a79e8d	00030000-5696-402d-618b-33d4f832b288
00020000-5696-402f-9b64-493c260afbd7	00030000-5696-402d-7039-c04463200889
00020000-5696-402f-d9eb-1ec7a4c57321	00030000-5696-402d-3762-89dc3c5bd867
00020000-5696-402f-b521-6f2b835f8ab5	00030000-5696-402d-48b5-e50e7af4b552
00020000-5696-402f-7c68-adee48638a39	00030000-5696-402d-9c11-531e3d7e3900
00020000-5696-402f-1f1d-b55e7e89d0b7	00030000-5696-402d-ba02-a0ffa276ed47
00020000-5696-402f-cb98-0b3b8898e54b	00030000-5696-402d-41d5-89d6ac51ef62
00020000-5696-402f-e151-5c1c84750ccc	00030000-5696-402d-702f-9da261321d1e
00020000-5696-402f-ad4b-3b139a151a41	00030000-5696-402d-b0ec-109625351eec
00020000-5696-402f-2ddb-217c557c50a3	00030000-5696-402d-6af2-36007905c1e7
00020000-5696-402f-4503-1587f8393d93	00030000-5696-402d-d010-209836b5fa5c
00020000-5696-402f-a178-1a1472727a2c	00030000-5696-402d-dd11-16e9e1b83a0b
00020000-5696-402f-89a2-2481606aaa4d	00030000-5696-402d-194b-1ebee13a3357
00020000-5696-402f-3529-37dbd2d835ff	00030000-5696-402d-ca00-dcd949a2d9b2
00020000-5696-402f-24fb-0752502cf38a	00030000-5696-402d-03c1-76f4907d82fb
00020000-5696-402f-c1f1-a95d88205213	00030000-5696-402d-0955-271f751d6e23
00020000-5696-402f-cbb5-0b6be99dc684	00030000-5696-402d-d142-f313067de83d
00020000-5696-402f-1596-e7de9c703b78	00030000-5696-402d-ae16-aafc57435d2f
00020000-5696-402f-5fd9-d783ed8f7078	00030000-5696-402d-8f58-8cffe9b1f6b4
\.


--
-- TOC entry 3178 (class 0 OID 35855956)
-- Dependencies: 220
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 35855990)
-- Dependencies: 224
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 35856123)
-- Dependencies: 236
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5696-4030-72fd-1bcee81e1e11	00090000-5696-4030-44f8-4b44347bea49	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5696-4030-0beb-2079833c773e	00090000-5696-4030-b4b5-edaed2d4e60f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5696-4030-2c9b-6bb650f6bf64	00090000-5696-4030-7428-e311115c0600	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5696-4030-b3e4-3ec295bcd1de	00090000-5696-4030-8eb3-bbe396913a42	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3146 (class 0 OID 35855629)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5696-402f-5fbe-7c31412b577c	\N	00040000-5696-402d-72fe-8ab474aee919	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-402f-8bf9-caae4d595c49	\N	00040000-5696-402d-72fe-8ab474aee919	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5696-4030-6f1e-3490f3c115f4	\N	00040000-5696-402d-72fe-8ab474aee919	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-4030-dd95-fbc063c5548b	\N	00040000-5696-402d-72fe-8ab474aee919	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-4030-e1df-497a2916aaf2	\N	00040000-5696-402d-72fe-8ab474aee919	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-4030-b90d-18fc2562f220	\N	00040000-5696-402d-c0a2-b57c0213700f	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-4030-09be-7dbe52a11862	\N	00040000-5696-402d-3e81-f46f5ef31b4a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-4030-8377-9f5322a96904	\N	00040000-5696-402d-fc32-fc17386234bd	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-4030-9778-c42a58efab3a	\N	00040000-5696-402d-1d94-dece9da165a2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-4031-7e6b-7429555afe33	\N	00040000-5696-402d-72fe-8ab474aee919	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3149 (class 0 OID 35855674)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5696-402c-41f1-d50255582cf8	8341	Adlešiči
00050000-5696-402c-76b1-9885c8a81a99	5270	Ajdovščina
00050000-5696-402c-68ea-a6f983dc5d7c	6280	Ankaran/Ancarano
00050000-5696-402c-d782-dd8f78f597cb	9253	Apače
00050000-5696-402c-3be6-19725a7b7fb3	8253	Artiče
00050000-5696-402c-3b3c-93c3bcd9305d	4275	Begunje na Gorenjskem
00050000-5696-402c-438c-5f26c99cc0a2	1382	Begunje pri Cerknici
00050000-5696-402c-76c7-2bcd34ae8368	9231	Beltinci
00050000-5696-402c-e2cc-3ab680d3bbf5	2234	Benedikt
00050000-5696-402c-a5f4-d4bcd6f60054	2345	Bistrica ob Dravi
00050000-5696-402c-964a-4b3561c91fff	3256	Bistrica ob Sotli
00050000-5696-402c-9427-823d95021840	8259	Bizeljsko
00050000-5696-402c-1bd4-7f14d73806e5	1223	Blagovica
00050000-5696-402c-6b1b-fff8f50a3c7a	8283	Blanca
00050000-5696-402c-d4d2-b95dcf69c950	4260	Bled
00050000-5696-402c-d4a3-ba8f28bf5073	4273	Blejska Dobrava
00050000-5696-402c-7b05-116b3b007aed	9265	Bodonci
00050000-5696-402c-4789-10333f6e6f72	9222	Bogojina
00050000-5696-402c-ac3a-ba290aef23a6	4263	Bohinjska Bela
00050000-5696-402c-6891-ed3ad44eb8a8	4264	Bohinjska Bistrica
00050000-5696-402c-b1cc-1c6b031d47e5	4265	Bohinjsko jezero
00050000-5696-402c-cf20-dda708767058	1353	Borovnica
00050000-5696-402c-6c7e-9dbc8015085d	8294	Boštanj
00050000-5696-402c-39f4-95751cddf50f	5230	Bovec
00050000-5696-402c-cf7b-570cbf4470a4	5295	Branik
00050000-5696-402c-ee7c-b9bed16939e4	3314	Braslovče
00050000-5696-402c-2a29-824d50336ba5	5223	Breginj
00050000-5696-402c-5692-31580928d01c	8280	Brestanica
00050000-5696-402c-5bd7-7cb955ecd9f7	2354	Bresternica
00050000-5696-402c-0feb-ee0a1eebbdf7	4243	Brezje
00050000-5696-402c-e345-018f20194874	1351	Brezovica pri Ljubljani
00050000-5696-402c-531f-fc4781261174	8250	Brežice
00050000-5696-402c-01fa-45ca72ec3457	4210	Brnik - Aerodrom
00050000-5696-402c-08cd-72dc0811e6c8	8321	Brusnice
00050000-5696-402c-41a4-19df347bf1ef	3255	Buče
00050000-5696-402c-4fe6-8e583a53a857	8276	Bučka 
00050000-5696-402c-b8ea-3caff6330aa2	9261	Cankova
00050000-5696-402c-d030-2ad3d3510c5e	3000	Celje 
00050000-5696-402c-0a6e-28cd6b0fd448	3001	Celje - poštni predali
00050000-5696-402c-1005-912722af46e3	4207	Cerklje na Gorenjskem
00050000-5696-402c-626b-95d5cb2f75a9	8263	Cerklje ob Krki
00050000-5696-402c-88c0-040658e31d9b	1380	Cerknica
00050000-5696-402c-f4dd-033f4889dadb	5282	Cerkno
00050000-5696-402c-8940-8cefd9468f39	2236	Cerkvenjak
00050000-5696-402c-435f-ea0489c99af3	2215	Ceršak
00050000-5696-402c-1be5-2f8582aad273	2326	Cirkovce
00050000-5696-402c-2917-729ec64a8699	2282	Cirkulane
00050000-5696-402c-d3c6-fc256c3078c4	5273	Col
00050000-5696-402c-47c8-46cf9930e71d	8251	Čatež ob Savi
00050000-5696-402c-71f2-82db6c7873a0	1413	Čemšenik
00050000-5696-402c-883f-455e11f676c5	5253	Čepovan
00050000-5696-402c-77ce-60856e7c6cc4	9232	Črenšovci
00050000-5696-402c-4e24-7c03c292bb14	2393	Črna na Koroškem
00050000-5696-402c-15a5-716c65ec9c30	6275	Črni Kal
00050000-5696-402c-4aaa-0edf12a8f99f	5274	Črni Vrh nad Idrijo
00050000-5696-402c-5dd9-9a1726eb01fa	5262	Črniče
00050000-5696-402c-d0ae-ee7a0f9af2c7	8340	Črnomelj
00050000-5696-402c-79a6-c5898ab24f2c	6271	Dekani
00050000-5696-402c-2285-7d8fc4312c79	5210	Deskle
00050000-5696-402c-98c0-824c1ad9882b	2253	Destrnik
00050000-5696-402c-14c1-40f4288391a2	6215	Divača
00050000-5696-402c-a47e-4e611a8315fe	1233	Dob
00050000-5696-402c-df47-e2f3efa95cef	3224	Dobje pri Planini
00050000-5696-402c-4aac-8181ccd54333	8257	Dobova
00050000-5696-402c-b770-d8f0be285327	1423	Dobovec
00050000-5696-402c-4913-d1e1e7aa0451	5263	Dobravlje
00050000-5696-402c-7f2c-54c3f16fb8cd	3204	Dobrna
00050000-5696-402c-3a0b-e5d485019c55	8211	Dobrnič
00050000-5696-402c-7323-80fdf59cc960	1356	Dobrova
00050000-5696-402c-0af4-b8bf6611789d	9223	Dobrovnik/Dobronak 
00050000-5696-402c-0926-0005c04c4bf0	5212	Dobrovo v Brdih
00050000-5696-402c-bf66-a847bd1074c8	1431	Dol pri Hrastniku
00050000-5696-402c-aaaa-fbc83ada8f22	1262	Dol pri Ljubljani
00050000-5696-402c-284d-fddbb5a0383f	1273	Dole pri Litiji
00050000-5696-402c-c591-82501a75df82	1331	Dolenja vas
00050000-5696-402c-f807-d00055d785a8	8350	Dolenjske Toplice
00050000-5696-402c-b863-12d405e5ac81	1230	Domžale
00050000-5696-402c-1369-f5e712d4ab44	2252	Dornava
00050000-5696-402c-0c8b-6297c4d9d64b	5294	Dornberk
00050000-5696-402c-84a3-79760d71ae82	1319	Draga
00050000-5696-402c-24a4-4f960432fa2c	8343	Dragatuš
00050000-5696-402c-23f6-9aee98237f67	3222	Dramlje
00050000-5696-402c-c382-170339d85e37	2370	Dravograd
00050000-5696-402c-03ea-b6831f1161ae	4203	Duplje
00050000-5696-402c-9dad-f4531435a12b	6221	Dutovlje
00050000-5696-402c-be7f-5a820ba9c286	8361	Dvor
00050000-5696-402c-30c2-cd3ffab5e472	2343	Fala
00050000-5696-402c-1c17-7c4d5addc4d1	9208	Fokovci
00050000-5696-402c-5934-1992a3fc9d37	2313	Fram
00050000-5696-402c-b538-a4fa13e92ad6	3213	Frankolovo
00050000-5696-402c-7d69-21a9b0dcfdd2	1274	Gabrovka
00050000-5696-402c-839a-a77f3127baf3	8254	Globoko
00050000-5696-402c-7fd0-04f69b8bb81d	5275	Godovič
00050000-5696-402c-09b1-b1c5b98cb4d7	4204	Golnik
00050000-5696-402c-df9c-6ade0eae2b9a	3303	Gomilsko
00050000-5696-402c-62b2-3e16d29c3216	4224	Gorenja vas
00050000-5696-402c-dd93-564da72d1066	3263	Gorica pri Slivnici
00050000-5696-402c-3b9b-ac5cad94c889	2272	Gorišnica
00050000-5696-402c-bb67-96b5b5ddf146	9250	Gornja Radgona
00050000-5696-402c-3d52-25b5e05fbdd5	3342	Gornji Grad
00050000-5696-402c-c51c-63b570d3113f	4282	Gozd Martuljek
00050000-5696-402c-f1ad-966ff9cf6d22	6272	Gračišče
00050000-5696-402c-ff84-6f09160aa96d	9264	Grad
00050000-5696-402c-98e3-3bdc2027fbf9	8332	Gradac
00050000-5696-402c-75ab-89cae7bbdcc7	1384	Grahovo
00050000-5696-402c-b790-1240d971eab5	5242	Grahovo ob Bači
00050000-5696-402c-16f1-d01bb3281b20	5251	Grgar
00050000-5696-402c-f45f-03be7f9bbb1f	3302	Griže
00050000-5696-402c-d978-74b78fe64f3a	3231	Grobelno
00050000-5696-402c-6bb5-52ebdd8bfc65	1290	Grosuplje
00050000-5696-402c-7450-189b23684369	2288	Hajdina
00050000-5696-402c-226c-7e5c76a2de8b	8362	Hinje
00050000-5696-402c-430c-6ed448a5baf5	2311	Hoče
00050000-5696-402c-2770-a4ea1f5bd78f	9205	Hodoš/Hodos
00050000-5696-402c-b836-b23f3efb18a0	1354	Horjul
00050000-5696-402c-3c48-635889d9de8e	1372	Hotedršica
00050000-5696-402c-b96c-8284b47d8a21	1430	Hrastnik
00050000-5696-402c-7dba-f7c82f2da689	6225	Hruševje
00050000-5696-402c-ae25-4688c869718a	4276	Hrušica
00050000-5696-402c-f6b5-b01cbf749a80	5280	Idrija
00050000-5696-402c-c3ac-86883aebea8f	1292	Ig
00050000-5696-402c-c43d-8dddf4d73ded	6250	Ilirska Bistrica
00050000-5696-402c-63d9-622cadeadec4	6251	Ilirska Bistrica-Trnovo
00050000-5696-402c-96b9-9427b594364b	1295	Ivančna Gorica
00050000-5696-402c-cfba-dd18e3dcd6bd	2259	Ivanjkovci
00050000-5696-402c-af3c-fdc9da3177d0	1411	Izlake
00050000-5696-402c-cad3-697efeceb863	6310	Izola/Isola
00050000-5696-402c-8194-4e8c9f4e0c41	2222	Jakobski Dol
00050000-5696-402c-bc4b-255b8aff862c	2221	Jarenina
00050000-5696-402c-99a2-95fb39fe885e	6254	Jelšane
00050000-5696-402c-51d2-be4865958e90	4270	Jesenice
00050000-5696-402c-1b39-c4100e88dda9	8261	Jesenice na Dolenjskem
00050000-5696-402c-af59-4231f52c2bc6	3273	Jurklošter
00050000-5696-402c-2176-e097723b640b	2223	Jurovski Dol
00050000-5696-402c-4c65-484cbec99f56	2256	Juršinci
00050000-5696-402c-fdd8-31df2e7930a3	5214	Kal nad Kanalom
00050000-5696-402c-4762-a2ef8ca86d4c	3233	Kalobje
00050000-5696-402c-966a-0d7194debaaf	4246	Kamna Gorica
00050000-5696-402c-2030-664b86ac5831	2351	Kamnica
00050000-5696-402c-f702-d11553d43925	1241	Kamnik
00050000-5696-402c-34d8-edd69a13bdea	5213	Kanal
00050000-5696-402c-d5f2-806fc0ff5576	8258	Kapele
00050000-5696-402c-8d2b-456589d4551d	2362	Kapla
00050000-5696-402c-28cc-7ec273314fd5	2325	Kidričevo
00050000-5696-402c-14db-b36931bb36cc	1412	Kisovec
00050000-5696-402c-0ab2-b71bc3b9737e	6253	Knežak
00050000-5696-402c-4935-36b8d086028b	5222	Kobarid
00050000-5696-402c-06af-312e010f7550	9227	Kobilje
00050000-5696-402c-b74c-4363c1312025	1330	Kočevje
00050000-5696-402c-f7f9-ea3b17f6def6	1338	Kočevska Reka
00050000-5696-402c-de74-8de5c03b8093	2276	Kog
00050000-5696-402c-c1b2-4520a3409b50	5211	Kojsko
00050000-5696-402c-33b4-a86a1d3387dc	6223	Komen
00050000-5696-402c-b05e-bf9c8fa20519	1218	Komenda
00050000-5696-402c-550e-0cfce4606768	6000	Koper/Capodistria 
00050000-5696-402c-3959-f33b59a755ef	6001	Koper/Capodistria - poštni predali
00050000-5696-402c-8f9c-495a1880ddbf	8282	Koprivnica
00050000-5696-402c-f72a-afd1d703843f	5296	Kostanjevica na Krasu
00050000-5696-402c-6167-44eebf7cbfad	8311	Kostanjevica na Krki
00050000-5696-402c-dc5f-b6795417171e	1336	Kostel
00050000-5696-402c-8e2d-41944a4c6764	6256	Košana
00050000-5696-402c-5fea-145b38a67c0f	2394	Kotlje
00050000-5696-402c-3e64-6714e45eb8b6	6240	Kozina
00050000-5696-402c-21ee-8554a9dee380	3260	Kozje
00050000-5696-402c-adc4-2fb3c4efc2d9	4000	Kranj 
00050000-5696-402c-5224-ae3534623ae1	4001	Kranj - poštni predali
00050000-5696-402c-cab9-74752e55b71c	4280	Kranjska Gora
00050000-5696-402c-f495-17b93e459373	1281	Kresnice
00050000-5696-402c-e852-364c7fc75691	4294	Križe
00050000-5696-402c-3a55-f9e16d36565c	9206	Križevci
00050000-5696-402c-1cc0-400c1e37fc98	9242	Križevci pri Ljutomeru
00050000-5696-402c-bbc9-a31283c4fab3	1301	Krka
00050000-5696-402c-83f9-eb3ff5492ce9	8296	Krmelj
00050000-5696-402c-233d-1e53b9aef8c8	4245	Kropa
00050000-5696-402c-ad19-e5e5056355aa	8262	Krška vas
00050000-5696-402c-a3b2-9dd4b9de5c9c	8270	Krško
00050000-5696-402c-c90a-7b387464d904	9263	Kuzma
00050000-5696-402c-806f-d5e9da8bd8f3	2318	Laporje
00050000-5696-402c-eb59-71ad7812e00d	3270	Laško
00050000-5696-402c-0ec3-43dbbdb22f3c	1219	Laze v Tuhinju
00050000-5696-402c-dd16-22f44c0d7493	2230	Lenart v Slovenskih goricah
00050000-5696-402c-4a19-63febf73db63	9220	Lendava/Lendva
00050000-5696-402c-c297-3e8dd678d35e	4248	Lesce
00050000-5696-402c-9554-2eac90d8a527	3261	Lesično
00050000-5696-402c-cb3a-95f8254985a5	8273	Leskovec pri Krškem
00050000-5696-402c-2a24-fab091919ffc	2372	Libeliče
00050000-5696-402c-9997-9216167969be	2341	Limbuš
00050000-5696-402c-0fc9-cd797782b259	1270	Litija
00050000-5696-402c-54ab-819298894d8a	3202	Ljubečna
00050000-5696-402c-0dbb-65c54718383d	1000	Ljubljana 
00050000-5696-402c-147d-9a96034fc85b	1001	Ljubljana - poštni predali
00050000-5696-402c-6797-d30380acc40f	1231	Ljubljana - Črnuče
00050000-5696-402c-ce5c-859f0c5ac869	1261	Ljubljana - Dobrunje
00050000-5696-402c-f712-26a99a9341c3	1260	Ljubljana - Polje
00050000-5696-402c-8a42-c888ceb51f14	1210	Ljubljana - Šentvid
00050000-5696-402c-5e0b-9999e3c51885	1211	Ljubljana - Šmartno
00050000-5696-402c-f0d6-54f08afff075	3333	Ljubno ob Savinji
00050000-5696-402c-b4f6-d9539bac5b42	9240	Ljutomer
00050000-5696-402c-9630-07ffa40bede8	3215	Loče
00050000-5696-402c-38f4-7bf506221b4b	5231	Log pod Mangartom
00050000-5696-402c-1642-2be3543b0dce	1358	Log pri Brezovici
00050000-5696-402c-5f0f-3a53df29cb13	1370	Logatec
00050000-5696-402c-cf76-2c2cf7a24b21	1371	Logatec
00050000-5696-402c-d088-6484316139ed	1434	Loka pri Zidanem Mostu
00050000-5696-402c-7dc4-574635b05fc4	3223	Loka pri Žusmu
00050000-5696-402c-3ec8-8c8eacedf195	6219	Lokev
00050000-5696-402c-1293-a8dafb43ea85	1318	Loški Potok
00050000-5696-402c-e255-55ce2b4b6fbd	2324	Lovrenc na Dravskem polju
00050000-5696-402c-81d4-38abd633b9de	2344	Lovrenc na Pohorju
00050000-5696-402c-41af-09debee31e04	3334	Luče
00050000-5696-402c-790f-5dda75b5fb61	1225	Lukovica
00050000-5696-402c-63bb-34891b2483bd	9202	Mačkovci
00050000-5696-402c-7d38-c57e0f36be9b	2322	Majšperk
00050000-5696-402c-16c5-d959fe028151	2321	Makole
00050000-5696-402c-46a2-38d8895fd659	9243	Mala Nedelja
00050000-5696-402c-ff2f-b06a6e5b79ea	2229	Malečnik
00050000-5696-402c-7dca-368638c0c0b5	6273	Marezige
00050000-5696-402c-62e2-3f2bb126505e	2000	Maribor 
00050000-5696-402c-b6af-9bf59f81379b	2001	Maribor - poštni predali
00050000-5696-402c-75a4-0dbead5e41aa	2206	Marjeta na Dravskem polju
00050000-5696-402c-f50d-3a56f83eb683	2281	Markovci
00050000-5696-402c-8041-6e3abaa58361	9221	Martjanci
00050000-5696-402c-398c-7ad0ff65edd5	6242	Materija
00050000-5696-402c-70fc-796d6bae8e1d	4211	Mavčiče
00050000-5696-402c-4166-579be8485d9f	1215	Medvode
00050000-5696-402c-e4c2-7bcdaf8bebaa	1234	Mengeš
00050000-5696-402c-4acc-eb1b17748039	8330	Metlika
00050000-5696-402c-1196-43237b1634cc	2392	Mežica
00050000-5696-402c-c43e-508ef4183d4a	2204	Miklavž na Dravskem polju
00050000-5696-402c-8057-be5ea9eeec3d	2275	Miklavž pri Ormožu
00050000-5696-402c-d5e4-05acd5f20571	5291	Miren
00050000-5696-402c-f3fe-07dfdb92e7ea	8233	Mirna
00050000-5696-402c-1295-7c16de4f3ec1	8216	Mirna Peč
00050000-5696-402c-9a45-ceca46150c83	2382	Mislinja
00050000-5696-402c-44b4-e2b14ff1f39d	4281	Mojstrana
00050000-5696-402c-ada5-f0fa6c2f4431	8230	Mokronog
00050000-5696-402c-aca4-9935622e4866	1251	Moravče
00050000-5696-402c-bd23-639db3b477a9	9226	Moravske Toplice
00050000-5696-402c-1b27-5596f25679d1	5216	Most na Soči
00050000-5696-402c-d4d9-9beaf3abd5db	1221	Motnik
00050000-5696-402c-3d8b-4867b7b4de36	3330	Mozirje
00050000-5696-402c-91dd-4c3b82b80a1a	9000	Murska Sobota 
00050000-5696-402c-383b-3905bcd26eec	9001	Murska Sobota - poštni predali
00050000-5696-402c-cddb-08f9f79df147	2366	Muta
00050000-5696-402c-a936-4e00f1b93a5a	4202	Naklo
00050000-5696-402c-07f4-e754f4c1b1c4	3331	Nazarje
00050000-5696-402c-a743-1c7acda8e34d	1357	Notranje Gorice
00050000-5696-402c-b770-11b271a79ac8	3203	Nova Cerkev
00050000-5696-402c-f537-48f1f068f0ee	5000	Nova Gorica 
00050000-5696-402c-9cd6-1edc473e7061	5001	Nova Gorica - poštni predali
00050000-5696-402c-fa72-3bcdcf92e912	1385	Nova vas
00050000-5696-402c-1d6a-16ca1659e123	8000	Novo mesto
00050000-5696-402c-8091-6f8255ba5eb8	8001	Novo mesto - poštni predali
00050000-5696-402c-b6f3-6f5d6523873b	6243	Obrov
00050000-5696-402c-e148-2b34b2e4d5f4	9233	Odranci
00050000-5696-402c-5a6a-aac718a3a873	2317	Oplotnica
00050000-5696-402c-ed36-ba4d1b7df2a8	2312	Orehova vas
00050000-5696-402c-5cb3-2d90bb665c19	2270	Ormož
00050000-5696-402c-7b6c-ba0cef89bb8f	1316	Ortnek
00050000-5696-402c-684b-9ce572c99689	1337	Osilnica
00050000-5696-402c-c661-0860c641946e	8222	Otočec
00050000-5696-402c-6031-de828879f753	2361	Ožbalt
00050000-5696-402c-f9e0-efbb34a288bd	2231	Pernica
00050000-5696-402c-1dfd-ef80a0613e71	2211	Pesnica pri Mariboru
00050000-5696-402c-7eb1-a7a19b902495	9203	Petrovci
00050000-5696-402c-05a3-718797044469	3301	Petrovče
00050000-5696-402c-4300-29a0bdc4a29c	6330	Piran/Pirano
00050000-5696-402c-f651-702a36a54efc	8255	Pišece
00050000-5696-402c-a259-7de9653afa66	6257	Pivka
00050000-5696-402c-324e-44942260cd2d	6232	Planina
00050000-5696-402c-dedb-0e817f4fa87e	3225	Planina pri Sevnici
00050000-5696-402c-63fd-fa75dc66a0d7	6276	Pobegi
00050000-5696-402c-e63b-9d55cf937277	8312	Podbočje
00050000-5696-402c-8600-b5b9591280f0	5243	Podbrdo
00050000-5696-402c-5cb5-97a999eca02e	3254	Podčetrtek
00050000-5696-402c-3a90-d3df230958d4	2273	Podgorci
00050000-5696-402c-3709-9e419b4263a0	6216	Podgorje
00050000-5696-402c-11ee-c4e6a6f2bc95	2381	Podgorje pri Slovenj Gradcu
00050000-5696-402c-86c0-0ee45f5acc48	6244	Podgrad
00050000-5696-402c-7838-a63c0bff788e	1414	Podkum
00050000-5696-402c-b581-f95f7abf871f	2286	Podlehnik
00050000-5696-402c-52f8-e92bbd9d0554	5272	Podnanos
00050000-5696-402c-9694-df13c6d244aa	4244	Podnart
00050000-5696-402c-3bd9-edaca730c0b1	3241	Podplat
00050000-5696-402c-4168-7911050424e1	3257	Podsreda
00050000-5696-402c-48d0-51ff2885409a	2363	Podvelka
00050000-5696-402c-e7ac-4f35a3a7389f	2208	Pohorje
00050000-5696-402c-8ffd-811626009bd6	2257	Polenšak
00050000-5696-402c-02ec-5920497dfb2e	1355	Polhov Gradec
00050000-5696-402c-ece2-77551ba72169	4223	Poljane nad Škofjo Loko
00050000-5696-402c-7edf-d8afbe1d9540	2319	Poljčane
00050000-5696-402c-a05d-5a5e0f7c7f91	1272	Polšnik
00050000-5696-402c-6343-1b10ed1bd303	3313	Polzela
00050000-5696-402c-38f8-cea161cc277e	3232	Ponikva
00050000-5696-402c-94dd-a3bcd8376729	6320	Portorož/Portorose
00050000-5696-402c-2c05-ef15d987453b	6230	Postojna
00050000-5696-402c-6fc9-7a4b0e88ded9	2331	Pragersko
00050000-5696-402c-ca60-1b030597e073	3312	Prebold
00050000-5696-402c-b6d3-b2313eeda990	4205	Preddvor
00050000-5696-402c-c7f3-4c34352cd5f1	6255	Prem
00050000-5696-402c-9f3d-27fa87dd452f	1352	Preserje
00050000-5696-402c-da35-cde278753551	6258	Prestranek
00050000-5696-402c-e7fe-18e3470ec910	2391	Prevalje
00050000-5696-402c-dc35-5f6acdc9492e	3262	Prevorje
00050000-5696-402c-a1c7-9a6ee6906e8a	1276	Primskovo 
00050000-5696-402c-f2be-a6718dab9dde	3253	Pristava pri Mestinju
00050000-5696-402c-6e60-139def94299f	9207	Prosenjakovci/Partosfalva
00050000-5696-402c-e1e0-c0983596d682	5297	Prvačina
00050000-5696-402c-09e6-b9cf0d980405	2250	Ptuj
00050000-5696-402c-22db-8bf9cef069c7	2323	Ptujska Gora
00050000-5696-402c-61bb-497d8c9dbf26	9201	Puconci
00050000-5696-402c-9d43-caa4c7b32478	2327	Rače
00050000-5696-402c-6389-7c3b631ae028	1433	Radeče
00050000-5696-402c-b3a2-2358996f3d5f	9252	Radenci
00050000-5696-402c-d139-3ea804971d16	2360	Radlje ob Dravi
00050000-5696-402c-a3e1-39f2f25a7a0b	1235	Radomlje
00050000-5696-402c-cad6-9bbae01b8240	4240	Radovljica
00050000-5696-402c-4352-0ab5b5d6138e	8274	Raka
00050000-5696-402c-4d83-b981248f1626	1381	Rakek
00050000-5696-402c-5f73-ebe1fed4d848	4283	Rateče - Planica
00050000-5696-402c-6fc9-b667f76f1b33	2390	Ravne na Koroškem
00050000-5696-402c-103d-c10e72d412f8	9246	Razkrižje
00050000-5696-402c-8a7a-9d976d13db5b	3332	Rečica ob Savinji
00050000-5696-402c-c3d0-bf2e941abd22	5292	Renče
00050000-5696-402c-2652-dbcb1f3e0c8e	1310	Ribnica
00050000-5696-402c-82e3-3167850d20a7	2364	Ribnica na Pohorju
00050000-5696-402c-e6a4-b0e1ccfc29ca	3272	Rimske Toplice
00050000-5696-402c-2bdb-dc4844390b52	1314	Rob
00050000-5696-402c-2033-2c162c068c34	5215	Ročinj
00050000-5696-402c-bf21-a9f74b5bb1f0	3250	Rogaška Slatina
00050000-5696-402c-6fc7-4cfe813bd36c	9262	Rogašovci
00050000-5696-402c-1e52-90e567bce0e7	3252	Rogatec
00050000-5696-402c-337e-5bce7add9d94	1373	Rovte
00050000-5696-402c-2bff-07b206303b1e	2342	Ruše
00050000-5696-402c-4a1f-b460e5b65627	1282	Sava
00050000-5696-402c-72d5-488744377e7b	6333	Sečovlje/Sicciole
00050000-5696-402c-acb8-66f47eb318d6	4227	Selca
00050000-5696-402c-b4f0-23dfdd28211a	2352	Selnica ob Dravi
00050000-5696-402c-6b64-21d41204babf	8333	Semič
00050000-5696-402c-0ac9-9ae0ce40ae2d	8281	Senovo
00050000-5696-402c-3437-80f4b2fd505a	6224	Senožeče
00050000-5696-402c-9663-0c4cc763b4c2	8290	Sevnica
00050000-5696-402c-6f9a-ee2b78a5f9a9	6210	Sežana
00050000-5696-402c-4614-ecde44a66d3b	2214	Sladki Vrh
00050000-5696-402c-b4e4-36c33e86b247	5283	Slap ob Idrijci
00050000-5696-402c-c7ef-44d74c0281eb	2380	Slovenj Gradec
00050000-5696-402c-ed19-6c994619f438	2310	Slovenska Bistrica
00050000-5696-402c-820d-30a00af9ce5b	3210	Slovenske Konjice
00050000-5696-402c-075a-1dc04bce012e	1216	Smlednik
00050000-5696-402c-0a0d-97dba5fd90f5	5232	Soča
00050000-5696-402c-2a6c-867346330d46	1317	Sodražica
00050000-5696-402c-ef7b-272d474d8ea5	3335	Solčava
00050000-5696-402c-3e0b-8b0fc53f24f7	5250	Solkan
00050000-5696-402c-778e-4aa045298c47	4229	Sorica
00050000-5696-402c-e694-9af32375b2c4	4225	Sovodenj
00050000-5696-402c-e4be-91a444834f1d	5281	Spodnja Idrija
00050000-5696-402c-cf1a-296568d1bc84	2241	Spodnji Duplek
00050000-5696-402c-ae2b-0ebbc192406c	9245	Spodnji Ivanjci
00050000-5696-402c-5861-67cb903836eb	2277	Središče ob Dravi
00050000-5696-402c-555f-5d65772e8246	4267	Srednja vas v Bohinju
00050000-5696-402c-ff24-2116578e06da	8256	Sromlje 
00050000-5696-402c-c65a-800ef51ce02d	5224	Srpenica
00050000-5696-402c-452c-66be0cecca46	1242	Stahovica
00050000-5696-402c-304e-97d98e307b58	1332	Stara Cerkev
00050000-5696-402c-95c4-47903238f4d8	8342	Stari trg ob Kolpi
00050000-5696-402c-e343-395c6da8fb4f	1386	Stari trg pri Ložu
00050000-5696-402c-d495-cee94de95606	2205	Starše
00050000-5696-402c-6960-b9672ff1894f	2289	Stoperce
00050000-5696-402c-744d-518bf3c0bd65	8322	Stopiče
00050000-5696-402c-6c4f-297c575226c9	3206	Stranice
00050000-5696-402c-f811-688853a032e0	8351	Straža
00050000-5696-402c-2def-56243f8e56dd	1313	Struge
00050000-5696-402c-7df3-8ac1be5b06d9	8293	Studenec
00050000-5696-402c-0dbc-1afeba37ef77	8331	Suhor
00050000-5696-402c-facf-31ecd0fbfc4f	2233	Sv. Ana v Slovenskih goricah
00050000-5696-402c-7768-b1969382d7cb	2235	Sv. Trojica v Slovenskih goricah
00050000-5696-402c-ccac-e9fae26563df	2353	Sveti Duh na Ostrem Vrhu
00050000-5696-402c-fd49-f87fbd0e8248	9244	Sveti Jurij ob Ščavnici
00050000-5696-402c-48cc-720d05bfca89	3264	Sveti Štefan
00050000-5696-402c-92e0-39d6e9e569e0	2258	Sveti Tomaž
00050000-5696-402c-b428-b61121136a2b	9204	Šalovci
00050000-5696-402c-1922-43fdc1515822	5261	Šempas
00050000-5696-402c-f7df-1038dfcf96ad	5290	Šempeter pri Gorici
00050000-5696-402c-06b2-18317438c06a	3311	Šempeter v Savinjski dolini
00050000-5696-402c-b264-2ffa64221aac	4208	Šenčur
00050000-5696-402c-6edd-c6207f40e489	2212	Šentilj v Slovenskih goricah
00050000-5696-402c-2706-2796faa26fc4	8297	Šentjanž
00050000-5696-402c-f367-d0953e807fd0	2373	Šentjanž pri Dravogradu
00050000-5696-402c-ac27-cbef7105f1c3	8310	Šentjernej
00050000-5696-402c-5a1c-b8cc96843723	3230	Šentjur
00050000-5696-402c-2f4f-2d323b7bae0d	3271	Šentrupert
00050000-5696-402c-711f-833781f6d84b	8232	Šentrupert
00050000-5696-402c-0db0-a1e30843aac5	1296	Šentvid pri Stični
00050000-5696-402c-c7e7-028295606445	8275	Škocjan
00050000-5696-402c-0432-f7f42aae491b	6281	Škofije
00050000-5696-402c-9a74-0ffa8116b153	4220	Škofja Loka
00050000-5696-402c-7825-e11d20f9dee0	3211	Škofja vas
00050000-5696-402c-d841-417ed2767180	1291	Škofljica
00050000-5696-402c-2297-8476870fea33	6274	Šmarje
00050000-5696-402c-b738-7b662cf536a5	1293	Šmarje - Sap
00050000-5696-402c-ee6c-7ff07f4ea2ab	3240	Šmarje pri Jelšah
00050000-5696-402c-beb6-df87a55fe761	8220	Šmarješke Toplice
00050000-5696-402c-c65a-bf9ca338500e	2315	Šmartno na Pohorju
00050000-5696-402c-b280-225ac07ff82d	3341	Šmartno ob Dreti
00050000-5696-402c-3400-fd8056340ace	3327	Šmartno ob Paki
00050000-5696-402c-3315-89c5774e3ecd	1275	Šmartno pri Litiji
00050000-5696-402c-e600-5238a253b3ab	2383	Šmartno pri Slovenj Gradcu
00050000-5696-402c-9f19-be38fd00873e	3201	Šmartno v Rožni dolini
00050000-5696-402c-019d-98fe0a7d93f1	3325	Šoštanj
00050000-5696-402c-a243-531e5ed5c1bc	6222	Štanjel
00050000-5696-402c-24ea-e39df02f9d90	3220	Štore
00050000-5696-402c-0f95-195577fa160d	3304	Tabor
00050000-5696-402c-93ab-db749cb82e3a	3221	Teharje
00050000-5696-402c-0230-16a0d574b0e1	9251	Tišina
00050000-5696-402c-74b5-44786ede1142	5220	Tolmin
00050000-5696-402c-cd23-c89579510477	3326	Topolšica
00050000-5696-402c-d198-191699e0a618	2371	Trbonje
00050000-5696-402c-5da3-124adc1312d1	1420	Trbovlje
00050000-5696-402c-bed7-ab08c7a0ac65	8231	Trebelno 
00050000-5696-402c-7919-ab27cc8285c9	8210	Trebnje
00050000-5696-402c-0466-908c057dd39a	5252	Trnovo pri Gorici
00050000-5696-402c-4e4a-e3b00d5ff551	2254	Trnovska vas
00050000-5696-402c-0a04-4df347804137	1222	Trojane
00050000-5696-402c-f2b2-bce601ba9861	1236	Trzin
00050000-5696-402c-1fde-e447a1853a30	4290	Tržič
00050000-5696-402c-d949-2cc2459d5311	8295	Tržišče
00050000-5696-402c-4976-5fb2de044b74	1311	Turjak
00050000-5696-402c-3a86-2a938efef2db	9224	Turnišče
00050000-5696-402c-1f9e-7b5924fa6809	8323	Uršna sela
00050000-5696-402c-9cf1-c744b553700c	1252	Vače
00050000-5696-402c-247f-431c0ab5c2db	3320	Velenje 
00050000-5696-402c-738f-97a51072dece	3322	Velenje - poštni predali
00050000-5696-402c-02f8-a39ae6ada718	8212	Velika Loka
00050000-5696-402c-ab45-9a57b990abef	2274	Velika Nedelja
00050000-5696-402c-83fe-06633b86a83e	9225	Velika Polana
00050000-5696-402c-e7e5-4a70a83e5262	1315	Velike Lašče
00050000-5696-402c-0614-23423147ff93	8213	Veliki Gaber
00050000-5696-402c-e2dd-86c4a5dde4c1	9241	Veržej
00050000-5696-402c-4f8e-4c95f50c916a	1312	Videm - Dobrepolje
00050000-5696-402c-21e2-336a4f411a49	2284	Videm pri Ptuju
00050000-5696-402c-52a5-757dc6cdd119	8344	Vinica
00050000-5696-402c-56a6-6998ff22b88a	5271	Vipava
00050000-5696-402c-9b9e-7786aa240a9f	4212	Visoko
00050000-5696-402c-c06d-e9e3d50ee2ae	1294	Višnja Gora
00050000-5696-402c-4740-ca6942f1194e	3205	Vitanje
00050000-5696-402c-b602-a1d9ab4c6f0d	2255	Vitomarci
00050000-5696-402c-82de-7d78fe2025e5	1217	Vodice
00050000-5696-402c-75c4-3f6eda7679ae	3212	Vojnik\t
00050000-5696-402c-f47c-70718d261c08	5293	Volčja Draga
00050000-5696-402c-3fe1-3fc0257594c6	2232	Voličina
00050000-5696-402c-7003-c76f742fcdea	3305	Vransko
00050000-5696-402c-9b2d-f6cf53cd006e	6217	Vremski Britof
00050000-5696-402c-fc37-3a056b23888c	1360	Vrhnika
00050000-5696-402c-f880-b7129de21f07	2365	Vuhred
00050000-5696-402c-b07e-d57b37904af1	2367	Vuzenica
00050000-5696-402c-6c8a-81267d1dfc5e	8292	Zabukovje 
00050000-5696-402c-54aa-612d30d78962	1410	Zagorje ob Savi
00050000-5696-402c-ab3e-911baf5d947d	1303	Zagradec
00050000-5696-402c-98a8-eff8d1807447	2283	Zavrč
00050000-5696-402c-5de5-e7b7267eb32b	8272	Zdole 
00050000-5696-402c-0ca6-542469a5c45a	4201	Zgornja Besnica
00050000-5696-402c-434b-86a4007f13ba	2242	Zgornja Korena
00050000-5696-402c-de81-046a071093fe	2201	Zgornja Kungota
00050000-5696-402c-fdb2-2b2bfa15acfd	2316	Zgornja Ložnica
00050000-5696-402c-2673-3fc97d6fb11d	2314	Zgornja Polskava
00050000-5696-402c-d4e8-e655efe622b6	2213	Zgornja Velka
00050000-5696-402c-a5ad-df1c437d2684	4247	Zgornje Gorje
00050000-5696-402c-01e6-837cb0d31c19	4206	Zgornje Jezersko
00050000-5696-402c-cfe3-6cf269d03f21	2285	Zgornji Leskovec
00050000-5696-402c-e223-3c50b4753d03	1432	Zidani Most
00050000-5696-402c-8318-fddc9e8effcb	3214	Zreče
00050000-5696-402c-b8cc-ebf7e4d753cb	4209	Žabnica
00050000-5696-402c-1774-e9a10b447f41	3310	Žalec
00050000-5696-402c-1c0e-0ce167ca3ebf	4228	Železniki
00050000-5696-402c-5b82-3f7520876b74	2287	Žetale
00050000-5696-402c-d2ac-901fcb8783a1	4226	Žiri
00050000-5696-402c-8d45-3c6a2c575f5c	4274	Žirovnica
00050000-5696-402c-46b0-ff807cbac3eb	8360	Žužemberk
\.


--
-- TOC entry 3201 (class 0 OID 35856360)
-- Dependencies: 243
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 35855930)
-- Dependencies: 216
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 35855659)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5696-4030-5c07-f80235de185f	00080000-5696-402f-5fbe-7c31412b577c	\N	00040000-5696-402d-72fe-8ab474aee919	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5696-4030-480b-9241f7ba7985	00080000-5696-402f-5fbe-7c31412b577c	\N	00040000-5696-402d-72fe-8ab474aee919	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5696-4030-c4a1-62cf02ceb25a	00080000-5696-402f-8bf9-caae4d595c49	\N	00040000-5696-402d-72fe-8ab474aee919	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3160 (class 0 OID 35855797)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5696-402d-b5b0-33fde5f35e1b	novo leto	1	1	\N	t
00430000-5696-402d-56e0-61be2a6c5f92	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5696-402d-beb8-1431bd79749c	dan upora proti okupatorju	27	4	\N	t
00430000-5696-402d-bd11-c1e6b361fc8a	praznik dela	1	5	\N	t
00430000-5696-402d-cd61-7e0ea8f6b483	praznik dela	2	5	\N	t
00430000-5696-402d-3dbf-0b5711364c18	dan Primoža Trubarja	8	6	\N	f
00430000-5696-402d-7bf1-5be6c7b4ea2a	dan državnosti	25	6	\N	t
00430000-5696-402d-a152-a39a7904d7d0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5696-402d-4dcc-474f349b1a12	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5696-402d-6c3a-2b57d4e7d8aa	dan suverenosti	25	10	\N	f
00430000-5696-402d-b221-e7f11ed3b3fd	dan spomina na mrtve	1	11	\N	t
00430000-5696-402d-cc88-a4944071e1de	dan Rudolfa Maistra	23	11	\N	f
00430000-5696-402d-8336-576f0accc1ed	božič	25	12	\N	t
00430000-5696-402d-df9a-03b5c5d73267	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5696-402d-0c8f-2810d38f2421	Marijino vnebovzetje	15	8	\N	t
00430000-5696-402d-238f-0a630e6a9a37	dan reformacije	31	10	\N	t
00430000-5696-402d-4a0d-62d03fed886a	velikonočna nedelja	27	3	2016	t
00430000-5696-402d-deb2-61463d6922f8	velikonočna nedelja	16	4	2017	t
00430000-5696-402d-9d51-cf3c6084c04f	velikonočna nedelja	1	4	2018	t
00430000-5696-402d-5d4f-fe5df39593e8	velikonočna nedelja	21	4	2019	t
00430000-5696-402d-b742-6e7723a05cf6	velikonočna nedelja	12	4	2020	t
00430000-5696-402d-f245-6f0fd6624ffe	velikonočna nedelja	4	4	2021	t
00430000-5696-402d-c7f0-58389a36b9bf	velikonočna nedelja	17	4	2022	t
00430000-5696-402d-c3fd-944eec63ac9a	velikonočna nedelja	9	4	2023	t
00430000-5696-402d-8096-f1a3c4f7ae17	velikonočna nedelja	31	3	2024	t
00430000-5696-402d-d3dd-1a7d06a8c88e	velikonočna nedelja	20	4	2025	t
00430000-5696-402d-65a4-9dcff1ca510d	velikonočna nedelja	5	4	2026	t
00430000-5696-402d-7d11-99c517c112b2	velikonočna nedelja	28	3	2027	t
00430000-5696-402d-340b-7d140a4f2afc	velikonočna nedelja	16	4	2028	t
00430000-5696-402d-b66a-47bfb4d34dff	velikonočna nedelja	1	4	2029	t
00430000-5696-402d-52b9-2c257dd01596	velikonočna nedelja	21	4	2030	t
00430000-5696-402d-676d-5b04789d65cc	velikonočni ponedeljek	28	3	2016	t
00430000-5696-402d-74e3-924cfaed9341	velikonočni ponedeljek	17	4	2017	t
00430000-5696-402d-0c6a-14e3a2c4a5aa	velikonočni ponedeljek	2	4	2018	t
00430000-5696-402d-381d-771ba0b34548	velikonočni ponedeljek	22	4	2019	t
00430000-5696-402d-f6e5-8a1a91a8e02f	velikonočni ponedeljek	13	4	2020	t
00430000-5696-402d-a101-48dcdd9fa503	velikonočni ponedeljek	5	4	2021	t
00430000-5696-402d-2b44-1f8c7ea86040	velikonočni ponedeljek	18	4	2022	t
00430000-5696-402d-527a-4ead3fd62dd9	velikonočni ponedeljek	10	4	2023	t
00430000-5696-402d-1770-879d1d26a641	velikonočni ponedeljek	1	4	2024	t
00430000-5696-402d-627a-ec3cf0922d64	velikonočni ponedeljek	21	4	2025	t
00430000-5696-402d-8b42-61dece4c6082	velikonočni ponedeljek	6	4	2026	t
00430000-5696-402d-7c26-92ac1f0425ff	velikonočni ponedeljek	29	3	2027	t
00430000-5696-402d-bf4a-7fd468f2131f	velikonočni ponedeljek	17	4	2028	t
00430000-5696-402d-a46e-e649275652df	velikonočni ponedeljek	2	4	2029	t
00430000-5696-402d-6a89-538c1097be65	velikonočni ponedeljek	22	4	2030	t
00430000-5696-402d-707b-d8f543aa6962	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5696-402d-f267-0ae9b3f4cb17	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5696-402d-5746-c34a0395b125	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5696-402d-4dfa-f3a0f50ae915	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5696-402d-e856-ea149f3a4cc4	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5696-402d-25b6-9c32a87fb951	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5696-402d-b800-4a628536e013	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5696-402d-5935-b1752a2b079d	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5696-402d-e439-72424d78d61a	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5696-402d-3dea-13567d02301f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5696-402d-4b1e-446210f8bcca	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5696-402d-ed7e-7303b1f5116f	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5696-402d-7aca-9b3ce7fb1cd0	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5696-402d-35b0-0aeaa320aaa1	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5696-402d-517e-3f413d2501ba	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3156 (class 0 OID 35855763)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 35855772)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 35855897)
-- Dependencies: 212
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 35855942)
-- Dependencies: 218
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 35856374)
-- Dependencies: 244
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 35856384)
-- Dependencies: 245
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5696-4030-03bc-21a4095aa11a	00080000-5696-4030-6f1e-3490f3c115f4	0987	AK
00190000-5696-4030-0984-77d9b4737ae6	00080000-5696-402f-8bf9-caae4d595c49	0989	AK
00190000-5696-4030-e5a1-d6b9c94467f6	00080000-5696-4030-dd95-fbc063c5548b	0986	AK
00190000-5696-4030-535b-41ac8ecb6a7c	00080000-5696-4030-b90d-18fc2562f220	0984	AK
00190000-5696-4030-2dae-1a21cd44a3d3	00080000-5696-4030-09be-7dbe52a11862	0983	AK
00190000-5696-4030-e69c-f20b234b5c26	00080000-5696-4030-8377-9f5322a96904	0982	AK
00190000-5696-4031-4405-cfbc05b6c0fd	00080000-5696-4031-7e6b-7429555afe33	1001	AK
\.


--
-- TOC entry 3200 (class 0 OID 35856273)
-- Dependencies: 242
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5696-4030-f049-631ca03308b6	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3204 (class 0 OID 35856392)
-- Dependencies: 246
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 35855971)
-- Dependencies: 222
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5696-402f-9024-1306e4dece40	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5696-402f-e2c9-86f3eaa0df16	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5696-402f-131c-5adc885613dc	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5696-402f-1837-be4d766370ac	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5696-402f-7d44-91623447f585	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5696-402f-ed4d-3505f1b6b61d	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5696-402f-8cab-17b9604770ad	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3172 (class 0 OID 35855915)
-- Dependencies: 214
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 35855905)
-- Dependencies: 213
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 35856112)
-- Dependencies: 235
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 35856042)
-- Dependencies: 229
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 35855737)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 35855499)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5696-4031-7e6b-7429555afe33	00010000-5696-402e-0d9e-2a12315d4292	2016-01-13 13:16:49	INS	a:0:{}
2	App\\Entity\\Option	00000000-5696-4031-14f7-c9df6e81cdb4	00010000-5696-402e-0d9e-2a12315d4292	2016-01-13 13:16:49	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5696-4031-4405-cfbc05b6c0fd	00010000-5696-402e-0d9e-2a12315d4292	2016-01-13 13:16:49	INS	a:0:{}
\.


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3181 (class 0 OID 35855984)
-- Dependencies: 223
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 35855537)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5696-402d-f3e8-a2bd38afa628	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5696-402d-bf53-86ad0d4dab4c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5696-402d-67fa-add00313ee08	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5696-402d-5a6c-cf945242a340	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5696-402d-3734-77db3b3979f4	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5696-402d-7294-81dd1fa1d2ff	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5696-402d-f6e6-60fc832aec5f	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5696-402d-dba4-1d7e1fd4cd3d	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5696-402d-9299-9ac6648294b6	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5696-402d-5a13-01aa86c1ca79	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5696-402d-7fbd-9c44c2bcd64f	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5696-402d-3a42-0f463dac7fc3	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5696-402d-28b3-886588ee5079	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5696-402d-cb8d-73ced83f022a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5696-402d-5907-e6c9a28e2744	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5696-402d-316d-c87ce9cac1d0	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5696-402d-852d-bf81cd58f648	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5696-402d-e3db-5742303ecd4a	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5696-402d-85ed-67fc761184f9	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5696-402d-5d46-f1bd6d7fb183	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5696-402d-d9c1-035e8af1df11	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5696-402d-f078-7e047863d3b0	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5696-402d-4f0f-43e1be95e92a	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5696-402d-6b6b-4e0553aaca64	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5696-402d-ece0-bde8074ab8f0	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5696-402d-9c05-4ba847040311	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5696-402d-5ef0-98779294d1a0	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5696-402d-0e47-61689e00164d	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5696-402d-47ac-7aed57623fc1	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5696-402d-f156-9ffaddd38484	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5696-402d-1973-7f05737eb165	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5696-402d-a662-d52f46378998	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5696-402d-9dd7-d4f155672fe3	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5696-402d-976b-e488ace8bb5f	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5696-402d-21c3-0f8e7cf2b2ff	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5696-402d-9f86-197c925e2e6a	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5696-402d-1c5e-10e462f566a9	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5696-402d-5418-de536fc21d01	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5696-402d-af0f-abea3a8b372e	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5696-402d-9dca-74d9f56a8dfe	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5696-402d-5511-5cef4fe39b49	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5696-402d-def0-7110f07a1222	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5696-402d-ba74-cc30caee67c7	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5696-402d-80fd-18049143bc60	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5696-402d-a772-085d9649fde9	direktor	minimalne pravice za direktorja	t
00020000-5696-402d-9d7b-c5584853931d	arhivar	arhivar	t
00020000-5696-402d-8f90-2eb783bfd1e6	dramaturg	dramaturg	t
00020000-5696-402d-f933-8b82a08c6e35	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5696-402d-a84b-e5556362cb38	poslovni-sekretar	poslovni sekretar	t
00020000-5696-402d-1177-6d2afa26a241	vodja-tehnike	vodja tehnike	t
00020000-5696-402d-863b-a49784756870	racunovodja	računovodja	t
00020000-5696-402f-035c-ae19cecbc098	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5696-402f-1f25-fa5e8b1bd9a2	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-1dd4-401a46870939	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-7add-4312be3f9b62	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-8552-a156b5071690	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-2c35-fec9774fbe34	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-3c3e-8578550e5e34	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-8c97-6302d4a4c1e0	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5696-402f-17d4-23aaea197ca1	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5696-402f-737c-579c51a82216	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-4b1d-2838fdb67e82	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-dc54-419e6fa7217b	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-9980-086f30cf2d7d	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-eb4d-963eaad04a94	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-5918-e1fe1829ed5e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-1ead-e8a339f43dca	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-ebf9-a74332d22e2f	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-42f1-ae821f78d98a	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-f234-5156c266fbab	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-e24a-74a08d0ed9ed	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5696-402f-b296-690aa3a79e8d	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-9b64-493c260afbd7	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-d9eb-1ec7a4c57321	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-b521-6f2b835f8ab5	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-7c68-adee48638a39	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-1f1d-b55e7e89d0b7	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-cb98-0b3b8898e54b	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-e151-5c1c84750ccc	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-ad4b-3b139a151a41	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-2ddb-217c557c50a3	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-4503-1587f8393d93	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-a178-1a1472727a2c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-89a2-2481606aaa4d	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-3529-37dbd2d835ff	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-24fb-0752502cf38a	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-c1f1-a95d88205213	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5696-402f-cbb5-0b6be99dc684	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5696-402f-1596-e7de9c703b78	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5696-402f-5fd9-d783ed8f7078	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3135 (class 0 OID 35855521)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5696-402e-2184-ef847320cfab	00020000-5696-402d-67fa-add00313ee08
00010000-5696-402e-0d9e-2a12315d4292	00020000-5696-402d-67fa-add00313ee08
00010000-5696-402f-3b1b-4644f7a59b47	00020000-5696-402f-035c-ae19cecbc098
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-1f25-fa5e8b1bd9a2
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-2c35-fec9774fbe34
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-737c-579c51a82216
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-dc54-419e6fa7217b
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-eb4d-963eaad04a94
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-f234-5156c266fbab
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-7add-4312be3f9b62
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-b296-690aa3a79e8d
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-b521-6f2b835f8ab5
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-1f1d-b55e7e89d0b7
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-e151-5c1c84750ccc
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-2ddb-217c557c50a3
00010000-5696-402f-962b-4461d739fc57	00020000-5696-402f-3529-37dbd2d835ff
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-1f25-fa5e8b1bd9a2
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-1dd4-401a46870939
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-7add-4312be3f9b62
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-8552-a156b5071690
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-eb4d-963eaad04a94
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-ebf9-a74332d22e2f
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-b296-690aa3a79e8d
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-b521-6f2b835f8ab5
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-1f1d-b55e7e89d0b7
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-e151-5c1c84750ccc
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-2ddb-217c557c50a3
00010000-5696-402f-083d-eb2f70778cd9	00020000-5696-402f-3529-37dbd2d835ff
00010000-5696-402f-1645-27d069718c44	00020000-5696-402f-1f25-fa5e8b1bd9a2
00010000-5696-402f-1645-27d069718c44	00020000-5696-402f-1dd4-401a46870939
00010000-5696-402f-1645-27d069718c44	00020000-5696-402f-7add-4312be3f9b62
00010000-5696-402f-1645-27d069718c44	00020000-5696-402f-8552-a156b5071690
00010000-5696-402f-1645-27d069718c44	00020000-5696-402f-dc54-419e6fa7217b
00010000-5696-402f-1645-27d069718c44	00020000-5696-402f-eb4d-963eaad04a94
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-1dd4-401a46870939
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-3c3e-8578550e5e34
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-4b1d-2838fdb67e82
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-9980-086f30cf2d7d
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-dc54-419e6fa7217b
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-42f1-ae821f78d98a
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-eb4d-963eaad04a94
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-5918-e1fe1829ed5e
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-b296-690aa3a79e8d
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-9b64-493c260afbd7
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-b521-6f2b835f8ab5
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-7c68-adee48638a39
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-1f1d-b55e7e89d0b7
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-cb98-0b3b8898e54b
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-e151-5c1c84750ccc
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-ad4b-3b139a151a41
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-2ddb-217c557c50a3
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-4503-1587f8393d93
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-3529-37dbd2d835ff
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-24fb-0752502cf38a
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-cbb5-0b6be99dc684
00010000-5696-402f-70ff-3c2481f5358f	00020000-5696-402f-1596-e7de9c703b78
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-1dd4-401a46870939
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-3c3e-8578550e5e34
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-17d4-23aaea197ca1
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-4b1d-2838fdb67e82
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-9980-086f30cf2d7d
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-dc54-419e6fa7217b
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-42f1-ae821f78d98a
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-eb4d-963eaad04a94
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-5918-e1fe1829ed5e
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-1ead-e8a339f43dca
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-b296-690aa3a79e8d
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-9b64-493c260afbd7
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-d9eb-1ec7a4c57321
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-b521-6f2b835f8ab5
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-7c68-adee48638a39
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-1f1d-b55e7e89d0b7
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-cb98-0b3b8898e54b
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-e151-5c1c84750ccc
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-ad4b-3b139a151a41
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-2ddb-217c557c50a3
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-4503-1587f8393d93
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-3529-37dbd2d835ff
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-24fb-0752502cf38a
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-c1f1-a95d88205213
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-cbb5-0b6be99dc684
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-1596-e7de9c703b78
00010000-5696-402f-fade-01b8ce514760	00020000-5696-402f-5fd9-d783ed8f7078
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-1dd4-401a46870939
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-7add-4312be3f9b62
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-3c3e-8578550e5e34
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-8c97-6302d4a4c1e0
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-17d4-23aaea197ca1
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-2c35-fec9774fbe34
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-4b1d-2838fdb67e82
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-9980-086f30cf2d7d
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-dc54-419e6fa7217b
00010000-5696-402f-fbbd-a6c70d9728d5	00020000-5696-402f-42f1-ae821f78d98a
00010000-5696-402f-143b-774201e3595a	00020000-5696-402f-1f25-fa5e8b1bd9a2
00010000-5696-402f-143b-774201e3595a	00020000-5696-402f-8552-a156b5071690
00010000-5696-402f-143b-774201e3595a	00020000-5696-402f-2c35-fec9774fbe34
00010000-5696-402f-143b-774201e3595a	00020000-5696-402f-737c-579c51a82216
00010000-5696-402f-143b-774201e3595a	00020000-5696-402f-dc54-419e6fa7217b
00010000-5696-402f-143b-774201e3595a	00020000-5696-402f-eb4d-963eaad04a94
00010000-5696-402f-143b-774201e3595a	00020000-5696-402f-f234-5156c266fbab
00010000-5696-402f-143b-774201e3595a	00020000-5696-402f-a178-1a1472727a2c
00010000-5696-402f-a7db-dcce67c3a33e	00020000-5696-402f-e24a-74a08d0ed9ed
00010000-5696-402f-371e-c80893a584f2	00020000-5696-402d-a772-085d9649fde9
00010000-5696-402f-50d9-eb766e02f6d4	00020000-5696-402d-9d7b-c5584853931d
00010000-5696-402f-f9f6-7614c7f22535	00020000-5696-402d-8f90-2eb783bfd1e6
00010000-5696-402f-0869-7046844a2bf1	00020000-5696-402d-f933-8b82a08c6e35
00010000-5696-402f-a129-03c1bc0a0a2e	00020000-5696-402d-a84b-e5556362cb38
00010000-5696-402f-5431-e8b6f3bf9336	00020000-5696-402d-1177-6d2afa26a241
00010000-5696-402f-c9d3-9cf48849cc9d	00020000-5696-402d-863b-a49784756870
\.


--
-- TOC entry 3183 (class 0 OID 35855998)
-- Dependencies: 225
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 35855936)
-- Dependencies: 217
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 35855857)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5696-402f-581c-6d6fb1ef94e8	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5696-402f-7d98-fb0d5321a65c	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5696-402f-3ef2-a1b8e76e9f8b	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3131 (class 0 OID 35855486)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5696-402c-d8e3-a4f5b1cf64cc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5696-402c-8b37-e9cdbdd2e527	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5696-402c-1bc1-4c11ee477a74	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5696-402c-be3a-17350191971b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5696-402c-dbfd-b5102385450c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3130 (class 0 OID 35855478)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5696-402c-c3c5-1ad0dc7bbc08	00230000-5696-402c-be3a-17350191971b	popa
00240000-5696-402c-68b8-7b51ac955475	00230000-5696-402c-be3a-17350191971b	oseba
00240000-5696-402c-372a-4d0969d9291a	00230000-5696-402c-be3a-17350191971b	tippopa
00240000-5696-402c-0e84-1df11cfb3f60	00230000-5696-402c-be3a-17350191971b	organizacijskaenota
00240000-5696-402c-5eed-0eaee4ee0361	00230000-5696-402c-be3a-17350191971b	sezona
00240000-5696-402c-d63a-d707ed5c24e4	00230000-5696-402c-be3a-17350191971b	tipvaje
00240000-5696-402c-aa0f-7c8ee2995efb	00230000-5696-402c-be3a-17350191971b	tipdodatka
00240000-5696-402c-b396-e28e38b15899	00230000-5696-402c-8b37-e9cdbdd2e527	prostor
00240000-5696-402c-8a14-9244c0daa212	00230000-5696-402c-be3a-17350191971b	besedilo
00240000-5696-402c-2e7a-f9392f18c9b6	00230000-5696-402c-be3a-17350191971b	uprizoritev
00240000-5696-402c-035b-665a6a429c10	00230000-5696-402c-be3a-17350191971b	funkcija
00240000-5696-402c-8456-db86aff5495e	00230000-5696-402c-be3a-17350191971b	tipfunkcije
00240000-5696-402c-29bf-3260da17f79a	00230000-5696-402c-be3a-17350191971b	alternacija
00240000-5696-402c-a302-f9b7e1da3eee	00230000-5696-402c-d8e3-a4f5b1cf64cc	pogodba
00240000-5696-402c-80ad-c9b86fb36785	00230000-5696-402c-be3a-17350191971b	zaposlitev
00240000-5696-402c-cc5c-671a715018c5	00230000-5696-402c-be3a-17350191971b	zvrstuprizoritve
00240000-5696-402c-f6b3-9df5ba5765e2	00230000-5696-402c-d8e3-a4f5b1cf64cc	programdela
00240000-5696-402c-0846-59ee5de7eb76	00230000-5696-402c-be3a-17350191971b	zapis
\.


--
-- TOC entry 3129 (class 0 OID 35855473)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
3a74b95f-1b50-4aca-9f31-71a45dc7e399	00240000-5696-402c-c3c5-1ad0dc7bbc08	0	1001
\.


--
-- TOC entry 3189 (class 0 OID 35856059)
-- Dependencies: 231
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5696-4030-5d72-2921d789607f	000e0000-5696-4030-ffd4-dd987168c8e3	00080000-5696-402f-5fbe-7c31412b577c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5696-402d-2637-19cfb8d7fb47
00270000-5696-4030-a267-3686849ded71	000e0000-5696-4030-ffd4-dd987168c8e3	00080000-5696-402f-5fbe-7c31412b577c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5696-402d-2637-19cfb8d7fb47
\.


--
-- TOC entry 3145 (class 0 OID 35855621)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 35855867)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, prisotnost_id, deltaplaniranzacetek, planiranzacetek, planirankonec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5696-4030-9ecb-0e7d2df1615e	00180000-5696-4030-2878-a77f384fd883	000c0000-5696-4030-cd4a-3f23d2ae8714	00090000-5696-4030-44f8-4b44347bea49	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-4030-cb46-ed0a46f7e809	00180000-5696-4030-2878-a77f384fd883	000c0000-5696-4030-4f56-aeeeb09be146	00090000-5696-4030-8eb3-bbe396913a42	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-4030-e221-5e960ba81753	00180000-5696-4030-2878-a77f384fd883	000c0000-5696-4030-2ae6-9cd78d575514	00090000-5696-4030-2fdd-97710cdde3f8	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-4030-efc4-b6d274264347	00180000-5696-4030-2878-a77f384fd883	000c0000-5696-4030-45d5-192ebd2d6c1a	00090000-5696-4030-0866-9a46ee1ffbd9	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-4030-539f-18f3e99e9e4a	00180000-5696-4030-2878-a77f384fd883	000c0000-5696-4030-d666-172819eb4835	00090000-5696-4030-a929-1f5992c9b235	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-4030-c314-f85077e0bd5d	00180000-5696-4030-2b5c-7dd03c290504	\N	00090000-5696-4030-a929-1f5992c9b235	\N	\N	2015-08-01 20:00:00	2015-08-01 23:00:00	2.00	t	f
001a0000-5696-4030-7c01-1105381d8dc6	00180000-5696-4030-2b5c-7dd03c290504	\N	00090000-5696-4030-8eb3-bbe396913a42	\N	\N	2015-08-01 20:00:00	2015-08-01 23:00:00	2.00	f	t
\.


--
-- TOC entry 3169 (class 0 OID 35855887)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5696-402c-3a89-25ffb0d1d811	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5696-402c-4c53-3dd470e5d9bb	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5696-402c-31b4-3fcd60fb94ca	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5696-402c-8ffc-9d3036218013	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5696-402c-dd63-e437e16b1b57	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5696-402c-0581-ba310352b575	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3192 (class 0 OID 35856100)
-- Dependencies: 234
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5696-402c-ce61-d75ba07ff2dd	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5696-402c-6bdc-bef6fca4a695	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5696-402c-a6e3-3ffad84de462	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5696-402c-b66f-be66870afafd	04	Režija	Režija	Režija	umetnik	30
000f0000-5696-402c-a5d5-a31bcc5fb78e	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5696-402c-0806-50f9ddb9f606	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5696-402c-1137-f5eadc93a378	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5696-402c-e136-a090045cdcf1	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5696-402c-8ce5-73b8a8676ca5	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5696-402c-93c6-09b045a17e52	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5696-402c-ed08-7a984883c9bf	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5696-402c-6950-c26f5989738e	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5696-402c-5529-13ad6f493dae	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5696-402c-4188-b40eccfc5b11	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5696-402c-6f7b-11929b50d747	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5696-402c-1721-ef5f87d38d69	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5696-402c-23ce-3f561c505bd1	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5696-402c-518e-38fafa379f62	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5696-402c-2fc4-1d5226e50627	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3142 (class 0 OID 35855572)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5696-402f-2571-c08205d24424	0001	šola	osnovna ali srednja šola
00400000-5696-402f-eece-df3be633cd70	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5696-402f-6f3e-00a50b26ec64	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3205 (class 0 OID 35856404)
-- Dependencies: 247
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5696-402c-17c4-36a3263a41a3	01	Velika predstava	f	1.00	1.00
002b0000-5696-402c-2204-621a9e7c5063	02	Mala predstava	f	0.50	0.50
002b0000-5696-402c-152c-0fb2262d6725	03	Mala koprodukcija	t	0.40	1.00
002b0000-5696-402c-c550-d71f65ab4e12	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5696-402c-ec3a-d5a7b563f310	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3165 (class 0 OID 35855847)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5696-402c-1e45-619ef6a46043	0001	prva vaja	prva vaja
00420000-5696-402c-ebc3-98a3276960af	0002	tehnična vaja	tehnična vaja
00420000-5696-402c-874f-d0680fa5aa3c	0003	lučna vaja	lučna vaja
00420000-5696-402c-3c3e-7c4c79889bd5	0004	kostumska vaja	kostumska vaja
00420000-5696-402c-4796-4b772ae664f5	0005	foto vaja	foto vaja
00420000-5696-402c-3830-04d799b9465a	0006	1. glavna vaja	1. glavna vaja
00420000-5696-402c-b0a7-6b5659db24d4	0007	2. glavna vaja	2. glavna vaja
00420000-5696-402c-3454-1a9ef90975e9	0008	1. generalka	1. generalka
00420000-5696-402c-51a6-0bca2fe74137	0009	2. generalka	2. generalka
00420000-5696-402c-0fc0-766f3e9c63db	0010	odprta generalka	odprta generalka
00420000-5696-402c-9403-067fe0a9d1c4	0011	obnovitvena vaja	obnovitvena vaja
00420000-5696-402c-5f68-0b4e8c06b5ca	0012	italijanka	krajša "obnovitvena" vaja
00420000-5696-402c-9ae9-d1cf69ad6498	0013	pevska vaja	pevska vaja
00420000-5696-402c-008d-d85782251c0f	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5696-402c-ceec-5ebd5007820f	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5696-402c-8382-e08bf34e0421	0016	orientacijska vaja	orientacijska vaja
00420000-5696-402c-d6cc-8bc8c00d3dc2	0017	situacijska vaja	situacijska vaja
00420000-5696-402c-c17b-d7b897ccd429	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3151 (class 0 OID 35855694)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 35855508)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5696-402e-0d9e-2a12315d4292	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROObIq8pvLrh/jmtrsAlrn6eWs3iPZPWi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5696-402f-1120-1e773389b8b7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5696-402f-0bb8-191ff078d852	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5696-402f-c8f2-d7bd9da04a92	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5696-402f-7d62-e56e575a0b9c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5696-402f-76ae-c11898c528d5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5696-402f-3dcf-83988ccb409f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5696-402f-ee30-a21a651a6617	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5696-402f-123b-2502e2640c69	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5696-402f-d5ca-419fc607f77c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5696-402f-3b1b-4644f7a59b47	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5696-402f-c214-ee544b0e5a23	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5696-402f-962b-4461d739fc57	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5696-402f-083d-eb2f70778cd9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5696-402f-1645-27d069718c44	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5696-402f-70ff-3c2481f5358f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5696-402f-fade-01b8ce514760	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5696-402f-fbbd-a6c70d9728d5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5696-402f-143b-774201e3595a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5696-402f-a7db-dcce67c3a33e	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5696-402f-371e-c80893a584f2	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5696-402f-50d9-eb766e02f6d4	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5696-402f-f9f6-7614c7f22535	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5696-402f-0869-7046844a2bf1	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5696-402f-a129-03c1bc0a0a2e	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5696-402f-5431-e8b6f3bf9336	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5696-402f-c9d3-9cf48849cc9d	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5696-402e-2184-ef847320cfab	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3196 (class 0 OID 35856150)
-- Dependencies: 238
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5696-4030-a251-78e580fc8f39	00160000-5696-402f-1bb7-ef83963089b0	\N	00140000-5696-402d-823a-5d833fabfb7d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5696-402f-7d44-91623447f585
000e0000-5696-4030-ffd4-dd987168c8e3	00160000-5696-402f-8317-3ec812cb9556	\N	00140000-5696-402d-ccae-087f620cc4c9	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5696-402f-ed4d-3505f1b6b61d
000e0000-5696-4030-b480-86c9ea147162	\N	\N	00140000-5696-402d-ccae-087f620cc4c9	00190000-5696-4030-03bc-21a4095aa11a	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5696-402f-7d44-91623447f585
000e0000-5696-4030-7893-f4ff0f982e74	\N	\N	00140000-5696-402d-ccae-087f620cc4c9	00190000-5696-4030-03bc-21a4095aa11a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5696-402f-7d44-91623447f585
000e0000-5696-4030-9e1d-3ddb1261ae0c	\N	\N	00140000-5696-402d-ccae-087f620cc4c9	00190000-5696-4030-03bc-21a4095aa11a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-b6ef-c35ee0ce0d5c	\N	\N	00140000-5696-402d-ccae-087f620cc4c9	00190000-5696-4030-03bc-21a4095aa11a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-3d0f-1ad17f66a9ac	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-a7e2-ab41009c7d86	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-3cf5-7a4db780dbdb	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-c345-217607348ca0	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-47f5-4e970b601b35	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-12f7-7d86a5740961	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-6123-e5dbc5e9a237	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-ddf8-d939986f2ad0	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
000e0000-5696-4030-05e4-77121ccd330b	\N	\N	00140000-5696-402d-7a8d-425343f24d78	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-402f-9024-1306e4dece40
\.


--
-- TOC entry 3159 (class 0 OID 35855790)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5696-4030-0b17-75d1fc41875c	\N	000e0000-5696-4030-ffd4-dd987168c8e3	1
00200000-5696-4030-e53c-4fad596b1ed1	\N	000e0000-5696-4030-ffd4-dd987168c8e3	2
00200000-5696-4030-5b81-95d9de3426d8	\N	000e0000-5696-4030-ffd4-dd987168c8e3	3
00200000-5696-4030-4b25-665484def173	\N	000e0000-5696-4030-ffd4-dd987168c8e3	4
00200000-5696-4030-2f95-6a1a665f3cff	\N	000e0000-5696-4030-ffd4-dd987168c8e3	5
\.


--
-- TOC entry 3179 (class 0 OID 35855963)
-- Dependencies: 221
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 35856073)
-- Dependencies: 232
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5696-402d-57c6-12567ad2a23a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5696-402d-904e-7f14619d1295	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5696-402d-9f52-1ebe14bdd7bd	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5696-402d-e54c-dc72893d39d0	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5696-402d-974e-7599fcffa20a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5696-402d-4fe9-bbb65f07553f	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5696-402d-e648-0662a7ed7a38	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5696-402d-52ce-fe7f4a109c30	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5696-402d-2637-19cfb8d7fb47	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5696-402d-6ed7-1f5680f9c30e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5696-402d-08e1-e65e47c91679	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5696-402d-c6d2-f5caba1e6b98	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5696-402d-82e1-24ccba9580d2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5696-402d-86af-d7c566fe7dab	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5696-402d-beb5-8f7ddc57598c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5696-402d-08cc-f04fd7a1dcb4	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5696-402d-0a15-58145f4cb930	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5696-402d-cbcd-de0c59c5198a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5696-402d-88ed-2db98ef571cd	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5696-402d-59d4-c6e1727fdb39	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5696-402d-3c46-eca447dcbdb0	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5696-402d-eb45-1646dab38a1b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5696-402d-1030-cdd8041931ca	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5696-402d-4081-553ae4273b0c	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5696-402d-1385-e544a35409c5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5696-402d-764b-720ef93498e2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5696-402d-feb4-ecb3e50480d3	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5696-402d-7c4e-124d0e328148	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3208 (class 0 OID 35856454)
-- Dependencies: 250
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 35856423)
-- Dependencies: 249
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 35856466)
-- Dependencies: 251
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 35856035)
-- Dependencies: 228
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5696-4030-71f6-51a4b42fd853	00090000-5696-4030-8eb3-bbe396913a42	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-4030-5acf-4f521179b095	00090000-5696-4030-2fdd-97710cdde3f8	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-4030-b588-c79d7cc53536	00090000-5696-4030-653e-c8821e822465	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-4030-80d0-a5468de63f6e	00090000-5696-4030-8eba-3fc2fcae668a	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-4030-f3ed-d64b20600392	00090000-5696-4030-9c3f-c4a2533aabeb	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-4030-020a-742850bd2796	00090000-5696-4030-a706-def26ba25694	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3162 (class 0 OID 35855831)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 35856140)
-- Dependencies: 237
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5696-402d-823a-5d833fabfb7d	01	Drama	drama (SURS 01)
00140000-5696-402d-4e4c-b0f36b8e9d1b	02	Opera	opera (SURS 02)
00140000-5696-402d-41a8-b8de09f22160	03	Balet	balet (SURS 03)
00140000-5696-402d-e902-33cc1dd74624	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5696-402d-7a8d-425343f24d78	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5696-402d-ccae-087f620cc4c9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5696-402d-9916-114ba5346abd	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3185 (class 0 OID 35856025)
-- Dependencies: 227
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2610 (class 2606 OID 35855571)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 35856198)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 35856189)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 35855562)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 35856056)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 35856098)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 35856507)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 35855884)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 35855819)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 35855841)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 35855846)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2873 (class 2606 OID 35856421)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 35855720)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 35856267)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 35856021)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 35855788)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 35855758)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 35855734)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 35855928)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 35856484)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 35856491)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2902 (class 2606 OID 35856515)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2760 (class 2606 OID 35855955)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 35855692)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 35855590)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 35855654)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 35855617)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 35855551)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2599 (class 2606 OID 35855536)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 35855961)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 35855997)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 35856135)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 35855645)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 35855680)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 35856372)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 35855934)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 35855670)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 35855804)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 35855776)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2677 (class 2606 OID 35855768)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 35855903)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 35855946)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 35856381)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 35856389)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 35856359)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 35856402)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 35855979)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 35855919)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 35855910)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 35856122)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 35856049)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 35855746)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 35855507)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 35855988)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 35855525)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2601 (class 2606 OID 35855545)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 35856006)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 35855941)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 35855865)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 35855495)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 35855483)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 35855477)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 35856069)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 35855626)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 35855875)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 35855894)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 35856109)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 35855579)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 35856414)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 35855854)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 35855705)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 35855520)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 35856168)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 35855794)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 35855969)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 35856081)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2884 (class 2606 OID 35856464)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 35856448)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 35856472)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 35856039)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 35855835)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 35856148)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 35856033)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 1259 OID 35855829)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2694 (class 1259 OID 35855830)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2695 (class 1259 OID 35855828)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2696 (class 1259 OID 35855827)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2697 (class 1259 OID 35855826)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2803 (class 1259 OID 35856070)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2804 (class 1259 OID 35856071)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 35856072)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2888 (class 1259 OID 35856486)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2889 (class 1259 OID 35856485)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2628 (class 1259 OID 35855647)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2629 (class 1259 OID 35855648)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2761 (class 1259 OID 35855962)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2875 (class 1259 OID 35856452)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2876 (class 1259 OID 35856451)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2877 (class 1259 OID 35856453)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2878 (class 1259 OID 35856450)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2879 (class 1259 OID 35856449)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2755 (class 1259 OID 35855948)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2756 (class 1259 OID 35855947)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2685 (class 1259 OID 35855795)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2686 (class 1259 OID 35855796)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2785 (class 1259 OID 35856022)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2786 (class 1259 OID 35856024)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2787 (class 1259 OID 35856023)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2660 (class 1259 OID 35855736)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2661 (class 1259 OID 35855735)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 35856403)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2819 (class 1259 OID 35856137)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2820 (class 1259 OID 35856138)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 35856139)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2885 (class 1259 OID 35856473)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2828 (class 1259 OID 35856173)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2829 (class 1259 OID 35856170)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2830 (class 1259 OID 35856174)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2831 (class 1259 OID 35856172)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2832 (class 1259 OID 35856171)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2650 (class 1259 OID 35855707)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 35855706)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2619 (class 1259 OID 35855620)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2773 (class 1259 OID 35855989)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2603 (class 1259 OID 35855552)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2604 (class 1259 OID 35855553)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2778 (class 1259 OID 35856009)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2779 (class 1259 OID 35856008)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2780 (class 1259 OID 35856007)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2633 (class 1259 OID 35855657)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2634 (class 1259 OID 35855656)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2635 (class 1259 OID 35855658)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2673 (class 1259 OID 35855771)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2674 (class 1259 OID 35855769)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 35855770)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2583 (class 1259 OID 35855485)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2735 (class 1259 OID 35855914)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2736 (class 1259 OID 35855912)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2737 (class 1259 OID 35855911)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2738 (class 1259 OID 35855913)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 35855526)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2595 (class 1259 OID 35855527)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2764 (class 1259 OID 35855970)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2898 (class 1259 OID 35856508)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2801 (class 1259 OID 35856058)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2802 (class 1259 OID 35856057)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2899 (class 1259 OID 35856516)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2900 (class 1259 OID 35856517)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2750 (class 1259 OID 35855935)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2795 (class 1259 OID 35856050)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2796 (class 1259 OID 35856051)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2848 (class 1259 OID 35856272)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2849 (class 1259 OID 35856271)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2850 (class 1259 OID 35856268)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2851 (class 1259 OID 35856269)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2852 (class 1259 OID 35856270)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2639 (class 1259 OID 35855672)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2640 (class 1259 OID 35855671)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2641 (class 1259 OID 35855673)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 35855983)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2768 (class 1259 OID 35855982)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2858 (class 1259 OID 35856382)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 35856383)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2841 (class 1259 OID 35856202)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2842 (class 1259 OID 35856203)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2843 (class 1259 OID 35856200)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2844 (class 1259 OID 35856201)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2732 (class 1259 OID 35855904)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2726 (class 1259 OID 35855885)
-- Name: idx_aab095ce1d25995; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce1d25995 ON dodatek USING btree (prisotnost_id);


--
-- TOC entry 2727 (class 1259 OID 35855886)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2791 (class 1259 OID 35856040)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2792 (class 1259 OID 35856041)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2741 (class 1259 OID 35855923)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2742 (class 1259 OID 35855922)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2743 (class 1259 OID 35855920)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2744 (class 1259 OID 35855921)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2838 (class 1259 OID 35856190)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2664 (class 1259 OID 35855747)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2667 (class 1259 OID 35855761)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2668 (class 1259 OID 35855760)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2669 (class 1259 OID 35855759)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2670 (class 1259 OID 35855762)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2684 (class 1259 OID 35855789)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 35855777)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2679 (class 1259 OID 35855778)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2855 (class 1259 OID 35856373)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2874 (class 1259 OID 35856422)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2892 (class 1259 OID 35856492)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2893 (class 1259 OID 35856493)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2615 (class 1259 OID 35855592)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2616 (class 1259 OID 35855591)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2624 (class 1259 OID 35855627)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 35855628)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2704 (class 1259 OID 35855836)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2718 (class 1259 OID 35855878)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2719 (class 1259 OID 35855877)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2720 (class 1259 OID 35855876)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2698 (class 1259 OID 35855821)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2699 (class 1259 OID 35855822)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2700 (class 1259 OID 35855825)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2701 (class 1259 OID 35855820)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2702 (class 1259 OID 35855824)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2703 (class 1259 OID 35855823)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2632 (class 1259 OID 35855646)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 35855580)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 35855581)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2656 (class 1259 OID 35855721)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 35855723)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2658 (class 1259 OID 35855722)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2659 (class 1259 OID 35855724)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2749 (class 1259 OID 35855929)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2824 (class 1259 OID 35856136)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2833 (class 1259 OID 35856169)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2815 (class 1259 OID 35856110)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2816 (class 1259 OID 35856111)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2622 (class 1259 OID 35855618)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 35855619)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2730 (class 1259 OID 35855895)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2731 (class 1259 OID 35855896)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2788 (class 1259 OID 35856034)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 35855496)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 35855693)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2638 (class 1259 OID 35855655)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 35855484)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2871 (class 1259 OID 35856415)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2771 (class 1259 OID 35855981)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2772 (class 1259 OID 35855980)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 35855855)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 35855856)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2845 (class 1259 OID 35856199)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 35855681)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2825 (class 1259 OID 35856149)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2882 (class 1259 OID 35856465)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2864 (class 1259 OID 35856390)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2865 (class 1259 OID 35856391)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2812 (class 1259 OID 35856099)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2717 (class 1259 OID 35855866)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 35855546)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2723 (class 1259 OID 35855879)
-- Name: uniq_fef7d84b1d25995; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_fef7d84b1d25995 ON terminstoritve USING btree (prisotnost_id);


--
-- TOC entry 2942 (class 2606 OID 35856688)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2941 (class 2606 OID 35856693)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2936 (class 2606 OID 35856718)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2938 (class 2606 OID 35856708)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2943 (class 2606 OID 35856683)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2939 (class 2606 OID 35856703)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2937 (class 2606 OID 35856713)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2940 (class 2606 OID 35856698)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 35856908)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2982 (class 2606 OID 35856913)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2981 (class 2606 OID 35856918)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3014 (class 2606 OID 35857078)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3015 (class 2606 OID 35857073)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 35856573)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2914 (class 2606 OID 35856578)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2964 (class 2606 OID 35856823)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3009 (class 2606 OID 35857058)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3010 (class 2606 OID 35857053)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3008 (class 2606 OID 35857063)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 35857048)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3012 (class 2606 OID 35857043)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2962 (class 2606 OID 35856818)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2963 (class 2606 OID 35856813)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2935 (class 2606 OID 35856673)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2934 (class 2606 OID 35856678)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 35856863)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2972 (class 2606 OID 35856873)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2973 (class 2606 OID 35856868)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2924 (class 2606 OID 35856628)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 35856623)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 35856803)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 35857033)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 35856923)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2985 (class 2606 OID 35856928)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 35856933)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3013 (class 2606 OID 35857068)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2988 (class 2606 OID 35856953)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2991 (class 2606 OID 35856938)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2987 (class 2606 OID 35856958)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2989 (class 2606 OID 35856948)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 35856943)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2922 (class 2606 OID 35856618)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2923 (class 2606 OID 35856613)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2910 (class 2606 OID 35856558)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2911 (class 2606 OID 35856553)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2968 (class 2606 OID 35856843)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2907 (class 2606 OID 35856533)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2906 (class 2606 OID 35856538)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2969 (class 2606 OID 35856858)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2970 (class 2606 OID 35856853)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 35856848)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2917 (class 2606 OID 35856588)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2918 (class 2606 OID 35856583)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2916 (class 2606 OID 35856593)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2928 (class 2606 OID 35856653)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 35856643)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2929 (class 2606 OID 35856648)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2903 (class 2606 OID 35856518)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2952 (class 2606 OID 35856778)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2954 (class 2606 OID 35856768)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 35856763)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2953 (class 2606 OID 35856773)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2905 (class 2606 OID 35856523)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2904 (class 2606 OID 35856528)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2965 (class 2606 OID 35856828)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3018 (class 2606 OID 35857093)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2979 (class 2606 OID 35856903)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2980 (class 2606 OID 35856898)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3020 (class 2606 OID 35857098)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3019 (class 2606 OID 35857103)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2961 (class 2606 OID 35856808)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2978 (class 2606 OID 35856888)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2977 (class 2606 OID 35856893)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2997 (class 2606 OID 35857008)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2998 (class 2606 OID 35857003)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3001 (class 2606 OID 35856988)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 35856993)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2999 (class 2606 OID 35856998)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2920 (class 2606 OID 35856603)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2921 (class 2606 OID 35856598)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 35856608)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 35856838)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2967 (class 2606 OID 35856833)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3004 (class 2606 OID 35857018)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3003 (class 2606 OID 35857023)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2994 (class 2606 OID 35856978)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2993 (class 2606 OID 35856983)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2996 (class 2606 OID 35856968)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2995 (class 2606 OID 35856973)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2951 (class 2606 OID 35856758)
-- Name: fk_a8171cf610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT fk_a8171cf610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 35856748)
-- Name: fk_aab095ce1d25995; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce1d25995 FOREIGN KEY (prisotnost_id) REFERENCES prisotnost(id);


--
-- TOC entry 2949 (class 2606 OID 35856753)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2976 (class 2606 OID 35856878)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2975 (class 2606 OID 35856883)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2956 (class 2606 OID 35856798)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2957 (class 2606 OID 35856793)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 35856783)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2958 (class 2606 OID 35856788)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2992 (class 2606 OID 35856963)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2926 (class 2606 OID 35856633)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2927 (class 2606 OID 35856638)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 35856668)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2932 (class 2606 OID 35856658)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2931 (class 2606 OID 35856663)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3002 (class 2606 OID 35857013)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3005 (class 2606 OID 35857028)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3007 (class 2606 OID 35857038)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3017 (class 2606 OID 35857083)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3016 (class 2606 OID 35857088)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2908 (class 2606 OID 35856548)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2909 (class 2606 OID 35856543)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2913 (class 2606 OID 35856563)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 35856568)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2944 (class 2606 OID 35856723)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2946 (class 2606 OID 35856738)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 35856743)
-- Name: fk_fef7d84b1d25995; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b1d25995 FOREIGN KEY (prisotnost_id) REFERENCES prisotnost(id);


--
-- TOC entry 2947 (class 2606 OID 35856733)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2948 (class 2606 OID 35856728)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-13 13:16:51 CET

--
-- PostgreSQL database dump complete
--

