--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-29 11:57:12 CET

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
-- TOC entry 185 (class 1259 OID 41738843)
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
-- TOC entry 241 (class 1259 OID 41739461)
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
-- TOC entry 240 (class 1259 OID 41739445)
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
-- TOC entry 184 (class 1259 OID 41738836)
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
-- TOC entry 183 (class 1259 OID 41738834)
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
-- TOC entry 231 (class 1259 OID 41739322)
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
-- TOC entry 234 (class 1259 OID 41739352)
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
-- TOC entry 255 (class 1259 OID 41739764)
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
-- TOC entry 212 (class 1259 OID 41739158)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 41739083)
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
-- TOC entry 206 (class 1259 OID 41739109)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 41739114)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 41739686)
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
-- TOC entry 196 (class 1259 OID 41738989)
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
-- TOC entry 242 (class 1259 OID 41739474)
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
-- TOC entry 227 (class 1259 OID 41739280)
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
-- TOC entry 202 (class 1259 OID 41739057)
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
-- TOC entry 199 (class 1259 OID 41739029)
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
-- TOC entry 197 (class 1259 OID 41739006)
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
-- TOC entry 216 (class 1259 OID 41739194)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 41739744)
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
-- TOC entry 254 (class 1259 OID 41739757)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 41739779)
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
-- TOC entry 220 (class 1259 OID 41739218)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 41738963)
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
-- TOC entry 187 (class 1259 OID 41738863)
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
-- TOC entry 191 (class 1259 OID 41738930)
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
-- TOC entry 188 (class 1259 OID 41738874)
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
-- TOC entry 180 (class 1259 OID 41738808)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 41738827)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41739225)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 41739260)
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
-- TOC entry 237 (class 1259 OID 41739393)
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
-- TOC entry 190 (class 1259 OID 41738910)
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
-- TOC entry 193 (class 1259 OID 41738955)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 41739630)
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
-- TOC entry 217 (class 1259 OID 41739200)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 41738940)
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
-- TOC entry 204 (class 1259 OID 41739075)
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
-- TOC entry 200 (class 1259 OID 41739044)
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
-- TOC entry 201 (class 1259 OID 41739050)
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
-- TOC entry 219 (class 1259 OID 41739212)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 41739644)
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
-- TOC entry 246 (class 1259 OID 41739654)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 41739543)
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
-- TOC entry 247 (class 1259 OID 41739662)
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
-- TOC entry 223 (class 1259 OID 41739240)
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
-- TOC entry 215 (class 1259 OID 41739185)
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
-- TOC entry 214 (class 1259 OID 41739175)
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
-- TOC entry 236 (class 1259 OID 41739382)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 41739312)
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
-- TOC entry 198 (class 1259 OID 41739018)
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
-- TOC entry 177 (class 1259 OID 41738779)
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
-- TOC entry 176 (class 1259 OID 41738777)
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
-- TOC entry 224 (class 1259 OID 41739254)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 41738817)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 41738801)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 41739268)
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
-- TOC entry 218 (class 1259 OID 41739206)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 41739129)
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
-- TOC entry 175 (class 1259 OID 41738766)
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
-- TOC entry 174 (class 1259 OID 41738758)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 41738753)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 41739329)
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
-- TOC entry 189 (class 1259 OID 41738902)
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
-- TOC entry 211 (class 1259 OID 41739148)
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
-- TOC entry 213 (class 1259 OID 41739165)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 41739370)
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
-- TOC entry 186 (class 1259 OID 41738853)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 41739674)
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
-- TOC entry 208 (class 1259 OID 41739119)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 41738975)
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
-- TOC entry 178 (class 1259 OID 41738788)
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
-- TOC entry 239 (class 1259 OID 41739420)
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
-- TOC entry 210 (class 1259 OID 41739139)
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
-- TOC entry 203 (class 1259 OID 41739068)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 41739232)
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
-- TOC entry 233 (class 1259 OID 41739343)
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
-- TOC entry 251 (class 1259 OID 41739724)
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
-- TOC entry 250 (class 1259 OID 41739693)
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
-- TOC entry 252 (class 1259 OID 41739736)
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
-- TOC entry 229 (class 1259 OID 41739305)
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
-- TOC entry 238 (class 1259 OID 41739410)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 41739295)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 41738839)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 41738782)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 41738843)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56ab-4584-bf59-588ca386c8df	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56ab-4584-e10e-e8ecd1b21fc8	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56ab-4584-2eef-1659790cf6ab	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 41739461)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56ab-4585-d21e-f5bb31fbb14c	000d0000-56ab-4584-e2c6-e6b946d5aa0d	\N	00090000-56ab-4584-dcd2-87e1f1493147	000b0000-56ab-4584-76c5-c039756ccc0c	0001	f	\N	\N	\N	3	t	t	t
000c0000-56ab-4585-c08a-c6000a8fed07	000d0000-56ab-4584-65d7-f3f4365d06d7	00100000-56ab-4584-ecdc-f3c636ec3cc4	00090000-56ab-4584-2f10-ec2d209082b0	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56ab-4585-31e0-e9748a60790e	000d0000-56ab-4584-f6c2-ae5c08174ac2	00100000-56ab-4584-5d17-5c86b5113170	00090000-56ab-4584-2f04-1fcd5b4b7653	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56ab-4585-248a-78269ed0fae4	000d0000-56ab-4584-e655-7f063ac4fcd0	\N	00090000-56ab-4584-a005-141e2abcc136	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56ab-4585-8e3e-7f9f09812166	000d0000-56ab-4584-7789-c2ebfbb6af64	\N	00090000-56ab-4584-adc6-08b67234d873	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56ab-4585-35b7-ee8fbbe6f404	000d0000-56ab-4584-f55c-d739fd8cf00f	\N	00090000-56ab-4584-c4ec-86ed029971c7	000b0000-56ab-4584-64da-0cf4900a9f5d	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56ab-4585-ee73-aa92edb43c3a	000d0000-56ab-4584-481d-315da8d4e943	00100000-56ab-4584-3936-d57153090403	00090000-56ab-4584-8b11-5111542ba66b	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56ab-4585-2421-3658767b302d	000d0000-56ab-4584-28ff-6136a95c3486	\N	00090000-56ab-4584-8049-defd4821d67a	000b0000-56ab-4584-f727-c189ff242341	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56ab-4585-fdad-5abe53357103	000d0000-56ab-4584-481d-315da8d4e943	00100000-56ab-4584-4dad-0cb7c1383839	00090000-56ab-4584-800a-64ec3893a8e3	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56ab-4585-97d8-5aee1ed11fe1	000d0000-56ab-4584-481d-315da8d4e943	00100000-56ab-4584-983b-f1dcc037efa7	00090000-56ab-4584-f3f2-ffe4ec8cb65b	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56ab-4585-8b1b-d7806564c4d9	000d0000-56ab-4584-481d-315da8d4e943	00100000-56ab-4584-8486-c28580060398	00090000-56ab-4584-5856-dbedea38d646	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56ab-4585-a12d-61db742f0b63	000d0000-56ab-4584-1380-7cfa180835ed	00100000-56ab-4584-ecdc-f3c636ec3cc4	00090000-56ab-4584-2f10-ec2d209082b0	000b0000-56ab-4584-ea03-43d610582c2f	0012	t	\N	\N	\N	2	t	t	t
000c0000-56ab-4585-edb9-675e76a3aa8f	000d0000-56ab-4584-6917-d84c5e482307	\N	00090000-56ab-4584-8049-defd4821d67a	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-9db1-3b98664879ed	000d0000-56ab-4584-6917-d84c5e482307	\N	00090000-56ab-4584-371f-2324cd5c2651	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56ab-4585-770f-848e6420b9fe	000d0000-56ab-4584-bbed-fea622f6e39b	00100000-56ab-4584-5d17-5c86b5113170	00090000-56ab-4584-2f04-1fcd5b4b7653	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-a841-5e2a6d7e9228	000d0000-56ab-4584-bbed-fea622f6e39b	\N	00090000-56ab-4584-371f-2324cd5c2651	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56ab-4585-2943-63e43a23c2f2	000d0000-56ab-4584-7bc7-8d61e11a7e88	\N	00090000-56ab-4584-371f-2324cd5c2651	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-9ee7-daa5ecd34648	000d0000-56ab-4584-7bc7-8d61e11a7e88	\N	00090000-56ab-4584-8049-defd4821d67a	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56ab-4585-a603-3ac7acfe0627	000d0000-56ab-4584-1107-57066212ad4f	00100000-56ab-4584-3936-d57153090403	00090000-56ab-4584-8b11-5111542ba66b	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-d137-36a3004ea7d3	000d0000-56ab-4584-1107-57066212ad4f	\N	00090000-56ab-4584-371f-2324cd5c2651	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56ab-4585-75a0-b4dbf50c35c0	000d0000-56ab-4584-3be5-cf4af9ddbfe7	\N	00090000-56ab-4584-371f-2324cd5c2651	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-32d5-078fd654fad1	000d0000-56ab-4584-3be5-cf4af9ddbfe7	00100000-56ab-4584-3936-d57153090403	00090000-56ab-4584-8b11-5111542ba66b	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56ab-4585-fed9-2da6a39c09e9	000d0000-56ab-4584-9cb3-3c6b958ac2bb	\N	00090000-56ab-4584-371f-2324cd5c2651	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-07d6-466789c0bbaa	000d0000-56ab-4584-2e36-018d6bcc60d5	\N	00090000-56ab-4584-8049-defd4821d67a	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-02ec-a8a0d2b01bd8	000d0000-56ab-4584-84ab-59b54d32ed6f	\N	00090000-56ab-4584-8049-defd4821d67a	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-ed55-555a48282108	000d0000-56ab-4584-84ab-59b54d32ed6f	00100000-56ab-4584-5d17-5c86b5113170	00090000-56ab-4584-2f04-1fcd5b4b7653	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56ab-4585-cf83-194dd3a2da0a	000d0000-56ab-4584-9d92-ac33e9478cbd	\N	00090000-56ab-4584-d849-dc3fbe734237	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56ab-4585-9f86-6b879364d598	000d0000-56ab-4584-9d92-ac33e9478cbd	\N	00090000-56ab-4584-2e4d-c0f6575ede70	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56ab-4585-ea49-a2b2b034b4ba	000d0000-56ab-4584-67fc-fbe26306a015	\N	00090000-56ab-4584-8049-defd4821d67a	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56ab-4585-5d90-a28bd0b20e26	000d0000-56ab-4584-67fc-fbe26306a015	00100000-56ab-4584-5d17-5c86b5113170	00090000-56ab-4584-2f04-1fcd5b4b7653	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56ab-4585-ab01-e056be726f81	000d0000-56ab-4584-67fc-fbe26306a015	\N	00090000-56ab-4584-2e4d-c0f6575ede70	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56ab-4585-4853-ded1a403d785	000d0000-56ab-4584-67fc-fbe26306a015	\N	00090000-56ab-4584-d849-dc3fbe734237	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56ab-4585-c2b3-bb293526943d	000d0000-56ab-4584-a162-171a094aad11	\N	00090000-56ab-4584-8049-defd4821d67a	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56ab-4585-2021-8156a034d084	000d0000-56ab-4584-6819-581f6a4f1073	00100000-56ab-4584-5d17-5c86b5113170	00090000-56ab-4584-2f04-1fcd5b4b7653	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56ab-4585-331b-871d4a953b7c	000d0000-56ab-4584-6819-581f6a4f1073	\N	00090000-56ab-4584-371f-2324cd5c2651	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 41739445)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 41738836)
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
-- TOC entry 3191 (class 0 OID 41739322)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56ab-4584-7096-b3d3b1cb9b28	00160000-56ab-4584-ad6d-cfb80b0cc701	00090000-56ab-4584-2e4d-c0f6575ede70	aizv	10	t
003d0000-56ab-4584-b356-eeaa920083d5	00160000-56ab-4584-ad6d-cfb80b0cc701	00090000-56ab-4584-d2b3-f5c6106e61fd	apri	14	t
003d0000-56ab-4584-2f5d-77418f58958e	00160000-56ab-4584-0da3-200ed3f9f26d	00090000-56ab-4584-d849-dc3fbe734237	aizv	11	t
003d0000-56ab-4584-3fcb-130491e407ca	00160000-56ab-4584-ac50-1f3db76aa38b	00090000-56ab-4584-e899-009d4f517e27	aizv	12	t
003d0000-56ab-4584-1923-4c76c6d01ada	00160000-56ab-4584-ad6d-cfb80b0cc701	00090000-56ab-4584-371f-2324cd5c2651	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 41739352)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56ab-4584-ad6d-cfb80b0cc701	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56ab-4584-0da3-200ed3f9f26d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56ab-4584-ac50-1f3db76aa38b	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 41739764)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 41739158)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 41739083)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56ab-4584-4b21-0909386783ac	\N	\N	\N	\N	00440000-56ab-4584-c744-8fc212423cbc	00220000-56ab-4584-bb10-3784857ec6ef	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56ab-4584-28d9-c147dbb98835	\N	\N	\N	\N	00440000-56ab-4584-8abd-5539fca83105	00220000-56ab-4584-d885-c019942e3ee5	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56ab-4584-22d6-02471f057ee0	\N	\N	\N	001e0000-56ab-4584-eebc-d96e7682269c	\N	00220000-56ab-4584-bb10-3784857ec6ef	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56ab-4584-1390-5a3e42babce3	\N	\N	\N	001e0000-56ab-4584-19b9-10d31c37dd18	\N	00220000-56ab-4584-d885-c019942e3ee5	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56ab-4585-77bd-f982ffd812a4	\N	00200000-56ab-4585-2a99-928a65e71170	\N	\N	\N	00220000-56ab-4584-1f4f-95c5660393b5	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56ab-4585-c71f-90bac1e8e8f5	\N	00200000-56ab-4585-da38-0b7c5e23d7e6	\N	\N	\N	00220000-56ab-4584-1f4f-95c5660393b5	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56ab-4585-ed1d-56f22e98a16f	\N	00200000-56ab-4585-b2fb-9a1135644993	\N	\N	\N	00220000-56ab-4584-d885-c019942e3ee5	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56ab-4585-fc5b-b4c065a980c5	\N	00200000-56ab-4585-d1cf-2509e50cf705	\N	\N	\N	00220000-56ab-4584-3fb7-1f2fb872d645	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56ab-4585-4cf7-9d84a4949d69	\N	00200000-56ab-4585-2d8b-173e417cdc0b	\N	\N	\N	00220000-56ab-4584-ea9e-77f4b4ba6c3b	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56ab-4585-a3ed-628991bcc91c	\N	00200000-56ab-4585-15ea-6884e8d5a354	\N	\N	\N	00220000-56ab-4584-d885-c019942e3ee5	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56ab-4585-14a2-0bfcb7160edd	\N	00200000-56ab-4585-84f4-3eb25096a809	\N	\N	\N	00220000-56ab-4584-ea9e-77f4b4ba6c3b	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56ab-4585-0ac8-292f61cc41ac	\N	00200000-56ab-4585-4906-cbc29f06fc50	\N	\N	\N	00220000-56ab-4584-ea9e-77f4b4ba6c3b	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56ab-4585-e81a-08b242d31fec	\N	00200000-56ab-4585-005b-42802bbd4edc	\N	\N	\N	00220000-56ab-4584-1f4f-95c5660393b5	001f0000-56ab-4584-749f-4a69a1361fb1	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56ab-4585-f28d-fcd92a2e6532	\N	00200000-56ab-4585-16c2-c2da31ed4921	\N	\N	\N	00220000-56ab-4584-1f4f-95c5660393b5	001f0000-56ab-4584-749f-4a69a1361fb1	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56ab-4585-09ff-440c85aac0ab	\N	\N	001c0000-56ab-4585-cfb2-1e2f52069668	\N	\N	\N	001f0000-56ab-4584-d222-6c4aecad24a8	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56ab-4585-e01e-843edc447724	001b0000-56ab-4585-86c7-4a4ee555de2b	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-749f-4a69a1361fb1	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56ab-4585-e638-269d91b1857e	001b0000-56ab-4585-7259-e25211d7bf75	\N	\N	\N	\N	00220000-56ab-4584-d885-c019942e3ee5	001f0000-56ab-4584-749f-4a69a1361fb1	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56ab-4585-99c1-5a5e59d3d2df	001b0000-56ab-4585-8fb6-068f6db05cde	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-749f-4a69a1361fb1	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56ab-4585-244b-9be4acb584d4	001b0000-56ab-4585-85cc-470bb4256dc1	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56ab-4585-3370-73540025084a	001b0000-56ab-4585-13a9-deacbf570b51	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-d222-6c4aecad24a8	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56ab-4585-1d7b-c7774e6cd2b4	001b0000-56ab-4585-3d43-9826d4ede123	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-d222-6c4aecad24a8	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56ab-4585-7f6b-f281ed39dde1	001b0000-56ab-4585-11f5-b65feaa7fcf6	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-749f-4a69a1361fb1	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56ab-4585-4f18-6fce2b1bf58b	001b0000-56ab-4585-8d02-c2c63bde3dbf	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-d222-6c4aecad24a8	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56ab-4585-edda-7be776e433af	001b0000-56ab-4585-0b03-8a95895b35e0	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56ab-4585-2056-b6ec095c44a0	001b0000-56ab-4585-8cab-742948d8ed8b	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56ab-4585-943d-62d076e8f390	001b0000-56ab-4585-7fc9-75f2adb1029c	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-d222-6c4aecad24a8	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56ab-4585-93ed-f4e2fb74c40d	001b0000-56ab-4585-b89f-cd31848f3201	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-ec0f-162cdc0013a9	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56ab-4585-eb36-4ce3908e77a3	001b0000-56ab-4585-2997-bb62affffc68	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-ec0f-162cdc0013a9	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56ab-4585-f289-04bccf0f1b85	001b0000-56ab-4585-5b53-83560c2f2514	\N	\N	\N	\N	00220000-56ab-4584-bb10-3784857ec6ef	001f0000-56ab-4584-d222-6c4aecad24a8	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56ab-4585-f19b-63bb85a83573	001b0000-56ab-4585-7c76-b83d6b55bd0a	\N	\N	\N	\N	\N	001f0000-56ab-4584-d222-6c4aecad24a8	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56ab-4585-cfb2-1e2f52069668
00180000-56ab-4585-d726-c3e586b27280	001b0000-56ab-4585-09c7-78a99dc31c31	\N	\N	\N	\N	\N	001f0000-56ab-4584-d222-6c4aecad24a8	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56ab-4585-cfb2-1e2f52069668
\.


--
-- TOC entry 3166 (class 0 OID 41739109)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56ab-4584-eebc-d96e7682269c
001e0000-56ab-4584-19b9-10d31c37dd18
\.


--
-- TOC entry 3167 (class 0 OID 41739114)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56ab-4584-c744-8fc212423cbc
00440000-56ab-4584-8abd-5539fca83105
\.


--
-- TOC entry 3209 (class 0 OID 41739686)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 41738989)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56ab-4581-6f43-60270474f16c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56ab-4581-50c1-0dea18656b34	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56ab-4581-2ef3-9064faddc0c4	AL	ALB	008	Albania 	Albanija	\N
00040000-56ab-4581-b4d9-49ebbddf3e84	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56ab-4581-d3b6-37f2cf32a07f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56ab-4581-621d-942c81c07d3d	AD	AND	020	Andorra 	Andora	\N
00040000-56ab-4581-3b4c-778e4f53bb5f	AO	AGO	024	Angola 	Angola	\N
00040000-56ab-4581-35c1-7318f98db365	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56ab-4581-295b-9b36284b9be3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56ab-4581-b6ef-666ec7c922ed	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-4581-2ef4-5c88a4c1e0e3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56ab-4581-e067-5ecbd2883003	AM	ARM	051	Armenia 	Armenija	\N
00040000-56ab-4581-7481-1fff009daf78	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56ab-4581-e59a-f90d950e0a0a	AU	AUS	036	Australia 	Avstralija	\N
00040000-56ab-4581-0300-e3853d8d3e9e	AT	AUT	040	Austria 	Avstrija	\N
00040000-56ab-4581-9b2a-6126e3bae8ed	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56ab-4581-42e7-b66e064c6be8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56ab-4581-a2e4-db08126c8336	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56ab-4581-13eb-e313a95cb19f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56ab-4581-2466-fd5464b5347a	BB	BRB	052	Barbados 	Barbados	\N
00040000-56ab-4581-74f8-e430faf22911	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56ab-4581-b2a8-b9c0f4f1ea34	BE	BEL	056	Belgium 	Belgija	\N
00040000-56ab-4581-5f2c-cb704850ea10	BZ	BLZ	084	Belize 	Belize	\N
00040000-56ab-4581-2454-5c1fe19a6951	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56ab-4581-b627-b034738731f4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56ab-4581-72f6-c4031a5a84d4	BT	BTN	064	Bhutan 	Butan	\N
00040000-56ab-4581-66da-54cec494ab56	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56ab-4581-43de-05f4d3bdf98f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56ab-4581-c2c0-d614cb99490f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56ab-4581-e88c-489a98a609e2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56ab-4581-c790-b8d35291e1bd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56ab-4581-2420-cc344109b0e0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56ab-4581-774e-d23d8fe3baba	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56ab-4581-d8c1-1f27fd9600a4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56ab-4581-f69f-da093b0cb3e9	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56ab-4581-1539-2c727a5c88eb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56ab-4581-3cbd-31e51c65ef9b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56ab-4581-70ce-4b947e44e38a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56ab-4581-ac5e-06c1f9e55549	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56ab-4581-c7b9-6ec10a541831	CA	CAN	124	Canada 	Kanada	\N
00040000-56ab-4581-ad64-41034f1cf4de	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56ab-4581-fb6c-ed930de2ce01	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56ab-4581-b2ad-2885eaa08c6b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56ab-4581-c98d-9d4f0c5e3fc1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56ab-4581-4bb5-7d9803d8eb51	CL	CHL	152	Chile 	Čile	\N
00040000-56ab-4581-b31f-0290f9f5f97e	CN	CHN	156	China 	Kitajska	\N
00040000-56ab-4581-68cc-2ebe41ed9c83	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56ab-4581-592a-19b20a01c7d5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56ab-4581-f4b5-fa82a638d186	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56ab-4581-9241-235fe77ef9a9	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56ab-4581-46fc-92dbd2368f0c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56ab-4581-566a-825c3d7c9b92	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56ab-4581-4e64-e390b7c4743f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56ab-4581-00a8-865c8e398713	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56ab-4581-21e3-af0ad3e8eced	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56ab-4581-ae03-235d23443d69	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56ab-4581-f05f-94cb652c67c4	CU	CUB	192	Cuba 	Kuba	\N
00040000-56ab-4581-73ce-78d7030a2e63	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56ab-4581-ae99-b7b2127eecf6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56ab-4581-b05a-05cfd2a63188	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56ab-4581-b5f7-c4c2d6e19ad2	DK	DNK	208	Denmark 	Danska	\N
00040000-56ab-4581-a809-7f5ab3d4bced	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56ab-4581-5688-8b3fb75ae8dc	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-4581-c37b-22ea622fa8a5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56ab-4581-4281-24f81da0898f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56ab-4581-5887-15ccbdfed8fb	EG	EGY	818	Egypt 	Egipt	\N
00040000-56ab-4581-3314-fb43193eb5b8	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56ab-4581-7f42-93e14a168e62	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56ab-4581-fc46-4c48583f58bc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56ab-4581-eb7f-0da5a34da310	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56ab-4581-2453-b6a7aecbe549	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56ab-4581-2bda-c8295df8c861	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56ab-4581-6e29-b144a7ef661c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56ab-4581-9507-0a5fcede1a35	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56ab-4581-0995-94220181eef6	FI	FIN	246	Finland 	Finska	\N
00040000-56ab-4581-c356-eb4e7e6cc3bf	FR	FRA	250	France 	Francija	\N
00040000-56ab-4581-a0ab-45b4769096be	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56ab-4581-2fd1-1a394523f9ba	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56ab-4581-0340-fcdf05b3899c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56ab-4581-16f0-6c8e641cda34	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56ab-4581-83c2-e6a82582310f	GA	GAB	266	Gabon 	Gabon	\N
00040000-56ab-4581-7f6c-c492464f224a	GM	GMB	270	Gambia 	Gambija	\N
00040000-56ab-4581-f5a7-241bd7721bef	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56ab-4581-0c0f-97a1326d2928	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56ab-4581-10c5-2f81c9be5307	GH	GHA	288	Ghana 	Gana	\N
00040000-56ab-4581-5fe4-780e714ab9bd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56ab-4581-f952-9a09ad2e1629	GR	GRC	300	Greece 	Grčija	\N
00040000-56ab-4581-dd69-97886e493ddc	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56ab-4581-3691-25ff5333d818	GD	GRD	308	Grenada 	Grenada	\N
00040000-56ab-4581-46e0-29276089a190	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56ab-4581-e395-8ce6908f7c7b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56ab-4581-a1dd-a306545370ed	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56ab-4581-5405-0d0d7b32c465	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56ab-4581-8299-32799829a8e8	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56ab-4581-bb98-37a50f4bc39b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56ab-4581-ad6e-329ac28086b3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56ab-4581-e9c2-4bfcdcae987e	HT	HTI	332	Haiti 	Haiti	\N
00040000-56ab-4581-4b95-acc2c0f953d5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56ab-4581-651d-de3c3ceb4070	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56ab-4581-4630-2ddad00c8e6e	HN	HND	340	Honduras 	Honduras	\N
00040000-56ab-4581-160b-cd2252de1fef	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56ab-4581-22a6-7037ea1a9147	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56ab-4581-fede-b5b885f8961c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56ab-4581-034f-122e649c96c0	IN	IND	356	India 	Indija	\N
00040000-56ab-4581-e38a-9656050a91fa	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56ab-4581-28a4-82a53870e37f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56ab-4581-cf1c-dff7d4c04a8d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56ab-4581-e808-bb1f5e6416a4	IE	IRL	372	Ireland 	Irska	\N
00040000-56ab-4581-8d96-29bfe3586a9d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56ab-4581-69cd-c4b01f726986	IL	ISR	376	Israel 	Izrael	\N
00040000-56ab-4581-3701-e42417fb513d	IT	ITA	380	Italy 	Italija	\N
00040000-56ab-4581-5d0b-6cff7213c20f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56ab-4581-b531-0b8d9876c91f	JP	JPN	392	Japan 	Japonska	\N
00040000-56ab-4581-1146-c9b9cf2f89da	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56ab-4581-35bd-17973292eb03	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56ab-4581-278c-7baa1815818b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56ab-4581-fe94-8894b33f6695	KE	KEN	404	Kenya 	Kenija	\N
00040000-56ab-4581-3ca4-3bcd8560aa64	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56ab-4581-e9e5-e1c6224c5327	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56ab-4581-e940-cfcbd7dfe346	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56ab-4581-16a9-61b3f72b13eb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56ab-4581-c5f5-349d40375fb0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56ab-4581-3159-e03f76908c49	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56ab-4581-7af5-cf25ef432143	LV	LVA	428	Latvia 	Latvija	\N
00040000-56ab-4581-aa6f-dcc942e8c3a7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56ab-4581-eabb-607a4ac56fda	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56ab-4581-9316-665acbd33b3e	LR	LBR	430	Liberia 	Liberija	\N
00040000-56ab-4581-d4f3-8b1d154710e2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56ab-4581-5f26-8623bcbf3b82	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56ab-4581-da18-a0be37c4e383	LT	LTU	440	Lithuania 	Litva	\N
00040000-56ab-4581-6c31-01ee98b226d6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56ab-4581-b073-5493b3e31264	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56ab-4581-d6a1-96b2c9a38ecc	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56ab-4581-bc89-fbd3f74e3886	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56ab-4581-a1fb-8a19629d709b	MW	MWI	454	Malawi 	Malavi	\N
00040000-56ab-4581-ff7c-6a14af1bee20	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56ab-4581-214d-f27dd82d0757	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56ab-4581-c6e3-084b7a4a3885	ML	MLI	466	Mali 	Mali	\N
00040000-56ab-4581-bad8-0e5f55a70cf6	MT	MLT	470	Malta 	Malta	\N
00040000-56ab-4581-f6a8-bd4b03ad577a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56ab-4581-d661-c4da6be535c1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56ab-4581-97fe-3c7f74768fc3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56ab-4581-882d-1bcfa0085fc2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56ab-4581-6df8-a92075a6e50e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56ab-4581-9eee-62672519ecc8	MX	MEX	484	Mexico 	Mehika	\N
00040000-56ab-4581-b02f-10e4c174b44c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56ab-4581-343d-688cd2fd240b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56ab-4581-237a-d238d3f7603d	MC	MCO	492	Monaco 	Monako	\N
00040000-56ab-4581-25ab-4186b4bfc13e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56ab-4581-5ab6-71dafcd5a743	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56ab-4581-6f21-c2e1609a52d9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56ab-4581-2fa0-042188ea5cca	MA	MAR	504	Morocco 	Maroko	\N
00040000-56ab-4581-d206-9e69821d603c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56ab-4581-a4ab-6b1227a0f0c0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56ab-4581-35d3-56f2e857c19a	NA	NAM	516	Namibia 	Namibija	\N
00040000-56ab-4581-4545-7e4f407c7e43	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56ab-4581-c901-e83b5f9b9e72	NP	NPL	524	Nepal 	Nepal	\N
00040000-56ab-4581-7c05-88307328e4f1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56ab-4581-753a-f23e7a0b0c88	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56ab-4581-9d31-e4de1eccd0dc	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56ab-4581-3fa5-1038e41f798a	NE	NER	562	Niger 	Niger 	\N
00040000-56ab-4581-964d-f4844f979363	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56ab-4581-d551-5af61a22dcc3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56ab-4581-e4fb-50bf7b765f1c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56ab-4581-9b63-3fa91f299299	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56ab-4581-e6d1-5be12d2d633c	NO	NOR	578	Norway 	Norveška	\N
00040000-56ab-4581-7fa1-cf2d1fbfbf6a	OM	OMN	512	Oman 	Oman	\N
00040000-56ab-4581-daee-a522789d8a37	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56ab-4581-14de-fff8f537df4e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56ab-4581-2384-4a9e0100475c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56ab-4581-5500-e7d0d55ded27	PA	PAN	591	Panama 	Panama	\N
00040000-56ab-4581-c6eb-17877edc0455	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56ab-4581-4a13-0d4b8d45839d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56ab-4581-0355-b8a61b2ce4d6	PE	PER	604	Peru 	Peru	\N
00040000-56ab-4581-6fe0-e8312b5751f6	PH	PHL	608	Philippines 	Filipini	\N
00040000-56ab-4581-77be-c4cffbb9e783	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56ab-4581-8971-fd08a1e397f1	PL	POL	616	Poland 	Poljska	\N
00040000-56ab-4581-8001-a4443910a531	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56ab-4581-eea3-e1b35fb85de1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56ab-4581-9373-7e04ff56b25d	QA	QAT	634	Qatar 	Katar	\N
00040000-56ab-4581-da12-18959cccd354	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56ab-4581-9fa7-2d7bf3cc02ec	RO	ROU	642	Romania 	Romunija	\N
00040000-56ab-4581-094e-9c790f648dfa	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56ab-4581-0d3b-cdea3b87d615	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56ab-4581-3803-8be03b8ced84	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56ab-4581-4786-b04ef16bdf51	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56ab-4581-67a6-1f9aa66c2399	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56ab-4581-69b6-826f6ec55429	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56ab-4581-7b68-32590b7c69ef	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56ab-4581-f67d-b6b74e38c5f9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56ab-4581-7272-6092ae1e20b6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56ab-4581-007b-c5af0d3803be	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56ab-4581-fc4e-136dcec24a42	SM	SMR	674	San Marino 	San Marino	\N
00040000-56ab-4581-1920-f0c3a6334444	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56ab-4581-c4b9-48ee0cdadcfb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56ab-4581-f736-d374bfb0ebb6	SN	SEN	686	Senegal 	Senegal	\N
00040000-56ab-4581-78cb-d53d4bf0a10d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56ab-4581-9c0f-11d22ef9eb37	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56ab-4581-77cb-263b5faaa0f0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56ab-4581-d3b1-64f138d916e2	SG	SGP	702	Singapore 	Singapur	\N
00040000-56ab-4581-02a5-c8f56edd9101	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56ab-4581-b1c4-3ce48a136831	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56ab-4581-a02d-b7b2beaf920e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56ab-4581-6a24-379ab9beba5f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56ab-4581-70fc-fe614bb59aba	SO	SOM	706	Somalia 	Somalija	\N
00040000-56ab-4581-37d7-2b5322b26423	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56ab-4581-572c-b74afa68f5df	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56ab-4581-949e-72edeb9776b9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56ab-4581-bd32-de3448cee099	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56ab-4581-1076-1dc7d3983972	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56ab-4581-0c97-ec057ca3ecac	SD	SDN	729	Sudan 	Sudan	\N
00040000-56ab-4581-b8cc-c416c049ce91	SR	SUR	740	Suriname 	Surinam	\N
00040000-56ab-4581-b82e-36cd140beb8e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56ab-4581-2a9e-abf6870787ea	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56ab-4581-14bb-a075445c26dd	SE	SWE	752	Sweden 	Švedska	\N
00040000-56ab-4581-4bd7-7b7cd74f53e7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56ab-4581-36f8-f6e00070a064	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56ab-4581-69d2-0823aa013069	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56ab-4581-75fb-dd8de831f636	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56ab-4581-c937-35903aef89d1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56ab-4581-8d2f-724be61f9bae	TH	THA	764	Thailand 	Tajska	\N
00040000-56ab-4581-c12f-acc356a27893	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56ab-4581-33c1-dcd6ed051235	TG	TGO	768	Togo 	Togo	\N
00040000-56ab-4581-946c-e82307aec024	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56ab-4581-b8f5-14fe24e0cc76	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56ab-4581-56fe-520bcdf87a7c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56ab-4581-6a17-54fc3631660d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56ab-4581-5b40-767224b33347	TR	TUR	792	Turkey 	Turčija	\N
00040000-56ab-4581-eef5-c213c4d65794	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56ab-4581-721f-ad52e64ddd2b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-4581-8e36-ceba0b796777	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56ab-4581-7bec-ff2ccf4c02d5	UG	UGA	800	Uganda 	Uganda	\N
00040000-56ab-4581-d95d-093b80a6dfe5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56ab-4581-597a-f72ab1f6890f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56ab-4581-b1eb-b1b21aa1afb6	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56ab-4581-4be3-0cbd7d4e52de	US	USA	840	United States 	Združene države Amerike	\N
00040000-56ab-4581-06f0-8adb4d38b3df	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56ab-4581-8044-a29518081ce0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56ab-4581-22d4-95c5c523fea1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56ab-4581-f95a-a49881e77ef4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56ab-4581-d64d-ea1ad64e3b49	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56ab-4581-7b68-315d105e88ad	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56ab-4581-9139-a761321fda2e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-4581-028c-a432f34f52bc	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56ab-4581-5488-18adc769b690	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56ab-4581-1b57-99224ce7b6f3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56ab-4581-a2b1-35968dc7cef8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56ab-4581-ba83-de0f6046f290	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56ab-4581-e5f0-ce522b60ec66	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 41739474)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56ab-4585-c17f-2b84d24af70b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56ab-4585-7332-17c1ef34947a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-4585-9173-bc72139aaad6	000e0000-56ab-4584-8e49-4f7ce73d014d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-4580-ee09-55130657a61a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-4585-ca7d-fea184afd28d	000e0000-56ab-4584-af07-f3e64494e07e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-4580-759e-ca69510109a2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-4585-17b7-e1c410d5c11a	000e0000-56ab-4584-b546-619ede4e8a28	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-4580-ee09-55130657a61a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 41739280)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56ab-4584-2172-6e6a736887df	000e0000-56ab-4584-af07-f3e64494e07e	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56ab-4580-65da-1bc77b2df30b
000d0000-56ab-4584-1fd7-6eb2ae504abb	000e0000-56ab-4584-a8dc-9ab032b4e17c	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-4580-e819-e5dfba20ed6e
000d0000-56ab-4584-838e-bee4d1570ac5	000e0000-56ab-4584-a8dc-9ab032b4e17c	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-e2c6-e6b946d5aa0d	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-d21e-f5bb31fbb14c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-4580-e819-e5dfba20ed6e
000d0000-56ab-4584-65d7-f3f4365d06d7	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-c08a-c6000a8fed07	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-f6c2-ae5c08174ac2	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-31e0-e9748a60790e	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56ab-4580-3406-3b50b33424c2
000d0000-56ab-4584-e655-7f063ac4fcd0	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-248a-78269ed0fae4	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56ab-4580-65da-1bc77b2df30b
000d0000-56ab-4584-7789-c2ebfbb6af64	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-8e3e-7f9f09812166	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56ab-4580-65da-1bc77b2df30b
000d0000-56ab-4584-f55c-d739fd8cf00f	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-35b7-ee8fbbe6f404	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-4580-e819-e5dfba20ed6e
000d0000-56ab-4584-481d-315da8d4e943	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-fdad-5abe53357103	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56ab-4580-e819-e5dfba20ed6e
000d0000-56ab-4584-28ff-6136a95c3486	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-2421-3658767b302d	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56ab-4580-e00f-aeee50709818
000d0000-56ab-4584-1380-7cfa180835ed	000e0000-56ab-4584-af07-f3e64494e07e	000c0000-56ab-4585-a12d-61db742f0b63	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56ab-4580-c1ea-5301690d5a44
000d0000-56ab-4584-6917-d84c5e482307	000e0000-56ab-4584-7150-49d7b72b7a96	000c0000-56ab-4585-edb9-675e76a3aa8f	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-bbed-fea622f6e39b	000e0000-56ab-4584-468a-e137cda1c293	000c0000-56ab-4585-770f-848e6420b9fe	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-7bc7-8d61e11a7e88	000e0000-56ab-4584-468a-e137cda1c293	000c0000-56ab-4585-2943-63e43a23c2f2	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-1107-57066212ad4f	000e0000-56ab-4584-fe62-5bf7eff172f6	000c0000-56ab-4585-a603-3ac7acfe0627	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-3be5-cf4af9ddbfe7	000e0000-56ab-4584-326b-4920b0f98724	000c0000-56ab-4585-75a0-b4dbf50c35c0	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-9cb3-3c6b958ac2bb	000e0000-56ab-4584-b95b-b5bf016848ad	000c0000-56ab-4585-fed9-2da6a39c09e9	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-2e36-018d6bcc60d5	000e0000-56ab-4584-b65a-409048d87167	000c0000-56ab-4585-07d6-466789c0bbaa	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-84ab-59b54d32ed6f	000e0000-56ab-4584-69aa-c9cd474af2e9	000c0000-56ab-4585-02ec-a8a0d2b01bd8	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-9d92-ac33e9478cbd	000e0000-56ab-4584-e58a-4622916e38d0	000c0000-56ab-4585-cf83-194dd3a2da0a	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-67fc-fbe26306a015	000e0000-56ab-4584-e58a-4622916e38d0	000c0000-56ab-4585-ea49-a2b2b034b4ba	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-a162-171a094aad11	000e0000-56ab-4584-c223-0c3529b31f30	000c0000-56ab-4585-c2b3-bb293526943d	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
000d0000-56ab-4584-6819-581f6a4f1073	000e0000-56ab-4584-c223-0c3529b31f30	000c0000-56ab-4585-2021-8156a034d084	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56ab-4580-c358-b6449962162d
\.


--
-- TOC entry 3162 (class 0 OID 41739057)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56ab-4585-cfb2-1e2f52069668	00040000-56ab-4581-fede-b5b885f8961c		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 41739029)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 41739006)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56ab-4584-40bb-fcc4e0b8873c	00080000-56ab-4584-28b8-3dbe0ff58817	00090000-56ab-4584-f3f2-ffe4ec8cb65b	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 41739194)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 41739744)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56ab-4584-8695-707ac2b20e8d	00010000-56ab-4582-8d43-b36f5c5ca384	\N	Prva mapa	Root mapa	2016-01-29 11:57:08	2016-01-29 11:57:08	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 41739757)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 41739779)
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
-- TOC entry 3180 (class 0 OID 41739218)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 41738963)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56ab-4582-9786-5e34a7736c19	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56ab-4582-d692-7c1829969c96	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56ab-4582-7dbf-e71729aa06ef	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56ab-4582-9d00-0b388676cde9	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56ab-4582-4d30-8d4b7654beed	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56ab-4582-badf-51b67ba98be0	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56ab-4582-54b8-907b90a516b5	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56ab-4582-0631-6da2ef5cb80a	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56ab-4582-74dc-859e3f7dd2b8	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56ab-4582-c621-8d61f8f8b35e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56ab-4582-200e-114f067e52dc	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-4582-240f-a2b0d7eb21fc	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-4582-bb80-3f43576351f8	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56ab-4582-f8f9-3e90debe6fb6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56ab-4582-9109-af8bf40f06dc	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56ab-4582-f311-7695a0b6ae4c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56ab-4582-0052-41ee6810d5d6	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56ab-4584-290e-d523c6b25798	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56ab-4584-0978-761534d03716	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56ab-4584-6674-8e519f490bff	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56ab-4584-fd28-5abb99c908bd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56ab-4584-e68d-c87dbdd817b7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56ab-4587-678e-3234335ec36e	application.tenant.maticnopodjetje	string	s:36:"00080000-56ab-4587-062a-64f3a16f950d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 41738863)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56ab-4584-c6ef-4afdcb88cc3a	00000000-56ab-4584-290e-d523c6b25798	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56ab-4584-b0a3-edb68ba464f4	00000000-56ab-4584-290e-d523c6b25798	00010000-56ab-4582-8d43-b36f5c5ca384	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56ab-4584-27e3-2b5dc51f19ce	00000000-56ab-4584-0978-761534d03716	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 41738930)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56ab-4584-afc2-30575d263bb3	\N	00100000-56ab-4584-ecdc-f3c636ec3cc4	00100000-56ab-4584-5d17-5c86b5113170	01	Gledališče Nimbis
00410000-56ab-4584-e6dc-03e667e88391	00410000-56ab-4584-afc2-30575d263bb3	00100000-56ab-4584-ecdc-f3c636ec3cc4	00100000-56ab-4584-5d17-5c86b5113170	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 41738874)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56ab-4584-dcd2-87e1f1493147	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56ab-4584-a005-141e2abcc136	00010000-56ab-4584-982b-f970250cec41	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56ab-4584-2f04-1fcd5b4b7653	00010000-56ab-4584-eacc-5fbdd73197e4	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56ab-4584-800a-64ec3893a8e3	00010000-56ab-4584-828b-bf3bd5246dc7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56ab-4584-47d8-9db8a25a5498	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56ab-4584-c4ec-86ed029971c7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56ab-4584-5856-dbedea38d646	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56ab-4584-8b11-5111542ba66b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56ab-4584-f3f2-ffe4ec8cb65b	00010000-56ab-4584-b1f1-dbcd0d2dbef3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56ab-4584-2f10-ec2d209082b0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56ab-4584-94c0-4dfcc413ab92	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-4584-adc6-08b67234d873	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56ab-4584-8049-defd4821d67a	00010000-56ab-4584-55fd-bd0e86bb2e02	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-4584-2e4d-c0f6575ede70	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-4584-d2b3-f5c6106e61fd	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-4584-d849-dc3fbe734237	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-4584-e899-009d4f517e27	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-4584-371f-2324cd5c2651	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-4584-28fd-31ddc48f714b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-4584-84c6-99f5589a9a60	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-4584-c97d-88be40a4c87d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 41738808)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56ab-4581-ad7b-ea08057aa661	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56ab-4581-0d5e-a0ff6cd0117e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56ab-4581-4236-c242c1e693d8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56ab-4581-a807-43af3508fcbf	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56ab-4581-f8eb-dc783d94cf12	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56ab-4581-76ac-6bf134d9d308	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56ab-4581-b28f-b2c7dccd9bc0	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56ab-4581-eed2-81d15d446c51	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56ab-4581-20b3-c7e27f13f150	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56ab-4581-b76f-66bda51a1121	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56ab-4581-0397-0096b83c9a3f	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56ab-4581-fa32-4893a54bbe5b	Abonma-read	Abonma - branje	t
00030000-56ab-4581-5b88-ce846c57d66b	Abonma-write	Abonma - spreminjanje	t
00030000-56ab-4581-92df-1ee600e3e1e5	Alternacija-read	Alternacija - branje	t
00030000-56ab-4581-f566-ca574ecda5ca	Alternacija-write	Alternacija - spreminjanje	t
00030000-56ab-4581-bf3d-474d19e4e13a	Arhivalija-read	Arhivalija - branje	t
00030000-56ab-4581-2495-9962a0906dc3	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56ab-4581-7b87-4c30f2d6cb8f	AuthStorage-read	AuthStorage - branje	t
00030000-56ab-4581-24db-ddbfaa43b2b2	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56ab-4581-0511-9226341bf4c2	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56ab-4581-d5e2-c8887b1d047a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56ab-4581-0ba2-0756a40d2128	Besedilo-read	Besedilo - branje	t
00030000-56ab-4581-a8d4-5667c7beeabb	Besedilo-write	Besedilo - spreminjanje	t
00030000-56ab-4581-e33b-c525d7fc6605	Dodatek-read	Dodatek - branje	t
00030000-56ab-4581-0dca-c8c6e3914ade	Dodatek-write	Dodatek - spreminjanje	t
00030000-56ab-4581-f574-4c28fad32aec	Dogodek-read	Dogodek - branje	t
00030000-56ab-4581-3b9e-fc1a89979ef5	Dogodek-write	Dogodek - spreminjanje	t
00030000-56ab-4581-bf28-bd6addce884d	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56ab-4581-819d-4460c1ba783a	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56ab-4581-6e0a-674fecbd54fd	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56ab-4581-2919-b171b6319bed	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56ab-4581-b7a6-b2b6e760dc96	DogodekTrait-read	DogodekTrait - branje	t
00030000-56ab-4581-fb65-b35e243164b3	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56ab-4581-9f25-db87f2b9735e	DrugiVir-read	DrugiVir - branje	t
00030000-56ab-4581-b91c-289bc00b2d6f	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56ab-4581-ef57-c05eff0001d4	Drzava-read	Drzava - branje	t
00030000-56ab-4581-ff67-64db3f8018b7	Drzava-write	Drzava - spreminjanje	t
00030000-56ab-4581-2104-1ded69d7d34c	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56ab-4581-0ef1-34c412fcac78	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56ab-4581-115b-8716eedc51ec	Funkcija-read	Funkcija - branje	t
00030000-56ab-4581-5652-927a38c4c0b8	Funkcija-write	Funkcija - spreminjanje	t
00030000-56ab-4581-cdeb-67fb5a191cb5	Gostovanje-read	Gostovanje - branje	t
00030000-56ab-4581-2895-1cf974f4ee0d	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56ab-4581-fa0f-2faff9152d34	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56ab-4581-8c30-48ab5dbf360b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56ab-4581-6d03-b1659f701769	Kupec-read	Kupec - branje	t
00030000-56ab-4581-3a03-e72e0f0b9ada	Kupec-write	Kupec - spreminjanje	t
00030000-56ab-4581-fa7c-519dead8e2a6	NacinPlacina-read	NacinPlacina - branje	t
00030000-56ab-4581-e4ff-0b9e71c0869b	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56ab-4581-23fd-a58ba45c7fd1	Option-read	Option - branje	t
00030000-56ab-4581-081c-d53524ff2022	Option-write	Option - spreminjanje	t
00030000-56ab-4581-38ad-bc40a22756b8	OptionValue-read	OptionValue - branje	t
00030000-56ab-4581-7bb4-dc3645d27889	OptionValue-write	OptionValue - spreminjanje	t
00030000-56ab-4581-6d0f-d0eaa018e86c	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56ab-4581-cc39-3b509a1e28f4	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56ab-4581-2d1b-b1070ab2aa1f	Oseba-read	Oseba - branje	t
00030000-56ab-4581-ec28-cbb408bfd740	Oseba-write	Oseba - spreminjanje	t
00030000-56ab-4581-a45e-3354a6adbde2	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56ab-4581-d497-c09466b6bdce	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56ab-4581-b135-8c2b2734d394	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56ab-4581-85f8-9cd311be1a9a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56ab-4581-fd46-f193a128de9a	Pogodba-read	Pogodba - branje	t
00030000-56ab-4581-85df-0ef21f6c0d35	Pogodba-write	Pogodba - spreminjanje	t
00030000-56ab-4581-7f5a-bfc1f8523445	Popa-read	Popa - branje	t
00030000-56ab-4581-3762-463c0100ae31	Popa-write	Popa - spreminjanje	t
00030000-56ab-4581-f169-ee3b2edbff40	Posta-read	Posta - branje	t
00030000-56ab-4581-949f-182ba9e27ba3	Posta-write	Posta - spreminjanje	t
00030000-56ab-4581-569d-265e379a7cdb	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56ab-4581-1def-83278d605336	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56ab-4581-7908-929f0b0f1f6e	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56ab-4581-36fa-e792b2770424	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56ab-4581-d6e6-501083e6e521	PostniNaslov-read	PostniNaslov - branje	t
00030000-56ab-4581-e59c-e1b47b47aafe	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56ab-4581-ec10-804868f7d8b2	Praznik-read	Praznik - branje	t
00030000-56ab-4581-c28c-6e08627f7554	Praznik-write	Praznik - spreminjanje	t
00030000-56ab-4581-89f8-2f8a094b6057	Predstava-read	Predstava - branje	t
00030000-56ab-4581-fd27-8ab101f4a85a	Predstava-write	Predstava - spreminjanje	t
00030000-56ab-4581-afac-621835b52350	Ura-read	Ura - branje	t
00030000-56ab-4581-17f2-e364642ad436	Ura-write	Ura - spreminjanje	t
00030000-56ab-4581-5b69-0ac36e7fb0c5	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56ab-4581-2643-1f1d0cacd6de	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56ab-4581-baf0-5ea9022ccd74	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56ab-4581-e056-a6dd3e7ad9d2	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56ab-4581-b94c-ad9d90c79b7d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56ab-4581-5aeb-e8e712e00474	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56ab-4581-926f-719335b8ebec	ProgramDela-read	ProgramDela - branje	t
00030000-56ab-4581-ae70-fba78176ec8e	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56ab-4581-f979-cee58e9f459f	ProgramFestival-read	ProgramFestival - branje	t
00030000-56ab-4581-7ea6-741c05b277ff	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56ab-4581-7d7e-39811ab8c9e2	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56ab-4581-1355-17c0d7e1ec13	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56ab-4581-9b62-58d54c19ad6a	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56ab-4581-1bb0-dd9de896f029	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56ab-4581-8a02-b97fc6ebfbb4	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56ab-4581-7f54-d332e5da1970	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56ab-4581-2e7f-526c6c67a710	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56ab-4581-1905-fd384f0bd5ed	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56ab-4581-4a6a-c449b868159a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56ab-4581-b973-7666090e0f74	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56ab-4581-e132-a64efa279b92	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56ab-4581-2ab0-d18a768f18b7	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56ab-4581-f910-ce92ed83db44	ProgramRazno-read	ProgramRazno - branje	t
00030000-56ab-4581-0a0c-5525b7a5c969	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56ab-4581-6a0b-5a4746aba7ca	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56ab-4581-dc54-7b70256c860e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56ab-4581-d6b7-9f6656737c1d	Prostor-read	Prostor - branje	t
00030000-56ab-4581-9dff-49635c46b4b5	Prostor-write	Prostor - spreminjanje	t
00030000-56ab-4581-f49f-3940b38821d2	Racun-read	Racun - branje	t
00030000-56ab-4581-4168-8f40c3105d1f	Racun-write	Racun - spreminjanje	t
00030000-56ab-4581-501c-3ff7b1da6cdc	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56ab-4581-a2e4-597352a2467a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56ab-4581-95bf-6f61ed4b65f5	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56ab-4581-0010-696748b72060	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56ab-4581-f85c-0ffc94c5fb7c	Rekvizit-read	Rekvizit - branje	t
00030000-56ab-4581-cb37-ad96466aeca8	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56ab-4581-af28-329823e77199	Revizija-read	Revizija - branje	t
00030000-56ab-4581-8ca6-93e2a7f61079	Revizija-write	Revizija - spreminjanje	t
00030000-56ab-4581-0213-a7dd0ef4b480	Rezervacija-read	Rezervacija - branje	t
00030000-56ab-4581-78b3-d1bd86dfedc1	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56ab-4581-1b64-00b8496bc1e3	SedezniRed-read	SedezniRed - branje	t
00030000-56ab-4581-2dee-878d3a268807	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56ab-4581-4220-d8910f82e31a	Sedez-read	Sedez - branje	t
00030000-56ab-4581-8ae7-76085b6ddbcf	Sedez-write	Sedez - spreminjanje	t
00030000-56ab-4581-3745-79dbf165d23d	Sezona-read	Sezona - branje	t
00030000-56ab-4581-d149-17eadd9c0838	Sezona-write	Sezona - spreminjanje	t
00030000-56ab-4581-a649-38a8ef340ab0	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56ab-4581-bd68-c4548dbc0c27	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56ab-4581-22fb-e91dd16c9437	Telefonska-read	Telefonska - branje	t
00030000-56ab-4581-45f1-ffacc4e47f40	Telefonska-write	Telefonska - spreminjanje	t
00030000-56ab-4581-7d40-088e92cfe80f	TerminStoritve-read	TerminStoritve - branje	t
00030000-56ab-4581-3676-e26b40ca2fd6	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56ab-4581-c87d-9adb4bd02eaf	TipDodatka-read	TipDodatka - branje	t
00030000-56ab-4581-df9f-3515305a2def	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56ab-4581-43ff-7422c984598b	TipFunkcije-read	TipFunkcije - branje	t
00030000-56ab-4581-1698-564f109a1f9e	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56ab-4581-3d30-a66c65ca5c55	TipPopa-read	TipPopa - branje	t
00030000-56ab-4581-c5b0-5ab6f5a032a1	TipPopa-write	TipPopa - spreminjanje	t
00030000-56ab-4581-8022-20e56e294b52	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56ab-4581-7770-0ada091bbaca	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56ab-4581-e574-708d28aefad4	TipVaje-read	TipVaje - branje	t
00030000-56ab-4581-fe34-fae1588a534b	TipVaje-write	TipVaje - spreminjanje	t
00030000-56ab-4581-5264-561c1f66be0a	Trr-read	Trr - branje	t
00030000-56ab-4581-09f1-9789e26c74c5	Trr-write	Trr - spreminjanje	t
00030000-56ab-4581-762b-83127b37c9ff	Uprizoritev-read	Uprizoritev - branje	t
00030000-56ab-4581-479b-6bfadc52015e	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56ab-4581-f4da-5971623a26df	Vaja-read	Vaja - branje	t
00030000-56ab-4581-1479-341e16fd36c3	Vaja-write	Vaja - spreminjanje	t
00030000-56ab-4581-5598-ee997c41f317	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56ab-4581-6d07-ff0fed625593	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56ab-4581-05e8-1f72dac741a3	VrstaStroska-read	VrstaStroska - branje	t
00030000-56ab-4581-3600-5246170f046e	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56ab-4581-f45c-9fedaf673c24	Zaposlitev-read	Zaposlitev - branje	t
00030000-56ab-4581-9829-514a9b81960e	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56ab-4581-1b6f-f80943f4c515	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56ab-4581-da80-24f9ffca5ad9	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56ab-4581-7ea3-7fb894a3f95a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56ab-4581-cf89-186078e96ba9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56ab-4581-669e-0c54669cee29	Job-read	Branje opravil - samo zase - branje	t
00030000-56ab-4581-18a6-aa28ec882317	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56ab-4581-dea1-5785b950e8f3	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56ab-4581-3cd4-e0373bc493fc	Report-read	Report - branje	t
00030000-56ab-4581-1c8b-6ef5e52f5aac	Report-write	Report - spreminjanje	t
00030000-56ab-4581-e466-6502c524a35d	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56ab-4581-8e82-a9db52b9f622	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56ab-4581-a3c5-cfef4a0b1aed	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56ab-4581-40ed-5c43a4381a91	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56ab-4581-d754-ed4f65fe3716	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56ab-4581-fad0-e6183761a06b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56ab-4581-1c94-514132d684e4	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56ab-4581-3598-231b754f485c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-4581-fc30-9a0983339272	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-4581-0c61-07ee476d2e36	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-4581-bcaa-52ee8f4e5bf1	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-4581-c5a6-2c889392b080	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56ab-4581-e6ac-26a7a76fced2	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56ab-4581-d72c-16bdd6ac59ca	Datoteka-write	Datoteka - spreminjanje	t
00030000-56ab-4581-e858-f838e5f341a8	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 41738827)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56ab-4581-7d08-62574eee0eb2	00030000-56ab-4581-0d5e-a0ff6cd0117e
00020000-56ab-4581-7d08-62574eee0eb2	00030000-56ab-4581-ad7b-ea08057aa661
00020000-56ab-4581-bf19-3f523a249b47	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-d5e2-c8887b1d047a
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-a8d4-5667c7beeabb
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-aab6-837e6954fc99	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4581-2c69-77aa75711f08	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4581-2c69-77aa75711f08	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4581-2c69-77aa75711f08	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4581-2c69-77aa75711f08	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-2c69-77aa75711f08	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4581-2c69-77aa75711f08	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4581-ab0d-58f82d465a1d	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4581-ab0d-58f82d465a1d	00030000-56ab-4581-9829-514a9b81960e
00020000-56ab-4581-ab0d-58f82d465a1d	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4581-ab0d-58f82d465a1d	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4581-ab0d-58f82d465a1d	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4581-ab0d-58f82d465a1d	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4581-ab0d-58f82d465a1d	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4581-df17-8d25b29a62d9	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4581-df17-8d25b29a62d9	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4581-df17-8d25b29a62d9	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4581-edb9-2bb06ffceff2	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4581-edb9-2bb06ffceff2	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4581-edb9-2bb06ffceff2	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4581-edb9-2bb06ffceff2	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4581-edb9-2bb06ffceff2	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4581-edb9-2bb06ffceff2	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4581-edb9-2bb06ffceff2	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-edb9-2bb06ffceff2	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4581-fa88-3eea78031ae6	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4581-fa88-3eea78031ae6	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4581-fa88-3eea78031ae6	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4581-fa88-3eea78031ae6	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-09f1-9789e26c74c5
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-e59c-e1b47b47aafe
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-45f1-ffacc4e47f40
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4581-39bd-21676688e46c	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-4ceb-9bd8e764fe93	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4581-4ceb-9bd8e764fe93	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4581-4ceb-9bd8e764fe93	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4581-4ceb-9bd8e764fe93	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4581-4ceb-9bd8e764fe93	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4581-4ceb-9bd8e764fe93	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4581-4ceb-9bd8e764fe93	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-45f1-ffacc4e47f40
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-e59c-e1b47b47aafe
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-09f1-9789e26c74c5
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-3762-463c0100ae31
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-8c30-48ab5dbf360b
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-5aeb-e8e712e00474
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4581-3b05-5a21df9f2aad	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4581-137a-2138b83fd197	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4581-2c74-17017cb1fd12	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4581-2c74-17017cb1fd12	00030000-56ab-4581-c5b0-5ab6f5a032a1
00020000-56ab-4581-b27e-7a5089e83b3c	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4581-4c0e-b1cfdbbcd37d	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4581-4c0e-b1cfdbbcd37d	00030000-56ab-4581-949f-182ba9e27ba3
00020000-56ab-4581-c1c7-9beab22d1a1d	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4581-f264-14fec7655c24	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4581-f264-14fec7655c24	00030000-56ab-4581-ff67-64db3f8018b7
00020000-56ab-4581-8052-c5c1a690607c	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4581-8721-d24dee1c15b6	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4581-8721-d24dee1c15b6	00030000-56ab-4581-cf89-186078e96ba9
00020000-56ab-4581-bf06-28e9a18bf7bc	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4581-8d8a-bc1e609bdb48	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4581-8d8a-bc1e609bdb48	00030000-56ab-4581-da80-24f9ffca5ad9
00020000-56ab-4581-0707-36aeab7a2d18	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4581-3b88-2f5e8eb11e06	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4581-3b88-2f5e8eb11e06	00030000-56ab-4581-5b88-ce846c57d66b
00020000-56ab-4581-fb64-7476947cb3ec	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4581-4a84-fbc78944a00a	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4581-4a84-fbc78944a00a	00030000-56ab-4581-9dff-49635c46b4b5
00020000-56ab-4581-4a84-fbc78944a00a	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4581-4a84-fbc78944a00a	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4581-4a84-fbc78944a00a	00030000-56ab-4581-e59c-e1b47b47aafe
00020000-56ab-4581-4a84-fbc78944a00a	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4581-f8b6-43955241f5b2	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4581-f8b6-43955241f5b2	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4581-f8b6-43955241f5b2	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4581-1935-ffa8ea7cf064	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4581-1935-ffa8ea7cf064	00030000-56ab-4581-3600-5246170f046e
00020000-56ab-4581-e81f-a6cbaa07651b	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-cc39-3b509a1e28f4
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4581-a82a-181108419623	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-c377-08433cb6a067	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4582-c377-08433cb6a067	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-c377-08433cb6a067	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-c377-08433cb6a067	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-c377-08433cb6a067	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-d8d6-3a0e36d74fb0	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4582-d8d6-3a0e36d74fb0	00030000-56ab-4581-fe34-fae1588a534b
00020000-56ab-4582-26fe-6b8b5d643ec1	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-b28f-b2c7dccd9bc0
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-eed2-81d15d446c51
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-926f-719335b8ebec
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-ae70-fba78176ec8e
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-f979-cee58e9f459f
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-7ea6-741c05b277ff
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-7d7e-39811ab8c9e2
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-1355-17c0d7e1ec13
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-9b62-58d54c19ad6a
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-1bb0-dd9de896f029
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-8a02-b97fc6ebfbb4
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-7f54-d332e5da1970
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-2e7f-526c6c67a710
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-1905-fd384f0bd5ed
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-4a6a-c449b868159a
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-b973-7666090e0f74
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-e132-a64efa279b92
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-2ab0-d18a768f18b7
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-f910-ce92ed83db44
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-0a0c-5525b7a5c969
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-6a0b-5a4746aba7ca
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-dc54-7b70256c860e
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-e056-a6dd3e7ad9d2
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-b91c-289bc00b2d6f
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-1def-83278d605336
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-18a6-aa28ec882317
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-9f25-db87f2b9735e
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-baf0-5ea9022ccd74
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-569d-265e379a7cdb
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-669e-0c54669cee29
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-faae-2fa2ff22a8da	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-926f-719335b8ebec
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-f979-cee58e9f459f
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-7d7e-39811ab8c9e2
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-9b62-58d54c19ad6a
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-8a02-b97fc6ebfbb4
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-2e7f-526c6c67a710
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-4a6a-c449b868159a
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-e132-a64efa279b92
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-f910-ce92ed83db44
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-6a0b-5a4746aba7ca
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-baf0-5ea9022ccd74
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-9f25-db87f2b9735e
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-569d-265e379a7cdb
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-669e-0c54669cee29
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-4b8a-9d48ea377f6d	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-479b-6bfadc52015e
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-b76f-66bda51a1121
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-cfcd-cd0f5f9aa886	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-f506-a5fa2c49ac84	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-f35e-7d6ddf8c0d8d	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-f35e-7d6ddf8c0d8d	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-f35e-7d6ddf8c0d8d	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-f35e-7d6ddf8c0d8d	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4582-f35e-7d6ddf8c0d8d	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-f35e-7d6ddf8c0d8d	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-f35e-7d6ddf8c0d8d	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-f35e-7d6ddf8c0d8d	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-85df-0ef21f6c0d35
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-bd68-c4548dbc0c27
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-30fd-b2b0675002ee	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-34b5-1465b761e9de	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-b347-cc25a4738ce2	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-b347-cc25a4738ce2	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-b347-cc25a4738ce2	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-b347-cc25a4738ce2	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-b347-cc25a4738ce2	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-b347-cc25a4738ce2	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-b347-cc25a4738ce2	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-fe64-e9ae14b6c6ea	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-fe64-e9ae14b6c6ea	00030000-56ab-4581-bd68-c4548dbc0c27
00020000-56ab-4582-fe64-e9ae14b6c6ea	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-fe64-e9ae14b6c6ea	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-4118-b6d86a1c1532	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-4118-b6d86a1c1532	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-d5e2-c8887b1d047a
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-a8d4-5667c7beeabb
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-9f25-db87f2b9735e
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-b91c-289bc00b2d6f
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-b76f-66bda51a1121
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-669e-0c54669cee29
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-18a6-aa28ec882317
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-85df-0ef21f6c0d35
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-569d-265e379a7cdb
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-1def-83278d605336
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-baf0-5ea9022ccd74
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-e056-a6dd3e7ad9d2
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-b28f-b2c7dccd9bc0
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-926f-719335b8ebec
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-eed2-81d15d446c51
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-ae70-fba78176ec8e
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-f979-cee58e9f459f
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-7ea6-741c05b277ff
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-7d7e-39811ab8c9e2
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-1355-17c0d7e1ec13
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-9b62-58d54c19ad6a
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-1bb0-dd9de896f029
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-8a02-b97fc6ebfbb4
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-7f54-d332e5da1970
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-2e7f-526c6c67a710
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-1905-fd384f0bd5ed
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-4a6a-c449b868159a
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-b973-7666090e0f74
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-e132-a64efa279b92
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-2ab0-d18a768f18b7
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-f910-ce92ed83db44
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-0a0c-5525b7a5c969
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-6a0b-5a4746aba7ca
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-dc54-7b70256c860e
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-bd68-c4548dbc0c27
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-479b-6bfadc52015e
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4582-bb2c-ed1a5feb9c4b	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-d5e2-c8887b1d047a
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-a8d4-5667c7beeabb
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4582-d9b1-bc4e5f13a4b1	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-d5e2-c8887b1d047a
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-a8d4-5667c7beeabb
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-b76f-66bda51a1121
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-479b-6bfadc52015e
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4582-385e-a9ff4c0af668	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-d5e2-c8887b1d047a
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-a8d4-5667c7beeabb
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-9f25-db87f2b9735e
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-b91c-289bc00b2d6f
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-b76f-66bda51a1121
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-669e-0c54669cee29
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-18a6-aa28ec882317
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-8c30-48ab5dbf360b
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-85df-0ef21f6c0d35
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-3762-463c0100ae31
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-569d-265e379a7cdb
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-1def-83278d605336
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-e59c-e1b47b47aafe
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-baf0-5ea9022ccd74
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-e056-a6dd3e7ad9d2
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-5aeb-e8e712e00474
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-b28f-b2c7dccd9bc0
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-926f-719335b8ebec
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-eed2-81d15d446c51
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-ae70-fba78176ec8e
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-f979-cee58e9f459f
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-7ea6-741c05b277ff
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-7d7e-39811ab8c9e2
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-1355-17c0d7e1ec13
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-9b62-58d54c19ad6a
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-1bb0-dd9de896f029
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-8a02-b97fc6ebfbb4
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-7f54-d332e5da1970
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-2e7f-526c6c67a710
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-1905-fd384f0bd5ed
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-4a6a-c449b868159a
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-b973-7666090e0f74
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-e132-a64efa279b92
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-2ab0-d18a768f18b7
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-f910-ce92ed83db44
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-0a0c-5525b7a5c969
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-6a0b-5a4746aba7ca
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-dc54-7b70256c860e
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-bd68-c4548dbc0c27
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-45f1-ffacc4e47f40
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-09f1-9789e26c74c5
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-479b-6bfadc52015e
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-9829-514a9b81960e
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4582-1db5-a406590b8c35	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-d5e2-c8887b1d047a
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-a8d4-5667c7beeabb
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-b76f-66bda51a1121
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-8c30-48ab5dbf360b
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-3762-463c0100ae31
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-e59c-e1b47b47aafe
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-5aeb-e8e712e00474
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-45f1-ffacc4e47f40
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-09f1-9789e26c74c5
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-479b-6bfadc52015e
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-9829-514a9b81960e
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4582-acf4-567ac484010d	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4582-2df9-8358b2c135c3	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-9f25-db87f2b9735e
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-b91c-289bc00b2d6f
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-669e-0c54669cee29
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-18a6-aa28ec882317
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-8c30-48ab5dbf360b
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-cc39-3b509a1e28f4
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-85df-0ef21f6c0d35
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-3762-463c0100ae31
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-569d-265e379a7cdb
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-1def-83278d605336
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-e59c-e1b47b47aafe
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-baf0-5ea9022ccd74
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-e056-a6dd3e7ad9d2
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-5aeb-e8e712e00474
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-b28f-b2c7dccd9bc0
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-926f-719335b8ebec
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-eed2-81d15d446c51
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-ae70-fba78176ec8e
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-f979-cee58e9f459f
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-7ea6-741c05b277ff
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-7d7e-39811ab8c9e2
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-1355-17c0d7e1ec13
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-9b62-58d54c19ad6a
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-1bb0-dd9de896f029
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-8a02-b97fc6ebfbb4
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-7f54-d332e5da1970
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-2e7f-526c6c67a710
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-1905-fd384f0bd5ed
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-4a6a-c449b868159a
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-b973-7666090e0f74
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-e132-a64efa279b92
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-2ab0-d18a768f18b7
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-f910-ce92ed83db44
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-0a0c-5525b7a5c969
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-6a0b-5a4746aba7ca
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-dc54-7b70256c860e
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-bd68-c4548dbc0c27
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-45f1-ffacc4e47f40
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-09f1-9789e26c74c5
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-3600-5246170f046e
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-9829-514a9b81960e
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4582-84ae-cb912d563397	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-ad7b-ea08057aa661
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0d5e-a0ff6cd0117e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fa32-4893a54bbe5b
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-5b88-ce846c57d66b
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-bf3d-474d19e4e13a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2495-9962a0906dc3
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7b87-4c30f2d6cb8f
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-24db-ddbfaa43b2b2
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0511-9226341bf4c2
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-d5e2-c8887b1d047a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0ba2-0756a40d2128
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-a8d4-5667c7beeabb
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f574-4c28fad32aec
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-a807-43af3508fcbf
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-bf28-bd6addce884d
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-819d-4460c1ba783a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-6e0a-674fecbd54fd
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2919-b171b6319bed
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-b7a6-b2b6e760dc96
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fb65-b35e243164b3
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3b9e-fc1a89979ef5
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-9f25-db87f2b9735e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-b91c-289bc00b2d6f
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-ef57-c05eff0001d4
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-ff67-64db3f8018b7
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2104-1ded69d7d34c
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0ef1-34c412fcac78
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-b76f-66bda51a1121
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-cdeb-67fb5a191cb5
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2895-1cf974f4ee0d
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-dea1-5785b950e8f3
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-669e-0c54669cee29
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-18a6-aa28ec882317
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fa0f-2faff9152d34
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-8c30-48ab5dbf360b
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-6d03-b1659f701769
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3a03-e72e0f0b9ada
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1c94-514132d684e4
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fad0-e6183761a06b
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-8e82-a9db52b9f622
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-a3c5-cfef4a0b1aed
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-40ed-5c43a4381a91
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-d754-ed4f65fe3716
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fa7c-519dead8e2a6
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-e4ff-0b9e71c0869b
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-23fd-a58ba45c7fd1
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-38ad-bc40a22756b8
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7bb4-dc3645d27889
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0397-0096b83c9a3f
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-081c-d53524ff2022
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-6d0f-d0eaa018e86c
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-cc39-3b509a1e28f4
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-a45e-3354a6adbde2
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-d497-c09466b6bdce
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-b135-8c2b2734d394
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-85f8-9cd311be1a9a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-85df-0ef21f6c0d35
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3762-463c0100ae31
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f169-ee3b2edbff40
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-569d-265e379a7cdb
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1def-83278d605336
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7908-929f0b0f1f6e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-36fa-e792b2770424
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-949f-182ba9e27ba3
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-e59c-e1b47b47aafe
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-ec10-804868f7d8b2
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-c28c-6e08627f7554
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-89f8-2f8a094b6057
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fd27-8ab101f4a85a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-5b69-0ac36e7fb0c5
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2643-1f1d0cacd6de
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-baf0-5ea9022ccd74
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-e056-a6dd3e7ad9d2
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-b94c-ad9d90c79b7d
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-5aeb-e8e712e00474
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-b28f-b2c7dccd9bc0
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-926f-719335b8ebec
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-eed2-81d15d446c51
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-ae70-fba78176ec8e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f979-cee58e9f459f
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7ea6-741c05b277ff
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7d7e-39811ab8c9e2
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1355-17c0d7e1ec13
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-9b62-58d54c19ad6a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1bb0-dd9de896f029
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-8a02-b97fc6ebfbb4
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7f54-d332e5da1970
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2e7f-526c6c67a710
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1905-fd384f0bd5ed
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-4a6a-c449b868159a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-b973-7666090e0f74
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-e132-a64efa279b92
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2ab0-d18a768f18b7
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f910-ce92ed83db44
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0a0c-5525b7a5c969
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-6a0b-5a4746aba7ca
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-dc54-7b70256c860e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-d6b7-9f6656737c1d
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-9dff-49635c46b4b5
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f49f-3940b38821d2
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-4168-8f40c3105d1f
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-501c-3ff7b1da6cdc
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-a2e4-597352a2467a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-95bf-6f61ed4b65f5
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0010-696748b72060
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f85c-0ffc94c5fb7c
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-cb37-ad96466aeca8
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3cd4-e0373bc493fc
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1c8b-6ef5e52f5aac
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-af28-329823e77199
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-8ca6-93e2a7f61079
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0213-a7dd0ef4b480
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-78b3-d1bd86dfedc1
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1b64-00b8496bc1e3
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-2dee-878d3a268807
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-4220-d8910f82e31a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-8ae7-76085b6ddbcf
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3745-79dbf165d23d
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-d149-17eadd9c0838
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-e466-6502c524a35d
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-bd68-c4548dbc0c27
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-45f1-ffacc4e47f40
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7d40-088e92cfe80f
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-4236-c242c1e693d8
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3676-e26b40ca2fd6
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-43ff-7422c984598b
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1698-564f109a1f9e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3d30-a66c65ca5c55
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-c5b0-5ab6f5a032a1
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-8022-20e56e294b52
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7770-0ada091bbaca
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-e574-708d28aefad4
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fe34-fae1588a534b
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-09f1-9789e26c74c5
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-479b-6bfadc52015e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f4da-5971623a26df
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1479-341e16fd36c3
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-5598-ee997c41f317
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-6d07-ff0fed625593
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-05e8-1f72dac741a3
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3600-5246170f046e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-e6ac-26a7a76fced2
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-c5a6-2c889392b080
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-9829-514a9b81960e
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-1b6f-f80943f4c515
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-da80-24f9ffca5ad9
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-7ea3-7fb894a3f95a
00020000-56ab-4584-704b-132dfecafdf6	00030000-56ab-4581-cf89-186078e96ba9
00020000-56ab-4584-8832-ba646383bae9	00030000-56ab-4581-bcaa-52ee8f4e5bf1
00020000-56ab-4584-ffd4-a09db5de34a6	00030000-56ab-4581-0c61-07ee476d2e36
00020000-56ab-4584-b025-ebea19aa994d	00030000-56ab-4581-479b-6bfadc52015e
00020000-56ab-4584-1393-d4e48fa86b7c	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4584-ae01-6aab70c973ff	00030000-56ab-4581-a3c5-cfef4a0b1aed
00020000-56ab-4584-a09f-0dc5f7b08a6a	00030000-56ab-4581-40ed-5c43a4381a91
00020000-56ab-4584-8780-0f0e1b60a7d9	00030000-56ab-4581-d754-ed4f65fe3716
00020000-56ab-4584-2200-9a4d28eadc3e	00030000-56ab-4581-8e82-a9db52b9f622
00020000-56ab-4584-5321-940320f43449	00030000-56ab-4581-1c94-514132d684e4
00020000-56ab-4584-b39b-f251c09d0f90	00030000-56ab-4581-fad0-e6183761a06b
00020000-56ab-4584-ce96-002aeb1deb03	00030000-56ab-4581-fc30-9a0983339272
00020000-56ab-4584-774f-34b5476863bb	00030000-56ab-4581-3598-231b754f485c
00020000-56ab-4584-4806-f184508d59dd	00030000-56ab-4581-2d1b-b1070ab2aa1f
00020000-56ab-4584-063e-4bfecb288f48	00030000-56ab-4581-ec28-cbb408bfd740
00020000-56ab-4584-a626-5ccfda4e9b89	00030000-56ab-4581-f8eb-dc783d94cf12
00020000-56ab-4584-4d2d-77633067640a	00030000-56ab-4581-76ac-6bf134d9d308
00020000-56ab-4584-3eef-3a001ba25750	00030000-56ab-4581-d72c-16bdd6ac59ca
00020000-56ab-4584-c754-53560606064b	00030000-56ab-4581-e858-f838e5f341a8
00020000-56ab-4584-e313-50b83bed622f	00030000-56ab-4581-7f5a-bfc1f8523445
00020000-56ab-4584-e313-50b83bed622f	00030000-56ab-4581-3762-463c0100ae31
00020000-56ab-4584-e313-50b83bed622f	00030000-56ab-4581-762b-83127b37c9ff
00020000-56ab-4584-c8f2-7d809c430139	00030000-56ab-4581-5264-561c1f66be0a
00020000-56ab-4584-323a-620b7f928b60	00030000-56ab-4581-09f1-9789e26c74c5
00020000-56ab-4584-f17c-92d848ad2fe5	00030000-56ab-4581-e466-6502c524a35d
00020000-56ab-4584-56ff-20d9cc6882b3	00030000-56ab-4581-22fb-e91dd16c9437
00020000-56ab-4584-7b47-9cdbcbfbd841	00030000-56ab-4581-45f1-ffacc4e47f40
00020000-56ab-4584-7b3d-778dd4986d3a	00030000-56ab-4581-d6e6-501083e6e521
00020000-56ab-4584-a9f5-043279a570eb	00030000-56ab-4581-e59c-e1b47b47aafe
00020000-56ab-4584-d4ca-6eb8b1df7e7b	00030000-56ab-4581-f45c-9fedaf673c24
00020000-56ab-4584-7632-58ae59ce679a	00030000-56ab-4581-9829-514a9b81960e
00020000-56ab-4584-5d80-f8d4ae950010	00030000-56ab-4581-fd46-f193a128de9a
00020000-56ab-4584-a9d6-276412b0769b	00030000-56ab-4581-85df-0ef21f6c0d35
00020000-56ab-4584-0e8e-1a8989cc846c	00030000-56ab-4581-a649-38a8ef340ab0
00020000-56ab-4584-1f01-830b994973fc	00030000-56ab-4581-bd68-c4548dbc0c27
00020000-56ab-4584-eb83-169fbed7c952	00030000-56ab-4581-92df-1ee600e3e1e5
00020000-56ab-4584-0c89-0a2f9cc92c34	00030000-56ab-4581-f566-ca574ecda5ca
00020000-56ab-4584-4380-338e42d468e3	00030000-56ab-4581-20b3-c7e27f13f150
00020000-56ab-4584-55c1-b7918c84fe7b	00030000-56ab-4581-115b-8716eedc51ec
00020000-56ab-4584-61e8-8116377d5589	00030000-56ab-4581-5652-927a38c4c0b8
00020000-56ab-4584-a7bf-ccab9e453019	00030000-56ab-4581-b76f-66bda51a1121
\.


--
-- TOC entry 3181 (class 0 OID 41739225)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 41739260)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 41739393)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56ab-4584-76c5-c039756ccc0c	00090000-56ab-4584-dcd2-87e1f1493147	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56ab-4584-64da-0cf4900a9f5d	00090000-56ab-4584-c4ec-86ed029971c7	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56ab-4584-f727-c189ff242341	00090000-56ab-4584-8049-defd4821d67a	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56ab-4584-ea03-43d610582c2f	00090000-56ab-4584-2f10-ec2d209082b0	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 41738910)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56ab-4584-28b8-3dbe0ff58817	\N	00040000-56ab-4581-a02d-b7b2beaf920e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-4584-dc86-566b91f934fc	\N	00040000-56ab-4581-a02d-b7b2beaf920e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56ab-4584-0f9f-dc56998955d7	\N	00040000-56ab-4581-a02d-b7b2beaf920e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-4584-b892-b342ab7e80dd	\N	00040000-56ab-4581-a02d-b7b2beaf920e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-4584-2c87-8fb26236a83b	\N	00040000-56ab-4581-a02d-b7b2beaf920e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-4584-72c5-32dd5409d804	\N	00040000-56ab-4581-2ef4-5c88a4c1e0e3	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-4584-09b3-6430c6be3a48	\N	00040000-56ab-4581-ae03-235d23443d69	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-4584-71df-050159d45386	\N	00040000-56ab-4581-0300-e3853d8d3e9e	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-4584-574b-a6d1bd255ed0	\N	00040000-56ab-4581-0c0f-97a1326d2928	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-4587-062a-64f3a16f950d	\N	00040000-56ab-4581-a02d-b7b2beaf920e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 41738955)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56ab-4580-4b63-72943b27acc7	8341	Adlešiči
00050000-56ab-4580-71a7-30eb61334fd7	5270	Ajdovščina
00050000-56ab-4580-ebf5-a77dbdd14d8a	6280	Ankaran/Ancarano
00050000-56ab-4580-fded-353dd0a362af	9253	Apače
00050000-56ab-4580-a638-ff28425603c2	8253	Artiče
00050000-56ab-4580-f0a1-049d9a918c86	4275	Begunje na Gorenjskem
00050000-56ab-4580-168e-feb71429dd87	1382	Begunje pri Cerknici
00050000-56ab-4580-60ce-1eb060e965dd	9231	Beltinci
00050000-56ab-4580-6236-823093536d52	2234	Benedikt
00050000-56ab-4580-d988-411ec63bc99f	2345	Bistrica ob Dravi
00050000-56ab-4580-191c-5d2feb08430a	3256	Bistrica ob Sotli
00050000-56ab-4580-4ce8-885a619d14e0	8259	Bizeljsko
00050000-56ab-4580-c893-b080fb3a94c3	1223	Blagovica
00050000-56ab-4580-1597-1bbc36cf2e29	8283	Blanca
00050000-56ab-4580-86c6-c29660494d49	4260	Bled
00050000-56ab-4580-65d3-81faf4635945	4273	Blejska Dobrava
00050000-56ab-4580-1910-6118f4c2cd4d	9265	Bodonci
00050000-56ab-4580-345e-f830989ec944	9222	Bogojina
00050000-56ab-4580-3d70-79c0c956b1e6	4263	Bohinjska Bela
00050000-56ab-4580-c37c-4d1d255bf7b6	4264	Bohinjska Bistrica
00050000-56ab-4580-a1fb-f729f620c445	4265	Bohinjsko jezero
00050000-56ab-4580-5f9a-bfd0798069c9	1353	Borovnica
00050000-56ab-4580-5976-f85a61157a4a	8294	Boštanj
00050000-56ab-4580-e9d6-cc9be007a8f0	5230	Bovec
00050000-56ab-4580-01b8-6c5a6b1b1700	5295	Branik
00050000-56ab-4580-f1db-7839432d34f7	3314	Braslovče
00050000-56ab-4580-a67d-64ae02dd9608	5223	Breginj
00050000-56ab-4580-54ce-d70ecb37c26d	8280	Brestanica
00050000-56ab-4580-dd4c-2299d2a147c1	2354	Bresternica
00050000-56ab-4580-fb3b-de7d2f571afa	4243	Brezje
00050000-56ab-4580-4807-031ce80a9bdb	1351	Brezovica pri Ljubljani
00050000-56ab-4580-324f-df237a637b5c	8250	Brežice
00050000-56ab-4580-f394-4085fc95414c	4210	Brnik - Aerodrom
00050000-56ab-4580-d3b8-15cb06c8562b	8321	Brusnice
00050000-56ab-4580-c840-8e4ac08e8940	3255	Buče
00050000-56ab-4580-c4c2-42ad0da80a4e	8276	Bučka 
00050000-56ab-4580-1bb6-83a571a02d05	9261	Cankova
00050000-56ab-4580-bbe7-571057edc1ce	3000	Celje 
00050000-56ab-4580-1fc4-92b813c25481	3001	Celje - poštni predali
00050000-56ab-4580-9903-3d2044e95d61	4207	Cerklje na Gorenjskem
00050000-56ab-4580-c466-c28b7ee655bb	8263	Cerklje ob Krki
00050000-56ab-4580-fc93-2c13fd669ad8	1380	Cerknica
00050000-56ab-4580-520b-616a929c8fe2	5282	Cerkno
00050000-56ab-4580-e414-5d4359866f74	2236	Cerkvenjak
00050000-56ab-4580-377e-b71882fc2c31	2215	Ceršak
00050000-56ab-4580-501e-8da86a499f3a	2326	Cirkovce
00050000-56ab-4580-49cc-b6f580a9df2f	2282	Cirkulane
00050000-56ab-4580-dec4-955ba0b7ba8e	5273	Col
00050000-56ab-4580-bdb5-470c1408731d	8251	Čatež ob Savi
00050000-56ab-4580-6bd9-0807f4d2a0b8	1413	Čemšenik
00050000-56ab-4580-ff1a-e7561f864aa8	5253	Čepovan
00050000-56ab-4580-a803-8e7e9a36054b	9232	Črenšovci
00050000-56ab-4580-10a6-8d9a8c38180c	2393	Črna na Koroškem
00050000-56ab-4580-b032-133c19a63bf4	6275	Črni Kal
00050000-56ab-4580-a564-6b5f949e24e3	5274	Črni Vrh nad Idrijo
00050000-56ab-4580-4290-7842227522cb	5262	Črniče
00050000-56ab-4580-36a8-13bcce92baa7	8340	Črnomelj
00050000-56ab-4580-40d6-a477c128948f	6271	Dekani
00050000-56ab-4580-f19d-2c8f9b8e48e3	5210	Deskle
00050000-56ab-4580-b88d-aa4ef0bef1d2	2253	Destrnik
00050000-56ab-4580-bcc4-22642948b664	6215	Divača
00050000-56ab-4580-780a-16aef72648e8	1233	Dob
00050000-56ab-4580-3534-67491ed9465d	3224	Dobje pri Planini
00050000-56ab-4580-e514-53ca2688c63f	8257	Dobova
00050000-56ab-4580-f3ed-677e0de5234e	1423	Dobovec
00050000-56ab-4580-0524-00ae6509d411	5263	Dobravlje
00050000-56ab-4580-da33-d7baf97fdb54	3204	Dobrna
00050000-56ab-4580-937b-0adf93be69f4	8211	Dobrnič
00050000-56ab-4580-2c68-3104084b44e0	1356	Dobrova
00050000-56ab-4580-ba4f-fe0cfb7c94db	9223	Dobrovnik/Dobronak 
00050000-56ab-4580-91e5-55efaf3b3efa	5212	Dobrovo v Brdih
00050000-56ab-4580-29a8-619d9df063a5	1431	Dol pri Hrastniku
00050000-56ab-4580-6af2-a026a64ec9d0	1262	Dol pri Ljubljani
00050000-56ab-4580-b765-264e1a0db98f	1273	Dole pri Litiji
00050000-56ab-4580-2074-970527fc3d7d	1331	Dolenja vas
00050000-56ab-4580-705b-80c31af0ba85	8350	Dolenjske Toplice
00050000-56ab-4580-68ee-8e6b193cd3c3	1230	Domžale
00050000-56ab-4580-73d6-c7e28bfc36de	2252	Dornava
00050000-56ab-4580-418d-0ac23c695b4e	5294	Dornberk
00050000-56ab-4580-414d-38f5c1a6d44f	1319	Draga
00050000-56ab-4580-1f81-ae3e58950274	8343	Dragatuš
00050000-56ab-4580-c3a2-0cf324800080	3222	Dramlje
00050000-56ab-4580-d515-d08ea3b1a729	2370	Dravograd
00050000-56ab-4580-f6e9-1dd288e23586	4203	Duplje
00050000-56ab-4580-bc03-78a489953577	6221	Dutovlje
00050000-56ab-4580-670c-87bd3a7fd37e	8361	Dvor
00050000-56ab-4580-087c-57cec0b46a35	2343	Fala
00050000-56ab-4580-7d40-d238fe463f62	9208	Fokovci
00050000-56ab-4580-d9b2-bc3bc39b097c	2313	Fram
00050000-56ab-4580-eb4c-9a4e0e487dd0	3213	Frankolovo
00050000-56ab-4580-7fb4-abbec740eecd	1274	Gabrovka
00050000-56ab-4580-229f-ea1b2301dd35	8254	Globoko
00050000-56ab-4580-56f6-b9b459818ade	5275	Godovič
00050000-56ab-4580-1f59-e86d63c50e0a	4204	Golnik
00050000-56ab-4580-076b-b66a7a495a1f	3303	Gomilsko
00050000-56ab-4580-4d73-f1c7f7c6d5f9	4224	Gorenja vas
00050000-56ab-4580-b026-738ee573cba9	3263	Gorica pri Slivnici
00050000-56ab-4580-1729-3a23911c387e	2272	Gorišnica
00050000-56ab-4580-9979-ebbebf34f7ac	9250	Gornja Radgona
00050000-56ab-4580-614f-bb49f994baf6	3342	Gornji Grad
00050000-56ab-4580-9dcd-16555d5056c5	4282	Gozd Martuljek
00050000-56ab-4580-e695-ca21167b428f	6272	Gračišče
00050000-56ab-4580-c5da-899b44c7b46f	9264	Grad
00050000-56ab-4580-6a57-26a20cc112af	8332	Gradac
00050000-56ab-4580-170f-615aad497673	1384	Grahovo
00050000-56ab-4580-93c0-23c103c2efa3	5242	Grahovo ob Bači
00050000-56ab-4580-9034-ca7784aa6448	5251	Grgar
00050000-56ab-4580-25f7-92db0091acf3	3302	Griže
00050000-56ab-4580-b3cc-e5cbfc0de6c3	3231	Grobelno
00050000-56ab-4580-ab52-3f1589292841	1290	Grosuplje
00050000-56ab-4580-eaa2-0aea5106e1a2	2288	Hajdina
00050000-56ab-4580-f446-045cbf9b9fd1	8362	Hinje
00050000-56ab-4580-d3cb-7e488ef4d919	2311	Hoče
00050000-56ab-4580-0a20-4e04b73594cf	9205	Hodoš/Hodos
00050000-56ab-4580-28e5-637957f58fa4	1354	Horjul
00050000-56ab-4580-2d71-1337ae8c1962	1372	Hotedršica
00050000-56ab-4580-2878-d9770f1f1544	1430	Hrastnik
00050000-56ab-4580-6ab5-6be89e5a7a9e	6225	Hruševje
00050000-56ab-4580-8348-b850af5c5b8e	4276	Hrušica
00050000-56ab-4580-ac28-62f4c15ecbae	5280	Idrija
00050000-56ab-4580-3378-b0cd66265965	1292	Ig
00050000-56ab-4580-5eb9-2b18d6c45e14	6250	Ilirska Bistrica
00050000-56ab-4580-2b60-6f79f62f75ab	6251	Ilirska Bistrica-Trnovo
00050000-56ab-4580-ba81-1e93d63c8064	1295	Ivančna Gorica
00050000-56ab-4580-a826-cc9f79f3088d	2259	Ivanjkovci
00050000-56ab-4580-78c2-0a5b9680d447	1411	Izlake
00050000-56ab-4580-56a3-ad4e47533a87	6310	Izola/Isola
00050000-56ab-4580-86dc-763cb51265bc	2222	Jakobski Dol
00050000-56ab-4580-d35f-3039eb72dd88	2221	Jarenina
00050000-56ab-4580-3c8d-2d65c43b06aa	6254	Jelšane
00050000-56ab-4580-a57f-c10c3d308633	4270	Jesenice
00050000-56ab-4580-1160-9fdf320110a0	8261	Jesenice na Dolenjskem
00050000-56ab-4580-d5b0-2387f8f24c00	3273	Jurklošter
00050000-56ab-4580-197f-77c302353874	2223	Jurovski Dol
00050000-56ab-4580-43d6-ea1336435f64	2256	Juršinci
00050000-56ab-4580-73a6-f75e9971b9e0	5214	Kal nad Kanalom
00050000-56ab-4580-1259-36feb5954008	3233	Kalobje
00050000-56ab-4580-1789-d21faf41192e	4246	Kamna Gorica
00050000-56ab-4580-5c68-4ee9498ec74a	2351	Kamnica
00050000-56ab-4580-b9a5-2049031b800e	1241	Kamnik
00050000-56ab-4580-3914-16cef52a2cb3	5213	Kanal
00050000-56ab-4580-745d-33c1df07659c	8258	Kapele
00050000-56ab-4580-7d68-7a8a26baf54d	2362	Kapla
00050000-56ab-4580-e524-b1b2d3f92544	2325	Kidričevo
00050000-56ab-4580-aafc-eb93ce955e4f	1412	Kisovec
00050000-56ab-4580-8768-e036426168a9	6253	Knežak
00050000-56ab-4580-a6ff-a1482cf8a254	5222	Kobarid
00050000-56ab-4580-053a-6ef5ac4f179a	9227	Kobilje
00050000-56ab-4580-66fc-83d3d7d25b27	1330	Kočevje
00050000-56ab-4580-d4cc-68f14717d1f0	1338	Kočevska Reka
00050000-56ab-4580-1c1e-6653b0bada3d	2276	Kog
00050000-56ab-4580-6957-6623937dce2f	5211	Kojsko
00050000-56ab-4580-9a36-d9c284b91f50	6223	Komen
00050000-56ab-4580-2e2b-7ac20d395af6	1218	Komenda
00050000-56ab-4580-f251-7dff62f7ff3f	6000	Koper/Capodistria 
00050000-56ab-4580-542a-06187258d31d	6001	Koper/Capodistria - poštni predali
00050000-56ab-4580-d5c1-59fbce89cc78	8282	Koprivnica
00050000-56ab-4580-d3d8-31d89ab376e5	5296	Kostanjevica na Krasu
00050000-56ab-4580-9998-608d8e2996fe	8311	Kostanjevica na Krki
00050000-56ab-4580-8830-42cb606efd9a	1336	Kostel
00050000-56ab-4580-4a7c-7a819298d04e	6256	Košana
00050000-56ab-4580-0041-e8492a721715	2394	Kotlje
00050000-56ab-4580-a5be-43682233cba9	6240	Kozina
00050000-56ab-4580-aff8-2937f963b692	3260	Kozje
00050000-56ab-4580-84b6-7b755cacf1b4	4000	Kranj 
00050000-56ab-4580-e204-edeaee44acf7	4001	Kranj - poštni predali
00050000-56ab-4580-6e7b-b473152f9808	4280	Kranjska Gora
00050000-56ab-4580-126d-a82c7b16da28	1281	Kresnice
00050000-56ab-4580-fdfb-c6ae5f2089b4	4294	Križe
00050000-56ab-4580-398e-4a6696aae5f0	9206	Križevci
00050000-56ab-4580-1042-17074226522d	9242	Križevci pri Ljutomeru
00050000-56ab-4580-c0c8-8a18c11ffdfd	1301	Krka
00050000-56ab-4580-4807-fdc8575c2e6c	8296	Krmelj
00050000-56ab-4580-1873-36f9ea539178	4245	Kropa
00050000-56ab-4580-79c7-b1703ebd7d8b	8262	Krška vas
00050000-56ab-4580-d747-6e11cfeb8e42	8270	Krško
00050000-56ab-4580-04a9-eb6148f5d8cd	9263	Kuzma
00050000-56ab-4580-fde7-cd6d210eae89	2318	Laporje
00050000-56ab-4580-b500-87758730958c	3270	Laško
00050000-56ab-4580-fbea-db2da884a1f8	1219	Laze v Tuhinju
00050000-56ab-4580-563f-73e87a8f51b3	2230	Lenart v Slovenskih goricah
00050000-56ab-4580-2c2c-08dc6c5b0cbf	9220	Lendava/Lendva
00050000-56ab-4580-18ef-a1d8163af655	4248	Lesce
00050000-56ab-4580-d07a-5827ce18ef0a	3261	Lesično
00050000-56ab-4580-27a6-a545f1c70923	8273	Leskovec pri Krškem
00050000-56ab-4580-c13e-c364228ec9aa	2372	Libeliče
00050000-56ab-4580-5b09-197653d7160e	2341	Limbuš
00050000-56ab-4580-2861-aada2c82e175	1270	Litija
00050000-56ab-4580-4171-ace3d8da9661	3202	Ljubečna
00050000-56ab-4580-637e-ea7dc7049fd2	1000	Ljubljana 
00050000-56ab-4580-24e7-7b0000be4dc4	1001	Ljubljana - poštni predali
00050000-56ab-4580-7b64-1b41fed2a8ab	1231	Ljubljana - Črnuče
00050000-56ab-4580-d346-9c256ab693ec	1261	Ljubljana - Dobrunje
00050000-56ab-4580-2aeb-fc73ceadaac2	1260	Ljubljana - Polje
00050000-56ab-4580-75a1-64d09e4018c4	1210	Ljubljana - Šentvid
00050000-56ab-4580-8438-0769789c6f06	1211	Ljubljana - Šmartno
00050000-56ab-4580-6d3e-cdcf24bfb4ed	3333	Ljubno ob Savinji
00050000-56ab-4580-5a2c-d8e6d3f8b1fa	9240	Ljutomer
00050000-56ab-4580-731a-53223e90d0a2	3215	Loče
00050000-56ab-4580-0e84-a1dc0072bca0	5231	Log pod Mangartom
00050000-56ab-4580-edfe-2eff73d07ae6	1358	Log pri Brezovici
00050000-56ab-4580-18c3-c78c9ed9d6d5	1370	Logatec
00050000-56ab-4580-e4be-a7c2dc6b0e37	1371	Logatec
00050000-56ab-4580-48f3-8edc680488de	1434	Loka pri Zidanem Mostu
00050000-56ab-4580-7062-a48edd28a778	3223	Loka pri Žusmu
00050000-56ab-4580-1b2a-db9c982b034c	6219	Lokev
00050000-56ab-4580-0101-ad4e29931f33	1318	Loški Potok
00050000-56ab-4580-f1f8-5f9e74d3a6cb	2324	Lovrenc na Dravskem polju
00050000-56ab-4580-935a-372c8d729589	2344	Lovrenc na Pohorju
00050000-56ab-4580-e960-ab83f7820169	3334	Luče
00050000-56ab-4580-0653-2c8061c29e8c	1225	Lukovica
00050000-56ab-4580-ca56-bde1e0a019ae	9202	Mačkovci
00050000-56ab-4580-2be0-90da7e5390a1	2322	Majšperk
00050000-56ab-4580-1ec3-5911ee9e04c2	2321	Makole
00050000-56ab-4580-868f-835defdb9032	9243	Mala Nedelja
00050000-56ab-4580-2497-8366c2a9a7e2	2229	Malečnik
00050000-56ab-4580-bd01-7067242a09d1	6273	Marezige
00050000-56ab-4580-3304-efa57ea0b5cf	2000	Maribor 
00050000-56ab-4580-b3c8-744de9fdf224	2001	Maribor - poštni predali
00050000-56ab-4580-1c0b-acd9b0ced8a9	2206	Marjeta na Dravskem polju
00050000-56ab-4580-c3e1-bcc62fffc56a	2281	Markovci
00050000-56ab-4580-ab58-d96a4505a11b	9221	Martjanci
00050000-56ab-4580-a2db-5a4f8a194bca	6242	Materija
00050000-56ab-4580-f0eb-d55d20e66f5e	4211	Mavčiče
00050000-56ab-4580-471f-f8c0fdf3d58d	1215	Medvode
00050000-56ab-4580-9db5-48f3dbf4088f	1234	Mengeš
00050000-56ab-4580-a943-848b894208c8	8330	Metlika
00050000-56ab-4580-5f6f-d6acc3d35621	2392	Mežica
00050000-56ab-4580-e74e-9f955fb353bd	2204	Miklavž na Dravskem polju
00050000-56ab-4580-b69d-4c6fa93d1399	2275	Miklavž pri Ormožu
00050000-56ab-4580-d679-f81567392dd1	5291	Miren
00050000-56ab-4580-dcc9-32785a11c131	8233	Mirna
00050000-56ab-4580-cc40-fbd2693deb80	8216	Mirna Peč
00050000-56ab-4580-5a05-34ba2930b1d8	2382	Mislinja
00050000-56ab-4580-06b7-d8eb2a9d4f8e	4281	Mojstrana
00050000-56ab-4580-9c7d-4a99a6107228	8230	Mokronog
00050000-56ab-4580-7a7e-28ab338c4ed3	1251	Moravče
00050000-56ab-4580-d82f-e7cd23531e3a	9226	Moravske Toplice
00050000-56ab-4580-248a-13a040bd2348	5216	Most na Soči
00050000-56ab-4580-b4ff-ba98a4195640	1221	Motnik
00050000-56ab-4580-771a-e7646d43c303	3330	Mozirje
00050000-56ab-4580-923c-786c7e5fa702	9000	Murska Sobota 
00050000-56ab-4580-d853-ab5bd37796b3	9001	Murska Sobota - poštni predali
00050000-56ab-4580-cd58-518708b3e5e6	2366	Muta
00050000-56ab-4580-8732-3c79a48e0a29	4202	Naklo
00050000-56ab-4580-5297-bdc708f275e3	3331	Nazarje
00050000-56ab-4580-5447-248a9bb3d7b5	1357	Notranje Gorice
00050000-56ab-4580-b601-95aadad35b59	3203	Nova Cerkev
00050000-56ab-4580-8277-cf1c74869751	5000	Nova Gorica 
00050000-56ab-4580-d84a-d23902e0841a	5001	Nova Gorica - poštni predali
00050000-56ab-4580-9ba6-6e03c5078312	1385	Nova vas
00050000-56ab-4580-4f1e-d9bb2244d0b9	8000	Novo mesto
00050000-56ab-4580-8f67-c7856c269e32	8001	Novo mesto - poštni predali
00050000-56ab-4580-f584-6f1b6b959e22	6243	Obrov
00050000-56ab-4580-e7ad-3626371b7f55	9233	Odranci
00050000-56ab-4580-3ee3-14c3d95fe637	2317	Oplotnica
00050000-56ab-4580-e026-eb1227b4ba8d	2312	Orehova vas
00050000-56ab-4580-705b-69aaa6c278b7	2270	Ormož
00050000-56ab-4580-957f-5d6d2b05395e	1316	Ortnek
00050000-56ab-4580-690c-62d20ba9ae50	1337	Osilnica
00050000-56ab-4580-f005-b9729a690bb7	8222	Otočec
00050000-56ab-4580-d4ac-65d7acd29c72	2361	Ožbalt
00050000-56ab-4580-3b1c-d2370087a710	2231	Pernica
00050000-56ab-4580-6feb-017d2d6c67d1	2211	Pesnica pri Mariboru
00050000-56ab-4580-27ac-adbc213c4979	9203	Petrovci
00050000-56ab-4580-c156-314bd2bc77aa	3301	Petrovče
00050000-56ab-4580-4d84-e52374856cb2	6330	Piran/Pirano
00050000-56ab-4580-082a-424f5270ee9a	8255	Pišece
00050000-56ab-4580-d522-1f7f1436735e	6257	Pivka
00050000-56ab-4580-ded5-90430a3e9b0a	6232	Planina
00050000-56ab-4580-4964-c883f0bac9c0	3225	Planina pri Sevnici
00050000-56ab-4580-5b57-ce15c5ad95f1	6276	Pobegi
00050000-56ab-4580-b5bf-276877f7e0b7	8312	Podbočje
00050000-56ab-4580-c377-a507629c8273	5243	Podbrdo
00050000-56ab-4580-c8a9-58949c705143	3254	Podčetrtek
00050000-56ab-4580-e066-61df2a268e4f	2273	Podgorci
00050000-56ab-4580-0712-18d91717e53e	6216	Podgorje
00050000-56ab-4580-524f-507fe14d241c	2381	Podgorje pri Slovenj Gradcu
00050000-56ab-4580-822b-c74a4d8db193	6244	Podgrad
00050000-56ab-4580-25cf-5375d1935253	1414	Podkum
00050000-56ab-4580-362e-ebfa0dac6f97	2286	Podlehnik
00050000-56ab-4580-431d-7d7fd585f8b3	5272	Podnanos
00050000-56ab-4580-6ca5-a3f1876d0f59	4244	Podnart
00050000-56ab-4580-c14d-3280105e01bb	3241	Podplat
00050000-56ab-4580-7df9-b5a172482c76	3257	Podsreda
00050000-56ab-4580-bb82-e31346778fad	2363	Podvelka
00050000-56ab-4580-f413-937c3a316b15	2208	Pohorje
00050000-56ab-4580-c9eb-a80f9e43a529	2257	Polenšak
00050000-56ab-4580-2e10-68944af7255d	1355	Polhov Gradec
00050000-56ab-4580-05eb-679f4b4c4e6d	4223	Poljane nad Škofjo Loko
00050000-56ab-4580-3f23-bb58a1b01c65	2319	Poljčane
00050000-56ab-4580-92f6-5a6d867804e7	1272	Polšnik
00050000-56ab-4580-cbbe-c5f19144c09a	3313	Polzela
00050000-56ab-4580-5f7d-a8d9dfd99f11	3232	Ponikva
00050000-56ab-4580-35ab-38fbefb50719	6320	Portorož/Portorose
00050000-56ab-4580-0b94-8f568bbf8c3d	6230	Postojna
00050000-56ab-4580-d354-d994ef332d82	2331	Pragersko
00050000-56ab-4580-5da2-82a13f194229	3312	Prebold
00050000-56ab-4580-0e73-1a8f14c67359	4205	Preddvor
00050000-56ab-4580-7227-b43a38f017a7	6255	Prem
00050000-56ab-4580-a918-82ca56ff721d	1352	Preserje
00050000-56ab-4580-f2b9-e23cc015695e	6258	Prestranek
00050000-56ab-4580-0810-2384c452199c	2391	Prevalje
00050000-56ab-4580-f074-820993286b5d	3262	Prevorje
00050000-56ab-4580-2a1a-6a1e7cfccc60	1276	Primskovo 
00050000-56ab-4580-9b5c-a618e18cf479	3253	Pristava pri Mestinju
00050000-56ab-4580-1ca9-b1623d00cc1f	9207	Prosenjakovci/Partosfalva
00050000-56ab-4580-bde4-8f5ee64b0073	5297	Prvačina
00050000-56ab-4580-19f8-dc451f279577	2250	Ptuj
00050000-56ab-4580-5d34-1220d308efce	2323	Ptujska Gora
00050000-56ab-4580-2f8f-e4b77d3e15be	9201	Puconci
00050000-56ab-4580-0750-844381f9f110	2327	Rače
00050000-56ab-4580-d796-e0d6b3243919	1433	Radeče
00050000-56ab-4580-c89c-e45be986b05b	9252	Radenci
00050000-56ab-4580-eb30-2ba23db4c1bf	2360	Radlje ob Dravi
00050000-56ab-4580-5d75-8522a5ecc411	1235	Radomlje
00050000-56ab-4580-84fe-938eca8b2a3c	4240	Radovljica
00050000-56ab-4580-4094-53a9a78abae5	8274	Raka
00050000-56ab-4580-671c-221187e17140	1381	Rakek
00050000-56ab-4580-fe78-ffe196f22619	4283	Rateče - Planica
00050000-56ab-4580-fcd3-27bd203caf37	2390	Ravne na Koroškem
00050000-56ab-4580-c395-da7a3fc19873	9246	Razkrižje
00050000-56ab-4580-be27-b34677dd0f4b	3332	Rečica ob Savinji
00050000-56ab-4580-2255-7548255f5f5f	5292	Renče
00050000-56ab-4580-6942-2559a8d6319f	1310	Ribnica
00050000-56ab-4580-06b4-35444a68335c	2364	Ribnica na Pohorju
00050000-56ab-4580-17ff-dab19d922004	3272	Rimske Toplice
00050000-56ab-4580-f25d-d24007cbca3c	1314	Rob
00050000-56ab-4580-1b43-ad6c438e3450	5215	Ročinj
00050000-56ab-4580-52ac-be771db04963	3250	Rogaška Slatina
00050000-56ab-4580-82e6-83fae48bae85	9262	Rogašovci
00050000-56ab-4580-0f98-85531036e7f2	3252	Rogatec
00050000-56ab-4580-e13c-55e2c5bab731	1373	Rovte
00050000-56ab-4580-f077-eb34f9329df1	2342	Ruše
00050000-56ab-4580-0d66-29485e231313	1282	Sava
00050000-56ab-4580-e921-0c7eafe61b71	6333	Sečovlje/Sicciole
00050000-56ab-4580-447f-f6770a6f362b	4227	Selca
00050000-56ab-4580-2cd3-7f6f2c54eddc	2352	Selnica ob Dravi
00050000-56ab-4580-7e51-664b8c130bb2	8333	Semič
00050000-56ab-4580-762e-f4739c8b690d	8281	Senovo
00050000-56ab-4580-04b7-9be9d9bb9bd6	6224	Senožeče
00050000-56ab-4580-fb10-bcbd12a1976c	8290	Sevnica
00050000-56ab-4580-dd4b-8da64b5a284e	6210	Sežana
00050000-56ab-4580-51b0-9c19d7ce6b39	2214	Sladki Vrh
00050000-56ab-4580-6403-f02cd35b1cec	5283	Slap ob Idrijci
00050000-56ab-4580-e7ed-f237d33fc2cc	2380	Slovenj Gradec
00050000-56ab-4580-9346-e3fb5b84ce4d	2310	Slovenska Bistrica
00050000-56ab-4580-59fd-f3f0f719f093	3210	Slovenske Konjice
00050000-56ab-4580-a5da-73659be8be30	1216	Smlednik
00050000-56ab-4580-05f1-022bb3e2882f	5232	Soča
00050000-56ab-4580-71a0-f46d9dc9b25e	1317	Sodražica
00050000-56ab-4580-8c2d-8adcf5662546	3335	Solčava
00050000-56ab-4580-e02f-23c0e783c5b9	5250	Solkan
00050000-56ab-4580-16c3-358d7dc9bacd	4229	Sorica
00050000-56ab-4580-773a-0b7ce3a93692	4225	Sovodenj
00050000-56ab-4580-e10c-47191f844c01	5281	Spodnja Idrija
00050000-56ab-4580-4fe4-ae9ac0665dd4	2241	Spodnji Duplek
00050000-56ab-4580-a77f-0ebf99af3773	9245	Spodnji Ivanjci
00050000-56ab-4580-db7d-b25c25b933d9	2277	Središče ob Dravi
00050000-56ab-4580-dbc5-e45aa49087ac	4267	Srednja vas v Bohinju
00050000-56ab-4580-73e0-287eaee163ca	8256	Sromlje 
00050000-56ab-4580-2ac3-19eaba92f650	5224	Srpenica
00050000-56ab-4580-f38f-60b8e93bc67d	1242	Stahovica
00050000-56ab-4580-934f-175408823a80	1332	Stara Cerkev
00050000-56ab-4580-ebfe-9b42eec2fa52	8342	Stari trg ob Kolpi
00050000-56ab-4580-ea98-60649e1f6aad	1386	Stari trg pri Ložu
00050000-56ab-4580-e6f9-2e8ee2e859c4	2205	Starše
00050000-56ab-4580-a638-c664f21679f2	2289	Stoperce
00050000-56ab-4580-96ba-e47c96f8ff63	8322	Stopiče
00050000-56ab-4580-24a8-6b87adc3e86a	3206	Stranice
00050000-56ab-4580-935a-51b917470e36	8351	Straža
00050000-56ab-4580-3496-b9ac68f8b14e	1313	Struge
00050000-56ab-4580-528b-eccdb16069af	8293	Studenec
00050000-56ab-4580-6323-8cff6ce13775	8331	Suhor
00050000-56ab-4580-9d2f-e7047d425e46	2233	Sv. Ana v Slovenskih goricah
00050000-56ab-4580-4ee1-f180869b81e3	2235	Sv. Trojica v Slovenskih goricah
00050000-56ab-4580-be14-5f90ef202f87	2353	Sveti Duh na Ostrem Vrhu
00050000-56ab-4580-82a0-30b6487c75af	9244	Sveti Jurij ob Ščavnici
00050000-56ab-4580-0603-ccbecc4806c5	3264	Sveti Štefan
00050000-56ab-4580-d551-14d1bbfba515	2258	Sveti Tomaž
00050000-56ab-4580-92aa-634d0831aea4	9204	Šalovci
00050000-56ab-4580-c1c9-360c23014c7d	5261	Šempas
00050000-56ab-4580-0e9c-f7c1dd299736	5290	Šempeter pri Gorici
00050000-56ab-4580-ffdc-ecf5c7ac1b38	3311	Šempeter v Savinjski dolini
00050000-56ab-4580-c6a4-40375ca08bc4	4208	Šenčur
00050000-56ab-4580-d6c3-14e59bb15227	2212	Šentilj v Slovenskih goricah
00050000-56ab-4580-581b-54a219fa09fa	8297	Šentjanž
00050000-56ab-4580-f963-585c0a3ae2c0	2373	Šentjanž pri Dravogradu
00050000-56ab-4580-9145-26ca7c472fa2	8310	Šentjernej
00050000-56ab-4580-203d-cb1673b76af3	3230	Šentjur
00050000-56ab-4580-f4c9-bf47c2ade8f0	3271	Šentrupert
00050000-56ab-4580-5742-0f26cbfa0b21	8232	Šentrupert
00050000-56ab-4580-16f6-829cf600b193	1296	Šentvid pri Stični
00050000-56ab-4580-3623-ca44aa5061c0	8275	Škocjan
00050000-56ab-4580-378a-35fe94cf1fd3	6281	Škofije
00050000-56ab-4580-7b19-ba446704a406	4220	Škofja Loka
00050000-56ab-4580-3a9d-faea6ac9cc39	3211	Škofja vas
00050000-56ab-4580-b12e-3f61a744aa32	1291	Škofljica
00050000-56ab-4580-a990-eba3c4edd5ba	6274	Šmarje
00050000-56ab-4580-d957-3db99394e7ef	1293	Šmarje - Sap
00050000-56ab-4580-1302-7a14a89bb8a2	3240	Šmarje pri Jelšah
00050000-56ab-4580-a9a9-3a2eb49af55f	8220	Šmarješke Toplice
00050000-56ab-4580-deb3-31a9dc4b3cd1	2315	Šmartno na Pohorju
00050000-56ab-4580-5022-18ea9d41fe28	3341	Šmartno ob Dreti
00050000-56ab-4580-847a-70117dcb5cbd	3327	Šmartno ob Paki
00050000-56ab-4580-156a-f1e37bba6001	1275	Šmartno pri Litiji
00050000-56ab-4580-7577-2ee3c8535593	2383	Šmartno pri Slovenj Gradcu
00050000-56ab-4580-b847-c141dde39c2a	3201	Šmartno v Rožni dolini
00050000-56ab-4580-b018-28e6ca519d86	3325	Šoštanj
00050000-56ab-4580-7970-85b327b13631	6222	Štanjel
00050000-56ab-4580-4f49-5d9b35269fa2	3220	Štore
00050000-56ab-4580-dbae-53d9e4c139a8	3304	Tabor
00050000-56ab-4580-450a-7962b9473330	3221	Teharje
00050000-56ab-4580-98d3-8508c262adda	9251	Tišina
00050000-56ab-4580-2a46-ee9294aafa91	5220	Tolmin
00050000-56ab-4580-2370-fbd90603f618	3326	Topolšica
00050000-56ab-4580-8b38-d9cab5f6aaed	2371	Trbonje
00050000-56ab-4580-c833-eeaf2e1e7e33	1420	Trbovlje
00050000-56ab-4580-ddd1-2a9fac6c1acc	8231	Trebelno 
00050000-56ab-4580-fa3d-b20fc3042b2f	8210	Trebnje
00050000-56ab-4580-1cd0-047ba7e4701d	5252	Trnovo pri Gorici
00050000-56ab-4580-754a-791f9f67ec08	2254	Trnovska vas
00050000-56ab-4580-c59b-d897547c4204	1222	Trojane
00050000-56ab-4580-6aa5-b791794c766d	1236	Trzin
00050000-56ab-4580-756b-8ee0425fe029	4290	Tržič
00050000-56ab-4580-12a1-be4f67c9ac55	8295	Tržišče
00050000-56ab-4580-7fb7-a0c8363f1aaa	1311	Turjak
00050000-56ab-4580-ea95-275b5d828d0a	9224	Turnišče
00050000-56ab-4580-012f-2b238450e2d1	8323	Uršna sela
00050000-56ab-4580-66a0-d8fad250a8a2	1252	Vače
00050000-56ab-4580-a978-100514e623ff	3320	Velenje 
00050000-56ab-4580-d2e9-6faf87c145e8	3322	Velenje - poštni predali
00050000-56ab-4580-71b4-8607f12366ca	8212	Velika Loka
00050000-56ab-4580-a353-1ec6df0cc5af	2274	Velika Nedelja
00050000-56ab-4580-19f8-9073191b47ce	9225	Velika Polana
00050000-56ab-4580-4aec-e42d8c195302	1315	Velike Lašče
00050000-56ab-4580-6cbd-d67b96ee858a	8213	Veliki Gaber
00050000-56ab-4580-2179-ae50255542a3	9241	Veržej
00050000-56ab-4580-daf1-a389bc25f4fc	1312	Videm - Dobrepolje
00050000-56ab-4580-8100-748a433adc62	2284	Videm pri Ptuju
00050000-56ab-4580-2949-de33bcd404db	8344	Vinica
00050000-56ab-4580-1f7e-3c95ad98213d	5271	Vipava
00050000-56ab-4580-eeaf-73d65f54218f	4212	Visoko
00050000-56ab-4580-e09a-c57d5505b3af	1294	Višnja Gora
00050000-56ab-4580-6f66-98a1e18ec442	3205	Vitanje
00050000-56ab-4580-2a88-6c5465f6a134	2255	Vitomarci
00050000-56ab-4580-d08e-2ec05e369a8a	1217	Vodice
00050000-56ab-4580-dd7a-3698bec2322b	3212	Vojnik\t
00050000-56ab-4580-e58e-17941ec378df	5293	Volčja Draga
00050000-56ab-4580-13c0-7834f35649ce	2232	Voličina
00050000-56ab-4580-c73a-b3243ee47f5f	3305	Vransko
00050000-56ab-4580-35e0-f1249c26fbd9	6217	Vremski Britof
00050000-56ab-4580-7d8d-1ec452b07b1f	1360	Vrhnika
00050000-56ab-4580-0fea-7165d913e780	2365	Vuhred
00050000-56ab-4580-abac-e0b0ee48cf48	2367	Vuzenica
00050000-56ab-4580-c42e-e056ddb9d6ad	8292	Zabukovje 
00050000-56ab-4580-2cb0-caabfc8328a8	1410	Zagorje ob Savi
00050000-56ab-4580-95c7-9d0f6c6cb019	1303	Zagradec
00050000-56ab-4580-94c5-208ab368ae95	2283	Zavrč
00050000-56ab-4580-b500-df7970d0790c	8272	Zdole 
00050000-56ab-4580-4daa-9f69cc35d3cc	4201	Zgornja Besnica
00050000-56ab-4580-7dc9-eba18fae0078	2242	Zgornja Korena
00050000-56ab-4580-4a70-0b18e977827f	2201	Zgornja Kungota
00050000-56ab-4580-1a5f-b6d8cc779c72	2316	Zgornja Ložnica
00050000-56ab-4580-dfa1-cc89d0829c87	2314	Zgornja Polskava
00050000-56ab-4580-ecbf-7143ec276828	2213	Zgornja Velka
00050000-56ab-4580-e337-a4491489eeb7	4247	Zgornje Gorje
00050000-56ab-4580-624f-3caeaa0f5bd3	4206	Zgornje Jezersko
00050000-56ab-4580-316a-4c622f1db546	2285	Zgornji Leskovec
00050000-56ab-4580-2459-73ea3012db25	1432	Zidani Most
00050000-56ab-4580-12c0-9fbf29edb504	3214	Zreče
00050000-56ab-4580-c3eb-77a84fb9cfdc	4209	Žabnica
00050000-56ab-4580-635c-388ad53038fd	3310	Žalec
00050000-56ab-4580-e810-b3291f6371c5	4228	Železniki
00050000-56ab-4580-a689-8cf01fbba06a	2287	Žetale
00050000-56ab-4580-737e-afd1ae37f1c0	4226	Žiri
00050000-56ab-4580-d1e5-cdfe77bfcbf7	4274	Žirovnica
00050000-56ab-4580-0e92-1fb85ca69365	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 41739630)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 41739200)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 41738940)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56ab-4584-7672-a3d041518fd9	00080000-56ab-4584-28b8-3dbe0ff58817	\N	00040000-56ab-4581-a02d-b7b2beaf920e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56ab-4584-164d-617b78383d79	00080000-56ab-4584-28b8-3dbe0ff58817	\N	00040000-56ab-4581-a02d-b7b2beaf920e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56ab-4584-e558-2917c8a79421	00080000-56ab-4584-dc86-566b91f934fc	\N	00040000-56ab-4581-a02d-b7b2beaf920e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 41739075)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56ab-4581-2ae9-1223772d52f8	novo leto	1	1	\N	t
00430000-56ab-4581-1fba-a4ddc74cffa7	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56ab-4581-269c-401d5a12454a	dan upora proti okupatorju	27	4	\N	t
00430000-56ab-4581-bb51-0a1b6ff025bb	praznik dela	1	5	\N	t
00430000-56ab-4581-374e-786f40b848ca	praznik dela	2	5	\N	t
00430000-56ab-4581-f891-db95f2a04911	dan Primoža Trubarja	8	6	\N	f
00430000-56ab-4581-544e-784df1a336bb	dan državnosti	25	6	\N	t
00430000-56ab-4581-c7b3-9018d765df06	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56ab-4581-7605-d9cdde8d4132	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56ab-4581-228f-b1311e563c00	dan suverenosti	25	10	\N	f
00430000-56ab-4581-f580-3f3f454629f4	dan spomina na mrtve	1	11	\N	t
00430000-56ab-4581-5809-e317f7c0a817	dan Rudolfa Maistra	23	11	\N	f
00430000-56ab-4581-3cb3-e68f757c4f34	božič	25	12	\N	t
00430000-56ab-4581-efb6-27066537beb6	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56ab-4581-2a1d-82405902190b	Marijino vnebovzetje	15	8	\N	t
00430000-56ab-4581-b145-61f5ff4efc36	dan reformacije	31	10	\N	t
00430000-56ab-4581-5006-b9a060f4fbe3	velikonočna nedelja	27	3	2016	t
00430000-56ab-4581-398b-5b3181d7519c	velikonočna nedelja	16	4	2017	t
00430000-56ab-4581-bd36-97808576e29d	velikonočna nedelja	1	4	2018	t
00430000-56ab-4581-624d-f2105b6cda2d	velikonočna nedelja	21	4	2019	t
00430000-56ab-4581-7eac-395d03abfcfc	velikonočna nedelja	12	4	2020	t
00430000-56ab-4581-f373-0b84113ece04	velikonočna nedelja	4	4	2021	t
00430000-56ab-4581-3a56-d7e07643be22	velikonočna nedelja	17	4	2022	t
00430000-56ab-4581-bdc3-be22e50ed28b	velikonočna nedelja	9	4	2023	t
00430000-56ab-4581-78d1-5f737aacabad	velikonočna nedelja	31	3	2024	t
00430000-56ab-4581-d5aa-81ba6d3654f3	velikonočna nedelja	20	4	2025	t
00430000-56ab-4581-fe72-36902c0480d5	velikonočna nedelja	5	4	2026	t
00430000-56ab-4581-7d21-73dfdf7866c5	velikonočna nedelja	28	3	2027	t
00430000-56ab-4581-0887-216dfdc1b781	velikonočna nedelja	16	4	2028	t
00430000-56ab-4581-b903-60c1449d6cdd	velikonočna nedelja	1	4	2029	t
00430000-56ab-4581-0bc1-e034eb42f2e9	velikonočna nedelja	21	4	2030	t
00430000-56ab-4581-e026-ad697837894b	velikonočni ponedeljek	28	3	2016	t
00430000-56ab-4581-e435-c61fd83bdc2e	velikonočni ponedeljek	17	4	2017	t
00430000-56ab-4581-f295-1825f328d431	velikonočni ponedeljek	2	4	2018	t
00430000-56ab-4581-f818-329894dc3046	velikonočni ponedeljek	22	4	2019	t
00430000-56ab-4581-a571-2e155a06988c	velikonočni ponedeljek	13	4	2020	t
00430000-56ab-4581-5cd4-ef6cd8e662e3	velikonočni ponedeljek	5	4	2021	t
00430000-56ab-4581-92d2-f66e8017aec3	velikonočni ponedeljek	18	4	2022	t
00430000-56ab-4581-e846-f212a743a62e	velikonočni ponedeljek	10	4	2023	t
00430000-56ab-4581-b15a-c4d3b2a31795	velikonočni ponedeljek	1	4	2024	t
00430000-56ab-4581-7cd2-b235be78a7ad	velikonočni ponedeljek	21	4	2025	t
00430000-56ab-4581-1b7c-761e64ea6f22	velikonočni ponedeljek	6	4	2026	t
00430000-56ab-4581-5d10-baeccecb14af	velikonočni ponedeljek	29	3	2027	t
00430000-56ab-4581-7914-aca5cd3b8c2a	velikonočni ponedeljek	17	4	2028	t
00430000-56ab-4581-a5ab-2b75294581e4	velikonočni ponedeljek	2	4	2029	t
00430000-56ab-4581-0045-7ebc6c1d8b8f	velikonočni ponedeljek	22	4	2030	t
00430000-56ab-4581-f256-05f018825a8a	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56ab-4581-9012-5649c68478b6	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56ab-4581-5cd7-f78b1a8e2ded	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56ab-4581-c4da-ae12eb9f75f0	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56ab-4581-eacf-b1b92e63d1a8	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56ab-4581-1fea-d7a0371d5429	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56ab-4581-f762-678073f4f533	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56ab-4581-aef0-219be57caeb7	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56ab-4581-b323-15343147b081	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56ab-4581-50f7-266d8d00bed4	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56ab-4581-c121-09cbb1de51ab	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56ab-4581-cceb-774d5901a150	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56ab-4581-48af-df0720f4bc82	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56ab-4581-f83a-740b2f0818c6	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56ab-4581-1f9c-900592f347d9	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 41739044)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56ab-4585-85cc-470bb4256dc1	000e0000-56ab-4584-af07-f3e64494e07e	1	1	\N
001b0000-56ab-4585-0b03-8a95895b35e0	000e0000-56ab-4584-af07-f3e64494e07e	1	2	\N
001b0000-56ab-4585-86c7-4a4ee555de2b	000e0000-56ab-4584-af07-f3e64494e07e	1	3	1
001b0000-56ab-4585-7259-e25211d7bf75	000e0000-56ab-4584-af07-f3e64494e07e	2	4	2
001b0000-56ab-4585-8fb6-068f6db05cde	000e0000-56ab-4584-af07-f3e64494e07e	4	5	3
001b0000-56ab-4585-8cab-742948d8ed8b	000e0000-56ab-4584-8e49-4f7ce73d014d	1	1	\N
001b0000-56ab-4585-11f5-b65feaa7fcf6	000e0000-56ab-4584-8e49-4f7ce73d014d	3	2	1
001b0000-56ab-4585-2997-bb62affffc68	000e0000-56ab-4584-8e49-4f7ce73d014d	1	5	1
001b0000-56ab-4585-7c76-b83d6b55bd0a	000e0000-56ab-4584-af07-f3e64494e07e	1	6	1
001b0000-56ab-4585-09c7-78a99dc31c31	000e0000-56ab-4584-af07-f3e64494e07e	2	7	2
001b0000-56ab-4585-13a9-deacbf570b51	000e0000-56ab-4584-af07-f3e64494e07e	5	9	4
001b0000-56ab-4585-3d43-9826d4ede123	000e0000-56ab-4584-af07-f3e64494e07e	7	10	5
001b0000-56ab-4585-8d02-c2c63bde3dbf	000e0000-56ab-4584-8e49-4f7ce73d014d	4	3	1
001b0000-56ab-4585-7fc9-75f2adb1029c	000e0000-56ab-4584-af07-f3e64494e07e	3	8	3
001b0000-56ab-4585-b89f-cd31848f3201	000e0000-56ab-4584-af07-f3e64494e07e	2	11	1
001b0000-56ab-4585-5b53-83560c2f2514	000e0000-56ab-4584-8e49-4f7ce73d014d	6	4	2
\.


--
-- TOC entry 3161 (class 0 OID 41739050)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56ab-4585-86c7-4a4ee555de2b	000a0000-56ab-4584-bf59-588ca386c8df
001b0000-56ab-4585-86c7-4a4ee555de2b	000a0000-56ab-4584-e10e-e8ecd1b21fc8
001b0000-56ab-4585-7259-e25211d7bf75	000a0000-56ab-4584-e10e-e8ecd1b21fc8
001b0000-56ab-4585-7259-e25211d7bf75	000a0000-56ab-4584-2eef-1659790cf6ab
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 41739212)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 41739644)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 41739654)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56ab-4584-6f27-4e00fed5f516	00080000-56ab-4584-0f9f-dc56998955d7	0987	AK
00190000-56ab-4584-3663-96ed661e2212	00080000-56ab-4584-dc86-566b91f934fc	0989	AK
00190000-56ab-4584-5f31-17e955036a07	00080000-56ab-4584-b892-b342ab7e80dd	0986	AK
00190000-56ab-4584-8f9b-04579934fbcf	00080000-56ab-4584-72c5-32dd5409d804	0984	AK
00190000-56ab-4584-dc6b-63b6b75d91dd	00080000-56ab-4584-09b3-6430c6be3a48	0983	AK
00190000-56ab-4584-a48d-b6a0c77fa5e6	00080000-56ab-4584-71df-050159d45386	0982	AK
00190000-56ab-4587-06ef-22615d393b7f	00080000-56ab-4587-062a-64f3a16f950d	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 41739543)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56ab-4585-7971-7ca06b25aead	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 41739662)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 41739240)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56ab-4584-bb10-3784857ec6ef	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56ab-4584-d885-c019942e3ee5	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56ab-4584-3fb7-1f2fb872d645	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56ab-4584-a51f-27fd442ca07d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56ab-4584-1f4f-95c5660393b5	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56ab-4584-ea9e-77f4b4ba6c3b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56ab-4584-687f-b30156176483	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 41739185)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 41739175)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 41739382)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 41739312)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 41739018)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 41738779)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56ab-4587-062a-64f3a16f950d	00010000-56ab-4582-7fba-a91b167aa9af	2016-01-29 11:57:11	INS	a:0:{}
2	App\\Entity\\Option	00000000-56ab-4587-678e-3234335ec36e	00010000-56ab-4582-7fba-a91b167aa9af	2016-01-29 11:57:11	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56ab-4587-06ef-22615d393b7f	00010000-56ab-4582-7fba-a91b167aa9af	2016-01-29 11:57:11	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 41739254)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 41738817)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56ab-4581-7d08-62574eee0eb2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56ab-4581-bf19-3f523a249b47	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56ab-4581-a5bd-84219acd418d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56ab-4581-f525-8346b55c0420	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56ab-4581-aab6-837e6954fc99	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-4581-2c69-77aa75711f08	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-4581-ab0d-58f82d465a1d	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56ab-4581-df17-8d25b29a62d9	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56ab-4581-edb9-2bb06ffceff2	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-4581-fa88-3eea78031ae6	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-4581-39bd-21676688e46c	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-4581-4ceb-9bd8e764fe93	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-4581-3b05-5a21df9f2aad	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-4581-137a-2138b83fd197	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-4581-2c74-17017cb1fd12	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-4581-b27e-7a5089e83b3c	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-4581-4c0e-b1cfdbbcd37d	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56ab-4581-c1c7-9beab22d1a1d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56ab-4581-f264-14fec7655c24	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56ab-4581-8052-c5c1a690607c	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56ab-4581-8721-d24dee1c15b6	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-4581-bf06-28e9a18bf7bc	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-4581-8d8a-bc1e609bdb48	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-4581-0707-36aeab7a2d18	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-4581-3b88-2f5e8eb11e06	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56ab-4581-fb64-7476947cb3ec	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56ab-4581-4a84-fbc78944a00a	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56ab-4581-f8b6-43955241f5b2	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56ab-4581-1935-ffa8ea7cf064	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-4581-e81f-a6cbaa07651b	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-4581-a82a-181108419623	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-4582-c377-08433cb6a067	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-4582-d8d6-3a0e36d74fb0	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56ab-4582-26fe-6b8b5d643ec1	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56ab-4582-faae-2fa2ff22a8da	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56ab-4582-4b8a-9d48ea377f6d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56ab-4582-cfcd-cd0f5f9aa886	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-4582-f506-a5fa2c49ac84	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-4582-f35e-7d6ddf8c0d8d	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56ab-4582-30fd-b2b0675002ee	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-4582-34b5-1465b761e9de	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-4582-b347-cc25a4738ce2	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56ab-4582-fe64-e9ae14b6c6ea	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-4582-4118-b6d86a1c1532	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-4582-bb2c-ed1a5feb9c4b	direktor	minimalne pravice za direktorja	t
00020000-56ab-4582-d9b1-bc4e5f13a4b1	arhivar	arhivar	t
00020000-56ab-4582-385e-a9ff4c0af668	dramaturg	dramaturg	t
00020000-56ab-4582-1db5-a406590b8c35	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56ab-4582-acf4-567ac484010d	poslovni-sekretar	poslovni sekretar	t
00020000-56ab-4582-2df9-8358b2c135c3	vodja-tehnike	vodja tehnike	t
00020000-56ab-4582-84ae-cb912d563397	racunovodja	računovodja	t
00020000-56ab-4584-704b-132dfecafdf6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56ab-4584-8832-ba646383bae9	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-ffd4-a09db5de34a6	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-b025-ebea19aa994d	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-1393-d4e48fa86b7c	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-ae01-6aab70c973ff	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-a09f-0dc5f7b08a6a	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-8780-0f0e1b60a7d9	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-2200-9a4d28eadc3e	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-5321-940320f43449	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-b39b-f251c09d0f90	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-ce96-002aeb1deb03	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-774f-34b5476863bb	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-4806-f184508d59dd	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-063e-4bfecb288f48	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-a626-5ccfda4e9b89	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-4d2d-77633067640a	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-3eef-3a001ba25750	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-c754-53560606064b	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-e313-50b83bed622f	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56ab-4584-c8f2-7d809c430139	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-323a-620b7f928b60	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-f17c-92d848ad2fe5	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-56ff-20d9cc6882b3	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-7b47-9cdbcbfbd841	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-7b3d-778dd4986d3a	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-a9f5-043279a570eb	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-d4ca-6eb8b1df7e7b	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-7632-58ae59ce679a	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-5d80-f8d4ae950010	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-a9d6-276412b0769b	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-0e8e-1a8989cc846c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-1f01-830b994973fc	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-eb83-169fbed7c952	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-0c89-0a2f9cc92c34	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-4380-338e42d468e3	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-55c1-b7918c84fe7b	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-61e8-8116377d5589	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-4584-a7bf-ccab9e453019	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 41738801)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56ab-4582-8d43-b36f5c5ca384	00020000-56ab-4581-a5bd-84219acd418d
00010000-56ab-4582-7fba-a91b167aa9af	00020000-56ab-4581-a5bd-84219acd418d
00010000-56ab-4584-73f4-9711284dbc67	00020000-56ab-4584-704b-132dfecafdf6
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-8832-ba646383bae9
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-ae01-6aab70c973ff
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-5321-940320f43449
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-ce96-002aeb1deb03
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-4806-f184508d59dd
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-c754-53560606064b
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-b025-ebea19aa994d
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-c8f2-7d809c430139
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-56ff-20d9cc6882b3
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-7b3d-778dd4986d3a
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-d4ca-6eb8b1df7e7b
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-5d80-f8d4ae950010
00010000-56ab-4584-422a-c4d88806101b	00020000-56ab-4584-eb83-169fbed7c952
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-8832-ba646383bae9
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-ffd4-a09db5de34a6
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-b025-ebea19aa994d
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-1393-d4e48fa86b7c
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-4806-f184508d59dd
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-4d2d-77633067640a
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-c8f2-7d809c430139
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-56ff-20d9cc6882b3
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-7b3d-778dd4986d3a
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-d4ca-6eb8b1df7e7b
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-5d80-f8d4ae950010
00010000-56ab-4584-4ad9-ad9a23317936	00020000-56ab-4584-eb83-169fbed7c952
00010000-56ab-4584-4669-5bcf6d8f181d	00020000-56ab-4584-8832-ba646383bae9
00010000-56ab-4584-4669-5bcf6d8f181d	00020000-56ab-4584-ffd4-a09db5de34a6
00010000-56ab-4584-4669-5bcf6d8f181d	00020000-56ab-4584-b025-ebea19aa994d
00010000-56ab-4584-4669-5bcf6d8f181d	00020000-56ab-4584-1393-d4e48fa86b7c
00010000-56ab-4584-4669-5bcf6d8f181d	00020000-56ab-4584-ce96-002aeb1deb03
00010000-56ab-4584-4669-5bcf6d8f181d	00020000-56ab-4584-4806-f184508d59dd
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-ffd4-a09db5de34a6
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-a09f-0dc5f7b08a6a
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-b39b-f251c09d0f90
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-774f-34b5476863bb
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-ce96-002aeb1deb03
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-3eef-3a001ba25750
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-4806-f184508d59dd
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-063e-4bfecb288f48
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-c8f2-7d809c430139
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-323a-620b7f928b60
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-56ff-20d9cc6882b3
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-7b47-9cdbcbfbd841
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-7b3d-778dd4986d3a
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-a9f5-043279a570eb
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-d4ca-6eb8b1df7e7b
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-7632-58ae59ce679a
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-5d80-f8d4ae950010
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-a9d6-276412b0769b
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-eb83-169fbed7c952
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-0c89-0a2f9cc92c34
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-55c1-b7918c84fe7b
00010000-56ab-4584-2a64-5035f556d229	00020000-56ab-4584-61e8-8116377d5589
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-ffd4-a09db5de34a6
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-a09f-0dc5f7b08a6a
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-2200-9a4d28eadc3e
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-b39b-f251c09d0f90
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-774f-34b5476863bb
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-ce96-002aeb1deb03
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-3eef-3a001ba25750
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-4806-f184508d59dd
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-063e-4bfecb288f48
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-a626-5ccfda4e9b89
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-c8f2-7d809c430139
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-323a-620b7f928b60
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-f17c-92d848ad2fe5
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-56ff-20d9cc6882b3
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-7b47-9cdbcbfbd841
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-7b3d-778dd4986d3a
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-a9f5-043279a570eb
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-d4ca-6eb8b1df7e7b
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-7632-58ae59ce679a
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-5d80-f8d4ae950010
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-a9d6-276412b0769b
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-eb83-169fbed7c952
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-0c89-0a2f9cc92c34
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-4380-338e42d468e3
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-55c1-b7918c84fe7b
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-61e8-8116377d5589
00010000-56ab-4584-14d3-273d2067eabf	00020000-56ab-4584-a7bf-ccab9e453019
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-ffd4-a09db5de34a6
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-b025-ebea19aa994d
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-a09f-0dc5f7b08a6a
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-8780-0f0e1b60a7d9
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-2200-9a4d28eadc3e
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-ae01-6aab70c973ff
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-b39b-f251c09d0f90
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-774f-34b5476863bb
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-ce96-002aeb1deb03
00010000-56ab-4584-513c-fb6aa754c673	00020000-56ab-4584-3eef-3a001ba25750
00010000-56ab-4584-8e8a-8330af605b4e	00020000-56ab-4584-8832-ba646383bae9
00010000-56ab-4584-8e8a-8330af605b4e	00020000-56ab-4584-1393-d4e48fa86b7c
00010000-56ab-4584-8e8a-8330af605b4e	00020000-56ab-4584-ae01-6aab70c973ff
00010000-56ab-4584-8e8a-8330af605b4e	00020000-56ab-4584-5321-940320f43449
00010000-56ab-4584-8e8a-8330af605b4e	00020000-56ab-4584-ce96-002aeb1deb03
00010000-56ab-4584-8e8a-8330af605b4e	00020000-56ab-4584-4806-f184508d59dd
00010000-56ab-4584-8e8a-8330af605b4e	00020000-56ab-4584-c754-53560606064b
00010000-56ab-4584-8e8a-8330af605b4e	00020000-56ab-4584-0e8e-1a8989cc846c
00010000-56ab-4584-d22e-3628d2757b36	00020000-56ab-4584-e313-50b83bed622f
00010000-56ab-4584-9b64-a23649ae3c52	00020000-56ab-4582-bb2c-ed1a5feb9c4b
00010000-56ab-4584-9283-4aba3c48d872	00020000-56ab-4582-d9b1-bc4e5f13a4b1
00010000-56ab-4584-787c-986b6b89d5a7	00020000-56ab-4582-385e-a9ff4c0af668
00010000-56ab-4584-136c-9a9ba3f0acf3	00020000-56ab-4582-1db5-a406590b8c35
00010000-56ab-4584-c4d2-e1d418708445	00020000-56ab-4582-acf4-567ac484010d
00010000-56ab-4584-4200-014021576d2b	00020000-56ab-4582-2df9-8358b2c135c3
00010000-56ab-4584-b333-dc9d47dda734	00020000-56ab-4582-84ae-cb912d563397
\.


--
-- TOC entry 3186 (class 0 OID 41739268)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 41739206)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 41739129)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56ab-4584-749f-4a69a1361fb1	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56ab-4584-d222-6c4aecad24a8	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56ab-4584-ec0f-162cdc0013a9	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56ab-4584-e241-237061f273ca	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 41738766)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56ab-4580-05e8-3da3f48fe4f0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56ab-4580-d0cb-fb4323d49122	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56ab-4580-f1be-182b21a21b33	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56ab-4580-7509-09ef8d9e02ed	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56ab-4580-f1d0-bf0c0f466e08	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 41738758)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56ab-4580-369d-a80ed4a9bee1	00230000-56ab-4580-7509-09ef8d9e02ed	popa
00240000-56ab-4580-84cc-b49e386ab24d	00230000-56ab-4580-7509-09ef8d9e02ed	oseba
00240000-56ab-4580-d34f-0753d5c15251	00230000-56ab-4580-7509-09ef8d9e02ed	tippopa
00240000-56ab-4580-d860-98be8bd945de	00230000-56ab-4580-7509-09ef8d9e02ed	organizacijskaenota
00240000-56ab-4580-880a-799a92b686c8	00230000-56ab-4580-7509-09ef8d9e02ed	sezona
00240000-56ab-4580-e916-c786ecbec403	00230000-56ab-4580-7509-09ef8d9e02ed	tipvaje
00240000-56ab-4580-7dc6-8bf2e1c73eeb	00230000-56ab-4580-7509-09ef8d9e02ed	tipdodatka
00240000-56ab-4580-e2a1-4a677eeec609	00230000-56ab-4580-d0cb-fb4323d49122	prostor
00240000-56ab-4580-2441-483cd5f59f27	00230000-56ab-4580-7509-09ef8d9e02ed	besedilo
00240000-56ab-4580-bfba-b7989655602d	00230000-56ab-4580-7509-09ef8d9e02ed	uprizoritev
00240000-56ab-4580-3c76-cad1ddc476b1	00230000-56ab-4580-7509-09ef8d9e02ed	funkcija
00240000-56ab-4580-0d98-89f348638b89	00230000-56ab-4580-7509-09ef8d9e02ed	tipfunkcije
00240000-56ab-4580-4987-2668935c565d	00230000-56ab-4580-7509-09ef8d9e02ed	alternacija
00240000-56ab-4580-acef-b4e0c0aff53a	00230000-56ab-4580-05e8-3da3f48fe4f0	pogodba
00240000-56ab-4580-ca5a-3df8ca2dc60c	00230000-56ab-4580-7509-09ef8d9e02ed	zaposlitev
00240000-56ab-4580-c451-2a4ae7d4203e	00230000-56ab-4580-7509-09ef8d9e02ed	zvrstuprizoritve
00240000-56ab-4580-6a3f-86b00972fe19	00230000-56ab-4580-05e8-3da3f48fe4f0	programdela
00240000-56ab-4580-789c-fbdf97820f80	00230000-56ab-4580-7509-09ef8d9e02ed	zapis
\.


--
-- TOC entry 3133 (class 0 OID 41738753)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
8c3363a1-968a-47be-b5f1-cf85cca5b236	00240000-56ab-4580-369d-a80ed4a9bee1	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 41739329)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56ab-4585-7141-e7005220ec8a	000e0000-56ab-4584-af07-f3e64494e07e	00080000-56ab-4584-28b8-3dbe0ff58817	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56ab-4581-c266-6292e8e79d3b
00270000-56ab-4585-a7e0-52b3865890e8	000e0000-56ab-4584-af07-f3e64494e07e	00080000-56ab-4584-28b8-3dbe0ff58817	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56ab-4581-c266-6292e8e79d3b
\.


--
-- TOC entry 3149 (class 0 OID 41738902)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 41739148)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56ab-4585-7ddd-373e19586042	00180000-56ab-4585-77bd-f982ffd812a4	000c0000-56ab-4585-d21e-f5bb31fbb14c	00090000-56ab-4584-dcd2-87e1f1493147	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-4585-40d4-4cb91468c029	00180000-56ab-4585-77bd-f982ffd812a4	000c0000-56ab-4585-c08a-c6000a8fed07	00090000-56ab-4584-2f10-ec2d209082b0	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-4585-c2e2-491d2fa97665	00180000-56ab-4585-77bd-f982ffd812a4	000c0000-56ab-4585-31e0-e9748a60790e	00090000-56ab-4584-2f04-1fcd5b4b7653	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-4585-f9f9-a8f6ddf3417a	00180000-56ab-4585-77bd-f982ffd812a4	000c0000-56ab-4585-248a-78269ed0fae4	00090000-56ab-4584-a005-141e2abcc136	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-4585-5d27-454203c95e43	00180000-56ab-4585-77bd-f982ffd812a4	000c0000-56ab-4585-8e3e-7f9f09812166	00090000-56ab-4584-adc6-08b67234d873	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-4585-0079-843d9a190680	00180000-56ab-4585-e01e-843edc447724	\N	00090000-56ab-4584-adc6-08b67234d873	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56ab-4585-8013-0f56feb99892	00180000-56ab-4585-ed1d-56f22e98a16f	\N	00090000-56ab-4584-2f10-ec2d209082b0	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56ab-4585-7e01-40d449b652df	00180000-56ab-4585-77bd-f982ffd812a4	\N	00090000-56ab-4584-2e4d-c0f6575ede70	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 41739165)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56ab-4580-73b8-b712c46c95d0	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56ab-4580-009c-b2eabffc866f	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56ab-4580-9a8b-c71ca13a1e7b	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56ab-4580-0174-8f99d8ce81da	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56ab-4580-f34d-94d748ee15e6	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56ab-4580-4ec9-5a15284dd15f	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 41739370)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56ab-4580-c1ea-5301690d5a44	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56ab-4580-f418-48257df76819	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56ab-4580-b834-2055cdd28b88	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56ab-4580-c358-b6449962162d	04	Režija	Režija	Režija	umetnik	30
000f0000-56ab-4580-548e-5f3501011543	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56ab-4580-3e36-efac0df3a793	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56ab-4580-77b5-51d61f43f9e4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56ab-4580-3da7-72f3c16f1d06	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56ab-4580-bdd3-3d2db61cdc60	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56ab-4580-7682-6c94ea7c52ed	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56ab-4580-e00f-aeee50709818	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56ab-4580-9cac-2dfb84e41288	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56ab-4580-9f87-5cfa6905c905	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56ab-4580-3065-4ac22fe5e27d	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56ab-4580-e819-e5dfba20ed6e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56ab-4580-bd84-5f07fbffee64	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56ab-4580-65da-1bc77b2df30b	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56ab-4580-3406-3b50b33424c2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56ab-4580-bf28-e15afba5640b	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 41738853)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56ab-4584-019d-ec3cbb23a433	0001	šola	osnovna ali srednja šola
00400000-56ab-4584-0386-accd12635cea	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56ab-4584-6698-15b369fdfa40	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 41739674)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56ab-4580-8694-8a1da262e0f0	01	Velika predstava	f	1.00	1.00
002b0000-56ab-4580-1929-b2df11cba1f4	02	Mala predstava	f	0.50	0.50
002b0000-56ab-4580-abfe-9ca7d6a6c000	03	Mala koprodukcija	t	0.40	1.00
002b0000-56ab-4580-ee09-55130657a61a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56ab-4580-759e-ca69510109a2	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 41739119)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56ab-4580-e63c-dcdfd7913ef3	0001	prva vaja	prva vaja
00420000-56ab-4580-a14c-49ebc1ff9e13	0002	tehnična vaja	tehnična vaja
00420000-56ab-4580-3864-31e5ade140e5	0003	lučna vaja	lučna vaja
00420000-56ab-4580-6acd-5ffaf9dd5ee8	0004	kostumska vaja	kostumska vaja
00420000-56ab-4580-32db-f5b61a2c1f06	0005	foto vaja	foto vaja
00420000-56ab-4580-68cc-123b51632cf9	0006	1. glavna vaja	1. glavna vaja
00420000-56ab-4580-4f3f-c073a6554ebc	0007	2. glavna vaja	2. glavna vaja
00420000-56ab-4580-1ba1-b21e6d60059b	0008	1. generalka	1. generalka
00420000-56ab-4580-d210-111b9b359b66	0009	2. generalka	2. generalka
00420000-56ab-4580-92c6-672e220b7132	0010	odprta generalka	odprta generalka
00420000-56ab-4580-b988-93db8b5723bc	0011	obnovitvena vaja	obnovitvena vaja
00420000-56ab-4580-5f11-4f15a10c2d5d	0012	italijanka	krajša "obnovitvena" vaja
00420000-56ab-4580-ec96-349f43df51d7	0013	pevska vaja	pevska vaja
00420000-56ab-4580-6407-0bc105463cda	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56ab-4580-2fcb-8f1062ca705d	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56ab-4580-e090-f888db2c14d6	0016	orientacijska vaja	orientacijska vaja
00420000-56ab-4580-ca27-aa008876e6bd	0017	situacijska vaja	situacijska vaja
00420000-56ab-4580-0101-32ec7b392719	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 41738975)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 41738788)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56ab-4582-7fba-a91b167aa9af	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROS9qgSIA/hONydyEruQ4YJLuo4X4VzJ6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56ab-4584-eacc-5fbdd73197e4	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56ab-4584-982b-f970250cec41	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56ab-4584-b1f1-dbcd0d2dbef3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56ab-4584-55fd-bd0e86bb2e02	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56ab-4584-828b-bf3bd5246dc7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56ab-4584-31bd-7e1b07582093	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56ab-4584-7a21-6f4c9b19f23b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56ab-4584-867f-8c07fab55581	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56ab-4584-5cfd-cc48bf2d5955	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56ab-4584-73f4-9711284dbc67	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56ab-4584-6e08-7ff6a3322799	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56ab-4584-422a-c4d88806101b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56ab-4584-4ad9-ad9a23317936	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56ab-4584-4669-5bcf6d8f181d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56ab-4584-2a64-5035f556d229	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56ab-4584-14d3-273d2067eabf	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56ab-4584-513c-fb6aa754c673	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56ab-4584-8e8a-8330af605b4e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56ab-4584-d22e-3628d2757b36	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56ab-4584-9b64-a23649ae3c52	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56ab-4584-9283-4aba3c48d872	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56ab-4584-787c-986b6b89d5a7	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56ab-4584-136c-9a9ba3f0acf3	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56ab-4584-c4d2-e1d418708445	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56ab-4584-4200-014021576d2b	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56ab-4584-b333-dc9d47dda734	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56ab-4582-8d43-b36f5c5ca384	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 41739420)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56ab-4584-8e49-4f7ce73d014d	00160000-56ab-4584-ad6d-cfb80b0cc701	\N	00140000-56ab-4581-b6b0-93cce4d32dc9	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56ab-4584-1f4f-95c5660393b5
000e0000-56ab-4584-af07-f3e64494e07e	00160000-56ab-4584-ac50-1f3db76aa38b	\N	00140000-56ab-4581-683b-d713f74c3227	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56ab-4584-ea9e-77f4b4ba6c3b
000e0000-56ab-4584-b546-619ede4e8a28	\N	\N	00140000-56ab-4581-683b-d713f74c3227	00190000-56ab-4584-6f27-4e00fed5f516	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-4584-1f4f-95c5660393b5
000e0000-56ab-4584-f704-42fc57e390bd	\N	\N	00140000-56ab-4581-683b-d713f74c3227	00190000-56ab-4584-6f27-4e00fed5f516	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-4584-1f4f-95c5660393b5
000e0000-56ab-4584-a8dc-9ab032b4e17c	\N	\N	00140000-56ab-4581-683b-d713f74c3227	00190000-56ab-4584-6f27-4e00fed5f516	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-9f8b-0a7c2922ce88	\N	\N	00140000-56ab-4581-683b-d713f74c3227	00190000-56ab-4584-6f27-4e00fed5f516	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-7150-49d7b72b7a96	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-468a-e137cda1c293	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-fe62-5bf7eff172f6	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-326b-4920b0f98724	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-b95b-b5bf016848ad	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-b65a-409048d87167	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-69aa-c9cd474af2e9	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-e58a-4622916e38d0	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
000e0000-56ab-4584-c223-0c3529b31f30	\N	\N	00140000-56ab-4581-6104-0b176d41201c	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-4584-bb10-3784857ec6ef
\.


--
-- TOC entry 3170 (class 0 OID 41739139)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 41739068)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56ab-4585-15ea-6884e8d5a354	\N	000e0000-56ab-4584-8e49-4f7ce73d014d	1
00200000-56ab-4585-4906-cbc29f06fc50	\N	000e0000-56ab-4584-af07-f3e64494e07e	1
00200000-56ab-4585-2a99-928a65e71170	\N	000e0000-56ab-4584-af07-f3e64494e07e	3
00200000-56ab-4585-da38-0b7c5e23d7e6	\N	000e0000-56ab-4584-af07-f3e64494e07e	4
00200000-56ab-4585-84f4-3eb25096a809	\N	000e0000-56ab-4584-af07-f3e64494e07e	2
00200000-56ab-4585-005b-42802bbd4edc	\N	000e0000-56ab-4584-af07-f3e64494e07e	8
00200000-56ab-4585-d1cf-2509e50cf705	\N	000e0000-56ab-4584-af07-f3e64494e07e	7
00200000-56ab-4585-16c2-c2da31ed4921	\N	000e0000-56ab-4584-af07-f3e64494e07e	9
00200000-56ab-4585-b2fb-9a1135644993	\N	000e0000-56ab-4584-af07-f3e64494e07e	6
00200000-56ab-4585-2d8b-173e417cdc0b	\N	000e0000-56ab-4584-af07-f3e64494e07e	5
\.


--
-- TOC entry 3182 (class 0 OID 41739232)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 41739343)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56ab-4581-3e6d-2e95be5251b2	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56ab-4581-b409-08d31aa4f43f	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56ab-4581-902b-a145bc62d43d	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56ab-4581-a1c3-af501c45fea7	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56ab-4581-4cfb-551e185d531d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56ab-4581-45b5-2daef84beefe	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56ab-4581-32a8-b8ba09133cf7	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56ab-4581-9615-2da3373175af	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56ab-4581-c266-6292e8e79d3b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56ab-4581-02e3-a7d3e91f11ae	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56ab-4581-c57a-7520001f520e	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56ab-4581-8a29-ab6fedb6c9fc	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56ab-4581-65be-bbce343e4444	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56ab-4581-0340-e1f2ded00bf9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56ab-4581-871b-ef3bbd1796f7	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56ab-4581-5295-a3913f6ab44b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56ab-4581-ce1f-403f04716dc4	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56ab-4581-f5bd-4fd385607689	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56ab-4581-5b33-7ee844478af3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56ab-4581-66b6-584fbfa24f9a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56ab-4581-2fa2-57a5d4372062	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56ab-4581-f8c7-cf0583a5e5d0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56ab-4581-0335-fa556b968d08	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56ab-4581-a307-d5059739ad65	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56ab-4581-f8f3-bc34191ed4e6	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56ab-4581-112c-8c968ba8eee0	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56ab-4581-e5b4-94b1bfa8ee4c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56ab-4581-1686-85eb1394a0a1	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 41739724)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 41739693)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 41739736)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 41739305)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56ab-4584-ecdc-f3c636ec3cc4	00090000-56ab-4584-2f10-ec2d209082b0	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-4584-5d17-5c86b5113170	00090000-56ab-4584-2f04-1fcd5b4b7653	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-4584-3936-d57153090403	00090000-56ab-4584-8b11-5111542ba66b	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-4584-4dad-0cb7c1383839	00090000-56ab-4584-800a-64ec3893a8e3	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-4584-983b-f1dcc037efa7	00090000-56ab-4584-f3f2-ffe4ec8cb65b	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-4584-8486-c28580060398	00090000-56ab-4584-5856-dbedea38d646	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 41739410)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56ab-4581-b6b0-93cce4d32dc9	01	Drama	drama (SURS 01)
00140000-56ab-4581-85c6-563089ddb374	02	Opera	opera (SURS 02)
00140000-56ab-4581-9812-0cb2009cfde3	03	Balet	balet (SURS 03)
00140000-56ab-4581-9182-3bac4f9424da	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56ab-4581-6104-0b176d41201c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56ab-4581-683b-d713f74c3227	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56ab-4581-b97e-c6c6029dfd38	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 41739295)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 41738852)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 41739468)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 41739459)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 41738842)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 41739326)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 41739368)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 41739777)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 41739162)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 41739097)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 41739113)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 41739118)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 41739691)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 41739001)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 41739537)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 41739291)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 41739066)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 41739039)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 41739015)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 41739198)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 41739754)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 41739761)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 41739785)
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
-- TOC entry 2766 (class 2606 OID 41739224)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 41738973)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 41738871)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 41738935)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 41738898)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 41738831)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 41738816)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 41739230)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 41739267)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 41739405)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 41738926)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 41738961)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 41739642)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 41739204)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 41738951)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 41739082)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 41739054)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 41739048)
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
-- TOC entry 2764 (class 2606 OID 41739216)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 41739651)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 41739659)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 41739629)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 41739672)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 41739249)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 41739189)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 41739180)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 41739392)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 41739319)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 41739027)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 41738787)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 41739258)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 41738805)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 41738825)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 41739276)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 41739211)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 41739137)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 41738775)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 41738763)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 41738757)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 41739339)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 41738907)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 41739154)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 41739172)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 41739379)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 41738860)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 41739684)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 41739126)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 41738986)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 41738800)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 41739438)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 41739145)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 41739072)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 41739238)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 41739351)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 41739734)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 41739718)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 41739742)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 41739309)
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
-- TOC entry 2833 (class 2606 OID 41739418)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 41739303)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 41739107)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 41739108)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 41739106)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 41739104)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 41739105)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 41739103)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 41739340)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 41739341)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 41739342)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 41739756)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 41739755)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 41738928)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 41738929)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 41739231)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 41739722)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 41739721)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 41739723)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 41739720)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 41739719)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 41739217)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 41739073)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 41739074)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 41739292)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 41739294)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 41739293)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 41739017)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 41739016)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 41739673)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 41739407)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 41739408)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 41739409)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 41739743)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 41739443)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 41739440)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 41739444)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 41739442)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 41739441)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 41738988)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 41738987)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 41738901)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 41739259)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 41738832)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 41738833)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 41739279)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 41739278)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 41739277)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 41738938)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 41738937)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 41738939)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 41739049)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 41738765)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 41739184)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 41739182)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 41739181)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 41739183)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 41738806)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 41738807)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 41739239)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 41739778)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 41739328)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 41739327)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 41739786)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 41739787)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 41739205)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 41739320)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 41739321)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 41739542)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 41739541)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 41739538)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 41739539)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 41739540)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 41738953)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 41738952)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 41738954)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 41739253)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 41739252)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 41739652)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 41739653)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 41739472)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 41739473)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 41739470)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 41739471)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 41739163)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 41739164)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 41739310)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 41739311)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 41739146)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 41739193)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 41739192)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 41739190)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 41739191)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 41739460)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 41739028)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 41739042)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 41739041)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 41739040)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 41739043)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 41739067)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 41739055)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 41739056)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 41739643)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 41739692)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 41739762)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 41739763)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 41738873)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 41738872)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 41738908)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 41738909)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 41739157)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 41739156)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 41739155)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 41739099)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 41739102)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 41739098)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 41739101)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 41739100)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 41738927)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 41738861)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 41738862)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 41739002)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 41739004)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 41739003)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 41739005)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 41739199)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 41739406)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 41739439)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 41739380)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 41739381)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 41738899)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 41738900)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 41739173)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 41739174)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 41739304)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 41738776)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 41738974)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 41738936)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 41738764)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 41739685)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 41739251)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 41739250)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 41739127)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 41739128)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 41739469)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 41739147)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 41738962)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 41739419)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 41739735)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 41739660)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 41739661)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 41739369)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 41739138)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 41738826)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 41739948)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 41739973)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 41739963)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 41739943)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 41739978)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 41739958)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 41739968)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 41739953)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 41740158)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 41740163)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 41740168)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 41740328)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 41740323)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 41739843)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 41739848)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 41740073)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 41740308)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 41740303)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 41740313)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 41740298)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 41740293)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 41740068)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 41739933)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 41739938)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 41740113)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 41740123)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 41740118)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 41739898)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 41739893)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 41740058)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 41740283)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 41740173)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 41740178)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 41740183)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 41740318)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 41740203)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 41740188)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 41740208)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 41740198)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 41740193)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 41739888)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 41739883)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 41739828)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 41739823)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 41740093)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 41739803)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 41739808)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 41740108)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 41740103)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 41740098)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 41739858)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 41739853)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 41739863)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 41739913)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 41739788)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 41740033)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 41740023)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 41740018)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 41740028)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 41739793)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 41739798)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 41740078)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 41740343)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 41740153)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 41740148)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 41740348)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 41740353)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 41740063)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 41740138)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 41740143)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 41740258)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 41740253)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 41740238)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 41740243)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 41740248)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 41739873)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 41739868)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 41739878)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 41740088)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 41740083)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 41740268)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 41740273)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 41740228)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 41740233)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 41740218)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 41740223)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 41740008)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 41740013)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 41740128)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 41740133)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 41739983)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 41739988)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 41740053)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 41740048)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 41740038)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 41740043)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 41740213)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 41739903)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 41739908)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 41739928)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 41739918)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 41739923)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 41740263)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 41740278)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 41740288)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 41740333)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 41740338)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 41739818)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 41739813)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 41739833)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 41739838)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 41740003)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 41739998)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 41739993)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-29 11:57:13 CET

--
-- PostgreSQL database dump complete
--

