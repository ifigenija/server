--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-11 16:16:25 CET

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
-- TOC entry 183 (class 1259 OID 32043849)
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
-- TOC entry 237 (class 1259 OID 32044463)
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
-- TOC entry 236 (class 1259 OID 32044446)
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
-- TOC entry 182 (class 1259 OID 32043842)
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
-- TOC entry 181 (class 1259 OID 32043840)
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
-- TOC entry 227 (class 1259 OID 32044323)
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
-- TOC entry 230 (class 1259 OID 32044353)
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
-- TOC entry 251 (class 1259 OID 32044756)
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
-- TOC entry 203 (class 1259 OID 32044097)
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
-- TOC entry 205 (class 1259 OID 32044129)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32044134)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32044678)
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
-- TOC entry 194 (class 1259 OID 32043994)
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
-- TOC entry 238 (class 1259 OID 32044476)
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
-- TOC entry 223 (class 1259 OID 32044277)
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
-- TOC entry 200 (class 1259 OID 32044068)
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
-- TOC entry 197 (class 1259 OID 32044034)
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
-- TOC entry 195 (class 1259 OID 32044011)
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
-- TOC entry 212 (class 1259 OID 32044191)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32044736)
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
-- TOC entry 250 (class 1259 OID 32044749)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32044771)
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
-- TOC entry 170 (class 1259 OID 32028295)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32044216)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32043968)
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
-- TOC entry 185 (class 1259 OID 32043868)
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
-- TOC entry 189 (class 1259 OID 32043935)
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
-- TOC entry 186 (class 1259 OID 32043879)
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
-- TOC entry 178 (class 1259 OID 32043814)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32043833)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32044223)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32044257)
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
-- TOC entry 233 (class 1259 OID 32044394)
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
-- TOC entry 188 (class 1259 OID 32043915)
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
-- TOC entry 191 (class 1259 OID 32043960)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32044622)
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
-- TOC entry 213 (class 1259 OID 32044197)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32043945)
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
-- TOC entry 202 (class 1259 OID 32044089)
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
-- TOC entry 198 (class 1259 OID 32044049)
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
-- TOC entry 199 (class 1259 OID 32044061)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32044209)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32044636)
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
-- TOC entry 242 (class 1259 OID 32044646)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32044545)
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
    stobiskponprejkopr integer,
    stobiskponprejkoprint integer,
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremgostkopr integer,
    stobiskponprejgostkopr integer,
    stobiskponpremzamejo integer,
    stobiskponpremzamejokopr integer,
    stobiskponprejzamejokopr integer,
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
-- TOC entry 243 (class 1259 OID 32044654)
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
-- TOC entry 219 (class 1259 OID 32044238)
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
-- TOC entry 211 (class 1259 OID 32044182)
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
-- TOC entry 210 (class 1259 OID 32044172)
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
-- TOC entry 232 (class 1259 OID 32044383)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32044313)
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
-- TOC entry 196 (class 1259 OID 32044023)
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
-- TOC entry 175 (class 1259 OID 32043785)
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
-- TOC entry 174 (class 1259 OID 32043783)
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
-- TOC entry 220 (class 1259 OID 32044251)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32043823)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32043807)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32044265)
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
-- TOC entry 214 (class 1259 OID 32044203)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32044149)
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
-- TOC entry 173 (class 1259 OID 32043772)
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
-- TOC entry 172 (class 1259 OID 32043764)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32043759)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32044330)
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
-- TOC entry 187 (class 1259 OID 32043907)
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
-- TOC entry 209 (class 1259 OID 32044159)
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
-- TOC entry 231 (class 1259 OID 32044371)
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
-- TOC entry 184 (class 1259 OID 32043858)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32044666)
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
-- TOC entry 207 (class 1259 OID 32044139)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32043980)
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
-- TOC entry 176 (class 1259 OID 32043794)
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
-- TOC entry 235 (class 1259 OID 32044421)
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
-- TOC entry 201 (class 1259 OID 32044079)
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
-- TOC entry 218 (class 1259 OID 32044230)
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
-- TOC entry 229 (class 1259 OID 32044344)
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
-- TOC entry 247 (class 1259 OID 32044716)
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
-- TOC entry 246 (class 1259 OID 32044685)
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
-- TOC entry 248 (class 1259 OID 32044728)
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
-- TOC entry 225 (class 1259 OID 32044302)
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
-- TOC entry 204 (class 1259 OID 32044123)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32044411)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32044292)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32043845)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32043788)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 32043849)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-566a-e8c5-f502-150ab56c642d	10	30	Otroci	Abonma za otroke	200
000a0000-566a-e8c5-1319-5c12e7a587e4	20	60	Mladina	Abonma za mladino	400
000a0000-566a-e8c5-8122-3fdbeabf7661	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 32044463)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-566a-e8c5-d2c6-e58a05a2e6fd	000d0000-566a-e8c5-75dd-2e42e4c0b72b	\N	00090000-566a-e8c5-26f0-0424381b7030	000b0000-566a-e8c5-4334-66d08032049a	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-566a-e8c5-ed78-be20eb5d4800	000d0000-566a-e8c5-7ec5-b5b33bf2cb00	00100000-566a-e8c5-8959-68c01374e91d	00090000-566a-e8c5-1b1a-7bed385b2d3c	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-566a-e8c5-f273-8409bf490d8b	000d0000-566a-e8c5-c5ce-0e09fde2c2d9	00100000-566a-e8c5-d782-bf21602ea4d6	00090000-566a-e8c5-7909-3c2f83a35860	\N	0003	t	\N	2015-12-11	\N	2	t	\N	f	f
000c0000-566a-e8c5-9eb6-6df5c429d6b9	000d0000-566a-e8c5-31e5-1441bf566d53	\N	00090000-566a-e8c5-fbea-47dfc1e7fa1b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-566a-e8c5-8831-342fdab11db8	000d0000-566a-e8c5-21f6-3640ef6ab547	\N	00090000-566a-e8c5-d997-e5b571a5e983	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-566a-e8c5-6511-42fb3d7b7d6d	000d0000-566a-e8c5-5241-f5b148a6df37	\N	00090000-566a-e8c5-42ad-98d49f386458	000b0000-566a-e8c5-6b3c-02c4ec197b90	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-566a-e8c5-b641-6db8f7e6445f	000d0000-566a-e8c5-c489-899b324dd707	00100000-566a-e8c5-e828-0ccdeca7cee6	00090000-566a-e8c5-872e-2fa3ee13b530	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-566a-e8c5-6d7a-eba0936d9be9	000d0000-566a-e8c5-e39a-3d5a532f5e75	\N	00090000-566a-e8c5-cb82-23f5ab4cfc5a	000b0000-566a-e8c5-faa9-e2aca24c1913	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-566a-e8c5-aaa3-435f7b4d9afd	000d0000-566a-e8c5-c489-899b324dd707	00100000-566a-e8c5-7bd6-7c5b00d4e06b	00090000-566a-e8c5-0fa1-e0fc51b6f5d5	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-566a-e8c5-c00e-897d99a68acb	000d0000-566a-e8c5-c489-899b324dd707	00100000-566a-e8c5-7834-25293b0a5517	00090000-566a-e8c5-74d2-8801f2fe6f2e	\N	0010	t	\N	2015-12-11	\N	16	f	\N	f	t
000c0000-566a-e8c5-21e4-a142eb62e012	000d0000-566a-e8c5-c489-899b324dd707	00100000-566a-e8c5-9190-35f1fba12b6d	00090000-566a-e8c5-495a-e317bbe134e4	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-566a-e8c5-fa04-2686f688d914	000d0000-566a-e8c5-1f17-dff4eea985c4	00100000-566a-e8c5-8959-68c01374e91d	00090000-566a-e8c5-1b1a-7bed385b2d3c	000b0000-566a-e8c5-40ed-c9b6fc075d58	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 32044446)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 32043842)
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
-- TOC entry 3151 (class 0 OID 32044323)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-566a-e8c5-e4c4-133a0da4c04e	00160000-566a-e8c4-8f58-a38b41ddf0e4	00090000-566a-e8c5-9cb2-8ce468084660	aizv	10	t
003d0000-566a-e8c5-beab-e773c1d57b43	00160000-566a-e8c4-8f58-a38b41ddf0e4	00090000-566a-e8c5-79ff-a4e43a0d9dec	apri	14	t
003d0000-566a-e8c5-55eb-72fbd363988c	00160000-566a-e8c4-f739-5df8f0f5d1cc	00090000-566a-e8c5-eb46-de6166e6732f	aizv	11	t
003d0000-566a-e8c5-277d-8e8eb3d85698	00160000-566a-e8c4-cd7c-a49ce1591567	00090000-566a-e8c5-7a97-f657b9c59049	aizv	12	t
003d0000-566a-e8c5-1b6b-248dd0cc3ba0	00160000-566a-e8c4-8f58-a38b41ddf0e4	00090000-566a-e8c5-e99f-c5e83ef92b87	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 32044353)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-566a-e8c4-8f58-a38b41ddf0e4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-566a-e8c4-f739-5df8f0f5d1cc	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-566a-e8c4-cd7c-a49ce1591567	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 32044756)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32044097)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-566a-e8c5-df9a-0a2aad980ad8	\N	\N	00200000-566a-e8c5-04ce-56389419f893	\N	\N	\N	00220000-566a-e8c4-bb87-6d963c8c6df9	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-566a-e8c5-1dd1-a1136d5690bf	\N	\N	00200000-566a-e8c5-549f-0a6bb173de3d	\N	\N	\N	00220000-566a-e8c4-bb87-6d963c8c6df9	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-566a-e8c5-dbc0-5d1efa7bca64	\N	\N	00200000-566a-e8c5-1cb5-de1df7ebd39d	\N	\N	\N	00220000-566a-e8c4-abcc-4f61874f826b	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-566a-e8c5-90f3-a84c1cb3e825	\N	\N	00200000-566a-e8c5-ae0a-0f71c90a72f5	\N	\N	\N	00220000-566a-e8c4-d018-562443869df1	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-566a-e8c5-aa5f-1a1a11593b2c	\N	\N	00200000-566a-e8c5-dc29-37a2c52c2c0e	\N	\N	\N	00220000-566a-e8c4-6dbf-8ec730155151	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 32044129)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32044134)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32044678)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 32043994)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-566a-e8c2-9e7f-be2d9e28f2ed	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-566a-e8c2-b7ed-7cae8316cb57	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-566a-e8c2-c5c9-c3ee7b9b6ae3	AL	ALB	008	Albania 	Albanija	\N
00040000-566a-e8c2-482d-53f91145010c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-566a-e8c2-925c-0122074b0db0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-566a-e8c2-20de-db69a38008b2	AD	AND	020	Andorra 	Andora	\N
00040000-566a-e8c2-575d-9647d761eb65	AO	AGO	024	Angola 	Angola	\N
00040000-566a-e8c2-4042-613effb28506	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-566a-e8c2-f76e-8a2d73270add	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-566a-e8c2-b161-7fe788b0a4da	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-566a-e8c2-cf86-986104681aec	AR	ARG	032	Argentina 	Argenitna	\N
00040000-566a-e8c2-b03d-f473d91b8f19	AM	ARM	051	Armenia 	Armenija	\N
00040000-566a-e8c2-692a-370b3950d048	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-566a-e8c2-14b3-e522ed773b7b	AU	AUS	036	Australia 	Avstralija	\N
00040000-566a-e8c2-cc84-9f9aea6b3285	AT	AUT	040	Austria 	Avstrija	\N
00040000-566a-e8c2-1a93-4e67f021d80f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-566a-e8c2-d56d-28a801810dce	BS	BHS	044	Bahamas 	Bahami	\N
00040000-566a-e8c2-7d17-806e20f42854	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-566a-e8c2-3301-8350fa75f0b7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-566a-e8c2-8d71-55728246b3b1	BB	BRB	052	Barbados 	Barbados	\N
00040000-566a-e8c2-de2b-c03c0ede0b04	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-566a-e8c2-be16-38010dcbf787	BE	BEL	056	Belgium 	Belgija	\N
00040000-566a-e8c2-46d6-fc14034d58db	BZ	BLZ	084	Belize 	Belize	\N
00040000-566a-e8c2-1f3b-e349863fb6eb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-566a-e8c2-1db5-55dea389999e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-566a-e8c2-4796-07b93bace15f	BT	BTN	064	Bhutan 	Butan	\N
00040000-566a-e8c2-1310-8aead078a50e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-566a-e8c2-75dd-caff62a3e597	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-566a-e8c2-3848-4bfad24c1457	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-566a-e8c2-ea5d-7ae3e575409e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-566a-e8c2-3f63-a9407e0847b9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-566a-e8c2-bacb-7c991e035b11	BR	BRA	076	Brazil 	Brazilija	\N
00040000-566a-e8c2-25c1-4c1cdd72dc4f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-566a-e8c2-5006-249ae3a232fc	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-566a-e8c2-518a-92af5665395b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-566a-e8c2-cb4e-73490fe28067	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-566a-e8c2-f569-761213a27dff	BI	BDI	108	Burundi 	Burundi 	\N
00040000-566a-e8c2-5a55-60453ca7308c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-566a-e8c2-4829-21bfb3241285	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-566a-e8c2-2258-8c9fe473fc62	CA	CAN	124	Canada 	Kanada	\N
00040000-566a-e8c2-596d-ac3a8160ded2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-566a-e8c2-4a29-1e860516a8a7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-566a-e8c2-cd05-7f3e2c992db0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-566a-e8c2-472a-c48ddab8db87	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-566a-e8c2-1ba4-4159c7e989e1	CL	CHL	152	Chile 	Čile	\N
00040000-566a-e8c2-b959-abd65dbc02df	CN	CHN	156	China 	Kitajska	\N
00040000-566a-e8c2-cf63-24c495b02b23	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-566a-e8c2-6225-b7c2ecf4e45b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-566a-e8c2-cb5d-a605d4a93b71	CO	COL	170	Colombia 	Kolumbija	\N
00040000-566a-e8c2-1049-3846302697eb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-566a-e8c2-7f9e-80900c55d052	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-566a-e8c2-ef60-192ed2d4fb92	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-566a-e8c2-76dc-0890579d0af8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-566a-e8c2-9510-85cfd772b494	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-566a-e8c2-7641-7ce6ab2938e5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-566a-e8c2-d58b-24136cc7aa3b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-566a-e8c2-ca08-d5447fab0c73	CU	CUB	192	Cuba 	Kuba	\N
00040000-566a-e8c2-0622-feff5d975b9c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-566a-e8c2-a615-ee733bfdb198	CY	CYP	196	Cyprus 	Ciper	\N
00040000-566a-e8c2-c5f0-d5ca8f045f46	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-566a-e8c2-0de4-bb2957dd7719	DK	DNK	208	Denmark 	Danska	\N
00040000-566a-e8c2-7fa4-e46490f6aa1c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-566a-e8c2-64a9-3cd7aa8b29a9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-566a-e8c2-9a42-8f6118a46fac	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-566a-e8c2-7cec-76f019682975	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-566a-e8c2-8ec3-a36612fc36c8	EG	EGY	818	Egypt 	Egipt	\N
00040000-566a-e8c2-b2f3-f8677ed88b47	SV	SLV	222	El Salvador 	Salvador	\N
00040000-566a-e8c2-1811-06f5ce72e62c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-566a-e8c2-0517-fac66903ec55	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-566a-e8c2-3dd1-335128e61016	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-566a-e8c2-8c08-f41867058518	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-566a-e8c2-dd67-6a73efdce3cd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-566a-e8c2-c852-94f54012aea5	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-566a-e8c2-15da-77028dd9427d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-566a-e8c2-0eb4-6acac2601179	FI	FIN	246	Finland 	Finska	\N
00040000-566a-e8c2-233f-c2e531b2c611	FR	FRA	250	France 	Francija	\N
00040000-566a-e8c2-e14d-07427b774fd2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-566a-e8c2-8902-d383c4722550	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-566a-e8c2-c782-5591abd9a75d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-566a-e8c2-02c7-8e56f3b3347f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-566a-e8c2-65b2-7398e73db56d	GA	GAB	266	Gabon 	Gabon	\N
00040000-566a-e8c2-2bc6-d36191d1e608	GM	GMB	270	Gambia 	Gambija	\N
00040000-566a-e8c2-7240-6cdf9068f098	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-566a-e8c2-636f-ebd21001d07e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-566a-e8c2-8ff4-330efa7c572c	GH	GHA	288	Ghana 	Gana	\N
00040000-566a-e8c2-8f43-29cbb410d5ff	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-566a-e8c2-2ed2-42f76a5d27da	GR	GRC	300	Greece 	Grčija	\N
00040000-566a-e8c2-9c70-6788e3f6d32b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-566a-e8c2-b0e9-22098645608a	GD	GRD	308	Grenada 	Grenada	\N
00040000-566a-e8c2-66fe-0e9556ff76b5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-566a-e8c2-2fb4-984fffcb324f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-566a-e8c2-d97d-25aa9eb0263f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-566a-e8c2-0ab8-ced90f11097e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-566a-e8c2-9c51-61e89f41f1df	GN	GIN	324	Guinea 	Gvineja	\N
00040000-566a-e8c2-428f-d81277ffed64	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-566a-e8c2-384c-931ddc3aa6ca	GY	GUY	328	Guyana 	Gvajana	\N
00040000-566a-e8c2-f730-3410bf80c4a7	HT	HTI	332	Haiti 	Haiti	\N
00040000-566a-e8c2-7075-cc8ed37156bc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-566a-e8c2-2467-0643c80b36e4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-566a-e8c2-86c1-78e18330869b	HN	HND	340	Honduras 	Honduras	\N
00040000-566a-e8c2-b421-8be84e64f6fc	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-566a-e8c2-0f43-3eafb8f7fadb	HU	HUN	348	Hungary 	Madžarska	\N
00040000-566a-e8c2-ee81-c79c124cc1e2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-566a-e8c2-f86f-312fd817593e	IN	IND	356	India 	Indija	\N
00040000-566a-e8c2-494b-d64f7cb8fd32	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-566a-e8c2-0488-20ceacea89a0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-566a-e8c2-29ed-5ead574c3fee	IQ	IRQ	368	Iraq 	Irak	\N
00040000-566a-e8c2-b232-1c063965b29c	IE	IRL	372	Ireland 	Irska	\N
00040000-566a-e8c2-fe93-d4f9dcd8ee27	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-566a-e8c2-88f0-d18b377f237e	IL	ISR	376	Israel 	Izrael	\N
00040000-566a-e8c2-babd-9743375f5ed4	IT	ITA	380	Italy 	Italija	\N
00040000-566a-e8c2-7978-1ce98954425f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-566a-e8c2-923a-c62139488ff4	JP	JPN	392	Japan 	Japonska	\N
00040000-566a-e8c2-1fd4-86d75319d036	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-566a-e8c2-834b-40fcf7f38152	JO	JOR	400	Jordan 	Jordanija	\N
00040000-566a-e8c2-5d03-134de799f076	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-566a-e8c2-0e84-0b6665fa22f4	KE	KEN	404	Kenya 	Kenija	\N
00040000-566a-e8c2-8180-f7d9db777425	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-566a-e8c2-eab2-baf7037585b8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-566a-e8c2-4467-6486fb9fc051	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-566a-e8c2-d26b-4bb03ac786c6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-566a-e8c2-4fae-a2b3d0014535	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-566a-e8c2-7caa-fde7669a62c4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-566a-e8c2-ed72-945d61e2dc09	LV	LVA	428	Latvia 	Latvija	\N
00040000-566a-e8c2-ba4e-b809ab9f60e0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-566a-e8c2-219f-753a4d443959	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-566a-e8c2-fa48-835923716896	LR	LBR	430	Liberia 	Liberija	\N
00040000-566a-e8c2-e4e2-d64e4b4859df	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-566a-e8c2-06b8-ef76e238f37a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-566a-e8c2-c99a-6e2f6da14623	LT	LTU	440	Lithuania 	Litva	\N
00040000-566a-e8c2-2449-1e9c5239aefa	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-566a-e8c2-1c72-ba93020c6d9a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-566a-e8c2-bcc2-7f3846a2a4c3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-566a-e8c2-080f-fbc0d526053c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-566a-e8c2-bdea-f66ad2f44b83	MW	MWI	454	Malawi 	Malavi	\N
00040000-566a-e8c2-cf9d-25913ef59e10	MY	MYS	458	Malaysia 	Malezija	\N
00040000-566a-e8c2-3b52-f6c533882720	MV	MDV	462	Maldives 	Maldivi	\N
00040000-566a-e8c2-8573-0325cc4007df	ML	MLI	466	Mali 	Mali	\N
00040000-566a-e8c2-0fa8-45aa7644fd7c	MT	MLT	470	Malta 	Malta	\N
00040000-566a-e8c2-e807-62aff22fa855	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-566a-e8c2-9dd1-106dbfa55bd8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-566a-e8c2-7ae2-89f703cd43a6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-566a-e8c2-6267-bbaa1cb6da1d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-566a-e8c2-b4be-9f570b8e5df0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-566a-e8c2-c3f5-82aba2e56247	MX	MEX	484	Mexico 	Mehika	\N
00040000-566a-e8c2-358d-615815bb49b6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-566a-e8c2-e569-4f9d4461202a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-566a-e8c2-0daf-76f41d3875e9	MC	MCO	492	Monaco 	Monako	\N
00040000-566a-e8c2-cf7d-db1393a2d426	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-566a-e8c2-011f-616f14549296	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-566a-e8c2-01fa-142e838e1bdc	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-566a-e8c2-6cd0-2f4b02e859e9	MA	MAR	504	Morocco 	Maroko	\N
00040000-566a-e8c2-fb26-5f8bebd0121f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-566a-e8c2-02d9-8a37bd7fec83	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-566a-e8c2-31bf-4dd949021d43	NA	NAM	516	Namibia 	Namibija	\N
00040000-566a-e8c2-cbc8-1e2061842f62	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-566a-e8c2-bf06-9f70ac49355c	NP	NPL	524	Nepal 	Nepal	\N
00040000-566a-e8c2-230b-c216238a9f60	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-566a-e8c2-1484-c10e8f05a04f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-566a-e8c2-207e-ffa042597273	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-566a-e8c2-9f91-583adef3f799	NE	NER	562	Niger 	Niger 	\N
00040000-566a-e8c2-5a00-089d1496c99b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-566a-e8c2-5a9d-f2e8e03fc5f3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-566a-e8c2-573c-edaa1859a2d6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-566a-e8c2-bc67-782af5cff0ab	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-566a-e8c2-b00a-2ca17681d7c4	NO	NOR	578	Norway 	Norveška	\N
00040000-566a-e8c2-c1ce-dd4b087badcd	OM	OMN	512	Oman 	Oman	\N
00040000-566a-e8c2-4926-cf9e58ee2258	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-566a-e8c2-0664-fe1453a20141	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-566a-e8c2-7865-87bed65fd750	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-566a-e8c2-df81-815d91200ce7	PA	PAN	591	Panama 	Panama	\N
00040000-566a-e8c2-3c94-af120e3c974a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-566a-e8c2-3e5a-536156c5e60b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-566a-e8c2-e3dc-1a2987e4cdef	PE	PER	604	Peru 	Peru	\N
00040000-566a-e8c2-a5fa-78e6577277f4	PH	PHL	608	Philippines 	Filipini	\N
00040000-566a-e8c2-04ce-bbfc52ce35c0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-566a-e8c2-2517-0a4e3d410f32	PL	POL	616	Poland 	Poljska	\N
00040000-566a-e8c2-3bc6-d0b11c5636b9	PT	PRT	620	Portugal 	Portugalska	\N
00040000-566a-e8c2-4250-555129b17431	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-566a-e8c2-6274-5d8b07ffd878	QA	QAT	634	Qatar 	Katar	\N
00040000-566a-e8c2-14d0-132b134a1795	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-566a-e8c2-1829-349a883fd4c4	RO	ROU	642	Romania 	Romunija	\N
00040000-566a-e8c2-6545-aeb164fd6d13	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-566a-e8c2-cc4d-1d80c5343822	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-566a-e8c2-919f-03fc32f2bb07	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-566a-e8c2-2f60-6ae6bf51c891	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-566a-e8c2-902d-0a57ed379112	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-566a-e8c2-3a33-5b37b21f47c8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-566a-e8c2-e0dc-72b4754d9627	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-566a-e8c2-31de-305c30384afe	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-566a-e8c2-9546-8d698a8aa41e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-566a-e8c2-cee2-cf458e4d66cf	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-566a-e8c2-4def-5c28c156de8e	SM	SMR	674	San Marino 	San Marino	\N
00040000-566a-e8c2-0a74-aa707fa242d6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-566a-e8c2-df32-5f3046e2c475	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-566a-e8c2-47f4-1d630fa075fe	SN	SEN	686	Senegal 	Senegal	\N
00040000-566a-e8c2-20ea-a8b24fb8fdc0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-566a-e8c2-c54c-68b920c7fb1a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-566a-e8c2-f4be-d761a066d008	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-566a-e8c2-c24d-9a666c4e81c0	SG	SGP	702	Singapore 	Singapur	\N
00040000-566a-e8c2-b81a-4abffc17c8cd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-566a-e8c2-ad41-b9d914486ad3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-566a-e8c2-6d3a-5b5b10d1fe6a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-566a-e8c2-1350-1c0d9573e6bf	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-566a-e8c2-7a3e-743b81b18f9c	SO	SOM	706	Somalia 	Somalija	\N
00040000-566a-e8c2-ffdf-9aeefeff7bdc	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-566a-e8c2-db7c-52401b4dce98	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-566a-e8c2-4f9e-98937eed9e65	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-566a-e8c2-ee3c-abea7a8cde43	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-566a-e8c2-22fd-35936cecac73	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-566a-e8c2-0d33-a880e7994e7a	SD	SDN	729	Sudan 	Sudan	\N
00040000-566a-e8c2-0bb7-9e9b08afd97a	SR	SUR	740	Suriname 	Surinam	\N
00040000-566a-e8c2-f470-0c06175abf7e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-566a-e8c2-8a43-ce04a8da6c1c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-566a-e8c2-da0f-f91062914226	SE	SWE	752	Sweden 	Švedska	\N
00040000-566a-e8c2-2f4b-115dcf2a99c0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-566a-e8c2-f6bb-988cb267fd86	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-566a-e8c2-eb39-babba8bb8c48	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-566a-e8c2-62bf-a533bb471a2a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-566a-e8c2-da91-3c50f0e56d64	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-566a-e8c2-bf86-98ffa8ff2095	TH	THA	764	Thailand 	Tajska	\N
00040000-566a-e8c2-e421-17e8c681369f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-566a-e8c2-a50c-8e32f0d03443	TG	TGO	768	Togo 	Togo	\N
00040000-566a-e8c2-c3e3-375ca0be0df1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-566a-e8c2-bceb-4636d3e91326	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-566a-e8c2-c15a-d3ee1068d85c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-566a-e8c2-8d87-37a926cc9804	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-566a-e8c2-7c0b-e4fc04784058	TR	TUR	792	Turkey 	Turčija	\N
00040000-566a-e8c2-206e-b0109d071836	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-566a-e8c2-6a0e-0c989827a004	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-566a-e8c2-493f-9bd22dd2dbc7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-566a-e8c2-a182-65dad12c2fe1	UG	UGA	800	Uganda 	Uganda	\N
00040000-566a-e8c2-46dd-874972523489	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-566a-e8c2-e8bf-0d1d871cbb8c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-566a-e8c2-ebf6-67265a75c00a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-566a-e8c2-2410-a6b84c38ffca	US	USA	840	United States 	Združene države Amerike	\N
00040000-566a-e8c2-68ce-b4e63996c399	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-566a-e8c2-5c7d-6beeff50f168	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-566a-e8c2-ea65-86c1951a67b0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-566a-e8c2-7fb4-b467d605195f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-566a-e8c2-7c6c-987c8da39a82	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-566a-e8c2-bcb2-cd3987b2e35a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-566a-e8c2-1b2d-7d374862ca89	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-566a-e8c2-7ed6-d51798a9dd7a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-566a-e8c2-145b-ab9b79da56e1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-566a-e8c2-65e2-a0c8cdd77f7d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-566a-e8c2-633d-02b4424efd4d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-566a-e8c2-54be-8a6f4dbd9250	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-566a-e8c2-034f-e537c7e70a00	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 32044476)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-566a-e8c5-4b61-cba6b2444a72	000e0000-566a-e8c5-c781-f78442dec5e7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566a-e8c2-149c-5d46926ab2f6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-566a-e8c5-563b-5df9e8ddc418	000e0000-566a-e8c5-80fc-447b875b0e16	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566a-e8c2-9839-e6b1e44ae000	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-566a-e8c5-59d6-af8f2391e838	000e0000-566a-e8c5-c775-ada7059e09e4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566a-e8c2-149c-5d46926ab2f6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-566a-e8c5-f7ab-292f50d4747e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-566a-e8c5-c687-b6211a178e87	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 32044277)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-566a-e8c5-c489-899b324dd707	000e0000-566a-e8c5-80fc-447b875b0e16	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-566a-e8c2-b8ac-223865c067a2
000d0000-566a-e8c5-75dd-2e42e4c0b72b	000e0000-566a-e8c5-80fc-447b875b0e16	000c0000-566a-e8c5-d2c6-e58a05a2e6fd	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-566a-e8c2-b8ac-223865c067a2
000d0000-566a-e8c5-7ec5-b5b33bf2cb00	000e0000-566a-e8c5-80fc-447b875b0e16	000c0000-566a-e8c5-ed78-be20eb5d4800	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-566a-e8c2-3219-6e38eb5e9b42
000d0000-566a-e8c5-c5ce-0e09fde2c2d9	000e0000-566a-e8c5-80fc-447b875b0e16	000c0000-566a-e8c5-f273-8409bf490d8b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-566a-e8c2-6da5-1eb42cbab2df
000d0000-566a-e8c5-31e5-1441bf566d53	000e0000-566a-e8c5-80fc-447b875b0e16	000c0000-566a-e8c5-9eb6-6df5c429d6b9	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-566a-e8c2-435c-e9d90b8ed08f
000d0000-566a-e8c5-21f6-3640ef6ab547	000e0000-566a-e8c5-80fc-447b875b0e16	000c0000-566a-e8c5-8831-342fdab11db8	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-566a-e8c2-435c-e9d90b8ed08f
000d0000-566a-e8c5-5241-f5b148a6df37	000e0000-566a-e8c5-80fc-447b875b0e16	000c0000-566a-e8c5-6511-42fb3d7b7d6d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-566a-e8c2-b8ac-223865c067a2
000d0000-566a-e8c5-e39a-3d5a532f5e75	000e0000-566a-e8c5-80fc-447b875b0e16	000c0000-566a-e8c5-6d7a-eba0936d9be9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-566a-e8c2-a864-28c4c768f067
000d0000-566a-e8c5-1f17-dff4eea985c4	000e0000-566a-e8c5-80fc-447b875b0e16	000c0000-566a-e8c5-fa04-2686f688d914	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-566a-e8c2-799a-c5a8a0fe1fa4
\.


--
-- TOC entry 3124 (class 0 OID 32044068)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 32044034)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 32044011)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-566a-e8c5-eb56-22c75620eafe	00080000-566a-e8c5-694b-a8ee323392d4	00090000-566a-e8c5-74d2-8801f2fe6f2e	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 32044191)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 32044736)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-566a-e8c5-0b53-42709fc4ce7b	00010000-566a-e8c3-b85f-dc3a19697f78	\N	Prva mapa	Root mapa	2015-12-11 16:16:21	2015-12-11 16:16:21	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 32044749)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32044771)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 32028295)
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
\.


--
-- TOC entry 3140 (class 0 OID 32044216)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 32043968)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-566a-e8c3-d644-ed1c414f05e9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-566a-e8c3-b9ec-b6567cdc7a45	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-566a-e8c3-f180-14307a88d179	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-566a-e8c3-3cab-75c80ca0260b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-566a-e8c3-8091-bad7d0d9bc22	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-566a-e8c3-c493-72c0178d3f92	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-566a-e8c3-1232-305bfa934bfb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-566a-e8c3-1d1b-f0f87fc9acaf	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-566a-e8c3-6931-99b2b68cc7df	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-566a-e8c3-161f-35684d52bb81	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-566a-e8c3-c820-8fea56a1af69	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-566a-e8c3-eaf5-01da444b4454	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-566a-e8c3-70e6-b91ceaec1404	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-566a-e8c3-0829-6d959e04dc5c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-566a-e8c4-1378-050747da4169	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-566a-e8c4-742d-3304919cf4de	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-566a-e8c4-eba2-d9778490709a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-566a-e8c4-30d0-bc85ab9dfdbc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-566a-e8c4-f3a6-191c44ef6bcd	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-566a-e8c7-8fe2-e8e7c56febde	application.tenant.maticnopodjetje	string	s:36:"00080000-566a-e8c7-8bee-58b4ef0ea4fa";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 32043868)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-566a-e8c4-8e33-197e2c16530b	00000000-566a-e8c4-1378-050747da4169	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-566a-e8c4-68d2-cdbf69d8019f	00000000-566a-e8c4-1378-050747da4169	00010000-566a-e8c3-b85f-dc3a19697f78	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-566a-e8c4-7c80-221bddeadcfe	00000000-566a-e8c4-742d-3304919cf4de	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 32043935)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-566a-e8c5-31df-85cfb48f5c28	\N	00100000-566a-e8c5-8959-68c01374e91d	00100000-566a-e8c5-d782-bf21602ea4d6	01	Gledališče Nimbis
00410000-566a-e8c5-fb99-b059bfe4de53	00410000-566a-e8c5-31df-85cfb48f5c28	00100000-566a-e8c5-8959-68c01374e91d	00100000-566a-e8c5-d782-bf21602ea4d6	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 32043879)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-566a-e8c5-26f0-0424381b7030	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-566a-e8c5-fbea-47dfc1e7fa1b	00010000-566a-e8c5-0771-f698901f98cb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-566a-e8c5-7909-3c2f83a35860	00010000-566a-e8c5-cc46-b5cbea27854d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-566a-e8c5-0fa1-e0fc51b6f5d5	00010000-566a-e8c5-cb33-cae22c03eeb0	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-566a-e8c5-e163-dbd9fb2f23e2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-566a-e8c5-42ad-98d49f386458	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-566a-e8c5-495a-e317bbe134e4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-566a-e8c5-872e-2fa3ee13b530	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-566a-e8c5-74d2-8801f2fe6f2e	00010000-566a-e8c5-e7d6-39ae25ca6b04	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-566a-e8c5-1b1a-7bed385b2d3c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-566a-e8c5-d155-98f74cb57406	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-566a-e8c5-d997-e5b571a5e983	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-566a-e8c5-cb82-23f5ab4cfc5a	00010000-566a-e8c5-81ea-235458c51931	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-566a-e8c5-9cb2-8ce468084660	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-566a-e8c5-79ff-a4e43a0d9dec	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-566a-e8c5-eb46-de6166e6732f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-566a-e8c5-7a97-f657b9c59049	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-566a-e8c5-e99f-c5e83ef92b87	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-566a-e8c5-9ad7-faf7aa5a96ae	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-566a-e8c5-9c76-ec5b4debba07	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-566a-e8c5-98e9-e7f1e02f1d55	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 32043814)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-566a-e8c2-66ca-97b817ede893	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-566a-e8c2-684b-796880afaa9b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-566a-e8c2-de51-c7bf72eaef9d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-566a-e8c2-78ff-f9e72dafec99	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-566a-e8c2-4427-eb9a0b1c1230	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-566a-e8c2-1b4c-5f1d0ac898fd	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-566a-e8c2-bf97-64d05b362e77	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-566a-e8c2-f3df-67ee5a2a87e2	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-566a-e8c2-3c04-2530b7a86ea1	Abonma-read	Abonma - branje	t
00030000-566a-e8c2-c0df-aaed42719aa4	Abonma-write	Abonma - spreminjanje	t
00030000-566a-e8c2-9ab6-21def9c7b261	Alternacija-read	Alternacija - branje	t
00030000-566a-e8c2-7b05-b9158054fd2e	Alternacija-write	Alternacija - spreminjanje	t
00030000-566a-e8c2-bae0-703571570798	Arhivalija-read	Arhivalija - branje	t
00030000-566a-e8c2-eb67-47bda4dcdda4	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-566a-e8c2-2297-aaae56214f90	AuthStorage-read	AuthStorage - branje	t
00030000-566a-e8c2-3663-11362471cd8c	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-566a-e8c2-7cf7-af17e9708106	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-566a-e8c2-163b-0417f29c5e1d	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-566a-e8c2-063b-28ca331af12a	Besedilo-read	Besedilo - branje	t
00030000-566a-e8c2-1c42-bb72171659c1	Besedilo-write	Besedilo - spreminjanje	t
00030000-566a-e8c2-8eba-7071cc01ae84	Dogodek-read	Dogodek - branje	t
00030000-566a-e8c2-8397-bf4810de88f5	Dogodek-write	Dogodek - spreminjanje	t
00030000-566a-e8c2-7001-c87d67da16e2	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-566a-e8c2-13b0-38e8e43db597	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-566a-e8c2-ebd5-ceeb1efa3137	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-566a-e8c2-8ebe-7bbb7a24d080	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-566a-e8c2-cfda-335da367fa62	DogodekTrait-read	DogodekTrait - branje	t
00030000-566a-e8c2-eab8-da34b413bbe2	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-566a-e8c2-2f3a-538472767a10	DrugiVir-read	DrugiVir - branje	t
00030000-566a-e8c2-c939-6ec1c69469b5	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-566a-e8c2-30c1-e9d3fecf0761	Drzava-read	Drzava - branje	t
00030000-566a-e8c2-13f2-74cbaf6ff36a	Drzava-write	Drzava - spreminjanje	t
00030000-566a-e8c2-cc1c-83c39edb39c0	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-566a-e8c2-d20f-6cb0c92d21fe	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-566a-e8c2-0368-f402f96c5972	Funkcija-read	Funkcija - branje	t
00030000-566a-e8c2-0d60-8734a999abc7	Funkcija-write	Funkcija - spreminjanje	t
00030000-566a-e8c2-3323-97f689c7e6ac	Gostovanje-read	Gostovanje - branje	t
00030000-566a-e8c2-2fc7-fa6d73fc42d6	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-566a-e8c2-59e6-b3d03c63ddc3	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-566a-e8c2-8948-d42ce3525c38	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-566a-e8c2-b290-3170e8a42b01	Kupec-read	Kupec - branje	t
00030000-566a-e8c2-63e8-c23cc37c105f	Kupec-write	Kupec - spreminjanje	t
00030000-566a-e8c2-878a-585fbbb13b41	NacinPlacina-read	NacinPlacina - branje	t
00030000-566a-e8c2-421e-ab32a2b111e5	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-566a-e8c2-3fe7-bad6a6b6b06c	Option-read	Option - branje	t
00030000-566a-e8c2-6b7f-cd1ac00ee9ac	Option-write	Option - spreminjanje	t
00030000-566a-e8c2-c3af-7f327772b3a0	OptionValue-read	OptionValue - branje	t
00030000-566a-e8c2-a3fe-4f586d0659c0	OptionValue-write	OptionValue - spreminjanje	t
00030000-566a-e8c2-d5ab-51c1bca5a3ee	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-566a-e8c2-dd41-d6b860b0400c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-566a-e8c2-613c-becf40da8f85	Oseba-read	Oseba - branje	t
00030000-566a-e8c2-4d4c-cdf11bde7982	Oseba-write	Oseba - spreminjanje	t
00030000-566a-e8c2-1533-c3efc4cc2a88	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-566a-e8c2-cd40-68c33f791e3f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-566a-e8c2-b53f-886e036fa509	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-566a-e8c2-667d-acf0d08e476a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-566a-e8c2-4e41-0bc04193b8f9	Pogodba-read	Pogodba - branje	t
00030000-566a-e8c2-15ee-74a30a4f25a2	Pogodba-write	Pogodba - spreminjanje	t
00030000-566a-e8c2-07d1-10bcc9a6b6ed	Popa-read	Popa - branje	t
00030000-566a-e8c2-cc9e-28d2f428afbb	Popa-write	Popa - spreminjanje	t
00030000-566a-e8c2-1034-d37c888a7f2b	Posta-read	Posta - branje	t
00030000-566a-e8c2-b02a-45ca4f1b61d8	Posta-write	Posta - spreminjanje	t
00030000-566a-e8c2-54e0-dfc7e8cdcd64	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-566a-e8c2-446d-ed82259813a1	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-566a-e8c2-49e3-68cc453a3fec	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-566a-e8c2-16c8-112a525a2e92	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-566a-e8c2-ef91-3e1c1cf5c2ca	PostniNaslov-read	PostniNaslov - branje	t
00030000-566a-e8c2-c92b-5e676a3c94da	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-566a-e8c2-e651-8e090fe13f0c	Praznik-read	Praznik - branje	t
00030000-566a-e8c2-6470-24b3b2f9133a	Praznik-write	Praznik - spreminjanje	t
00030000-566a-e8c2-7c9f-9d2c0293af00	Predstava-read	Predstava - branje	t
00030000-566a-e8c2-ffcd-4f6b179f7e57	Predstava-write	Predstava - spreminjanje	t
00030000-566a-e8c2-a9fc-0e5e82b68833	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-566a-e8c2-0145-11849a36c20e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-566a-e8c2-51b4-bceed9a41043	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-566a-e8c2-75d7-68e8993ebdd3	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-566a-e8c2-c72f-424436ec1cea	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-566a-e8c2-ec4a-748388793629	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-566a-e8c2-2388-0e37eb56b874	ProgramDela-read	ProgramDela - branje	t
00030000-566a-e8c2-b80e-af5baffaf838	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-566a-e8c2-56da-42b8af7e1973	ProgramFestival-read	ProgramFestival - branje	t
00030000-566a-e8c2-af0e-1cb14fe551c6	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-566a-e8c2-4876-e6e96232c065	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-566a-e8c2-6543-c394ba5dc9c0	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-566a-e8c2-4620-914d3f784a5e	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-566a-e8c2-86b7-00f14b40aa49	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-566a-e8c2-3dff-01b48ae1ad5f	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-566a-e8c2-106f-dac5c68dfa6a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-566a-e8c2-45e1-0c4e737fcd97	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-566a-e8c2-f755-14f2d926beeb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-566a-e8c2-cd05-d80af82a98e0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-566a-e8c2-0ad0-1d9c82d8ee7d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-566a-e8c2-3d06-21ba950a659f	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-566a-e8c2-4cae-15df867a19ba	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-566a-e8c2-c445-9cf1ceb279c1	ProgramRazno-read	ProgramRazno - branje	t
00030000-566a-e8c2-8061-019944de7e30	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-566a-e8c2-9bf9-2798bf384691	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-566a-e8c2-e3fa-4d9c79f12265	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-566a-e8c2-991d-acc04bf0cdf0	Prostor-read	Prostor - branje	t
00030000-566a-e8c2-6d1d-fe417801b04b	Prostor-write	Prostor - spreminjanje	t
00030000-566a-e8c2-08d4-f75533cd456e	Racun-read	Racun - branje	t
00030000-566a-e8c2-1bf8-61631a74e2a8	Racun-write	Racun - spreminjanje	t
00030000-566a-e8c2-3c99-94b8dc9232c9	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-566a-e8c2-fdea-04a225fcdce2	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-566a-e8c2-cfdc-bed6331e992b	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-566a-e8c2-e9b6-3bb3e0f2325f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-566a-e8c2-6cdb-21485e85ce00	Rekvizit-read	Rekvizit - branje	t
00030000-566a-e8c2-d250-23b81ecc3830	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-566a-e8c2-8786-8559e639a88b	Revizija-read	Revizija - branje	t
00030000-566a-e8c2-41cf-1b72d7266c0a	Revizija-write	Revizija - spreminjanje	t
00030000-566a-e8c2-5eb2-2c4fe026ecdd	Rezervacija-read	Rezervacija - branje	t
00030000-566a-e8c2-b49b-0d88a805fc07	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-566a-e8c2-03bb-35019d3c85d9	SedezniRed-read	SedezniRed - branje	t
00030000-566a-e8c2-e4cc-d031b4960d20	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-566a-e8c2-6e78-cf5069d6f3ce	Sedez-read	Sedez - branje	t
00030000-566a-e8c2-a0c9-506085f27940	Sedez-write	Sedez - spreminjanje	t
00030000-566a-e8c2-bb3e-c32b068e9ae8	Sezona-read	Sezona - branje	t
00030000-566a-e8c2-ae76-e316f2b6998b	Sezona-write	Sezona - spreminjanje	t
00030000-566a-e8c2-af15-dee3ddb7a5ef	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-566a-e8c2-765b-0335458a69d5	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-566a-e8c2-87c3-6c8bfb01ffba	Telefonska-read	Telefonska - branje	t
00030000-566a-e8c2-1846-5ef4f9aef89d	Telefonska-write	Telefonska - spreminjanje	t
00030000-566a-e8c2-aedb-afea06d46315	TerminStoritve-read	TerminStoritve - branje	t
00030000-566a-e8c2-f419-50571a030e9a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-566a-e8c2-7ac7-21ae51a60b39	TipFunkcije-read	TipFunkcije - branje	t
00030000-566a-e8c2-7749-7f8f588075f0	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-566a-e8c2-84ee-6522dc56b887	TipPopa-read	TipPopa - branje	t
00030000-566a-e8c2-611c-b7136d48c7f8	TipPopa-write	TipPopa - spreminjanje	t
00030000-566a-e8c2-df46-7da3ab09b338	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-566a-e8c2-2f57-f16758f062ef	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-566a-e8c2-7446-b432c8782598	TipVaje-read	TipVaje - branje	t
00030000-566a-e8c2-0bf7-1ef23904773a	TipVaje-write	TipVaje - spreminjanje	t
00030000-566a-e8c2-25f9-971f9d3a584d	Trr-read	Trr - branje	t
00030000-566a-e8c2-6a48-20ee1b5f7c83	Trr-write	Trr - spreminjanje	t
00030000-566a-e8c2-8e0d-a9d577b566f4	Uprizoritev-read	Uprizoritev - branje	t
00030000-566a-e8c2-d578-f7c94a3b441d	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-566a-e8c2-09f9-49d90ca27c5d	Vaja-read	Vaja - branje	t
00030000-566a-e8c2-477f-672b188e3101	Vaja-write	Vaja - spreminjanje	t
00030000-566a-e8c2-8ce9-6cdfbd2080f6	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-566a-e8c2-6e7f-7fde79362f4e	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-566a-e8c2-0162-12eae12adf57	VrstaStroska-read	VrstaStroska - branje	t
00030000-566a-e8c2-567a-b284ff9e3881	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-566a-e8c2-a612-19755314847c	Zaposlitev-read	Zaposlitev - branje	t
00030000-566a-e8c2-8d28-57e792ec8a9f	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-566a-e8c2-2c24-ed7046698fe3	Zasedenost-read	Zasedenost - branje	t
00030000-566a-e8c2-f3dc-e3e3207cfc3b	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-566a-e8c2-42c4-d7e2ec23858c	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-566a-e8c2-e539-5f46f4f2b9e3	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-566a-e8c2-3c24-55daa41e6003	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-566a-e8c2-3edf-134b12fe1f68	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-566a-e8c2-c5c8-13a253e8c3de	Job-read	Branje opravil - samo zase - branje	t
00030000-566a-e8c2-2d06-59fbce42f071	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-566a-e8c2-0eb7-154cc045bc16	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-566a-e8c2-a15a-0c1d14df8a4c	Report-read	Report - branje	t
00030000-566a-e8c2-3356-0ca87a175edf	Report-write	Report - spreminjanje	t
00030000-566a-e8c2-3616-84d86ac534b3	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-566a-e8c2-1966-0602edc7b461	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-566a-e8c2-751c-9c2c68e653a8	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-566a-e8c2-b1e7-688f7530a6d2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-566a-e8c2-b2dd-55f35b97a4a3	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-566a-e8c2-be10-af119f1f0d7b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-566a-e8c2-dfde-2e6d0f87dd0e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-566a-e8c2-302a-6a301e575ede	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-566a-e8c2-6c92-544dbbc90b2f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-566a-e8c2-fb84-8ff4ff0c7c75	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-566a-e8c2-ec50-c6890c0859f1	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-566a-e8c2-d993-2863b51d5e3d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-566a-e8c2-e3b4-8c9edfc0aec5	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-566a-e8c2-1cb2-ba10fca5dcf3	Datoteka-write	Datoteka - spreminjanje	t
00030000-566a-e8c2-744e-0965eb59bc9a	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 32043833)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-566a-e8c3-df0e-b61ed8b428ee	00030000-566a-e8c2-684b-796880afaa9b
00020000-566a-e8c3-df0e-b61ed8b428ee	00030000-566a-e8c2-66ca-97b817ede893
00020000-566a-e8c3-b998-b41abe1ecf8d	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-163b-0417f29c5e1d
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-1c42-bb72171659c1
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-7cf7-af17e9708106
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-063b-28ca331af12a
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-cc7f-c35d9f491a09	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-3bb0-728f8aa81923	00030000-566a-e8c2-7cf7-af17e9708106
00020000-566a-e8c3-3bb0-728f8aa81923	00030000-566a-e8c2-063b-28ca331af12a
00020000-566a-e8c3-3bb0-728f8aa81923	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-3bb0-728f8aa81923	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-3bb0-728f8aa81923	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-582b-736903a29987	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c3-582b-736903a29987	00030000-566a-e8c2-8d28-57e792ec8a9f
00020000-566a-e8c3-582b-736903a29987	00030000-566a-e8c2-1b4c-5f1d0ac898fd
00020000-566a-e8c3-582b-736903a29987	00030000-566a-e8c2-4427-eb9a0b1c1230
00020000-566a-e8c3-582b-736903a29987	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-582b-736903a29987	00030000-566a-e8c2-4d4c-cdf11bde7982
00020000-566a-e8c3-582b-736903a29987	00030000-566a-e8c2-d5ab-51c1bca5a3ee
00020000-566a-e8c3-7d29-9575aa17912c	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c3-7d29-9575aa17912c	00030000-566a-e8c2-1b4c-5f1d0ac898fd
00020000-566a-e8c3-7d29-9575aa17912c	00030000-566a-e8c2-d5ab-51c1bca5a3ee
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-4d4c-cdf11bde7982
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-c92b-5e676a3c94da
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-87c3-6c8bfb01ffba
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-1846-5ef4f9aef89d
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-efe7-3a6431940d39	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c3-37a3-0a8edf13458c	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-37a3-0a8edf13458c	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-37a3-0a8edf13458c	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c3-37a3-0a8edf13458c	00030000-566a-e8c2-87c3-6c8bfb01ffba
00020000-566a-e8c3-37a3-0a8edf13458c	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-37a3-0a8edf13458c	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-37a3-0a8edf13458c	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-38d7-38b12de656d4	00030000-566a-e8c2-4d4c-cdf11bde7982
00020000-566a-e8c3-38d7-38b12de656d4	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-38d7-38b12de656d4	00030000-566a-e8c2-1b4c-5f1d0ac898fd
00020000-566a-e8c3-38d7-38b12de656d4	00030000-566a-e8c2-4427-eb9a0b1c1230
00020000-566a-e8c3-38d7-38b12de656d4	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c3-38d7-38b12de656d4	00030000-566a-e8c2-6a48-20ee1b5f7c83
00020000-566a-e8c3-38d7-38b12de656d4	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-22d9-7aa1ac33ad39	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-22d9-7aa1ac33ad39	00030000-566a-e8c2-1b4c-5f1d0ac898fd
00020000-566a-e8c3-22d9-7aa1ac33ad39	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c3-22d9-7aa1ac33ad39	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-87c3-6c8bfb01ffba
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-59e6-b3d03c63ddc3
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-1846-5ef4f9aef89d
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-c92b-5e676a3c94da
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-6a48-20ee1b5f7c83
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-cc9e-28d2f428afbb
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-8948-d42ce3525c38
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-ec4a-748388793629
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-b8d1-bdaeec3908dc	00030000-566a-e8c2-84ee-6522dc56b887
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-87c3-6c8bfb01ffba
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-59e6-b3d03c63ddc3
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-2cd1-076ead35536b	00030000-566a-e8c2-84ee-6522dc56b887
00020000-566a-e8c3-72ab-5fcea43324fe	00030000-566a-e8c2-84ee-6522dc56b887
00020000-566a-e8c3-72ab-5fcea43324fe	00030000-566a-e8c2-611c-b7136d48c7f8
00020000-566a-e8c3-9f0b-69dc32562527	00030000-566a-e8c2-84ee-6522dc56b887
00020000-566a-e8c3-4868-72336129d3e7	00030000-566a-e8c2-1034-d37c888a7f2b
00020000-566a-e8c3-4868-72336129d3e7	00030000-566a-e8c2-b02a-45ca4f1b61d8
00020000-566a-e8c3-77bd-63502b62134e	00030000-566a-e8c2-1034-d37c888a7f2b
00020000-566a-e8c3-7e92-a56b27e1d800	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-7e92-a56b27e1d800	00030000-566a-e8c2-13f2-74cbaf6ff36a
00020000-566a-e8c3-da16-152d77d34463	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-7294-a2c73dd3ec40	00030000-566a-e8c2-3c24-55daa41e6003
00020000-566a-e8c3-7294-a2c73dd3ec40	00030000-566a-e8c2-3edf-134b12fe1f68
00020000-566a-e8c3-a942-5c7816733618	00030000-566a-e8c2-3c24-55daa41e6003
00020000-566a-e8c3-dee5-6485c8821199	00030000-566a-e8c2-42c4-d7e2ec23858c
00020000-566a-e8c3-dee5-6485c8821199	00030000-566a-e8c2-e539-5f46f4f2b9e3
00020000-566a-e8c3-cfcc-2d8e7c5420f8	00030000-566a-e8c2-42c4-d7e2ec23858c
00020000-566a-e8c3-57d8-e909a9195349	00030000-566a-e8c2-3c04-2530b7a86ea1
00020000-566a-e8c3-57d8-e909a9195349	00030000-566a-e8c2-c0df-aaed42719aa4
00020000-566a-e8c3-d016-8de7d71bcf3e	00030000-566a-e8c2-3c04-2530b7a86ea1
00020000-566a-e8c3-8bfb-24323bd4d81d	00030000-566a-e8c2-991d-acc04bf0cdf0
00020000-566a-e8c3-8bfb-24323bd4d81d	00030000-566a-e8c2-6d1d-fe417801b04b
00020000-566a-e8c3-8bfb-24323bd4d81d	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-8bfb-24323bd4d81d	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c3-8bfb-24323bd4d81d	00030000-566a-e8c2-c92b-5e676a3c94da
00020000-566a-e8c3-8bfb-24323bd4d81d	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-c45b-f3fa38a6330a	00030000-566a-e8c2-991d-acc04bf0cdf0
00020000-566a-e8c3-c45b-f3fa38a6330a	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-c45b-f3fa38a6330a	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c3-248c-8f721d29cae1	00030000-566a-e8c2-0162-12eae12adf57
00020000-566a-e8c3-248c-8f721d29cae1	00030000-566a-e8c2-567a-b284ff9e3881
00020000-566a-e8c3-6ec8-596935ce2427	00030000-566a-e8c2-0162-12eae12adf57
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-dd41-d6b860b0400c
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-d5ab-51c1bca5a3ee
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c3-634b-744bc7bc9b79	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-093f-f47e08636d12	00030000-566a-e8c2-d5ab-51c1bca5a3ee
00020000-566a-e8c3-093f-f47e08636d12	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c3-093f-f47e08636d12	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-093f-f47e08636d12	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-093f-f47e08636d12	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-9d81-57ec281138e2	00030000-566a-e8c2-7446-b432c8782598
00020000-566a-e8c3-9d81-57ec281138e2	00030000-566a-e8c2-0bf7-1ef23904773a
00020000-566a-e8c3-7776-38d0ab493c2e	00030000-566a-e8c2-7446-b432c8782598
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-bf97-64d05b362e77
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-f3df-67ee5a2a87e2
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-2388-0e37eb56b874
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-b80e-af5baffaf838
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-56da-42b8af7e1973
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-af0e-1cb14fe551c6
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-4876-e6e96232c065
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-6543-c394ba5dc9c0
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-4620-914d3f784a5e
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-86b7-00f14b40aa49
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-3dff-01b48ae1ad5f
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-106f-dac5c68dfa6a
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-45e1-0c4e737fcd97
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-f755-14f2d926beeb
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-cd05-d80af82a98e0
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-0ad0-1d9c82d8ee7d
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-3d06-21ba950a659f
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-4cae-15df867a19ba
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-c445-9cf1ceb279c1
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-8061-019944de7e30
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-9bf9-2798bf384691
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-e3fa-4d9c79f12265
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-75d7-68e8993ebdd3
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-c939-6ec1c69469b5
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-446d-ed82259813a1
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-2d06-59fbce42f071
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-2f3a-538472767a10
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-51b4-bceed9a41043
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-54e0-dfc7e8cdcd64
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-0162-12eae12adf57
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-af15-dee3ddb7a5ef
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-0368-f402f96c5972
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-9ab6-21def9c7b261
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-7ac7-21ae51a60b39
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-4e41-0bc04193b8f9
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-c5c8-13a253e8c3de
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-8cd0-6530eba85773	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-2388-0e37eb56b874
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-56da-42b8af7e1973
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-4876-e6e96232c065
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-4620-914d3f784a5e
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-3dff-01b48ae1ad5f
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-45e1-0c4e737fcd97
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-cd05-d80af82a98e0
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-3d06-21ba950a659f
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-c445-9cf1ceb279c1
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-9bf9-2798bf384691
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-51b4-bceed9a41043
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-2f3a-538472767a10
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-54e0-dfc7e8cdcd64
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-c5c8-13a253e8c3de
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-977f-103dc6f50dec	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-d578-f7c94a3b441d
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-9ab6-21def9c7b261
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-7b05-b9158054fd2e
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-063b-28ca331af12a
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-0368-f402f96c5972
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-0d60-8734a999abc7
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-7ac7-21ae51a60b39
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-88a3-cb1129d27a2f	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-9ab6-21def9c7b261
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-063b-28ca331af12a
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-0368-f402f96c5972
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-7ac7-21ae51a60b39
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c3-8717-db0a0987c33f	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-9ab6-21def9c7b261
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-7b05-b9158054fd2e
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-0368-f402f96c5972
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-1b4c-5f1d0ac898fd
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-4427-eb9a0b1c1230
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-4e41-0bc04193b8f9
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-15ee-74a30a4f25a2
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-af15-dee3ddb7a5ef
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-765b-0335458a69d5
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-7ac7-21ae51a60b39
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-f935-6ce3f4f0b18f	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-9ab6-21def9c7b261
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-0368-f402f96c5972
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-1b4c-5f1d0ac898fd
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-4e41-0bc04193b8f9
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-af15-dee3ddb7a5ef
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-7ac7-21ae51a60b39
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-d77e-782fa904266f	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c3-f593-8dea74dfb27e	00030000-566a-e8c2-af15-dee3ddb7a5ef
00020000-566a-e8c3-f593-8dea74dfb27e	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-f593-8dea74dfb27e	00030000-566a-e8c2-0368-f402f96c5972
00020000-566a-e8c3-f593-8dea74dfb27e	00030000-566a-e8c2-4e41-0bc04193b8f9
00020000-566a-e8c3-f593-8dea74dfb27e	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-f593-8dea74dfb27e	00030000-566a-e8c2-7ac7-21ae51a60b39
00020000-566a-e8c3-f593-8dea74dfb27e	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-e516-7bc88690f5f8	00030000-566a-e8c2-af15-dee3ddb7a5ef
00020000-566a-e8c3-e516-7bc88690f5f8	00030000-566a-e8c2-765b-0335458a69d5
00020000-566a-e8c3-e516-7bc88690f5f8	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-e516-7bc88690f5f8	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-f5a6-ef2950994063	00030000-566a-e8c2-af15-dee3ddb7a5ef
00020000-566a-e8c3-f5a6-ef2950994063	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-3c04-2530b7a86ea1
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-9ab6-21def9c7b261
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-7cf7-af17e9708106
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-163b-0417f29c5e1d
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-063b-28ca331af12a
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-1c42-bb72171659c1
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-0368-f402f96c5972
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-59e6-b3d03c63ddc3
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-d5ab-51c1bca5a3ee
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-4d4c-cdf11bde7982
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-1034-d37c888a7f2b
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-c92b-5e676a3c94da
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-991d-acc04bf0cdf0
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-87c3-6c8bfb01ffba
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-1846-5ef4f9aef89d
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-7ac7-21ae51a60b39
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-84ee-6522dc56b887
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-7446-b432c8782598
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-0162-12eae12adf57
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-42c4-d7e2ec23858c
00020000-566a-e8c3-3039-881886369ca5	00030000-566a-e8c2-3c24-55daa41e6003
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-66ca-97b817ede893
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-684b-796880afaa9b
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3c04-2530b7a86ea1
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-c0df-aaed42719aa4
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-9ab6-21def9c7b261
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-7b05-b9158054fd2e
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-bae0-703571570798
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-eb67-47bda4dcdda4
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-2297-aaae56214f90
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3663-11362471cd8c
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-7cf7-af17e9708106
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-163b-0417f29c5e1d
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-063b-28ca331af12a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-1c42-bb72171659c1
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8eba-7071cc01ae84
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-78ff-f9e72dafec99
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8397-bf4810de88f5
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-7001-c87d67da16e2
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-13b0-38e8e43db597
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-ebd5-ceeb1efa3137
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8ebe-7bbb7a24d080
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-2f3a-538472767a10
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-c939-6ec1c69469b5
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-30c1-e9d3fecf0761
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-13f2-74cbaf6ff36a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-cc1c-83c39edb39c0
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-d20f-6cb0c92d21fe
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-0368-f402f96c5972
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-0d60-8734a999abc7
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3323-97f689c7e6ac
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-2fc7-fa6d73fc42d6
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-0eb7-154cc045bc16
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-c5c8-13a253e8c3de
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-2d06-59fbce42f071
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-59e6-b3d03c63ddc3
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8948-d42ce3525c38
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-b290-3170e8a42b01
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-63e8-c23cc37c105f
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-1966-0602edc7b461
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-751c-9c2c68e653a8
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-b1e7-688f7530a6d2
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-b2dd-55f35b97a4a3
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-dfde-2e6d0f87dd0e
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-be10-af119f1f0d7b
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-878a-585fbbb13b41
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-421e-ab32a2b111e5
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3fe7-bad6a6b6b06c
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6b7f-cd1ac00ee9ac
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-c3af-7f327772b3a0
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-a3fe-4f586d0659c0
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-d5ab-51c1bca5a3ee
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-dd41-d6b860b0400c
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-4427-eb9a0b1c1230
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-4d4c-cdf11bde7982
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-1533-c3efc4cc2a88
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-cd40-68c33f791e3f
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-b53f-886e036fa509
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-667d-acf0d08e476a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-4e41-0bc04193b8f9
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-15ee-74a30a4f25a2
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-cc9e-28d2f428afbb
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-1034-d37c888a7f2b
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-b02a-45ca4f1b61d8
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-54e0-dfc7e8cdcd64
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-446d-ed82259813a1
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-49e3-68cc453a3fec
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-16c8-112a525a2e92
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-c92b-5e676a3c94da
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-e651-8e090fe13f0c
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6470-24b3b2f9133a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-7c9f-9d2c0293af00
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-ffcd-4f6b179f7e57
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-a9fc-0e5e82b68833
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-0145-11849a36c20e
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-51b4-bceed9a41043
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-75d7-68e8993ebdd3
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-c72f-424436ec1cea
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-ec4a-748388793629
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-bf97-64d05b362e77
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-2388-0e37eb56b874
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-f3df-67ee5a2a87e2
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-b80e-af5baffaf838
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-56da-42b8af7e1973
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-af0e-1cb14fe551c6
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-4876-e6e96232c065
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6543-c394ba5dc9c0
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-4620-914d3f784a5e
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-86b7-00f14b40aa49
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3dff-01b48ae1ad5f
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-106f-dac5c68dfa6a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-45e1-0c4e737fcd97
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-f755-14f2d926beeb
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-cd05-d80af82a98e0
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-0ad0-1d9c82d8ee7d
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3d06-21ba950a659f
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-4cae-15df867a19ba
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-c445-9cf1ceb279c1
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8061-019944de7e30
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-9bf9-2798bf384691
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-e3fa-4d9c79f12265
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-991d-acc04bf0cdf0
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6d1d-fe417801b04b
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-08d4-f75533cd456e
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-1bf8-61631a74e2a8
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3c99-94b8dc9232c9
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-fdea-04a225fcdce2
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6cdb-21485e85ce00
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-d250-23b81ecc3830
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-cfdc-bed6331e992b
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-e9b6-3bb3e0f2325f
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-a15a-0c1d14df8a4c
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3356-0ca87a175edf
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8786-8559e639a88b
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-41cf-1b72d7266c0a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-5eb2-2c4fe026ecdd
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-b49b-0d88a805fc07
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6e78-cf5069d6f3ce
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-a0c9-506085f27940
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-03bb-35019d3c85d9
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-e4cc-d031b4960d20
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-bb3e-c32b068e9ae8
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-ae76-e316f2b6998b
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3616-84d86ac534b3
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-af15-dee3ddb7a5ef
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-765b-0335458a69d5
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-87c3-6c8bfb01ffba
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-1846-5ef4f9aef89d
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-aedb-afea06d46315
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-de51-c7bf72eaef9d
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-f419-50571a030e9a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-7ac7-21ae51a60b39
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-7749-7f8f588075f0
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-84ee-6522dc56b887
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-611c-b7136d48c7f8
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-df46-7da3ab09b338
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-2f57-f16758f062ef
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-7446-b432c8782598
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-0bf7-1ef23904773a
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6a48-20ee1b5f7c83
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-d578-f7c94a3b441d
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-09f9-49d90ca27c5d
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-477f-672b188e3101
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8ce9-6cdfbd2080f6
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6e7f-7fde79362f4e
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-0162-12eae12adf57
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-567a-b284ff9e3881
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-e3b4-8c9edfc0aec5
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-d993-2863b51d5e3d
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-8d28-57e792ec8a9f
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-2c24-ed7046698fe3
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-f3dc-e3e3207cfc3b
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-42c4-d7e2ec23858c
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-e539-5f46f4f2b9e3
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3c24-55daa41e6003
00020000-566a-e8c5-f9b5-a68ddbc4b188	00030000-566a-e8c2-3edf-134b12fe1f68
00020000-566a-e8c5-ceea-6226b2238b79	00030000-566a-e8c2-ec50-c6890c0859f1
00020000-566a-e8c5-3191-c1889438f47f	00030000-566a-e8c2-fb84-8ff4ff0c7c75
00020000-566a-e8c5-e9f2-95fe0210f010	00030000-566a-e8c2-d578-f7c94a3b441d
00020000-566a-e8c5-dfa0-52feeb770d88	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c5-639e-addba7070fee	00030000-566a-e8c2-751c-9c2c68e653a8
00020000-566a-e8c5-c259-aaa2e8a5c2f7	00030000-566a-e8c2-b1e7-688f7530a6d2
00020000-566a-e8c5-7bc3-950ba706170e	00030000-566a-e8c2-b2dd-55f35b97a4a3
00020000-566a-e8c5-110c-066b479bfaf0	00030000-566a-e8c2-1966-0602edc7b461
00020000-566a-e8c5-6459-0680352b5a3d	00030000-566a-e8c2-dfde-2e6d0f87dd0e
00020000-566a-e8c5-1f24-d3320e8d7e2b	00030000-566a-e8c2-be10-af119f1f0d7b
00020000-566a-e8c5-af96-08690a2f8765	00030000-566a-e8c2-6c92-544dbbc90b2f
00020000-566a-e8c5-a3ed-ef58c33df238	00030000-566a-e8c2-302a-6a301e575ede
00020000-566a-e8c5-18f0-3168f5f75c32	00030000-566a-e8c2-613c-becf40da8f85
00020000-566a-e8c5-c901-9539f9554e81	00030000-566a-e8c2-4d4c-cdf11bde7982
00020000-566a-e8c5-5129-28015625a9e1	00030000-566a-e8c2-4427-eb9a0b1c1230
00020000-566a-e8c5-9dfc-8e637175e3d4	00030000-566a-e8c2-1b4c-5f1d0ac898fd
00020000-566a-e8c5-9ce0-0d8f1e588208	00030000-566a-e8c2-1cb2-ba10fca5dcf3
00020000-566a-e8c5-f40b-e5b6e2ef08e9	00030000-566a-e8c2-744e-0965eb59bc9a
00020000-566a-e8c5-6eaf-b7a4e6974835	00030000-566a-e8c2-07d1-10bcc9a6b6ed
00020000-566a-e8c5-6eaf-b7a4e6974835	00030000-566a-e8c2-cc9e-28d2f428afbb
00020000-566a-e8c5-6eaf-b7a4e6974835	00030000-566a-e8c2-8e0d-a9d577b566f4
00020000-566a-e8c5-ad59-9a47a13f9478	00030000-566a-e8c2-25f9-971f9d3a584d
00020000-566a-e8c5-6612-dbc0d4288cff	00030000-566a-e8c2-6a48-20ee1b5f7c83
00020000-566a-e8c5-b40f-7d8ce44aaa2c	00030000-566a-e8c2-3616-84d86ac534b3
00020000-566a-e8c5-59c7-9e41ac1091ba	00030000-566a-e8c2-87c3-6c8bfb01ffba
00020000-566a-e8c5-a848-67b4ef5ae27b	00030000-566a-e8c2-1846-5ef4f9aef89d
00020000-566a-e8c5-7560-2e25c312b769	00030000-566a-e8c2-ef91-3e1c1cf5c2ca
00020000-566a-e8c5-0e76-3ee08c5da0b7	00030000-566a-e8c2-c92b-5e676a3c94da
00020000-566a-e8c5-d7b5-2a8da1ddf455	00030000-566a-e8c2-a612-19755314847c
00020000-566a-e8c5-7983-d6bc19a97555	00030000-566a-e8c2-8d28-57e792ec8a9f
00020000-566a-e8c5-de23-7bbd14bec1a7	00030000-566a-e8c2-4e41-0bc04193b8f9
00020000-566a-e8c5-a4d8-e9cf5d364f24	00030000-566a-e8c2-15ee-74a30a4f25a2
00020000-566a-e8c5-ea07-e1d1bce6add8	00030000-566a-e8c2-af15-dee3ddb7a5ef
00020000-566a-e8c5-576c-b4bcda106c27	00030000-566a-e8c2-765b-0335458a69d5
00020000-566a-e8c5-38d8-4daa5e98df6a	00030000-566a-e8c2-9ab6-21def9c7b261
00020000-566a-e8c5-182d-8aef83dc215e	00030000-566a-e8c2-7b05-b9158054fd2e
\.


--
-- TOC entry 3141 (class 0 OID 32044223)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32044257)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 32044394)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-566a-e8c5-4334-66d08032049a	00090000-566a-e8c5-26f0-0424381b7030	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-566a-e8c5-6b3c-02c4ec197b90	00090000-566a-e8c5-42ad-98d49f386458	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-566a-e8c5-faa9-e2aca24c1913	00090000-566a-e8c5-cb82-23f5ab4cfc5a	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-566a-e8c5-40ed-c9b6fc075d58	00090000-566a-e8c5-1b1a-7bed385b2d3c	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 32043915)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-566a-e8c5-694b-a8ee323392d4	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566a-e8c5-b94d-09853618ff90	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-566a-e8c5-669f-80d40a295874	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566a-e8c5-7d79-ef836af70101	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566a-e8c5-fa50-841fb8e31dd0	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566a-e8c5-0294-21659dad3811	\N	00040000-566a-e8c2-cf86-986104681aec	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566a-e8c5-581d-d420266b5ec4	\N	00040000-566a-e8c2-d58b-24136cc7aa3b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566a-e8c5-342f-d651d5099b1c	\N	00040000-566a-e8c2-cc84-9f9aea6b3285	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566a-e8c5-ff73-e0bccde10088	\N	00040000-566a-e8c2-636f-ebd21001d07e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566a-e8c7-8bee-58b4ef0ea4fa	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 32043960)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-566a-e8c2-0338-197d6412ba1b	8341	Adlešiči
00050000-566a-e8c2-c2ac-62b190cdfe71	5270	Ajdovščina
00050000-566a-e8c2-16e3-dc006af56cb9	6280	Ankaran/Ancarano
00050000-566a-e8c2-aba1-a8f134fd6e72	9253	Apače
00050000-566a-e8c2-a09c-e1d51ef971b5	8253	Artiče
00050000-566a-e8c2-126d-96bfff461587	4275	Begunje na Gorenjskem
00050000-566a-e8c2-b97e-bfad0da25470	1382	Begunje pri Cerknici
00050000-566a-e8c2-7546-1e75343919a9	9231	Beltinci
00050000-566a-e8c2-1982-49bcc743d003	2234	Benedikt
00050000-566a-e8c2-e8aa-2e12368a80d7	2345	Bistrica ob Dravi
00050000-566a-e8c2-7299-b16487b7a527	3256	Bistrica ob Sotli
00050000-566a-e8c2-3d4a-b524ccac0947	8259	Bizeljsko
00050000-566a-e8c2-3e6b-b7ca948f5949	1223	Blagovica
00050000-566a-e8c2-ec30-c5518644c998	8283	Blanca
00050000-566a-e8c2-ecf1-d5607913723e	4260	Bled
00050000-566a-e8c2-24a1-0595d219ed6a	4273	Blejska Dobrava
00050000-566a-e8c2-6ff2-5d3b02daa743	9265	Bodonci
00050000-566a-e8c2-7b3f-c2de0c51a77d	9222	Bogojina
00050000-566a-e8c2-0ef0-7e1e380a81b2	4263	Bohinjska Bela
00050000-566a-e8c2-0825-91dde0126fec	4264	Bohinjska Bistrica
00050000-566a-e8c2-8ea2-0317b9ffdfb4	4265	Bohinjsko jezero
00050000-566a-e8c2-9d3d-8d1a7caf7839	1353	Borovnica
00050000-566a-e8c2-41b7-44f27e753b5d	8294	Boštanj
00050000-566a-e8c2-720b-fb09c1e56209	5230	Bovec
00050000-566a-e8c2-7f9a-9627a068c231	5295	Branik
00050000-566a-e8c2-cb32-883e4ec6858b	3314	Braslovče
00050000-566a-e8c2-5262-373cfe2dfa80	5223	Breginj
00050000-566a-e8c2-8f0b-52e960a053ff	8280	Brestanica
00050000-566a-e8c2-8e29-876cf7a98b17	2354	Bresternica
00050000-566a-e8c2-2394-e77e7af8e4ef	4243	Brezje
00050000-566a-e8c2-2f9d-df8c8ec9ec20	1351	Brezovica pri Ljubljani
00050000-566a-e8c2-8be3-6ee3d07cc4e3	8250	Brežice
00050000-566a-e8c2-a9e5-65513acd3509	4210	Brnik - Aerodrom
00050000-566a-e8c2-0e73-872a5468d686	8321	Brusnice
00050000-566a-e8c2-9102-5da93f3dde1b	3255	Buče
00050000-566a-e8c2-b487-da63665412ac	8276	Bučka 
00050000-566a-e8c2-6ff3-4ea54ada9c38	9261	Cankova
00050000-566a-e8c2-98a9-3f9739f396d6	3000	Celje 
00050000-566a-e8c2-5555-ce3e7a49dc26	3001	Celje - poštni predali
00050000-566a-e8c2-58ee-0f2a96956362	4207	Cerklje na Gorenjskem
00050000-566a-e8c2-4fe9-3aef1d786ef6	8263	Cerklje ob Krki
00050000-566a-e8c2-8b71-796034f8bfb3	1380	Cerknica
00050000-566a-e8c2-3848-bfba8b63e5fc	5282	Cerkno
00050000-566a-e8c2-b7d9-6ca67865f687	2236	Cerkvenjak
00050000-566a-e8c2-52d7-2123442d4410	2215	Ceršak
00050000-566a-e8c2-cbe3-18079808779b	2326	Cirkovce
00050000-566a-e8c2-a680-73df63fdb92d	2282	Cirkulane
00050000-566a-e8c2-1c54-e5e772d84722	5273	Col
00050000-566a-e8c2-9798-31681dcaf9d8	8251	Čatež ob Savi
00050000-566a-e8c2-0310-f41e46560e2a	1413	Čemšenik
00050000-566a-e8c2-7893-db0be0ac264b	5253	Čepovan
00050000-566a-e8c2-83d7-2fd0d73859b0	9232	Črenšovci
00050000-566a-e8c2-d54f-2202d35e75bd	2393	Črna na Koroškem
00050000-566a-e8c2-3538-7c4c172b5503	6275	Črni Kal
00050000-566a-e8c2-8fac-7aa7727142ef	5274	Črni Vrh nad Idrijo
00050000-566a-e8c2-25f1-a79048a46d45	5262	Črniče
00050000-566a-e8c2-5435-01992e2674c5	8340	Črnomelj
00050000-566a-e8c2-d83f-0ae4594550d5	6271	Dekani
00050000-566a-e8c2-c30b-fb4b9aa939c0	5210	Deskle
00050000-566a-e8c2-1fdd-33d2c2cc8b84	2253	Destrnik
00050000-566a-e8c2-5144-25c3185c4f81	6215	Divača
00050000-566a-e8c2-7290-ef05c4db5a41	1233	Dob
00050000-566a-e8c2-4cf3-86ec11355f55	3224	Dobje pri Planini
00050000-566a-e8c2-5839-5dd6f1aa61cb	8257	Dobova
00050000-566a-e8c2-6453-12c4ac2e2da1	1423	Dobovec
00050000-566a-e8c2-da81-9923999dcfc8	5263	Dobravlje
00050000-566a-e8c2-9e5b-9689e3584439	3204	Dobrna
00050000-566a-e8c2-853f-1033a9054e61	8211	Dobrnič
00050000-566a-e8c2-110a-656014dca049	1356	Dobrova
00050000-566a-e8c2-6d45-6a2b6eb0de6f	9223	Dobrovnik/Dobronak 
00050000-566a-e8c2-ce91-9849ddcb3524	5212	Dobrovo v Brdih
00050000-566a-e8c2-cefb-89ac2f05567f	1431	Dol pri Hrastniku
00050000-566a-e8c2-de7b-68fe79817bb2	1262	Dol pri Ljubljani
00050000-566a-e8c2-92a9-1eea4a43203d	1273	Dole pri Litiji
00050000-566a-e8c2-fb37-be381062658a	1331	Dolenja vas
00050000-566a-e8c2-eee6-ac66fa8ad92f	8350	Dolenjske Toplice
00050000-566a-e8c2-11fc-404f1bb0c381	1230	Domžale
00050000-566a-e8c2-ff5e-ddec6604d0d6	2252	Dornava
00050000-566a-e8c2-1ae3-8c00eb3a5666	5294	Dornberk
00050000-566a-e8c2-69d1-24d060e5b816	1319	Draga
00050000-566a-e8c2-91ad-4310df568d43	8343	Dragatuš
00050000-566a-e8c2-d04e-9d624bf9d1bb	3222	Dramlje
00050000-566a-e8c2-f199-7f82cea3148c	2370	Dravograd
00050000-566a-e8c2-28c4-67e9ab725133	4203	Duplje
00050000-566a-e8c2-c4c9-6d3dd9d218a3	6221	Dutovlje
00050000-566a-e8c2-00f4-c4b3dcab8fd6	8361	Dvor
00050000-566a-e8c2-e00d-a64fe24541cd	2343	Fala
00050000-566a-e8c2-7b42-90dc6cdb22bb	9208	Fokovci
00050000-566a-e8c2-759e-48b4e0487951	2313	Fram
00050000-566a-e8c2-99dd-15b5c88d95fb	3213	Frankolovo
00050000-566a-e8c2-a0c1-99c1160626cf	1274	Gabrovka
00050000-566a-e8c2-3b52-053e772ccc36	8254	Globoko
00050000-566a-e8c2-3d45-c065e183ba8f	5275	Godovič
00050000-566a-e8c2-b5fd-405edcd7b9ad	4204	Golnik
00050000-566a-e8c2-993d-62cb76003d3e	3303	Gomilsko
00050000-566a-e8c2-7b81-7b9c78a14503	4224	Gorenja vas
00050000-566a-e8c2-5462-21bbabf5514a	3263	Gorica pri Slivnici
00050000-566a-e8c2-4902-10398e3e7f85	2272	Gorišnica
00050000-566a-e8c2-4532-5556d173b251	9250	Gornja Radgona
00050000-566a-e8c2-1f93-fa3e8e2efbee	3342	Gornji Grad
00050000-566a-e8c2-e4e1-786053db71ff	4282	Gozd Martuljek
00050000-566a-e8c2-df7e-8ad38ddb73cd	6272	Gračišče
00050000-566a-e8c2-629b-89320a1f515c	9264	Grad
00050000-566a-e8c2-db0c-33c75c9b8911	8332	Gradac
00050000-566a-e8c2-f8ee-341d78af78f5	1384	Grahovo
00050000-566a-e8c2-8294-365038526cd2	5242	Grahovo ob Bači
00050000-566a-e8c2-d6f4-9eafed35877a	5251	Grgar
00050000-566a-e8c2-19d1-6d33b832b395	3302	Griže
00050000-566a-e8c2-dadc-f5bad7655ac8	3231	Grobelno
00050000-566a-e8c2-3109-785cd807c78f	1290	Grosuplje
00050000-566a-e8c2-7193-e0e2e970ae24	2288	Hajdina
00050000-566a-e8c2-63ec-307d955abda6	8362	Hinje
00050000-566a-e8c2-92e9-de596f72aba7	2311	Hoče
00050000-566a-e8c2-875a-5451ed5c4d11	9205	Hodoš/Hodos
00050000-566a-e8c2-b01c-0c57c5df80dd	1354	Horjul
00050000-566a-e8c2-30b4-b84211625d49	1372	Hotedršica
00050000-566a-e8c2-13e2-92627dd05e52	1430	Hrastnik
00050000-566a-e8c2-0e62-baeeee53b94e	6225	Hruševje
00050000-566a-e8c2-5b38-a1116ae32275	4276	Hrušica
00050000-566a-e8c2-80f3-ce9209c94e04	5280	Idrija
00050000-566a-e8c2-c267-7349fb9fa609	1292	Ig
00050000-566a-e8c2-200e-e21079f667d0	6250	Ilirska Bistrica
00050000-566a-e8c2-f459-37d2212d61bc	6251	Ilirska Bistrica-Trnovo
00050000-566a-e8c2-fd54-97abb80306b3	1295	Ivančna Gorica
00050000-566a-e8c2-e5ed-73ee5f62be14	2259	Ivanjkovci
00050000-566a-e8c2-d25c-1f275c3e1b35	1411	Izlake
00050000-566a-e8c2-4648-26ddc741fd43	6310	Izola/Isola
00050000-566a-e8c2-34c0-04301a8223e4	2222	Jakobski Dol
00050000-566a-e8c2-e099-06f9a5babf14	2221	Jarenina
00050000-566a-e8c2-f810-686c187e33de	6254	Jelšane
00050000-566a-e8c2-879e-5a17170bf3f5	4270	Jesenice
00050000-566a-e8c2-8098-09d64510e1cc	8261	Jesenice na Dolenjskem
00050000-566a-e8c2-20e3-8ed0e2907156	3273	Jurklošter
00050000-566a-e8c2-5128-fd8a89473be0	2223	Jurovski Dol
00050000-566a-e8c2-da89-730e0a28bd15	2256	Juršinci
00050000-566a-e8c2-3d53-47c7015b68de	5214	Kal nad Kanalom
00050000-566a-e8c2-efe1-de23b2ff7fdd	3233	Kalobje
00050000-566a-e8c2-c476-e58717bedffc	4246	Kamna Gorica
00050000-566a-e8c2-2b2e-9d7d783d2771	2351	Kamnica
00050000-566a-e8c2-ea9f-4cf6aeb45397	1241	Kamnik
00050000-566a-e8c2-85ae-612705de744f	5213	Kanal
00050000-566a-e8c2-e182-e94080235d14	8258	Kapele
00050000-566a-e8c2-e2d2-7a5c969cb467	2362	Kapla
00050000-566a-e8c2-12ed-4c4ee33af546	2325	Kidričevo
00050000-566a-e8c2-9e95-4b542fda020b	1412	Kisovec
00050000-566a-e8c2-a12a-842c087a3932	6253	Knežak
00050000-566a-e8c2-2024-5853262a3aa1	5222	Kobarid
00050000-566a-e8c2-7f26-3b71749c4d88	9227	Kobilje
00050000-566a-e8c2-e195-bc33b8b0c3a4	1330	Kočevje
00050000-566a-e8c2-bbe1-8be4ad7aeba1	1338	Kočevska Reka
00050000-566a-e8c2-94e3-d5f83bf7feba	2276	Kog
00050000-566a-e8c2-2745-7f73cd898ffa	5211	Kojsko
00050000-566a-e8c2-bff4-132b67f311f9	6223	Komen
00050000-566a-e8c2-c8a9-604b527c86bd	1218	Komenda
00050000-566a-e8c2-fb14-05cdda125917	6000	Koper/Capodistria 
00050000-566a-e8c2-3273-b96ac64c3352	6001	Koper/Capodistria - poštni predali
00050000-566a-e8c2-b7b4-20c627ae614f	8282	Koprivnica
00050000-566a-e8c2-0638-3f127f319b2c	5296	Kostanjevica na Krasu
00050000-566a-e8c2-d16d-e8cbf9d1dd58	8311	Kostanjevica na Krki
00050000-566a-e8c2-7c35-0ef1b47edf23	1336	Kostel
00050000-566a-e8c2-5052-df56ef2b41d4	6256	Košana
00050000-566a-e8c2-bdba-b5a5669be0d4	2394	Kotlje
00050000-566a-e8c2-0977-0baaf746da74	6240	Kozina
00050000-566a-e8c2-c803-97df940b2c9e	3260	Kozje
00050000-566a-e8c2-02df-70832787768b	4000	Kranj 
00050000-566a-e8c2-0f38-0505d604f6c2	4001	Kranj - poštni predali
00050000-566a-e8c2-684b-675bc3cbaf3d	4280	Kranjska Gora
00050000-566a-e8c2-eef2-478043177e10	1281	Kresnice
00050000-566a-e8c2-09eb-266be67b76b1	4294	Križe
00050000-566a-e8c2-df48-c78b1fc67326	9206	Križevci
00050000-566a-e8c2-7564-49c1aa1aec6d	9242	Križevci pri Ljutomeru
00050000-566a-e8c2-69d7-ef8b6807d494	1301	Krka
00050000-566a-e8c2-0615-95c58ba9f065	8296	Krmelj
00050000-566a-e8c2-b2f2-552863d66058	4245	Kropa
00050000-566a-e8c2-f520-4f9a7eee8f01	8262	Krška vas
00050000-566a-e8c2-5af4-964b4ea04745	8270	Krško
00050000-566a-e8c2-8e08-ca5c285886b6	9263	Kuzma
00050000-566a-e8c2-4eef-a849d2e491f3	2318	Laporje
00050000-566a-e8c2-acf0-7a745db76048	3270	Laško
00050000-566a-e8c2-cd9a-7778119b4f17	1219	Laze v Tuhinju
00050000-566a-e8c2-ac1f-2efae3c16861	2230	Lenart v Slovenskih goricah
00050000-566a-e8c2-3664-c949e0c87b82	9220	Lendava/Lendva
00050000-566a-e8c2-264f-00572c6e0d79	4248	Lesce
00050000-566a-e8c2-251c-f94d1d18b6bc	3261	Lesično
00050000-566a-e8c2-fbd4-3ce9dd5e6cf1	8273	Leskovec pri Krškem
00050000-566a-e8c2-b5d8-588320f141b9	2372	Libeliče
00050000-566a-e8c2-48d3-0716d1fc96a3	2341	Limbuš
00050000-566a-e8c2-f923-23d68b870f4e	1270	Litija
00050000-566a-e8c2-aa16-68b0556ca21d	3202	Ljubečna
00050000-566a-e8c2-8065-42692b17b2a5	1000	Ljubljana 
00050000-566a-e8c2-ab74-033f5c9f2366	1001	Ljubljana - poštni predali
00050000-566a-e8c2-995a-729c51b4a3d5	1231	Ljubljana - Črnuče
00050000-566a-e8c2-a406-cde911bf3c4d	1261	Ljubljana - Dobrunje
00050000-566a-e8c2-9294-a4ab8f5266f7	1260	Ljubljana - Polje
00050000-566a-e8c2-feaf-226d5cebc40a	1210	Ljubljana - Šentvid
00050000-566a-e8c2-4439-2ad72f40d4d5	1211	Ljubljana - Šmartno
00050000-566a-e8c2-9e39-c4a0ae666a80	3333	Ljubno ob Savinji
00050000-566a-e8c2-7d1f-0ad8ec2baa4f	9240	Ljutomer
00050000-566a-e8c2-4170-c169372fa12b	3215	Loče
00050000-566a-e8c2-da00-dc36c5fb68ca	5231	Log pod Mangartom
00050000-566a-e8c2-74e2-50d5a4a5f230	1358	Log pri Brezovici
00050000-566a-e8c2-a870-0ee64074fe4d	1370	Logatec
00050000-566a-e8c2-27aa-a25c5dec5142	1371	Logatec
00050000-566a-e8c2-d917-f220cb8f8a2a	1434	Loka pri Zidanem Mostu
00050000-566a-e8c2-2249-d94ae8f24911	3223	Loka pri Žusmu
00050000-566a-e8c2-53f6-8332eeeef9de	6219	Lokev
00050000-566a-e8c2-5bba-ee51ed3018a2	1318	Loški Potok
00050000-566a-e8c2-4226-99dc7c92c2e4	2324	Lovrenc na Dravskem polju
00050000-566a-e8c2-d3e0-8a02d477628b	2344	Lovrenc na Pohorju
00050000-566a-e8c2-c653-8f506cac1641	3334	Luče
00050000-566a-e8c2-5fcb-5d307579c42c	1225	Lukovica
00050000-566a-e8c2-945a-c0a9244d7a16	9202	Mačkovci
00050000-566a-e8c2-72bc-b087b8a10f3d	2322	Majšperk
00050000-566a-e8c2-093c-bc3bfb8ef6a8	2321	Makole
00050000-566a-e8c2-ef55-257e7d515045	9243	Mala Nedelja
00050000-566a-e8c2-f988-23ec72483bdc	2229	Malečnik
00050000-566a-e8c2-b728-97408aad36a8	6273	Marezige
00050000-566a-e8c2-6445-b274c91f2f4a	2000	Maribor 
00050000-566a-e8c2-f165-fc9f3df7bf0c	2001	Maribor - poštni predali
00050000-566a-e8c2-a316-abefa2f3095a	2206	Marjeta na Dravskem polju
00050000-566a-e8c2-b6a7-5b5be7b902e2	2281	Markovci
00050000-566a-e8c2-8a9f-28da25022f0d	9221	Martjanci
00050000-566a-e8c2-632f-d7db7b9247db	6242	Materija
00050000-566a-e8c2-7dcf-69be57372b5d	4211	Mavčiče
00050000-566a-e8c2-44a6-c0fd10acd53d	1215	Medvode
00050000-566a-e8c2-4548-e22946f5ff19	1234	Mengeš
00050000-566a-e8c2-7890-ff5b0343a4d6	8330	Metlika
00050000-566a-e8c2-179c-6336afbbc0a7	2392	Mežica
00050000-566a-e8c2-c1e6-e71a8c7facdb	2204	Miklavž na Dravskem polju
00050000-566a-e8c2-d74f-7e107a15abbd	2275	Miklavž pri Ormožu
00050000-566a-e8c2-aff9-486c814716c9	5291	Miren
00050000-566a-e8c2-83ce-e875cd4eaedf	8233	Mirna
00050000-566a-e8c2-fe67-699e84ced87c	8216	Mirna Peč
00050000-566a-e8c2-0fbc-d5985cb59720	2382	Mislinja
00050000-566a-e8c2-17c8-0a56fbd6866b	4281	Mojstrana
00050000-566a-e8c2-8cda-fbcde943931e	8230	Mokronog
00050000-566a-e8c2-9d67-38ebeb77381f	1251	Moravče
00050000-566a-e8c2-ca16-023528195a4a	9226	Moravske Toplice
00050000-566a-e8c2-86d5-8ea15870aa06	5216	Most na Soči
00050000-566a-e8c2-8821-e1609a8ffafe	1221	Motnik
00050000-566a-e8c2-0f1e-c889ef7af532	3330	Mozirje
00050000-566a-e8c2-1875-fb02e4f08df5	9000	Murska Sobota 
00050000-566a-e8c2-9341-32efc14f6e76	9001	Murska Sobota - poštni predali
00050000-566a-e8c2-20c7-f32ef69c8d70	2366	Muta
00050000-566a-e8c2-c871-836babcf8e85	4202	Naklo
00050000-566a-e8c2-0b54-56e8c8ef09d7	3331	Nazarje
00050000-566a-e8c2-b75d-910e4bdff839	1357	Notranje Gorice
00050000-566a-e8c2-032b-b67507b1c2e6	3203	Nova Cerkev
00050000-566a-e8c2-9428-05a8f5d8126d	5000	Nova Gorica 
00050000-566a-e8c2-cc4c-8033e0b45e22	5001	Nova Gorica - poštni predali
00050000-566a-e8c2-0790-ac8a57f765f7	1385	Nova vas
00050000-566a-e8c2-068c-af3b5413c718	8000	Novo mesto
00050000-566a-e8c2-4d22-984bdd313a05	8001	Novo mesto - poštni predali
00050000-566a-e8c2-e1fc-a50195171771	6243	Obrov
00050000-566a-e8c2-1f00-d4283446df7b	9233	Odranci
00050000-566a-e8c2-782f-d34fb591c2d8	2317	Oplotnica
00050000-566a-e8c2-cdb6-a2d6a1277a06	2312	Orehova vas
00050000-566a-e8c2-7e2e-5e34938c12be	2270	Ormož
00050000-566a-e8c2-ec60-770689c8a1e1	1316	Ortnek
00050000-566a-e8c2-006f-43d8a6f5c189	1337	Osilnica
00050000-566a-e8c2-d0fc-ab6de638ba3a	8222	Otočec
00050000-566a-e8c2-141e-f2c1fb8fba1c	2361	Ožbalt
00050000-566a-e8c2-11b7-9c71101472f4	2231	Pernica
00050000-566a-e8c2-66d3-1d5dead06cd0	2211	Pesnica pri Mariboru
00050000-566a-e8c2-8ddd-cab708a903c9	9203	Petrovci
00050000-566a-e8c2-1672-bf199b9e8d11	3301	Petrovče
00050000-566a-e8c2-f25b-d906169d95f0	6330	Piran/Pirano
00050000-566a-e8c2-a30b-67ab3099c6af	8255	Pišece
00050000-566a-e8c2-6870-eb8917a046a6	6257	Pivka
00050000-566a-e8c2-58f0-7b10a0ecdb80	6232	Planina
00050000-566a-e8c2-552a-7f4058089890	3225	Planina pri Sevnici
00050000-566a-e8c2-50ae-7f18aa9ad756	6276	Pobegi
00050000-566a-e8c2-a93d-c970232e714b	8312	Podbočje
00050000-566a-e8c2-79fb-0e1a3f7ec0f0	5243	Podbrdo
00050000-566a-e8c2-f7a3-f3fc917e4b01	3254	Podčetrtek
00050000-566a-e8c2-eb04-7a2ba41e6ab4	2273	Podgorci
00050000-566a-e8c2-f907-0d85363242d4	6216	Podgorje
00050000-566a-e8c2-a4ca-178734012ada	2381	Podgorje pri Slovenj Gradcu
00050000-566a-e8c2-19f1-4a9925d279ad	6244	Podgrad
00050000-566a-e8c2-eca4-8972384d3f83	1414	Podkum
00050000-566a-e8c2-8031-3f848c2632d5	2286	Podlehnik
00050000-566a-e8c2-6bca-157fa68586ce	5272	Podnanos
00050000-566a-e8c2-63db-97ef2722271a	4244	Podnart
00050000-566a-e8c2-6613-36e901e442c4	3241	Podplat
00050000-566a-e8c2-1202-53d7e79ff0f9	3257	Podsreda
00050000-566a-e8c2-0bc0-c62b699147fd	2363	Podvelka
00050000-566a-e8c2-00b3-9bcb5ce4f325	2208	Pohorje
00050000-566a-e8c2-b71c-f049c695f11e	2257	Polenšak
00050000-566a-e8c2-66aa-738962f23268	1355	Polhov Gradec
00050000-566a-e8c2-8d79-2c8f890c52d5	4223	Poljane nad Škofjo Loko
00050000-566a-e8c2-7a0f-0542440102b7	2319	Poljčane
00050000-566a-e8c2-0c0b-d17293d02c25	1272	Polšnik
00050000-566a-e8c2-73ff-4c963bd9f44c	3313	Polzela
00050000-566a-e8c2-6b9e-27914753100a	3232	Ponikva
00050000-566a-e8c2-3ca7-11b267b0cd44	6320	Portorož/Portorose
00050000-566a-e8c2-ac6d-3a71514d43c1	6230	Postojna
00050000-566a-e8c2-22f3-5162d3550097	2331	Pragersko
00050000-566a-e8c2-7c46-e38348017e85	3312	Prebold
00050000-566a-e8c2-fd39-3a05bb48ba7d	4205	Preddvor
00050000-566a-e8c2-51ea-c76e2d41d16b	6255	Prem
00050000-566a-e8c2-56f4-77d6fc960e32	1352	Preserje
00050000-566a-e8c2-7a6a-6fc19849ba28	6258	Prestranek
00050000-566a-e8c2-45a4-d509a0c18821	2391	Prevalje
00050000-566a-e8c2-5da1-be74e62805e4	3262	Prevorje
00050000-566a-e8c2-8fd4-288667542f64	1276	Primskovo 
00050000-566a-e8c2-adb7-1fa1f3c7063e	3253	Pristava pri Mestinju
00050000-566a-e8c2-57f3-34f6c1d80754	9207	Prosenjakovci/Partosfalva
00050000-566a-e8c2-8d80-c9a60652fefe	5297	Prvačina
00050000-566a-e8c2-70c8-f7615eef884f	2250	Ptuj
00050000-566a-e8c2-d5ee-e282fcdfbfd6	2323	Ptujska Gora
00050000-566a-e8c2-3ca6-a935ca1e3966	9201	Puconci
00050000-566a-e8c2-dfa5-b13d94d2e404	2327	Rače
00050000-566a-e8c2-b82b-46987096ae21	1433	Radeče
00050000-566a-e8c2-909a-344ecff336f9	9252	Radenci
00050000-566a-e8c2-5031-7308c65e1d18	2360	Radlje ob Dravi
00050000-566a-e8c2-47eb-e1cdefc50b58	1235	Radomlje
00050000-566a-e8c2-bc25-bb85e28457ed	4240	Radovljica
00050000-566a-e8c2-e0e9-92faa733d4e4	8274	Raka
00050000-566a-e8c2-b326-9fb5928dc312	1381	Rakek
00050000-566a-e8c2-eefc-4a5cf8b3b839	4283	Rateče - Planica
00050000-566a-e8c2-d6a5-f43f3a444475	2390	Ravne na Koroškem
00050000-566a-e8c2-0235-736b1c87ed10	9246	Razkrižje
00050000-566a-e8c2-cc00-907617012886	3332	Rečica ob Savinji
00050000-566a-e8c2-ae8d-4adb9af222f4	5292	Renče
00050000-566a-e8c2-8b02-20248950332b	1310	Ribnica
00050000-566a-e8c2-0d37-21a85429268a	2364	Ribnica na Pohorju
00050000-566a-e8c2-3188-c2fdfaeda7c8	3272	Rimske Toplice
00050000-566a-e8c2-eda9-02f42e26ae45	1314	Rob
00050000-566a-e8c2-27a0-9fa2b728e0c5	5215	Ročinj
00050000-566a-e8c2-5f5b-069dd832f8e7	3250	Rogaška Slatina
00050000-566a-e8c2-0fdb-004208b65cc3	9262	Rogašovci
00050000-566a-e8c2-c31f-5c718dda88f8	3252	Rogatec
00050000-566a-e8c2-ad61-ef6c8330a29d	1373	Rovte
00050000-566a-e8c2-1b55-97b00d33844b	2342	Ruše
00050000-566a-e8c2-66a0-d8ef8fc31923	1282	Sava
00050000-566a-e8c2-8425-3bf4e909b5d4	6333	Sečovlje/Sicciole
00050000-566a-e8c2-32d9-81fb32b12cbb	4227	Selca
00050000-566a-e8c2-20f7-08930db6c202	2352	Selnica ob Dravi
00050000-566a-e8c2-507c-41cc37ecbfd6	8333	Semič
00050000-566a-e8c2-e950-8480b12ec2a3	8281	Senovo
00050000-566a-e8c2-894c-2e8b55e40b35	6224	Senožeče
00050000-566a-e8c2-6a47-115a7bc708ad	8290	Sevnica
00050000-566a-e8c2-aafb-61d00cd38e0a	6210	Sežana
00050000-566a-e8c2-3ed7-6e3a70bab50e	2214	Sladki Vrh
00050000-566a-e8c2-5471-0010ab77897d	5283	Slap ob Idrijci
00050000-566a-e8c2-9b8e-2f9343dde8fd	2380	Slovenj Gradec
00050000-566a-e8c2-7231-0b962fc76ea6	2310	Slovenska Bistrica
00050000-566a-e8c2-603c-16609daf0587	3210	Slovenske Konjice
00050000-566a-e8c2-fcd8-000340c3ff53	1216	Smlednik
00050000-566a-e8c2-ac11-2b4e08c08452	5232	Soča
00050000-566a-e8c2-2299-70ec0cb45de3	1317	Sodražica
00050000-566a-e8c2-c50a-20ec569a56e5	3335	Solčava
00050000-566a-e8c2-238a-0bf4017a5592	5250	Solkan
00050000-566a-e8c2-9f39-0822b35f5249	4229	Sorica
00050000-566a-e8c2-4912-591c36fd3bba	4225	Sovodenj
00050000-566a-e8c2-f0e4-fd6f5483f3be	5281	Spodnja Idrija
00050000-566a-e8c2-d02f-491cf9545a37	2241	Spodnji Duplek
00050000-566a-e8c2-f6b2-7ec1fa86192c	9245	Spodnji Ivanjci
00050000-566a-e8c2-c109-ec55f5e4ee03	2277	Središče ob Dravi
00050000-566a-e8c2-576e-d70a9c8e1a49	4267	Srednja vas v Bohinju
00050000-566a-e8c2-0081-0d45aad149b4	8256	Sromlje 
00050000-566a-e8c2-8ca5-e4cdf754a1e2	5224	Srpenica
00050000-566a-e8c2-e600-e2189e4de2c4	1242	Stahovica
00050000-566a-e8c2-b63c-b6758b2e6ef0	1332	Stara Cerkev
00050000-566a-e8c2-de47-c6424d868f03	8342	Stari trg ob Kolpi
00050000-566a-e8c2-421e-f3b3adc84856	1386	Stari trg pri Ložu
00050000-566a-e8c2-1038-029f34877da8	2205	Starše
00050000-566a-e8c2-5bc8-c00f0942466f	2289	Stoperce
00050000-566a-e8c2-9138-a61b694fd542	8322	Stopiče
00050000-566a-e8c2-aa0a-423c6a59885b	3206	Stranice
00050000-566a-e8c2-ad7b-f78216f11a8f	8351	Straža
00050000-566a-e8c2-914c-e6fe64df4c23	1313	Struge
00050000-566a-e8c2-3774-7100684ef0e5	8293	Studenec
00050000-566a-e8c2-859f-eb510dcc1357	8331	Suhor
00050000-566a-e8c2-2d4b-87258de8cab2	2233	Sv. Ana v Slovenskih goricah
00050000-566a-e8c2-7a9e-d80674eeb66a	2235	Sv. Trojica v Slovenskih goricah
00050000-566a-e8c2-2e9c-b26383392e17	2353	Sveti Duh na Ostrem Vrhu
00050000-566a-e8c2-ecd1-bcdbba185899	9244	Sveti Jurij ob Ščavnici
00050000-566a-e8c2-181e-c7c5ea2902a8	3264	Sveti Štefan
00050000-566a-e8c2-409d-c6a270dc4bf5	2258	Sveti Tomaž
00050000-566a-e8c2-dca5-b76c8f42b8c4	9204	Šalovci
00050000-566a-e8c2-8f9d-03062fb880de	5261	Šempas
00050000-566a-e8c2-40a3-669118d6193f	5290	Šempeter pri Gorici
00050000-566a-e8c2-0880-3c8007027727	3311	Šempeter v Savinjski dolini
00050000-566a-e8c2-0935-7e83981835ad	4208	Šenčur
00050000-566a-e8c2-f06a-487c6031c79f	2212	Šentilj v Slovenskih goricah
00050000-566a-e8c2-e30d-247c1a07ea82	8297	Šentjanž
00050000-566a-e8c2-de26-227a2c3afd42	2373	Šentjanž pri Dravogradu
00050000-566a-e8c2-aaae-99ac4a752673	8310	Šentjernej
00050000-566a-e8c2-cb1a-f46bf2535275	3230	Šentjur
00050000-566a-e8c2-3955-a8034ac35f81	3271	Šentrupert
00050000-566a-e8c2-f493-d29a49b7310b	8232	Šentrupert
00050000-566a-e8c2-fc08-5aef3b069996	1296	Šentvid pri Stični
00050000-566a-e8c2-5099-a4fb2af0abde	8275	Škocjan
00050000-566a-e8c2-9776-284af1a6f602	6281	Škofije
00050000-566a-e8c2-f7d5-5f170fe39b4e	4220	Škofja Loka
00050000-566a-e8c2-7d39-0e8c69a83268	3211	Škofja vas
00050000-566a-e8c2-8afd-57ef3ce58164	1291	Škofljica
00050000-566a-e8c2-b48f-369e2a51f1e1	6274	Šmarje
00050000-566a-e8c2-679a-cb92aa1962b5	1293	Šmarje - Sap
00050000-566a-e8c2-2cdd-319a52b82427	3240	Šmarje pri Jelšah
00050000-566a-e8c2-a6b4-cd683ea22875	8220	Šmarješke Toplice
00050000-566a-e8c2-df8a-3cc446706946	2315	Šmartno na Pohorju
00050000-566a-e8c2-05c5-78889a7d76ea	3341	Šmartno ob Dreti
00050000-566a-e8c2-996d-f4e11ebec79f	3327	Šmartno ob Paki
00050000-566a-e8c2-3b67-81ae85907b46	1275	Šmartno pri Litiji
00050000-566a-e8c2-34d3-ce2cc179583b	2383	Šmartno pri Slovenj Gradcu
00050000-566a-e8c2-bf5e-0914594bd993	3201	Šmartno v Rožni dolini
00050000-566a-e8c2-df97-29acada24a7f	3325	Šoštanj
00050000-566a-e8c2-4e97-55dd46b85e94	6222	Štanjel
00050000-566a-e8c2-9b62-76e44f44d79e	3220	Štore
00050000-566a-e8c2-ba23-c3c656992226	3304	Tabor
00050000-566a-e8c2-f351-e4d54a19ad16	3221	Teharje
00050000-566a-e8c2-83f3-f73426e02caa	9251	Tišina
00050000-566a-e8c2-4f1a-462ab1d8adf9	5220	Tolmin
00050000-566a-e8c2-317c-a333a1bbda08	3326	Topolšica
00050000-566a-e8c2-a5d2-7e3e9f44ca65	2371	Trbonje
00050000-566a-e8c2-5478-17db6a7c87d7	1420	Trbovlje
00050000-566a-e8c2-d97b-eb88a24c20e5	8231	Trebelno 
00050000-566a-e8c2-56b6-ae57f1de7467	8210	Trebnje
00050000-566a-e8c2-a9e4-ef8858b5b08a	5252	Trnovo pri Gorici
00050000-566a-e8c2-a960-bdf3f2bb559a	2254	Trnovska vas
00050000-566a-e8c2-36ae-12458aebcd44	1222	Trojane
00050000-566a-e8c2-6a1e-5752d67377cc	1236	Trzin
00050000-566a-e8c2-aeef-0c90294ecfcb	4290	Tržič
00050000-566a-e8c2-36e0-4b364cbb5b46	8295	Tržišče
00050000-566a-e8c2-0f69-4d0ab34ccae3	1311	Turjak
00050000-566a-e8c2-0ffd-794d7deb574f	9224	Turnišče
00050000-566a-e8c2-d7ae-70a77eb4809d	8323	Uršna sela
00050000-566a-e8c2-2b16-6f8b1824b623	1252	Vače
00050000-566a-e8c2-005b-64f619519fa6	3320	Velenje 
00050000-566a-e8c2-6f63-a9575db9e471	3322	Velenje - poštni predali
00050000-566a-e8c2-d458-2d110f0dc493	8212	Velika Loka
00050000-566a-e8c2-e3d0-9d0f7754d5ae	2274	Velika Nedelja
00050000-566a-e8c2-df5f-a6ebb7c5d8d4	9225	Velika Polana
00050000-566a-e8c2-6c16-89bfe56d6ad0	1315	Velike Lašče
00050000-566a-e8c2-e204-5b79555a28d3	8213	Veliki Gaber
00050000-566a-e8c2-fa99-e0b99a27c63f	9241	Veržej
00050000-566a-e8c2-640f-8ca19c03e62f	1312	Videm - Dobrepolje
00050000-566a-e8c2-da39-cc40a8a6f153	2284	Videm pri Ptuju
00050000-566a-e8c2-3f30-9e2db26773ea	8344	Vinica
00050000-566a-e8c2-98a6-93aad3c561da	5271	Vipava
00050000-566a-e8c2-c8fc-de460562ea42	4212	Visoko
00050000-566a-e8c2-84e7-30ae396a8625	1294	Višnja Gora
00050000-566a-e8c2-335c-9d7833b2cbca	3205	Vitanje
00050000-566a-e8c2-f955-b611d01e076b	2255	Vitomarci
00050000-566a-e8c2-2175-2f359b6a1902	1217	Vodice
00050000-566a-e8c2-65e3-739562b805f6	3212	Vojnik\t
00050000-566a-e8c2-1937-3227b1e8f1da	5293	Volčja Draga
00050000-566a-e8c2-9c64-26b6e08aad27	2232	Voličina
00050000-566a-e8c2-b54e-e7fd1b9694af	3305	Vransko
00050000-566a-e8c2-dcef-fa9344949f49	6217	Vremski Britof
00050000-566a-e8c2-9c50-8ba95f45bb08	1360	Vrhnika
00050000-566a-e8c2-fd56-d52211e0f36c	2365	Vuhred
00050000-566a-e8c2-8280-8775c6ffea8a	2367	Vuzenica
00050000-566a-e8c2-1a73-f48cb248eb0b	8292	Zabukovje 
00050000-566a-e8c2-f236-0a0e31debad5	1410	Zagorje ob Savi
00050000-566a-e8c2-fc27-36de63435311	1303	Zagradec
00050000-566a-e8c2-7275-5cc20952ca2e	2283	Zavrč
00050000-566a-e8c2-d728-28778b1cfe4d	8272	Zdole 
00050000-566a-e8c2-568c-984d5fd705e4	4201	Zgornja Besnica
00050000-566a-e8c2-958b-bfcbf1451445	2242	Zgornja Korena
00050000-566a-e8c2-d80a-b1dc1c6274a7	2201	Zgornja Kungota
00050000-566a-e8c2-b472-25d3d34f1748	2316	Zgornja Ložnica
00050000-566a-e8c2-4fe4-fd693bf71aaa	2314	Zgornja Polskava
00050000-566a-e8c2-05d1-6af2a9e3b6ef	2213	Zgornja Velka
00050000-566a-e8c2-2dea-449f7e2012a0	4247	Zgornje Gorje
00050000-566a-e8c2-1b25-46591037ee01	4206	Zgornje Jezersko
00050000-566a-e8c2-be79-7dcf491e3d16	2285	Zgornji Leskovec
00050000-566a-e8c2-c79f-8f896a3065fc	1432	Zidani Most
00050000-566a-e8c2-ee8b-10c6058e26bf	3214	Zreče
00050000-566a-e8c2-6df1-31fe9e7b9e5f	4209	Žabnica
00050000-566a-e8c2-1336-5f22f3dfd3d3	3310	Žalec
00050000-566a-e8c2-d48e-5c9cc2ef59e7	4228	Železniki
00050000-566a-e8c2-471a-eb7fbfeff56a	2287	Žetale
00050000-566a-e8c2-bb6d-d298018bd2af	4226	Žiri
00050000-566a-e8c2-a44e-a7fd3ae27110	4274	Žirovnica
00050000-566a-e8c2-eca8-5c6a63eec0fe	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 32044622)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 32044197)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32043945)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-566a-e8c5-436f-4d41dea571b0	00080000-566a-e8c5-694b-a8ee323392d4	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-566a-e8c5-3104-207831d44a1e	00080000-566a-e8c5-694b-a8ee323392d4	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-566a-e8c5-c3a4-87a7f1608fb1	00080000-566a-e8c5-b94d-09853618ff90	\N	00040000-566a-e8c2-6d3a-5b5b10d1fe6a	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 32044089)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-566a-e8c2-c710-d12db542a643	novo leto	1	1	\N	t
00430000-566a-e8c2-c014-7919bf854d71	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-566a-e8c2-7112-4aaef0df929d	dan upora proti okupatorju	27	4	\N	t
00430000-566a-e8c2-d53e-d86fb7fa0b66	praznik dela	1	5	\N	t
00430000-566a-e8c2-df2d-507deac14f75	praznik dela	2	5	\N	t
00430000-566a-e8c2-2fa6-4dc12ed9c632	dan Primoža Trubarja	8	6	\N	f
00430000-566a-e8c2-27c8-03692772bbc8	dan državnosti	25	6	\N	t
00430000-566a-e8c2-fb39-251a9bfb0ae4	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-566a-e8c2-708d-6a7317a2a88f	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-566a-e8c2-5371-67d7e74a32cd	dan suverenosti	25	10	\N	f
00430000-566a-e8c2-bcd1-a35eb551f2af	dan spomina na mrtve	1	11	\N	t
00430000-566a-e8c2-5016-db081b6892ef	dan Rudolfa Maistra	23	11	\N	f
00430000-566a-e8c2-6274-3c081af39e91	božič	25	12	\N	t
00430000-566a-e8c2-6d66-9dc4464bf9c5	dan samostojnosti in enotnosti	26	12	\N	t
00430000-566a-e8c2-c483-2b3c9c1a9504	Marijino vnebovzetje	15	8	\N	t
00430000-566a-e8c2-6630-5334f053bcb6	dan reformacije	31	10	\N	t
00430000-566a-e8c2-2e58-a12fb186721d	velikonočna nedelja	27	3	2016	t
00430000-566a-e8c2-45ce-909a336935f7	velikonočna nedelja	16	4	2017	t
00430000-566a-e8c2-e91c-9f4abb05aa17	velikonočna nedelja	1	4	2018	t
00430000-566a-e8c2-ef04-c7549061fd70	velikonočna nedelja	21	4	2019	t
00430000-566a-e8c2-8ef3-d4ec264f24dc	velikonočna nedelja	12	4	2020	t
00430000-566a-e8c2-ce3f-6030ce5f978d	velikonočna nedelja	4	4	2021	t
00430000-566a-e8c2-a8df-d68f1f47b637	velikonočna nedelja	17	4	2022	t
00430000-566a-e8c2-20b8-49689622ba93	velikonočna nedelja	9	4	2023	t
00430000-566a-e8c2-24c1-60d65d1afb2b	velikonočna nedelja	31	3	2024	t
00430000-566a-e8c2-285a-667ff6ffee95	velikonočna nedelja	20	4	2025	t
00430000-566a-e8c2-13be-9d9e8c4f99a5	velikonočna nedelja	5	4	2026	t
00430000-566a-e8c2-2336-7a3c3fdde008	velikonočna nedelja	28	3	2027	t
00430000-566a-e8c2-c652-cdb147de2c49	velikonočna nedelja	16	4	2028	t
00430000-566a-e8c2-bf45-64ec629873f3	velikonočna nedelja	1	4	2029	t
00430000-566a-e8c2-0369-5ed196578a8b	velikonočna nedelja	21	4	2030	t
00430000-566a-e8c2-a8ad-04b6bdbe42ae	velikonočni ponedeljek	28	3	2016	t
00430000-566a-e8c2-fb99-55cb532f97ff	velikonočni ponedeljek	17	4	2017	t
00430000-566a-e8c2-de4c-5555a9177e85	velikonočni ponedeljek	2	4	2018	t
00430000-566a-e8c2-2c2d-96a87559e356	velikonočni ponedeljek	22	4	2019	t
00430000-566a-e8c2-c1a2-521d42f91762	velikonočni ponedeljek	13	4	2020	t
00430000-566a-e8c2-7cef-dfdbcc9dc365	velikonočni ponedeljek	5	4	2021	t
00430000-566a-e8c2-7d61-5db1be4d98f7	velikonočni ponedeljek	18	4	2022	t
00430000-566a-e8c2-ad57-d0466813d603	velikonočni ponedeljek	10	4	2023	t
00430000-566a-e8c2-cc0b-dfef6c96f6fa	velikonočni ponedeljek	1	4	2024	t
00430000-566a-e8c2-ba74-e90c5743ef82	velikonočni ponedeljek	21	4	2025	t
00430000-566a-e8c2-9bc4-e112718f2585	velikonočni ponedeljek	6	4	2026	t
00430000-566a-e8c2-3671-dff10cccd0c8	velikonočni ponedeljek	29	3	2027	t
00430000-566a-e8c2-dbbd-d994c31f0310	velikonočni ponedeljek	17	4	2028	t
00430000-566a-e8c2-fd4c-7789ff1dd881	velikonočni ponedeljek	2	4	2029	t
00430000-566a-e8c2-8ba8-b0bda8986543	velikonočni ponedeljek	22	4	2030	t
00430000-566a-e8c2-d92f-e6cd06ff9b34	binkoštna nedelja - binkošti	15	5	2016	t
00430000-566a-e8c2-80c8-5041a36865d1	binkoštna nedelja - binkošti	4	6	2017	t
00430000-566a-e8c2-b838-a6daa7b2e9a2	binkoštna nedelja - binkošti	20	5	2018	t
00430000-566a-e8c2-a5e1-0febe944a1f8	binkoštna nedelja - binkošti	9	6	2019	t
00430000-566a-e8c2-b694-d520235c4399	binkoštna nedelja - binkošti	31	5	2020	t
00430000-566a-e8c2-1e23-08347a7b9d0c	binkoštna nedelja - binkošti	23	5	2021	t
00430000-566a-e8c2-528c-552201a78f03	binkoštna nedelja - binkošti	5	6	2022	t
00430000-566a-e8c2-3a00-e5a3d8b36f76	binkoštna nedelja - binkošti	28	5	2023	t
00430000-566a-e8c2-4c7b-554cb8c353f8	binkoštna nedelja - binkošti	19	5	2024	t
00430000-566a-e8c2-071c-5518b01547b1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-566a-e8c2-7ab6-a2c902d1da24	binkoštna nedelja - binkošti	24	5	2026	t
00430000-566a-e8c2-7f76-b6f0e007f6da	binkoštna nedelja - binkošti	16	5	2027	t
00430000-566a-e8c2-ae50-bd1c85e59c1d	binkoštna nedelja - binkošti	4	6	2028	t
00430000-566a-e8c2-08bd-9105a00e4177	binkoštna nedelja - binkošti	20	5	2029	t
00430000-566a-e8c2-cefe-6113139892bf	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 32044049)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 32044061)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 32044209)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 32044636)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 32044646)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-566a-e8c5-c2b2-08fb81eb7cd7	00080000-566a-e8c5-669f-80d40a295874	0987	AK
00190000-566a-e8c5-abb0-c7ce27d1bbb4	00080000-566a-e8c5-b94d-09853618ff90	0989	AK
00190000-566a-e8c5-375a-f6dc09bf326b	00080000-566a-e8c5-7d79-ef836af70101	0986	AK
00190000-566a-e8c5-8f9a-dcbc3dcc2559	00080000-566a-e8c5-0294-21659dad3811	0984	AK
00190000-566a-e8c5-e513-a5f198ff2232	00080000-566a-e8c5-581d-d420266b5ec4	0983	AK
00190000-566a-e8c5-a801-1a6471e9a85c	00080000-566a-e8c5-342f-d651d5099b1c	0982	AK
00190000-566a-e8c7-060b-83162ee00e02	00080000-566a-e8c7-8bee-58b4ef0ea4fa	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 32044545)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-566a-e8c5-6eed-304f12f571fa	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 32044654)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32044238)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-566a-e8c4-0559-304d6bb2aa93	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-566a-e8c4-abcc-4f61874f826b	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-566a-e8c4-d018-562443869df1	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-566a-e8c4-c7b1-565b61a15a68	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-566a-e8c4-bb87-6d963c8c6df9	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-566a-e8c4-6dbf-8ec730155151	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-566a-e8c4-adec-169c9ce47b6f	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 32044182)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32044172)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32044383)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32044313)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 32044023)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 32043785)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-566a-e8c7-8bee-58b4ef0ea4fa	00010000-566a-e8c3-8386-0c0fa8f9e70d	2015-12-11 16:16:23	INS	a:0:{}
2	App\\Entity\\Option	00000000-566a-e8c7-8fe2-e8e7c56febde	00010000-566a-e8c3-8386-0c0fa8f9e70d	2015-12-11 16:16:23	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-566a-e8c7-060b-83162ee00e02	00010000-566a-e8c3-8386-0c0fa8f9e70d	2015-12-11 16:16:23	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 32044251)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 32043823)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-566a-e8c3-df0e-b61ed8b428ee	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-566a-e8c3-b998-b41abe1ecf8d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-566a-e8c3-53a5-b4c67d547228	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-566a-e8c3-1615-07270f1d2dc2	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-566a-e8c3-cc7f-c35d9f491a09	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-566a-e8c3-3bb0-728f8aa81923	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-566a-e8c3-582b-736903a29987	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-566a-e8c3-7d29-9575aa17912c	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-566a-e8c3-efe7-3a6431940d39	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-566a-e8c3-37a3-0a8edf13458c	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-566a-e8c3-38d7-38b12de656d4	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-566a-e8c3-22d9-7aa1ac33ad39	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-566a-e8c3-b8d1-bdaeec3908dc	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-566a-e8c3-2cd1-076ead35536b	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-566a-e8c3-72ab-5fcea43324fe	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-566a-e8c3-9f0b-69dc32562527	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-566a-e8c3-4868-72336129d3e7	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-566a-e8c3-77bd-63502b62134e	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-566a-e8c3-7e92-a56b27e1d800	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-566a-e8c3-da16-152d77d34463	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-566a-e8c3-7294-a2c73dd3ec40	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-566a-e8c3-a942-5c7816733618	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-566a-e8c3-dee5-6485c8821199	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-566a-e8c3-cfcc-2d8e7c5420f8	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-566a-e8c3-57d8-e909a9195349	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-566a-e8c3-d016-8de7d71bcf3e	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-566a-e8c3-8bfb-24323bd4d81d	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-566a-e8c3-c45b-f3fa38a6330a	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-566a-e8c3-248c-8f721d29cae1	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-566a-e8c3-6ec8-596935ce2427	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-566a-e8c3-634b-744bc7bc9b79	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-566a-e8c3-093f-f47e08636d12	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-566a-e8c3-9d81-57ec281138e2	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-566a-e8c3-7776-38d0ab493c2e	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-566a-e8c3-8cd0-6530eba85773	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-566a-e8c3-977f-103dc6f50dec	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-566a-e8c3-88a3-cb1129d27a2f	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-566a-e8c3-8717-db0a0987c33f	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-566a-e8c3-f935-6ce3f4f0b18f	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-566a-e8c3-d77e-782fa904266f	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-566a-e8c3-f593-8dea74dfb27e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-566a-e8c3-e516-7bc88690f5f8	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-566a-e8c3-f5a6-ef2950994063	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-566a-e8c3-3039-881886369ca5	arhivar	arhivar	t
00020000-566a-e8c5-f9b5-a68ddbc4b188	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-566a-e8c5-ceea-6226b2238b79	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-3191-c1889438f47f	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-e9f2-95fe0210f010	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-dfa0-52feeb770d88	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-639e-addba7070fee	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-c259-aaa2e8a5c2f7	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-7bc3-950ba706170e	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-110c-066b479bfaf0	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-6459-0680352b5a3d	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-1f24-d3320e8d7e2b	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-af96-08690a2f8765	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-a3ed-ef58c33df238	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-18f0-3168f5f75c32	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-c901-9539f9554e81	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-5129-28015625a9e1	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-9dfc-8e637175e3d4	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-9ce0-0d8f1e588208	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-f40b-e5b6e2ef08e9	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-6eaf-b7a4e6974835	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-566a-e8c5-ad59-9a47a13f9478	Trr-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-6612-dbc0d4288cff	Trr-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-b40f-7d8ce44aaa2c	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-59c7-9e41ac1091ba	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-a848-67b4ef5ae27b	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-7560-2e25c312b769	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-0e76-3ee08c5da0b7	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-d7b5-2a8da1ddf455	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-7983-d6bc19a97555	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-de23-7bbd14bec1a7	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-a4d8-e9cf5d364f24	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-ea07-e1d1bce6add8	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-576c-b4bcda106c27	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-38d8-4daa5e98df6a	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-566a-e8c5-182d-8aef83dc215e	Alternacija-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 32043807)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-566a-e8c3-b85f-dc3a19697f78	00020000-566a-e8c3-53a5-b4c67d547228
00010000-566a-e8c3-8386-0c0fa8f9e70d	00020000-566a-e8c3-53a5-b4c67d547228
00010000-566a-e8c5-50fa-443ba438fce1	00020000-566a-e8c5-f9b5-a68ddbc4b188
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-ceea-6226b2238b79
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-639e-addba7070fee
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-6459-0680352b5a3d
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-af96-08690a2f8765
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-18f0-3168f5f75c32
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-f40b-e5b6e2ef08e9
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-e9f2-95fe0210f010
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-ad59-9a47a13f9478
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-59c7-9e41ac1091ba
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-7560-2e25c312b769
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-d7b5-2a8da1ddf455
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-de23-7bbd14bec1a7
00010000-566a-e8c5-c303-95b674ca9eca	00020000-566a-e8c5-38d8-4daa5e98df6a
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-ceea-6226b2238b79
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-3191-c1889438f47f
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-e9f2-95fe0210f010
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-dfa0-52feeb770d88
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-18f0-3168f5f75c32
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-9dfc-8e637175e3d4
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-ad59-9a47a13f9478
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-59c7-9e41ac1091ba
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-7560-2e25c312b769
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-d7b5-2a8da1ddf455
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-de23-7bbd14bec1a7
00010000-566a-e8c5-e0cb-a7d9a301fdbf	00020000-566a-e8c5-38d8-4daa5e98df6a
00010000-566a-e8c5-19f0-ab5aa68db151	00020000-566a-e8c5-ceea-6226b2238b79
00010000-566a-e8c5-19f0-ab5aa68db151	00020000-566a-e8c5-3191-c1889438f47f
00010000-566a-e8c5-19f0-ab5aa68db151	00020000-566a-e8c5-e9f2-95fe0210f010
00010000-566a-e8c5-19f0-ab5aa68db151	00020000-566a-e8c5-dfa0-52feeb770d88
00010000-566a-e8c5-19f0-ab5aa68db151	00020000-566a-e8c5-af96-08690a2f8765
00010000-566a-e8c5-19f0-ab5aa68db151	00020000-566a-e8c5-18f0-3168f5f75c32
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-3191-c1889438f47f
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-c259-aaa2e8a5c2f7
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-1f24-d3320e8d7e2b
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-a3ed-ef58c33df238
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-af96-08690a2f8765
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-9ce0-0d8f1e588208
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-18f0-3168f5f75c32
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-c901-9539f9554e81
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-ad59-9a47a13f9478
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-6612-dbc0d4288cff
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-59c7-9e41ac1091ba
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-a848-67b4ef5ae27b
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-7560-2e25c312b769
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-0e76-3ee08c5da0b7
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-d7b5-2a8da1ddf455
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-7983-d6bc19a97555
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-de23-7bbd14bec1a7
00010000-566a-e8c5-7b28-3a68ac92446a	00020000-566a-e8c5-a4d8-e9cf5d364f24
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-3191-c1889438f47f
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-c259-aaa2e8a5c2f7
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-110c-066b479bfaf0
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-1f24-d3320e8d7e2b
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-a3ed-ef58c33df238
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-af96-08690a2f8765
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-9ce0-0d8f1e588208
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-18f0-3168f5f75c32
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-c901-9539f9554e81
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-5129-28015625a9e1
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-ad59-9a47a13f9478
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-6612-dbc0d4288cff
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-b40f-7d8ce44aaa2c
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-59c7-9e41ac1091ba
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-a848-67b4ef5ae27b
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-7560-2e25c312b769
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-0e76-3ee08c5da0b7
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-d7b5-2a8da1ddf455
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-7983-d6bc19a97555
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-de23-7bbd14bec1a7
00010000-566a-e8c5-5e40-803003491d3d	00020000-566a-e8c5-a4d8-e9cf5d364f24
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-3191-c1889438f47f
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-e9f2-95fe0210f010
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-c259-aaa2e8a5c2f7
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-7bc3-950ba706170e
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-110c-066b479bfaf0
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-639e-addba7070fee
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-1f24-d3320e8d7e2b
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-a3ed-ef58c33df238
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-af96-08690a2f8765
00010000-566a-e8c5-7d6d-b1d9f14f7674	00020000-566a-e8c5-9ce0-0d8f1e588208
00010000-566a-e8c5-d04b-bd74cfcbaa9f	00020000-566a-e8c5-ceea-6226b2238b79
00010000-566a-e8c5-d04b-bd74cfcbaa9f	00020000-566a-e8c5-dfa0-52feeb770d88
00010000-566a-e8c5-d04b-bd74cfcbaa9f	00020000-566a-e8c5-639e-addba7070fee
00010000-566a-e8c5-d04b-bd74cfcbaa9f	00020000-566a-e8c5-6459-0680352b5a3d
00010000-566a-e8c5-d04b-bd74cfcbaa9f	00020000-566a-e8c5-af96-08690a2f8765
00010000-566a-e8c5-d04b-bd74cfcbaa9f	00020000-566a-e8c5-18f0-3168f5f75c32
00010000-566a-e8c5-d04b-bd74cfcbaa9f	00020000-566a-e8c5-f40b-e5b6e2ef08e9
00010000-566a-e8c5-d04b-bd74cfcbaa9f	00020000-566a-e8c5-ea07-e1d1bce6add8
00010000-566a-e8c5-33bf-a75e62dcb21b	00020000-566a-e8c5-6eaf-b7a4e6974835
\.


--
-- TOC entry 3146 (class 0 OID 32044265)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32044203)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32044149)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-566a-e8c5-1ff1-8c31b9cd34ae	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-566a-e8c5-ee62-a126bca1f43f	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-566a-e8c5-bd7e-ab81145e779d	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 32043772)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-566a-e8c2-2d11-027bff96e0b2	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-566a-e8c2-8636-9d2d8be75391	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-566a-e8c2-480e-317654b512c7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-566a-e8c2-5d71-2158b03c7ce2	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-566a-e8c2-7672-31b08c329bb4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 32043764)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-566a-e8c2-0afc-6347d3ef507c	00230000-566a-e8c2-5d71-2158b03c7ce2	popa
00240000-566a-e8c2-bbdf-90097d91f59e	00230000-566a-e8c2-5d71-2158b03c7ce2	oseba
00240000-566a-e8c2-2c57-ff8492e06f89	00230000-566a-e8c2-5d71-2158b03c7ce2	tippopa
00240000-566a-e8c2-e933-853a1793a350	00230000-566a-e8c2-5d71-2158b03c7ce2	organizacijskaenota
00240000-566a-e8c2-e56f-a8a264c55dd9	00230000-566a-e8c2-5d71-2158b03c7ce2	sezona
00240000-566a-e8c2-0f2e-793aad3595e9	00230000-566a-e8c2-5d71-2158b03c7ce2	tipvaje
00240000-566a-e8c2-67fc-3cb29d45cdb8	00230000-566a-e8c2-8636-9d2d8be75391	prostor
00240000-566a-e8c2-7792-027e8c7b2707	00230000-566a-e8c2-5d71-2158b03c7ce2	besedilo
00240000-566a-e8c2-e92f-868610a926ff	00230000-566a-e8c2-5d71-2158b03c7ce2	uprizoritev
00240000-566a-e8c2-2bbe-b7252785b4ef	00230000-566a-e8c2-5d71-2158b03c7ce2	funkcija
00240000-566a-e8c2-7230-4da6bdeccee8	00230000-566a-e8c2-5d71-2158b03c7ce2	tipfunkcije
00240000-566a-e8c2-a2be-b46e071bc474	00230000-566a-e8c2-5d71-2158b03c7ce2	alternacija
00240000-566a-e8c2-354b-29e8a3258293	00230000-566a-e8c2-2d11-027bff96e0b2	pogodba
00240000-566a-e8c2-58e3-14adf182e2f5	00230000-566a-e8c2-5d71-2158b03c7ce2	zaposlitev
00240000-566a-e8c2-f5bc-0c728d9becf7	00230000-566a-e8c2-5d71-2158b03c7ce2	zvrstuprizoritve
00240000-566a-e8c2-02f7-2e27db5f0eb9	00230000-566a-e8c2-2d11-027bff96e0b2	programdela
00240000-566a-e8c2-e255-59c8562b34ba	00230000-566a-e8c2-5d71-2158b03c7ce2	zapis
\.


--
-- TOC entry 3095 (class 0 OID 32043759)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f8907ca7-a758-41e7-83a9-6c5f95d80814	00240000-566a-e8c2-0afc-6347d3ef507c	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 32044330)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-566a-e8c5-35de-d8d4c804f492	000e0000-566a-e8c5-80fc-447b875b0e16	00080000-566a-e8c5-694b-a8ee323392d4	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-566a-e8c2-9917-2273454f34ab
00270000-566a-e8c5-68b9-01a9df1f75db	000e0000-566a-e8c5-80fc-447b875b0e16	00080000-566a-e8c5-694b-a8ee323392d4	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-566a-e8c2-9917-2273454f34ab
\.


--
-- TOC entry 3111 (class 0 OID 32043907)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 32044159)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-566a-e8c5-4567-2eb75430b953	00180000-566a-e8c5-df9a-0a2aad980ad8	000c0000-566a-e8c5-d2c6-e58a05a2e6fd	00090000-566a-e8c5-26f0-0424381b7030	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566a-e8c5-2138-451253d51e11	00180000-566a-e8c5-df9a-0a2aad980ad8	000c0000-566a-e8c5-ed78-be20eb5d4800	00090000-566a-e8c5-1b1a-7bed385b2d3c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566a-e8c5-c55d-02fadeeebfcf	00180000-566a-e8c5-df9a-0a2aad980ad8	000c0000-566a-e8c5-f273-8409bf490d8b	00090000-566a-e8c5-7909-3c2f83a35860	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566a-e8c5-e7c6-72b522dd3f75	00180000-566a-e8c5-df9a-0a2aad980ad8	000c0000-566a-e8c5-9eb6-6df5c429d6b9	00090000-566a-e8c5-fbea-47dfc1e7fa1b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566a-e8c5-bc79-8c5a98b04833	00180000-566a-e8c5-df9a-0a2aad980ad8	000c0000-566a-e8c5-8831-342fdab11db8	00090000-566a-e8c5-d997-e5b571a5e983	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566a-e8c5-4df5-423a665a9bd6	00180000-566a-e8c5-dbc0-5d1efa7bca64	\N	00090000-566a-e8c5-d997-e5b571a5e983	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-566a-e8c5-662c-5b916b671df8	00180000-566a-e8c5-dbc0-5d1efa7bca64	\N	00090000-566a-e8c5-1b1a-7bed385b2d3c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 32044371)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-566a-e8c2-799a-c5a8a0fe1fa4	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-566a-e8c2-f3d3-54927904badb	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-566a-e8c2-433f-b5e11b682e8b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-566a-e8c2-3219-6e38eb5e9b42	04	Režija	Režija	Režija	umetnik	30
000f0000-566a-e8c2-22cd-c088c89c9257	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-566a-e8c2-984c-e22d2b491a48	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-566a-e8c2-4b4e-040e23bb85eb	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-566a-e8c2-7fb6-c718cb905747	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-566a-e8c2-f45f-eab321b57269	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-566a-e8c2-0c21-75e289e5ff8f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-566a-e8c2-a864-28c4c768f067	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-566a-e8c2-c4ab-a643602103be	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-566a-e8c2-6285-8f04a688668f	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-566a-e8c2-675d-a7d26e259c65	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-566a-e8c2-b8ac-223865c067a2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-566a-e8c2-7368-5d93619dd83f	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-566a-e8c2-435c-e9d90b8ed08f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-566a-e8c2-6da5-1eb42cbab2df	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 32043858)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-566a-e8c4-8272-9ae50ad5dbf4	0001	šola	osnovna ali srednja šola
00400000-566a-e8c4-a271-47fa1489264d	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-566a-e8c4-8234-5a4b0321ca2e	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 32044666)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-566a-e8c2-6075-0df0c64f4c00	01	Velika predstava	f	1.00	1.00
002b0000-566a-e8c2-b21d-a7f1a0b316c8	02	Mala predstava	f	0.50	0.50
002b0000-566a-e8c2-efc8-795617761dd7	03	Mala koprodukcija	t	0.40	1.00
002b0000-566a-e8c2-149c-5d46926ab2f6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-566a-e8c2-9839-e6b1e44ae000	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 32044139)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-566a-e8c2-ad47-aafa60242adc	0001	prva vaja	prva vaja
00420000-566a-e8c2-6f8f-2db887f0e0d4	0002	tehnična vaja	tehnična vaja
00420000-566a-e8c2-b465-67eac9190f1c	0003	lučna vaja	lučna vaja
00420000-566a-e8c2-f978-fc9c13ba3782	0004	kostumska vaja	kostumska vaja
00420000-566a-e8c2-8111-9051beea1c9c	0005	foto vaja	foto vaja
00420000-566a-e8c2-6e78-e83caa3139b2	0006	1. glavna vaja	1. glavna vaja
00420000-566a-e8c2-04cb-9978e9482737	0007	2. glavna vaja	2. glavna vaja
00420000-566a-e8c2-dd61-ed4dd002392d	0008	1. generalka	1. generalka
00420000-566a-e8c2-84ca-f8df12374791	0009	2. generalka	2. generalka
00420000-566a-e8c2-15ee-e6360bb0e5a8	0010	odprta generalka	odprta generalka
00420000-566a-e8c2-9606-6dcbe023838f	0011	obnovitvena vaja	obnovitvena vaja
00420000-566a-e8c2-a5a2-488630928da8	0012	italijanka	krajša "obnovitvena" vaja
00420000-566a-e8c2-17cd-cd74be45316d	0013	pevska vaja	pevska vaja
00420000-566a-e8c2-05cf-0c86ad31c61d	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-566a-e8c2-7c6d-99555a5c19ed	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 32043980)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 32043794)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-566a-e8c3-8386-0c0fa8f9e70d	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROk3A0YF.i7OODlj1eawaRPrO6MC3Rj0K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-cc46-b5cbea27854d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-0771-f698901f98cb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-e7d6-39ae25ca6b04	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-81ea-235458c51931	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-cb33-cae22c03eeb0	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-bacf-e29a83a82f6a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-47d7-62d30772ec0a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-4a7f-e933dff66a84	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-af84-3aebd7e11651	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-50fa-443ba438fce1	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-bf43-6a40efdf9533	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-c303-95b674ca9eca	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-e0cb-a7d9a301fdbf	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-19f0-ab5aa68db151	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-7b28-3a68ac92446a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-5e40-803003491d3d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-7d6d-b1d9f14f7674	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-d04b-bd74cfcbaa9f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-566a-e8c5-33bf-a75e62dcb21b	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-566a-e8c3-b85f-dc3a19697f78	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 32044421)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-566a-e8c5-c781-f78442dec5e7	00160000-566a-e8c4-8f58-a38b41ddf0e4	\N	00140000-566a-e8c2-ff8f-35c243e8ca8a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-566a-e8c4-bb87-6d963c8c6df9
000e0000-566a-e8c5-80fc-447b875b0e16	00160000-566a-e8c4-cd7c-a49ce1591567	\N	00140000-566a-e8c2-0375-2a48b4a4c449	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-566a-e8c4-6dbf-8ec730155151
000e0000-566a-e8c5-c775-ada7059e09e4	\N	\N	00140000-566a-e8c2-0375-2a48b4a4c449	00190000-566a-e8c5-c2b2-08fb81eb7cd7	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-566a-e8c4-bb87-6d963c8c6df9
000e0000-566a-e8c5-a09f-dcc5908bb02b	\N	\N	00140000-566a-e8c2-0375-2a48b4a4c449	00190000-566a-e8c5-c2b2-08fb81eb7cd7	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-566a-e8c4-bb87-6d963c8c6df9
000e0000-566a-e8c5-6aca-cddaabb71bda	\N	\N	00140000-566a-e8c2-0375-2a48b4a4c449	00190000-566a-e8c5-c2b2-08fb81eb7cd7	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-566a-e8c4-0559-304d6bb2aa93
000e0000-566a-e8c5-7b2f-d85d9f673fdc	\N	\N	00140000-566a-e8c2-0375-2a48b4a4c449	00190000-566a-e8c5-c2b2-08fb81eb7cd7	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-566a-e8c4-0559-304d6bb2aa93
\.


--
-- TOC entry 3125 (class 0 OID 32044079)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-566a-e8c5-04ce-56389419f893	\N	000e0000-566a-e8c5-80fc-447b875b0e16	1	
00200000-566a-e8c5-549f-0a6bb173de3d	\N	000e0000-566a-e8c5-80fc-447b875b0e16	2	
00200000-566a-e8c5-1cb5-de1df7ebd39d	\N	000e0000-566a-e8c5-80fc-447b875b0e16	3	
00200000-566a-e8c5-ae0a-0f71c90a72f5	\N	000e0000-566a-e8c5-80fc-447b875b0e16	4	
00200000-566a-e8c5-dc29-37a2c52c2c0e	\N	000e0000-566a-e8c5-80fc-447b875b0e16	5	
\.


--
-- TOC entry 3142 (class 0 OID 32044230)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 32044344)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-566a-e8c2-d335-4d814af690da	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-566a-e8c2-a852-0dd081249e89	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-566a-e8c2-ba3e-8c024a5970da	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-566a-e8c2-f607-e874eee50ba8	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-566a-e8c2-409f-c86f2f690c90	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-566a-e8c2-c497-2ef21b468fd9	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-566a-e8c2-2aef-9944d1953f18	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-566a-e8c2-278c-d4b309cb3ec1	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-566a-e8c2-9917-2273454f34ab	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-566a-e8c2-e776-9c54885595d7	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-566a-e8c2-bd5b-82b4bf69da3a	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-566a-e8c2-6f22-1a76f75c1d98	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-566a-e8c2-7a06-eb314ea4fd16	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-566a-e8c2-99d8-1648ef2a197c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-566a-e8c2-a17b-154eff87163e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-566a-e8c2-c68a-bbe55e76382d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-566a-e8c2-6fe7-d801cfb9a4c9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-566a-e8c2-d75c-7d339f42a336	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-566a-e8c2-2868-f40a293bb5ee	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-566a-e8c2-18cb-6f814d16cfb6	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-566a-e8c2-36bd-c159be81f738	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-566a-e8c2-510a-d735f0a87967	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-566a-e8c2-f822-2135b868916b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-566a-e8c2-74bb-c95cfa9d03cc	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-566a-e8c2-2ab6-40c59189a984	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-566a-e8c2-ba19-5db29c35c396	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-566a-e8c2-fa02-c61a2bbffc8c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-566a-e8c2-c742-bb6815667ce5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 32044716)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 32044685)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 32044728)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32044302)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-566a-e8c5-8959-68c01374e91d	00090000-566a-e8c5-1b1a-7bed385b2d3c	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566a-e8c5-d782-bf21602ea4d6	00090000-566a-e8c5-7909-3c2f83a35860	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566a-e8c5-e828-0ccdeca7cee6	00090000-566a-e8c5-872e-2fa3ee13b530	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566a-e8c5-7bd6-7c5b00d4e06b	00090000-566a-e8c5-0fa1-e0fc51b6f5d5	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566a-e8c5-7834-25293b0a5517	00090000-566a-e8c5-74d2-8801f2fe6f2e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566a-e8c5-9190-35f1fba12b6d	00090000-566a-e8c5-495a-e317bbe134e4	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 32044123)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 32044411)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-566a-e8c2-ff8f-35c243e8ca8a	01	Drama	drama (SURS 01)
00140000-566a-e8c2-01b2-5fcacc25ad34	02	Opera	opera (SURS 02)
00140000-566a-e8c2-3a3a-2f967063f4cc	03	Balet	balet (SURS 03)
00140000-566a-e8c2-7ad2-a59576f515ac	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-566a-e8c2-b368-fa2e368af685	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-566a-e8c2-0375-2a48b4a4c449	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-566a-e8c2-8e79-6d42f19552a8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 32044292)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 32043857)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 32044470)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 32044460)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32043848)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 32044327)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32044369)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 32044769)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32044111)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 32044133)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 32044138)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 32044683)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 32044006)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32044539)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 32044288)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32044077)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 32044044)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 32044020)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 32044195)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 32044746)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32044753)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 32044777)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 32028299)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 32044222)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32043978)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 32043876)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 32043940)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 32043903)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 32043837)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 32043822)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32044228)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32044264)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 32044406)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 32043931)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 32043966)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 32044634)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 32044201)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 32043956)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 32044096)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 32044065)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 32044057)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 32044213)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 32044643)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 32044651)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 32044621)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32044664)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 32044246)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 32044186)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 32044177)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32044393)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 32044320)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32044032)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32043793)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 32044255)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 32043811)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 32043831)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 32044273)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 32044208)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 32044157)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 32043781)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 32043769)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 32043763)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 32044340)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 32043912)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 32044168)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 32044380)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 32043865)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 32044676)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 32044146)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 32043991)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32043806)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 32044439)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 32044086)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 32044236)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32044352)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32044726)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32044710)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 32044734)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 32044310)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 32044127)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 32044419)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 32044300)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 32044121)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 32044122)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 32044120)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 32044119)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 32044118)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 32044341)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 32044342)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 32044343)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 32044748)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 32044747)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 32043933)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 32043934)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 32044229)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 32044714)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 32044713)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 32044715)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 32044712)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 32044711)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 32044215)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 32044214)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 32044087)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 32044088)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 32044289)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 32044291)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 32044290)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 32044022)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 32044021)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 32044665)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 32044408)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 32044409)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 32044410)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 32044735)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 32044444)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 32044441)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 32044445)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 32044443)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 32044442)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 32043993)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32043992)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 32043906)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 32044256)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 32043838)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 32043839)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 32044276)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 32044275)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 32044274)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 32043943)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 32043942)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 32043944)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 32044060)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 32044058)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 32044059)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 32043771)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 32044181)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 32044179)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 32044178)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 32044180)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 32043812)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 32043813)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 32044237)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 32044770)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 32044329)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 32044328)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 32044778)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 32044779)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 32044202)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 32044321)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 32044322)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 32044544)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 32044543)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 32044540)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 32044541)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 32044542)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 32043958)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 32043957)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 32043959)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 32044250)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 32044249)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 32044644)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 32044645)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 32044474)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 32044475)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 32044472)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 32044473)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 32044311)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 32044312)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 32044190)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 32044189)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 32044187)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 32044188)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 32044462)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 32044461)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 32044033)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 32044047)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 32044046)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 32044045)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 32044048)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 32044078)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 32044066)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 32044067)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 32044635)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 32044684)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 32044754)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 32044755)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 32043878)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 32043877)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 32043913)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 32043914)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 32044128)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 32044171)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 32044170)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 32044169)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 32044113)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 32044114)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 32044117)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 32044112)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 32044116)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 32044115)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 32043932)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32043866)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 32043867)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 32044007)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32044009)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 32044008)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 32044010)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 32044196)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 32044407)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 32044440)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 32044381)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 32044382)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 32043904)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 32043905)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 32044301)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 32043782)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 32043979)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 32043941)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 32043770)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 32044677)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 32044248)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 32044247)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 32044147)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 32044148)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 32044471)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 32043967)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 32044420)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 32044727)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 32044652)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 32044653)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 32044370)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 32044158)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 32043832)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 32044950)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 32044955)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 32044980)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 32044970)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 32044945)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 32044965)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 32044975)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 32044960)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 32045150)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 32045155)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 32045160)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 32045325)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 32045320)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 32044835)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 32044840)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 32045065)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 32045305)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 32045300)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 32045310)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 32045295)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 32045290)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 32045060)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 32045055)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 32044935)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 32044940)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 32045105)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 32045115)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 32045110)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 32044890)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 32044885)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 32045045)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 32045280)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 32045165)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 32045170)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 32045175)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 32045315)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 32045195)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 32045180)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 32045200)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 32045190)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 32045185)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 32044880)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 32044875)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 32044820)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 32044815)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 32045085)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 32044795)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 32044800)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 32045100)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 32045095)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 32045090)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 32044850)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 32044845)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 32044855)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 32044915)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 32044905)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 32044910)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 32044780)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 32045020)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 32045010)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 32045005)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 32045015)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 32044785)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 32044790)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 32045070)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 32045340)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32045145)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 32045140)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 32045345)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 32045350)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 32045050)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 32045130)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 32045135)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 32045255)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 32045250)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 32045235)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 32045240)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 32045245)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 32044865)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 32044860)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 32044870)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 32045080)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 32045075)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 32045265)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 32045270)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 32045225)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 32045230)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 32045215)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 32045220)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 32045120)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 32045125)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 32045040)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 32045035)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 32045025)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 32045030)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 32045210)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 32045205)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 32044895)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 32044900)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 32044930)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 32044920)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 32044925)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 32045260)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 32045275)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 32045285)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 32045330)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 32045335)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 32044810)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 32044805)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 32044825)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 32044830)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 32044985)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 32045000)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 32044995)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 32044990)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-11 16:16:25 CET

--
-- PostgreSQL database dump complete
--

