--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-19 10:04:46 CET

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
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 28441103)
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
-- TOC entry 237 (class 1259 OID 28441717)
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
-- TOC entry 236 (class 1259 OID 28441700)
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
-- TOC entry 182 (class 1259 OID 28441096)
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
-- TOC entry 181 (class 1259 OID 28441094)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 28441577)
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
-- TOC entry 230 (class 1259 OID 28441607)
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
-- TOC entry 251 (class 1259 OID 28442008)
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
-- TOC entry 203 (class 1259 OID 28441351)
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
-- TOC entry 205 (class 1259 OID 28441383)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 28441388)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 28441930)
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
-- TOC entry 194 (class 1259 OID 28441248)
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
-- TOC entry 238 (class 1259 OID 28441730)
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
-- TOC entry 223 (class 1259 OID 28441531)
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
-- TOC entry 200 (class 1259 OID 28441322)
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
-- TOC entry 197 (class 1259 OID 28441288)
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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 28441265)
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
-- TOC entry 212 (class 1259 OID 28441445)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 28441988)
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
-- TOC entry 250 (class 1259 OID 28442001)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 28442023)
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
-- TOC entry 216 (class 1259 OID 28441470)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 28441222)
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
-- TOC entry 185 (class 1259 OID 28441122)
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
-- TOC entry 189 (class 1259 OID 28441189)
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
-- TOC entry 186 (class 1259 OID 28441133)
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
-- TOC entry 178 (class 1259 OID 28441068)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 28441087)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 28441477)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 28441511)
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
-- TOC entry 233 (class 1259 OID 28441648)
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
-- TOC entry 188 (class 1259 OID 28441169)
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
-- TOC entry 191 (class 1259 OID 28441214)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 28441875)
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
-- TOC entry 213 (class 1259 OID 28441451)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 28441199)
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
-- TOC entry 202 (class 1259 OID 28441343)
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
-- TOC entry 198 (class 1259 OID 28441303)
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
-- TOC entry 199 (class 1259 OID 28441315)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 28441463)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 28441889)
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
-- TOC entry 242 (class 1259 OID 28441899)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 28441798)
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
-- TOC entry 243 (class 1259 OID 28441907)
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
    programrazno_id uuid
);


--
-- TOC entry 219 (class 1259 OID 28441492)
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
-- TOC entry 211 (class 1259 OID 28441436)
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
-- TOC entry 210 (class 1259 OID 28441426)
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
-- TOC entry 232 (class 1259 OID 28441637)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 28441567)
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
-- TOC entry 196 (class 1259 OID 28441277)
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
-- TOC entry 175 (class 1259 OID 28441039)
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
-- TOC entry 174 (class 1259 OID 28441037)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 28441505)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 28441077)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 28441061)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 28441519)
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
-- TOC entry 214 (class 1259 OID 28441457)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 28441403)
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
-- TOC entry 173 (class 1259 OID 28441026)
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
-- TOC entry 172 (class 1259 OID 28441018)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 28441013)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 28441584)
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
-- TOC entry 187 (class 1259 OID 28441161)
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
-- TOC entry 209 (class 1259 OID 28441413)
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
-- TOC entry 231 (class 1259 OID 28441625)
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
-- TOC entry 184 (class 1259 OID 28441112)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 28441918)
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
-- TOC entry 207 (class 1259 OID 28441393)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 28441234)
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
-- TOC entry 176 (class 1259 OID 28441048)
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
-- TOC entry 235 (class 1259 OID 28441675)
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
-- TOC entry 201 (class 1259 OID 28441333)
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
-- TOC entry 218 (class 1259 OID 28441484)
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
-- TOC entry 229 (class 1259 OID 28441598)
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
-- TOC entry 247 (class 1259 OID 28441968)
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
-- TOC entry 246 (class 1259 OID 28441937)
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
-- TOC entry 248 (class 1259 OID 28441980)
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
-- TOC entry 225 (class 1259 OID 28441556)
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
-- TOC entry 204 (class 1259 OID 28441377)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 28441665)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 28441546)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 28441099)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 28441042)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 28441103)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-564d-90ab-211b-b968ae74cc60	10	30	Otroci	Abonma za otroke	200
000a0000-564d-90ab-a00b-a0dafc6c2eba	20	60	Mladina	Abonma za mladino	400
000a0000-564d-90ab-d54f-c41dc5089441	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 28441717)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-564d-90ab-8944-fd31b4b14dd3	000d0000-564d-90ab-1045-199c66e87baf	\N	00090000-564d-90ab-ceeb-82ff21091ef5	000b0000-564d-90ab-7847-9120806ebf55	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-564d-90ab-8d88-989b1a88b51b	000d0000-564d-90ab-a9de-6ddde6351945	00100000-564d-90ab-bed5-ffab375d4368	00090000-564d-90ab-2d34-16d734ad737a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-564d-90ab-8c59-b13a4d192b05	000d0000-564d-90ab-5776-9bc6e5aff28f	00100000-564d-90ab-bc48-ecb41f1538d0	00090000-564d-90ab-deb2-562b7665cf9d	\N	0003	t	\N	2015-11-19	\N	2	t	\N	f	f
000c0000-564d-90ab-c988-677fe9b90404	000d0000-564d-90ab-5743-9a7b0493a7b2	\N	00090000-564d-90ab-ad40-b08c54cd53ae	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-564d-90ab-7f7b-451a6977b0ae	000d0000-564d-90ab-4f26-321b88800071	\N	00090000-564d-90ab-b122-763c7841bef3	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-564d-90ab-687c-c7ccc15bc534	000d0000-564d-90ab-5b2c-111c9fa5a2f9	\N	00090000-564d-90ab-ef8f-87f68ff47936	000b0000-564d-90ab-f425-1ce2baaa995c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-564d-90ab-5111-c668c99723f8	000d0000-564d-90ab-91d5-f9c3986d810b	00100000-564d-90ab-1815-d9e5029a39e1	00090000-564d-90ab-f7b3-ac39b93d94ee	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-564d-90ab-5f8a-9adcddf9be40	000d0000-564d-90ab-72c6-ba27c299fcdd	\N	00090000-564d-90ab-7d53-dedbae760bf0	000b0000-564d-90ab-480f-69ef1421d4b8	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-564d-90ab-1d53-1ceffc9a6b31	000d0000-564d-90ab-91d5-f9c3986d810b	00100000-564d-90ab-24b5-8bd3b08235fd	00090000-564d-90ab-b287-c11472b62e08	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-564d-90ab-687b-ad6d613e8216	000d0000-564d-90ab-91d5-f9c3986d810b	00100000-564d-90ab-bf75-275acd0ee5be	00090000-564d-90ab-89ae-bccb048aa725	\N	0010	t	\N	2015-11-19	\N	16	f	\N	f	t
000c0000-564d-90ab-6d27-ea84f73dd7ba	000d0000-564d-90ab-91d5-f9c3986d810b	00100000-564d-90ab-bd37-ad80c1839a5d	00090000-564d-90ab-9a47-4db7dae8aab2	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-564d-90ab-5382-8a9d15b16dfc	000d0000-564d-90ab-80b9-96d4b7b18b44	00100000-564d-90ab-bed5-ffab375d4368	00090000-564d-90ab-2d34-16d734ad737a	000b0000-564d-90ab-3516-e7c25df8c765	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 28441700)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 28441096)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 28441577)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-564d-90ab-10ad-98b4cbcdf4ea	00160000-564d-90aa-311b-dfa709853258	00090000-564d-90ab-7e32-2635d0e7df65	aizv	10	t
003d0000-564d-90ab-4822-8437d92c8ff2	00160000-564d-90aa-311b-dfa709853258	00090000-564d-90ab-f5e7-3a9ae4d0a714	apri	14	t
003d0000-564d-90ab-4d0e-b20e46125961	00160000-564d-90aa-ce4d-b5a386fadd24	00090000-564d-90ab-507e-b4b0fe7492ac	aizv	11	t
003d0000-564d-90ab-9dc8-f7423f333533	00160000-564d-90aa-c1ed-775eaf75295f	00090000-564d-90ab-a58f-d540aafcf6bd	aizv	12	t
003d0000-564d-90ab-ab15-6c55ce4500a9	00160000-564d-90aa-311b-dfa709853258	00090000-564d-90ab-2a92-04ceb1debb85	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 28441607)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-564d-90aa-311b-dfa709853258	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-564d-90aa-ce4d-b5a386fadd24	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-564d-90aa-c1ed-775eaf75295f	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 28442008)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 28441351)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-564d-90ab-919c-9ed87573e4e6	\N	\N	00200000-564d-90ab-b32c-b9015915547d	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-564d-90ab-ecb4-18d75b43c5cc	\N	\N	00200000-564d-90ab-fda1-9ea734a36d94	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-564d-90ab-70fb-84631a9d3fd0	\N	\N	00200000-564d-90ab-7c14-f9f97176b934	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-564d-90ab-39e4-5fe2a92a5919	\N	\N	00200000-564d-90ab-25d7-9652ec239968	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-564d-90ab-9597-54d769a77158	\N	\N	00200000-564d-90ab-b991-cc58fd238ad3	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 28441383)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 28441388)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 28441930)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 28441248)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-564d-90a9-8ffa-6033890651e9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-564d-90a9-86db-944e8b8e5c36	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-564d-90a9-edde-2c9cbe540960	AL	ALB	008	Albania 	Albanija	\N
00040000-564d-90a9-41ff-66e052554c1e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-564d-90a9-4d69-bacdd2f8dbf8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-564d-90a9-53ca-bd6f47625a98	AD	AND	020	Andorra 	Andora	\N
00040000-564d-90a9-f838-b8a6dea021fa	AO	AGO	024	Angola 	Angola	\N
00040000-564d-90a9-ac40-ac5c9c66b9a1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-564d-90a9-0aa6-3a29bd73234b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-564d-90a9-708e-13133eec1604	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-564d-90a9-1681-05fde30bd644	AR	ARG	032	Argentina 	Argenitna	\N
00040000-564d-90a9-7b4f-d31936d14afc	AM	ARM	051	Armenia 	Armenija	\N
00040000-564d-90a9-2f0d-2816ada8bd0f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-564d-90a9-4ee2-7ed639fa552a	AU	AUS	036	Australia 	Avstralija	\N
00040000-564d-90a9-3ecb-fa91f70c522b	AT	AUT	040	Austria 	Avstrija	\N
00040000-564d-90a9-c9db-46593820dd89	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-564d-90a9-0028-38ca7db3b55b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-564d-90a9-59a2-4dfe662c905c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-564d-90a9-79c3-38939131d94e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-564d-90a9-df14-eaed163ef80a	BB	BRB	052	Barbados 	Barbados	\N
00040000-564d-90a9-e66c-d2fb4a5679ba	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-564d-90a9-1cac-f35a290ba864	BE	BEL	056	Belgium 	Belgija	\N
00040000-564d-90a9-07a4-3a814b70a42b	BZ	BLZ	084	Belize 	Belize	\N
00040000-564d-90a9-b0b5-95314e76b2a0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-564d-90a9-16cb-16a9dd9f2136	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-564d-90a9-afbe-44e281569ff4	BT	BTN	064	Bhutan 	Butan	\N
00040000-564d-90a9-65d7-0a3f30c8becc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-564d-90a9-1847-ac537c1fe381	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-564d-90a9-e64f-93e482144429	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-564d-90a9-1878-714fa59eceb1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-564d-90a9-55fe-9ffd76d55f7c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-564d-90a9-c88d-2185b5b9b4ff	BR	BRA	076	Brazil 	Brazilija	\N
00040000-564d-90a9-1fd7-e99bbde15bf2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-564d-90a9-d34b-63e09da1b40b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-564d-90a9-8ac1-5419e45c2539	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-564d-90a9-a511-e56c7d00ff07	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-564d-90a9-f340-6823cbeec36d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-564d-90a9-3efa-d9551df6e122	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-564d-90a9-675f-a7d84452a69b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-564d-90a9-c632-edc9969cdc3c	CA	CAN	124	Canada 	Kanada	\N
00040000-564d-90a9-cfc5-10799add2ba4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-564d-90a9-362e-0be0662150b0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-564d-90a9-1bff-69e3a3cfb81a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-564d-90a9-e93f-c1d08f80c491	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-564d-90a9-4a41-1ad74d948776	CL	CHL	152	Chile 	Čile	\N
00040000-564d-90a9-72b2-848710ddb7cb	CN	CHN	156	China 	Kitajska	\N
00040000-564d-90a9-1c9d-d54a87e5b1b7	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-564d-90a9-052d-9fb2e850c2e4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-564d-90a9-8357-3d16b514c4f4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-564d-90a9-a3cf-aea130b164b2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-564d-90a9-5748-dbbe26cb4278	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-564d-90a9-59bf-bc88ceaa0f03	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-564d-90a9-c5b1-9d1510de90aa	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-564d-90a9-db4b-eb6feb288b95	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-564d-90a9-a20f-4b63ba046420	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-564d-90a9-5b34-48d9c44ff0a9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-564d-90a9-c74d-69aafe99d3ed	CU	CUB	192	Cuba 	Kuba	\N
00040000-564d-90a9-0d41-bec7f32eefc8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-564d-90a9-a78b-c7247e47d7a9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-564d-90a9-9431-589b2afb2302	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-564d-90a9-c4bb-ecb365a779b6	DK	DNK	208	Denmark 	Danska	\N
00040000-564d-90a9-aba7-b61b529994bb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-564d-90a9-f867-b4dcf1f95ead	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-564d-90a9-90b3-01757bb0a8ba	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-564d-90a9-112c-ee6b2de79840	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-564d-90a9-2fa5-9adf9343af59	EG	EGY	818	Egypt 	Egipt	\N
00040000-564d-90a9-89e5-d7b77ec02b6b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-564d-90a9-e35b-9c830bff2731	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-564d-90a9-6f0c-f6a3b65d377f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-564d-90a9-5116-9b7582a1dc73	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-564d-90a9-66f4-44226a083d66	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-564d-90a9-6696-dbd8099e3f19	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-564d-90a9-95a9-7f562561a583	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-564d-90a9-c493-7cc6d8e1e6ad	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-564d-90a9-dc60-1b97a7472c3f	FI	FIN	246	Finland 	Finska	\N
00040000-564d-90a9-74fa-710d9a1363de	FR	FRA	250	France 	Francija	\N
00040000-564d-90a9-64c6-02fe54a2d05b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-564d-90a9-abab-8dddfd04816a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-564d-90a9-b1c2-9d37b02240bf	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-564d-90a9-9d29-4c63593b0190	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-564d-90a9-f043-cbd1e3be1638	GA	GAB	266	Gabon 	Gabon	\N
00040000-564d-90a9-7a3f-582c2f860903	GM	GMB	270	Gambia 	Gambija	\N
00040000-564d-90a9-7a89-772af1972fe3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-564d-90a9-efce-3fef37779374	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-564d-90a9-22f7-561b5f11c899	GH	GHA	288	Ghana 	Gana	\N
00040000-564d-90a9-34d7-da42054181c1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-564d-90a9-380d-f6797888aad7	GR	GRC	300	Greece 	Grčija	\N
00040000-564d-90a9-440f-35f171d06a69	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-564d-90a9-3545-125ac860a548	GD	GRD	308	Grenada 	Grenada	\N
00040000-564d-90a9-1c22-3abf8f42c481	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-564d-90a9-406b-308a71dabb09	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-564d-90a9-9ff4-c1c3147da459	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-564d-90a9-1f90-7aac6bdeac2d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-564d-90a9-810a-f08d60df58c7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-564d-90a9-0075-b887d9bd2262	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-564d-90a9-f185-4fbcb0ce94a0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-564d-90a9-ab69-b260e29a1fa2	HT	HTI	332	Haiti 	Haiti	\N
00040000-564d-90a9-5a04-c7c5e4d06aca	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-564d-90a9-29db-00aee50d77a5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-564d-90a9-7989-f62a941c3eb3	HN	HND	340	Honduras 	Honduras	\N
00040000-564d-90a9-6fee-7d212179a391	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-564d-90a9-15b0-549aa7bafb3d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-564d-90a9-6ff3-1f062b16cd3a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-564d-90a9-242c-457b535cc476	IN	IND	356	India 	Indija	\N
00040000-564d-90a9-1278-2b37c98977b6	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-564d-90a9-4ac8-cacbdd0a74f3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-564d-90a9-4f52-0bdae20fe32f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-564d-90a9-312b-60b1ba0a4275	IE	IRL	372	Ireland 	Irska	\N
00040000-564d-90a9-1deb-271959285dfe	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-564d-90a9-224d-4d80ac4dcef9	IL	ISR	376	Israel 	Izrael	\N
00040000-564d-90a9-92de-0df436c3bfa6	IT	ITA	380	Italy 	Italija	\N
00040000-564d-90a9-93c1-eb36c9f5e0a9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-564d-90a9-c776-131a25acc7d5	JP	JPN	392	Japan 	Japonska	\N
00040000-564d-90a9-6cde-4ab1e9c6cd93	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-564d-90a9-2272-85e73c063d71	JO	JOR	400	Jordan 	Jordanija	\N
00040000-564d-90a9-a211-d72d1abc7472	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-564d-90a9-20d7-fae4de190519	KE	KEN	404	Kenya 	Kenija	\N
00040000-564d-90a9-6838-f8c32040a1bc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-564d-90a9-c066-afb6bf7aea4a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-564d-90a9-3167-bd032a3630de	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-564d-90a9-d953-79c4e12288ec	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-564d-90a9-eb4e-aac8980193cc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-564d-90a9-c6fb-24e6de0e49af	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-564d-90a9-bc7e-798ff99d755e	LV	LVA	428	Latvia 	Latvija	\N
00040000-564d-90a9-3e22-58bb3a0d6647	LB	LBN	422	Lebanon 	Libanon	\N
00040000-564d-90a9-05a4-517bda5cd822	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-564d-90a9-b70c-84d83e3f1c15	LR	LBR	430	Liberia 	Liberija	\N
00040000-564d-90a9-9f71-6c3580dd844e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-564d-90a9-4526-aa8b18f9f64a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-564d-90a9-655f-0ffb5d228ede	LT	LTU	440	Lithuania 	Litva	\N
00040000-564d-90a9-d454-819052f8b831	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-564d-90a9-d363-4355b6d4596a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-564d-90a9-ea5a-e6c36ae23807	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-564d-90a9-0b8d-24c6ab031b1c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-564d-90a9-4ca2-13e5d873aa74	MW	MWI	454	Malawi 	Malavi	\N
00040000-564d-90a9-e27b-d9e52d0b0ea0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-564d-90a9-f022-5c140d10e439	MV	MDV	462	Maldives 	Maldivi	\N
00040000-564d-90a9-deb8-f71804f1f931	ML	MLI	466	Mali 	Mali	\N
00040000-564d-90a9-7b16-564fcc260fd5	MT	MLT	470	Malta 	Malta	\N
00040000-564d-90a9-d0ab-69b73027221f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-564d-90a9-14d8-a1ebaf69c011	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-564d-90a9-1dc7-592ff5d4edd5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-564d-90a9-fa72-184833343140	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-564d-90a9-3cd7-17b75100f377	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-564d-90a9-e182-bdb82b7814ff	MX	MEX	484	Mexico 	Mehika	\N
00040000-564d-90a9-6a42-ad18b4b2ff31	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-564d-90a9-d787-b8ff59e4992e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-564d-90a9-b493-77bbf5294ca7	MC	MCO	492	Monaco 	Monako	\N
00040000-564d-90a9-cb18-26ac596a7b74	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-564d-90a9-42ee-a31626047278	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-564d-90a9-0593-f3d1260f5419	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-564d-90a9-8251-73224bd20eea	MA	MAR	504	Morocco 	Maroko	\N
00040000-564d-90a9-54b1-30eabcc95e8c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-564d-90a9-7d68-d72068e6b1dd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-564d-90a9-6ba9-dc6117bb479b	NA	NAM	516	Namibia 	Namibija	\N
00040000-564d-90a9-4475-6678509969c6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-564d-90a9-91c7-7ac0f8be3bf0	NP	NPL	524	Nepal 	Nepal	\N
00040000-564d-90a9-0c56-280ca36ae190	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-564d-90a9-dc3c-e9d6b66882b8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-564d-90a9-cd87-c1b53c2daffd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-564d-90a9-ce84-3db2892bd1ae	NE	NER	562	Niger 	Niger 	\N
00040000-564d-90a9-03c4-3afff98a339b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-564d-90a9-bcc7-d015b4d20412	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-564d-90a9-d0b2-ac0ae297f034	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-564d-90a9-d447-262a61a03124	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-564d-90a9-80b8-65138716606d	NO	NOR	578	Norway 	Norveška	\N
00040000-564d-90a9-5a0b-287d51873bbc	OM	OMN	512	Oman 	Oman	\N
00040000-564d-90a9-5a38-46c07757fa6b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-564d-90a9-ea7a-cb1db4cca93d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-564d-90a9-c208-b3c86d7bc5c2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-564d-90a9-88b9-fc56659e19cf	PA	PAN	591	Panama 	Panama	\N
00040000-564d-90a9-55bb-c6a586d260f5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-564d-90a9-45cf-454436f07613	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-564d-90a9-2554-31306a806ac8	PE	PER	604	Peru 	Peru	\N
00040000-564d-90a9-909f-b8482f40106e	PH	PHL	608	Philippines 	Filipini	\N
00040000-564d-90a9-8057-8be7dbdd2852	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-564d-90a9-cbf7-ec620204946e	PL	POL	616	Poland 	Poljska	\N
00040000-564d-90a9-1fbb-dec18bb81b0e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-564d-90a9-e41e-d7295ed93aba	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-564d-90a9-8b36-613c46103f80	QA	QAT	634	Qatar 	Katar	\N
00040000-564d-90a9-8608-ef2a3e036940	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-564d-90a9-7d61-388c47cbcaf1	RO	ROU	642	Romania 	Romunija	\N
00040000-564d-90a9-5f01-cb29bf921e26	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-564d-90a9-dee6-3874a3415e72	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-564d-90a9-beed-61ea698d8940	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-564d-90a9-fadd-abe21b491c6f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-564d-90a9-c715-771cc4d43898	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-564d-90a9-ef8e-49b996441a80	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-564d-90a9-aeab-4e5f3108c06b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-564d-90a9-5fb4-defbafa6131f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-564d-90a9-61a0-7f09873394c1	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-564d-90a9-0ec3-ebff005e91f0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-564d-90a9-a92e-75fa492c55fe	SM	SMR	674	San Marino 	San Marino	\N
00040000-564d-90a9-19c5-7a954f9ff42c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-564d-90a9-012b-e93c569bd754	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-564d-90a9-f3f2-553394688c3f	SN	SEN	686	Senegal 	Senegal	\N
00040000-564d-90a9-bae4-21f4fa91337e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-564d-90a9-c2ec-da1b8b24747e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-564d-90a9-1206-5f51a251113a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-564d-90a9-87ef-93bf16cb70a1	SG	SGP	702	Singapore 	Singapur	\N
00040000-564d-90a9-12b9-765eb7fb2c30	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-564d-90a9-14b8-cfa6a022507b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-564d-90a9-637c-154c60013c34	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-564d-90a9-6d3f-32cd0b13b3a0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-564d-90a9-3152-32ca56ff7e3a	SO	SOM	706	Somalia 	Somalija	\N
00040000-564d-90a9-feb8-8b4bab5909ff	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-564d-90a9-cbec-68613e69d9b6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-564d-90a9-ab8e-07b4e07d2eb1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-564d-90a9-b9c7-18fb165a4de9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-564d-90a9-dedb-916d5dc61929	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-564d-90a9-50bb-c16de4d130b5	SD	SDN	729	Sudan 	Sudan	\N
00040000-564d-90a9-6df6-eb62e32a2fbf	SR	SUR	740	Suriname 	Surinam	\N
00040000-564d-90a9-0870-b80bf2e7adea	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-564d-90a9-4176-a59243bc5780	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-564d-90a9-54ff-2ea0292bcbf1	SE	SWE	752	Sweden 	Švedska	\N
00040000-564d-90a9-0a60-a894fad4fc03	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-564d-90a9-bd3d-265715d1d379	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-564d-90a9-24bf-b8fb4535a76c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-564d-90a9-961a-2ece35f3347c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-564d-90a9-656d-511a91305ab4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-564d-90a9-6c1c-73e59ec7fd09	TH	THA	764	Thailand 	Tajska	\N
00040000-564d-90a9-505f-eae5f1d32699	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-564d-90a9-462a-536cbba09239	TG	TGO	768	Togo 	Togo	\N
00040000-564d-90a9-0b77-b15e35138ee4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-564d-90a9-c451-119a9a88db3f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-564d-90a9-edcb-3e87802f1a09	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-564d-90a9-2801-db48d6747cd5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-564d-90a9-f23c-cf70c897ea17	TR	TUR	792	Turkey 	Turčija	\N
00040000-564d-90a9-74d9-5fb359479e37	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-564d-90a9-a3fb-f151a272e209	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564d-90a9-bfb2-a8e8eedf8eef	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-564d-90a9-9b1d-a87af6f77ce5	UG	UGA	800	Uganda 	Uganda	\N
00040000-564d-90a9-70c5-3b670f0c2aea	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-564d-90a9-03cb-f51314eacbb1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-564d-90a9-e2fa-8a4d06970e3c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-564d-90a9-1b48-8c95fcfcf929	US	USA	840	United States 	Združene države Amerike	\N
00040000-564d-90a9-cc56-1cfb65a47e1b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-564d-90a9-3188-4d652e28c90d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-564d-90a9-5fec-67d931766df9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-564d-90a9-1ca2-88664bddb5e0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-564d-90a9-9452-2003c7199e31	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-564d-90a9-1f44-f270d680752b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-564d-90a9-e4cc-5ce36ed6e1af	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564d-90a9-42af-5882b700284e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-564d-90a9-1a3b-e7a8c8541a42	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-564d-90a9-1f3e-753e13535848	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-564d-90a9-c479-d9edb3a345ad	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-564d-90a9-9e4b-666aeacbed98	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-564d-90a9-39d4-6f976b324d9e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 28441730)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-564d-90ab-ccb1-addf175c4e66	000e0000-564d-90ab-a37c-3ca088a7fe17	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564d-90a8-0fec-56ab5889434f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564d-90ab-a812-1eb35ce9f13e	000e0000-564d-90ab-67cc-74565d7722c0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564d-90a8-9f2b-efeb4ba8a108	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564d-90ab-81b7-fcd76a5379a6	000e0000-564d-90ab-7654-d594dd6df8de	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564d-90a8-0fec-56ab5889434f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564d-90ab-744f-4ce41042ada1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564d-90ab-35cb-d56334fb4231	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 28441531)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-564d-90ab-91d5-f9c3986d810b	000e0000-564d-90ab-67cc-74565d7722c0	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-564d-90a8-6521-af817f4afdd2
000d0000-564d-90ab-1045-199c66e87baf	000e0000-564d-90ab-67cc-74565d7722c0	000c0000-564d-90ab-8944-fd31b4b14dd3	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-564d-90a8-6521-af817f4afdd2
000d0000-564d-90ab-a9de-6ddde6351945	000e0000-564d-90ab-67cc-74565d7722c0	000c0000-564d-90ab-8d88-989b1a88b51b	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-564d-90a8-48a1-f1ce70959ce9
000d0000-564d-90ab-5776-9bc6e5aff28f	000e0000-564d-90ab-67cc-74565d7722c0	000c0000-564d-90ab-8c59-b13a4d192b05	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-564d-90a8-ef39-ac975c25d5e6
000d0000-564d-90ab-5743-9a7b0493a7b2	000e0000-564d-90ab-67cc-74565d7722c0	000c0000-564d-90ab-c988-677fe9b90404	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-564d-90a8-01d6-f8705565cf2b
000d0000-564d-90ab-4f26-321b88800071	000e0000-564d-90ab-67cc-74565d7722c0	000c0000-564d-90ab-7f7b-451a6977b0ae	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-564d-90a8-01d6-f8705565cf2b
000d0000-564d-90ab-5b2c-111c9fa5a2f9	000e0000-564d-90ab-67cc-74565d7722c0	000c0000-564d-90ab-687c-c7ccc15bc534	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-564d-90a8-6521-af817f4afdd2
000d0000-564d-90ab-72c6-ba27c299fcdd	000e0000-564d-90ab-67cc-74565d7722c0	000c0000-564d-90ab-5f8a-9adcddf9be40	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-564d-90a8-c945-3299fb1aba06
000d0000-564d-90ab-80b9-96d4b7b18b44	000e0000-564d-90ab-67cc-74565d7722c0	000c0000-564d-90ab-5382-8a9d15b16dfc	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-564d-90a8-66cb-8298104ec8b0
\.


--
-- TOC entry 3122 (class 0 OID 28441322)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 28441288)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 28441265)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-564d-90ab-4cde-cceca091ec53	00080000-564d-90ab-a516-4d13fe99946c	00090000-564d-90ab-89ae-bccb048aa725	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 28441445)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 28441988)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-564d-90ab-54a6-9f0f6dfbfc66	00010000-564d-90a9-7487-4f0a3a56bb35	\N	Prva mapa	Root mapa	2015-11-19 10:04:43	2015-11-19 10:04:43	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 28442001)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 28442023)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 25231831)
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
-- TOC entry 3138 (class 0 OID 28441470)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 28441222)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-564d-90a9-ea8e-a01b11766178	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-564d-90a9-7d8b-25eaf624b022	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-564d-90a9-951b-e661b683e171	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-564d-90a9-4307-098673062135	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-564d-90a9-a6a4-4c39527b4fa9	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-564d-90a9-065c-9504e7339e10	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-564d-90a9-2ebb-8fb59a94bf38	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-564d-90a9-2ba7-5c13dcd73819	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564d-90a9-73ed-8660713d6fcd	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564d-90a9-a5d7-66a33551c34c	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-564d-90a9-15b6-83c8c697fe6d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-564d-90a9-735c-c5610fb16e11	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-564d-90a9-e64c-48383ccc7dd2	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-564d-90a9-c6bc-7a2042df4999	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-564d-90aa-4f41-f23860172e6f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-564d-90aa-a97c-4481a6943013	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-564d-90aa-ce4f-34099b114d90	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-564d-90aa-5661-b6e07ecaa7d7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-564d-90aa-a4a7-b4df8a0c12c8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-564d-90ac-e7c5-c81c805eac79	application.tenant.maticnopodjetje	string	s:36:"00080000-564d-90ac-dc1d-62a9c4536ec1";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 28441122)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-564d-90aa-9aa0-7dfbfef33a07	00000000-564d-90aa-4f41-f23860172e6f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-564d-90aa-9e69-06e563501f75	00000000-564d-90aa-4f41-f23860172e6f	00010000-564d-90a9-7487-4f0a3a56bb35	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-564d-90aa-3c53-36555b2907b3	00000000-564d-90aa-a97c-4481a6943013	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 28441189)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-564d-90ab-012e-a0a66a856d61	\N	00100000-564d-90ab-bed5-ffab375d4368	00100000-564d-90ab-bc48-ecb41f1538d0	01	Gledališče Nimbis
00410000-564d-90ab-02a2-622199292414	00410000-564d-90ab-012e-a0a66a856d61	00100000-564d-90ab-bed5-ffab375d4368	00100000-564d-90ab-bc48-ecb41f1538d0	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 28441133)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-564d-90ab-ceeb-82ff21091ef5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-564d-90ab-ad40-b08c54cd53ae	00010000-564d-90ab-b77d-a11fe2ddea52	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-564d-90ab-deb2-562b7665cf9d	00010000-564d-90ab-e76d-ddd387a7fdae	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-564d-90ab-b287-c11472b62e08	00010000-564d-90ab-e5e6-fbd39f7db6cb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-564d-90ab-036b-27b42050b7c6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-564d-90ab-ef8f-87f68ff47936	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-564d-90ab-9a47-4db7dae8aab2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-564d-90ab-f7b3-ac39b93d94ee	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-564d-90ab-89ae-bccb048aa725	00010000-564d-90ab-20b6-52d494cd8082	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-564d-90ab-2d34-16d734ad737a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-564d-90ab-0403-05750864b0af	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564d-90ab-b122-763c7841bef3	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-564d-90ab-7d53-dedbae760bf0	00010000-564d-90ab-8c64-b391bd7c8cde	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564d-90ab-7e32-2635d0e7df65	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-564d-90ab-f5e7-3a9ae4d0a714	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-564d-90ab-507e-b4b0fe7492ac	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-564d-90ab-a58f-d540aafcf6bd	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564d-90ab-2a92-04ceb1debb85	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564d-90ab-af91-a68cec191ef2	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-564d-90ab-46d0-4c4108fb937a	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-564d-90ab-e897-531643b66b89	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 28441068)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-564d-90a9-968d-007ae2b73f5b	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-564d-90a9-c849-39994998743f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-564d-90a9-d808-770eb84b4315	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-564d-90a9-9051-f66434dc8eba	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-564d-90a9-8957-5db3ba2ac1e9	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-564d-90a9-f5ce-5f8ab4cf8703	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-564d-90a9-10f5-01749b5edc0d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-564d-90a9-1d04-92e02302b41f	Abonma-read	Abonma - branje	t
00030000-564d-90a9-a50d-bb7754133ef8	Abonma-write	Abonma - spreminjanje	t
00030000-564d-90a9-5296-a3f2dc3576e6	Alternacija-read	Alternacija - branje	t
00030000-564d-90a9-7d63-500eb4ea21af	Alternacija-write	Alternacija - spreminjanje	t
00030000-564d-90a9-8a33-a261b61a4199	Arhivalija-read	Arhivalija - branje	t
00030000-564d-90a9-1aba-6b83597f5cd7	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-564d-90a9-1335-ea461d4b9da2	AuthStorage-read	AuthStorage - branje	t
00030000-564d-90a9-d534-83be74cb1ccf	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-564d-90a9-9fa0-0f975c059bed	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-564d-90a9-9b38-8570e167b439	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-564d-90a9-cc39-a93a5684d293	Besedilo-read	Besedilo - branje	t
00030000-564d-90a9-1e98-edd8c431d7ba	Besedilo-write	Besedilo - spreminjanje	t
00030000-564d-90a9-35a3-2add8fbbd784	Dogodek-read	Dogodek - branje	t
00030000-564d-90a9-6f90-a7ec6e94f152	Dogodek-write	Dogodek - spreminjanje	t
00030000-564d-90a9-046a-89cf4ca6ef32	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-564d-90a9-645a-6c5020a0faee	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-564d-90a9-45ae-d0d5f8be63a2	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-564d-90a9-2821-8e9d10628a50	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-564d-90a9-3ddf-7141b4727bc1	DogodekTrait-read	DogodekTrait - branje	t
00030000-564d-90a9-c9e3-98e8245fe54a	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-564d-90a9-dc5e-9652ab1327ce	DrugiVir-read	DrugiVir - branje	t
00030000-564d-90a9-ab6c-09e8ee3f30e3	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-564d-90a9-19ef-5c6d5b494b65	Drzava-read	Drzava - branje	t
00030000-564d-90a9-e65a-6b6f87627b16	Drzava-write	Drzava - spreminjanje	t
00030000-564d-90a9-70a7-2b7cdf5638b5	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-564d-90a9-9a62-eb6e319780b5	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-564d-90a9-a0d1-8bf96b86cb6f	Funkcija-read	Funkcija - branje	t
00030000-564d-90a9-71df-4978b36b14e6	Funkcija-write	Funkcija - spreminjanje	t
00030000-564d-90a9-6ac2-e9b8dbd6b07a	Gostovanje-read	Gostovanje - branje	t
00030000-564d-90a9-498a-06b3b4986609	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-564d-90a9-eb17-80d5e77b87af	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-564d-90a9-91f9-b339ef73e7fc	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-564d-90a9-bf08-b8cd1ba84233	Kupec-read	Kupec - branje	t
00030000-564d-90a9-ed0c-93b9f89f8759	Kupec-write	Kupec - spreminjanje	t
00030000-564d-90a9-e2fd-03e3b1de98e4	NacinPlacina-read	NacinPlacina - branje	t
00030000-564d-90a9-17e0-d33f25cab243	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-564d-90a9-3844-6bfa547d3378	Option-read	Option - branje	t
00030000-564d-90a9-2744-8c012349cf87	Option-write	Option - spreminjanje	t
00030000-564d-90a9-2c80-947d8c6e2dcf	OptionValue-read	OptionValue - branje	t
00030000-564d-90a9-0974-0d380c9aa3e3	OptionValue-write	OptionValue - spreminjanje	t
00030000-564d-90a9-3e1b-7f3bc4b12742	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-564d-90a9-b716-61331818ae2f	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-564d-90a9-5441-cc53816ae85b	Oseba-read	Oseba - branje	t
00030000-564d-90a9-def5-7aac92b99d75	Oseba-write	Oseba - spreminjanje	t
00030000-564d-90a9-e13f-9657cabd74f8	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-564d-90a9-1894-af0c85f2cb35	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-564d-90a9-bce9-f0c269968989	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-564d-90a9-76be-e0cbe4d11e51	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-564d-90a9-fd56-79576f410306	Pogodba-read	Pogodba - branje	t
00030000-564d-90a9-f03f-2215a7cb9ae1	Pogodba-write	Pogodba - spreminjanje	t
00030000-564d-90a9-b291-4e66b4d14cf5	Popa-read	Popa - branje	t
00030000-564d-90a9-57e6-b2cf32cf560d	Popa-write	Popa - spreminjanje	t
00030000-564d-90a9-e39f-1ba7d929b172	Posta-read	Posta - branje	t
00030000-564d-90a9-a9e4-bcfaec0c913a	Posta-write	Posta - spreminjanje	t
00030000-564d-90a9-4096-8f6632062379	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-564d-90a9-e04f-7e7f9bb8a2e9	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-564d-90a9-2c13-fa53611c45e0	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-564d-90a9-3fac-54be136d11fc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-564d-90a9-8b67-7050496d4700	PostniNaslov-read	PostniNaslov - branje	t
00030000-564d-90a9-8b28-9d2e1234baef	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-564d-90a9-0940-c115d201cc5e	Praznik-read	Praznik - branje	t
00030000-564d-90a9-0dff-6fb8b89e67bc	Praznik-write	Praznik - spreminjanje	t
00030000-564d-90a9-a12b-9efa2782c5d6	Predstava-read	Predstava - branje	t
00030000-564d-90a9-16ab-754ab9f7e8ad	Predstava-write	Predstava - spreminjanje	t
00030000-564d-90a9-f6ac-9092b24e90e0	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-564d-90a9-30b7-bcd9d102fec7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-564d-90a9-6741-98a7c11dba77	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-564d-90a9-a42f-28db841a184c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-564d-90a9-920e-de9628e41ea2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-564d-90a9-1dfa-f2821acc8649	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-564d-90a9-55c0-4a6e50a187f9	ProgramDela-read	ProgramDela - branje	t
00030000-564d-90a9-dc3c-043cc34dca42	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-564d-90a9-5828-572ff44bb443	ProgramFestival-read	ProgramFestival - branje	t
00030000-564d-90a9-37e2-c5adbda4bd82	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-564d-90a9-ecc6-c170e36ecc0f	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-564d-90a9-bcaf-a45b8f5a4cf3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-564d-90a9-9f10-de6b8256ea90	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-564d-90a9-8337-92e27eeed67a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-564d-90a9-5b97-ea66a2d073aa	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-564d-90a9-5092-d8a7e6767082	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-564d-90a9-2f2b-4a188c3af79d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-564d-90a9-b748-34811ac44c8c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-564d-90a9-1999-995c0776fe24	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-564d-90a9-9106-81141662fff4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-564d-90a9-1a94-222eb3794a6a	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-564d-90a9-6f6f-c8b035a57dca	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-564d-90a9-7ecd-f8209bd5d708	ProgramRazno-read	ProgramRazno - branje	t
00030000-564d-90a9-24d1-ef314645b60b	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-564d-90a9-10f2-4879ef84f6cd	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-564d-90a9-34d1-368364dad564	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-564d-90a9-3ff3-6a0bd7a452b6	Prostor-read	Prostor - branje	t
00030000-564d-90a9-f471-7707d4f6d8c8	Prostor-write	Prostor - spreminjanje	t
00030000-564d-90a9-afa3-a6965ef4bd0d	Racun-read	Racun - branje	t
00030000-564d-90a9-cf18-97208c414411	Racun-write	Racun - spreminjanje	t
00030000-564d-90a9-455a-d84a838924d7	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-564d-90a9-6b6b-65fcad921c33	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-564d-90a9-db6a-00d09428cbac	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-564d-90a9-0342-924c17e22763	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-564d-90a9-f005-115711b02a53	Rekvizit-read	Rekvizit - branje	t
00030000-564d-90a9-d540-b570b5778b0a	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-564d-90a9-72a2-52250fd899d7	Revizija-read	Revizija - branje	t
00030000-564d-90a9-715f-5d1addcc549c	Revizija-write	Revizija - spreminjanje	t
00030000-564d-90a9-8cd5-b8dc36d86e43	Rezervacija-read	Rezervacija - branje	t
00030000-564d-90a9-feba-0fbe574d4ad7	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-564d-90a9-a1e0-1e51f8a7d493	SedezniRed-read	SedezniRed - branje	t
00030000-564d-90a9-53af-70613554968d	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-564d-90a9-01be-9e4c6bf9caad	Sedez-read	Sedez - branje	t
00030000-564d-90a9-56ed-f231bc7f793c	Sedez-write	Sedez - spreminjanje	t
00030000-564d-90a9-0171-7c7b2360bcb4	Sezona-read	Sezona - branje	t
00030000-564d-90a9-901a-806506e662d5	Sezona-write	Sezona - spreminjanje	t
00030000-564d-90a9-62e8-db378e671be1	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-564d-90a9-18fe-8fe8d7e9c9f0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-564d-90a9-fc96-ea92d7ed2cb5	Stevilcenje-read	Stevilcenje - branje	t
00030000-564d-90a9-02f9-1b62882be092	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-564d-90a9-df7a-166ad5406a00	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-564d-90a9-334e-bc67b655d547	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-564d-90a9-6da7-7c555faa01d9	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-564d-90a9-1281-0a30a4632632	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-564d-90a9-e32e-733a6ceba738	Telefonska-read	Telefonska - branje	t
00030000-564d-90a9-a8c5-3ee4bc5eb693	Telefonska-write	Telefonska - spreminjanje	t
00030000-564d-90a9-3397-2f0cb1bf3abb	TerminStoritve-read	TerminStoritve - branje	t
00030000-564d-90a9-6702-74ae4e48ca48	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-564d-90a9-8e56-4ebfa65a3e8f	TipFunkcije-read	TipFunkcije - branje	t
00030000-564d-90a9-cc0d-ad66346cdd66	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-564d-90a9-4bc8-148538b834de	TipPopa-read	TipPopa - branje	t
00030000-564d-90a9-18de-207713c4b363	TipPopa-write	TipPopa - spreminjanje	t
00030000-564d-90a9-a84c-d297c2e300bb	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-564d-90a9-d46d-e03f24e1dc16	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-564d-90a9-fa57-729115a63c74	TipVaje-read	TipVaje - branje	t
00030000-564d-90a9-9477-56f386e76eba	TipVaje-write	TipVaje - spreminjanje	t
00030000-564d-90a9-5d02-67147171eb0e	Trr-read	Trr - branje	t
00030000-564d-90a9-a13e-0491d8b9cdaf	Trr-write	Trr - spreminjanje	t
00030000-564d-90a9-d3ba-a9b3a94546c7	Uprizoritev-read	Uprizoritev - branje	t
00030000-564d-90a9-59ec-6da22af7f1f6	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-564d-90a9-56d7-cc6adf5e37de	Vaja-read	Vaja - branje	t
00030000-564d-90a9-9231-6949e59b24ec	Vaja-write	Vaja - spreminjanje	t
00030000-564d-90a9-bddb-fba16b4689fa	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-564d-90a9-db02-b5a1854bd970	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-564d-90a9-33c2-e0f36e6388c7	VrstaStroska-read	VrstaStroska - branje	t
00030000-564d-90a9-2228-a81a84c4a61f	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-564d-90a9-e7e1-a380f450675d	Zaposlitev-read	Zaposlitev - branje	t
00030000-564d-90a9-0d8d-bdb56d0cb144	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-564d-90a9-7286-726ab9c9fbb8	Zasedenost-read	Zasedenost - branje	t
00030000-564d-90a9-1557-b1ebb68d19c8	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-564d-90a9-bb60-17e3bf14fd2d	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-564d-90a9-fc30-ac9fcbefea55	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-564d-90a9-77bc-797613725ef1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-564d-90a9-671e-3162a0ac1bef	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-564d-90a9-c2d4-963f4385a982	Job-read	Branje opravil - samo zase - branje	t
00030000-564d-90a9-db0b-ff1648e94651	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-564d-90a9-332e-0ec6f25a1c5a	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-564d-90a9-63be-9752a95e6023	Report-read	Report - branje	t
00030000-564d-90a9-7a81-99ece169065e	Report-write	Report - spreminjanje	t
00030000-564d-90a9-c18b-37f0c67f5747	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-564d-90a9-c178-a8183724e17c	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-564d-90a9-2e47-243efd185891	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-564d-90a9-853c-fbd3bd4378fb	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-564d-90a9-6b2a-eff0c8ee4872	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-564d-90a9-d973-bcccb5b8b34b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-564d-90a9-413a-76e72299857b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-564d-90a9-19fb-130d680202fd	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-564d-90a9-ac47-854c280aba5f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564d-90a9-f09c-9c7fe8f209df	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564d-90a9-c23c-27ee6cc1cd27	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-564d-90a9-d9e5-e7104ff6216c	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-564d-90a9-d438-9bd0ede84c8d	Datoteka-write	Datoteka - spreminjanje	t
00030000-564d-90a9-7056-ef97f4b2da8b	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 28441087)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-564d-90a9-3282-ccbf382aef8a	00030000-564d-90a9-c849-39994998743f
00020000-564d-90a9-b597-892bbbe3e709	00030000-564d-90a9-19ef-5c6d5b494b65
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-1d04-92e02302b41f
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-a50d-bb7754133ef8
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-5296-a3f2dc3576e6
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-7d63-500eb4ea21af
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-8a33-a261b61a4199
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-35a3-2add8fbbd784
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-9051-f66434dc8eba
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-6f90-a7ec6e94f152
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-19ef-5c6d5b494b65
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-e65a-6b6f87627b16
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-a0d1-8bf96b86cb6f
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-71df-4978b36b14e6
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-6ac2-e9b8dbd6b07a
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-498a-06b3b4986609
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-eb17-80d5e77b87af
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-91f9-b339ef73e7fc
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-3844-6bfa547d3378
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-2c80-947d8c6e2dcf
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-5441-cc53816ae85b
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-def5-7aac92b99d75
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-b291-4e66b4d14cf5
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-57e6-b2cf32cf560d
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-e39f-1ba7d929b172
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-a9e4-bcfaec0c913a
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-8b67-7050496d4700
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-8b28-9d2e1234baef
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-a12b-9efa2782c5d6
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-16ab-754ab9f7e8ad
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-920e-de9628e41ea2
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-1dfa-f2821acc8649
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-3ff3-6a0bd7a452b6
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-f471-7707d4f6d8c8
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-db6a-00d09428cbac
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-0342-924c17e22763
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-f005-115711b02a53
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-d540-b570b5778b0a
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-0171-7c7b2360bcb4
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-901a-806506e662d5
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-8e56-4ebfa65a3e8f
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-d3ba-a9b3a94546c7
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-59ec-6da22af7f1f6
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-56d7-cc6adf5e37de
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-9231-6949e59b24ec
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-7286-726ab9c9fbb8
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-1557-b1ebb68d19c8
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-bb60-17e3bf14fd2d
00020000-564d-90a9-a42d-f06899576217	00030000-564d-90a9-77bc-797613725ef1
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-1d04-92e02302b41f
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-8a33-a261b61a4199
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-35a3-2add8fbbd784
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-19ef-5c6d5b494b65
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-6ac2-e9b8dbd6b07a
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-eb17-80d5e77b87af
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-91f9-b339ef73e7fc
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-3844-6bfa547d3378
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-2c80-947d8c6e2dcf
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-5441-cc53816ae85b
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-def5-7aac92b99d75
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-b291-4e66b4d14cf5
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-e39f-1ba7d929b172
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-8b67-7050496d4700
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-8b28-9d2e1234baef
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-a12b-9efa2782c5d6
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-3ff3-6a0bd7a452b6
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-db6a-00d09428cbac
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-f005-115711b02a53
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-0171-7c7b2360bcb4
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-e32e-733a6ceba738
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-a8c5-3ee4bc5eb693
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-5d02-67147171eb0e
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-a13e-0491d8b9cdaf
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-e7e1-a380f450675d
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-0d8d-bdb56d0cb144
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-bb60-17e3bf14fd2d
00020000-564d-90a9-4ad9-f1c019e18446	00030000-564d-90a9-77bc-797613725ef1
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-1d04-92e02302b41f
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-5296-a3f2dc3576e6
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-8a33-a261b61a4199
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-1aba-6b83597f5cd7
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-cc39-a93a5684d293
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-046a-89cf4ca6ef32
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-35a3-2add8fbbd784
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-19ef-5c6d5b494b65
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-a0d1-8bf96b86cb6f
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-6ac2-e9b8dbd6b07a
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-eb17-80d5e77b87af
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-3844-6bfa547d3378
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-2c80-947d8c6e2dcf
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-5441-cc53816ae85b
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-b291-4e66b4d14cf5
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-e39f-1ba7d929b172
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-a12b-9efa2782c5d6
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-920e-de9628e41ea2
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-3ff3-6a0bd7a452b6
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-db6a-00d09428cbac
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-f005-115711b02a53
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-0171-7c7b2360bcb4
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-8e56-4ebfa65a3e8f
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-56d7-cc6adf5e37de
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-7286-726ab9c9fbb8
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-bb60-17e3bf14fd2d
00020000-564d-90a9-ca72-b7ffd46f4c63	00030000-564d-90a9-77bc-797613725ef1
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-1d04-92e02302b41f
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-a50d-bb7754133ef8
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-7d63-500eb4ea21af
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-8a33-a261b61a4199
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-35a3-2add8fbbd784
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-19ef-5c6d5b494b65
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-6ac2-e9b8dbd6b07a
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-3844-6bfa547d3378
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-2c80-947d8c6e2dcf
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-b291-4e66b4d14cf5
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-e39f-1ba7d929b172
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-a12b-9efa2782c5d6
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-3ff3-6a0bd7a452b6
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-db6a-00d09428cbac
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-f005-115711b02a53
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-0171-7c7b2360bcb4
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-8e56-4ebfa65a3e8f
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-bb60-17e3bf14fd2d
00020000-564d-90a9-e1bb-3ccc167087e2	00030000-564d-90a9-77bc-797613725ef1
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-1d04-92e02302b41f
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-8a33-a261b61a4199
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-35a3-2add8fbbd784
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-19ef-5c6d5b494b65
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-6ac2-e9b8dbd6b07a
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-3844-6bfa547d3378
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-2c80-947d8c6e2dcf
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-b291-4e66b4d14cf5
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-e39f-1ba7d929b172
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-a12b-9efa2782c5d6
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-3ff3-6a0bd7a452b6
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-db6a-00d09428cbac
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-f005-115711b02a53
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-0171-7c7b2360bcb4
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-3397-2f0cb1bf3abb
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-d808-770eb84b4315
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-8e56-4ebfa65a3e8f
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-bb60-17e3bf14fd2d
00020000-564d-90a9-bc7d-7556b81b0a34	00030000-564d-90a9-77bc-797613725ef1
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-968d-007ae2b73f5b
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-c849-39994998743f
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1d04-92e02302b41f
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a50d-bb7754133ef8
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-5296-a3f2dc3576e6
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-7d63-500eb4ea21af
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-8a33-a261b61a4199
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1aba-6b83597f5cd7
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-9fa0-0f975c059bed
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-9b38-8570e167b439
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-cc39-a93a5684d293
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1e98-edd8c431d7ba
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-046a-89cf4ca6ef32
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-645a-6c5020a0faee
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-35a3-2add8fbbd784
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-9051-f66434dc8eba
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-6f90-a7ec6e94f152
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-dc5e-9652ab1327ce
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-ab6c-09e8ee3f30e3
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-19ef-5c6d5b494b65
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-e65a-6b6f87627b16
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-70a7-2b7cdf5638b5
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-9a62-eb6e319780b5
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a0d1-8bf96b86cb6f
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-71df-4978b36b14e6
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-6ac2-e9b8dbd6b07a
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-498a-06b3b4986609
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-eb17-80d5e77b87af
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-91f9-b339ef73e7fc
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-bf08-b8cd1ba84233
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-ed0c-93b9f89f8759
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-e2fd-03e3b1de98e4
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-17e0-d33f25cab243
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-3844-6bfa547d3378
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-2c80-947d8c6e2dcf
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-0974-0d380c9aa3e3
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-2744-8c012349cf87
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-3e1b-7f3bc4b12742
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-b716-61331818ae2f
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-5441-cc53816ae85b
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-8957-5db3ba2ac1e9
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-def5-7aac92b99d75
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-e13f-9657cabd74f8
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1894-af0c85f2cb35
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-bce9-f0c269968989
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-76be-e0cbe4d11e51
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-fd56-79576f410306
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-f03f-2215a7cb9ae1
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-b291-4e66b4d14cf5
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-57e6-b2cf32cf560d
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-e39f-1ba7d929b172
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-4096-8f6632062379
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-e04f-7e7f9bb8a2e9
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-2c13-fa53611c45e0
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-3fac-54be136d11fc
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a9e4-bcfaec0c913a
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-8b67-7050496d4700
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-8b28-9d2e1234baef
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-0940-c115d201cc5e
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-0dff-6fb8b89e67bc
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a12b-9efa2782c5d6
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-16ab-754ab9f7e8ad
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-f6ac-9092b24e90e0
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-30b7-bcd9d102fec7
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-6741-98a7c11dba77
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a42f-28db841a184c
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-920e-de9628e41ea2
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1dfa-f2821acc8649
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-f5ce-5f8ab4cf8703
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-55c0-4a6e50a187f9
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-10f5-01749b5edc0d
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-dc3c-043cc34dca42
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-5828-572ff44bb443
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-37e2-c5adbda4bd82
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-ecc6-c170e36ecc0f
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-bcaf-a45b8f5a4cf3
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-9f10-de6b8256ea90
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-8337-92e27eeed67a
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-5b97-ea66a2d073aa
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-5092-d8a7e6767082
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-2f2b-4a188c3af79d
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-b748-34811ac44c8c
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1999-995c0776fe24
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-9106-81141662fff4
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1a94-222eb3794a6a
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-6f6f-c8b035a57dca
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-7ecd-f8209bd5d708
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-24d1-ef314645b60b
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-10f2-4879ef84f6cd
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-34d1-368364dad564
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-3ff3-6a0bd7a452b6
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-f471-7707d4f6d8c8
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-afa3-a6965ef4bd0d
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-cf18-97208c414411
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-455a-d84a838924d7
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-6b6b-65fcad921c33
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-db6a-00d09428cbac
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-0342-924c17e22763
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-f005-115711b02a53
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-d540-b570b5778b0a
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-72a2-52250fd899d7
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-715f-5d1addcc549c
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-8cd5-b8dc36d86e43
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-feba-0fbe574d4ad7
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a1e0-1e51f8a7d493
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-53af-70613554968d
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-01be-9e4c6bf9caad
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-56ed-f231bc7f793c
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-0171-7c7b2360bcb4
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-901a-806506e662d5
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-62e8-db378e671be1
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-18fe-8fe8d7e9c9f0
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-fc96-ea92d7ed2cb5
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-df7a-166ad5406a00
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-334e-bc67b655d547
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-02f9-1b62882be092
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-6da7-7c555faa01d9
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1281-0a30a4632632
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-e32e-733a6ceba738
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a8c5-3ee4bc5eb693
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-3397-2f0cb1bf3abb
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-d808-770eb84b4315
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-6702-74ae4e48ca48
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-8e56-4ebfa65a3e8f
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-cc0d-ad66346cdd66
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-4bc8-148538b834de
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-18de-207713c4b363
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a84c-d297c2e300bb
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-d46d-e03f24e1dc16
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-fa57-729115a63c74
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-9477-56f386e76eba
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-5d02-67147171eb0e
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-a13e-0491d8b9cdaf
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-d3ba-a9b3a94546c7
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-59ec-6da22af7f1f6
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-56d7-cc6adf5e37de
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-9231-6949e59b24ec
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-bddb-fba16b4689fa
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-db02-b5a1854bd970
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-33c2-e0f36e6388c7
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-2228-a81a84c4a61f
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-e7e1-a380f450675d
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-0d8d-bdb56d0cb144
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-7286-726ab9c9fbb8
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-1557-b1ebb68d19c8
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-bb60-17e3bf14fd2d
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-fc30-ac9fcbefea55
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-77bc-797613725ef1
00020000-564d-90ab-bea3-b27b3da28ad3	00030000-564d-90a9-671e-3162a0ac1bef
00020000-564d-90ab-d477-0076ea4604af	00030000-564d-90a9-f09c-9c7fe8f209df
00020000-564d-90ab-7d89-6634f0a6f7d0	00030000-564d-90a9-ac47-854c280aba5f
00020000-564d-90ab-80be-f06d07da59ec	00030000-564d-90a9-59ec-6da22af7f1f6
00020000-564d-90ab-9e60-06dc5dd79f8e	00030000-564d-90a9-d3ba-a9b3a94546c7
00020000-564d-90ab-0e47-56f589cad352	00030000-564d-90a9-c178-a8183724e17c
00020000-564d-90ab-e13f-03ced67921b6	00030000-564d-90a9-2e47-243efd185891
00020000-564d-90ab-01ee-8b804bb5989f	00030000-564d-90a9-853c-fbd3bd4378fb
00020000-564d-90ab-8f91-6e7af9d43bc5	00030000-564d-90a9-c18b-37f0c67f5747
00020000-564d-90ab-387a-5f0983c8b400	00030000-564d-90a9-d973-bcccb5b8b34b
00020000-564d-90ab-e795-649d5559a2d1	00030000-564d-90a9-6b2a-eff0c8ee4872
00020000-564d-90ab-58a7-181d8e069527	00030000-564d-90a9-19fb-130d680202fd
00020000-564d-90ab-48be-7d32f0fa954b	00030000-564d-90a9-413a-76e72299857b
00020000-564d-90ab-187a-b6302d6c8404	00030000-564d-90a9-def5-7aac92b99d75
00020000-564d-90ab-446c-a0fb51f8d17b	00030000-564d-90a9-5441-cc53816ae85b
00020000-564d-90ab-aa37-de184f1f6e60	00030000-564d-90a9-d438-9bd0ede84c8d
00020000-564d-90ab-537f-b8958540bc64	00030000-564d-90a9-7056-ef97f4b2da8b
00020000-564d-90ab-4666-9db4c41a5200	00030000-564d-90a9-b291-4e66b4d14cf5
00020000-564d-90ab-4666-9db4c41a5200	00030000-564d-90a9-57e6-b2cf32cf560d
00020000-564d-90ab-4666-9db4c41a5200	00030000-564d-90a9-d3ba-a9b3a94546c7
\.


--
-- TOC entry 3139 (class 0 OID 28441477)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 28441511)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 28441648)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-564d-90ab-7847-9120806ebf55	00090000-564d-90ab-ceeb-82ff21091ef5	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-564d-90ab-f425-1ce2baaa995c	00090000-564d-90ab-ef8f-87f68ff47936	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-564d-90ab-480f-69ef1421d4b8	00090000-564d-90ab-7d53-dedbae760bf0	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-564d-90ab-3516-e7c25df8c765	00090000-564d-90ab-2d34-16d734ad737a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 28441169)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-564d-90ab-a516-4d13fe99946c	\N	00040000-564d-90a9-637c-154c60013c34	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564d-90ab-4561-8b8c4986e7e5	\N	00040000-564d-90a9-637c-154c60013c34	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-564d-90ab-0017-06b1e909fb26	\N	00040000-564d-90a9-637c-154c60013c34	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564d-90ab-0389-c2ecd9455de1	\N	00040000-564d-90a9-637c-154c60013c34	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564d-90ab-d07f-f8d6906903a6	\N	00040000-564d-90a9-637c-154c60013c34	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564d-90ab-dbe8-c2873fa57359	\N	00040000-564d-90a9-1681-05fde30bd644	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564d-90ab-669c-597161e4b633	\N	00040000-564d-90a9-5b34-48d9c44ff0a9	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564d-90ab-b263-776bedf77b76	\N	00040000-564d-90a9-3ecb-fa91f70c522b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564d-90ab-b537-b34cb6d5ae7e	\N	00040000-564d-90a9-efce-3fef37779374	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564d-90ac-dc1d-62a9c4536ec1	\N	00040000-564d-90a9-637c-154c60013c34	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 28441214)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-564d-90a8-a9d8-6538ab1208ae	8341	Adlešiči
00050000-564d-90a8-b023-50014ad714d6	5270	Ajdovščina
00050000-564d-90a8-052b-4451376db18e	6280	Ankaran/Ancarano
00050000-564d-90a8-db40-a981c06c4281	9253	Apače
00050000-564d-90a8-dbe2-dd5c81744c9f	8253	Artiče
00050000-564d-90a8-2ab1-b96f960ed200	4275	Begunje na Gorenjskem
00050000-564d-90a8-5819-e1c32fa34777	1382	Begunje pri Cerknici
00050000-564d-90a8-35b5-caef27840be1	9231	Beltinci
00050000-564d-90a8-c63d-e3ada6eccb94	2234	Benedikt
00050000-564d-90a8-4776-473702e6557c	2345	Bistrica ob Dravi
00050000-564d-90a8-bd06-695d27c73cf6	3256	Bistrica ob Sotli
00050000-564d-90a8-6c3e-f402cb173909	8259	Bizeljsko
00050000-564d-90a8-1246-c1c8e8b616ba	1223	Blagovica
00050000-564d-90a8-1ec5-013b199cfddd	8283	Blanca
00050000-564d-90a8-78cc-90215b4bce35	4260	Bled
00050000-564d-90a8-3ef4-d50545290070	4273	Blejska Dobrava
00050000-564d-90a8-1aa6-955e6608cc1b	9265	Bodonci
00050000-564d-90a8-7d79-cd1ad76d750d	9222	Bogojina
00050000-564d-90a8-94a4-c3f7a13ea078	4263	Bohinjska Bela
00050000-564d-90a8-5670-78d612412629	4264	Bohinjska Bistrica
00050000-564d-90a8-3c23-8533be01fd82	4265	Bohinjsko jezero
00050000-564d-90a8-4a0f-7d384cb0bdcc	1353	Borovnica
00050000-564d-90a8-cf48-1b8a58b7862e	8294	Boštanj
00050000-564d-90a8-56ab-7051d43a821c	5230	Bovec
00050000-564d-90a8-ae63-33b91e9607cd	5295	Branik
00050000-564d-90a8-e135-331e924c286e	3314	Braslovče
00050000-564d-90a8-c5cf-945639ce0d98	5223	Breginj
00050000-564d-90a8-0c65-f62a46a75bcb	8280	Brestanica
00050000-564d-90a8-efcd-46ab6d51dd89	2354	Bresternica
00050000-564d-90a8-a678-41dfde66f588	4243	Brezje
00050000-564d-90a8-4dc0-9812e634c993	1351	Brezovica pri Ljubljani
00050000-564d-90a8-a3a8-2af517aa8c21	8250	Brežice
00050000-564d-90a8-9223-3c53a8df369a	4210	Brnik - Aerodrom
00050000-564d-90a8-fdb8-e8ebea03eedb	8321	Brusnice
00050000-564d-90a8-557b-2452276a704f	3255	Buče
00050000-564d-90a8-5b7e-0941df381d1a	8276	Bučka 
00050000-564d-90a8-0de1-582157b42720	9261	Cankova
00050000-564d-90a8-394b-9788c52ce93f	3000	Celje 
00050000-564d-90a8-79d1-7b555a2f3c24	3001	Celje - poštni predali
00050000-564d-90a8-04b2-7b3e40e10441	4207	Cerklje na Gorenjskem
00050000-564d-90a8-8a73-72c878fb174a	8263	Cerklje ob Krki
00050000-564d-90a8-8a32-4fdf24a564ba	1380	Cerknica
00050000-564d-90a8-d505-5da7a3572267	5282	Cerkno
00050000-564d-90a8-315e-eed099ab0feb	2236	Cerkvenjak
00050000-564d-90a8-978a-fad8eca01687	2215	Ceršak
00050000-564d-90a8-2dec-b21c947b74fb	2326	Cirkovce
00050000-564d-90a8-2838-007783ee1581	2282	Cirkulane
00050000-564d-90a8-6d90-4e0acdce3b95	5273	Col
00050000-564d-90a8-24eb-59d24521ed8e	8251	Čatež ob Savi
00050000-564d-90a8-668c-87b844ade296	1413	Čemšenik
00050000-564d-90a8-5214-26a18b7aea29	5253	Čepovan
00050000-564d-90a8-7649-10ae26e6a7de	9232	Črenšovci
00050000-564d-90a8-bac0-7ba6a08c552d	2393	Črna na Koroškem
00050000-564d-90a8-1ecc-a4e6b01b2535	6275	Črni Kal
00050000-564d-90a8-d58d-51cbe7d08b6e	5274	Črni Vrh nad Idrijo
00050000-564d-90a8-3c22-2f00d6a3976e	5262	Črniče
00050000-564d-90a8-95df-f37cdebed898	8340	Črnomelj
00050000-564d-90a8-1d56-088f986dc975	6271	Dekani
00050000-564d-90a8-2e71-1c58667d5c15	5210	Deskle
00050000-564d-90a8-1d17-820fdce60789	2253	Destrnik
00050000-564d-90a8-77dc-deec490c15bc	6215	Divača
00050000-564d-90a8-a869-f52e9014135e	1233	Dob
00050000-564d-90a8-9c24-e2220cb3949b	3224	Dobje pri Planini
00050000-564d-90a8-4963-2f3872fb16b2	8257	Dobova
00050000-564d-90a8-652e-262ac6c3bef4	1423	Dobovec
00050000-564d-90a8-b234-9cfaaa0750b0	5263	Dobravlje
00050000-564d-90a8-a79e-1e23a078933c	3204	Dobrna
00050000-564d-90a8-1d7a-178a761959d2	8211	Dobrnič
00050000-564d-90a8-286c-561d6e016bf8	1356	Dobrova
00050000-564d-90a8-97e7-58958e50034a	9223	Dobrovnik/Dobronak 
00050000-564d-90a8-2a04-e086347ea06c	5212	Dobrovo v Brdih
00050000-564d-90a8-be1e-9da9b5e7beab	1431	Dol pri Hrastniku
00050000-564d-90a8-baad-144a65a0ca14	1262	Dol pri Ljubljani
00050000-564d-90a8-72bb-3eec84cf3539	1273	Dole pri Litiji
00050000-564d-90a8-f9f5-9906e5e70ae1	1331	Dolenja vas
00050000-564d-90a8-885a-e01abd4ffe9c	8350	Dolenjske Toplice
00050000-564d-90a8-b05f-c5fb63d4764b	1230	Domžale
00050000-564d-90a8-9ca1-e342c5a40cda	2252	Dornava
00050000-564d-90a8-61d1-8b16850552f3	5294	Dornberk
00050000-564d-90a8-9506-c12d1d1f5f30	1319	Draga
00050000-564d-90a8-d1f3-2d95c6cba8cd	8343	Dragatuš
00050000-564d-90a8-91e2-0bfe65d4610e	3222	Dramlje
00050000-564d-90a8-3798-a466539521ed	2370	Dravograd
00050000-564d-90a8-08f7-ff14ad97c238	4203	Duplje
00050000-564d-90a8-3d97-bfb2a16a6fc1	6221	Dutovlje
00050000-564d-90a8-a42a-a4ebedfbc529	8361	Dvor
00050000-564d-90a8-ecfe-785571729f4e	2343	Fala
00050000-564d-90a8-a23e-2b566666d2a4	9208	Fokovci
00050000-564d-90a8-1d9c-d44678cec098	2313	Fram
00050000-564d-90a8-58ea-115654ce2d33	3213	Frankolovo
00050000-564d-90a8-a6ce-ecfefe28bf2f	1274	Gabrovka
00050000-564d-90a8-fb6e-d60e14ab2d24	8254	Globoko
00050000-564d-90a8-c683-b8f9ab879f4f	5275	Godovič
00050000-564d-90a8-8e91-59bff7c5edf6	4204	Golnik
00050000-564d-90a8-84a3-48d9fd8ca622	3303	Gomilsko
00050000-564d-90a8-d06f-e314d6d1616f	4224	Gorenja vas
00050000-564d-90a8-291d-836ca1c0e732	3263	Gorica pri Slivnici
00050000-564d-90a8-9419-4e41f8664016	2272	Gorišnica
00050000-564d-90a8-4a72-ce8637b03da2	9250	Gornja Radgona
00050000-564d-90a8-1fea-f45b225e1a15	3342	Gornji Grad
00050000-564d-90a8-cdf7-156fef0f28d6	4282	Gozd Martuljek
00050000-564d-90a8-fd0c-292ad2b9de24	6272	Gračišče
00050000-564d-90a8-ac17-795f9102dc3b	9264	Grad
00050000-564d-90a8-94f3-799a0f3be97e	8332	Gradac
00050000-564d-90a8-592a-95718696d550	1384	Grahovo
00050000-564d-90a8-d97c-31d51d5fa7f4	5242	Grahovo ob Bači
00050000-564d-90a8-d39c-3991361a5b91	5251	Grgar
00050000-564d-90a8-acfd-24578a5eabdb	3302	Griže
00050000-564d-90a8-7985-470ba15293ea	3231	Grobelno
00050000-564d-90a8-0b9f-f9e484bc3698	1290	Grosuplje
00050000-564d-90a8-c83c-9bafbefd3b57	2288	Hajdina
00050000-564d-90a8-7675-70fb8e11e8de	8362	Hinje
00050000-564d-90a8-9fb5-03c405452d85	2311	Hoče
00050000-564d-90a8-8cee-835a6998440e	9205	Hodoš/Hodos
00050000-564d-90a8-ff5b-7c1d1d05f409	1354	Horjul
00050000-564d-90a8-d354-bd6d8fa5551a	1372	Hotedršica
00050000-564d-90a8-5175-73597a5e8ceb	1430	Hrastnik
00050000-564d-90a8-9612-9da871bbdee3	6225	Hruševje
00050000-564d-90a8-a895-1c1fa23bd016	4276	Hrušica
00050000-564d-90a8-5fc0-aacdbf29ca74	5280	Idrija
00050000-564d-90a8-0963-ccba378f7e81	1292	Ig
00050000-564d-90a8-7a78-9250d2fb7978	6250	Ilirska Bistrica
00050000-564d-90a8-39d8-157974177b8f	6251	Ilirska Bistrica-Trnovo
00050000-564d-90a8-2453-f6acb3ccb27c	1295	Ivančna Gorica
00050000-564d-90a8-a1fb-9ce95adf37f8	2259	Ivanjkovci
00050000-564d-90a8-7861-0359c596b3f6	1411	Izlake
00050000-564d-90a8-c794-b50843e63cae	6310	Izola/Isola
00050000-564d-90a8-7439-629ca99ca19f	2222	Jakobski Dol
00050000-564d-90a8-d8f9-e93301725bab	2221	Jarenina
00050000-564d-90a8-ec0e-d3e6c625f84c	6254	Jelšane
00050000-564d-90a8-95f5-e7c348f92c87	4270	Jesenice
00050000-564d-90a8-d33f-6df50b314124	8261	Jesenice na Dolenjskem
00050000-564d-90a8-f2d9-0cbc812a6e6f	3273	Jurklošter
00050000-564d-90a8-7776-890d12d244b2	2223	Jurovski Dol
00050000-564d-90a8-e38f-afd3cfe1355a	2256	Juršinci
00050000-564d-90a8-f6d9-96a9ceebe627	5214	Kal nad Kanalom
00050000-564d-90a8-1651-67195646687c	3233	Kalobje
00050000-564d-90a8-749e-1dcda9e61794	4246	Kamna Gorica
00050000-564d-90a8-5d4b-11d00b8813af	2351	Kamnica
00050000-564d-90a8-2d1d-cbceb46a453b	1241	Kamnik
00050000-564d-90a8-8631-334dd79df99e	5213	Kanal
00050000-564d-90a8-3a7e-415c921bc37d	8258	Kapele
00050000-564d-90a8-1c79-31177e41468f	2362	Kapla
00050000-564d-90a8-806f-bb070e62ff44	2325	Kidričevo
00050000-564d-90a8-2ed7-e0869516de9f	1412	Kisovec
00050000-564d-90a8-7f07-99c5b08a36f7	6253	Knežak
00050000-564d-90a8-c6fb-d3d148a19fbe	5222	Kobarid
00050000-564d-90a8-6858-3f2fae92f029	9227	Kobilje
00050000-564d-90a8-5cc9-a5aa344041f2	1330	Kočevje
00050000-564d-90a8-3996-05ac0d504bfe	1338	Kočevska Reka
00050000-564d-90a8-caa5-ea9ab5ac67dd	2276	Kog
00050000-564d-90a8-c68a-a5816d75da44	5211	Kojsko
00050000-564d-90a8-94e5-de71af9d0bef	6223	Komen
00050000-564d-90a8-300f-213ff469df96	1218	Komenda
00050000-564d-90a8-76b3-57cbb2eb40be	6000	Koper/Capodistria 
00050000-564d-90a8-4e17-affb77f9a5bb	6001	Koper/Capodistria - poštni predali
00050000-564d-90a8-9e4c-7b4c3813b8a5	8282	Koprivnica
00050000-564d-90a8-330f-830b5e0ee6d2	5296	Kostanjevica na Krasu
00050000-564d-90a8-0afa-aa0c5f818c09	8311	Kostanjevica na Krki
00050000-564d-90a8-fd22-105ff3a4d08a	1336	Kostel
00050000-564d-90a8-762f-c4a13f9e6524	6256	Košana
00050000-564d-90a8-cb1c-3c44312d1696	2394	Kotlje
00050000-564d-90a8-c025-345ae0d8e028	6240	Kozina
00050000-564d-90a8-81f6-afdf51ddf226	3260	Kozje
00050000-564d-90a8-6e1f-04074022cc49	4000	Kranj 
00050000-564d-90a8-24d5-3579c37bbe34	4001	Kranj - poštni predali
00050000-564d-90a8-f078-49845bfa195c	4280	Kranjska Gora
00050000-564d-90a8-424a-920c564b0b8c	1281	Kresnice
00050000-564d-90a8-32fb-613f5f4073f6	4294	Križe
00050000-564d-90a8-8b09-4d1966df7418	9206	Križevci
00050000-564d-90a8-d3c6-b67d0820e9d0	9242	Križevci pri Ljutomeru
00050000-564d-90a8-a029-091037e57844	1301	Krka
00050000-564d-90a8-7d77-5339071ebf7f	8296	Krmelj
00050000-564d-90a8-1af6-c2c320f73396	4245	Kropa
00050000-564d-90a8-135b-d0c0c6880a1a	8262	Krška vas
00050000-564d-90a8-3ad2-fd271fbc2a0d	8270	Krško
00050000-564d-90a8-d4a3-a92b4fec96a8	9263	Kuzma
00050000-564d-90a8-5081-d2cd8fd61823	2318	Laporje
00050000-564d-90a8-083c-eef037f4276a	3270	Laško
00050000-564d-90a8-2b11-6447d50c4688	1219	Laze v Tuhinju
00050000-564d-90a8-4979-df0df16f67ea	2230	Lenart v Slovenskih goricah
00050000-564d-90a8-c140-7aec29993e7e	9220	Lendava/Lendva
00050000-564d-90a8-eb99-677c45cc5a96	4248	Lesce
00050000-564d-90a8-2595-5823f09283ba	3261	Lesično
00050000-564d-90a8-dfd9-20dd7a315782	8273	Leskovec pri Krškem
00050000-564d-90a8-7d8a-afa38b045a0b	2372	Libeliče
00050000-564d-90a8-f498-976d9ef175b8	2341	Limbuš
00050000-564d-90a8-298b-d642fb893180	1270	Litija
00050000-564d-90a8-85a2-2ff2b5bb721d	3202	Ljubečna
00050000-564d-90a8-3da1-2e6751283e89	1000	Ljubljana 
00050000-564d-90a8-37d1-aa8161fc7995	1001	Ljubljana - poštni predali
00050000-564d-90a8-fa6b-143cf7f9ddfb	1231	Ljubljana - Črnuče
00050000-564d-90a8-aac7-f038242ddecf	1261	Ljubljana - Dobrunje
00050000-564d-90a8-1413-82b1275daa82	1260	Ljubljana - Polje
00050000-564d-90a8-581c-071de9019f59	1210	Ljubljana - Šentvid
00050000-564d-90a8-0ab4-4966266bd50d	1211	Ljubljana - Šmartno
00050000-564d-90a8-860f-0667d61948a5	3333	Ljubno ob Savinji
00050000-564d-90a8-f0b8-086f67b23f0b	9240	Ljutomer
00050000-564d-90a8-51f7-2f8fdf8e4818	3215	Loče
00050000-564d-90a8-9c1e-af3617f9f90c	5231	Log pod Mangartom
00050000-564d-90a8-ce30-cd573080fe07	1358	Log pri Brezovici
00050000-564d-90a8-10ca-124abbb9f65b	1370	Logatec
00050000-564d-90a8-be5a-edf76c0fbc70	1371	Logatec
00050000-564d-90a8-b87c-cd920bd6dd8d	1434	Loka pri Zidanem Mostu
00050000-564d-90a8-2b19-b798120e4c18	3223	Loka pri Žusmu
00050000-564d-90a8-2d62-d7057f631dd3	6219	Lokev
00050000-564d-90a8-bdc8-117e770d8944	1318	Loški Potok
00050000-564d-90a8-390d-73894c05624e	2324	Lovrenc na Dravskem polju
00050000-564d-90a8-4c44-e62d949d98ab	2344	Lovrenc na Pohorju
00050000-564d-90a8-bf78-0c1ba0636439	3334	Luče
00050000-564d-90a8-b27d-302857d2e306	1225	Lukovica
00050000-564d-90a8-6238-df6d2f70df96	9202	Mačkovci
00050000-564d-90a8-16e6-d50e8ef81518	2322	Majšperk
00050000-564d-90a8-b4c2-318516513447	2321	Makole
00050000-564d-90a8-0212-d6480ac84d77	9243	Mala Nedelja
00050000-564d-90a8-1c5a-a9a9903671c1	2229	Malečnik
00050000-564d-90a8-476c-460ee7fb551b	6273	Marezige
00050000-564d-90a8-d37d-33349bc0e324	2000	Maribor 
00050000-564d-90a8-2af9-6673b1da8345	2001	Maribor - poštni predali
00050000-564d-90a8-96dc-76a46ea2e954	2206	Marjeta na Dravskem polju
00050000-564d-90a8-7b24-ab104e81dcb5	2281	Markovci
00050000-564d-90a8-4b9e-7d0f992c834b	9221	Martjanci
00050000-564d-90a8-2d29-788844991c11	6242	Materija
00050000-564d-90a8-fdd2-aea830634dc3	4211	Mavčiče
00050000-564d-90a8-c8a1-f3a98fa2bc09	1215	Medvode
00050000-564d-90a8-b4b9-de9491eb02c0	1234	Mengeš
00050000-564d-90a8-43f8-e9b47c3b1ffd	8330	Metlika
00050000-564d-90a8-4721-ed9d5aa3ab22	2392	Mežica
00050000-564d-90a8-554c-0bfae226131d	2204	Miklavž na Dravskem polju
00050000-564d-90a8-164f-c06f5378334b	2275	Miklavž pri Ormožu
00050000-564d-90a8-633f-a98ce65b590a	5291	Miren
00050000-564d-90a8-891f-ff647ab20a18	8233	Mirna
00050000-564d-90a8-d7cc-09ee518dfa54	8216	Mirna Peč
00050000-564d-90a8-c348-cec0c6a3d3eb	2382	Mislinja
00050000-564d-90a8-9c8a-f19874ca85a8	4281	Mojstrana
00050000-564d-90a8-a5dd-c33c61ee35ad	8230	Mokronog
00050000-564d-90a8-faa6-f8ad35aa488a	1251	Moravče
00050000-564d-90a8-18b7-1cedade070fe	9226	Moravske Toplice
00050000-564d-90a8-a335-8d6822f27522	5216	Most na Soči
00050000-564d-90a8-94e7-47b8e8bf3c80	1221	Motnik
00050000-564d-90a8-4ac2-6fda1159a5dd	3330	Mozirje
00050000-564d-90a8-192a-ec245038e6d9	9000	Murska Sobota 
00050000-564d-90a8-182c-9664c47a3061	9001	Murska Sobota - poštni predali
00050000-564d-90a8-b0d9-25ebf36f1ade	2366	Muta
00050000-564d-90a8-9cb6-45459c3e0de9	4202	Naklo
00050000-564d-90a8-bd3d-e6229c4e816d	3331	Nazarje
00050000-564d-90a8-b9cc-f9136c1d3186	1357	Notranje Gorice
00050000-564d-90a8-ada5-2103746b754a	3203	Nova Cerkev
00050000-564d-90a8-4913-efb7deb81052	5000	Nova Gorica 
00050000-564d-90a8-e9d6-082c5f61225e	5001	Nova Gorica - poštni predali
00050000-564d-90a8-82ec-0dffa0b50c54	1385	Nova vas
00050000-564d-90a8-585e-393cbdc2fdd0	8000	Novo mesto
00050000-564d-90a8-8c4f-664da1def16a	8001	Novo mesto - poštni predali
00050000-564d-90a8-5860-5219f2c43498	6243	Obrov
00050000-564d-90a8-5281-ba7eb533b5b6	9233	Odranci
00050000-564d-90a8-02f9-d60310cd9345	2317	Oplotnica
00050000-564d-90a8-5088-978d6a9cef06	2312	Orehova vas
00050000-564d-90a8-c339-4de3904d929d	2270	Ormož
00050000-564d-90a8-460e-6dc5b27559ae	1316	Ortnek
00050000-564d-90a8-9b4d-d82aafd995a2	1337	Osilnica
00050000-564d-90a8-7254-4f220c715af0	8222	Otočec
00050000-564d-90a8-d5a9-7ffeb8f81988	2361	Ožbalt
00050000-564d-90a8-901b-bfc0c7d54fbf	2231	Pernica
00050000-564d-90a8-8fca-76876d8d142c	2211	Pesnica pri Mariboru
00050000-564d-90a8-5149-ae291c771e19	9203	Petrovci
00050000-564d-90a8-df4b-c8768f8554f7	3301	Petrovče
00050000-564d-90a8-4884-dbb637e97aab	6330	Piran/Pirano
00050000-564d-90a8-6ff8-628fdab20751	8255	Pišece
00050000-564d-90a8-536c-c894bf718fa8	6257	Pivka
00050000-564d-90a8-2e0f-7272482f2b61	6232	Planina
00050000-564d-90a8-a903-e512b3a5834f	3225	Planina pri Sevnici
00050000-564d-90a8-cec5-78b578a29fe9	6276	Pobegi
00050000-564d-90a8-2e79-3c52528546cf	8312	Podbočje
00050000-564d-90a8-5206-eabea8a50aae	5243	Podbrdo
00050000-564d-90a8-8749-ce663d06ef87	3254	Podčetrtek
00050000-564d-90a8-7a2f-5792dec9ab52	2273	Podgorci
00050000-564d-90a8-d1a9-84e978dc8b2a	6216	Podgorje
00050000-564d-90a8-4b24-bc2751055fdb	2381	Podgorje pri Slovenj Gradcu
00050000-564d-90a8-8212-76c03756fbe6	6244	Podgrad
00050000-564d-90a8-3584-23da6ef14cad	1414	Podkum
00050000-564d-90a8-5fc0-bff43c522c35	2286	Podlehnik
00050000-564d-90a8-1b1c-e872722bc728	5272	Podnanos
00050000-564d-90a8-6c6d-5e09412bf06a	4244	Podnart
00050000-564d-90a8-f893-7b613c5a784a	3241	Podplat
00050000-564d-90a8-c772-dccf597008ba	3257	Podsreda
00050000-564d-90a8-23b0-252e68f3d544	2363	Podvelka
00050000-564d-90a8-0cb1-c5b2034d5285	2208	Pohorje
00050000-564d-90a8-eaee-9e80b9317c24	2257	Polenšak
00050000-564d-90a8-590a-80c12e1ec871	1355	Polhov Gradec
00050000-564d-90a8-6001-2b39e8ddc461	4223	Poljane nad Škofjo Loko
00050000-564d-90a8-c221-1c4c37dffef9	2319	Poljčane
00050000-564d-90a8-bd96-5987ce1bd7c3	1272	Polšnik
00050000-564d-90a8-230e-abc7c045679d	3313	Polzela
00050000-564d-90a8-bb61-6b15151aaccf	3232	Ponikva
00050000-564d-90a8-7d55-00f164df3668	6320	Portorož/Portorose
00050000-564d-90a8-54ab-d910377cd3b2	6230	Postojna
00050000-564d-90a8-cbe7-9722aac18f6e	2331	Pragersko
00050000-564d-90a8-f587-0692076abc0a	3312	Prebold
00050000-564d-90a8-3957-e1a4d54a861c	4205	Preddvor
00050000-564d-90a8-b14e-584eb0b2ff58	6255	Prem
00050000-564d-90a8-43f8-65c72684c32c	1352	Preserje
00050000-564d-90a8-f7e4-9576d4192078	6258	Prestranek
00050000-564d-90a8-6d0d-5574cbb0a499	2391	Prevalje
00050000-564d-90a8-d29b-b82ed9b8a9d2	3262	Prevorje
00050000-564d-90a8-86ad-6dc691fb4a39	1276	Primskovo 
00050000-564d-90a8-9cdf-c5775f37ece3	3253	Pristava pri Mestinju
00050000-564d-90a8-73ae-bc1d65b74e0d	9207	Prosenjakovci/Partosfalva
00050000-564d-90a8-d602-86cc54ed4935	5297	Prvačina
00050000-564d-90a8-20d5-99f5a15dfb6d	2250	Ptuj
00050000-564d-90a8-2691-118989737a34	2323	Ptujska Gora
00050000-564d-90a8-4ad1-51cba17dec4f	9201	Puconci
00050000-564d-90a8-af2e-1de56cf8c689	2327	Rače
00050000-564d-90a8-d145-e2832a897708	1433	Radeče
00050000-564d-90a8-baed-58875b5896eb	9252	Radenci
00050000-564d-90a8-db00-7c3415856fc4	2360	Radlje ob Dravi
00050000-564d-90a8-834c-e19f244b0042	1235	Radomlje
00050000-564d-90a8-5254-c2c315d5afac	4240	Radovljica
00050000-564d-90a8-45e4-bccc360bbdd3	8274	Raka
00050000-564d-90a8-463b-1c53338f15cd	1381	Rakek
00050000-564d-90a8-43c9-600eed8b7c18	4283	Rateče - Planica
00050000-564d-90a8-8def-3f613bc2cb7f	2390	Ravne na Koroškem
00050000-564d-90a8-fce1-446caf76aee0	9246	Razkrižje
00050000-564d-90a8-014f-d7229559d673	3332	Rečica ob Savinji
00050000-564d-90a8-f043-6c762a81297f	5292	Renče
00050000-564d-90a8-82e0-8006a5db6bc3	1310	Ribnica
00050000-564d-90a8-eb19-2bee784b383f	2364	Ribnica na Pohorju
00050000-564d-90a8-cef4-459b07bd4dda	3272	Rimske Toplice
00050000-564d-90a8-c5d5-29568e060892	1314	Rob
00050000-564d-90a8-556d-7af9d0bfb8a3	5215	Ročinj
00050000-564d-90a8-a115-e4b293ea8a3b	3250	Rogaška Slatina
00050000-564d-90a8-2e59-0ad34f267cdd	9262	Rogašovci
00050000-564d-90a8-40f1-4b0d0c2ef8af	3252	Rogatec
00050000-564d-90a8-e0ec-3097b592e498	1373	Rovte
00050000-564d-90a8-1395-365679a813ec	2342	Ruše
00050000-564d-90a8-f8cb-1db491a40dba	1282	Sava
00050000-564d-90a8-1313-e2228afc9226	6333	Sečovlje/Sicciole
00050000-564d-90a8-25da-8283c3d5a525	4227	Selca
00050000-564d-90a8-2d9e-7c1f5d0d789b	2352	Selnica ob Dravi
00050000-564d-90a8-5ef6-8253b119cd68	8333	Semič
00050000-564d-90a8-a380-7e3209f8987f	8281	Senovo
00050000-564d-90a8-2336-2603bd69583f	6224	Senožeče
00050000-564d-90a8-1371-9c33d9febc57	8290	Sevnica
00050000-564d-90a8-1590-b09d965fdeeb	6210	Sežana
00050000-564d-90a8-3fc0-497ef86327c8	2214	Sladki Vrh
00050000-564d-90a8-6fb3-12cd76d639b8	5283	Slap ob Idrijci
00050000-564d-90a8-97de-c9c6e8da77c6	2380	Slovenj Gradec
00050000-564d-90a8-6fa1-b4f702ab4431	2310	Slovenska Bistrica
00050000-564d-90a8-270f-f5ed5fee74bf	3210	Slovenske Konjice
00050000-564d-90a8-1767-fae35f34d5f6	1216	Smlednik
00050000-564d-90a8-b6cb-6c22ebd18eb6	5232	Soča
00050000-564d-90a8-ea51-9ef77b127c1f	1317	Sodražica
00050000-564d-90a8-045f-10704731fa36	3335	Solčava
00050000-564d-90a8-82a5-997e09fc0a09	5250	Solkan
00050000-564d-90a8-4b28-0106ca48787d	4229	Sorica
00050000-564d-90a8-5e94-012898bd7b55	4225	Sovodenj
00050000-564d-90a8-c8a2-598392b98883	5281	Spodnja Idrija
00050000-564d-90a8-ec34-b8f18ab73fca	2241	Spodnji Duplek
00050000-564d-90a8-2640-49c86c23ae1e	9245	Spodnji Ivanjci
00050000-564d-90a8-ba15-88a9321a25e6	2277	Središče ob Dravi
00050000-564d-90a8-18ca-9929d6a8e0c3	4267	Srednja vas v Bohinju
00050000-564d-90a8-7d53-8e2aa76091e3	8256	Sromlje 
00050000-564d-90a8-b5a2-bb2d58d5cb88	5224	Srpenica
00050000-564d-90a8-f665-293d079c1c4b	1242	Stahovica
00050000-564d-90a8-030d-2200dde4e8c9	1332	Stara Cerkev
00050000-564d-90a8-c10a-f44ccbf9a675	8342	Stari trg ob Kolpi
00050000-564d-90a8-63c9-398a81bcedb5	1386	Stari trg pri Ložu
00050000-564d-90a8-885b-71a826abb93b	2205	Starše
00050000-564d-90a8-104d-95f5368cf27c	2289	Stoperce
00050000-564d-90a8-5e41-ccc11a2cf814	8322	Stopiče
00050000-564d-90a8-82e1-acb01ba709dd	3206	Stranice
00050000-564d-90a8-2794-dea4551af7fe	8351	Straža
00050000-564d-90a8-d76c-a3134c85d11e	1313	Struge
00050000-564d-90a8-4fa3-2336edda8741	8293	Studenec
00050000-564d-90a8-17c7-43c88d66ae5d	8331	Suhor
00050000-564d-90a8-f6ea-114c7df93c84	2233	Sv. Ana v Slovenskih goricah
00050000-564d-90a8-86d6-f23934c0c580	2235	Sv. Trojica v Slovenskih goricah
00050000-564d-90a8-3f84-27710bffc266	2353	Sveti Duh na Ostrem Vrhu
00050000-564d-90a8-1648-0bf9309f611f	9244	Sveti Jurij ob Ščavnici
00050000-564d-90a8-3f01-7ab9c1f62b36	3264	Sveti Štefan
00050000-564d-90a8-95a3-a5d2e9d9826d	2258	Sveti Tomaž
00050000-564d-90a8-ccc2-226f222cc124	9204	Šalovci
00050000-564d-90a8-3229-f1f94f2a0659	5261	Šempas
00050000-564d-90a8-8bae-ccff46c94313	5290	Šempeter pri Gorici
00050000-564d-90a8-d89d-7b93aa551696	3311	Šempeter v Savinjski dolini
00050000-564d-90a8-5191-d7e41fdc2b87	4208	Šenčur
00050000-564d-90a8-cee5-cefd496f6931	2212	Šentilj v Slovenskih goricah
00050000-564d-90a8-1d25-43857f59d8c7	8297	Šentjanž
00050000-564d-90a8-6df4-c684865610fb	2373	Šentjanž pri Dravogradu
00050000-564d-90a8-954f-69b8b8c6058e	8310	Šentjernej
00050000-564d-90a8-6e07-693af550c3e5	3230	Šentjur
00050000-564d-90a8-a68a-fbe801713ca5	3271	Šentrupert
00050000-564d-90a8-f7c9-61298969b94f	8232	Šentrupert
00050000-564d-90a8-2513-9a5265acac2a	1296	Šentvid pri Stični
00050000-564d-90a8-7b09-83c8c4820cac	8275	Škocjan
00050000-564d-90a8-4e57-76fa0545d3f5	6281	Škofije
00050000-564d-90a8-e27b-0063526d0325	4220	Škofja Loka
00050000-564d-90a8-727b-27db55ba6602	3211	Škofja vas
00050000-564d-90a8-d962-6c03c9b955a5	1291	Škofljica
00050000-564d-90a8-8795-5abf1e7e465e	6274	Šmarje
00050000-564d-90a8-6775-7486b939d719	1293	Šmarje - Sap
00050000-564d-90a8-ebe8-8e362bac951b	3240	Šmarje pri Jelšah
00050000-564d-90a8-576f-df3b5409488c	8220	Šmarješke Toplice
00050000-564d-90a8-0656-ad8a88210a9c	2315	Šmartno na Pohorju
00050000-564d-90a8-550b-04b9f547f68a	3341	Šmartno ob Dreti
00050000-564d-90a8-f689-bcd9b76189e3	3327	Šmartno ob Paki
00050000-564d-90a8-1592-6906f1e8653c	1275	Šmartno pri Litiji
00050000-564d-90a8-0432-2f5134f7e92e	2383	Šmartno pri Slovenj Gradcu
00050000-564d-90a8-c9e2-3bf747181964	3201	Šmartno v Rožni dolini
00050000-564d-90a8-2122-e37d6b764142	3325	Šoštanj
00050000-564d-90a8-a951-3b6e17d7b32c	6222	Štanjel
00050000-564d-90a8-d6a8-c6858f98fb37	3220	Štore
00050000-564d-90a8-7335-93fd0c72e8f8	3304	Tabor
00050000-564d-90a8-9611-1ebfec8f1a98	3221	Teharje
00050000-564d-90a8-017d-1646f99e8d8b	9251	Tišina
00050000-564d-90a8-f141-8424dfd6da16	5220	Tolmin
00050000-564d-90a8-b39d-af512b4d0331	3326	Topolšica
00050000-564d-90a8-b300-54f90f022c9e	2371	Trbonje
00050000-564d-90a8-0d76-30164bdfbe13	1420	Trbovlje
00050000-564d-90a8-3720-a958e7b8b9d0	8231	Trebelno 
00050000-564d-90a8-04a4-b1c759224465	8210	Trebnje
00050000-564d-90a8-f44e-659522055337	5252	Trnovo pri Gorici
00050000-564d-90a8-fa1a-021d82183f75	2254	Trnovska vas
00050000-564d-90a8-622b-41014403d23a	1222	Trojane
00050000-564d-90a8-a326-429571edb760	1236	Trzin
00050000-564d-90a8-c5b0-cc7a2800d0d8	4290	Tržič
00050000-564d-90a8-6118-27eb83df659b	8295	Tržišče
00050000-564d-90a8-cb02-3b04a9442932	1311	Turjak
00050000-564d-90a8-1d74-f7e60b8457f2	9224	Turnišče
00050000-564d-90a8-ef02-2074ce958573	8323	Uršna sela
00050000-564d-90a8-607d-c8df82008d1f	1252	Vače
00050000-564d-90a8-d7e1-cb8817abc6c1	3320	Velenje 
00050000-564d-90a8-9847-c872a17f2db7	3322	Velenje - poštni predali
00050000-564d-90a8-41b5-227e035899bc	8212	Velika Loka
00050000-564d-90a8-7f00-79e5034d20f1	2274	Velika Nedelja
00050000-564d-90a8-756f-a57ecc92d9e2	9225	Velika Polana
00050000-564d-90a8-0ce2-0b55e5f9270a	1315	Velike Lašče
00050000-564d-90a8-9bac-c26e437a28f8	8213	Veliki Gaber
00050000-564d-90a8-a175-a11f07c3c822	9241	Veržej
00050000-564d-90a8-0984-07211fa21db2	1312	Videm - Dobrepolje
00050000-564d-90a8-d52d-36153d30bc34	2284	Videm pri Ptuju
00050000-564d-90a8-ae68-908662e289bb	8344	Vinica
00050000-564d-90a8-4d09-f017a8fab613	5271	Vipava
00050000-564d-90a8-151c-b89f90f7b9d6	4212	Visoko
00050000-564d-90a8-bf7b-e6a20d01a74b	1294	Višnja Gora
00050000-564d-90a8-6c0f-15f0f640ed00	3205	Vitanje
00050000-564d-90a8-7dae-d170cfcdd581	2255	Vitomarci
00050000-564d-90a8-9337-2d7d97c3e15a	1217	Vodice
00050000-564d-90a8-3673-682b2ccd9f46	3212	Vojnik\t
00050000-564d-90a8-ca5b-12b9f3ce0dfb	5293	Volčja Draga
00050000-564d-90a8-d153-7dd8413b2c56	2232	Voličina
00050000-564d-90a8-cec7-feb3543c1995	3305	Vransko
00050000-564d-90a8-2938-6347de9d7af7	6217	Vremski Britof
00050000-564d-90a8-aa81-f6e9f98bea96	1360	Vrhnika
00050000-564d-90a8-8a92-c6c407b9fc26	2365	Vuhred
00050000-564d-90a8-f54d-4063b65e8cea	2367	Vuzenica
00050000-564d-90a8-c7e4-2fe896c74c7a	8292	Zabukovje 
00050000-564d-90a8-2f81-aa65e089a5c7	1410	Zagorje ob Savi
00050000-564d-90a8-d5c7-2ecd304899f6	1303	Zagradec
00050000-564d-90a8-ca60-22030727a58c	2283	Zavrč
00050000-564d-90a8-17b3-41f156d401ab	8272	Zdole 
00050000-564d-90a8-3275-46106f642fb2	4201	Zgornja Besnica
00050000-564d-90a8-47f3-28256c9f53c1	2242	Zgornja Korena
00050000-564d-90a8-307b-b9ddd2885e30	2201	Zgornja Kungota
00050000-564d-90a8-8ae8-6a599585e328	2316	Zgornja Ložnica
00050000-564d-90a8-282f-808803c2d601	2314	Zgornja Polskava
00050000-564d-90a8-fed3-4586de2edd14	2213	Zgornja Velka
00050000-564d-90a8-f318-ea4f1d0aa5dc	4247	Zgornje Gorje
00050000-564d-90a8-dd97-99a11600bf4f	4206	Zgornje Jezersko
00050000-564d-90a8-4d26-84f1c3eaa45f	2285	Zgornji Leskovec
00050000-564d-90a8-707d-562d6383ada0	1432	Zidani Most
00050000-564d-90a8-2dbd-dd67290ade86	3214	Zreče
00050000-564d-90a8-fc7d-a0686758701d	4209	Žabnica
00050000-564d-90a8-58db-cd494d269fb8	3310	Žalec
00050000-564d-90a8-62bc-2b14a768af5a	4228	Železniki
00050000-564d-90a8-e881-8925b6ce3306	2287	Žetale
00050000-564d-90a8-a7c6-ea92aa4d7a3a	4226	Žiri
00050000-564d-90a8-4aae-977f6d81f2fb	4274	Žirovnica
00050000-564d-90a8-d8ee-fa342652c6c0	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 28441875)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 28441451)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 28441199)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-564d-90ab-3465-3e4576077b12	00080000-564d-90ab-a516-4d13fe99946c	\N	00040000-564d-90a9-637c-154c60013c34	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-564d-90ab-3501-56249b2741c9	00080000-564d-90ab-a516-4d13fe99946c	\N	00040000-564d-90a9-637c-154c60013c34	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-564d-90ab-8858-894605f9fa6b	00080000-564d-90ab-4561-8b8c4986e7e5	\N	00040000-564d-90a9-637c-154c60013c34	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 28441343)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-564d-90a9-8145-a58e42ae6b5f	novo leto	1	1	\N	t
00430000-564d-90a9-396c-ce8ccf9d5122	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-564d-90a9-3304-0aa9fc8a101c	dan upora proti okupatorju	27	4	\N	t
00430000-564d-90a9-aeb1-477d6bf4692f	praznik dela	1	5	\N	t
00430000-564d-90a9-c777-a63274f6a716	praznik dela	2	5	\N	t
00430000-564d-90a9-4afd-bb7d5c1d4440	dan Primoža Trubarja	8	6	\N	f
00430000-564d-90a9-3e41-4b2e27c26729	dan državnosti	25	6	\N	t
00430000-564d-90a9-e82c-69b9bd386394	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-564d-90a9-c347-0cc985b9c124	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-564d-90a9-299b-e4e08c3b0242	dan suverenosti	25	10	\N	f
00430000-564d-90a9-e04b-1d8e0458d5b0	dan spomina na mrtve	1	11	\N	t
00430000-564d-90a9-477f-65072d6c53a9	dan Rudolfa Maistra	23	11	\N	f
00430000-564d-90a9-c5e0-244f18548c5f	božič	25	12	\N	t
00430000-564d-90a9-e6d9-d071f8fb07bc	dan samostojnosti in enotnosti	26	12	\N	t
00430000-564d-90a9-9c2d-2b71265a27c4	Marijino vnebovzetje	15	8	\N	t
00430000-564d-90a9-08c5-43afbdcbc300	dan reformacije	31	10	\N	t
00430000-564d-90a9-9f64-9b5748896b96	velikonočna nedelja	27	3	2016	t
00430000-564d-90a9-deb1-c1346e0b498c	velikonočna nedelja	16	4	2017	t
00430000-564d-90a9-6291-a3fa1da1e008	velikonočna nedelja	1	4	2018	t
00430000-564d-90a9-4ee0-45d368ea4798	velikonočna nedelja	21	4	2019	t
00430000-564d-90a9-0e2f-b4a31353eefd	velikonočna nedelja	12	4	2020	t
00430000-564d-90a9-d351-6eb8503d117f	velikonočna nedelja	4	4	2021	t
00430000-564d-90a9-9eb0-c071a92b4b59	velikonočna nedelja	17	4	2022	t
00430000-564d-90a9-4a90-4055b5cb4146	velikonočna nedelja	9	4	2023	t
00430000-564d-90a9-de65-1734c589d04c	velikonočna nedelja	31	3	2024	t
00430000-564d-90a9-1992-bec610491722	velikonočna nedelja	20	4	2025	t
00430000-564d-90a9-478e-f90dda155a8e	velikonočna nedelja	5	4	2026	t
00430000-564d-90a9-4aac-b7b20bceb3a8	velikonočna nedelja	28	3	2027	t
00430000-564d-90a9-7f64-92c6e17cc19d	velikonočna nedelja	16	4	2028	t
00430000-564d-90a9-8eab-f75d82897cec	velikonočna nedelja	1	4	2029	t
00430000-564d-90a9-20cc-5726ef0bb8d5	velikonočna nedelja	21	4	2030	t
00430000-564d-90a9-22fc-b2981909cfc5	velikonočni ponedeljek	28	3	2016	t
00430000-564d-90a9-2d43-06505737db0b	velikonočni ponedeljek	17	4	2017	t
00430000-564d-90a9-4af8-7e78b939eee9	velikonočni ponedeljek	2	4	2018	t
00430000-564d-90a9-0668-a8ba5bf549cf	velikonočni ponedeljek	22	4	2019	t
00430000-564d-90a9-b530-8518ebfb12b9	velikonočni ponedeljek	13	4	2020	t
00430000-564d-90a9-662f-c4421e35c26b	velikonočni ponedeljek	5	4	2021	t
00430000-564d-90a9-16eb-2cd59c68b3a0	velikonočni ponedeljek	18	4	2022	t
00430000-564d-90a9-3a78-3637d4dffa29	velikonočni ponedeljek	10	4	2023	t
00430000-564d-90a9-3567-5c1f716dd9e6	velikonočni ponedeljek	1	4	2024	t
00430000-564d-90a9-5b9a-326ce00ff79b	velikonočni ponedeljek	21	4	2025	t
00430000-564d-90a9-57d9-2494abc053a9	velikonočni ponedeljek	6	4	2026	t
00430000-564d-90a9-a444-cb0b08a494ec	velikonočni ponedeljek	29	3	2027	t
00430000-564d-90a9-bb34-3be008df97df	velikonočni ponedeljek	17	4	2028	t
00430000-564d-90a9-c743-3461e2b8d97d	velikonočni ponedeljek	2	4	2029	t
00430000-564d-90a9-8688-1233a8ee2b18	velikonočni ponedeljek	22	4	2030	t
00430000-564d-90a9-ad9d-53b1fb306356	binkoštna nedelja - binkošti	15	5	2016	t
00430000-564d-90a9-c6c5-90a74c3f5cb2	binkoštna nedelja - binkošti	4	6	2017	t
00430000-564d-90a9-ffc0-9bf04ecc5fbc	binkoštna nedelja - binkošti	20	5	2018	t
00430000-564d-90a9-9016-67b80fa7ac8d	binkoštna nedelja - binkošti	9	6	2019	t
00430000-564d-90a9-69fc-7dd05d675df2	binkoštna nedelja - binkošti	31	5	2020	t
00430000-564d-90a9-8d9e-cbe60ce6758a	binkoštna nedelja - binkošti	23	5	2021	t
00430000-564d-90a9-64f5-90172eea0ebd	binkoštna nedelja - binkošti	5	6	2022	t
00430000-564d-90a9-f7b7-4a831faf8ce8	binkoštna nedelja - binkošti	28	5	2023	t
00430000-564d-90a9-37df-2aad704baf83	binkoštna nedelja - binkošti	19	5	2024	t
00430000-564d-90a9-3bc9-752bf56fe08d	binkoštna nedelja - binkošti	8	6	2025	t
00430000-564d-90a9-50c4-01b414a21776	binkoštna nedelja - binkošti	24	5	2026	t
00430000-564d-90a9-7d65-2839bf5c8f66	binkoštna nedelja - binkošti	16	5	2027	t
00430000-564d-90a9-7a2b-ab937a38c527	binkoštna nedelja - binkošti	4	6	2028	t
00430000-564d-90a9-229f-5ff21a2d64fd	binkoštna nedelja - binkošti	20	5	2029	t
00430000-564d-90a9-a9eb-4dc3d4446eeb	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 28441303)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 28441315)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 28441463)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 28441889)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 28441899)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-564d-90ab-c195-fc246b0f9c9a	00080000-564d-90ab-0017-06b1e909fb26	0987	AK
00190000-564d-90ab-fcf7-440ca616d34a	00080000-564d-90ab-4561-8b8c4986e7e5	0989	AK
00190000-564d-90ab-0797-cc33db87c5ee	00080000-564d-90ab-0389-c2ecd9455de1	0986	AK
00190000-564d-90ab-1f92-346bdc514d3d	00080000-564d-90ab-dbe8-c2873fa57359	0984	AK
00190000-564d-90ab-2bba-1ac399cc3cb2	00080000-564d-90ab-669c-597161e4b633	0983	AK
00190000-564d-90ab-c5bd-c88f9f964de0	00080000-564d-90ab-b263-776bedf77b76	0982	AK
00190000-564d-90ac-9860-6c99fed70490	00080000-564d-90ac-dc1d-62a9c4536ec1	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 28441798)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-564d-90ab-3f80-65a0b49b8432	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 28441907)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 28441492)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-564d-90aa-ce97-8d928f21bd4e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-564d-90aa-a49b-c65a5a5de2e6	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-564d-90aa-0fa1-5800e0fd33a1	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-564d-90aa-5f0d-d75ba0df6744	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-564d-90aa-2a3f-51a762b5233e	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-564d-90aa-1ac4-cb0f35ac4303	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-564d-90aa-b4b0-e5bac6a5fb26	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 28441436)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 28441426)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 28441637)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 28441567)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 28441277)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 28441039)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-564d-90ac-dc1d-62a9c4536ec1	00010000-564d-90a9-e98d-d18f1b005f99	2015-11-19 10:04:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-564d-90ac-e7c5-c81c805eac79	00010000-564d-90a9-e98d-d18f1b005f99	2015-11-19 10:04:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-564d-90ac-9860-6c99fed70490	00010000-564d-90a9-e98d-d18f1b005f99	2015-11-19 10:04:44	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 28441505)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 28441077)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-564d-90a9-3282-ccbf382aef8a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-564d-90a9-b597-892bbbe3e709	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-564d-90a9-0849-494758643679	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-564d-90a9-f2f6-e295b8ddc0c3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-564d-90a9-a42d-f06899576217	planer	Planer dogodkov v koledarju	t
00020000-564d-90a9-4ad9-f1c019e18446	kadrovska	Kadrovska služba	t
00020000-564d-90a9-ca72-b7ffd46f4c63	arhivar	Ažuriranje arhivalij	t
00020000-564d-90a9-e1bb-3ccc167087e2	igralec	Igralec	t
00020000-564d-90a9-bc7d-7556b81b0a34	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-564d-90ab-bea3-b27b3da28ad3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-564d-90ab-d477-0076ea4604af	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-7d89-6634f0a6f7d0	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-80be-f06d07da59ec	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-9e60-06dc5dd79f8e	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-0e47-56f589cad352	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-e13f-03ced67921b6	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-01ee-8b804bb5989f	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-8f91-6e7af9d43bc5	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-387a-5f0983c8b400	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-e795-649d5559a2d1	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-58a7-181d8e069527	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-48be-7d32f0fa954b	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-187a-b6302d6c8404	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-446c-a0fb51f8d17b	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-aa37-de184f1f6e60	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-537f-b8958540bc64	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-564d-90ab-4666-9db4c41a5200	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3099 (class 0 OID 28441061)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-564d-90a9-7487-4f0a3a56bb35	00020000-564d-90a9-0849-494758643679
00010000-564d-90a9-e98d-d18f1b005f99	00020000-564d-90a9-0849-494758643679
00010000-564d-90ab-6abd-8b24f3e73cb2	00020000-564d-90ab-bea3-b27b3da28ad3
00010000-564d-90ab-ec8c-47e659736026	00020000-564d-90ab-d477-0076ea4604af
00010000-564d-90ab-ec8c-47e659736026	00020000-564d-90ab-0e47-56f589cad352
00010000-564d-90ab-ec8c-47e659736026	00020000-564d-90ab-387a-5f0983c8b400
00010000-564d-90ab-ec8c-47e659736026	00020000-564d-90ab-58a7-181d8e069527
00010000-564d-90ab-ec8c-47e659736026	00020000-564d-90ab-446c-a0fb51f8d17b
00010000-564d-90ab-ec8c-47e659736026	00020000-564d-90ab-537f-b8958540bc64
00010000-564d-90ab-ec8c-47e659736026	00020000-564d-90ab-80be-f06d07da59ec
00010000-564d-90ab-8e27-736ff62e980c	00020000-564d-90ab-d477-0076ea4604af
00010000-564d-90ab-8e27-736ff62e980c	00020000-564d-90ab-7d89-6634f0a6f7d0
00010000-564d-90ab-8e27-736ff62e980c	00020000-564d-90ab-80be-f06d07da59ec
00010000-564d-90ab-8e27-736ff62e980c	00020000-564d-90ab-9e60-06dc5dd79f8e
00010000-564d-90ab-44df-02b2302a9dbb	00020000-564d-90ab-d477-0076ea4604af
00010000-564d-90ab-44df-02b2302a9dbb	00020000-564d-90ab-7d89-6634f0a6f7d0
00010000-564d-90ab-44df-02b2302a9dbb	00020000-564d-90ab-80be-f06d07da59ec
00010000-564d-90ab-44df-02b2302a9dbb	00020000-564d-90ab-9e60-06dc5dd79f8e
00010000-564d-90ab-44df-02b2302a9dbb	00020000-564d-90ab-58a7-181d8e069527
00010000-564d-90ab-d6cf-4020151275f7	00020000-564d-90ab-7d89-6634f0a6f7d0
00010000-564d-90ab-d6cf-4020151275f7	00020000-564d-90ab-e13f-03ced67921b6
00010000-564d-90ab-d6cf-4020151275f7	00020000-564d-90ab-e795-649d5559a2d1
00010000-564d-90ab-d6cf-4020151275f7	00020000-564d-90ab-48be-7d32f0fa954b
00010000-564d-90ab-d6cf-4020151275f7	00020000-564d-90ab-58a7-181d8e069527
00010000-564d-90ab-d6cf-4020151275f7	00020000-564d-90ab-aa37-de184f1f6e60
00010000-564d-90ab-fed7-36c2879d6a78	00020000-564d-90ab-7d89-6634f0a6f7d0
00010000-564d-90ab-fed7-36c2879d6a78	00020000-564d-90ab-e13f-03ced67921b6
00010000-564d-90ab-fed7-36c2879d6a78	00020000-564d-90ab-8f91-6e7af9d43bc5
00010000-564d-90ab-fed7-36c2879d6a78	00020000-564d-90ab-e795-649d5559a2d1
00010000-564d-90ab-fed7-36c2879d6a78	00020000-564d-90ab-48be-7d32f0fa954b
00010000-564d-90ab-fed7-36c2879d6a78	00020000-564d-90ab-58a7-181d8e069527
00010000-564d-90ab-fed7-36c2879d6a78	00020000-564d-90ab-aa37-de184f1f6e60
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-7d89-6634f0a6f7d0
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-80be-f06d07da59ec
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-e13f-03ced67921b6
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-01ee-8b804bb5989f
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-8f91-6e7af9d43bc5
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-0e47-56f589cad352
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-e795-649d5559a2d1
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-48be-7d32f0fa954b
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-58a7-181d8e069527
00010000-564d-90ab-461a-3a8946552ba6	00020000-564d-90ab-aa37-de184f1f6e60
00010000-564d-90ab-ddfb-cb3410ed88cd	00020000-564d-90ab-d477-0076ea4604af
00010000-564d-90ab-ddfb-cb3410ed88cd	00020000-564d-90ab-9e60-06dc5dd79f8e
00010000-564d-90ab-ddfb-cb3410ed88cd	00020000-564d-90ab-0e47-56f589cad352
00010000-564d-90ab-ddfb-cb3410ed88cd	00020000-564d-90ab-387a-5f0983c8b400
00010000-564d-90ab-ddfb-cb3410ed88cd	00020000-564d-90ab-58a7-181d8e069527
00010000-564d-90ab-ddfb-cb3410ed88cd	00020000-564d-90ab-446c-a0fb51f8d17b
00010000-564d-90ab-ddfb-cb3410ed88cd	00020000-564d-90ab-537f-b8958540bc64
00010000-564d-90ab-eae6-ac52dc96dd63	00020000-564d-90ab-4666-9db4c41a5200
\.


--
-- TOC entry 3144 (class 0 OID 28441519)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 28441457)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 28441403)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-564d-90ab-edd6-e828943b0ac8	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-564d-90ab-67e8-386022b1c10e	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-564d-90ab-e1f6-b39829180d49	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 28441026)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-564d-90a8-0ab4-0806f30874a6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-564d-90a8-0fa8-4cbac5dda4fb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-564d-90a8-a7b7-a6c77da557ae	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-564d-90a8-3b81-02dda70968d1	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-564d-90a8-ad37-e0c63d6408c3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 28441018)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-564d-90a8-c80b-03388b3892e2	00230000-564d-90a8-3b81-02dda70968d1	popa
00240000-564d-90a8-52e8-6b1d9d034265	00230000-564d-90a8-3b81-02dda70968d1	oseba
00240000-564d-90a8-864b-60fe6e427828	00230000-564d-90a8-3b81-02dda70968d1	tippopa
00240000-564d-90a8-483f-cabcb78b2769	00230000-564d-90a8-3b81-02dda70968d1	organizacijskaenota
00240000-564d-90a8-87cf-8831b6e30587	00230000-564d-90a8-3b81-02dda70968d1	sezona
00240000-564d-90a8-3b1f-3c2ec631b6e3	00230000-564d-90a8-3b81-02dda70968d1	tipvaje
00240000-564d-90a8-fa2e-a70ce0d389a8	00230000-564d-90a8-0fa8-4cbac5dda4fb	prostor
00240000-564d-90a8-50af-0f9a21a16d38	00230000-564d-90a8-3b81-02dda70968d1	besedilo
00240000-564d-90a8-96f1-3a77e79fd090	00230000-564d-90a8-3b81-02dda70968d1	uprizoritev
00240000-564d-90a8-52f0-67e2faef0269	00230000-564d-90a8-3b81-02dda70968d1	funkcija
00240000-564d-90a8-8509-946a12aa2042	00230000-564d-90a8-3b81-02dda70968d1	tipfunkcije
00240000-564d-90a8-3dc9-911077951b81	00230000-564d-90a8-3b81-02dda70968d1	alternacija
00240000-564d-90a8-8e8b-3990a52b277c	00230000-564d-90a8-0ab4-0806f30874a6	pogodba
00240000-564d-90a8-6c08-d72d69aed9f1	00230000-564d-90a8-3b81-02dda70968d1	zaposlitev
00240000-564d-90a8-a3e0-073e073a2af6	00230000-564d-90a8-3b81-02dda70968d1	zvrstuprizoritve
00240000-564d-90a8-1ad8-46a2adbddd48	00230000-564d-90a8-0ab4-0806f30874a6	programdela
00240000-564d-90a8-146a-06c04a29ea6c	00230000-564d-90a8-3b81-02dda70968d1	zapis
\.


--
-- TOC entry 3093 (class 0 OID 28441013)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5295b236-ef1e-4f08-a3a6-ae50bce29d4c	00240000-564d-90a8-c80b-03388b3892e2	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 28441584)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-564d-90ab-8f62-e68491986174	000e0000-564d-90ab-67cc-74565d7722c0	00080000-564d-90ab-a516-4d13fe99946c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-564d-90a9-df6b-50be90ce780b
00270000-564d-90ab-f491-b839b5217780	000e0000-564d-90ab-67cc-74565d7722c0	00080000-564d-90ab-a516-4d13fe99946c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-564d-90a9-df6b-50be90ce780b
\.


--
-- TOC entry 3109 (class 0 OID 28441161)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 28441413)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-564d-90ab-82fc-1360af10bff2	00180000-564d-90ab-919c-9ed87573e4e6	000c0000-564d-90ab-8944-fd31b4b14dd3	00090000-564d-90ab-ceeb-82ff21091ef5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564d-90ab-a3f1-0826736f173c	00180000-564d-90ab-919c-9ed87573e4e6	000c0000-564d-90ab-8d88-989b1a88b51b	00090000-564d-90ab-2d34-16d734ad737a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564d-90ab-b2e5-1cdbc0143c4d	00180000-564d-90ab-919c-9ed87573e4e6	000c0000-564d-90ab-8c59-b13a4d192b05	00090000-564d-90ab-deb2-562b7665cf9d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564d-90ab-9b76-1888a7dd5131	00180000-564d-90ab-919c-9ed87573e4e6	000c0000-564d-90ab-c988-677fe9b90404	00090000-564d-90ab-ad40-b08c54cd53ae	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564d-90ab-49f2-01d11d44d638	00180000-564d-90ab-919c-9ed87573e4e6	000c0000-564d-90ab-7f7b-451a6977b0ae	00090000-564d-90ab-b122-763c7841bef3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564d-90ab-c48d-3567f2cf4d9a	00180000-564d-90ab-70fb-84631a9d3fd0	\N	00090000-564d-90ab-b122-763c7841bef3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-564d-90ab-d125-044570fab554	00180000-564d-90ab-70fb-84631a9d3fd0	\N	00090000-564d-90ab-2d34-16d734ad737a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 28441625)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-564d-90a8-66cb-8298104ec8b0	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-564d-90a8-5dd0-a308f3a87f7d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-564d-90a8-8856-b4ffbd4aa29f	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-564d-90a8-48a1-f1ce70959ce9	04	Režija	Režija	Režija	umetnik	30
000f0000-564d-90a8-b116-e6093353e3bc	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-564d-90a8-5f13-03f7178ec34f	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-564d-90a8-efbc-0065445b94cb	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-564d-90a8-83e5-65d974cdeeb5	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-564d-90a8-ac78-ea77855b4db9	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-564d-90a8-3ca4-719e4f25c6a2	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-564d-90a8-c945-3299fb1aba06	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-564d-90a8-f563-dc4fe0671545	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-564d-90a8-ec4c-c05fe417f814	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-564d-90a8-df6f-96c36b6cb061	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-564d-90a8-6521-af817f4afdd2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-564d-90a8-c29e-6abf8077b24b	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-564d-90a8-01d6-f8705565cf2b	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-564d-90a8-ef39-ac975c25d5e6	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 28441112)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-564d-90aa-38c1-7765428fd34f	0001	šola	osnovna ali srednja šola
00400000-564d-90aa-9993-28dcbb7f5c07	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-564d-90ab-a467-4a284ffa15e3	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 28441918)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-564d-90a8-1dfa-6a2851ad7179	01	Velika predstava	f	1.00	1.00
002b0000-564d-90a8-bce0-da51369c1f00	02	Mala predstava	f	0.50	0.50
002b0000-564d-90a8-90ce-a7d1ec53e454	03	Mala koprodukcija	t	0.40	1.00
002b0000-564d-90a8-0fec-56ab5889434f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-564d-90a8-9f2b-efeb4ba8a108	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 28441393)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-564d-90a8-b4ad-a5bf4b18b3df	0001	prva vaja	prva vaja
00420000-564d-90a8-7118-a001fbd3fa62	0002	tehnična vaja	tehnična vaja
00420000-564d-90a8-bdf5-1c316711b070	0003	lučna vaja	lučna vaja
00420000-564d-90a8-c2e0-26c50255dbc2	0004	kostumska vaja	kostumska vaja
00420000-564d-90a8-19e2-d3153fda6590	0005	foto vaja	foto vaja
00420000-564d-90a8-7605-c4b4e88cee8f	0006	1. glavna vaja	1. glavna vaja
00420000-564d-90a8-1520-b706369981e0	0007	2. glavna vaja	2. glavna vaja
00420000-564d-90a8-3cc8-f96892ba0c09	0008	1. generalka	1. generalka
00420000-564d-90a8-1179-3921c0f9926a	0009	2. generalka	2. generalka
00420000-564d-90a8-d685-fd6df0a5ecda	0010	odprta generalka	odprta generalka
00420000-564d-90a8-435f-e2dac4cc9d22	0011	obnovitvena vaja	obnovitvena vaja
00420000-564d-90a8-f8d8-7d5a6e00859f	0012	pevska vaja	pevska vaja
00420000-564d-90a8-2dd8-939bbc6248ac	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-564d-90a8-0a82-4496bf0c1f49	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 28441234)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 28441048)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-564d-90a9-e98d-d18f1b005f99	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROFGVmtqClKOqZ71WAlFb3iOCdRb/rDhy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-564d-90ab-e76d-ddd387a7fdae	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-564d-90ab-b77d-a11fe2ddea52	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-564d-90ab-20b6-52d494cd8082	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-564d-90ab-8c64-b391bd7c8cde	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-564d-90ab-e5e6-fbd39f7db6cb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-564d-90ab-c080-aef1c8d8c94c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-564d-90ab-b872-29d1df4f6ff6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-564d-90ab-5c54-e01c21bf9fa2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-564d-90ab-804c-682289b995cf	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-564d-90ab-6abd-8b24f3e73cb2	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-564d-90ab-e3ce-fe21ad319276	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-564d-90ab-ec8c-47e659736026	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-564d-90ab-8e27-736ff62e980c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-564d-90ab-44df-02b2302a9dbb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-564d-90ab-d6cf-4020151275f7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-564d-90ab-fed7-36c2879d6a78	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-564d-90ab-461a-3a8946552ba6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-564d-90ab-ddfb-cb3410ed88cd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-564d-90ab-eae6-ac52dc96dd63	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-564d-90a9-7487-4f0a3a56bb35	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 28441675)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-564d-90ab-a37c-3ca088a7fe17	00160000-564d-90aa-311b-dfa709853258	\N	00140000-564d-90a9-96a2-4f301255ea8c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-564d-90aa-2a3f-51a762b5233e
000e0000-564d-90ab-67cc-74565d7722c0	00160000-564d-90aa-c1ed-775eaf75295f	\N	00140000-564d-90a9-9d47-5e2a1a2d2c4d	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-564d-90aa-1ac4-cb0f35ac4303
000e0000-564d-90ab-7654-d594dd6df8de	\N	\N	00140000-564d-90a9-9d47-5e2a1a2d2c4d	00190000-564d-90ab-c195-fc246b0f9c9a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564d-90aa-2a3f-51a762b5233e
000e0000-564d-90ab-8175-05b1f99ea1d7	\N	\N	00140000-564d-90a9-9d47-5e2a1a2d2c4d	00190000-564d-90ab-c195-fc246b0f9c9a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564d-90aa-2a3f-51a762b5233e
000e0000-564d-90ab-e48f-cd6a1eb66d4c	\N	\N	00140000-564d-90a9-9d47-5e2a1a2d2c4d	00190000-564d-90ab-c195-fc246b0f9c9a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-564d-90aa-ce97-8d928f21bd4e
000e0000-564d-90ab-0b07-49786047553b	\N	\N	00140000-564d-90a9-9d47-5e2a1a2d2c4d	00190000-564d-90ab-c195-fc246b0f9c9a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-564d-90aa-ce97-8d928f21bd4e
\.


--
-- TOC entry 3123 (class 0 OID 28441333)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-564d-90ab-b32c-b9015915547d	\N	000e0000-564d-90ab-67cc-74565d7722c0	1	
00200000-564d-90ab-fda1-9ea734a36d94	\N	000e0000-564d-90ab-67cc-74565d7722c0	2	
00200000-564d-90ab-7c14-f9f97176b934	\N	000e0000-564d-90ab-67cc-74565d7722c0	3	
00200000-564d-90ab-25d7-9652ec239968	\N	000e0000-564d-90ab-67cc-74565d7722c0	4	
00200000-564d-90ab-b991-cc58fd238ad3	\N	000e0000-564d-90ab-67cc-74565d7722c0	5	
\.


--
-- TOC entry 3140 (class 0 OID 28441484)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 28441598)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-564d-90a9-644c-f57f4e5d77cd	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-564d-90a9-4333-c77b367a92db	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-564d-90a9-437f-725bdf4e62f6	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-564d-90a9-088f-310650e2126e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-564d-90a9-04e5-724643111ad1	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-564d-90a9-0b25-de95a5a7a9c9	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-564d-90a9-304f-125e0ec8eca1	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-564d-90a9-1094-a5229560d556	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-564d-90a9-df6b-50be90ce780b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-564d-90a9-369e-fe7526a0cc02	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-564d-90a9-d4f2-0f0d815b05ed	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-564d-90a9-b77d-43291f784096	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-564d-90a9-5650-70c19be3e36e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-564d-90a9-0fac-d82d842dddce	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-564d-90a9-cf87-7b82a2b603ed	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-564d-90a9-8314-69a7e68b8f95	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-564d-90a9-e5d1-d6fe915e2552	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-564d-90a9-602e-c58d1e23172a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-564d-90a9-68d0-3b98f09f56c4	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-564d-90a9-8dbd-56955093c0ca	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-564d-90a9-0fe4-60da16d86c92	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-564d-90a9-fd8b-058ac4de7846	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-564d-90a9-6f33-d9078a76f758	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-564d-90a9-fccf-c103b0ecde5f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-564d-90a9-5a0d-1e91eafd11fe	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-564d-90a9-3e47-15c70f572619	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-564d-90a9-41a3-4cf932ce82f0	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-564d-90a9-e442-219c7a93db26	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 28441968)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 28441937)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 28441980)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 28441556)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-564d-90ab-bed5-ffab375d4368	00090000-564d-90ab-2d34-16d734ad737a	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564d-90ab-bc48-ecb41f1538d0	00090000-564d-90ab-deb2-562b7665cf9d	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564d-90ab-1815-d9e5029a39e1	00090000-564d-90ab-f7b3-ac39b93d94ee	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564d-90ab-24b5-8bd3b08235fd	00090000-564d-90ab-b287-c11472b62e08	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564d-90ab-bf75-275acd0ee5be	00090000-564d-90ab-89ae-bccb048aa725	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564d-90ab-bd37-ad80c1839a5d	00090000-564d-90ab-9a47-4db7dae8aab2	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 28441377)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 28441665)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-564d-90a9-96a2-4f301255ea8c	01	Drama	drama (SURS 01)
00140000-564d-90a9-9fb1-c535d3958e89	02	Opera	opera (SURS 02)
00140000-564d-90a9-a6dc-283f85b91790	03	Balet	balet (SURS 03)
00140000-564d-90a9-2ff7-9f551f7a4fdf	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-564d-90a9-82f1-c1a877c0ea71	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-564d-90a9-9d47-5e2a1a2d2c4d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-564d-90a9-9093-326eaf3fa07e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 28441546)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 28441111)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 28441724)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 28441714)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 28441102)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 28441581)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 28441623)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 28442021)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 28441365)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 28441387)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 28441392)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 28441935)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 28441260)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 28441792)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 28441542)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 28441331)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 28441298)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 28441274)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 28441449)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 28441998)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 28442005)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 28442029)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2726 (class 2606 OID 28441476)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 28441232)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 28441130)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 28441194)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 28441157)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 28441091)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 28441076)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 28441482)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 28441518)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 28441660)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 28441185)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 28441220)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 28441887)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 28441455)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 28441210)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 28441350)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 28441319)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 28441311)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 28441467)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 28441896)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 28441904)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 28441874)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 28441916)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 28441500)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 28441440)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 28441431)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 28441647)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 28441574)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 28441286)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 28441047)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 28441509)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 28441065)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 28441085)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 28441527)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 28441462)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 28441411)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 28441035)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 28441023)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 28441017)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 28441594)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 28441166)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 28441422)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 28441634)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 28441119)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 28441928)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 28441400)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 28441245)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 28441060)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 28441693)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 28441340)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 28441490)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 28441606)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 28441978)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 28441962)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 28441986)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 28441564)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 28441381)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 28441673)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 28441554)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 28441375)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 28441376)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 28441374)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 28441373)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 28441372)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 28441595)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 28441596)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 28441597)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 28442000)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 28441999)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 28441187)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 28441188)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 28441483)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 28441966)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 28441965)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 28441967)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 28441964)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 28441963)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 28441469)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 28441468)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 28441341)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 28441342)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 28441543)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 28441545)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 28441544)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 28441276)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 28441275)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 28441917)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 28441662)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 28441663)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 28441664)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 28441987)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 28441698)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 28441695)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 28441699)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 28441697)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 28441696)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 28441247)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 28441246)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 28441160)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 28441510)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 28441092)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 28441093)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 28441530)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 28441529)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 28441528)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 28441197)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 28441196)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 28441198)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 28441314)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 28441312)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 28441313)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 28441025)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 28441435)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 28441433)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 28441432)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 28441434)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 28441066)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 28441067)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 28441491)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 28442022)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 28441583)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 28441582)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 28442030)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 28442031)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 28441456)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 28441575)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 28441576)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 28441797)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 28441796)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 28441793)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 28441794)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 28441795)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 28441212)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 28441211)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 28441213)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 28441504)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 28441503)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 28441897)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 28441898)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 28441728)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 28441729)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 28441726)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 28441727)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 28441565)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 28441566)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 28441444)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 28441443)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 28441441)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 28441442)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 28441716)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 28441715)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 28441287)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 28441301)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 28441300)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 28441299)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 28441302)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 28441332)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 28441320)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 28441321)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 28441888)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 28441936)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 28442006)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 28442007)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 28441132)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 28441131)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 28441167)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 28441168)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 28441382)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 28441425)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 28441424)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 28441423)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 28441367)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 28441368)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 28441371)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 28441366)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 28441370)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 28441369)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 28441186)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 28441120)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 28441121)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 28441261)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 28441263)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 28441262)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 28441264)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 28441450)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 28441661)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 28441694)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 28441635)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 28441636)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 28441158)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 28441159)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 28441555)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 28441036)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 28441233)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 28441195)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 28441024)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 28441929)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 28441502)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 28441501)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 28441401)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 28441402)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 28441725)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 28441221)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 28441674)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 28441979)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 28441905)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 28441906)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 28441624)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 28441412)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 28441086)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 28442202)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 28442207)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 28442232)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 28442222)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 28442197)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 28442217)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 28442227)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 28442212)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 28442402)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 28442407)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 28442412)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 28442577)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 28442572)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 28442087)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 28442092)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 28442317)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 28442557)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 28442552)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 28442562)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 28442547)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 28442542)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 28442312)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 28442307)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 28442187)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 28442192)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 28442357)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 28442367)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 28442362)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 28442142)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 28442137)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 28442297)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 28442532)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 28442417)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 28442422)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 28442427)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 28442567)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 28442447)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 28442432)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 28442452)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 28442442)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 28442437)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 28442132)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 28442127)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 28442072)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 28442067)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 28442337)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 28442047)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 28442052)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 28442352)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 28442347)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 28442342)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 28442102)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 28442097)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 28442107)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 28442167)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 28442157)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 28442162)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 28442032)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 28442272)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 28442262)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 28442257)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 28442267)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 28442037)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 28442042)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 28442322)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 28442592)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 28442397)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 28442392)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 28442597)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 28442602)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 28442302)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 28442382)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 28442387)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 28442507)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 28442502)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 28442487)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 28442492)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 28442497)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 28442117)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 28442112)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 28442122)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 28442332)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 28442327)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 28442517)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 28442522)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 28442477)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 28442482)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 28442467)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 28442472)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 28442372)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 28442377)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 28442292)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 28442287)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 28442277)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 28442282)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 28442462)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 28442457)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 28442147)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 28442152)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 28442182)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 28442172)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 28442177)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 28442512)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 28442527)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 28442537)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 28442582)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 28442587)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 28442062)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 28442057)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 28442077)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 28442082)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 28442237)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 28442252)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 28442247)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 28442242)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-19 10:04:46 CET

--
-- PostgreSQL database dump complete
--

