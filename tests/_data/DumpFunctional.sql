--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-29 09:11:02 CET

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
-- TOC entry 185 (class 1259 OID 41597142)
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
-- TOC entry 241 (class 1259 OID 41597760)
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
-- TOC entry 240 (class 1259 OID 41597744)
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
-- TOC entry 184 (class 1259 OID 41597135)
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
-- TOC entry 183 (class 1259 OID 41597133)
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
-- TOC entry 231 (class 1259 OID 41597621)
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
-- TOC entry 234 (class 1259 OID 41597651)
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
-- TOC entry 255 (class 1259 OID 41598063)
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
-- TOC entry 212 (class 1259 OID 41597457)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 41597382)
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
-- TOC entry 206 (class 1259 OID 41597408)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 41597413)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 41597985)
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
-- TOC entry 196 (class 1259 OID 41597288)
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
-- TOC entry 242 (class 1259 OID 41597773)
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
-- TOC entry 227 (class 1259 OID 41597579)
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
-- TOC entry 202 (class 1259 OID 41597356)
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
-- TOC entry 199 (class 1259 OID 41597328)
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
-- TOC entry 197 (class 1259 OID 41597305)
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
-- TOC entry 216 (class 1259 OID 41597493)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 41598043)
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
-- TOC entry 254 (class 1259 OID 41598056)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 41598078)
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
-- TOC entry 220 (class 1259 OID 41597517)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 41597262)
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
-- TOC entry 187 (class 1259 OID 41597162)
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
-- TOC entry 191 (class 1259 OID 41597229)
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
-- TOC entry 188 (class 1259 OID 41597173)
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
-- TOC entry 180 (class 1259 OID 41597107)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 41597126)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41597524)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 41597559)
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
-- TOC entry 237 (class 1259 OID 41597692)
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
-- TOC entry 190 (class 1259 OID 41597209)
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
-- TOC entry 193 (class 1259 OID 41597254)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 41597929)
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
-- TOC entry 217 (class 1259 OID 41597499)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 41597239)
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
-- TOC entry 204 (class 1259 OID 41597374)
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
-- TOC entry 200 (class 1259 OID 41597343)
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
-- TOC entry 201 (class 1259 OID 41597349)
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
-- TOC entry 219 (class 1259 OID 41597511)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 41597943)
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
-- TOC entry 246 (class 1259 OID 41597953)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 41597842)
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
-- TOC entry 247 (class 1259 OID 41597961)
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
-- TOC entry 223 (class 1259 OID 41597539)
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
-- TOC entry 215 (class 1259 OID 41597484)
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
-- TOC entry 214 (class 1259 OID 41597474)
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
-- TOC entry 236 (class 1259 OID 41597681)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 41597611)
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
-- TOC entry 198 (class 1259 OID 41597317)
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
-- TOC entry 177 (class 1259 OID 41597078)
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
-- TOC entry 176 (class 1259 OID 41597076)
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
-- TOC entry 224 (class 1259 OID 41597553)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 41597116)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 41597100)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 41597567)
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
-- TOC entry 218 (class 1259 OID 41597505)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 41597428)
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
-- TOC entry 175 (class 1259 OID 41597065)
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
-- TOC entry 174 (class 1259 OID 41597057)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 41597052)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 41597628)
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
-- TOC entry 189 (class 1259 OID 41597201)
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
-- TOC entry 211 (class 1259 OID 41597447)
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
-- TOC entry 213 (class 1259 OID 41597464)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 41597669)
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
-- TOC entry 186 (class 1259 OID 41597152)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 41597973)
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
-- TOC entry 208 (class 1259 OID 41597418)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 41597274)
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
-- TOC entry 178 (class 1259 OID 41597087)
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
-- TOC entry 239 (class 1259 OID 41597719)
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
-- TOC entry 210 (class 1259 OID 41597438)
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
-- TOC entry 203 (class 1259 OID 41597367)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 41597531)
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
-- TOC entry 233 (class 1259 OID 41597642)
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
-- TOC entry 251 (class 1259 OID 41598023)
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
-- TOC entry 250 (class 1259 OID 41597992)
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
-- TOC entry 252 (class 1259 OID 41598035)
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
-- TOC entry 229 (class 1259 OID 41597604)
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
-- TOC entry 238 (class 1259 OID 41597709)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 41597594)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 41597138)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 41597081)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 41597142)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56ab-1e92-5e8a-abc8e7784e69	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56ab-1e92-dcb4-16805e27a8da	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56ab-1e92-8c22-ef5a4da5ceb9	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 41597760)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56ab-1e93-805e-af86e3649104	000d0000-56ab-1e93-ab54-3b150cf8de19	\N	00090000-56ab-1e93-2ace-8f58cfd0014e	000b0000-56ab-1e93-7b10-6efd67186dfa	0001	f	\N	\N	\N	3	t	t	t
000c0000-56ab-1e93-ca2e-ba1f03c493a1	000d0000-56ab-1e93-3a46-cd9fdd65cc70	00100000-56ab-1e93-8cc5-11275f260023	00090000-56ab-1e93-fde7-bce0d8b4dae1	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56ab-1e93-0714-e47ec3f5e6ee	000d0000-56ab-1e93-8b08-5d2078f812f7	00100000-56ab-1e93-5e6f-8e997020d2e8	00090000-56ab-1e93-863d-21d837c82f69	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56ab-1e93-0a97-fa250581fec3	000d0000-56ab-1e93-6d2c-a1ba564fecc2	\N	00090000-56ab-1e93-147a-042179252b08	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56ab-1e93-f4d6-7e7d1a0fc6cc	000d0000-56ab-1e93-69e3-bcbf27a51c16	\N	00090000-56ab-1e93-3ebd-6bedf6927604	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56ab-1e93-2451-78a21677a32b	000d0000-56ab-1e93-96f5-bc91f250989a	\N	00090000-56ab-1e93-7fde-994c7ff17cfd	000b0000-56ab-1e93-ed82-fab80b011b65	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56ab-1e93-5998-d8cedcf89e02	000d0000-56ab-1e93-fa09-0ce7f73409db	00100000-56ab-1e93-ce18-4c8ca2c5d83f	00090000-56ab-1e93-94b9-9ba5611dee90	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56ab-1e93-d38c-3e573245235e	000d0000-56ab-1e93-a8bb-7f5f6800a1e2	\N	00090000-56ab-1e93-d27b-85cef31326c6	000b0000-56ab-1e93-79fe-9c23d2cb87ec	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56ab-1e93-f43e-59a0ee7a8c99	000d0000-56ab-1e93-fa09-0ce7f73409db	00100000-56ab-1e93-283e-3947e70457fa	00090000-56ab-1e93-9686-a5f6e358d3fb	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56ab-1e93-27b3-23f1e14f239e	000d0000-56ab-1e93-fa09-0ce7f73409db	00100000-56ab-1e93-66ac-b53529686f92	00090000-56ab-1e93-a0ed-6e85b1bc036a	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56ab-1e93-e90a-4790876a8590	000d0000-56ab-1e93-fa09-0ce7f73409db	00100000-56ab-1e93-0de8-6ec2efff2ca0	00090000-56ab-1e93-35fa-f3301d54282b	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56ab-1e93-68ed-1293ba3237d4	000d0000-56ab-1e93-a24a-064c9766fd1f	00100000-56ab-1e93-8cc5-11275f260023	00090000-56ab-1e93-fde7-bce0d8b4dae1	000b0000-56ab-1e93-ae3e-5836dcdb62bd	0012	t	\N	\N	\N	2	t	t	t
000c0000-56ab-1e93-5e16-e3846a3d1380	000d0000-56ab-1e93-6303-eb4ebc1976b8	\N	00090000-56ab-1e93-d27b-85cef31326c6	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-3544-aedab8b5f283	000d0000-56ab-1e93-6303-eb4ebc1976b8	\N	00090000-56ab-1e93-4f69-f4c5b79fc49f	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56ab-1e93-02d3-28bdea1b233c	000d0000-56ab-1e93-a356-9134bc8f204b	00100000-56ab-1e93-5e6f-8e997020d2e8	00090000-56ab-1e93-863d-21d837c82f69	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-64ab-f2986a9f76fb	000d0000-56ab-1e93-a356-9134bc8f204b	\N	00090000-56ab-1e93-4f69-f4c5b79fc49f	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56ab-1e93-5680-f456cbadd66e	000d0000-56ab-1e93-303e-0c3f6b788f50	\N	00090000-56ab-1e93-4f69-f4c5b79fc49f	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-e02e-972495951e7c	000d0000-56ab-1e93-303e-0c3f6b788f50	\N	00090000-56ab-1e93-d27b-85cef31326c6	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56ab-1e93-59b5-646c90f5ffd0	000d0000-56ab-1e93-edc8-3e73fc496a19	00100000-56ab-1e93-ce18-4c8ca2c5d83f	00090000-56ab-1e93-94b9-9ba5611dee90	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-819d-a4cef89eb040	000d0000-56ab-1e93-edc8-3e73fc496a19	\N	00090000-56ab-1e93-4f69-f4c5b79fc49f	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56ab-1e93-1124-d621a0e3d29e	000d0000-56ab-1e93-ba77-11fb95051cff	\N	00090000-56ab-1e93-4f69-f4c5b79fc49f	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-f151-8395c2814eda	000d0000-56ab-1e93-ba77-11fb95051cff	00100000-56ab-1e93-ce18-4c8ca2c5d83f	00090000-56ab-1e93-94b9-9ba5611dee90	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56ab-1e93-7c3f-55550144742f	000d0000-56ab-1e93-5f61-918df6b70458	\N	00090000-56ab-1e93-4f69-f4c5b79fc49f	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-cb87-8d7271ca72fd	000d0000-56ab-1e93-7992-6e160a879310	\N	00090000-56ab-1e93-d27b-85cef31326c6	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-84de-50db1443cb1d	000d0000-56ab-1e93-144b-fa1aa9370da3	\N	00090000-56ab-1e93-d27b-85cef31326c6	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-90d9-441259487e1a	000d0000-56ab-1e93-144b-fa1aa9370da3	00100000-56ab-1e93-5e6f-8e997020d2e8	00090000-56ab-1e93-863d-21d837c82f69	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56ab-1e93-5626-f1b8dad7de52	000d0000-56ab-1e93-8441-a58f34c8312e	\N	00090000-56ab-1e93-c8dd-11853c5c2c46	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56ab-1e93-2825-1b59f4c69d15	000d0000-56ab-1e93-8441-a58f34c8312e	\N	00090000-56ab-1e93-46a4-6d8e682a5fca	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56ab-1e93-0b7c-e805c88722af	000d0000-56ab-1e93-0ebf-dde09d941fd4	\N	00090000-56ab-1e93-d27b-85cef31326c6	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56ab-1e93-9b84-47f9cc49fec8	000d0000-56ab-1e93-0ebf-dde09d941fd4	00100000-56ab-1e93-5e6f-8e997020d2e8	00090000-56ab-1e93-863d-21d837c82f69	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56ab-1e93-c6d9-1a0c89325dcc	000d0000-56ab-1e93-0ebf-dde09d941fd4	\N	00090000-56ab-1e93-46a4-6d8e682a5fca	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56ab-1e93-80f9-24f66f27514e	000d0000-56ab-1e93-0ebf-dde09d941fd4	\N	00090000-56ab-1e93-c8dd-11853c5c2c46	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56ab-1e93-2429-66f0374619eb	000d0000-56ab-1e93-59e7-2ef418aba3c0	\N	00090000-56ab-1e93-d27b-85cef31326c6	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56ab-1e93-da38-3afdc418a85a	000d0000-56ab-1e93-61a3-d4275e957bbb	00100000-56ab-1e93-5e6f-8e997020d2e8	00090000-56ab-1e93-863d-21d837c82f69	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56ab-1e93-53ff-4e37e6aced31	000d0000-56ab-1e93-61a3-d4275e957bbb	\N	00090000-56ab-1e93-4f69-f4c5b79fc49f	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 41597744)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 41597135)
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
-- TOC entry 3191 (class 0 OID 41597621)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56ab-1e93-c12d-5b4855b8ddb7	00160000-56ab-1e92-f9b8-e4e91dee8b9a	00090000-56ab-1e93-46a4-6d8e682a5fca	aizv	10	t
003d0000-56ab-1e93-6ab1-e2002ffbf65a	00160000-56ab-1e92-f9b8-e4e91dee8b9a	00090000-56ab-1e93-21f7-4362bd4e8f99	apri	14	t
003d0000-56ab-1e93-3f90-ce0e8e37574a	00160000-56ab-1e92-dcb2-9f0de0da9e04	00090000-56ab-1e93-c8dd-11853c5c2c46	aizv	11	t
003d0000-56ab-1e93-1242-43f53eeb6b69	00160000-56ab-1e92-1ba8-209569f6fabd	00090000-56ab-1e93-b4ea-9348357b75ef	aizv	12	t
003d0000-56ab-1e93-278e-52bfc66c9c31	00160000-56ab-1e92-f9b8-e4e91dee8b9a	00090000-56ab-1e93-4f69-f4c5b79fc49f	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 41597651)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56ab-1e92-f9b8-e4e91dee8b9a	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56ab-1e92-dcb2-9f0de0da9e04	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56ab-1e92-1ba8-209569f6fabd	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 41598063)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 41597457)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 41597382)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56ab-1e93-1176-9daecd0d58cd	\N	\N	\N	\N	00440000-56ab-1e93-b1d6-9de69373710b	00220000-56ab-1e92-5711-45ba56863bef	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56ab-1e93-6d2f-9902bbca3ff5	\N	\N	\N	\N	00440000-56ab-1e93-6f84-e45c612389e1	00220000-56ab-1e92-05e1-4dcd3c37a803	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56ab-1e93-3c3d-0274581c91fe	\N	\N	\N	001e0000-56ab-1e93-2a5f-c6573f3cb4f7	\N	00220000-56ab-1e92-5711-45ba56863bef	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56ab-1e93-dfbf-06add472bc9f	\N	\N	\N	001e0000-56ab-1e93-e5d2-89ee3163084e	\N	00220000-56ab-1e92-05e1-4dcd3c37a803	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56ab-1e93-5665-45058e95b7b6	\N	00200000-56ab-1e93-30d6-7e4aaacfbb31	\N	\N	\N	00220000-56ab-1e92-7103-b00f36cd9106	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56ab-1e93-82b7-bc5138022253	\N	00200000-56ab-1e93-ec42-603b169b393c	\N	\N	\N	00220000-56ab-1e92-7103-b00f36cd9106	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56ab-1e93-02d5-5f53e712f0f9	\N	00200000-56ab-1e93-a431-b31fff11eea5	\N	\N	\N	00220000-56ab-1e92-05e1-4dcd3c37a803	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56ab-1e93-c466-2ef47a1439fb	\N	00200000-56ab-1e93-f759-0c77db4d91ab	\N	\N	\N	00220000-56ab-1e92-95cc-1ff3bdbfd59b	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56ab-1e93-ca54-9b683385c45c	\N	00200000-56ab-1e93-f6ce-a4624b11fafa	\N	\N	\N	00220000-56ab-1e92-e167-4e96563376cd	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56ab-1e93-bfce-e955fd59d208	\N	00200000-56ab-1e93-f49a-9e5b26ddbd01	\N	\N	\N	00220000-56ab-1e92-05e1-4dcd3c37a803	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56ab-1e93-ed59-e59ed5caa256	\N	00200000-56ab-1e93-3f1f-0d41c67b830a	\N	\N	\N	00220000-56ab-1e92-e167-4e96563376cd	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56ab-1e93-31d3-2e761b12b2a7	\N	00200000-56ab-1e93-374b-b124de1d1dbc	\N	\N	\N	00220000-56ab-1e92-e167-4e96563376cd	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56ab-1e93-0493-9da5998ef9c3	\N	00200000-56ab-1e93-00d4-24dec0d4b825	\N	\N	\N	00220000-56ab-1e92-7103-b00f36cd9106	001f0000-56ab-1e92-bcb0-e14ca2db9536	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56ab-1e93-730c-3fb51f0f9520	\N	00200000-56ab-1e93-5d4d-32101c9475fc	\N	\N	\N	00220000-56ab-1e92-7103-b00f36cd9106	001f0000-56ab-1e92-bcb0-e14ca2db9536	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56ab-1e93-13c7-d039e1164224	\N	\N	001c0000-56ab-1e93-533a-36a2872a7631	\N	\N	\N	001f0000-56ab-1e92-ae85-5e09f77e1afd	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56ab-1e93-92ca-d926545345c3	001b0000-56ab-1e93-981d-783ad9790f8e	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-bcb0-e14ca2db9536	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56ab-1e93-f1fd-33fc739a89f3	001b0000-56ab-1e93-de42-d982e2ee64c9	\N	\N	\N	\N	00220000-56ab-1e92-05e1-4dcd3c37a803	001f0000-56ab-1e92-bcb0-e14ca2db9536	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56ab-1e93-277f-221ae82d7770	001b0000-56ab-1e93-b74a-820e680d54d5	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-bcb0-e14ca2db9536	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56ab-1e93-4ad2-fa0b400cdcc2	001b0000-56ab-1e93-e4e0-f421c53c8395	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56ab-1e93-dad7-5b98c52bba7d	001b0000-56ab-1e93-e59b-661550b5f7d6	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-ae85-5e09f77e1afd	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56ab-1e93-7e10-88bcf29bf220	001b0000-56ab-1e93-9031-1f77a5c510c9	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-ae85-5e09f77e1afd	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56ab-1e93-74f6-7b16ea37b4ee	001b0000-56ab-1e93-f564-68eb6cfdcdb1	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-bcb0-e14ca2db9536	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56ab-1e93-1d15-24ca9937d380	001b0000-56ab-1e93-64c1-c31c16e65ad1	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-ae85-5e09f77e1afd	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56ab-1e93-c47b-dc6b1c9b1363	001b0000-56ab-1e93-7532-9e4a75b99d6f	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56ab-1e93-93af-3380ed9c0cfc	001b0000-56ab-1e93-cae4-a2ff33bbf63d	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56ab-1e93-3a1c-74774eb04fa8	001b0000-56ab-1e93-a764-482fa2881751	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-ae85-5e09f77e1afd	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56ab-1e93-59ac-9b4d1625978b	001b0000-56ab-1e93-3769-69a8f09d008a	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-e0c2-7608a6e40c9c	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56ab-1e93-91e2-ec12a2705ca2	001b0000-56ab-1e93-5fb2-cedc0d15494f	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-e0c2-7608a6e40c9c	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56ab-1e93-b5ce-e7281b25d97c	001b0000-56ab-1e93-a94f-a94c141231d3	\N	\N	\N	\N	00220000-56ab-1e92-5711-45ba56863bef	001f0000-56ab-1e92-ae85-5e09f77e1afd	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56ab-1e93-69f7-d6b2da7af2b9	001b0000-56ab-1e93-219c-4d4eae7d94ff	\N	\N	\N	\N	\N	001f0000-56ab-1e92-ae85-5e09f77e1afd	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56ab-1e93-533a-36a2872a7631
00180000-56ab-1e93-f3f6-762793fd8a5e	001b0000-56ab-1e93-43b5-b548d09ad4e3	\N	\N	\N	\N	\N	001f0000-56ab-1e92-ae85-5e09f77e1afd	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56ab-1e93-533a-36a2872a7631
\.


--
-- TOC entry 3166 (class 0 OID 41597408)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56ab-1e93-2a5f-c6573f3cb4f7
001e0000-56ab-1e93-e5d2-89ee3163084e
\.


--
-- TOC entry 3167 (class 0 OID 41597413)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56ab-1e93-b1d6-9de69373710b
00440000-56ab-1e93-6f84-e45c612389e1
\.


--
-- TOC entry 3209 (class 0 OID 41597985)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 41597288)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56ab-1e90-4f27-05c7a4f178f9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56ab-1e90-d49b-adc45c388e95	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56ab-1e90-5bee-8a641df6dd65	AL	ALB	008	Albania 	Albanija	\N
00040000-56ab-1e90-460a-6218efa57bba	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56ab-1e90-2cd8-bb4fdfa2cbdb	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56ab-1e90-2e11-3a4bf3da65b3	AD	AND	020	Andorra 	Andora	\N
00040000-56ab-1e90-371b-e94e8763a9e0	AO	AGO	024	Angola 	Angola	\N
00040000-56ab-1e90-f2c2-bb8f6370d7bf	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56ab-1e90-a89e-6907eb361ead	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56ab-1e90-6059-275fe92d00e7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-1e90-bc90-e9daf05b28f4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56ab-1e90-3274-a7a4df688111	AM	ARM	051	Armenia 	Armenija	\N
00040000-56ab-1e90-90ff-74b55c423646	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56ab-1e90-be6b-d8ac685d988d	AU	AUS	036	Australia 	Avstralija	\N
00040000-56ab-1e90-103b-34867bea988f	AT	AUT	040	Austria 	Avstrija	\N
00040000-56ab-1e90-e2c2-fc6ef1319453	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56ab-1e90-774d-ae5c45ae3364	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56ab-1e90-d9ab-23ca7f0ecafa	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56ab-1e90-1adb-719f009400d9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56ab-1e90-442b-a874bc7f1d9e	BB	BRB	052	Barbados 	Barbados	\N
00040000-56ab-1e90-d4d3-09c76ea2ba2a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56ab-1e90-0623-334a93d4f2b4	BE	BEL	056	Belgium 	Belgija	\N
00040000-56ab-1e90-f46c-95bb1344c23d	BZ	BLZ	084	Belize 	Belize	\N
00040000-56ab-1e90-1211-b921be4ae086	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56ab-1e90-63c9-51ced9907218	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56ab-1e90-2aff-581a53d25dec	BT	BTN	064	Bhutan 	Butan	\N
00040000-56ab-1e90-1355-0ead1fd808b9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56ab-1e90-a8cc-bd41e0731bb7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56ab-1e90-b0ba-7eebf18f3334	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56ab-1e90-3169-8f1aa174ce4b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56ab-1e90-5175-e48919d292b7	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56ab-1e90-f7a1-5b0c191da793	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56ab-1e90-9ff3-9e5068efe125	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56ab-1e90-6ade-e8372600c522	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56ab-1e90-10b9-d53ddb4d66af	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56ab-1e90-960a-377f0ada9ad2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56ab-1e90-08b5-1df7ef353e92	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56ab-1e90-f9a1-f1189c420674	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56ab-1e90-d73b-9c3e08b3eb17	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56ab-1e90-3e2f-88119917918e	CA	CAN	124	Canada 	Kanada	\N
00040000-56ab-1e90-02f0-e999f5799c41	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56ab-1e90-df60-6db35fcde855	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56ab-1e90-ba2e-b080ebc4ef21	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56ab-1e90-a6f1-87ebb76a9166	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56ab-1e90-857c-a2c76d842ea6	CL	CHL	152	Chile 	Čile	\N
00040000-56ab-1e90-f497-4d073354791c	CN	CHN	156	China 	Kitajska	\N
00040000-56ab-1e90-defe-28695116ec69	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56ab-1e90-0337-1e78d405b71d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56ab-1e90-e949-6358f3bfd62a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56ab-1e90-e673-bfa8bda98617	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56ab-1e90-3611-fa0967a3ebd1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56ab-1e90-0e74-aa3c4906d91a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56ab-1e90-4773-4faabf4f31ec	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56ab-1e90-f79c-8deb3a39cf02	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56ab-1e90-d55f-bcb0c4b8232e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56ab-1e90-4745-a9ce6a64312e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56ab-1e90-765c-c5483a015c63	CU	CUB	192	Cuba 	Kuba	\N
00040000-56ab-1e90-f31d-e520a36aa9c3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56ab-1e90-9a86-b3b24f0523d4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56ab-1e90-656c-e96c7784ea74	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56ab-1e90-451c-3fba42187396	DK	DNK	208	Denmark 	Danska	\N
00040000-56ab-1e90-0714-ae114482e3ec	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56ab-1e90-eeec-29b3405770a3	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-1e90-03c3-2201936c4c2a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56ab-1e90-e37c-5e8d67421f39	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56ab-1e90-71c7-d23dda0b0e90	EG	EGY	818	Egypt 	Egipt	\N
00040000-56ab-1e90-a85b-2e37fa60bb9f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56ab-1e90-f663-bcbdabc530cc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56ab-1e90-fc24-1ad6f052a5fc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56ab-1e90-d6b3-84d787a32375	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56ab-1e90-3182-b484a03bc246	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56ab-1e90-8157-ddded6d9b6ce	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56ab-1e90-f522-78b31074c5f0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56ab-1e90-b829-d0d3ba2b208d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56ab-1e90-0e57-33843af1ab2b	FI	FIN	246	Finland 	Finska	\N
00040000-56ab-1e90-994e-9eb4fc3998e9	FR	FRA	250	France 	Francija	\N
00040000-56ab-1e90-396f-1f747402871f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56ab-1e90-3744-fb68b05bc104	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56ab-1e90-3693-139b32ca189f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56ab-1e90-ab4e-096a18795610	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56ab-1e90-34fa-002e50e00d57	GA	GAB	266	Gabon 	Gabon	\N
00040000-56ab-1e90-b520-50c9ce579968	GM	GMB	270	Gambia 	Gambija	\N
00040000-56ab-1e90-0526-367d091a8862	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56ab-1e90-4af2-2331d23e63d8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56ab-1e90-add9-017acd7b5179	GH	GHA	288	Ghana 	Gana	\N
00040000-56ab-1e90-62e1-b87fb5ed312e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56ab-1e90-e39b-053a4d144696	GR	GRC	300	Greece 	Grčija	\N
00040000-56ab-1e90-50dd-bc161bbecc21	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56ab-1e90-8404-4db38b539ed2	GD	GRD	308	Grenada 	Grenada	\N
00040000-56ab-1e90-2b66-82824de7300d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56ab-1e90-c8da-04176015b7e3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56ab-1e90-40f2-48b9f9911392	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56ab-1e90-705d-86b8ec3884ef	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56ab-1e90-25f5-6f1f75a4da6a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56ab-1e90-b938-93b06cf7cbd5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56ab-1e90-255f-654de8ccde51	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56ab-1e90-2acc-832e886a207c	HT	HTI	332	Haiti 	Haiti	\N
00040000-56ab-1e90-2b3b-89a885237931	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56ab-1e90-8856-df55499de68c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56ab-1e90-d7dd-7026d51ed9ad	HN	HND	340	Honduras 	Honduras	\N
00040000-56ab-1e90-158d-6841d4607369	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56ab-1e90-6281-bc0fec089ec7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56ab-1e90-45c3-e07577879079	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56ab-1e90-9eb8-e250aaadc4d2	IN	IND	356	India 	Indija	\N
00040000-56ab-1e90-37c3-558efabf7c98	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56ab-1e90-6f7e-ef7f2f21aba1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56ab-1e90-fc52-b9e941ea6dd9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56ab-1e90-50b3-4fbc0d3a77b9	IE	IRL	372	Ireland 	Irska	\N
00040000-56ab-1e90-b4e2-dd4f52b8e350	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56ab-1e90-7ed2-87e5e03aba79	IL	ISR	376	Israel 	Izrael	\N
00040000-56ab-1e90-ca6c-6fd3ae141974	IT	ITA	380	Italy 	Italija	\N
00040000-56ab-1e90-ec93-55831e3eaa73	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56ab-1e90-cd86-eec63d53d483	JP	JPN	392	Japan 	Japonska	\N
00040000-56ab-1e90-4658-845c2cedd683	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56ab-1e90-79ab-5c3dfbc81de2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56ab-1e90-c863-43b49bc6d550	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56ab-1e90-9ec9-3d78994a6ae9	KE	KEN	404	Kenya 	Kenija	\N
00040000-56ab-1e90-7d03-2d8e721f6f60	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56ab-1e90-5261-4d3a93ee1703	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56ab-1e90-3347-a569c7b54b7b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56ab-1e90-3a83-55c98fa7177a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56ab-1e90-6c61-25dbdcb37fe4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56ab-1e90-3f4a-5b81afee74ee	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56ab-1e90-d3c3-381292ad32cf	LV	LVA	428	Latvia 	Latvija	\N
00040000-56ab-1e90-3373-404fb82228f2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56ab-1e90-17a8-816fe16ba844	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56ab-1e90-b2be-8446890c790f	LR	LBR	430	Liberia 	Liberija	\N
00040000-56ab-1e90-37de-283648fdda5c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56ab-1e90-30d6-863d9556e320	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56ab-1e90-ddbe-d8483a57dcbb	LT	LTU	440	Lithuania 	Litva	\N
00040000-56ab-1e90-a1db-f1472bcb9004	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56ab-1e90-448a-03293b4b7a3e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56ab-1e90-69b9-5deb08f8fa08	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56ab-1e90-9f98-ea98f1488acd	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56ab-1e90-4369-f1ae77fc9fcc	MW	MWI	454	Malawi 	Malavi	\N
00040000-56ab-1e90-14e4-2032ba9ee886	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56ab-1e90-7f4a-c0977fb20e36	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56ab-1e90-7c08-9eaa3f7290c5	ML	MLI	466	Mali 	Mali	\N
00040000-56ab-1e90-eddb-1af99d610b99	MT	MLT	470	Malta 	Malta	\N
00040000-56ab-1e90-22b1-9ea6f83c821d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56ab-1e90-6611-0d011aba59f9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56ab-1e90-2ae3-6aa08c92245c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56ab-1e90-3336-ef063956c212	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56ab-1e90-875b-4eb3cfdac564	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56ab-1e90-c4c8-e5262fe880e4	MX	MEX	484	Mexico 	Mehika	\N
00040000-56ab-1e90-8937-071d8683ab39	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56ab-1e90-7617-f4845c8cb825	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56ab-1e90-8a26-7fd9f6988dfb	MC	MCO	492	Monaco 	Monako	\N
00040000-56ab-1e90-dbda-77612bdf006e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56ab-1e90-a8fe-a53ea2ea648a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56ab-1e90-6ead-7c56454aeae8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56ab-1e90-ebda-7da269dbf431	MA	MAR	504	Morocco 	Maroko	\N
00040000-56ab-1e90-61da-5600fd2efe65	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56ab-1e90-e148-dfdfc9ef2a6e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56ab-1e90-0180-f6e6d3443452	NA	NAM	516	Namibia 	Namibija	\N
00040000-56ab-1e90-0636-b3e8d61530a8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56ab-1e90-805f-c0ff79bcccc0	NP	NPL	524	Nepal 	Nepal	\N
00040000-56ab-1e90-7781-81e052874165	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56ab-1e90-e96d-e9a82b9ebe3c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56ab-1e90-109b-f9f2211d411e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56ab-1e90-ac46-5c1ccf02db23	NE	NER	562	Niger 	Niger 	\N
00040000-56ab-1e90-96a4-1e6cba8ae60b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56ab-1e90-0b1f-4423fb9996ec	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56ab-1e90-edbf-70aa845e8ba5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56ab-1e90-fff4-d957e58ac4e2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56ab-1e90-f41b-b720b7656323	NO	NOR	578	Norway 	Norveška	\N
00040000-56ab-1e90-4b6d-7f4945948a81	OM	OMN	512	Oman 	Oman	\N
00040000-56ab-1e90-1c1d-1990e857b1f0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56ab-1e90-2707-965b54d34334	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56ab-1e90-00ef-d0f981075d2a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56ab-1e90-bc3f-109352b681ad	PA	PAN	591	Panama 	Panama	\N
00040000-56ab-1e90-1ab1-96c8dea5e7ba	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56ab-1e90-0fa2-8f8bc3f56909	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56ab-1e90-60b6-a6b884574bb0	PE	PER	604	Peru 	Peru	\N
00040000-56ab-1e90-ccb3-9293b507ffb5	PH	PHL	608	Philippines 	Filipini	\N
00040000-56ab-1e90-ec48-89f5b6055a24	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56ab-1e90-39ed-79d89ff76a00	PL	POL	616	Poland 	Poljska	\N
00040000-56ab-1e90-3603-3c905ffb6443	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56ab-1e90-ec68-297ba3776c8e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56ab-1e90-f37c-c782a295db2d	QA	QAT	634	Qatar 	Katar	\N
00040000-56ab-1e90-4600-6e853f59dfee	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56ab-1e90-d497-8a3924ab1b4a	RO	ROU	642	Romania 	Romunija	\N
00040000-56ab-1e90-f48a-3a3130ed64e2	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56ab-1e90-6275-c9cfd078c3fa	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56ab-1e90-a22e-d6442d86f8b7	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56ab-1e90-f616-09904f96cacd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56ab-1e90-5209-aed45cae9320	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56ab-1e90-2b5d-c9f73e2c19ba	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56ab-1e90-98f3-922a44065944	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56ab-1e90-1364-205c80e3f10e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56ab-1e90-9186-79dcb91740b5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56ab-1e90-24d4-b615852b8228	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56ab-1e90-1285-db01c66e0df1	SM	SMR	674	San Marino 	San Marino	\N
00040000-56ab-1e90-d990-206fdbebd064	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56ab-1e90-62b4-229cd5da4dbd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56ab-1e90-a070-4a6bfbf2197a	SN	SEN	686	Senegal 	Senegal	\N
00040000-56ab-1e90-c75f-7f919ac15c15	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56ab-1e90-c0b0-be157739d02b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56ab-1e90-4a22-285e5abdb826	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56ab-1e90-776b-5a9b0b3ae3ec	SG	SGP	702	Singapore 	Singapur	\N
00040000-56ab-1e90-83da-30608234b0d8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56ab-1e90-3a6b-cc924087940b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56ab-1e90-c78d-26e6f7517136	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56ab-1e90-4f26-967d6cb8ebc9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56ab-1e90-efe2-e0a308e524e9	SO	SOM	706	Somalia 	Somalija	\N
00040000-56ab-1e90-decd-b573884c158a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56ab-1e90-3151-341481473c67	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56ab-1e90-8a29-e0bb05e610df	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56ab-1e90-1537-10e360f60d50	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56ab-1e90-ba3e-eedbe313c2d8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56ab-1e90-6647-c5ba10ebb463	SD	SDN	729	Sudan 	Sudan	\N
00040000-56ab-1e90-ec82-3e9cb5ec6827	SR	SUR	740	Suriname 	Surinam	\N
00040000-56ab-1e90-ed71-671e19c9ebb0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56ab-1e90-5b69-4e45992a6ed5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56ab-1e90-d225-7fed9b2dcfa7	SE	SWE	752	Sweden 	Švedska	\N
00040000-56ab-1e90-831c-823b6d25cc54	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56ab-1e90-2878-4d7bb8d60461	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56ab-1e90-c504-50439473faea	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56ab-1e90-5776-2ed830ef8957	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56ab-1e90-2f92-d4e6c59436f3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56ab-1e90-cad7-b7723c16faef	TH	THA	764	Thailand 	Tajska	\N
00040000-56ab-1e90-860e-35f8e3443ee1	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56ab-1e90-8934-974365603967	TG	TGO	768	Togo 	Togo	\N
00040000-56ab-1e90-8343-41346356c6fa	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56ab-1e90-28a6-fb6976962fd3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56ab-1e90-625c-d31ab98eda1b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56ab-1e90-339c-aa3ce4d8de6f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56ab-1e90-1f2c-25dcc2a0ac15	TR	TUR	792	Turkey 	Turčija	\N
00040000-56ab-1e90-95a0-280a9f7dcebc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56ab-1e90-e301-502e47fd15db	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-1e90-cd1b-0fc29a51c4b3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56ab-1e90-6162-348c3a4794b5	UG	UGA	800	Uganda 	Uganda	\N
00040000-56ab-1e90-dd10-6cf44e146598	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56ab-1e90-118c-4008acf6da82	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56ab-1e90-338d-2b837375e09d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56ab-1e90-ef46-d8c35ba7b0f4	US	USA	840	United States 	Združene države Amerike	\N
00040000-56ab-1e90-0122-cf41fc0aa03b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56ab-1e90-b2ad-cb964ecb8bff	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56ab-1e90-e215-916acf7ba3c2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56ab-1e90-77d8-a7756ab101db	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56ab-1e90-fcbc-c4ac9ed8f3c3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56ab-1e90-402a-840ada74be16	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56ab-1e90-3041-6396597dad91	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-1e90-cb18-95029043a0e2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56ab-1e90-7690-87d998c98334	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56ab-1e90-a5c3-f6715367956f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56ab-1e90-837b-26997ba33beb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56ab-1e90-7b8d-0967a614de58	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56ab-1e90-9bdc-7758ca5404cf	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 41597773)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56ab-1e93-2383-a2999f8bba8f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56ab-1e93-519c-9298d3d6df8c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-1e93-8ea1-54d1f3172b5c	000e0000-56ab-1e93-3714-8efa1be18f47	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-1e90-5c61-6bb3bbce57f6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-1e93-6be5-ef5988e8c44e	000e0000-56ab-1e93-66a9-dd76d57e2762	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-1e90-b8d1-da77bafbf878	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-1e93-28af-7ad7ea6cffe2	000e0000-56ab-1e93-2544-8b579f69b775	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-1e90-5c61-6bb3bbce57f6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 41597579)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56ab-1e93-f553-ed92fd4baa1b	000e0000-56ab-1e93-66a9-dd76d57e2762	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56ab-1e90-563f-201a3937f143
000d0000-56ab-1e93-639a-231bb10466d7	000e0000-56ab-1e93-b3ad-8d173a16f7e1	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-1e90-7da5-ea0e5de0bf5f
000d0000-56ab-1e93-e572-140d57400c48	000e0000-56ab-1e93-b3ad-8d173a16f7e1	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-ab54-3b150cf8de19	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-805e-af86e3649104	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-1e90-7da5-ea0e5de0bf5f
000d0000-56ab-1e93-3a46-cd9fdd65cc70	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-ca2e-ba1f03c493a1	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-8b08-5d2078f812f7	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-0714-e47ec3f5e6ee	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56ab-1e90-503d-56c9fdf9bcff
000d0000-56ab-1e93-6d2c-a1ba564fecc2	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-0a97-fa250581fec3	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56ab-1e90-563f-201a3937f143
000d0000-56ab-1e93-69e3-bcbf27a51c16	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-f4d6-7e7d1a0fc6cc	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56ab-1e90-563f-201a3937f143
000d0000-56ab-1e93-96f5-bc91f250989a	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-2451-78a21677a32b	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-1e90-7da5-ea0e5de0bf5f
000d0000-56ab-1e93-fa09-0ce7f73409db	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-f43e-59a0ee7a8c99	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56ab-1e90-7da5-ea0e5de0bf5f
000d0000-56ab-1e93-a8bb-7f5f6800a1e2	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-d38c-3e573245235e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56ab-1e90-8fff-6966f8c67a51
000d0000-56ab-1e93-a24a-064c9766fd1f	000e0000-56ab-1e93-66a9-dd76d57e2762	000c0000-56ab-1e93-68ed-1293ba3237d4	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56ab-1e90-487a-861c1ed842df
000d0000-56ab-1e93-6303-eb4ebc1976b8	000e0000-56ab-1e93-b5a9-f09ed1e2900f	000c0000-56ab-1e93-5e16-e3846a3d1380	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-a356-9134bc8f204b	000e0000-56ab-1e93-a328-7b8b7fc65d37	000c0000-56ab-1e93-02d3-28bdea1b233c	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-303e-0c3f6b788f50	000e0000-56ab-1e93-a328-7b8b7fc65d37	000c0000-56ab-1e93-5680-f456cbadd66e	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-edc8-3e73fc496a19	000e0000-56ab-1e93-6905-6232379ab510	000c0000-56ab-1e93-59b5-646c90f5ffd0	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-ba77-11fb95051cff	000e0000-56ab-1e93-69dd-1e32c1b3bff2	000c0000-56ab-1e93-1124-d621a0e3d29e	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-5f61-918df6b70458	000e0000-56ab-1e93-c22d-a091563c6706	000c0000-56ab-1e93-7c3f-55550144742f	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-7992-6e160a879310	000e0000-56ab-1e93-bbbb-75831db466d5	000c0000-56ab-1e93-cb87-8d7271ca72fd	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-144b-fa1aa9370da3	000e0000-56ab-1e93-e763-24bf49e4ce24	000c0000-56ab-1e93-84de-50db1443cb1d	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-8441-a58f34c8312e	000e0000-56ab-1e93-ec92-fbfe7f301936	000c0000-56ab-1e93-5626-f1b8dad7de52	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-0ebf-dde09d941fd4	000e0000-56ab-1e93-ec92-fbfe7f301936	000c0000-56ab-1e93-0b7c-e805c88722af	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-59e7-2ef418aba3c0	000e0000-56ab-1e93-3656-41b34ce6622c	000c0000-56ab-1e93-2429-66f0374619eb	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
000d0000-56ab-1e93-61a3-d4275e957bbb	000e0000-56ab-1e93-3656-41b34ce6622c	000c0000-56ab-1e93-da38-3afdc418a85a	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56ab-1e90-7822-1ac8baae08bd
\.


--
-- TOC entry 3162 (class 0 OID 41597356)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56ab-1e93-533a-36a2872a7631	00040000-56ab-1e90-45c3-e07577879079		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 41597328)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 41597305)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56ab-1e93-952a-3082f269ec49	00080000-56ab-1e92-871e-7be50751c20b	00090000-56ab-1e93-a0ed-6e85b1bc036a	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 41597493)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 41598043)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56ab-1e93-4222-5ad64d9fab97	00010000-56ab-1e91-78a0-2fe691f5760f	\N	Prva mapa	Root mapa	2016-01-29 09:10:59	2016-01-29 09:10:59	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 41598056)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 41598078)
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
-- TOC entry 3180 (class 0 OID 41597517)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 41597262)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56ab-1e91-a3b1-b7b7552ee751	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56ab-1e91-954d-abf49311d09f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56ab-1e91-1410-7b25b328ff4f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56ab-1e91-5621-bbd910d8f2fc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56ab-1e91-c28d-e1cd1f2ff4d2	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56ab-1e91-59c1-ea6a6205a62d	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56ab-1e91-ee84-71f8e83b9bfe	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56ab-1e91-1eb3-f68c8cde540c	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56ab-1e91-b10a-b4f751be6b0f	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56ab-1e91-141b-87aeca6bded2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56ab-1e91-b970-81c9e97bd159	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-1e91-da98-96cbc768206c	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-1e91-2487-e42306f3a6cd	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56ab-1e91-4e8d-db759d256b02	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56ab-1e91-1d1a-540212269e1a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56ab-1e91-d734-15760305de7f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56ab-1e91-e1a0-e9da4728555e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56ab-1e92-3a00-e2112daca0fc	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56ab-1e92-bdfc-0f4c255aaaf2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56ab-1e92-4437-37969b2329b8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56ab-1e92-bb1c-35d7e3247bc6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56ab-1e92-15a1-aaa2d65a9b9c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56ab-1e95-93e6-31ee4f1f7325	application.tenant.maticnopodjetje	string	s:36:"00080000-56ab-1e95-df5c-833f9fbd2213";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 41597162)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56ab-1e92-8f55-de36425e56fb	00000000-56ab-1e92-3a00-e2112daca0fc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56ab-1e92-4fe8-8ba05231d9fe	00000000-56ab-1e92-3a00-e2112daca0fc	00010000-56ab-1e91-78a0-2fe691f5760f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56ab-1e92-ae1d-b2d9fa91996f	00000000-56ab-1e92-bdfc-0f4c255aaaf2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 41597229)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56ab-1e93-2860-f4a7f2dc6d11	\N	00100000-56ab-1e93-8cc5-11275f260023	00100000-56ab-1e93-5e6f-8e997020d2e8	01	Gledališče Nimbis
00410000-56ab-1e93-365d-7a6d778c2e3b	00410000-56ab-1e93-2860-f4a7f2dc6d11	00100000-56ab-1e93-8cc5-11275f260023	00100000-56ab-1e93-5e6f-8e997020d2e8	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 41597173)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56ab-1e93-2ace-8f58cfd0014e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56ab-1e93-147a-042179252b08	00010000-56ab-1e92-1b03-3effb64dca38	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56ab-1e93-863d-21d837c82f69	00010000-56ab-1e92-8177-65899bb0a0f5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56ab-1e93-9686-a5f6e358d3fb	00010000-56ab-1e92-d430-8887c4735ae8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56ab-1e93-b1ed-5e9048a2321b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56ab-1e93-7fde-994c7ff17cfd	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56ab-1e93-35fa-f3301d54282b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56ab-1e93-94b9-9ba5611dee90	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56ab-1e93-a0ed-6e85b1bc036a	00010000-56ab-1e92-1c4e-828f0cf6edd1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56ab-1e93-fde7-bce0d8b4dae1	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56ab-1e93-ab07-53e6858387e4	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-1e93-3ebd-6bedf6927604	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56ab-1e93-d27b-85cef31326c6	00010000-56ab-1e92-3fd2-92e6076ea2b3	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-1e93-46a4-6d8e682a5fca	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-1e93-21f7-4362bd4e8f99	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-1e93-c8dd-11853c5c2c46	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-1e93-b4ea-9348357b75ef	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-1e93-4f69-f4c5b79fc49f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-1e93-be07-f0798da2308e	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-1e93-666d-fad0d2fc9fab	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-1e93-c6e0-2928326c9557	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 41597107)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56ab-1e90-cf0b-e6c37660b0af	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56ab-1e90-2919-5ddf2506ee6d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56ab-1e90-c720-59b476a02ea6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56ab-1e90-fb0c-4fd472c6e503	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56ab-1e90-5248-aeb2d67da4ed	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56ab-1e90-3fa7-cc9b76272a44	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56ab-1e90-7b6c-13cfb9698131	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56ab-1e90-8ed1-045d8ffa5e9b	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56ab-1e90-cfd9-e95dbb598fea	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56ab-1e90-c388-3352a7a49e4b	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56ab-1e90-9ada-ab3c69d71526	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56ab-1e90-cd6f-2473089a6a22	Abonma-read	Abonma - branje	t
00030000-56ab-1e90-75f9-f0ac5ba70e1d	Abonma-write	Abonma - spreminjanje	t
00030000-56ab-1e90-4751-4ffb12d07f0a	Alternacija-read	Alternacija - branje	t
00030000-56ab-1e90-6949-0ef869013229	Alternacija-write	Alternacija - spreminjanje	t
00030000-56ab-1e90-2930-9a9bae4367b2	Arhivalija-read	Arhivalija - branje	t
00030000-56ab-1e90-080d-97d7e051d666	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56ab-1e90-a861-9fdc7d3a3abd	AuthStorage-read	AuthStorage - branje	t
00030000-56ab-1e90-fea8-cc2f6bc855e2	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56ab-1e90-a8c6-0a2adfa8e28d	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56ab-1e90-221b-b8bd718abb8f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56ab-1e90-7b18-d9e372458d30	Besedilo-read	Besedilo - branje	t
00030000-56ab-1e90-abda-e314814375e4	Besedilo-write	Besedilo - spreminjanje	t
00030000-56ab-1e90-589d-c8df498c9918	Dodatek-read	Dodatek - branje	t
00030000-56ab-1e90-de0a-235a453e37f3	Dodatek-write	Dodatek - spreminjanje	t
00030000-56ab-1e90-1fa5-48c10aa9087b	Dogodek-read	Dogodek - branje	t
00030000-56ab-1e90-4a73-d12643657d41	Dogodek-write	Dogodek - spreminjanje	t
00030000-56ab-1e90-d7ca-9931577c5781	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56ab-1e90-5ea3-ce0e097b94af	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56ab-1e90-c38c-3f65494416e3	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56ab-1e90-f5cf-311538fa0945	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56ab-1e90-026f-4f7c01e758a2	DogodekTrait-read	DogodekTrait - branje	t
00030000-56ab-1e90-044b-24f8bbdb7bc4	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56ab-1e90-42b8-ee0181b57b3b	DrugiVir-read	DrugiVir - branje	t
00030000-56ab-1e90-3c2d-bdf55c9fbbe1	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56ab-1e90-422a-101acca36da6	Drzava-read	Drzava - branje	t
00030000-56ab-1e90-bbfe-986019ff29a9	Drzava-write	Drzava - spreminjanje	t
00030000-56ab-1e90-ef0c-30994f0968de	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56ab-1e90-70fa-aefe8a962210	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56ab-1e90-0c68-8e5a7c15c9d4	Funkcija-read	Funkcija - branje	t
00030000-56ab-1e90-1e5a-94f67bad2ab1	Funkcija-write	Funkcija - spreminjanje	t
00030000-56ab-1e90-94c2-4db528456938	Gostovanje-read	Gostovanje - branje	t
00030000-56ab-1e90-9dc1-7c5868479d79	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56ab-1e90-7e40-ad25045ed567	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56ab-1e90-be85-18704cab483c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56ab-1e90-12dd-dcb29fbe716f	Kupec-read	Kupec - branje	t
00030000-56ab-1e90-da0f-5c035e8b48ae	Kupec-write	Kupec - spreminjanje	t
00030000-56ab-1e90-9585-075ee315e32e	NacinPlacina-read	NacinPlacina - branje	t
00030000-56ab-1e90-54e7-d52e98b9ca30	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56ab-1e90-8c5b-1e3a739bf1c8	Option-read	Option - branje	t
00030000-56ab-1e90-e9ff-fb96ba0980f4	Option-write	Option - spreminjanje	t
00030000-56ab-1e90-988a-8dddc6001601	OptionValue-read	OptionValue - branje	t
00030000-56ab-1e90-e093-f831850dc807	OptionValue-write	OptionValue - spreminjanje	t
00030000-56ab-1e90-92a7-2c9b0c128f2e	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56ab-1e90-c340-cbb5a0a9af1a	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56ab-1e90-8ee2-ad3461c0a4fa	Oseba-read	Oseba - branje	t
00030000-56ab-1e90-c2d5-a65e2b0206d3	Oseba-write	Oseba - spreminjanje	t
00030000-56ab-1e90-5ef2-308d7027407b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56ab-1e90-f814-c2902d98d69a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56ab-1e90-803f-9052ac84230e	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56ab-1e90-ea4c-17fcb25cd312	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56ab-1e90-956b-526a495f79e5	Pogodba-read	Pogodba - branje	t
00030000-56ab-1e90-40cd-e01166b427db	Pogodba-write	Pogodba - spreminjanje	t
00030000-56ab-1e90-d3ac-55906b2bc92d	Popa-read	Popa - branje	t
00030000-56ab-1e90-ca9f-552878d6f11b	Popa-write	Popa - spreminjanje	t
00030000-56ab-1e90-6a9d-3d2457aedbc3	Posta-read	Posta - branje	t
00030000-56ab-1e90-417c-826a05e18b37	Posta-write	Posta - spreminjanje	t
00030000-56ab-1e90-e261-f3bee642300a	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56ab-1e90-d9b8-383bc59e1f90	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56ab-1e90-491d-41650b338e7e	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56ab-1e90-1b93-ba5bb6673e2d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56ab-1e90-5d8a-0c2a4433545a	PostniNaslov-read	PostniNaslov - branje	t
00030000-56ab-1e90-6ea4-3579864e40b2	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56ab-1e90-9aa4-4fd97e5125cf	Praznik-read	Praznik - branje	t
00030000-56ab-1e90-ba7d-49ac774f80eb	Praznik-write	Praznik - spreminjanje	t
00030000-56ab-1e90-0631-9448a4f13141	Predstava-read	Predstava - branje	t
00030000-56ab-1e90-463f-29c2b5249adb	Predstava-write	Predstava - spreminjanje	t
00030000-56ab-1e90-c0fd-a2fd311d63f8	Ura-read	Ura - branje	t
00030000-56ab-1e90-0b27-f4a934e676de	Ura-write	Ura - spreminjanje	t
00030000-56ab-1e90-4e8f-fc0413677860	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56ab-1e90-28bc-7db1b5f7ffe8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56ab-1e90-0f37-54f8db6ce98f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56ab-1e90-0fdb-e50cf1b1a088	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56ab-1e90-1621-cfd72dd46463	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56ab-1e90-da8a-079237a6d829	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56ab-1e90-3ad6-114593c88c54	ProgramDela-read	ProgramDela - branje	t
00030000-56ab-1e90-abea-e826c3da3fb6	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56ab-1e90-7cd9-1cf9c1dfcbb2	ProgramFestival-read	ProgramFestival - branje	t
00030000-56ab-1e90-a166-bc2e32e2749b	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56ab-1e90-7843-66f310ae0957	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56ab-1e90-cbb1-830400d34a8b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56ab-1e90-a2fa-26dff8347e96	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56ab-1e90-7168-f66e21c314a5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56ab-1e90-e066-bd80587b891f	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56ab-1e90-0bda-7e829aed0ebd	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56ab-1e90-d19c-daa828a6a462	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56ab-1e90-29db-f53cb0e7843b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56ab-1e90-06d6-454b85606b85	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56ab-1e90-e83b-c660fb3c4235	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56ab-1e90-d2aa-42b089e2f81d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56ab-1e90-534c-c2048cf5a84b	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56ab-1e90-c623-9a061dd3dbff	ProgramRazno-read	ProgramRazno - branje	t
00030000-56ab-1e90-0d4d-74e4c3feb49d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56ab-1e90-d762-d60468e7ff5f	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56ab-1e90-bada-ae41455a08f8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56ab-1e90-1042-8e38caf3e174	Prostor-read	Prostor - branje	t
00030000-56ab-1e90-243c-5477e1091c50	Prostor-write	Prostor - spreminjanje	t
00030000-56ab-1e90-db1c-74cd4a0ca0c4	Racun-read	Racun - branje	t
00030000-56ab-1e90-9ae0-57ca99d2f4a5	Racun-write	Racun - spreminjanje	t
00030000-56ab-1e90-fd38-b1d9c791a0de	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56ab-1e90-93dd-d12530c0ddfb	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56ab-1e90-453b-b4818c8f79d7	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56ab-1e90-b400-69ac585658a0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56ab-1e90-1334-9e8ad6c6ec23	Rekvizit-read	Rekvizit - branje	t
00030000-56ab-1e90-7b9c-d0bf1ee107ff	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56ab-1e90-f497-865953232817	Revizija-read	Revizija - branje	t
00030000-56ab-1e90-000b-3233cccf53bf	Revizija-write	Revizija - spreminjanje	t
00030000-56ab-1e90-979b-812478f7fb9b	Rezervacija-read	Rezervacija - branje	t
00030000-56ab-1e90-ad4f-79285385f0bd	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56ab-1e90-0b30-ea5b863fc233	SedezniRed-read	SedezniRed - branje	t
00030000-56ab-1e90-8dbb-682c21672583	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56ab-1e90-245a-e5c276f3ef03	Sedez-read	Sedez - branje	t
00030000-56ab-1e90-3595-b6a0584a96ae	Sedez-write	Sedez - spreminjanje	t
00030000-56ab-1e90-dc9c-34e0d9e14b61	Sezona-read	Sezona - branje	t
00030000-56ab-1e90-49a7-7a4c550364b2	Sezona-write	Sezona - spreminjanje	t
00030000-56ab-1e90-e456-17c5fa9670a6	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56ab-1e90-e803-f41b31d9a4d4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56ab-1e90-cee3-152385548070	Telefonska-read	Telefonska - branje	t
00030000-56ab-1e90-8b89-31540df2c8d4	Telefonska-write	Telefonska - spreminjanje	t
00030000-56ab-1e90-69bc-4f2e6441f4a2	TerminStoritve-read	TerminStoritve - branje	t
00030000-56ab-1e90-eeba-0f50c287ab33	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56ab-1e90-7226-14cdd60232a6	TipDodatka-read	TipDodatka - branje	t
00030000-56ab-1e90-4e9b-533a782925cd	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56ab-1e90-2952-595d97a4d740	TipFunkcije-read	TipFunkcije - branje	t
00030000-56ab-1e90-11ef-86b108317dc6	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56ab-1e90-4716-8ec46afee94f	TipPopa-read	TipPopa - branje	t
00030000-56ab-1e90-ede3-f9fac0d42da7	TipPopa-write	TipPopa - spreminjanje	t
00030000-56ab-1e90-4ee4-9f71fb9f69a9	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56ab-1e90-24c6-5d231d1318ff	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56ab-1e90-33e6-71566b5eec68	TipVaje-read	TipVaje - branje	t
00030000-56ab-1e90-00c3-ce0ee4e046a8	TipVaje-write	TipVaje - spreminjanje	t
00030000-56ab-1e90-c3ca-5c25ea1fe315	Trr-read	Trr - branje	t
00030000-56ab-1e90-5c17-4afd4b7a00d9	Trr-write	Trr - spreminjanje	t
00030000-56ab-1e90-c807-44eb37579c2a	Uprizoritev-read	Uprizoritev - branje	t
00030000-56ab-1e90-e029-190fd7684dba	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56ab-1e90-c524-fedb86a5b8ee	Vaja-read	Vaja - branje	t
00030000-56ab-1e90-3cfe-90477d3252e9	Vaja-write	Vaja - spreminjanje	t
00030000-56ab-1e90-15bf-27041eacbbbf	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56ab-1e90-2057-85ce08812070	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56ab-1e90-a89f-68486a8773ec	VrstaStroska-read	VrstaStroska - branje	t
00030000-56ab-1e90-0d5d-fb5ed3668546	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56ab-1e90-4bc0-54dad6c19fa0	Zaposlitev-read	Zaposlitev - branje	t
00030000-56ab-1e90-4716-4a318b3408db	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56ab-1e90-698f-f5201c3e0662	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56ab-1e90-260f-a7e73b1aaa53	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56ab-1e90-c81e-d2a011280c80	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56ab-1e90-94e1-619474ce16d1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56ab-1e90-9c84-e1a5418b52ad	Job-read	Branje opravil - samo zase - branje	t
00030000-56ab-1e90-c5e3-5ac75682a267	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56ab-1e90-a9f4-c1a921bdcad4	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56ab-1e90-9471-529746f206dd	Report-read	Report - branje	t
00030000-56ab-1e90-c93d-07ca01e4b919	Report-write	Report - spreminjanje	t
00030000-56ab-1e90-0140-f7a08fd5605c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56ab-1e90-bc6b-e2b774430d66	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56ab-1e90-92a0-14195a7dfee7	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56ab-1e90-d224-b7e5c5335958	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56ab-1e90-bcfc-35b940e652ff	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56ab-1e90-d78a-eda0853d51fb	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56ab-1e90-f522-ebb3204bbe50	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56ab-1e90-9a89-4aa288886af8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-1e90-8801-a45fe58659a3	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-1e90-c27f-b39f0a588f1b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-1e90-1102-7a1fcb703c67	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-1e90-641b-5dc65c651521	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56ab-1e90-33fd-badc0d011424	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56ab-1e90-336f-5e4f6c3e1816	Datoteka-write	Datoteka - spreminjanje	t
00030000-56ab-1e90-cf33-1eb8cc55a49e	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 41597126)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56ab-1e90-3f73-8583c1be3fa4	00030000-56ab-1e90-2919-5ddf2506ee6d
00020000-56ab-1e90-3f73-8583c1be3fa4	00030000-56ab-1e90-cf0b-e6c37660b0af
00020000-56ab-1e90-7957-7cb5eedc09d1	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-221b-b8bd718abb8f
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-abda-e314814375e4
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-e1eb-a1841ab75545	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-944b-270bec20e4f1	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e90-944b-270bec20e4f1	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e90-944b-270bec20e4f1	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-944b-270bec20e4f1	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-944b-270bec20e4f1	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-944b-270bec20e4f1	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-f800-63cd5a42dc57	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e90-f800-63cd5a42dc57	00030000-56ab-1e90-4716-4a318b3408db
00020000-56ab-1e90-f800-63cd5a42dc57	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e90-f800-63cd5a42dc57	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e90-f800-63cd5a42dc57	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-f800-63cd5a42dc57	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e90-f800-63cd5a42dc57	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e90-b99d-8f7987a56c90	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e90-b99d-8f7987a56c90	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e90-b99d-8f7987a56c90	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e90-b26c-73c1985f791f	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e90-b26c-73c1985f791f	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-b26c-73c1985f791f	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-b26c-73c1985f791f	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e90-b26c-73c1985f791f	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-b26c-73c1985f791f	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e90-b26c-73c1985f791f	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-b26c-73c1985f791f	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e90-14e7-318a17d4212e	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-14e7-318a17d4212e	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-14e7-318a17d4212e	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-14e7-318a17d4212e	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-5c17-4afd4b7a00d9
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-6ea4-3579864e40b2
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-8b89-31540df2c8d4
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-62a4-71f6bf9cd16a	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-c027-3562cf639858	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-c027-3562cf639858	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e90-c027-3562cf639858	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e90-c027-3562cf639858	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e90-c027-3562cf639858	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e90-c027-3562cf639858	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-c027-3562cf639858	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-8b89-31540df2c8d4
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-6ea4-3579864e40b2
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-5c17-4afd4b7a00d9
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-ca9f-552878d6f11b
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-be85-18704cab483c
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-da8a-079237a6d829
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-c34b-00083c78bb04	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-4e49-1f9a8b8afd85	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e90-243d-e9d0f3d98c05	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e90-243d-e9d0f3d98c05	00030000-56ab-1e90-ede3-f9fac0d42da7
00020000-56ab-1e90-c88f-cf2f9d7d22bc	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e90-bd32-a6ae738dc7b0	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e90-bd32-a6ae738dc7b0	00030000-56ab-1e90-417c-826a05e18b37
00020000-56ab-1e90-c502-e607fd7f9640	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e90-5e38-ce311951ee1f	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-5e38-ce311951ee1f	00030000-56ab-1e90-bbfe-986019ff29a9
00020000-56ab-1e90-5eba-2faeef5ed42d	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-6178-2f5638d65146	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e90-6178-2f5638d65146	00030000-56ab-1e90-94e1-619474ce16d1
00020000-56ab-1e90-a3ba-36ec99aec468	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e90-3c8e-14c2422f41e0	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e90-3c8e-14c2422f41e0	00030000-56ab-1e90-260f-a7e73b1aaa53
00020000-56ab-1e90-3325-2b7e0340daec	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e90-d4d6-81b61eb25fdd	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e90-d4d6-81b61eb25fdd	00030000-56ab-1e90-75f9-f0ac5ba70e1d
00020000-56ab-1e90-12e6-6e0fd28a93bc	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e90-9bf2-30e0ccb0f22e	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e90-9bf2-30e0ccb0f22e	00030000-56ab-1e90-243c-5477e1091c50
00020000-56ab-1e90-9bf2-30e0ccb0f22e	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e90-9bf2-30e0ccb0f22e	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e90-9bf2-30e0ccb0f22e	00030000-56ab-1e90-6ea4-3579864e40b2
00020000-56ab-1e90-9bf2-30e0ccb0f22e	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-7fc0-e4d96cb79544	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e90-7fc0-e4d96cb79544	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e90-7fc0-e4d96cb79544	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e90-9e65-5323a5233f21	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e90-9e65-5323a5233f21	00030000-56ab-1e90-0d5d-fb5ed3668546
00020000-56ab-1e90-a2c9-de2463479532	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-c340-cbb5a0a9af1a
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-5227-de2810496b48	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e90-5227-de2810496b48	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e90-5227-de2810496b48	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-5227-de2810496b48	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-5227-de2810496b48	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-1539-9659a72c7c44	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e90-1539-9659a72c7c44	00030000-56ab-1e90-00c3-ce0ee4e046a8
00020000-56ab-1e90-f51d-300e1dd26440	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-7b6c-13cfb9698131
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-8ed1-045d8ffa5e9b
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-3ad6-114593c88c54
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-abea-e826c3da3fb6
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-7cd9-1cf9c1dfcbb2
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-a166-bc2e32e2749b
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-7843-66f310ae0957
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-cbb1-830400d34a8b
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-a2fa-26dff8347e96
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-7168-f66e21c314a5
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-e066-bd80587b891f
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-0bda-7e829aed0ebd
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-d19c-daa828a6a462
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-29db-f53cb0e7843b
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-06d6-454b85606b85
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-e83b-c660fb3c4235
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-d2aa-42b089e2f81d
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-534c-c2048cf5a84b
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-c623-9a061dd3dbff
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-0d4d-74e4c3feb49d
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-d762-d60468e7ff5f
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-bada-ae41455a08f8
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-0fdb-e50cf1b1a088
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-3c2d-bdf55c9fbbe1
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-d9b8-383bc59e1f90
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-c5e3-5ac75682a267
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-42b8-ee0181b57b3b
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-0f37-54f8db6ce98f
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-e261-f3bee642300a
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-9c84-e1a5418b52ad
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-7e91-c09e00992465	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-3ad6-114593c88c54
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-7cd9-1cf9c1dfcbb2
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-7843-66f310ae0957
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-a2fa-26dff8347e96
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-e066-bd80587b891f
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-d19c-daa828a6a462
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-06d6-454b85606b85
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-d2aa-42b089e2f81d
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-c623-9a061dd3dbff
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-d762-d60468e7ff5f
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-0f37-54f8db6ce98f
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-42b8-ee0181b57b3b
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-e261-f3bee642300a
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-9c84-e1a5418b52ad
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-1fda-04e70c60c72d	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-e029-190fd7684dba
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-c388-3352a7a49e4b
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-1480-3f54377b8a7e	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e90-c5ec-b5e013029cc2	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e90-efde-b273f9f1f611	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e90-efde-b273f9f1f611	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e90-efde-b273f9f1f611	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e90-efde-b273f9f1f611	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e90-efde-b273f9f1f611	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-efde-b273f9f1f611	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e90-efde-b273f9f1f611	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e90-efde-b273f9f1f611	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-40cd-e01166b427db
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-e803-f41b31d9a4d4
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e90-aa8e-b895820fd7a8	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e90-5d0a-45dde3dc8d87	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e90-d947-1eb5b2528def	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e90-d947-1eb5b2528def	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e90-d947-1eb5b2528def	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e90-d947-1eb5b2528def	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e90-d947-1eb5b2528def	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e90-d947-1eb5b2528def	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e90-d947-1eb5b2528def	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e90-585c-4f236054e068	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e90-585c-4f236054e068	00030000-56ab-1e90-e803-f41b31d9a4d4
00020000-56ab-1e90-585c-4f236054e068	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e90-585c-4f236054e068	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e90-d57c-f4f048cbe627	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e90-d57c-f4f048cbe627	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-221b-b8bd718abb8f
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-abda-e314814375e4
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-42b8-ee0181b57b3b
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-3c2d-bdf55c9fbbe1
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-c388-3352a7a49e4b
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-9c84-e1a5418b52ad
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-c5e3-5ac75682a267
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-40cd-e01166b427db
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-e261-f3bee642300a
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-d9b8-383bc59e1f90
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-0f37-54f8db6ce98f
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-0fdb-e50cf1b1a088
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-7b6c-13cfb9698131
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-3ad6-114593c88c54
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-8ed1-045d8ffa5e9b
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-abea-e826c3da3fb6
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-7cd9-1cf9c1dfcbb2
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-a166-bc2e32e2749b
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-7843-66f310ae0957
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-cbb1-830400d34a8b
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-a2fa-26dff8347e96
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-7168-f66e21c314a5
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-e066-bd80587b891f
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-0bda-7e829aed0ebd
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-d19c-daa828a6a462
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-29db-f53cb0e7843b
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-06d6-454b85606b85
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-e83b-c660fb3c4235
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-d2aa-42b089e2f81d
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-534c-c2048cf5a84b
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-c623-9a061dd3dbff
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-0d4d-74e4c3feb49d
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-d762-d60468e7ff5f
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-bada-ae41455a08f8
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-e803-f41b31d9a4d4
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-e029-190fd7684dba
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e91-4851-19f3fb407691	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-221b-b8bd718abb8f
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-abda-e314814375e4
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e91-824c-28bc2bb2cf94	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-221b-b8bd718abb8f
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-abda-e314814375e4
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-c388-3352a7a49e4b
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-e029-190fd7684dba
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e91-d8aa-a5e2d40ff100	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-221b-b8bd718abb8f
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-abda-e314814375e4
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-42b8-ee0181b57b3b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-3c2d-bdf55c9fbbe1
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-c388-3352a7a49e4b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-9c84-e1a5418b52ad
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-c5e3-5ac75682a267
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-be85-18704cab483c
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-40cd-e01166b427db
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-ca9f-552878d6f11b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-e261-f3bee642300a
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-d9b8-383bc59e1f90
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-6ea4-3579864e40b2
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-0f37-54f8db6ce98f
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-0fdb-e50cf1b1a088
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-da8a-079237a6d829
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-7b6c-13cfb9698131
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-3ad6-114593c88c54
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-8ed1-045d8ffa5e9b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-abea-e826c3da3fb6
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-7cd9-1cf9c1dfcbb2
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-a166-bc2e32e2749b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-7843-66f310ae0957
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-cbb1-830400d34a8b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-a2fa-26dff8347e96
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-7168-f66e21c314a5
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-e066-bd80587b891f
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-0bda-7e829aed0ebd
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-d19c-daa828a6a462
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-29db-f53cb0e7843b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-06d6-454b85606b85
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-e83b-c660fb3c4235
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-d2aa-42b089e2f81d
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-534c-c2048cf5a84b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-c623-9a061dd3dbff
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-0d4d-74e4c3feb49d
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-d762-d60468e7ff5f
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-bada-ae41455a08f8
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-e803-f41b31d9a4d4
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-8b89-31540df2c8d4
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-5c17-4afd4b7a00d9
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-e029-190fd7684dba
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-4716-4a318b3408db
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e91-6141-565d7a273f26	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-221b-b8bd718abb8f
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-abda-e314814375e4
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-c388-3352a7a49e4b
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-be85-18704cab483c
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-ca9f-552878d6f11b
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-6ea4-3579864e40b2
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-da8a-079237a6d829
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-8b89-31540df2c8d4
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-5c17-4afd4b7a00d9
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-e029-190fd7684dba
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-4716-4a318b3408db
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e91-9e7a-b59d3b36d109	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e91-43c1-4bad356e8a46	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-42b8-ee0181b57b3b
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-3c2d-bdf55c9fbbe1
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-9c84-e1a5418b52ad
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-c5e3-5ac75682a267
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-be85-18704cab483c
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-c340-cbb5a0a9af1a
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-40cd-e01166b427db
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-ca9f-552878d6f11b
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-e261-f3bee642300a
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-d9b8-383bc59e1f90
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-6ea4-3579864e40b2
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-0f37-54f8db6ce98f
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-0fdb-e50cf1b1a088
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-da8a-079237a6d829
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-7b6c-13cfb9698131
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-3ad6-114593c88c54
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-8ed1-045d8ffa5e9b
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-abea-e826c3da3fb6
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-7cd9-1cf9c1dfcbb2
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-a166-bc2e32e2749b
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-7843-66f310ae0957
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-cbb1-830400d34a8b
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-a2fa-26dff8347e96
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-7168-f66e21c314a5
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-e066-bd80587b891f
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-0bda-7e829aed0ebd
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-d19c-daa828a6a462
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-29db-f53cb0e7843b
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-06d6-454b85606b85
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-e83b-c660fb3c4235
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-d2aa-42b089e2f81d
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-534c-c2048cf5a84b
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-c623-9a061dd3dbff
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-0d4d-74e4c3feb49d
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-d762-d60468e7ff5f
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-bada-ae41455a08f8
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-e803-f41b31d9a4d4
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-8b89-31540df2c8d4
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-5c17-4afd4b7a00d9
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-0d5d-fb5ed3668546
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-4716-4a318b3408db
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e91-2b5f-98c1ed63cba0	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-cf0b-e6c37660b0af
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-2919-5ddf2506ee6d
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-cd6f-2473089a6a22
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-75f9-f0ac5ba70e1d
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-2930-9a9bae4367b2
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-080d-97d7e051d666
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-a861-9fdc7d3a3abd
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-fea8-cc2f6bc855e2
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-a8c6-0a2adfa8e28d
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-221b-b8bd718abb8f
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-7b18-d9e372458d30
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-abda-e314814375e4
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-1fa5-48c10aa9087b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-fb0c-4fd472c6e503
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-d7ca-9931577c5781
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-5ea3-ce0e097b94af
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c38c-3f65494416e3
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-f5cf-311538fa0945
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-026f-4f7c01e758a2
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-044b-24f8bbdb7bc4
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-4a73-d12643657d41
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-42b8-ee0181b57b3b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-3c2d-bdf55c9fbbe1
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-422a-101acca36da6
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-bbfe-986019ff29a9
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-ef0c-30994f0968de
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-70fa-aefe8a962210
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c388-3352a7a49e4b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-94c2-4db528456938
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-9dc1-7c5868479d79
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-a9f4-c1a921bdcad4
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-9c84-e1a5418b52ad
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c5e3-5ac75682a267
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-7e40-ad25045ed567
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-be85-18704cab483c
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-12dd-dcb29fbe716f
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-da0f-5c035e8b48ae
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-f522-ebb3204bbe50
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-d78a-eda0853d51fb
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-bc6b-e2b774430d66
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-92a0-14195a7dfee7
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-d224-b7e5c5335958
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-bcfc-35b940e652ff
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-9585-075ee315e32e
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-54e7-d52e98b9ca30
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-8c5b-1e3a739bf1c8
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-988a-8dddc6001601
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-e093-f831850dc807
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-9ada-ab3c69d71526
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-e9ff-fb96ba0980f4
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-92a7-2c9b0c128f2e
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c340-cbb5a0a9af1a
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-5ef2-308d7027407b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-f814-c2902d98d69a
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-803f-9052ac84230e
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-ea4c-17fcb25cd312
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-40cd-e01166b427db
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-ca9f-552878d6f11b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-6a9d-3d2457aedbc3
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-e261-f3bee642300a
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-d9b8-383bc59e1f90
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-491d-41650b338e7e
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-1b93-ba5bb6673e2d
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-417c-826a05e18b37
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-6ea4-3579864e40b2
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-9aa4-4fd97e5125cf
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-ba7d-49ac774f80eb
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0631-9448a4f13141
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-463f-29c2b5249adb
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-4e8f-fc0413677860
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-28bc-7db1b5f7ffe8
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0f37-54f8db6ce98f
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0fdb-e50cf1b1a088
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-1621-cfd72dd46463
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-da8a-079237a6d829
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-7b6c-13cfb9698131
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-3ad6-114593c88c54
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-8ed1-045d8ffa5e9b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-abea-e826c3da3fb6
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-7cd9-1cf9c1dfcbb2
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-a166-bc2e32e2749b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-7843-66f310ae0957
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-cbb1-830400d34a8b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-a2fa-26dff8347e96
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-7168-f66e21c314a5
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-e066-bd80587b891f
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0bda-7e829aed0ebd
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-d19c-daa828a6a462
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-29db-f53cb0e7843b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-06d6-454b85606b85
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-e83b-c660fb3c4235
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-d2aa-42b089e2f81d
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-534c-c2048cf5a84b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c623-9a061dd3dbff
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0d4d-74e4c3feb49d
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-d762-d60468e7ff5f
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-bada-ae41455a08f8
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-1042-8e38caf3e174
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-243c-5477e1091c50
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-db1c-74cd4a0ca0c4
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-9ae0-57ca99d2f4a5
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-fd38-b1d9c791a0de
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-93dd-d12530c0ddfb
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-453b-b4818c8f79d7
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-b400-69ac585658a0
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-1334-9e8ad6c6ec23
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-7b9c-d0bf1ee107ff
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-9471-529746f206dd
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c93d-07ca01e4b919
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-f497-865953232817
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-000b-3233cccf53bf
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-979b-812478f7fb9b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-ad4f-79285385f0bd
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0b30-ea5b863fc233
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-8dbb-682c21672583
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-245a-e5c276f3ef03
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-3595-b6a0584a96ae
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-dc9c-34e0d9e14b61
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-49a7-7a4c550364b2
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0140-f7a08fd5605c
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-e803-f41b31d9a4d4
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-8b89-31540df2c8d4
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-69bc-4f2e6441f4a2
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c720-59b476a02ea6
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-eeba-0f50c287ab33
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-2952-595d97a4d740
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-11ef-86b108317dc6
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-4716-8ec46afee94f
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-ede3-f9fac0d42da7
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-4ee4-9f71fb9f69a9
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-24c6-5d231d1318ff
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-33e6-71566b5eec68
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-00c3-ce0ee4e046a8
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-5c17-4afd4b7a00d9
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-e029-190fd7684dba
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c524-fedb86a5b8ee
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-3cfe-90477d3252e9
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-15bf-27041eacbbbf
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-2057-85ce08812070
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-a89f-68486a8773ec
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-0d5d-fb5ed3668546
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-33fd-badc0d011424
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-641b-5dc65c651521
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-4716-4a318b3408db
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-698f-f5201c3e0662
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-260f-a7e73b1aaa53
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-c81e-d2a011280c80
00020000-56ab-1e92-373e-113bf5663eb8	00030000-56ab-1e90-94e1-619474ce16d1
00020000-56ab-1e92-6483-45c4efa8570a	00030000-56ab-1e90-1102-7a1fcb703c67
00020000-56ab-1e92-5055-09e8e1a6588a	00030000-56ab-1e90-c27f-b39f0a588f1b
00020000-56ab-1e92-c4b2-5c1d60701fc5	00030000-56ab-1e90-e029-190fd7684dba
00020000-56ab-1e92-6bbc-6debeac6db39	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e92-8d9b-530653ff458b	00030000-56ab-1e90-92a0-14195a7dfee7
00020000-56ab-1e92-ae97-9a381fded201	00030000-56ab-1e90-d224-b7e5c5335958
00020000-56ab-1e92-e054-f66c2afab61d	00030000-56ab-1e90-bcfc-35b940e652ff
00020000-56ab-1e92-6db3-2d0779962e27	00030000-56ab-1e90-bc6b-e2b774430d66
00020000-56ab-1e92-7293-eb20655534e3	00030000-56ab-1e90-f522-ebb3204bbe50
00020000-56ab-1e92-bbfe-439a4501a3af	00030000-56ab-1e90-d78a-eda0853d51fb
00020000-56ab-1e92-38b4-5ea2f0c00e52	00030000-56ab-1e90-8801-a45fe58659a3
00020000-56ab-1e92-723b-205cdd085138	00030000-56ab-1e90-9a89-4aa288886af8
00020000-56ab-1e92-ec45-e3dd3ad38430	00030000-56ab-1e90-8ee2-ad3461c0a4fa
00020000-56ab-1e92-e801-c973f2c292a8	00030000-56ab-1e90-c2d5-a65e2b0206d3
00020000-56ab-1e92-c772-6dab71bc120b	00030000-56ab-1e90-5248-aeb2d67da4ed
00020000-56ab-1e92-8505-48864fa65943	00030000-56ab-1e90-3fa7-cc9b76272a44
00020000-56ab-1e92-c9b1-eb646fb300a3	00030000-56ab-1e90-336f-5e4f6c3e1816
00020000-56ab-1e92-c84e-bcfa0bd5c1fc	00030000-56ab-1e90-cf33-1eb8cc55a49e
00020000-56ab-1e92-e229-3ecf7e6a69a5	00030000-56ab-1e90-d3ac-55906b2bc92d
00020000-56ab-1e92-e229-3ecf7e6a69a5	00030000-56ab-1e90-ca9f-552878d6f11b
00020000-56ab-1e92-e229-3ecf7e6a69a5	00030000-56ab-1e90-c807-44eb37579c2a
00020000-56ab-1e92-b870-482dbea139ab	00030000-56ab-1e90-c3ca-5c25ea1fe315
00020000-56ab-1e92-2413-da26cde0fabd	00030000-56ab-1e90-5c17-4afd4b7a00d9
00020000-56ab-1e92-1895-3eaf2f324bef	00030000-56ab-1e90-0140-f7a08fd5605c
00020000-56ab-1e92-b0a5-6d7ce9b15280	00030000-56ab-1e90-cee3-152385548070
00020000-56ab-1e92-f102-017c124f10d1	00030000-56ab-1e90-8b89-31540df2c8d4
00020000-56ab-1e92-d0d9-46e77314414d	00030000-56ab-1e90-5d8a-0c2a4433545a
00020000-56ab-1e92-f735-58545cff8bda	00030000-56ab-1e90-6ea4-3579864e40b2
00020000-56ab-1e92-8915-88dcbdd99fd1	00030000-56ab-1e90-4bc0-54dad6c19fa0
00020000-56ab-1e92-30b5-25f37cf61c62	00030000-56ab-1e90-4716-4a318b3408db
00020000-56ab-1e92-d885-5ef40fefa7e5	00030000-56ab-1e90-956b-526a495f79e5
00020000-56ab-1e92-c102-f27538869801	00030000-56ab-1e90-40cd-e01166b427db
00020000-56ab-1e92-adf2-f0787f340d1c	00030000-56ab-1e90-e456-17c5fa9670a6
00020000-56ab-1e92-1215-9fecaa6f7e87	00030000-56ab-1e90-e803-f41b31d9a4d4
00020000-56ab-1e92-a0a0-8bae72925ba4	00030000-56ab-1e90-4751-4ffb12d07f0a
00020000-56ab-1e92-68c1-f3b2caf0f616	00030000-56ab-1e90-6949-0ef869013229
00020000-56ab-1e92-419a-20995f734e04	00030000-56ab-1e90-cfd9-e95dbb598fea
00020000-56ab-1e92-0643-c8f604d94b3a	00030000-56ab-1e90-0c68-8e5a7c15c9d4
00020000-56ab-1e92-2470-63a0a9a0d141	00030000-56ab-1e90-1e5a-94f67bad2ab1
00020000-56ab-1e92-74d2-291f5d2918c2	00030000-56ab-1e90-c388-3352a7a49e4b
\.


--
-- TOC entry 3181 (class 0 OID 41597524)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 41597559)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 41597692)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56ab-1e93-7b10-6efd67186dfa	00090000-56ab-1e93-2ace-8f58cfd0014e	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56ab-1e93-ed82-fab80b011b65	00090000-56ab-1e93-7fde-994c7ff17cfd	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56ab-1e93-79fe-9c23d2cb87ec	00090000-56ab-1e93-d27b-85cef31326c6	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56ab-1e93-ae3e-5836dcdb62bd	00090000-56ab-1e93-fde7-bce0d8b4dae1	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 41597209)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56ab-1e92-871e-7be50751c20b	\N	00040000-56ab-1e90-c78d-26e6f7517136	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-1e92-c418-d629a8c86e09	\N	00040000-56ab-1e90-c78d-26e6f7517136	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56ab-1e92-bd8b-09973291711c	\N	00040000-56ab-1e90-c78d-26e6f7517136	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-1e92-5edd-076fa0872b34	\N	00040000-56ab-1e90-c78d-26e6f7517136	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-1e92-7884-68e3a1c0c424	\N	00040000-56ab-1e90-c78d-26e6f7517136	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-1e92-75b4-d6ee730efd2f	\N	00040000-56ab-1e90-bc90-e9daf05b28f4	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-1e92-f750-8410ead50a8f	\N	00040000-56ab-1e90-4745-a9ce6a64312e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-1e92-3c94-aa2964240167	\N	00040000-56ab-1e90-103b-34867bea988f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-1e92-b7f2-e7c881e1bedc	\N	00040000-56ab-1e90-4af2-2331d23e63d8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-1e95-df5c-833f9fbd2213	\N	00040000-56ab-1e90-c78d-26e6f7517136	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 41597254)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56ab-1e8f-75c4-f1a835fa4252	8341	Adlešiči
00050000-56ab-1e8f-da8b-312cea490b64	5270	Ajdovščina
00050000-56ab-1e8f-d865-619f30046f0e	6280	Ankaran/Ancarano
00050000-56ab-1e8f-6866-af51b8c7fb4f	9253	Apače
00050000-56ab-1e8f-dec3-aaf2c9ce60f1	8253	Artiče
00050000-56ab-1e8f-a3d2-94e58198bc84	4275	Begunje na Gorenjskem
00050000-56ab-1e8f-5541-60e3cba0ae74	1382	Begunje pri Cerknici
00050000-56ab-1e8f-e740-dbba1935838f	9231	Beltinci
00050000-56ab-1e8f-c585-6231dc941c0f	2234	Benedikt
00050000-56ab-1e8f-f00c-e146a0e9afab	2345	Bistrica ob Dravi
00050000-56ab-1e8f-95ed-7ab49301f22c	3256	Bistrica ob Sotli
00050000-56ab-1e8f-3623-6306e82d0b35	8259	Bizeljsko
00050000-56ab-1e8f-cfd9-a2382cdfaed1	1223	Blagovica
00050000-56ab-1e8f-e463-ccf4ad856b5d	8283	Blanca
00050000-56ab-1e8f-16e5-47681d1d77ce	4260	Bled
00050000-56ab-1e8f-2c7d-da6937e3a904	4273	Blejska Dobrava
00050000-56ab-1e8f-dab9-806e02d63109	9265	Bodonci
00050000-56ab-1e8f-5d31-a63c01dd5681	9222	Bogojina
00050000-56ab-1e8f-9c72-9d1877935003	4263	Bohinjska Bela
00050000-56ab-1e8f-21b9-66498f196648	4264	Bohinjska Bistrica
00050000-56ab-1e8f-b397-f1b153cea6f9	4265	Bohinjsko jezero
00050000-56ab-1e8f-4b54-9aeb6155b70a	1353	Borovnica
00050000-56ab-1e8f-a3cd-7a17b138a860	8294	Boštanj
00050000-56ab-1e8f-e6c5-98477b0d2db5	5230	Bovec
00050000-56ab-1e8f-edad-06f75c918a87	5295	Branik
00050000-56ab-1e8f-330c-216a08c43a90	3314	Braslovče
00050000-56ab-1e8f-b6bf-44d2550a49a9	5223	Breginj
00050000-56ab-1e8f-b1e2-1b187bdd740f	8280	Brestanica
00050000-56ab-1e8f-2e41-36251bfb1fae	2354	Bresternica
00050000-56ab-1e8f-21dd-36d51e3406bc	4243	Brezje
00050000-56ab-1e8f-bce0-416b1decdfdd	1351	Brezovica pri Ljubljani
00050000-56ab-1e8f-561b-0a1987591af6	8250	Brežice
00050000-56ab-1e8f-e357-2587178e2dab	4210	Brnik - Aerodrom
00050000-56ab-1e8f-2bbe-0d1f030970a5	8321	Brusnice
00050000-56ab-1e8f-2319-96ad4e72acf7	3255	Buče
00050000-56ab-1e8f-216a-b43f4f8489db	8276	Bučka 
00050000-56ab-1e8f-b7bc-5e9121d4afe2	9261	Cankova
00050000-56ab-1e8f-d03f-2af32104675c	3000	Celje 
00050000-56ab-1e8f-3a74-c964eaaa9ca3	3001	Celje - poštni predali
00050000-56ab-1e8f-a14c-c68c8400df32	4207	Cerklje na Gorenjskem
00050000-56ab-1e8f-d87e-67e3a1c3da84	8263	Cerklje ob Krki
00050000-56ab-1e8f-520e-4a5b43976b89	1380	Cerknica
00050000-56ab-1e8f-162d-fc26f051e598	5282	Cerkno
00050000-56ab-1e8f-b072-8afde0f63aac	2236	Cerkvenjak
00050000-56ab-1e8f-e5e1-cdf1dafbc03d	2215	Ceršak
00050000-56ab-1e8f-d1e4-8c68eff45c1b	2326	Cirkovce
00050000-56ab-1e8f-98b3-d29f95ee9724	2282	Cirkulane
00050000-56ab-1e8f-b0be-13c59c1b8c03	5273	Col
00050000-56ab-1e8f-115b-e6d5de31461f	8251	Čatež ob Savi
00050000-56ab-1e8f-c400-f6511283de83	1413	Čemšenik
00050000-56ab-1e8f-92a3-208346248bfc	5253	Čepovan
00050000-56ab-1e8f-bba0-f8859b95575a	9232	Črenšovci
00050000-56ab-1e8f-6c91-33f8d2168164	2393	Črna na Koroškem
00050000-56ab-1e8f-c9cf-e2c98c0fec84	6275	Črni Kal
00050000-56ab-1e8f-3547-15337c751870	5274	Črni Vrh nad Idrijo
00050000-56ab-1e8f-f72a-8df07294f572	5262	Črniče
00050000-56ab-1e8f-d75e-f37feb9e998b	8340	Črnomelj
00050000-56ab-1e8f-87a5-0c1c53a3ed5f	6271	Dekani
00050000-56ab-1e8f-46d7-6b3fa11c7051	5210	Deskle
00050000-56ab-1e8f-8918-79b1892dc64a	2253	Destrnik
00050000-56ab-1e8f-71b5-458bbca61361	6215	Divača
00050000-56ab-1e8f-d004-0818fc86216b	1233	Dob
00050000-56ab-1e8f-765f-2b2b21e19ba0	3224	Dobje pri Planini
00050000-56ab-1e8f-cabb-aa5b7bbae529	8257	Dobova
00050000-56ab-1e8f-c22a-9d9f5af64a9c	1423	Dobovec
00050000-56ab-1e8f-e629-df1b694c4493	5263	Dobravlje
00050000-56ab-1e8f-9727-cb8639821d0f	3204	Dobrna
00050000-56ab-1e8f-c719-a6cb667b8a48	8211	Dobrnič
00050000-56ab-1e8f-b136-b85a15fe2b7c	1356	Dobrova
00050000-56ab-1e8f-27dc-2dd9f1047915	9223	Dobrovnik/Dobronak 
00050000-56ab-1e8f-8168-d74603ced800	5212	Dobrovo v Brdih
00050000-56ab-1e8f-e682-b675661b392e	1431	Dol pri Hrastniku
00050000-56ab-1e8f-2790-6f75785135bc	1262	Dol pri Ljubljani
00050000-56ab-1e8f-b5db-4a24ac324603	1273	Dole pri Litiji
00050000-56ab-1e8f-ca65-8b70c0d53679	1331	Dolenja vas
00050000-56ab-1e8f-6b21-c121878dc3ed	8350	Dolenjske Toplice
00050000-56ab-1e8f-af22-b3a5e9ce7b54	1230	Domžale
00050000-56ab-1e8f-0534-835b47c7a6d2	2252	Dornava
00050000-56ab-1e8f-c434-5f76643797f1	5294	Dornberk
00050000-56ab-1e8f-ae36-ea5b35669ed5	1319	Draga
00050000-56ab-1e8f-cab3-321d00f0fd8b	8343	Dragatuš
00050000-56ab-1e8f-0016-7c234f26e1d7	3222	Dramlje
00050000-56ab-1e8f-194f-ed91532f2deb	2370	Dravograd
00050000-56ab-1e8f-05b1-9a6b7ab55e04	4203	Duplje
00050000-56ab-1e8f-008c-dd280d227bd1	6221	Dutovlje
00050000-56ab-1e8f-8ad1-89d3dd258539	8361	Dvor
00050000-56ab-1e8f-d13a-23a9df3cc1c2	2343	Fala
00050000-56ab-1e8f-a608-2a8fce5ac96f	9208	Fokovci
00050000-56ab-1e8f-1615-f51fad3df311	2313	Fram
00050000-56ab-1e8f-f056-eaca6799ed95	3213	Frankolovo
00050000-56ab-1e8f-bc4b-8e73efa7bb53	1274	Gabrovka
00050000-56ab-1e8f-3b15-76b57eceb89f	8254	Globoko
00050000-56ab-1e8f-d2fb-f50f1c352e66	5275	Godovič
00050000-56ab-1e8f-7731-482563939ca6	4204	Golnik
00050000-56ab-1e8f-052d-79ba7b0e878c	3303	Gomilsko
00050000-56ab-1e8f-e80b-ed0b90ed24cb	4224	Gorenja vas
00050000-56ab-1e8f-071b-0b9fbd497372	3263	Gorica pri Slivnici
00050000-56ab-1e8f-30d2-cfc7c2281ccd	2272	Gorišnica
00050000-56ab-1e8f-1112-fed5b24baf31	9250	Gornja Radgona
00050000-56ab-1e8f-c90b-ee3880dfaabc	3342	Gornji Grad
00050000-56ab-1e8f-b64e-132dfc4eba08	4282	Gozd Martuljek
00050000-56ab-1e8f-9c8b-cf873bdaa711	6272	Gračišče
00050000-56ab-1e8f-9f8f-fcecc756fc34	9264	Grad
00050000-56ab-1e8f-1e15-b02052a4cafb	8332	Gradac
00050000-56ab-1e8f-f647-ea333128ea1c	1384	Grahovo
00050000-56ab-1e8f-5ff4-6e5cf4811288	5242	Grahovo ob Bači
00050000-56ab-1e8f-77b4-ed5a2efcb041	5251	Grgar
00050000-56ab-1e8f-ffdc-776b89d1d49f	3302	Griže
00050000-56ab-1e8f-7bc7-ef5a064a323a	3231	Grobelno
00050000-56ab-1e8f-e606-abfb26e76ebf	1290	Grosuplje
00050000-56ab-1e8f-d935-23e834bd8ce7	2288	Hajdina
00050000-56ab-1e8f-2947-2f17dc4f2d87	8362	Hinje
00050000-56ab-1e8f-8ff1-baf668eb9d11	2311	Hoče
00050000-56ab-1e8f-185c-0510db24897b	9205	Hodoš/Hodos
00050000-56ab-1e8f-92bf-a5f27c2c0771	1354	Horjul
00050000-56ab-1e8f-416b-f48ae46cee08	1372	Hotedršica
00050000-56ab-1e8f-4e25-2ae50d61e4a9	1430	Hrastnik
00050000-56ab-1e8f-77e3-8f404b9c78ea	6225	Hruševje
00050000-56ab-1e8f-827e-43643ddf33e2	4276	Hrušica
00050000-56ab-1e8f-50d1-c1a12d0cbba3	5280	Idrija
00050000-56ab-1e8f-a236-0bcc5b926693	1292	Ig
00050000-56ab-1e8f-e5ca-03ae60d9f19a	6250	Ilirska Bistrica
00050000-56ab-1e8f-5d1f-0b744d3fec42	6251	Ilirska Bistrica-Trnovo
00050000-56ab-1e8f-b00e-cf0995c5da5c	1295	Ivančna Gorica
00050000-56ab-1e8f-151a-a0ad096aa5b6	2259	Ivanjkovci
00050000-56ab-1e8f-41bd-8be4463c7bc4	1411	Izlake
00050000-56ab-1e8f-730e-1f14b4db7071	6310	Izola/Isola
00050000-56ab-1e8f-0eec-e6f12df7469b	2222	Jakobski Dol
00050000-56ab-1e8f-7d2e-8c2a86abe453	2221	Jarenina
00050000-56ab-1e8f-59ca-65e515268a05	6254	Jelšane
00050000-56ab-1e8f-3057-bcd2326392b7	4270	Jesenice
00050000-56ab-1e8f-db8f-4f1d56234b7b	8261	Jesenice na Dolenjskem
00050000-56ab-1e8f-70b5-92c8bd1796cf	3273	Jurklošter
00050000-56ab-1e8f-910a-b8db847356ad	2223	Jurovski Dol
00050000-56ab-1e8f-5f15-79b1665d1f73	2256	Juršinci
00050000-56ab-1e8f-8c9e-81e08eba9630	5214	Kal nad Kanalom
00050000-56ab-1e8f-ffa5-b2584711ce2b	3233	Kalobje
00050000-56ab-1e8f-f201-e23bbed80385	4246	Kamna Gorica
00050000-56ab-1e8f-c78a-646a0536129e	2351	Kamnica
00050000-56ab-1e8f-6470-f39f9d037db7	1241	Kamnik
00050000-56ab-1e8f-caf6-a8361cf7d64f	5213	Kanal
00050000-56ab-1e8f-ed32-67222770f5c3	8258	Kapele
00050000-56ab-1e8f-e481-3ebcaeef1536	2362	Kapla
00050000-56ab-1e8f-c1d7-ef1b628efbee	2325	Kidričevo
00050000-56ab-1e8f-9a54-881676c4f9fb	1412	Kisovec
00050000-56ab-1e8f-f52a-41ec2ae852ce	6253	Knežak
00050000-56ab-1e8f-c886-021acd502e3a	5222	Kobarid
00050000-56ab-1e8f-917f-16be4aec9dad	9227	Kobilje
00050000-56ab-1e8f-d848-81484067c178	1330	Kočevje
00050000-56ab-1e8f-4a6b-e1b755e2a691	1338	Kočevska Reka
00050000-56ab-1e8f-f785-1c37e6e5d24c	2276	Kog
00050000-56ab-1e8f-4c62-b78e1dd80b23	5211	Kojsko
00050000-56ab-1e8f-d4d3-d657115cf0c1	6223	Komen
00050000-56ab-1e8f-c9eb-d225b533f3ae	1218	Komenda
00050000-56ab-1e8f-0c4a-3ac0235ff18d	6000	Koper/Capodistria 
00050000-56ab-1e8f-8a54-be26396223e7	6001	Koper/Capodistria - poštni predali
00050000-56ab-1e8f-ec58-caf4e7a12d3f	8282	Koprivnica
00050000-56ab-1e8f-7a68-f7a226b533d0	5296	Kostanjevica na Krasu
00050000-56ab-1e8f-e868-fefce92ee9be	8311	Kostanjevica na Krki
00050000-56ab-1e8f-5a50-1b1921cdd2a1	1336	Kostel
00050000-56ab-1e8f-6f4e-60594076584c	6256	Košana
00050000-56ab-1e8f-5316-72e5aa6137b6	2394	Kotlje
00050000-56ab-1e8f-9202-f8e1b874b09f	6240	Kozina
00050000-56ab-1e8f-4d4b-13ac5e5d47d1	3260	Kozje
00050000-56ab-1e8f-6eed-4863996faab5	4000	Kranj 
00050000-56ab-1e8f-98d5-dcb87958455d	4001	Kranj - poštni predali
00050000-56ab-1e8f-ae56-56fc927ad16b	4280	Kranjska Gora
00050000-56ab-1e8f-0463-04fa42a579d6	1281	Kresnice
00050000-56ab-1e8f-4ff4-4dcde92e6ce7	4294	Križe
00050000-56ab-1e8f-ee0c-1201d8a098f9	9206	Križevci
00050000-56ab-1e8f-573b-571cb24aaf2b	9242	Križevci pri Ljutomeru
00050000-56ab-1e8f-ae1c-9dc31cc23012	1301	Krka
00050000-56ab-1e8f-c9d9-f3e9e17d9a51	8296	Krmelj
00050000-56ab-1e8f-f315-d8bdf6d08752	4245	Kropa
00050000-56ab-1e8f-6dca-ee2a9c068041	8262	Krška vas
00050000-56ab-1e8f-98ab-4e7452b3d8f9	8270	Krško
00050000-56ab-1e8f-8707-cda7490528e0	9263	Kuzma
00050000-56ab-1e8f-dd13-2342d35004d0	2318	Laporje
00050000-56ab-1e8f-f054-43e302173cee	3270	Laško
00050000-56ab-1e8f-a996-275fe4e1d1d5	1219	Laze v Tuhinju
00050000-56ab-1e8f-f2d6-defaf654bedc	2230	Lenart v Slovenskih goricah
00050000-56ab-1e8f-b397-732faeaf0e56	9220	Lendava/Lendva
00050000-56ab-1e8f-b2f2-37f908aa355d	4248	Lesce
00050000-56ab-1e8f-3617-bb2c278caf1f	3261	Lesično
00050000-56ab-1e8f-4c4f-2207184721a1	8273	Leskovec pri Krškem
00050000-56ab-1e8f-0d9c-ba3b70263d15	2372	Libeliče
00050000-56ab-1e8f-7558-7cd04cb182de	2341	Limbuš
00050000-56ab-1e8f-dc50-f04210957c5b	1270	Litija
00050000-56ab-1e8f-95a1-66b67b941561	3202	Ljubečna
00050000-56ab-1e8f-fe2a-51e5776039fe	1000	Ljubljana 
00050000-56ab-1e8f-ec62-5e801387f89e	1001	Ljubljana - poštni predali
00050000-56ab-1e8f-f527-3277644d9b5e	1231	Ljubljana - Črnuče
00050000-56ab-1e8f-b725-f905e11abcff	1261	Ljubljana - Dobrunje
00050000-56ab-1e8f-9ce5-812904ffa1ca	1260	Ljubljana - Polje
00050000-56ab-1e8f-9d13-18cb0fd0fd96	1210	Ljubljana - Šentvid
00050000-56ab-1e8f-33c0-fa6c5eb24621	1211	Ljubljana - Šmartno
00050000-56ab-1e8f-48ea-8f6f33d79669	3333	Ljubno ob Savinji
00050000-56ab-1e8f-48da-91fda9db6739	9240	Ljutomer
00050000-56ab-1e8f-6813-2930706ba867	3215	Loče
00050000-56ab-1e8f-cc6f-0c5eacee9dd9	5231	Log pod Mangartom
00050000-56ab-1e8f-f731-cef5594dfe40	1358	Log pri Brezovici
00050000-56ab-1e8f-3300-2c9f2e530d9d	1370	Logatec
00050000-56ab-1e8f-11d7-3354a36ac286	1371	Logatec
00050000-56ab-1e8f-d5e6-426738f11838	1434	Loka pri Zidanem Mostu
00050000-56ab-1e8f-0d59-483dd7ff7b68	3223	Loka pri Žusmu
00050000-56ab-1e8f-daf9-3dc1da7a6360	6219	Lokev
00050000-56ab-1e8f-13a3-9053c9dc32a6	1318	Loški Potok
00050000-56ab-1e8f-b201-c5e0a0c1ae47	2324	Lovrenc na Dravskem polju
00050000-56ab-1e8f-ea00-b18078f70b1b	2344	Lovrenc na Pohorju
00050000-56ab-1e8f-4aff-f279171c790c	3334	Luče
00050000-56ab-1e8f-29c0-6f9b7b5bcc94	1225	Lukovica
00050000-56ab-1e8f-1f20-c9c8642ea853	9202	Mačkovci
00050000-56ab-1e8f-b0b7-d0404cab556d	2322	Majšperk
00050000-56ab-1e8f-81bc-cc43831a5ab8	2321	Makole
00050000-56ab-1e8f-fc79-5ce15875da62	9243	Mala Nedelja
00050000-56ab-1e8f-faf6-f90babae0b20	2229	Malečnik
00050000-56ab-1e8f-e886-bb0f66fbfe5f	6273	Marezige
00050000-56ab-1e8f-6519-5e100723fa83	2000	Maribor 
00050000-56ab-1e8f-c189-a1e7b13f6650	2001	Maribor - poštni predali
00050000-56ab-1e8f-ea4a-209f8a15c2ff	2206	Marjeta na Dravskem polju
00050000-56ab-1e8f-11a1-c09eaee76941	2281	Markovci
00050000-56ab-1e8f-c74f-be9b3544b047	9221	Martjanci
00050000-56ab-1e8f-747b-0abf326ba27c	6242	Materija
00050000-56ab-1e8f-5fea-7ff2ea6dc64f	4211	Mavčiče
00050000-56ab-1e8f-b20d-373a56e2e679	1215	Medvode
00050000-56ab-1e8f-4bcc-ce23831d8d48	1234	Mengeš
00050000-56ab-1e8f-f33d-7c1d7b40bb0c	8330	Metlika
00050000-56ab-1e8f-7007-55928398838a	2392	Mežica
00050000-56ab-1e8f-3621-3b5b7ac0d5e1	2204	Miklavž na Dravskem polju
00050000-56ab-1e8f-6f7a-3f058416cf9a	2275	Miklavž pri Ormožu
00050000-56ab-1e8f-5bc1-96e910291653	5291	Miren
00050000-56ab-1e8f-0f3c-dbe7b92b93c5	8233	Mirna
00050000-56ab-1e8f-ca74-d15a6569f3ac	8216	Mirna Peč
00050000-56ab-1e8f-c2a0-dc4c8baebebf	2382	Mislinja
00050000-56ab-1e8f-5364-aa24bf118199	4281	Mojstrana
00050000-56ab-1e8f-aeab-7ce5b77c311a	8230	Mokronog
00050000-56ab-1e8f-30f5-bca313808541	1251	Moravče
00050000-56ab-1e8f-ed69-dd97537d46d9	9226	Moravske Toplice
00050000-56ab-1e8f-bbd2-8c5793aed2c5	5216	Most na Soči
00050000-56ab-1e8f-6648-1423a5c1e862	1221	Motnik
00050000-56ab-1e8f-6fb9-5da6dfe2f386	3330	Mozirje
00050000-56ab-1e8f-6935-7d8fd5a8b26c	9000	Murska Sobota 
00050000-56ab-1e8f-aa48-e34195093f78	9001	Murska Sobota - poštni predali
00050000-56ab-1e8f-ea68-e1860d73936c	2366	Muta
00050000-56ab-1e8f-e63d-6a5d176020a0	4202	Naklo
00050000-56ab-1e8f-cb02-751d9866e465	3331	Nazarje
00050000-56ab-1e8f-b9fd-738baf56cf4f	1357	Notranje Gorice
00050000-56ab-1e8f-fa88-8e07fd3d85e2	3203	Nova Cerkev
00050000-56ab-1e8f-7b03-f897f770f241	5000	Nova Gorica 
00050000-56ab-1e8f-c4c0-435932684b4b	5001	Nova Gorica - poštni predali
00050000-56ab-1e8f-0564-2fb32de46753	1385	Nova vas
00050000-56ab-1e8f-311f-e721c8fd7cc4	8000	Novo mesto
00050000-56ab-1e8f-6d24-50dc09b16bd1	8001	Novo mesto - poštni predali
00050000-56ab-1e8f-b408-aa39fd8922e3	6243	Obrov
00050000-56ab-1e8f-bd6d-e39374eced6d	9233	Odranci
00050000-56ab-1e8f-82fc-8da3a3788ec0	2317	Oplotnica
00050000-56ab-1e8f-b7be-e33293c195de	2312	Orehova vas
00050000-56ab-1e8f-78ff-7aab00902a4b	2270	Ormož
00050000-56ab-1e8f-e56f-6e1b7bda9441	1316	Ortnek
00050000-56ab-1e8f-d4a8-9c49d6877d6b	1337	Osilnica
00050000-56ab-1e8f-98a5-b1ee6384bae2	8222	Otočec
00050000-56ab-1e8f-7b20-aac5be38b98b	2361	Ožbalt
00050000-56ab-1e8f-936a-44bcffae9473	2231	Pernica
00050000-56ab-1e8f-9474-e5dfc4bd8085	2211	Pesnica pri Mariboru
00050000-56ab-1e8f-c1c2-9b71beaa5612	9203	Petrovci
00050000-56ab-1e8f-280d-d20f7e408923	3301	Petrovče
00050000-56ab-1e8f-68e9-4d1ded380112	6330	Piran/Pirano
00050000-56ab-1e8f-33dc-f7e88b6f070e	8255	Pišece
00050000-56ab-1e8f-55b1-32f2d883af1e	6257	Pivka
00050000-56ab-1e8f-ac20-8a95e7f633fc	6232	Planina
00050000-56ab-1e8f-77a2-6516b2033189	3225	Planina pri Sevnici
00050000-56ab-1e8f-78ec-b7db80bf85f4	6276	Pobegi
00050000-56ab-1e8f-e229-7353c155a12c	8312	Podbočje
00050000-56ab-1e8f-df50-6734bdc9fa82	5243	Podbrdo
00050000-56ab-1e8f-f919-cc2d0508bd32	3254	Podčetrtek
00050000-56ab-1e8f-7547-281ad373247d	2273	Podgorci
00050000-56ab-1e8f-8f52-132f92038557	6216	Podgorje
00050000-56ab-1e8f-4b49-a357dc9f1164	2381	Podgorje pri Slovenj Gradcu
00050000-56ab-1e8f-b6a0-ee4dbaf25e31	6244	Podgrad
00050000-56ab-1e8f-2e9f-788b08d30b3d	1414	Podkum
00050000-56ab-1e8f-6ca3-bbf7d5c7da26	2286	Podlehnik
00050000-56ab-1e8f-918c-0ee801232a52	5272	Podnanos
00050000-56ab-1e8f-2d6d-1d7f08ff6f84	4244	Podnart
00050000-56ab-1e8f-7aa3-daa85216ae30	3241	Podplat
00050000-56ab-1e8f-47b6-5c5fe78f8efc	3257	Podsreda
00050000-56ab-1e8f-9e30-d8d2d2c2aeae	2363	Podvelka
00050000-56ab-1e8f-d217-98c1ff106392	2208	Pohorje
00050000-56ab-1e8f-2e67-28d7f5603722	2257	Polenšak
00050000-56ab-1e8f-4ca1-b13d091484f4	1355	Polhov Gradec
00050000-56ab-1e8f-240e-0c43d7ee049d	4223	Poljane nad Škofjo Loko
00050000-56ab-1e8f-11fb-e4bfb38156f7	2319	Poljčane
00050000-56ab-1e8f-fc75-55b56d7b6a5c	1272	Polšnik
00050000-56ab-1e8f-0c98-64b48db4d926	3313	Polzela
00050000-56ab-1e8f-05ef-82540ce88bec	3232	Ponikva
00050000-56ab-1e8f-3022-b276876b7d48	6320	Portorož/Portorose
00050000-56ab-1e8f-724f-7995a145fcfb	6230	Postojna
00050000-56ab-1e8f-735d-d65f8bb9b968	2331	Pragersko
00050000-56ab-1e8f-3b9d-cc62508ddde0	3312	Prebold
00050000-56ab-1e8f-0de3-f5b77320f912	4205	Preddvor
00050000-56ab-1e8f-ee05-6b080568b685	6255	Prem
00050000-56ab-1e8f-e669-a09afae092fa	1352	Preserje
00050000-56ab-1e8f-3d6c-a019843a40b1	6258	Prestranek
00050000-56ab-1e8f-4d40-517daeed4b69	2391	Prevalje
00050000-56ab-1e8f-63c8-d3561eac48b4	3262	Prevorje
00050000-56ab-1e8f-951b-6712b3dbee4f	1276	Primskovo 
00050000-56ab-1e8f-505e-b01a6a6716eb	3253	Pristava pri Mestinju
00050000-56ab-1e8f-77df-a22d5314da3f	9207	Prosenjakovci/Partosfalva
00050000-56ab-1e8f-3eee-fec4814fb6c7	5297	Prvačina
00050000-56ab-1e8f-426b-4d1d441bbb18	2250	Ptuj
00050000-56ab-1e8f-b624-b86ec905e107	2323	Ptujska Gora
00050000-56ab-1e8f-40e8-b38b6494d92a	9201	Puconci
00050000-56ab-1e8f-a312-b1142ee02c6f	2327	Rače
00050000-56ab-1e8f-384c-5b82df84c27d	1433	Radeče
00050000-56ab-1e8f-a0e6-12c85fcda0f7	9252	Radenci
00050000-56ab-1e8f-e6c7-6366755b1e45	2360	Radlje ob Dravi
00050000-56ab-1e8f-fd82-06104bec68fc	1235	Radomlje
00050000-56ab-1e8f-5bd6-3372b9eeb68c	4240	Radovljica
00050000-56ab-1e8f-94c1-8ccd562931b8	8274	Raka
00050000-56ab-1e8f-19ab-3b582d43fe63	1381	Rakek
00050000-56ab-1e8f-e2a6-9b1bb937cb56	4283	Rateče - Planica
00050000-56ab-1e8f-3cd6-e409ab2414f2	2390	Ravne na Koroškem
00050000-56ab-1e8f-6152-4003f8abb051	9246	Razkrižje
00050000-56ab-1e8f-406b-ddcc925984e1	3332	Rečica ob Savinji
00050000-56ab-1e8f-d76f-69e639efb473	5292	Renče
00050000-56ab-1e8f-0354-cb4191875acc	1310	Ribnica
00050000-56ab-1e8f-4151-cdc3827ef0e0	2364	Ribnica na Pohorju
00050000-56ab-1e8f-ca47-33528c3268c7	3272	Rimske Toplice
00050000-56ab-1e8f-b32d-5ca7d322df0a	1314	Rob
00050000-56ab-1e8f-eb9b-92c4dc32938c	5215	Ročinj
00050000-56ab-1e8f-f963-4a45a9e80beb	3250	Rogaška Slatina
00050000-56ab-1e8f-922f-03673b967b4d	9262	Rogašovci
00050000-56ab-1e8f-59b8-c4c6cbc82a09	3252	Rogatec
00050000-56ab-1e8f-321c-a9f00ba5ea40	1373	Rovte
00050000-56ab-1e8f-eee6-485b125bf227	2342	Ruše
00050000-56ab-1e8f-9589-e6a38c077c15	1282	Sava
00050000-56ab-1e8f-eca1-bdc5f8f3ccd1	6333	Sečovlje/Sicciole
00050000-56ab-1e8f-6e1a-b45c410746b9	4227	Selca
00050000-56ab-1e8f-eba8-1aad3ec65b8f	2352	Selnica ob Dravi
00050000-56ab-1e8f-eb78-faa88dfdaf02	8333	Semič
00050000-56ab-1e8f-edb4-6c99d6e9461a	8281	Senovo
00050000-56ab-1e8f-3697-647c4e8f0d16	6224	Senožeče
00050000-56ab-1e8f-faaa-98fdaa6d074e	8290	Sevnica
00050000-56ab-1e8f-b593-6894991fa295	6210	Sežana
00050000-56ab-1e8f-e0bd-9f3c6ab9b037	2214	Sladki Vrh
00050000-56ab-1e8f-c3a4-6363f3fdc9ab	5283	Slap ob Idrijci
00050000-56ab-1e8f-9e65-c29dc6bac793	2380	Slovenj Gradec
00050000-56ab-1e8f-2a1b-72b62d01b7ee	2310	Slovenska Bistrica
00050000-56ab-1e8f-3c6c-4ad42f0fa0f3	3210	Slovenske Konjice
00050000-56ab-1e8f-001a-4042df260301	1216	Smlednik
00050000-56ab-1e8f-41a8-18f0122d4a65	5232	Soča
00050000-56ab-1e8f-d6f5-dd9567817709	1317	Sodražica
00050000-56ab-1e8f-44d3-72b69c1e88c7	3335	Solčava
00050000-56ab-1e8f-a6f8-92415c3a8816	5250	Solkan
00050000-56ab-1e8f-93a5-8023af548a5a	4229	Sorica
00050000-56ab-1e8f-eb7f-3bc66aa9b471	4225	Sovodenj
00050000-56ab-1e8f-1559-4f66debbc831	5281	Spodnja Idrija
00050000-56ab-1e8f-14c9-ea185d8ee834	2241	Spodnji Duplek
00050000-56ab-1e8f-44ff-7bf175523dbd	9245	Spodnji Ivanjci
00050000-56ab-1e8f-9c15-60429abe7650	2277	Središče ob Dravi
00050000-56ab-1e8f-9b81-191e395f15fe	4267	Srednja vas v Bohinju
00050000-56ab-1e8f-4085-19c7a31559d6	8256	Sromlje 
00050000-56ab-1e8f-6a96-82c335f1473b	5224	Srpenica
00050000-56ab-1e8f-9414-fed27ae104c7	1242	Stahovica
00050000-56ab-1e8f-fbdb-aec4dfab6f4c	1332	Stara Cerkev
00050000-56ab-1e8f-cd67-cc272ae95c8e	8342	Stari trg ob Kolpi
00050000-56ab-1e8f-9db6-5e3cc9bfc658	1386	Stari trg pri Ložu
00050000-56ab-1e8f-a633-2c13d1fa63ea	2205	Starše
00050000-56ab-1e8f-fcfc-29c58ae4420a	2289	Stoperce
00050000-56ab-1e8f-b194-d79afe4713b9	8322	Stopiče
00050000-56ab-1e8f-65b4-bff84a2ea22d	3206	Stranice
00050000-56ab-1e8f-033d-0a3099148a5a	8351	Straža
00050000-56ab-1e8f-6036-24f47d0cdb17	1313	Struge
00050000-56ab-1e8f-5ee9-4a1aec515b4b	8293	Studenec
00050000-56ab-1e8f-0a81-27cb9dd02734	8331	Suhor
00050000-56ab-1e8f-7ecb-ccc9082b51a9	2233	Sv. Ana v Slovenskih goricah
00050000-56ab-1e8f-8533-456b27c0f33f	2235	Sv. Trojica v Slovenskih goricah
00050000-56ab-1e8f-4de6-5ac4fb7a3017	2353	Sveti Duh na Ostrem Vrhu
00050000-56ab-1e8f-4a7a-25e3400809dd	9244	Sveti Jurij ob Ščavnici
00050000-56ab-1e8f-4b37-0d4bb2db0710	3264	Sveti Štefan
00050000-56ab-1e8f-98f2-7986152405ff	2258	Sveti Tomaž
00050000-56ab-1e8f-1e32-a36662c5417e	9204	Šalovci
00050000-56ab-1e8f-baf5-7771694b563c	5261	Šempas
00050000-56ab-1e8f-a093-81c0fa5915d1	5290	Šempeter pri Gorici
00050000-56ab-1e8f-1fd5-36c2df6f12e9	3311	Šempeter v Savinjski dolini
00050000-56ab-1e8f-2472-a9ee3029a7b4	4208	Šenčur
00050000-56ab-1e8f-b329-4fab034aec07	2212	Šentilj v Slovenskih goricah
00050000-56ab-1e8f-b59a-5b40e3793ccb	8297	Šentjanž
00050000-56ab-1e8f-c7d2-815cfdcefc71	2373	Šentjanž pri Dravogradu
00050000-56ab-1e8f-1a82-837916ed4e3c	8310	Šentjernej
00050000-56ab-1e8f-06d1-7cff3b51a97f	3230	Šentjur
00050000-56ab-1e8f-2cad-e4700bb30ef2	3271	Šentrupert
00050000-56ab-1e8f-e3f9-c879df95dd7e	8232	Šentrupert
00050000-56ab-1e8f-b2c1-7b86276f7971	1296	Šentvid pri Stični
00050000-56ab-1e8f-d3ca-fb26baee9552	8275	Škocjan
00050000-56ab-1e8f-dcbd-bcf0972f7b8b	6281	Škofije
00050000-56ab-1e8f-694f-02ebcf84bcd2	4220	Škofja Loka
00050000-56ab-1e8f-cd94-f4029250dc60	3211	Škofja vas
00050000-56ab-1e8f-837a-6c3f8c60ddcf	1291	Škofljica
00050000-56ab-1e8f-a02d-b503c0b6efc5	6274	Šmarje
00050000-56ab-1e8f-c506-0c2cda2ca5c2	1293	Šmarje - Sap
00050000-56ab-1e8f-a5db-25a1e22c4a6b	3240	Šmarje pri Jelšah
00050000-56ab-1e8f-d5d2-9d8389df482f	8220	Šmarješke Toplice
00050000-56ab-1e8f-b2b6-0a195f0285c3	2315	Šmartno na Pohorju
00050000-56ab-1e8f-33ff-71c8cba2d97c	3341	Šmartno ob Dreti
00050000-56ab-1e8f-be3a-1041c825f655	3327	Šmartno ob Paki
00050000-56ab-1e8f-c3f4-3cb4c766c62f	1275	Šmartno pri Litiji
00050000-56ab-1e8f-55f5-b2576ec049ba	2383	Šmartno pri Slovenj Gradcu
00050000-56ab-1e8f-f71e-3b92295de133	3201	Šmartno v Rožni dolini
00050000-56ab-1e8f-949a-87afc0155789	3325	Šoštanj
00050000-56ab-1e8f-1d7c-58d4d577cb5d	6222	Štanjel
00050000-56ab-1e90-b014-b1cc15c8a76c	3220	Štore
00050000-56ab-1e90-8f34-199e5426b6fa	3304	Tabor
00050000-56ab-1e90-2216-ac827f66b25a	3221	Teharje
00050000-56ab-1e90-292f-d1dc306f3a14	9251	Tišina
00050000-56ab-1e90-6318-30a1b55b5dbf	5220	Tolmin
00050000-56ab-1e90-0c4c-df4e13ace1e6	3326	Topolšica
00050000-56ab-1e90-0c76-d161d2ec9286	2371	Trbonje
00050000-56ab-1e90-fd3c-0783fcf53d1c	1420	Trbovlje
00050000-56ab-1e90-de7b-8bf2a892d181	8231	Trebelno 
00050000-56ab-1e90-6451-deb5348542d6	8210	Trebnje
00050000-56ab-1e90-6ba4-fee18b7810c2	5252	Trnovo pri Gorici
00050000-56ab-1e90-86fd-72981bb8ec66	2254	Trnovska vas
00050000-56ab-1e90-78d4-b107f8ed94c1	1222	Trojane
00050000-56ab-1e90-f940-9a034ebd97ff	1236	Trzin
00050000-56ab-1e90-7835-f478245324f8	4290	Tržič
00050000-56ab-1e90-1795-6f6f537e9681	8295	Tržišče
00050000-56ab-1e90-bc94-6371b93e33b3	1311	Turjak
00050000-56ab-1e90-3ed9-650ceb74cd6c	9224	Turnišče
00050000-56ab-1e90-7de6-2dbebe7a84ba	8323	Uršna sela
00050000-56ab-1e90-5be0-1470da1f8d6e	1252	Vače
00050000-56ab-1e90-0620-2c002a18f4bd	3320	Velenje 
00050000-56ab-1e90-c33c-b78c28f619d6	3322	Velenje - poštni predali
00050000-56ab-1e90-b113-0ed743753b38	8212	Velika Loka
00050000-56ab-1e90-201c-73b9085ede16	2274	Velika Nedelja
00050000-56ab-1e90-b7b5-940554e5f0ea	9225	Velika Polana
00050000-56ab-1e90-7b60-0614f3e43a9c	1315	Velike Lašče
00050000-56ab-1e90-3901-6b0154ea8231	8213	Veliki Gaber
00050000-56ab-1e90-f9c3-16004f1d55bb	9241	Veržej
00050000-56ab-1e90-b199-170fef2755e0	1312	Videm - Dobrepolje
00050000-56ab-1e90-eb9c-606cb7608c4f	2284	Videm pri Ptuju
00050000-56ab-1e90-43e5-a6a49914f5a1	8344	Vinica
00050000-56ab-1e90-26c6-f7fba6bdb7d6	5271	Vipava
00050000-56ab-1e90-75d7-152160711d21	4212	Visoko
00050000-56ab-1e90-2d43-1456c730f5c2	1294	Višnja Gora
00050000-56ab-1e90-6de7-1318b668e6fd	3205	Vitanje
00050000-56ab-1e90-625d-6a8e6a0804d1	2255	Vitomarci
00050000-56ab-1e90-f145-da2aba854af3	1217	Vodice
00050000-56ab-1e90-675a-d99d5da92cc2	3212	Vojnik\t
00050000-56ab-1e90-ed40-7bba3cd031e7	5293	Volčja Draga
00050000-56ab-1e90-8d48-b6ce232ee70c	2232	Voličina
00050000-56ab-1e90-8a38-c19df0058f71	3305	Vransko
00050000-56ab-1e90-9fc5-00c4f3af6382	6217	Vremski Britof
00050000-56ab-1e90-6ddc-e776d21ac11c	1360	Vrhnika
00050000-56ab-1e90-5d25-8b1bead0fffc	2365	Vuhred
00050000-56ab-1e90-ad75-15420a4e6fac	2367	Vuzenica
00050000-56ab-1e90-d30f-8aaeae44c1cf	8292	Zabukovje 
00050000-56ab-1e90-b67f-6645b7a95429	1410	Zagorje ob Savi
00050000-56ab-1e90-696f-6f01a5e7a507	1303	Zagradec
00050000-56ab-1e90-3c40-3dbaa43a02fc	2283	Zavrč
00050000-56ab-1e90-259f-819cac1d5a60	8272	Zdole 
00050000-56ab-1e90-30d6-7a7aa86a2e46	4201	Zgornja Besnica
00050000-56ab-1e90-0cc9-0e7041aa4a57	2242	Zgornja Korena
00050000-56ab-1e90-e5ce-e3e44857bd4e	2201	Zgornja Kungota
00050000-56ab-1e90-444a-bd2603d7dab2	2316	Zgornja Ložnica
00050000-56ab-1e90-885c-f05f9aa1001b	2314	Zgornja Polskava
00050000-56ab-1e90-0a08-54a57335880b	2213	Zgornja Velka
00050000-56ab-1e90-5556-b232ba5c15ff	4247	Zgornje Gorje
00050000-56ab-1e90-ff0f-fd4e43b2baa3	4206	Zgornje Jezersko
00050000-56ab-1e90-2b7e-a18ebc93fd30	2285	Zgornji Leskovec
00050000-56ab-1e90-9bee-e014257a3980	1432	Zidani Most
00050000-56ab-1e90-43c0-777058edc4c0	3214	Zreče
00050000-56ab-1e90-82a0-704619cd5c83	4209	Žabnica
00050000-56ab-1e90-fbf8-b825259e02d5	3310	Žalec
00050000-56ab-1e90-3906-08f3e20de04f	4228	Železniki
00050000-56ab-1e90-410f-8455e6a2cd9a	2287	Žetale
00050000-56ab-1e90-1c8b-b5f018b7ca9d	4226	Žiri
00050000-56ab-1e90-7637-2c24bb564638	4274	Žirovnica
00050000-56ab-1e90-aabd-73fb7165f5b1	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 41597929)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 41597499)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 41597239)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56ab-1e93-df47-d0a89b512a18	00080000-56ab-1e92-871e-7be50751c20b	\N	00040000-56ab-1e90-c78d-26e6f7517136	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56ab-1e93-a822-ba176774cb2c	00080000-56ab-1e92-871e-7be50751c20b	\N	00040000-56ab-1e90-c78d-26e6f7517136	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56ab-1e93-81c1-b322e31493e0	00080000-56ab-1e92-c418-d629a8c86e09	\N	00040000-56ab-1e90-c78d-26e6f7517136	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 41597374)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56ab-1e90-f673-4acf6f15b106	novo leto	1	1	\N	t
00430000-56ab-1e90-e358-be09b7eee30c	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56ab-1e90-fb9a-cfa694d06877	dan upora proti okupatorju	27	4	\N	t
00430000-56ab-1e90-57c0-1939d51103cd	praznik dela	1	5	\N	t
00430000-56ab-1e90-2549-ffc054a55d9d	praznik dela	2	5	\N	t
00430000-56ab-1e90-63b7-793b2152214a	dan Primoža Trubarja	8	6	\N	f
00430000-56ab-1e90-6b2d-67dd28ecf7b3	dan državnosti	25	6	\N	t
00430000-56ab-1e90-4133-847e8d82d2f3	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56ab-1e90-9173-61579601b994	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56ab-1e90-bccf-d8aae24b23eb	dan suverenosti	25	10	\N	f
00430000-56ab-1e90-7070-c41a845e5e9e	dan spomina na mrtve	1	11	\N	t
00430000-56ab-1e90-09e4-657efa48de12	dan Rudolfa Maistra	23	11	\N	f
00430000-56ab-1e90-4eac-f9e53804f558	božič	25	12	\N	t
00430000-56ab-1e90-0355-9360e8d986cd	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56ab-1e90-3aa5-f0c46dab1114	Marijino vnebovzetje	15	8	\N	t
00430000-56ab-1e90-c656-c2dad53269b0	dan reformacije	31	10	\N	t
00430000-56ab-1e90-0bb1-8f7c6ab10c4e	velikonočna nedelja	27	3	2016	t
00430000-56ab-1e90-b2df-e28258ff1456	velikonočna nedelja	16	4	2017	t
00430000-56ab-1e90-7972-2cac4136a1e5	velikonočna nedelja	1	4	2018	t
00430000-56ab-1e90-03de-ac7a54bb9198	velikonočna nedelja	21	4	2019	t
00430000-56ab-1e90-4b93-43cd392126d1	velikonočna nedelja	12	4	2020	t
00430000-56ab-1e90-5d6a-64fd09a3265c	velikonočna nedelja	4	4	2021	t
00430000-56ab-1e90-beb0-b92362a38ad3	velikonočna nedelja	17	4	2022	t
00430000-56ab-1e90-d0f7-2f2bcc78886e	velikonočna nedelja	9	4	2023	t
00430000-56ab-1e90-63bd-5ab76284bdbc	velikonočna nedelja	31	3	2024	t
00430000-56ab-1e90-f185-c50e0a70ef42	velikonočna nedelja	20	4	2025	t
00430000-56ab-1e90-6771-91e23928314d	velikonočna nedelja	5	4	2026	t
00430000-56ab-1e90-154f-096b1f37b753	velikonočna nedelja	28	3	2027	t
00430000-56ab-1e90-3049-4711672ba89e	velikonočna nedelja	16	4	2028	t
00430000-56ab-1e90-6851-915cc94a533b	velikonočna nedelja	1	4	2029	t
00430000-56ab-1e90-fd48-617402795ef0	velikonočna nedelja	21	4	2030	t
00430000-56ab-1e90-5981-6426775cfe5e	velikonočni ponedeljek	28	3	2016	t
00430000-56ab-1e90-5d7a-4892ea473a30	velikonočni ponedeljek	17	4	2017	t
00430000-56ab-1e90-34a3-8a9c19bf92f8	velikonočni ponedeljek	2	4	2018	t
00430000-56ab-1e90-f04f-b62f14b844cf	velikonočni ponedeljek	22	4	2019	t
00430000-56ab-1e90-b397-738a34aa0679	velikonočni ponedeljek	13	4	2020	t
00430000-56ab-1e90-e127-b6e32902d2e0	velikonočni ponedeljek	5	4	2021	t
00430000-56ab-1e90-fa8c-b4769378bb44	velikonočni ponedeljek	18	4	2022	t
00430000-56ab-1e90-6ea6-eaad7ec0b7bc	velikonočni ponedeljek	10	4	2023	t
00430000-56ab-1e90-70f1-b86d91eaf52d	velikonočni ponedeljek	1	4	2024	t
00430000-56ab-1e90-3e08-a0e621c780f3	velikonočni ponedeljek	21	4	2025	t
00430000-56ab-1e90-e3d1-ce8aef1706cc	velikonočni ponedeljek	6	4	2026	t
00430000-56ab-1e90-b680-f6870d1b8abf	velikonočni ponedeljek	29	3	2027	t
00430000-56ab-1e90-76f3-c6f32784856d	velikonočni ponedeljek	17	4	2028	t
00430000-56ab-1e90-0437-e94b7fffb802	velikonočni ponedeljek	2	4	2029	t
00430000-56ab-1e90-20ad-0fe61a0e4ea1	velikonočni ponedeljek	22	4	2030	t
00430000-56ab-1e90-d47b-c5bf20e62cdb	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56ab-1e90-91e0-e9699f354fda	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56ab-1e90-b757-28267e31800a	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56ab-1e90-96eb-7526d8f6f728	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56ab-1e90-98fd-e02c2e029341	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56ab-1e90-073c-a246ece8d548	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56ab-1e90-a283-0eb4b9b0645c	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56ab-1e90-e5a8-be573709ca09	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56ab-1e90-144e-f13605b425a8	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56ab-1e90-5e07-1f068c7953be	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56ab-1e90-4318-df9578a9b759	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56ab-1e90-391d-113095c40282	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56ab-1e90-b69c-6e78cde83fdd	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56ab-1e90-bcf2-10876bc33099	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56ab-1e90-5d20-81700b660ac0	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 41597343)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56ab-1e93-e4e0-f421c53c8395	000e0000-56ab-1e93-66a9-dd76d57e2762	1	1	\N
001b0000-56ab-1e93-7532-9e4a75b99d6f	000e0000-56ab-1e93-66a9-dd76d57e2762	1	2	\N
001b0000-56ab-1e93-981d-783ad9790f8e	000e0000-56ab-1e93-66a9-dd76d57e2762	1	3	1
001b0000-56ab-1e93-de42-d982e2ee64c9	000e0000-56ab-1e93-66a9-dd76d57e2762	2	4	2
001b0000-56ab-1e93-b74a-820e680d54d5	000e0000-56ab-1e93-66a9-dd76d57e2762	4	5	3
001b0000-56ab-1e93-cae4-a2ff33bbf63d	000e0000-56ab-1e93-3714-8efa1be18f47	1	1	\N
001b0000-56ab-1e93-f564-68eb6cfdcdb1	000e0000-56ab-1e93-3714-8efa1be18f47	3	2	1
001b0000-56ab-1e93-5fb2-cedc0d15494f	000e0000-56ab-1e93-3714-8efa1be18f47	1	5	1
001b0000-56ab-1e93-219c-4d4eae7d94ff	000e0000-56ab-1e93-66a9-dd76d57e2762	1	6	1
001b0000-56ab-1e93-43b5-b548d09ad4e3	000e0000-56ab-1e93-66a9-dd76d57e2762	2	7	2
001b0000-56ab-1e93-e59b-661550b5f7d6	000e0000-56ab-1e93-66a9-dd76d57e2762	5	9	4
001b0000-56ab-1e93-9031-1f77a5c510c9	000e0000-56ab-1e93-66a9-dd76d57e2762	7	10	5
001b0000-56ab-1e93-64c1-c31c16e65ad1	000e0000-56ab-1e93-3714-8efa1be18f47	4	3	1
001b0000-56ab-1e93-a764-482fa2881751	000e0000-56ab-1e93-66a9-dd76d57e2762	3	8	3
001b0000-56ab-1e93-3769-69a8f09d008a	000e0000-56ab-1e93-66a9-dd76d57e2762	2	11	1
001b0000-56ab-1e93-a94f-a94c141231d3	000e0000-56ab-1e93-3714-8efa1be18f47	6	4	2
\.


--
-- TOC entry 3161 (class 0 OID 41597349)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56ab-1e93-981d-783ad9790f8e	000a0000-56ab-1e92-5e8a-abc8e7784e69
001b0000-56ab-1e93-981d-783ad9790f8e	000a0000-56ab-1e92-dcb4-16805e27a8da
001b0000-56ab-1e93-de42-d982e2ee64c9	000a0000-56ab-1e92-dcb4-16805e27a8da
001b0000-56ab-1e93-de42-d982e2ee64c9	000a0000-56ab-1e92-8c22-ef5a4da5ceb9
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 41597511)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 41597943)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 41597953)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56ab-1e93-e3fa-6f1322f2c7cf	00080000-56ab-1e92-bd8b-09973291711c	0987	AK
00190000-56ab-1e93-b874-9aeff8cf481a	00080000-56ab-1e92-c418-d629a8c86e09	0989	AK
00190000-56ab-1e93-b62a-b889126f3116	00080000-56ab-1e92-5edd-076fa0872b34	0986	AK
00190000-56ab-1e93-89bd-1cbc48f4f4de	00080000-56ab-1e92-75b4-d6ee730efd2f	0984	AK
00190000-56ab-1e93-6585-25a8c9f6f1e5	00080000-56ab-1e92-f750-8410ead50a8f	0983	AK
00190000-56ab-1e93-aa17-3d22998513c5	00080000-56ab-1e92-3c94-aa2964240167	0982	AK
00190000-56ab-1e95-4013-56df8d52dbdf	00080000-56ab-1e95-df5c-833f9fbd2213	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 41597842)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56ab-1e93-f329-1fbdb385d4bf	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 41597961)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 41597539)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56ab-1e92-5711-45ba56863bef	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56ab-1e92-05e1-4dcd3c37a803	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56ab-1e92-95cc-1ff3bdbfd59b	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56ab-1e92-c2a5-e30338586bac	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56ab-1e92-7103-b00f36cd9106	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56ab-1e92-e167-4e96563376cd	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56ab-1e92-e3ca-29aed5c103e5	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 41597484)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 41597474)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 41597681)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 41597611)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 41597317)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 41597078)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56ab-1e95-df5c-833f9fbd2213	00010000-56ab-1e91-54b4-eecb5421591a	2016-01-29 09:11:01	INS	a:0:{}
2	App\\Entity\\Option	00000000-56ab-1e95-93e6-31ee4f1f7325	00010000-56ab-1e91-54b4-eecb5421591a	2016-01-29 09:11:01	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56ab-1e95-4013-56df8d52dbdf	00010000-56ab-1e91-54b4-eecb5421591a	2016-01-29 09:11:01	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 41597553)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 41597116)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56ab-1e90-3f73-8583c1be3fa4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56ab-1e90-7957-7cb5eedc09d1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56ab-1e90-d2a3-d65e11671135	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56ab-1e90-1342-663f414e024b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56ab-1e90-e1eb-a1841ab75545	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-1e90-944b-270bec20e4f1	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-1e90-f800-63cd5a42dc57	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56ab-1e90-b99d-8f7987a56c90	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56ab-1e90-b26c-73c1985f791f	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-1e90-14e7-318a17d4212e	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-1e90-62a4-71f6bf9cd16a	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-1e90-c027-3562cf639858	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-1e90-c34b-00083c78bb04	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-1e90-4e49-1f9a8b8afd85	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-1e90-243d-e9d0f3d98c05	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-1e90-c88f-cf2f9d7d22bc	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-1e90-bd32-a6ae738dc7b0	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56ab-1e90-c502-e607fd7f9640	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56ab-1e90-5e38-ce311951ee1f	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56ab-1e90-5eba-2faeef5ed42d	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56ab-1e90-6178-2f5638d65146	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-1e90-a3ba-36ec99aec468	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-1e90-3c8e-14c2422f41e0	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-1e90-3325-2b7e0340daec	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-1e90-d4d6-81b61eb25fdd	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56ab-1e90-12e6-6e0fd28a93bc	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56ab-1e90-9bf2-30e0ccb0f22e	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56ab-1e90-7fc0-e4d96cb79544	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56ab-1e90-9e65-5323a5233f21	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-1e90-a2c9-de2463479532	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-1e90-6e4b-ae1f7a4fa9f8	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-1e90-5227-de2810496b48	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-1e90-1539-9659a72c7c44	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56ab-1e90-f51d-300e1dd26440	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56ab-1e90-7e91-c09e00992465	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56ab-1e90-1fda-04e70c60c72d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56ab-1e90-1480-3f54377b8a7e	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-1e90-c5ec-b5e013029cc2	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-1e90-efde-b273f9f1f611	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56ab-1e90-aa8e-b895820fd7a8	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-1e90-5d0a-45dde3dc8d87	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-1e90-d947-1eb5b2528def	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56ab-1e90-585c-4f236054e068	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-1e90-d57c-f4f048cbe627	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-1e91-4851-19f3fb407691	direktor	minimalne pravice za direktorja	t
00020000-56ab-1e91-824c-28bc2bb2cf94	arhivar	arhivar	t
00020000-56ab-1e91-d8aa-a5e2d40ff100	dramaturg	dramaturg	t
00020000-56ab-1e91-6141-565d7a273f26	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56ab-1e91-9e7a-b59d3b36d109	poslovni-sekretar	poslovni sekretar	t
00020000-56ab-1e91-43c1-4bad356e8a46	vodja-tehnike	vodja tehnike	t
00020000-56ab-1e91-2b5f-98c1ed63cba0	racunovodja	računovodja	t
00020000-56ab-1e92-373e-113bf5663eb8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56ab-1e92-6483-45c4efa8570a	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-5055-09e8e1a6588a	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-c4b2-5c1d60701fc5	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-6bbc-6debeac6db39	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-8d9b-530653ff458b	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-ae97-9a381fded201	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-e054-f66c2afab61d	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-6db3-2d0779962e27	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-7293-eb20655534e3	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-bbfe-439a4501a3af	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-38b4-5ea2f0c00e52	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-723b-205cdd085138	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-ec45-e3dd3ad38430	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-e801-c973f2c292a8	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-c772-6dab71bc120b	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-8505-48864fa65943	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-c9b1-eb646fb300a3	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-c84e-bcfa0bd5c1fc	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-e229-3ecf7e6a69a5	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56ab-1e92-b870-482dbea139ab	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-2413-da26cde0fabd	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-1895-3eaf2f324bef	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-b0a5-6d7ce9b15280	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-f102-017c124f10d1	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-d0d9-46e77314414d	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-f735-58545cff8bda	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-8915-88dcbdd99fd1	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-30b5-25f37cf61c62	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-d885-5ef40fefa7e5	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-c102-f27538869801	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-adf2-f0787f340d1c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-1215-9fecaa6f7e87	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-a0a0-8bae72925ba4	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-68c1-f3b2caf0f616	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-419a-20995f734e04	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-0643-c8f604d94b3a	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-2470-63a0a9a0d141	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-1e92-74d2-291f5d2918c2	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 41597100)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56ab-1e91-78a0-2fe691f5760f	00020000-56ab-1e90-d2a3-d65e11671135
00010000-56ab-1e91-54b4-eecb5421591a	00020000-56ab-1e90-d2a3-d65e11671135
00010000-56ab-1e92-bc57-026543fc7abc	00020000-56ab-1e92-373e-113bf5663eb8
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-6483-45c4efa8570a
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-8d9b-530653ff458b
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-7293-eb20655534e3
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-38b4-5ea2f0c00e52
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-ec45-e3dd3ad38430
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-c84e-bcfa0bd5c1fc
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-c4b2-5c1d60701fc5
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-b870-482dbea139ab
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-b0a5-6d7ce9b15280
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-d0d9-46e77314414d
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-8915-88dcbdd99fd1
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-d885-5ef40fefa7e5
00010000-56ab-1e92-e48d-f89254568d0b	00020000-56ab-1e92-a0a0-8bae72925ba4
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-6483-45c4efa8570a
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-5055-09e8e1a6588a
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-c4b2-5c1d60701fc5
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-6bbc-6debeac6db39
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-ec45-e3dd3ad38430
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-8505-48864fa65943
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-b870-482dbea139ab
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-b0a5-6d7ce9b15280
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-d0d9-46e77314414d
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-8915-88dcbdd99fd1
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-d885-5ef40fefa7e5
00010000-56ab-1e93-dc9b-efd4f3b26d4b	00020000-56ab-1e92-a0a0-8bae72925ba4
00010000-56ab-1e93-e9f9-5c61b04ef6b6	00020000-56ab-1e92-6483-45c4efa8570a
00010000-56ab-1e93-e9f9-5c61b04ef6b6	00020000-56ab-1e92-5055-09e8e1a6588a
00010000-56ab-1e93-e9f9-5c61b04ef6b6	00020000-56ab-1e92-c4b2-5c1d60701fc5
00010000-56ab-1e93-e9f9-5c61b04ef6b6	00020000-56ab-1e92-6bbc-6debeac6db39
00010000-56ab-1e93-e9f9-5c61b04ef6b6	00020000-56ab-1e92-38b4-5ea2f0c00e52
00010000-56ab-1e93-e9f9-5c61b04ef6b6	00020000-56ab-1e92-ec45-e3dd3ad38430
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-5055-09e8e1a6588a
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-ae97-9a381fded201
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-bbfe-439a4501a3af
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-723b-205cdd085138
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-38b4-5ea2f0c00e52
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-c9b1-eb646fb300a3
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-ec45-e3dd3ad38430
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-e801-c973f2c292a8
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-b870-482dbea139ab
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-2413-da26cde0fabd
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-b0a5-6d7ce9b15280
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-f102-017c124f10d1
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-d0d9-46e77314414d
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-f735-58545cff8bda
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-8915-88dcbdd99fd1
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-30b5-25f37cf61c62
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-d885-5ef40fefa7e5
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-c102-f27538869801
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-a0a0-8bae72925ba4
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-68c1-f3b2caf0f616
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-0643-c8f604d94b3a
00010000-56ab-1e93-fa50-db3461cdce81	00020000-56ab-1e92-2470-63a0a9a0d141
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-5055-09e8e1a6588a
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-ae97-9a381fded201
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-6db3-2d0779962e27
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-bbfe-439a4501a3af
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-723b-205cdd085138
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-38b4-5ea2f0c00e52
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-c9b1-eb646fb300a3
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-ec45-e3dd3ad38430
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-e801-c973f2c292a8
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-c772-6dab71bc120b
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-b870-482dbea139ab
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-2413-da26cde0fabd
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-1895-3eaf2f324bef
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-b0a5-6d7ce9b15280
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-f102-017c124f10d1
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-d0d9-46e77314414d
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-f735-58545cff8bda
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-8915-88dcbdd99fd1
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-30b5-25f37cf61c62
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-d885-5ef40fefa7e5
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-c102-f27538869801
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-a0a0-8bae72925ba4
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-68c1-f3b2caf0f616
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-419a-20995f734e04
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-0643-c8f604d94b3a
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-2470-63a0a9a0d141
00010000-56ab-1e93-e7f0-b587d872f1bb	00020000-56ab-1e92-74d2-291f5d2918c2
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-5055-09e8e1a6588a
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-c4b2-5c1d60701fc5
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-ae97-9a381fded201
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-e054-f66c2afab61d
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-6db3-2d0779962e27
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-8d9b-530653ff458b
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-bbfe-439a4501a3af
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-723b-205cdd085138
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-38b4-5ea2f0c00e52
00010000-56ab-1e93-7da1-cef07c2d980d	00020000-56ab-1e92-c9b1-eb646fb300a3
00010000-56ab-1e93-27b2-5834784d8bfe	00020000-56ab-1e92-6483-45c4efa8570a
00010000-56ab-1e93-27b2-5834784d8bfe	00020000-56ab-1e92-6bbc-6debeac6db39
00010000-56ab-1e93-27b2-5834784d8bfe	00020000-56ab-1e92-8d9b-530653ff458b
00010000-56ab-1e93-27b2-5834784d8bfe	00020000-56ab-1e92-7293-eb20655534e3
00010000-56ab-1e93-27b2-5834784d8bfe	00020000-56ab-1e92-38b4-5ea2f0c00e52
00010000-56ab-1e93-27b2-5834784d8bfe	00020000-56ab-1e92-ec45-e3dd3ad38430
00010000-56ab-1e93-27b2-5834784d8bfe	00020000-56ab-1e92-c84e-bcfa0bd5c1fc
00010000-56ab-1e93-27b2-5834784d8bfe	00020000-56ab-1e92-adf2-f0787f340d1c
00010000-56ab-1e93-8bb6-18465c823f82	00020000-56ab-1e92-e229-3ecf7e6a69a5
00010000-56ab-1e93-9423-609bf4375b5f	00020000-56ab-1e91-4851-19f3fb407691
00010000-56ab-1e93-88fa-271e5af18777	00020000-56ab-1e91-824c-28bc2bb2cf94
00010000-56ab-1e93-2430-4ce515e2b0da	00020000-56ab-1e91-d8aa-a5e2d40ff100
00010000-56ab-1e93-ce2e-20b3924961b5	00020000-56ab-1e91-6141-565d7a273f26
00010000-56ab-1e93-87f2-0d08152a121a	00020000-56ab-1e91-9e7a-b59d3b36d109
00010000-56ab-1e93-39a9-c0cec4f689b4	00020000-56ab-1e91-43c1-4bad356e8a46
00010000-56ab-1e93-1344-8bc23e273e09	00020000-56ab-1e91-2b5f-98c1ed63cba0
\.


--
-- TOC entry 3186 (class 0 OID 41597567)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 41597505)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 41597428)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56ab-1e92-bcb0-e14ca2db9536	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56ab-1e92-ae85-5e09f77e1afd	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56ab-1e92-e0c2-7608a6e40c9c	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56ab-1e92-82a4-929baf1bac6c	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 41597065)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56ab-1e90-4a78-1d57f5f2cc4a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56ab-1e90-f046-893e07cb5801	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56ab-1e90-9af6-d169a48e285d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56ab-1e90-7185-44f5502b2766	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56ab-1e90-0959-7f39e320b72f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 41597057)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56ab-1e90-70c8-99a0dedb9a64	00230000-56ab-1e90-7185-44f5502b2766	popa
00240000-56ab-1e90-daa2-ea8d02c5bc98	00230000-56ab-1e90-7185-44f5502b2766	oseba
00240000-56ab-1e90-a8c5-662436e1c395	00230000-56ab-1e90-7185-44f5502b2766	tippopa
00240000-56ab-1e90-b8fe-18e881cdf09a	00230000-56ab-1e90-7185-44f5502b2766	organizacijskaenota
00240000-56ab-1e90-bb9d-38e2c26e1e0c	00230000-56ab-1e90-7185-44f5502b2766	sezona
00240000-56ab-1e90-a310-25ddc413ceeb	00230000-56ab-1e90-7185-44f5502b2766	tipvaje
00240000-56ab-1e90-7e7b-38f7c871f5a4	00230000-56ab-1e90-7185-44f5502b2766	tipdodatka
00240000-56ab-1e90-6bee-76f42ecc2cce	00230000-56ab-1e90-f046-893e07cb5801	prostor
00240000-56ab-1e90-1c09-5a7672cdca6a	00230000-56ab-1e90-7185-44f5502b2766	besedilo
00240000-56ab-1e90-5ee8-ab48fe6e7ed6	00230000-56ab-1e90-7185-44f5502b2766	uprizoritev
00240000-56ab-1e90-1350-973b61f69861	00230000-56ab-1e90-7185-44f5502b2766	funkcija
00240000-56ab-1e90-173b-e1da0a8e44b5	00230000-56ab-1e90-7185-44f5502b2766	tipfunkcije
00240000-56ab-1e90-506a-44da2eaa30c3	00230000-56ab-1e90-7185-44f5502b2766	alternacija
00240000-56ab-1e90-9f31-997c6001e75f	00230000-56ab-1e90-4a78-1d57f5f2cc4a	pogodba
00240000-56ab-1e90-bc21-71c55017cb7d	00230000-56ab-1e90-7185-44f5502b2766	zaposlitev
00240000-56ab-1e90-a493-4c24237ed51d	00230000-56ab-1e90-7185-44f5502b2766	zvrstuprizoritve
00240000-56ab-1e90-0cb5-ccaaaa0ffe5c	00230000-56ab-1e90-4a78-1d57f5f2cc4a	programdela
00240000-56ab-1e90-29fa-eb21c29d39cf	00230000-56ab-1e90-7185-44f5502b2766	zapis
\.


--
-- TOC entry 3133 (class 0 OID 41597052)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5baad6e9-f5b0-4535-810a-ada98818c7b6	00240000-56ab-1e90-70c8-99a0dedb9a64	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 41597628)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56ab-1e93-5b79-1af0e6918568	000e0000-56ab-1e93-66a9-dd76d57e2762	00080000-56ab-1e92-871e-7be50751c20b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56ab-1e90-ff0f-b3091a1e86eb
00270000-56ab-1e93-b2ba-7d9b2836cfa6	000e0000-56ab-1e93-66a9-dd76d57e2762	00080000-56ab-1e92-871e-7be50751c20b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56ab-1e90-ff0f-b3091a1e86eb
\.


--
-- TOC entry 3149 (class 0 OID 41597201)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 41597447)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56ab-1e93-e5d2-57fb429d19b8	00180000-56ab-1e93-5665-45058e95b7b6	000c0000-56ab-1e93-805e-af86e3649104	00090000-56ab-1e93-2ace-8f58cfd0014e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-1e93-e8f2-4a890d78b6a0	00180000-56ab-1e93-5665-45058e95b7b6	000c0000-56ab-1e93-ca2e-ba1f03c493a1	00090000-56ab-1e93-fde7-bce0d8b4dae1	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-1e93-4d8d-28193ba34792	00180000-56ab-1e93-5665-45058e95b7b6	000c0000-56ab-1e93-0714-e47ec3f5e6ee	00090000-56ab-1e93-863d-21d837c82f69	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-1e93-8bd2-513e6030dfa8	00180000-56ab-1e93-5665-45058e95b7b6	000c0000-56ab-1e93-0a97-fa250581fec3	00090000-56ab-1e93-147a-042179252b08	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-1e93-f7cd-374f8ad893ba	00180000-56ab-1e93-5665-45058e95b7b6	000c0000-56ab-1e93-f4d6-7e7d1a0fc6cc	00090000-56ab-1e93-3ebd-6bedf6927604	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-1e93-be71-72fbda2cf18d	00180000-56ab-1e93-92ca-d926545345c3	\N	00090000-56ab-1e93-3ebd-6bedf6927604	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56ab-1e93-7a26-14f4b0497881	00180000-56ab-1e93-02d5-5f53e712f0f9	\N	00090000-56ab-1e93-fde7-bce0d8b4dae1	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56ab-1e93-7fdf-fbe22d0c8dbb	00180000-56ab-1e93-5665-45058e95b7b6	\N	00090000-56ab-1e93-46a4-6d8e682a5fca	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 41597464)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56ab-1e90-09cc-6376187e10fd	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56ab-1e90-d212-ccd45715f549	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56ab-1e90-0fb8-af8a5732096f	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56ab-1e90-006e-1f56da556e1d	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56ab-1e90-5d03-d37bb4c58412	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56ab-1e90-bfd9-4e30097cce4c	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 41597669)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56ab-1e90-487a-861c1ed842df	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56ab-1e90-4c9e-7e89206e7091	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56ab-1e90-9c25-7a1d7c5abf75	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56ab-1e90-7822-1ac8baae08bd	04	Režija	Režija	Režija	umetnik	30
000f0000-56ab-1e90-8003-1ac6dd32c0de	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56ab-1e90-f3cc-83dc4d6a9bf3	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56ab-1e90-261c-47fb391411cf	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56ab-1e90-20d9-e152a2b641aa	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56ab-1e90-1855-111574f905b8	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56ab-1e90-65a1-72a62bcab30a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56ab-1e90-8fff-6966f8c67a51	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56ab-1e90-4dcf-d08d3c007fd0	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56ab-1e90-e3c7-2fb8a55d284a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56ab-1e90-b759-8fa9d2b4b09c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56ab-1e90-7da5-ea0e5de0bf5f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56ab-1e90-83b5-ea4d3110ed84	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56ab-1e90-563f-201a3937f143	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56ab-1e90-503d-56c9fdf9bcff	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56ab-1e90-67d6-b491ffd4f0cf	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 41597152)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56ab-1e92-7345-806c4c991818	0001	šola	osnovna ali srednja šola
00400000-56ab-1e92-2afa-47c9b0c6ab18	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56ab-1e92-7f08-8a61a7fb58e0	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 41597973)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56ab-1e90-66d4-9356462e908d	01	Velika predstava	f	1.00	1.00
002b0000-56ab-1e90-5288-15e68237bf51	02	Mala predstava	f	0.50	0.50
002b0000-56ab-1e90-ef12-2092598bbf01	03	Mala koprodukcija	t	0.40	1.00
002b0000-56ab-1e90-5c61-6bb3bbce57f6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56ab-1e90-b8d1-da77bafbf878	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 41597418)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56ab-1e90-643e-cccb8f6eddcb	0001	prva vaja	prva vaja
00420000-56ab-1e90-aa83-25e0538a4759	0002	tehnična vaja	tehnična vaja
00420000-56ab-1e90-e288-2fd2a2e54059	0003	lučna vaja	lučna vaja
00420000-56ab-1e90-4c7a-62fa5619edbf	0004	kostumska vaja	kostumska vaja
00420000-56ab-1e90-2c77-582c22b7da21	0005	foto vaja	foto vaja
00420000-56ab-1e90-de89-8da016dfef49	0006	1. glavna vaja	1. glavna vaja
00420000-56ab-1e90-75aa-db019c74571a	0007	2. glavna vaja	2. glavna vaja
00420000-56ab-1e90-4ef3-d0e2eb41ce8f	0008	1. generalka	1. generalka
00420000-56ab-1e90-747d-af1fcc855b89	0009	2. generalka	2. generalka
00420000-56ab-1e90-228a-f7a992118d1f	0010	odprta generalka	odprta generalka
00420000-56ab-1e90-edaa-a657325b9713	0011	obnovitvena vaja	obnovitvena vaja
00420000-56ab-1e90-1d9e-126b70114cd4	0012	italijanka	krajša "obnovitvena" vaja
00420000-56ab-1e90-e48d-e3a6dee52697	0013	pevska vaja	pevska vaja
00420000-56ab-1e90-14c2-f6e6a3a15a8d	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56ab-1e90-df71-afe30b102405	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56ab-1e90-90a1-68620aba7425	0016	orientacijska vaja	orientacijska vaja
00420000-56ab-1e90-5066-18516ccb32a6	0017	situacijska vaja	situacijska vaja
00420000-56ab-1e90-0d74-247d1f7a498e	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 41597274)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 41597087)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56ab-1e91-54b4-eecb5421591a	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROCphgLRuMSvA78SUu5VZ7I3fyHSTsWni	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-8177-65899bb0a0f5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-1b03-3effb64dca38	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-1c4e-828f0cf6edd1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-3fd2-92e6076ea2b3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-d430-8887c4735ae8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-7210-613061e718b6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-eb24-b01113864ab7	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-3444-1caec6eea0b5	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-b53b-8b610bc911ec	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-bc57-026543fc7abc	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-00b6-4b55657e78a7	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56ab-1e92-e48d-f89254568d0b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-dc9b-efd4f3b26d4b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-e9f9-5c61b04ef6b6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-fa50-db3461cdce81	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-e7f0-b587d872f1bb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-7da1-cef07c2d980d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-27b2-5834784d8bfe	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-8bb6-18465c823f82	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-9423-609bf4375b5f	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-88fa-271e5af18777	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-2430-4ce515e2b0da	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-ce2e-20b3924961b5	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-87f2-0d08152a121a	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-39a9-c0cec4f689b4	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56ab-1e93-1344-8bc23e273e09	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56ab-1e91-78a0-2fe691f5760f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 41597719)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56ab-1e93-3714-8efa1be18f47	00160000-56ab-1e92-f9b8-e4e91dee8b9a	\N	00140000-56ab-1e90-2245-dfd45740e0bf	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56ab-1e92-7103-b00f36cd9106
000e0000-56ab-1e93-66a9-dd76d57e2762	00160000-56ab-1e92-1ba8-209569f6fabd	\N	00140000-56ab-1e90-daf3-8d656aee578b	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56ab-1e92-e167-4e96563376cd
000e0000-56ab-1e93-2544-8b579f69b775	\N	\N	00140000-56ab-1e90-daf3-8d656aee578b	00190000-56ab-1e93-e3fa-6f1322f2c7cf	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-1e92-7103-b00f36cd9106
000e0000-56ab-1e93-0dc1-f0f6d8f06b45	\N	\N	00140000-56ab-1e90-daf3-8d656aee578b	00190000-56ab-1e93-e3fa-6f1322f2c7cf	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-1e92-7103-b00f36cd9106
000e0000-56ab-1e93-b3ad-8d173a16f7e1	\N	\N	00140000-56ab-1e90-daf3-8d656aee578b	00190000-56ab-1e93-e3fa-6f1322f2c7cf	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-d30f-35189e1978a2	\N	\N	00140000-56ab-1e90-daf3-8d656aee578b	00190000-56ab-1e93-e3fa-6f1322f2c7cf	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-b5a9-f09ed1e2900f	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-a328-7b8b7fc65d37	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-6905-6232379ab510	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-69dd-1e32c1b3bff2	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-c22d-a091563c6706	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-bbbb-75831db466d5	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-e763-24bf49e4ce24	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-ec92-fbfe7f301936	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
000e0000-56ab-1e93-3656-41b34ce6622c	\N	\N	00140000-56ab-1e90-5d9f-b0478d0302d1	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-1e92-5711-45ba56863bef
\.


--
-- TOC entry 3170 (class 0 OID 41597438)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 41597367)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56ab-1e93-f49a-9e5b26ddbd01	\N	000e0000-56ab-1e93-3714-8efa1be18f47	1
00200000-56ab-1e93-374b-b124de1d1dbc	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	1
00200000-56ab-1e93-30d6-7e4aaacfbb31	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	3
00200000-56ab-1e93-ec42-603b169b393c	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	4
00200000-56ab-1e93-3f1f-0d41c67b830a	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	2
00200000-56ab-1e93-00d4-24dec0d4b825	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	8
00200000-56ab-1e93-f759-0c77db4d91ab	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	7
00200000-56ab-1e93-5d4d-32101c9475fc	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	9
00200000-56ab-1e93-a431-b31fff11eea5	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	6
00200000-56ab-1e93-f6ce-a4624b11fafa	\N	000e0000-56ab-1e93-66a9-dd76d57e2762	5
\.


--
-- TOC entry 3182 (class 0 OID 41597531)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 41597642)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56ab-1e90-9de7-e407494828c1	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56ab-1e90-a41f-4b7785f4e880	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56ab-1e90-1f80-bd60fdcfad10	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56ab-1e90-55bd-36fad7b18db9	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56ab-1e90-efd4-5bc495d04bb4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56ab-1e90-e347-1bb0477d5c44	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56ab-1e90-5aa3-a6cd201fa23f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56ab-1e90-c4c5-6f1589b7d282	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56ab-1e90-ff0f-b3091a1e86eb	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56ab-1e90-c613-4b40a4331f00	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56ab-1e90-88b6-28dce169f9dd	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56ab-1e90-e587-93688d7fcd52	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56ab-1e90-0db8-f16e473fca2d	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56ab-1e90-35ee-c383402ab061	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56ab-1e90-9034-07596d6f6a53	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56ab-1e90-b9af-e5d8d1db93e2	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56ab-1e90-d601-fe03ba8789e1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56ab-1e90-c027-6ab6eafffdab	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56ab-1e90-2674-6f9e21523d75	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56ab-1e90-3d3d-2f2d03484468	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56ab-1e90-a07a-ffbfe0d557d0	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56ab-1e90-257c-f75e137b8432	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56ab-1e90-8a35-14bd7aeb3369	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56ab-1e90-d7de-7f2039285e8b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56ab-1e90-1d72-abf90809ed3e	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56ab-1e90-0b19-bb5cf2184df1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56ab-1e90-1ad8-841e326bd3c8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56ab-1e90-d3b3-f201659f7205	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 41598023)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 41597992)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 41598035)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 41597604)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56ab-1e93-8cc5-11275f260023	00090000-56ab-1e93-fde7-bce0d8b4dae1	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-1e93-5e6f-8e997020d2e8	00090000-56ab-1e93-863d-21d837c82f69	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-1e93-ce18-4c8ca2c5d83f	00090000-56ab-1e93-94b9-9ba5611dee90	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-1e93-283e-3947e70457fa	00090000-56ab-1e93-9686-a5f6e358d3fb	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-1e93-66ac-b53529686f92	00090000-56ab-1e93-a0ed-6e85b1bc036a	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-1e93-0de8-6ec2efff2ca0	00090000-56ab-1e93-35fa-f3301d54282b	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 41597709)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56ab-1e90-2245-dfd45740e0bf	01	Drama	drama (SURS 01)
00140000-56ab-1e90-081d-b6118bbafcf2	02	Opera	opera (SURS 02)
00140000-56ab-1e90-7b49-ecb8ce71adb8	03	Balet	balet (SURS 03)
00140000-56ab-1e90-0c8b-73ba9e2289aa	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56ab-1e90-5d9f-b0478d0302d1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56ab-1e90-daf3-8d656aee578b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56ab-1e90-af8e-b478f00a51d3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 41597594)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 41597151)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 41597767)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 41597758)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 41597141)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 41597625)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 41597667)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 41598076)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 41597461)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 41597396)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 41597412)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 41597417)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 41597990)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 41597300)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 41597836)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 41597590)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 41597365)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 41597338)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 41597314)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 41597497)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 41598053)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 41598060)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 41598084)
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
-- TOC entry 2766 (class 2606 OID 41597523)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 41597272)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 41597170)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 41597234)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 41597197)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 41597130)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 41597115)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 41597529)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 41597566)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 41597704)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 41597225)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 41597260)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 41597941)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 41597503)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 41597250)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 41597381)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 41597353)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 41597347)
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
-- TOC entry 2764 (class 2606 OID 41597515)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 41597950)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 41597958)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 41597928)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 41597971)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 41597548)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 41597488)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 41597479)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 41597691)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 41597618)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 41597326)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 41597086)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 41597557)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 41597104)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 41597124)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 41597575)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 41597510)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 41597436)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 41597074)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 41597062)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 41597056)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 41597638)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 41597206)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 41597453)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 41597471)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 41597678)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 41597159)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 41597983)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 41597425)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 41597285)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 41597099)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 41597737)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 41597444)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 41597371)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 41597537)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 41597650)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 41598033)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 41598017)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 41598041)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 41597608)
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
-- TOC entry 2833 (class 2606 OID 41597717)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 41597602)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 41597406)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 41597407)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 41597405)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 41597403)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 41597404)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 41597402)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 41597639)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 41597640)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 41597641)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 41598055)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 41598054)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 41597227)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 41597228)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 41597530)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 41598021)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 41598020)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 41598022)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 41598019)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 41598018)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 41597516)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 41597372)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 41597373)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 41597591)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 41597593)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 41597592)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 41597316)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 41597315)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 41597972)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 41597706)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 41597707)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 41597708)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 41598042)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 41597742)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 41597739)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 41597743)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 41597741)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 41597740)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 41597287)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 41597286)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 41597200)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 41597558)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 41597131)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 41597132)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 41597578)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 41597577)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 41597576)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 41597237)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 41597236)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 41597238)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 41597348)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 41597064)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 41597483)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 41597481)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 41597480)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 41597482)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 41597105)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 41597106)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 41597538)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 41598077)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 41597627)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 41597626)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 41598085)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 41598086)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 41597504)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 41597619)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 41597620)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 41597841)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 41597840)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 41597837)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 41597838)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 41597839)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 41597252)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 41597251)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 41597253)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 41597552)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 41597551)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 41597951)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 41597952)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 41597771)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 41597772)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 41597769)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 41597770)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 41597462)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 41597463)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 41597609)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 41597610)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 41597445)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 41597492)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 41597491)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 41597489)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 41597490)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 41597759)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 41597327)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 41597341)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 41597340)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 41597339)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 41597342)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 41597366)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 41597354)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 41597355)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 41597942)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 41597991)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 41598061)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 41598062)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 41597172)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 41597171)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 41597207)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 41597208)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 41597456)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 41597455)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 41597454)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 41597398)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 41597401)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 41597397)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 41597400)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 41597399)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 41597226)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 41597160)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 41597161)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 41597301)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 41597303)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 41597302)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 41597304)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 41597498)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 41597705)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 41597738)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 41597679)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 41597680)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 41597198)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 41597199)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 41597472)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 41597473)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 41597603)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 41597075)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 41597273)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 41597235)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 41597063)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 41597984)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 41597550)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 41597549)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 41597426)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 41597427)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 41597768)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 41597446)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 41597261)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 41597718)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 41598034)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 41597959)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 41597960)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 41597668)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 41597437)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 41597125)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 41598247)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 41598272)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 41598262)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 41598242)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 41598277)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 41598257)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 41598267)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 41598252)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 41598457)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 41598462)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 41598467)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 41598627)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 41598622)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 41598142)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 41598147)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 41598372)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 41598607)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 41598602)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 41598612)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 41598597)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 41598592)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 41598367)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 41598232)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 41598237)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 41598412)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 41598422)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 41598417)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 41598197)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 41598192)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 41598357)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 41598582)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 41598472)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 41598477)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 41598482)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 41598617)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 41598502)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 41598487)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 41598507)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 41598497)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 41598492)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 41598187)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 41598182)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 41598127)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 41598122)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 41598392)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 41598102)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 41598107)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 41598407)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 41598402)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 41598397)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 41598157)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 41598152)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 41598162)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 41598212)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 41598087)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 41598332)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 41598322)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 41598317)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 41598327)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 41598092)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 41598097)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 41598377)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 41598642)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 41598452)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 41598447)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 41598647)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 41598652)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 41598362)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 41598437)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 41598442)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 41598557)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 41598552)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 41598537)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 41598542)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 41598547)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 41598172)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 41598167)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 41598177)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 41598387)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 41598382)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 41598567)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 41598572)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 41598527)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 41598532)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 41598517)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 41598522)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 41598307)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 41598312)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 41598427)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 41598432)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 41598282)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 41598287)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 41598352)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 41598347)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 41598337)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 41598342)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 41598512)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 41598202)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 41598207)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 41598227)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 41598217)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 41598222)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 41598562)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 41598577)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 41598587)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 41598632)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 41598637)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 41598117)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 41598112)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 41598132)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 41598137)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 41598302)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 41598297)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 41598292)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-29 09:11:03 CET

--
-- PostgreSQL database dump complete
--

