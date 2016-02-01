--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-01 08:31:05 CET

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
-- TOC entry 185 (class 1259 OID 42129196)
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
-- TOC entry 241 (class 1259 OID 42129814)
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
-- TOC entry 240 (class 1259 OID 42129798)
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
-- TOC entry 184 (class 1259 OID 42129189)
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
-- TOC entry 183 (class 1259 OID 42129187)
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
-- TOC entry 231 (class 1259 OID 42129675)
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
-- TOC entry 234 (class 1259 OID 42129705)
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
-- TOC entry 255 (class 1259 OID 42130117)
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
-- TOC entry 212 (class 1259 OID 42129511)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 42129436)
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
-- TOC entry 206 (class 1259 OID 42129462)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 42129467)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 42130039)
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
-- TOC entry 196 (class 1259 OID 42129342)
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
-- TOC entry 242 (class 1259 OID 42129827)
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
-- TOC entry 227 (class 1259 OID 42129633)
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
-- TOC entry 202 (class 1259 OID 42129410)
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
-- TOC entry 199 (class 1259 OID 42129382)
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
-- TOC entry 197 (class 1259 OID 42129359)
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
-- TOC entry 216 (class 1259 OID 42129547)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 42130097)
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
-- TOC entry 254 (class 1259 OID 42130110)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 42130132)
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
-- TOC entry 220 (class 1259 OID 42129571)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 42129316)
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
-- TOC entry 187 (class 1259 OID 42129216)
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
-- TOC entry 191 (class 1259 OID 42129283)
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
-- TOC entry 188 (class 1259 OID 42129227)
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
-- TOC entry 180 (class 1259 OID 42129161)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 42129180)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 42129578)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 42129613)
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
-- TOC entry 237 (class 1259 OID 42129746)
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
-- TOC entry 190 (class 1259 OID 42129263)
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
-- TOC entry 193 (class 1259 OID 42129308)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 42129983)
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
-- TOC entry 217 (class 1259 OID 42129553)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 42129293)
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
-- TOC entry 204 (class 1259 OID 42129428)
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
-- TOC entry 200 (class 1259 OID 42129397)
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
-- TOC entry 201 (class 1259 OID 42129403)
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
-- TOC entry 219 (class 1259 OID 42129565)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 42129997)
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
-- TOC entry 246 (class 1259 OID 42130007)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 42129896)
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
-- TOC entry 247 (class 1259 OID 42130015)
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
-- TOC entry 223 (class 1259 OID 42129593)
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
-- TOC entry 215 (class 1259 OID 42129538)
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
-- TOC entry 214 (class 1259 OID 42129528)
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
-- TOC entry 236 (class 1259 OID 42129735)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 42129665)
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
-- TOC entry 198 (class 1259 OID 42129371)
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
-- TOC entry 177 (class 1259 OID 42129132)
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
-- TOC entry 176 (class 1259 OID 42129130)
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
-- TOC entry 224 (class 1259 OID 42129607)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 42129170)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 42129154)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 42129621)
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
-- TOC entry 218 (class 1259 OID 42129559)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 42129482)
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
-- TOC entry 175 (class 1259 OID 42129119)
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
-- TOC entry 174 (class 1259 OID 42129111)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 42129106)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 42129682)
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
-- TOC entry 189 (class 1259 OID 42129255)
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
-- TOC entry 211 (class 1259 OID 42129501)
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
-- TOC entry 213 (class 1259 OID 42129518)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 42129723)
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
-- TOC entry 186 (class 1259 OID 42129206)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 42130027)
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
-- TOC entry 208 (class 1259 OID 42129472)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 42129328)
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
-- TOC entry 178 (class 1259 OID 42129141)
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
-- TOC entry 239 (class 1259 OID 42129773)
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
-- TOC entry 210 (class 1259 OID 42129492)
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
-- TOC entry 203 (class 1259 OID 42129421)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 42129585)
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
-- TOC entry 233 (class 1259 OID 42129696)
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
-- TOC entry 251 (class 1259 OID 42130077)
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
-- TOC entry 250 (class 1259 OID 42130046)
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
-- TOC entry 252 (class 1259 OID 42130089)
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
-- TOC entry 229 (class 1259 OID 42129658)
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
-- TOC entry 238 (class 1259 OID 42129763)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 42129648)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 42129192)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 42129135)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 42129196)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56af-09b5-fcc2-3d034521139b	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56af-09b5-00f2-0d74b9f8d7c3	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56af-09b5-f9a8-021f0338fe61	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 42129814)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56af-09b6-e893-a15a99e53ecd	000d0000-56af-09b5-bd48-a412706e4d76	\N	00090000-56af-09b5-fb4a-1e563e74e141	000b0000-56af-09b5-fd60-73adfc30c369	0001	f	\N	\N	\N	3	t	t	t
000c0000-56af-09b6-ee34-5e6d67076201	000d0000-56af-09b5-e478-4ae20e0809d2	00100000-56af-09b5-25e8-8b1e933e4f7c	00090000-56af-09b5-ec7a-78380a6970cf	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56af-09b6-722d-18634cd6cdb7	000d0000-56af-09b5-298e-7cb601b5156a	00100000-56af-09b5-c5a0-5bcc8548791b	00090000-56af-09b5-1676-ae3a56d79f3f	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56af-09b6-a061-671a10f3decb	000d0000-56af-09b5-eb86-204d5f70e4a6	\N	00090000-56af-09b5-81b7-4203a6ced475	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56af-09b6-b3dd-7be7d26ce624	000d0000-56af-09b5-625e-6e765fe2482b	\N	00090000-56af-09b5-5cd7-34a324b56b2f	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56af-09b6-d834-b629e2fbd952	000d0000-56af-09b5-dadc-5558e014e243	\N	00090000-56af-09b5-6e57-54bddc175ad7	000b0000-56af-09b5-f288-27b9c94ff7a9	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56af-09b6-4942-d02f960a40f9	000d0000-56af-09b5-9387-251a6f3cf0ed	00100000-56af-09b5-013d-f7cc78dcdd35	00090000-56af-09b5-04c9-49be549e8225	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56af-09b6-936a-a3321956bffa	000d0000-56af-09b5-a1ad-e21e54abea4e	\N	00090000-56af-09b5-3baf-dd252b0524d9	000b0000-56af-09b5-d40a-4f8d459e4665	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56af-09b6-2ebe-2770e95984e7	000d0000-56af-09b5-9387-251a6f3cf0ed	00100000-56af-09b5-b90e-e6a20d1b1960	00090000-56af-09b5-df89-5415a1d4e0e0	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56af-09b6-6980-3978d2cf99cc	000d0000-56af-09b5-9387-251a6f3cf0ed	00100000-56af-09b5-ec48-0c36cea26fcf	00090000-56af-09b5-ec88-0e291f821c78	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56af-09b6-6fd7-d6f42dacd94b	000d0000-56af-09b5-9387-251a6f3cf0ed	00100000-56af-09b5-2d75-631ea0332f1e	00090000-56af-09b5-b5d2-44d288c07976	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56af-09b6-9801-271807a527fb	000d0000-56af-09b5-ea35-b32708c807ca	00100000-56af-09b5-25e8-8b1e933e4f7c	00090000-56af-09b5-ec7a-78380a6970cf	000b0000-56af-09b5-4bc4-131013f8c74f	0012	t	\N	\N	\N	2	t	t	t
000c0000-56af-09b6-1e4d-681200e73df8	000d0000-56af-09b5-b106-fa3d7eac6b41	\N	00090000-56af-09b5-3baf-dd252b0524d9	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-1930-2c30ef779a6e	000d0000-56af-09b5-b106-fa3d7eac6b41	\N	00090000-56af-09b5-57b5-2112a0cb131c	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56af-09b6-1920-1b5f2771a81a	000d0000-56af-09b5-f46d-c12ca09ae955	00100000-56af-09b5-c5a0-5bcc8548791b	00090000-56af-09b5-1676-ae3a56d79f3f	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-b4db-06d2053e6c17	000d0000-56af-09b5-f46d-c12ca09ae955	\N	00090000-56af-09b5-57b5-2112a0cb131c	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56af-09b6-ed28-d2d73fbce204	000d0000-56af-09b5-9157-6da0e66f0a73	\N	00090000-56af-09b5-57b5-2112a0cb131c	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-12b7-8af53db39722	000d0000-56af-09b5-9157-6da0e66f0a73	\N	00090000-56af-09b5-3baf-dd252b0524d9	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56af-09b6-bc5e-4f7649c867da	000d0000-56af-09b5-dceb-d03e0c07b2ca	00100000-56af-09b5-013d-f7cc78dcdd35	00090000-56af-09b5-04c9-49be549e8225	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-96f2-fdfa217ab16b	000d0000-56af-09b5-dceb-d03e0c07b2ca	\N	00090000-56af-09b5-57b5-2112a0cb131c	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56af-09b6-04d2-a3d895f64e34	000d0000-56af-09b5-a469-eb15088d71fe	\N	00090000-56af-09b5-57b5-2112a0cb131c	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-2952-673a963539a0	000d0000-56af-09b5-a469-eb15088d71fe	00100000-56af-09b5-013d-f7cc78dcdd35	00090000-56af-09b5-04c9-49be549e8225	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56af-09b6-1e83-d0a7dd293255	000d0000-56af-09b5-e853-ac498add3a14	\N	00090000-56af-09b5-57b5-2112a0cb131c	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-d4c3-69ec310155b9	000d0000-56af-09b5-2415-7b784eacb368	\N	00090000-56af-09b5-3baf-dd252b0524d9	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-d3f7-621915021f14	000d0000-56af-09b5-159f-92d2b38b1f7b	\N	00090000-56af-09b5-3baf-dd252b0524d9	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-a76b-4315787ba327	000d0000-56af-09b5-159f-92d2b38b1f7b	00100000-56af-09b5-c5a0-5bcc8548791b	00090000-56af-09b5-1676-ae3a56d79f3f	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56af-09b6-81bc-410dc52d8352	000d0000-56af-09b5-af9c-8aff014c4e08	\N	00090000-56af-09b5-2a92-40f729f43be0	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56af-09b6-1043-ef2ee6cb0d0b	000d0000-56af-09b5-af9c-8aff014c4e08	\N	00090000-56af-09b5-8f73-25076a0ceb71	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56af-09b6-94ef-f10dc92fa181	000d0000-56af-09b6-7b48-13cfc8839a3f	\N	00090000-56af-09b5-3baf-dd252b0524d9	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56af-09b6-db9c-4cd5d2cf6e28	000d0000-56af-09b6-7b48-13cfc8839a3f	00100000-56af-09b5-c5a0-5bcc8548791b	00090000-56af-09b5-1676-ae3a56d79f3f	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56af-09b6-26ba-b695b3b7aed5	000d0000-56af-09b6-7b48-13cfc8839a3f	\N	00090000-56af-09b5-8f73-25076a0ceb71	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56af-09b6-660f-8c4c8ed7fb4e	000d0000-56af-09b6-7b48-13cfc8839a3f	\N	00090000-56af-09b5-2a92-40f729f43be0	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56af-09b6-f631-edbbf00bbbbe	000d0000-56af-09b6-b0a2-c9449744cc5a	\N	00090000-56af-09b5-3baf-dd252b0524d9	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56af-09b6-1dba-0891cda3a517	000d0000-56af-09b6-80e9-c03215319b28	00100000-56af-09b5-c5a0-5bcc8548791b	00090000-56af-09b5-1676-ae3a56d79f3f	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56af-09b6-3931-ff3935970849	000d0000-56af-09b6-80e9-c03215319b28	\N	00090000-56af-09b5-57b5-2112a0cb131c	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 42129798)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 42129189)
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
-- TOC entry 3191 (class 0 OID 42129675)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56af-09b5-ca9d-f115c0404d9e	00160000-56af-09b5-258f-c25d085835b6	00090000-56af-09b5-8f73-25076a0ceb71	aizv	10	t
003d0000-56af-09b5-e2c2-86b1eb8acf77	00160000-56af-09b5-258f-c25d085835b6	00090000-56af-09b5-f081-7a53be3423a8	apri	14	t
003d0000-56af-09b5-e303-fc212b8a5fbb	00160000-56af-09b5-b8d6-a76aa9ec28c3	00090000-56af-09b5-2a92-40f729f43be0	aizv	11	t
003d0000-56af-09b5-155b-14350b09f39b	00160000-56af-09b5-5b82-200a156e0b9e	00090000-56af-09b5-7476-32a64523bbe5	aizv	12	t
003d0000-56af-09b5-fd00-8fc1eb87768a	00160000-56af-09b5-258f-c25d085835b6	00090000-56af-09b5-57b5-2112a0cb131c	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 42129705)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56af-09b5-258f-c25d085835b6	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56af-09b5-b8d6-a76aa9ec28c3	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56af-09b5-5b82-200a156e0b9e	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 42130117)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 42129511)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 42129436)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56af-09b5-be9b-2201aee2cb08	\N	\N	\N	\N	00440000-56af-09b5-5179-87b1b8f5d962	00220000-56af-09b5-3613-f5b7c765bd4c	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56af-09b5-044e-c6306555f31c	\N	\N	\N	\N	00440000-56af-09b5-889a-d62786d60af5	00220000-56af-09b5-dc1c-e867af926ac6	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56af-09b5-8b49-31c65ccf107e	\N	\N	\N	001e0000-56af-09b5-f35a-97a189845d5c	\N	00220000-56af-09b5-3613-f5b7c765bd4c	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56af-09b5-feb4-4685f9843a6a	\N	\N	\N	001e0000-56af-09b5-cba4-b024231405d9	\N	00220000-56af-09b5-dc1c-e867af926ac6	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56af-09b6-dfb9-6e5a523eb30a	\N	00200000-56af-09b6-2d2a-23fac4b81291	\N	\N	\N	00220000-56af-09b5-7554-1d3ea30025e9	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56af-09b6-3bc2-77ddb422f4bc	\N	00200000-56af-09b6-7c32-dffc3b30ec7b	\N	\N	\N	00220000-56af-09b5-7554-1d3ea30025e9	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56af-09b6-adc3-6636f4089473	\N	00200000-56af-09b6-c366-9922405b53cd	\N	\N	\N	00220000-56af-09b5-dc1c-e867af926ac6	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56af-09b6-a544-47113612bf5a	\N	00200000-56af-09b6-661c-09b7907bf6be	\N	\N	\N	00220000-56af-09b5-9d45-680f3957ae9f	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56af-09b6-0de1-750f61acc4c8	\N	00200000-56af-09b6-7c18-5290b14447fb	\N	\N	\N	00220000-56af-09b5-ae66-35bf323489bc	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56af-09b6-8c25-91ddb4f9fdef	\N	00200000-56af-09b6-0bc1-3e72b6833675	\N	\N	\N	00220000-56af-09b5-dc1c-e867af926ac6	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56af-09b6-8b37-3f5c30d94748	\N	00200000-56af-09b6-4443-516f83cafcd2	\N	\N	\N	00220000-56af-09b5-ae66-35bf323489bc	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56af-09b6-b627-a93fb78d35f4	\N	00200000-56af-09b6-70fb-2c471475b36b	\N	\N	\N	00220000-56af-09b5-ae66-35bf323489bc	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56af-09b6-9b07-260b72dfc930	\N	00200000-56af-09b6-1807-fc0516445885	\N	\N	\N	00220000-56af-09b5-7554-1d3ea30025e9	001f0000-56af-09b5-8e43-38deb266c181	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56af-09b6-bf4a-d3486e27ad6e	\N	00200000-56af-09b6-4e3a-247ee5f2bf86	\N	\N	\N	00220000-56af-09b5-7554-1d3ea30025e9	001f0000-56af-09b5-8e43-38deb266c181	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56af-09b6-a1b9-00b71541265c	\N	\N	001c0000-56af-09b6-79ac-e39f20038312	\N	\N	\N	001f0000-56af-09b5-ff7f-6316819597a7	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56af-09b6-4dd8-d83009f551b8	001b0000-56af-09b6-b97d-c4ff2e0ea698	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-8e43-38deb266c181	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56af-09b6-494b-a606337b21af	001b0000-56af-09b6-be54-3ed383b1e118	\N	\N	\N	\N	00220000-56af-09b5-dc1c-e867af926ac6	001f0000-56af-09b5-8e43-38deb266c181	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56af-09b6-2723-44e33f77c75b	001b0000-56af-09b6-2615-a5bce97eb586	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-8e43-38deb266c181	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56af-09b6-f76c-f9f930e8524f	001b0000-56af-09b6-8253-d27c64e6ff11	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56af-09b6-6722-9f8088d3dc1e	001b0000-56af-09b6-e617-1fe00c2efad6	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-ff7f-6316819597a7	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56af-09b6-bea1-d6491539b198	001b0000-56af-09b6-750e-a97a499f2f7d	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-ff7f-6316819597a7	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56af-09b6-b30d-c11edffde022	001b0000-56af-09b6-f27d-68e8fb9c12fe	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-8e43-38deb266c181	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56af-09b6-5171-aae7241d587f	001b0000-56af-09b6-8db8-892ed988f4d3	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-ff7f-6316819597a7	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56af-09b6-9130-9fc74a21b9ed	001b0000-56af-09b6-b801-38db9a9fbc8e	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56af-09b6-2a7d-dba7da53f415	001b0000-56af-09b6-b2fc-ab68d586255b	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56af-09b6-e4f6-c0c6c52b52d5	001b0000-56af-09b6-7753-5e5f55d26937	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-ff7f-6316819597a7	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56af-09b6-b343-b9aecc8523fb	001b0000-56af-09b6-343c-298db0e7b7df	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-fe90-a84b2a58fa58	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56af-09b6-db7a-cce336cfc467	001b0000-56af-09b6-9622-2611bad03b90	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-fe90-a84b2a58fa58	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56af-09b6-94de-58345c750933	001b0000-56af-09b6-4aac-7ad8798ad4b7	\N	\N	\N	\N	00220000-56af-09b5-3613-f5b7c765bd4c	001f0000-56af-09b5-ff7f-6316819597a7	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56af-09b6-2428-c4161ce5125b	001b0000-56af-09b6-c7cc-adbbf72c5c0d	\N	\N	\N	\N	\N	001f0000-56af-09b5-ff7f-6316819597a7	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56af-09b6-79ac-e39f20038312
00180000-56af-09b6-3606-952a5befbc24	001b0000-56af-09b6-841a-560afb17fa1b	\N	\N	\N	\N	\N	001f0000-56af-09b5-ff7f-6316819597a7	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56af-09b6-79ac-e39f20038312
\.


--
-- TOC entry 3166 (class 0 OID 42129462)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56af-09b5-f35a-97a189845d5c
001e0000-56af-09b5-cba4-b024231405d9
\.


--
-- TOC entry 3167 (class 0 OID 42129467)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56af-09b5-5179-87b1b8f5d962
00440000-56af-09b5-889a-d62786d60af5
\.


--
-- TOC entry 3209 (class 0 OID 42130039)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 42129342)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56af-09b2-949c-840940d46b3b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56af-09b2-c4d8-22fa642db85e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56af-09b2-3a06-0b7ca7bcb151	AL	ALB	008	Albania 	Albanija	\N
00040000-56af-09b2-82a6-588c4fda2fb4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56af-09b2-4e0a-e2700f21bfea	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56af-09b2-42f4-29b6c18f3fdf	AD	AND	020	Andorra 	Andora	\N
00040000-56af-09b2-c1a6-c8a1c4340cff	AO	AGO	024	Angola 	Angola	\N
00040000-56af-09b2-f314-f2e345ce6c9c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56af-09b2-6966-35cb1509988d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56af-09b2-a8f0-fc4a7ee338b3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-09b2-b424-f87ab2e19703	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56af-09b2-e133-c768042fec97	AM	ARM	051	Armenia 	Armenija	\N
00040000-56af-09b2-4e4b-73805b91a083	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56af-09b2-c0bf-1ba25c15bb79	AU	AUS	036	Australia 	Avstralija	\N
00040000-56af-09b2-7763-a4f1d410d58d	AT	AUT	040	Austria 	Avstrija	\N
00040000-56af-09b2-6f56-c9b127fef80c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56af-09b2-f0e7-25a74b9239c1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56af-09b2-8c42-07448c322043	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56af-09b2-2508-dfb6f8ccd5dc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56af-09b2-c630-fe7ac297c639	BB	BRB	052	Barbados 	Barbados	\N
00040000-56af-09b2-de27-1b5e7934402c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56af-09b2-c0b5-cc5a55c1bcbc	BE	BEL	056	Belgium 	Belgija	\N
00040000-56af-09b2-72b5-7b387ce84ee5	BZ	BLZ	084	Belize 	Belize	\N
00040000-56af-09b2-c14d-39a86b9d9f3f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56af-09b2-f47e-8f2ba3b2dc59	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56af-09b2-2e2e-2d0ab9a23b72	BT	BTN	064	Bhutan 	Butan	\N
00040000-56af-09b2-280f-1e142bebe9cf	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56af-09b2-91ec-3ab7c9d57a56	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56af-09b2-25a7-cf06e7a4b84c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56af-09b2-2a90-239de754ff73	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56af-09b2-41d7-01621465d10a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56af-09b2-22c8-25deb7b47b6d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56af-09b2-722f-f9a50d52ee05	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56af-09b2-b74e-5e0fb9fdfe97	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56af-09b2-e0b8-de0ff64c4057	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56af-09b2-68ed-9cb07b269b57	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56af-09b2-7bb9-05ad622c81b5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56af-09b2-ca3d-beb4f35e0864	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56af-09b2-16af-d2b5332fde77	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56af-09b2-af91-17e0fcd736c2	CA	CAN	124	Canada 	Kanada	\N
00040000-56af-09b2-20dc-c1fb73c33140	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56af-09b2-d640-486d5a26701e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56af-09b2-29d6-4183a6b7ba9f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56af-09b2-1dbd-b1ea9e945b35	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56af-09b2-25da-a699945b0a11	CL	CHL	152	Chile 	Čile	\N
00040000-56af-09b2-7fbc-f58c6ed06bc2	CN	CHN	156	China 	Kitajska	\N
00040000-56af-09b2-ebd1-67e47d72145d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56af-09b2-ceb6-ce2116285e05	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56af-09b2-46f3-e8c31723ce14	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56af-09b2-b15a-6a982563d346	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56af-09b2-eaa5-c1ba7b9c2503	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56af-09b2-2c5b-d7c126511d5b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56af-09b2-68e7-3b0cfcf7a9af	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56af-09b2-8e0e-2b483cdbb535	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56af-09b2-7050-157c73bf2747	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56af-09b2-1324-76a89d72e35f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56af-09b2-c3b2-e3c586b31afe	CU	CUB	192	Cuba 	Kuba	\N
00040000-56af-09b2-d3ad-c0f96acead3f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56af-09b2-f16b-07e6798eaba7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56af-09b2-66b3-f82fd92bea1e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56af-09b2-77ac-3cc6dea5c846	DK	DNK	208	Denmark 	Danska	\N
00040000-56af-09b2-87a5-c6322e656e2e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56af-09b2-12db-83c83b672151	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-09b2-ac67-9de5e1d205c2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56af-09b2-8360-99007f51f302	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56af-09b2-5443-d1a496ab9542	EG	EGY	818	Egypt 	Egipt	\N
00040000-56af-09b2-6a7d-5ce37055e6bd	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56af-09b2-32be-204eeedc6ae1	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56af-09b2-2357-715974bb039e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56af-09b2-3827-ec8ef602543b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56af-09b2-50cb-de7634367611	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56af-09b2-6d70-1674f435e4be	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56af-09b2-6bcd-ac64a76eb9f4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56af-09b2-66fa-921f932ad5cf	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56af-09b2-d32e-97efc83e1d0a	FI	FIN	246	Finland 	Finska	\N
00040000-56af-09b2-c82c-d70312c1f090	FR	FRA	250	France 	Francija	\N
00040000-56af-09b2-77d1-01b2cb713a5b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56af-09b2-f6c5-20f153748d1a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56af-09b2-c6f7-61e9264d8b35	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56af-09b2-1b19-684c76f9c9d1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56af-09b2-9dc3-19fc0882546c	GA	GAB	266	Gabon 	Gabon	\N
00040000-56af-09b2-67cd-0312b5082246	GM	GMB	270	Gambia 	Gambija	\N
00040000-56af-09b2-8a5a-df261b0edb1f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56af-09b2-5662-5a8d5ca12b06	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56af-09b2-6617-0b09cb9d2357	GH	GHA	288	Ghana 	Gana	\N
00040000-56af-09b2-8e00-7cf58741606b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56af-09b2-673d-424b576590af	GR	GRC	300	Greece 	Grčija	\N
00040000-56af-09b2-cd64-7434086c0453	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56af-09b2-1c71-3473859dffa5	GD	GRD	308	Grenada 	Grenada	\N
00040000-56af-09b2-294c-aa59d740e27a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56af-09b2-8a74-25643ec21419	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56af-09b2-aeaa-9d5bf9069582	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56af-09b2-689a-b484c06fc5c0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56af-09b2-2d72-3a4bf20f5562	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56af-09b2-616c-0f05b6351b79	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56af-09b2-ace1-77a44b565221	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56af-09b2-f00a-cf126cace8f3	HT	HTI	332	Haiti 	Haiti	\N
00040000-56af-09b2-9776-6c756e9dc3b1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56af-09b2-7051-ab890e4b585f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56af-09b2-ee9f-abd61aed4e7c	HN	HND	340	Honduras 	Honduras	\N
00040000-56af-09b2-2594-6f5f4288d979	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56af-09b2-86d0-5cb35dc86a1a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56af-09b2-0064-dd8f476cfd29	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56af-09b2-d85b-d588cdbf1ebe	IN	IND	356	India 	Indija	\N
00040000-56af-09b2-b059-401fcb561e5e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56af-09b2-485b-d6dbbf8ae121	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56af-09b2-d34e-8d71dabe6cb6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56af-09b2-2c43-7338f965a28b	IE	IRL	372	Ireland 	Irska	\N
00040000-56af-09b2-a6cf-d877f6509d1f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56af-09b2-d34e-5ff910b33360	IL	ISR	376	Israel 	Izrael	\N
00040000-56af-09b2-167c-3df17a47cece	IT	ITA	380	Italy 	Italija	\N
00040000-56af-09b2-2b48-d9b9d832fe37	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56af-09b2-a1b2-c993688f4fdd	JP	JPN	392	Japan 	Japonska	\N
00040000-56af-09b2-4732-2a4390e3425c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56af-09b2-23af-7f2b1446acc4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56af-09b2-f1dd-6d23245d0251	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56af-09b2-a239-58227cc08778	KE	KEN	404	Kenya 	Kenija	\N
00040000-56af-09b2-a31d-2f8253e3cb9a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56af-09b2-b487-6612a338cbe9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56af-09b2-c99a-4c13440dd7e7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56af-09b2-f994-5a75ba0434a5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56af-09b2-82aa-3cfb711a870b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56af-09b2-60ee-18cab7504f4f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56af-09b2-6c46-cb07aee14eb4	LV	LVA	428	Latvia 	Latvija	\N
00040000-56af-09b2-dafc-c5754181faf1	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56af-09b2-7c95-382288ef0703	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56af-09b2-c75e-7d68d7beecc0	LR	LBR	430	Liberia 	Liberija	\N
00040000-56af-09b2-5fea-c627a8236813	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56af-09b2-e9e4-82f04b6b25d9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56af-09b2-6b8b-41a020ad8e2d	LT	LTU	440	Lithuania 	Litva	\N
00040000-56af-09b2-0ac3-c1248276e708	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56af-09b2-487d-ef4ffc9066af	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56af-09b2-a18e-1329bbceae94	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56af-09b2-e34a-e9c4c1224715	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56af-09b2-e340-884d30079bf4	MW	MWI	454	Malawi 	Malavi	\N
00040000-56af-09b2-6d8c-90cbdcf5a7b0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56af-09b2-722f-fd440fec58aa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56af-09b2-152b-e2bc5a46269f	ML	MLI	466	Mali 	Mali	\N
00040000-56af-09b2-ad3e-c9bc073c9a16	MT	MLT	470	Malta 	Malta	\N
00040000-56af-09b2-b603-d0317c9b29b0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56af-09b2-0a96-ee639292589f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56af-09b2-901d-74e9ac3cd2f9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56af-09b2-b660-36ad7cba917d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56af-09b2-1576-fda16244f812	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56af-09b2-29a1-6cbf64960c70	MX	MEX	484	Mexico 	Mehika	\N
00040000-56af-09b2-7935-99d7b0705518	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56af-09b2-58d7-0ae1c31ccfef	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56af-09b2-450b-2ad7ed55c528	MC	MCO	492	Monaco 	Monako	\N
00040000-56af-09b2-7fda-507174c14c4d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56af-09b2-3ade-071451d6ea87	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56af-09b2-1c95-f991ee6ed16d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56af-09b2-6911-455f1626e265	MA	MAR	504	Morocco 	Maroko	\N
00040000-56af-09b2-ae65-b0f2345c6ae9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56af-09b2-4d6a-d39963663830	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56af-09b2-f514-0ff0f86549a7	NA	NAM	516	Namibia 	Namibija	\N
00040000-56af-09b2-1264-f3abbabfe88c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56af-09b2-7999-df2463966809	NP	NPL	524	Nepal 	Nepal	\N
00040000-56af-09b2-c399-4e771c5f34e5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56af-09b2-35cd-83a1d4ae373f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56af-09b2-2a12-3cfc80ed0186	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56af-09b2-24bf-15c49927068b	NE	NER	562	Niger 	Niger 	\N
00040000-56af-09b2-0290-aa04db3204fe	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56af-09b2-966c-9f3664efa6b5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56af-09b2-7821-bc46ffa4b5ef	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56af-09b2-4ba6-390648687dd5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56af-09b2-121d-af2ba43430ca	NO	NOR	578	Norway 	Norveška	\N
00040000-56af-09b2-8edd-c323fa0d0e4b	OM	OMN	512	Oman 	Oman	\N
00040000-56af-09b2-9e7c-a33fb74f2e4c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56af-09b2-2000-be9bc828dca3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56af-09b2-1ad2-ce251dd38fb8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56af-09b2-6e1e-3ea022916fcc	PA	PAN	591	Panama 	Panama	\N
00040000-56af-09b2-af76-d281d24a6542	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56af-09b2-5b22-8067fec92204	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56af-09b2-177a-382bbbe99cd3	PE	PER	604	Peru 	Peru	\N
00040000-56af-09b2-d9c7-998fa8c6de63	PH	PHL	608	Philippines 	Filipini	\N
00040000-56af-09b2-bdb1-8fbd6b56c5c6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56af-09b2-5782-a5ce2d465e06	PL	POL	616	Poland 	Poljska	\N
00040000-56af-09b2-ceef-f70a741497f3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56af-09b2-c600-43d0bc6e1fbe	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56af-09b2-a79f-2b2eaf2a3a99	QA	QAT	634	Qatar 	Katar	\N
00040000-56af-09b2-62ae-3f77d4c7781e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56af-09b2-e9c9-1a6addb96d54	RO	ROU	642	Romania 	Romunija	\N
00040000-56af-09b2-ace9-3e6801c99179	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56af-09b2-ea5b-56a51caf2b88	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56af-09b2-c9e2-c96ffe8da549	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56af-09b2-7859-035487ab7118	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56af-09b2-f60e-369ddde41aa6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56af-09b2-096b-48fd1b76a7d0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56af-09b2-1998-db2e020f0b64	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56af-09b2-4eaf-fe7f674f20eb	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56af-09b2-aa97-e06fac80aa56	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56af-09b2-f6ec-be92da5c626f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56af-09b2-822a-104f9745c2a4	SM	SMR	674	San Marino 	San Marino	\N
00040000-56af-09b2-1b61-1a1f5901d023	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56af-09b2-87e6-804a5f8d18b1	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56af-09b2-4ec7-cd326272c4cf	SN	SEN	686	Senegal 	Senegal	\N
00040000-56af-09b2-add5-4ccbf13a373a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56af-09b2-9c03-698abe903c5f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56af-09b2-0bef-a424f55e9cb6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56af-09b2-149d-ff6c524424c6	SG	SGP	702	Singapore 	Singapur	\N
00040000-56af-09b2-4c59-f756be006e9c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56af-09b2-f37e-4f01128be262	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56af-09b2-c434-1b3888037691	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56af-09b2-0e88-b0f905ec57fd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56af-09b2-8a78-7825a5f46783	SO	SOM	706	Somalia 	Somalija	\N
00040000-56af-09b2-f49f-c5b00583ae0e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56af-09b2-2db2-624f9bfae617	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56af-09b2-f497-bf620400cca8	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56af-09b2-db38-17b80fdf77fb	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56af-09b2-48ff-44ead6f8b68d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56af-09b2-d9d4-42e41b14d77b	SD	SDN	729	Sudan 	Sudan	\N
00040000-56af-09b2-659f-74d367239010	SR	SUR	740	Suriname 	Surinam	\N
00040000-56af-09b2-ae5f-7827e072f47f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56af-09b2-940c-3c16b15e3d37	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56af-09b2-52d2-53dde11b59c8	SE	SWE	752	Sweden 	Švedska	\N
00040000-56af-09b2-c79e-db772139ca3f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56af-09b2-b438-21ac5f84afb7	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56af-09b2-cf52-ebd6c581b170	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56af-09b2-0c15-12acdc9ac47f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56af-09b2-3587-9d8e267fe7a8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56af-09b2-6531-c3407a866fdc	TH	THA	764	Thailand 	Tajska	\N
00040000-56af-09b2-11c7-f92b7dbcc9d8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56af-09b2-5fa1-c8a6a790c23e	TG	TGO	768	Togo 	Togo	\N
00040000-56af-09b2-957a-166189681739	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56af-09b2-27b8-0239becafab5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56af-09b2-3c9c-347a82633e72	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56af-09b2-2ca3-efced3719038	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56af-09b2-ea5b-be0408d86546	TR	TUR	792	Turkey 	Turčija	\N
00040000-56af-09b2-9c90-fb755070386b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56af-09b2-e7c0-d803f11da396	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-09b2-b56f-351351e5650a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56af-09b2-2da8-f45f69fc48ee	UG	UGA	800	Uganda 	Uganda	\N
00040000-56af-09b2-baec-b9e1c88b6c03	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56af-09b2-dae6-b34d17bbf573	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56af-09b2-56be-11dda85bdd5d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56af-09b2-57a2-4a27a8fd743e	US	USA	840	United States 	Združene države Amerike	\N
00040000-56af-09b2-4a1c-8bfb75f5a910	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56af-09b2-7b56-b6fe2bd18308	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56af-09b2-619b-fd51a544b99c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56af-09b2-323c-074400aa88d0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56af-09b2-dc1f-4e9629c8265f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56af-09b2-a057-604261089402	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56af-09b2-7fd0-b12f58b5ca85	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-09b2-586c-c083ca796989	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56af-09b2-e39d-6ceef23a97ff	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56af-09b2-7400-48c739e8fd9b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56af-09b2-b453-5d6fcec13713	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56af-09b2-062b-b6cec5533ab0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56af-09b2-ca08-ce47790f34bf	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 42129827)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56af-09b6-aaa8-d7da09dcdda9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56af-09b6-7343-5324a0bc2f98	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-09b6-60ba-cfe0f1228613	000e0000-56af-09b5-5d55-1db2045162be	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-09b2-6c23-e43e99fc23a9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-09b6-8e2c-5401e86f0e18	000e0000-56af-09b5-63ee-f12c67a39797	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-09b2-5626-34c11e9d9011	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-09b6-756a-08e1ff7519a7	000e0000-56af-09b5-adc9-82b361630f3f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-09b2-6c23-e43e99fc23a9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 42129633)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56af-09b5-3f50-70ecbbae9a1f	000e0000-56af-09b5-63ee-f12c67a39797	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56af-09b2-352b-f6e7e08016a5
000d0000-56af-09b5-98e4-324b90c1b001	000e0000-56af-09b5-bdbb-caedfe8e1756	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-09b2-ff79-4e629d4ec631
000d0000-56af-09b5-758a-fb8cb8750392	000e0000-56af-09b5-bdbb-caedfe8e1756	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-bd48-a412706e4d76	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-e893-a15a99e53ecd	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-09b2-ff79-4e629d4ec631
000d0000-56af-09b5-e478-4ae20e0809d2	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-ee34-5e6d67076201	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-298e-7cb601b5156a	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-722d-18634cd6cdb7	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56af-09b2-a367-7f50ffc67009
000d0000-56af-09b5-eb86-204d5f70e4a6	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-a061-671a10f3decb	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56af-09b2-352b-f6e7e08016a5
000d0000-56af-09b5-625e-6e765fe2482b	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-b3dd-7be7d26ce624	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56af-09b2-352b-f6e7e08016a5
000d0000-56af-09b5-dadc-5558e014e243	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-d834-b629e2fbd952	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-09b2-ff79-4e629d4ec631
000d0000-56af-09b5-9387-251a6f3cf0ed	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-2ebe-2770e95984e7	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56af-09b2-ff79-4e629d4ec631
000d0000-56af-09b5-a1ad-e21e54abea4e	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-936a-a3321956bffa	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56af-09b2-8f58-8e93865e7903
000d0000-56af-09b5-ea35-b32708c807ca	000e0000-56af-09b5-63ee-f12c67a39797	000c0000-56af-09b6-9801-271807a527fb	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56af-09b2-e0b8-bda5277041c8
000d0000-56af-09b5-b106-fa3d7eac6b41	000e0000-56af-09b5-647d-f40af05a7bcb	000c0000-56af-09b6-1e4d-681200e73df8	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-f46d-c12ca09ae955	000e0000-56af-09b5-689c-865b03174fdb	000c0000-56af-09b6-1920-1b5f2771a81a	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-9157-6da0e66f0a73	000e0000-56af-09b5-689c-865b03174fdb	000c0000-56af-09b6-ed28-d2d73fbce204	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-dceb-d03e0c07b2ca	000e0000-56af-09b5-3227-73d2cae9bd0c	000c0000-56af-09b6-bc5e-4f7649c867da	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-a469-eb15088d71fe	000e0000-56af-09b5-16ac-d40f75d7e576	000c0000-56af-09b6-04d2-a3d895f64e34	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-e853-ac498add3a14	000e0000-56af-09b5-8242-1970d081b9eb	000c0000-56af-09b6-1e83-d0a7dd293255	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-2415-7b784eacb368	000e0000-56af-09b5-4820-93b3a9993688	000c0000-56af-09b6-d4c3-69ec310155b9	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-159f-92d2b38b1f7b	000e0000-56af-09b5-0781-dac5bf3bab8e	000c0000-56af-09b6-d3f7-621915021f14	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b5-af9c-8aff014c4e08	000e0000-56af-09b5-afea-3165bb33585c	000c0000-56af-09b6-81bc-410dc52d8352	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b6-7b48-13cfc8839a3f	000e0000-56af-09b5-afea-3165bb33585c	000c0000-56af-09b6-94ef-f10dc92fa181	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b6-b0a2-c9449744cc5a	000e0000-56af-09b5-a65c-a4ef9e79fc62	000c0000-56af-09b6-f631-edbbf00bbbbe	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
000d0000-56af-09b6-80e9-c03215319b28	000e0000-56af-09b5-a65c-a4ef9e79fc62	000c0000-56af-09b6-1dba-0891cda3a517	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56af-09b2-c578-0ebfefc341cf
\.


--
-- TOC entry 3162 (class 0 OID 42129410)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56af-09b6-79ac-e39f20038312	00040000-56af-09b2-0064-dd8f476cfd29		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 42129382)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 42129359)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56af-09b5-98e0-5da4ad647892	00080000-56af-09b5-a907-fcc7a5e3c861	00090000-56af-09b5-ec88-0e291f821c78	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 42129547)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 42130097)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56af-09b5-d463-9547949cd19d	00010000-56af-09b3-9f3f-0452c3101553	\N	Prva mapa	Root mapa	2016-02-01 08:31:01	2016-02-01 08:31:01	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 42130110)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 42130132)
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
-- TOC entry 3180 (class 0 OID 42129571)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 42129316)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56af-09b3-f65f-d52c60f87917	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56af-09b3-2cf3-c873bf5acad7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56af-09b3-9a1c-5311e8173799	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56af-09b3-65c2-1f3088f0d566	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56af-09b3-d869-18e180fe024f	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56af-09b3-3a14-c663a797e4c3	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56af-09b3-513e-d1049a093c20	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56af-09b3-e7e3-93455ef3a6fb	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56af-09b3-1407-7a135920933a	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56af-09b3-8754-e61432ee765e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56af-09b3-4b9c-3053183cafa9	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-09b3-471a-4cd68ef41d26	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-09b3-6cb2-054a0fcd1e5f	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56af-09b3-f4e1-c68366e5aba1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56af-09b3-3751-d10ebbdfed55	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56af-09b3-169b-8201abc745fd	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56af-09b3-b6c6-252da390a354	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56af-09b5-1b35-094f5558440d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56af-09b5-785a-8d16c22a65a2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56af-09b5-f475-831aac4dd39a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56af-09b5-4179-cd84512e9bf4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56af-09b5-ee95-b375c2fcd13b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56af-09b5-bcef-bbaf512205a0	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56af-09b7-4f7d-6d0505aeca00	application.tenant.maticnopodjetje	string	s:36:"00080000-56af-09b7-28ad-65233b20c4bd";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 42129216)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56af-09b5-734a-e9647658d3da	00000000-56af-09b5-1b35-094f5558440d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56af-09b5-d82b-4f4dde98d27e	00000000-56af-09b5-1b35-094f5558440d	00010000-56af-09b3-9f3f-0452c3101553	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56af-09b5-79d8-8e433d741b54	00000000-56af-09b5-785a-8d16c22a65a2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56af-09b5-1ed2-7a86abcbc61f	00000000-56af-09b5-bcef-bbaf512205a0	\N	s:6:"zelena";	t
00000000-56af-09b5-a0c0-c19497d82fa2	00000000-56af-09b5-bcef-bbaf512205a0	00010000-56af-09b3-9f3f-0452c3101553	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 42129283)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56af-09b5-567c-cc842f941d9f	\N	00100000-56af-09b5-25e8-8b1e933e4f7c	00100000-56af-09b5-c5a0-5bcc8548791b	01	Gledališče Nimbis
00410000-56af-09b5-366d-932319ff4ec5	00410000-56af-09b5-567c-cc842f941d9f	00100000-56af-09b5-25e8-8b1e933e4f7c	00100000-56af-09b5-c5a0-5bcc8548791b	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 42129227)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56af-09b5-fb4a-1e563e74e141	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56af-09b5-81b7-4203a6ced475	00010000-56af-09b5-19e4-c5aea9c40ac2	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56af-09b5-1676-ae3a56d79f3f	00010000-56af-09b5-ea0c-0f03e6b958dd	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56af-09b5-df89-5415a1d4e0e0	00010000-56af-09b5-9a83-9db933dd1855	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56af-09b5-9c6f-823ae4fdf2f2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56af-09b5-6e57-54bddc175ad7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56af-09b5-b5d2-44d288c07976	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56af-09b5-04c9-49be549e8225	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56af-09b5-ec88-0e291f821c78	00010000-56af-09b5-a91d-a70a61e90ab7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56af-09b5-ec7a-78380a6970cf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56af-09b5-8118-e760bc156a16	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-09b5-5cd7-34a324b56b2f	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56af-09b5-3baf-dd252b0524d9	00010000-56af-09b5-a4e7-88fbc972b2c2	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-09b5-8f73-25076a0ceb71	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-09b5-f081-7a53be3423a8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-09b5-2a92-40f729f43be0	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-09b5-7476-32a64523bbe5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-09b5-57b5-2112a0cb131c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-09b5-b3df-ddaf0f57f1fb	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-09b5-ad17-0779132e3686	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-09b5-5a71-0a603fb036b1	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 42129161)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56af-09b2-ba38-93bb4d367fd5	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56af-09b2-193a-af63626c4caa	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56af-09b2-25aa-5eb3a47ea5ac	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56af-09b2-5b4c-879e50092306	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56af-09b2-3dab-0ea334b9834f	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56af-09b2-0307-842257720321	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56af-09b2-5c96-0c6302c478a9	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56af-09b2-0fc9-9160a1aa7758	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56af-09b2-b22f-8132f743f91a	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56af-09b2-c024-0231f95d70b9	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56af-09b2-7fab-7e5a7d7aa873	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56af-09b2-3fc4-d7103d7823cb	Abonma-read	Abonma - branje	t
00030000-56af-09b2-2b18-2edddaa35090	Abonma-write	Abonma - spreminjanje	t
00030000-56af-09b2-7612-58af5c7e772b	Alternacija-read	Alternacija - branje	t
00030000-56af-09b2-47f8-2aaaea6c766e	Alternacija-write	Alternacija - spreminjanje	t
00030000-56af-09b2-3109-ef8513366ad7	Arhivalija-read	Arhivalija - branje	t
00030000-56af-09b2-f1c4-6fbbaa07fc8b	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56af-09b2-dcbe-d36f8a685c0a	AuthStorage-read	AuthStorage - branje	t
00030000-56af-09b2-9e1c-14116e73e630	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56af-09b2-2b8d-e10d7a920cf3	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56af-09b2-8cd3-d2d88d349a2c	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56af-09b2-e2f4-13852a81eb14	Besedilo-read	Besedilo - branje	t
00030000-56af-09b2-96b3-405f6e214bad	Besedilo-write	Besedilo - spreminjanje	t
00030000-56af-09b2-7f32-4df588d21354	Dodatek-read	Dodatek - branje	t
00030000-56af-09b2-7e9c-6a912d25ae84	Dodatek-write	Dodatek - spreminjanje	t
00030000-56af-09b2-9a83-3a7340dff369	Dogodek-read	Dogodek - branje	t
00030000-56af-09b2-da96-d48a1fb4a077	Dogodek-write	Dogodek - spreminjanje	t
00030000-56af-09b2-12f2-4b5976bc810c	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56af-09b2-d607-089439583b5d	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56af-09b2-8aa9-7548294b7af0	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56af-09b2-4eb5-0f80102b3ea1	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56af-09b2-0a16-c574750404d9	DogodekTrait-read	DogodekTrait - branje	t
00030000-56af-09b2-4d65-f74d329d2ca6	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56af-09b2-926e-6b865a7196c8	DrugiVir-read	DrugiVir - branje	t
00030000-56af-09b2-b1e7-fc4e1050710c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56af-09b2-f2ba-06fdbd459c32	Drzava-read	Drzava - branje	t
00030000-56af-09b2-3766-e54f1006bd0d	Drzava-write	Drzava - spreminjanje	t
00030000-56af-09b2-37fb-3588a317ad01	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56af-09b2-0e73-36eb841653f8	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56af-09b2-3b03-6e46b0441cd0	Funkcija-read	Funkcija - branje	t
00030000-56af-09b2-3d3e-3e9d0a35a4ec	Funkcija-write	Funkcija - spreminjanje	t
00030000-56af-09b2-c232-cd2cd39cbfee	Gostovanje-read	Gostovanje - branje	t
00030000-56af-09b2-c109-cb3012a0dcac	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56af-09b2-1045-4c95aea03fe9	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56af-09b2-9999-93be2bda0f37	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56af-09b2-d5fb-f6797f809e5c	Kupec-read	Kupec - branje	t
00030000-56af-09b2-32da-0aea2d4c00ef	Kupec-write	Kupec - spreminjanje	t
00030000-56af-09b2-6d11-cff8f6033131	NacinPlacina-read	NacinPlacina - branje	t
00030000-56af-09b2-0ced-5ac589ca138a	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56af-09b2-af15-b74adf4e937f	Option-read	Option - branje	t
00030000-56af-09b2-206a-2a9f4617db88	Option-write	Option - spreminjanje	t
00030000-56af-09b2-16d1-04844087cae2	OptionValue-read	OptionValue - branje	t
00030000-56af-09b2-9b81-300e1bb83472	OptionValue-write	OptionValue - spreminjanje	t
00030000-56af-09b2-15ad-d3434e796bb1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56af-09b2-89e4-ff08ea03a482	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56af-09b2-0841-3ff2df40c691	Oseba-read	Oseba - branje	t
00030000-56af-09b2-36a6-f62a337fcad0	Oseba-write	Oseba - spreminjanje	t
00030000-56af-09b2-d969-5c87dab4d95d	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56af-09b2-5e0a-2a8e26d8f520	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56af-09b2-ec2f-e08736116297	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56af-09b2-d5f2-32a98f8373b9	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56af-09b2-3a98-85947bed7c69	Pogodba-read	Pogodba - branje	t
00030000-56af-09b2-3e2f-52c37dfab658	Pogodba-write	Pogodba - spreminjanje	t
00030000-56af-09b2-e9af-7c99790a0b4b	Popa-read	Popa - branje	t
00030000-56af-09b2-7e08-32b7d2d4148d	Popa-write	Popa - spreminjanje	t
00030000-56af-09b2-e9e0-a014918cd1f5	Posta-read	Posta - branje	t
00030000-56af-09b2-183a-caad5a2d2fe6	Posta-write	Posta - spreminjanje	t
00030000-56af-09b2-37cc-638376921350	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56af-09b2-94f9-8de1f9fa5a17	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56af-09b2-48a1-9302879daf20	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56af-09b2-ced7-143d60648b30	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56af-09b2-e80b-7285802d6865	PostniNaslov-read	PostniNaslov - branje	t
00030000-56af-09b2-a2bb-0d837034fa06	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56af-09b2-2434-3cf1aeb199d6	Praznik-read	Praznik - branje	t
00030000-56af-09b2-c532-d0cc872e1427	Praznik-write	Praznik - spreminjanje	t
00030000-56af-09b2-3b52-2f9c15a717d1	Predstava-read	Predstava - branje	t
00030000-56af-09b2-9fe1-2b940345fab2	Predstava-write	Predstava - spreminjanje	t
00030000-56af-09b2-4846-f9ed6f834e51	Ura-read	Ura - branje	t
00030000-56af-09b2-30d5-0f7420b6c241	Ura-write	Ura - spreminjanje	t
00030000-56af-09b2-00f4-68d421f5b889	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56af-09b2-32d5-5e85ae10e81f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56af-09b2-9210-3c7d553f3db1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56af-09b2-87c3-c52283e16091	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56af-09b2-0bef-a836c610ee0f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56af-09b2-54bf-68ed4112d8a0	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56af-09b2-7a0f-191b2d571111	ProgramDela-read	ProgramDela - branje	t
00030000-56af-09b2-c6ba-ae964a388142	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56af-09b2-269b-38e167ed15ae	ProgramFestival-read	ProgramFestival - branje	t
00030000-56af-09b2-cf9c-4fb9f1e275fc	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56af-09b2-6f54-617670f63f90	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56af-09b2-ae80-2c228f69a122	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56af-09b2-a6c8-9bc935324ddd	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56af-09b2-6334-eaf855d40f1e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56af-09b2-1194-9bd1aaafb4df	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56af-09b2-709d-dbf38c01c5ed	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56af-09b2-174b-db64b8093055	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56af-09b2-8ec4-70ad5dcc5cf2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56af-09b2-7d03-b69e5c19aadb	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56af-09b2-2b0b-efb10d291a11	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56af-09b2-c2a6-e89076e738d3	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56af-09b2-3449-26a0ff438f77	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56af-09b2-b0d8-953ad08721fa	ProgramRazno-read	ProgramRazno - branje	t
00030000-56af-09b2-9eb2-a7e503c3fea8	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56af-09b2-1366-6aaede02e9a2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56af-09b2-5f7c-190eff72ca8f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56af-09b2-5598-7e2b7cc33866	Prostor-read	Prostor - branje	t
00030000-56af-09b2-e30a-845c2fec97f4	Prostor-write	Prostor - spreminjanje	t
00030000-56af-09b2-5616-e1203f3cf13e	Racun-read	Racun - branje	t
00030000-56af-09b2-3203-31e825629184	Racun-write	Racun - spreminjanje	t
00030000-56af-09b2-a005-57f1d5c6e5d5	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56af-09b2-a202-3ceccfba6d5e	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56af-09b2-c816-829cb907d373	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56af-09b2-9f2a-a766fc59f6b5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56af-09b2-4781-c6fbf30fccda	Rekvizit-read	Rekvizit - branje	t
00030000-56af-09b2-f13f-c6625a05abb4	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56af-09b2-75fa-d0945380ce45	Revizija-read	Revizija - branje	t
00030000-56af-09b2-14cb-ae6f0e7c7abd	Revizija-write	Revizija - spreminjanje	t
00030000-56af-09b2-efa8-86c10cd62c69	Rezervacija-read	Rezervacija - branje	t
00030000-56af-09b2-f403-436679b53020	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56af-09b2-c71a-89d9acd945cf	SedezniRed-read	SedezniRed - branje	t
00030000-56af-09b2-6900-4313750f22cb	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56af-09b2-7738-a8a96d8e6b48	Sedez-read	Sedez - branje	t
00030000-56af-09b2-5585-2cc2c3c56286	Sedez-write	Sedez - spreminjanje	t
00030000-56af-09b2-b4bf-3b0dc83e2af4	Sezona-read	Sezona - branje	t
00030000-56af-09b2-3df9-91b35c398f9d	Sezona-write	Sezona - spreminjanje	t
00030000-56af-09b2-ce8d-d33a3d9fcd10	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56af-09b2-591a-1a38dcd4f09a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56af-09b2-c7bf-0cb1988a9fd0	Telefonska-read	Telefonska - branje	t
00030000-56af-09b2-ac1a-e1db488dd84d	Telefonska-write	Telefonska - spreminjanje	t
00030000-56af-09b2-5e77-4a02051035f6	TerminStoritve-read	TerminStoritve - branje	t
00030000-56af-09b2-d278-077e2cf93163	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56af-09b2-53d0-1eb516daa0fe	TipDodatka-read	TipDodatka - branje	t
00030000-56af-09b2-5950-5548e7edf902	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56af-09b2-f1a2-56a7ba6a88e0	TipFunkcije-read	TipFunkcije - branje	t
00030000-56af-09b2-f993-69e2f552f889	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56af-09b2-7134-602ad7dcba80	TipPopa-read	TipPopa - branje	t
00030000-56af-09b2-4e76-e7ad1da1fd4c	TipPopa-write	TipPopa - spreminjanje	t
00030000-56af-09b2-50f2-0d145686fc2f	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56af-09b2-e076-92af6f81219d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56af-09b2-c1ce-e09b6e16aa19	TipVaje-read	TipVaje - branje	t
00030000-56af-09b2-c5d7-357e407f9c41	TipVaje-write	TipVaje - spreminjanje	t
00030000-56af-09b2-a366-ed0bd734a254	Trr-read	Trr - branje	t
00030000-56af-09b2-114b-f1ec69679dba	Trr-write	Trr - spreminjanje	t
00030000-56af-09b2-1d2b-e107d1bb39f2	Uprizoritev-read	Uprizoritev - branje	t
00030000-56af-09b2-4fa5-bb5d898e345a	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56af-09b2-8221-240fbee8008e	Vaja-read	Vaja - branje	t
00030000-56af-09b2-b488-b548b662c588	Vaja-write	Vaja - spreminjanje	t
00030000-56af-09b2-4908-bcf685abc037	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56af-09b2-2243-199377ae6ae0	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56af-09b2-9a54-c22f420ef65d	VrstaStroska-read	VrstaStroska - branje	t
00030000-56af-09b2-823b-bb2dd093a3d7	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56af-09b2-02c0-fbe0d2819bda	Zaposlitev-read	Zaposlitev - branje	t
00030000-56af-09b2-9f1b-8257842a1c5f	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56af-09b2-7eca-40b7b5b36290	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56af-09b2-099c-969da4265334	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56af-09b2-a9e6-0666ad26611c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56af-09b2-dd19-c533077a6161	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56af-09b2-ac08-45691585efe3	Job-read	Branje opravil - samo zase - branje	t
00030000-56af-09b2-7230-4713d480ef20	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56af-09b2-4988-382efa3a19d8	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56af-09b2-eee0-2f3e9762b850	Report-read	Report - branje	t
00030000-56af-09b2-6cd4-39b7182fba43	Report-write	Report - spreminjanje	t
00030000-56af-09b2-321e-a623a89999eb	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56af-09b2-aedb-4fdaa7f32331	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56af-09b2-0e35-4ff604ab9fe4	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56af-09b2-5107-9cf8333e6fbe	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56af-09b2-fb75-0949cc3b142d	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56af-09b2-8186-006786b0d1fc	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56af-09b2-db03-9382dc28c268	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56af-09b2-5746-73ff9ba8f4ac	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-09b2-7fb7-ee8435307fbc	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-09b2-be61-679da7705f9a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-09b2-fa71-3d7d71fd4f49	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-09b2-3692-a6e6b905ad27	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56af-09b2-77c9-f7600f846f4f	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56af-09b2-7f21-7d1894f9a8f0	Datoteka-write	Datoteka - spreminjanje	t
00030000-56af-09b2-fe15-da5cdae77612	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 42129180)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56af-09b2-231a-db27b654ff9b	00030000-56af-09b2-193a-af63626c4caa
00020000-56af-09b2-231a-db27b654ff9b	00030000-56af-09b2-ba38-93bb4d367fd5
00020000-56af-09b2-0dff-f150e0058d2c	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-8cd3-d2d88d349a2c
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-96b3-405f6e214bad
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-005f-3578347e7171	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-060f-f274dea3ddf6	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b2-060f-f274dea3ddf6	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b2-060f-f274dea3ddf6	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-060f-f274dea3ddf6	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-060f-f274dea3ddf6	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-060f-f274dea3ddf6	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-afa9-0605f5a99eae	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b2-afa9-0605f5a99eae	00030000-56af-09b2-9f1b-8257842a1c5f
00020000-56af-09b2-afa9-0605f5a99eae	00030000-56af-09b2-0307-842257720321
00020000-56af-09b2-afa9-0605f5a99eae	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b2-afa9-0605f5a99eae	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-afa9-0605f5a99eae	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b2-afa9-0605f5a99eae	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b2-4e1e-816a4b782847	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b2-4e1e-816a4b782847	00030000-56af-09b2-0307-842257720321
00020000-56af-09b2-4e1e-816a4b782847	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b2-aea6-1a241e77f36c	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b2-aea6-1a241e77f36c	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-aea6-1a241e77f36c	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-aea6-1a241e77f36c	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b2-aea6-1a241e77f36c	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-aea6-1a241e77f36c	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b2-aea6-1a241e77f36c	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-aea6-1a241e77f36c	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b2-4ef7-62ea8f8ee531	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-4ef7-62ea8f8ee531	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-4ef7-62ea8f8ee531	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-4ef7-62ea8f8ee531	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-0307-842257720321
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-114b-f1ec69679dba
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-a2bb-0d837034fa06
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-ac1a-e1db488dd84d
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-08e0-70f94f07e897	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-59af-f9d206422dfb	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-59af-f9d206422dfb	00030000-56af-09b2-0307-842257720321
00020000-56af-09b2-59af-f9d206422dfb	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b2-59af-f9d206422dfb	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b2-59af-f9d206422dfb	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b2-59af-f9d206422dfb	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-59af-f9d206422dfb	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-ac1a-e1db488dd84d
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-a2bb-0d837034fa06
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-114b-f1ec69679dba
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-7e08-32b7d2d4148d
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-9999-93be2bda0f37
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-54bf-68ed4112d8a0
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-3808-89e0a7c30ba7	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-b16f-9eab10baa6c4	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b2-93fd-a45a3393ec5a	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b2-93fd-a45a3393ec5a	00030000-56af-09b2-4e76-e7ad1da1fd4c
00020000-56af-09b2-11b0-2df00d365f5a	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b2-7c5b-2cd1b0e343f0	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b2-7c5b-2cd1b0e343f0	00030000-56af-09b2-183a-caad5a2d2fe6
00020000-56af-09b2-84ff-169176b67579	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b2-b341-15a93c3aaa17	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-b341-15a93c3aaa17	00030000-56af-09b2-3766-e54f1006bd0d
00020000-56af-09b2-527a-557bcac9e506	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-2717-6a697424377a	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b2-2717-6a697424377a	00030000-56af-09b2-dd19-c533077a6161
00020000-56af-09b2-0263-d8567915243b	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b2-ccf7-1cd79cbe8156	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b2-ccf7-1cd79cbe8156	00030000-56af-09b2-099c-969da4265334
00020000-56af-09b2-6955-e7671e3bc287	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b2-8d36-2bc3a4ad4772	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b2-8d36-2bc3a4ad4772	00030000-56af-09b2-2b18-2edddaa35090
00020000-56af-09b2-33a9-eabdd2326aae	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b2-e165-0b6d0546f6a6	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b2-e165-0b6d0546f6a6	00030000-56af-09b2-e30a-845c2fec97f4
00020000-56af-09b2-e165-0b6d0546f6a6	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b2-e165-0b6d0546f6a6	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b2-e165-0b6d0546f6a6	00030000-56af-09b2-a2bb-0d837034fa06
00020000-56af-09b2-e165-0b6d0546f6a6	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-bb02-f981767b626f	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b2-bb02-f981767b626f	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b2-bb02-f981767b626f	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b2-e2c9-58de7e794699	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b2-e2c9-58de7e794699	00030000-56af-09b2-823b-bb2dd093a3d7
00020000-56af-09b2-0518-bcac9dccd1db	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-89e4-ff08ea03a482
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b2-26dd-5d12bfc0866f	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-d953-4f7cd32a617f	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b2-d953-4f7cd32a617f	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b2-d953-4f7cd32a617f	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-d953-4f7cd32a617f	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-d953-4f7cd32a617f	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-a46a-0ffa90fb2d5e	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b2-a46a-0ffa90fb2d5e	00030000-56af-09b2-c5d7-357e407f9c41
00020000-56af-09b2-a4ed-bacab87f726d	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-5c96-0c6302c478a9
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-0fc9-9160a1aa7758
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-7a0f-191b2d571111
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-c6ba-ae964a388142
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-269b-38e167ed15ae
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-cf9c-4fb9f1e275fc
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-6f54-617670f63f90
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-ae80-2c228f69a122
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-a6c8-9bc935324ddd
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-6334-eaf855d40f1e
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-1194-9bd1aaafb4df
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-709d-dbf38c01c5ed
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-174b-db64b8093055
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-8ec4-70ad5dcc5cf2
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-7d03-b69e5c19aadb
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-2b0b-efb10d291a11
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-c2a6-e89076e738d3
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-3449-26a0ff438f77
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-b0d8-953ad08721fa
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-9eb2-a7e503c3fea8
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-1366-6aaede02e9a2
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-5f7c-190eff72ca8f
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-87c3-c52283e16091
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-b1e7-fc4e1050710c
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-94f9-8de1f9fa5a17
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-7230-4713d480ef20
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-926e-6b865a7196c8
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-9210-3c7d553f3db1
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-37cc-638376921350
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-ac08-45691585efe3
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-8ee9-5c98476d9888	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-7a0f-191b2d571111
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-269b-38e167ed15ae
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-6f54-617670f63f90
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-a6c8-9bc935324ddd
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-1194-9bd1aaafb4df
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-174b-db64b8093055
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-7d03-b69e5c19aadb
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-c2a6-e89076e738d3
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-b0d8-953ad08721fa
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-1366-6aaede02e9a2
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-9210-3c7d553f3db1
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-926e-6b865a7196c8
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-37cc-638376921350
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-ac08-45691585efe3
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b2-60e7-a1b6619aa95d	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-4fa5-bb5d898e345a
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-c024-0231f95d70b9
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-f189-e816518ebf5b	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b3-90af-eb60e6648c38	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-09a3-f13f9517a39f	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-09a3-f13f9517a39f	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-09a3-f13f9517a39f	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-09a3-f13f9517a39f	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b3-09a3-f13f9517a39f	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-09a3-f13f9517a39f	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-09a3-f13f9517a39f	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-09a3-f13f9517a39f	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-3e2f-52c37dfab658
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-591a-1a38dcd4f09a
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-d95b-93778a578a6f	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-c6f6-08f5d53bf8f8	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-ba05-e6b0810185b6	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-ba05-e6b0810185b6	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-ba05-e6b0810185b6	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-ba05-e6b0810185b6	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b3-ba05-e6b0810185b6	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-ba05-e6b0810185b6	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-ba05-e6b0810185b6	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-9ed8-b85810b04432	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-9ed8-b85810b04432	00030000-56af-09b2-591a-1a38dcd4f09a
00020000-56af-09b3-9ed8-b85810b04432	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-9ed8-b85810b04432	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-839f-3d37cc042f20	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-839f-3d37cc042f20	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-8cd3-d2d88d349a2c
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-96b3-405f6e214bad
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-926e-6b865a7196c8
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-b1e7-fc4e1050710c
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-c024-0231f95d70b9
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-ac08-45691585efe3
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-7230-4713d480ef20
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-3e2f-52c37dfab658
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-37cc-638376921350
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-94f9-8de1f9fa5a17
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-9210-3c7d553f3db1
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-87c3-c52283e16091
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-5c96-0c6302c478a9
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-7a0f-191b2d571111
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-0fc9-9160a1aa7758
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-c6ba-ae964a388142
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-269b-38e167ed15ae
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-cf9c-4fb9f1e275fc
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-6f54-617670f63f90
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-ae80-2c228f69a122
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-a6c8-9bc935324ddd
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-6334-eaf855d40f1e
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-1194-9bd1aaafb4df
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-709d-dbf38c01c5ed
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-174b-db64b8093055
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-8ec4-70ad5dcc5cf2
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-7d03-b69e5c19aadb
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-2b0b-efb10d291a11
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-c2a6-e89076e738d3
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-3449-26a0ff438f77
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-b0d8-953ad08721fa
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-9eb2-a7e503c3fea8
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-1366-6aaede02e9a2
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-5f7c-190eff72ca8f
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-591a-1a38dcd4f09a
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-4fa5-bb5d898e345a
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b3-bfbe-b225a1ee2224	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-8cd3-d2d88d349a2c
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-96b3-405f6e214bad
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b3-bc0b-c2b04163463d	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-8cd3-d2d88d349a2c
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-96b3-405f6e214bad
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-c024-0231f95d70b9
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-4fa5-bb5d898e345a
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b3-bda5-c9d728ca8205	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-8cd3-d2d88d349a2c
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-96b3-405f6e214bad
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-926e-6b865a7196c8
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-b1e7-fc4e1050710c
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-c024-0231f95d70b9
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-ac08-45691585efe3
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7230-4713d480ef20
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-9999-93be2bda0f37
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-3e2f-52c37dfab658
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7e08-32b7d2d4148d
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-37cc-638376921350
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-94f9-8de1f9fa5a17
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-a2bb-0d837034fa06
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-9210-3c7d553f3db1
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-87c3-c52283e16091
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-54bf-68ed4112d8a0
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-5c96-0c6302c478a9
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7a0f-191b2d571111
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-0fc9-9160a1aa7758
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-c6ba-ae964a388142
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-269b-38e167ed15ae
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-cf9c-4fb9f1e275fc
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-6f54-617670f63f90
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-ae80-2c228f69a122
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-a6c8-9bc935324ddd
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-6334-eaf855d40f1e
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-1194-9bd1aaafb4df
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-709d-dbf38c01c5ed
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-174b-db64b8093055
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-8ec4-70ad5dcc5cf2
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7d03-b69e5c19aadb
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-2b0b-efb10d291a11
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-c2a6-e89076e738d3
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-3449-26a0ff438f77
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-b0d8-953ad08721fa
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-9eb2-a7e503c3fea8
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-1366-6aaede02e9a2
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-5f7c-190eff72ca8f
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-591a-1a38dcd4f09a
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-ac1a-e1db488dd84d
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-114b-f1ec69679dba
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-4fa5-bb5d898e345a
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-9f1b-8257842a1c5f
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b3-a660-b4bd139d100a	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-8cd3-d2d88d349a2c
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-96b3-405f6e214bad
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-c024-0231f95d70b9
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-9999-93be2bda0f37
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-7e08-32b7d2d4148d
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-a2bb-0d837034fa06
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-54bf-68ed4112d8a0
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-ac1a-e1db488dd84d
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-114b-f1ec69679dba
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-4fa5-bb5d898e345a
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-9f1b-8257842a1c5f
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b3-08ba-15b28e3ac77f	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b3-b6e8-7b0eb525d1a5	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-926e-6b865a7196c8
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-b1e7-fc4e1050710c
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-ac08-45691585efe3
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7230-4713d480ef20
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-9999-93be2bda0f37
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-89e4-ff08ea03a482
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-0307-842257720321
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-3e2f-52c37dfab658
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7e08-32b7d2d4148d
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-37cc-638376921350
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-94f9-8de1f9fa5a17
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-a2bb-0d837034fa06
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-9210-3c7d553f3db1
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-87c3-c52283e16091
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-54bf-68ed4112d8a0
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-5c96-0c6302c478a9
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7a0f-191b2d571111
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-0fc9-9160a1aa7758
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-c6ba-ae964a388142
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-269b-38e167ed15ae
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-cf9c-4fb9f1e275fc
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-6f54-617670f63f90
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-ae80-2c228f69a122
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-a6c8-9bc935324ddd
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-6334-eaf855d40f1e
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-1194-9bd1aaafb4df
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-709d-dbf38c01c5ed
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-174b-db64b8093055
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-8ec4-70ad5dcc5cf2
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7d03-b69e5c19aadb
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-2b0b-efb10d291a11
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-c2a6-e89076e738d3
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-3449-26a0ff438f77
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-b0d8-953ad08721fa
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-9eb2-a7e503c3fea8
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-1366-6aaede02e9a2
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-5f7c-190eff72ca8f
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-591a-1a38dcd4f09a
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-ac1a-e1db488dd84d
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-114b-f1ec69679dba
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-823b-bb2dd093a3d7
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-9f1b-8257842a1c5f
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b3-ffd0-bcd056f52842	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-ba38-93bb4d367fd5
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-193a-af63626c4caa
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3fc4-d7103d7823cb
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-2b18-2edddaa35090
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3109-ef8513366ad7
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-f1c4-6fbbaa07fc8b
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-dcbe-d36f8a685c0a
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9e1c-14116e73e630
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-2b8d-e10d7a920cf3
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-8cd3-d2d88d349a2c
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-e2f4-13852a81eb14
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-96b3-405f6e214bad
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9a83-3a7340dff369
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5b4c-879e50092306
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-12f2-4b5976bc810c
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-d607-089439583b5d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-8aa9-7548294b7af0
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-4eb5-0f80102b3ea1
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-0a16-c574750404d9
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-4d65-f74d329d2ca6
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-da96-d48a1fb4a077
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-926e-6b865a7196c8
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-b1e7-fc4e1050710c
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-f2ba-06fdbd459c32
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3766-e54f1006bd0d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-37fb-3588a317ad01
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-0e73-36eb841653f8
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c024-0231f95d70b9
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c232-cd2cd39cbfee
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c109-cb3012a0dcac
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-4988-382efa3a19d8
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-ac08-45691585efe3
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7230-4713d480ef20
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-1045-4c95aea03fe9
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9999-93be2bda0f37
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-d5fb-f6797f809e5c
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-32da-0aea2d4c00ef
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-db03-9382dc28c268
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-8186-006786b0d1fc
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-aedb-4fdaa7f32331
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-0e35-4ff604ab9fe4
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5107-9cf8333e6fbe
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-fb75-0949cc3b142d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-6d11-cff8f6033131
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-0ced-5ac589ca138a
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-af15-b74adf4e937f
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-16d1-04844087cae2
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9b81-300e1bb83472
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7fab-7e5a7d7aa873
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-206a-2a9f4617db88
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-15ad-d3434e796bb1
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-89e4-ff08ea03a482
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-0307-842257720321
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-d969-5c87dab4d95d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5e0a-2a8e26d8f520
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-ec2f-e08736116297
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-d5f2-32a98f8373b9
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3e2f-52c37dfab658
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7e08-32b7d2d4148d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-e9e0-a014918cd1f5
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-37cc-638376921350
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-94f9-8de1f9fa5a17
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-48a1-9302879daf20
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-ced7-143d60648b30
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-183a-caad5a2d2fe6
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-a2bb-0d837034fa06
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-2434-3cf1aeb199d6
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c532-d0cc872e1427
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3b52-2f9c15a717d1
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9fe1-2b940345fab2
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-00f4-68d421f5b889
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-32d5-5e85ae10e81f
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9210-3c7d553f3db1
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-87c3-c52283e16091
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-0bef-a836c610ee0f
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-54bf-68ed4112d8a0
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5c96-0c6302c478a9
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7a0f-191b2d571111
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-0fc9-9160a1aa7758
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c6ba-ae964a388142
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-269b-38e167ed15ae
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-cf9c-4fb9f1e275fc
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-6f54-617670f63f90
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-ae80-2c228f69a122
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-a6c8-9bc935324ddd
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-6334-eaf855d40f1e
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-1194-9bd1aaafb4df
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-709d-dbf38c01c5ed
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-174b-db64b8093055
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-8ec4-70ad5dcc5cf2
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7d03-b69e5c19aadb
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-2b0b-efb10d291a11
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c2a6-e89076e738d3
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3449-26a0ff438f77
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-b0d8-953ad08721fa
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9eb2-a7e503c3fea8
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-1366-6aaede02e9a2
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5f7c-190eff72ca8f
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5598-7e2b7cc33866
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-e30a-845c2fec97f4
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5616-e1203f3cf13e
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3203-31e825629184
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-a005-57f1d5c6e5d5
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-a202-3ceccfba6d5e
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c816-829cb907d373
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9f2a-a766fc59f6b5
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-4781-c6fbf30fccda
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-f13f-c6625a05abb4
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-eee0-2f3e9762b850
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-6cd4-39b7182fba43
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-75fa-d0945380ce45
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-14cb-ae6f0e7c7abd
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-efa8-86c10cd62c69
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-f403-436679b53020
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c71a-89d9acd945cf
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-6900-4313750f22cb
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7738-a8a96d8e6b48
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5585-2cc2c3c56286
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-b4bf-3b0dc83e2af4
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3df9-91b35c398f9d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-321e-a623a89999eb
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-591a-1a38dcd4f09a
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-ac1a-e1db488dd84d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5e77-4a02051035f6
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-25aa-5eb3a47ea5ac
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-d278-077e2cf93163
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-f1a2-56a7ba6a88e0
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-f993-69e2f552f889
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7134-602ad7dcba80
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-4e76-e7ad1da1fd4c
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-50f2-0d145686fc2f
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-e076-92af6f81219d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c1ce-e09b6e16aa19
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-c5d7-357e407f9c41
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-114b-f1ec69679dba
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-4fa5-bb5d898e345a
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-8221-240fbee8008e
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-b488-b548b662c588
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-4908-bcf685abc037
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-2243-199377ae6ae0
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9a54-c22f420ef65d
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-823b-bb2dd093a3d7
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-77c9-f7600f846f4f
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-3692-a6e6b905ad27
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-9f1b-8257842a1c5f
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-7eca-40b7b5b36290
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-099c-969da4265334
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-a9e6-0666ad26611c
00020000-56af-09b5-a2cb-c24fc383d1b6	00030000-56af-09b2-dd19-c533077a6161
00020000-56af-09b5-0512-815001ffd155	00030000-56af-09b2-fa71-3d7d71fd4f49
00020000-56af-09b5-b5de-2ac5609335bd	00030000-56af-09b2-be61-679da7705f9a
00020000-56af-09b5-948a-0eec66a011d3	00030000-56af-09b2-4fa5-bb5d898e345a
00020000-56af-09b5-1087-225ca4b460ac	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b5-8f56-9b8dfadc226d	00030000-56af-09b2-0e35-4ff604ab9fe4
00020000-56af-09b5-caa3-88a74f6abe9d	00030000-56af-09b2-5107-9cf8333e6fbe
00020000-56af-09b5-1ecd-efb5aa63d653	00030000-56af-09b2-fb75-0949cc3b142d
00020000-56af-09b5-eb81-b7fdde118f46	00030000-56af-09b2-aedb-4fdaa7f32331
00020000-56af-09b5-d306-21a86a473c74	00030000-56af-09b2-db03-9382dc28c268
00020000-56af-09b5-a914-b57373c35663	00030000-56af-09b2-8186-006786b0d1fc
00020000-56af-09b5-2e0a-8d36985668e1	00030000-56af-09b2-7fb7-ee8435307fbc
00020000-56af-09b5-661c-0388a30edf5b	00030000-56af-09b2-5746-73ff9ba8f4ac
00020000-56af-09b5-ddaf-ff581dedd2b7	00030000-56af-09b2-0841-3ff2df40c691
00020000-56af-09b5-1205-41cd56175bc6	00030000-56af-09b2-36a6-f62a337fcad0
00020000-56af-09b5-76ac-9c88b165d137	00030000-56af-09b2-3dab-0ea334b9834f
00020000-56af-09b5-b428-7338e673bb82	00030000-56af-09b2-0307-842257720321
00020000-56af-09b5-a950-914b0c86448e	00030000-56af-09b2-7f21-7d1894f9a8f0
00020000-56af-09b5-cb99-68082c21a38e	00030000-56af-09b2-fe15-da5cdae77612
00020000-56af-09b5-47dc-f3527d7cd035	00030000-56af-09b2-e9af-7c99790a0b4b
00020000-56af-09b5-47dc-f3527d7cd035	00030000-56af-09b2-7e08-32b7d2d4148d
00020000-56af-09b5-47dc-f3527d7cd035	00030000-56af-09b2-1d2b-e107d1bb39f2
00020000-56af-09b5-f2c8-f80ac875bf7d	00030000-56af-09b2-a366-ed0bd734a254
00020000-56af-09b5-3736-9864532e521b	00030000-56af-09b2-114b-f1ec69679dba
00020000-56af-09b5-bd3b-9dcf6ef8a627	00030000-56af-09b2-321e-a623a89999eb
00020000-56af-09b5-9c8e-94f98d837c21	00030000-56af-09b2-c7bf-0cb1988a9fd0
00020000-56af-09b5-7fe9-36083eafd111	00030000-56af-09b2-ac1a-e1db488dd84d
00020000-56af-09b5-7bc2-19b0e3e938aa	00030000-56af-09b2-e80b-7285802d6865
00020000-56af-09b5-319c-c935ee484b7d	00030000-56af-09b2-a2bb-0d837034fa06
00020000-56af-09b5-da5b-c58256c95a8e	00030000-56af-09b2-02c0-fbe0d2819bda
00020000-56af-09b5-7737-a508db9a9ce8	00030000-56af-09b2-9f1b-8257842a1c5f
00020000-56af-09b5-0106-64747cff1093	00030000-56af-09b2-3a98-85947bed7c69
00020000-56af-09b5-6e24-bb0de5f9fa1f	00030000-56af-09b2-3e2f-52c37dfab658
00020000-56af-09b5-e0bc-2bde42b9a1bb	00030000-56af-09b2-ce8d-d33a3d9fcd10
00020000-56af-09b5-be92-71c1df84e481	00030000-56af-09b2-591a-1a38dcd4f09a
00020000-56af-09b5-6cd3-ae67ffb2b5df	00030000-56af-09b2-7612-58af5c7e772b
00020000-56af-09b5-ffa5-04a90f0536e2	00030000-56af-09b2-47f8-2aaaea6c766e
00020000-56af-09b5-5405-deee5ff102d5	00030000-56af-09b2-b22f-8132f743f91a
00020000-56af-09b5-1ee9-d4bcf01ca60c	00030000-56af-09b2-3b03-6e46b0441cd0
00020000-56af-09b5-c1d1-d0b95fc6c656	00030000-56af-09b2-3d3e-3e9d0a35a4ec
00020000-56af-09b5-4016-a22b894b3c79	00030000-56af-09b2-c024-0231f95d70b9
\.


--
-- TOC entry 3181 (class 0 OID 42129578)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 42129613)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 42129746)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56af-09b5-fd60-73adfc30c369	00090000-56af-09b5-fb4a-1e563e74e141	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56af-09b5-f288-27b9c94ff7a9	00090000-56af-09b5-6e57-54bddc175ad7	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56af-09b5-d40a-4f8d459e4665	00090000-56af-09b5-3baf-dd252b0524d9	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56af-09b5-4bc4-131013f8c74f	00090000-56af-09b5-ec7a-78380a6970cf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 42129263)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56af-09b5-a907-fcc7a5e3c861	\N	00040000-56af-09b2-c434-1b3888037691	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-09b5-3ab1-20709d9db0c2	\N	00040000-56af-09b2-c434-1b3888037691	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56af-09b5-b9e8-1b77ab6c1473	\N	00040000-56af-09b2-c434-1b3888037691	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-09b5-378a-bda0005d73ac	\N	00040000-56af-09b2-c434-1b3888037691	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-09b5-49a4-b94ea868be6f	\N	00040000-56af-09b2-c434-1b3888037691	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-09b5-e847-e4ffe511b22d	\N	00040000-56af-09b2-b424-f87ab2e19703	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-09b5-101f-2ace6793c2ee	\N	00040000-56af-09b2-1324-76a89d72e35f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-09b5-8434-6b415350e227	\N	00040000-56af-09b2-7763-a4f1d410d58d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-09b5-f56b-e5c0531572ee	\N	00040000-56af-09b2-5662-5a8d5ca12b06	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-09b7-28ad-65233b20c4bd	\N	00040000-56af-09b2-c434-1b3888037691	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 42129308)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56af-09b1-5a93-90d537ac0c2e	8341	Adlešiči
00050000-56af-09b1-3533-f9edd6519dad	5270	Ajdovščina
00050000-56af-09b1-fcb0-dcbb6edcfb18	6280	Ankaran/Ancarano
00050000-56af-09b1-2fdc-07b172eca01f	9253	Apače
00050000-56af-09b1-06a5-6ba136da3533	8253	Artiče
00050000-56af-09b1-786b-0cbf0d1b0bb7	4275	Begunje na Gorenjskem
00050000-56af-09b1-0618-0687b1b5aa3f	1382	Begunje pri Cerknici
00050000-56af-09b1-c07e-6e640c7dc359	9231	Beltinci
00050000-56af-09b1-a251-c62d8555c828	2234	Benedikt
00050000-56af-09b1-ba33-5add4b80e7d3	2345	Bistrica ob Dravi
00050000-56af-09b1-4bac-2123e41646f8	3256	Bistrica ob Sotli
00050000-56af-09b1-94fc-b65009f4c6b4	8259	Bizeljsko
00050000-56af-09b1-668b-7ee209bfad17	1223	Blagovica
00050000-56af-09b1-f818-9baef4e6d2f9	8283	Blanca
00050000-56af-09b1-6d4f-0cc15c7bf261	4260	Bled
00050000-56af-09b1-7aaa-f093aaafdb61	4273	Blejska Dobrava
00050000-56af-09b1-7f40-a67c8142a302	9265	Bodonci
00050000-56af-09b1-4be1-07cdd76b20b4	9222	Bogojina
00050000-56af-09b1-2091-8a85f8b13a30	4263	Bohinjska Bela
00050000-56af-09b1-8774-b76cf8a3d756	4264	Bohinjska Bistrica
00050000-56af-09b1-6853-3a162374945b	4265	Bohinjsko jezero
00050000-56af-09b1-d6d3-83feac699365	1353	Borovnica
00050000-56af-09b1-af39-fa27cc6ac015	8294	Boštanj
00050000-56af-09b1-05c4-bf2be32fd46f	5230	Bovec
00050000-56af-09b1-2150-a087074c04c7	5295	Branik
00050000-56af-09b1-1653-324229d41260	3314	Braslovče
00050000-56af-09b1-0aa1-0ba6a85003c0	5223	Breginj
00050000-56af-09b1-fd01-a1c4bbfa23e0	8280	Brestanica
00050000-56af-09b1-a1fa-635d4da3a77c	2354	Bresternica
00050000-56af-09b1-14bc-5d0a7b0d5f8f	4243	Brezje
00050000-56af-09b1-96d7-09b83f0644ec	1351	Brezovica pri Ljubljani
00050000-56af-09b1-114f-722a8a3de150	8250	Brežice
00050000-56af-09b1-c2d1-91d576ceb740	4210	Brnik - Aerodrom
00050000-56af-09b1-2ccb-15ee4fdad227	8321	Brusnice
00050000-56af-09b1-8917-5a681eef62bd	3255	Buče
00050000-56af-09b1-35d7-319d1bcc0adf	8276	Bučka 
00050000-56af-09b1-7492-382b82ae551c	9261	Cankova
00050000-56af-09b1-1922-943216cb9317	3000	Celje 
00050000-56af-09b1-ea98-f428575db28c	3001	Celje - poštni predali
00050000-56af-09b1-9778-ada5bf4e98ac	4207	Cerklje na Gorenjskem
00050000-56af-09b1-5765-87f2cfd127f7	8263	Cerklje ob Krki
00050000-56af-09b1-2291-ec83d500a864	1380	Cerknica
00050000-56af-09b1-1e0f-0e9d735c3e5d	5282	Cerkno
00050000-56af-09b1-8928-8ab9b4a2b887	2236	Cerkvenjak
00050000-56af-09b1-fa1b-4887379528d2	2215	Ceršak
00050000-56af-09b1-3f1f-270f30addc39	2326	Cirkovce
00050000-56af-09b1-96b6-9e7891e6764e	2282	Cirkulane
00050000-56af-09b1-f4a4-b265697c5b6d	5273	Col
00050000-56af-09b1-6441-fd139d55dc6a	8251	Čatež ob Savi
00050000-56af-09b1-3d4b-3416ae501581	1413	Čemšenik
00050000-56af-09b1-b583-a116985c7bd9	5253	Čepovan
00050000-56af-09b1-5c6c-463ca884d82f	9232	Črenšovci
00050000-56af-09b1-d3f6-976690043131	2393	Črna na Koroškem
00050000-56af-09b1-a721-d4e0558172cc	6275	Črni Kal
00050000-56af-09b1-687d-a7de45072543	5274	Črni Vrh nad Idrijo
00050000-56af-09b1-985d-1923deb6ecea	5262	Črniče
00050000-56af-09b1-a09b-698ccde4fb00	8340	Črnomelj
00050000-56af-09b1-e374-989e4020bb40	6271	Dekani
00050000-56af-09b1-f7a2-2dcacd6b1a79	5210	Deskle
00050000-56af-09b1-8b3d-3038d91612ba	2253	Destrnik
00050000-56af-09b1-a1a3-d422625026c8	6215	Divača
00050000-56af-09b1-6bf7-a0dbcfd9ffeb	1233	Dob
00050000-56af-09b1-68e1-7ea0042d9e22	3224	Dobje pri Planini
00050000-56af-09b1-73c6-d7274ad16601	8257	Dobova
00050000-56af-09b1-9e30-9fef49d91602	1423	Dobovec
00050000-56af-09b1-b4b7-b9e2d468f46e	5263	Dobravlje
00050000-56af-09b1-4d7b-6bbba6023e2c	3204	Dobrna
00050000-56af-09b1-b020-afbf35ca051f	8211	Dobrnič
00050000-56af-09b1-dfd9-d18ad34184ac	1356	Dobrova
00050000-56af-09b1-7fad-e0e00785ba54	9223	Dobrovnik/Dobronak 
00050000-56af-09b1-5df9-c9e273b97695	5212	Dobrovo v Brdih
00050000-56af-09b1-cc51-c76ad968da42	1431	Dol pri Hrastniku
00050000-56af-09b1-fc41-b370a6d63cc6	1262	Dol pri Ljubljani
00050000-56af-09b1-f270-de5ea94530f7	1273	Dole pri Litiji
00050000-56af-09b1-d488-aca6a41655ec	1331	Dolenja vas
00050000-56af-09b1-bcd5-ef0e834fdfd8	8350	Dolenjske Toplice
00050000-56af-09b1-0b4d-a2ce80458ba2	1230	Domžale
00050000-56af-09b1-12b2-f436e31f3e2d	2252	Dornava
00050000-56af-09b1-14ba-385f97c3e058	5294	Dornberk
00050000-56af-09b1-0fcb-e7366f939809	1319	Draga
00050000-56af-09b1-6c10-da973887fbed	8343	Dragatuš
00050000-56af-09b1-8771-925e767b130b	3222	Dramlje
00050000-56af-09b1-92eb-77044e200527	2370	Dravograd
00050000-56af-09b1-e0f6-a7e165d733cd	4203	Duplje
00050000-56af-09b1-0612-a8154003b3db	6221	Dutovlje
00050000-56af-09b1-9d6c-92946ea0a1b1	8361	Dvor
00050000-56af-09b1-10ad-42b513bd8fb3	2343	Fala
00050000-56af-09b1-b15f-c29c1c3f718c	9208	Fokovci
00050000-56af-09b1-502e-8e3401734beb	2313	Fram
00050000-56af-09b1-9a50-703357e64f7a	3213	Frankolovo
00050000-56af-09b1-d65b-6adc4364c71a	1274	Gabrovka
00050000-56af-09b1-3a7d-ff22369e6912	8254	Globoko
00050000-56af-09b1-48a8-428be34d9409	5275	Godovič
00050000-56af-09b1-24c5-f87661e560c6	4204	Golnik
00050000-56af-09b1-db20-07afeef45a88	3303	Gomilsko
00050000-56af-09b1-d097-9450fd3e76ea	4224	Gorenja vas
00050000-56af-09b1-04fe-f93a25c0aaba	3263	Gorica pri Slivnici
00050000-56af-09b1-bf75-5eb926cf709f	2272	Gorišnica
00050000-56af-09b1-dd21-a86c6bd52e9b	9250	Gornja Radgona
00050000-56af-09b1-0cd0-6f2c47dc1e58	3342	Gornji Grad
00050000-56af-09b1-055b-04ee9e458953	4282	Gozd Martuljek
00050000-56af-09b1-3e11-226bfde09c9f	6272	Gračišče
00050000-56af-09b1-1c3e-1afe30da6bfc	9264	Grad
00050000-56af-09b1-bdf3-034a6be57d3e	8332	Gradac
00050000-56af-09b1-7777-a9ce1e543df0	1384	Grahovo
00050000-56af-09b1-d6ee-2ef0edc41966	5242	Grahovo ob Bači
00050000-56af-09b1-6cd6-5bc1d25cdb22	5251	Grgar
00050000-56af-09b1-e805-781ec44737fe	3302	Griže
00050000-56af-09b1-5400-164b167158b8	3231	Grobelno
00050000-56af-09b1-55ed-bb17f268b158	1290	Grosuplje
00050000-56af-09b1-8355-d232c8b206d0	2288	Hajdina
00050000-56af-09b1-ce17-18b67a8ecea8	8362	Hinje
00050000-56af-09b1-8acc-94a24fefa929	2311	Hoče
00050000-56af-09b1-88be-069397e27819	9205	Hodoš/Hodos
00050000-56af-09b1-82f4-fe8124891504	1354	Horjul
00050000-56af-09b1-a66c-e1fcdad4f18e	1372	Hotedršica
00050000-56af-09b1-5d58-d38509fc568b	1430	Hrastnik
00050000-56af-09b1-f207-88a9632f449e	6225	Hruševje
00050000-56af-09b1-66dc-d81b11cc4282	4276	Hrušica
00050000-56af-09b1-5de3-a2461618f2e4	5280	Idrija
00050000-56af-09b1-0cb1-f1cec3cfa73a	1292	Ig
00050000-56af-09b1-4144-c95bef0ab530	6250	Ilirska Bistrica
00050000-56af-09b1-da44-f5bf4e7fd1e9	6251	Ilirska Bistrica-Trnovo
00050000-56af-09b1-7f1a-a5f73cf12b8e	1295	Ivančna Gorica
00050000-56af-09b1-c3f1-8d589744c92e	2259	Ivanjkovci
00050000-56af-09b1-3330-e3ba127f8097	1411	Izlake
00050000-56af-09b1-0724-c55b805d52c9	6310	Izola/Isola
00050000-56af-09b1-d065-9f32bb8982c1	2222	Jakobski Dol
00050000-56af-09b1-66c3-9a8208dd1a2c	2221	Jarenina
00050000-56af-09b1-f5dd-d48673e43355	6254	Jelšane
00050000-56af-09b1-7c60-90585beaee1f	4270	Jesenice
00050000-56af-09b1-cd81-e809015f4855	8261	Jesenice na Dolenjskem
00050000-56af-09b1-a510-0eb693869039	3273	Jurklošter
00050000-56af-09b1-e0c8-3c28dc8db7d6	2223	Jurovski Dol
00050000-56af-09b1-8411-876927603b3f	2256	Juršinci
00050000-56af-09b1-a03b-5752ab7e7a07	5214	Kal nad Kanalom
00050000-56af-09b1-396a-a45cdf7fee3b	3233	Kalobje
00050000-56af-09b1-4af4-7acf2b56370d	4246	Kamna Gorica
00050000-56af-09b1-3f11-b0f5f83abcd1	2351	Kamnica
00050000-56af-09b1-ec3d-481ee750c89a	1241	Kamnik
00050000-56af-09b1-5a5f-6202f569a8f3	5213	Kanal
00050000-56af-09b1-6baf-06a6c2045032	8258	Kapele
00050000-56af-09b1-d45b-7f023c020592	2362	Kapla
00050000-56af-09b1-2153-4139a5274a42	2325	Kidričevo
00050000-56af-09b1-d9f1-9b03c1e260ea	1412	Kisovec
00050000-56af-09b1-4cac-fdfd2dd55cdc	6253	Knežak
00050000-56af-09b1-e30c-09d5e2a6377c	5222	Kobarid
00050000-56af-09b1-e321-02b6a0767e72	9227	Kobilje
00050000-56af-09b1-984e-75b8106a72d9	1330	Kočevje
00050000-56af-09b1-c07f-be1a6296f443	1338	Kočevska Reka
00050000-56af-09b1-bf04-4dcc553393c8	2276	Kog
00050000-56af-09b1-d958-df6595d355e6	5211	Kojsko
00050000-56af-09b1-c668-36f602214db0	6223	Komen
00050000-56af-09b1-acf8-ee24c7d08cfa	1218	Komenda
00050000-56af-09b1-b963-08167a9b08bf	6000	Koper/Capodistria 
00050000-56af-09b1-4fa7-1d2899a761f9	6001	Koper/Capodistria - poštni predali
00050000-56af-09b1-2789-9dfe4d55d5e8	8282	Koprivnica
00050000-56af-09b1-37e4-6c28298fb102	5296	Kostanjevica na Krasu
00050000-56af-09b1-a6ef-105caab2f8e6	8311	Kostanjevica na Krki
00050000-56af-09b1-9ece-75b7679c923d	1336	Kostel
00050000-56af-09b1-87d1-eb578342ff38	6256	Košana
00050000-56af-09b1-b7ad-0e318e5e7aa7	2394	Kotlje
00050000-56af-09b1-414b-4ec6eae06fb6	6240	Kozina
00050000-56af-09b1-03da-4096f784c588	3260	Kozje
00050000-56af-09b1-cdb3-4dad19948db2	4000	Kranj 
00050000-56af-09b1-c025-b20a2e382e4e	4001	Kranj - poštni predali
00050000-56af-09b1-f246-b2175c600ede	4280	Kranjska Gora
00050000-56af-09b1-f205-f06ac5acde6f	1281	Kresnice
00050000-56af-09b1-2535-d4ae7d604a9c	4294	Križe
00050000-56af-09b1-12c5-60be3c62eaf7	9206	Križevci
00050000-56af-09b1-4b60-7a8ea22b8a2f	9242	Križevci pri Ljutomeru
00050000-56af-09b1-1248-ea0161417faf	1301	Krka
00050000-56af-09b1-1947-ae284258d132	8296	Krmelj
00050000-56af-09b1-252e-9d0434802486	4245	Kropa
00050000-56af-09b1-45d1-c3d7054e8fc6	8262	Krška vas
00050000-56af-09b1-af50-6d1e8f3e34c3	8270	Krško
00050000-56af-09b1-6fbc-37089532d138	9263	Kuzma
00050000-56af-09b1-9c6f-4bf96684caf8	2318	Laporje
00050000-56af-09b1-f292-837197fa4e5a	3270	Laško
00050000-56af-09b1-003b-ca72465b627b	1219	Laze v Tuhinju
00050000-56af-09b1-58c0-00cbab53f266	2230	Lenart v Slovenskih goricah
00050000-56af-09b1-7860-e267c40f92ee	9220	Lendava/Lendva
00050000-56af-09b1-fb72-62bc7baf7ccd	4248	Lesce
00050000-56af-09b1-68fd-695de4e6e883	3261	Lesično
00050000-56af-09b1-3a13-c63f50ce5114	8273	Leskovec pri Krškem
00050000-56af-09b1-cbe4-ef935ea63e1a	2372	Libeliče
00050000-56af-09b1-0407-537cd0e4f3ba	2341	Limbuš
00050000-56af-09b1-8e6c-6e8cbc6284bd	1270	Litija
00050000-56af-09b1-0729-2e2bc8524423	3202	Ljubečna
00050000-56af-09b1-057b-b464e878cc98	1000	Ljubljana 
00050000-56af-09b1-8041-4c1e901372ad	1001	Ljubljana - poštni predali
00050000-56af-09b1-31e4-ecc6eb39726e	1231	Ljubljana - Črnuče
00050000-56af-09b1-7279-71261b7bac4b	1261	Ljubljana - Dobrunje
00050000-56af-09b1-5afa-b09f2adf0744	1260	Ljubljana - Polje
00050000-56af-09b1-2e71-dfa93fdc597c	1210	Ljubljana - Šentvid
00050000-56af-09b1-922a-13a310db5aa1	1211	Ljubljana - Šmartno
00050000-56af-09b1-c5e8-b1c740c5efd4	3333	Ljubno ob Savinji
00050000-56af-09b1-18e4-32b21ebd8aa9	9240	Ljutomer
00050000-56af-09b1-add0-cb52b0c6581c	3215	Loče
00050000-56af-09b1-52c6-15dd97531d26	5231	Log pod Mangartom
00050000-56af-09b1-cd9a-59519801a2ce	1358	Log pri Brezovici
00050000-56af-09b1-30e3-06c2d4db21bf	1370	Logatec
00050000-56af-09b1-951e-fda299203065	1371	Logatec
00050000-56af-09b1-df14-0d15449a1d38	1434	Loka pri Zidanem Mostu
00050000-56af-09b1-b09a-d56ebb4ac3ca	3223	Loka pri Žusmu
00050000-56af-09b1-7fcf-388fab02673f	6219	Lokev
00050000-56af-09b1-a420-433871534b6a	1318	Loški Potok
00050000-56af-09b1-5727-0b5124cc99c0	2324	Lovrenc na Dravskem polju
00050000-56af-09b1-60cc-09632979680a	2344	Lovrenc na Pohorju
00050000-56af-09b1-fc32-f8dd3725bd55	3334	Luče
00050000-56af-09b1-6540-5b4ac9d66451	1225	Lukovica
00050000-56af-09b1-b737-7929b956254f	9202	Mačkovci
00050000-56af-09b1-f487-9178acc014e6	2322	Majšperk
00050000-56af-09b1-8c26-7fbdb2c6c430	2321	Makole
00050000-56af-09b1-223e-bf4e2c33375c	9243	Mala Nedelja
00050000-56af-09b1-1e82-f56cc9b49ff9	2229	Malečnik
00050000-56af-09b1-c5be-652c59a39cbc	6273	Marezige
00050000-56af-09b1-841d-7579f3f72ee3	2000	Maribor 
00050000-56af-09b1-2d14-66f94d6a59db	2001	Maribor - poštni predali
00050000-56af-09b1-8350-dc75bab0fd23	2206	Marjeta na Dravskem polju
00050000-56af-09b1-7752-dec2c5b05bcd	2281	Markovci
00050000-56af-09b1-5f58-af961a408020	9221	Martjanci
00050000-56af-09b1-f407-2359f4477a87	6242	Materija
00050000-56af-09b1-ff4e-d6a9e013d23d	4211	Mavčiče
00050000-56af-09b1-aa38-5e54148e1bff	1215	Medvode
00050000-56af-09b1-d413-f58af8653186	1234	Mengeš
00050000-56af-09b1-9825-5280c099bb36	8330	Metlika
00050000-56af-09b1-a965-5af9f1cbad65	2392	Mežica
00050000-56af-09b1-874d-84da7aa10f24	2204	Miklavž na Dravskem polju
00050000-56af-09b1-4959-dc32d699afdc	2275	Miklavž pri Ormožu
00050000-56af-09b1-0d6f-362a452e572e	5291	Miren
00050000-56af-09b1-5af6-6f4cba3fcd5a	8233	Mirna
00050000-56af-09b1-668a-4719c7f42604	8216	Mirna Peč
00050000-56af-09b1-15d9-cbe58c559a42	2382	Mislinja
00050000-56af-09b1-30c7-98448bab0b41	4281	Mojstrana
00050000-56af-09b1-b427-05bc0acbcab7	8230	Mokronog
00050000-56af-09b1-7c5e-90a3c341cd61	1251	Moravče
00050000-56af-09b1-695d-7464d9c62b6f	9226	Moravske Toplice
00050000-56af-09b1-6b94-ca447f0691aa	5216	Most na Soči
00050000-56af-09b1-6f96-daad40f0f4c9	1221	Motnik
00050000-56af-09b1-a883-4a8f97a80d3c	3330	Mozirje
00050000-56af-09b1-b758-a67de1af910c	9000	Murska Sobota 
00050000-56af-09b1-934d-e06fb308247b	9001	Murska Sobota - poštni predali
00050000-56af-09b1-648f-29e9f605bade	2366	Muta
00050000-56af-09b1-0ed5-0dd9bf8c0dad	4202	Naklo
00050000-56af-09b1-ed90-8fb5c05f5818	3331	Nazarje
00050000-56af-09b1-b5cb-92d343ed0504	1357	Notranje Gorice
00050000-56af-09b1-0af3-8968189a3528	3203	Nova Cerkev
00050000-56af-09b1-988d-fe12aff38125	5000	Nova Gorica 
00050000-56af-09b1-15aa-8841f22b40b4	5001	Nova Gorica - poštni predali
00050000-56af-09b1-9fa7-83900a9ac95d	1385	Nova vas
00050000-56af-09b1-35c8-edcb80880c72	8000	Novo mesto
00050000-56af-09b1-9459-d848c29b3a5a	8001	Novo mesto - poštni predali
00050000-56af-09b1-2e86-bb20fe5f05bd	6243	Obrov
00050000-56af-09b1-5391-c4f8b2e53f35	9233	Odranci
00050000-56af-09b1-06a8-f0a2d0ee8864	2317	Oplotnica
00050000-56af-09b1-9ef5-8af3bd13b72a	2312	Orehova vas
00050000-56af-09b1-752a-f1cb2a5f1f11	2270	Ormož
00050000-56af-09b1-90dd-53523833ad46	1316	Ortnek
00050000-56af-09b1-3580-c04a59c3adc4	1337	Osilnica
00050000-56af-09b1-7e69-e7c2be480df5	8222	Otočec
00050000-56af-09b1-6ae1-a9209eba44c4	2361	Ožbalt
00050000-56af-09b1-59e5-ec7d09fd9e9b	2231	Pernica
00050000-56af-09b1-719d-c6773fa03fc4	2211	Pesnica pri Mariboru
00050000-56af-09b1-227b-97f84f705f8c	9203	Petrovci
00050000-56af-09b1-f7a6-2e82369d2f2e	3301	Petrovče
00050000-56af-09b1-0704-ae6a8876c64c	6330	Piran/Pirano
00050000-56af-09b1-3cc5-c8a6d61d8cf9	8255	Pišece
00050000-56af-09b1-1ee8-5050d4a0c6ca	6257	Pivka
00050000-56af-09b1-04ec-cda26148ca94	6232	Planina
00050000-56af-09b1-d628-e986e12e1ac8	3225	Planina pri Sevnici
00050000-56af-09b1-7727-04c8dc77582f	6276	Pobegi
00050000-56af-09b1-d8d0-aa60efb3c7f9	8312	Podbočje
00050000-56af-09b1-f197-f1c43f67c5e5	5243	Podbrdo
00050000-56af-09b1-948b-df9305344bdd	3254	Podčetrtek
00050000-56af-09b1-3fa3-ab54114aeacb	2273	Podgorci
00050000-56af-09b1-76db-c3716b38f68f	6216	Podgorje
00050000-56af-09b1-a67b-4dd68142c013	2381	Podgorje pri Slovenj Gradcu
00050000-56af-09b1-d12e-f1004d187431	6244	Podgrad
00050000-56af-09b1-0914-b89306ded998	1414	Podkum
00050000-56af-09b1-c110-ba1529de14d2	2286	Podlehnik
00050000-56af-09b1-5311-a06b9b336477	5272	Podnanos
00050000-56af-09b1-b0b9-52ec8cfad6d3	4244	Podnart
00050000-56af-09b1-6abe-be87c2a9c074	3241	Podplat
00050000-56af-09b1-4dbc-8cb3fa65cf6c	3257	Podsreda
00050000-56af-09b1-d194-deec53640566	2363	Podvelka
00050000-56af-09b1-b495-5c9c24a6ce52	2208	Pohorje
00050000-56af-09b1-c9a6-5117275944ef	2257	Polenšak
00050000-56af-09b1-748a-b9bbbc52c13b	1355	Polhov Gradec
00050000-56af-09b1-f28c-c60e1149f86f	4223	Poljane nad Škofjo Loko
00050000-56af-09b1-8153-c67c018dacf8	2319	Poljčane
00050000-56af-09b1-0e72-35bba40aa571	1272	Polšnik
00050000-56af-09b1-4849-e64510ed3596	3313	Polzela
00050000-56af-09b1-2708-e2e1989ccb35	3232	Ponikva
00050000-56af-09b1-d627-a530dc397d9c	6320	Portorož/Portorose
00050000-56af-09b1-44ad-f02ff4f8a1e1	6230	Postojna
00050000-56af-09b1-d2d3-302466e96f67	2331	Pragersko
00050000-56af-09b1-4a6a-e3b8bfcb00fd	3312	Prebold
00050000-56af-09b1-c6f2-822876ded7d4	4205	Preddvor
00050000-56af-09b1-cfe2-ec64347087dc	6255	Prem
00050000-56af-09b1-64fa-c57854ffbdce	1352	Preserje
00050000-56af-09b1-dece-93fff9cef709	6258	Prestranek
00050000-56af-09b1-2c7b-70bb30e53a65	2391	Prevalje
00050000-56af-09b1-820b-9c878192b950	3262	Prevorje
00050000-56af-09b1-0364-120d4de10bba	1276	Primskovo 
00050000-56af-09b1-b36e-4a15b6216b3b	3253	Pristava pri Mestinju
00050000-56af-09b1-0e0f-ba391df09fc6	9207	Prosenjakovci/Partosfalva
00050000-56af-09b1-6b01-b34bee37b684	5297	Prvačina
00050000-56af-09b1-cbf9-8f8b0d02f801	2250	Ptuj
00050000-56af-09b1-6dce-394cd0cb046d	2323	Ptujska Gora
00050000-56af-09b1-9ee6-95e1ef24d381	9201	Puconci
00050000-56af-09b1-dd5b-8be8c911d81b	2327	Rače
00050000-56af-09b1-aea5-d7cc1fe22c1c	1433	Radeče
00050000-56af-09b1-efad-a25810d792e8	9252	Radenci
00050000-56af-09b1-cb31-a2d4e0b8730b	2360	Radlje ob Dravi
00050000-56af-09b1-9a98-d0091fa81d94	1235	Radomlje
00050000-56af-09b1-cd14-d8aadb4eff53	4240	Radovljica
00050000-56af-09b1-8f27-fad05866de99	8274	Raka
00050000-56af-09b1-47a3-3fc886f669ff	1381	Rakek
00050000-56af-09b1-9fab-e751b172d6db	4283	Rateče - Planica
00050000-56af-09b1-9a28-ece4d71b33e2	2390	Ravne na Koroškem
00050000-56af-09b1-426c-1c1f73ee3f5d	9246	Razkrižje
00050000-56af-09b1-2119-bea858dfa8a1	3332	Rečica ob Savinji
00050000-56af-09b1-55ee-3bdda7f532ab	5292	Renče
00050000-56af-09b1-9e3f-e9917e1f3b86	1310	Ribnica
00050000-56af-09b1-9a29-ccbc0ea324b9	2364	Ribnica na Pohorju
00050000-56af-09b1-6176-12f277ef29ed	3272	Rimske Toplice
00050000-56af-09b1-775a-7d8bb5042323	1314	Rob
00050000-56af-09b1-e14a-00a06c625dd5	5215	Ročinj
00050000-56af-09b1-2b79-f7b837e96127	3250	Rogaška Slatina
00050000-56af-09b1-9329-26ba25f9614c	9262	Rogašovci
00050000-56af-09b1-3977-ca87333b06e5	3252	Rogatec
00050000-56af-09b1-3914-685132359ff8	1373	Rovte
00050000-56af-09b1-8795-505b083d46ab	2342	Ruše
00050000-56af-09b1-937b-9962a7a7c451	1282	Sava
00050000-56af-09b1-d4c6-0c3dfc00c8b6	6333	Sečovlje/Sicciole
00050000-56af-09b1-84a9-52d94f8f109b	4227	Selca
00050000-56af-09b1-b688-247e8101deb3	2352	Selnica ob Dravi
00050000-56af-09b1-42f0-fb34dbba365c	8333	Semič
00050000-56af-09b1-51a9-ba8fb063abaa	8281	Senovo
00050000-56af-09b1-22db-80b240b2ef11	6224	Senožeče
00050000-56af-09b1-43b8-290cad1169e6	8290	Sevnica
00050000-56af-09b1-4dd3-0bc0b833ac00	6210	Sežana
00050000-56af-09b1-741a-0278d6d7b4c8	2214	Sladki Vrh
00050000-56af-09b1-2c87-d7b0f49cf2fc	5283	Slap ob Idrijci
00050000-56af-09b1-7a52-33a94c513840	2380	Slovenj Gradec
00050000-56af-09b1-73b8-ba4c2123f9df	2310	Slovenska Bistrica
00050000-56af-09b1-d4a4-1ac6f80dc183	3210	Slovenske Konjice
00050000-56af-09b1-341e-609bfc35bb04	1216	Smlednik
00050000-56af-09b1-1a6b-55c385d38393	5232	Soča
00050000-56af-09b1-ba79-e286b8faa457	1317	Sodražica
00050000-56af-09b1-d5e4-0e68a56a3eac	3335	Solčava
00050000-56af-09b1-b53c-f7314b64c6a2	5250	Solkan
00050000-56af-09b1-a5d5-f77397906534	4229	Sorica
00050000-56af-09b1-4b4a-aea105d9d6d8	4225	Sovodenj
00050000-56af-09b1-b77b-eb4e6f2dde97	5281	Spodnja Idrija
00050000-56af-09b1-5b69-1480ed87a93c	2241	Spodnji Duplek
00050000-56af-09b1-8396-8027a3099d3f	9245	Spodnji Ivanjci
00050000-56af-09b1-e0bb-b40f1c4d73df	2277	Središče ob Dravi
00050000-56af-09b1-4d58-18f1b238a6a3	4267	Srednja vas v Bohinju
00050000-56af-09b1-9cbc-7fb2490b5932	8256	Sromlje 
00050000-56af-09b1-1ce4-3c33897c60d0	5224	Srpenica
00050000-56af-09b1-d954-48ccacbbac2e	1242	Stahovica
00050000-56af-09b1-2095-de0ad9e348a2	1332	Stara Cerkev
00050000-56af-09b1-3000-f2ddb41095de	8342	Stari trg ob Kolpi
00050000-56af-09b1-1243-c804989db3a0	1386	Stari trg pri Ložu
00050000-56af-09b1-cf4c-62b123b3d9af	2205	Starše
00050000-56af-09b1-7f53-a5c174a3f85a	2289	Stoperce
00050000-56af-09b1-9af8-5190db28fb98	8322	Stopiče
00050000-56af-09b1-9e76-4f1f2493e90f	3206	Stranice
00050000-56af-09b1-158d-22caa006cb40	8351	Straža
00050000-56af-09b1-01a6-700425ccec8e	1313	Struge
00050000-56af-09b1-b09e-d87b46b5c37c	8293	Studenec
00050000-56af-09b1-87d8-be72995c7bad	8331	Suhor
00050000-56af-09b1-3514-d992802283f0	2233	Sv. Ana v Slovenskih goricah
00050000-56af-09b1-f163-08caca0a9f98	2235	Sv. Trojica v Slovenskih goricah
00050000-56af-09b1-a326-4785f18bd950	2353	Sveti Duh na Ostrem Vrhu
00050000-56af-09b1-31b3-bbf967750d54	9244	Sveti Jurij ob Ščavnici
00050000-56af-09b1-f824-49ddb7ffd087	3264	Sveti Štefan
00050000-56af-09b1-7ebc-eaa085c9b927	2258	Sveti Tomaž
00050000-56af-09b1-c223-f4a22c97d368	9204	Šalovci
00050000-56af-09b1-2fc2-4c8bcc6f1c62	5261	Šempas
00050000-56af-09b1-9773-645b285aeb08	5290	Šempeter pri Gorici
00050000-56af-09b1-2a9c-3385e65ebcf8	3311	Šempeter v Savinjski dolini
00050000-56af-09b1-10f3-0cfec9c0328a	4208	Šenčur
00050000-56af-09b1-cc0f-726c92c29583	2212	Šentilj v Slovenskih goricah
00050000-56af-09b1-0c2b-53126bd5d77a	8297	Šentjanž
00050000-56af-09b1-96b4-354717498339	2373	Šentjanž pri Dravogradu
00050000-56af-09b1-c8c0-4644c39ccc08	8310	Šentjernej
00050000-56af-09b1-b55b-4939673145e8	3230	Šentjur
00050000-56af-09b1-fcd7-45f6c84ced01	3271	Šentrupert
00050000-56af-09b1-9da7-f5f59513a81a	8232	Šentrupert
00050000-56af-09b1-3b06-c36802a24c34	1296	Šentvid pri Stični
00050000-56af-09b1-4993-ac53f947833f	8275	Škocjan
00050000-56af-09b1-2cb0-190cc7a40130	6281	Škofije
00050000-56af-09b1-92fb-ced0d2b30bc4	4220	Škofja Loka
00050000-56af-09b1-2485-51ed39962dcb	3211	Škofja vas
00050000-56af-09b1-d3d6-5ed03a30db37	1291	Škofljica
00050000-56af-09b1-c156-9ca199574718	6274	Šmarje
00050000-56af-09b1-56a6-57f82d0d09f3	1293	Šmarje - Sap
00050000-56af-09b1-ac3d-3f53a237f340	3240	Šmarje pri Jelšah
00050000-56af-09b1-6b40-4b1b2ed94371	8220	Šmarješke Toplice
00050000-56af-09b1-a0c1-f41cf8e70822	2315	Šmartno na Pohorju
00050000-56af-09b1-55b5-71e19f4aad23	3341	Šmartno ob Dreti
00050000-56af-09b1-4a03-db957acbea34	3327	Šmartno ob Paki
00050000-56af-09b1-7ee7-fd7ee1380ab1	1275	Šmartno pri Litiji
00050000-56af-09b1-2214-49009a115d99	2383	Šmartno pri Slovenj Gradcu
00050000-56af-09b1-7130-e6bf6c1a2ad5	3201	Šmartno v Rožni dolini
00050000-56af-09b1-8714-3ea3b5f97a54	3325	Šoštanj
00050000-56af-09b1-a91c-1c07dbcae1d6	6222	Štanjel
00050000-56af-09b1-d158-b64d42133dda	3220	Štore
00050000-56af-09b1-521e-dc671c0fce9c	3304	Tabor
00050000-56af-09b1-b175-905feaf68f33	3221	Teharje
00050000-56af-09b2-7b13-f39e06509d86	9251	Tišina
00050000-56af-09b2-ef14-c785ebb4e4b9	5220	Tolmin
00050000-56af-09b2-e3a7-0e4ffb0f48f3	3326	Topolšica
00050000-56af-09b2-0141-13ad9f7ce641	2371	Trbonje
00050000-56af-09b2-5a5f-eb919c87ec50	1420	Trbovlje
00050000-56af-09b2-3d08-ad74098198cc	8231	Trebelno 
00050000-56af-09b2-be91-cf6a7947f226	8210	Trebnje
00050000-56af-09b2-6764-96d93fc578c2	5252	Trnovo pri Gorici
00050000-56af-09b2-4350-469d400a1d49	2254	Trnovska vas
00050000-56af-09b2-e84a-95d8c96f669c	1222	Trojane
00050000-56af-09b2-35d9-5b5830f1a830	1236	Trzin
00050000-56af-09b2-ec6a-a19c73837966	4290	Tržič
00050000-56af-09b2-7c5b-06b83a808b80	8295	Tržišče
00050000-56af-09b2-ff7f-eafdd088995d	1311	Turjak
00050000-56af-09b2-a82b-c940d892b314	9224	Turnišče
00050000-56af-09b2-a2f0-e78d1b46dfdc	8323	Uršna sela
00050000-56af-09b2-b70d-fff13110df04	1252	Vače
00050000-56af-09b2-bd8c-98ba86bd605a	3320	Velenje 
00050000-56af-09b2-594c-8ec1b442d323	3322	Velenje - poštni predali
00050000-56af-09b2-977f-a1f95e0acce7	8212	Velika Loka
00050000-56af-09b2-ea99-3c53bacda42e	2274	Velika Nedelja
00050000-56af-09b2-2faa-bc95dd0010b4	9225	Velika Polana
00050000-56af-09b2-1d66-4ac702d290ba	1315	Velike Lašče
00050000-56af-09b2-cc1b-f924bf0d9fc2	8213	Veliki Gaber
00050000-56af-09b2-3b2f-df380a555b9e	9241	Veržej
00050000-56af-09b2-a148-6f0e9ba6104b	1312	Videm - Dobrepolje
00050000-56af-09b2-6ad6-eb4744a9cb8e	2284	Videm pri Ptuju
00050000-56af-09b2-78d1-ae67effe0591	8344	Vinica
00050000-56af-09b2-0820-455b253f14c2	5271	Vipava
00050000-56af-09b2-6675-8f43a1c58502	4212	Visoko
00050000-56af-09b2-04c5-80c76c286a8a	1294	Višnja Gora
00050000-56af-09b2-a41a-2edd36129bf2	3205	Vitanje
00050000-56af-09b2-bb82-6eee4d955b37	2255	Vitomarci
00050000-56af-09b2-b9ba-1fcff7e7f821	1217	Vodice
00050000-56af-09b2-2d46-acc8c12ed2a4	3212	Vojnik\t
00050000-56af-09b2-b8d2-a4c134473373	5293	Volčja Draga
00050000-56af-09b2-ba72-939b637ee42b	2232	Voličina
00050000-56af-09b2-0584-04aec4170f8b	3305	Vransko
00050000-56af-09b2-9037-d50c98a93698	6217	Vremski Britof
00050000-56af-09b2-7c4f-70c4d5dd3ae8	1360	Vrhnika
00050000-56af-09b2-42e5-6c64a3bd88b7	2365	Vuhred
00050000-56af-09b2-46cb-5c555d9523bb	2367	Vuzenica
00050000-56af-09b2-adec-07121b52a9e8	8292	Zabukovje 
00050000-56af-09b2-558c-3bfc2ce87744	1410	Zagorje ob Savi
00050000-56af-09b2-db7c-fab145a44ac7	1303	Zagradec
00050000-56af-09b2-49b1-85c3db0ce703	2283	Zavrč
00050000-56af-09b2-a0d8-ccf3765c2911	8272	Zdole 
00050000-56af-09b2-3df5-9a8b287591ce	4201	Zgornja Besnica
00050000-56af-09b2-d9b2-692749b01dc9	2242	Zgornja Korena
00050000-56af-09b2-c560-9be1bb465ef4	2201	Zgornja Kungota
00050000-56af-09b2-88e2-2865dd562f89	2316	Zgornja Ložnica
00050000-56af-09b2-5a1b-f71adf655af0	2314	Zgornja Polskava
00050000-56af-09b2-2742-5ee42934788f	2213	Zgornja Velka
00050000-56af-09b2-91e1-1bdc8aae3d68	4247	Zgornje Gorje
00050000-56af-09b2-8aae-f76b43c37b0d	4206	Zgornje Jezersko
00050000-56af-09b2-de0a-f90a7262f441	2285	Zgornji Leskovec
00050000-56af-09b2-56ad-1b2533492727	1432	Zidani Most
00050000-56af-09b2-33e5-6bc3e215d5de	3214	Zreče
00050000-56af-09b2-3374-112a8ec19bc0	4209	Žabnica
00050000-56af-09b2-aa4a-ad91e907f624	3310	Žalec
00050000-56af-09b2-4a23-0258ff5bded0	4228	Železniki
00050000-56af-09b2-cf33-967c45b26587	2287	Žetale
00050000-56af-09b2-4b8e-6ee21b9a1373	4226	Žiri
00050000-56af-09b2-c951-7e2e2c417001	4274	Žirovnica
00050000-56af-09b2-662c-6a144a6a18bb	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 42129983)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 42129553)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 42129293)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56af-09b5-47af-bef12b72cd2b	00080000-56af-09b5-a907-fcc7a5e3c861	\N	00040000-56af-09b2-c434-1b3888037691	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56af-09b5-101d-7796e791fd69	00080000-56af-09b5-a907-fcc7a5e3c861	\N	00040000-56af-09b2-c434-1b3888037691	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56af-09b5-3ffb-b515e315743a	00080000-56af-09b5-3ab1-20709d9db0c2	\N	00040000-56af-09b2-c434-1b3888037691	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 42129428)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56af-09b2-17ae-a19b5971a581	novo leto	1	1	\N	t
00430000-56af-09b2-7c4a-3742b345881c	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56af-09b2-588e-d3a95372cbf5	dan upora proti okupatorju	27	4	\N	t
00430000-56af-09b2-f611-c3d155a59c63	praznik dela	1	5	\N	t
00430000-56af-09b2-5dbc-18b86942fc35	praznik dela	2	5	\N	t
00430000-56af-09b2-9fdf-da6b9da15789	dan Primoža Trubarja	8	6	\N	f
00430000-56af-09b2-cbfb-a60648ae7f5d	dan državnosti	25	6	\N	t
00430000-56af-09b2-d315-08908bc5cef5	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56af-09b2-accf-c4eded9a41a4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56af-09b2-d009-51ef496875ff	dan suverenosti	25	10	\N	f
00430000-56af-09b2-b425-f4a3aa92391b	dan spomina na mrtve	1	11	\N	t
00430000-56af-09b2-8a9f-e23392cdc1f4	dan Rudolfa Maistra	23	11	\N	f
00430000-56af-09b2-b4c6-849d9bec10b8	božič	25	12	\N	t
00430000-56af-09b2-8759-94e7bf697dcb	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56af-09b2-0627-69c390f4c684	Marijino vnebovzetje	15	8	\N	t
00430000-56af-09b2-dd3c-6afd2d66ad25	dan reformacije	31	10	\N	t
00430000-56af-09b2-97b1-989f0b90184d	velikonočna nedelja	27	3	2016	t
00430000-56af-09b2-4d4d-4783e1b78d01	velikonočna nedelja	16	4	2017	t
00430000-56af-09b2-b3da-7772d86e3bf4	velikonočna nedelja	1	4	2018	t
00430000-56af-09b2-531b-1a7a01faaaed	velikonočna nedelja	21	4	2019	t
00430000-56af-09b2-db3f-b226e79281e0	velikonočna nedelja	12	4	2020	t
00430000-56af-09b2-2bf4-2502f51515bf	velikonočna nedelja	4	4	2021	t
00430000-56af-09b2-20e1-66a717c47478	velikonočna nedelja	17	4	2022	t
00430000-56af-09b2-91e9-e6d1bd4a2b9d	velikonočna nedelja	9	4	2023	t
00430000-56af-09b2-ed06-f8dc5d056880	velikonočna nedelja	31	3	2024	t
00430000-56af-09b2-611b-642a6644261b	velikonočna nedelja	20	4	2025	t
00430000-56af-09b2-3e23-ed97543ed84b	velikonočna nedelja	5	4	2026	t
00430000-56af-09b2-8f18-868b1c752e19	velikonočna nedelja	28	3	2027	t
00430000-56af-09b2-182c-2268132c91ad	velikonočna nedelja	16	4	2028	t
00430000-56af-09b2-6374-6d39664e6775	velikonočna nedelja	1	4	2029	t
00430000-56af-09b2-d02c-fa573026d526	velikonočna nedelja	21	4	2030	t
00430000-56af-09b2-4461-3aeba333d142	velikonočni ponedeljek	28	3	2016	t
00430000-56af-09b2-f12a-86bff446e062	velikonočni ponedeljek	17	4	2017	t
00430000-56af-09b2-260b-ea56725f2dda	velikonočni ponedeljek	2	4	2018	t
00430000-56af-09b2-4d21-f0d62801700a	velikonočni ponedeljek	22	4	2019	t
00430000-56af-09b2-05b7-ccadc80a3c5f	velikonočni ponedeljek	13	4	2020	t
00430000-56af-09b2-a593-30b97630103d	velikonočni ponedeljek	5	4	2021	t
00430000-56af-09b2-b933-6f0e72f5a43f	velikonočni ponedeljek	18	4	2022	t
00430000-56af-09b2-ec32-b3da89e95ba7	velikonočni ponedeljek	10	4	2023	t
00430000-56af-09b2-6fe2-042d4a0176ce	velikonočni ponedeljek	1	4	2024	t
00430000-56af-09b2-7b1b-e744f831efc2	velikonočni ponedeljek	21	4	2025	t
00430000-56af-09b2-68cd-5bd43364314f	velikonočni ponedeljek	6	4	2026	t
00430000-56af-09b2-199c-434d49ca8acf	velikonočni ponedeljek	29	3	2027	t
00430000-56af-09b2-a811-784a8c5c64c9	velikonočni ponedeljek	17	4	2028	t
00430000-56af-09b2-8b88-4122451e572e	velikonočni ponedeljek	2	4	2029	t
00430000-56af-09b2-ca6b-d0fa945d9d56	velikonočni ponedeljek	22	4	2030	t
00430000-56af-09b2-d5b7-eb234c5f5053	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56af-09b2-a262-a423d4f3bacb	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56af-09b2-e93d-5ab56ae016ec	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56af-09b2-6ee3-ed46c7b6a3ae	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56af-09b2-520e-6c48ec3b548f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56af-09b2-3caf-21e6d2db608b	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56af-09b2-ce07-2aead9579509	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56af-09b2-d16b-908b96209bc4	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56af-09b2-25a4-df0a0d302ab5	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56af-09b2-90f9-7b847eb64497	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56af-09b2-0595-147a96efd2bb	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56af-09b2-022e-868f30244a77	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56af-09b2-fb0f-36043e718c20	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56af-09b2-e856-9b821d321ae4	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56af-09b2-9e5f-dfffaab0b3f6	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 42129397)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56af-09b6-b97d-c4ff2e0ea698	000e0000-56af-09b5-63ee-f12c67a39797	1	3	1
001b0000-56af-09b6-be54-3ed383b1e118	000e0000-56af-09b5-63ee-f12c67a39797	2	4	2
001b0000-56af-09b6-2615-a5bce97eb586	000e0000-56af-09b5-63ee-f12c67a39797	4	5	3
001b0000-56af-09b6-8253-d27c64e6ff11	000e0000-56af-09b5-63ee-f12c67a39797	\N	1	\N
001b0000-56af-09b6-e617-1fe00c2efad6	000e0000-56af-09b5-63ee-f12c67a39797	5	9	4
001b0000-56af-09b6-750e-a97a499f2f7d	000e0000-56af-09b5-63ee-f12c67a39797	7	10	5
001b0000-56af-09b6-f27d-68e8fb9c12fe	000e0000-56af-09b5-5d55-1db2045162be	3	2	1
001b0000-56af-09b6-8db8-892ed988f4d3	000e0000-56af-09b5-5d55-1db2045162be	4	3	1
001b0000-56af-09b6-b801-38db9a9fbc8e	000e0000-56af-09b5-63ee-f12c67a39797	\N	2	\N
001b0000-56af-09b6-b2fc-ab68d586255b	000e0000-56af-09b5-5d55-1db2045162be	\N	1	\N
001b0000-56af-09b6-7753-5e5f55d26937	000e0000-56af-09b5-63ee-f12c67a39797	3	8	3
001b0000-56af-09b6-343c-298db0e7b7df	000e0000-56af-09b5-63ee-f12c67a39797	2	11	1
001b0000-56af-09b6-9622-2611bad03b90	000e0000-56af-09b5-5d55-1db2045162be	1	5	1
001b0000-56af-09b6-4aac-7ad8798ad4b7	000e0000-56af-09b5-5d55-1db2045162be	6	4	2
001b0000-56af-09b6-c7cc-adbbf72c5c0d	000e0000-56af-09b5-63ee-f12c67a39797	1	6	1
001b0000-56af-09b6-841a-560afb17fa1b	000e0000-56af-09b5-63ee-f12c67a39797	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 42129403)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56af-09b6-b97d-c4ff2e0ea698	000a0000-56af-09b5-fcc2-3d034521139b
001b0000-56af-09b6-b97d-c4ff2e0ea698	000a0000-56af-09b5-00f2-0d74b9f8d7c3
001b0000-56af-09b6-be54-3ed383b1e118	000a0000-56af-09b5-00f2-0d74b9f8d7c3
001b0000-56af-09b6-be54-3ed383b1e118	000a0000-56af-09b5-f9a8-021f0338fe61
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 42129565)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 42129997)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 42130007)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56af-09b5-041d-c050f35c8ead	00080000-56af-09b5-b9e8-1b77ab6c1473	0987	AK
00190000-56af-09b5-8e83-4f42db1db862	00080000-56af-09b5-3ab1-20709d9db0c2	0989	AK
00190000-56af-09b5-b79c-7bb08f7d9fcf	00080000-56af-09b5-378a-bda0005d73ac	0986	AK
00190000-56af-09b5-6a86-51ec2f869127	00080000-56af-09b5-e847-e4ffe511b22d	0984	AK
00190000-56af-09b5-f81a-30b22b5be622	00080000-56af-09b5-101f-2ace6793c2ee	0983	AK
00190000-56af-09b5-bff5-e81ada43ffb3	00080000-56af-09b5-8434-6b415350e227	0982	AK
00190000-56af-09b7-5512-b2132c32ea16	00080000-56af-09b7-28ad-65233b20c4bd	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 42129896)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56af-09b6-1a97-1044c822e496	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 42130015)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 42129593)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56af-09b5-3613-f5b7c765bd4c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56af-09b5-dc1c-e867af926ac6	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56af-09b5-9d45-680f3957ae9f	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56af-09b5-8715-aae22123427b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56af-09b5-7554-1d3ea30025e9	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56af-09b5-ae66-35bf323489bc	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56af-09b5-82fc-870dbe680019	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 42129538)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 42129528)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 42129735)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 42129665)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 42129371)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 42129132)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56af-09b7-28ad-65233b20c4bd	00010000-56af-09b3-8546-7bdc4e3807a5	2016-02-01 08:31:03	INS	a:0:{}
2	App\\Entity\\Option	00000000-56af-09b7-4f7d-6d0505aeca00	00010000-56af-09b3-8546-7bdc4e3807a5	2016-02-01 08:31:03	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56af-09b7-5512-b2132c32ea16	00010000-56af-09b3-8546-7bdc4e3807a5	2016-02-01 08:31:03	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 42129607)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 42129170)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56af-09b2-231a-db27b654ff9b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56af-09b2-0dff-f150e0058d2c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56af-09b2-cad9-ad9f09c30c3f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56af-09b2-fc23-4cd9c2fc9a69	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56af-09b2-005f-3578347e7171	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56af-09b2-060f-f274dea3ddf6	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56af-09b2-afa9-0605f5a99eae	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56af-09b2-4e1e-816a4b782847	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56af-09b2-aea6-1a241e77f36c	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-09b2-4ef7-62ea8f8ee531	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-09b2-08e0-70f94f07e897	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-09b2-59af-f9d206422dfb	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-09b2-3808-89e0a7c30ba7	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-09b2-b16f-9eab10baa6c4	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-09b2-93fd-a45a3393ec5a	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-09b2-11b0-2df00d365f5a	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-09b2-7c5b-2cd1b0e343f0	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56af-09b2-84ff-169176b67579	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56af-09b2-b341-15a93c3aaa17	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56af-09b2-527a-557bcac9e506	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56af-09b2-2717-6a697424377a	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-09b2-0263-d8567915243b	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-09b2-ccf7-1cd79cbe8156	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-09b2-6955-e7671e3bc287	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-09b2-8d36-2bc3a4ad4772	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56af-09b2-33a9-eabdd2326aae	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56af-09b2-e165-0b6d0546f6a6	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56af-09b2-bb02-f981767b626f	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56af-09b2-e2c9-58de7e794699	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56af-09b2-0518-bcac9dccd1db	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56af-09b2-26dd-5d12bfc0866f	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-09b2-d953-4f7cd32a617f	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-09b2-a46a-0ffa90fb2d5e	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56af-09b2-a4ed-bacab87f726d	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56af-09b2-8ee9-5c98476d9888	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56af-09b2-60e7-a1b6619aa95d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56af-09b3-f189-e816518ebf5b	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-09b3-90af-eb60e6648c38	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-09b3-09a3-f13f9517a39f	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56af-09b3-d95b-93778a578a6f	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-09b3-c6f6-08f5d53bf8f8	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-09b3-ba05-e6b0810185b6	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56af-09b3-9ed8-b85810b04432	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-09b3-839f-3d37cc042f20	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-09b3-bfbe-b225a1ee2224	direktor	minimalne pravice za direktorja	t
00020000-56af-09b3-bc0b-c2b04163463d	arhivar	arhivar	t
00020000-56af-09b3-bda5-c9d728ca8205	dramaturg	dramaturg	t
00020000-56af-09b3-a660-b4bd139d100a	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56af-09b3-08ba-15b28e3ac77f	poslovni-sekretar	poslovni sekretar	t
00020000-56af-09b3-b6e8-7b0eb525d1a5	vodja-tehnike	vodja tehnike	t
00020000-56af-09b3-ffd0-bcd056f52842	racunovodja	računovodja	t
00020000-56af-09b5-a2cb-c24fc383d1b6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56af-09b5-0512-815001ffd155	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-b5de-2ac5609335bd	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-948a-0eec66a011d3	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-1087-225ca4b460ac	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-8f56-9b8dfadc226d	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-caa3-88a74f6abe9d	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-1ecd-efb5aa63d653	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-eb81-b7fdde118f46	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-d306-21a86a473c74	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-a914-b57373c35663	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-2e0a-8d36985668e1	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-661c-0388a30edf5b	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-ddaf-ff581dedd2b7	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-1205-41cd56175bc6	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-76ac-9c88b165d137	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-b428-7338e673bb82	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-a950-914b0c86448e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-cb99-68082c21a38e	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-47dc-f3527d7cd035	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56af-09b5-f2c8-f80ac875bf7d	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-3736-9864532e521b	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-bd3b-9dcf6ef8a627	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-9c8e-94f98d837c21	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-7fe9-36083eafd111	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-7bc2-19b0e3e938aa	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-319c-c935ee484b7d	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-da5b-c58256c95a8e	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-7737-a508db9a9ce8	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-0106-64747cff1093	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-6e24-bb0de5f9fa1f	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-e0bc-2bde42b9a1bb	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-be92-71c1df84e481	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-6cd3-ae67ffb2b5df	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-ffa5-04a90f0536e2	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-5405-deee5ff102d5	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-1ee9-d4bcf01ca60c	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-c1d1-d0b95fc6c656	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56af-09b5-4016-a22b894b3c79	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 42129154)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56af-09b3-9f3f-0452c3101553	00020000-56af-09b2-cad9-ad9f09c30c3f
00010000-56af-09b3-8546-7bdc4e3807a5	00020000-56af-09b2-cad9-ad9f09c30c3f
00010000-56af-09b5-5ea5-5d7ba1e56e01	00020000-56af-09b5-a2cb-c24fc383d1b6
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-0512-815001ffd155
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-8f56-9b8dfadc226d
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-d306-21a86a473c74
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-2e0a-8d36985668e1
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-ddaf-ff581dedd2b7
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-cb99-68082c21a38e
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-948a-0eec66a011d3
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-f2c8-f80ac875bf7d
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-9c8e-94f98d837c21
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-7bc2-19b0e3e938aa
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-da5b-c58256c95a8e
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-0106-64747cff1093
00010000-56af-09b5-a203-3acbef8331d6	00020000-56af-09b5-6cd3-ae67ffb2b5df
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-0512-815001ffd155
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-b5de-2ac5609335bd
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-948a-0eec66a011d3
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-1087-225ca4b460ac
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-ddaf-ff581dedd2b7
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-b428-7338e673bb82
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-f2c8-f80ac875bf7d
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-9c8e-94f98d837c21
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-7bc2-19b0e3e938aa
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-da5b-c58256c95a8e
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-0106-64747cff1093
00010000-56af-09b5-4301-16ac4754cc22	00020000-56af-09b5-6cd3-ae67ffb2b5df
00010000-56af-09b5-0fc6-b80cac3e51c0	00020000-56af-09b5-0512-815001ffd155
00010000-56af-09b5-0fc6-b80cac3e51c0	00020000-56af-09b5-b5de-2ac5609335bd
00010000-56af-09b5-0fc6-b80cac3e51c0	00020000-56af-09b5-948a-0eec66a011d3
00010000-56af-09b5-0fc6-b80cac3e51c0	00020000-56af-09b5-1087-225ca4b460ac
00010000-56af-09b5-0fc6-b80cac3e51c0	00020000-56af-09b5-2e0a-8d36985668e1
00010000-56af-09b5-0fc6-b80cac3e51c0	00020000-56af-09b5-ddaf-ff581dedd2b7
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-b5de-2ac5609335bd
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-caa3-88a74f6abe9d
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-a914-b57373c35663
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-661c-0388a30edf5b
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-2e0a-8d36985668e1
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-a950-914b0c86448e
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-ddaf-ff581dedd2b7
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-1205-41cd56175bc6
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-f2c8-f80ac875bf7d
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-3736-9864532e521b
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-9c8e-94f98d837c21
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-7fe9-36083eafd111
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-7bc2-19b0e3e938aa
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-319c-c935ee484b7d
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-da5b-c58256c95a8e
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-7737-a508db9a9ce8
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-0106-64747cff1093
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-6e24-bb0de5f9fa1f
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-6cd3-ae67ffb2b5df
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-ffa5-04a90f0536e2
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-1ee9-d4bcf01ca60c
00010000-56af-09b5-9374-5995c9181aa6	00020000-56af-09b5-c1d1-d0b95fc6c656
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-b5de-2ac5609335bd
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-caa3-88a74f6abe9d
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-eb81-b7fdde118f46
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-a914-b57373c35663
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-661c-0388a30edf5b
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-2e0a-8d36985668e1
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-a950-914b0c86448e
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-ddaf-ff581dedd2b7
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-1205-41cd56175bc6
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-76ac-9c88b165d137
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-f2c8-f80ac875bf7d
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-3736-9864532e521b
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-bd3b-9dcf6ef8a627
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-9c8e-94f98d837c21
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-7fe9-36083eafd111
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-7bc2-19b0e3e938aa
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-319c-c935ee484b7d
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-da5b-c58256c95a8e
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-7737-a508db9a9ce8
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-0106-64747cff1093
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-6e24-bb0de5f9fa1f
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-6cd3-ae67ffb2b5df
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-ffa5-04a90f0536e2
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-5405-deee5ff102d5
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-1ee9-d4bcf01ca60c
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-c1d1-d0b95fc6c656
00010000-56af-09b5-1f86-c5d9fff1a313	00020000-56af-09b5-4016-a22b894b3c79
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-b5de-2ac5609335bd
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-948a-0eec66a011d3
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-caa3-88a74f6abe9d
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-1ecd-efb5aa63d653
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-eb81-b7fdde118f46
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-8f56-9b8dfadc226d
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-a914-b57373c35663
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-661c-0388a30edf5b
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-2e0a-8d36985668e1
00010000-56af-09b5-c880-329258d2bcd3	00020000-56af-09b5-a950-914b0c86448e
00010000-56af-09b5-ccf8-a71f43182e50	00020000-56af-09b5-0512-815001ffd155
00010000-56af-09b5-ccf8-a71f43182e50	00020000-56af-09b5-1087-225ca4b460ac
00010000-56af-09b5-ccf8-a71f43182e50	00020000-56af-09b5-8f56-9b8dfadc226d
00010000-56af-09b5-ccf8-a71f43182e50	00020000-56af-09b5-d306-21a86a473c74
00010000-56af-09b5-ccf8-a71f43182e50	00020000-56af-09b5-2e0a-8d36985668e1
00010000-56af-09b5-ccf8-a71f43182e50	00020000-56af-09b5-ddaf-ff581dedd2b7
00010000-56af-09b5-ccf8-a71f43182e50	00020000-56af-09b5-cb99-68082c21a38e
00010000-56af-09b5-ccf8-a71f43182e50	00020000-56af-09b5-e0bc-2bde42b9a1bb
00010000-56af-09b5-ecd5-22a0d408f7c0	00020000-56af-09b5-47dc-f3527d7cd035
00010000-56af-09b5-407c-f917d1bc1f7d	00020000-56af-09b3-bfbe-b225a1ee2224
00010000-56af-09b5-6461-8aafa3fb16df	00020000-56af-09b3-bc0b-c2b04163463d
00010000-56af-09b5-8ed5-172ff3f36e23	00020000-56af-09b3-bda5-c9d728ca8205
00010000-56af-09b5-640b-6809728c1663	00020000-56af-09b3-a660-b4bd139d100a
00010000-56af-09b5-b41c-973b8b3c8b81	00020000-56af-09b3-08ba-15b28e3ac77f
00010000-56af-09b5-7c5b-a52440dc27c1	00020000-56af-09b3-b6e8-7b0eb525d1a5
00010000-56af-09b5-c9ba-0b319a0d1b85	00020000-56af-09b3-ffd0-bcd056f52842
\.


--
-- TOC entry 3186 (class 0 OID 42129621)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 42129559)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 42129482)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56af-09b5-8e43-38deb266c181	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56af-09b5-ff7f-6316819597a7	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56af-09b5-fe90-a84b2a58fa58	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56af-09b5-3aa5-ffb5d5e19ec7	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 42129119)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56af-09b2-9fe9-1138474a2b13	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56af-09b2-a86d-6a8fe972377b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56af-09b2-fb8c-68609aac556e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56af-09b2-e85a-ef1856091f1e	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56af-09b2-7568-ce3dc8cc0811	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 42129111)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56af-09b2-d56a-806388713d79	00230000-56af-09b2-e85a-ef1856091f1e	popa
00240000-56af-09b2-2034-c0da6af617ce	00230000-56af-09b2-e85a-ef1856091f1e	oseba
00240000-56af-09b2-bd87-680b50e84098	00230000-56af-09b2-e85a-ef1856091f1e	tippopa
00240000-56af-09b2-2d9a-26db5187e684	00230000-56af-09b2-e85a-ef1856091f1e	organizacijskaenota
00240000-56af-09b2-a4cb-d09c64bf8414	00230000-56af-09b2-e85a-ef1856091f1e	sezona
00240000-56af-09b2-be19-53ee74c388d3	00230000-56af-09b2-e85a-ef1856091f1e	tipvaje
00240000-56af-09b2-8b37-12f83ab35fb6	00230000-56af-09b2-e85a-ef1856091f1e	tipdodatka
00240000-56af-09b2-a731-371be2685344	00230000-56af-09b2-a86d-6a8fe972377b	prostor
00240000-56af-09b2-9174-e3e34c6ff3c6	00230000-56af-09b2-e85a-ef1856091f1e	besedilo
00240000-56af-09b2-64ab-b66b8e90afae	00230000-56af-09b2-e85a-ef1856091f1e	uprizoritev
00240000-56af-09b2-596a-bc6a7fb55dc7	00230000-56af-09b2-e85a-ef1856091f1e	funkcija
00240000-56af-09b2-2a80-a6dbff8bc7d0	00230000-56af-09b2-e85a-ef1856091f1e	tipfunkcije
00240000-56af-09b2-9fda-00ba901f44db	00230000-56af-09b2-e85a-ef1856091f1e	alternacija
00240000-56af-09b2-0c98-f1e6f53f8caa	00230000-56af-09b2-9fe9-1138474a2b13	pogodba
00240000-56af-09b2-0b70-d0a9ef1fe87b	00230000-56af-09b2-e85a-ef1856091f1e	zaposlitev
00240000-56af-09b2-c41e-7c7b29e86339	00230000-56af-09b2-e85a-ef1856091f1e	zvrstuprizoritve
00240000-56af-09b2-adb0-662132b27be9	00230000-56af-09b2-9fe9-1138474a2b13	programdela
00240000-56af-09b2-155a-3b3c2fdd143f	00230000-56af-09b2-e85a-ef1856091f1e	zapis
\.


--
-- TOC entry 3133 (class 0 OID 42129106)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
27461200-6c6f-44e1-9205-210e272d028e	00240000-56af-09b2-d56a-806388713d79	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 42129682)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56af-09b6-f16b-d0b5166473b7	000e0000-56af-09b5-63ee-f12c67a39797	00080000-56af-09b5-a907-fcc7a5e3c861	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56af-09b2-08df-1e7301e8e9bb
00270000-56af-09b6-cbe9-8f09e7a9a909	000e0000-56af-09b5-63ee-f12c67a39797	00080000-56af-09b5-a907-fcc7a5e3c861	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56af-09b2-08df-1e7301e8e9bb
\.


--
-- TOC entry 3149 (class 0 OID 42129255)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 42129501)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56af-09b6-152f-95da3b4b62db	00180000-56af-09b6-dfb9-6e5a523eb30a	000c0000-56af-09b6-e893-a15a99e53ecd	00090000-56af-09b5-fb4a-1e563e74e141	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-09b6-4565-9ff808a2e8c4	00180000-56af-09b6-dfb9-6e5a523eb30a	000c0000-56af-09b6-ee34-5e6d67076201	00090000-56af-09b5-ec7a-78380a6970cf	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-09b6-4f91-dea612879b4f	00180000-56af-09b6-dfb9-6e5a523eb30a	000c0000-56af-09b6-722d-18634cd6cdb7	00090000-56af-09b5-1676-ae3a56d79f3f	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-09b6-83ad-3cd05b6415e0	00180000-56af-09b6-dfb9-6e5a523eb30a	000c0000-56af-09b6-a061-671a10f3decb	00090000-56af-09b5-81b7-4203a6ced475	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-09b6-8082-93c1a6a101fd	00180000-56af-09b6-dfb9-6e5a523eb30a	000c0000-56af-09b6-b3dd-7be7d26ce624	00090000-56af-09b5-5cd7-34a324b56b2f	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-09b6-90c9-1f38eca6370e	00180000-56af-09b6-4dd8-d83009f551b8	\N	00090000-56af-09b5-5cd7-34a324b56b2f	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56af-09b6-5395-20821108ed80	00180000-56af-09b6-adc3-6636f4089473	\N	00090000-56af-09b5-ec7a-78380a6970cf	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56af-09b6-d795-1d2ced123818	00180000-56af-09b6-dfb9-6e5a523eb30a	\N	00090000-56af-09b5-8f73-25076a0ceb71	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 42129518)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56af-09b2-e9b1-cc83c2af3326	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56af-09b2-c219-0707f6ba1633	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56af-09b2-0248-19526e3c3847	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56af-09b2-651b-1dcbb197b361	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56af-09b2-67d8-fc1ff2a0826c	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56af-09b2-29eb-62f1b16e5bfa	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 42129723)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56af-09b2-e0b8-bda5277041c8	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56af-09b2-184a-ca3f5e945639	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56af-09b2-822a-9b0a498b2ad5	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56af-09b2-c578-0ebfefc341cf	04	Režija	Režija	Režija	umetnik	30
000f0000-56af-09b2-e91a-ceb736c4950b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56af-09b2-8272-a6a41e3e1bb0	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56af-09b2-388f-749bc602a101	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56af-09b2-3f52-cb9eb21442bb	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56af-09b2-943f-d3b3865ac7a2	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56af-09b2-3f2d-a3f147528e7d	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56af-09b2-8f58-8e93865e7903	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56af-09b2-f34e-ded27530575d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56af-09b2-bb2f-21ff48323331	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56af-09b2-58aa-3458fba0ae18	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56af-09b2-ff79-4e629d4ec631	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56af-09b2-4f94-c98390c35824	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56af-09b2-352b-f6e7e08016a5	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56af-09b2-a367-7f50ffc67009	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56af-09b2-6508-db1db76a2da4	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 42129206)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56af-09b5-a83e-9b83b1ef877b	0001	šola	osnovna ali srednja šola
00400000-56af-09b5-96cb-592d4238ce8e	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56af-09b5-0bb7-1dbe812ea2ca	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 42130027)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56af-09b2-a0fd-a39dd3b4b483	01	Velika predstava	f	1.00	1.00
002b0000-56af-09b2-4cb0-e95a2722d2f5	02	Mala predstava	f	0.50	0.50
002b0000-56af-09b2-7ff9-079e70e88419	03	Mala koprodukcija	t	0.40	1.00
002b0000-56af-09b2-6c23-e43e99fc23a9	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56af-09b2-5626-34c11e9d9011	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 42129472)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56af-09b2-bd9b-f2c656e5ee62	0001	prva vaja	prva vaja
00420000-56af-09b2-aafe-86d76c2d1f96	0002	tehnična vaja	tehnična vaja
00420000-56af-09b2-46b5-970ad3f4bb79	0003	lučna vaja	lučna vaja
00420000-56af-09b2-b1b8-c7b01979a337	0004	kostumska vaja	kostumska vaja
00420000-56af-09b2-a149-3f13106fc759	0005	foto vaja	foto vaja
00420000-56af-09b2-4d92-0d0c65aae8ab	0006	1. glavna vaja	1. glavna vaja
00420000-56af-09b2-f5ed-60a5b79c7229	0007	2. glavna vaja	2. glavna vaja
00420000-56af-09b2-eff4-be53b558cefd	0008	1. generalka	1. generalka
00420000-56af-09b2-3ca6-d88754bbcef7	0009	2. generalka	2. generalka
00420000-56af-09b2-dcd5-cfeeba4b8566	0010	odprta generalka	odprta generalka
00420000-56af-09b2-295a-505fb0dd95d7	0011	obnovitvena vaja	obnovitvena vaja
00420000-56af-09b2-4095-f63f37a5c815	0012	italijanka	krajša "obnovitvena" vaja
00420000-56af-09b2-7c1a-fe7cf441cdca	0013	pevska vaja	pevska vaja
00420000-56af-09b2-1581-0ce09b3052b1	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56af-09b2-7314-8594bfef744e	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56af-09b2-5e42-203aa75589c2	0016	orientacijska vaja	orientacijska vaja
00420000-56af-09b2-4c66-b04fd9688994	0017	situacijska vaja	situacijska vaja
00420000-56af-09b2-1781-e416f944f88b	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 42129328)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 42129141)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56af-09b3-8546-7bdc4e3807a5	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO9htx7HS60zSIsGK.SzBkW91ikAZoM2a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56af-09b5-ea0c-0f03e6b958dd	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56af-09b5-19e4-c5aea9c40ac2	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56af-09b5-a91d-a70a61e90ab7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56af-09b5-a4e7-88fbc972b2c2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56af-09b5-9a83-9db933dd1855	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56af-09b5-fca8-97f782a809e2	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56af-09b5-0b39-1ef6b4a3d78a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56af-09b5-dc80-c956ad3eb4ce	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56af-09b5-3eae-62af6d115295	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56af-09b5-5ea5-5d7ba1e56e01	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56af-09b5-ace9-6740eb9be75b	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56af-09b5-a203-3acbef8331d6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56af-09b5-4301-16ac4754cc22	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56af-09b5-0fc6-b80cac3e51c0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56af-09b5-9374-5995c9181aa6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56af-09b5-1f86-c5d9fff1a313	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56af-09b5-c880-329258d2bcd3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56af-09b5-ccf8-a71f43182e50	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56af-09b5-ecd5-22a0d408f7c0	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56af-09b5-407c-f917d1bc1f7d	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56af-09b5-6461-8aafa3fb16df	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56af-09b5-8ed5-172ff3f36e23	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56af-09b5-640b-6809728c1663	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56af-09b5-b41c-973b8b3c8b81	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56af-09b5-7c5b-a52440dc27c1	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56af-09b5-c9ba-0b319a0d1b85	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56af-09b3-9f3f-0452c3101553	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 42129773)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56af-09b5-5d55-1db2045162be	00160000-56af-09b5-258f-c25d085835b6	\N	00140000-56af-09b2-0d20-80ecafa01413	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56af-09b5-7554-1d3ea30025e9
000e0000-56af-09b5-63ee-f12c67a39797	00160000-56af-09b5-5b82-200a156e0b9e	\N	00140000-56af-09b2-c091-295874c46707	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56af-09b5-ae66-35bf323489bc
000e0000-56af-09b5-adc9-82b361630f3f	\N	\N	00140000-56af-09b2-c091-295874c46707	00190000-56af-09b5-041d-c050f35c8ead	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-09b5-7554-1d3ea30025e9
000e0000-56af-09b5-8ceb-851bd9018261	\N	\N	00140000-56af-09b2-c091-295874c46707	00190000-56af-09b5-041d-c050f35c8ead	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-09b5-7554-1d3ea30025e9
000e0000-56af-09b5-bdbb-caedfe8e1756	\N	\N	00140000-56af-09b2-c091-295874c46707	00190000-56af-09b5-041d-c050f35c8ead	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-3b99-e25640407249	\N	\N	00140000-56af-09b2-c091-295874c46707	00190000-56af-09b5-041d-c050f35c8ead	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-647d-f40af05a7bcb	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-689c-865b03174fdb	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-3227-73d2cae9bd0c	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-16ac-d40f75d7e576	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-8242-1970d081b9eb	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-4820-93b3a9993688	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-0781-dac5bf3bab8e	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-afea-3165bb33585c	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
000e0000-56af-09b5-a65c-a4ef9e79fc62	\N	\N	00140000-56af-09b2-4943-cc8de46ce14d	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-09b5-3613-f5b7c765bd4c
\.


--
-- TOC entry 3170 (class 0 OID 42129492)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 42129421)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56af-09b6-2d2a-23fac4b81291	\N	000e0000-56af-09b5-63ee-f12c67a39797	3
00200000-56af-09b6-7c32-dffc3b30ec7b	\N	000e0000-56af-09b5-63ee-f12c67a39797	4
00200000-56af-09b6-c366-9922405b53cd	\N	000e0000-56af-09b5-63ee-f12c67a39797	6
00200000-56af-09b6-661c-09b7907bf6be	\N	000e0000-56af-09b5-63ee-f12c67a39797	5
00200000-56af-09b6-7c18-5290b14447fb	\N	000e0000-56af-09b5-63ee-f12c67a39797	7
00200000-56af-09b6-0bc1-3e72b6833675	\N	000e0000-56af-09b5-5d55-1db2045162be	1
00200000-56af-09b6-4443-516f83cafcd2	\N	000e0000-56af-09b5-63ee-f12c67a39797	2
00200000-56af-09b6-70fb-2c471475b36b	\N	000e0000-56af-09b5-63ee-f12c67a39797	1
00200000-56af-09b6-1807-fc0516445885	\N	000e0000-56af-09b5-63ee-f12c67a39797	8
00200000-56af-09b6-4e3a-247ee5f2bf86	\N	000e0000-56af-09b5-63ee-f12c67a39797	9
\.


--
-- TOC entry 3182 (class 0 OID 42129585)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 42129696)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56af-09b2-0e9a-15dd2005e363	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56af-09b2-7506-2e8c188876f3	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56af-09b2-69d5-6cb3a1cc5411	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56af-09b2-304e-e64d1392dfab	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56af-09b2-944d-a8cb82f19f4f	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56af-09b2-dd69-6ae933e27a6c	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56af-09b2-174f-5cec592d2426	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56af-09b2-55fb-b4ffba3f0c0c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56af-09b2-08df-1e7301e8e9bb	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56af-09b2-89c4-d0f294aa6ee9	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56af-09b2-6d85-2bbd0df640cc	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56af-09b2-2c68-b3a7e803e8a5	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56af-09b2-8fe7-ae2937cd72e8	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56af-09b2-2395-b0927a0814da	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56af-09b2-cb26-cbc891fb81db	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56af-09b2-c88b-c746c90840bd	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56af-09b2-5dcc-8338a70d79d1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56af-09b2-842c-716ed617d34f	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56af-09b2-7355-2b7941df0e95	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56af-09b2-03b4-9370b5732cf4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56af-09b2-3598-7266f3a8f74a	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56af-09b2-e66d-8d0863e04025	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56af-09b2-ed3a-44228e7c39d6	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56af-09b2-38d8-fce3c7d0ab01	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56af-09b2-6f83-ab3577418c24	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56af-09b2-c145-f77d75e594fd	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56af-09b2-5dc7-6e565cbb6938	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56af-09b2-12c2-2ef5ffd164c1	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 42130077)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 42130046)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 42130089)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 42129658)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56af-09b5-25e8-8b1e933e4f7c	00090000-56af-09b5-ec7a-78380a6970cf	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-09b5-c5a0-5bcc8548791b	00090000-56af-09b5-1676-ae3a56d79f3f	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-09b5-013d-f7cc78dcdd35	00090000-56af-09b5-04c9-49be549e8225	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-09b5-b90e-e6a20d1b1960	00090000-56af-09b5-df89-5415a1d4e0e0	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-09b5-ec48-0c36cea26fcf	00090000-56af-09b5-ec88-0e291f821c78	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-09b5-2d75-631ea0332f1e	00090000-56af-09b5-b5d2-44d288c07976	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 42129763)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56af-09b2-0d20-80ecafa01413	01	Drama	drama (SURS 01)
00140000-56af-09b2-d7a1-0d6cec7dcd79	02	Opera	opera (SURS 02)
00140000-56af-09b2-7040-aa4960945637	03	Balet	balet (SURS 03)
00140000-56af-09b2-46f0-cf91ee8cacf3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56af-09b2-4943-cc8de46ce14d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56af-09b2-c091-295874c46707	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56af-09b2-9042-7aa8211de4fd	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 42129648)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 42129205)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 42129821)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 42129812)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 42129195)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 42129679)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 42129721)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 42130130)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 42129515)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 42129450)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 42129466)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 42129471)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 42130044)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 42129354)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 42129890)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 42129644)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 42129419)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 42129392)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 42129368)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 42129551)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 42130107)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 42130114)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 42130138)
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
-- TOC entry 2766 (class 2606 OID 42129577)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 42129326)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 42129224)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 42129288)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 42129251)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 42129184)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 42129169)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 42129583)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 42129620)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 42129758)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 42129279)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 42129314)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 42129995)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 42129557)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 42129304)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 42129435)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 42129407)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 42129401)
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
-- TOC entry 2764 (class 2606 OID 42129569)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 42130004)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 42130012)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42129982)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 42130025)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 42129602)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 42129542)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 42129533)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 42129745)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 42129672)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 42129380)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 42129140)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 42129611)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 42129158)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 42129178)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 42129629)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 42129564)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 42129490)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 42129128)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 42129116)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 42129110)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 42129692)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 42129260)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 42129507)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 42129525)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 42129732)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 42129213)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 42130037)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 42129479)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 42129339)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 42129153)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 42129791)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 42129498)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 42129425)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 42129591)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 42129704)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 42130087)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 42130071)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 42130095)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 42129662)
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
-- TOC entry 2833 (class 2606 OID 42129771)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 42129656)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 42129460)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 42129461)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 42129459)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 42129457)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 42129458)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 42129456)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 42129693)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 42129694)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 42129695)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 42130109)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 42130108)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 42129281)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 42129282)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 42129584)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 42130075)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 42130074)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 42130076)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 42130073)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 42130072)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 42129570)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 42129426)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 42129427)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 42129645)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 42129647)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 42129646)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 42129370)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 42129369)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 42130026)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 42129760)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 42129761)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 42129762)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 42130096)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 42129796)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 42129793)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 42129797)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 42129795)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 42129794)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 42129341)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 42129340)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 42129254)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 42129612)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 42129185)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 42129186)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 42129632)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 42129631)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 42129630)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 42129291)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 42129290)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 42129292)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 42129402)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 42129118)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 42129537)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 42129535)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 42129534)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 42129536)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 42129159)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 42129160)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 42129592)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 42130131)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 42129681)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 42129680)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 42130139)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 42130140)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 42129558)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 42129673)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 42129674)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 42129895)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 42129894)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 42129891)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 42129892)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 42129893)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 42129306)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 42129305)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 42129307)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 42129606)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 42129605)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 42130005)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 42130006)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 42129825)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 42129826)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 42129823)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 42129824)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 42129516)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 42129517)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 42129663)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 42129664)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 42129499)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 42129546)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 42129545)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 42129543)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 42129544)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 42129813)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 42129381)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 42129395)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 42129394)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 42129393)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 42129396)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 42129420)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 42129408)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 42129409)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 42129996)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 42130045)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 42130115)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 42130116)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 42129226)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 42129225)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 42129261)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 42129262)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 42129510)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 42129509)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 42129508)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 42129452)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 42129455)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 42129451)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 42129454)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 42129453)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 42129280)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 42129214)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 42129215)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 42129355)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 42129357)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 42129356)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 42129358)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 42129552)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 42129759)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 42129792)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 42129733)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 42129734)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 42129252)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 42129253)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 42129526)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 42129527)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 42129657)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 42129129)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 42129327)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 42129289)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 42129117)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 42130038)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 42129604)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 42129603)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 42129480)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 42129481)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 42129822)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 42129500)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 42129315)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 42129772)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 42130088)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 42130013)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 42130014)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 42129722)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 42129491)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 42129179)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2941 (class 2606 OID 42130301)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2946 (class 2606 OID 42130326)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2944 (class 2606 OID 42130316)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2940 (class 2606 OID 42130296)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 42130331)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2943 (class 2606 OID 42130311)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 42130321)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2942 (class 2606 OID 42130306)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 42130511)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 42130516)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 42130521)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 42130681)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 42130676)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 42130196)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 42130201)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 42130426)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3013 (class 2606 OID 42130661)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 42130656)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 42130666)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 42130651)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 42130646)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 42130421)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2938 (class 2606 OID 42130286)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 42130291)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 42130466)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 42130476)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 42130471)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 42130251)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 42130246)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 42130411)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 42130636)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 42130526)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 42130531)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 42130536)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 42130671)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2992 (class 2606 OID 42130556)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 42130541)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 42130561)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 42130551)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 42130546)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 42130241)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 42130236)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 42130181)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 42130176)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 42130446)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 42130156)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 42130161)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2973 (class 2606 OID 42130461)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 42130456)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 42130451)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 42130211)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 42130206)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 42130216)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 42130266)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 42130141)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 42130386)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 42130376)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 42130371)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 42130381)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 42130146)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 42130151)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 42130431)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 42130696)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 42130506)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 42130501)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3021 (class 2606 OID 42130701)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 42130706)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 42130416)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2979 (class 2606 OID 42130491)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 42130496)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 42130611)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 42130606)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 42130591)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 42130596)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 42130601)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 42130226)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 42130221)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 42130231)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 42130441)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2968 (class 2606 OID 42130436)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 42130621)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 42130626)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 42130581)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 42130586)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2995 (class 2606 OID 42130571)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2996 (class 2606 OID 42130576)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 42130361)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 42130366)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2977 (class 2606 OID 42130481)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 42130486)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 42130336)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 42130341)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 42130406)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 42130401)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 42130391)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 42130396)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 42130566)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 42130256)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 42130261)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 42130281)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2935 (class 2606 OID 42130271)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 42130276)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 42130616)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 42130631)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 42130641)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3018 (class 2606 OID 42130686)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 42130691)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 42130171)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 42130166)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 42130186)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 42130191)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 42130356)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 42130351)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 42130346)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-01 08:31:05 CET

--
-- PostgreSQL database dump complete
--

