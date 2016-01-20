--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-20 08:43:56 CET

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
-- TOC entry 185 (class 1259 OID 38192089)
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
-- TOC entry 241 (class 1259 OID 38192707)
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
-- TOC entry 240 (class 1259 OID 38192691)
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
-- TOC entry 184 (class 1259 OID 38192082)
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
-- TOC entry 183 (class 1259 OID 38192080)
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
-- TOC entry 231 (class 1259 OID 38192568)
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
-- TOC entry 234 (class 1259 OID 38192598)
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
-- TOC entry 255 (class 1259 OID 38193010)
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
-- TOC entry 212 (class 1259 OID 38192404)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 38192330)
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
-- TOC entry 206 (class 1259 OID 38192355)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 38192360)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 38192932)
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
-- TOC entry 196 (class 1259 OID 38192234)
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
-- TOC entry 242 (class 1259 OID 38192720)
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
-- TOC entry 227 (class 1259 OID 38192526)
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
-- TOC entry 202 (class 1259 OID 38192304)
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
-- TOC entry 199 (class 1259 OID 38192274)
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
-- TOC entry 197 (class 1259 OID 38192251)
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
-- TOC entry 216 (class 1259 OID 38192440)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 38192990)
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
-- TOC entry 254 (class 1259 OID 38193003)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 38193025)
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
-- TOC entry 220 (class 1259 OID 38192465)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 38192208)
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
-- TOC entry 187 (class 1259 OID 38192108)
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
-- TOC entry 191 (class 1259 OID 38192175)
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
-- TOC entry 188 (class 1259 OID 38192119)
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
-- TOC entry 180 (class 1259 OID 38192054)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 38192073)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 38192472)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 38192506)
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
-- TOC entry 237 (class 1259 OID 38192639)
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
-- TOC entry 190 (class 1259 OID 38192155)
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
-- TOC entry 193 (class 1259 OID 38192200)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 38192876)
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
-- TOC entry 217 (class 1259 OID 38192446)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 38192185)
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
-- TOC entry 204 (class 1259 OID 38192322)
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
-- TOC entry 200 (class 1259 OID 38192289)
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
-- TOC entry 201 (class 1259 OID 38192297)
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
-- TOC entry 219 (class 1259 OID 38192458)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 38192890)
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
-- TOC entry 246 (class 1259 OID 38192900)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 38192789)
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
-- TOC entry 247 (class 1259 OID 38192908)
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
-- TOC entry 223 (class 1259 OID 38192487)
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
-- TOC entry 215 (class 1259 OID 38192431)
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
-- TOC entry 214 (class 1259 OID 38192421)
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
-- TOC entry 236 (class 1259 OID 38192628)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 38192558)
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
-- TOC entry 198 (class 1259 OID 38192263)
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
-- TOC entry 177 (class 1259 OID 38192025)
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
-- TOC entry 176 (class 1259 OID 38192023)
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
-- TOC entry 224 (class 1259 OID 38192500)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 38192063)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 38192047)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 38192514)
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
-- TOC entry 218 (class 1259 OID 38192452)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 38192375)
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
-- TOC entry 175 (class 1259 OID 38192012)
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
-- TOC entry 174 (class 1259 OID 38192004)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 38191999)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 38192575)
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
-- TOC entry 189 (class 1259 OID 38192147)
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
-- TOC entry 211 (class 1259 OID 38192394)
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
-- TOC entry 213 (class 1259 OID 38192411)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 38192616)
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
-- TOC entry 186 (class 1259 OID 38192098)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 38192920)
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
-- TOC entry 208 (class 1259 OID 38192365)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 38192220)
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
-- TOC entry 178 (class 1259 OID 38192034)
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
-- TOC entry 239 (class 1259 OID 38192666)
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
-- TOC entry 210 (class 1259 OID 38192385)
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
-- TOC entry 203 (class 1259 OID 38192315)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 38192479)
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
-- TOC entry 233 (class 1259 OID 38192589)
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
-- TOC entry 251 (class 1259 OID 38192970)
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
-- TOC entry 250 (class 1259 OID 38192939)
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
-- TOC entry 252 (class 1259 OID 38192982)
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
-- TOC entry 229 (class 1259 OID 38192551)
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
-- TOC entry 238 (class 1259 OID 38192656)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 38192541)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 38192085)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 38192028)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3146 (class 0 OID 38192089)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569f-3ab9-289f-64d995acaf7a	10	30	Otroci	Abonma za otroke	200
000a0000-569f-3ab9-bcd7-1ca2c04e6f9c	20	60	Mladina	Abonma za mladino	400
000a0000-569f-3ab9-ebd1-fcde5f9270e1	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3202 (class 0 OID 38192707)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569f-3ab9-9840-04d746e22861	000d0000-569f-3ab9-d84f-7e51e63996cb	\N	00090000-569f-3ab9-27e8-214f19777c07	000b0000-569f-3ab9-1445-7be87e61daab	0001	f	\N	\N	\N	3	t	t	t
000c0000-569f-3ab9-fe8c-0fd0c72f5151	000d0000-569f-3ab9-e5dc-8a9290d3f33f	00100000-569f-3ab9-ad85-c78a561355f4	00090000-569f-3ab9-41f6-b5849003ce3d	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569f-3ab9-a57a-11eda1d2a3ca	000d0000-569f-3ab9-3bb2-2a7de2f7c763	00100000-569f-3ab9-1d3e-da8cd7be6f5b	00090000-569f-3ab9-a9dd-a9bef5d98357	\N	0003	t	\N	2016-01-20	\N	2	t	f	f
000c0000-569f-3ab9-bc4a-2e56423548c7	000d0000-569f-3ab9-56d0-95558faa4b00	\N	00090000-569f-3ab9-2add-9057f4e4e88a	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569f-3ab9-3592-ef2556a8d61b	000d0000-569f-3ab9-aa3f-bd46a0347263	\N	00090000-569f-3ab9-97d8-0e88e9f9d567	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569f-3ab9-c5b9-16e57d439a19	000d0000-569f-3ab9-a9e8-ba20b081fbdd	\N	00090000-569f-3ab9-ce70-3e6384b92d66	000b0000-569f-3ab9-eb35-699fec704e34	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569f-3ab9-4466-54da2da2b27a	000d0000-569f-3ab9-26db-97019c870902	00100000-569f-3ab9-c047-894b887ba8a5	00090000-569f-3ab9-8784-b7511cad54db	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569f-3ab9-e479-c3def71eebf5	000d0000-569f-3ab9-cf24-571cd7072693	\N	00090000-569f-3ab9-d7a6-73763a7ff0ae	000b0000-569f-3ab9-bdfd-182e0629764a	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569f-3ab9-7a34-d7684231f92d	000d0000-569f-3ab9-26db-97019c870902	00100000-569f-3ab9-e91d-6afc01a8aeab	00090000-569f-3ab9-0918-92f2aa2e4d1b	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569f-3ab9-3c75-8a2bc5037963	000d0000-569f-3ab9-26db-97019c870902	00100000-569f-3ab9-f181-293156a75f6e	00090000-569f-3ab9-2fa0-7a9365f71b42	\N	0010	t	\N	2016-01-20	\N	16	f	f	t
000c0000-569f-3ab9-d522-f7eb5e562df8	000d0000-569f-3ab9-26db-97019c870902	00100000-569f-3ab9-c796-97e287da399e	00090000-569f-3ab9-796b-c87628197f30	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569f-3ab9-8dc0-e79c74487314	000d0000-569f-3ab9-9047-d500a77439a6	00100000-569f-3ab9-ad85-c78a561355f4	00090000-569f-3ab9-41f6-b5849003ce3d	000b0000-569f-3ab9-6c39-1b4b547a9da1	0012	t	\N	\N	\N	2	t	t	t
000c0000-569f-3ab9-1df0-0fca99308753	000d0000-569f-3ab9-6b8a-2d5955dee6f7	\N	00090000-569f-3ab9-d7a6-73763a7ff0ae	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-2f53-9b5f16442f45	000d0000-569f-3ab9-6b8a-2d5955dee6f7	\N	00090000-569f-3ab9-d6a4-74c9108d1d28	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569f-3ab9-995b-40f65aaacee6	000d0000-569f-3ab9-23c8-06caace2eb37	00100000-569f-3ab9-1d3e-da8cd7be6f5b	00090000-569f-3ab9-a9dd-a9bef5d98357	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-25a3-4823b2f9ea2c	000d0000-569f-3ab9-23c8-06caace2eb37	\N	00090000-569f-3ab9-d6a4-74c9108d1d28	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569f-3ab9-3300-2212f762337d	000d0000-569f-3ab9-fc37-31e7f4933a17	\N	00090000-569f-3ab9-d6a4-74c9108d1d28	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-8062-abf11b23a57f	000d0000-569f-3ab9-fc37-31e7f4933a17	\N	00090000-569f-3ab9-d7a6-73763a7ff0ae	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569f-3ab9-bf03-be0361269557	000d0000-569f-3ab9-6d77-0a73bd812a9f	00100000-569f-3ab9-c047-894b887ba8a5	00090000-569f-3ab9-8784-b7511cad54db	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-8156-f358f2e450b0	000d0000-569f-3ab9-6d77-0a73bd812a9f	\N	00090000-569f-3ab9-d6a4-74c9108d1d28	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569f-3ab9-a09d-25101fee6081	000d0000-569f-3ab9-7875-6a1162d73aae	\N	00090000-569f-3ab9-d6a4-74c9108d1d28	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-2cac-0820e8a5efc3	000d0000-569f-3ab9-7875-6a1162d73aae	00100000-569f-3ab9-c047-894b887ba8a5	00090000-569f-3ab9-8784-b7511cad54db	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569f-3ab9-14c2-d85f79b7dd67	000d0000-569f-3ab9-197b-3194ca85479e	\N	00090000-569f-3ab9-d6a4-74c9108d1d28	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-6bfd-0b1819f7ed80	000d0000-569f-3ab9-9cff-d1df213b80a3	\N	00090000-569f-3ab9-d7a6-73763a7ff0ae	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-26b1-3166b1255d9b	000d0000-569f-3ab9-ec62-22d91620ab42	\N	00090000-569f-3ab9-d7a6-73763a7ff0ae	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-0f3a-8005d0e4356c	000d0000-569f-3ab9-ec62-22d91620ab42	00100000-569f-3ab9-1d3e-da8cd7be6f5b	00090000-569f-3ab9-a9dd-a9bef5d98357	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569f-3ab9-d66c-c5c58d2e25d2	000d0000-569f-3ab9-1837-b216b2cc87fe	\N	00090000-569f-3ab9-50be-fbea1a86686d	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569f-3ab9-64f7-4b5e55d7194d	000d0000-569f-3ab9-1837-b216b2cc87fe	\N	00090000-569f-3ab9-5747-c85f7e3462d8	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569f-3ab9-8bdc-4eefa9082e49	000d0000-569f-3ab9-13b5-beb4d3d8b9dd	\N	00090000-569f-3ab9-d7a6-73763a7ff0ae	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569f-3ab9-9ee2-53cdf1de3b67	000d0000-569f-3ab9-13b5-beb4d3d8b9dd	00100000-569f-3ab9-1d3e-da8cd7be6f5b	00090000-569f-3ab9-a9dd-a9bef5d98357	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569f-3ab9-5556-f4a26b53fb32	000d0000-569f-3ab9-13b5-beb4d3d8b9dd	\N	00090000-569f-3ab9-5747-c85f7e3462d8	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569f-3ab9-681d-027701a1b616	000d0000-569f-3ab9-13b5-beb4d3d8b9dd	\N	00090000-569f-3ab9-50be-fbea1a86686d	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569f-3ab9-6272-b1520613e39e	000d0000-569f-3ab9-8c8d-7abfa797123d	\N	00090000-569f-3ab9-d7a6-73763a7ff0ae	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569f-3ab9-eb58-2e637e401d37	000d0000-569f-3ab9-a4c6-48c529494c96	00100000-569f-3ab9-1d3e-da8cd7be6f5b	00090000-569f-3ab9-a9dd-a9bef5d98357	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569f-3ab9-46a5-77665ea07262	000d0000-569f-3ab9-a4c6-48c529494c96	\N	00090000-569f-3ab9-d6a4-74c9108d1d28	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3201 (class 0 OID 38192691)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 38192082)
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
-- TOC entry 3192 (class 0 OID 38192568)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569f-3ab9-50f7-e7d2e87f7372	00160000-569f-3ab8-3430-4ea80d7bf5df	00090000-569f-3ab9-5747-c85f7e3462d8	aizv	10	t
003d0000-569f-3ab9-afb9-c18398c15882	00160000-569f-3ab8-3430-4ea80d7bf5df	00090000-569f-3ab9-cdab-3744f90d427a	apri	14	t
003d0000-569f-3ab9-f6e4-2ac7db3380ff	00160000-569f-3ab8-f1e4-90103149eba1	00090000-569f-3ab9-50be-fbea1a86686d	aizv	11	t
003d0000-569f-3ab9-e1e8-9bb84d1d8f9f	00160000-569f-3ab8-1d09-0d2e9cd6a58a	00090000-569f-3ab9-74ea-5b9926d2fbc5	aizv	12	t
003d0000-569f-3ab9-f2c5-dc5e497131ea	00160000-569f-3ab8-3430-4ea80d7bf5df	00090000-569f-3ab9-d6a4-74c9108d1d28	apri	18	f
\.


--
-- TOC entry 3195 (class 0 OID 38192598)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569f-3ab8-3430-4ea80d7bf5df	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569f-3ab8-f1e4-90103149eba1	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569f-3ab8-1d09-0d2e9cd6a58a	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3216 (class 0 OID 38193010)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 38192404)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 38192330)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569f-3ab9-ac3e-374d74f8f6c7	\N	00200000-569f-3ab9-6148-54ff9b9ebf65	\N	\N	\N	00220000-569f-3ab8-ff5d-62126a4027bd	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569f-3ab9-70e3-ae536aa1b2ab	\N	00200000-569f-3ab9-9efb-c4ec8e4a816b	\N	\N	\N	00220000-569f-3ab8-ff5d-62126a4027bd	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569f-3ab9-f6e3-d3279b4a8596	\N	00200000-569f-3ab9-a8ac-9566da550a73	\N	\N	\N	00220000-569f-3ab8-93d6-5a8cc92dacc1	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569f-3ab9-fc55-d2c27d8fcc0e	\N	00200000-569f-3ab9-4080-a801d62af021	\N	\N	\N	00220000-569f-3ab8-2748-11db99813e2c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569f-3ab9-352b-7ff28711a832	\N	00200000-569f-3ab9-abf8-8820415c2255	\N	\N	\N	00220000-569f-3ab8-925e-23baf9dfb671	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
00180000-569f-3ab9-47c4-7beb54e19d81	001b0000-569f-3ab9-fe51-4be9a5fda703	\N	\N	\N	\N	00220000-569f-3ab8-e2bd-1f1f949c744f	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1
\.


--
-- TOC entry 3167 (class 0 OID 38192355)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 38192360)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 38192932)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 38192234)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569f-3ab6-f27a-35c879399449	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569f-3ab6-b589-9115b94344e5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569f-3ab6-e4fb-b26c97f64c3b	AL	ALB	008	Albania 	Albanija	\N
00040000-569f-3ab6-164a-3424fad11d9d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569f-3ab6-178c-730b393369b8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569f-3ab6-0507-3217b5fd7fc9	AD	AND	020	Andorra 	Andora	\N
00040000-569f-3ab6-8309-1402ec3f6ae9	AO	AGO	024	Angola 	Angola	\N
00040000-569f-3ab6-a0e3-05c79eef1d6b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569f-3ab6-8823-b3a7a3ee6f70	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569f-3ab6-7f8b-1cf85fb37caf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-3ab6-0ce7-16b81c464422	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569f-3ab6-8f4c-e48f0f8a9d5c	AM	ARM	051	Armenia 	Armenija	\N
00040000-569f-3ab6-b2ba-9b76c90455f0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569f-3ab6-af3e-41c323cd4505	AU	AUS	036	Australia 	Avstralija	\N
00040000-569f-3ab6-893c-c243afbc8b3a	AT	AUT	040	Austria 	Avstrija	\N
00040000-569f-3ab6-4051-bce13a6f65d7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569f-3ab6-dd84-3801606bb195	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569f-3ab6-e659-49da815ea59f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569f-3ab6-c410-8e155dbcf692	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569f-3ab6-16c7-ff02a177fe9b	BB	BRB	052	Barbados 	Barbados	\N
00040000-569f-3ab6-72e4-3444ff075556	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569f-3ab6-e325-5fae059347a5	BE	BEL	056	Belgium 	Belgija	\N
00040000-569f-3ab6-6357-c3c5b3ff0cfb	BZ	BLZ	084	Belize 	Belize	\N
00040000-569f-3ab6-0daa-ed8817b4f199	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569f-3ab6-42c8-e6ac44f3d4e2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569f-3ab6-b9de-0a0bed6cb9a1	BT	BTN	064	Bhutan 	Butan	\N
00040000-569f-3ab6-020f-ad48f6b98cac	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569f-3ab6-4ca6-89ccae7fcee1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569f-3ab6-969b-50f337e4c860	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569f-3ab6-1d6e-229954a59984	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569f-3ab6-2c0f-4f21d71bb5ed	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569f-3ab6-c515-60d567bcbf27	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569f-3ab6-4351-68f797a543ec	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569f-3ab6-ba81-8763a8869853	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569f-3ab6-a34f-303d8a4ff160	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569f-3ab6-c81f-c5a6a99d56c1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569f-3ab6-4b95-820e20d9235d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569f-3ab6-c7a4-87b93f845c64	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569f-3ab6-4f3e-f98b6aa2d6ce	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569f-3ab6-6443-a82934651483	CA	CAN	124	Canada 	Kanada	\N
00040000-569f-3ab6-1d67-bc5b0d0ec8e8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569f-3ab6-69f8-930a1cf95c09	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569f-3ab6-e751-93edfde71ec7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569f-3ab6-b24f-65702371b07f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569f-3ab6-173e-45a273406b68	CL	CHL	152	Chile 	Čile	\N
00040000-569f-3ab6-aad6-8ea2e4a6fac9	CN	CHN	156	China 	Kitajska	\N
00040000-569f-3ab6-4e8b-636816ac591d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569f-3ab6-c65b-77b1899a3cb9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569f-3ab6-7038-cb03c6329025	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569f-3ab6-fcce-83f5db435005	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569f-3ab6-3621-67e5dbef96e7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569f-3ab6-351c-8ba8f6a92d48	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569f-3ab6-2cc3-4e638a72196d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569f-3ab6-d1f3-fdfd507a480d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569f-3ab6-329c-f37dab1d621b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569f-3ab6-c48a-b67ff4aee90a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569f-3ab6-e621-73d5534011a5	CU	CUB	192	Cuba 	Kuba	\N
00040000-569f-3ab6-41eb-06f7e424db66	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569f-3ab6-96ee-9ec857ecf512	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569f-3ab6-4304-fc476fc66217	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569f-3ab6-af81-a92cfee907e0	DK	DNK	208	Denmark 	Danska	\N
00040000-569f-3ab6-e987-290cbf29e6aa	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569f-3ab6-dfe4-e653d8766700	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-3ab6-563d-61147c7c4db7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569f-3ab6-08fa-b70d18819ed3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569f-3ab6-a78e-e81d2962012a	EG	EGY	818	Egypt 	Egipt	\N
00040000-569f-3ab6-b460-f7ec0c74d624	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569f-3ab6-c42e-230b7b29f0a7	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569f-3ab6-b6e2-eff3fcef1494	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569f-3ab6-291b-d89a7f87d1a9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569f-3ab6-a71f-29a2348f00d5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569f-3ab6-ddfe-4f9f48197381	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569f-3ab6-0007-f60a15f6c3cc	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569f-3ab6-3126-00870c3417e1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569f-3ab6-00f3-91b6867f7cb8	FI	FIN	246	Finland 	Finska	\N
00040000-569f-3ab6-185d-3c1dc82b13ee	FR	FRA	250	France 	Francija	\N
00040000-569f-3ab6-9318-c52cbbb21c53	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569f-3ab6-865f-056d6e9bdcfd	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569f-3ab6-a2d8-ca3f3570f3b4	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569f-3ab6-d627-0f475eccfab8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569f-3ab6-5e72-44a5d630a35c	GA	GAB	266	Gabon 	Gabon	\N
00040000-569f-3ab6-4fd5-904b95b41698	GM	GMB	270	Gambia 	Gambija	\N
00040000-569f-3ab6-f0ab-9d48a4414898	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569f-3ab6-9cb8-476b7af6114c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569f-3ab6-b1d6-235d3b72ceb0	GH	GHA	288	Ghana 	Gana	\N
00040000-569f-3ab6-9bda-8298c0973579	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569f-3ab6-a335-381150cd0c3a	GR	GRC	300	Greece 	Grčija	\N
00040000-569f-3ab6-acf5-36c4b063dc43	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569f-3ab6-eaed-b1c70f91a574	GD	GRD	308	Grenada 	Grenada	\N
00040000-569f-3ab6-bc1e-9aa3fdb9fdba	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569f-3ab6-40fe-6cd2d079b02d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569f-3ab6-13ff-bbf644b7aac4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569f-3ab6-c791-b6ce45d6ec32	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569f-3ab6-cff9-e389c3c7c2f1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569f-3ab6-0e74-3f4d1a944b76	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569f-3ab6-c14f-95d198f2215c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569f-3ab6-ede9-c13192af0d0c	HT	HTI	332	Haiti 	Haiti	\N
00040000-569f-3ab6-ad5e-3679ef7ce891	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569f-3ab6-25cf-659f70b0b628	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569f-3ab6-ea52-872ae4419955	HN	HND	340	Honduras 	Honduras	\N
00040000-569f-3ab6-9f6b-954bf6e5d5bc	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569f-3ab6-4e83-a8b50c93a93b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569f-3ab6-69b5-3f79ff63e558	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569f-3ab6-6ce7-3d7381d0b3e1	IN	IND	356	India 	Indija	\N
00040000-569f-3ab6-92c3-b798b22be33b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569f-3ab6-1769-d0c713118ebd	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569f-3ab6-f332-a6656a0c8f2a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569f-3ab6-cc32-d8a8242aa3c4	IE	IRL	372	Ireland 	Irska	\N
00040000-569f-3ab6-62ea-2a769cb504c5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569f-3ab6-e134-56c96653a6a5	IL	ISR	376	Israel 	Izrael	\N
00040000-569f-3ab6-bd2b-f8ea6d6f3d79	IT	ITA	380	Italy 	Italija	\N
00040000-569f-3ab6-2685-08915496aa29	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569f-3ab6-dd72-873cf9949abe	JP	JPN	392	Japan 	Japonska	\N
00040000-569f-3ab6-fc2e-5db3629f785e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569f-3ab6-bf5e-cf732dad61d7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569f-3ab6-5798-08727a8af373	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569f-3ab6-8052-2524b6b775a8	KE	KEN	404	Kenya 	Kenija	\N
00040000-569f-3ab6-65b5-2d74613a2afb	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569f-3ab6-098d-833cedb97bd7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569f-3ab6-e9c7-31218bd4506c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569f-3ab6-cf5b-50cf93020e73	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569f-3ab6-ba74-d49a25aa5648	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569f-3ab6-39a1-ebbf6c350d08	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569f-3ab6-cc6f-a9a36ccb4597	LV	LVA	428	Latvia 	Latvija	\N
00040000-569f-3ab6-a69e-e7ae2499cf78	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569f-3ab6-f034-3394b2ccad8c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569f-3ab6-99a2-ebd9d37c2d68	LR	LBR	430	Liberia 	Liberija	\N
00040000-569f-3ab6-bc2d-cc8e8ea788b8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569f-3ab6-0c4c-6bc772d15924	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569f-3ab6-c368-fc0a2bdea029	LT	LTU	440	Lithuania 	Litva	\N
00040000-569f-3ab6-ad4a-1739be6ba4a8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569f-3ab6-8fa9-3b132fce8686	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569f-3ab6-b3c3-051ad953dae4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569f-3ab6-8a88-5663002b8dbc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569f-3ab6-1488-9d085b3b50e6	MW	MWI	454	Malawi 	Malavi	\N
00040000-569f-3ab6-6f6a-301148e8f1b3	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569f-3ab6-2810-fdc8b9de4020	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569f-3ab6-83ba-062c2f8ae1c1	ML	MLI	466	Mali 	Mali	\N
00040000-569f-3ab6-3411-c905090fbb35	MT	MLT	470	Malta 	Malta	\N
00040000-569f-3ab6-ffda-3ce14960c117	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569f-3ab6-e5db-2b6ed681480e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569f-3ab6-99ec-74ce52660bc5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569f-3ab6-aca0-bd96609b6d39	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569f-3ab6-bc57-e52dc71a5715	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569f-3ab6-3891-f5f6f13f5d52	MX	MEX	484	Mexico 	Mehika	\N
00040000-569f-3ab6-24bb-35e98dfd5c2b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569f-3ab6-61ce-82328029aeba	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569f-3ab6-fae6-351582e01e82	MC	MCO	492	Monaco 	Monako	\N
00040000-569f-3ab6-b04b-f065aa866cf8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569f-3ab6-13e3-7e0200447f55	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569f-3ab6-505d-33e4ef976c8b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569f-3ab6-922e-38415acc760e	MA	MAR	504	Morocco 	Maroko	\N
00040000-569f-3ab6-4058-be36705444d0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569f-3ab6-1f4f-edd35c50cea5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569f-3ab6-8caf-9b802312f49c	NA	NAM	516	Namibia 	Namibija	\N
00040000-569f-3ab6-061c-c44a8248ecc6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569f-3ab6-c1a8-7048d17bcd05	NP	NPL	524	Nepal 	Nepal	\N
00040000-569f-3ab6-5361-ed01cb4f2d2c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569f-3ab6-4cb8-75331ad2a0be	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569f-3ab6-6cfe-5fd48f0c7245	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569f-3ab6-26c6-a8c3b4ab91fa	NE	NER	562	Niger 	Niger 	\N
00040000-569f-3ab6-20ad-d174c8a13962	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569f-3ab6-e88b-6ac361643686	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569f-3ab6-2f05-113be7626779	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569f-3ab6-cae6-3955ed33e831	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569f-3ab6-e535-0c74001ad6cd	NO	NOR	578	Norway 	Norveška	\N
00040000-569f-3ab6-c9ca-a5d98f29d5f6	OM	OMN	512	Oman 	Oman	\N
00040000-569f-3ab6-2b21-04b0e85bcad6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569f-3ab6-890d-2cec5630c2f8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569f-3ab6-28b7-eb9ff270b5f7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569f-3ab6-6c1b-50ac543bc407	PA	PAN	591	Panama 	Panama	\N
00040000-569f-3ab6-cb7e-bb8941e95718	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569f-3ab6-8ec6-9ebacab16e24	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569f-3ab6-86c5-3357174cf91c	PE	PER	604	Peru 	Peru	\N
00040000-569f-3ab6-22ed-4d199d478fa4	PH	PHL	608	Philippines 	Filipini	\N
00040000-569f-3ab6-ab2d-d405a0d06085	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569f-3ab6-31fd-1e9aba9c6a19	PL	POL	616	Poland 	Poljska	\N
00040000-569f-3ab6-95ac-1f3c473a3af8	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569f-3ab6-ee1f-7f600496ca5a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569f-3ab6-8f5f-9ebf69f0591e	QA	QAT	634	Qatar 	Katar	\N
00040000-569f-3ab6-6881-e55f802fae38	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569f-3ab6-5f43-bb4bf323b8c3	RO	ROU	642	Romania 	Romunija	\N
00040000-569f-3ab6-ab4c-5e4efd92913c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569f-3ab6-8d81-8aba5907e442	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569f-3ab6-07a0-b98ca2baaa6f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569f-3ab6-db1f-418c44326128	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569f-3ab6-0053-61dff5790dad	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569f-3ab6-23a8-ef2884c4425b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569f-3ab6-9b7f-16aeadae34cb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569f-3ab6-79c2-5e662d1aa0c4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569f-3ab6-91c9-93613e938db5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569f-3ab6-5ab9-4266c26a5ecc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569f-3ab6-f530-fecf7ca5da49	SM	SMR	674	San Marino 	San Marino	\N
00040000-569f-3ab6-913b-5f4100cb0a83	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569f-3ab6-71e2-ad62dc8d265f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569f-3ab6-ed9d-fff1ae419d1c	SN	SEN	686	Senegal 	Senegal	\N
00040000-569f-3ab6-78f4-196f1c905893	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569f-3ab6-824e-7be29966388a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569f-3ab6-a3f6-c5e12108c5a0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569f-3ab6-7eb5-85387be3b895	SG	SGP	702	Singapore 	Singapur	\N
00040000-569f-3ab6-f83d-d502d27758fd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569f-3ab6-eca2-33cf89e2f37a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569f-3ab6-48c4-51216b458a48	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569f-3ab6-5a0c-004ff6672676	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569f-3ab6-e24f-c9501703c59f	SO	SOM	706	Somalia 	Somalija	\N
00040000-569f-3ab6-1d93-38289109e6c9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569f-3ab6-82a4-5786d9951e4a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569f-3ab6-3590-abee15920dbb	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569f-3ab6-9979-82dbc86a7703	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569f-3ab6-1b21-897b1b540133	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569f-3ab6-f588-79c41e3e9c26	SD	SDN	729	Sudan 	Sudan	\N
00040000-569f-3ab6-ec2a-f91ae5d57f8d	SR	SUR	740	Suriname 	Surinam	\N
00040000-569f-3ab6-9540-481fc66d4384	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569f-3ab6-e892-03684da3bdf2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569f-3ab6-ab8a-6543c4bb819d	SE	SWE	752	Sweden 	Švedska	\N
00040000-569f-3ab6-9132-13c1437d36ba	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569f-3ab6-9dd6-fab62c9fb0dc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569f-3ab6-dc92-2247289c1f92	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569f-3ab6-5f44-823f137cced2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569f-3ab6-04a8-618f37428662	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569f-3ab6-3114-1a5b3e7f329d	TH	THA	764	Thailand 	Tajska	\N
00040000-569f-3ab6-5322-986862e9abe6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569f-3ab6-9bb8-29fbde90e5d7	TG	TGO	768	Togo 	Togo	\N
00040000-569f-3ab6-708f-5590efdb85a2	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569f-3ab6-ca4d-65d7065efce6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569f-3ab6-f512-4b91d270a8bc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569f-3ab6-6e08-6999abf62ee3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569f-3ab6-acf8-d3f740b3c4d4	TR	TUR	792	Turkey 	Turčija	\N
00040000-569f-3ab6-1ad9-1ab02a705f2d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569f-3ab6-b7b3-3bc14aeb53d0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-3ab6-6cca-b82f0de411c0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569f-3ab6-63cb-ccd83e04847e	UG	UGA	800	Uganda 	Uganda	\N
00040000-569f-3ab6-0b6c-ef42c43c413f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569f-3ab6-231b-b5d09c31ed89	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569f-3ab6-542f-4b88cf7de4f7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569f-3ab6-6731-c76823ca7968	US	USA	840	United States 	Združene države Amerike	\N
00040000-569f-3ab6-68dd-20936a66e5b4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569f-3ab6-7dca-6b1792339c1c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569f-3ab6-22f5-ca94be6d84d9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569f-3ab6-f2b9-6ba30bb0e365	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569f-3ab6-2ecd-4ddaf7a7cb16	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569f-3ab6-ae52-cdf8049e57d1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569f-3ab6-38d4-409df6179001	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-3ab6-1e30-1b10494f02c2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569f-3ab6-ba63-1cc20311f749	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569f-3ab6-0ec3-15a9e91f3245	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569f-3ab6-39b6-0d1dd05f13bf	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569f-3ab6-e3af-cfbdcc56e91b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569f-3ab6-d62e-d62545b0d223	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3203 (class 0 OID 38192720)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569f-3ab9-829e-8ef256b010f1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569f-3ab9-e959-7281cfd3cc7c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-3ab9-2203-0caf740f38e3	000e0000-569f-3ab9-0b8e-e24d3dffea87	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-3ab6-d7fb-f7e68cd3c2b0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-3ab9-e6e2-5dc4bd419b58	000e0000-569f-3ab9-2f74-dd7b1db308c0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-3ab6-8e23-6dc471fa6fea	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-3ab9-fdc7-026113c279ad	000e0000-569f-3ab9-edca-db1bfedb5de8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-3ab6-d7fb-f7e68cd3c2b0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 38192526)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569f-3ab9-bb17-ee714ecc3859	000e0000-569f-3ab9-2f74-dd7b1db308c0	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569f-3ab6-cd14-30580048d699
000d0000-569f-3ab9-3fe4-8ea1e6d0bf89	000e0000-569f-3ab9-d9e6-c1841d4faf50	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-3ab6-ba73-78cd507fee67
000d0000-569f-3ab9-4333-ef357ce68997	000e0000-569f-3ab9-d9e6-c1841d4faf50	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-d84f-7e51e63996cb	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-9840-04d746e22861	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-3ab6-ba73-78cd507fee67
000d0000-569f-3ab9-e5dc-8a9290d3f33f	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-fe8c-0fd0c72f5151	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-3bb2-2a7de2f7c763	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-a57a-11eda1d2a3ca	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569f-3ab6-fa26-93276282ed45
000d0000-569f-3ab9-56d0-95558faa4b00	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-bc4a-2e56423548c7	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569f-3ab6-cd14-30580048d699
000d0000-569f-3ab9-aa3f-bd46a0347263	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-3592-ef2556a8d61b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569f-3ab6-cd14-30580048d699
000d0000-569f-3ab9-a9e8-ba20b081fbdd	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-c5b9-16e57d439a19	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-3ab6-ba73-78cd507fee67
000d0000-569f-3ab9-26db-97019c870902	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-7a34-d7684231f92d	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569f-3ab6-ba73-78cd507fee67
000d0000-569f-3ab9-cf24-571cd7072693	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-e479-c3def71eebf5	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569f-3ab6-1117-f73bc0a42429
000d0000-569f-3ab9-9047-d500a77439a6	000e0000-569f-3ab9-2f74-dd7b1db308c0	000c0000-569f-3ab9-8dc0-e79c74487314	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569f-3ab6-0f65-24d586358031
000d0000-569f-3ab9-6b8a-2d5955dee6f7	000e0000-569f-3ab9-2fd5-d8cf640634ec	000c0000-569f-3ab9-1df0-0fca99308753	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-23c8-06caace2eb37	000e0000-569f-3ab9-9f6a-c31d02de7a10	000c0000-569f-3ab9-995b-40f65aaacee6	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-fc37-31e7f4933a17	000e0000-569f-3ab9-9f6a-c31d02de7a10	000c0000-569f-3ab9-3300-2212f762337d	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-6d77-0a73bd812a9f	000e0000-569f-3ab9-e569-336d8c95baf4	000c0000-569f-3ab9-bf03-be0361269557	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-7875-6a1162d73aae	000e0000-569f-3ab9-59cb-c2d46cfe4467	000c0000-569f-3ab9-a09d-25101fee6081	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-197b-3194ca85479e	000e0000-569f-3ab9-264f-1bba50c486ea	000c0000-569f-3ab9-14c2-d85f79b7dd67	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-9cff-d1df213b80a3	000e0000-569f-3ab9-9b1f-427d24a192f1	000c0000-569f-3ab9-6bfd-0b1819f7ed80	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-ec62-22d91620ab42	000e0000-569f-3ab9-73c3-7b025a2c1847	000c0000-569f-3ab9-26b1-3166b1255d9b	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-1837-b216b2cc87fe	000e0000-569f-3ab9-6145-1345c02af3ac	000c0000-569f-3ab9-d66c-c5c58d2e25d2	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-13b5-beb4d3d8b9dd	000e0000-569f-3ab9-6145-1345c02af3ac	000c0000-569f-3ab9-8bdc-4eefa9082e49	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-8c8d-7abfa797123d	000e0000-569f-3ab9-fb30-021ebe63de51	000c0000-569f-3ab9-6272-b1520613e39e	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
000d0000-569f-3ab9-a4c6-48c529494c96	000e0000-569f-3ab9-fb30-021ebe63de51	000c0000-569f-3ab9-eb58-2e637e401d37	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569f-3ab6-beac-bc994fd011a5
\.


--
-- TOC entry 3163 (class 0 OID 38192304)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 38192274)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 38192251)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569f-3ab9-6ff1-9a2a31024aca	00080000-569f-3ab9-b124-d31466f9ec7a	00090000-569f-3ab9-2fa0-7a9365f71b42	AK		igralka
\.


--
-- TOC entry 3177 (class 0 OID 38192440)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 38192990)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569f-3ab9-180a-e2697a24cb8f	00010000-569f-3ab7-e065-3b3d3dd2d116	\N	Prva mapa	Root mapa	2016-01-20 08:43:53	2016-01-20 08:43:53	R	\N	\N
\.


--
-- TOC entry 3215 (class 0 OID 38193003)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 38193025)
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
-- TOC entry 3181 (class 0 OID 38192465)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 38192208)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569f-3ab7-871a-bcdff0c9e612	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569f-3ab7-a3bd-92607c9a560d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569f-3ab7-f83b-8fb27a09bc72	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569f-3ab7-6879-1445b5f57318	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569f-3ab7-07e0-60dd4760bbbd	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569f-3ab7-5e58-a9fccc2f1696	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569f-3ab7-63ac-9c53468fae33	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569f-3ab7-18f8-491b2060b658	dogodek.termini	array	a:2:{s:15:"dopoldanZacetek";a:2:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:5:"value";s:5:"10:00";}s:13:"dopoldanKonec";a:2:{s:5:"label";s:27:"Konec dopoldanskega termina";s:5:"value";s:5:"14:00";}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-569f-3ab7-0f49-23947fb81fa6	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569f-3ab7-262d-9deefd8cf2e8	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-3ab7-a5b6-f52e7a3da310	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-3ab7-16f7-f90df8aa0334	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569f-3ab7-245a-8699e15a9cab	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569f-3ab7-9475-c9c1988fd81a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569f-3ab7-b135-9091c837beb6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569f-3ab7-a5a2-1d93325209f7	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569f-3ab8-588e-7604a811c55f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569f-3ab8-0c9e-eca94b9cca3c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569f-3ab8-501f-87aceff8ee7a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569f-3ab8-f7b9-547616af1f7e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569f-3ab8-d7b8-f0552b85d22a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569f-3abb-05ce-b2e512f33387	application.tenant.maticnopodjetje	string	s:36:"00080000-569f-3abb-f83b-97120521278f";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3148 (class 0 OID 38192108)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569f-3ab8-19b0-f82499e7a322	00000000-569f-3ab8-588e-7604a811c55f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569f-3ab8-9594-10547003f0e0	00000000-569f-3ab8-588e-7604a811c55f	00010000-569f-3ab7-e065-3b3d3dd2d116	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569f-3ab8-b9d7-7a687732057f	00000000-569f-3ab8-0c9e-eca94b9cca3c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3152 (class 0 OID 38192175)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569f-3ab9-02db-2201f35911a0	\N	00100000-569f-3ab9-ad85-c78a561355f4	00100000-569f-3ab9-1d3e-da8cd7be6f5b	01	Gledališče Nimbis
00410000-569f-3ab9-3f1d-3d4c6d9952f4	00410000-569f-3ab9-02db-2201f35911a0	00100000-569f-3ab9-ad85-c78a561355f4	00100000-569f-3ab9-1d3e-da8cd7be6f5b	02	Tehnika
\.


--
-- TOC entry 3149 (class 0 OID 38192119)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569f-3ab9-27e8-214f19777c07	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569f-3ab9-2add-9057f4e4e88a	00010000-569f-3ab9-9401-42980cfa8ac6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569f-3ab9-a9dd-a9bef5d98357	00010000-569f-3ab9-9b43-d5f57b15f25d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569f-3ab9-0918-92f2aa2e4d1b	00010000-569f-3ab9-0db7-22a54f01da71	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569f-3ab9-f8b5-7c6b7bd1f179	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569f-3ab9-ce70-3e6384b92d66	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569f-3ab9-796b-c87628197f30	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569f-3ab9-8784-b7511cad54db	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569f-3ab9-2fa0-7a9365f71b42	00010000-569f-3ab9-2943-e18ab7d91135	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569f-3ab9-41f6-b5849003ce3d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569f-3ab9-ba9f-859822d004f9	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-3ab9-97d8-0e88e9f9d567	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569f-3ab9-d7a6-73763a7ff0ae	00010000-569f-3ab9-74a0-ba65ca5eef34	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-3ab9-5747-c85f7e3462d8	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-3ab9-cdab-3744f90d427a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-3ab9-50be-fbea1a86686d	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-3ab9-74ea-5b9926d2fbc5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-3ab9-d6a4-74c9108d1d28	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-3ab9-1972-a46a29ef82aa	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-3ab9-1c91-9c14ee6c26c2	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-3ab9-02ba-c863a8220c12	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 38192054)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569f-3ab6-1064-765dfee02f3a	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569f-3ab6-0d91-82cbdb258cdb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569f-3ab6-1f47-69e13fdfc782	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569f-3ab6-23bc-54d636f545e5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569f-3ab6-f1ad-dfbe39e6193c	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569f-3ab6-5fbf-5839a0b94540	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569f-3ab6-8964-00abed24c3c6	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569f-3ab6-6ffc-3f650b3976a8	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569f-3ab6-4d03-bebb4966523a	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569f-3ab6-64ff-3c48d7e7201a	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569f-3ab6-d239-6465023f42e2	Abonma-read	Abonma - branje	t
00030000-569f-3ab6-72d6-0ce42e92b60e	Abonma-write	Abonma - spreminjanje	t
00030000-569f-3ab6-5916-0d080d193339	Alternacija-read	Alternacija - branje	t
00030000-569f-3ab6-fb7e-12a37ae582bd	Alternacija-write	Alternacija - spreminjanje	t
00030000-569f-3ab6-b92d-7e48d6ad6c4e	Arhivalija-read	Arhivalija - branje	t
00030000-569f-3ab6-de12-9f3b9f94208c	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569f-3ab6-10f0-9854588d3c86	AuthStorage-read	AuthStorage - branje	t
00030000-569f-3ab6-4cf7-c3c6f91c0593	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569f-3ab6-2d9c-fc25a13b5af4	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569f-3ab6-84ee-ad2bdd4ebc39	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569f-3ab6-2fab-e5cbd7f7f234	Besedilo-read	Besedilo - branje	t
00030000-569f-3ab6-c5a0-033287d04549	Besedilo-write	Besedilo - spreminjanje	t
00030000-569f-3ab6-4657-5fe14231178c	Dodatek-read	Dodatek - branje	t
00030000-569f-3ab6-cb33-6029a4b10fe6	Dodatek-write	Dodatek - spreminjanje	t
00030000-569f-3ab6-c2b1-6608fdae3c47	Dogodek-read	Dogodek - branje	t
00030000-569f-3ab6-a0dc-0b29b6125f94	Dogodek-write	Dogodek - spreminjanje	t
00030000-569f-3ab6-2754-80ede4b2cea7	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569f-3ab6-b0ba-7c8243a47853	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569f-3ab6-c45b-e70ff3907039	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569f-3ab6-ebba-b503b0d73899	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569f-3ab6-fa5f-424ce9bc3ed4	DogodekTrait-read	DogodekTrait - branje	t
00030000-569f-3ab6-0f86-915c4db39546	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569f-3ab6-ebf1-0b85596aee46	DrugiVir-read	DrugiVir - branje	t
00030000-569f-3ab6-dc20-b75d3ac92d4a	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569f-3ab6-b902-4509ae8d0692	Drzava-read	Drzava - branje	t
00030000-569f-3ab6-419a-da8e204e47ee	Drzava-write	Drzava - spreminjanje	t
00030000-569f-3ab6-cd33-d0f0c60bbe6c	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569f-3ab6-d0f0-a22a357afdaf	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569f-3ab6-2870-ae5ebbff8736	Funkcija-read	Funkcija - branje	t
00030000-569f-3ab6-7801-3a31d943d941	Funkcija-write	Funkcija - spreminjanje	t
00030000-569f-3ab6-e60e-05cff5fd877f	Gostovanje-read	Gostovanje - branje	t
00030000-569f-3ab6-07bc-0d09ad3f15f9	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569f-3ab6-32a2-a70656664df9	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569f-3ab6-1ec3-4bce7e95844f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569f-3ab6-794e-0bbdb7420397	Kupec-read	Kupec - branje	t
00030000-569f-3ab6-4c63-107d30769179	Kupec-write	Kupec - spreminjanje	t
00030000-569f-3ab6-211c-1dd052ee218f	NacinPlacina-read	NacinPlacina - branje	t
00030000-569f-3ab6-498b-831010dbe15e	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569f-3ab6-e7cd-ee1d51bce499	Option-read	Option - branje	t
00030000-569f-3ab6-603e-ff29679a11a7	Option-write	Option - spreminjanje	t
00030000-569f-3ab6-c59a-5a0dfd045db3	OptionValue-read	OptionValue - branje	t
00030000-569f-3ab6-9c60-46d79b9208d2	OptionValue-write	OptionValue - spreminjanje	t
00030000-569f-3ab6-d03c-615be15e39a4	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569f-3ab6-bd81-42bf4235aedc	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569f-3ab6-0482-a81c19dfbc68	Oseba-read	Oseba - branje	t
00030000-569f-3ab6-c958-fd55c4968f0f	Oseba-write	Oseba - spreminjanje	t
00030000-569f-3ab6-ae47-cef4564fff6e	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569f-3ab6-7b2b-eacfc2f158e0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569f-3ab6-8b3c-a012e2a8b997	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569f-3ab6-dc93-c4cdd6d65e7e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569f-3ab6-8aaf-41e51102838b	Pogodba-read	Pogodba - branje	t
00030000-569f-3ab6-7085-38baf6bf3507	Pogodba-write	Pogodba - spreminjanje	t
00030000-569f-3ab6-4eb4-a7ced8e0d309	Popa-read	Popa - branje	t
00030000-569f-3ab6-4c46-6b7b42b7617d	Popa-write	Popa - spreminjanje	t
00030000-569f-3ab6-bec5-94161be0dc1f	Posta-read	Posta - branje	t
00030000-569f-3ab6-c4aa-ee0c6bf672ab	Posta-write	Posta - spreminjanje	t
00030000-569f-3ab6-a098-820b88aa51da	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569f-3ab6-b939-7a991ee2e449	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569f-3ab6-8894-d596a1505620	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569f-3ab6-9ebb-155025330d0c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569f-3ab6-0243-e64e4aab1d15	PostniNaslov-read	PostniNaslov - branje	t
00030000-569f-3ab6-ae78-891f96048403	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569f-3ab6-9e43-b5cf580c4f1e	Praznik-read	Praznik - branje	t
00030000-569f-3ab6-ecc0-c7518b4c1797	Praznik-write	Praznik - spreminjanje	t
00030000-569f-3ab6-f571-b0f791314ada	Predstava-read	Predstava - branje	t
00030000-569f-3ab6-f5a2-5716cfc84041	Predstava-write	Predstava - spreminjanje	t
00030000-569f-3ab6-824d-30b37ac34d4e	Ura-read	Ura - branje	t
00030000-569f-3ab6-c8f7-0f8348b22de8	Ura-write	Ura - spreminjanje	t
00030000-569f-3ab6-3a57-c66d3f61376e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569f-3ab6-ebeb-2a275297d547	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569f-3ab6-b9b6-9a320c0f87cc	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569f-3ab6-e4b1-967a22ff141b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569f-3ab6-ef4e-e18178bae5fb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569f-3ab6-c218-8db84e187a8c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569f-3ab6-8031-9e500edd9683	ProgramDela-read	ProgramDela - branje	t
00030000-569f-3ab6-4ecb-c225cee5ae3d	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569f-3ab6-4302-524351eb57cd	ProgramFestival-read	ProgramFestival - branje	t
00030000-569f-3ab6-d9cd-55eaaea13fbc	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569f-3ab6-34cf-35cd0db46354	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569f-3ab6-ce95-d18deff58016	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569f-3ab6-7d3c-75818e1658c2	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569f-3ab6-aad9-68ff66774435	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569f-3ab6-eb42-35b216953e55	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569f-3ab6-de33-3872dbb8f932	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569f-3ab6-6641-9d869b8d2711	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569f-3ab6-1ca4-7210ec6d75d0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569f-3ab6-eb41-cacc6b987186	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569f-3ab6-786a-86b5e99fb635	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569f-3ab6-0d51-922900672a99	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569f-3ab6-615f-124d5ec99751	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569f-3ab6-1817-46a6eab54ab7	ProgramRazno-read	ProgramRazno - branje	t
00030000-569f-3ab6-2158-54ce0ac68ec9	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569f-3ab6-4719-ac58a35979ad	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569f-3ab6-b932-55e701ca0fc3	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569f-3ab6-d238-74c8b08ada93	Prostor-read	Prostor - branje	t
00030000-569f-3ab6-1381-b6c0820b154c	Prostor-write	Prostor - spreminjanje	t
00030000-569f-3ab6-9bf6-4631f7300b24	Racun-read	Racun - branje	t
00030000-569f-3ab6-a745-4b1f7457f4bb	Racun-write	Racun - spreminjanje	t
00030000-569f-3ab6-e2be-488c67dbf0f0	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569f-3ab6-f533-71071f2246f9	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569f-3ab6-36dc-ebc13533afbc	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569f-3ab6-1c13-3b7f0fe86dda	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569f-3ab6-12d5-c3fd39728343	Rekvizit-read	Rekvizit - branje	t
00030000-569f-3ab6-58e0-2ef914a7e620	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569f-3ab6-55bb-eab6a513f450	Revizija-read	Revizija - branje	t
00030000-569f-3ab6-2349-5316b68f995f	Revizija-write	Revizija - spreminjanje	t
00030000-569f-3ab6-193e-281543e83d1e	Rezervacija-read	Rezervacija - branje	t
00030000-569f-3ab6-350f-0c9b15164a65	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569f-3ab6-ed49-516aa1fd1f51	SedezniRed-read	SedezniRed - branje	t
00030000-569f-3ab6-131c-c05ec87de799	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569f-3ab6-6b4a-d957d92b29d2	Sedez-read	Sedez - branje	t
00030000-569f-3ab6-58cd-9e29531b392f	Sedez-write	Sedez - spreminjanje	t
00030000-569f-3ab6-24d9-20ca6038a8dc	Sezona-read	Sezona - branje	t
00030000-569f-3ab6-8c6c-e4e48949f84d	Sezona-write	Sezona - spreminjanje	t
00030000-569f-3ab6-8cc3-d374c0bccd98	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569f-3ab6-9b60-d16d40a01b53	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569f-3ab6-2a11-2bacaa9b6a3d	Telefonska-read	Telefonska - branje	t
00030000-569f-3ab6-def6-487e9b64e598	Telefonska-write	Telefonska - spreminjanje	t
00030000-569f-3ab6-d0a4-a6a8e91a3f29	TerminStoritve-read	TerminStoritve - branje	t
00030000-569f-3ab6-8e73-f95a6b833db8	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569f-3ab6-693a-db8a0a1d141c	TipDodatka-read	TipDodatka - branje	t
00030000-569f-3ab6-9abc-0bb1bbbd0cfb	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569f-3ab6-6c25-b4bd72d0286b	TipFunkcije-read	TipFunkcije - branje	t
00030000-569f-3ab6-6ac5-3210a78c3f62	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569f-3ab6-71e6-096476fd26bf	TipPopa-read	TipPopa - branje	t
00030000-569f-3ab6-e553-08a6d18dba3b	TipPopa-write	TipPopa - spreminjanje	t
00030000-569f-3ab6-f0a8-5843c09a2bfc	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569f-3ab6-9d5b-746853b7c6df	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569f-3ab6-0103-e7828f5ba5b8	TipVaje-read	TipVaje - branje	t
00030000-569f-3ab6-294b-5b942799c3de	TipVaje-write	TipVaje - spreminjanje	t
00030000-569f-3ab6-ab8f-cfa8534ba5d1	Trr-read	Trr - branje	t
00030000-569f-3ab6-a79f-36ab6c01c9cf	Trr-write	Trr - spreminjanje	t
00030000-569f-3ab6-8251-64f3345902b6	Uprizoritev-read	Uprizoritev - branje	t
00030000-569f-3ab6-c859-d553861e2973	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569f-3ab6-3ff2-822b4d03968f	Vaja-read	Vaja - branje	t
00030000-569f-3ab6-6bf4-c9b5a44c9377	Vaja-write	Vaja - spreminjanje	t
00030000-569f-3ab6-4e87-ee3d83da8872	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569f-3ab6-a654-193dd6c5ed17	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569f-3ab6-2eaf-635d84676017	VrstaStroska-read	VrstaStroska - branje	t
00030000-569f-3ab6-3d46-0ba894968ccf	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569f-3ab6-1a6d-85e4d572344a	Zaposlitev-read	Zaposlitev - branje	t
00030000-569f-3ab6-18e2-785bf1599d03	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569f-3ab6-114c-763cb592fc55	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569f-3ab6-2f76-18c4745518cc	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569f-3ab6-eb6a-19db6acf37a4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569f-3ab6-22b0-470f4869d4ab	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569f-3ab6-363e-6c184c444a64	Job-read	Branje opravil - samo zase - branje	t
00030000-569f-3ab6-3266-fc2a251cb39e	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569f-3ab6-f8e5-14acc17e05f3	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569f-3ab6-ddcf-887abb0e84b8	Report-read	Report - branje	t
00030000-569f-3ab6-8863-91ccb101634f	Report-write	Report - spreminjanje	t
00030000-569f-3ab6-5ea6-a5b5981315ed	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569f-3ab6-26a4-648ea24141b1	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569f-3ab6-0b50-bdeff9a6bf4f	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569f-3ab6-f729-e996253611db	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569f-3ab6-1247-642ba6cfbfbe	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569f-3ab6-a7ea-a336cf89d252	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569f-3ab6-a0b3-3121ef804a85	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569f-3ab6-dbf7-85afc177b318	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-3ab6-f08a-9e275c3179d3	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-3ab6-f00f-55d16d04497a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-3ab6-96d1-0a1751129b47	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-3ab6-62fb-71c00ae780cf	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569f-3ab6-adb2-4ea272ab8067	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569f-3ab6-8e3a-aeff07960f40	Datoteka-write	Datoteka - spreminjanje	t
00030000-569f-3ab6-88ef-e61c3fb2f32c	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3143 (class 0 OID 38192073)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569f-3ab6-6303-140332dcc76b	00030000-569f-3ab6-0d91-82cbdb258cdb
00020000-569f-3ab6-6303-140332dcc76b	00030000-569f-3ab6-1064-765dfee02f3a
00020000-569f-3ab6-3b7b-c833faf919a9	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-84ee-ad2bdd4ebc39
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-c5a0-033287d04549
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab6-6075-351047b8bee5	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab6-829a-37a1564e9114	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab6-829a-37a1564e9114	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab6-829a-37a1564e9114	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab6-829a-37a1564e9114	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab6-829a-37a1564e9114	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab6-829a-37a1564e9114	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab6-877d-8d09f16899e5	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab6-877d-8d09f16899e5	00030000-569f-3ab6-18e2-785bf1599d03
00020000-569f-3ab6-877d-8d09f16899e5	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab6-877d-8d09f16899e5	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab6-877d-8d09f16899e5	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab6-877d-8d09f16899e5	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab6-877d-8d09f16899e5	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab6-d033-59c1d7b98673	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab6-d033-59c1d7b98673	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab6-d033-59c1d7b98673	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab6-cecd-56cec55eed0f	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab6-cecd-56cec55eed0f	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab6-cecd-56cec55eed0f	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab6-cecd-56cec55eed0f	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab6-cecd-56cec55eed0f	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab6-cecd-56cec55eed0f	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab6-cecd-56cec55eed0f	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab6-cecd-56cec55eed0f	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab6-4b29-dcabb82d4c3a	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab6-4b29-dcabb82d4c3a	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab6-4b29-dcabb82d4c3a	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab6-4b29-dcabb82d4c3a	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-a79f-36ab6c01c9cf
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-ae78-891f96048403
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-def6-487e9b64e598
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab6-9c63-a025af773d2e	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab6-e297-a74a5cf6add9	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab6-e297-a74a5cf6add9	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab6-e297-a74a5cf6add9	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab6-e297-a74a5cf6add9	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab6-e297-a74a5cf6add9	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab6-e297-a74a5cf6add9	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab6-e297-a74a5cf6add9	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-def6-487e9b64e598
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-ae78-891f96048403
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-a79f-36ab6c01c9cf
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-4c46-6b7b42b7617d
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-1ec3-4bce7e95844f
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-c218-8db84e187a8c
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab6-6f26-b0ef0e9a801f	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab6-b2fd-857830c872e0	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab6-4364-ac94299716ed	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab6-4364-ac94299716ed	00030000-569f-3ab6-e553-08a6d18dba3b
00020000-569f-3ab6-ecef-68cc540a4682	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab6-7650-b089dd07ad5a	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab6-7650-b089dd07ad5a	00030000-569f-3ab6-c4aa-ee0c6bf672ab
00020000-569f-3ab6-756f-a99e1ea9b088	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab6-90ca-3b0ac79fd6bb	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab6-90ca-3b0ac79fd6bb	00030000-569f-3ab6-419a-da8e204e47ee
00020000-569f-3ab6-9ff1-b8dd21fa9ec9	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab6-10a1-c5696dda3fdf	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab6-10a1-c5696dda3fdf	00030000-569f-3ab6-22b0-470f4869d4ab
00020000-569f-3ab6-5eec-080cea090981	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab6-93af-5d4e1abc47a9	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab6-93af-5d4e1abc47a9	00030000-569f-3ab6-2f76-18c4745518cc
00020000-569f-3ab6-3e86-f0ff779d511f	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab6-b65f-ae8dd91a1913	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab6-b65f-ae8dd91a1913	00030000-569f-3ab6-72d6-0ce42e92b60e
00020000-569f-3ab6-809d-afb2816f0a34	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab6-b59c-fae9f5f85a21	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab6-b59c-fae9f5f85a21	00030000-569f-3ab6-1381-b6c0820b154c
00020000-569f-3ab6-b59c-fae9f5f85a21	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab6-b59c-fae9f5f85a21	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab6-b59c-fae9f5f85a21	00030000-569f-3ab6-ae78-891f96048403
00020000-569f-3ab6-b59c-fae9f5f85a21	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab6-6814-47b2cc23c639	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab6-6814-47b2cc23c639	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab6-6814-47b2cc23c639	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab7-bf18-f39865d02c50	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-bf18-f39865d02c50	00030000-569f-3ab6-3d46-0ba894968ccf
00020000-569f-3ab7-9892-882bbde82935	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-bd81-42bf4235aedc
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-e3b8-ddf809cffe41	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-322a-d57c10cf5711	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-322a-d57c10cf5711	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-322a-d57c10cf5711	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-322a-d57c10cf5711	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-322a-d57c10cf5711	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-bce8-bfb0eef421dc	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab7-bce8-bfb0eef421dc	00030000-569f-3ab6-294b-5b942799c3de
00020000-569f-3ab7-ac5b-83830e1354ce	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-8964-00abed24c3c6
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-6ffc-3f650b3976a8
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-8031-9e500edd9683
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-4ecb-c225cee5ae3d
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-4302-524351eb57cd
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-d9cd-55eaaea13fbc
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-34cf-35cd0db46354
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-ce95-d18deff58016
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-7d3c-75818e1658c2
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-aad9-68ff66774435
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-eb42-35b216953e55
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-de33-3872dbb8f932
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-6641-9d869b8d2711
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-1ca4-7210ec6d75d0
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-eb41-cacc6b987186
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-786a-86b5e99fb635
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-0d51-922900672a99
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-615f-124d5ec99751
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-1817-46a6eab54ab7
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-2158-54ce0ac68ec9
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-4719-ac58a35979ad
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-b932-55e701ca0fc3
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-e4b1-967a22ff141b
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-dc20-b75d3ac92d4a
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-b939-7a991ee2e449
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-3266-fc2a251cb39e
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-ebf1-0b85596aee46
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-b9b6-9a320c0f87cc
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-a098-820b88aa51da
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-363e-6c184c444a64
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-e45e-4ea7f46edcba	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-8031-9e500edd9683
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-4302-524351eb57cd
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-34cf-35cd0db46354
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-7d3c-75818e1658c2
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-eb42-35b216953e55
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-6641-9d869b8d2711
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-eb41-cacc6b987186
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-0d51-922900672a99
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-1817-46a6eab54ab7
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-4719-ac58a35979ad
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-b9b6-9a320c0f87cc
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-ebf1-0b85596aee46
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-a098-820b88aa51da
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-363e-6c184c444a64
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-7edc-75da9842872f	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-c859-d553861e2973
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-64ff-3c48d7e7201a
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-66d5-852a48deffa2	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-75f2-69f6884637a0	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-f6b1-ecb7187decb4	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-f6b1-ecb7187decb4	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-f6b1-ecb7187decb4	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-f6b1-ecb7187decb4	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab7-f6b1-ecb7187decb4	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-f6b1-ecb7187decb4	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-f6b1-ecb7187decb4	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-f6b1-ecb7187decb4	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-7085-38baf6bf3507
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-9b60-d16d40a01b53
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-f8ca-8ea19b150f36	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-566f-4054fd9739d4	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-5b13-b516d8331ebc	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-5b13-b516d8331ebc	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-5b13-b516d8331ebc	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-5b13-b516d8331ebc	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-5b13-b516d8331ebc	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-5b13-b516d8331ebc	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-5b13-b516d8331ebc	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-952a-fccad9d1afd6	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-952a-fccad9d1afd6	00030000-569f-3ab6-9b60-d16d40a01b53
00020000-569f-3ab7-952a-fccad9d1afd6	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-952a-fccad9d1afd6	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-941a-d1bc2d4e6c4d	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-941a-d1bc2d4e6c4d	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-84ee-ad2bdd4ebc39
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-c5a0-033287d04549
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-ebf1-0b85596aee46
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-dc20-b75d3ac92d4a
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-64ff-3c48d7e7201a
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-363e-6c184c444a64
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-3266-fc2a251cb39e
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-7085-38baf6bf3507
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-a098-820b88aa51da
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-b939-7a991ee2e449
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-b9b6-9a320c0f87cc
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-e4b1-967a22ff141b
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-8964-00abed24c3c6
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-8031-9e500edd9683
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-6ffc-3f650b3976a8
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-4ecb-c225cee5ae3d
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-4302-524351eb57cd
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-d9cd-55eaaea13fbc
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-34cf-35cd0db46354
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-ce95-d18deff58016
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-7d3c-75818e1658c2
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-aad9-68ff66774435
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-eb42-35b216953e55
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-de33-3872dbb8f932
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-6641-9d869b8d2711
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-1ca4-7210ec6d75d0
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-eb41-cacc6b987186
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-786a-86b5e99fb635
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-0d51-922900672a99
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-615f-124d5ec99751
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-1817-46a6eab54ab7
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-2158-54ce0ac68ec9
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-4719-ac58a35979ad
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-b932-55e701ca0fc3
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-9b60-d16d40a01b53
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-c859-d553861e2973
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab7-57f1-92571ba91f17	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-84ee-ad2bdd4ebc39
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-c5a0-033287d04549
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab7-1d4b-c2c4179afb0d	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-84ee-ad2bdd4ebc39
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-c5a0-033287d04549
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-64ff-3c48d7e7201a
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-c859-d553861e2973
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab7-ff8f-50ddb9489d7a	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-84ee-ad2bdd4ebc39
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-c5a0-033287d04549
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-ebf1-0b85596aee46
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-dc20-b75d3ac92d4a
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-64ff-3c48d7e7201a
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-363e-6c184c444a64
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-3266-fc2a251cb39e
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-1ec3-4bce7e95844f
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-7085-38baf6bf3507
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-4c46-6b7b42b7617d
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-a098-820b88aa51da
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-b939-7a991ee2e449
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-ae78-891f96048403
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-b9b6-9a320c0f87cc
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-e4b1-967a22ff141b
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-c218-8db84e187a8c
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-8964-00abed24c3c6
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-8031-9e500edd9683
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-6ffc-3f650b3976a8
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-4ecb-c225cee5ae3d
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-4302-524351eb57cd
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-d9cd-55eaaea13fbc
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-34cf-35cd0db46354
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-ce95-d18deff58016
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-7d3c-75818e1658c2
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-aad9-68ff66774435
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-eb42-35b216953e55
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-de33-3872dbb8f932
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-6641-9d869b8d2711
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-1ca4-7210ec6d75d0
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-eb41-cacc6b987186
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-786a-86b5e99fb635
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-0d51-922900672a99
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-615f-124d5ec99751
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-1817-46a6eab54ab7
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-2158-54ce0ac68ec9
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-4719-ac58a35979ad
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-b932-55e701ca0fc3
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-9b60-d16d40a01b53
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-def6-487e9b64e598
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-a79f-36ab6c01c9cf
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-c859-d553861e2973
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-18e2-785bf1599d03
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab7-4b8c-1ef38a44479a	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-84ee-ad2bdd4ebc39
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-c5a0-033287d04549
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-64ff-3c48d7e7201a
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-1ec3-4bce7e95844f
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-4c46-6b7b42b7617d
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-ae78-891f96048403
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-c218-8db84e187a8c
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-def6-487e9b64e598
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-a79f-36ab6c01c9cf
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-c859-d553861e2973
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-18e2-785bf1599d03
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab7-f680-2c60a649adb4	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab7-3e48-b707dd0edb3f	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-ebf1-0b85596aee46
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-dc20-b75d3ac92d4a
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-363e-6c184c444a64
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-3266-fc2a251cb39e
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-1ec3-4bce7e95844f
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-bd81-42bf4235aedc
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-7085-38baf6bf3507
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-4c46-6b7b42b7617d
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-a098-820b88aa51da
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-b939-7a991ee2e449
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-ae78-891f96048403
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-b9b6-9a320c0f87cc
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-e4b1-967a22ff141b
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-c218-8db84e187a8c
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-8964-00abed24c3c6
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-8031-9e500edd9683
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-6ffc-3f650b3976a8
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-4ecb-c225cee5ae3d
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-4302-524351eb57cd
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-d9cd-55eaaea13fbc
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-34cf-35cd0db46354
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-ce95-d18deff58016
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-7d3c-75818e1658c2
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-aad9-68ff66774435
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-eb42-35b216953e55
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-de33-3872dbb8f932
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-6641-9d869b8d2711
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-1ca4-7210ec6d75d0
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-eb41-cacc6b987186
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-786a-86b5e99fb635
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-0d51-922900672a99
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-615f-124d5ec99751
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-1817-46a6eab54ab7
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-2158-54ce0ac68ec9
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-4719-ac58a35979ad
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-b932-55e701ca0fc3
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-9b60-d16d40a01b53
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-def6-487e9b64e598
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-a79f-36ab6c01c9cf
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-3d46-0ba894968ccf
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-18e2-785bf1599d03
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab7-1da7-f368fd3997e5	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1064-765dfee02f3a
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-0d91-82cbdb258cdb
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-d239-6465023f42e2
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-72d6-0ce42e92b60e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-b92d-7e48d6ad6c4e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-de12-9f3b9f94208c
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-10f0-9854588d3c86
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4cf7-c3c6f91c0593
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2d9c-fc25a13b5af4
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-84ee-ad2bdd4ebc39
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2fab-e5cbd7f7f234
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-c5a0-033287d04549
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-c2b1-6608fdae3c47
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-23bc-54d636f545e5
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2754-80ede4b2cea7
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-b0ba-7c8243a47853
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-c45b-e70ff3907039
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ebba-b503b0d73899
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-fa5f-424ce9bc3ed4
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-0f86-915c4db39546
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-a0dc-0b29b6125f94
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ebf1-0b85596aee46
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-dc20-b75d3ac92d4a
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-b902-4509ae8d0692
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-419a-da8e204e47ee
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-cd33-d0f0c60bbe6c
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-d0f0-a22a357afdaf
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-64ff-3c48d7e7201a
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-e60e-05cff5fd877f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-07bc-0d09ad3f15f9
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f8e5-14acc17e05f3
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-363e-6c184c444a64
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-3266-fc2a251cb39e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-32a2-a70656664df9
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1ec3-4bce7e95844f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-794e-0bbdb7420397
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4c63-107d30769179
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-a0b3-3121ef804a85
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-a7ea-a336cf89d252
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-26a4-648ea24141b1
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-0b50-bdeff9a6bf4f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f729-e996253611db
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1247-642ba6cfbfbe
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-211c-1dd052ee218f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-498b-831010dbe15e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-e7cd-ee1d51bce499
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-c59a-5a0dfd045db3
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-9c60-46d79b9208d2
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-603e-ff29679a11a7
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-d03c-615be15e39a4
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-bd81-42bf4235aedc
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ae47-cef4564fff6e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-7b2b-eacfc2f158e0
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8b3c-a012e2a8b997
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-dc93-c4cdd6d65e7e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-7085-38baf6bf3507
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4c46-6b7b42b7617d
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-bec5-94161be0dc1f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-a098-820b88aa51da
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-b939-7a991ee2e449
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8894-d596a1505620
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-9ebb-155025330d0c
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-c4aa-ee0c6bf672ab
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ae78-891f96048403
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-9e43-b5cf580c4f1e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ecc0-c7518b4c1797
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f571-b0f791314ada
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f5a2-5716cfc84041
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-3a57-c66d3f61376e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ebeb-2a275297d547
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-b9b6-9a320c0f87cc
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-e4b1-967a22ff141b
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ef4e-e18178bae5fb
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-c218-8db84e187a8c
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8964-00abed24c3c6
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8031-9e500edd9683
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-6ffc-3f650b3976a8
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4ecb-c225cee5ae3d
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4302-524351eb57cd
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-d9cd-55eaaea13fbc
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-34cf-35cd0db46354
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ce95-d18deff58016
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-7d3c-75818e1658c2
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-aad9-68ff66774435
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-eb42-35b216953e55
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-de33-3872dbb8f932
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-6641-9d869b8d2711
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1ca4-7210ec6d75d0
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-eb41-cacc6b987186
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-786a-86b5e99fb635
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-0d51-922900672a99
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-615f-124d5ec99751
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1817-46a6eab54ab7
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2158-54ce0ac68ec9
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4719-ac58a35979ad
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-b932-55e701ca0fc3
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-d238-74c8b08ada93
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1381-b6c0820b154c
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-9bf6-4631f7300b24
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-a745-4b1f7457f4bb
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-e2be-488c67dbf0f0
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f533-71071f2246f9
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-36dc-ebc13533afbc
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1c13-3b7f0fe86dda
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-12d5-c3fd39728343
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-58e0-2ef914a7e620
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ddcf-887abb0e84b8
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8863-91ccb101634f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-55bb-eab6a513f450
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2349-5316b68f995f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-193e-281543e83d1e
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-350f-0c9b15164a65
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ed49-516aa1fd1f51
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-131c-c05ec87de799
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-6b4a-d957d92b29d2
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-58cd-9e29531b392f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-24d9-20ca6038a8dc
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8c6c-e4e48949f84d
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-5ea6-a5b5981315ed
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-9b60-d16d40a01b53
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-def6-487e9b64e598
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-d0a4-a6a8e91a3f29
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1f47-69e13fdfc782
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8e73-f95a6b833db8
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-6c25-b4bd72d0286b
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-6ac5-3210a78c3f62
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-71e6-096476fd26bf
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-e553-08a6d18dba3b
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f0a8-5843c09a2bfc
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-9d5b-746853b7c6df
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-0103-e7828f5ba5b8
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-294b-5b942799c3de
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-a79f-36ab6c01c9cf
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-c859-d553861e2973
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-3ff2-822b4d03968f
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-6bf4-c9b5a44c9377
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-4e87-ee3d83da8872
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-a654-193dd6c5ed17
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2eaf-635d84676017
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-3d46-0ba894968ccf
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-adb2-4ea272ab8067
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-62fb-71c00ae780cf
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-18e2-785bf1599d03
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-114c-763cb592fc55
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-2f76-18c4745518cc
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-eb6a-19db6acf37a4
00020000-569f-3ab8-8277-775698e05ec4	00030000-569f-3ab6-22b0-470f4869d4ab
00020000-569f-3ab8-96a9-ccbcb6115021	00030000-569f-3ab6-96d1-0a1751129b47
00020000-569f-3ab8-9688-fd75d1f12825	00030000-569f-3ab6-f00f-55d16d04497a
00020000-569f-3ab8-e1ae-e3c27cdc429f	00030000-569f-3ab6-c859-d553861e2973
00020000-569f-3ab8-1ae4-e725119d65da	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab8-3377-0359aec6d5b1	00030000-569f-3ab6-0b50-bdeff9a6bf4f
00020000-569f-3ab8-6061-f8c05dfcbff6	00030000-569f-3ab6-f729-e996253611db
00020000-569f-3ab8-0934-deff8bf3c094	00030000-569f-3ab6-1247-642ba6cfbfbe
00020000-569f-3ab8-a689-6fb246c97dbb	00030000-569f-3ab6-26a4-648ea24141b1
00020000-569f-3ab9-bcc8-a122f4061d64	00030000-569f-3ab6-a0b3-3121ef804a85
00020000-569f-3ab9-2f74-764896498116	00030000-569f-3ab6-a7ea-a336cf89d252
00020000-569f-3ab9-ed31-63f403d97626	00030000-569f-3ab6-f08a-9e275c3179d3
00020000-569f-3ab9-8ed6-6508310cdbcb	00030000-569f-3ab6-dbf7-85afc177b318
00020000-569f-3ab9-32ca-e73497d5d8dd	00030000-569f-3ab6-0482-a81c19dfbc68
00020000-569f-3ab9-ca9b-d8d39c916b8f	00030000-569f-3ab6-c958-fd55c4968f0f
00020000-569f-3ab9-ee95-e353d072cdd5	00030000-569f-3ab6-f1ad-dfbe39e6193c
00020000-569f-3ab9-ad59-01d8c0bf3a37	00030000-569f-3ab6-5fbf-5839a0b94540
00020000-569f-3ab9-1365-0c51d6939018	00030000-569f-3ab6-8e3a-aeff07960f40
00020000-569f-3ab9-a461-0882aba69dbb	00030000-569f-3ab6-88ef-e61c3fb2f32c
00020000-569f-3ab9-6b39-1f94e4d99443	00030000-569f-3ab6-4eb4-a7ced8e0d309
00020000-569f-3ab9-6b39-1f94e4d99443	00030000-569f-3ab6-4c46-6b7b42b7617d
00020000-569f-3ab9-6b39-1f94e4d99443	00030000-569f-3ab6-8251-64f3345902b6
00020000-569f-3ab9-b290-37a3291c57b1	00030000-569f-3ab6-ab8f-cfa8534ba5d1
00020000-569f-3ab9-adcb-b89cb899c2f2	00030000-569f-3ab6-a79f-36ab6c01c9cf
00020000-569f-3ab9-0e52-a3a9740b747a	00030000-569f-3ab6-5ea6-a5b5981315ed
00020000-569f-3ab9-85c7-bb4665a91244	00030000-569f-3ab6-2a11-2bacaa9b6a3d
00020000-569f-3ab9-5b98-d206a945e94a	00030000-569f-3ab6-def6-487e9b64e598
00020000-569f-3ab9-9abe-2cef6d2d84a4	00030000-569f-3ab6-0243-e64e4aab1d15
00020000-569f-3ab9-6e7a-e0e04e5303e1	00030000-569f-3ab6-ae78-891f96048403
00020000-569f-3ab9-610a-a0111f8ae46a	00030000-569f-3ab6-1a6d-85e4d572344a
00020000-569f-3ab9-d1a7-dab8cab72afa	00030000-569f-3ab6-18e2-785bf1599d03
00020000-569f-3ab9-c36a-5a1cb31daa36	00030000-569f-3ab6-8aaf-41e51102838b
00020000-569f-3ab9-fc77-a1fc650de9d0	00030000-569f-3ab6-7085-38baf6bf3507
00020000-569f-3ab9-7133-1490359ba6f3	00030000-569f-3ab6-8cc3-d374c0bccd98
00020000-569f-3ab9-c381-4af938b2a4c3	00030000-569f-3ab6-9b60-d16d40a01b53
00020000-569f-3ab9-5333-99bd176a6788	00030000-569f-3ab6-5916-0d080d193339
00020000-569f-3ab9-d547-8935b07d14cc	00030000-569f-3ab6-fb7e-12a37ae582bd
00020000-569f-3ab9-b9cf-9a6cd5be999b	00030000-569f-3ab6-4d03-bebb4966523a
00020000-569f-3ab9-8919-713177bb4f66	00030000-569f-3ab6-2870-ae5ebbff8736
00020000-569f-3ab9-a489-93acc20df281	00030000-569f-3ab6-7801-3a31d943d941
00020000-569f-3ab9-6c4d-6735c6cb3bab	00030000-569f-3ab6-64ff-3c48d7e7201a
\.


--
-- TOC entry 3182 (class 0 OID 38192472)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 38192506)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 38192639)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569f-3ab9-1445-7be87e61daab	00090000-569f-3ab9-27e8-214f19777c07	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569f-3ab9-eb35-699fec704e34	00090000-569f-3ab9-ce70-3e6384b92d66	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569f-3ab9-bdfd-182e0629764a	00090000-569f-3ab9-d7a6-73763a7ff0ae	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569f-3ab9-6c39-1b4b547a9da1	00090000-569f-3ab9-41f6-b5849003ce3d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3151 (class 0 OID 38192155)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569f-3ab9-b124-d31466f9ec7a	\N	00040000-569f-3ab6-48c4-51216b458a48	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-3ab9-f69e-4c0736522ed0	\N	00040000-569f-3ab6-48c4-51216b458a48	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569f-3ab9-377a-58c644e3d03d	\N	00040000-569f-3ab6-48c4-51216b458a48	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-3ab9-0d3a-4cba039b250d	\N	00040000-569f-3ab6-48c4-51216b458a48	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-3ab9-5bba-d0a96841f43b	\N	00040000-569f-3ab6-48c4-51216b458a48	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-3ab9-651c-0866759542c3	\N	00040000-569f-3ab6-0ce7-16b81c464422	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-3ab9-8571-8206be79750e	\N	00040000-569f-3ab6-c48a-b67ff4aee90a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-3ab9-77a4-42e125450d25	\N	00040000-569f-3ab6-893c-c243afbc8b3a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-3ab9-b8df-8679a2f019ec	\N	00040000-569f-3ab6-9cb8-476b7af6114c	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-3abb-f83b-97120521278f	\N	00040000-569f-3ab6-48c4-51216b458a48	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3154 (class 0 OID 38192200)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569f-3ab5-c0af-09807640584d	8341	Adlešiči
00050000-569f-3ab5-d1de-025e61d67b58	5270	Ajdovščina
00050000-569f-3ab5-9bd7-0f17a9177b5d	6280	Ankaran/Ancarano
00050000-569f-3ab5-5711-6ec90942d7bd	9253	Apače
00050000-569f-3ab5-cd0a-db3e32b69183	8253	Artiče
00050000-569f-3ab5-164c-50faf46a70a2	4275	Begunje na Gorenjskem
00050000-569f-3ab5-ae06-a898ee089716	1382	Begunje pri Cerknici
00050000-569f-3ab5-8928-8e732e27d174	9231	Beltinci
00050000-569f-3ab5-9bdc-1c377f7d8236	2234	Benedikt
00050000-569f-3ab5-4b66-7386278704b4	2345	Bistrica ob Dravi
00050000-569f-3ab5-bad6-f0b9d29e98b0	3256	Bistrica ob Sotli
00050000-569f-3ab5-d4f7-19a01764bfab	8259	Bizeljsko
00050000-569f-3ab5-ef19-344c18245230	1223	Blagovica
00050000-569f-3ab5-8ef4-151ed6f7caf0	8283	Blanca
00050000-569f-3ab5-1219-87d6e3fb791a	4260	Bled
00050000-569f-3ab5-e6ea-c39724576f0c	4273	Blejska Dobrava
00050000-569f-3ab5-a1a6-ced264b03bdd	9265	Bodonci
00050000-569f-3ab5-5451-8ebf2934e64e	9222	Bogojina
00050000-569f-3ab5-526d-538e8dbdc070	4263	Bohinjska Bela
00050000-569f-3ab5-0fc9-0f45f659f6c7	4264	Bohinjska Bistrica
00050000-569f-3ab5-3fd4-05a21ebdf231	4265	Bohinjsko jezero
00050000-569f-3ab5-6f0d-ac086537f75c	1353	Borovnica
00050000-569f-3ab5-354d-ce5d9583a283	8294	Boštanj
00050000-569f-3ab5-d214-79b916ff8a03	5230	Bovec
00050000-569f-3ab5-ce17-19ee2f13d547	5295	Branik
00050000-569f-3ab5-3abb-e61e3fcaee8f	3314	Braslovče
00050000-569f-3ab5-e8f7-95f109305700	5223	Breginj
00050000-569f-3ab5-7ce5-a57885297c36	8280	Brestanica
00050000-569f-3ab5-8c96-098eb3441905	2354	Bresternica
00050000-569f-3ab5-5b1d-360a16ec7655	4243	Brezje
00050000-569f-3ab5-39b1-bf5db5aad11a	1351	Brezovica pri Ljubljani
00050000-569f-3ab5-f0af-5efcfb0cacfe	8250	Brežice
00050000-569f-3ab5-2a3b-ada3c6aa2451	4210	Brnik - Aerodrom
00050000-569f-3ab5-4308-3258f19ea391	8321	Brusnice
00050000-569f-3ab5-3162-743ba47e8217	3255	Buče
00050000-569f-3ab5-4ab2-fcb15658be9f	8276	Bučka 
00050000-569f-3ab5-edc7-a9889b083d76	9261	Cankova
00050000-569f-3ab5-838c-06b3c57c71d6	3000	Celje 
00050000-569f-3ab5-27e2-d76a490d8692	3001	Celje - poštni predali
00050000-569f-3ab5-f02e-3631ae1641ab	4207	Cerklje na Gorenjskem
00050000-569f-3ab5-9c60-ae833ec94370	8263	Cerklje ob Krki
00050000-569f-3ab5-2607-1f9544a8fa43	1380	Cerknica
00050000-569f-3ab5-6e4e-4a74c54560c7	5282	Cerkno
00050000-569f-3ab5-a27b-15ca25407c70	2236	Cerkvenjak
00050000-569f-3ab5-8ff4-0c00d96e44a1	2215	Ceršak
00050000-569f-3ab5-9273-6a3ac166abe1	2326	Cirkovce
00050000-569f-3ab5-420c-2a7065eaa3b7	2282	Cirkulane
00050000-569f-3ab5-5053-c5c8da55cd33	5273	Col
00050000-569f-3ab5-0bef-dd5bf8ed7093	8251	Čatež ob Savi
00050000-569f-3ab5-fe13-cfab0e332da7	1413	Čemšenik
00050000-569f-3ab5-aeb2-13642fc76251	5253	Čepovan
00050000-569f-3ab5-ba4f-ee889104fde9	9232	Črenšovci
00050000-569f-3ab5-52fa-98a1a2ca0ea7	2393	Črna na Koroškem
00050000-569f-3ab5-cca4-cd0fa7d543aa	6275	Črni Kal
00050000-569f-3ab5-90af-4ed7825a5550	5274	Črni Vrh nad Idrijo
00050000-569f-3ab5-8a04-f27a8a19df24	5262	Črniče
00050000-569f-3ab5-f8ad-403e14f564c1	8340	Črnomelj
00050000-569f-3ab5-052d-168569dbc0e1	6271	Dekani
00050000-569f-3ab5-0e8f-05e5ae8047a7	5210	Deskle
00050000-569f-3ab5-24f8-a0d12d1facb8	2253	Destrnik
00050000-569f-3ab5-fa85-e4efedb75668	6215	Divača
00050000-569f-3ab5-329d-7a23a69dd759	1233	Dob
00050000-569f-3ab5-e5fb-34ac717cdad7	3224	Dobje pri Planini
00050000-569f-3ab5-9844-5dd041582aa4	8257	Dobova
00050000-569f-3ab5-6b94-ee9376d9af4c	1423	Dobovec
00050000-569f-3ab5-95b8-1a4df65bbe17	5263	Dobravlje
00050000-569f-3ab5-506f-6ee78052f3cc	3204	Dobrna
00050000-569f-3ab5-89c3-da4c1467864e	8211	Dobrnič
00050000-569f-3ab5-68c5-e5a0bb496bd5	1356	Dobrova
00050000-569f-3ab5-5373-01683c915bab	9223	Dobrovnik/Dobronak 
00050000-569f-3ab5-f982-8cc56d65dd8b	5212	Dobrovo v Brdih
00050000-569f-3ab5-1648-457c571261f4	1431	Dol pri Hrastniku
00050000-569f-3ab5-dbd2-9192a9725f04	1262	Dol pri Ljubljani
00050000-569f-3ab5-6455-3a856f5de34a	1273	Dole pri Litiji
00050000-569f-3ab5-7857-c7d1833b7cc0	1331	Dolenja vas
00050000-569f-3ab5-e7fa-b8445cc7dd1d	8350	Dolenjske Toplice
00050000-569f-3ab5-859b-9ee9a3ae7595	1230	Domžale
00050000-569f-3ab5-0e48-098b94a10f82	2252	Dornava
00050000-569f-3ab5-ea09-156ee866bf11	5294	Dornberk
00050000-569f-3ab5-3e1c-8197cb2c6604	1319	Draga
00050000-569f-3ab5-c080-02d6eaa60a66	8343	Dragatuš
00050000-569f-3ab5-3100-0ef1b31a1036	3222	Dramlje
00050000-569f-3ab5-7e1f-d0c90768441b	2370	Dravograd
00050000-569f-3ab5-7915-36d475935d0a	4203	Duplje
00050000-569f-3ab5-9012-68f448d42937	6221	Dutovlje
00050000-569f-3ab5-567d-ad185140ba9e	8361	Dvor
00050000-569f-3ab5-9734-c968e945ad3b	2343	Fala
00050000-569f-3ab5-663f-98cc9ea29f36	9208	Fokovci
00050000-569f-3ab5-36bb-0b4a33d96499	2313	Fram
00050000-569f-3ab5-c0e3-50c62d0704ba	3213	Frankolovo
00050000-569f-3ab5-299f-1dc9aaf27313	1274	Gabrovka
00050000-569f-3ab5-0c4c-35072dc1ae96	8254	Globoko
00050000-569f-3ab5-9926-acf21025bbff	5275	Godovič
00050000-569f-3ab5-f936-d1582621aeb0	4204	Golnik
00050000-569f-3ab5-7af0-9c70b89392da	3303	Gomilsko
00050000-569f-3ab5-6b25-6b69283a04ff	4224	Gorenja vas
00050000-569f-3ab5-71fd-fd4a9d437108	3263	Gorica pri Slivnici
00050000-569f-3ab5-0bcc-0d44049c1f04	2272	Gorišnica
00050000-569f-3ab5-e9db-c7d6136f7a0c	9250	Gornja Radgona
00050000-569f-3ab5-c4fa-29f823c054be	3342	Gornji Grad
00050000-569f-3ab5-47ad-271d385e3c82	4282	Gozd Martuljek
00050000-569f-3ab5-f04d-917295fa7c7e	6272	Gračišče
00050000-569f-3ab5-d0a6-39216941da6a	9264	Grad
00050000-569f-3ab5-5ffe-12e7c276aaad	8332	Gradac
00050000-569f-3ab5-1615-7dc0045ae55a	1384	Grahovo
00050000-569f-3ab5-4d68-d3ac0a0d5040	5242	Grahovo ob Bači
00050000-569f-3ab5-d8b7-4e9bd0dc48aa	5251	Grgar
00050000-569f-3ab5-dc43-038322485a46	3302	Griže
00050000-569f-3ab5-a825-2271e66ca3ba	3231	Grobelno
00050000-569f-3ab5-22d4-6e604fea2020	1290	Grosuplje
00050000-569f-3ab5-c9b5-f14c81a24355	2288	Hajdina
00050000-569f-3ab5-1622-70ef19810f77	8362	Hinje
00050000-569f-3ab5-b4d9-e712b8a91540	2311	Hoče
00050000-569f-3ab5-166e-379701106fdd	9205	Hodoš/Hodos
00050000-569f-3ab5-6705-6aab9d96836b	1354	Horjul
00050000-569f-3ab5-2f27-7dd470beb58a	1372	Hotedršica
00050000-569f-3ab5-f4f1-f5c77c39644c	1430	Hrastnik
00050000-569f-3ab5-9a73-15ea1d2fb733	6225	Hruševje
00050000-569f-3ab5-d64c-0d67b5a2a4b4	4276	Hrušica
00050000-569f-3ab5-0edb-54b74d3c3969	5280	Idrija
00050000-569f-3ab5-14f3-a935224735b1	1292	Ig
00050000-569f-3ab5-4f37-89652363c914	6250	Ilirska Bistrica
00050000-569f-3ab5-96c3-a70cf72622e9	6251	Ilirska Bistrica-Trnovo
00050000-569f-3ab5-97dc-ec36c5c0aa9a	1295	Ivančna Gorica
00050000-569f-3ab5-11e3-0b6974ce6292	2259	Ivanjkovci
00050000-569f-3ab5-7dbc-8e31cee752c0	1411	Izlake
00050000-569f-3ab5-0d84-f2e0645214b5	6310	Izola/Isola
00050000-569f-3ab5-90c0-fb4b40f5a8d5	2222	Jakobski Dol
00050000-569f-3ab5-0e94-2cb0afaf9c53	2221	Jarenina
00050000-569f-3ab5-95f2-c836ccdd962d	6254	Jelšane
00050000-569f-3ab5-2e60-85000acc91d0	4270	Jesenice
00050000-569f-3ab5-04b7-61a663df3d98	8261	Jesenice na Dolenjskem
00050000-569f-3ab5-82ac-21a580917d52	3273	Jurklošter
00050000-569f-3ab5-3069-1defef99e7a8	2223	Jurovski Dol
00050000-569f-3ab5-4703-7a58c0cd455b	2256	Juršinci
00050000-569f-3ab5-b4b0-4ba85a8f5b13	5214	Kal nad Kanalom
00050000-569f-3ab5-6722-68c89df3866f	3233	Kalobje
00050000-569f-3ab5-348e-203aed62d95a	4246	Kamna Gorica
00050000-569f-3ab5-b536-38b2052a68d8	2351	Kamnica
00050000-569f-3ab5-c814-8f93f9b28263	1241	Kamnik
00050000-569f-3ab5-3d9e-b0bf819943c0	5213	Kanal
00050000-569f-3ab5-ad52-5cdd7808b11a	8258	Kapele
00050000-569f-3ab5-2014-8453adbe69c1	2362	Kapla
00050000-569f-3ab5-713d-d4f621caa669	2325	Kidričevo
00050000-569f-3ab5-efe4-4c749aee1911	1412	Kisovec
00050000-569f-3ab5-557d-ec550c5b0105	6253	Knežak
00050000-569f-3ab5-ae33-10461acf897c	5222	Kobarid
00050000-569f-3ab5-f8f8-14cff79fdb2e	9227	Kobilje
00050000-569f-3ab5-dd36-f0677f7141de	1330	Kočevje
00050000-569f-3ab5-6995-c1b74d3d09de	1338	Kočevska Reka
00050000-569f-3ab5-4fb9-7413a463efb6	2276	Kog
00050000-569f-3ab5-836a-7aa784692860	5211	Kojsko
00050000-569f-3ab5-6a44-1935ab6ba80b	6223	Komen
00050000-569f-3ab5-b234-b2afb962f76b	1218	Komenda
00050000-569f-3ab5-8aba-4c4067ec6730	6000	Koper/Capodistria 
00050000-569f-3ab5-75e5-1590c9330976	6001	Koper/Capodistria - poštni predali
00050000-569f-3ab5-b15d-67ad5239b083	8282	Koprivnica
00050000-569f-3ab5-e092-f25b59dde6ef	5296	Kostanjevica na Krasu
00050000-569f-3ab5-ab79-5cfd1d2fec2f	8311	Kostanjevica na Krki
00050000-569f-3ab5-3d4b-1c8775ffe5cc	1336	Kostel
00050000-569f-3ab5-179c-a0b17f0d8124	6256	Košana
00050000-569f-3ab5-dcb9-b97fae74bce5	2394	Kotlje
00050000-569f-3ab5-e616-afe68a6a926a	6240	Kozina
00050000-569f-3ab5-e853-27b5c8d643fd	3260	Kozje
00050000-569f-3ab5-60c7-574e0bad6a8f	4000	Kranj 
00050000-569f-3ab5-425e-3c118d7e1a3a	4001	Kranj - poštni predali
00050000-569f-3ab5-ba0b-6b478ae6f0cd	4280	Kranjska Gora
00050000-569f-3ab5-cdcf-3b913e86974d	1281	Kresnice
00050000-569f-3ab5-3413-64033d1b4929	4294	Križe
00050000-569f-3ab5-e45c-1ccd5bb6ce69	9206	Križevci
00050000-569f-3ab5-e975-ffe7151d1f5a	9242	Križevci pri Ljutomeru
00050000-569f-3ab5-457e-072b464dd819	1301	Krka
00050000-569f-3ab5-72c2-aea7018e4891	8296	Krmelj
00050000-569f-3ab5-ef7f-0ba5bf36bfba	4245	Kropa
00050000-569f-3ab5-8413-2e500ca011df	8262	Krška vas
00050000-569f-3ab5-5560-05b0f2fc233a	8270	Krško
00050000-569f-3ab5-8f7a-5f20b7e6be03	9263	Kuzma
00050000-569f-3ab5-e578-e4b2de831173	2318	Laporje
00050000-569f-3ab5-6f80-95a012f1cff7	3270	Laško
00050000-569f-3ab5-1cee-d88d4a5a9c64	1219	Laze v Tuhinju
00050000-569f-3ab5-0338-9101457b0012	2230	Lenart v Slovenskih goricah
00050000-569f-3ab5-a2e9-335ff289efaf	9220	Lendava/Lendva
00050000-569f-3ab5-974a-a1890bb8497f	4248	Lesce
00050000-569f-3ab5-13e9-e1228b9f8732	3261	Lesično
00050000-569f-3ab5-fad6-10900fda9d4a	8273	Leskovec pri Krškem
00050000-569f-3ab5-b1c2-dbcb1140f94f	2372	Libeliče
00050000-569f-3ab5-3ad1-a0c966bd3df0	2341	Limbuš
00050000-569f-3ab5-ed10-c2c3d5a41b5a	1270	Litija
00050000-569f-3ab5-6657-7e1abb8ff09e	3202	Ljubečna
00050000-569f-3ab5-b4de-810dbbd1a02f	1000	Ljubljana 
00050000-569f-3ab5-a44d-b7e68bad7f92	1001	Ljubljana - poštni predali
00050000-569f-3ab5-2652-8d924aaf0dc8	1231	Ljubljana - Črnuče
00050000-569f-3ab5-3d5f-793aafd2c712	1261	Ljubljana - Dobrunje
00050000-569f-3ab5-18f4-248264dac994	1260	Ljubljana - Polje
00050000-569f-3ab5-5ea0-e81c9129c857	1210	Ljubljana - Šentvid
00050000-569f-3ab5-ecc1-da4a453ced9d	1211	Ljubljana - Šmartno
00050000-569f-3ab5-1a6a-bd7789c0a386	3333	Ljubno ob Savinji
00050000-569f-3ab5-2bac-40b8f000a97f	9240	Ljutomer
00050000-569f-3ab5-c000-ac40856fefb1	3215	Loče
00050000-569f-3ab5-c4f5-78fea7c6890e	5231	Log pod Mangartom
00050000-569f-3ab5-4ca6-900bb6df955c	1358	Log pri Brezovici
00050000-569f-3ab5-ac82-96a5b7ce6b54	1370	Logatec
00050000-569f-3ab5-df68-9aa1bd9a19f8	1371	Logatec
00050000-569f-3ab5-08e7-0b012ef46cb6	1434	Loka pri Zidanem Mostu
00050000-569f-3ab5-4337-f022e9536631	3223	Loka pri Žusmu
00050000-569f-3ab5-a567-c9a088e18078	6219	Lokev
00050000-569f-3ab5-0589-8201191f7df4	1318	Loški Potok
00050000-569f-3ab5-605a-861ce6132150	2324	Lovrenc na Dravskem polju
00050000-569f-3ab5-3969-e00009900bd0	2344	Lovrenc na Pohorju
00050000-569f-3ab5-7b17-7cafe36cc439	3334	Luče
00050000-569f-3ab5-943f-3ce077be32ba	1225	Lukovica
00050000-569f-3ab5-c538-bcbb657566f3	9202	Mačkovci
00050000-569f-3ab5-0eba-7feb33402a1b	2322	Majšperk
00050000-569f-3ab5-d46c-91e53e47ba1a	2321	Makole
00050000-569f-3ab5-072e-0443aa463e74	9243	Mala Nedelja
00050000-569f-3ab5-5f5c-856256e80fee	2229	Malečnik
00050000-569f-3ab5-ce1c-d059ae945803	6273	Marezige
00050000-569f-3ab5-373e-559686834672	2000	Maribor 
00050000-569f-3ab5-0d3a-246d5676f9e1	2001	Maribor - poštni predali
00050000-569f-3ab5-969a-139a7847ead3	2206	Marjeta na Dravskem polju
00050000-569f-3ab5-26cb-b8fc8f7c7665	2281	Markovci
00050000-569f-3ab5-1e90-e46d12fb1de4	9221	Martjanci
00050000-569f-3ab5-117a-081a033d677c	6242	Materija
00050000-569f-3ab5-d565-607fb078a756	4211	Mavčiče
00050000-569f-3ab5-bde6-b8e64e3ca612	1215	Medvode
00050000-569f-3ab5-8c95-6cdc2132d5c1	1234	Mengeš
00050000-569f-3ab5-a9b7-213f3ea4b4a5	8330	Metlika
00050000-569f-3ab5-9284-3eff8bf57e47	2392	Mežica
00050000-569f-3ab5-811e-3c0dd3c49651	2204	Miklavž na Dravskem polju
00050000-569f-3ab5-4f18-5338335d679a	2275	Miklavž pri Ormožu
00050000-569f-3ab5-4945-4cf2236eb80f	5291	Miren
00050000-569f-3ab5-4857-d15895d21cbc	8233	Mirna
00050000-569f-3ab5-92f9-c5ece82000ad	8216	Mirna Peč
00050000-569f-3ab5-0b67-b2c76f9ef2c6	2382	Mislinja
00050000-569f-3ab5-2785-fc1468ca289d	4281	Mojstrana
00050000-569f-3ab5-79ba-f97a0c3a8867	8230	Mokronog
00050000-569f-3ab5-a4df-f84930bfe425	1251	Moravče
00050000-569f-3ab5-9b7a-33ffb325c81d	9226	Moravske Toplice
00050000-569f-3ab5-1bfa-677894f3f910	5216	Most na Soči
00050000-569f-3ab5-b8bf-4597e53460d8	1221	Motnik
00050000-569f-3ab5-c816-e69390303730	3330	Mozirje
00050000-569f-3ab5-ad05-3e4750672eb6	9000	Murska Sobota 
00050000-569f-3ab5-3990-bc68789db056	9001	Murska Sobota - poštni predali
00050000-569f-3ab5-1108-d8140b8f2545	2366	Muta
00050000-569f-3ab5-3118-1b17472f6de3	4202	Naklo
00050000-569f-3ab5-e6b2-5a77da387628	3331	Nazarje
00050000-569f-3ab5-57a3-5a527854cd13	1357	Notranje Gorice
00050000-569f-3ab5-a014-6eeb3d7da273	3203	Nova Cerkev
00050000-569f-3ab5-90db-508aa8bffaf5	5000	Nova Gorica 
00050000-569f-3ab5-a06f-dde32f7f2eb0	5001	Nova Gorica - poštni predali
00050000-569f-3ab5-b9f2-dd474d671560	1385	Nova vas
00050000-569f-3ab5-10d9-e10f28fa07f9	8000	Novo mesto
00050000-569f-3ab5-831c-567bfc1909e2	8001	Novo mesto - poštni predali
00050000-569f-3ab5-af9e-3a119e010763	6243	Obrov
00050000-569f-3ab5-39fe-4f1a2ee88170	9233	Odranci
00050000-569f-3ab5-40b2-486fcf71925b	2317	Oplotnica
00050000-569f-3ab5-d9fa-d5c5d3649ca8	2312	Orehova vas
00050000-569f-3ab5-86e9-4d54031f702e	2270	Ormož
00050000-569f-3ab5-7eb3-7593d33560ee	1316	Ortnek
00050000-569f-3ab5-1e37-a9cd5465bcc5	1337	Osilnica
00050000-569f-3ab5-6655-ff7c81b94872	8222	Otočec
00050000-569f-3ab5-f4f1-1718a305f28c	2361	Ožbalt
00050000-569f-3ab5-296e-81e080002acb	2231	Pernica
00050000-569f-3ab5-2d9b-d24933786320	2211	Pesnica pri Mariboru
00050000-569f-3ab5-d0d4-260100dde2f6	9203	Petrovci
00050000-569f-3ab5-f37a-7e045bc96331	3301	Petrovče
00050000-569f-3ab5-fd9a-36b0ea6e69c0	6330	Piran/Pirano
00050000-569f-3ab5-d024-3ac5e7167583	8255	Pišece
00050000-569f-3ab5-3bbf-72efdb738506	6257	Pivka
00050000-569f-3ab5-044d-b9999613d54e	6232	Planina
00050000-569f-3ab5-f225-f781cbc8e303	3225	Planina pri Sevnici
00050000-569f-3ab5-6853-b1b74081d879	6276	Pobegi
00050000-569f-3ab5-1503-aeb8f43cc9df	8312	Podbočje
00050000-569f-3ab5-9f76-f693d88452d4	5243	Podbrdo
00050000-569f-3ab5-d5a6-6a95a7345de6	3254	Podčetrtek
00050000-569f-3ab5-1f5b-356ca5243b63	2273	Podgorci
00050000-569f-3ab5-ea84-4ddac9cca034	6216	Podgorje
00050000-569f-3ab5-d71e-5068ee9dba38	2381	Podgorje pri Slovenj Gradcu
00050000-569f-3ab5-91a4-24e54edbee04	6244	Podgrad
00050000-569f-3ab5-fbfc-20d06b132e1a	1414	Podkum
00050000-569f-3ab5-7740-62aca003dbc8	2286	Podlehnik
00050000-569f-3ab5-b44a-c076282c3e74	5272	Podnanos
00050000-569f-3ab5-57c3-1d0487fafd8d	4244	Podnart
00050000-569f-3ab5-96b0-d8f4c34c09d0	3241	Podplat
00050000-569f-3ab5-f08f-6b4add01ab4b	3257	Podsreda
00050000-569f-3ab5-abed-602950d498cb	2363	Podvelka
00050000-569f-3ab5-ff09-10df4a677333	2208	Pohorje
00050000-569f-3ab5-bc0f-120dca940d41	2257	Polenšak
00050000-569f-3ab5-408b-b689c70ce8c6	1355	Polhov Gradec
00050000-569f-3ab5-7f10-abbd5483b470	4223	Poljane nad Škofjo Loko
00050000-569f-3ab5-16c3-22830a3c8145	2319	Poljčane
00050000-569f-3ab5-43ad-a476b267ed9e	1272	Polšnik
00050000-569f-3ab5-5416-947c7e630dd3	3313	Polzela
00050000-569f-3ab5-05b9-6f6e53b675f7	3232	Ponikva
00050000-569f-3ab5-d7e7-76e095bcd0d6	6320	Portorož/Portorose
00050000-569f-3ab5-f468-f3a3efb9db09	6230	Postojna
00050000-569f-3ab5-562a-1864fe38d17a	2331	Pragersko
00050000-569f-3ab5-6259-e40aa8accbc3	3312	Prebold
00050000-569f-3ab5-f031-7db0e7629a28	4205	Preddvor
00050000-569f-3ab5-48d1-1889281090e0	6255	Prem
00050000-569f-3ab5-4777-06591c8a0951	1352	Preserje
00050000-569f-3ab5-ea0b-dcc546d773e2	6258	Prestranek
00050000-569f-3ab5-519e-8ab6c647d7dc	2391	Prevalje
00050000-569f-3ab5-7559-c7e42a7682b4	3262	Prevorje
00050000-569f-3ab5-f89b-16a24183c52f	1276	Primskovo 
00050000-569f-3ab5-fefb-0e89db1e5d81	3253	Pristava pri Mestinju
00050000-569f-3ab5-9c12-9403e8e1278b	9207	Prosenjakovci/Partosfalva
00050000-569f-3ab5-3c4d-8e7983b76106	5297	Prvačina
00050000-569f-3ab5-fc25-2d11ceb68a8f	2250	Ptuj
00050000-569f-3ab5-96f5-2ce94d701781	2323	Ptujska Gora
00050000-569f-3ab5-5dfb-38f5e8fe0a25	9201	Puconci
00050000-569f-3ab5-b3b4-3e722a3e7370	2327	Rače
00050000-569f-3ab5-1f8f-1d72480982ac	1433	Radeče
00050000-569f-3ab5-5cc0-9b98047c4701	9252	Radenci
00050000-569f-3ab5-0169-1a7af92ec291	2360	Radlje ob Dravi
00050000-569f-3ab5-ee39-ae539b2b4b89	1235	Radomlje
00050000-569f-3ab5-4e41-893ca43f74f9	4240	Radovljica
00050000-569f-3ab5-6da5-35b0a74aa7b5	8274	Raka
00050000-569f-3ab5-359f-0dec636d3e2a	1381	Rakek
00050000-569f-3ab5-f728-ff0d1f74a289	4283	Rateče - Planica
00050000-569f-3ab5-92ff-57a4a437a7a5	2390	Ravne na Koroškem
00050000-569f-3ab5-6895-8b4d8667717f	9246	Razkrižje
00050000-569f-3ab5-7bf5-60c83895fa2b	3332	Rečica ob Savinji
00050000-569f-3ab5-6857-3c9de7a7f1ef	5292	Renče
00050000-569f-3ab5-531d-173a9e201971	1310	Ribnica
00050000-569f-3ab5-ff6f-f1f210439298	2364	Ribnica na Pohorju
00050000-569f-3ab5-4351-99c7cd8ee0ed	3272	Rimske Toplice
00050000-569f-3ab5-5ab8-4bee18ea7ed1	1314	Rob
00050000-569f-3ab5-0912-c4931872856b	5215	Ročinj
00050000-569f-3ab5-4b03-fd58f7ed0753	3250	Rogaška Slatina
00050000-569f-3ab5-97a4-20d65ba53f24	9262	Rogašovci
00050000-569f-3ab5-7828-0dd5b0b02246	3252	Rogatec
00050000-569f-3ab5-bb63-5cbc1e70824b	1373	Rovte
00050000-569f-3ab5-6cdd-761d5fa22d94	2342	Ruše
00050000-569f-3ab5-a6c5-5fabcbb7dd22	1282	Sava
00050000-569f-3ab5-4097-85b2fe6decd2	6333	Sečovlje/Sicciole
00050000-569f-3ab5-208c-cec4a232987a	4227	Selca
00050000-569f-3ab5-185a-b5a82d15b3f4	2352	Selnica ob Dravi
00050000-569f-3ab5-3b5e-e7fd49e584f9	8333	Semič
00050000-569f-3ab5-41d4-98e52a1dbd08	8281	Senovo
00050000-569f-3ab5-493f-2fbb94490aec	6224	Senožeče
00050000-569f-3ab5-daf2-09156422499c	8290	Sevnica
00050000-569f-3ab5-2419-f7970eabef03	6210	Sežana
00050000-569f-3ab5-0f7e-9ab92f30c9e9	2214	Sladki Vrh
00050000-569f-3ab5-ec3b-4aff87061083	5283	Slap ob Idrijci
00050000-569f-3ab5-6181-86335db253d3	2380	Slovenj Gradec
00050000-569f-3ab5-6168-5976b3122b6d	2310	Slovenska Bistrica
00050000-569f-3ab5-b0ec-e35600568292	3210	Slovenske Konjice
00050000-569f-3ab5-ae6c-2331426179df	1216	Smlednik
00050000-569f-3ab5-5c3f-3b5c5189c095	5232	Soča
00050000-569f-3ab5-cae7-095c1aaad28f	1317	Sodražica
00050000-569f-3ab5-a6b0-ce5ea4086cb6	3335	Solčava
00050000-569f-3ab5-67a1-35a5059bdc8a	5250	Solkan
00050000-569f-3ab5-f9e7-fe7ebf649574	4229	Sorica
00050000-569f-3ab5-83fc-e4ee37e3aba0	4225	Sovodenj
00050000-569f-3ab5-89a9-9e42e40ac772	5281	Spodnja Idrija
00050000-569f-3ab5-bb11-0276899cd09d	2241	Spodnji Duplek
00050000-569f-3ab5-4b23-56fe745b886e	9245	Spodnji Ivanjci
00050000-569f-3ab5-0171-6e5368cd8265	2277	Središče ob Dravi
00050000-569f-3ab5-6f3d-c95b8566c286	4267	Srednja vas v Bohinju
00050000-569f-3ab5-dea6-00dfd2ea429a	8256	Sromlje 
00050000-569f-3ab5-7420-d06c74057146	5224	Srpenica
00050000-569f-3ab5-84f4-c2363631dbb8	1242	Stahovica
00050000-569f-3ab5-804b-a51760cf60d2	1332	Stara Cerkev
00050000-569f-3ab5-86a8-c6c25ce487e3	8342	Stari trg ob Kolpi
00050000-569f-3ab5-923a-5fe3d37375f1	1386	Stari trg pri Ložu
00050000-569f-3ab5-fb1d-ebc0a1af773b	2205	Starše
00050000-569f-3ab5-9a6b-b7cca55e36a3	2289	Stoperce
00050000-569f-3ab5-59c9-79fc8f497d86	8322	Stopiče
00050000-569f-3ab5-bf8b-ef6897e7097b	3206	Stranice
00050000-569f-3ab5-9d4b-b19a011a0f86	8351	Straža
00050000-569f-3ab5-70a2-d774ab6e6d77	1313	Struge
00050000-569f-3ab5-3df8-244ac8603a9f	8293	Studenec
00050000-569f-3ab5-6c06-694a8cfc4a2e	8331	Suhor
00050000-569f-3ab5-5a96-70a9f530ad65	2233	Sv. Ana v Slovenskih goricah
00050000-569f-3ab5-126f-91d373ae99c7	2235	Sv. Trojica v Slovenskih goricah
00050000-569f-3ab5-7e8b-224b75e4fc78	2353	Sveti Duh na Ostrem Vrhu
00050000-569f-3ab5-51c0-39a13dc7755e	9244	Sveti Jurij ob Ščavnici
00050000-569f-3ab5-5b45-ceff5473d987	3264	Sveti Štefan
00050000-569f-3ab5-f016-cce5a3dd70a2	2258	Sveti Tomaž
00050000-569f-3ab5-fb93-d169ce37923d	9204	Šalovci
00050000-569f-3ab5-0b50-2891401b4343	5261	Šempas
00050000-569f-3ab5-7ec8-ca153241af9f	5290	Šempeter pri Gorici
00050000-569f-3ab5-e55a-84591e975624	3311	Šempeter v Savinjski dolini
00050000-569f-3ab5-53a2-c320c137fc59	4208	Šenčur
00050000-569f-3ab5-215c-50beeacc734a	2212	Šentilj v Slovenskih goricah
00050000-569f-3ab5-52f3-3fc44c01ad75	8297	Šentjanž
00050000-569f-3ab5-1da4-4554ccfb9ed2	2373	Šentjanž pri Dravogradu
00050000-569f-3ab5-d469-7286d28587e0	8310	Šentjernej
00050000-569f-3ab5-64ef-0353bc9b9e58	3230	Šentjur
00050000-569f-3ab5-6c95-d1a2a6ceb00b	3271	Šentrupert
00050000-569f-3ab5-6304-bc4a736a14ee	8232	Šentrupert
00050000-569f-3ab5-6c2d-a2762e4e6792	1296	Šentvid pri Stični
00050000-569f-3ab5-9be2-43ef64fa06e9	8275	Škocjan
00050000-569f-3ab5-d606-f86860b50e5c	6281	Škofije
00050000-569f-3ab5-e68c-6cf21d35f8b5	4220	Škofja Loka
00050000-569f-3ab5-f8c8-0f715738594f	3211	Škofja vas
00050000-569f-3ab5-4c5e-0fa2ecdde8cd	1291	Škofljica
00050000-569f-3ab5-9ff9-6f3d983cb3ed	6274	Šmarje
00050000-569f-3ab5-4791-a6f5d6c47577	1293	Šmarje - Sap
00050000-569f-3ab5-9b7f-fed601b0689a	3240	Šmarje pri Jelšah
00050000-569f-3ab5-0fc1-bc42e05c13c6	8220	Šmarješke Toplice
00050000-569f-3ab5-d1d3-6cd0d4279ac9	2315	Šmartno na Pohorju
00050000-569f-3ab5-547a-048ddcdff379	3341	Šmartno ob Dreti
00050000-569f-3ab5-834e-c579915032da	3327	Šmartno ob Paki
00050000-569f-3ab5-65b5-4f46dd3dff64	1275	Šmartno pri Litiji
00050000-569f-3ab5-0f96-d626c9f073c4	2383	Šmartno pri Slovenj Gradcu
00050000-569f-3ab5-f70f-e69506bafb08	3201	Šmartno v Rožni dolini
00050000-569f-3ab5-cf8d-7c375b9a5e30	3325	Šoštanj
00050000-569f-3ab6-63ee-69237438fa0e	6222	Štanjel
00050000-569f-3ab6-09f5-2b19ea4c4759	3220	Štore
00050000-569f-3ab6-985d-ade1cdc8d277	3304	Tabor
00050000-569f-3ab6-2c0e-e585fece1e46	3221	Teharje
00050000-569f-3ab6-3e14-4a8202772990	9251	Tišina
00050000-569f-3ab6-3f95-0201c1f953d7	5220	Tolmin
00050000-569f-3ab6-efa8-3fa44c829054	3326	Topolšica
00050000-569f-3ab6-5e5f-52483ae528f6	2371	Trbonje
00050000-569f-3ab6-c1a5-4d82bcf4d1a6	1420	Trbovlje
00050000-569f-3ab6-70c1-a8b13dd79c65	8231	Trebelno 
00050000-569f-3ab6-9714-80315cae963d	8210	Trebnje
00050000-569f-3ab6-9c52-79062b36cd49	5252	Trnovo pri Gorici
00050000-569f-3ab6-2c4e-abc14dc801b9	2254	Trnovska vas
00050000-569f-3ab6-b742-15316804bcf1	1222	Trojane
00050000-569f-3ab6-3f70-89f177105219	1236	Trzin
00050000-569f-3ab6-c3f4-055dbe2cf694	4290	Tržič
00050000-569f-3ab6-8c30-cb328c576ae4	8295	Tržišče
00050000-569f-3ab6-4c6f-3d7ad6c7c478	1311	Turjak
00050000-569f-3ab6-d528-7093490bd35c	9224	Turnišče
00050000-569f-3ab6-8787-76810cdc536e	8323	Uršna sela
00050000-569f-3ab6-3a02-a9379e4a5e5a	1252	Vače
00050000-569f-3ab6-7666-8061dca6713b	3320	Velenje 
00050000-569f-3ab6-a589-a991c274e227	3322	Velenje - poštni predali
00050000-569f-3ab6-7ea1-40026bb847d9	8212	Velika Loka
00050000-569f-3ab6-f01d-0efd1bcc3712	2274	Velika Nedelja
00050000-569f-3ab6-e269-0d6ccbd481cb	9225	Velika Polana
00050000-569f-3ab6-76c6-158b6ed222e7	1315	Velike Lašče
00050000-569f-3ab6-419d-4f7b81b6be38	8213	Veliki Gaber
00050000-569f-3ab6-bc17-ac74de8ec240	9241	Veržej
00050000-569f-3ab6-84a7-a6a163db83c1	1312	Videm - Dobrepolje
00050000-569f-3ab6-6e51-466e517e14ef	2284	Videm pri Ptuju
00050000-569f-3ab6-e0a3-42629a3f21d2	8344	Vinica
00050000-569f-3ab6-3bad-ebb5ccc4373f	5271	Vipava
00050000-569f-3ab6-6b7d-8ef28b292eea	4212	Visoko
00050000-569f-3ab6-74f5-1544591f2648	1294	Višnja Gora
00050000-569f-3ab6-7b41-d0439269f02f	3205	Vitanje
00050000-569f-3ab6-cb9f-039cedcc3a2a	2255	Vitomarci
00050000-569f-3ab6-b002-90a8afc85dab	1217	Vodice
00050000-569f-3ab6-9b00-a9521c251b9d	3212	Vojnik\t
00050000-569f-3ab6-e369-a2bd250d2c94	5293	Volčja Draga
00050000-569f-3ab6-b9d5-edd86c2eaed5	2232	Voličina
00050000-569f-3ab6-d137-5b258b76fefb	3305	Vransko
00050000-569f-3ab6-1dee-c39bf09d6d3a	6217	Vremski Britof
00050000-569f-3ab6-6211-e0b68780c6d5	1360	Vrhnika
00050000-569f-3ab6-8316-bfda3e80f502	2365	Vuhred
00050000-569f-3ab6-094b-49150b8a38f8	2367	Vuzenica
00050000-569f-3ab6-8ae5-5c2355444479	8292	Zabukovje 
00050000-569f-3ab6-2497-26168fd25a06	1410	Zagorje ob Savi
00050000-569f-3ab6-3b15-06b8531bfe30	1303	Zagradec
00050000-569f-3ab6-0993-9abd37d690d0	2283	Zavrč
00050000-569f-3ab6-71f8-69418ab22d61	8272	Zdole 
00050000-569f-3ab6-d1a1-2c8b7d014fcb	4201	Zgornja Besnica
00050000-569f-3ab6-91bf-5d0d433a3e75	2242	Zgornja Korena
00050000-569f-3ab6-047a-1a4d95203d45	2201	Zgornja Kungota
00050000-569f-3ab6-8cb8-c1c9bf3de93c	2316	Zgornja Ložnica
00050000-569f-3ab6-158f-3674bcf10acb	2314	Zgornja Polskava
00050000-569f-3ab6-48c2-72f35761febd	2213	Zgornja Velka
00050000-569f-3ab6-3a7d-be12766d0a3f	4247	Zgornje Gorje
00050000-569f-3ab6-e92e-9a8424abb295	4206	Zgornje Jezersko
00050000-569f-3ab6-502c-8323c2a7989f	2285	Zgornji Leskovec
00050000-569f-3ab6-3876-04ca3ae91d8b	1432	Zidani Most
00050000-569f-3ab6-04a0-908401e949eb	3214	Zreče
00050000-569f-3ab6-cb10-bf583e03d5fd	4209	Žabnica
00050000-569f-3ab6-94c5-2c362487686c	3310	Žalec
00050000-569f-3ab6-a011-792b828064cc	4228	Železniki
00050000-569f-3ab6-518d-69c51731271d	2287	Žetale
00050000-569f-3ab6-01e3-7b524a511bc8	4226	Žiri
00050000-569f-3ab6-8ec7-eb4ce913f93a	4274	Žirovnica
00050000-569f-3ab6-f688-69a73e4d6c4b	8360	Žužemberk
\.


--
-- TOC entry 3205 (class 0 OID 38192876)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 38192446)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 38192185)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569f-3ab9-da83-ba4f1b48d120	00080000-569f-3ab9-b124-d31466f9ec7a	\N	00040000-569f-3ab6-48c4-51216b458a48	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569f-3ab9-827b-1d0eb4b0f4e2	00080000-569f-3ab9-b124-d31466f9ec7a	\N	00040000-569f-3ab6-48c4-51216b458a48	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569f-3ab9-9cdc-8ced995f6377	00080000-569f-3ab9-f69e-4c0736522ed0	\N	00040000-569f-3ab6-48c4-51216b458a48	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3165 (class 0 OID 38192322)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569f-3ab6-4aec-d4dac13bffd0	novo leto	1	1	\N	t
00430000-569f-3ab6-4036-bdd46d33e280	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569f-3ab6-c537-a776fccd6622	dan upora proti okupatorju	27	4	\N	t
00430000-569f-3ab6-15fb-0a44f5a4a4a5	praznik dela	1	5	\N	t
00430000-569f-3ab6-35dd-9760f9b39050	praznik dela	2	5	\N	t
00430000-569f-3ab6-a6bf-4e293edb0128	dan Primoža Trubarja	8	6	\N	f
00430000-569f-3ab6-fd45-4232fb1bb8b5	dan državnosti	25	6	\N	t
00430000-569f-3ab6-5a59-757711c4c126	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569f-3ab6-6ea7-72bd4dbd637c	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569f-3ab6-f289-71c541d4851e	dan suverenosti	25	10	\N	f
00430000-569f-3ab6-3cca-91d1e2b6b154	dan spomina na mrtve	1	11	\N	t
00430000-569f-3ab6-e0b4-05aaea852eda	dan Rudolfa Maistra	23	11	\N	f
00430000-569f-3ab6-8b8f-f717d6cdab73	božič	25	12	\N	t
00430000-569f-3ab6-3d39-43db91317b36	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569f-3ab6-61d6-c5482a7b416b	Marijino vnebovzetje	15	8	\N	t
00430000-569f-3ab6-3f05-4308c4a013ef	dan reformacije	31	10	\N	t
00430000-569f-3ab6-7f33-dbd11b30b334	velikonočna nedelja	27	3	2016	t
00430000-569f-3ab6-22ca-9300a777459a	velikonočna nedelja	16	4	2017	t
00430000-569f-3ab6-320e-ae0e1aef4f87	velikonočna nedelja	1	4	2018	t
00430000-569f-3ab6-cc68-b38f7c3ac831	velikonočna nedelja	21	4	2019	t
00430000-569f-3ab6-fe2d-38329e5804b1	velikonočna nedelja	12	4	2020	t
00430000-569f-3ab6-b113-dedcc77a208d	velikonočna nedelja	4	4	2021	t
00430000-569f-3ab6-59bf-81ff1c69e4c0	velikonočna nedelja	17	4	2022	t
00430000-569f-3ab6-12ac-e51cd16b2767	velikonočna nedelja	9	4	2023	t
00430000-569f-3ab6-7887-d16986ff450f	velikonočna nedelja	31	3	2024	t
00430000-569f-3ab6-5910-792c0083c0e9	velikonočna nedelja	20	4	2025	t
00430000-569f-3ab6-a52d-dc084c9731dc	velikonočna nedelja	5	4	2026	t
00430000-569f-3ab6-6197-fb5ac5ff5b81	velikonočna nedelja	28	3	2027	t
00430000-569f-3ab6-6a16-6f69541aa737	velikonočna nedelja	16	4	2028	t
00430000-569f-3ab6-8bba-7338824d873c	velikonočna nedelja	1	4	2029	t
00430000-569f-3ab6-a67a-27a0c0899051	velikonočna nedelja	21	4	2030	t
00430000-569f-3ab6-61db-e5df253da016	velikonočni ponedeljek	28	3	2016	t
00430000-569f-3ab6-193f-2b1a06a42fdb	velikonočni ponedeljek	17	4	2017	t
00430000-569f-3ab6-6cfd-de15f86ab9ac	velikonočni ponedeljek	2	4	2018	t
00430000-569f-3ab6-8b2d-0ff6efdf9019	velikonočni ponedeljek	22	4	2019	t
00430000-569f-3ab6-1a68-fa727f64f6f7	velikonočni ponedeljek	13	4	2020	t
00430000-569f-3ab6-69b7-92023a4738ed	velikonočni ponedeljek	5	4	2021	t
00430000-569f-3ab6-db81-96479ce4b71d	velikonočni ponedeljek	18	4	2022	t
00430000-569f-3ab6-48dd-f8cbed071be6	velikonočni ponedeljek	10	4	2023	t
00430000-569f-3ab6-3db9-4f9fb7b9fac7	velikonočni ponedeljek	1	4	2024	t
00430000-569f-3ab6-e962-510e372125c8	velikonočni ponedeljek	21	4	2025	t
00430000-569f-3ab6-7acd-4b10de2abe0f	velikonočni ponedeljek	6	4	2026	t
00430000-569f-3ab6-bffa-252e84c56bea	velikonočni ponedeljek	29	3	2027	t
00430000-569f-3ab6-52d3-6e1c94a16ce1	velikonočni ponedeljek	17	4	2028	t
00430000-569f-3ab6-db84-34f4d5c3cac2	velikonočni ponedeljek	2	4	2029	t
00430000-569f-3ab6-66fc-ea1ad79bcde2	velikonočni ponedeljek	22	4	2030	t
00430000-569f-3ab6-24a7-19e2dda991df	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569f-3ab6-c24d-eee403455a50	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569f-3ab6-2a97-075418523a3b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569f-3ab6-faee-1361195f277a	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569f-3ab6-7049-623bf4d2bf49	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569f-3ab6-0a5d-e5a497eb74ec	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569f-3ab6-afe0-3f1f400ebdfa	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569f-3ab6-826a-5d7e9d76f03a	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569f-3ab6-ea22-e29d5e7b9187	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569f-3ab6-94ab-5c5d6b2fe04a	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569f-3ab6-4720-d701c10d6428	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569f-3ab6-ba62-d905900ae18b	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569f-3ab6-40a5-dbf8d6037e2c	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569f-3ab6-68bb-9d8bd2722751	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569f-3ab6-c273-a8ab9f8c72c9	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3161 (class 0 OID 38192289)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569f-3ab9-fe51-4be9a5fda703	000e0000-569f-3ab9-2f74-dd7b1db308c0	\N	1	\N	\N
\.


--
-- TOC entry 3162 (class 0 OID 38192297)
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
-- TOC entry 3180 (class 0 OID 38192458)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 38192890)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 38192900)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569f-3ab9-22e4-a4e4d7a829b0	00080000-569f-3ab9-377a-58c644e3d03d	0987	AK
00190000-569f-3ab9-7cdb-221e9257b0a0	00080000-569f-3ab9-f69e-4c0736522ed0	0989	AK
00190000-569f-3ab9-96ea-e884da8968df	00080000-569f-3ab9-0d3a-4cba039b250d	0986	AK
00190000-569f-3ab9-7cae-8dbd59250224	00080000-569f-3ab9-651c-0866759542c3	0984	AK
00190000-569f-3ab9-1a54-dcbcb62a8691	00080000-569f-3ab9-8571-8206be79750e	0983	AK
00190000-569f-3ab9-e9cd-6482a2ad0143	00080000-569f-3ab9-77a4-42e125450d25	0982	AK
00190000-569f-3abb-2aee-9f49b5684769	00080000-569f-3abb-f83b-97120521278f	1001	AK
\.


--
-- TOC entry 3204 (class 0 OID 38192789)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569f-3ab9-d34e-5bb5ad77b5b6	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3208 (class 0 OID 38192908)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 38192487)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569f-3ab8-e2bd-1f1f949c744f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569f-3ab8-93d6-5a8cc92dacc1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569f-3ab8-2748-11db99813e2c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569f-3ab8-accc-e38c75ee620e	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569f-3ab8-ff5d-62126a4027bd	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569f-3ab8-925e-23baf9dfb671	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569f-3ab8-66b7-24d3fd39a3a2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3176 (class 0 OID 38192431)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 38192421)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 38192628)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 38192558)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 38192263)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 38192025)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569f-3abb-f83b-97120521278f	00010000-569f-3ab7-8896-c467acd6f491	2016-01-20 08:43:55	INS	a:0:{}
2	App\\Entity\\Option	00000000-569f-3abb-05ce-b2e512f33387	00010000-569f-3ab7-8896-c467acd6f491	2016-01-20 08:43:55	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569f-3abb-2aee-9f49b5684769	00010000-569f-3ab7-8896-c467acd6f491	2016-01-20 08:43:55	INS	a:0:{}
\.


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3185 (class 0 OID 38192500)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 38192063)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569f-3ab6-6303-140332dcc76b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569f-3ab6-3b7b-c833faf919a9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569f-3ab6-cb88-038bdd16e7e7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569f-3ab6-5bb7-aca83c0573e0	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569f-3ab6-6075-351047b8bee5	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569f-3ab6-829a-37a1564e9114	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569f-3ab6-877d-8d09f16899e5	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569f-3ab6-d033-59c1d7b98673	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569f-3ab6-cecd-56cec55eed0f	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-3ab6-4b29-dcabb82d4c3a	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-3ab6-9c63-a025af773d2e	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-3ab6-e297-a74a5cf6add9	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-3ab6-6f26-b0ef0e9a801f	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-3ab6-b2fd-857830c872e0	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-3ab6-4364-ac94299716ed	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-3ab6-ecef-68cc540a4682	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-3ab6-7650-b089dd07ad5a	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569f-3ab6-756f-a99e1ea9b088	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569f-3ab6-90ca-3b0ac79fd6bb	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569f-3ab6-9ff1-b8dd21fa9ec9	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569f-3ab6-10a1-c5696dda3fdf	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-3ab6-5eec-080cea090981	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-3ab6-93af-5d4e1abc47a9	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-3ab6-3e86-f0ff779d511f	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-3ab6-b65f-ae8dd91a1913	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569f-3ab6-809d-afb2816f0a34	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569f-3ab6-b59c-fae9f5f85a21	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569f-3ab6-6814-47b2cc23c639	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569f-3ab7-bf18-f39865d02c50	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569f-3ab7-9892-882bbde82935	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569f-3ab7-e3b8-ddf809cffe41	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-3ab7-322a-d57c10cf5711	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-3ab7-bce8-bfb0eef421dc	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569f-3ab7-ac5b-83830e1354ce	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569f-3ab7-e45e-4ea7f46edcba	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569f-3ab7-7edc-75da9842872f	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569f-3ab7-66d5-852a48deffa2	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-3ab7-75f2-69f6884637a0	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-3ab7-f6b1-ecb7187decb4	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569f-3ab7-f8ca-8ea19b150f36	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-3ab7-566f-4054fd9739d4	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-3ab7-5b13-b516d8331ebc	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569f-3ab7-952a-fccad9d1afd6	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-3ab7-941a-d1bc2d4e6c4d	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-3ab7-57f1-92571ba91f17	direktor	minimalne pravice za direktorja	t
00020000-569f-3ab7-1d4b-c2c4179afb0d	arhivar	arhivar	t
00020000-569f-3ab7-ff8f-50ddb9489d7a	dramaturg	dramaturg	t
00020000-569f-3ab7-4b8c-1ef38a44479a	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569f-3ab7-f680-2c60a649adb4	poslovni-sekretar	poslovni sekretar	t
00020000-569f-3ab7-3e48-b707dd0edb3f	vodja-tehnike	vodja tehnike	t
00020000-569f-3ab7-1da7-f368fd3997e5	racunovodja	računovodja	t
00020000-569f-3ab8-8277-775698e05ec4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569f-3ab8-96a9-ccbcb6115021	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab8-9688-fd75d1f12825	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab8-e1ae-e3c27cdc429f	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab8-1ae4-e725119d65da	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab8-3377-0359aec6d5b1	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab8-6061-f8c05dfcbff6	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab8-0934-deff8bf3c094	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569f-3ab8-a689-6fb246c97dbb	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-bcc8-a122f4061d64	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-2f74-764896498116	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-ed31-63f403d97626	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-8ed6-6508310cdbcb	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-32ca-e73497d5d8dd	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-ca9b-d8d39c916b8f	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-ee95-e353d072cdd5	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-ad59-01d8c0bf3a37	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-1365-0c51d6939018	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-a461-0882aba69dbb	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-6b39-1f94e4d99443	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569f-3ab9-b290-37a3291c57b1	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-adcb-b89cb899c2f2	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-0e52-a3a9740b747a	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-85c7-bb4665a91244	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-5b98-d206a945e94a	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-9abe-2cef6d2d84a4	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-6e7a-e0e04e5303e1	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-610a-a0111f8ae46a	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-d1a7-dab8cab72afa	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-c36a-5a1cb31daa36	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-fc77-a1fc650de9d0	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-7133-1490359ba6f3	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-c381-4af938b2a4c3	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-5333-99bd176a6788	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-d547-8935b07d14cc	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-b9cf-9a6cd5be999b	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-8919-713177bb4f66	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-a489-93acc20df281	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569f-3ab9-6c4d-6735c6cb3bab	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3140 (class 0 OID 38192047)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569f-3ab7-e065-3b3d3dd2d116	00020000-569f-3ab6-cb88-038bdd16e7e7
00010000-569f-3ab7-8896-c467acd6f491	00020000-569f-3ab6-cb88-038bdd16e7e7
00010000-569f-3ab9-24b4-b7a6c55f26e7	00020000-569f-3ab8-8277-775698e05ec4
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab8-96a9-ccbcb6115021
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab8-3377-0359aec6d5b1
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-bcc8-a122f4061d64
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-ed31-63f403d97626
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-32ca-e73497d5d8dd
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-a461-0882aba69dbb
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab8-e1ae-e3c27cdc429f
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-b290-37a3291c57b1
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-85c7-bb4665a91244
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-9abe-2cef6d2d84a4
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-610a-a0111f8ae46a
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-c36a-5a1cb31daa36
00010000-569f-3ab9-6815-dabc0de31a93	00020000-569f-3ab9-5333-99bd176a6788
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab8-96a9-ccbcb6115021
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab8-9688-fd75d1f12825
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab8-e1ae-e3c27cdc429f
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab8-1ae4-e725119d65da
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab9-32ca-e73497d5d8dd
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab9-ad59-01d8c0bf3a37
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab9-b290-37a3291c57b1
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab9-85c7-bb4665a91244
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab9-9abe-2cef6d2d84a4
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab9-610a-a0111f8ae46a
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab9-c36a-5a1cb31daa36
00010000-569f-3ab9-b146-f50c0377d83e	00020000-569f-3ab9-5333-99bd176a6788
00010000-569f-3ab9-f604-75fe2e5cdf27	00020000-569f-3ab8-96a9-ccbcb6115021
00010000-569f-3ab9-f604-75fe2e5cdf27	00020000-569f-3ab8-9688-fd75d1f12825
00010000-569f-3ab9-f604-75fe2e5cdf27	00020000-569f-3ab8-e1ae-e3c27cdc429f
00010000-569f-3ab9-f604-75fe2e5cdf27	00020000-569f-3ab8-1ae4-e725119d65da
00010000-569f-3ab9-f604-75fe2e5cdf27	00020000-569f-3ab9-ed31-63f403d97626
00010000-569f-3ab9-f604-75fe2e5cdf27	00020000-569f-3ab9-32ca-e73497d5d8dd
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab8-9688-fd75d1f12825
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab8-6061-f8c05dfcbff6
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-2f74-764896498116
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-8ed6-6508310cdbcb
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-ed31-63f403d97626
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-1365-0c51d6939018
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-32ca-e73497d5d8dd
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-ca9b-d8d39c916b8f
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-b290-37a3291c57b1
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-adcb-b89cb899c2f2
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-85c7-bb4665a91244
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-5b98-d206a945e94a
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-9abe-2cef6d2d84a4
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-6e7a-e0e04e5303e1
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-610a-a0111f8ae46a
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-d1a7-dab8cab72afa
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-c36a-5a1cb31daa36
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-fc77-a1fc650de9d0
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-5333-99bd176a6788
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-d547-8935b07d14cc
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-8919-713177bb4f66
00010000-569f-3ab9-d12f-ac215e001d06	00020000-569f-3ab9-a489-93acc20df281
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab8-9688-fd75d1f12825
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab8-6061-f8c05dfcbff6
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab8-a689-6fb246c97dbb
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-2f74-764896498116
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-8ed6-6508310cdbcb
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-ed31-63f403d97626
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-1365-0c51d6939018
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-32ca-e73497d5d8dd
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-ca9b-d8d39c916b8f
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-ee95-e353d072cdd5
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-b290-37a3291c57b1
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-adcb-b89cb899c2f2
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-0e52-a3a9740b747a
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-85c7-bb4665a91244
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-5b98-d206a945e94a
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-9abe-2cef6d2d84a4
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-6e7a-e0e04e5303e1
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-610a-a0111f8ae46a
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-d1a7-dab8cab72afa
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-c36a-5a1cb31daa36
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-fc77-a1fc650de9d0
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-5333-99bd176a6788
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-d547-8935b07d14cc
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-b9cf-9a6cd5be999b
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-8919-713177bb4f66
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-a489-93acc20df281
00010000-569f-3ab9-c205-8b36da187544	00020000-569f-3ab9-6c4d-6735c6cb3bab
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab8-9688-fd75d1f12825
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab8-e1ae-e3c27cdc429f
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab8-6061-f8c05dfcbff6
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab8-0934-deff8bf3c094
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab8-a689-6fb246c97dbb
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab8-3377-0359aec6d5b1
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab9-2f74-764896498116
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab9-8ed6-6508310cdbcb
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab9-ed31-63f403d97626
00010000-569f-3ab9-1672-4d48f3a87ff4	00020000-569f-3ab9-1365-0c51d6939018
00010000-569f-3ab9-ea6d-363a36149fab	00020000-569f-3ab8-96a9-ccbcb6115021
00010000-569f-3ab9-ea6d-363a36149fab	00020000-569f-3ab8-1ae4-e725119d65da
00010000-569f-3ab9-ea6d-363a36149fab	00020000-569f-3ab8-3377-0359aec6d5b1
00010000-569f-3ab9-ea6d-363a36149fab	00020000-569f-3ab9-bcc8-a122f4061d64
00010000-569f-3ab9-ea6d-363a36149fab	00020000-569f-3ab9-ed31-63f403d97626
00010000-569f-3ab9-ea6d-363a36149fab	00020000-569f-3ab9-32ca-e73497d5d8dd
00010000-569f-3ab9-ea6d-363a36149fab	00020000-569f-3ab9-a461-0882aba69dbb
00010000-569f-3ab9-ea6d-363a36149fab	00020000-569f-3ab9-7133-1490359ba6f3
00010000-569f-3ab9-fdf3-2cc8d030b11b	00020000-569f-3ab9-6b39-1f94e4d99443
00010000-569f-3ab9-d407-b6ba82fe3d9e	00020000-569f-3ab7-57f1-92571ba91f17
00010000-569f-3ab9-6e39-84739e682a09	00020000-569f-3ab7-1d4b-c2c4179afb0d
00010000-569f-3ab9-530b-9ef55ccd7cf7	00020000-569f-3ab7-ff8f-50ddb9489d7a
00010000-569f-3ab9-3254-f8c36008922d	00020000-569f-3ab7-4b8c-1ef38a44479a
00010000-569f-3ab9-8c33-7263708313eb	00020000-569f-3ab7-f680-2c60a649adb4
00010000-569f-3ab9-5e64-ca7eaa0f1b9c	00020000-569f-3ab7-3e48-b707dd0edb3f
00010000-569f-3ab9-0d14-be2f05da9501	00020000-569f-3ab7-1da7-f368fd3997e5
\.


--
-- TOC entry 3187 (class 0 OID 38192514)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 38192452)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 38192375)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569f-3ab8-e153-fa7c6a86b2d6	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569f-3ab8-f44c-bb45ca9288f9	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569f-3ab8-76fe-78cb763723a5	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3136 (class 0 OID 38192012)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569f-3ab6-f85c-a788da688a56	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569f-3ab6-9a1f-fa0d2c0d9a87	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569f-3ab6-15fa-88a2f32d820c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569f-3ab6-6764-17c84e15a518	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569f-3ab6-9a16-3e19ca9ec1db	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3135 (class 0 OID 38192004)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569f-3ab6-708e-f72a769a02ea	00230000-569f-3ab6-6764-17c84e15a518	popa
00240000-569f-3ab6-b76d-89184bb1117c	00230000-569f-3ab6-6764-17c84e15a518	oseba
00240000-569f-3ab6-5ec6-9008c2ad9bd4	00230000-569f-3ab6-6764-17c84e15a518	tippopa
00240000-569f-3ab6-c425-1d00a2c5eccf	00230000-569f-3ab6-6764-17c84e15a518	organizacijskaenota
00240000-569f-3ab6-5ec2-7091666bddce	00230000-569f-3ab6-6764-17c84e15a518	sezona
00240000-569f-3ab6-f59d-77d89d91b2b5	00230000-569f-3ab6-6764-17c84e15a518	tipvaje
00240000-569f-3ab6-2dc9-4c06a924e61e	00230000-569f-3ab6-6764-17c84e15a518	tipdodatka
00240000-569f-3ab6-ea77-fe321d43fd35	00230000-569f-3ab6-9a1f-fa0d2c0d9a87	prostor
00240000-569f-3ab6-1035-c753d5c5729c	00230000-569f-3ab6-6764-17c84e15a518	besedilo
00240000-569f-3ab6-e857-4282d9af23c2	00230000-569f-3ab6-6764-17c84e15a518	uprizoritev
00240000-569f-3ab6-3c77-8bfa57f21890	00230000-569f-3ab6-6764-17c84e15a518	funkcija
00240000-569f-3ab6-1190-7b4902e7dbe4	00230000-569f-3ab6-6764-17c84e15a518	tipfunkcije
00240000-569f-3ab6-57ac-077340078626	00230000-569f-3ab6-6764-17c84e15a518	alternacija
00240000-569f-3ab6-e202-0fff1f3b1cc2	00230000-569f-3ab6-f85c-a788da688a56	pogodba
00240000-569f-3ab6-83c8-51445ca514d7	00230000-569f-3ab6-6764-17c84e15a518	zaposlitev
00240000-569f-3ab6-8402-90fe33a0e697	00230000-569f-3ab6-6764-17c84e15a518	zvrstuprizoritve
00240000-569f-3ab6-676e-9c7ddb3d0167	00230000-569f-3ab6-f85c-a788da688a56	programdela
00240000-569f-3ab6-c9c1-d45c127c3a77	00230000-569f-3ab6-6764-17c84e15a518	zapis
\.


--
-- TOC entry 3134 (class 0 OID 38191999)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
8bcd7e38-655b-4c0c-8d70-5a67d9489990	00240000-569f-3ab6-708e-f72a769a02ea	0	1001
\.


--
-- TOC entry 3193 (class 0 OID 38192575)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569f-3ab9-62ce-57ad1f86332f	000e0000-569f-3ab9-2f74-dd7b1db308c0	00080000-569f-3ab9-b124-d31466f9ec7a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569f-3ab6-40d7-412d25a96d3b
00270000-569f-3ab9-8b2e-bea4f171f43a	000e0000-569f-3ab9-2f74-dd7b1db308c0	00080000-569f-3ab9-b124-d31466f9ec7a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569f-3ab6-40d7-412d25a96d3b
\.


--
-- TOC entry 3150 (class 0 OID 38192147)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 38192394)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569f-3ab9-4cad-dcb8215cc3de	00180000-569f-3ab9-ac3e-374d74f8f6c7	000c0000-569f-3ab9-9840-04d746e22861	00090000-569f-3ab9-27e8-214f19777c07	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-3ab9-cc2a-4ee1d63d217c	00180000-569f-3ab9-ac3e-374d74f8f6c7	000c0000-569f-3ab9-fe8c-0fd0c72f5151	00090000-569f-3ab9-41f6-b5849003ce3d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-3ab9-942c-b7d5d3fc0fe7	00180000-569f-3ab9-ac3e-374d74f8f6c7	000c0000-569f-3ab9-a57a-11eda1d2a3ca	00090000-569f-3ab9-a9dd-a9bef5d98357	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-3ab9-66ad-0a1caf78a965	00180000-569f-3ab9-ac3e-374d74f8f6c7	000c0000-569f-3ab9-bc4a-2e56423548c7	00090000-569f-3ab9-2add-9057f4e4e88a	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-3ab9-6013-d7deb15960ce	00180000-569f-3ab9-ac3e-374d74f8f6c7	000c0000-569f-3ab9-3592-ef2556a8d61b	00090000-569f-3ab9-97d8-0e88e9f9d567	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-3ab9-d68b-09db67ede352	00180000-569f-3ab9-47c4-7beb54e19d81	\N	00090000-569f-3ab9-97d8-0e88e9f9d567	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569f-3ab9-c847-3af5e0cebdb2	00180000-569f-3ab9-f6e3-d3279b4a8596	\N	00090000-569f-3ab9-41f6-b5849003ce3d	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-569f-3ab9-f148-12313d3a3c26	00180000-569f-3ab9-ac3e-374d74f8f6c7	\N	00090000-569f-3ab9-5747-c85f7e3462d8	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 38192411)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569f-3ab6-ebe0-8d9df3472721	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569f-3ab6-818f-7a453b1dd7fa	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569f-3ab6-4a7e-761032846537	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569f-3ab6-e230-82c2fcd6b67c	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569f-3ab6-e4ba-f39a1aa12300	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569f-3ab6-9e86-61da32841fc7	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3196 (class 0 OID 38192616)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569f-3ab6-0f65-24d586358031	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569f-3ab6-6811-8ea04ecd2170	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569f-3ab6-0386-e2e113395c48	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569f-3ab6-beac-bc994fd011a5	04	Režija	Režija	Režija	umetnik	30
000f0000-569f-3ab6-4c24-92a4aaab8935	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569f-3ab6-dfac-2670b2ce8e5c	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569f-3ab6-b29f-173f360ced96	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569f-3ab6-8155-62b6777c5d19	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569f-3ab6-749d-9ae8c7982d45	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569f-3ab6-715d-cc112d39f440	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569f-3ab6-1117-f73bc0a42429	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569f-3ab6-b79c-32a46a3b5d6c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569f-3ab6-47b1-4526ac7b1543	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569f-3ab6-9a7c-1a3f2d825256	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569f-3ab6-ba73-78cd507fee67	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569f-3ab6-7018-96cd3562c4e0	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569f-3ab6-cd14-30580048d699	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569f-3ab6-fa26-93276282ed45	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569f-3ab6-c33b-58b663b174d0	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3147 (class 0 OID 38192098)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569f-3ab8-dbd3-136a7efb0e8d	0001	šola	osnovna ali srednja šola
00400000-569f-3ab8-fa3d-e238fdb7b25f	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569f-3ab8-ef6b-80ef79b91a02	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3209 (class 0 OID 38192920)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569f-3ab6-4a27-5b495a01b0eb	01	Velika predstava	f	1.00	1.00
002b0000-569f-3ab6-6601-eac2e456a8f0	02	Mala predstava	f	0.50	0.50
002b0000-569f-3ab6-aced-d697eb795146	03	Mala koprodukcija	t	0.40	1.00
002b0000-569f-3ab6-d7fb-f7e68cd3c2b0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569f-3ab6-8e23-6dc471fa6fea	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3169 (class 0 OID 38192365)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569f-3ab6-0664-260e41c04ff1	0001	prva vaja	prva vaja
00420000-569f-3ab6-7679-e3720a6a5fcf	0002	tehnična vaja	tehnična vaja
00420000-569f-3ab6-7527-ab29210c2c24	0003	lučna vaja	lučna vaja
00420000-569f-3ab6-b579-1f999b4d2f62	0004	kostumska vaja	kostumska vaja
00420000-569f-3ab6-0115-b44ee9bbd892	0005	foto vaja	foto vaja
00420000-569f-3ab6-08f3-022e95f9b12a	0006	1. glavna vaja	1. glavna vaja
00420000-569f-3ab6-e876-641a73e57243	0007	2. glavna vaja	2. glavna vaja
00420000-569f-3ab6-66cc-0c7706668e21	0008	1. generalka	1. generalka
00420000-569f-3ab6-a2b7-009f451e0386	0009	2. generalka	2. generalka
00420000-569f-3ab6-7355-7d092d30f227	0010	odprta generalka	odprta generalka
00420000-569f-3ab6-a2a4-2d2586cefe04	0011	obnovitvena vaja	obnovitvena vaja
00420000-569f-3ab6-e785-cf833c909673	0012	italijanka	krajša "obnovitvena" vaja
00420000-569f-3ab6-c801-f48a1a7656e6	0013	pevska vaja	pevska vaja
00420000-569f-3ab6-f14c-99151f53c11b	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569f-3ab6-efde-8f2ced42a8a7	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569f-3ab6-976b-bba30224d450	0016	orientacijska vaja	orientacijska vaja
00420000-569f-3ab6-6212-8edffcd544c3	0017	situacijska vaja	situacijska vaja
00420000-569f-3ab6-9d1f-a531738bea2d	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3156 (class 0 OID 38192220)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 38192034)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569f-3ab7-8896-c467acd6f491	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO7VdtVSxc.3MAM3BbmNH1EJPwgh2kOnq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-9b43-d5f57b15f25d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-9401-42980cfa8ac6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-2943-e18ab7d91135	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-74a0-ba65ca5eef34	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-0db7-22a54f01da71	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-dd5e-6c764ce404f7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-5986-1b38294a661c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-c562-d1b2e1738d28	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-bb6a-ab113da6dc7e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-24b4-b7a6c55f26e7	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-277b-406ad90a00de	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-6815-dabc0de31a93	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-b146-f50c0377d83e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-f604-75fe2e5cdf27	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-d12f-ac215e001d06	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-c205-8b36da187544	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-1672-4d48f3a87ff4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-ea6d-363a36149fab	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-fdf3-2cc8d030b11b	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-d407-b6ba82fe3d9e	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-6e39-84739e682a09	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-530b-9ef55ccd7cf7	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-3254-f8c36008922d	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-8c33-7263708313eb	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-5e64-ca7eaa0f1b9c	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569f-3ab9-0d14-be2f05da9501	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569f-3ab7-e065-3b3d3dd2d116	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3200 (class 0 OID 38192666)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569f-3ab9-0b8e-e24d3dffea87	00160000-569f-3ab8-3430-4ea80d7bf5df	\N	00140000-569f-3ab6-f5dd-f955543bc6b8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569f-3ab8-ff5d-62126a4027bd
000e0000-569f-3ab9-2f74-dd7b1db308c0	00160000-569f-3ab8-1d09-0d2e9cd6a58a	\N	00140000-569f-3ab6-8254-e1c00f6a98b2	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569f-3ab8-925e-23baf9dfb671
000e0000-569f-3ab9-edca-db1bfedb5de8	\N	\N	00140000-569f-3ab6-8254-e1c00f6a98b2	00190000-569f-3ab9-22e4-a4e4d7a829b0	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-3ab8-ff5d-62126a4027bd
000e0000-569f-3ab9-12da-e25b921393a1	\N	\N	00140000-569f-3ab6-8254-e1c00f6a98b2	00190000-569f-3ab9-22e4-a4e4d7a829b0	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-3ab8-ff5d-62126a4027bd
000e0000-569f-3ab9-d9e6-c1841d4faf50	\N	\N	00140000-569f-3ab6-8254-e1c00f6a98b2	00190000-569f-3ab9-22e4-a4e4d7a829b0	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-e136-36837eea5eb0	\N	\N	00140000-569f-3ab6-8254-e1c00f6a98b2	00190000-569f-3ab9-22e4-a4e4d7a829b0	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-2fd5-d8cf640634ec	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-9f6a-c31d02de7a10	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-e569-336d8c95baf4	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-59cb-c2d46cfe4467	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-264f-1bba50c486ea	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-9b1f-427d24a192f1	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-73c3-7b025a2c1847	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-6145-1345c02af3ac	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
000e0000-569f-3ab9-fb30-021ebe63de51	\N	\N	00140000-569f-3ab6-fba2-2330b7bb4be4	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-3ab8-e2bd-1f1f949c744f
\.


--
-- TOC entry 3171 (class 0 OID 38192385)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 38192315)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569f-3ab9-6148-54ff9b9ebf65	\N	000e0000-569f-3ab9-2f74-dd7b1db308c0	1
00200000-569f-3ab9-9efb-c4ec8e4a816b	\N	000e0000-569f-3ab9-2f74-dd7b1db308c0	2
00200000-569f-3ab9-a8ac-9566da550a73	\N	000e0000-569f-3ab9-2f74-dd7b1db308c0	3
00200000-569f-3ab9-4080-a801d62af021	\N	000e0000-569f-3ab9-2f74-dd7b1db308c0	4
00200000-569f-3ab9-abf8-8820415c2255	\N	000e0000-569f-3ab9-2f74-dd7b1db308c0	5
\.


--
-- TOC entry 3183 (class 0 OID 38192479)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 38192589)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569f-3ab6-d066-55704645f64b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569f-3ab6-dd51-9df932b7f182	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569f-3ab6-43fe-d66f8d451dc9	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569f-3ab6-9119-f1b66a330a2f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569f-3ab6-a592-50a8d519d8ad	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569f-3ab6-a62d-60db3fb66c1d	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569f-3ab6-548c-88b6f6cc5238	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569f-3ab6-53ed-2d352281430c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569f-3ab6-40d7-412d25a96d3b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569f-3ab6-948d-568d3186526f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569f-3ab6-caf8-51a31eff53a1	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569f-3ab6-fcfc-d675720602a7	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569f-3ab6-0ef9-86686403b85b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569f-3ab6-292e-9eb27c1e50ca	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569f-3ab6-bf64-b143c0ab0b7e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569f-3ab6-e082-5e1269777b3b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569f-3ab6-14b6-4b13e4a7dc52	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569f-3ab6-18ee-0b56af86e2a2	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569f-3ab6-35f9-29f41bf79eaa	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569f-3ab6-eaa5-a9e4b3048768	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569f-3ab6-e588-42dc9e627910	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569f-3ab6-1c45-fb7996bdfeb2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569f-3ab6-3869-cbf4f6bb9d2c	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569f-3ab6-5317-3c6ff58c1a2a	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569f-3ab6-f573-0a9b5e6bfae4	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569f-3ab6-3a22-f78495e9b9c0	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569f-3ab6-7e94-4c531eb8a8b5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569f-3ab6-d167-b3eae2be5dbe	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3212 (class 0 OID 38192970)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 38192939)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 38192982)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 38192551)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569f-3ab9-ad85-c78a561355f4	00090000-569f-3ab9-41f6-b5849003ce3d	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-3ab9-1d3e-da8cd7be6f5b	00090000-569f-3ab9-a9dd-a9bef5d98357	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-3ab9-c047-894b887ba8a5	00090000-569f-3ab9-8784-b7511cad54db	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-3ab9-e91d-6afc01a8aeab	00090000-569f-3ab9-0918-92f2aa2e4d1b	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-3ab9-f181-293156a75f6e	00090000-569f-3ab9-2fa0-7a9365f71b42	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-3ab9-c796-97e287da399e	00090000-569f-3ab9-796b-c87628197f30	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3133 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 38192656)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569f-3ab6-f5dd-f955543bc6b8	01	Drama	drama (SURS 01)
00140000-569f-3ab6-0deb-5c053ba04958	02	Opera	opera (SURS 02)
00140000-569f-3ab6-7603-14d86af87278	03	Balet	balet (SURS 03)
00140000-569f-3ab6-007a-5e2a47bdd0b6	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569f-3ab6-fba2-2330b7bb4be4	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569f-3ab6-8254-e1c00f6a98b2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569f-3ab6-aca2-95af045e7f9f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3189 (class 0 OID 38192541)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 38192097)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 38192714)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 38192705)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 38192088)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 38192572)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 38192614)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 38193023)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 38192408)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 38192344)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 38192359)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 38192364)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 38192937)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 38192246)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 38192783)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 38192537)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 38192313)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 38192284)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 38192260)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 38192444)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 38193000)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 38193007)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 38193031)
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
-- TOC entry 2766 (class 2606 OID 38192471)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 38192218)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 38192116)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 38192180)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 38192143)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 38192077)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 38192062)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 38192477)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 38192513)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 38192651)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 38192171)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 38192206)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 38192888)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 38192450)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 38192196)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 38192329)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 38192301)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 38192294)
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
-- TOC entry 2764 (class 2606 OID 38192462)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 38192897)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 38192905)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 38192875)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 38192918)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 38192495)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 38192435)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 38192426)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 38192638)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 38192565)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 38192272)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 38192033)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 38192504)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 38192051)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 38192071)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 38192522)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 38192457)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 38192383)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 38192021)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 38192009)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 38192003)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 38192585)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 38192152)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 38192400)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 38192418)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 38192625)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 38192105)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 38192930)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 38192372)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 38192231)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 38192046)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 38192684)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 38192391)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 38192319)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 38192485)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 38192597)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 38192980)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 38192964)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 38192988)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 38192555)
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
-- TOC entry 2833 (class 2606 OID 38192664)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 38192549)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 38192353)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 38192354)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 38192352)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 38192351)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 38192350)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 38192586)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 38192587)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 38192588)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 38193002)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 38193001)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 38192173)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 38192174)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 38192478)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 38192968)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 38192967)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 38192969)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 38192966)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 38192965)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2761 (class 1259 OID 38192464)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2762 (class 1259 OID 38192463)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 38192320)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 38192321)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 38192538)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 38192540)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 38192539)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 38192262)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 38192261)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 38192919)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 38192653)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 38192654)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 38192655)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 38192989)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 38192689)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 38192686)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 38192690)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 38192688)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 38192687)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 38192233)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 38192232)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 38192146)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 38192505)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 38192078)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 38192079)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 38192525)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 38192524)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 38192523)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 38192183)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 38192182)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 38192184)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 38192295)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 38192296)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 38192011)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2741 (class 1259 OID 38192430)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2742 (class 1259 OID 38192428)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2743 (class 1259 OID 38192427)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2744 (class 1259 OID 38192429)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 38192052)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 38192053)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 38192486)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 38193024)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 38192574)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 38192573)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 38193032)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 38193033)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2756 (class 1259 OID 38192451)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 38192566)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 38192567)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 38192788)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 38192787)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 38192784)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 38192785)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 38192786)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 38192198)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 38192197)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 38192199)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 38192499)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 38192498)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 38192898)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 38192899)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 38192718)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 38192719)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 38192716)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 38192717)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2735 (class 1259 OID 38192409)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2736 (class 1259 OID 38192410)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 38192556)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 38192557)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2724 (class 1259 OID 38192392)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 38192439)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2748 (class 1259 OID 38192438)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2749 (class 1259 OID 38192436)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2750 (class 1259 OID 38192437)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 38192706)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 38192273)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 38192287)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 38192286)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 38192285)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 38192288)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 38192314)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 38192302)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 38192303)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 38192889)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 38192938)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 38193008)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 38193009)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 38192118)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 38192117)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 38192153)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 38192154)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 38192403)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 38192402)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2730 (class 1259 OID 38192401)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2708 (class 1259 OID 38192346)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2709 (class 1259 OID 38192349)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2710 (class 1259 OID 38192345)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2711 (class 1259 OID 38192348)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2712 (class 1259 OID 38192347)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 38192172)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 38192106)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 38192107)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 38192247)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 38192249)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 38192248)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 38192250)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2755 (class 1259 OID 38192445)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 38192652)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 38192685)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 38192626)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 38192627)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 38192144)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 38192145)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2739 (class 1259 OID 38192419)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 38192420)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 38192550)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 38192022)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 38192219)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 38192181)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 38192010)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 38192931)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 38192497)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 38192496)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 38192373)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 38192374)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 38192715)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2725 (class 1259 OID 38192393)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 38192207)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 38192665)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 38192981)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 38192906)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 38192907)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 38192615)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2723 (class 1259 OID 38192384)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 38192072)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 38193199)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 38193224)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 38193214)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 38193194)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 38193209)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 38193219)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 38193204)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2986 (class 2606 OID 38193409)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2985 (class 2606 OID 38193414)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2984 (class 2606 OID 38193419)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 38193579)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3018 (class 2606 OID 38193574)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 38193089)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 38193094)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 38193324)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3012 (class 2606 OID 38193559)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 38193554)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3011 (class 2606 OID 38193564)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3014 (class 2606 OID 38193549)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3015 (class 2606 OID 38193544)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 38193319)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2966 (class 2606 OID 38193314)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 38193184)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 38193189)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 38193364)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 38193374)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2976 (class 2606 OID 38193369)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 38193144)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 38193139)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 38193304)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 38193534)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2989 (class 2606 OID 38193424)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 38193429)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2987 (class 2606 OID 38193434)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3016 (class 2606 OID 38193569)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2991 (class 2606 OID 38193454)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2994 (class 2606 OID 38193439)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2990 (class 2606 OID 38193459)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2992 (class 2606 OID 38193449)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2993 (class 2606 OID 38193444)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 38193134)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 38193129)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 38193074)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 38193069)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 38193344)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 38193049)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 38193054)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2972 (class 2606 OID 38193359)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2973 (class 2606 OID 38193354)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2974 (class 2606 OID 38193349)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 38193104)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 38193099)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 38193109)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 38193159)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 38193164)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 38193034)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 38193279)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 38193269)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 38193264)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 38193274)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 38193039)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 38193044)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2968 (class 2606 OID 38193329)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3021 (class 2606 OID 38193594)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 38193404)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 38193399)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3023 (class 2606 OID 38193599)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 38193604)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 38193309)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2981 (class 2606 OID 38193389)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 38193394)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 38193509)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 38193504)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3004 (class 2606 OID 38193489)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 38193494)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3002 (class 2606 OID 38193499)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 38193119)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 38193114)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 38193124)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 38193339)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2970 (class 2606 OID 38193334)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3007 (class 2606 OID 38193519)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 38193524)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 38193479)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2996 (class 2606 OID 38193484)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2999 (class 2606 OID 38193469)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2998 (class 2606 OID 38193474)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 38193254)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 38193259)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2979 (class 2606 OID 38193379)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 38193384)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 38193229)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 38193234)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 38193299)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 38193294)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 38193284)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 38193289)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2995 (class 2606 OID 38193464)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 38193149)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 38193154)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 38193179)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 38193169)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 38193174)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3005 (class 2606 OID 38193514)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3008 (class 2606 OID 38193529)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 38193539)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3020 (class 2606 OID 38193584)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 38193589)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 38193064)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 38193059)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 38193079)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 38193084)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 38193249)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 38193244)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 38193239)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-20 08:43:57 CET

--
-- PostgreSQL database dump complete
--

