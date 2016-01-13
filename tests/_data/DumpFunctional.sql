--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-13 10:14:42 CET

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
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 256
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 35809680)
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
-- TOC entry 240 (class 1259 OID 35810308)
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
-- TOC entry 239 (class 1259 OID 35810292)
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
-- TOC entry 182 (class 1259 OID 35809673)
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
-- TOC entry 181 (class 1259 OID 35809671)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 230 (class 1259 OID 35810168)
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
-- TOC entry 233 (class 1259 OID 35810198)
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
-- TOC entry 254 (class 1259 OID 35810611)
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
-- TOC entry 210 (class 1259 OID 35809996)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    prisotnost_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 203 (class 1259 OID 35809922)
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
-- TOC entry 205 (class 1259 OID 35809954)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 35809959)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 35810533)
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
-- TOC entry 194 (class 1259 OID 35809825)
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
-- TOC entry 241 (class 1259 OID 35810321)
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
-- TOC entry 226 (class 1259 OID 35810126)
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
-- TOC entry 200 (class 1259 OID 35809896)
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
-- TOC entry 197 (class 1259 OID 35809865)
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
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 35809842)
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
-- TOC entry 215 (class 1259 OID 35810040)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 252 (class 1259 OID 35810591)
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
-- TOC entry 253 (class 1259 OID 35810604)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 35810626)
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
-- TOC entry 219 (class 1259 OID 35810065)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 35809799)
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
-- TOC entry 185 (class 1259 OID 35809699)
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
-- TOC entry 189 (class 1259 OID 35809766)
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
-- TOC entry 186 (class 1259 OID 35809710)
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
-- TOC entry 178 (class 1259 OID 35809645)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 35809664)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 35810072)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 35810106)
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
-- TOC entry 236 (class 1259 OID 35810239)
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
-- TOC entry 188 (class 1259 OID 35809746)
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
-- TOC entry 191 (class 1259 OID 35809791)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 35810477)
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
-- TOC entry 216 (class 1259 OID 35810046)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 35809776)
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
-- TOC entry 202 (class 1259 OID 35809914)
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
-- TOC entry 198 (class 1259 OID 35809880)
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
-- TOC entry 199 (class 1259 OID 35809889)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 35810013)
-- Name: prisotnost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prisotnost (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 218 (class 1259 OID 35810058)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 35810491)
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
-- TOC entry 245 (class 1259 OID 35810501)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 35810390)
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
-- TOC entry 246 (class 1259 OID 35810509)
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
-- TOC entry 222 (class 1259 OID 35810087)
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
-- TOC entry 214 (class 1259 OID 35810031)
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
-- TOC entry 213 (class 1259 OID 35810021)
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
-- TOC entry 235 (class 1259 OID 35810228)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 35810158)
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
-- TOC entry 196 (class 1259 OID 35809854)
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
-- TOC entry 175 (class 1259 OID 35809616)
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
-- TOC entry 174 (class 1259 OID 35809614)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 223 (class 1259 OID 35810100)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 35809654)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 35809638)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 35810114)
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
-- TOC entry 217 (class 1259 OID 35810052)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 35809974)
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
-- TOC entry 173 (class 1259 OID 35809603)
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
-- TOC entry 172 (class 1259 OID 35809595)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 35809590)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 231 (class 1259 OID 35810175)
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
-- TOC entry 187 (class 1259 OID 35809738)
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
-- TOC entry 209 (class 1259 OID 35809984)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    prisotnost_id uuid,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planiranotraja numeric(15,2) DEFAULT NULL::numeric,
    dezurni boolean,
    gost boolean
);


--
-- TOC entry 211 (class 1259 OID 35810003)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 234 (class 1259 OID 35810216)
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
-- TOC entry 184 (class 1259 OID 35809689)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 247 (class 1259 OID 35810521)
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
-- TOC entry 207 (class 1259 OID 35809964)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 35809811)
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
-- TOC entry 176 (class 1259 OID 35809625)
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
-- TOC entry 238 (class 1259 OID 35810266)
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
-- TOC entry 201 (class 1259 OID 35809907)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 221 (class 1259 OID 35810079)
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
-- TOC entry 232 (class 1259 OID 35810189)
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
-- TOC entry 250 (class 1259 OID 35810571)
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
-- TOC entry 249 (class 1259 OID 35810540)
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
-- TOC entry 251 (class 1259 OID 35810583)
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
-- TOC entry 228 (class 1259 OID 35810151)
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
-- TOC entry 204 (class 1259 OID 35809948)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 237 (class 1259 OID 35810256)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 227 (class 1259 OID 35810141)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2252 (class 2604 OID 35809676)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 35809619)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3140 (class 0 OID 35809680)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5696-157e-1bae-4ace6c795c3a	10	30	Otroci	Abonma za otroke	200
000a0000-5696-157e-3325-900b1c8d3571	20	60	Mladina	Abonma za mladino	400
000a0000-5696-157e-2fcb-e809cb66699f	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3197 (class 0 OID 35810308)
-- Dependencies: 240
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5696-157f-44a6-a7d84a83ea02	000d0000-5696-157f-1041-2382f7b82aee	\N	00090000-5696-157f-3ddd-f9f50e727f7c	000b0000-5696-157f-fabc-aaa340aaf676	0001	f	\N	\N	\N	3	t	t	t
000c0000-5696-157f-4527-48f8024b40f1	000d0000-5696-157f-d342-f3335f8905a4	00100000-5696-157f-8665-d4431fe6e779	00090000-5696-157f-6400-688dcce10fbf	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5696-157f-1b5d-e26a67fc1da0	000d0000-5696-157f-deb5-4b9cfbf513f1	00100000-5696-157f-a630-0362f7b0d6cd	00090000-5696-157f-3787-7a3a23e5dbb7	\N	0003	t	\N	2016-01-13	\N	2	t	f	f
000c0000-5696-157f-1d84-54f9b954d898	000d0000-5696-157f-c172-35e98793109a	\N	00090000-5696-157f-a493-0feb8bed05ee	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5696-157f-05f5-d5a504a93bfb	000d0000-5696-157f-f9ef-7b8a0c716bee	\N	00090000-5696-157f-fb17-3014d1b78b06	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5696-157f-4afa-c6d07daa6413	000d0000-5696-157f-1be4-31e050031026	\N	00090000-5696-157f-05f2-5ecadba15225	000b0000-5696-157f-e355-ce90f9c2c453	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5696-157f-006c-cdb02f4e15b7	000d0000-5696-157f-fcfa-58b41d0a4997	00100000-5696-157f-a27e-520413e5eba8	00090000-5696-157f-d17c-7421e99fb920	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5696-157f-d5e3-a2483ddc6576	000d0000-5696-157f-4038-4dd1f0c6d58a	\N	00090000-5696-157f-52a8-2ba43b7b6f09	000b0000-5696-157f-c838-328775086383	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5696-157f-893b-d5b44a01142d	000d0000-5696-157f-fcfa-58b41d0a4997	00100000-5696-157f-077a-4392793a549e	00090000-5696-157f-52c1-5b4d9a789e64	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5696-157f-a189-3b9c487f702a	000d0000-5696-157f-fcfa-58b41d0a4997	00100000-5696-157f-9819-ef67e63dc270	00090000-5696-157f-7327-3a3c3033662b	\N	0010	t	\N	2016-01-13	\N	16	f	f	t
000c0000-5696-157f-7e9e-cb0b486c0bf5	000d0000-5696-157f-fcfa-58b41d0a4997	00100000-5696-157f-1e50-b6e1ffe58bda	00090000-5696-157f-e39c-0b05a6a1ff16	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5696-157f-38e9-e49972f69060	000d0000-5696-157f-35a6-5c9c247cfb1b	00100000-5696-157f-8665-d4431fe6e779	00090000-5696-157f-6400-688dcce10fbf	000b0000-5696-157f-f368-8209966da67c	0012	t	\N	\N	\N	2	t	t	t
000c0000-5696-157f-d72c-404721199f37	000d0000-5696-157f-ffbf-6c7e14277912	\N	00090000-5696-157f-52a8-2ba43b7b6f09	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5696-157f-66af-8bc49d9ba7f2	000d0000-5696-157f-ffbf-6c7e14277912	\N	00090000-5696-157f-4d7f-6a3439399f20	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5696-157f-8f98-08344acfa0a8	000d0000-5696-157f-e1bf-b7f8a821d6b2	00100000-5696-157f-a630-0362f7b0d6cd	00090000-5696-157f-3787-7a3a23e5dbb7	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5696-157f-ef69-63a49de36ae9	000d0000-5696-157f-e1bf-b7f8a821d6b2	\N	00090000-5696-157f-4d7f-6a3439399f20	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5696-157f-0083-ea6c50b53a40	000d0000-5696-157f-ff5e-6cb08464caea	\N	00090000-5696-157f-4d7f-6a3439399f20	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5696-157f-2d0b-2957d3330230	000d0000-5696-157f-ff5e-6cb08464caea	\N	00090000-5696-157f-52a8-2ba43b7b6f09	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5696-157f-087d-bcd925ec9240	000d0000-5696-157f-c945-8a0c559fac96	00100000-5696-157f-a27e-520413e5eba8	00090000-5696-157f-d17c-7421e99fb920	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5696-157f-de5a-e8797262cc4c	000d0000-5696-157f-c945-8a0c559fac96	\N	00090000-5696-157f-4d7f-6a3439399f20	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5696-157f-fb15-59317ec7ed95	000d0000-5696-157f-76f3-4bb130925f9c	\N	00090000-5696-157f-4d7f-6a3439399f20	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5696-157f-2428-7fa95f18ddad	000d0000-5696-157f-76f3-4bb130925f9c	00100000-5696-157f-a27e-520413e5eba8	00090000-5696-157f-d17c-7421e99fb920	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5696-157f-3840-0e01ea2607f9	000d0000-5696-157f-6e28-50c2b243bd20	\N	00090000-5696-157f-4d7f-6a3439399f20	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5696-157f-f7b6-a69fd54c287b	000d0000-5696-157f-15d9-58bd8827e756	\N	00090000-5696-157f-52a8-2ba43b7b6f09	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5696-157f-84bf-1ac05f8d7a40	000d0000-5696-157f-bc7d-3411a70db4d1	\N	00090000-5696-157f-52a8-2ba43b7b6f09	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5696-157f-55d1-8f999838cc69	000d0000-5696-157f-bc7d-3411a70db4d1	00100000-5696-157f-a630-0362f7b0d6cd	00090000-5696-157f-3787-7a3a23e5dbb7	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5696-157f-4cc4-d9db8bb14822	000d0000-5696-157f-fadf-5cf3df21d23b	\N	00090000-5696-157f-0085-29d74a765b0c	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5696-157f-ec9d-e6d367544b5f	000d0000-5696-157f-fadf-5cf3df21d23b	\N	00090000-5696-157f-502d-216726ef0edc	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5696-157f-b15e-fbffb6cb7670	000d0000-5696-157f-74a3-a91a7b17f3a4	\N	00090000-5696-157f-52a8-2ba43b7b6f09	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5696-157f-6a34-0a8259aec42f	000d0000-5696-157f-74a3-a91a7b17f3a4	00100000-5696-157f-a630-0362f7b0d6cd	00090000-5696-157f-3787-7a3a23e5dbb7	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5696-157f-b27c-c9a8f5286650	000d0000-5696-157f-74a3-a91a7b17f3a4	\N	00090000-5696-157f-502d-216726ef0edc	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5696-157f-a7a5-4c6268c4895b	000d0000-5696-157f-74a3-a91a7b17f3a4	\N	00090000-5696-157f-0085-29d74a765b0c	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5696-157f-01c2-af717582849b	000d0000-5696-157f-0445-ec59c24fa977	\N	00090000-5696-157f-52a8-2ba43b7b6f09	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5696-157f-58ac-11a9f1914b50	000d0000-5696-157f-05d1-04ff757b5743	00100000-5696-157f-a630-0362f7b0d6cd	00090000-5696-157f-3787-7a3a23e5dbb7	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5696-157f-9320-d46266d7b4f7	000d0000-5696-157f-05d1-04ff757b5743	\N	00090000-5696-157f-4d7f-6a3439399f20	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3196 (class 0 OID 35810292)
-- Dependencies: 239
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 35809673)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3187 (class 0 OID 35810168)
-- Dependencies: 230
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5696-157f-0b62-9335f44b7049	00160000-5696-157e-d038-254d4a59ccc4	00090000-5696-157f-502d-216726ef0edc	aizv	10	t
003d0000-5696-157f-dead-55066db5f2b6	00160000-5696-157e-d038-254d4a59ccc4	00090000-5696-157f-ef79-db0f5a3e9d8a	apri	14	t
003d0000-5696-157f-7793-6c498433d54c	00160000-5696-157e-d185-81f1d05dc6ca	00090000-5696-157f-0085-29d74a765b0c	aizv	11	t
003d0000-5696-157f-42d7-a91eb82d9bea	00160000-5696-157e-318c-f06ba9ee228f	00090000-5696-157f-a77d-2b3cc5c95cac	aizv	12	t
003d0000-5696-157f-7ab8-4e0f246daa8f	00160000-5696-157e-d038-254d4a59ccc4	00090000-5696-157f-4d7f-6a3439399f20	apri	18	f
\.


--
-- TOC entry 3190 (class 0 OID 35810198)
-- Dependencies: 233
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5696-157e-d038-254d4a59ccc4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5696-157e-d185-81f1d05dc6ca	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5696-157e-318c-f06ba9ee228f	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3211 (class 0 OID 35810611)
-- Dependencies: 254
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 35809996)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, prisotnost_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 35809922)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5696-157f-9098-0b35c2d65e09	\N	\N	00200000-5696-157f-e8be-e906996d39b5	\N	\N	\N	00220000-5696-157e-3eb7-812c69f5dd94	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5696-157f-15fe-740ba2a2b934	\N	\N	00200000-5696-157f-8e49-12ccc22cc9b0	\N	\N	\N	00220000-5696-157e-3eb7-812c69f5dd94	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5696-157f-d152-0b8d7e30d973	\N	\N	00200000-5696-157f-8418-6bdb06774896	\N	\N	\N	00220000-5696-157e-fd40-a6f29fb50c8c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5696-157f-7a79-ed767927ca35	\N	\N	00200000-5696-157f-f4f3-1cc4c630bd4e	\N	\N	\N	00220000-5696-157e-1129-2bbd48f81264	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5696-157f-35eb-79a2f920b1cd	\N	\N	00200000-5696-157f-65a6-dd1979ab2363	\N	\N	\N	00220000-5696-157e-47f1-31077387d4a1	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3162 (class 0 OID 35809954)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 35809959)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 35810533)
-- Dependencies: 248
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 35809825)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5696-157b-3372-d2798ef82cd8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5696-157b-4641-b03d57512771	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5696-157b-962f-74aade874fba	AL	ALB	008	Albania 	Albanija	\N
00040000-5696-157b-5187-4098352185b2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5696-157b-991d-1291892540cf	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5696-157b-7450-50887660c77b	AD	AND	020	Andorra 	Andora	\N
00040000-5696-157b-d848-dd3e43557ba4	AO	AGO	024	Angola 	Angola	\N
00040000-5696-157b-f433-97b7aa31d408	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5696-157b-4aa4-7de2ddbb922a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5696-157b-2c4a-d0fb3498d0ff	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5696-157b-9761-dcb1db9e1b2b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5696-157b-73e7-51dde9ccb5f6	AM	ARM	051	Armenia 	Armenija	\N
00040000-5696-157b-a887-d4e3e8045c01	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5696-157b-596d-0020358786d3	AU	AUS	036	Australia 	Avstralija	\N
00040000-5696-157b-fca1-bc94907900fa	AT	AUT	040	Austria 	Avstrija	\N
00040000-5696-157b-f498-664ec8101a67	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5696-157b-2052-4264b90163a7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5696-157b-a3bb-ae7437841a19	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5696-157b-ae0e-3ef4fc7ea507	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5696-157b-8f3b-caf0d5e5b3e5	BB	BRB	052	Barbados 	Barbados	\N
00040000-5696-157b-1f80-6952c99573b1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5696-157b-0beb-b637c029990b	BE	BEL	056	Belgium 	Belgija	\N
00040000-5696-157b-fe86-5ae6723e91eb	BZ	BLZ	084	Belize 	Belize	\N
00040000-5696-157b-1630-d99378be6fb6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5696-157b-a328-06ed11642be8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5696-157b-9356-d518a0dbd243	BT	BTN	064	Bhutan 	Butan	\N
00040000-5696-157b-2ae0-2f919d3554fc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5696-157b-12bd-eae7bc4fe997	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5696-157b-e351-3236bbdff931	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5696-157b-d8df-a7132164b88d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5696-157b-c42a-dfc788f043ad	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5696-157b-8ddd-5aa439ac0e18	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5696-157b-884e-e6d0c8a7dacc	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5696-157b-a3cc-663a920b8626	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5696-157b-8928-408fc4544924	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5696-157b-7b4f-22515a79dd1c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5696-157b-7b74-e032163b8819	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5696-157b-c6a2-d0de48e3b70f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5696-157b-0e57-a5052fb4d15e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5696-157b-99e3-afffe9b92810	CA	CAN	124	Canada 	Kanada	\N
00040000-5696-157b-7933-abb5050f7fdd	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5696-157b-8670-ec4847ef54e2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5696-157b-28af-5cc9e5e8173f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5696-157b-a45f-e55aae89af4e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5696-157b-4770-4828a02e827a	CL	CHL	152	Chile 	Čile	\N
00040000-5696-157b-73f1-073bff366e3c	CN	CHN	156	China 	Kitajska	\N
00040000-5696-157b-ed39-36db2020ec83	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5696-157b-af6e-fca75c01cfe5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5696-157b-e095-4f02cd28f29e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5696-157b-2ab1-9a77e648749e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5696-157b-b5da-95879199429b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5696-157b-b414-6a202ead8dfa	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5696-157b-aa1b-44dc7d1cad64	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5696-157b-f614-d65a6e7f5495	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5696-157b-eb6b-7db1e1189e8b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5696-157b-1e66-87ffa5c723c0	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5696-157b-4f29-6d022282d2e5	CU	CUB	192	Cuba 	Kuba	\N
00040000-5696-157b-82ff-7872d7e28a06	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5696-157b-b1b1-577317995a8e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5696-157b-9ea4-df2203435df2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5696-157b-6aff-95e1c178e55a	DK	DNK	208	Denmark 	Danska	\N
00040000-5696-157b-b73d-3089adf6bc06	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5696-157b-6fd8-0c20ab1e384d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5696-157b-faea-b3cbedaddfcc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5696-157b-459e-c309b335bcfc	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5696-157b-2629-82581ea11a7e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5696-157b-3a1b-0129fb8c426a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5696-157b-d9f2-75282f015ca7	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5696-157b-e96f-35b7b09a69af	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5696-157b-c88d-a713298097f6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5696-157b-6dcb-10ffc0331b57	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5696-157b-fc1a-10019383c998	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5696-157b-4f1e-cd023edfe7f0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5696-157b-bca6-79b0ca270e0f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5696-157b-0f52-9ea1ed8c0c9f	FI	FIN	246	Finland 	Finska	\N
00040000-5696-157b-b1aa-ef0001239c11	FR	FRA	250	France 	Francija	\N
00040000-5696-157b-68ae-8ee01e20ab3d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5696-157b-03d4-3fe2bd677100	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5696-157b-d194-442c5ec4aa4b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5696-157b-1cab-3271028476c7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5696-157b-f430-e5bdb9b00e6d	GA	GAB	266	Gabon 	Gabon	\N
00040000-5696-157b-3714-197ec6451cda	GM	GMB	270	Gambia 	Gambija	\N
00040000-5696-157b-262f-e667ca569848	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5696-157b-4d4d-b9ef95ca10b8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5696-157b-a576-c8adf42cf033	GH	GHA	288	Ghana 	Gana	\N
00040000-5696-157b-4847-5d60efd480eb	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5696-157b-6bf5-49277140d707	GR	GRC	300	Greece 	Grčija	\N
00040000-5696-157b-063f-7c35aae80dee	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5696-157b-a542-289d8cebf43a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5696-157b-82ad-33de4e842017	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5696-157b-070c-dc094bcf96c5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5696-157b-6739-451f861a5df9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5696-157b-6561-dd7cc7a8aee6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5696-157b-da37-2e285977ccab	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5696-157b-9e90-7c92cdf528a9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5696-157b-00c1-3bccc18131f0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5696-157b-4a91-fb0b72734b72	HT	HTI	332	Haiti 	Haiti	\N
00040000-5696-157b-25ae-38367b4fa029	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5696-157b-201b-6a55cc75cfdf	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5696-157b-1f0a-b626609ac6e4	HN	HND	340	Honduras 	Honduras	\N
00040000-5696-157b-cfe4-a49442fd74c1	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5696-157b-91e8-ddd46932ab80	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5696-157b-f379-5064d6e16357	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5696-157b-d5ab-2eb55a1bbf77	IN	IND	356	India 	Indija	\N
00040000-5696-157b-6ba5-963cc5f21884	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5696-157b-a349-b15972c5a2d8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5696-157b-447d-72ad9fb673ad	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5696-157b-e2ee-dd1b07686da7	IE	IRL	372	Ireland 	Irska	\N
00040000-5696-157b-f51b-cf026cd7fa48	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5696-157b-246f-95b0806840a9	IL	ISR	376	Israel 	Izrael	\N
00040000-5696-157b-742d-5c55ea8edb5d	IT	ITA	380	Italy 	Italija	\N
00040000-5696-157b-6e50-88bb1462cda0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5696-157b-c20e-8240c1513557	JP	JPN	392	Japan 	Japonska	\N
00040000-5696-157b-0124-9d2f2cc52346	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5696-157b-7f1e-7f0316c190db	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5696-157b-6444-e52c49860f8f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5696-157b-fd8b-a35705962414	KE	KEN	404	Kenya 	Kenija	\N
00040000-5696-157b-6976-4182cd79aef6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5696-157b-bbf7-6ca711970dbc	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5696-157b-0f2b-22b5792e1684	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5696-157b-79e9-2076935e7587	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5696-157b-d3dd-4f1fb717f35c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5696-157b-d6d3-8bcf49da997c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5696-157b-d4e3-7ca09c2f024a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5696-157b-2f72-c14c2a0e6fe0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5696-157b-3ac1-ac96a79fc867	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5696-157b-dd48-738da60bb99c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5696-157b-8da6-76f3d1c3d57d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5696-157b-0101-1111fb238b6b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5696-157b-bb43-0ce7bb6837f8	LT	LTU	440	Lithuania 	Litva	\N
00040000-5696-157b-f6b8-9d7ed70f7fb2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5696-157b-2e58-a7bd93bfd5d1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5696-157b-28a6-eb0746d6643e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5696-157b-4171-1d7268771ea7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5696-157b-32ed-7b9da4be9097	MW	MWI	454	Malawi 	Malavi	\N
00040000-5696-157b-fd0d-8efef52eb1fc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5696-157b-d8de-5ff4df0393b6	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5696-157b-7e95-5c245ac72269	ML	MLI	466	Mali 	Mali	\N
00040000-5696-157b-43a4-53ae85e0cd07	MT	MLT	470	Malta 	Malta	\N
00040000-5696-157b-9cb8-815307a54999	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5696-157b-5b75-7455a6c630b9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5696-157b-cb1b-d24344084db8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5696-157b-4508-e426861dc67e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5696-157b-06bb-0131efd712ed	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5696-157b-0c46-c3478934b746	MX	MEX	484	Mexico 	Mehika	\N
00040000-5696-157b-69da-6c3195687ca4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5696-157b-608f-6405c90452fa	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5696-157b-b431-07cea591f657	MC	MCO	492	Monaco 	Monako	\N
00040000-5696-157b-9834-f0cf96391aa8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5696-157b-f456-1ec74d0166f9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5696-157b-4581-1ded2ba04cc6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5696-157b-0b5e-c0175e4615e5	MA	MAR	504	Morocco 	Maroko	\N
00040000-5696-157b-53ff-c5ef53789018	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5696-157b-f33a-c8b8336e200f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5696-157b-0472-c833c6025763	NA	NAM	516	Namibia 	Namibija	\N
00040000-5696-157b-8405-e059ecf39255	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5696-157b-d7b8-7c332046306c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5696-157b-e679-37c01aec30fc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5696-157b-4aa5-6a0a45e6704e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5696-157b-8782-282454c35965	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5696-157b-bf85-61c694af2af9	NE	NER	562	Niger 	Niger 	\N
00040000-5696-157b-3b92-74ba8145bfa4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5696-157b-30c6-3077c597940b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5696-157b-4291-2bf9c010ab59	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5696-157b-62e8-aaf915d3ed19	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5696-157b-be73-f03e11bf9562	NO	NOR	578	Norway 	Norveška	\N
00040000-5696-157b-7e78-342fc5a47b71	OM	OMN	512	Oman 	Oman	\N
00040000-5696-157b-8827-8df2e4a9c7c9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5696-157b-a922-dc794cf0fcef	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5696-157b-e814-3ec1c884c55f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5696-157b-90f0-65b46f5b80c1	PA	PAN	591	Panama 	Panama	\N
00040000-5696-157b-8400-6474bdef94e1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5696-157b-4fcd-3eb24d141ec0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5696-157b-df00-90d58a2953de	PE	PER	604	Peru 	Peru	\N
00040000-5696-157b-6afa-4a5d9e0943ca	PH	PHL	608	Philippines 	Filipini	\N
00040000-5696-157b-52e1-93ac3009d103	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5696-157b-6e59-e3407c834dd6	PL	POL	616	Poland 	Poljska	\N
00040000-5696-157b-8470-b3d9632e3ec5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5696-157b-7ad7-a07339a90562	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5696-157b-9948-90e7ee5ac2aa	QA	QAT	634	Qatar 	Katar	\N
00040000-5696-157b-6564-e664cf1cc7de	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5696-157b-4376-edfcdc0e0515	RO	ROU	642	Romania 	Romunija	\N
00040000-5696-157b-5bd7-abbe74af5536	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5696-157b-b35f-911e3362ee33	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5696-157b-ea89-83094faf8e4a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5696-157b-c0d4-ae12641f5c97	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5696-157b-3d46-1462369798b9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5696-157b-b402-be40357fe991	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5696-157b-0e50-7e19478e92bd	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5696-157b-ef71-918c62c1f2f9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5696-157b-f3c5-a3bb742817fe	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5696-157b-91bb-66b2b1def1ca	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5696-157b-d714-b15affafcb0c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5696-157b-4252-8dcb1aaad38e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5696-157b-dadb-4ca3ba74d838	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5696-157b-c96a-b73f7246514a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5696-157b-2d8f-f7a79c0812c1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5696-157b-07dd-b667e48370ba	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5696-157b-1897-d11d01dda0c5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5696-157b-9da0-67f7ac046c50	SG	SGP	702	Singapore 	Singapur	\N
00040000-5696-157b-4bea-e286e72284d9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5696-157b-5926-2659fcf02318	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5696-157b-85f2-552c87af0c86	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5696-157b-5419-ba67c43afc50	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5696-157b-6165-4a27beef165e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5696-157b-3317-281ed093c4cf	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5696-157b-c1f1-1e3670e02403	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5696-157b-80a2-0890614ce504	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5696-157b-c222-2ce34c15b933	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5696-157b-76db-4bfd1afde8b4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5696-157b-af8a-fb0d08e59ebf	SD	SDN	729	Sudan 	Sudan	\N
00040000-5696-157b-a807-870ce236134c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5696-157b-d37f-d977674b334a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5696-157b-ad8d-96b692114403	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5696-157b-d086-78be4ac129f4	SE	SWE	752	Sweden 	Švedska	\N
00040000-5696-157b-764e-e0f361b49669	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5696-157b-de3a-e1302a501846	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5696-157b-423b-c0885400e3f6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5696-157b-31cc-0ef257c82af4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5696-157b-cdb0-cbe2585be2f0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5696-157b-fe30-d3db8ea3b58b	TH	THA	764	Thailand 	Tajska	\N
00040000-5696-157b-6214-8f332d71dbf6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5696-157b-5793-a4ccef813e72	TG	TGO	768	Togo 	Togo	\N
00040000-5696-157b-8344-0819ef56d35b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5696-157b-77f0-5402624dedd3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5696-157b-e00a-a1d887e85a1a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5696-157b-7c22-3c95ca7faccf	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5696-157b-d2ed-5148f9913e60	TR	TUR	792	Turkey 	Turčija	\N
00040000-5696-157b-c52d-993603a1f50a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5696-157b-b0fd-28260f72564f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5696-157b-d778-20d9581001c2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5696-157b-61da-3983e970ce6d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5696-157b-7389-9de8c065d65e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5696-157b-cf77-f7e7a6ecc270	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5696-157b-7be2-3ff4bff87fd4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5696-157b-57c0-1d9f9419c913	US	USA	840	United States 	Združene države Amerike	\N
00040000-5696-157b-f488-cb041de804fb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5696-157b-3fb0-72971c719dd5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5696-157b-1bee-c234db935790	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5696-157b-4862-565756443555	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5696-157b-fc91-341a78798453	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5696-157b-2946-fba1d0c5baf9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5696-157b-fe07-76f21b23f08e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5696-157b-ec15-8ba430e8b0ba	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5696-157b-cc0b-9ce552d94380	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5696-157b-128a-dca1224a5420	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5696-157b-f79f-1dfb6c25fe9d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5696-157b-9179-d8e549550e8d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5696-157b-f88e-9837e737ff8a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3198 (class 0 OID 35810321)
-- Dependencies: 241
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5696-157f-81ef-7fe0c5118b25	000e0000-5696-157f-c81f-a9941d0eda35	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5696-157b-b6c8-3666ede2978f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5696-157f-4c0a-a53c1972e945	000e0000-5696-157f-5a1b-664f1f0d8f9c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5696-157b-326f-0c3a5fe74c59	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5696-157f-6e63-fa15950b7102	000e0000-5696-157f-0a53-f94015c5fb94	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5696-157b-b6c8-3666ede2978f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5696-157f-c54e-90616614fa0b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5696-157f-d3cd-f6b393073423	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3183 (class 0 OID 35810126)
-- Dependencies: 226
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5696-157f-7df6-d5991879a4e7	000e0000-5696-157f-91d3-814c78fde262	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5696-157b-79f7-a79f0e413334
000d0000-5696-157f-acff-f3231fe088a7	000e0000-5696-157f-91d3-814c78fde262	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-1041-2382f7b82aee	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-44a6-a7d84a83ea02	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5696-157b-79f7-a79f0e413334
000d0000-5696-157f-d342-f3335f8905a4	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-4527-48f8024b40f1	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-deb5-4b9cfbf513f1	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-1b5d-e26a67fc1da0	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5696-157b-1030-c3a2b6e5fc47
000d0000-5696-157f-c172-35e98793109a	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-1d84-54f9b954d898	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5696-157b-61c0-0bccf38801c6
000d0000-5696-157f-f9ef-7b8a0c716bee	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-05f5-d5a504a93bfb	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5696-157b-61c0-0bccf38801c6
000d0000-5696-157f-1be4-31e050031026	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-4afa-c6d07daa6413	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5696-157b-79f7-a79f0e413334
000d0000-5696-157f-fcfa-58b41d0a4997	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-893b-d5b44a01142d	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5696-157b-79f7-a79f0e413334
000d0000-5696-157f-4038-4dd1f0c6d58a	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-d5e3-a2483ddc6576	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5696-157b-9d78-8652ffe20eda
000d0000-5696-157f-35a6-5c9c247cfb1b	000e0000-5696-157f-5a1b-664f1f0d8f9c	000c0000-5696-157f-38e9-e49972f69060	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5696-157b-c8d2-8a78f158165c
000d0000-5696-157f-ffbf-6c7e14277912	000e0000-5696-157f-6046-86aa975942b3	000c0000-5696-157f-d72c-404721199f37	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-e1bf-b7f8a821d6b2	000e0000-5696-157f-a892-7ef3e9edc235	000c0000-5696-157f-8f98-08344acfa0a8	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-ff5e-6cb08464caea	000e0000-5696-157f-a892-7ef3e9edc235	000c0000-5696-157f-0083-ea6c50b53a40	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-c945-8a0c559fac96	000e0000-5696-157f-d738-26dba7060ca8	000c0000-5696-157f-087d-bcd925ec9240	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-76f3-4bb130925f9c	000e0000-5696-157f-2c56-6d01087f1428	000c0000-5696-157f-fb15-59317ec7ed95	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-6e28-50c2b243bd20	000e0000-5696-157f-15b4-c4c820265e4a	000c0000-5696-157f-3840-0e01ea2607f9	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-15d9-58bd8827e756	000e0000-5696-157f-b39a-e67ea9847b43	000c0000-5696-157f-f7b6-a69fd54c287b	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-bc7d-3411a70db4d1	000e0000-5696-157f-3bf3-0d960d7afaa0	000c0000-5696-157f-84bf-1ac05f8d7a40	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-fadf-5cf3df21d23b	000e0000-5696-157f-7cc5-1ed3f008def2	000c0000-5696-157f-4cc4-d9db8bb14822	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-74a3-a91a7b17f3a4	000e0000-5696-157f-7cc5-1ed3f008def2	000c0000-5696-157f-b15e-fbffb6cb7670	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-0445-ec59c24fa977	000e0000-5696-157f-9255-a83cc1487fc9	000c0000-5696-157f-01c2-af717582849b	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
000d0000-5696-157f-05d1-04ff757b5743	000e0000-5696-157f-9255-a83cc1487fc9	000c0000-5696-157f-58ac-11a9f1914b50	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5696-157b-4a99-8a6e78a730ef
\.


--
-- TOC entry 3157 (class 0 OID 35809896)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 35809865)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 35809842)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5696-157f-8f69-64671737b894	00080000-5696-157f-998c-ee0a5bf21f20	00090000-5696-157f-7327-3a3c3033662b	AK		igralka
\.


--
-- TOC entry 3172 (class 0 OID 35810040)
-- Dependencies: 215
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 35810591)
-- Dependencies: 252
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5696-157f-faba-0771ce4e3540	00010000-5696-157c-18be-310516881390	\N	Prva mapa	Root mapa	2016-01-13 10:14:39	2016-01-13 10:14:39	R	\N	\N
\.


--
-- TOC entry 3210 (class 0 OID 35810604)
-- Dependencies: 253
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 35810626)
-- Dependencies: 255
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 34548309)
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
-- TOC entry 3176 (class 0 OID 35810065)
-- Dependencies: 219
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 35809799)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5696-157d-a199-62ed6cf7dd8d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5696-157d-c947-82d4bbd4ba9f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5696-157d-9e46-734c22d8eac5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5696-157d-1e4a-1a3a111a2009	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5696-157d-04a4-345987d596e6	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5696-157d-7139-89500828c4a3	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5696-157d-ea66-cbe120d958fc	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5696-157d-0fd3-488d8810284e	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5696-157d-9ea4-73ba3cde6a27	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5696-157d-3bd4-7a15d75a16dc	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5696-157d-b2d7-3bae787973ad	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5696-157d-1407-83d093426ebb	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5696-157d-e22e-60dafb4ca7e6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5696-157d-b552-0e956133215b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5696-157e-6868-b0ac75cfc5a9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5696-157e-fc97-98471839f9d1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5696-157e-7501-0d44d5fb94cd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5696-157e-8ca7-faf112e06e9e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5696-157e-2810-9a79b03bcc37	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5696-1580-e382-9890dc15af66	application.tenant.maticnopodjetje	string	s:36:"00080000-5696-1580-8a57-e5549a291f42";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3142 (class 0 OID 35809699)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5696-157e-8803-10e167993d40	00000000-5696-157e-6868-b0ac75cfc5a9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5696-157e-6e16-ed8409040112	00000000-5696-157e-6868-b0ac75cfc5a9	00010000-5696-157c-18be-310516881390	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5696-157e-a9d0-30837c90fa4e	00000000-5696-157e-fc97-98471839f9d1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3146 (class 0 OID 35809766)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5696-157f-e962-e93dc5f78cef	\N	00100000-5696-157f-8665-d4431fe6e779	00100000-5696-157f-a630-0362f7b0d6cd	01	Gledališče Nimbis
00410000-5696-157f-dc4d-a1d0f0667ff5	00410000-5696-157f-e962-e93dc5f78cef	00100000-5696-157f-8665-d4431fe6e779	00100000-5696-157f-a630-0362f7b0d6cd	02	Tehnika
\.


--
-- TOC entry 3143 (class 0 OID 35809710)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5696-157f-3ddd-f9f50e727f7c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5696-157f-a493-0feb8bed05ee	00010000-5696-157e-bb3a-ae4c435de573	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5696-157f-3787-7a3a23e5dbb7	00010000-5696-157e-a8da-b82b6d4b41a2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5696-157f-52c1-5b4d9a789e64	00010000-5696-157e-49b7-0eff84f657d2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5696-157f-f67a-4933fb7f8a66	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5696-157f-05f2-5ecadba15225	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5696-157f-e39c-0b05a6a1ff16	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5696-157f-d17c-7421e99fb920	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5696-157f-7327-3a3c3033662b	00010000-5696-157e-4f11-ccaa12972736	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5696-157f-6400-688dcce10fbf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5696-157f-9254-d8ef36f977e6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5696-157f-fb17-3014d1b78b06	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5696-157f-52a8-2ba43b7b6f09	00010000-5696-157e-20ab-18de7f08f576	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5696-157f-502d-216726ef0edc	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-157f-ef79-db0f5a3e9d8a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-157f-0085-29d74a765b0c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-157f-a77d-2b3cc5c95cac	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5696-157f-4d7f-6a3439399f20	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5696-157f-e8c3-1396a4c6f29c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-157f-ae03-2ecafeadd398	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5696-157f-3950-b1c0f4c69d26	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3135 (class 0 OID 35809645)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5696-157c-1069-af9c5f12ea7c	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5696-157c-4c8a-f11f7a5184b0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5696-157c-ef8e-c300f9ba4ee3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5696-157c-b35a-fabd326b08fa	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5696-157c-04cd-e32020d55f6d	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5696-157c-4fe0-a16e93b3f420	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5696-157c-795f-a661fbb7b1c8	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5696-157c-ec3c-dec725c81a46	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5696-157c-c68c-29c2ee42d80d	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5696-157c-e8f0-f80c3227a757	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5696-157c-65a0-d288c8b9699b	Abonma-read	Abonma - branje	t
00030000-5696-157c-4baf-1f0aefb1a12d	Abonma-write	Abonma - spreminjanje	t
00030000-5696-157c-f648-a3f425e9e280	Alternacija-read	Alternacija - branje	t
00030000-5696-157c-eb2e-cca3a66824eb	Alternacija-write	Alternacija - spreminjanje	t
00030000-5696-157c-d1a3-93871dee2d7d	Arhivalija-read	Arhivalija - branje	t
00030000-5696-157c-9d52-4c2f653730de	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5696-157c-6e2a-40f1cadfa70d	AuthStorage-read	AuthStorage - branje	t
00030000-5696-157c-beca-1e4a38c57497	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5696-157c-f204-4a964a043ca6	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5696-157c-bfe3-bd9501066787	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5696-157c-6ad5-1176892ca043	Besedilo-read	Besedilo - branje	t
00030000-5696-157c-c2c9-b0a3b087be98	Besedilo-write	Besedilo - spreminjanje	t
00030000-5696-157c-9bc2-bae6f95e486d	Dodatek-read	Dodatek - branje	t
00030000-5696-157c-ac07-1c3c65666af6	Dodatek-write	Dodatek - spreminjanje	t
00030000-5696-157c-c156-c11a800d8bea	Dogodek-read	Dogodek - branje	t
00030000-5696-157c-56c4-a49bc1e94e04	Dogodek-write	Dogodek - spreminjanje	t
00030000-5696-157c-64c1-d42b6983e07f	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5696-157c-b6d2-bc4c38a33308	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5696-157c-10fe-7885c2aa8fb9	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5696-157c-66cd-cea100a13ff8	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5696-157c-3976-2a8d16de9228	DogodekTrait-read	DogodekTrait - branje	t
00030000-5696-157c-7636-7e61780d9591	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5696-157c-2a82-d24467b26564	DrugiVir-read	DrugiVir - branje	t
00030000-5696-157c-1105-a4087f091ef9	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5696-157c-1122-14877cebbf6e	Drzava-read	Drzava - branje	t
00030000-5696-157c-e58c-a2b8dccc0b77	Drzava-write	Drzava - spreminjanje	t
00030000-5696-157c-c708-b1d54a36a1ca	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5696-157c-c14f-a2b2a5123b96	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5696-157c-afe0-f77f6d64660c	Funkcija-read	Funkcija - branje	t
00030000-5696-157c-6514-203c5dc564ad	Funkcija-write	Funkcija - spreminjanje	t
00030000-5696-157c-40e2-8abaa42dc296	Gostovanje-read	Gostovanje - branje	t
00030000-5696-157c-d2f8-a9dbf298462f	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5696-157c-970a-f618bc002a4f	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5696-157c-db09-9a9870bd23b5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5696-157c-c05a-e6c07991d048	Kupec-read	Kupec - branje	t
00030000-5696-157c-def5-7e196f1fdb08	Kupec-write	Kupec - spreminjanje	t
00030000-5696-157c-915b-48faeeb67d23	NacinPlacina-read	NacinPlacina - branje	t
00030000-5696-157c-8a7a-481664a6aacf	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5696-157c-2dfb-53ffa3a7f260	Option-read	Option - branje	t
00030000-5696-157c-bdac-6c38f3ebb5b3	Option-write	Option - spreminjanje	t
00030000-5696-157c-4205-3cc90bbd60a1	OptionValue-read	OptionValue - branje	t
00030000-5696-157c-c605-9cc35e168a85	OptionValue-write	OptionValue - spreminjanje	t
00030000-5696-157c-8cbe-29e18aa6a657	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5696-157c-c326-5f07052d4754	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5696-157c-26c8-7778dc5fe850	Oseba-read	Oseba - branje	t
00030000-5696-157c-0ba0-c2dea8c2274f	Oseba-write	Oseba - spreminjanje	t
00030000-5696-157c-9aa7-5954e37271c6	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5696-157c-5304-874b78e27a1f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5696-157c-40c0-80308bf73a69	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5696-157c-75bd-3a706a35bb67	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5696-157c-238d-527f7ac940e4	Pogodba-read	Pogodba - branje	t
00030000-5696-157c-7089-d368dbc8eac2	Pogodba-write	Pogodba - spreminjanje	t
00030000-5696-157c-11e1-a0e928d600df	Popa-read	Popa - branje	t
00030000-5696-157c-6ca0-a1aa5201e53b	Popa-write	Popa - spreminjanje	t
00030000-5696-157c-98a2-673169ea9107	Posta-read	Posta - branje	t
00030000-5696-157c-621c-343833db6eaa	Posta-write	Posta - spreminjanje	t
00030000-5696-157c-bb3e-64c9242ab071	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5696-157c-2102-81cc1e720e71	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5696-157c-dca9-a47fa9dcfd38	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5696-157c-963f-d9d8c3d64128	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5696-157c-bf49-0a2e9368c160	PostniNaslov-read	PostniNaslov - branje	t
00030000-5696-157c-06c3-4d22a7886ad6	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5696-157c-3269-ab7cb5605b94	Praznik-read	Praznik - branje	t
00030000-5696-157c-c835-5414953520e1	Praznik-write	Praznik - spreminjanje	t
00030000-5696-157c-4f04-545be1a39969	Predstava-read	Predstava - branje	t
00030000-5696-157c-9a8c-c35c7658a6c8	Predstava-write	Predstava - spreminjanje	t
00030000-5696-157c-1eb1-444ec19c8a7e	Prisotnost-read	Prisotnost - branje	t
00030000-5696-157c-869f-3f5f7e38c044	Prisotnost-write	Prisotnost - spreminjanje	t
00030000-5696-157c-c17c-c049c39c2622	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5696-157c-289e-c688be8e78fd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5696-157c-b42d-678e9effeff7	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5696-157c-baee-48d2e3969b69	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5696-157c-e177-0db2b90a03eb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5696-157c-d4ca-9849ba0b116a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5696-157c-bc3d-b4b9eb5917e1	ProgramDela-read	ProgramDela - branje	t
00030000-5696-157c-4af9-0d487a193926	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5696-157c-bdad-50b5492c4ccd	ProgramFestival-read	ProgramFestival - branje	t
00030000-5696-157c-8152-89e09e306ddf	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5696-157c-eaa2-b60374aa3e58	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5696-157c-b0d1-ff3764358335	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5696-157c-480e-a0e138fed360	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5696-157c-6961-3d725918987b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5696-157c-5551-177656fcf2d4	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5696-157c-976d-13a79bc89fb2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5696-157c-a2d8-fe03be358b91	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5696-157c-fdea-82394363f86c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5696-157c-05f0-4f91ebb3fe7a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5696-157c-2499-c85ee43793f8	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5696-157c-f332-4621f82498f4	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5696-157c-9a6c-8a346b3b83de	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5696-157c-094b-e44553ebac78	ProgramRazno-read	ProgramRazno - branje	t
00030000-5696-157c-07d8-9dc3acc9d125	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5696-157c-9c89-3375787c5d7d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5696-157c-2e23-16fb280cbad5	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5696-157c-d019-a282357e87f9	Prostor-read	Prostor - branje	t
00030000-5696-157c-25f3-c7166c62c0e1	Prostor-write	Prostor - spreminjanje	t
00030000-5696-157c-04a7-318901b2ebca	Racun-read	Racun - branje	t
00030000-5696-157c-ee4c-857b00388fe5	Racun-write	Racun - spreminjanje	t
00030000-5696-157c-5172-9219b3672ea1	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5696-157c-2057-42bb0171bffd	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5696-157c-9eee-ba22788fee8c	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5696-157c-8048-8e14bc0d0f22	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5696-157c-06ac-ae563798a851	Rekvizit-read	Rekvizit - branje	t
00030000-5696-157c-290d-ad166a5128d8	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5696-157c-d304-9af24537e54c	Revizija-read	Revizija - branje	t
00030000-5696-157c-7e95-ef4c0a00a99f	Revizija-write	Revizija - spreminjanje	t
00030000-5696-157c-09e5-9256bda3d6a0	Rezervacija-read	Rezervacija - branje	t
00030000-5696-157c-d56a-e3d1313c773a	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5696-157c-9216-6eb00a7f9579	SedezniRed-read	SedezniRed - branje	t
00030000-5696-157c-7c80-59962259795a	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5696-157c-bbc1-fac6f62d0efb	Sedez-read	Sedez - branje	t
00030000-5696-157c-344c-535de4190a8c	Sedez-write	Sedez - spreminjanje	t
00030000-5696-157c-0828-0abab062dae5	Sezona-read	Sezona - branje	t
00030000-5696-157c-7797-deae52237205	Sezona-write	Sezona - spreminjanje	t
00030000-5696-157c-e068-6bfecd6230fa	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5696-157c-802b-dd1b579fcd4d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5696-157c-36f4-d51d53f0dde4	Telefonska-read	Telefonska - branje	t
00030000-5696-157c-685b-868da40da091	Telefonska-write	Telefonska - spreminjanje	t
00030000-5696-157c-a973-b7a4fcbec3e3	TerminStoritve-read	TerminStoritve - branje	t
00030000-5696-157c-d107-6ef6eb098b35	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5696-157c-8174-9f83b2202997	TipDodatka-read	TipDodatka - branje	t
00030000-5696-157c-2793-f836bdd9b637	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5696-157c-ff6e-952350b601b3	TipFunkcije-read	TipFunkcije - branje	t
00030000-5696-157c-987f-312fb49aa0ca	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5696-157c-b57b-d1732a26dc88	TipPopa-read	TipPopa - branje	t
00030000-5696-157c-fc7f-17b7e8f44f7c	TipPopa-write	TipPopa - spreminjanje	t
00030000-5696-157c-bf5c-cb8d3f21813b	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5696-157c-7a71-1de97ed40c55	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5696-157c-8bb4-c34d5de6cd12	TipVaje-read	TipVaje - branje	t
00030000-5696-157c-5eb3-021c9c4211f2	TipVaje-write	TipVaje - spreminjanje	t
00030000-5696-157c-79cd-14421770e8e3	Trr-read	Trr - branje	t
00030000-5696-157c-4ef4-29d2e6e07dc6	Trr-write	Trr - spreminjanje	t
00030000-5696-157c-0482-796310951b5f	Uprizoritev-read	Uprizoritev - branje	t
00030000-5696-157c-fd37-ca5781899224	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5696-157c-6285-6b5d6e23e523	Vaja-read	Vaja - branje	t
00030000-5696-157c-88f4-28479b4f7c42	Vaja-write	Vaja - spreminjanje	t
00030000-5696-157c-827b-ec9657236f7e	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5696-157c-cdce-1f947f4625e8	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5696-157c-741d-1b6620e6e3fe	VrstaStroska-read	VrstaStroska - branje	t
00030000-5696-157c-8d70-9ed8625760aa	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5696-157c-547a-2bb4bb16f7e0	Zaposlitev-read	Zaposlitev - branje	t
00030000-5696-157c-d9b9-02bad6ce3a18	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5696-157c-8161-0d9f2a23ffa3	Zasedenost-read	Zasedenost - branje	t
00030000-5696-157c-de7f-52637056fdcb	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5696-157c-31ca-503f3b87d598	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5696-157c-a132-05432dd4c241	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5696-157c-ecb5-179b89d3b7c6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5696-157c-0068-b78956e92c79	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5696-157c-a005-9405f0c73864	Job-read	Branje opravil - samo zase - branje	t
00030000-5696-157c-74f0-4ded46247627	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5696-157c-86b0-15378aa18e62	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5696-157c-6ea5-66e9ebb08c34	Report-read	Report - branje	t
00030000-5696-157c-4165-e879097730e4	Report-write	Report - spreminjanje	t
00030000-5696-157c-a6f2-3fbb61939f34	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5696-157c-d21b-734d73ada9f4	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5696-157c-e234-1cb5276dffbe	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5696-157c-6cd4-1e4683c85942	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5696-157c-f834-ca68ec59ad26	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5696-157c-061b-8cd6e2fa90c7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5696-157c-fc10-ead91546261c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5696-157c-2756-932a262dab46	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5696-157c-3fbe-cdc89cb02d4c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5696-157c-8df9-410355b645dd	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5696-157c-82fd-472093492ad1	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5696-157c-436f-70a2c3c2c113	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5696-157c-3bdb-1a7a1bbd7cf0	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5696-157c-5523-2c41155faecd	Datoteka-write	Datoteka - spreminjanje	t
00030000-5696-157c-10cf-f408e706c963	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3137 (class 0 OID 35809664)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5696-157c-6d16-bb5f9eb732a2	00030000-5696-157c-4c8a-f11f7a5184b0
00020000-5696-157c-6d16-bb5f9eb732a2	00030000-5696-157c-1069-af9c5f12ea7c
00020000-5696-157c-1921-afe8db19c0e2	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-bfe3-bd9501066787
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-c2c9-b0a3b087be98
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-a081-588e65ef12ee	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-43f9-919ed62b6649	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157c-43f9-919ed62b6649	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-43f9-919ed62b6649	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-43f9-919ed62b6649	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-43f9-919ed62b6649	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-43f9-919ed62b6649	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-21ae-54ef763df6b2	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-21ae-54ef763df6b2	00030000-5696-157c-d9b9-02bad6ce3a18
00020000-5696-157c-21ae-54ef763df6b2	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-21ae-54ef763df6b2	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157c-21ae-54ef763df6b2	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-21ae-54ef763df6b2	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-21ae-54ef763df6b2	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-e715-144b8833fa74	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-e715-144b8833fa74	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-e715-144b8833fa74	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-1be1-353add228da8	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-1be1-353add228da8	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-1be1-353add228da8	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-1be1-353add228da8	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-1be1-353add228da8	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-1be1-353add228da8	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-1be1-353add228da8	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-1be1-353add228da8	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-b6db-2fd8347f0d36	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-b6db-2fd8347f0d36	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-b6db-2fd8347f0d36	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-b6db-2fd8347f0d36	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-4ef4-29d2e6e07dc6
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-06c3-4d22a7886ad6
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-685b-868da40da091
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-0e1e-a2e1d26ae0c5	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-f5a0-b997ea5f929e	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-f5a0-b997ea5f929e	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-f5a0-b997ea5f929e	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-f5a0-b997ea5f929e	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-f5a0-b997ea5f929e	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-f5a0-b997ea5f929e	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-f5a0-b997ea5f929e	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-685b-868da40da091
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-06c3-4d22a7886ad6
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-4ef4-29d2e6e07dc6
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-6ca0-a1aa5201e53b
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-db09-9a9870bd23b5
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-d4ca-9849ba0b116a
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-d2ee-e4abf1d2e421	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-f107-cd05b0687a5e	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-2ca5-8cedeb3a7306	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-2ca5-8cedeb3a7306	00030000-5696-157c-fc7f-17b7e8f44f7c
00020000-5696-157c-0035-6e8af0f1f85a	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-4e1a-81dd93c74f5a	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-4e1a-81dd93c74f5a	00030000-5696-157c-621c-343833db6eaa
00020000-5696-157c-3cdc-15d266da8da2	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-bab5-0a603a18b820	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-bab5-0a603a18b820	00030000-5696-157c-e58c-a2b8dccc0b77
00020000-5696-157c-76e2-4227c8afe115	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-5d2c-505a245cbdfb	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157c-5d2c-505a245cbdfb	00030000-5696-157c-0068-b78956e92c79
00020000-5696-157c-b34f-0fc4048ad4e8	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157c-af48-61ae71d345bf	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-af48-61ae71d345bf	00030000-5696-157c-a132-05432dd4c241
00020000-5696-157c-bfa8-fb64c4bf2383	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-642f-61bacbf1e65d	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157c-642f-61bacbf1e65d	00030000-5696-157c-4baf-1f0aefb1a12d
00020000-5696-157c-cf2d-c8a7292993d2	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157c-e7ec-90204349ed80	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-e7ec-90204349ed80	00030000-5696-157c-25f3-c7166c62c0e1
00020000-5696-157c-e7ec-90204349ed80	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-e7ec-90204349ed80	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-e7ec-90204349ed80	00030000-5696-157c-06c3-4d22a7886ad6
00020000-5696-157c-e7ec-90204349ed80	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-f1d0-0ed6d3668293	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-f1d0-0ed6d3668293	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-f1d0-0ed6d3668293	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-e513-d9408fdedb8c	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-e513-d9408fdedb8c	00030000-5696-157c-8d70-9ed8625760aa
00020000-5696-157c-987b-e086f95787ae	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-c326-5f07052d4754
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-63f5-f5d20398b8e7	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-d0ad-294ca1e6ec9d	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-d0ad-294ca1e6ec9d	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-d0ad-294ca1e6ec9d	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-d0ad-294ca1e6ec9d	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-d0ad-294ca1e6ec9d	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-a442-07e7244426f7	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157c-a442-07e7244426f7	00030000-5696-157c-5eb3-021c9c4211f2
00020000-5696-157c-92d2-bb09419269bc	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-795f-a661fbb7b1c8
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-ec3c-dec725c81a46
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-bc3d-b4b9eb5917e1
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-4af9-0d487a193926
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-bdad-50b5492c4ccd
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-8152-89e09e306ddf
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-eaa2-b60374aa3e58
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-b0d1-ff3764358335
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-480e-a0e138fed360
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-6961-3d725918987b
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-5551-177656fcf2d4
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-976d-13a79bc89fb2
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-a2d8-fe03be358b91
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-fdea-82394363f86c
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-05f0-4f91ebb3fe7a
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-2499-c85ee43793f8
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-f332-4621f82498f4
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-9a6c-8a346b3b83de
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-094b-e44553ebac78
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-07d8-9dc3acc9d125
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-9c89-3375787c5d7d
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-2e23-16fb280cbad5
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-baee-48d2e3969b69
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-1105-a4087f091ef9
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-2102-81cc1e720e71
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-74f0-4ded46247627
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-2a82-d24467b26564
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-b42d-678e9effeff7
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-bb3e-64c9242ab071
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-a005-9405f0c73864
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-221a-5b1941316784	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-bc3d-b4b9eb5917e1
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-bdad-50b5492c4ccd
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-eaa2-b60374aa3e58
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-480e-a0e138fed360
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-5551-177656fcf2d4
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-a2d8-fe03be358b91
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-05f0-4f91ebb3fe7a
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-f332-4621f82498f4
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-094b-e44553ebac78
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-9c89-3375787c5d7d
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-b42d-678e9effeff7
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-2a82-d24467b26564
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-bb3e-64c9242ab071
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-a005-9405f0c73864
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-d4cb-6fb98f9921bd	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-fd37-ca5781899224
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-e8f0-f80c3227a757
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-0295-fa182cd01ad4	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-b0ff-4b06f440b265	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-3329-109a6dfa5051	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-3329-109a6dfa5051	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-3329-109a6dfa5051	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-3329-109a6dfa5051	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157c-3329-109a6dfa5051	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-3329-109a6dfa5051	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-3329-109a6dfa5051	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-3329-109a6dfa5051	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-7089-d368dbc8eac2
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-802b-dd1b579fcd4d
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-9e51-5236a4b8cef6	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-08e7-3e2c7ee4e2fc	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-5428-e125f90e3202	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-5428-e125f90e3202	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-5428-e125f90e3202	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-5428-e125f90e3202	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-5428-e125f90e3202	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-5428-e125f90e3202	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-5428-e125f90e3202	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-4eff-a6432fecc0d2	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-4eff-a6432fecc0d2	00030000-5696-157c-802b-dd1b579fcd4d
00020000-5696-157c-4eff-a6432fecc0d2	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-4eff-a6432fecc0d2	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-fce7-be4be06e28ac	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-fce7-be4be06e28ac	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-bfe3-bd9501066787
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-c2c9-b0a3b087be98
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-2a82-d24467b26564
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-1105-a4087f091ef9
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-e8f0-f80c3227a757
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-a005-9405f0c73864
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-74f0-4ded46247627
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-7089-d368dbc8eac2
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-bb3e-64c9242ab071
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-2102-81cc1e720e71
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-b42d-678e9effeff7
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-baee-48d2e3969b69
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-795f-a661fbb7b1c8
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-bc3d-b4b9eb5917e1
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-ec3c-dec725c81a46
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-4af9-0d487a193926
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-bdad-50b5492c4ccd
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-8152-89e09e306ddf
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-eaa2-b60374aa3e58
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-b0d1-ff3764358335
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-480e-a0e138fed360
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-6961-3d725918987b
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-5551-177656fcf2d4
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-976d-13a79bc89fb2
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-a2d8-fe03be358b91
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-fdea-82394363f86c
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-05f0-4f91ebb3fe7a
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-2499-c85ee43793f8
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-f332-4621f82498f4
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-9a6c-8a346b3b83de
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-094b-e44553ebac78
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-07d8-9dc3acc9d125
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-9c89-3375787c5d7d
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-2e23-16fb280cbad5
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-802b-dd1b579fcd4d
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-fd37-ca5781899224
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-8730-7fbe051b9c2b	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-bfe3-bd9501066787
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-c2c9-b0a3b087be98
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-abfb-6ba2c4dd4c35	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-bfe3-bd9501066787
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-c2c9-b0a3b087be98
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-e8f0-f80c3227a757
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-fd37-ca5781899224
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-bba7-85c655cb47d7	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-bfe3-bd9501066787
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-c2c9-b0a3b087be98
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-2a82-d24467b26564
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-1105-a4087f091ef9
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-e8f0-f80c3227a757
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-a005-9405f0c73864
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-74f0-4ded46247627
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-db09-9a9870bd23b5
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-7089-d368dbc8eac2
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-6ca0-a1aa5201e53b
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-bb3e-64c9242ab071
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-2102-81cc1e720e71
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-06c3-4d22a7886ad6
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-b42d-678e9effeff7
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-baee-48d2e3969b69
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-d4ca-9849ba0b116a
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-795f-a661fbb7b1c8
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-bc3d-b4b9eb5917e1
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-ec3c-dec725c81a46
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-4af9-0d487a193926
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-bdad-50b5492c4ccd
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-8152-89e09e306ddf
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-eaa2-b60374aa3e58
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-b0d1-ff3764358335
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-480e-a0e138fed360
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-6961-3d725918987b
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-5551-177656fcf2d4
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-976d-13a79bc89fb2
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-a2d8-fe03be358b91
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-fdea-82394363f86c
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-05f0-4f91ebb3fe7a
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-2499-c85ee43793f8
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-f332-4621f82498f4
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-9a6c-8a346b3b83de
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-094b-e44553ebac78
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-07d8-9dc3acc9d125
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-9c89-3375787c5d7d
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-2e23-16fb280cbad5
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-802b-dd1b579fcd4d
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-685b-868da40da091
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-4ef4-29d2e6e07dc6
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-fd37-ca5781899224
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-d9b9-02bad6ce3a18
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-72eb-7469f8bf3863	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-bfe3-bd9501066787
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-c2c9-b0a3b087be98
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-e8f0-f80c3227a757
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-db09-9a9870bd23b5
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-6ca0-a1aa5201e53b
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-06c3-4d22a7886ad6
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-d4ca-9849ba0b116a
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-685b-868da40da091
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-4ef4-29d2e6e07dc6
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-fd37-ca5781899224
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-d9b9-02bad6ce3a18
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-d22e-4cdaa4be9c9a	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-ac75-2f37cbe98aa2	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-2a82-d24467b26564
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-1105-a4087f091ef9
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-a005-9405f0c73864
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-74f0-4ded46247627
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-db09-9a9870bd23b5
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-c326-5f07052d4754
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-7089-d368dbc8eac2
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-6ca0-a1aa5201e53b
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-bb3e-64c9242ab071
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-2102-81cc1e720e71
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-06c3-4d22a7886ad6
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-b42d-678e9effeff7
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-baee-48d2e3969b69
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-d4ca-9849ba0b116a
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-795f-a661fbb7b1c8
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-bc3d-b4b9eb5917e1
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-ec3c-dec725c81a46
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-4af9-0d487a193926
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-bdad-50b5492c4ccd
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-8152-89e09e306ddf
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-eaa2-b60374aa3e58
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-b0d1-ff3764358335
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-480e-a0e138fed360
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-6961-3d725918987b
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-5551-177656fcf2d4
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-976d-13a79bc89fb2
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-a2d8-fe03be358b91
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-fdea-82394363f86c
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-05f0-4f91ebb3fe7a
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-2499-c85ee43793f8
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-f332-4621f82498f4
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-9a6c-8a346b3b83de
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-094b-e44553ebac78
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-07d8-9dc3acc9d125
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-9c89-3375787c5d7d
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-2e23-16fb280cbad5
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-802b-dd1b579fcd4d
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-685b-868da40da091
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-4ef4-29d2e6e07dc6
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-0482-796310951b5f
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-8d70-9ed8625760aa
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-2756-932a262dab46
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-d9b9-02bad6ce3a18
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157c-5795-31a2cdacc3a5	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-1069-af9c5f12ea7c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-4c8a-f11f7a5184b0
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-65a0-d288c8b9699b
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-4baf-1f0aefb1a12d
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d1a3-93871dee2d7d
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-9d52-4c2f653730de
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-6e2a-40f1cadfa70d
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-beca-1e4a38c57497
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-f204-4a964a043ca6
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-bfe3-bd9501066787
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-6ad5-1176892ca043
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c2c9-b0a3b087be98
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c156-c11a800d8bea
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-b35a-fabd326b08fa
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-64c1-d42b6983e07f
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-b6d2-bc4c38a33308
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-10fe-7885c2aa8fb9
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-66cd-cea100a13ff8
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-3976-2a8d16de9228
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-7636-7e61780d9591
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-56c4-a49bc1e94e04
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-2a82-d24467b26564
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-1105-a4087f091ef9
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-1122-14877cebbf6e
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-e58c-a2b8dccc0b77
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c708-b1d54a36a1ca
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c14f-a2b2a5123b96
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-e8f0-f80c3227a757
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-40e2-8abaa42dc296
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d2f8-a9dbf298462f
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-86b0-15378aa18e62
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-a005-9405f0c73864
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-74f0-4ded46247627
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-970a-f618bc002a4f
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-db09-9a9870bd23b5
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c05a-e6c07991d048
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-def5-7e196f1fdb08
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-fc10-ead91546261c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-061b-8cd6e2fa90c7
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d21b-734d73ada9f4
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-e234-1cb5276dffbe
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-6cd4-1e4683c85942
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-f834-ca68ec59ad26
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-915b-48faeeb67d23
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-8a7a-481664a6aacf
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-2dfb-53ffa3a7f260
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-4205-3cc90bbd60a1
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c605-9cc35e168a85
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-bdac-6c38f3ebb5b3
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-8cbe-29e18aa6a657
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c326-5f07052d4754
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-9aa7-5954e37271c6
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-5304-874b78e27a1f
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-40c0-80308bf73a69
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-75bd-3a706a35bb67
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-7089-d368dbc8eac2
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-6ca0-a1aa5201e53b
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-98a2-673169ea9107
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-bb3e-64c9242ab071
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-2102-81cc1e720e71
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-dca9-a47fa9dcfd38
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-963f-d9d8c3d64128
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-621c-343833db6eaa
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-06c3-4d22a7886ad6
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-3269-ab7cb5605b94
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c835-5414953520e1
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-4f04-545be1a39969
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-9a8c-c35c7658a6c8
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-c17c-c049c39c2622
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-289e-c688be8e78fd
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-b42d-678e9effeff7
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-baee-48d2e3969b69
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-e177-0db2b90a03eb
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d4ca-9849ba0b116a
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-795f-a661fbb7b1c8
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-bc3d-b4b9eb5917e1
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-ec3c-dec725c81a46
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-4af9-0d487a193926
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-bdad-50b5492c4ccd
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-8152-89e09e306ddf
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-eaa2-b60374aa3e58
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-b0d1-ff3764358335
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-480e-a0e138fed360
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-6961-3d725918987b
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-5551-177656fcf2d4
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-976d-13a79bc89fb2
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-a2d8-fe03be358b91
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-fdea-82394363f86c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-05f0-4f91ebb3fe7a
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-2499-c85ee43793f8
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-f332-4621f82498f4
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-9a6c-8a346b3b83de
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-094b-e44553ebac78
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-07d8-9dc3acc9d125
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-9c89-3375787c5d7d
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-2e23-16fb280cbad5
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d019-a282357e87f9
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-25f3-c7166c62c0e1
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-04a7-318901b2ebca
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-ee4c-857b00388fe5
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-5172-9219b3672ea1
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-2057-42bb0171bffd
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-9eee-ba22788fee8c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-8048-8e14bc0d0f22
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-06ac-ae563798a851
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-290d-ad166a5128d8
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-6ea5-66e9ebb08c34
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-4165-e879097730e4
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d304-9af24537e54c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-7e95-ef4c0a00a99f
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-09e5-9256bda3d6a0
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d56a-e3d1313c773a
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-9216-6eb00a7f9579
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-7c80-59962259795a
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-bbc1-fac6f62d0efb
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-344c-535de4190a8c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-0828-0abab062dae5
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-7797-deae52237205
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-a6f2-3fbb61939f34
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-802b-dd1b579fcd4d
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-685b-868da40da091
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-a973-b7a4fcbec3e3
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-ef8e-c300f9ba4ee3
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d107-6ef6eb098b35
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-ff6e-952350b601b3
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-987f-312fb49aa0ca
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-b57b-d1732a26dc88
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-fc7f-17b7e8f44f7c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-bf5c-cb8d3f21813b
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-7a71-1de97ed40c55
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-8bb4-c34d5de6cd12
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-5eb3-021c9c4211f2
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-4ef4-29d2e6e07dc6
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-0482-796310951b5f
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-fd37-ca5781899224
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-6285-6b5d6e23e523
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-88f4-28479b4f7c42
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-827b-ec9657236f7e
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-cdce-1f947f4625e8
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-741d-1b6620e6e3fe
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-8d70-9ed8625760aa
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-3bdb-1a7a1bbd7cf0
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-436f-70a2c3c2c113
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-2756-932a262dab46
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-d9b9-02bad6ce3a18
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-8161-0d9f2a23ffa3
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-de7f-52637056fdcb
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-31ca-503f3b87d598
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-a132-05432dd4c241
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-ecb5-179b89d3b7c6
00020000-5696-157e-253f-bda8ffb515ef	00030000-5696-157c-0068-b78956e92c79
00020000-5696-157e-8916-2ef2c7124df2	00030000-5696-157c-82fd-472093492ad1
00020000-5696-157e-2368-97e35ec9b38f	00030000-5696-157c-8df9-410355b645dd
00020000-5696-157e-c464-25bcf7607371	00030000-5696-157c-fd37-ca5781899224
00020000-5696-157e-9c35-76038dbe278f	00030000-5696-157c-0482-796310951b5f
00020000-5696-157e-87d9-9901debb69c9	00030000-5696-157c-e234-1cb5276dffbe
00020000-5696-157e-0996-33515a3d1598	00030000-5696-157c-6cd4-1e4683c85942
00020000-5696-157e-bb23-dd36e2a80d95	00030000-5696-157c-f834-ca68ec59ad26
00020000-5696-157e-d486-eac4e8a390eb	00030000-5696-157c-d21b-734d73ada9f4
00020000-5696-157e-d043-5b2d2b323a89	00030000-5696-157c-fc10-ead91546261c
00020000-5696-157e-3cb9-330da74f069d	00030000-5696-157c-061b-8cd6e2fa90c7
00020000-5696-157e-3599-6f5a131f5921	00030000-5696-157c-3fbe-cdc89cb02d4c
00020000-5696-157e-805e-525f0e2247bb	00030000-5696-157c-2756-932a262dab46
00020000-5696-157e-6e45-9390d853c812	00030000-5696-157c-26c8-7778dc5fe850
00020000-5696-157e-4ebc-7f3af0313ba9	00030000-5696-157c-0ba0-c2dea8c2274f
00020000-5696-157e-8ad4-8ecd67c80202	00030000-5696-157c-04cd-e32020d55f6d
00020000-5696-157e-69d9-90f42eb4d56d	00030000-5696-157c-4fe0-a16e93b3f420
00020000-5696-157e-9745-ccc22275d972	00030000-5696-157c-5523-2c41155faecd
00020000-5696-157e-d7d8-c74469207ea9	00030000-5696-157c-10cf-f408e706c963
00020000-5696-157e-4ac3-0c7c956b72b0	00030000-5696-157c-11e1-a0e928d600df
00020000-5696-157e-4ac3-0c7c956b72b0	00030000-5696-157c-6ca0-a1aa5201e53b
00020000-5696-157e-4ac3-0c7c956b72b0	00030000-5696-157c-0482-796310951b5f
00020000-5696-157e-3d1e-971bb930bf03	00030000-5696-157c-79cd-14421770e8e3
00020000-5696-157e-d9f0-23ddb3ef1194	00030000-5696-157c-4ef4-29d2e6e07dc6
00020000-5696-157e-f657-eed94bf19009	00030000-5696-157c-a6f2-3fbb61939f34
00020000-5696-157e-6c7e-1da0019353dc	00030000-5696-157c-36f4-d51d53f0dde4
00020000-5696-157e-5772-422c68557087	00030000-5696-157c-685b-868da40da091
00020000-5696-157e-d29c-3866e7262694	00030000-5696-157c-bf49-0a2e9368c160
00020000-5696-157e-6819-963d2e6dc7ab	00030000-5696-157c-06c3-4d22a7886ad6
00020000-5696-157e-d83c-e607c9a07e26	00030000-5696-157c-547a-2bb4bb16f7e0
00020000-5696-157e-6f67-eba032e22036	00030000-5696-157c-d9b9-02bad6ce3a18
00020000-5696-157e-4e86-8d8fe8bda4e2	00030000-5696-157c-238d-527f7ac940e4
00020000-5696-157e-f927-1f1fae01dae6	00030000-5696-157c-7089-d368dbc8eac2
00020000-5696-157e-f527-e214919ccd29	00030000-5696-157c-e068-6bfecd6230fa
00020000-5696-157e-901a-19f654ba511e	00030000-5696-157c-802b-dd1b579fcd4d
00020000-5696-157e-cd10-493f35144d78	00030000-5696-157c-f648-a3f425e9e280
00020000-5696-157e-ae9d-42efb698ab9a	00030000-5696-157c-eb2e-cca3a66824eb
00020000-5696-157e-5322-7269d8800f38	00030000-5696-157c-c68c-29c2ee42d80d
00020000-5696-157e-10bb-b36b7e6262eb	00030000-5696-157c-afe0-f77f6d64660c
00020000-5696-157e-bc74-17d7c659cdd0	00030000-5696-157c-6514-203c5dc564ad
00020000-5696-157e-6956-80602c1ebb7b	00030000-5696-157c-e8f0-f80c3227a757
\.


--
-- TOC entry 3177 (class 0 OID 35810072)
-- Dependencies: 220
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 35810106)
-- Dependencies: 224
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 35810239)
-- Dependencies: 236
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5696-157f-fabc-aaa340aaf676	00090000-5696-157f-3ddd-f9f50e727f7c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5696-157f-e355-ce90f9c2c453	00090000-5696-157f-05f2-5ecadba15225	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5696-157f-c838-328775086383	00090000-5696-157f-52a8-2ba43b7b6f09	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5696-157f-f368-8209966da67c	00090000-5696-157f-6400-688dcce10fbf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3145 (class 0 OID 35809746)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5696-157f-998c-ee0a5bf21f20	\N	00040000-5696-157b-85f2-552c87af0c86	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-157f-3ccc-82c22e75b963	\N	00040000-5696-157b-85f2-552c87af0c86	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5696-157f-2119-8c39b76bdb40	\N	00040000-5696-157b-85f2-552c87af0c86	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-157f-f3f9-9b74f37c8060	\N	00040000-5696-157b-85f2-552c87af0c86	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-157f-dcf2-00d066dba894	\N	00040000-5696-157b-85f2-552c87af0c86	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-157f-3f9e-8d0e9a4d0437	\N	00040000-5696-157b-9761-dcb1db9e1b2b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-157f-46ba-537af5e47153	\N	00040000-5696-157b-1e66-87ffa5c723c0	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-157f-492c-a2d264716188	\N	00040000-5696-157b-fca1-bc94907900fa	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-157f-3ccb-6ae91d23a9bd	\N	00040000-5696-157b-4d4d-b9ef95ca10b8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5696-1580-8a57-e5549a291f42	\N	00040000-5696-157b-85f2-552c87af0c86	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3148 (class 0 OID 35809791)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5696-157b-0008-3166834cbe70	8341	Adlešiči
00050000-5696-157b-52d6-6d4bd990afe6	5270	Ajdovščina
00050000-5696-157b-c92d-02e2e17cbdf8	6280	Ankaran/Ancarano
00050000-5696-157b-4de7-15b3d4d09110	9253	Apače
00050000-5696-157b-2d4a-0ffe30d9beee	8253	Artiče
00050000-5696-157b-c542-199d144af9d6	4275	Begunje na Gorenjskem
00050000-5696-157b-0beb-094367f3fc5a	1382	Begunje pri Cerknici
00050000-5696-157b-08ba-db8e754b66a7	9231	Beltinci
00050000-5696-157b-44f8-2cf2c8efc191	2234	Benedikt
00050000-5696-157b-c65a-33221b344b0f	2345	Bistrica ob Dravi
00050000-5696-157b-e35a-5f6d4346f7dd	3256	Bistrica ob Sotli
00050000-5696-157b-729b-e355d9b509aa	8259	Bizeljsko
00050000-5696-157b-6097-7017a6767c97	1223	Blagovica
00050000-5696-157b-ad57-14c4036efaac	8283	Blanca
00050000-5696-157b-f84d-bd6a42fc1426	4260	Bled
00050000-5696-157b-9cb0-1adcffca2d72	4273	Blejska Dobrava
00050000-5696-157b-7c54-f6966083ba3f	9265	Bodonci
00050000-5696-157b-81f4-76a2623b7af6	9222	Bogojina
00050000-5696-157b-8aa2-adb7d97fc691	4263	Bohinjska Bela
00050000-5696-157b-cd02-119d706c0269	4264	Bohinjska Bistrica
00050000-5696-157b-976d-0bfc5db8bd52	4265	Bohinjsko jezero
00050000-5696-157b-83a7-57f49bac5cc1	1353	Borovnica
00050000-5696-157b-f967-e0d5cb84c9c2	8294	Boštanj
00050000-5696-157b-fafb-d02361a3e5ba	5230	Bovec
00050000-5696-157b-8b15-28b39a619f97	5295	Branik
00050000-5696-157b-3758-a40943e68da0	3314	Braslovče
00050000-5696-157b-1934-680e63b83f12	5223	Breginj
00050000-5696-157b-c7b5-e6e3099c0c98	8280	Brestanica
00050000-5696-157b-fe43-839ac24d2110	2354	Bresternica
00050000-5696-157b-243e-72cf48c12de6	4243	Brezje
00050000-5696-157b-48c4-31476edef6ad	1351	Brezovica pri Ljubljani
00050000-5696-157b-d439-517b03dbf100	8250	Brežice
00050000-5696-157b-05d8-bc134c9e5e9f	4210	Brnik - Aerodrom
00050000-5696-157b-d3f6-99a811a3a574	8321	Brusnice
00050000-5696-157b-ee65-044df9f49143	3255	Buče
00050000-5696-157b-cabe-19a09f56dbee	8276	Bučka 
00050000-5696-157b-36d0-95f57bd2ece5	9261	Cankova
00050000-5696-157b-768a-80ccb3dcf041	3000	Celje 
00050000-5696-157b-e648-7c1eaba3eab1	3001	Celje - poštni predali
00050000-5696-157b-e145-1fd336b88600	4207	Cerklje na Gorenjskem
00050000-5696-157b-7df2-51582db5f633	8263	Cerklje ob Krki
00050000-5696-157b-ec7f-94aa78ea352d	1380	Cerknica
00050000-5696-157b-2f3b-f57194c3e59c	5282	Cerkno
00050000-5696-157b-cbaa-f3d823fea614	2236	Cerkvenjak
00050000-5696-157b-712c-8babe7bddcf5	2215	Ceršak
00050000-5696-157b-058c-cb384185e226	2326	Cirkovce
00050000-5696-157b-606d-f5cb05f4cff1	2282	Cirkulane
00050000-5696-157b-446a-10b465152d04	5273	Col
00050000-5696-157b-e578-59be38f63665	8251	Čatež ob Savi
00050000-5696-157b-c24a-382e4ab48a03	1413	Čemšenik
00050000-5696-157b-491b-dafcee6a0b1a	5253	Čepovan
00050000-5696-157b-c85b-40c68e58a3ee	9232	Črenšovci
00050000-5696-157b-f257-10f80a6510cc	2393	Črna na Koroškem
00050000-5696-157b-4a82-d6ef072772b0	6275	Črni Kal
00050000-5696-157b-2b79-dfade79cfd32	5274	Črni Vrh nad Idrijo
00050000-5696-157b-ea78-a531321c82dd	5262	Črniče
00050000-5696-157b-ac2e-6e93552f497e	8340	Črnomelj
00050000-5696-157b-ea91-4dbd77238e74	6271	Dekani
00050000-5696-157b-1008-edf8661d49a1	5210	Deskle
00050000-5696-157b-1341-f5737344a080	2253	Destrnik
00050000-5696-157b-a825-3ae29491731f	6215	Divača
00050000-5696-157b-18bc-d9a813822089	1233	Dob
00050000-5696-157b-0aba-fd64d6aa65b6	3224	Dobje pri Planini
00050000-5696-157b-35bf-fd001fd7a864	8257	Dobova
00050000-5696-157b-ec41-ddea7344c58b	1423	Dobovec
00050000-5696-157b-c626-b6a46f7dfd8e	5263	Dobravlje
00050000-5696-157b-f683-b8eda22862ba	3204	Dobrna
00050000-5696-157b-258e-48323026b02c	8211	Dobrnič
00050000-5696-157b-bb8d-6cb174653e21	1356	Dobrova
00050000-5696-157b-dcac-173b0298b7a6	9223	Dobrovnik/Dobronak 
00050000-5696-157b-2eab-9831f41b66e7	5212	Dobrovo v Brdih
00050000-5696-157b-3328-168ebf72aa7e	1431	Dol pri Hrastniku
00050000-5696-157b-073f-eb3b6a30e7ef	1262	Dol pri Ljubljani
00050000-5696-157b-dc48-c175cb7ba93a	1273	Dole pri Litiji
00050000-5696-157b-864d-519567e2e733	1331	Dolenja vas
00050000-5696-157b-21ce-1a9fea09ea23	8350	Dolenjske Toplice
00050000-5696-157b-c17f-6f4cbacc48a0	1230	Domžale
00050000-5696-157b-92d6-c97e24d941c8	2252	Dornava
00050000-5696-157b-f7d6-dc3a406b0eaa	5294	Dornberk
00050000-5696-157b-c9a6-3c6ef1a8d5e5	1319	Draga
00050000-5696-157b-3a22-99cb7de154a7	8343	Dragatuš
00050000-5696-157b-0100-4627935f2b11	3222	Dramlje
00050000-5696-157b-ebc7-2fee06bc9864	2370	Dravograd
00050000-5696-157b-76e4-9e93729b60ad	4203	Duplje
00050000-5696-157b-bf30-2116d94713cb	6221	Dutovlje
00050000-5696-157b-4fe6-6c18db3f83fe	8361	Dvor
00050000-5696-157b-d9b8-286304739bd3	2343	Fala
00050000-5696-157b-21c7-ac47a7551169	9208	Fokovci
00050000-5696-157b-a08f-d48d7bacffb7	2313	Fram
00050000-5696-157b-bf2b-1a245da997f5	3213	Frankolovo
00050000-5696-157b-8cbe-7063d7451372	1274	Gabrovka
00050000-5696-157b-69b6-13b9e48e34bb	8254	Globoko
00050000-5696-157b-6d36-a9b20a0f9992	5275	Godovič
00050000-5696-157b-c950-e51a86f8e613	4204	Golnik
00050000-5696-157b-05f5-c7fe00573c7e	3303	Gomilsko
00050000-5696-157b-a7ec-b4e40d5eead6	4224	Gorenja vas
00050000-5696-157b-2a79-9aa772e9c413	3263	Gorica pri Slivnici
00050000-5696-157b-7781-21c78a4d65ff	2272	Gorišnica
00050000-5696-157b-a877-f10cefff7623	9250	Gornja Radgona
00050000-5696-157b-444d-de146ddaa2ec	3342	Gornji Grad
00050000-5696-157b-b56c-f6c860d0303a	4282	Gozd Martuljek
00050000-5696-157b-f14b-9042a2ef27dd	6272	Gračišče
00050000-5696-157b-b7fa-04f2157cae05	9264	Grad
00050000-5696-157b-0d4b-d2afcf14f4ef	8332	Gradac
00050000-5696-157b-c406-a6653fdac711	1384	Grahovo
00050000-5696-157b-e30f-7a523b18b310	5242	Grahovo ob Bači
00050000-5696-157b-0e49-f5ea0e3a92f3	5251	Grgar
00050000-5696-157b-1c7b-6e800687339e	3302	Griže
00050000-5696-157b-183b-cd5ca37efdb8	3231	Grobelno
00050000-5696-157b-4c2a-0c109e676f73	1290	Grosuplje
00050000-5696-157b-5299-d2fd5a731881	2288	Hajdina
00050000-5696-157b-3a55-93bd8f75eb6d	8362	Hinje
00050000-5696-157b-7be9-08f96d13de99	2311	Hoče
00050000-5696-157b-3556-27cfb540f273	9205	Hodoš/Hodos
00050000-5696-157b-fd7c-b9f19bd2eed0	1354	Horjul
00050000-5696-157b-05db-c023cf62fc47	1372	Hotedršica
00050000-5696-157b-cafc-d282b401ecce	1430	Hrastnik
00050000-5696-157b-e8dc-2ad446093435	6225	Hruševje
00050000-5696-157b-8195-1c92dc0f7ac0	4276	Hrušica
00050000-5696-157b-f6df-fa103f2fb90b	5280	Idrija
00050000-5696-157b-6ec8-10b393a62d15	1292	Ig
00050000-5696-157b-e637-c8bf481cb76f	6250	Ilirska Bistrica
00050000-5696-157b-8ab1-4a073db43192	6251	Ilirska Bistrica-Trnovo
00050000-5696-157b-e62e-8a5c53a16e45	1295	Ivančna Gorica
00050000-5696-157b-df8b-1cef520b456c	2259	Ivanjkovci
00050000-5696-157b-fbed-9d09d3fed4f9	1411	Izlake
00050000-5696-157b-30f1-c5f71604ce35	6310	Izola/Isola
00050000-5696-157b-c218-938398f88426	2222	Jakobski Dol
00050000-5696-157b-f508-32e4da432eb2	2221	Jarenina
00050000-5696-157b-daf3-bc2a4ea41289	6254	Jelšane
00050000-5696-157b-646a-635e8937a72e	4270	Jesenice
00050000-5696-157b-48c5-6ea674387d17	8261	Jesenice na Dolenjskem
00050000-5696-157b-d58b-aaeb09c10dcd	3273	Jurklošter
00050000-5696-157b-9d32-99e093aa7c43	2223	Jurovski Dol
00050000-5696-157b-efe8-838d28d4be9b	2256	Juršinci
00050000-5696-157b-f9fc-e7d867d975cd	5214	Kal nad Kanalom
00050000-5696-157b-77ab-7d874e5aaf65	3233	Kalobje
00050000-5696-157b-12a3-e36f2d74236b	4246	Kamna Gorica
00050000-5696-157b-8b8b-3673578b22f1	2351	Kamnica
00050000-5696-157b-b95e-306b3f18667f	1241	Kamnik
00050000-5696-157b-e9ad-0c26884afd22	5213	Kanal
00050000-5696-157b-cfa0-f26a65f05daa	8258	Kapele
00050000-5696-157b-eb3e-fceac192c0dd	2362	Kapla
00050000-5696-157b-5adb-4668365e6476	2325	Kidričevo
00050000-5696-157b-3ef7-0bee9f5ae345	1412	Kisovec
00050000-5696-157b-21d1-286df1cbb7a2	6253	Knežak
00050000-5696-157b-c40d-203ad90cba1e	5222	Kobarid
00050000-5696-157b-d777-a5291b0addca	9227	Kobilje
00050000-5696-157b-020d-f289aee52473	1330	Kočevje
00050000-5696-157b-c849-cf357d1f2b5d	1338	Kočevska Reka
00050000-5696-157b-0df5-4d93ca03c62e	2276	Kog
00050000-5696-157b-e55f-b5dac1cd465f	5211	Kojsko
00050000-5696-157b-c27e-8237c6495293	6223	Komen
00050000-5696-157b-5bff-9779ed181bac	1218	Komenda
00050000-5696-157b-0897-1478c62ecabd	6000	Koper/Capodistria 
00050000-5696-157b-dfcd-e5766ff166fe	6001	Koper/Capodistria - poštni predali
00050000-5696-157b-b456-4c1e9e7f0c96	8282	Koprivnica
00050000-5696-157b-4d8a-08cab58d9dd0	5296	Kostanjevica na Krasu
00050000-5696-157b-c4d7-2f72203dba9a	8311	Kostanjevica na Krki
00050000-5696-157b-8c01-6796a8e4653a	1336	Kostel
00050000-5696-157b-6207-215d7c4b56b4	6256	Košana
00050000-5696-157b-be35-a4b39030e29e	2394	Kotlje
00050000-5696-157b-3058-b7967302dfa3	6240	Kozina
00050000-5696-157b-695a-0ec6c97f9904	3260	Kozje
00050000-5696-157b-9d63-c1109694bb06	4000	Kranj 
00050000-5696-157b-267e-8c7c55061aae	4001	Kranj - poštni predali
00050000-5696-157b-777e-1919a5a212f4	4280	Kranjska Gora
00050000-5696-157b-e422-d946a0497b53	1281	Kresnice
00050000-5696-157b-f77e-d289c7422d6b	4294	Križe
00050000-5696-157b-b009-f0807d3e1be2	9206	Križevci
00050000-5696-157b-ed05-285dbfa2eb4e	9242	Križevci pri Ljutomeru
00050000-5696-157b-b297-71f774c9ac99	1301	Krka
00050000-5696-157b-124f-cb2afdd3dd8c	8296	Krmelj
00050000-5696-157b-e3b8-b48f4b32934f	4245	Kropa
00050000-5696-157b-b10a-9b7665df3b59	8262	Krška vas
00050000-5696-157b-f01f-2b3aeed8fc29	8270	Krško
00050000-5696-157b-cfa5-98981c1e51f2	9263	Kuzma
00050000-5696-157b-5a49-b3202d9935e6	2318	Laporje
00050000-5696-157b-fb8b-4171beb65dd2	3270	Laško
00050000-5696-157b-ea4f-d2521ced058b	1219	Laze v Tuhinju
00050000-5696-157b-a517-d7c53171c6cb	2230	Lenart v Slovenskih goricah
00050000-5696-157b-3cae-58945b03e99e	9220	Lendava/Lendva
00050000-5696-157b-5907-207ca07f7958	4248	Lesce
00050000-5696-157b-ed0a-b7c66f6a06c8	3261	Lesično
00050000-5696-157b-14ae-69841e0780a9	8273	Leskovec pri Krškem
00050000-5696-157b-6e80-3b129303c5a7	2372	Libeliče
00050000-5696-157b-2667-6275a920efab	2341	Limbuš
00050000-5696-157b-6e09-b8dc44f5dfaf	1270	Litija
00050000-5696-157b-228c-4c93ae4f91e4	3202	Ljubečna
00050000-5696-157b-5190-b348d46ab62c	1000	Ljubljana 
00050000-5696-157b-700f-0919aad7ac92	1001	Ljubljana - poštni predali
00050000-5696-157b-7c26-ebeef9c13e6e	1231	Ljubljana - Črnuče
00050000-5696-157b-325b-2740ae1e34e5	1261	Ljubljana - Dobrunje
00050000-5696-157b-086c-9566529b0a27	1260	Ljubljana - Polje
00050000-5696-157b-4914-0b0139fc62c5	1210	Ljubljana - Šentvid
00050000-5696-157b-331c-ba932bc542b4	1211	Ljubljana - Šmartno
00050000-5696-157b-c88b-5f2d4157aca8	3333	Ljubno ob Savinji
00050000-5696-157b-9986-fe3db1c2e63b	9240	Ljutomer
00050000-5696-157b-e4d1-f4c46e553c14	3215	Loče
00050000-5696-157b-1124-63796fb89f7c	5231	Log pod Mangartom
00050000-5696-157b-e6da-3cd541678b43	1358	Log pri Brezovici
00050000-5696-157b-a712-8ad91905e63a	1370	Logatec
00050000-5696-157b-bde5-a7ca2d4325ce	1371	Logatec
00050000-5696-157b-1b52-461fc3c6a0b1	1434	Loka pri Zidanem Mostu
00050000-5696-157b-1eb2-6493c80be29f	3223	Loka pri Žusmu
00050000-5696-157b-3a55-6428daeb4fc5	6219	Lokev
00050000-5696-157b-b77b-e92a7de1008c	1318	Loški Potok
00050000-5696-157b-fc4d-e128770cf381	2324	Lovrenc na Dravskem polju
00050000-5696-157b-bf17-3cca1e5cfe08	2344	Lovrenc na Pohorju
00050000-5696-157b-d3b6-9af8a18ef5d2	3334	Luče
00050000-5696-157b-3c7f-c1986df0e05b	1225	Lukovica
00050000-5696-157b-6206-4a62c7ee8020	9202	Mačkovci
00050000-5696-157b-0641-89e50cf8696f	2322	Majšperk
00050000-5696-157b-81d2-bc8aff0b9a38	2321	Makole
00050000-5696-157b-3050-3dda21f7fdd1	9243	Mala Nedelja
00050000-5696-157b-c759-fa2882ffb4bb	2229	Malečnik
00050000-5696-157b-1f44-2f311a1dedbe	6273	Marezige
00050000-5696-157b-1568-5f27bbc34c31	2000	Maribor 
00050000-5696-157b-56c7-e3f66f426172	2001	Maribor - poštni predali
00050000-5696-157b-1abb-514f6391228f	2206	Marjeta na Dravskem polju
00050000-5696-157b-0aaa-c30a9c46eb9a	2281	Markovci
00050000-5696-157b-0926-11162a97bbf0	9221	Martjanci
00050000-5696-157b-834f-1e873d2ae0e3	6242	Materija
00050000-5696-157b-ce28-f36fa4d97483	4211	Mavčiče
00050000-5696-157b-2c25-dc5f8f0caf7c	1215	Medvode
00050000-5696-157b-5612-1c11ff4c7f35	1234	Mengeš
00050000-5696-157b-efb3-9a954a15fbf7	8330	Metlika
00050000-5696-157b-8308-a0db71a15b15	2392	Mežica
00050000-5696-157b-1227-a24e7166ced2	2204	Miklavž na Dravskem polju
00050000-5696-157b-12d3-f71e04ff8993	2275	Miklavž pri Ormožu
00050000-5696-157b-0d38-2fc65f101cf2	5291	Miren
00050000-5696-157b-68c7-0619b025fd41	8233	Mirna
00050000-5696-157b-e3a0-d46fe5947c6e	8216	Mirna Peč
00050000-5696-157b-6598-52fee58f4d9b	2382	Mislinja
00050000-5696-157b-7b39-78038e518382	4281	Mojstrana
00050000-5696-157b-f259-cfebce8b2c96	8230	Mokronog
00050000-5696-157b-fb01-30e20758e9e8	1251	Moravče
00050000-5696-157b-51f3-038453243eb4	9226	Moravske Toplice
00050000-5696-157b-b1c4-9f93db63281f	5216	Most na Soči
00050000-5696-157b-0ea9-dfefc0cba1a5	1221	Motnik
00050000-5696-157b-202f-5111d84588c2	3330	Mozirje
00050000-5696-157b-c773-6081cfb6fa05	9000	Murska Sobota 
00050000-5696-157b-b5b0-d9cc0437009c	9001	Murska Sobota - poštni predali
00050000-5696-157b-762b-e42accba1022	2366	Muta
00050000-5696-157b-a3ee-29a4675c18ad	4202	Naklo
00050000-5696-157b-9291-96808e640854	3331	Nazarje
00050000-5696-157b-a6aa-42bd8cbc9845	1357	Notranje Gorice
00050000-5696-157b-e5fd-d3f385ff293c	3203	Nova Cerkev
00050000-5696-157b-a7aa-8a5448e88767	5000	Nova Gorica 
00050000-5696-157b-0255-1a27a3863bec	5001	Nova Gorica - poštni predali
00050000-5696-157b-8720-25ee94a4078c	1385	Nova vas
00050000-5696-157b-d42f-4df65c9050c3	8000	Novo mesto
00050000-5696-157b-c10d-452da374d1ff	8001	Novo mesto - poštni predali
00050000-5696-157b-5103-c7a64a5c973f	6243	Obrov
00050000-5696-157b-8b5a-e9e939feb4fa	9233	Odranci
00050000-5696-157b-9e72-72bf2059a27c	2317	Oplotnica
00050000-5696-157b-88cb-2ce2735dfed4	2312	Orehova vas
00050000-5696-157b-500b-e1b5a44e71bb	2270	Ormož
00050000-5696-157b-3733-77776ab25143	1316	Ortnek
00050000-5696-157b-54ce-9b86a6cfa303	1337	Osilnica
00050000-5696-157b-7034-b7b22aeeb317	8222	Otočec
00050000-5696-157b-439f-d02b3f2c8d38	2361	Ožbalt
00050000-5696-157b-598d-0e81a3985339	2231	Pernica
00050000-5696-157b-1b86-4ded7cccfebe	2211	Pesnica pri Mariboru
00050000-5696-157b-0c45-79e506cdc357	9203	Petrovci
00050000-5696-157b-c5dd-559822d671bc	3301	Petrovče
00050000-5696-157b-d49d-a6b70bf4fe35	6330	Piran/Pirano
00050000-5696-157b-bbd1-41dbf0f2ef08	8255	Pišece
00050000-5696-157b-9dc3-ef78b45d0ea8	6257	Pivka
00050000-5696-157b-d752-80eba8487f60	6232	Planina
00050000-5696-157b-1696-bb05d9145b5b	3225	Planina pri Sevnici
00050000-5696-157b-3bdb-547eb1296f26	6276	Pobegi
00050000-5696-157b-8ad2-bf60a022e93b	8312	Podbočje
00050000-5696-157b-461f-72e9d487f2cf	5243	Podbrdo
00050000-5696-157b-9a1b-312136986ce6	3254	Podčetrtek
00050000-5696-157b-61e1-d1f009a8d409	2273	Podgorci
00050000-5696-157b-7e04-1c993aebf524	6216	Podgorje
00050000-5696-157b-6396-24db54686684	2381	Podgorje pri Slovenj Gradcu
00050000-5696-157b-38bf-1033c5e41a1c	6244	Podgrad
00050000-5696-157b-0693-66e4d1842171	1414	Podkum
00050000-5696-157b-38f5-df2231bb9d6d	2286	Podlehnik
00050000-5696-157b-fa66-322dab6cf6fb	5272	Podnanos
00050000-5696-157b-8dae-197556a757f7	4244	Podnart
00050000-5696-157b-10bf-609882d380d5	3241	Podplat
00050000-5696-157b-8fe6-dd9fb4c9d7db	3257	Podsreda
00050000-5696-157b-1e87-225cfaf3b81f	2363	Podvelka
00050000-5696-157b-6ae0-189078875e06	2208	Pohorje
00050000-5696-157b-9e26-b9f2068cd7c6	2257	Polenšak
00050000-5696-157b-9e1c-3a27559824e4	1355	Polhov Gradec
00050000-5696-157b-40d4-ca4441e02ca1	4223	Poljane nad Škofjo Loko
00050000-5696-157b-5d8b-3d3e38acfd4c	2319	Poljčane
00050000-5696-157b-2e9a-31789dc5dc26	1272	Polšnik
00050000-5696-157b-686f-3bf6d0a8ccdc	3313	Polzela
00050000-5696-157b-fb53-bb8bc1c44b38	3232	Ponikva
00050000-5696-157b-37bf-00dbd78d5739	6320	Portorož/Portorose
00050000-5696-157b-efa3-ce614eba6e6d	6230	Postojna
00050000-5696-157b-5bbd-8c0bdeb15fd5	2331	Pragersko
00050000-5696-157b-e006-a1d5b6bdda4d	3312	Prebold
00050000-5696-157b-c0cb-f15e9501bffa	4205	Preddvor
00050000-5696-157b-cd97-621efe04bc40	6255	Prem
00050000-5696-157b-fa55-4f9d9c7e59a6	1352	Preserje
00050000-5696-157b-1bd2-fbf2e4a7bb21	6258	Prestranek
00050000-5696-157b-255b-2a3496883944	2391	Prevalje
00050000-5696-157b-26b2-28e844391229	3262	Prevorje
00050000-5696-157b-f885-0bcf3003777f	1276	Primskovo 
00050000-5696-157b-121e-4c02a14a6f1c	3253	Pristava pri Mestinju
00050000-5696-157b-c8a7-9d9d7955a8d1	9207	Prosenjakovci/Partosfalva
00050000-5696-157b-75de-4f4f83eb4823	5297	Prvačina
00050000-5696-157b-2755-532e0b573469	2250	Ptuj
00050000-5696-157b-64b7-43cebf7fdb44	2323	Ptujska Gora
00050000-5696-157b-249a-fc8195197e80	9201	Puconci
00050000-5696-157b-0340-c14d2d261032	2327	Rače
00050000-5696-157b-3c36-97795f1cbb9f	1433	Radeče
00050000-5696-157b-21ce-1d4f517a69bc	9252	Radenci
00050000-5696-157b-ed49-3fbe7e6abfd1	2360	Radlje ob Dravi
00050000-5696-157b-7aac-aaa777c3e507	1235	Radomlje
00050000-5696-157b-2629-e8621eb3e1d5	4240	Radovljica
00050000-5696-157b-8189-ceb9dd3b3e69	8274	Raka
00050000-5696-157b-bc72-7cb7df7411ef	1381	Rakek
00050000-5696-157b-6937-b761d0342873	4283	Rateče - Planica
00050000-5696-157b-2f8a-d04b739457dd	2390	Ravne na Koroškem
00050000-5696-157b-eb77-397d07fe113c	9246	Razkrižje
00050000-5696-157b-4f36-983d2dd6c7d0	3332	Rečica ob Savinji
00050000-5696-157b-32a7-d8007357c360	5292	Renče
00050000-5696-157b-b5f9-ce1b83fb8b6d	1310	Ribnica
00050000-5696-157b-ac78-0e477c6e6f30	2364	Ribnica na Pohorju
00050000-5696-157b-58bb-30b4a07a00b8	3272	Rimske Toplice
00050000-5696-157b-5abd-b5b7b1473bca	1314	Rob
00050000-5696-157b-9349-2965b734170b	5215	Ročinj
00050000-5696-157b-2ef9-35019f899f6d	3250	Rogaška Slatina
00050000-5696-157b-960c-a00aadb6c11b	9262	Rogašovci
00050000-5696-157b-770c-49187f3a0f6e	3252	Rogatec
00050000-5696-157b-867b-db5248564a96	1373	Rovte
00050000-5696-157b-e55c-9cbc56af4616	2342	Ruše
00050000-5696-157b-d3d3-b781a85597b4	1282	Sava
00050000-5696-157b-bd46-7a44b85e3c7e	6333	Sečovlje/Sicciole
00050000-5696-157b-9498-64278a784f25	4227	Selca
00050000-5696-157b-87d4-00a5b4b282f2	2352	Selnica ob Dravi
00050000-5696-157b-587a-d90d0b27645a	8333	Semič
00050000-5696-157b-249e-3e7678a086a0	8281	Senovo
00050000-5696-157b-d2a5-0de0cf68a0ef	6224	Senožeče
00050000-5696-157b-35ef-d21861a84f6c	8290	Sevnica
00050000-5696-157b-7b82-261b8013cd0f	6210	Sežana
00050000-5696-157b-9d4d-159c274c24ee	2214	Sladki Vrh
00050000-5696-157b-3169-46c07752bb80	5283	Slap ob Idrijci
00050000-5696-157b-e685-e742c598dbbe	2380	Slovenj Gradec
00050000-5696-157b-4d16-75190c8b027e	2310	Slovenska Bistrica
00050000-5696-157b-50cf-5ad1969fef04	3210	Slovenske Konjice
00050000-5696-157b-80d6-6e619f501030	1216	Smlednik
00050000-5696-157b-a874-c9aa1e3feea8	5232	Soča
00050000-5696-157b-62e8-b816fe1c038a	1317	Sodražica
00050000-5696-157b-1f2d-8e3618ac9e5c	3335	Solčava
00050000-5696-157b-6ddb-29292b7b79cf	5250	Solkan
00050000-5696-157b-48a3-275454347685	4229	Sorica
00050000-5696-157b-3254-abfb782deee1	4225	Sovodenj
00050000-5696-157b-2038-8a7a8b1e5e20	5281	Spodnja Idrija
00050000-5696-157b-6405-bbc4a16bbef4	2241	Spodnji Duplek
00050000-5696-157b-189b-42bf16bca3cd	9245	Spodnji Ivanjci
00050000-5696-157b-7869-01985ece000f	2277	Središče ob Dravi
00050000-5696-157b-2bf7-8d28c7709793	4267	Srednja vas v Bohinju
00050000-5696-157b-e6f8-61aa286445ef	8256	Sromlje 
00050000-5696-157b-dca1-63238b7c9462	5224	Srpenica
00050000-5696-157b-bf92-3dba1f8d631a	1242	Stahovica
00050000-5696-157b-43e6-5837ee24df91	1332	Stara Cerkev
00050000-5696-157b-c167-ca7c538f6100	8342	Stari trg ob Kolpi
00050000-5696-157b-05aa-99a6a11768fb	1386	Stari trg pri Ložu
00050000-5696-157b-b388-2f30c51b3d67	2205	Starše
00050000-5696-157b-dac6-607bb21021ac	2289	Stoperce
00050000-5696-157b-aa19-faa7ee86a5d7	8322	Stopiče
00050000-5696-157b-e465-1e89c9c1ba93	3206	Stranice
00050000-5696-157b-7e1d-8549cfd15203	8351	Straža
00050000-5696-157b-27ff-2a74cb3ddf71	1313	Struge
00050000-5696-157b-8872-e37919344330	8293	Studenec
00050000-5696-157b-0d96-fb66baa9af70	8331	Suhor
00050000-5696-157b-6bce-05cd2ddc743e	2233	Sv. Ana v Slovenskih goricah
00050000-5696-157b-1b01-7d0379deab44	2235	Sv. Trojica v Slovenskih goricah
00050000-5696-157b-d6ae-bf46205887c1	2353	Sveti Duh na Ostrem Vrhu
00050000-5696-157b-5084-f6bb487f542d	9244	Sveti Jurij ob Ščavnici
00050000-5696-157b-9985-eb722c7dafed	3264	Sveti Štefan
00050000-5696-157b-ab90-c345d91bfbfc	2258	Sveti Tomaž
00050000-5696-157b-8f4a-18ee314bb371	9204	Šalovci
00050000-5696-157b-851f-03a1dcdd8188	5261	Šempas
00050000-5696-157b-04ab-fed2ce99c93a	5290	Šempeter pri Gorici
00050000-5696-157b-f74b-e528765eeef2	3311	Šempeter v Savinjski dolini
00050000-5696-157b-e4f6-a0ff0cb0bc6c	4208	Šenčur
00050000-5696-157b-fd33-ea37ac940ee2	2212	Šentilj v Slovenskih goricah
00050000-5696-157b-4ecf-853bf7cfe303	8297	Šentjanž
00050000-5696-157b-daa0-63db644ae155	2373	Šentjanž pri Dravogradu
00050000-5696-157b-585a-a5b1c7ab82be	8310	Šentjernej
00050000-5696-157b-17a9-12a3b54994ee	3230	Šentjur
00050000-5696-157b-c3fa-5cfb85be2263	3271	Šentrupert
00050000-5696-157b-365f-c7200ee8d312	8232	Šentrupert
00050000-5696-157b-837b-abfc4f07c66c	1296	Šentvid pri Stični
00050000-5696-157b-5b9e-044d1e06f1e8	8275	Škocjan
00050000-5696-157b-7512-d49d37c030cf	6281	Škofije
00050000-5696-157b-7e7d-6d341529d3f3	4220	Škofja Loka
00050000-5696-157b-f009-2be5eeec254d	3211	Škofja vas
00050000-5696-157b-fe25-0ae3fbeac331	1291	Škofljica
00050000-5696-157b-8cb6-d31e8e382264	6274	Šmarje
00050000-5696-157b-7f0f-db1a7b1fc4ad	1293	Šmarje - Sap
00050000-5696-157b-f9bd-31072c3341ee	3240	Šmarje pri Jelšah
00050000-5696-157b-0381-3a9d93a3e0ad	8220	Šmarješke Toplice
00050000-5696-157b-911d-c00d283086be	2315	Šmartno na Pohorju
00050000-5696-157b-aec1-bb5790eca452	3341	Šmartno ob Dreti
00050000-5696-157b-4a6a-9618a1c17460	3327	Šmartno ob Paki
00050000-5696-157b-f79e-b763af8ad6ac	1275	Šmartno pri Litiji
00050000-5696-157b-65e9-c418ff2a13a2	2383	Šmartno pri Slovenj Gradcu
00050000-5696-157b-b7a5-0e4ee16b63fd	3201	Šmartno v Rožni dolini
00050000-5696-157b-8410-9c827740bbbf	3325	Šoštanj
00050000-5696-157b-11c8-252c63dfb68c	6222	Štanjel
00050000-5696-157b-f212-2b09d2472d41	3220	Štore
00050000-5696-157b-28f5-38bfec272567	3304	Tabor
00050000-5696-157b-771a-8610dfcc6bae	3221	Teharje
00050000-5696-157b-352e-dff55861208e	9251	Tišina
00050000-5696-157b-4810-0688328a71e6	5220	Tolmin
00050000-5696-157b-ecbe-d3c95e8303f5	3326	Topolšica
00050000-5696-157b-cd48-6bc44088bff4	2371	Trbonje
00050000-5696-157b-3161-8c2527513cf6	1420	Trbovlje
00050000-5696-157b-e895-7c0bb41a78b9	8231	Trebelno 
00050000-5696-157b-93e3-46d61d4de81b	8210	Trebnje
00050000-5696-157b-8cc0-6923515ae334	5252	Trnovo pri Gorici
00050000-5696-157b-dfd4-c8f958ce4fd6	2254	Trnovska vas
00050000-5696-157b-ef9c-e7c3aa9728f0	1222	Trojane
00050000-5696-157b-e87e-644154605153	1236	Trzin
00050000-5696-157b-0761-d7df2ac4dcc5	4290	Tržič
00050000-5696-157b-4a3a-f9f054f2b602	8295	Tržišče
00050000-5696-157b-5066-498c7bfb2b83	1311	Turjak
00050000-5696-157b-72f9-4825df230b1f	9224	Turnišče
00050000-5696-157b-70ab-671c824ad520	8323	Uršna sela
00050000-5696-157b-e6e5-2c43e91e0653	1252	Vače
00050000-5696-157b-702b-b3a36942e356	3320	Velenje 
00050000-5696-157b-9964-9327e2fe0c52	3322	Velenje - poštni predali
00050000-5696-157b-6125-3d8cf594c9fe	8212	Velika Loka
00050000-5696-157b-d2f2-92b157bd4eb7	2274	Velika Nedelja
00050000-5696-157b-efdc-5c9bf19ba7e7	9225	Velika Polana
00050000-5696-157b-7413-e74ecb35ccb3	1315	Velike Lašče
00050000-5696-157b-ccb0-633e7572309e	8213	Veliki Gaber
00050000-5696-157b-9e60-554ae380c42d	9241	Veržej
00050000-5696-157b-c411-48c19cf2ae80	1312	Videm - Dobrepolje
00050000-5696-157b-52b2-4501ab8117e9	2284	Videm pri Ptuju
00050000-5696-157b-e949-aebf3996ad5a	8344	Vinica
00050000-5696-157b-d0c8-ac2cf4d63b10	5271	Vipava
00050000-5696-157b-fc07-92f54f5d6828	4212	Visoko
00050000-5696-157b-2104-2122a81a6a42	1294	Višnja Gora
00050000-5696-157b-09fe-05b61546afb0	3205	Vitanje
00050000-5696-157b-52e1-33c258f4cfd9	2255	Vitomarci
00050000-5696-157b-12bc-c7f907cc3ea1	1217	Vodice
00050000-5696-157b-daad-cbbb8cd1a945	3212	Vojnik\t
00050000-5696-157b-5f1d-33e16633b7cf	5293	Volčja Draga
00050000-5696-157b-bde8-6aa0f31e7be5	2232	Voličina
00050000-5696-157b-bb55-b7462164e1b0	3305	Vransko
00050000-5696-157b-126e-d70008a5f292	6217	Vremski Britof
00050000-5696-157b-d43f-2404d57514bc	1360	Vrhnika
00050000-5696-157b-51c0-2b9bd6dd174f	2365	Vuhred
00050000-5696-157b-0d03-5a700859ac6c	2367	Vuzenica
00050000-5696-157b-c55f-d6eb224ada2b	8292	Zabukovje 
00050000-5696-157b-1790-8ad89db10189	1410	Zagorje ob Savi
00050000-5696-157b-a3bd-753999dfa334	1303	Zagradec
00050000-5696-157b-b294-9508024bb456	2283	Zavrč
00050000-5696-157b-d572-066f4d951503	8272	Zdole 
00050000-5696-157b-7d11-cc105a927180	4201	Zgornja Besnica
00050000-5696-157b-b8d3-918d53f36d8b	2242	Zgornja Korena
00050000-5696-157b-c729-dac61457fd53	2201	Zgornja Kungota
00050000-5696-157b-3d9f-cbe908d8bad5	2316	Zgornja Ložnica
00050000-5696-157b-db19-742055769878	2314	Zgornja Polskava
00050000-5696-157b-087e-7b94340ca80f	2213	Zgornja Velka
00050000-5696-157b-da36-61743472444d	4247	Zgornje Gorje
00050000-5696-157b-6db3-0f882955d504	4206	Zgornje Jezersko
00050000-5696-157b-1637-69e8a55624ca	2285	Zgornji Leskovec
00050000-5696-157b-1174-d4fe3246978a	1432	Zidani Most
00050000-5696-157b-145a-bb0e872c55a0	3214	Zreče
00050000-5696-157b-d74f-4b03d895291a	4209	Žabnica
00050000-5696-157b-999e-a7a07883a6c9	3310	Žalec
00050000-5696-157b-2a07-e3229cd49032	4228	Železniki
00050000-5696-157b-8ed0-978a27c26d37	2287	Žetale
00050000-5696-157b-d661-bff80d126cb6	4226	Žiri
00050000-5696-157b-ebc4-dfd5f17a6cbe	4274	Žirovnica
00050000-5696-157b-3fec-44e02f495c11	8360	Žužemberk
\.


--
-- TOC entry 3200 (class 0 OID 35810477)
-- Dependencies: 243
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 35810046)
-- Dependencies: 216
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 35809776)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5696-157f-320a-c3f337f4a4b1	00080000-5696-157f-998c-ee0a5bf21f20	\N	00040000-5696-157b-85f2-552c87af0c86	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5696-157f-73e7-a906c2f49f0d	00080000-5696-157f-998c-ee0a5bf21f20	\N	00040000-5696-157b-85f2-552c87af0c86	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5696-157f-e98e-b4e936ab1a58	00080000-5696-157f-3ccc-82c22e75b963	\N	00040000-5696-157b-85f2-552c87af0c86	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3159 (class 0 OID 35809914)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5696-157c-4346-444ed2fbf171	novo leto	1	1	\N	t
00430000-5696-157c-deab-47f05069a9cb	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5696-157c-039e-1e4d43f42098	dan upora proti okupatorju	27	4	\N	t
00430000-5696-157c-9e4a-ee2222575bff	praznik dela	1	5	\N	t
00430000-5696-157c-6df0-21cf7596b7da	praznik dela	2	5	\N	t
00430000-5696-157c-50fa-cc187d0559a7	dan Primoža Trubarja	8	6	\N	f
00430000-5696-157c-c334-6dc3a2ef687b	dan državnosti	25	6	\N	t
00430000-5696-157c-f971-932587707b0c	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5696-157c-6580-58087064613b	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5696-157c-0ec8-614dc44594f0	dan suverenosti	25	10	\N	f
00430000-5696-157c-aa9f-7e282c0923cb	dan spomina na mrtve	1	11	\N	t
00430000-5696-157c-60b4-09002e8354d6	dan Rudolfa Maistra	23	11	\N	f
00430000-5696-157c-32a3-234465b4b956	božič	25	12	\N	t
00430000-5696-157c-32d4-d3283501193a	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5696-157c-4a3f-ff1c93c2aae6	Marijino vnebovzetje	15	8	\N	t
00430000-5696-157c-6d52-9ccdb5385ed2	dan reformacije	31	10	\N	t
00430000-5696-157c-968b-d337b0255f9f	velikonočna nedelja	27	3	2016	t
00430000-5696-157c-9f90-0947a74a883b	velikonočna nedelja	16	4	2017	t
00430000-5696-157c-4fa7-3981374dfe05	velikonočna nedelja	1	4	2018	t
00430000-5696-157c-9080-3e0c247c7286	velikonočna nedelja	21	4	2019	t
00430000-5696-157c-95ed-8c400fb637a2	velikonočna nedelja	12	4	2020	t
00430000-5696-157c-cd8a-7d731f558c38	velikonočna nedelja	4	4	2021	t
00430000-5696-157c-3771-04561befc91d	velikonočna nedelja	17	4	2022	t
00430000-5696-157c-c212-62102939e3f3	velikonočna nedelja	9	4	2023	t
00430000-5696-157c-ddb3-c4cc2292f768	velikonočna nedelja	31	3	2024	t
00430000-5696-157c-cf84-4c445858307f	velikonočna nedelja	20	4	2025	t
00430000-5696-157c-94bd-0c21c7e53b07	velikonočna nedelja	5	4	2026	t
00430000-5696-157c-d4a4-6853cabf0801	velikonočna nedelja	28	3	2027	t
00430000-5696-157c-6e0d-f44807031caa	velikonočna nedelja	16	4	2028	t
00430000-5696-157c-ccd9-c9291842399a	velikonočna nedelja	1	4	2029	t
00430000-5696-157c-e201-31c6caea3ba4	velikonočna nedelja	21	4	2030	t
00430000-5696-157c-de58-f60983aa92b9	velikonočni ponedeljek	28	3	2016	t
00430000-5696-157c-ed3e-b4a03ed693c6	velikonočni ponedeljek	17	4	2017	t
00430000-5696-157c-026a-b6106089132e	velikonočni ponedeljek	2	4	2018	t
00430000-5696-157c-b4ae-a50baa6ca6bb	velikonočni ponedeljek	22	4	2019	t
00430000-5696-157c-c497-7f64709ec525	velikonočni ponedeljek	13	4	2020	t
00430000-5696-157c-bd4e-ce8b4a0a5c4d	velikonočni ponedeljek	5	4	2021	t
00430000-5696-157c-34e5-64f1d8ae0824	velikonočni ponedeljek	18	4	2022	t
00430000-5696-157c-c6fa-fdc86ca8f54a	velikonočni ponedeljek	10	4	2023	t
00430000-5696-157c-366d-817f7d301ba8	velikonočni ponedeljek	1	4	2024	t
00430000-5696-157c-264c-f97e1c386297	velikonočni ponedeljek	21	4	2025	t
00430000-5696-157c-d059-00a0c3e48f53	velikonočni ponedeljek	6	4	2026	t
00430000-5696-157c-44c3-13028f62d7df	velikonočni ponedeljek	29	3	2027	t
00430000-5696-157c-3500-d16d97b4e954	velikonočni ponedeljek	17	4	2028	t
00430000-5696-157c-f2de-6728c62138a7	velikonočni ponedeljek	2	4	2029	t
00430000-5696-157c-c384-1a15e66f3f1a	velikonočni ponedeljek	22	4	2030	t
00430000-5696-157c-9928-5da8d0cf7e01	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5696-157c-a8db-8a5ea3363df2	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5696-157c-bcf5-ceff183756b4	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5696-157c-658c-b0c1cefe5329	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5696-157c-c619-48964829a02a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5696-157c-891b-3fa740357ff0	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5696-157c-295a-d2a9a2d3c541	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5696-157c-9a6d-54e69c8a85a9	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5696-157c-f5cc-8ed9c08c29c3	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5696-157c-1c9e-0792c6275f18	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5696-157c-94ca-4b8f1e05017a	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5696-157c-8163-d9b6af40ad78	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5696-157c-96f6-d69d2cfc14e3	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5696-157c-d75c-1ea092e392cc	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5696-157c-f212-6b03489549e0	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3155 (class 0 OID 35809880)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 35809889)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 35810013)
-- Dependencies: 212
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 35810058)
-- Dependencies: 218
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 35810491)
-- Dependencies: 244
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 35810501)
-- Dependencies: 245
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5696-157f-12e3-ed0216c03f69	00080000-5696-157f-2119-8c39b76bdb40	0987	AK
00190000-5696-157f-5e09-bcb37e913b89	00080000-5696-157f-3ccc-82c22e75b963	0989	AK
00190000-5696-157f-c4b9-4d1960a0f4f4	00080000-5696-157f-f3f9-9b74f37c8060	0986	AK
00190000-5696-157f-0ac4-e32ab7ebbd12	00080000-5696-157f-3f9e-8d0e9a4d0437	0984	AK
00190000-5696-157f-5481-ebfa4a24f458	00080000-5696-157f-46ba-537af5e47153	0983	AK
00190000-5696-157f-c2f8-e82a4777a379	00080000-5696-157f-492c-a2d264716188	0982	AK
00190000-5696-1580-ef77-bd7bb6c5ac45	00080000-5696-1580-8a57-e5549a291f42	1001	AK
\.


--
-- TOC entry 3199 (class 0 OID 35810390)
-- Dependencies: 242
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5696-157f-8ccd-262c06fa4e2b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3203 (class 0 OID 35810509)
-- Dependencies: 246
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 35810087)
-- Dependencies: 222
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5696-157e-7f8b-fb320279fb86	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5696-157e-fd40-a6f29fb50c8c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5696-157e-1129-2bbd48f81264	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5696-157e-c3a8-6fae19ab226c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5696-157e-3eb7-812c69f5dd94	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5696-157e-47f1-31077387d4a1	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5696-157e-a9be-77022b67fd31	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3171 (class 0 OID 35810031)
-- Dependencies: 214
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 35810021)
-- Dependencies: 213
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 35810228)
-- Dependencies: 235
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 35810158)
-- Dependencies: 229
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 35809854)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 35809616)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5696-1580-8a57-e5549a291f42	00010000-5696-157c-870d-289b6aacf18d	2016-01-13 10:14:40	INS	a:0:{}
2	App\\Entity\\Option	00000000-5696-1580-e382-9890dc15af66	00010000-5696-157c-870d-289b6aacf18d	2016-01-13 10:14:40	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5696-1580-ef77-bd7bb6c5ac45	00010000-5696-157c-870d-289b6aacf18d	2016-01-13 10:14:40	INS	a:0:{}
\.


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3180 (class 0 OID 35810100)
-- Dependencies: 223
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 35809654)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5696-157c-6d16-bb5f9eb732a2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5696-157c-1921-afe8db19c0e2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5696-157c-46ff-ec93cd7cceb5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5696-157c-d9ed-9575c1f9c8ba	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5696-157c-a081-588e65ef12ee	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5696-157c-43f9-919ed62b6649	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5696-157c-21ae-54ef763df6b2	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5696-157c-e715-144b8833fa74	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5696-157c-1be1-353add228da8	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5696-157c-b6db-2fd8347f0d36	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5696-157c-0e1e-a2e1d26ae0c5	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5696-157c-f5a0-b997ea5f929e	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5696-157c-d2ee-e4abf1d2e421	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5696-157c-f107-cd05b0687a5e	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5696-157c-2ca5-8cedeb3a7306	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5696-157c-0035-6e8af0f1f85a	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5696-157c-4e1a-81dd93c74f5a	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5696-157c-3cdc-15d266da8da2	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5696-157c-bab5-0a603a18b820	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5696-157c-76e2-4227c8afe115	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5696-157c-5d2c-505a245cbdfb	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5696-157c-b34f-0fc4048ad4e8	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5696-157c-af48-61ae71d345bf	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5696-157c-bfa8-fb64c4bf2383	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5696-157c-642f-61bacbf1e65d	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5696-157c-cf2d-c8a7292993d2	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5696-157c-e7ec-90204349ed80	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5696-157c-f1d0-0ed6d3668293	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5696-157c-e513-d9408fdedb8c	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5696-157c-987b-e086f95787ae	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5696-157c-63f5-f5d20398b8e7	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5696-157c-d0ad-294ca1e6ec9d	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5696-157c-a442-07e7244426f7	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5696-157c-92d2-bb09419269bc	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5696-157c-221a-5b1941316784	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5696-157c-d4cb-6fb98f9921bd	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5696-157c-0295-fa182cd01ad4	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5696-157c-b0ff-4b06f440b265	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5696-157c-3329-109a6dfa5051	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5696-157c-9e51-5236a4b8cef6	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5696-157c-08e7-3e2c7ee4e2fc	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5696-157c-5428-e125f90e3202	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5696-157c-4eff-a6432fecc0d2	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5696-157c-fce7-be4be06e28ac	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5696-157c-8730-7fbe051b9c2b	direktor	minimalne pravice za direktorja	t
00020000-5696-157c-abfb-6ba2c4dd4c35	arhivar	arhivar	t
00020000-5696-157c-bba7-85c655cb47d7	dramaturg	dramaturg	t
00020000-5696-157c-72eb-7469f8bf3863	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5696-157c-d22e-4cdaa4be9c9a	poslovni-sekretar	poslovni sekretar	t
00020000-5696-157c-ac75-2f37cbe98aa2	vodja-tehnike	vodja tehnike	t
00020000-5696-157c-5795-31a2cdacc3a5	racunovodja	računovodja	t
00020000-5696-157e-253f-bda8ffb515ef	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5696-157e-8916-2ef2c7124df2	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-2368-97e35ec9b38f	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-c464-25bcf7607371	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-9c35-76038dbe278f	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-87d9-9901debb69c9	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-0996-33515a3d1598	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-bb23-dd36e2a80d95	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5696-157e-d486-eac4e8a390eb	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5696-157e-d043-5b2d2b323a89	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-3cb9-330da74f069d	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-3599-6f5a131f5921	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-805e-525f0e2247bb	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-6e45-9390d853c812	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-4ebc-7f3af0313ba9	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-8ad4-8ecd67c80202	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-69d9-90f42eb4d56d	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-9745-ccc22275d972	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-d7d8-c74469207ea9	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-4ac3-0c7c956b72b0	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5696-157e-3d1e-971bb930bf03	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-d9f0-23ddb3ef1194	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-f657-eed94bf19009	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-6c7e-1da0019353dc	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-5772-422c68557087	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-d29c-3866e7262694	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-6819-963d2e6dc7ab	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-d83c-e607c9a07e26	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-6f67-eba032e22036	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-4e86-8d8fe8bda4e2	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-f927-1f1fae01dae6	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-f527-e214919ccd29	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-901a-19f654ba511e	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-cd10-493f35144d78	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-ae9d-42efb698ab9a	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-5322-7269d8800f38	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5696-157e-10bb-b36b7e6262eb	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5696-157e-bc74-17d7c659cdd0	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5696-157e-6956-80602c1ebb7b	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3134 (class 0 OID 35809638)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5696-157c-18be-310516881390	00020000-5696-157c-46ff-ec93cd7cceb5
00010000-5696-157c-870d-289b6aacf18d	00020000-5696-157c-46ff-ec93cd7cceb5
00010000-5696-157e-5fa2-0834b746a32c	00020000-5696-157e-253f-bda8ffb515ef
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-8916-2ef2c7124df2
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-87d9-9901debb69c9
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-d043-5b2d2b323a89
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-3599-6f5a131f5921
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-6e45-9390d853c812
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-d7d8-c74469207ea9
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-c464-25bcf7607371
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-3d1e-971bb930bf03
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-6c7e-1da0019353dc
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-d29c-3866e7262694
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-d83c-e607c9a07e26
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-4e86-8d8fe8bda4e2
00010000-5696-157e-48c8-c9ad49b71a7c	00020000-5696-157e-cd10-493f35144d78
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-8916-2ef2c7124df2
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-2368-97e35ec9b38f
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-c464-25bcf7607371
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-9c35-76038dbe278f
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-6e45-9390d853c812
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-69d9-90f42eb4d56d
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-3d1e-971bb930bf03
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-6c7e-1da0019353dc
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-d29c-3866e7262694
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-d83c-e607c9a07e26
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-4e86-8d8fe8bda4e2
00010000-5696-157e-93f6-d751fa3a6efe	00020000-5696-157e-cd10-493f35144d78
00010000-5696-157e-d641-187a320ca3d3	00020000-5696-157e-8916-2ef2c7124df2
00010000-5696-157e-d641-187a320ca3d3	00020000-5696-157e-2368-97e35ec9b38f
00010000-5696-157e-d641-187a320ca3d3	00020000-5696-157e-c464-25bcf7607371
00010000-5696-157e-d641-187a320ca3d3	00020000-5696-157e-9c35-76038dbe278f
00010000-5696-157e-d641-187a320ca3d3	00020000-5696-157e-3599-6f5a131f5921
00010000-5696-157e-d641-187a320ca3d3	00020000-5696-157e-6e45-9390d853c812
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-2368-97e35ec9b38f
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-0996-33515a3d1598
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-3cb9-330da74f069d
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-805e-525f0e2247bb
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-3599-6f5a131f5921
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-9745-ccc22275d972
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-6e45-9390d853c812
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-4ebc-7f3af0313ba9
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-3d1e-971bb930bf03
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-d9f0-23ddb3ef1194
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-6c7e-1da0019353dc
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-5772-422c68557087
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-d29c-3866e7262694
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-6819-963d2e6dc7ab
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-d83c-e607c9a07e26
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-6f67-eba032e22036
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-4e86-8d8fe8bda4e2
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-f927-1f1fae01dae6
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-cd10-493f35144d78
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-ae9d-42efb698ab9a
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-10bb-b36b7e6262eb
00010000-5696-157e-0b05-c0fdc002490a	00020000-5696-157e-bc74-17d7c659cdd0
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-2368-97e35ec9b38f
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-0996-33515a3d1598
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-d486-eac4e8a390eb
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-3cb9-330da74f069d
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-805e-525f0e2247bb
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-3599-6f5a131f5921
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-9745-ccc22275d972
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-6e45-9390d853c812
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-4ebc-7f3af0313ba9
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-8ad4-8ecd67c80202
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-3d1e-971bb930bf03
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-d9f0-23ddb3ef1194
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-f657-eed94bf19009
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-6c7e-1da0019353dc
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-5772-422c68557087
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-d29c-3866e7262694
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-6819-963d2e6dc7ab
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-d83c-e607c9a07e26
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-6f67-eba032e22036
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-4e86-8d8fe8bda4e2
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-f927-1f1fae01dae6
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-cd10-493f35144d78
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-ae9d-42efb698ab9a
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-5322-7269d8800f38
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-10bb-b36b7e6262eb
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-bc74-17d7c659cdd0
00010000-5696-157e-5d24-e6eb8c5ca341	00020000-5696-157e-6956-80602c1ebb7b
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-2368-97e35ec9b38f
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-c464-25bcf7607371
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-0996-33515a3d1598
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-bb23-dd36e2a80d95
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-d486-eac4e8a390eb
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-87d9-9901debb69c9
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-3cb9-330da74f069d
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-805e-525f0e2247bb
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-3599-6f5a131f5921
00010000-5696-157e-2420-72c92d60a5f5	00020000-5696-157e-9745-ccc22275d972
00010000-5696-157e-1d9d-88dc3431a40c	00020000-5696-157e-8916-2ef2c7124df2
00010000-5696-157e-1d9d-88dc3431a40c	00020000-5696-157e-9c35-76038dbe278f
00010000-5696-157e-1d9d-88dc3431a40c	00020000-5696-157e-87d9-9901debb69c9
00010000-5696-157e-1d9d-88dc3431a40c	00020000-5696-157e-d043-5b2d2b323a89
00010000-5696-157e-1d9d-88dc3431a40c	00020000-5696-157e-3599-6f5a131f5921
00010000-5696-157e-1d9d-88dc3431a40c	00020000-5696-157e-6e45-9390d853c812
00010000-5696-157e-1d9d-88dc3431a40c	00020000-5696-157e-d7d8-c74469207ea9
00010000-5696-157e-1d9d-88dc3431a40c	00020000-5696-157e-f527-e214919ccd29
00010000-5696-157e-d2d9-50edb0546c84	00020000-5696-157e-4ac3-0c7c956b72b0
00010000-5696-157e-82f4-331e59879290	00020000-5696-157c-8730-7fbe051b9c2b
00010000-5696-157e-e24f-bda61ca010cd	00020000-5696-157c-abfb-6ba2c4dd4c35
00010000-5696-157e-652d-81a315b47e9a	00020000-5696-157c-bba7-85c655cb47d7
00010000-5696-157e-5532-3ad93151c435	00020000-5696-157c-72eb-7469f8bf3863
00010000-5696-157e-9882-d10162418b97	00020000-5696-157c-d22e-4cdaa4be9c9a
00010000-5696-157e-fdcd-3fea38e46cb1	00020000-5696-157c-ac75-2f37cbe98aa2
00010000-5696-157e-11dc-170c0dfbd3ce	00020000-5696-157c-5795-31a2cdacc3a5
\.


--
-- TOC entry 3182 (class 0 OID 35810114)
-- Dependencies: 225
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 35810052)
-- Dependencies: 217
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 35809974)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5696-157e-b28c-b0b7bc6838a3	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5696-157e-c6e8-54ca3789a526	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5696-157e-87bd-cfe8060a665e	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3130 (class 0 OID 35809603)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5696-157b-ce65-e41fa4a61274	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5696-157b-6050-89b6393b94fc	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5696-157b-67d3-a5701430b875	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5696-157b-4d2a-86851e0ea678	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5696-157b-6eb7-7326be5da5b0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3129 (class 0 OID 35809595)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5696-157b-cfbc-0f579cd954c6	00230000-5696-157b-4d2a-86851e0ea678	popa
00240000-5696-157b-9140-27aff3432e03	00230000-5696-157b-4d2a-86851e0ea678	oseba
00240000-5696-157b-e6f9-9d2b06a2de81	00230000-5696-157b-4d2a-86851e0ea678	tippopa
00240000-5696-157b-f5a9-f5504e93993e	00230000-5696-157b-4d2a-86851e0ea678	organizacijskaenota
00240000-5696-157b-3fbd-15f7fe8a726f	00230000-5696-157b-4d2a-86851e0ea678	sezona
00240000-5696-157b-f67e-2c4237e2f84b	00230000-5696-157b-4d2a-86851e0ea678	tipvaje
00240000-5696-157b-30cb-531939f0c412	00230000-5696-157b-4d2a-86851e0ea678	tipdodatka
00240000-5696-157b-ff26-d5301fd8b553	00230000-5696-157b-6050-89b6393b94fc	prostor
00240000-5696-157b-a004-66fa5f059883	00230000-5696-157b-4d2a-86851e0ea678	besedilo
00240000-5696-157b-a4a6-81639b95c84e	00230000-5696-157b-4d2a-86851e0ea678	uprizoritev
00240000-5696-157b-fa37-b0bd04f36bd3	00230000-5696-157b-4d2a-86851e0ea678	funkcija
00240000-5696-157b-142b-16db75c02667	00230000-5696-157b-4d2a-86851e0ea678	tipfunkcije
00240000-5696-157b-9415-d204cc29bec1	00230000-5696-157b-4d2a-86851e0ea678	alternacija
00240000-5696-157b-915d-92c7d7a20fa7	00230000-5696-157b-ce65-e41fa4a61274	pogodba
00240000-5696-157b-ba19-53e9cf3d8ed2	00230000-5696-157b-4d2a-86851e0ea678	zaposlitev
00240000-5696-157b-c98c-b4398f81595d	00230000-5696-157b-4d2a-86851e0ea678	zvrstuprizoritve
00240000-5696-157b-857d-fcb2968f3d51	00230000-5696-157b-ce65-e41fa4a61274	programdela
00240000-5696-157b-b524-9a3981b5b848	00230000-5696-157b-4d2a-86851e0ea678	zapis
\.


--
-- TOC entry 3128 (class 0 OID 35809590)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
268a106e-ed15-46ed-a0c1-b28ef967ba51	00240000-5696-157b-cfbc-0f579cd954c6	0	1001
\.


--
-- TOC entry 3188 (class 0 OID 35810175)
-- Dependencies: 231
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5696-157f-65bf-50e5e208d49f	000e0000-5696-157f-5a1b-664f1f0d8f9c	00080000-5696-157f-998c-ee0a5bf21f20	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5696-157b-7862-670bd891b146
00270000-5696-157f-9d4a-81194d3ac354	000e0000-5696-157f-5a1b-664f1f0d8f9c	00080000-5696-157f-998c-ee0a5bf21f20	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5696-157b-7862-670bd891b146
\.


--
-- TOC entry 3144 (class 0 OID 35809738)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 35809984)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, prisotnost_id, planiranzacetek, planirankonec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5696-157f-aaa8-ba8e8695d5cc	00180000-5696-157f-9098-0b35c2d65e09	000c0000-5696-157f-44a6-a7d84a83ea02	00090000-5696-157f-3ddd-f9f50e727f7c	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-157f-5c4d-5143cf96646c	00180000-5696-157f-9098-0b35c2d65e09	000c0000-5696-157f-4527-48f8024b40f1	00090000-5696-157f-6400-688dcce10fbf	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-157f-491f-945bb89672b3	00180000-5696-157f-9098-0b35c2d65e09	000c0000-5696-157f-1b5d-e26a67fc1da0	00090000-5696-157f-3787-7a3a23e5dbb7	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-157f-30ff-299b79696a24	00180000-5696-157f-9098-0b35c2d65e09	000c0000-5696-157f-1d84-54f9b954d898	00090000-5696-157f-a493-0feb8bed05ee	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-157f-04e8-2e8403fd3f12	00180000-5696-157f-9098-0b35c2d65e09	000c0000-5696-157f-05f5-d5a504a93bfb	00090000-5696-157f-fb17-3014d1b78b06	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2.00	f	f
001a0000-5696-157f-e654-b97b9a358a64	00180000-5696-157f-d152-0b8d7e30d973	\N	00090000-5696-157f-fb17-3014d1b78b06	\N	2015-08-01 20:00:00	2015-08-01 23:00:00	2.00	t	f
001a0000-5696-157f-addc-671e906415c2	00180000-5696-157f-d152-0b8d7e30d973	\N	00090000-5696-157f-6400-688dcce10fbf	\N	2015-08-01 20:00:00	2015-08-01 23:00:00	2.00	f	t
\.


--
-- TOC entry 3168 (class 0 OID 35810003)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5696-157b-aaeb-0b765c293936	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5696-157b-0859-d6abda76f4ee	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5696-157b-9bdb-43c92845028a	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5696-157b-29ad-5919f7cc55d2	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5696-157b-c860-a219fe21175c	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5696-157b-03d3-545d1f60f3c0	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3191 (class 0 OID 35810216)
-- Dependencies: 234
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5696-157b-c8d2-8a78f158165c	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5696-157b-dbc6-1329094cbb8d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5696-157b-44d1-74196ddeaa0e	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5696-157b-4a99-8a6e78a730ef	04	Režija	Režija	Režija	umetnik	30
000f0000-5696-157b-71d5-1b624f4a51cd	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5696-157b-c4c5-c7f8c739ed43	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5696-157b-9681-3623a5d8eee5	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5696-157b-69f2-957fecbf03bd	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5696-157b-18a1-0bb0bbec64ae	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5696-157b-e465-107d56daf8b6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5696-157b-9d78-8652ffe20eda	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5696-157b-9ef0-b44c900d4d97	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5696-157b-052d-5e80a5995bad	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5696-157b-be2c-6a6ff26d3a58	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5696-157b-79f7-a79f0e413334	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5696-157b-7dda-78f8004a3e6e	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5696-157b-61c0-0bccf38801c6	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5696-157b-1030-c3a2b6e5fc47	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5696-157b-8d56-7b87996824aa	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3141 (class 0 OID 35809689)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5696-157e-7967-b0cc3e5f3b07	0001	šola	osnovna ali srednja šola
00400000-5696-157e-a4d6-4513bffedd6c	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5696-157e-b884-6f8d937cc390	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3204 (class 0 OID 35810521)
-- Dependencies: 247
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5696-157b-2616-a3a103d1b94d	01	Velika predstava	f	1.00	1.00
002b0000-5696-157b-6f36-6e2051961c3e	02	Mala predstava	f	0.50	0.50
002b0000-5696-157b-b01f-e1636cfa24e4	03	Mala koprodukcija	t	0.40	1.00
002b0000-5696-157b-b6c8-3666ede2978f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5696-157b-326f-0c3a5fe74c59	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3164 (class 0 OID 35809964)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5696-157b-e50e-b13caf7dab7b	0001	prva vaja	prva vaja
00420000-5696-157b-a920-ccd09c7bd6b7	0002	tehnična vaja	tehnična vaja
00420000-5696-157b-c586-94244d2fd0d6	0003	lučna vaja	lučna vaja
00420000-5696-157b-78ac-6a9b5218db75	0004	kostumska vaja	kostumska vaja
00420000-5696-157b-9e1c-c8e417dca22c	0005	foto vaja	foto vaja
00420000-5696-157b-87c7-dd215e26c0a7	0006	1. glavna vaja	1. glavna vaja
00420000-5696-157b-c6f8-74c7efe0d9a0	0007	2. glavna vaja	2. glavna vaja
00420000-5696-157b-e30b-46c47febbbe1	0008	1. generalka	1. generalka
00420000-5696-157b-36cf-4a565f9049bd	0009	2. generalka	2. generalka
00420000-5696-157b-267c-21bfe5156ed0	0010	odprta generalka	odprta generalka
00420000-5696-157b-70e4-fd4fcc23648b	0011	obnovitvena vaja	obnovitvena vaja
00420000-5696-157b-ee04-893f1ad9ec2d	0012	italijanka	krajša "obnovitvena" vaja
00420000-5696-157b-3458-a0c003c18f6e	0013	pevska vaja	pevska vaja
00420000-5696-157b-51e0-c5e840b3755d	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5696-157b-125c-99f55b1b3bf6	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5696-157b-b073-c9b48656fecb	0016	orientacijska vaja	orientacijska vaja
00420000-5696-157b-33c7-6e2b53cdd656	0017	situacijska vaja	situacijska vaja
00420000-5696-157b-cced-5cd4c155248d	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3150 (class 0 OID 35809811)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 35809625)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5696-157c-870d-289b6aacf18d	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO6fNENrDKOSy8Mo11lxy9IA56G.zLJJC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5696-157e-a8da-b82b6d4b41a2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5696-157e-bb3a-ae4c435de573	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5696-157e-4f11-ccaa12972736	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5696-157e-20ab-18de7f08f576	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5696-157e-49b7-0eff84f657d2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5696-157e-b7ce-e5b1bcd34dd0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5696-157e-1405-1fe343830a0f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5696-157e-a202-411d73bd752b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5696-157e-b9ec-736338efdc8f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5696-157e-5fa2-0834b746a32c	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5696-157e-21df-3cd8001576cd	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5696-157e-48c8-c9ad49b71a7c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5696-157e-93f6-d751fa3a6efe	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5696-157e-d641-187a320ca3d3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5696-157e-0b05-c0fdc002490a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5696-157e-5d24-e6eb8c5ca341	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5696-157e-2420-72c92d60a5f5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5696-157e-1d9d-88dc3431a40c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5696-157e-d2d9-50edb0546c84	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5696-157e-82f4-331e59879290	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5696-157e-e24f-bda61ca010cd	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5696-157e-652d-81a315b47e9a	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5696-157e-5532-3ad93151c435	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5696-157e-9882-d10162418b97	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5696-157e-fdcd-3fea38e46cb1	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5696-157e-11dc-170c0dfbd3ce	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5696-157c-18be-310516881390	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3195 (class 0 OID 35810266)
-- Dependencies: 238
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5696-157f-c81f-a9941d0eda35	00160000-5696-157e-d038-254d4a59ccc4	\N	00140000-5696-157b-ae1f-1b4687749d82	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5696-157e-3eb7-812c69f5dd94
000e0000-5696-157f-5a1b-664f1f0d8f9c	00160000-5696-157e-318c-f06ba9ee228f	\N	00140000-5696-157b-f999-9fff75d23582	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5696-157e-47f1-31077387d4a1
000e0000-5696-157f-0a53-f94015c5fb94	\N	\N	00140000-5696-157b-f999-9fff75d23582	00190000-5696-157f-12e3-ed0216c03f69	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5696-157e-3eb7-812c69f5dd94
000e0000-5696-157f-ad9b-3412543358bc	\N	\N	00140000-5696-157b-f999-9fff75d23582	00190000-5696-157f-12e3-ed0216c03f69	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5696-157e-3eb7-812c69f5dd94
000e0000-5696-157f-91d3-814c78fde262	\N	\N	00140000-5696-157b-f999-9fff75d23582	00190000-5696-157f-12e3-ed0216c03f69	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-74fd-3c7a336ffd68	\N	\N	00140000-5696-157b-f999-9fff75d23582	00190000-5696-157f-12e3-ed0216c03f69	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-6046-86aa975942b3	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-a892-7ef3e9edc235	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-d738-26dba7060ca8	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-2c56-6d01087f1428	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-15b4-c4c820265e4a	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-b39a-e67ea9847b43	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-3bf3-0d960d7afaa0	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-7cc5-1ed3f008def2	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
000e0000-5696-157f-9255-a83cc1487fc9	\N	\N	00140000-5696-157b-7015-80338106d2ee	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5696-157e-7f8b-fb320279fb86
\.


--
-- TOC entry 3158 (class 0 OID 35809907)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5696-157f-e8be-e906996d39b5	\N	000e0000-5696-157f-5a1b-664f1f0d8f9c	1
00200000-5696-157f-8e49-12ccc22cc9b0	\N	000e0000-5696-157f-5a1b-664f1f0d8f9c	2
00200000-5696-157f-8418-6bdb06774896	\N	000e0000-5696-157f-5a1b-664f1f0d8f9c	3
00200000-5696-157f-f4f3-1cc4c630bd4e	\N	000e0000-5696-157f-5a1b-664f1f0d8f9c	4
00200000-5696-157f-65a6-dd1979ab2363	\N	000e0000-5696-157f-5a1b-664f1f0d8f9c	5
\.


--
-- TOC entry 3178 (class 0 OID 35810079)
-- Dependencies: 221
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 35810189)
-- Dependencies: 232
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5696-157b-4473-02013d44249c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5696-157b-d436-6b47065fae24	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5696-157b-dafe-682c70a2e55a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5696-157b-94c4-2e897efed51a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5696-157b-0fb4-1872486e04aa	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5696-157b-f7e2-a13d51b3c968	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5696-157b-72f4-67d7fb87861d	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5696-157b-2afe-99663c62502e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5696-157b-7862-670bd891b146	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5696-157b-34ee-aa10ae338591	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5696-157b-e464-cb984d2ed5c8	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5696-157b-458a-dd74e98c5bd9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5696-157b-ab2b-3de720fd9e6b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5696-157b-51bf-c20261cee761	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5696-157b-1787-62cb36143faf	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5696-157b-a38e-0026715051ee	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5696-157b-10e5-78198ed14724	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5696-157b-f6cc-d5d736592e57	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5696-157b-6dea-3dd4af5a5a1f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5696-157b-5b79-82fc8633aa3a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5696-157b-42d5-c483e0c173e9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5696-157b-d1c5-ee08652c05b0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5696-157b-c076-762fc44f9a3c	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5696-157c-e627-029531149c69	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5696-157c-267c-3074c77505a5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5696-157c-d37c-dfecd769b62b	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5696-157c-b814-9bf07c95fd53	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5696-157c-1817-9060081af38d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3207 (class 0 OID 35810571)
-- Dependencies: 250
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 35810540)
-- Dependencies: 249
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 35810583)
-- Dependencies: 251
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 35810151)
-- Dependencies: 228
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5696-157f-8665-d4431fe6e779	00090000-5696-157f-6400-688dcce10fbf	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-157f-a630-0362f7b0d6cd	00090000-5696-157f-3787-7a3a23e5dbb7	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-157f-a27e-520413e5eba8	00090000-5696-157f-d17c-7421e99fb920	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-157f-077a-4392793a549e	00090000-5696-157f-52c1-5b4d9a789e64	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-157f-9819-ef67e63dc270	00090000-5696-157f-7327-3a3c3033662b	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5696-157f-1e50-b6e1ffe58bda	00090000-5696-157f-e39c-0b05a6a1ff16	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3161 (class 0 OID 35809948)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 35810256)
-- Dependencies: 237
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5696-157b-ae1f-1b4687749d82	01	Drama	drama (SURS 01)
00140000-5696-157b-2c44-cf19ff85410d	02	Opera	opera (SURS 02)
00140000-5696-157b-d4c4-b69e7cd7d75a	03	Balet	balet (SURS 03)
00140000-5696-157b-bf3d-059143d0025c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5696-157b-7015-80338106d2ee	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5696-157b-f999-9fff75d23582	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5696-157b-aa81-19b099f2fe73	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3184 (class 0 OID 35810141)
-- Dependencies: 227
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2609 (class 2606 OID 35809688)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 35810315)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 35810306)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 35809679)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 35810172)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 35810214)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 35810624)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 35810000)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 35809936)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 35809958)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 35809963)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 35810538)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 35809837)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 35810384)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 35810137)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 35809905)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 35809875)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 35809851)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 35810044)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 35810601)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 35810608)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2901 (class 2606 OID 35810632)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2759 (class 2606 OID 35810071)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 35809809)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 35809707)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 35809771)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 35809734)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 35809668)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2598 (class 2606 OID 35809653)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 35810077)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 35810113)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 35810251)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 35809762)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 35809797)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 35810489)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 35810050)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 35809787)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 35809921)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 35809893)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2676 (class 2606 OID 35809885)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 35810019)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 35810062)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 35810498)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 35810506)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 35810476)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 35810519)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 35810095)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 35810035)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 35810026)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 35810238)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 35810165)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 35809863)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 35809624)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 35810104)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 35809642)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2600 (class 2606 OID 35809662)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 35810122)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 35810057)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 35809982)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 35809612)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 35809600)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 35809594)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 35810185)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 35809743)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 35809991)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 35810010)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 35810225)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 35809696)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 35810531)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 35809971)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 35809822)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 35809637)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 35810284)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 35809911)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 35810085)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 35810197)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2883 (class 2606 OID 35810581)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 35810565)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 35810589)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 35810155)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 35809952)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 35810264)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 35810149)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 1259 OID 35809946)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2693 (class 1259 OID 35809947)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2694 (class 1259 OID 35809945)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2695 (class 1259 OID 35809944)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2696 (class 1259 OID 35809943)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2802 (class 1259 OID 35810186)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2803 (class 1259 OID 35810187)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 35810188)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2887 (class 1259 OID 35810603)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2888 (class 1259 OID 35810602)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2627 (class 1259 OID 35809764)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2628 (class 1259 OID 35809765)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2760 (class 1259 OID 35810078)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2874 (class 1259 OID 35810569)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2875 (class 1259 OID 35810568)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2876 (class 1259 OID 35810570)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2877 (class 1259 OID 35810567)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2878 (class 1259 OID 35810566)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2754 (class 1259 OID 35810064)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2755 (class 1259 OID 35810063)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2684 (class 1259 OID 35809912)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2685 (class 1259 OID 35809913)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 35810138)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2785 (class 1259 OID 35810140)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2786 (class 1259 OID 35810139)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2659 (class 1259 OID 35809853)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 35809852)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2865 (class 1259 OID 35810520)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2818 (class 1259 OID 35810253)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2819 (class 1259 OID 35810254)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2820 (class 1259 OID 35810255)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2884 (class 1259 OID 35810590)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2827 (class 1259 OID 35810290)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2828 (class 1259 OID 35810286)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2829 (class 1259 OID 35810291)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2830 (class 1259 OID 35810289)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2831 (class 1259 OID 35810287)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2649 (class 1259 OID 35809824)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 35809823)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2618 (class 1259 OID 35809737)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2772 (class 1259 OID 35810105)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2602 (class 1259 OID 35809669)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2603 (class 1259 OID 35809670)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2777 (class 1259 OID 35810125)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2778 (class 1259 OID 35810124)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2779 (class 1259 OID 35810123)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2632 (class 1259 OID 35809774)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2633 (class 1259 OID 35809773)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2634 (class 1259 OID 35809775)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2672 (class 1259 OID 35809888)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2673 (class 1259 OID 35809886)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2674 (class 1259 OID 35809887)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2582 (class 1259 OID 35809602)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2734 (class 1259 OID 35810030)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2735 (class 1259 OID 35810028)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2736 (class 1259 OID 35810027)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2737 (class 1259 OID 35810029)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2593 (class 1259 OID 35809643)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 35809644)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2763 (class 1259 OID 35810086)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2897 (class 1259 OID 35810625)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2800 (class 1259 OID 35810174)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2801 (class 1259 OID 35810173)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2898 (class 1259 OID 35810633)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 35810634)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2749 (class 1259 OID 35810051)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2794 (class 1259 OID 35810166)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2795 (class 1259 OID 35810167)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2847 (class 1259 OID 35810389)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2848 (class 1259 OID 35810388)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2849 (class 1259 OID 35810385)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2850 (class 1259 OID 35810386)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2851 (class 1259 OID 35810387)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2638 (class 1259 OID 35809789)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 35809788)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2640 (class 1259 OID 35809790)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2766 (class 1259 OID 35810099)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2767 (class 1259 OID 35810098)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 35810499)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2858 (class 1259 OID 35810500)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2840 (class 1259 OID 35810319)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2841 (class 1259 OID 35810320)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2842 (class 1259 OID 35810317)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2843 (class 1259 OID 35810318)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2731 (class 1259 OID 35810020)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2725 (class 1259 OID 35810001)
-- Name: idx_aab095ce1d25995; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce1d25995 ON dodatek USING btree (prisotnost_id);


--
-- TOC entry 2726 (class 1259 OID 35810002)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2790 (class 1259 OID 35810156)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2791 (class 1259 OID 35810157)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2740 (class 1259 OID 35810039)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2741 (class 1259 OID 35810038)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2742 (class 1259 OID 35810036)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2743 (class 1259 OID 35810037)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2837 (class 1259 OID 35810307)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2663 (class 1259 OID 35809864)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2666 (class 1259 OID 35809878)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2667 (class 1259 OID 35809877)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2668 (class 1259 OID 35809876)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2669 (class 1259 OID 35809879)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2683 (class 1259 OID 35809906)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 35809894)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2678 (class 1259 OID 35809895)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2854 (class 1259 OID 35810490)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2873 (class 1259 OID 35810539)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2891 (class 1259 OID 35810609)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2892 (class 1259 OID 35810610)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2614 (class 1259 OID 35809709)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2615 (class 1259 OID 35809708)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2623 (class 1259 OID 35809744)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2624 (class 1259 OID 35809745)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 35809953)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 35809994)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2718 (class 1259 OID 35809993)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2719 (class 1259 OID 35809992)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2697 (class 1259 OID 35809938)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2698 (class 1259 OID 35809939)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2699 (class 1259 OID 35809942)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2700 (class 1259 OID 35809937)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2701 (class 1259 OID 35809941)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2702 (class 1259 OID 35809940)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2631 (class 1259 OID 35809763)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 35809697)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 35809698)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2655 (class 1259 OID 35809838)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2656 (class 1259 OID 35809840)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2657 (class 1259 OID 35809839)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2658 (class 1259 OID 35809841)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2748 (class 1259 OID 35810045)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2823 (class 1259 OID 35810252)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 35810285)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2814 (class 1259 OID 35810226)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2815 (class 1259 OID 35810227)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2621 (class 1259 OID 35809735)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 35809736)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2729 (class 1259 OID 35810011)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2730 (class 1259 OID 35810012)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2787 (class 1259 OID 35810150)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 35809613)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 35809810)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2637 (class 1259 OID 35809772)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2585 (class 1259 OID 35809601)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2870 (class 1259 OID 35810532)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2770 (class 1259 OID 35810097)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2771 (class 1259 OID 35810096)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 35809972)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 35809973)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2844 (class 1259 OID 35810316)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 35809798)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 35810265)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2881 (class 1259 OID 35810582)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2863 (class 1259 OID 35810507)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2864 (class 1259 OID 35810508)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2811 (class 1259 OID 35810215)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2716 (class 1259 OID 35809983)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 35809663)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2722 (class 1259 OID 35809995)
-- Name: uniq_fef7d84b1d25995; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_fef7d84b1d25995 ON terminstoritve USING btree (prisotnost_id);


--
-- TOC entry 2936 (class 2606 OID 35810805)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2937 (class 2606 OID 35810810)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2942 (class 2606 OID 35810835)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2940 (class 2606 OID 35810825)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2935 (class 2606 OID 35810800)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2939 (class 2606 OID 35810820)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2941 (class 2606 OID 35810830)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2938 (class 2606 OID 35810815)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2980 (class 2606 OID 35811025)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2981 (class 2606 OID 35811030)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2982 (class 2606 OID 35811035)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3014 (class 2606 OID 35811195)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 35811190)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 35810690)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2914 (class 2606 OID 35810695)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2963 (class 2606 OID 35810940)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3010 (class 2606 OID 35811175)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3009 (class 2606 OID 35811170)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3011 (class 2606 OID 35811180)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3008 (class 2606 OID 35811165)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3007 (class 2606 OID 35811160)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2962 (class 2606 OID 35810935)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2961 (class 2606 OID 35810930)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2933 (class 2606 OID 35810790)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2934 (class 2606 OID 35810795)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2971 (class 2606 OID 35810980)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2973 (class 2606 OID 35810990)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2972 (class 2606 OID 35810985)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2924 (class 2606 OID 35810745)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2923 (class 2606 OID 35810740)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2959 (class 2606 OID 35810920)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 35811150)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 35811040)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2984 (class 2606 OID 35811045)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2985 (class 2606 OID 35811050)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3012 (class 2606 OID 35811185)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2989 (class 2606 OID 35811070)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2986 (class 2606 OID 35811055)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2990 (class 2606 OID 35811075)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2988 (class 2606 OID 35811065)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2987 (class 2606 OID 35811060)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2922 (class 2606 OID 35810735)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2921 (class 2606 OID 35810730)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2910 (class 2606 OID 35810675)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2909 (class 2606 OID 35810670)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2967 (class 2606 OID 35810960)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2905 (class 2606 OID 35810650)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2906 (class 2606 OID 35810655)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2970 (class 2606 OID 35810975)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2969 (class 2606 OID 35810970)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2968 (class 2606 OID 35810965)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2916 (class 2606 OID 35810705)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2915 (class 2606 OID 35810700)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2917 (class 2606 OID 35810710)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2929 (class 2606 OID 35810770)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 35810760)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2928 (class 2606 OID 35810765)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2902 (class 2606 OID 35810635)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2954 (class 2606 OID 35810895)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2952 (class 2606 OID 35810885)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2951 (class 2606 OID 35810880)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2953 (class 2606 OID 35810890)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2903 (class 2606 OID 35810640)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2904 (class 2606 OID 35810645)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2964 (class 2606 OID 35810945)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3017 (class 2606 OID 35811210)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2979 (class 2606 OID 35811020)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 35811015)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3018 (class 2606 OID 35811215)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3019 (class 2606 OID 35811220)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2960 (class 2606 OID 35810925)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2976 (class 2606 OID 35811005)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2977 (class 2606 OID 35811010)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 35811125)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2999 (class 2606 OID 35811120)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2996 (class 2606 OID 35811105)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2997 (class 2606 OID 35811110)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2998 (class 2606 OID 35811115)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2919 (class 2606 OID 35810720)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 35810715)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2920 (class 2606 OID 35810725)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 35810955)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2965 (class 2606 OID 35810950)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 35811135)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3003 (class 2606 OID 35811140)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2994 (class 2606 OID 35811095)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 35811100)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2992 (class 2606 OID 35811085)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2993 (class 2606 OID 35811090)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2950 (class 2606 OID 35810875)
-- Name: fk_a8171cf610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT fk_a8171cf610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 35810865)
-- Name: fk_aab095ce1d25995; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce1d25995 FOREIGN KEY (prisotnost_id) REFERENCES prisotnost(id);


--
-- TOC entry 2949 (class 2606 OID 35810870)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2974 (class 2606 OID 35810995)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2975 (class 2606 OID 35811000)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2958 (class 2606 OID 35810915)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2957 (class 2606 OID 35810910)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2955 (class 2606 OID 35810900)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2956 (class 2606 OID 35810905)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2991 (class 2606 OID 35811080)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2925 (class 2606 OID 35810750)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2926 (class 2606 OID 35810755)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2932 (class 2606 OID 35810785)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2930 (class 2606 OID 35810775)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2931 (class 2606 OID 35810780)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3001 (class 2606 OID 35811130)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3004 (class 2606 OID 35811145)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 35811155)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3015 (class 2606 OID 35811200)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3016 (class 2606 OID 35811205)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2908 (class 2606 OID 35810665)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2907 (class 2606 OID 35810660)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2911 (class 2606 OID 35810680)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 35810685)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 35810840)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2946 (class 2606 OID 35810855)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2947 (class 2606 OID 35810860)
-- Name: fk_fef7d84b1d25995; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b1d25995 FOREIGN KEY (prisotnost_id) REFERENCES prisotnost(id);


--
-- TOC entry 2945 (class 2606 OID 35810850)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2944 (class 2606 OID 35810845)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-13 10:14:42 CET

--
-- PostgreSQL database dump complete
--

