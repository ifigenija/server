--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-01 15:21:35 CET

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
-- TOC entry 185 (class 1259 OID 42321385)
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
-- TOC entry 241 (class 1259 OID 42322003)
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
-- TOC entry 240 (class 1259 OID 42321987)
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
-- TOC entry 184 (class 1259 OID 42321378)
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
-- TOC entry 183 (class 1259 OID 42321376)
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
-- TOC entry 231 (class 1259 OID 42321864)
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
-- TOC entry 234 (class 1259 OID 42321894)
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
-- TOC entry 255 (class 1259 OID 42322306)
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
-- TOC entry 212 (class 1259 OID 42321700)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 42321625)
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
-- TOC entry 206 (class 1259 OID 42321651)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 42321656)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 42322228)
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
-- TOC entry 196 (class 1259 OID 42321531)
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
-- TOC entry 242 (class 1259 OID 42322016)
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
-- TOC entry 227 (class 1259 OID 42321822)
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
-- TOC entry 202 (class 1259 OID 42321599)
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
-- TOC entry 199 (class 1259 OID 42321571)
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
-- TOC entry 197 (class 1259 OID 42321548)
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
-- TOC entry 216 (class 1259 OID 42321736)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 42322286)
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
-- TOC entry 254 (class 1259 OID 42322299)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 42322321)
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
-- TOC entry 220 (class 1259 OID 42321760)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 42321505)
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
-- TOC entry 187 (class 1259 OID 42321405)
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
-- TOC entry 191 (class 1259 OID 42321472)
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
-- TOC entry 188 (class 1259 OID 42321416)
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
-- TOC entry 180 (class 1259 OID 42321350)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 42321369)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 42321767)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 42321802)
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
-- TOC entry 237 (class 1259 OID 42321935)
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
-- TOC entry 190 (class 1259 OID 42321452)
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
-- TOC entry 193 (class 1259 OID 42321497)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 42322172)
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
-- TOC entry 217 (class 1259 OID 42321742)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 42321482)
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
-- TOC entry 204 (class 1259 OID 42321617)
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
-- TOC entry 200 (class 1259 OID 42321586)
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
-- TOC entry 201 (class 1259 OID 42321592)
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
-- TOC entry 219 (class 1259 OID 42321754)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 42322186)
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
-- TOC entry 246 (class 1259 OID 42322196)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 42322085)
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
-- TOC entry 247 (class 1259 OID 42322204)
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
-- TOC entry 223 (class 1259 OID 42321782)
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
-- TOC entry 215 (class 1259 OID 42321727)
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
-- TOC entry 214 (class 1259 OID 42321717)
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
-- TOC entry 236 (class 1259 OID 42321924)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 42321854)
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
-- TOC entry 198 (class 1259 OID 42321560)
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
-- TOC entry 177 (class 1259 OID 42321321)
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
-- TOC entry 176 (class 1259 OID 42321319)
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
-- TOC entry 224 (class 1259 OID 42321796)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 42321359)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 42321343)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 42321810)
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
-- TOC entry 218 (class 1259 OID 42321748)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 42321671)
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
-- TOC entry 175 (class 1259 OID 42321308)
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
-- TOC entry 174 (class 1259 OID 42321300)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 42321295)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 42321871)
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
-- TOC entry 189 (class 1259 OID 42321444)
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
-- TOC entry 211 (class 1259 OID 42321690)
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
-- TOC entry 213 (class 1259 OID 42321707)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 42321912)
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
-- TOC entry 186 (class 1259 OID 42321395)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 42322216)
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
-- TOC entry 208 (class 1259 OID 42321661)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 42321517)
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
-- TOC entry 178 (class 1259 OID 42321330)
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
-- TOC entry 239 (class 1259 OID 42321962)
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
-- TOC entry 210 (class 1259 OID 42321681)
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
-- TOC entry 203 (class 1259 OID 42321610)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 42321774)
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
-- TOC entry 233 (class 1259 OID 42321885)
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
-- TOC entry 251 (class 1259 OID 42322266)
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
-- TOC entry 250 (class 1259 OID 42322235)
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
-- TOC entry 252 (class 1259 OID 42322278)
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
-- TOC entry 229 (class 1259 OID 42321847)
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
-- TOC entry 238 (class 1259 OID 42321952)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 42321837)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 42321381)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 42321324)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 42321385)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56af-69ea-0b11-975ef8947ea7	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56af-69ea-ac83-64fe0c7458de	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56af-69ea-e91d-48cf7eef2459	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 42322003)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56af-69eb-35d3-25864dd4168a	000d0000-56af-69eb-48e9-3dcdc5396eeb	\N	00090000-56af-69ea-6899-664a9d629b6d	000b0000-56af-69eb-3ae9-eb75268b08ec	0001	f	\N	\N	\N	3	t	t	t
000c0000-56af-69eb-7b24-620479bb530c	000d0000-56af-69eb-8e96-878df38a3f59	00100000-56af-69ea-f39c-e768e22c7351	00090000-56af-69ea-1f4a-796f2a958f5d	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56af-69eb-3905-4ff8256769f1	000d0000-56af-69eb-3774-4c9f8aefe90c	00100000-56af-69ea-6157-871704d0b53d	00090000-56af-69ea-7ae5-a93d2e705254	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56af-69eb-6153-bc538d522be5	000d0000-56af-69eb-648d-83edf3432397	\N	00090000-56af-69ea-5c24-e67b09c9c65d	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56af-69eb-876a-ea2ae244e130	000d0000-56af-69eb-397c-8c57d5f51296	\N	00090000-56af-69ea-6e3f-90ab1c64edf0	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56af-69eb-3f2e-8a314e4eed5f	000d0000-56af-69eb-ea1d-2ada1080ad8d	\N	00090000-56af-69ea-ccf9-c10ed8df7754	000b0000-56af-69eb-00b0-0cbe265a9ca6	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56af-69eb-8ac9-6fca3742adcf	000d0000-56af-69eb-67de-0ffbfdf24240	00100000-56af-69ea-f1f1-d3be84eaba6c	00090000-56af-69ea-2996-91f13019b635	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56af-69eb-6807-590a2fb00f68	000d0000-56af-69eb-68a4-5c3bcdcc17dc	\N	00090000-56af-69ea-18bf-cd0a300673b3	000b0000-56af-69eb-077a-6161c89923f3	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56af-69eb-c25c-451e19975061	000d0000-56af-69eb-67de-0ffbfdf24240	00100000-56af-69ea-ff6b-62ecf1c6c7a4	00090000-56af-69ea-1e2e-d67ca7665e64	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56af-69eb-fff9-caae1f6ac070	000d0000-56af-69eb-67de-0ffbfdf24240	00100000-56af-69ea-f39a-364fe822a9db	00090000-56af-69ea-e404-b80d78cf8677	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56af-69eb-077f-04897e973a01	000d0000-56af-69eb-67de-0ffbfdf24240	00100000-56af-69ea-c6fd-538be92dee8c	00090000-56af-69ea-46da-b7ef5853651b	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56af-69eb-0fbd-77247a9b7212	000d0000-56af-69eb-ea73-1295c09ea988	00100000-56af-69ea-f39c-e768e22c7351	00090000-56af-69ea-1f4a-796f2a958f5d	000b0000-56af-69eb-be46-9c12bcb8e0c6	0012	t	\N	\N	\N	2	t	t	t
000c0000-56af-69eb-b16a-1be6c09ea860	000d0000-56af-69eb-fb23-708fd1474d6d	\N	00090000-56af-69ea-18bf-cd0a300673b3	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-5845-80df9a9a30cb	000d0000-56af-69eb-fb23-708fd1474d6d	\N	00090000-56af-69ea-0749-d5e22f7abe7a	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56af-69eb-f2b4-509d7d610584	000d0000-56af-69eb-cda3-cfd4add82cf6	00100000-56af-69ea-6157-871704d0b53d	00090000-56af-69ea-7ae5-a93d2e705254	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-f1c6-160377975fbc	000d0000-56af-69eb-cda3-cfd4add82cf6	\N	00090000-56af-69ea-0749-d5e22f7abe7a	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56af-69eb-2b87-6e46c04a1aa2	000d0000-56af-69eb-bdde-2da2e0a6b4e0	\N	00090000-56af-69ea-0749-d5e22f7abe7a	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-b744-3147487c68cc	000d0000-56af-69eb-bdde-2da2e0a6b4e0	\N	00090000-56af-69ea-18bf-cd0a300673b3	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56af-69eb-3f8d-577744364724	000d0000-56af-69eb-32c2-1eac3cad56b1	00100000-56af-69ea-f1f1-d3be84eaba6c	00090000-56af-69ea-2996-91f13019b635	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-1254-eee31ead1f4a	000d0000-56af-69eb-32c2-1eac3cad56b1	\N	00090000-56af-69ea-0749-d5e22f7abe7a	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56af-69eb-1e43-02b2bcbfb94c	000d0000-56af-69eb-b665-165487de4d6b	\N	00090000-56af-69ea-0749-d5e22f7abe7a	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-39de-2c648a13dcbd	000d0000-56af-69eb-b665-165487de4d6b	00100000-56af-69ea-f1f1-d3be84eaba6c	00090000-56af-69ea-2996-91f13019b635	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56af-69eb-a7d8-2912d252a601	000d0000-56af-69eb-cdb2-8e0fd61ac06e	\N	00090000-56af-69ea-0749-d5e22f7abe7a	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-2bbd-427033db0ca8	000d0000-56af-69eb-d249-c8dcf60dc6f2	\N	00090000-56af-69ea-18bf-cd0a300673b3	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-8f85-47fff7a63a12	000d0000-56af-69eb-03ea-e5968a52f931	\N	00090000-56af-69ea-18bf-cd0a300673b3	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-b32a-013e8e62d74f	000d0000-56af-69eb-03ea-e5968a52f931	00100000-56af-69ea-6157-871704d0b53d	00090000-56af-69ea-7ae5-a93d2e705254	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56af-69eb-d63f-abf8a05a96fb	000d0000-56af-69eb-586f-d46834ab6c63	\N	00090000-56af-69ea-f6bb-a7d5a2aba6e5	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56af-69eb-725d-177bdf18ffc8	000d0000-56af-69eb-586f-d46834ab6c63	\N	00090000-56af-69ea-6000-1dedbb9bfdab	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56af-69eb-39ad-b4b01ec8ca6f	000d0000-56af-69eb-d442-a715091e6e73	\N	00090000-56af-69ea-18bf-cd0a300673b3	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56af-69eb-78ae-2820813d8b58	000d0000-56af-69eb-d442-a715091e6e73	00100000-56af-69ea-6157-871704d0b53d	00090000-56af-69ea-7ae5-a93d2e705254	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56af-69eb-b72f-9f6eca3de3c7	000d0000-56af-69eb-d442-a715091e6e73	\N	00090000-56af-69ea-6000-1dedbb9bfdab	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56af-69eb-03cd-fe4a5d495df4	000d0000-56af-69eb-d442-a715091e6e73	\N	00090000-56af-69ea-f6bb-a7d5a2aba6e5	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56af-69eb-e2f1-f918c35d0a25	000d0000-56af-69eb-7390-b7d575ec2059	\N	00090000-56af-69ea-18bf-cd0a300673b3	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56af-69eb-4b38-abf3640c3b49	000d0000-56af-69eb-a4d4-4fa4578e56e0	00100000-56af-69ea-6157-871704d0b53d	00090000-56af-69ea-7ae5-a93d2e705254	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56af-69eb-9182-22f40e6235a9	000d0000-56af-69eb-a4d4-4fa4578e56e0	\N	00090000-56af-69ea-0749-d5e22f7abe7a	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 42321987)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 42321378)
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
-- TOC entry 3191 (class 0 OID 42321864)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56af-69eb-5b95-8cfbd8a9f541	00160000-56af-69ea-eae3-64409788b3a6	00090000-56af-69ea-6000-1dedbb9bfdab	aizv	10	t
003d0000-56af-69eb-2f11-605ce44604a7	00160000-56af-69ea-eae3-64409788b3a6	00090000-56af-69ea-3d9b-c804ec6dce89	apri	14	t
003d0000-56af-69eb-3bc5-1513790bcaab	00160000-56af-69ea-1369-731d4afd1b3d	00090000-56af-69ea-f6bb-a7d5a2aba6e5	aizv	11	t
003d0000-56af-69eb-5efc-21e998ab78d3	00160000-56af-69ea-7317-2627708f0905	00090000-56af-69ea-4096-ea17b36c17ed	aizv	12	t
003d0000-56af-69eb-4221-bd486e4db05f	00160000-56af-69ea-eae3-64409788b3a6	00090000-56af-69ea-0749-d5e22f7abe7a	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 42321894)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56af-69ea-eae3-64409788b3a6	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56af-69ea-1369-731d4afd1b3d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56af-69ea-7317-2627708f0905	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 42322306)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 42321700)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 42321625)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56af-69eb-e809-18bf641bab25	\N	\N	\N	\N	00440000-56af-69eb-5063-e01e06d8f950	00220000-56af-69ea-9ce5-75cac91018ed	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56af-69eb-93e1-f1192b772beb	\N	\N	\N	\N	00440000-56af-69eb-e3ac-57ec7d8d12fd	00220000-56af-69ea-c700-5d48c1c0e6dd	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56af-69eb-f1dd-c68b3eee5ae8	\N	\N	\N	001e0000-56af-69eb-4d71-9ac659a4b614	\N	00220000-56af-69ea-9ce5-75cac91018ed	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56af-69eb-4d00-8169637bcf58	\N	\N	\N	001e0000-56af-69eb-f269-28a03d3b8f0c	\N	00220000-56af-69ea-c700-5d48c1c0e6dd	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56af-69eb-e2bb-dbb648d509fc	\N	00200000-56af-69eb-f140-df0b1eeb01ee	\N	\N	\N	00220000-56af-69ea-a11f-6f19fc079fc5	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56af-69eb-0036-6ccda83c112d	\N	00200000-56af-69eb-23e9-8c66f1b750f8	\N	\N	\N	00220000-56af-69ea-a11f-6f19fc079fc5	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56af-69eb-f9b6-e13bbd399945	\N	00200000-56af-69eb-e50e-5f1315827d73	\N	\N	\N	00220000-56af-69ea-c700-5d48c1c0e6dd	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56af-69eb-8e3d-4e58420608ab	\N	00200000-56af-69eb-0508-ef2524d6435c	\N	\N	\N	00220000-56af-69ea-6385-2a1d06a71585	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56af-69eb-16d6-f9b07343f9b5	\N	00200000-56af-69eb-0a97-09d23a8b3498	\N	\N	\N	00220000-56af-69ea-f198-f4d501291970	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56af-69eb-c481-a7422561749b	\N	00200000-56af-69eb-1e4b-3234e95e3816	\N	\N	\N	00220000-56af-69ea-c700-5d48c1c0e6dd	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56af-69eb-fdef-a4f64092832a	\N	00200000-56af-69eb-fec5-2d3551041d24	\N	\N	\N	00220000-56af-69ea-f198-f4d501291970	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56af-69eb-8d84-f51b2f82bca0	\N	00200000-56af-69eb-3350-07f6716b12c6	\N	\N	\N	00220000-56af-69ea-f198-f4d501291970	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56af-69eb-3064-512ac0d28716	\N	00200000-56af-69eb-e030-807324b967d5	\N	\N	\N	00220000-56af-69ea-a11f-6f19fc079fc5	001f0000-56af-69ea-59e0-988eb2c1bf97	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56af-69eb-249f-75960fd084cc	\N	00200000-56af-69eb-d67b-764436746236	\N	\N	\N	00220000-56af-69ea-a11f-6f19fc079fc5	001f0000-56af-69ea-59e0-988eb2c1bf97	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56af-69eb-eabd-fa4ca0a03e3b	\N	\N	001c0000-56af-69eb-18c0-291198341923	\N	\N	\N	001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56af-69eb-8c17-9b1842579170	001b0000-56af-69eb-dffc-499ed3a880c2	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-59e0-988eb2c1bf97	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56af-69eb-080e-7368ec65c26a	001b0000-56af-69eb-a79e-3a571577680f	\N	\N	\N	\N	00220000-56af-69ea-c700-5d48c1c0e6dd	001f0000-56af-69ea-59e0-988eb2c1bf97	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56af-69eb-9392-0e9aa4d22126	001b0000-56af-69eb-dc61-51a8997497e5	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-59e0-988eb2c1bf97	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56af-69eb-a89a-0072f2a3a0e2	001b0000-56af-69eb-8bec-7db6a1152e21	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56af-69eb-937f-1ba598d26844	001b0000-56af-69eb-29ff-7c65ac0c5ea6	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56af-69eb-c03b-4f0388f2dc42	001b0000-56af-69eb-6e5b-c82d278dc3bb	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56af-69eb-eb70-0ba890b1822a	001b0000-56af-69eb-d6ab-d213736c0688	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-59e0-988eb2c1bf97	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56af-69eb-1469-7deb9410d21d	001b0000-56af-69eb-0ca4-033981003723	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56af-69eb-50fb-2ee5d5b2d465	001b0000-56af-69eb-4e14-29f2ddad8841	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56af-69eb-8fe3-d61399694b9c	001b0000-56af-69eb-d31c-1116f16e4b6f	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56af-69eb-9d0e-0618ed03a6f6	001b0000-56af-69eb-b903-56fbd8a725b3	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56af-69eb-e389-1c80ec9c30d6	001b0000-56af-69eb-8f78-cd9be370d315	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-5937-dd66cb81fc39	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56af-69eb-9ac3-9459c063fa5c	001b0000-56af-69eb-a6f6-a8cebcd4a66e	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-5937-dd66cb81fc39	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56af-69eb-8ac3-40c92dd52426	001b0000-56af-69eb-3d00-0016730724d0	\N	\N	\N	\N	00220000-56af-69ea-9ce5-75cac91018ed	001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56af-69eb-0069-04ddc7847c46	001b0000-56af-69eb-a858-7e3e27f39684	\N	\N	\N	\N	\N	001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56af-69eb-18c0-291198341923
00180000-56af-69eb-ff19-d4b475b2bc32	001b0000-56af-69eb-8590-7f0d5f8a1998	\N	\N	\N	\N	\N	001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56af-69eb-18c0-291198341923
\.


--
-- TOC entry 3166 (class 0 OID 42321651)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56af-69eb-4d71-9ac659a4b614
001e0000-56af-69eb-f269-28a03d3b8f0c
\.


--
-- TOC entry 3167 (class 0 OID 42321656)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56af-69eb-5063-e01e06d8f950
00440000-56af-69eb-e3ac-57ec7d8d12fd
\.


--
-- TOC entry 3209 (class 0 OID 42322228)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 42321531)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56af-69e6-34de-f48f37683e26	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56af-69e6-d7c3-f7270dc02c73	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56af-69e6-2900-69795fd2707d	AL	ALB	008	Albania 	Albanija	\N
00040000-56af-69e6-8a93-e57fa681dcf6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56af-69e7-e490-716cb6d8285d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56af-69e7-9ab0-5752c7526e48	AD	AND	020	Andorra 	Andora	\N
00040000-56af-69e7-f426-f35a7aa32ebd	AO	AGO	024	Angola 	Angola	\N
00040000-56af-69e7-4f51-246c1fdec12c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56af-69e7-3bb2-4eac3c11ca30	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56af-69e7-f98e-687363d480b2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-69e7-3d9d-733bbd25266e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56af-69e7-d72b-86284fcfd5ff	AM	ARM	051	Armenia 	Armenija	\N
00040000-56af-69e7-e40d-d0b39337e71a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56af-69e7-4c5e-198fa850ca8d	AU	AUS	036	Australia 	Avstralija	\N
00040000-56af-69e7-8e02-fb7d8215a5cf	AT	AUT	040	Austria 	Avstrija	\N
00040000-56af-69e7-d868-4277afd3452a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56af-69e7-4955-4225d5f45119	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56af-69e7-e000-c453ab951e7b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56af-69e7-e343-c391902eaaa3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56af-69e7-03ae-95bc75d5a9f6	BB	BRB	052	Barbados 	Barbados	\N
00040000-56af-69e7-c2f3-c313a89f754f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56af-69e7-47bb-03dba616e578	BE	BEL	056	Belgium 	Belgija	\N
00040000-56af-69e7-efee-7eb47df33658	BZ	BLZ	084	Belize 	Belize	\N
00040000-56af-69e7-b060-7b1956f7f71f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56af-69e7-a874-5f885344bf0b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56af-69e7-58c2-088b4e8bac2f	BT	BTN	064	Bhutan 	Butan	\N
00040000-56af-69e7-d02b-13d78619866a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56af-69e7-849d-694fbcd977e8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56af-69e7-4bb0-786044a79f5c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56af-69e7-793e-f58d276a0cd4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56af-69e7-ddbc-0210aa939f04	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56af-69e7-7577-9366a9f52799	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56af-69e7-efc3-e52818563760	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56af-69e7-84cc-977858aa5fb1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56af-69e7-2415-fb75d867cadc	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56af-69e7-bff7-123c741fffbd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56af-69e7-dbac-6962f3b00b25	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56af-69e7-5255-ada42b12fda1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56af-69e7-1fd7-af18a9925bae	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56af-69e7-64f6-8d94f3a4d234	CA	CAN	124	Canada 	Kanada	\N
00040000-56af-69e7-5b45-06ca1d3bc338	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56af-69e7-1612-0ce09708dce9	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56af-69e7-338a-70bc6fde53fa	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56af-69e7-4b41-fbee834c2244	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56af-69e7-a9b0-778bd09757c2	CL	CHL	152	Chile 	Čile	\N
00040000-56af-69e7-8899-b897ea841d06	CN	CHN	156	China 	Kitajska	\N
00040000-56af-69e7-113e-5dbe75753c2b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56af-69e7-3165-29984193ecf7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56af-69e7-b03d-d61bbd5c8a76	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56af-69e7-67fa-fc4bde3b1ab1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56af-69e7-4810-a313cf4a2c06	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56af-69e7-2c29-085f8d51240c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56af-69e7-daa7-8f3c1646af93	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56af-69e7-6a3a-053f2be0d3ef	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56af-69e7-e5ed-f0554fe27239	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56af-69e7-02d2-7b8484a6c1f9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56af-69e7-b078-e05fbc28e538	CU	CUB	192	Cuba 	Kuba	\N
00040000-56af-69e7-f446-717e6503452c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56af-69e7-df4e-2635f2dd45a4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56af-69e7-7f8b-b79aa98dcfe2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56af-69e7-5862-53c633df5092	DK	DNK	208	Denmark 	Danska	\N
00040000-56af-69e7-735d-102e80ca8d11	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56af-69e7-fb79-b691b1cd28b1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-69e7-dda2-fe20c4839095	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56af-69e7-d319-4ed656f8dda3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56af-69e7-929b-ac9f950de2fb	EG	EGY	818	Egypt 	Egipt	\N
00040000-56af-69e7-24d6-45651fcc6a6c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56af-69e7-659c-b51221529c34	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56af-69e7-d451-4b5048b511bc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56af-69e7-6724-fa446493bb23	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56af-69e7-034a-6635a281be95	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56af-69e7-a0be-d6cb302e559a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56af-69e7-d71f-e07b2d92fa67	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56af-69e7-37c4-a93a7dd07021	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56af-69e7-b2be-61a0a58de968	FI	FIN	246	Finland 	Finska	\N
00040000-56af-69e7-9b81-a7716ee9e9d3	FR	FRA	250	France 	Francija	\N
00040000-56af-69e7-6dff-a381f926630e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56af-69e7-94c8-9e35002dd5c0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56af-69e7-5658-a9de1549a65a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56af-69e7-a1f3-e7698eaf8391	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56af-69e7-8ba3-3c44923f0caf	GA	GAB	266	Gabon 	Gabon	\N
00040000-56af-69e7-7523-f26e90da5af4	GM	GMB	270	Gambia 	Gambija	\N
00040000-56af-69e7-c838-488eb54505b9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56af-69e7-d052-06ec1bf84316	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56af-69e7-9f06-3536550cb650	GH	GHA	288	Ghana 	Gana	\N
00040000-56af-69e7-7383-494b5b0e3919	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56af-69e7-a510-0560b9f9a0f1	GR	GRC	300	Greece 	Grčija	\N
00040000-56af-69e7-2b2a-9e7d4f359820	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56af-69e7-919e-73ac00c61282	GD	GRD	308	Grenada 	Grenada	\N
00040000-56af-69e7-d6c2-cd9d4d8f4d80	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56af-69e7-8ec5-50cb2e00aa24	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56af-69e7-551f-f67f50116e55	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56af-69e7-a180-079e9d62f4a4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56af-69e7-1821-04fbece16130	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56af-69e7-39b5-b7fe5856e637	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56af-69e7-3510-da925e9594d7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56af-69e7-d51c-c875418871b2	HT	HTI	332	Haiti 	Haiti	\N
00040000-56af-69e7-9e51-3e421d3b0958	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56af-69e7-4627-22a893ce01df	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56af-69e7-fc37-78ffa3a6beeb	HN	HND	340	Honduras 	Honduras	\N
00040000-56af-69e7-70de-7318f5e187af	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56af-69e7-4c34-fa4cd871d0dd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56af-69e7-d537-ee504a69fe16	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56af-69e7-3812-9eb9cdc1a7b3	IN	IND	356	India 	Indija	\N
00040000-56af-69e7-46c7-557493b7ee27	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56af-69e7-6b10-aa3bbc687fc3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56af-69e7-503a-80a6482d9069	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56af-69e7-a48a-ec3a0cbeb8b5	IE	IRL	372	Ireland 	Irska	\N
00040000-56af-69e7-2ee9-90be96d0c357	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56af-69e7-7561-c2cb36cc09ce	IL	ISR	376	Israel 	Izrael	\N
00040000-56af-69e7-6077-5c7b94d9225b	IT	ITA	380	Italy 	Italija	\N
00040000-56af-69e7-521f-7f4d0f20cebc	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56af-69e7-bba6-857377b9ebdf	JP	JPN	392	Japan 	Japonska	\N
00040000-56af-69e7-744b-9470713837c4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56af-69e7-2bd1-2e2f4995f7ff	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56af-69e7-a55a-d21bff02bb1f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56af-69e7-4b1a-cb2f63cd4be6	KE	KEN	404	Kenya 	Kenija	\N
00040000-56af-69e7-33c3-092e1af8dd75	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56af-69e7-8023-016b0c01dd13	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56af-69e7-190e-35c2c20d629c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56af-69e7-1f5b-a0a45189741b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56af-69e7-8a3c-1006562872b3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56af-69e7-accf-17da7b4d88b0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56af-69e7-9f15-6f4d8199f145	LV	LVA	428	Latvia 	Latvija	\N
00040000-56af-69e7-ffcb-73870cca76f8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56af-69e7-992e-279fe1e47cad	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56af-69e7-2da2-129c3ff6b415	LR	LBR	430	Liberia 	Liberija	\N
00040000-56af-69e7-f4fc-aed0a107eef2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56af-69e7-5042-b9833227a0f5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56af-69e7-b1c8-86a21425b9f0	LT	LTU	440	Lithuania 	Litva	\N
00040000-56af-69e7-7ec3-981661646ce4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56af-69e7-6373-5b54bdfe0246	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56af-69e7-1095-c52e42a748f0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56af-69e7-2111-b5327d41c116	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56af-69e7-2797-eb21ffc489dd	MW	MWI	454	Malawi 	Malavi	\N
00040000-56af-69e7-c3d5-18afbeb7ffaa	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56af-69e7-3197-67505f3449df	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56af-69e7-b757-a819e4133a08	ML	MLI	466	Mali 	Mali	\N
00040000-56af-69e7-4989-a05e290ca5a5	MT	MLT	470	Malta 	Malta	\N
00040000-56af-69e7-df10-de9b4cde19d1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56af-69e7-0087-28108a5ada76	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56af-69e7-91e8-03c44a315456	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56af-69e7-7229-35fb1ac7266c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56af-69e7-57c3-f602245b8da8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56af-69e7-373a-cbcf50711db5	MX	MEX	484	Mexico 	Mehika	\N
00040000-56af-69e7-d9af-81d23e9d4ce0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56af-69e7-51ac-3c227be72e01	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56af-69e7-8db6-131931084351	MC	MCO	492	Monaco 	Monako	\N
00040000-56af-69e7-0f97-a09514680094	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56af-69e7-c9b2-6d45f4cc8e84	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56af-69e7-d009-b4d746493adb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56af-69e7-8fee-9c9f5a134cbd	MA	MAR	504	Morocco 	Maroko	\N
00040000-56af-69e7-c485-2be08bf5a6ad	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56af-69e7-025e-d6ec9e92e1cc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56af-69e7-77f6-98778a743a09	NA	NAM	516	Namibia 	Namibija	\N
00040000-56af-69e7-6199-5a1237ed4efc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56af-69e7-2226-7af3a8f531da	NP	NPL	524	Nepal 	Nepal	\N
00040000-56af-69e7-baa3-61e8792d0679	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56af-69e7-2996-8ac655c2776f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56af-69e7-0532-d3028a694576	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56af-69e7-47ba-05ffa3dde015	NE	NER	562	Niger 	Niger 	\N
00040000-56af-69e7-6459-0dd908559629	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56af-69e7-a49b-3ff0fbedd497	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56af-69e7-2be3-729c9a7d4f86	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56af-69e7-f6fb-106822b3a4bf	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56af-69e7-7532-35d81fe704db	NO	NOR	578	Norway 	Norveška	\N
00040000-56af-69e7-45cb-1e59ecde6ae2	OM	OMN	512	Oman 	Oman	\N
00040000-56af-69e7-f8ae-398669b89bc5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56af-69e7-e447-8d10d97f3382	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56af-69e7-9bc0-9dea76f42e51	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56af-69e7-da8b-436ce1c482dc	PA	PAN	591	Panama 	Panama	\N
00040000-56af-69e7-088c-045046e7e3a4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56af-69e7-2600-ffcc244210b5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56af-69e7-33bc-955a5498b5e8	PE	PER	604	Peru 	Peru	\N
00040000-56af-69e7-239e-77a8fbdd6e4b	PH	PHL	608	Philippines 	Filipini	\N
00040000-56af-69e7-7ccd-05c41c592a52	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56af-69e7-4f13-3c7e25d6b59d	PL	POL	616	Poland 	Poljska	\N
00040000-56af-69e7-d11d-99a27661361e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56af-69e7-1ed9-1abd01cf6b1c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56af-69e7-d351-8b5d8bcdced8	QA	QAT	634	Qatar 	Katar	\N
00040000-56af-69e7-97ac-96ba6765c888	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56af-69e7-8ffc-a91ef2272ffb	RO	ROU	642	Romania 	Romunija	\N
00040000-56af-69e7-608b-8b5cb732ad47	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56af-69e7-8362-e86cdee52328	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56af-69e7-6e6b-58ff1e58f2ec	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56af-69e7-2baa-6fd62a9926a4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56af-69e7-aa7d-0f41398add31	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56af-69e7-07fc-a0ebdc7b33b1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56af-69e7-0119-41ca8b8af7de	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56af-69e7-3bee-4665fef64a64	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56af-69e7-a113-4524f5a06f4a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56af-69e7-94a2-ca88239e2562	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56af-69e7-d01a-060103bf988c	SM	SMR	674	San Marino 	San Marino	\N
00040000-56af-69e7-fc9a-17bfe223768c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56af-69e7-bc7a-5ee0b0d74bdd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56af-69e7-7ae6-ef6ce7bf6c99	SN	SEN	686	Senegal 	Senegal	\N
00040000-56af-69e7-4ed6-0bd27205a036	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56af-69e7-9c89-e61831159d0a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56af-69e7-afff-00a2a23611e2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56af-69e7-e238-52a7004dc678	SG	SGP	702	Singapore 	Singapur	\N
00040000-56af-69e7-2f9d-d14aa0393ba3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56af-69e7-0d15-88f84e1c7e3f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56af-69e7-e3b7-80f0557bb9cc	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56af-69e7-3a00-d3d62c5b54f8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56af-69e7-4aeb-367fb3fff9e4	SO	SOM	706	Somalia 	Somalija	\N
00040000-56af-69e7-0a3a-8502ef572592	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56af-69e7-720a-b08cdb84f1e6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56af-69e7-d9dd-0b59b8bc95bd	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56af-69e7-a3f5-268971429b52	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56af-69e7-b435-4aff130668f2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56af-69e7-2780-125ad459771f	SD	SDN	729	Sudan 	Sudan	\N
00040000-56af-69e7-707f-135700ffec32	SR	SUR	740	Suriname 	Surinam	\N
00040000-56af-69e7-3e84-24334667ee71	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56af-69e7-7c73-4130f4b5a884	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56af-69e7-dc13-de64b96ca1d7	SE	SWE	752	Sweden 	Švedska	\N
00040000-56af-69e7-33d0-303796dfbfb0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56af-69e7-f705-b76e336d675b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56af-69e7-02b4-438f6fe21332	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56af-69e7-fe89-15018bdbf0cc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56af-69e7-f896-f9bb09bd2275	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56af-69e7-b16c-0eb55f4c7bae	TH	THA	764	Thailand 	Tajska	\N
00040000-56af-69e7-3ae5-19a2701b2e28	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56af-69e7-7142-6b5d977ffed3	TG	TGO	768	Togo 	Togo	\N
00040000-56af-69e7-29cf-994be6743b85	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56af-69e7-f232-076da5dccf5b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56af-69e7-337b-bb1f7a8dee11	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56af-69e7-94cf-2f40a4fd5650	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56af-69e7-4352-0438595b440c	TR	TUR	792	Turkey 	Turčija	\N
00040000-56af-69e7-d57d-213dd35efff3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56af-69e7-4f09-f731a4774393	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-69e7-f054-5abe171ce28e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56af-69e7-03fc-ffd211687e81	UG	UGA	800	Uganda 	Uganda	\N
00040000-56af-69e7-4434-d909e74beb25	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56af-69e7-c973-1fa479e5f259	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56af-69e7-def2-62b4da101306	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56af-69e7-d38f-94a0f7408e08	US	USA	840	United States 	Združene države Amerike	\N
00040000-56af-69e7-8b9a-80cb19ec7021	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56af-69e7-7422-c40392e7eb95	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56af-69e7-56b4-0e866d20ed8b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56af-69e7-d940-a4c88d0d90c3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56af-69e7-2250-c2971e98e2b7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56af-69e7-a776-dce7f787fac9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56af-69e7-27c3-6702a556189e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-69e7-25d7-8f0c25832f4d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56af-69e7-c62c-2074d16749da	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56af-69e7-3b59-1c0f9f77b334	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56af-69e7-da40-c6d4ea756cff	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56af-69e7-0270-e1fab4ea69fd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56af-69e7-f2b8-86c9433dbd66	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 42322016)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56af-69eb-21cd-68b357b384e1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56af-69eb-d7d8-e0859ad77183	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-69eb-4db5-9b372fdca319	000e0000-56af-69eb-468b-e81409adbdfd	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-69e6-0ae7-929a39e0333b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-69eb-43d4-210d27a81c28	000e0000-56af-69eb-3ad7-57fc0f30e4f6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-69e6-beb1-7529f688817c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-69eb-0058-c00c6e37f06d	000e0000-56af-69eb-2a58-2eb013a77909	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-69e6-0ae7-929a39e0333b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 42321822)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56af-69eb-2512-4ca66631c2a3	000e0000-56af-69eb-3ad7-57fc0f30e4f6	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56af-69e6-01fa-bd3d3be49467
000d0000-56af-69eb-519a-b29427a27e6d	000e0000-56af-69eb-73d3-7b4eb7fd518a	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-69e6-8912-f499dcf80576
000d0000-56af-69eb-bd5e-030e3172e852	000e0000-56af-69eb-73d3-7b4eb7fd518a	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-48e9-3dcdc5396eeb	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-35d3-25864dd4168a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-69e6-8912-f499dcf80576
000d0000-56af-69eb-8e96-878df38a3f59	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-7b24-620479bb530c	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-3774-4c9f8aefe90c	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-3905-4ff8256769f1	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56af-69e6-9ed0-37e03c5c15b3
000d0000-56af-69eb-648d-83edf3432397	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-6153-bc538d522be5	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56af-69e6-01fa-bd3d3be49467
000d0000-56af-69eb-397c-8c57d5f51296	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-876a-ea2ae244e130	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56af-69e6-01fa-bd3d3be49467
000d0000-56af-69eb-ea1d-2ada1080ad8d	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-3f2e-8a314e4eed5f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-69e6-8912-f499dcf80576
000d0000-56af-69eb-67de-0ffbfdf24240	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-c25c-451e19975061	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56af-69e6-8912-f499dcf80576
000d0000-56af-69eb-68a4-5c3bcdcc17dc	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-6807-590a2fb00f68	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56af-69e6-d36c-8e90d46d9493
000d0000-56af-69eb-ea73-1295c09ea988	000e0000-56af-69eb-3ad7-57fc0f30e4f6	000c0000-56af-69eb-0fbd-77247a9b7212	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56af-69e6-6e87-ca196430cc47
000d0000-56af-69eb-fb23-708fd1474d6d	000e0000-56af-69eb-cafd-aa0db42490a2	000c0000-56af-69eb-b16a-1be6c09ea860	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-cda3-cfd4add82cf6	000e0000-56af-69eb-ca4c-dc3a7d83f4f0	000c0000-56af-69eb-f2b4-509d7d610584	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-bdde-2da2e0a6b4e0	000e0000-56af-69eb-ca4c-dc3a7d83f4f0	000c0000-56af-69eb-2b87-6e46c04a1aa2	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-32c2-1eac3cad56b1	000e0000-56af-69eb-9756-e2d78380b05b	000c0000-56af-69eb-3f8d-577744364724	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-b665-165487de4d6b	000e0000-56af-69eb-b606-4038ef9b7aa0	000c0000-56af-69eb-1e43-02b2bcbfb94c	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-cdb2-8e0fd61ac06e	000e0000-56af-69eb-0a8f-fc82a0292163	000c0000-56af-69eb-a7d8-2912d252a601	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-d249-c8dcf60dc6f2	000e0000-56af-69eb-be85-78602dcecd9d	000c0000-56af-69eb-2bbd-427033db0ca8	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-03ea-e5968a52f931	000e0000-56af-69eb-867d-549954b00608	000c0000-56af-69eb-8f85-47fff7a63a12	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-586f-d46834ab6c63	000e0000-56af-69eb-c7f8-527314865b1e	000c0000-56af-69eb-d63f-abf8a05a96fb	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-d442-a715091e6e73	000e0000-56af-69eb-c7f8-527314865b1e	000c0000-56af-69eb-39ad-b4b01ec8ca6f	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-7390-b7d575ec2059	000e0000-56af-69eb-e074-5ac29e7d6d27	000c0000-56af-69eb-e2f1-f918c35d0a25	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
000d0000-56af-69eb-a4d4-4fa4578e56e0	000e0000-56af-69eb-e074-5ac29e7d6d27	000c0000-56af-69eb-4b38-abf3640c3b49	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56af-69e6-fd9a-75afb92e2060
\.


--
-- TOC entry 3162 (class 0 OID 42321599)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56af-69eb-18c0-291198341923	00040000-56af-69e7-d537-ee504a69fe16		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 42321571)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 42321548)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56af-69eb-790a-2c3bd858ad20	00080000-56af-69ea-772d-15ffc38e1295	00090000-56af-69ea-e404-b80d78cf8677	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 42321736)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 42322286)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56af-69ea-5019-46cf5876cf6f	00010000-56af-69e8-20b1-f4066e2aaf00	\N	Prva mapa	Root mapa	2016-02-01 15:21:30	2016-02-01 15:21:30	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 42322299)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 42322321)
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
-- TOC entry 3180 (class 0 OID 42321760)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 42321505)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56af-69e8-3cc9-15bfbc6808bf	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56af-69e8-7bc0-0b65f09e9b3f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56af-69e8-8ac0-f33836350fff	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56af-69e8-e87a-de1a3a29b030	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56af-69e8-c9ff-bd6a49ac35e5	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56af-69e8-a8ab-02afceff3367	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56af-69e8-80f5-31646596519d	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56af-69e8-9ad6-756de69dd997	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56af-69e8-b8a9-b815c97c9106	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56af-69e8-4474-0fa90ee8f41b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56af-69e8-d412-45e5da83e232	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-69e8-c1aa-d422ca68fc2f	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-69e8-9f64-f0bc616cd780	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56af-69e8-9d78-1a5dd90dc346	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56af-69e8-c154-3086c4580fde	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56af-69e8-b419-f1123e99e0b7	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56af-69e8-fb26-4768ca81f930	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56af-69ea-e4c7-ec7344aedc52	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56af-69ea-01e3-2202f3f5b88d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56af-69ea-bbbf-6ea306df3245	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56af-69ea-e561-c85dd39b29b7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56af-69ea-3d87-47ece2bd6aa2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56af-69ea-2b72-d12742bc4830	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56af-69ed-a6c0-e72e3c1fb737	application.tenant.maticnopodjetje	string	s:36:"00080000-56af-69ed-35e7-b2acdf9456da";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 42321405)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56af-69ea-caf2-959cf5a46c52	00000000-56af-69ea-e4c7-ec7344aedc52	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56af-69ea-5911-c0c9f2f64210	00000000-56af-69ea-e4c7-ec7344aedc52	00010000-56af-69e8-20b1-f4066e2aaf00	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56af-69ea-91c8-084420b28e79	00000000-56af-69ea-01e3-2202f3f5b88d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56af-69ea-4830-0d9f84f6b274	00000000-56af-69ea-2b72-d12742bc4830	\N	s:6:"zelena";	t
00000000-56af-69ea-95c6-72e2b1284396	00000000-56af-69ea-2b72-d12742bc4830	00010000-56af-69e8-20b1-f4066e2aaf00	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 42321472)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56af-69eb-d2a2-2ca6a346f8ef	\N	00100000-56af-69ea-f39c-e768e22c7351	00100000-56af-69ea-6157-871704d0b53d	01	Gledališče Nimbis
00410000-56af-69eb-e9c3-7e8f5361595c	00410000-56af-69eb-d2a2-2ca6a346f8ef	00100000-56af-69ea-f39c-e768e22c7351	00100000-56af-69ea-6157-871704d0b53d	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 42321416)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56af-69ea-6899-664a9d629b6d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56af-69ea-5c24-e67b09c9c65d	00010000-56af-69ea-aab1-bcd31c10f5f4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56af-69ea-7ae5-a93d2e705254	00010000-56af-69ea-710f-5400dba29898	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56af-69ea-1e2e-d67ca7665e64	00010000-56af-69ea-2c03-b2b81898d639	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56af-69ea-4100-fc5512e4243b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56af-69ea-ccf9-c10ed8df7754	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56af-69ea-46da-b7ef5853651b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56af-69ea-2996-91f13019b635	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56af-69ea-e404-b80d78cf8677	00010000-56af-69ea-912b-e2a18c37e5dd	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56af-69ea-1f4a-796f2a958f5d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56af-69ea-5572-67849e4008d6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-69ea-6e3f-90ab1c64edf0	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56af-69ea-18bf-cd0a300673b3	00010000-56af-69ea-18a5-4681e9d79634	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-69ea-6000-1dedbb9bfdab	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-69ea-3d9b-c804ec6dce89	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-69ea-f6bb-a7d5a2aba6e5	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-69ea-4096-ea17b36c17ed	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-69ea-0749-d5e22f7abe7a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-69ea-3169-f23ee6dc2cdd	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-69ea-44ee-d372a361f7a7	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-69ea-51b5-0b2e0a743561	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 42321350)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56af-69e7-cdc9-d20edfa21ae4	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56af-69e7-f6c2-b7bbe8b879f2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56af-69e7-237e-51f6ffb96269	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56af-69e7-23f9-c1e562719bc6	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56af-69e7-dcbb-e32b526e29ea	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56af-69e7-09f7-82084c1b4986	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56af-69e7-ec41-694844969897	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56af-69e7-2fd2-935165e1734c	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56af-69e7-a56d-a754adc9df66	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56af-69e7-e085-8b3b2264026c	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56af-69e7-2599-d1606df4af06	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56af-69e7-3434-f7280f322989	Abonma-read	Abonma - branje	t
00030000-56af-69e7-ec36-ab712a6cb814	Abonma-write	Abonma - spreminjanje	t
00030000-56af-69e7-7691-aa9993d32988	Alternacija-read	Alternacija - branje	t
00030000-56af-69e7-bb4d-a49c4de95621	Alternacija-write	Alternacija - spreminjanje	t
00030000-56af-69e7-e13f-0e94db52d89d	Arhivalija-read	Arhivalija - branje	t
00030000-56af-69e7-2d0a-b7fde1748f36	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56af-69e7-9563-8f1c6793afcd	AuthStorage-read	AuthStorage - branje	t
00030000-56af-69e7-4f22-0ef2e5f9944f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56af-69e7-7ae4-539f650a81f4	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56af-69e7-6753-f55d7b882183	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56af-69e7-b62b-34a7c423afe3	Besedilo-read	Besedilo - branje	t
00030000-56af-69e7-7fcc-dc9c8b10f819	Besedilo-write	Besedilo - spreminjanje	t
00030000-56af-69e7-41cc-7b17cae41de3	Dodatek-read	Dodatek - branje	t
00030000-56af-69e7-9aa6-8f1820ff0b4b	Dodatek-write	Dodatek - spreminjanje	t
00030000-56af-69e7-3ec8-bc0cbfdc933d	Dogodek-read	Dogodek - branje	t
00030000-56af-69e7-33f5-48975322f233	Dogodek-write	Dogodek - spreminjanje	t
00030000-56af-69e7-db95-90c2ba093d7a	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56af-69e7-6483-f3cabed560f5	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56af-69e7-558e-9669ec3af3c7	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56af-69e7-990b-f6cf1bfb6ba7	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56af-69e7-f6ab-f9f9f4116300	DogodekTrait-read	DogodekTrait - branje	t
00030000-56af-69e7-74bc-15da1a0ce73b	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56af-69e7-890c-37069d01fc51	DrugiVir-read	DrugiVir - branje	t
00030000-56af-69e7-ecfe-c8de49a1ba99	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56af-69e7-c47e-af5d5146913c	Drzava-read	Drzava - branje	t
00030000-56af-69e7-05b0-4bb3f426cd75	Drzava-write	Drzava - spreminjanje	t
00030000-56af-69e7-08ae-a0f51d35d25d	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56af-69e7-4d83-74c665f32ffd	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56af-69e7-3560-ef5396cd73d8	Funkcija-read	Funkcija - branje	t
00030000-56af-69e7-3960-2bb5d124dc92	Funkcija-write	Funkcija - spreminjanje	t
00030000-56af-69e7-0253-714293755572	Gostovanje-read	Gostovanje - branje	t
00030000-56af-69e7-1f2a-c08a0863c349	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56af-69e7-46e7-ba0d2d54e24b	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56af-69e7-138a-cb9b0fbf368f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56af-69e7-05bd-b4c1e7457e6f	Kupec-read	Kupec - branje	t
00030000-56af-69e7-f54c-f40e76a67560	Kupec-write	Kupec - spreminjanje	t
00030000-56af-69e7-bb00-ff7e5fed7b38	NacinPlacina-read	NacinPlacina - branje	t
00030000-56af-69e7-7041-f8fd5560b44d	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56af-69e7-9e5f-c413461ebc9f	Option-read	Option - branje	t
00030000-56af-69e7-be45-2e49d8aaf505	Option-write	Option - spreminjanje	t
00030000-56af-69e7-3f42-fec28a799766	OptionValue-read	OptionValue - branje	t
00030000-56af-69e7-b3d2-2efe3eda6857	OptionValue-write	OptionValue - spreminjanje	t
00030000-56af-69e7-bcc7-d36d70073dd8	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56af-69e7-ca7c-332de7b06abc	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56af-69e7-2bb8-f74d7bc3ccb9	Oseba-read	Oseba - branje	t
00030000-56af-69e7-f720-fdf3ba07019a	Oseba-write	Oseba - spreminjanje	t
00030000-56af-69e7-2be7-2d8e50660325	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56af-69e7-4dc6-50abcddc3499	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56af-69e7-7311-60ccf6438c90	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56af-69e7-d32d-0e8f8d0c2546	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56af-69e7-6113-65f197f874ca	Pogodba-read	Pogodba - branje	t
00030000-56af-69e7-447c-f7e9eafb6442	Pogodba-write	Pogodba - spreminjanje	t
00030000-56af-69e7-0c3f-dd9e551117f5	Popa-read	Popa - branje	t
00030000-56af-69e7-1a3a-d753d9eae5a3	Popa-write	Popa - spreminjanje	t
00030000-56af-69e7-1e38-ffddeaddba72	Posta-read	Posta - branje	t
00030000-56af-69e7-2621-7587105a4057	Posta-write	Posta - spreminjanje	t
00030000-56af-69e7-9049-374b10908adc	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56af-69e7-5551-3039c02d8d09	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56af-69e7-92ef-23c60018aecd	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56af-69e7-ade2-ec809c8050da	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56af-69e7-86fc-fe9dc4727b87	PostniNaslov-read	PostniNaslov - branje	t
00030000-56af-69e7-d0bd-55a488c743bb	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56af-69e7-a434-7b4fa8ff02d8	Praznik-read	Praznik - branje	t
00030000-56af-69e7-d805-33db66fd46f3	Praznik-write	Praznik - spreminjanje	t
00030000-56af-69e7-f6a1-ec21d51c73cf	Predstava-read	Predstava - branje	t
00030000-56af-69e7-56d4-c3f28d6dd8fd	Predstava-write	Predstava - spreminjanje	t
00030000-56af-69e7-73fc-86dcdc1a5f42	Ura-read	Ura - branje	t
00030000-56af-69e7-cd5c-55c0c23e8cf7	Ura-write	Ura - spreminjanje	t
00030000-56af-69e7-e224-c9d9a129659d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56af-69e7-1e6e-407dad671b45	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56af-69e7-dd67-d68364c55357	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56af-69e7-86d0-400538b8d1c8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56af-69e7-99ce-acc205b042db	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56af-69e7-e7d3-8dafc582107b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56af-69e7-1b55-d831ffdd3a65	ProgramDela-read	ProgramDela - branje	t
00030000-56af-69e7-153a-4fb6c95d540c	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56af-69e7-de45-4b547ec63aa9	ProgramFestival-read	ProgramFestival - branje	t
00030000-56af-69e7-9400-6a75ef9cd5c1	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56af-69e7-cdff-f3d9ad3e078f	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56af-69e7-63ad-50d9e4bd00e9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56af-69e7-9740-72042b757b8f	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56af-69e7-07f6-0bd37e1e249b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56af-69e7-db95-ae0e0890240c	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56af-69e7-6eb1-c87eaa4dd80b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56af-69e7-ac56-c3a3570c5e66	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56af-69e7-0a81-46aa83696e94	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56af-69e7-3340-16c9bf434d35	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56af-69e7-9f3d-d1ffc61290ca	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56af-69e7-50ef-574e7064d0b5	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56af-69e7-74c4-7a771cb3223f	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56af-69e7-d68a-3c6ac430ea65	ProgramRazno-read	ProgramRazno - branje	t
00030000-56af-69e7-cd16-be5ca65f9c69	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56af-69e7-38a6-b28e962c7e87	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56af-69e7-2804-aaefc2e7f0c1	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56af-69e7-25b4-dd9ec0b870fe	Prostor-read	Prostor - branje	t
00030000-56af-69e7-5a71-114b0f069197	Prostor-write	Prostor - spreminjanje	t
00030000-56af-69e7-73ab-75239dc5e80d	Racun-read	Racun - branje	t
00030000-56af-69e7-0b6a-9ba1e8bfe239	Racun-write	Racun - spreminjanje	t
00030000-56af-69e7-5e0d-ada9cec8a134	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56af-69e7-86f5-8cc8229f7fe3	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56af-69e7-fff2-94968cc317fc	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56af-69e7-8c2c-ada31bc59a03	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56af-69e7-1612-3db33de6f851	Rekvizit-read	Rekvizit - branje	t
00030000-56af-69e7-e2bf-b4d5290172c0	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56af-69e7-744f-f1127cc66c1c	Revizija-read	Revizija - branje	t
00030000-56af-69e7-79c3-39994c9c28df	Revizija-write	Revizija - spreminjanje	t
00030000-56af-69e7-f8a1-2d6f1b122e10	Rezervacija-read	Rezervacija - branje	t
00030000-56af-69e7-d296-b73f88f198cb	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56af-69e7-6a2e-a56a980627b4	SedezniRed-read	SedezniRed - branje	t
00030000-56af-69e7-55e0-fd57c5ea8542	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56af-69e7-f1ea-f388c2ebfd1f	Sedez-read	Sedez - branje	t
00030000-56af-69e7-effd-477f22c8cb8c	Sedez-write	Sedez - spreminjanje	t
00030000-56af-69e7-d287-edcb2ba954a8	Sezona-read	Sezona - branje	t
00030000-56af-69e7-2db6-a4351095f03c	Sezona-write	Sezona - spreminjanje	t
00030000-56af-69e7-add5-ebf928948382	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56af-69e7-b1f3-f1595484c996	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56af-69e7-d136-84a59d50a5f0	Telefonska-read	Telefonska - branje	t
00030000-56af-69e7-3b10-8348c341bf64	Telefonska-write	Telefonska - spreminjanje	t
00030000-56af-69e7-ba2e-95f8e377dd41	TerminStoritve-read	TerminStoritve - branje	t
00030000-56af-69e7-5ced-938def400a8f	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56af-69e7-487c-227aa0c00e17	TipDodatka-read	TipDodatka - branje	t
00030000-56af-69e7-b1b0-1deca8eb2c4b	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56af-69e7-4e33-94b33e08a39d	TipFunkcije-read	TipFunkcije - branje	t
00030000-56af-69e7-e04a-a1764a0a9561	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56af-69e7-4e38-dccd3bdfd735	TipPopa-read	TipPopa - branje	t
00030000-56af-69e7-29c8-eaf08ce96f8e	TipPopa-write	TipPopa - spreminjanje	t
00030000-56af-69e7-bec1-77bf8141bf14	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56af-69e7-0c14-4ed72a18ed15	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56af-69e7-550c-69271c2f0bfd	TipVaje-read	TipVaje - branje	t
00030000-56af-69e7-d697-0d591a67ce2a	TipVaje-write	TipVaje - spreminjanje	t
00030000-56af-69e7-d5c6-32c7b7923cf4	Trr-read	Trr - branje	t
00030000-56af-69e7-62c8-2d1b260d3525	Trr-write	Trr - spreminjanje	t
00030000-56af-69e7-a591-b6b33753d5af	Uprizoritev-read	Uprizoritev - branje	t
00030000-56af-69e7-6a87-f1dd683d6f11	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56af-69e7-5634-3fe31896fdd3	Vaja-read	Vaja - branje	t
00030000-56af-69e7-566d-f1b62ed3e105	Vaja-write	Vaja - spreminjanje	t
00030000-56af-69e7-421d-8ec5ea2d882a	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56af-69e7-004c-19c6985a154e	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56af-69e7-f4e4-f4eaac65c1b1	VrstaStroska-read	VrstaStroska - branje	t
00030000-56af-69e7-9fec-e452a19b8133	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56af-69e7-b98a-d1ed731960ef	Zaposlitev-read	Zaposlitev - branje	t
00030000-56af-69e7-827d-30328d1f85eb	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56af-69e7-4021-aa419451eb18	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56af-69e7-d2d6-0ff777b6d3be	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56af-69e7-dfd2-264103626244	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56af-69e7-add8-e6f8e890e648	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56af-69e7-3704-bca0bee6d144	Job-read	Branje opravil - samo zase - branje	t
00030000-56af-69e7-020d-d23fa1874b6c	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56af-69e7-ecc9-1e5fe0b8d919	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56af-69e7-b757-8b7446fd8476	Report-read	Report - branje	t
00030000-56af-69e7-d84d-aee2954ac2ee	Report-write	Report - spreminjanje	t
00030000-56af-69e7-206b-b4dd9b890820	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56af-69e7-c02e-e1cb862a388e	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56af-69e7-77ed-1d433235c53d	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56af-69e7-c0fb-77dfcb891b30	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56af-69e7-49bc-0cb8d10213ca	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56af-69e7-d82e-bc813ae84b15	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56af-69e7-1f97-04ea6471e8e9	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56af-69e7-49f2-9c4ac6a00224	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-69e7-8602-281b1fa11e1d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-69e7-0ac7-991f54a9b4c0	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-69e7-9332-8aa076a18b1d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-69e7-1704-d7854ce50e01	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56af-69e7-20c4-3e46f7783bea	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56af-69e7-22b1-2da0c7691e38	Datoteka-write	Datoteka - spreminjanje	t
00030000-56af-69e7-4e9b-40d0e2165649	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 42321369)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56af-69e7-aefc-b4dd92e30327	00030000-56af-69e7-f6c2-b7bbe8b879f2
00020000-56af-69e7-aefc-b4dd92e30327	00030000-56af-69e7-cdc9-d20edfa21ae4
00020000-56af-69e7-b4a7-94b50cf7bf17	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-6753-f55d7b882183
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-7fcc-dc9c8b10f819
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e7-5b3d-6447d10461ef	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e7-1cc1-711cf45f0dd4	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69e7-1cc1-711cf45f0dd4	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e7-1cc1-711cf45f0dd4	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e7-1cc1-711cf45f0dd4	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e7-1cc1-711cf45f0dd4	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e7-1cc1-711cf45f0dd4	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e7-d555-dd9d6b910c4c	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e7-d555-dd9d6b910c4c	00030000-56af-69e7-827d-30328d1f85eb
00020000-56af-69e7-d555-dd9d6b910c4c	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e7-d555-dd9d6b910c4c	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69e7-d555-dd9d6b910c4c	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e7-d555-dd9d6b910c4c	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e7-d555-dd9d6b910c4c	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e7-b2b1-3128b8bebc1b	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e7-b2b1-3128b8bebc1b	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e7-b2b1-3128b8bebc1b	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e7-1e43-37ebdc922f6e	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e7-1e43-37ebdc922f6e	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e7-1e43-37ebdc922f6e	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e7-1e43-37ebdc922f6e	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e7-1e43-37ebdc922f6e	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e7-1e43-37ebdc922f6e	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e7-1e43-37ebdc922f6e	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e7-1e43-37ebdc922f6e	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e7-6076-108117031612	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e7-6076-108117031612	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e7-6076-108117031612	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e7-6076-108117031612	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-62c8-2d1b260d3525
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-d0bd-55a488c743bb
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-3b10-8348c341bf64
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e7-5945-de5d51b77d87	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e7-7892-2a30b55f52ab	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e7-7892-2a30b55f52ab	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e7-7892-2a30b55f52ab	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e7-7892-2a30b55f52ab	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e7-7892-2a30b55f52ab	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e7-7892-2a30b55f52ab	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e7-7892-2a30b55f52ab	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-3b10-8348c341bf64
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-d0bd-55a488c743bb
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-62c8-2d1b260d3525
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-1a3a-d753d9eae5a3
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-138a-cb9b0fbf368f
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-e7d3-8dafc582107b
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e7-277f-f13fdd389cf7	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e7-82e7-38aa66366554	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e7-19e0-a8cec65ca40a	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e7-19e0-a8cec65ca40a	00030000-56af-69e7-29c8-eaf08ce96f8e
00020000-56af-69e7-b05a-9ea37f6f61b7	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e7-e913-1e518d1b565f	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e7-e913-1e518d1b565f	00030000-56af-69e7-2621-7587105a4057
00020000-56af-69e7-1418-abde13c7099a	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e7-de61-d8da224dc13d	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e7-de61-d8da224dc13d	00030000-56af-69e7-05b0-4bb3f426cd75
00020000-56af-69e7-a609-4c0190c917b6	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e7-49bb-24200b37657e	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69e7-49bb-24200b37657e	00030000-56af-69e7-add8-e6f8e890e648
00020000-56af-69e7-f017-0de47b65acca	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69e7-5437-928e92139373	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e7-5437-928e92139373	00030000-56af-69e7-d2d6-0ff777b6d3be
00020000-56af-69e7-2fcb-39bde2f7b24a	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e7-7b81-e793e8152531	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69e7-7b81-e793e8152531	00030000-56af-69e7-ec36-ab712a6cb814
00020000-56af-69e7-0282-aec6d229ae34	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69e7-545e-2a3ef865577f	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e7-545e-2a3ef865577f	00030000-56af-69e7-5a71-114b0f069197
00020000-56af-69e7-545e-2a3ef865577f	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e7-545e-2a3ef865577f	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e7-545e-2a3ef865577f	00030000-56af-69e7-d0bd-55a488c743bb
00020000-56af-69e7-545e-2a3ef865577f	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-e7da-61f3181cffa8	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e8-e7da-61f3181cffa8	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-e7da-61f3181cffa8	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e8-9f56-26e087720e1d	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-9f56-26e087720e1d	00030000-56af-69e7-9fec-e452a19b8133
00020000-56af-69e8-c237-13c0599998a9	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-ca7c-332de7b06abc
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-77b8-411f76c3fd07	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-a01c-771892e35665	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-a01c-771892e35665	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-a01c-771892e35665	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-a01c-771892e35665	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-a01c-771892e35665	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-0239-057a7631a26e	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69e8-0239-057a7631a26e	00030000-56af-69e7-d697-0d591a67ce2a
00020000-56af-69e8-5621-a3b15f643622	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-ec41-694844969897
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-2fd2-935165e1734c
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-1b55-d831ffdd3a65
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-153a-4fb6c95d540c
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-de45-4b547ec63aa9
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-9400-6a75ef9cd5c1
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-cdff-f3d9ad3e078f
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-63ad-50d9e4bd00e9
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-9740-72042b757b8f
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-07f6-0bd37e1e249b
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-db95-ae0e0890240c
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-6eb1-c87eaa4dd80b
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-ac56-c3a3570c5e66
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-0a81-46aa83696e94
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-3340-16c9bf434d35
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-9f3d-d1ffc61290ca
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-50ef-574e7064d0b5
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-74c4-7a771cb3223f
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-d68a-3c6ac430ea65
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-cd16-be5ca65f9c69
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-38a6-b28e962c7e87
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-2804-aaefc2e7f0c1
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-86d0-400538b8d1c8
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-ecfe-c8de49a1ba99
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-5551-3039c02d8d09
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-020d-d23fa1874b6c
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-890c-37069d01fc51
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-dd67-d68364c55357
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-9049-374b10908adc
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-3704-bca0bee6d144
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-7194-a984748e4258	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-1b55-d831ffdd3a65
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-de45-4b547ec63aa9
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-cdff-f3d9ad3e078f
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-9740-72042b757b8f
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-db95-ae0e0890240c
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-ac56-c3a3570c5e66
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-3340-16c9bf434d35
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-50ef-574e7064d0b5
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-d68a-3c6ac430ea65
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-38a6-b28e962c7e87
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-dd67-d68364c55357
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-890c-37069d01fc51
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-9049-374b10908adc
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-3704-bca0bee6d144
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-336d-d5bf9e5a4390	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-6a87-f1dd683d6f11
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-e085-8b3b2264026c
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-e1aa-982ff136a7ae	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-66eb-15a71a0c2eae	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-2894-bf57f6318738	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-2894-bf57f6318738	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-2894-bf57f6318738	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-2894-bf57f6318738	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69e8-2894-bf57f6318738	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-2894-bf57f6318738	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-2894-bf57f6318738	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-2894-bf57f6318738	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-447c-f7e9eafb6442
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-b1f3-f1595484c996
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-58b0-c9c3ea14d4c6	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-8e00-ac5f775111e5	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-100e-fc7a1e976ed0	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-100e-fc7a1e976ed0	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-100e-fc7a1e976ed0	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-100e-fc7a1e976ed0	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-100e-fc7a1e976ed0	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-100e-fc7a1e976ed0	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-100e-fc7a1e976ed0	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-215a-21215b338c9a	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-215a-21215b338c9a	00030000-56af-69e7-b1f3-f1595484c996
00020000-56af-69e8-215a-21215b338c9a	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-215a-21215b338c9a	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-e93f-b2801eb493d6	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-e93f-b2801eb493d6	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-6753-f55d7b882183
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-7fcc-dc9c8b10f819
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-890c-37069d01fc51
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-ecfe-c8de49a1ba99
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-e085-8b3b2264026c
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-3704-bca0bee6d144
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-020d-d23fa1874b6c
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-447c-f7e9eafb6442
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-9049-374b10908adc
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-5551-3039c02d8d09
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-dd67-d68364c55357
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-86d0-400538b8d1c8
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-ec41-694844969897
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-1b55-d831ffdd3a65
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-2fd2-935165e1734c
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-153a-4fb6c95d540c
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-de45-4b547ec63aa9
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-9400-6a75ef9cd5c1
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-cdff-f3d9ad3e078f
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-63ad-50d9e4bd00e9
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-9740-72042b757b8f
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-07f6-0bd37e1e249b
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-db95-ae0e0890240c
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-6eb1-c87eaa4dd80b
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-ac56-c3a3570c5e66
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-0a81-46aa83696e94
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-3340-16c9bf434d35
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-9f3d-d1ffc61290ca
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-50ef-574e7064d0b5
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-74c4-7a771cb3223f
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-d68a-3c6ac430ea65
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-cd16-be5ca65f9c69
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-38a6-b28e962c7e87
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-2804-aaefc2e7f0c1
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-b1f3-f1595484c996
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-6a87-f1dd683d6f11
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e8-34ec-0f9bd5a0c79f	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-6753-f55d7b882183
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-7fcc-dc9c8b10f819
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e8-9fb1-3a72a19014f3	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-6753-f55d7b882183
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-7fcc-dc9c8b10f819
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-e085-8b3b2264026c
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-6a87-f1dd683d6f11
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e8-e6f3-6288f52aceb4	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-6753-f55d7b882183
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-7fcc-dc9c8b10f819
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-890c-37069d01fc51
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-ecfe-c8de49a1ba99
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-e085-8b3b2264026c
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-3704-bca0bee6d144
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-020d-d23fa1874b6c
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-138a-cb9b0fbf368f
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-447c-f7e9eafb6442
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-1a3a-d753d9eae5a3
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-9049-374b10908adc
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-5551-3039c02d8d09
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-d0bd-55a488c743bb
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-dd67-d68364c55357
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-86d0-400538b8d1c8
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-e7d3-8dafc582107b
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-ec41-694844969897
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-1b55-d831ffdd3a65
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-2fd2-935165e1734c
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-153a-4fb6c95d540c
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-de45-4b547ec63aa9
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-9400-6a75ef9cd5c1
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-cdff-f3d9ad3e078f
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-63ad-50d9e4bd00e9
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-9740-72042b757b8f
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-07f6-0bd37e1e249b
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-db95-ae0e0890240c
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-6eb1-c87eaa4dd80b
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-ac56-c3a3570c5e66
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-0a81-46aa83696e94
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-3340-16c9bf434d35
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-9f3d-d1ffc61290ca
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-50ef-574e7064d0b5
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-74c4-7a771cb3223f
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-d68a-3c6ac430ea65
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-cd16-be5ca65f9c69
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-38a6-b28e962c7e87
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-2804-aaefc2e7f0c1
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-b1f3-f1595484c996
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-3b10-8348c341bf64
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-62c8-2d1b260d3525
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-6a87-f1dd683d6f11
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-827d-30328d1f85eb
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e8-3218-404021d45d08	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-6753-f55d7b882183
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-7fcc-dc9c8b10f819
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-e085-8b3b2264026c
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-138a-cb9b0fbf368f
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-1a3a-d753d9eae5a3
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-d0bd-55a488c743bb
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-e7d3-8dafc582107b
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-3b10-8348c341bf64
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-62c8-2d1b260d3525
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-6a87-f1dd683d6f11
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-827d-30328d1f85eb
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e8-657a-76b1bbd9a7f9	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e8-7393-e5b48226c0de	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-890c-37069d01fc51
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-ecfe-c8de49a1ba99
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-3704-bca0bee6d144
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-020d-d23fa1874b6c
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-138a-cb9b0fbf368f
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-ca7c-332de7b06abc
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-447c-f7e9eafb6442
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-1a3a-d753d9eae5a3
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-9049-374b10908adc
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-5551-3039c02d8d09
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-d0bd-55a488c743bb
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-dd67-d68364c55357
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-86d0-400538b8d1c8
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-e7d3-8dafc582107b
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-ec41-694844969897
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-1b55-d831ffdd3a65
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-2fd2-935165e1734c
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-153a-4fb6c95d540c
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-de45-4b547ec63aa9
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-9400-6a75ef9cd5c1
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-cdff-f3d9ad3e078f
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-63ad-50d9e4bd00e9
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-9740-72042b757b8f
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-07f6-0bd37e1e249b
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-db95-ae0e0890240c
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-6eb1-c87eaa4dd80b
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-ac56-c3a3570c5e66
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-0a81-46aa83696e94
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-3340-16c9bf434d35
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-9f3d-d1ffc61290ca
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-50ef-574e7064d0b5
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-74c4-7a771cb3223f
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-d68a-3c6ac430ea65
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-cd16-be5ca65f9c69
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-38a6-b28e962c7e87
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-2804-aaefc2e7f0c1
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-b1f3-f1595484c996
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-3b10-8348c341bf64
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-62c8-2d1b260d3525
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-9fec-e452a19b8133
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-827d-30328d1f85eb
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69e8-3c63-d4cf07366d5a	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-cdc9-d20edfa21ae4
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-f6c2-b7bbe8b879f2
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-3434-f7280f322989
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-ec36-ab712a6cb814
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-e13f-0e94db52d89d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-2d0a-b7fde1748f36
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-9563-8f1c6793afcd
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-4f22-0ef2e5f9944f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-7ae4-539f650a81f4
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-6753-f55d7b882183
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-b62b-34a7c423afe3
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-7fcc-dc9c8b10f819
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-3ec8-bc0cbfdc933d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-23f9-c1e562719bc6
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-db95-90c2ba093d7a
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-6483-f3cabed560f5
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-558e-9669ec3af3c7
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-990b-f6cf1bfb6ba7
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-f6ab-f9f9f4116300
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-74bc-15da1a0ce73b
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-33f5-48975322f233
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-890c-37069d01fc51
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-ecfe-c8de49a1ba99
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-c47e-af5d5146913c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-05b0-4bb3f426cd75
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-08ae-a0f51d35d25d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-4d83-74c665f32ffd
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-e085-8b3b2264026c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-0253-714293755572
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-1f2a-c08a0863c349
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-ecc9-1e5fe0b8d919
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-3704-bca0bee6d144
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-020d-d23fa1874b6c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-46e7-ba0d2d54e24b
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-138a-cb9b0fbf368f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-05bd-b4c1e7457e6f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-f54c-f40e76a67560
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-1f97-04ea6471e8e9
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d82e-bc813ae84b15
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-c02e-e1cb862a388e
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-77ed-1d433235c53d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-c0fb-77dfcb891b30
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-49bc-0cb8d10213ca
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-bb00-ff7e5fed7b38
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-7041-f8fd5560b44d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-9e5f-c413461ebc9f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-3f42-fec28a799766
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-b3d2-2efe3eda6857
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-2599-d1606df4af06
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-be45-2e49d8aaf505
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-bcc7-d36d70073dd8
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-ca7c-332de7b06abc
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-2be7-2d8e50660325
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-4dc6-50abcddc3499
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-7311-60ccf6438c90
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d32d-0e8f8d0c2546
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-447c-f7e9eafb6442
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-1a3a-d753d9eae5a3
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-1e38-ffddeaddba72
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-9049-374b10908adc
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-5551-3039c02d8d09
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-92ef-23c60018aecd
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-ade2-ec809c8050da
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-2621-7587105a4057
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d0bd-55a488c743bb
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-a434-7b4fa8ff02d8
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d805-33db66fd46f3
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-f6a1-ec21d51c73cf
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-56d4-c3f28d6dd8fd
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-e224-c9d9a129659d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-1e6e-407dad671b45
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-dd67-d68364c55357
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-86d0-400538b8d1c8
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-99ce-acc205b042db
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-e7d3-8dafc582107b
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-ec41-694844969897
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-1b55-d831ffdd3a65
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-2fd2-935165e1734c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-153a-4fb6c95d540c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-de45-4b547ec63aa9
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-9400-6a75ef9cd5c1
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-cdff-f3d9ad3e078f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-63ad-50d9e4bd00e9
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-9740-72042b757b8f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-07f6-0bd37e1e249b
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-db95-ae0e0890240c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-6eb1-c87eaa4dd80b
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-ac56-c3a3570c5e66
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-0a81-46aa83696e94
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-3340-16c9bf434d35
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-9f3d-d1ffc61290ca
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-50ef-574e7064d0b5
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-74c4-7a771cb3223f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d68a-3c6ac430ea65
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-cd16-be5ca65f9c69
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-38a6-b28e962c7e87
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-2804-aaefc2e7f0c1
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-25b4-dd9ec0b870fe
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-5a71-114b0f069197
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-73ab-75239dc5e80d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-0b6a-9ba1e8bfe239
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-5e0d-ada9cec8a134
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-86f5-8cc8229f7fe3
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-fff2-94968cc317fc
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-8c2c-ada31bc59a03
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-1612-3db33de6f851
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-e2bf-b4d5290172c0
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-b757-8b7446fd8476
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d84d-aee2954ac2ee
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-744f-f1127cc66c1c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-79c3-39994c9c28df
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-f8a1-2d6f1b122e10
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d296-b73f88f198cb
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-6a2e-a56a980627b4
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-55e0-fd57c5ea8542
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-f1ea-f388c2ebfd1f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-effd-477f22c8cb8c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d287-edcb2ba954a8
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-2db6-a4351095f03c
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-206b-b4dd9b890820
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-b1f3-f1595484c996
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-3b10-8348c341bf64
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-ba2e-95f8e377dd41
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-237e-51f6ffb96269
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-5ced-938def400a8f
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-4e33-94b33e08a39d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-e04a-a1764a0a9561
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-4e38-dccd3bdfd735
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-29c8-eaf08ce96f8e
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-bec1-77bf8141bf14
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-0c14-4ed72a18ed15
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-550c-69271c2f0bfd
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d697-0d591a67ce2a
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-62c8-2d1b260d3525
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-6a87-f1dd683d6f11
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-5634-3fe31896fdd3
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-566d-f1b62ed3e105
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-421d-8ec5ea2d882a
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-004c-19c6985a154e
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-f4e4-f4eaac65c1b1
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-9fec-e452a19b8133
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-20c4-3e46f7783bea
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-1704-d7854ce50e01
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-827d-30328d1f85eb
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-4021-aa419451eb18
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-d2d6-0ff777b6d3be
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-dfd2-264103626244
00020000-56af-69ea-33f1-62d9631a75e2	00030000-56af-69e7-add8-e6f8e890e648
00020000-56af-69ea-cde8-cc3258f72b36	00030000-56af-69e7-9332-8aa076a18b1d
00020000-56af-69ea-1582-ea6dcd3a0c13	00030000-56af-69e7-0ac7-991f54a9b4c0
00020000-56af-69ea-d98e-a2376ca3fb8b	00030000-56af-69e7-6a87-f1dd683d6f11
00020000-56af-69ea-593f-bf721c73b961	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69ea-235a-39d3e15655a6	00030000-56af-69e7-77ed-1d433235c53d
00020000-56af-69ea-abec-4a2bcf506dfc	00030000-56af-69e7-c0fb-77dfcb891b30
00020000-56af-69ea-d39e-c38f706fe51c	00030000-56af-69e7-49bc-0cb8d10213ca
00020000-56af-69ea-e0c2-8c73c8d1c198	00030000-56af-69e7-c02e-e1cb862a388e
00020000-56af-69ea-63a3-2ee0005e79ed	00030000-56af-69e7-1f97-04ea6471e8e9
00020000-56af-69ea-f802-2ce0e28b476c	00030000-56af-69e7-d82e-bc813ae84b15
00020000-56af-69ea-3f8c-597befb98194	00030000-56af-69e7-8602-281b1fa11e1d
00020000-56af-69ea-3e0d-68c8d6c475ff	00030000-56af-69e7-49f2-9c4ac6a00224
00020000-56af-69ea-f12b-32277eaef1e9	00030000-56af-69e7-2bb8-f74d7bc3ccb9
00020000-56af-69ea-7bfb-b91592f41a98	00030000-56af-69e7-f720-fdf3ba07019a
00020000-56af-69ea-6846-1751c6d5a2f6	00030000-56af-69e7-dcbb-e32b526e29ea
00020000-56af-69ea-56ba-97ea370b2af9	00030000-56af-69e7-09f7-82084c1b4986
00020000-56af-69ea-5275-be865ef79c6e	00030000-56af-69e7-22b1-2da0c7691e38
00020000-56af-69ea-5f88-8e53ac309471	00030000-56af-69e7-4e9b-40d0e2165649
00020000-56af-69ea-9b97-74c0e52fd758	00030000-56af-69e7-0c3f-dd9e551117f5
00020000-56af-69ea-9b97-74c0e52fd758	00030000-56af-69e7-1a3a-d753d9eae5a3
00020000-56af-69ea-9b97-74c0e52fd758	00030000-56af-69e7-a591-b6b33753d5af
00020000-56af-69ea-d3f2-9e34100a2896	00030000-56af-69e7-d5c6-32c7b7923cf4
00020000-56af-69ea-464d-13a94a9dae9d	00030000-56af-69e7-62c8-2d1b260d3525
00020000-56af-69ea-4fab-6047899c4cd0	00030000-56af-69e7-206b-b4dd9b890820
00020000-56af-69ea-780a-71461c9a08d0	00030000-56af-69e7-d136-84a59d50a5f0
00020000-56af-69ea-d368-42dce2897681	00030000-56af-69e7-3b10-8348c341bf64
00020000-56af-69ea-6c48-fafe09850d87	00030000-56af-69e7-86fc-fe9dc4727b87
00020000-56af-69ea-03ca-b9b3e19ed01c	00030000-56af-69e7-d0bd-55a488c743bb
00020000-56af-69ea-7c84-b841b7fa7e86	00030000-56af-69e7-b98a-d1ed731960ef
00020000-56af-69ea-1d6c-d7905dcf7671	00030000-56af-69e7-827d-30328d1f85eb
00020000-56af-69ea-27ed-77db5910f56e	00030000-56af-69e7-6113-65f197f874ca
00020000-56af-69ea-5e90-c2f759ae203d	00030000-56af-69e7-447c-f7e9eafb6442
00020000-56af-69ea-2a2d-05b38e834b14	00030000-56af-69e7-add5-ebf928948382
00020000-56af-69ea-ff9d-4ed1521bad9e	00030000-56af-69e7-b1f3-f1595484c996
00020000-56af-69ea-b676-c67d93fc5709	00030000-56af-69e7-7691-aa9993d32988
00020000-56af-69ea-713c-5cac3dac6e83	00030000-56af-69e7-bb4d-a49c4de95621
00020000-56af-69ea-f38a-ce398037d840	00030000-56af-69e7-a56d-a754adc9df66
00020000-56af-69ea-eeff-f34c99e689bf	00030000-56af-69e7-3560-ef5396cd73d8
00020000-56af-69ea-0113-6639cbd133f9	00030000-56af-69e7-3960-2bb5d124dc92
00020000-56af-69ea-d712-6b2cf4459933	00030000-56af-69e7-e085-8b3b2264026c
\.


--
-- TOC entry 3181 (class 0 OID 42321767)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 42321802)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 42321935)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56af-69eb-3ae9-eb75268b08ec	00090000-56af-69ea-6899-664a9d629b6d	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56af-69eb-00b0-0cbe265a9ca6	00090000-56af-69ea-ccf9-c10ed8df7754	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56af-69eb-077a-6161c89923f3	00090000-56af-69ea-18bf-cd0a300673b3	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56af-69eb-be46-9c12bcb8e0c6	00090000-56af-69ea-1f4a-796f2a958f5d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 42321452)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56af-69ea-772d-15ffc38e1295	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-69ea-04dc-d7aa96d18012	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56af-69ea-3c6a-05bb065ffb21	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-69ea-acbc-e74bd2b29a52	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-69ea-c35d-b51e0b036eee	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-69ea-6fc7-f9eb790b8434	\N	00040000-56af-69e7-3d9d-733bbd25266e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-69ea-9015-fa04cae05a04	\N	00040000-56af-69e7-02d2-7b8484a6c1f9	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-69ea-297b-de02c4e728fb	\N	00040000-56af-69e7-8e02-fb7d8215a5cf	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-69ea-358a-51016389c7a5	\N	00040000-56af-69e7-d052-06ec1bf84316	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-69ed-35e7-b2acdf9456da	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 42321497)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56af-69e6-d582-df67b94a18d1	8341	Adlešiči
00050000-56af-69e6-9088-c6e02f0a4321	5270	Ajdovščina
00050000-56af-69e6-deb4-7bdb1c96c0e1	6280	Ankaran/Ancarano
00050000-56af-69e6-4baf-e491114816c5	9253	Apače
00050000-56af-69e6-5663-510213436b9f	8253	Artiče
00050000-56af-69e6-bb9f-e6bee309b9b0	4275	Begunje na Gorenjskem
00050000-56af-69e6-bc93-557dea0b19bb	1382	Begunje pri Cerknici
00050000-56af-69e6-1ae8-aed2887756bd	9231	Beltinci
00050000-56af-69e6-0ce4-47e163bc83ca	2234	Benedikt
00050000-56af-69e6-8f04-a8c35ac95cd3	2345	Bistrica ob Dravi
00050000-56af-69e6-4be3-a1abe19babf6	3256	Bistrica ob Sotli
00050000-56af-69e6-af53-452fa75f9465	8259	Bizeljsko
00050000-56af-69e6-0d48-1d2a431b9b3a	1223	Blagovica
00050000-56af-69e6-45bd-4816f5cb51e8	8283	Blanca
00050000-56af-69e6-210d-4b295164be5d	4260	Bled
00050000-56af-69e6-a2c1-2b39b11bc506	4273	Blejska Dobrava
00050000-56af-69e6-ca74-6709fd66e760	9265	Bodonci
00050000-56af-69e6-924e-971087b0c4ad	9222	Bogojina
00050000-56af-69e6-3a19-5c2de908a316	4263	Bohinjska Bela
00050000-56af-69e6-fe5a-ecee55692997	4264	Bohinjska Bistrica
00050000-56af-69e6-8924-4b5f2a20d566	4265	Bohinjsko jezero
00050000-56af-69e6-a7d0-740b53d0fa77	1353	Borovnica
00050000-56af-69e6-32dc-bb123385532c	8294	Boštanj
00050000-56af-69e6-6fa0-4db2573b0394	5230	Bovec
00050000-56af-69e6-4978-c4907cd8814b	5295	Branik
00050000-56af-69e6-5cb8-af44b7ab14a6	3314	Braslovče
00050000-56af-69e6-7e39-8c115e1b2556	5223	Breginj
00050000-56af-69e6-2737-2043bade9d77	8280	Brestanica
00050000-56af-69e6-bb36-e28e074f8956	2354	Bresternica
00050000-56af-69e6-9487-a143148b8e9d	4243	Brezje
00050000-56af-69e6-079e-e9620d3c7cd5	1351	Brezovica pri Ljubljani
00050000-56af-69e6-8543-dd175db62112	8250	Brežice
00050000-56af-69e6-997f-adf47e86cafe	4210	Brnik - Aerodrom
00050000-56af-69e6-bc96-5b0de080dbc3	8321	Brusnice
00050000-56af-69e6-9e03-a944ce3d1355	3255	Buče
00050000-56af-69e6-f7eb-c75bbea766dc	8276	Bučka 
00050000-56af-69e6-ff98-b798efd319b3	9261	Cankova
00050000-56af-69e6-7ecc-389331fe4502	3000	Celje 
00050000-56af-69e6-58e1-a375b48207fc	3001	Celje - poštni predali
00050000-56af-69e6-170b-ef7adc8ffac5	4207	Cerklje na Gorenjskem
00050000-56af-69e6-3e16-13a043f4b53e	8263	Cerklje ob Krki
00050000-56af-69e6-e2c3-df25d7e9c86f	1380	Cerknica
00050000-56af-69e6-f927-35e2895b4a04	5282	Cerkno
00050000-56af-69e6-7651-5330de3bfdf2	2236	Cerkvenjak
00050000-56af-69e6-76f8-d0020516e092	2215	Ceršak
00050000-56af-69e6-cfe9-3f3adb135079	2326	Cirkovce
00050000-56af-69e6-e393-e5232e2ee06c	2282	Cirkulane
00050000-56af-69e6-2545-b034a3785e40	5273	Col
00050000-56af-69e6-7131-dccc8ca78bae	8251	Čatež ob Savi
00050000-56af-69e6-f715-a6fdbd24bc34	1413	Čemšenik
00050000-56af-69e6-a4c7-a0213ac9aa95	5253	Čepovan
00050000-56af-69e6-d923-e2b045cf62fa	9232	Črenšovci
00050000-56af-69e6-33b7-f01d1110a7c4	2393	Črna na Koroškem
00050000-56af-69e6-f19b-b9aa6528e39c	6275	Črni Kal
00050000-56af-69e6-2b58-7f938b891f3e	5274	Črni Vrh nad Idrijo
00050000-56af-69e6-1a2d-2d7c0ec97392	5262	Črniče
00050000-56af-69e6-d16b-01420eb8c691	8340	Črnomelj
00050000-56af-69e6-2486-85b13851211a	6271	Dekani
00050000-56af-69e6-41a2-404540d3ca2d	5210	Deskle
00050000-56af-69e6-e893-954e3119fb9c	2253	Destrnik
00050000-56af-69e6-2eb2-2ecbc46a7689	6215	Divača
00050000-56af-69e6-1ca3-43f6f856153e	1233	Dob
00050000-56af-69e6-63e6-124b35837693	3224	Dobje pri Planini
00050000-56af-69e6-b677-09212e7b1e8a	8257	Dobova
00050000-56af-69e6-5f9c-bc4d7fd7856e	1423	Dobovec
00050000-56af-69e6-3b72-1c1ddc80988f	5263	Dobravlje
00050000-56af-69e6-6ae0-5d8ffada614d	3204	Dobrna
00050000-56af-69e6-125c-e132b1da7126	8211	Dobrnič
00050000-56af-69e6-89b4-94e43c69a782	1356	Dobrova
00050000-56af-69e6-ef31-ae1ede01a4ff	9223	Dobrovnik/Dobronak 
00050000-56af-69e6-a574-b33ef1026632	5212	Dobrovo v Brdih
00050000-56af-69e6-6ace-f5ccefc22cd2	1431	Dol pri Hrastniku
00050000-56af-69e6-e7d9-0f85f2dfcab3	1262	Dol pri Ljubljani
00050000-56af-69e6-adc3-ed35bf746599	1273	Dole pri Litiji
00050000-56af-69e6-aefa-d3ba7a1e3b46	1331	Dolenja vas
00050000-56af-69e6-0cda-9b6064d2a240	8350	Dolenjske Toplice
00050000-56af-69e6-0527-fb41b7b69bd7	1230	Domžale
00050000-56af-69e6-d9ce-81585a004b76	2252	Dornava
00050000-56af-69e6-cc8e-67c0e1279013	5294	Dornberk
00050000-56af-69e6-ad2c-eb92ddfd320f	1319	Draga
00050000-56af-69e6-372a-2f5be739a51a	8343	Dragatuš
00050000-56af-69e6-0bc1-ffd259aa043d	3222	Dramlje
00050000-56af-69e6-9ff1-a2fd906d7b7f	2370	Dravograd
00050000-56af-69e6-dcd2-420e03e8817e	4203	Duplje
00050000-56af-69e6-4315-fa9eec779470	6221	Dutovlje
00050000-56af-69e6-7e79-a74716d2a8ff	8361	Dvor
00050000-56af-69e6-3790-12bf2a726f8b	2343	Fala
00050000-56af-69e6-284b-7ed4b53d3dd1	9208	Fokovci
00050000-56af-69e6-97ca-e374d268bb0a	2313	Fram
00050000-56af-69e6-eb73-22b6a414dee7	3213	Frankolovo
00050000-56af-69e6-93d8-21178b1d0f0f	1274	Gabrovka
00050000-56af-69e6-5f82-6a5fe0410c8b	8254	Globoko
00050000-56af-69e6-e363-6c5610d024f5	5275	Godovič
00050000-56af-69e6-5806-b27cedceb459	4204	Golnik
00050000-56af-69e6-040b-302ef4a70ed8	3303	Gomilsko
00050000-56af-69e6-e435-b79a9d2508e6	4224	Gorenja vas
00050000-56af-69e6-1e7f-3bcce18e0433	3263	Gorica pri Slivnici
00050000-56af-69e6-c3ce-b6795f6b3bee	2272	Gorišnica
00050000-56af-69e6-5b07-344c0c0eda73	9250	Gornja Radgona
00050000-56af-69e6-01d0-9d7b83baa71b	3342	Gornji Grad
00050000-56af-69e6-1a8d-b281eec0faff	4282	Gozd Martuljek
00050000-56af-69e6-cd97-c6202854c2b2	6272	Gračišče
00050000-56af-69e6-bbc6-679facee0a6a	9264	Grad
00050000-56af-69e6-2897-90daf079665b	8332	Gradac
00050000-56af-69e6-0cfa-c3415ab348e1	1384	Grahovo
00050000-56af-69e6-0d09-69a0d777b27d	5242	Grahovo ob Bači
00050000-56af-69e6-4467-cfa1c25f1559	5251	Grgar
00050000-56af-69e6-f323-f2ed08c697b3	3302	Griže
00050000-56af-69e6-2a91-e8ded9c80c6e	3231	Grobelno
00050000-56af-69e6-d44c-dc78a3c537cd	1290	Grosuplje
00050000-56af-69e6-2ecb-6bf02a648cb8	2288	Hajdina
00050000-56af-69e6-1b90-44dd2c6ced33	8362	Hinje
00050000-56af-69e6-06f1-35411edcfb0d	2311	Hoče
00050000-56af-69e6-d74d-6c358de1a409	9205	Hodoš/Hodos
00050000-56af-69e6-3b37-274b7376753e	1354	Horjul
00050000-56af-69e6-38e2-3945a67e868e	1372	Hotedršica
00050000-56af-69e6-d9fc-c89398b99d10	1430	Hrastnik
00050000-56af-69e6-d9ff-a27c6a3f2a1b	6225	Hruševje
00050000-56af-69e6-8fa0-80653185a305	4276	Hrušica
00050000-56af-69e6-6354-aebccc27a10f	5280	Idrija
00050000-56af-69e6-5c9c-f0f0798a29ef	1292	Ig
00050000-56af-69e6-2642-e241ce5c2da9	6250	Ilirska Bistrica
00050000-56af-69e6-1a4a-a40a3090d7e3	6251	Ilirska Bistrica-Trnovo
00050000-56af-69e6-2191-846237d37413	1295	Ivančna Gorica
00050000-56af-69e6-7f5f-4e3d0477d1b6	2259	Ivanjkovci
00050000-56af-69e6-5d42-84a1d73afe97	1411	Izlake
00050000-56af-69e6-93ea-541ae9cc6e1e	6310	Izola/Isola
00050000-56af-69e6-a25a-556da60d14a5	2222	Jakobski Dol
00050000-56af-69e6-d419-3502a85fe6c3	2221	Jarenina
00050000-56af-69e6-3169-46116e158ab1	6254	Jelšane
00050000-56af-69e6-202f-7db49dbdd6a7	4270	Jesenice
00050000-56af-69e6-e195-42f9488401d4	8261	Jesenice na Dolenjskem
00050000-56af-69e6-577a-78d09b2077a8	3273	Jurklošter
00050000-56af-69e6-2fbf-4685af8da2ed	2223	Jurovski Dol
00050000-56af-69e6-7fbb-6e047b980dfb	2256	Juršinci
00050000-56af-69e6-436a-86a29dca3324	5214	Kal nad Kanalom
00050000-56af-69e6-5d0b-40431a3b19b5	3233	Kalobje
00050000-56af-69e6-3c2c-70e4fff41cca	4246	Kamna Gorica
00050000-56af-69e6-07e4-57a9e4922826	2351	Kamnica
00050000-56af-69e6-0061-eefc57f68c6e	1241	Kamnik
00050000-56af-69e6-dcf8-55b7b31c1912	5213	Kanal
00050000-56af-69e6-58d1-0f7392889328	8258	Kapele
00050000-56af-69e6-5a1d-28844ba40ba8	2362	Kapla
00050000-56af-69e6-76fd-65167bffb2e4	2325	Kidričevo
00050000-56af-69e6-1ab5-48295ec55992	1412	Kisovec
00050000-56af-69e6-1069-46feba8a1256	6253	Knežak
00050000-56af-69e6-f266-24050d881780	5222	Kobarid
00050000-56af-69e6-9c46-0c74743ada5a	9227	Kobilje
00050000-56af-69e6-6bd1-593e015a1d26	1330	Kočevje
00050000-56af-69e6-c1c8-6591e50ae814	1338	Kočevska Reka
00050000-56af-69e6-ac42-22a851c2a510	2276	Kog
00050000-56af-69e6-d195-efd20e4f10dd	5211	Kojsko
00050000-56af-69e6-b484-d72d9f2606cc	6223	Komen
00050000-56af-69e6-0bfd-66096caa2f04	1218	Komenda
00050000-56af-69e6-7cd3-3ad6817ee036	6000	Koper/Capodistria 
00050000-56af-69e6-269d-47e44df2992b	6001	Koper/Capodistria - poštni predali
00050000-56af-69e6-fdc0-12744b7be38d	8282	Koprivnica
00050000-56af-69e6-dda6-83a76ada2bf1	5296	Kostanjevica na Krasu
00050000-56af-69e6-58d6-6331a395953d	8311	Kostanjevica na Krki
00050000-56af-69e6-1fbc-5e18d698953b	1336	Kostel
00050000-56af-69e6-98a6-00b5071b8b8a	6256	Košana
00050000-56af-69e6-669e-eac4ae802cf1	2394	Kotlje
00050000-56af-69e6-0cc0-3700a6b05caf	6240	Kozina
00050000-56af-69e6-c572-064157b2b433	3260	Kozje
00050000-56af-69e6-ab97-02b0a3e3ec67	4000	Kranj 
00050000-56af-69e6-b4e6-1bac974df175	4001	Kranj - poštni predali
00050000-56af-69e6-f755-b1f7e186a30f	4280	Kranjska Gora
00050000-56af-69e6-1e71-029c9aee51b6	1281	Kresnice
00050000-56af-69e6-1352-fd893cc56391	4294	Križe
00050000-56af-69e6-ab28-77429f310804	9206	Križevci
00050000-56af-69e6-c43a-202386e1f38f	9242	Križevci pri Ljutomeru
00050000-56af-69e6-719a-696bc3516184	1301	Krka
00050000-56af-69e6-f880-0ca49de01e62	8296	Krmelj
00050000-56af-69e6-88a9-6d633fc4e666	4245	Kropa
00050000-56af-69e6-fec0-c80d06966aef	8262	Krška vas
00050000-56af-69e6-52db-4c93faeb141c	8270	Krško
00050000-56af-69e6-74ab-3954506ccf1b	9263	Kuzma
00050000-56af-69e6-f8f1-e94782b1bad1	2318	Laporje
00050000-56af-69e6-44b6-f7547bba25a5	3270	Laško
00050000-56af-69e6-55a3-b2e14b3b4d62	1219	Laze v Tuhinju
00050000-56af-69e6-f388-eab510d785dd	2230	Lenart v Slovenskih goricah
00050000-56af-69e6-7f12-a0445567ad39	9220	Lendava/Lendva
00050000-56af-69e6-f146-1629c573f4e9	4248	Lesce
00050000-56af-69e6-0b3f-1a0084cb6285	3261	Lesično
00050000-56af-69e6-25b6-5df65478a930	8273	Leskovec pri Krškem
00050000-56af-69e6-f999-d8b6b721b03d	2372	Libeliče
00050000-56af-69e6-efd0-c206ae3ee1ba	2341	Limbuš
00050000-56af-69e6-0346-e67294f1c962	1270	Litija
00050000-56af-69e6-4000-853263c6ef65	3202	Ljubečna
00050000-56af-69e6-75b9-622609e4fc10	1000	Ljubljana 
00050000-56af-69e6-6ad1-011a67cbc1ca	1001	Ljubljana - poštni predali
00050000-56af-69e6-ff7c-1ff03a754a9a	1231	Ljubljana - Črnuče
00050000-56af-69e6-a26a-65693d31966e	1261	Ljubljana - Dobrunje
00050000-56af-69e6-1db5-aaa0d2fac845	1260	Ljubljana - Polje
00050000-56af-69e6-01d6-f00428ba251e	1210	Ljubljana - Šentvid
00050000-56af-69e6-6150-c7037b60cf2a	1211	Ljubljana - Šmartno
00050000-56af-69e6-e107-ab9f5e0d43fa	3333	Ljubno ob Savinji
00050000-56af-69e6-17cc-cd0e93a06482	9240	Ljutomer
00050000-56af-69e6-18b7-a544c93f7cd9	3215	Loče
00050000-56af-69e6-0a96-aacd9432bacf	5231	Log pod Mangartom
00050000-56af-69e6-4a9d-db25b1a0aa98	1358	Log pri Brezovici
00050000-56af-69e6-ff2d-90eff90e8595	1370	Logatec
00050000-56af-69e6-34fa-aee15d1380a7	1371	Logatec
00050000-56af-69e6-2ca6-16017c5af32f	1434	Loka pri Zidanem Mostu
00050000-56af-69e6-298e-321a6a223d7f	3223	Loka pri Žusmu
00050000-56af-69e6-9660-8093938d93b6	6219	Lokev
00050000-56af-69e6-d92d-842c4eb1546e	1318	Loški Potok
00050000-56af-69e6-88f0-559f31a4b598	2324	Lovrenc na Dravskem polju
00050000-56af-69e6-9949-19850005c6cd	2344	Lovrenc na Pohorju
00050000-56af-69e6-590f-a5746835dc53	3334	Luče
00050000-56af-69e6-5b71-3b4303034847	1225	Lukovica
00050000-56af-69e6-8711-cdcf553d9f13	9202	Mačkovci
00050000-56af-69e6-3536-63038fde5054	2322	Majšperk
00050000-56af-69e6-f25b-cf3b070356ec	2321	Makole
00050000-56af-69e6-7f89-a81791063a12	9243	Mala Nedelja
00050000-56af-69e6-983c-5a72a3d8d4b7	2229	Malečnik
00050000-56af-69e6-4082-0a64d46a6d5b	6273	Marezige
00050000-56af-69e6-6610-483894ad2bcf	2000	Maribor 
00050000-56af-69e6-de03-79a01a8148b0	2001	Maribor - poštni predali
00050000-56af-69e6-03bd-f384d8c1ddd3	2206	Marjeta na Dravskem polju
00050000-56af-69e6-0080-d11db2ae3ff5	2281	Markovci
00050000-56af-69e6-0f1e-be1735d36899	9221	Martjanci
00050000-56af-69e6-87ae-7764f98cc780	6242	Materija
00050000-56af-69e6-2e6e-0369512934dc	4211	Mavčiče
00050000-56af-69e6-e858-38abbb3c60ce	1215	Medvode
00050000-56af-69e6-ec9a-155f95492a15	1234	Mengeš
00050000-56af-69e6-a07d-72f5beb5beac	8330	Metlika
00050000-56af-69e6-2e85-73b32372935e	2392	Mežica
00050000-56af-69e6-152e-5aec6e8060cc	2204	Miklavž na Dravskem polju
00050000-56af-69e6-851a-9f90c634f892	2275	Miklavž pri Ormožu
00050000-56af-69e6-9436-147ef8f358f8	5291	Miren
00050000-56af-69e6-9410-b6ea8fdffbe3	8233	Mirna
00050000-56af-69e6-0793-d0e65524df91	8216	Mirna Peč
00050000-56af-69e6-9080-5c4dc9a65b7f	2382	Mislinja
00050000-56af-69e6-8fde-2a297b6951d2	4281	Mojstrana
00050000-56af-69e6-265e-e3b94cec0247	8230	Mokronog
00050000-56af-69e6-9f07-5ae276033688	1251	Moravče
00050000-56af-69e6-159b-c1dd342876ed	9226	Moravske Toplice
00050000-56af-69e6-b9e9-7ba5e2a0fda7	5216	Most na Soči
00050000-56af-69e6-6327-4301bf6740c0	1221	Motnik
00050000-56af-69e6-e079-b997b58dbfbc	3330	Mozirje
00050000-56af-69e6-c5fa-7fd7b23447e1	9000	Murska Sobota 
00050000-56af-69e6-b8d0-238154533f15	9001	Murska Sobota - poštni predali
00050000-56af-69e6-bd1a-7add553393b1	2366	Muta
00050000-56af-69e6-1090-b47ff899fb33	4202	Naklo
00050000-56af-69e6-bfe7-569d39520586	3331	Nazarje
00050000-56af-69e6-b169-5ecbcc3d5d1a	1357	Notranje Gorice
00050000-56af-69e6-d207-363369c8dd24	3203	Nova Cerkev
00050000-56af-69e6-73d6-76cad8f56af4	5000	Nova Gorica 
00050000-56af-69e6-947d-6c77e7662a82	5001	Nova Gorica - poštni predali
00050000-56af-69e6-c831-a46c1458df6e	1385	Nova vas
00050000-56af-69e6-0dc5-99a7c065961f	8000	Novo mesto
00050000-56af-69e6-0a11-0f10f1566e34	8001	Novo mesto - poštni predali
00050000-56af-69e6-7e70-b2102b54bcdf	6243	Obrov
00050000-56af-69e6-727a-feceb6182121	9233	Odranci
00050000-56af-69e6-e759-cc63018c0946	2317	Oplotnica
00050000-56af-69e6-dbb4-a7cfc0b2219a	2312	Orehova vas
00050000-56af-69e6-8085-c0db6c584197	2270	Ormož
00050000-56af-69e6-bd76-f60d551ca096	1316	Ortnek
00050000-56af-69e6-e7de-4cb7fde25e42	1337	Osilnica
00050000-56af-69e6-194f-1352aea179b4	8222	Otočec
00050000-56af-69e6-71eb-41917bbb7390	2361	Ožbalt
00050000-56af-69e6-72ee-34e2dcbc7da8	2231	Pernica
00050000-56af-69e6-c8ae-001cbaa2ed3d	2211	Pesnica pri Mariboru
00050000-56af-69e6-b067-ec9cbc3e9a59	9203	Petrovci
00050000-56af-69e6-2a4e-c79af8b6b756	3301	Petrovče
00050000-56af-69e6-81e2-e27aaa1bc25b	6330	Piran/Pirano
00050000-56af-69e6-f113-32677823bd18	8255	Pišece
00050000-56af-69e6-8249-1e2fcc1ee61b	6257	Pivka
00050000-56af-69e6-c2a3-8a0752f26caf	6232	Planina
00050000-56af-69e6-e26d-c3a7ad289c34	3225	Planina pri Sevnici
00050000-56af-69e6-254e-3c9684de6c15	6276	Pobegi
00050000-56af-69e6-7944-b625fc5856d3	8312	Podbočje
00050000-56af-69e6-d4fb-d206bf04b175	5243	Podbrdo
00050000-56af-69e6-57d6-84c458c712df	3254	Podčetrtek
00050000-56af-69e6-c7bc-b8bb67b3fd85	2273	Podgorci
00050000-56af-69e6-c2e3-25f5a76ec11f	6216	Podgorje
00050000-56af-69e6-c833-81ff5fc05c14	2381	Podgorje pri Slovenj Gradcu
00050000-56af-69e6-7fe5-d9715331dc02	6244	Podgrad
00050000-56af-69e6-9f14-8b77c4b98c2a	1414	Podkum
00050000-56af-69e6-14b9-f80acff6a012	2286	Podlehnik
00050000-56af-69e6-923e-d6fed0e99e9a	5272	Podnanos
00050000-56af-69e6-f5cc-cff47cad929f	4244	Podnart
00050000-56af-69e6-6356-c785870def42	3241	Podplat
00050000-56af-69e6-89a2-78a976fd6eb8	3257	Podsreda
00050000-56af-69e6-90d7-c77a212ec4cc	2363	Podvelka
00050000-56af-69e6-6cb2-d2d26a8acefa	2208	Pohorje
00050000-56af-69e6-4eef-2bd537f67888	2257	Polenšak
00050000-56af-69e6-76b3-63155e4ae304	1355	Polhov Gradec
00050000-56af-69e6-c0d3-73adec60942b	4223	Poljane nad Škofjo Loko
00050000-56af-69e6-5e56-93b9ab0f10dd	2319	Poljčane
00050000-56af-69e6-a0a0-7924a0f10786	1272	Polšnik
00050000-56af-69e6-00dd-95f9d618d576	3313	Polzela
00050000-56af-69e6-b77c-562fa94efa50	3232	Ponikva
00050000-56af-69e6-6a5d-94df561c096c	6320	Portorož/Portorose
00050000-56af-69e6-bc47-3e053033060e	6230	Postojna
00050000-56af-69e6-914d-4154c473b44d	2331	Pragersko
00050000-56af-69e6-a898-6bfd0ac0603d	3312	Prebold
00050000-56af-69e6-16e0-e4c7fcf1ef62	4205	Preddvor
00050000-56af-69e6-3c88-1bdb8d686300	6255	Prem
00050000-56af-69e6-5cf3-feeceb6ba32a	1352	Preserje
00050000-56af-69e6-f81b-b91f2e4624ee	6258	Prestranek
00050000-56af-69e6-1962-704f8e049f17	2391	Prevalje
00050000-56af-69e6-4036-d15f4dbb5b0c	3262	Prevorje
00050000-56af-69e6-f306-6777b8fdacd8	1276	Primskovo 
00050000-56af-69e6-c55e-a832a48b532b	3253	Pristava pri Mestinju
00050000-56af-69e6-d1ec-cce12a822894	9207	Prosenjakovci/Partosfalva
00050000-56af-69e6-9eb0-a20ea32d8461	5297	Prvačina
00050000-56af-69e6-7251-22de3ad370e3	2250	Ptuj
00050000-56af-69e6-3dc4-62091b53f6bd	2323	Ptujska Gora
00050000-56af-69e6-e7e6-0f1dec7449e8	9201	Puconci
00050000-56af-69e6-fa57-e228b52cf465	2327	Rače
00050000-56af-69e6-75f0-14e53707bc26	1433	Radeče
00050000-56af-69e6-9d93-e7d79a385bd3	9252	Radenci
00050000-56af-69e6-8548-1fd9de201731	2360	Radlje ob Dravi
00050000-56af-69e6-3b6b-1017ec4c1b81	1235	Radomlje
00050000-56af-69e6-9ed0-13f847e75d6b	4240	Radovljica
00050000-56af-69e6-da69-433c16a26677	8274	Raka
00050000-56af-69e6-48de-197af540dbfd	1381	Rakek
00050000-56af-69e6-e4a3-ffc1169c2957	4283	Rateče - Planica
00050000-56af-69e6-eee4-0d371a31778a	2390	Ravne na Koroškem
00050000-56af-69e6-738b-60fc6d4a652a	9246	Razkrižje
00050000-56af-69e6-5170-8276c1ece355	3332	Rečica ob Savinji
00050000-56af-69e6-54fc-7e7478b06ec0	5292	Renče
00050000-56af-69e6-c30d-769565d3e9a4	1310	Ribnica
00050000-56af-69e6-f2e4-c762ce1b59b7	2364	Ribnica na Pohorju
00050000-56af-69e6-991c-aed32e57421c	3272	Rimske Toplice
00050000-56af-69e6-d531-0e78f6b11b06	1314	Rob
00050000-56af-69e6-3acb-0ce49eb561a4	5215	Ročinj
00050000-56af-69e6-a619-033d755dcd67	3250	Rogaška Slatina
00050000-56af-69e6-ed26-18e4cb5f7d2f	9262	Rogašovci
00050000-56af-69e6-a9d7-52871ce1bbac	3252	Rogatec
00050000-56af-69e6-366e-91afc58df154	1373	Rovte
00050000-56af-69e6-f3dc-0a6ff1ffd0a7	2342	Ruše
00050000-56af-69e6-5657-70c0ad2a43ad	1282	Sava
00050000-56af-69e6-7941-66ec20a516c3	6333	Sečovlje/Sicciole
00050000-56af-69e6-5200-dbd5384c9946	4227	Selca
00050000-56af-69e6-331d-d9a200b7cced	2352	Selnica ob Dravi
00050000-56af-69e6-8f77-0636b51d022a	8333	Semič
00050000-56af-69e6-c5d3-ee18436a7b18	8281	Senovo
00050000-56af-69e6-2837-b7b52b6bf70a	6224	Senožeče
00050000-56af-69e6-b318-fdcefad056e3	8290	Sevnica
00050000-56af-69e6-14b4-dc03b1b44e79	6210	Sežana
00050000-56af-69e6-9493-175c1a28dbdd	2214	Sladki Vrh
00050000-56af-69e6-9472-0fd1ce5c4bf0	5283	Slap ob Idrijci
00050000-56af-69e6-5ee2-a63317700110	2380	Slovenj Gradec
00050000-56af-69e6-ae53-c66fce02101c	2310	Slovenska Bistrica
00050000-56af-69e6-240b-5ec1bd87fef9	3210	Slovenske Konjice
00050000-56af-69e6-f06c-ba47558e883b	1216	Smlednik
00050000-56af-69e6-9365-c0e917d89e3c	5232	Soča
00050000-56af-69e6-fd2d-52419bc07ddd	1317	Sodražica
00050000-56af-69e6-ec76-49cb44a8a110	3335	Solčava
00050000-56af-69e6-bc98-19b4b1974485	5250	Solkan
00050000-56af-69e6-efa7-0f5686c1efec	4229	Sorica
00050000-56af-69e6-ed53-044795498101	4225	Sovodenj
00050000-56af-69e6-c454-b6b1b4d4d7c6	5281	Spodnja Idrija
00050000-56af-69e6-b137-36183e1cbf2d	2241	Spodnji Duplek
00050000-56af-69e6-e1f4-8d8811ea128c	9245	Spodnji Ivanjci
00050000-56af-69e6-68c4-73d0faf30044	2277	Središče ob Dravi
00050000-56af-69e6-2ec4-c400755838e1	4267	Srednja vas v Bohinju
00050000-56af-69e6-a72c-ae5b4cc68d3b	8256	Sromlje 
00050000-56af-69e6-0647-30ed0f5b97df	5224	Srpenica
00050000-56af-69e6-02d9-1f828d8a84db	1242	Stahovica
00050000-56af-69e6-0e50-9c9f231cef8f	1332	Stara Cerkev
00050000-56af-69e6-0884-da1962c31249	8342	Stari trg ob Kolpi
00050000-56af-69e6-963f-6fb332572ec2	1386	Stari trg pri Ložu
00050000-56af-69e6-aec0-bf9f9efb3727	2205	Starše
00050000-56af-69e6-4506-c860521260b2	2289	Stoperce
00050000-56af-69e6-eccf-8b59d145684f	8322	Stopiče
00050000-56af-69e6-8f27-65240bf3dcf8	3206	Stranice
00050000-56af-69e6-4d43-53700b08f3fd	8351	Straža
00050000-56af-69e6-1e49-67230e889490	1313	Struge
00050000-56af-69e6-6432-7c746ba6138d	8293	Studenec
00050000-56af-69e6-e99c-6d4327445b83	8331	Suhor
00050000-56af-69e6-45e3-6ea0c05ee295	2233	Sv. Ana v Slovenskih goricah
00050000-56af-69e6-4e04-203e3066d297	2235	Sv. Trojica v Slovenskih goricah
00050000-56af-69e6-9e87-70b96af85fad	2353	Sveti Duh na Ostrem Vrhu
00050000-56af-69e6-f438-93a4813da0ed	9244	Sveti Jurij ob Ščavnici
00050000-56af-69e6-cd4e-bb45682a23af	3264	Sveti Štefan
00050000-56af-69e6-f639-c28048f88ce4	2258	Sveti Tomaž
00050000-56af-69e6-ebcc-991c6f702ca7	9204	Šalovci
00050000-56af-69e6-798b-b1bb48c39839	5261	Šempas
00050000-56af-69e6-e1de-e95acc0023c7	5290	Šempeter pri Gorici
00050000-56af-69e6-e180-a0c92faf2991	3311	Šempeter v Savinjski dolini
00050000-56af-69e6-03c0-bd9f3983da4a	4208	Šenčur
00050000-56af-69e6-eb11-5d69c996ac91	2212	Šentilj v Slovenskih goricah
00050000-56af-69e6-ed4e-ef5294f61f95	8297	Šentjanž
00050000-56af-69e6-b7a8-3b5eac8e2613	2373	Šentjanž pri Dravogradu
00050000-56af-69e6-6ad2-ae0f74dfd0cd	8310	Šentjernej
00050000-56af-69e6-7351-7e2c5b599247	3230	Šentjur
00050000-56af-69e6-1317-37b6dbeda724	3271	Šentrupert
00050000-56af-69e6-5de8-55d9ae34243a	8232	Šentrupert
00050000-56af-69e6-f9b3-f020bdd1731b	1296	Šentvid pri Stični
00050000-56af-69e6-8d63-196728afe444	8275	Škocjan
00050000-56af-69e6-74e6-e30297743078	6281	Škofije
00050000-56af-69e6-7f98-f0c8c2c28292	4220	Škofja Loka
00050000-56af-69e6-8c1b-179977cfb171	3211	Škofja vas
00050000-56af-69e6-6959-5fdcfafeba09	1291	Škofljica
00050000-56af-69e6-706b-717f383077ca	6274	Šmarje
00050000-56af-69e6-3903-a9ea01047e92	1293	Šmarje - Sap
00050000-56af-69e6-5212-175042cda219	3240	Šmarje pri Jelšah
00050000-56af-69e6-e891-74f76c2bd02e	8220	Šmarješke Toplice
00050000-56af-69e6-60fe-f81f6d65a9e5	2315	Šmartno na Pohorju
00050000-56af-69e6-de7b-c6841a252f3e	3341	Šmartno ob Dreti
00050000-56af-69e6-9ce6-e08e1b10c38c	3327	Šmartno ob Paki
00050000-56af-69e6-27a2-3901d599089f	1275	Šmartno pri Litiji
00050000-56af-69e6-fe90-fa86a0651633	2383	Šmartno pri Slovenj Gradcu
00050000-56af-69e6-d15f-9a93f708a521	3201	Šmartno v Rožni dolini
00050000-56af-69e6-1764-c5f65bcaf56e	3325	Šoštanj
00050000-56af-69e6-5983-a8c63f773266	6222	Štanjel
00050000-56af-69e6-95d6-6cde0fd996c5	3220	Štore
00050000-56af-69e6-c6bf-1fbb8973fc2f	3304	Tabor
00050000-56af-69e6-9214-5b307a0278f5	3221	Teharje
00050000-56af-69e6-ff96-750faca2dc77	9251	Tišina
00050000-56af-69e6-9b98-a46fd90ab367	5220	Tolmin
00050000-56af-69e6-1a51-0f0532f53f9b	3326	Topolšica
00050000-56af-69e6-6697-a2a022d9254b	2371	Trbonje
00050000-56af-69e6-7c15-993a54229d6f	1420	Trbovlje
00050000-56af-69e6-1286-0427c87a3f05	8231	Trebelno 
00050000-56af-69e6-e162-fd57b292d3cf	8210	Trebnje
00050000-56af-69e6-c7d5-21049e1504c1	5252	Trnovo pri Gorici
00050000-56af-69e6-44b0-48c1ec3dd32f	2254	Trnovska vas
00050000-56af-69e6-379b-b668b5b5a831	1222	Trojane
00050000-56af-69e6-2ce8-42c36608e1fb	1236	Trzin
00050000-56af-69e6-1ad7-0b7f3d5d9f8e	4290	Tržič
00050000-56af-69e6-fc38-ddc0e2050b28	8295	Tržišče
00050000-56af-69e6-bc6f-4ff61e447bf0	1311	Turjak
00050000-56af-69e6-2619-c6c23ef65ed3	9224	Turnišče
00050000-56af-69e6-6ee0-2b8fee458c5e	8323	Uršna sela
00050000-56af-69e6-3c5a-836b76e2eace	1252	Vače
00050000-56af-69e6-396d-eb37110414a6	3320	Velenje 
00050000-56af-69e6-bd1b-c368e0eede07	3322	Velenje - poštni predali
00050000-56af-69e6-6ba1-7355327ae6c1	8212	Velika Loka
00050000-56af-69e6-de4c-80ffc3780baf	2274	Velika Nedelja
00050000-56af-69e6-90b0-6cdc84544dc7	9225	Velika Polana
00050000-56af-69e6-2461-72f6568e16fb	1315	Velike Lašče
00050000-56af-69e6-4ebe-9132159df08e	8213	Veliki Gaber
00050000-56af-69e6-1ef3-5e1e3a5e0457	9241	Veržej
00050000-56af-69e6-cd56-0b1227d471ea	1312	Videm - Dobrepolje
00050000-56af-69e6-fe89-204dae520bef	2284	Videm pri Ptuju
00050000-56af-69e6-19a3-834a97ed3b3a	8344	Vinica
00050000-56af-69e6-3505-d713287d0188	5271	Vipava
00050000-56af-69e6-e763-060ba3e4dc43	4212	Visoko
00050000-56af-69e6-9656-98a675f3e62b	1294	Višnja Gora
00050000-56af-69e6-fdb6-b9918aee306b	3205	Vitanje
00050000-56af-69e6-9047-acd4505b8256	2255	Vitomarci
00050000-56af-69e6-cf8c-dfa5cc654712	1217	Vodice
00050000-56af-69e6-02df-b49ad23a9d7e	3212	Vojnik\t
00050000-56af-69e6-7f4c-1cbbdf11a553	5293	Volčja Draga
00050000-56af-69e6-2a40-d9feb708c309	2232	Voličina
00050000-56af-69e6-7ebe-95adea40b9b7	3305	Vransko
00050000-56af-69e6-aaa1-75f9df9c6ecd	6217	Vremski Britof
00050000-56af-69e6-ac3c-bab33cefae32	1360	Vrhnika
00050000-56af-69e6-fe5d-57e1eed9a8f8	2365	Vuhred
00050000-56af-69e6-49e0-2246c93da8f4	2367	Vuzenica
00050000-56af-69e6-b5b8-6ba43c2f182e	8292	Zabukovje 
00050000-56af-69e6-e3f1-86842716405a	1410	Zagorje ob Savi
00050000-56af-69e6-fc10-628f9081a3b9	1303	Zagradec
00050000-56af-69e6-6df2-1e9c4c43c4f5	2283	Zavrč
00050000-56af-69e6-c546-f2fa9ce52c59	8272	Zdole 
00050000-56af-69e6-b091-0fae3ed66e9b	4201	Zgornja Besnica
00050000-56af-69e6-8e93-0194ce6cbb12	2242	Zgornja Korena
00050000-56af-69e6-ba37-f7705efea21e	2201	Zgornja Kungota
00050000-56af-69e6-7054-db537d9f8b31	2316	Zgornja Ložnica
00050000-56af-69e6-cc68-ee500581826c	2314	Zgornja Polskava
00050000-56af-69e6-d3f8-ddbc04f29490	2213	Zgornja Velka
00050000-56af-69e6-feab-3a6d0f15e4c6	4247	Zgornje Gorje
00050000-56af-69e6-838b-95d089001a32	4206	Zgornje Jezersko
00050000-56af-69e6-da5e-c0138b24cfc6	2285	Zgornji Leskovec
00050000-56af-69e6-4023-753310359c1c	1432	Zidani Most
00050000-56af-69e6-b23d-ec006eebbe25	3214	Zreče
00050000-56af-69e6-67a8-1877ff058e85	4209	Žabnica
00050000-56af-69e6-2ab1-b066974d34db	3310	Žalec
00050000-56af-69e6-6d1c-aa53399c48c3	4228	Železniki
00050000-56af-69e6-b501-430f714c0f19	2287	Žetale
00050000-56af-69e6-65e3-154392605984	4226	Žiri
00050000-56af-69e6-72aa-30ece4365eb4	4274	Žirovnica
00050000-56af-69e6-5fe7-bdb504cede49	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 42322172)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 42321742)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 42321482)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56af-69ea-f1ce-30a7dbcc422c	00080000-56af-69ea-772d-15ffc38e1295	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56af-69ea-1595-1661919ec2f2	00080000-56af-69ea-772d-15ffc38e1295	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56af-69ea-e4ff-0a19d6e3a70f	00080000-56af-69ea-04dc-d7aa96d18012	\N	00040000-56af-69e7-e3b7-80f0557bb9cc	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 42321617)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56af-69e7-39df-975c043d287e	novo leto	1	1	\N	t
00430000-56af-69e7-0313-2ba2aeddd2ab	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56af-69e7-5de9-b5826d6f024f	dan upora proti okupatorju	27	4	\N	t
00430000-56af-69e7-719e-562f18b251c6	praznik dela	1	5	\N	t
00430000-56af-69e7-9b4e-4d5565151229	praznik dela	2	5	\N	t
00430000-56af-69e7-6a46-d16f80b4457e	dan Primoža Trubarja	8	6	\N	f
00430000-56af-69e7-9d0d-83b3fd180a85	dan državnosti	25	6	\N	t
00430000-56af-69e7-77dc-13688e37b095	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56af-69e7-8e87-ab22649193f3	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56af-69e7-bc0c-4fdd3fee4d1d	dan suverenosti	25	10	\N	f
00430000-56af-69e7-2d3d-f99c8c69017d	dan spomina na mrtve	1	11	\N	t
00430000-56af-69e7-615d-c22422058a34	dan Rudolfa Maistra	23	11	\N	f
00430000-56af-69e7-328c-d643bdf65a41	božič	25	12	\N	t
00430000-56af-69e7-9b1f-dedeac66449b	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56af-69e7-2329-5d32ffb02989	Marijino vnebovzetje	15	8	\N	t
00430000-56af-69e7-ed51-976fca229095	dan reformacije	31	10	\N	t
00430000-56af-69e7-6f5b-d47047cb4a8a	velikonočna nedelja	27	3	2016	t
00430000-56af-69e7-3119-a086f8e8d2fa	velikonočna nedelja	16	4	2017	t
00430000-56af-69e7-b210-8243a5169f35	velikonočna nedelja	1	4	2018	t
00430000-56af-69e7-5d30-5501928fbf6b	velikonočna nedelja	21	4	2019	t
00430000-56af-69e7-24e9-7af1c02ce6fd	velikonočna nedelja	12	4	2020	t
00430000-56af-69e7-8cf4-b6c4a5955c0d	velikonočna nedelja	4	4	2021	t
00430000-56af-69e7-a2fb-f14d60637d5c	velikonočna nedelja	17	4	2022	t
00430000-56af-69e7-56e9-834871da8d37	velikonočna nedelja	9	4	2023	t
00430000-56af-69e7-a86b-c8d40c658b95	velikonočna nedelja	31	3	2024	t
00430000-56af-69e7-09e3-ad977412263f	velikonočna nedelja	20	4	2025	t
00430000-56af-69e7-9dae-b3474a16c2ed	velikonočna nedelja	5	4	2026	t
00430000-56af-69e7-705c-4878955bbcb7	velikonočna nedelja	28	3	2027	t
00430000-56af-69e7-f06d-eb268d0e5446	velikonočna nedelja	16	4	2028	t
00430000-56af-69e7-8e0f-075826642fff	velikonočna nedelja	1	4	2029	t
00430000-56af-69e7-00f5-3b7258ed9a99	velikonočna nedelja	21	4	2030	t
00430000-56af-69e7-75b7-6ed9155c7dac	velikonočni ponedeljek	28	3	2016	t
00430000-56af-69e7-e75c-761ec490d13b	velikonočni ponedeljek	17	4	2017	t
00430000-56af-69e7-ea00-271daff73b4d	velikonočni ponedeljek	2	4	2018	t
00430000-56af-69e7-fcab-6866c051743b	velikonočni ponedeljek	22	4	2019	t
00430000-56af-69e7-c54d-586d6acb4231	velikonočni ponedeljek	13	4	2020	t
00430000-56af-69e7-9fd2-57e3ee4cdf8e	velikonočni ponedeljek	5	4	2021	t
00430000-56af-69e7-74bf-3786da5dc86f	velikonočni ponedeljek	18	4	2022	t
00430000-56af-69e7-1d43-658ba0679281	velikonočni ponedeljek	10	4	2023	t
00430000-56af-69e7-cf5e-6a7fcd655823	velikonočni ponedeljek	1	4	2024	t
00430000-56af-69e7-67c8-fd722d9d7af1	velikonočni ponedeljek	21	4	2025	t
00430000-56af-69e7-1ab2-02ca1200b9c2	velikonočni ponedeljek	6	4	2026	t
00430000-56af-69e7-e10d-6a4f3712b166	velikonočni ponedeljek	29	3	2027	t
00430000-56af-69e7-56a5-18771395d929	velikonočni ponedeljek	17	4	2028	t
00430000-56af-69e7-177b-c159bc1c6fc7	velikonočni ponedeljek	2	4	2029	t
00430000-56af-69e7-dca1-4e0b879c342d	velikonočni ponedeljek	22	4	2030	t
00430000-56af-69e7-9649-69b031f511d6	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56af-69e7-80dc-954368860491	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56af-69e7-0ed5-8b9ec391d2cd	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56af-69e7-6686-dee9fe79e2f3	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56af-69e7-2746-984e1dffc19f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56af-69e7-b8e4-c73826c7d900	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56af-69e7-028d-08d9d9a3c2e2	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56af-69e7-9405-70e4663e84a5	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56af-69e7-d44b-f62dd4589a3e	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56af-69e7-2fa6-73dde207d2a3	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56af-69e7-bea9-089f19e72fe7	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56af-69e7-ea92-c4e4800e6f51	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56af-69e7-f8ad-dadbc9274b7c	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56af-69e7-ad82-1befeec6faaa	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56af-69e7-20db-f7aabb697e51	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 42321586)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56af-69eb-dffc-499ed3a880c2	000e0000-56af-69eb-3ad7-57fc0f30e4f6	1	3	1
001b0000-56af-69eb-a79e-3a571577680f	000e0000-56af-69eb-3ad7-57fc0f30e4f6	2	4	2
001b0000-56af-69eb-dc61-51a8997497e5	000e0000-56af-69eb-3ad7-57fc0f30e4f6	4	5	3
001b0000-56af-69eb-8bec-7db6a1152e21	000e0000-56af-69eb-3ad7-57fc0f30e4f6	\N	1	\N
001b0000-56af-69eb-29ff-7c65ac0c5ea6	000e0000-56af-69eb-3ad7-57fc0f30e4f6	5	9	4
001b0000-56af-69eb-6e5b-c82d278dc3bb	000e0000-56af-69eb-3ad7-57fc0f30e4f6	7	10	5
001b0000-56af-69eb-d6ab-d213736c0688	000e0000-56af-69eb-468b-e81409adbdfd	3	2	1
001b0000-56af-69eb-0ca4-033981003723	000e0000-56af-69eb-468b-e81409adbdfd	4	3	1
001b0000-56af-69eb-4e14-29f2ddad8841	000e0000-56af-69eb-3ad7-57fc0f30e4f6	\N	2	\N
001b0000-56af-69eb-d31c-1116f16e4b6f	000e0000-56af-69eb-468b-e81409adbdfd	\N	1	\N
001b0000-56af-69eb-b903-56fbd8a725b3	000e0000-56af-69eb-3ad7-57fc0f30e4f6	3	8	3
001b0000-56af-69eb-8f78-cd9be370d315	000e0000-56af-69eb-3ad7-57fc0f30e4f6	2	11	1
001b0000-56af-69eb-a6f6-a8cebcd4a66e	000e0000-56af-69eb-468b-e81409adbdfd	1	5	1
001b0000-56af-69eb-3d00-0016730724d0	000e0000-56af-69eb-468b-e81409adbdfd	6	4	2
001b0000-56af-69eb-a858-7e3e27f39684	000e0000-56af-69eb-3ad7-57fc0f30e4f6	1	6	1
001b0000-56af-69eb-8590-7f0d5f8a1998	000e0000-56af-69eb-3ad7-57fc0f30e4f6	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 42321592)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56af-69eb-dffc-499ed3a880c2	000a0000-56af-69ea-0b11-975ef8947ea7
001b0000-56af-69eb-dffc-499ed3a880c2	000a0000-56af-69ea-ac83-64fe0c7458de
001b0000-56af-69eb-a79e-3a571577680f	000a0000-56af-69ea-ac83-64fe0c7458de
001b0000-56af-69eb-a79e-3a571577680f	000a0000-56af-69ea-e91d-48cf7eef2459
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 42321754)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 42322186)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 42322196)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56af-69ea-c621-bbe7b7d45a74	00080000-56af-69ea-3c6a-05bb065ffb21	0987	AK
00190000-56af-69ea-9c49-96a7d61efcc2	00080000-56af-69ea-04dc-d7aa96d18012	0989	AK
00190000-56af-69ea-d951-e95b45303ef4	00080000-56af-69ea-acbc-e74bd2b29a52	0986	AK
00190000-56af-69ea-74c2-81b588309d03	00080000-56af-69ea-6fc7-f9eb790b8434	0984	AK
00190000-56af-69ea-53e2-96521b5be98d	00080000-56af-69ea-9015-fa04cae05a04	0983	AK
00190000-56af-69ea-1769-2d8a147c037f	00080000-56af-69ea-297b-de02c4e728fb	0982	AK
00190000-56af-69ed-c33b-0fb8be975cd1	00080000-56af-69ed-35e7-b2acdf9456da	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 42322085)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56af-69eb-1158-73747d34f9c7	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 42322204)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 42321782)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56af-69ea-9ce5-75cac91018ed	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56af-69ea-c700-5d48c1c0e6dd	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56af-69ea-6385-2a1d06a71585	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56af-69ea-e6ac-cf7b78e81400	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56af-69ea-a11f-6f19fc079fc5	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56af-69ea-f198-f4d501291970	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56af-69ea-48dd-bcee9858d414	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 42321727)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 42321717)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 42321924)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 42321854)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 42321560)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 42321321)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56af-69ed-35e7-b2acdf9456da	00010000-56af-69e8-232d-44ef4af169f2	2016-02-01 15:21:33	INS	a:0:{}
2	App\\Entity\\Option	00000000-56af-69ed-a6c0-e72e3c1fb737	00010000-56af-69e8-232d-44ef4af169f2	2016-02-01 15:21:33	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56af-69ed-c33b-0fb8be975cd1	00010000-56af-69e8-232d-44ef4af169f2	2016-02-01 15:21:33	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 42321796)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 42321359)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56af-69e7-aefc-b4dd92e30327	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56af-69e7-b4a7-94b50cf7bf17	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56af-69e7-aaa4-f5f6a2350a80	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56af-69e7-1113-12e5e8b10404	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56af-69e7-5b3d-6447d10461ef	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56af-69e7-1cc1-711cf45f0dd4	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56af-69e7-d555-dd9d6b910c4c	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56af-69e7-b2b1-3128b8bebc1b	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56af-69e7-1e43-37ebdc922f6e	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-69e7-6076-108117031612	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-69e7-5945-de5d51b77d87	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-69e7-7892-2a30b55f52ab	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-69e7-277f-f13fdd389cf7	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-69e7-82e7-38aa66366554	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-69e7-19e0-a8cec65ca40a	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-69e7-b05a-9ea37f6f61b7	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-69e7-e913-1e518d1b565f	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56af-69e7-1418-abde13c7099a	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56af-69e7-de61-d8da224dc13d	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56af-69e7-a609-4c0190c917b6	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56af-69e7-49bb-24200b37657e	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-69e7-f017-0de47b65acca	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-69e7-5437-928e92139373	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-69e7-2fcb-39bde2f7b24a	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-69e7-7b81-e793e8152531	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56af-69e7-0282-aec6d229ae34	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56af-69e7-545e-2a3ef865577f	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56af-69e8-e7da-61f3181cffa8	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56af-69e8-9f56-26e087720e1d	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56af-69e8-c237-13c0599998a9	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56af-69e8-77b8-411f76c3fd07	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-69e8-a01c-771892e35665	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-69e8-0239-057a7631a26e	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56af-69e8-5621-a3b15f643622	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56af-69e8-7194-a984748e4258	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56af-69e8-336d-d5bf9e5a4390	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56af-69e8-e1aa-982ff136a7ae	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-69e8-66eb-15a71a0c2eae	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-69e8-2894-bf57f6318738	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56af-69e8-58b0-c9c3ea14d4c6	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-69e8-8e00-ac5f775111e5	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-69e8-100e-fc7a1e976ed0	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56af-69e8-215a-21215b338c9a	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-69e8-e93f-b2801eb493d6	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-69e8-34ec-0f9bd5a0c79f	direktor	minimalne pravice za direktorja	t
00020000-56af-69e8-9fb1-3a72a19014f3	arhivar	arhivar	t
00020000-56af-69e8-e6f3-6288f52aceb4	dramaturg	dramaturg	t
00020000-56af-69e8-3218-404021d45d08	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56af-69e8-657a-76b1bbd9a7f9	poslovni-sekretar	poslovni sekretar	t
00020000-56af-69e8-7393-e5b48226c0de	vodja-tehnike	vodja tehnike	t
00020000-56af-69e8-3c63-d4cf07366d5a	racunovodja	računovodja	t
00020000-56af-69ea-33f1-62d9631a75e2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56af-69ea-cde8-cc3258f72b36	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-1582-ea6dcd3a0c13	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-d98e-a2376ca3fb8b	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-593f-bf721c73b961	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-235a-39d3e15655a6	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-abec-4a2bcf506dfc	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-d39e-c38f706fe51c	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-e0c2-8c73c8d1c198	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-63a3-2ee0005e79ed	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-f802-2ce0e28b476c	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-3f8c-597befb98194	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-3e0d-68c8d6c475ff	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-f12b-32277eaef1e9	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-7bfb-b91592f41a98	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-6846-1751c6d5a2f6	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-56ba-97ea370b2af9	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-5275-be865ef79c6e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-5f88-8e53ac309471	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-9b97-74c0e52fd758	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56af-69ea-d3f2-9e34100a2896	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-464d-13a94a9dae9d	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-4fab-6047899c4cd0	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-780a-71461c9a08d0	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-d368-42dce2897681	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-6c48-fafe09850d87	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-03ca-b9b3e19ed01c	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-7c84-b841b7fa7e86	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-1d6c-d7905dcf7671	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-27ed-77db5910f56e	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-5e90-c2f759ae203d	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-2a2d-05b38e834b14	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-ff9d-4ed1521bad9e	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-b676-c67d93fc5709	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-713c-5cac3dac6e83	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-f38a-ce398037d840	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-eeff-f34c99e689bf	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-0113-6639cbd133f9	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56af-69ea-d712-6b2cf4459933	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 42321343)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56af-69e8-20b1-f4066e2aaf00	00020000-56af-69e7-aaa4-f5f6a2350a80
00010000-56af-69e8-232d-44ef4af169f2	00020000-56af-69e7-aaa4-f5f6a2350a80
00010000-56af-69ea-04fe-d114c314a1f5	00020000-56af-69ea-33f1-62d9631a75e2
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-cde8-cc3258f72b36
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-235a-39d3e15655a6
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-63a3-2ee0005e79ed
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-3f8c-597befb98194
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-f12b-32277eaef1e9
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-5f88-8e53ac309471
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-d98e-a2376ca3fb8b
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-d3f2-9e34100a2896
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-780a-71461c9a08d0
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-6c48-fafe09850d87
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-7c84-b841b7fa7e86
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-27ed-77db5910f56e
00010000-56af-69ea-23df-8f46ef1aec20	00020000-56af-69ea-b676-c67d93fc5709
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-cde8-cc3258f72b36
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-1582-ea6dcd3a0c13
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-d98e-a2376ca3fb8b
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-593f-bf721c73b961
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-f12b-32277eaef1e9
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-56ba-97ea370b2af9
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-d3f2-9e34100a2896
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-780a-71461c9a08d0
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-6c48-fafe09850d87
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-7c84-b841b7fa7e86
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-27ed-77db5910f56e
00010000-56af-69ea-9464-ae76a2662faf	00020000-56af-69ea-b676-c67d93fc5709
00010000-56af-69ea-3b30-59ad8b4cab24	00020000-56af-69ea-cde8-cc3258f72b36
00010000-56af-69ea-3b30-59ad8b4cab24	00020000-56af-69ea-1582-ea6dcd3a0c13
00010000-56af-69ea-3b30-59ad8b4cab24	00020000-56af-69ea-d98e-a2376ca3fb8b
00010000-56af-69ea-3b30-59ad8b4cab24	00020000-56af-69ea-593f-bf721c73b961
00010000-56af-69ea-3b30-59ad8b4cab24	00020000-56af-69ea-3f8c-597befb98194
00010000-56af-69ea-3b30-59ad8b4cab24	00020000-56af-69ea-f12b-32277eaef1e9
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-1582-ea6dcd3a0c13
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-abec-4a2bcf506dfc
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-f802-2ce0e28b476c
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-3e0d-68c8d6c475ff
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-3f8c-597befb98194
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-5275-be865ef79c6e
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-f12b-32277eaef1e9
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-7bfb-b91592f41a98
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-d3f2-9e34100a2896
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-464d-13a94a9dae9d
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-780a-71461c9a08d0
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-d368-42dce2897681
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-6c48-fafe09850d87
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-03ca-b9b3e19ed01c
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-7c84-b841b7fa7e86
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-1d6c-d7905dcf7671
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-27ed-77db5910f56e
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-5e90-c2f759ae203d
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-b676-c67d93fc5709
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-713c-5cac3dac6e83
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-eeff-f34c99e689bf
00010000-56af-69ea-72da-4c53573cb599	00020000-56af-69ea-0113-6639cbd133f9
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-1582-ea6dcd3a0c13
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-abec-4a2bcf506dfc
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-e0c2-8c73c8d1c198
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-f802-2ce0e28b476c
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-3e0d-68c8d6c475ff
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-3f8c-597befb98194
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-5275-be865ef79c6e
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-f12b-32277eaef1e9
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-7bfb-b91592f41a98
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-6846-1751c6d5a2f6
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-d3f2-9e34100a2896
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-464d-13a94a9dae9d
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-4fab-6047899c4cd0
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-780a-71461c9a08d0
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-d368-42dce2897681
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-6c48-fafe09850d87
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-03ca-b9b3e19ed01c
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-7c84-b841b7fa7e86
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-1d6c-d7905dcf7671
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-27ed-77db5910f56e
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-5e90-c2f759ae203d
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-b676-c67d93fc5709
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-713c-5cac3dac6e83
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-f38a-ce398037d840
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-eeff-f34c99e689bf
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-0113-6639cbd133f9
00010000-56af-69ea-2308-bc0c9a58bff1	00020000-56af-69ea-d712-6b2cf4459933
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-1582-ea6dcd3a0c13
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-d98e-a2376ca3fb8b
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-abec-4a2bcf506dfc
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-d39e-c38f706fe51c
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-e0c2-8c73c8d1c198
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-235a-39d3e15655a6
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-f802-2ce0e28b476c
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-3e0d-68c8d6c475ff
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-3f8c-597befb98194
00010000-56af-69ea-cef8-2dd8c91d49f5	00020000-56af-69ea-5275-be865ef79c6e
00010000-56af-69ea-dcba-42c2054c84f1	00020000-56af-69ea-cde8-cc3258f72b36
00010000-56af-69ea-dcba-42c2054c84f1	00020000-56af-69ea-593f-bf721c73b961
00010000-56af-69ea-dcba-42c2054c84f1	00020000-56af-69ea-235a-39d3e15655a6
00010000-56af-69ea-dcba-42c2054c84f1	00020000-56af-69ea-63a3-2ee0005e79ed
00010000-56af-69ea-dcba-42c2054c84f1	00020000-56af-69ea-3f8c-597befb98194
00010000-56af-69ea-dcba-42c2054c84f1	00020000-56af-69ea-f12b-32277eaef1e9
00010000-56af-69ea-dcba-42c2054c84f1	00020000-56af-69ea-5f88-8e53ac309471
00010000-56af-69ea-dcba-42c2054c84f1	00020000-56af-69ea-2a2d-05b38e834b14
00010000-56af-69ea-8d77-6256e7c417de	00020000-56af-69ea-9b97-74c0e52fd758
00010000-56af-69ea-3bbd-9893b051077f	00020000-56af-69e8-34ec-0f9bd5a0c79f
00010000-56af-69ea-aef2-28142135b14d	00020000-56af-69e8-9fb1-3a72a19014f3
00010000-56af-69ea-2bd1-c0fc09df2647	00020000-56af-69e8-e6f3-6288f52aceb4
00010000-56af-69ea-81fd-a337ec17371b	00020000-56af-69e8-3218-404021d45d08
00010000-56af-69ea-c106-a37d93624a20	00020000-56af-69e8-657a-76b1bbd9a7f9
00010000-56af-69ea-851e-b61ce3522ea0	00020000-56af-69e8-7393-e5b48226c0de
00010000-56af-69ea-8cfd-39245fc20961	00020000-56af-69e8-3c63-d4cf07366d5a
\.


--
-- TOC entry 3186 (class 0 OID 42321810)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 42321748)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 42321671)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56af-69ea-59e0-988eb2c1bf97	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56af-69ea-2af4-b9bc06dd4d9c	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56af-69ea-5937-dd66cb81fc39	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56af-69ea-258f-66232c740546	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 42321308)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56af-69e6-05e0-92b786374dad	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56af-69e6-1516-ad35822b814d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56af-69e6-c015-c854c2b8c676	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56af-69e6-7a9b-6f1fc1407944	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56af-69e6-bed0-4ed33cfbabf2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 42321300)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56af-69e6-20ce-b1d6b42b64b9	00230000-56af-69e6-7a9b-6f1fc1407944	popa
00240000-56af-69e6-bc40-d6b7697ecb38	00230000-56af-69e6-7a9b-6f1fc1407944	oseba
00240000-56af-69e6-1520-05034bff7f16	00230000-56af-69e6-7a9b-6f1fc1407944	tippopa
00240000-56af-69e6-6535-3ac9f4b7b71f	00230000-56af-69e6-7a9b-6f1fc1407944	organizacijskaenota
00240000-56af-69e6-f15f-19243716a7b9	00230000-56af-69e6-7a9b-6f1fc1407944	sezona
00240000-56af-69e6-247c-0bb269383ae2	00230000-56af-69e6-7a9b-6f1fc1407944	tipvaje
00240000-56af-69e6-8f1b-b2f87b9c5cd0	00230000-56af-69e6-7a9b-6f1fc1407944	tipdodatka
00240000-56af-69e6-4038-f1827343eb83	00230000-56af-69e6-1516-ad35822b814d	prostor
00240000-56af-69e6-7e9f-c31006b1145a	00230000-56af-69e6-7a9b-6f1fc1407944	besedilo
00240000-56af-69e6-8e05-a78d7f51f6de	00230000-56af-69e6-7a9b-6f1fc1407944	uprizoritev
00240000-56af-69e6-4a7c-58e7dab36372	00230000-56af-69e6-7a9b-6f1fc1407944	funkcija
00240000-56af-69e6-0549-25b4ca5a5db2	00230000-56af-69e6-7a9b-6f1fc1407944	tipfunkcije
00240000-56af-69e6-00e8-68b7b21f647d	00230000-56af-69e6-7a9b-6f1fc1407944	alternacija
00240000-56af-69e6-10bd-c4e5e7d4fff2	00230000-56af-69e6-05e0-92b786374dad	pogodba
00240000-56af-69e6-3b48-bc012e8f0067	00230000-56af-69e6-7a9b-6f1fc1407944	zaposlitev
00240000-56af-69e6-32cb-1f83b822f64e	00230000-56af-69e6-7a9b-6f1fc1407944	zvrstuprizoritve
00240000-56af-69e6-4edc-48e935f44176	00230000-56af-69e6-05e0-92b786374dad	programdela
00240000-56af-69e6-7fb2-7709c934847d	00230000-56af-69e6-7a9b-6f1fc1407944	zapis
\.


--
-- TOC entry 3133 (class 0 OID 42321295)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ebeafce3-07a9-4d4f-8fba-b885286e8101	00240000-56af-69e6-20ce-b1d6b42b64b9	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 42321871)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56af-69eb-68c2-97da44f2502a	000e0000-56af-69eb-3ad7-57fc0f30e4f6	00080000-56af-69ea-772d-15ffc38e1295	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56af-69e7-c2a0-b2ee2d3aea7a
00270000-56af-69eb-7c59-53733ba19702	000e0000-56af-69eb-3ad7-57fc0f30e4f6	00080000-56af-69ea-772d-15ffc38e1295	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56af-69e7-c2a0-b2ee2d3aea7a
\.


--
-- TOC entry 3149 (class 0 OID 42321444)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 42321690)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56af-69ec-38aa-a71d328aa49b	00180000-56af-69eb-e2bb-dbb648d509fc	000c0000-56af-69eb-35d3-25864dd4168a	00090000-56af-69ea-6899-664a9d629b6d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-69ec-4f99-fc697cc578e6	00180000-56af-69eb-e2bb-dbb648d509fc	000c0000-56af-69eb-7b24-620479bb530c	00090000-56af-69ea-1f4a-796f2a958f5d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-69ec-b6c4-504e744935a4	00180000-56af-69eb-e2bb-dbb648d509fc	000c0000-56af-69eb-3905-4ff8256769f1	00090000-56af-69ea-7ae5-a93d2e705254	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-69ec-0755-afa4dd31b9ff	00180000-56af-69eb-e2bb-dbb648d509fc	000c0000-56af-69eb-6153-bc538d522be5	00090000-56af-69ea-5c24-e67b09c9c65d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-69ec-8eac-7c122e83d7d2	00180000-56af-69eb-e2bb-dbb648d509fc	000c0000-56af-69eb-876a-ea2ae244e130	00090000-56af-69ea-6e3f-90ab1c64edf0	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-69ec-9f00-21af11a68791	00180000-56af-69eb-8c17-9b1842579170	\N	00090000-56af-69ea-6e3f-90ab1c64edf0	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	f	\N	\N
001a0000-56af-69ec-33cd-130a055996af	00180000-56af-69eb-f9b6-e13bbd399945	\N	00090000-56af-69ea-1f4a-796f2a958f5d	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56af-69ec-fc39-48d02bc394f8	00180000-56af-69eb-e2bb-dbb648d509fc	\N	00090000-56af-69ea-6000-1dedbb9bfdab	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56af-69ec-633d-5ce4d9c1f288	00180000-56af-69eb-eabd-fa4ca0a03e3b	\N	00090000-56af-69ea-6899-664a9d629b6d	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56af-69ec-05e6-c39352e58938	00180000-56af-69eb-eabd-fa4ca0a03e3b	\N	00090000-56af-69ea-1f4a-796f2a958f5d	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56af-69ec-6817-7e734124e539	00180000-56af-69eb-eabd-fa4ca0a03e3b	\N	00090000-56af-69ea-1e2e-d67ca7665e64	0	2015-03-10 07:00:00	15840	2015-03-31 23:00:00	f	f	t	\N	\N
001a0000-56af-69ec-334c-319b82b2cad0	00180000-56af-69eb-0069-04ddc7847c46	000c0000-56af-69eb-35d3-25864dd4168a	00090000-56af-69ea-6899-664a9d629b6d	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
001a0000-56af-69ec-7513-d08da0dc59ba	00180000-56af-69eb-0069-04ddc7847c46	000c0000-56af-69eb-7b24-620479bb530c	00090000-56af-69ea-1f4a-796f2a958f5d	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 42321707)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56af-69e6-0c5e-b063a137de56	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56af-69e6-49d4-6187a1c414c5	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56af-69e6-464c-94b7a7b2b0e5	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56af-69e6-13e3-d209debcb1ad	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56af-69e6-5d8b-a3772115ab93	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56af-69e6-ac1f-034438d5ec00	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 42321912)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56af-69e6-6e87-ca196430cc47	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56af-69e6-e542-7748efb92f68	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56af-69e6-28c7-3dfd6cd66b70	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56af-69e6-fd9a-75afb92e2060	04	Režija	Režija	Režija	umetnik	30
000f0000-56af-69e6-1567-d92e45edcc23	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56af-69e6-bb08-4762c388c841	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56af-69e6-650a-f3af7defed83	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56af-69e6-b01b-3fcff5e5be59	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56af-69e6-2df2-d6aa6706a9d6	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56af-69e6-7dd7-926deb3c3c2c	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56af-69e6-d36c-8e90d46d9493	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56af-69e6-d279-c9e55cfcb074	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56af-69e6-e018-3dfa39daf81f	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56af-69e6-8e93-ddc98ea3c51f	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56af-69e6-8912-f499dcf80576	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56af-69e6-4160-09999c9d7c34	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56af-69e6-01fa-bd3d3be49467	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56af-69e6-9ed0-37e03c5c15b3	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56af-69e6-b20d-08e1b4843868	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 42321395)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56af-69ea-391f-e0d30eba5ed6	0001	šola	osnovna ali srednja šola
00400000-56af-69ea-6651-1eec727f3dec	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56af-69ea-3d03-72d784d5cfc1	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 42322216)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56af-69e6-22b8-f39782ff012d	01	Velika predstava	f	1.00	1.00
002b0000-56af-69e6-6634-ac61b8cb4dc5	02	Mala predstava	f	0.50	0.50
002b0000-56af-69e6-c476-cb09b7b899f6	03	Mala koprodukcija	t	0.40	1.00
002b0000-56af-69e6-0ae7-929a39e0333b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56af-69e6-beb1-7529f688817c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 42321661)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56af-69e6-0b9f-55d6e765a118	0001	prva vaja	prva vaja
00420000-56af-69e6-80f7-4a4b6fc367f2	0002	tehnična vaja	tehnična vaja
00420000-56af-69e6-068a-16072832c14c	0003	lučna vaja	lučna vaja
00420000-56af-69e6-86b1-a41398501805	0004	kostumska vaja	kostumska vaja
00420000-56af-69e6-12f1-52983b6b1939	0005	foto vaja	foto vaja
00420000-56af-69e6-36d3-f6f2c1c93e34	0006	1. glavna vaja	1. glavna vaja
00420000-56af-69e6-728e-8420c881b5ca	0007	2. glavna vaja	2. glavna vaja
00420000-56af-69e6-a191-95404fed1399	0008	1. generalka	1. generalka
00420000-56af-69e6-2713-ae7a4d56b0ae	0009	2. generalka	2. generalka
00420000-56af-69e6-b92b-bad7fe1277db	0010	odprta generalka	odprta generalka
00420000-56af-69e6-d4a4-0369cdfcf368	0011	obnovitvena vaja	obnovitvena vaja
00420000-56af-69e6-1b76-4f706b4f9e60	0012	italijanka	krajša "obnovitvena" vaja
00420000-56af-69e6-8983-035fc1af2ab5	0013	pevska vaja	pevska vaja
00420000-56af-69e6-3a07-c9419ccaba95	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56af-69e6-5e96-6ea54517d8b5	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56af-69e6-dc7c-432c6d30848a	0016	orientacijska vaja	orientacijska vaja
00420000-56af-69e6-03a0-5a749d6743e9	0017	situacijska vaja	situacijska vaja
00420000-56af-69e6-b54b-c77f55b28e0a	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 42321517)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 42321330)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56af-69e8-232d-44ef4af169f2	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROmkjN4wHHF5J5tR2LZemlr0nP3jhY6dG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56af-69ea-710f-5400dba29898	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56af-69ea-aab1-bcd31c10f5f4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56af-69ea-912b-e2a18c37e5dd	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56af-69ea-18a5-4681e9d79634	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56af-69ea-2c03-b2b81898d639	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56af-69ea-cbd6-6f3fe5cf6b3f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56af-69ea-ebbc-2b3ff74e8ac8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56af-69ea-2148-0a074499c98c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56af-69ea-0ada-c639bed657db	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56af-69ea-04fe-d114c314a1f5	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56af-69ea-b3ad-1a68775754fd	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56af-69ea-23df-8f46ef1aec20	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56af-69ea-9464-ae76a2662faf	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56af-69ea-3b30-59ad8b4cab24	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56af-69ea-72da-4c53573cb599	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56af-69ea-2308-bc0c9a58bff1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56af-69ea-cef8-2dd8c91d49f5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56af-69ea-dcba-42c2054c84f1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56af-69ea-8d77-6256e7c417de	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56af-69ea-3bbd-9893b051077f	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56af-69ea-aef2-28142135b14d	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56af-69ea-2bd1-c0fc09df2647	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56af-69ea-81fd-a337ec17371b	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56af-69ea-c106-a37d93624a20	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56af-69ea-851e-b61ce3522ea0	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56af-69ea-8cfd-39245fc20961	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56af-69e8-20b1-f4066e2aaf00	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 42321962)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56af-69eb-468b-e81409adbdfd	00160000-56af-69ea-eae3-64409788b3a6	\N	00140000-56af-69e6-6076-6224fd28f2e7	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56af-69ea-a11f-6f19fc079fc5
000e0000-56af-69eb-3ad7-57fc0f30e4f6	00160000-56af-69ea-7317-2627708f0905	\N	00140000-56af-69e6-3b3b-66bfa4701c10	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56af-69ea-f198-f4d501291970
000e0000-56af-69eb-2a58-2eb013a77909	\N	\N	00140000-56af-69e6-3b3b-66bfa4701c10	00190000-56af-69ea-c621-bbe7b7d45a74	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-69ea-a11f-6f19fc079fc5
000e0000-56af-69eb-ffba-aa26a76c5013	\N	\N	00140000-56af-69e6-3b3b-66bfa4701c10	00190000-56af-69ea-c621-bbe7b7d45a74	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-69ea-a11f-6f19fc079fc5
000e0000-56af-69eb-73d3-7b4eb7fd518a	\N	\N	00140000-56af-69e6-3b3b-66bfa4701c10	00190000-56af-69ea-c621-bbe7b7d45a74	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-07fe-b87b63ce8109	\N	\N	00140000-56af-69e6-3b3b-66bfa4701c10	00190000-56af-69ea-c621-bbe7b7d45a74	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-cafd-aa0db42490a2	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-ca4c-dc3a7d83f4f0	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-9756-e2d78380b05b	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-b606-4038ef9b7aa0	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-0a8f-fc82a0292163	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-be85-78602dcecd9d	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-867d-549954b00608	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-c7f8-527314865b1e	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
000e0000-56af-69eb-e074-5ac29e7d6d27	\N	\N	00140000-56af-69e6-5331-d31ddd5272de	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-69ea-9ce5-75cac91018ed
\.


--
-- TOC entry 3170 (class 0 OID 42321681)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 42321610)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56af-69eb-f140-df0b1eeb01ee	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	3
00200000-56af-69eb-23e9-8c66f1b750f8	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	4
00200000-56af-69eb-e50e-5f1315827d73	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	6
00200000-56af-69eb-0508-ef2524d6435c	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	5
00200000-56af-69eb-0a97-09d23a8b3498	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	7
00200000-56af-69eb-1e4b-3234e95e3816	\N	000e0000-56af-69eb-468b-e81409adbdfd	1
00200000-56af-69eb-fec5-2d3551041d24	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	2
00200000-56af-69eb-3350-07f6716b12c6	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	1
00200000-56af-69eb-e030-807324b967d5	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	8
00200000-56af-69eb-d67b-764436746236	\N	000e0000-56af-69eb-3ad7-57fc0f30e4f6	9
\.


--
-- TOC entry 3182 (class 0 OID 42321774)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 42321885)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56af-69e7-5eff-d8e89531a062	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56af-69e7-2d71-64b85f4aec8e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56af-69e7-3797-4826c4b15914	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56af-69e7-6ff9-9a0058d78e62	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56af-69e7-ad76-37c7c68f51c2	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56af-69e7-1a2c-a5169c1b07d9	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56af-69e7-b438-cd7978af52e4	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56af-69e7-213b-045b21e17d62	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56af-69e7-c2a0-b2ee2d3aea7a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56af-69e7-1110-7b777c499a3d	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56af-69e7-181f-8954b5f7a764	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56af-69e7-a869-7e94116037b3	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56af-69e7-3833-57596e8c807f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56af-69e7-9f75-f7d9779975a6	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56af-69e7-b9a9-1e8171e4c3f1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56af-69e7-a5fd-2e0e0ba7390e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56af-69e7-515b-96fe2dffb9d1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56af-69e7-043c-86132ce28d1a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56af-69e7-dcb6-3715cde66bba	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56af-69e7-3666-f889688c5510	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56af-69e7-6ec8-fdbeab9fad56	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56af-69e7-091f-d4ab0c0022bf	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56af-69e7-fd03-255de08f37df	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56af-69e7-33aa-9a4c531ff438	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56af-69e7-b526-fe0fa1bce283	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56af-69e7-85e5-6ecc6e3b5ffd	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56af-69e7-19ae-a1948b8794c8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56af-69e7-619a-97bfbc817f99	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 42322266)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 42322235)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 42322278)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 42321847)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56af-69ea-f39c-e768e22c7351	00090000-56af-69ea-1f4a-796f2a958f5d	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-69ea-6157-871704d0b53d	00090000-56af-69ea-7ae5-a93d2e705254	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-69ea-f1f1-d3be84eaba6c	00090000-56af-69ea-2996-91f13019b635	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-69ea-ff6b-62ecf1c6c7a4	00090000-56af-69ea-1e2e-d67ca7665e64	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-69ea-f39a-364fe822a9db	00090000-56af-69ea-e404-b80d78cf8677	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-69ea-c6fd-538be92dee8c	00090000-56af-69ea-46da-b7ef5853651b	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 42321952)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56af-69e6-6076-6224fd28f2e7	01	Drama	drama (SURS 01)
00140000-56af-69e6-046e-5f2ac552476e	02	Opera	opera (SURS 02)
00140000-56af-69e6-8672-aac97e810533	03	Balet	balet (SURS 03)
00140000-56af-69e6-f342-b0510b411829	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56af-69e6-5331-d31ddd5272de	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56af-69e6-3b3b-66bfa4701c10	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56af-69e6-36a3-4e1787ae9925	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 42321837)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 42321394)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 42322010)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 42322001)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 42321384)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 42321868)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 42321910)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 42322319)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 42321704)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 42321639)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 42321655)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 42321660)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 42322233)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 42321543)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 42322079)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 42321833)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 42321608)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 42321581)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 42321557)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 42321740)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 42322296)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 42322303)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 42322327)
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
-- TOC entry 2766 (class 2606 OID 42321766)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 42321515)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 42321413)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 42321477)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 42321440)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 42321373)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 42321358)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 42321772)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 42321809)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 42321947)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 42321468)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 42321503)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 42322184)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 42321746)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 42321493)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 42321624)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 42321596)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 42321590)
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
-- TOC entry 2764 (class 2606 OID 42321758)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 42322193)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 42322201)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42322171)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 42322214)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 42321791)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 42321731)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 42321722)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 42321934)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 42321861)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 42321569)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 42321329)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 42321800)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 42321347)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 42321367)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 42321818)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 42321753)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 42321679)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 42321317)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 42321305)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 42321299)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 42321881)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 42321449)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 42321696)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 42321714)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 42321921)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 42321402)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 42322226)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 42321668)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 42321528)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 42321342)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 42321980)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 42321687)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 42321614)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 42321780)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 42321893)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 42322276)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 42322260)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 42322284)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 42321851)
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
-- TOC entry 2833 (class 2606 OID 42321960)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 42321845)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 42321649)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 42321650)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 42321648)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 42321646)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 42321647)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 42321645)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 42321882)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 42321883)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 42321884)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 42322298)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 42322297)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 42321470)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 42321471)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 42321773)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 42322264)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 42322263)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 42322265)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 42322262)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 42322261)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 42321759)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 42321615)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 42321616)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 42321834)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 42321836)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 42321835)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 42321559)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 42321558)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 42322215)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 42321949)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 42321950)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 42321951)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 42322285)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 42321985)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 42321982)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 42321986)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 42321984)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 42321983)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 42321530)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 42321529)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 42321443)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 42321801)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 42321374)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 42321375)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 42321821)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 42321820)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 42321819)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 42321480)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 42321479)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 42321481)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 42321591)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 42321307)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 42321726)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 42321724)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 42321723)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 42321725)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 42321348)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 42321349)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 42321781)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 42322320)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 42321870)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 42321869)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 42322328)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 42322329)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 42321747)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 42321862)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 42321863)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 42322084)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 42322083)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 42322080)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 42322081)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 42322082)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 42321495)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 42321494)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 42321496)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 42321795)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 42321794)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 42322194)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 42322195)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 42322014)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 42322015)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 42322012)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 42322013)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 42321705)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 42321706)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 42321852)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 42321853)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 42321688)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 42321735)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 42321734)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 42321732)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 42321733)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 42322002)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 42321570)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 42321584)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 42321583)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 42321582)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 42321585)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 42321609)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 42321597)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 42321598)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 42322185)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 42322234)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 42322304)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 42322305)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 42321415)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 42321414)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 42321450)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 42321451)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 42321699)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 42321698)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 42321697)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 42321641)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 42321644)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 42321640)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 42321643)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 42321642)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 42321469)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 42321403)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 42321404)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 42321544)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 42321546)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 42321545)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 42321547)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 42321741)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 42321948)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 42321981)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 42321922)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 42321923)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 42321441)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 42321442)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 42321715)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 42321716)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 42321846)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 42321318)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 42321516)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 42321478)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 42321306)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 42322227)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 42321793)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 42321792)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 42321669)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 42321670)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 42322011)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 42321689)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 42321504)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 42321961)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 42322277)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 42322202)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 42322203)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 42321911)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 42321680)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 42321368)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 42322490)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 42322515)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 42322505)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 42322485)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 42322520)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 42322500)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 42322510)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 42322495)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 42322700)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 42322705)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 42322710)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 42322870)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 42322865)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 42322385)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 42322390)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 42322615)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 42322850)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 42322845)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 42322855)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 42322840)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 42322835)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 42322610)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 42322475)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 42322480)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 42322655)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 42322665)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 42322660)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 42322440)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 42322435)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 42322600)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 42322825)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 42322715)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 42322720)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 42322725)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 42322860)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 42322745)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 42322730)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 42322750)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 42322740)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 42322735)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 42322430)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 42322425)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 42322370)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 42322365)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 42322635)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 42322345)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 42322350)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 42322650)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 42322645)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 42322640)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 42322400)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 42322395)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 42322405)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 42322455)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 42322330)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 42322575)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 42322565)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 42322560)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 42322570)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 42322335)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 42322340)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 42322620)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 42322885)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 42322695)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 42322690)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 42322890)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 42322895)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 42322605)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 42322680)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 42322685)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 42322800)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 42322795)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 42322780)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 42322785)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 42322790)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 42322415)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 42322410)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 42322420)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 42322630)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 42322625)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 42322810)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 42322815)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 42322770)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 42322775)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 42322760)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 42322765)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 42322550)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 42322555)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 42322670)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 42322675)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 42322525)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 42322530)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 42322595)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 42322590)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 42322580)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 42322585)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 42322755)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 42322445)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 42322450)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 42322470)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 42322460)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 42322465)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 42322805)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 42322820)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 42322830)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 42322875)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 42322880)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 42322360)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 42322355)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 42322375)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 42322380)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 42322545)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 42322540)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 42322535)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-01 15:21:35 CET

--
-- PostgreSQL database dump complete
--

