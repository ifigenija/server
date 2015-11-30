--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-30 16:28:46 CET

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
-- TOC entry 183 (class 1259 OID 30174278)
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
-- TOC entry 237 (class 1259 OID 30174892)
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
-- TOC entry 236 (class 1259 OID 30174875)
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
-- TOC entry 182 (class 1259 OID 30174271)
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
-- TOC entry 181 (class 1259 OID 30174269)
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
-- TOC entry 227 (class 1259 OID 30174752)
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
-- TOC entry 230 (class 1259 OID 30174782)
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
-- TOC entry 251 (class 1259 OID 30175185)
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
-- TOC entry 203 (class 1259 OID 30174526)
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
-- TOC entry 205 (class 1259 OID 30174558)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30174563)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30175107)
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
-- TOC entry 194 (class 1259 OID 30174423)
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
-- TOC entry 238 (class 1259 OID 30174905)
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
-- TOC entry 223 (class 1259 OID 30174706)
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
-- TOC entry 200 (class 1259 OID 30174497)
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
-- TOC entry 197 (class 1259 OID 30174463)
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
-- TOC entry 195 (class 1259 OID 30174440)
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
-- TOC entry 212 (class 1259 OID 30174620)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30175165)
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
-- TOC entry 250 (class 1259 OID 30175178)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30175200)
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
-- TOC entry 216 (class 1259 OID 30174645)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30174397)
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
-- TOC entry 185 (class 1259 OID 30174297)
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
-- TOC entry 189 (class 1259 OID 30174364)
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
-- TOC entry 186 (class 1259 OID 30174308)
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
-- TOC entry 178 (class 1259 OID 30174243)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30174262)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30174652)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30174686)
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
-- TOC entry 233 (class 1259 OID 30174823)
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
-- TOC entry 188 (class 1259 OID 30174344)
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
-- TOC entry 191 (class 1259 OID 30174389)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30175051)
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
-- TOC entry 213 (class 1259 OID 30174626)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30174374)
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
-- TOC entry 202 (class 1259 OID 30174518)
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
-- TOC entry 198 (class 1259 OID 30174478)
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
-- TOC entry 199 (class 1259 OID 30174490)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30174638)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30175065)
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
-- TOC entry 242 (class 1259 OID 30175075)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30174974)
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
-- TOC entry 243 (class 1259 OID 30175083)
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
-- TOC entry 219 (class 1259 OID 30174667)
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
-- TOC entry 211 (class 1259 OID 30174611)
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
-- TOC entry 210 (class 1259 OID 30174601)
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
-- TOC entry 232 (class 1259 OID 30174812)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30174742)
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
-- TOC entry 196 (class 1259 OID 30174452)
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
-- TOC entry 175 (class 1259 OID 30174214)
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
-- TOC entry 174 (class 1259 OID 30174212)
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
-- TOC entry 220 (class 1259 OID 30174680)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30174252)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30174236)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30174694)
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
-- TOC entry 214 (class 1259 OID 30174632)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30174578)
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
-- TOC entry 173 (class 1259 OID 30174201)
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
-- TOC entry 172 (class 1259 OID 30174193)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30174188)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30174759)
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
-- TOC entry 187 (class 1259 OID 30174336)
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
-- TOC entry 209 (class 1259 OID 30174588)
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
-- TOC entry 231 (class 1259 OID 30174800)
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
-- TOC entry 184 (class 1259 OID 30174287)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30175095)
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
-- TOC entry 207 (class 1259 OID 30174568)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30174409)
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
-- TOC entry 176 (class 1259 OID 30174223)
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
-- TOC entry 235 (class 1259 OID 30174850)
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
-- TOC entry 201 (class 1259 OID 30174508)
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
-- TOC entry 218 (class 1259 OID 30174659)
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
-- TOC entry 229 (class 1259 OID 30174773)
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
-- TOC entry 247 (class 1259 OID 30175145)
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
-- TOC entry 246 (class 1259 OID 30175114)
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
-- TOC entry 248 (class 1259 OID 30175157)
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
-- TOC entry 225 (class 1259 OID 30174731)
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
-- TOC entry 204 (class 1259 OID 30174552)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30174840)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30174721)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30174274)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30174217)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 30174278)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-565c-6b2b-3054-80de60b0a93e	10	30	Otroci	Abonma za otroke	200
000a0000-565c-6b2b-2517-93f992a84c8e	20	60	Mladina	Abonma za mladino	400
000a0000-565c-6b2b-4070-406644145428	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 30174892)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-565c-6b2b-b70c-0a74174dac2f	000d0000-565c-6b2b-dd45-e9b99daae089	\N	00090000-565c-6b2b-e057-e8b1662ce6b7	000b0000-565c-6b2b-ba39-cbca65fa65f8	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-565c-6b2b-5837-9f8b5925ccf9	000d0000-565c-6b2b-0715-84cc84a0490d	00100000-565c-6b2b-1ff3-b064772f10b5	00090000-565c-6b2b-dbf1-040e2dad56cf	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-565c-6b2b-43eb-112772e09c20	000d0000-565c-6b2b-49ea-fcc3c3ac9cb4	00100000-565c-6b2b-1c4e-a00ea7e0a065	00090000-565c-6b2b-2856-b295161fd2a2	\N	0003	t	\N	2015-11-30	\N	2	t	\N	f	f
000c0000-565c-6b2b-1f90-ddf4f7269f12	000d0000-565c-6b2b-dc84-6ca77fc0c889	\N	00090000-565c-6b2b-0aff-408c0327be9f	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-565c-6b2b-cf0d-99a80350d236	000d0000-565c-6b2b-053a-0e59c97999d1	\N	00090000-565c-6b2b-1ddf-6e1d7bcf3fca	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-565c-6b2b-16ad-c79274d80d6d	000d0000-565c-6b2b-5936-bd70cdb07819	\N	00090000-565c-6b2b-5275-7e4283da45bf	000b0000-565c-6b2b-62ed-2054abecef16	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-565c-6b2b-081e-4bd4f0f93a99	000d0000-565c-6b2b-b9c9-c021ba3dcc70	00100000-565c-6b2b-8b44-fd3ddc5d4836	00090000-565c-6b2b-721c-4e84f8bc2540	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-565c-6b2b-aa51-c0cd753ed9ba	000d0000-565c-6b2b-c75c-732f8ce7bd8e	\N	00090000-565c-6b2b-1b73-06322b0ac67c	000b0000-565c-6b2b-318e-d802c766cb71	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-565c-6b2b-6646-ec4636f0c480	000d0000-565c-6b2b-b9c9-c021ba3dcc70	00100000-565c-6b2b-e931-8ad58270f01d	00090000-565c-6b2b-82cd-5a3fcee1d519	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-565c-6b2b-cd97-39c53c218acb	000d0000-565c-6b2b-b9c9-c021ba3dcc70	00100000-565c-6b2b-fcef-56b6e4e1ffdc	00090000-565c-6b2b-e715-3a28c6cb600c	\N	0010	t	\N	2015-11-30	\N	16	f	\N	f	t
000c0000-565c-6b2b-4a6b-edf2bbff6b85	000d0000-565c-6b2b-b9c9-c021ba3dcc70	00100000-565c-6b2b-b0dd-942ddb67fed7	00090000-565c-6b2b-2b90-cc5e0d9ae0c8	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-565c-6b2b-3856-4ed24fb87c8d	000d0000-565c-6b2b-7be9-aa8f697b28c0	00100000-565c-6b2b-1ff3-b064772f10b5	00090000-565c-6b2b-dbf1-040e2dad56cf	000b0000-565c-6b2b-d4c8-6d849c0d5460	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 30174875)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 30174271)
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
-- TOC entry 3151 (class 0 OID 30174752)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-565c-6b2b-0e80-560438af0c88	00160000-565c-6b2a-014c-0da5d6bc5bbe	00090000-565c-6b2b-2f8b-18404c3b5b73	aizv	10	t
003d0000-565c-6b2b-9cf7-ed89f83140aa	00160000-565c-6b2a-014c-0da5d6bc5bbe	00090000-565c-6b2b-f33c-7c1847a21f1f	apri	14	t
003d0000-565c-6b2b-aea0-538812d4e0b2	00160000-565c-6b2a-b89c-976473701e7d	00090000-565c-6b2b-fe43-f8bc19fb5aab	aizv	11	t
003d0000-565c-6b2b-9b98-4567ceba0f96	00160000-565c-6b2a-586f-ab31dd0662b5	00090000-565c-6b2b-f7c7-ea98e6b4d7d3	aizv	12	t
003d0000-565c-6b2b-29a1-87045a604a59	00160000-565c-6b2a-014c-0da5d6bc5bbe	00090000-565c-6b2b-b819-575dbe57aa5a	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 30174782)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-565c-6b2a-014c-0da5d6bc5bbe	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-565c-6b2a-b89c-976473701e7d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-565c-6b2a-586f-ab31dd0662b5	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 30175185)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 30174526)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-565c-6b2b-f7e9-664553c84ac8	\N	\N	00200000-565c-6b2b-c482-a1bb1fd593d9	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-565c-6b2b-eb12-0df509b9f4b3	\N	\N	00200000-565c-6b2b-3263-50a3d98f2e08	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-565c-6b2b-eaf8-ccceb1d96870	\N	\N	00200000-565c-6b2b-e1f9-cad4a7022d06	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-565c-6b2b-daf6-569d64ccadb1	\N	\N	00200000-565c-6b2b-b915-42b5e992e396	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-565c-6b2b-76a4-1789af24627c	\N	\N	00200000-565c-6b2b-7c62-d0ad95c4f596	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 30174558)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30174563)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 30175107)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30174423)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-565c-6b28-2f3e-ef6b4b5733d2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-565c-6b28-e312-2d6a55d503bc	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-565c-6b28-931a-f19e33663ebe	AL	ALB	008	Albania 	Albanija	\N
00040000-565c-6b28-9ceb-b79f8e6fd04a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-565c-6b28-2077-110218b8eb32	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-565c-6b28-5f37-8a46059d5ecc	AD	AND	020	Andorra 	Andora	\N
00040000-565c-6b28-5062-e6d60666510f	AO	AGO	024	Angola 	Angola	\N
00040000-565c-6b28-1a5a-9a3fbd685e24	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-565c-6b28-cf86-cda30f6863dc	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-565c-6b28-3dc6-d254f55bcd1d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-565c-6b28-a385-e30556d52201	AR	ARG	032	Argentina 	Argenitna	\N
00040000-565c-6b28-c9e8-ca4d5b1b757e	AM	ARM	051	Armenia 	Armenija	\N
00040000-565c-6b28-810f-4c4b88428536	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-565c-6b28-2b3c-0a43315b88c6	AU	AUS	036	Australia 	Avstralija	\N
00040000-565c-6b28-ca64-f0cef90a6d39	AT	AUT	040	Austria 	Avstrija	\N
00040000-565c-6b28-a50b-d77d132a9d0c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-565c-6b28-d650-cdfd5f4258a6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-565c-6b28-fa29-fa6b8158e032	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-565c-6b28-d68c-b794489fb522	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-565c-6b28-8b17-6b020c42ea62	BB	BRB	052	Barbados 	Barbados	\N
00040000-565c-6b28-7fc0-b60b6232b271	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-565c-6b28-fbef-91ba0c01ad78	BE	BEL	056	Belgium 	Belgija	\N
00040000-565c-6b28-3a55-3a7f452b4c89	BZ	BLZ	084	Belize 	Belize	\N
00040000-565c-6b28-b532-e1d96c96d01a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-565c-6b28-9532-f9abb9621dd3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-565c-6b28-7a94-ee4dd0b7fd88	BT	BTN	064	Bhutan 	Butan	\N
00040000-565c-6b28-d010-c1b126040297	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-565c-6b28-9d10-32407ed8e8bb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-565c-6b28-ec51-c50062780d74	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-565c-6b28-f68c-3d1ed94be682	BW	BWA	072	Botswana 	Bocvana	\N
00040000-565c-6b28-1437-acea96cc724a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-565c-6b28-dcc1-35d79ece1372	BR	BRA	076	Brazil 	Brazilija	\N
00040000-565c-6b28-5ce0-733b19f10646	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-565c-6b28-ebe9-09e3a9f65658	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-565c-6b28-0d8b-6c056482cd3c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-565c-6b28-f5c6-3e55ec29970f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-565c-6b28-0bd4-b567717e0a26	BI	BDI	108	Burundi 	Burundi 	\N
00040000-565c-6b28-af37-554006cd2b3f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-565c-6b28-93ee-9e6404c3a992	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-565c-6b28-859d-3022e6e0f6b2	CA	CAN	124	Canada 	Kanada	\N
00040000-565c-6b28-28d5-2f874a016855	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-565c-6b28-5d3d-6e33fac1b97a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-565c-6b28-d503-5814332fe794	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-565c-6b28-6436-62e6112b216a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-565c-6b28-1f58-a05c55728592	CL	CHL	152	Chile 	Čile	\N
00040000-565c-6b28-983a-46912d36ffcd	CN	CHN	156	China 	Kitajska	\N
00040000-565c-6b28-128f-18e3adbd43ad	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-565c-6b28-efcf-4bc208cd6e4b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-565c-6b28-fd6e-ae4514b33fc2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-565c-6b28-e371-92cde3a355aa	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-565c-6b28-c908-ea8c01985f69	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-565c-6b28-01da-7f6cb83c8128	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-565c-6b28-7378-c3a5ed3908f3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-565c-6b28-aa26-5192cb1d2014	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-565c-6b28-6b4a-fa06dfa71223	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-565c-6b28-6fb5-a86f219adaac	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-565c-6b28-3c0c-dd03f0ef8c41	CU	CUB	192	Cuba 	Kuba	\N
00040000-565c-6b28-4956-39693905bf30	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-565c-6b28-bfc4-b62ff13ccd66	CY	CYP	196	Cyprus 	Ciper	\N
00040000-565c-6b28-e5ad-4f96eb2f0290	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-565c-6b28-b8e2-1a84b5bb1397	DK	DNK	208	Denmark 	Danska	\N
00040000-565c-6b28-68ad-3b844e3d99f8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-565c-6b28-e8be-a4c5f9d7e868	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-565c-6b28-e5b1-09a8eed92d67	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-565c-6b28-a1f9-8f7b23f7393e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-565c-6b28-ca93-29a6fd485017	EG	EGY	818	Egypt 	Egipt	\N
00040000-565c-6b28-88dc-66023d402dad	SV	SLV	222	El Salvador 	Salvador	\N
00040000-565c-6b28-bd4a-28ff5fc3fe9c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-565c-6b28-61e9-edcdeef5cc04	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-565c-6b28-1701-c7fa73ba392d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-565c-6b28-4eb6-614cb469f44b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-565c-6b28-93d9-70ee8d932a4b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-565c-6b28-bca5-3fa7ef03f228	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-565c-6b28-ee9f-ee51d37abcb6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-565c-6b28-ca6d-c85528d3a0fc	FI	FIN	246	Finland 	Finska	\N
00040000-565c-6b28-5ee2-174749669a06	FR	FRA	250	France 	Francija	\N
00040000-565c-6b28-d480-2f4ea9710336	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-565c-6b28-a3bc-39da9ed038e3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-565c-6b28-d5a4-d7bd738af47c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-565c-6b28-dd80-b6e8f7b5e0a0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-565c-6b28-5655-d34b61426670	GA	GAB	266	Gabon 	Gabon	\N
00040000-565c-6b28-4d09-3b4db37a67fb	GM	GMB	270	Gambia 	Gambija	\N
00040000-565c-6b28-9be7-aa9cb281794b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-565c-6b28-457b-52b76a9d210e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-565c-6b28-a977-f5d852474fa0	GH	GHA	288	Ghana 	Gana	\N
00040000-565c-6b28-30be-b25b70e7db0f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-565c-6b28-da18-7690e629a6ef	GR	GRC	300	Greece 	Grčija	\N
00040000-565c-6b28-37f4-40ee0073ff86	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-565c-6b28-2522-aa16c14f93d3	GD	GRD	308	Grenada 	Grenada	\N
00040000-565c-6b28-efcb-4756837c23a8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-565c-6b28-ef53-d3d43404b07a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-565c-6b28-e14d-f591f9ff812d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-565c-6b28-513e-eee6d377a451	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-565c-6b28-2486-29e70fd475b0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-565c-6b28-fdd2-0ffddb39d936	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-565c-6b28-4cb3-262da6723ba2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-565c-6b28-e751-5d0cc190a2b3	HT	HTI	332	Haiti 	Haiti	\N
00040000-565c-6b28-b9ce-9af1a74bf10a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-565c-6b28-3808-52103ba8a1b9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-565c-6b28-b1fa-40b3c3bffdda	HN	HND	340	Honduras 	Honduras	\N
00040000-565c-6b28-dcf2-92d7df1cad08	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-565c-6b28-5160-fcdce6367a99	HU	HUN	348	Hungary 	Madžarska	\N
00040000-565c-6b28-1e7a-1ebb3e070094	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-565c-6b28-5f40-46f3e8c7080f	IN	IND	356	India 	Indija	\N
00040000-565c-6b28-57b1-ebea2f3e23be	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-565c-6b28-d7c5-1ac0e85d6549	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-565c-6b28-20fd-aedbd296e433	IQ	IRQ	368	Iraq 	Irak	\N
00040000-565c-6b28-e2fc-98be6700315d	IE	IRL	372	Ireland 	Irska	\N
00040000-565c-6b28-3757-f9ab5b1302ed	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-565c-6b28-969d-5183fa75a46d	IL	ISR	376	Israel 	Izrael	\N
00040000-565c-6b28-fcde-44d69ee03452	IT	ITA	380	Italy 	Italija	\N
00040000-565c-6b28-8872-5fb08a09e576	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-565c-6b28-4452-1dd1fbc7bacf	JP	JPN	392	Japan 	Japonska	\N
00040000-565c-6b28-7b55-87052e49723d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-565c-6b28-4b2a-ab4989f14e9e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-565c-6b28-6aa6-f0a8611ddf13	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-565c-6b28-945c-ca2fbec4d625	KE	KEN	404	Kenya 	Kenija	\N
00040000-565c-6b28-5470-616a3cbe75dc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-565c-6b28-180e-54b1b4875ef3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-565c-6b28-7704-3dc1829860d4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-565c-6b28-6e79-43b975a32b78	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-565c-6b28-291d-b7c22e94b396	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-565c-6b28-ae93-09627a5182a0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-565c-6b28-f6fc-0d2ea1d1814a	LV	LVA	428	Latvia 	Latvija	\N
00040000-565c-6b28-b914-ccd4490a9ab6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-565c-6b28-df4d-8ccc583f3ba4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-565c-6b28-cbf3-862e57a6a41f	LR	LBR	430	Liberia 	Liberija	\N
00040000-565c-6b28-5944-2a584d93da13	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-565c-6b28-3505-cfc8801a43b8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-565c-6b28-1885-fe55880745e0	LT	LTU	440	Lithuania 	Litva	\N
00040000-565c-6b28-ad77-cd4712a30409	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-565c-6b28-2a95-5c0d4ff9c814	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-565c-6b28-a37c-bc63cfdafdc7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-565c-6b28-9275-277d9cf9bab5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-565c-6b28-7928-28d34852fb72	MW	MWI	454	Malawi 	Malavi	\N
00040000-565c-6b28-62e9-13be6627749a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-565c-6b28-4fb4-6a9724a86a3f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-565c-6b28-1270-70f6802e9ba4	ML	MLI	466	Mali 	Mali	\N
00040000-565c-6b28-7376-79ebd451ca39	MT	MLT	470	Malta 	Malta	\N
00040000-565c-6b28-0d3f-47ff624d174c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-565c-6b28-e2f4-fd7a238b3337	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-565c-6b28-3f6b-306a2e1e64af	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-565c-6b28-a826-e735e082b842	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-565c-6b28-2b9c-1e6c7b881253	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-565c-6b28-8451-d92dfb4602d0	MX	MEX	484	Mexico 	Mehika	\N
00040000-565c-6b28-de7f-0ee24544cd55	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-565c-6b28-09b2-5415125f45eb	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-565c-6b28-16c0-1a500bd18eb0	MC	MCO	492	Monaco 	Monako	\N
00040000-565c-6b28-d576-ce703384410d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-565c-6b28-91e1-938801f1df96	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-565c-6b28-7575-1ea0accf0864	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-565c-6b28-cb14-bcac3108bdcf	MA	MAR	504	Morocco 	Maroko	\N
00040000-565c-6b28-d611-d502a8441086	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-565c-6b28-481c-ffa4fc4a9c42	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-565c-6b28-cb16-a6545e45bb7b	NA	NAM	516	Namibia 	Namibija	\N
00040000-565c-6b28-e794-5987db99c6b7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-565c-6b28-c7ac-2739ab649050	NP	NPL	524	Nepal 	Nepal	\N
00040000-565c-6b28-c6fe-447b943eaa86	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-565c-6b28-d194-79953264900e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-565c-6b28-bfc5-605154c8373c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-565c-6b28-fafd-2d21725dbf09	NE	NER	562	Niger 	Niger 	\N
00040000-565c-6b28-2a6c-e4bf20c13c97	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-565c-6b28-5d25-f66cb7549b36	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-565c-6b28-d263-37be019886eb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-565c-6b28-728b-75915f814ac0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-565c-6b28-e0ef-566804b510ea	NO	NOR	578	Norway 	Norveška	\N
00040000-565c-6b28-a437-49fe310efc66	OM	OMN	512	Oman 	Oman	\N
00040000-565c-6b28-4614-c63741601dbf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-565c-6b28-ccec-35e22cb5455b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-565c-6b28-fa93-22e5d079017b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-565c-6b28-3757-c554e5080a55	PA	PAN	591	Panama 	Panama	\N
00040000-565c-6b28-85e6-6c791958a168	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-565c-6b28-759d-d2b9c6e4f661	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-565c-6b28-ec3c-67c0fba78dcf	PE	PER	604	Peru 	Peru	\N
00040000-565c-6b28-494d-2be6abfe80ff	PH	PHL	608	Philippines 	Filipini	\N
00040000-565c-6b28-e9c7-764b3da8584f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-565c-6b28-e561-044bf9ee4afc	PL	POL	616	Poland 	Poljska	\N
00040000-565c-6b28-7bb6-f6dba62fc78b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-565c-6b28-f362-2976e8c876c1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-565c-6b28-7909-9e00152c0938	QA	QAT	634	Qatar 	Katar	\N
00040000-565c-6b28-6c84-bb96e11f8b25	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-565c-6b28-232b-f85d6ebe769f	RO	ROU	642	Romania 	Romunija	\N
00040000-565c-6b28-ca09-c5db1716d069	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-565c-6b28-affb-6a56e2609095	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-565c-6b28-69ca-88688ee63e99	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-565c-6b28-942f-9ac361ebeb0e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-565c-6b28-27a7-7f5b5f4cde1d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-565c-6b28-0eed-445a7cfd4649	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-565c-6b28-8027-17524f93b22a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-565c-6b28-1091-5164e304bd85	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-565c-6b28-5ea4-93133ac0f8ef	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-565c-6b28-b04a-358130e5e19e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-565c-6b28-7f7b-d7df50f1cbc9	SM	SMR	674	San Marino 	San Marino	\N
00040000-565c-6b28-cd23-bb55021ad18f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-565c-6b28-3d49-cee2bd14ccbb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-565c-6b28-8657-9c6563aaa211	SN	SEN	686	Senegal 	Senegal	\N
00040000-565c-6b28-cdc8-2eec91a4e475	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-565c-6b28-cf57-e0abf838f8f2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-565c-6b28-2460-8c7d24d3f72c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-565c-6b28-2f47-8ea3d4a2f493	SG	SGP	702	Singapore 	Singapur	\N
00040000-565c-6b28-b3be-cc3cbbe864b9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-565c-6b28-fa95-708551229f06	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-565c-6b28-6f3f-fc7785ba40be	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-565c-6b28-4783-9cd181c4a11a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-565c-6b28-5228-1fdf7dbfe312	SO	SOM	706	Somalia 	Somalija	\N
00040000-565c-6b28-5584-cfcd1e82c5bd	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-565c-6b28-db42-ff6aa0cfe128	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-565c-6b28-bb13-6653535d11c5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-565c-6b28-6097-6ce93405f2f9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-565c-6b28-0534-9b0befab9a3d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-565c-6b28-4d95-23f3bd54a92c	SD	SDN	729	Sudan 	Sudan	\N
00040000-565c-6b28-f3e5-5a85db243e1e	SR	SUR	740	Suriname 	Surinam	\N
00040000-565c-6b28-f85b-fe68e710a159	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-565c-6b28-beb6-35028dd426f4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-565c-6b28-977b-0712126c67ca	SE	SWE	752	Sweden 	Švedska	\N
00040000-565c-6b28-1f84-b6bb4a2596a2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-565c-6b28-a084-941988bca75b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-565c-6b28-51ea-f1aa508572a5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-565c-6b28-6f81-fa511e66e7ce	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-565c-6b28-ad9c-cffbd9009512	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-565c-6b28-1785-824d109df774	TH	THA	764	Thailand 	Tajska	\N
00040000-565c-6b28-f342-d7decf7c8a9b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-565c-6b28-dc38-33faccae5411	TG	TGO	768	Togo 	Togo	\N
00040000-565c-6b28-df61-46fcc0b2d18d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-565c-6b28-b23b-cdf7cfd76497	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-565c-6b28-9d16-b2f06916d1f3	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-565c-6b28-eac2-6c392ec1b0b7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-565c-6b28-be50-1c4b4a429dc6	TR	TUR	792	Turkey 	Turčija	\N
00040000-565c-6b28-a04a-fdc454e48333	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-565c-6b28-6d13-a701685522fa	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565c-6b28-e1b0-a4dbc18e3b5e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-565c-6b28-f478-82e87abb3ffb	UG	UGA	800	Uganda 	Uganda	\N
00040000-565c-6b28-66e7-27d6c9116478	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-565c-6b28-a7e5-1867553785dc	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-565c-6b28-09e7-1536a47ccca6	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-565c-6b28-1dc3-47dced9a12fc	US	USA	840	United States 	Združene države Amerike	\N
00040000-565c-6b28-b898-e03239382609	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-565c-6b28-9842-9b8e33a3489f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-565c-6b28-9655-1463684f4b8b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-565c-6b28-e3cc-5f31d9399b64	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-565c-6b28-919e-7c1e7b1bfa76	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-565c-6b28-be06-c2533d3df0d2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-565c-6b28-d032-bfc57a5891f2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565c-6b28-c125-c5d75285c62b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-565c-6b28-8a4f-058adea12536	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-565c-6b28-1b64-7d30648adfc4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-565c-6b28-5079-d2997b1b75cb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-565c-6b28-2787-554516a0db14	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-565c-6b28-fa59-4facbcec8355	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 30174905)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-565c-6b2b-6fae-57aa5679e3de	000e0000-565c-6b2b-7d91-abba1b20835c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-6b28-af8c-f86556e06ca1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565c-6b2b-962a-84ff3626f912	000e0000-565c-6b2b-faee-f31f86a8df21	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-6b28-ed2c-78333fdb4ecb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565c-6b2b-90ca-1a55ac658e4c	000e0000-565c-6b2b-881d-6c3beeb6c7d6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-6b28-af8c-f86556e06ca1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565c-6b2b-3cdd-e18b767eb280	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565c-6b2b-d911-b9953f107045	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 30174706)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-565c-6b2b-b9c9-c021ba3dcc70	000e0000-565c-6b2b-faee-f31f86a8df21	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-565c-6b28-3b3b-686803529787
000d0000-565c-6b2b-dd45-e9b99daae089	000e0000-565c-6b2b-faee-f31f86a8df21	000c0000-565c-6b2b-b70c-0a74174dac2f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-565c-6b28-3b3b-686803529787
000d0000-565c-6b2b-0715-84cc84a0490d	000e0000-565c-6b2b-faee-f31f86a8df21	000c0000-565c-6b2b-5837-9f8b5925ccf9	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-565c-6b28-11be-a8f868e882dd
000d0000-565c-6b2b-49ea-fcc3c3ac9cb4	000e0000-565c-6b2b-faee-f31f86a8df21	000c0000-565c-6b2b-43eb-112772e09c20	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-565c-6b28-ea62-ecfe4bda421c
000d0000-565c-6b2b-dc84-6ca77fc0c889	000e0000-565c-6b2b-faee-f31f86a8df21	000c0000-565c-6b2b-1f90-ddf4f7269f12	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-565c-6b28-022b-fc08c7ffa531
000d0000-565c-6b2b-053a-0e59c97999d1	000e0000-565c-6b2b-faee-f31f86a8df21	000c0000-565c-6b2b-cf0d-99a80350d236	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-565c-6b28-022b-fc08c7ffa531
000d0000-565c-6b2b-5936-bd70cdb07819	000e0000-565c-6b2b-faee-f31f86a8df21	000c0000-565c-6b2b-16ad-c79274d80d6d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-565c-6b28-3b3b-686803529787
000d0000-565c-6b2b-c75c-732f8ce7bd8e	000e0000-565c-6b2b-faee-f31f86a8df21	000c0000-565c-6b2b-aa51-c0cd753ed9ba	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-565c-6b28-b8f0-656fcb0d9361
000d0000-565c-6b2b-7be9-aa8f697b28c0	000e0000-565c-6b2b-faee-f31f86a8df21	000c0000-565c-6b2b-3856-4ed24fb87c8d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-565c-6b28-4219-f2d4b8589e2e
\.


--
-- TOC entry 3124 (class 0 OID 30174497)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30174463)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30174440)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-565c-6b2b-bdbf-cd88e4e14ef7	00080000-565c-6b2b-783a-34a44008fa3f	00090000-565c-6b2b-e715-3a28c6cb600c	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 30174620)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 30175165)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-565c-6b2b-08b8-fea1ed0bf296	00010000-565c-6b29-636b-583140f70a5e	\N	Prva mapa	Root mapa	2015-11-30 16:28:43	2015-11-30 16:28:43	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 30175178)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 30175200)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25231831)
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
-- TOC entry 3140 (class 0 OID 30174645)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30174397)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-565c-6b29-8213-bef951593e4a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-565c-6b29-94e1-2e21ca09a155	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-565c-6b29-6822-a2a84899fe3f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-565c-6b29-2f7e-a71a8a397526	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-565c-6b29-81f3-a013bc53062e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-565c-6b29-195e-50b2661dfad8	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-565c-6b29-fe6d-c6fbb4bb46f1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-565c-6b29-71e3-4a26f9226b05	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565c-6b29-e074-b018ed08f24e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565c-6b29-cef3-14dd0b42ab84	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-565c-6b29-8b75-f4a300eaf9fd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-565c-6b29-9eb2-3809ba015bf9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-565c-6b29-5d42-b87da8c630f3	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-565c-6b29-e0dd-14471fabcea8	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-565c-6b2a-2b78-14039ae87bfd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-565c-6b2a-2090-3d8ec038d9bb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-565c-6b2a-b464-f8c66fd9ee7d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-565c-6b2a-d9d6-04ccdb7fe25a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-565c-6b2a-5b7d-89f66f939984	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-565c-6b2c-521c-6a198fb2934e	application.tenant.maticnopodjetje	string	s:36:"00080000-565c-6b2c-86c4-5eaa6e7358e1";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 30174297)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-565c-6b2a-ca9c-705014882cf2	00000000-565c-6b2a-2b78-14039ae87bfd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-565c-6b2a-1ea3-dda9dc4ce4ee	00000000-565c-6b2a-2b78-14039ae87bfd	00010000-565c-6b29-636b-583140f70a5e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-565c-6b2a-162b-b1f2055e70e3	00000000-565c-6b2a-2090-3d8ec038d9bb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 30174364)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-565c-6b2b-52a6-eccb4f6c7101	\N	00100000-565c-6b2b-1ff3-b064772f10b5	00100000-565c-6b2b-1c4e-a00ea7e0a065	01	Gledališče Nimbis
00410000-565c-6b2b-03af-ff5d428154a0	00410000-565c-6b2b-52a6-eccb4f6c7101	00100000-565c-6b2b-1ff3-b064772f10b5	00100000-565c-6b2b-1c4e-a00ea7e0a065	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 30174308)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-565c-6b2b-e057-e8b1662ce6b7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-565c-6b2b-0aff-408c0327be9f	00010000-565c-6b2b-9d1b-2017acac5dd8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-565c-6b2b-2856-b295161fd2a2	00010000-565c-6b2b-1d20-39b0b9a8a132	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-565c-6b2b-82cd-5a3fcee1d519	00010000-565c-6b2b-7726-f9d374281645	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-565c-6b2b-1ce0-4fc981e43c0e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-565c-6b2b-5275-7e4283da45bf	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-565c-6b2b-2b90-cc5e0d9ae0c8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-565c-6b2b-721c-4e84f8bc2540	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-565c-6b2b-e715-3a28c6cb600c	00010000-565c-6b2b-59b4-98be480f8c70	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-565c-6b2b-dbf1-040e2dad56cf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-565c-6b2b-99ec-3e1c9deb2877	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565c-6b2b-1ddf-6e1d7bcf3fca	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-565c-6b2b-1b73-06322b0ac67c	00010000-565c-6b2b-7ab8-0dad6d3b46ce	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565c-6b2b-2f8b-18404c3b5b73	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-6b2b-f33c-7c1847a21f1f	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-6b2b-fe43-f8bc19fb5aab	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-6b2b-f7c7-ea98e6b4d7d3	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565c-6b2b-b819-575dbe57aa5a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565c-6b2b-68ac-b1366e6ff078	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-6b2b-55f2-b20378254459	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-6b2b-6c63-d53f65b503dc	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 30174243)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-565c-6b29-cf8a-32709d9822a9	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-565c-6b29-d0ff-c022c1eff363	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-565c-6b29-f560-80fd91fad228	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-565c-6b29-d805-84287db87953	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-565c-6b29-6c73-f95f1a183acf	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-565c-6b29-b0aa-f4d6eb4302a2	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-565c-6b29-d1c2-3f7e087b591a	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-565c-6b29-cf0b-7b9749f8293e	Abonma-read	Abonma - branje	t
00030000-565c-6b29-9cc1-101b9b25a4e2	Abonma-write	Abonma - spreminjanje	t
00030000-565c-6b29-78b4-1473eba6ddd4	Alternacija-read	Alternacija - branje	t
00030000-565c-6b29-68fc-b98ed068b5d0	Alternacija-write	Alternacija - spreminjanje	t
00030000-565c-6b29-636d-3e954709c137	Arhivalija-read	Arhivalija - branje	t
00030000-565c-6b29-e267-fb8a4d022303	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-565c-6b29-0e8a-ca200997ff8d	AuthStorage-read	AuthStorage - branje	t
00030000-565c-6b29-5b03-45eb740f63d0	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-565c-6b29-84d0-d976875661e1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-565c-6b29-8793-3bea0128922e	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-565c-6b29-b83c-7b5a00d92eb5	Besedilo-read	Besedilo - branje	t
00030000-565c-6b29-a109-dca2c99b3714	Besedilo-write	Besedilo - spreminjanje	t
00030000-565c-6b29-c5b8-9f064e4483a0	Dogodek-read	Dogodek - branje	t
00030000-565c-6b29-0ad0-5a8168997db6	Dogodek-write	Dogodek - spreminjanje	t
00030000-565c-6b29-1705-aed259b8272d	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-565c-6b29-b0e0-e496ad24e546	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-565c-6b29-87df-944c938e2e3a	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-565c-6b29-8657-5deac189d1e3	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-565c-6b29-f7b1-e14922a23b40	DogodekTrait-read	DogodekTrait - branje	t
00030000-565c-6b29-16c7-e26ccef113c2	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-565c-6b29-9b17-c6c8872afead	DrugiVir-read	DrugiVir - branje	t
00030000-565c-6b29-8240-5d555dcb052e	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-565c-6b29-7030-f8a3ef09c956	Drzava-read	Drzava - branje	t
00030000-565c-6b29-d6f9-6f7ff383878b	Drzava-write	Drzava - spreminjanje	t
00030000-565c-6b29-dbef-85210373d5ae	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-565c-6b29-8421-b86fb67ad48f	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-565c-6b29-25be-5a8634a70713	Funkcija-read	Funkcija - branje	t
00030000-565c-6b29-dd73-157e2e1c7587	Funkcija-write	Funkcija - spreminjanje	t
00030000-565c-6b29-24a7-1ae275dbc7ab	Gostovanje-read	Gostovanje - branje	t
00030000-565c-6b29-4eba-6655b034d0b7	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-565c-6b29-254d-8c21652cb24e	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-565c-6b29-4d8a-d9ebfc82cb4c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-565c-6b29-bd5e-728fd3625abb	Kupec-read	Kupec - branje	t
00030000-565c-6b29-8460-e023d9495e88	Kupec-write	Kupec - spreminjanje	t
00030000-565c-6b29-a177-9414647a93cf	NacinPlacina-read	NacinPlacina - branje	t
00030000-565c-6b29-115e-b1b2a83b4252	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-565c-6b29-187d-4036d8c712e1	Option-read	Option - branje	t
00030000-565c-6b29-cf1d-d6c40ffadef3	Option-write	Option - spreminjanje	t
00030000-565c-6b29-0f6e-f46ed6170315	OptionValue-read	OptionValue - branje	t
00030000-565c-6b29-00c7-4637099342a9	OptionValue-write	OptionValue - spreminjanje	t
00030000-565c-6b29-9d58-40ffa2158ed7	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-565c-6b29-fd66-8193aafa3456	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-565c-6b29-5650-65da13dabca0	Oseba-read	Oseba - branje	t
00030000-565c-6b29-6f27-36a217a1b160	Oseba-write	Oseba - spreminjanje	t
00030000-565c-6b29-e3bc-c29327591a45	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-565c-6b29-087e-fd6fdd6f8b08	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-565c-6b29-8428-7e15ce8eb268	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-565c-6b29-046d-4c93c45a50db	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-565c-6b29-3572-f52495a6fd1c	Pogodba-read	Pogodba - branje	t
00030000-565c-6b29-d62c-74f00909c167	Pogodba-write	Pogodba - spreminjanje	t
00030000-565c-6b29-b8bc-a3b1f5b38c51	Popa-read	Popa - branje	t
00030000-565c-6b29-5c32-7aad838c44be	Popa-write	Popa - spreminjanje	t
00030000-565c-6b29-daaa-9714f6115903	Posta-read	Posta - branje	t
00030000-565c-6b29-2c72-b4be5d90e473	Posta-write	Posta - spreminjanje	t
00030000-565c-6b29-3fa9-fbe6bb83eb83	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-565c-6b29-836e-860cc94ec0ff	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-565c-6b29-73df-d26090e7d482	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-565c-6b29-20fd-9377c3b7473a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-565c-6b29-026a-c51556c7e8e8	PostniNaslov-read	PostniNaslov - branje	t
00030000-565c-6b29-bda1-a5c9c976e4ad	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-565c-6b29-d397-91a47bea853b	Praznik-read	Praznik - branje	t
00030000-565c-6b29-709b-ac5d57d0d3be	Praznik-write	Praznik - spreminjanje	t
00030000-565c-6b29-32f7-cc4ec46c5a99	Predstava-read	Predstava - branje	t
00030000-565c-6b29-99f4-8c0d66085f00	Predstava-write	Predstava - spreminjanje	t
00030000-565c-6b29-c6a4-de5d56393b6a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-565c-6b29-3be1-84ca0529be9c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-565c-6b29-1397-93ca77d144b4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-565c-6b29-3225-fb398184c9f6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-565c-6b29-0793-447d2f84bdd2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-565c-6b29-4417-303af0287dd9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-565c-6b29-ad47-d289438d022d	ProgramDela-read	ProgramDela - branje	t
00030000-565c-6b29-16ff-9c0844cc73a2	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-565c-6b29-5e1a-d8cfe8929af1	ProgramFestival-read	ProgramFestival - branje	t
00030000-565c-6b29-e95b-5d25ffb7c1d8	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-565c-6b29-51c1-7ab6ccbc3da0	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-565c-6b29-2daf-7315ff6b19fd	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-565c-6b29-b8f4-5d38ee45dccb	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-565c-6b29-8b07-781be77ba902	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-565c-6b29-2f14-455349591f49	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-565c-6b29-d403-30ab61779f73	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-565c-6b29-353e-3575d06100e8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-565c-6b29-5452-0f1042ce8fe3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-565c-6b29-0c3d-37d8058acc01	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-565c-6b29-3d8f-834e270a9ec9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-565c-6b29-15ad-0e9e10c6e941	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-565c-6b29-7f18-34bc4c8b6059	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-565c-6b29-34fc-4028401c0b3d	ProgramRazno-read	ProgramRazno - branje	t
00030000-565c-6b29-6c27-5484fdc0569b	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-565c-6b29-c04e-d1ba40fb81f0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-565c-6b29-93a2-5fa954314cd3	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-565c-6b29-5b32-f001ec7a910d	Prostor-read	Prostor - branje	t
00030000-565c-6b29-05b2-8b530f425fef	Prostor-write	Prostor - spreminjanje	t
00030000-565c-6b29-1e3c-aa9dc8d770e5	Racun-read	Racun - branje	t
00030000-565c-6b29-f099-90f63a839e7c	Racun-write	Racun - spreminjanje	t
00030000-565c-6b29-1ed0-0e7963e7e88c	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-565c-6b29-a279-c5a0a65ae0bc	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-565c-6b29-3a48-2d2b6fa8cf3f	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-565c-6b29-f762-d874efbf6f51	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-565c-6b29-adbc-8a8751267c0a	Rekvizit-read	Rekvizit - branje	t
00030000-565c-6b29-6b99-d914235fb22c	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-565c-6b29-c300-19569b4cabed	Revizija-read	Revizija - branje	t
00030000-565c-6b29-78b6-3e0c821fc4d3	Revizija-write	Revizija - spreminjanje	t
00030000-565c-6b29-2525-d04baa4b08b3	Rezervacija-read	Rezervacija - branje	t
00030000-565c-6b29-1ba2-61cbfd12a29e	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-565c-6b29-0e71-358dbd76ac64	SedezniRed-read	SedezniRed - branje	t
00030000-565c-6b29-9a07-22e3810841e0	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-565c-6b29-77ec-5c8b35cbe449	Sedez-read	Sedez - branje	t
00030000-565c-6b29-00b8-27b5f95ebfc6	Sedez-write	Sedez - spreminjanje	t
00030000-565c-6b29-3860-1987d7d0905c	Sezona-read	Sezona - branje	t
00030000-565c-6b29-a85f-252285b2b3c2	Sezona-write	Sezona - spreminjanje	t
00030000-565c-6b29-54d1-0f7d00a9de52	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-565c-6b29-c3e1-34340ab7e5b4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-565c-6b29-1ac7-09710f9916ec	Stevilcenje-read	Stevilcenje - branje	t
00030000-565c-6b29-54cb-49b3fea66ef3	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-565c-6b29-fcc1-80a38dab5e23	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-565c-6b29-0922-cdbc6cadf0ff	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-565c-6b29-01ae-aa1f49d24df9	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-565c-6b29-41f3-472e18f2ceb3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-565c-6b29-5778-13fae8b018fa	Telefonska-read	Telefonska - branje	t
00030000-565c-6b29-3b57-3e988caed14f	Telefonska-write	Telefonska - spreminjanje	t
00030000-565c-6b29-07ef-8b359743952f	TerminStoritve-read	TerminStoritve - branje	t
00030000-565c-6b29-57c7-596e1b69d0ff	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-565c-6b29-98f7-a95239fd3025	TipFunkcije-read	TipFunkcije - branje	t
00030000-565c-6b29-5cfb-7690926ce938	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-565c-6b29-e19c-5ba00e33156a	TipPopa-read	TipPopa - branje	t
00030000-565c-6b29-76f4-47725f356726	TipPopa-write	TipPopa - spreminjanje	t
00030000-565c-6b29-87fb-10379477d32c	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-565c-6b29-2f49-879757d04a4b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-565c-6b29-6f6d-325404ea9a72	TipVaje-read	TipVaje - branje	t
00030000-565c-6b29-6d38-597109264da5	TipVaje-write	TipVaje - spreminjanje	t
00030000-565c-6b29-10eb-fcb2e5c6a74b	Trr-read	Trr - branje	t
00030000-565c-6b29-f91a-0d527833a1e8	Trr-write	Trr - spreminjanje	t
00030000-565c-6b29-98d6-34d607526c53	Uprizoritev-read	Uprizoritev - branje	t
00030000-565c-6b29-22d4-eb6b74c4ccd0	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-565c-6b29-8524-6dcd474d02d7	Vaja-read	Vaja - branje	t
00030000-565c-6b29-5b14-00adcdfdecbe	Vaja-write	Vaja - spreminjanje	t
00030000-565c-6b29-4c68-bb90c40eb308	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-565c-6b29-3929-9a777d8d311f	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-565c-6b29-f479-c3fc92760be7	VrstaStroska-read	VrstaStroska - branje	t
00030000-565c-6b29-ece3-d0d82e73b3a0	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-565c-6b29-d410-27fdb95bc4a6	Zaposlitev-read	Zaposlitev - branje	t
00030000-565c-6b29-8a2a-01e22d6b76a1	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-565c-6b29-22e5-3bf06ae21052	Zasedenost-read	Zasedenost - branje	t
00030000-565c-6b29-7f3a-823aac4dab34	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-565c-6b29-cee0-73698a3d1c98	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-565c-6b29-e40f-054b39a46975	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-565c-6b29-6a1c-400398ef46d8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-565c-6b29-fe9b-dd66f1873126	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-565c-6b29-332f-76fd573c3a45	Job-read	Branje opravil - samo zase - branje	t
00030000-565c-6b29-5e3c-2e6681f94c95	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-565c-6b29-9541-f5201fee7c7c	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-565c-6b29-5fbc-721c68af3dd9	Report-read	Report - branje	t
00030000-565c-6b29-7cf1-6644f9495abb	Report-write	Report - spreminjanje	t
00030000-565c-6b29-8485-8b90006f2275	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-565c-6b29-7d54-2a9fbf8144f3	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-565c-6b29-f89f-b568c1d22379	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-565c-6b29-59f4-df5a871e348c	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-565c-6b29-1c80-f67081aff003	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-565c-6b29-078d-0f531f458f80	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-565c-6b29-f5fe-ff692b193ece	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-565c-6b29-7989-8c9740bc3b7c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-565c-6b29-e163-d03f2a082e95	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565c-6b29-8497-c61df30cdc77	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565c-6b29-2f49-0e090421d76a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-565c-6b29-d3a1-e7ff765d71bf	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-565c-6b29-977d-0e3b48b4fe2a	Datoteka-write	Datoteka - spreminjanje	t
00030000-565c-6b29-9ea6-6afb033db753	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 30174262)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-565c-6b29-cce5-218725cb0008	00030000-565c-6b29-d0ff-c022c1eff363
00020000-565c-6b29-cce5-218725cb0008	00030000-565c-6b29-cf8a-32709d9822a9
00020000-565c-6b29-d319-de694b40eb64	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-8793-3bea0128922e
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-a109-dca2c99b3714
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-977d-0e3b48b4fe2a
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-f5fe-ff692b193ece
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-e163-d03f2a082e95
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-84d0-d976875661e1
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-b83c-7b5a00d92eb5
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-e043-22202481d8ef	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-ad7f-3a2a6fc84752	00030000-565c-6b29-84d0-d976875661e1
00020000-565c-6b29-ad7f-3a2a6fc84752	00030000-565c-6b29-b83c-7b5a00d92eb5
00020000-565c-6b29-ad7f-3a2a6fc84752	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-ad7f-3a2a6fc84752	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-ad7f-3a2a6fc84752	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-0ee4-08ef38d36d82	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-0ee4-08ef38d36d82	00030000-565c-6b29-d410-27fdb95bc4a6
00020000-565c-6b29-0ee4-08ef38d36d82	00030000-565c-6b29-8a2a-01e22d6b76a1
00020000-565c-6b29-0ee4-08ef38d36d82	00030000-565c-6b29-9d58-40ffa2158ed7
00020000-565c-6b29-6791-7451974e41d4	00030000-565c-6b29-d410-27fdb95bc4a6
00020000-565c-6b29-6791-7451974e41d4	00030000-565c-6b29-9d58-40ffa2158ed7
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-5778-13fae8b018fa
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-026a-c51556c7e8e8
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-10eb-fcb2e5c6a74b
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-254d-8c21652cb24e
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-3b57-3e988caed14f
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-bda1-a5c9c976e4ad
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-f5fe-ff692b193ece
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-f91a-0d527833a1e8
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-5c32-7aad838c44be
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-977d-0e3b48b4fe2a
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-e163-d03f2a082e95
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-4d8a-d9ebfc82cb4c
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-4417-303af0287dd9
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b29-acf0-2fd849688eca	00030000-565c-6b29-e19c-5ba00e33156a
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-5778-13fae8b018fa
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-026a-c51556c7e8e8
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-10eb-fcb2e5c6a74b
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-254d-8c21652cb24e
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b29-2530-4a12e204c166	00030000-565c-6b29-e19c-5ba00e33156a
00020000-565c-6b29-2bae-e2ae435a874c	00030000-565c-6b29-e19c-5ba00e33156a
00020000-565c-6b29-2bae-e2ae435a874c	00030000-565c-6b29-76f4-47725f356726
00020000-565c-6b29-80f9-0df2d64f79aa	00030000-565c-6b29-e19c-5ba00e33156a
00020000-565c-6b29-67bd-f59e11815a6d	00030000-565c-6b29-daaa-9714f6115903
00020000-565c-6b29-67bd-f59e11815a6d	00030000-565c-6b29-2c72-b4be5d90e473
00020000-565c-6b29-a39d-108f57e98fb7	00030000-565c-6b29-daaa-9714f6115903
00020000-565c-6b29-7209-86b5c63acc12	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b29-7209-86b5c63acc12	00030000-565c-6b29-d6f9-6f7ff383878b
00020000-565c-6b29-8e4d-7ffcf4c8cb6f	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b29-212e-83b17a8e2c66	00030000-565c-6b29-6a1c-400398ef46d8
00020000-565c-6b29-212e-83b17a8e2c66	00030000-565c-6b29-fe9b-dd66f1873126
00020000-565c-6b29-795b-2a2524c027cf	00030000-565c-6b29-6a1c-400398ef46d8
00020000-565c-6b29-43c3-9ba10c2747f6	00030000-565c-6b29-cee0-73698a3d1c98
00020000-565c-6b29-43c3-9ba10c2747f6	00030000-565c-6b29-e40f-054b39a46975
00020000-565c-6b29-d6aa-d2a7a64657d1	00030000-565c-6b29-cee0-73698a3d1c98
00020000-565c-6b29-da73-fefe484a564a	00030000-565c-6b29-cf0b-7b9749f8293e
00020000-565c-6b29-da73-fefe484a564a	00030000-565c-6b29-9cc1-101b9b25a4e2
00020000-565c-6b29-6e94-513c1239c120	00030000-565c-6b29-cf0b-7b9749f8293e
00020000-565c-6b29-39c8-c60f2c97750a	00030000-565c-6b29-5b32-f001ec7a910d
00020000-565c-6b29-39c8-c60f2c97750a	00030000-565c-6b29-05b2-8b530f425fef
00020000-565c-6b29-39c8-c60f2c97750a	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b29-39c8-c60f2c97750a	00030000-565c-6b29-026a-c51556c7e8e8
00020000-565c-6b29-39c8-c60f2c97750a	00030000-565c-6b29-bda1-a5c9c976e4ad
00020000-565c-6b29-39c8-c60f2c97750a	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b29-359f-c0d542c56787	00030000-565c-6b29-5b32-f001ec7a910d
00020000-565c-6b29-359f-c0d542c56787	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b29-359f-c0d542c56787	00030000-565c-6b29-026a-c51556c7e8e8
00020000-565c-6b29-3946-002a63c9fa15	00030000-565c-6b29-f479-c3fc92760be7
00020000-565c-6b29-3946-002a63c9fa15	00030000-565c-6b29-ece3-d0d82e73b3a0
00020000-565c-6b29-63b2-667893bdd570	00030000-565c-6b29-f479-c3fc92760be7
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-fd66-8193aafa3456
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-9d58-40ffa2158ed7
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-d410-27fdb95bc4a6
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-977d-0e3b48b4fe2a
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-f5fe-ff692b193ece
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-e163-d03f2a082e95
00020000-565c-6b29-60ea-d0d0e6885f49	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-e8df-67e92dfeee65	00030000-565c-6b29-9d58-40ffa2158ed7
00020000-565c-6b29-e8df-67e92dfeee65	00030000-565c-6b29-d410-27fdb95bc4a6
00020000-565c-6b29-e8df-67e92dfeee65	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-e8df-67e92dfeee65	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-e8df-67e92dfeee65	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-c5a2-bd89f8c4b7e4	00030000-565c-6b29-6f6d-325404ea9a72
00020000-565c-6b29-c5a2-bd89f8c4b7e4	00030000-565c-6b29-6d38-597109264da5
00020000-565c-6b29-f196-848e9f1a3650	00030000-565c-6b29-6f6d-325404ea9a72
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-b0aa-f4d6eb4302a2
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-d1c2-3f7e087b591a
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-ad47-d289438d022d
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-16ff-9c0844cc73a2
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-5e1a-d8cfe8929af1
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-e95b-5d25ffb7c1d8
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-51c1-7ab6ccbc3da0
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-2daf-7315ff6b19fd
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-b8f4-5d38ee45dccb
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-8b07-781be77ba902
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-2f14-455349591f49
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-d403-30ab61779f73
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-353e-3575d06100e8
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-5452-0f1042ce8fe3
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-0c3d-37d8058acc01
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-3d8f-834e270a9ec9
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-15ad-0e9e10c6e941
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-7f18-34bc4c8b6059
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-34fc-4028401c0b3d
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-6c27-5484fdc0569b
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-c04e-d1ba40fb81f0
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-93a2-5fa954314cd3
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-3225-fb398184c9f6
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-8240-5d555dcb052e
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-836e-860cc94ec0ff
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-9b17-c6c8872afead
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-1397-93ca77d144b4
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-3fa9-fbe6bb83eb83
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-f479-c3fc92760be7
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-01ae-aa1f49d24df9
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-25be-5a8634a70713
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-78b4-1473eba6ddd4
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-98f7-a95239fd3025
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-3572-f52495a6fd1c
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-977d-0e3b48b4fe2a
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-f5fe-ff692b193ece
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-e163-d03f2a082e95
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-ad9a-9a1f92d902cc	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-ad47-d289438d022d
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-5e1a-d8cfe8929af1
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-51c1-7ab6ccbc3da0
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-b8f4-5d38ee45dccb
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-2f14-455349591f49
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-353e-3575d06100e8
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-0c3d-37d8058acc01
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-15ad-0e9e10c6e941
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-34fc-4028401c0b3d
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-c04e-d1ba40fb81f0
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-1397-93ca77d144b4
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-9b17-c6c8872afead
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-3fa9-fbe6bb83eb83
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-5fbc-721c68af3dd9
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-ea4a-c81d54d3f54d	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-22d4-eb6b74c4ccd0
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-78b4-1473eba6ddd4
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-68fc-b98ed068b5d0
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-b83c-7b5a00d92eb5
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-25be-5a8634a70713
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-dd73-157e2e1c7587
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-98f7-a95239fd3025
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-977d-0e3b48b4fe2a
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-f5fe-ff692b193ece
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-66d4-bf78d7214cd3	00030000-565c-6b29-e163-d03f2a082e95
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-78b4-1473eba6ddd4
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-b83c-7b5a00d92eb5
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-25be-5a8634a70713
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-98f7-a95239fd3025
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-f5fe-ff692b193ece
00020000-565c-6b29-d0d8-b762273bd0e6	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-78b4-1473eba6ddd4
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-68fc-b98ed068b5d0
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-25be-5a8634a70713
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-3572-f52495a6fd1c
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-d62c-74f00909c167
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-01ae-aa1f49d24df9
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-41f3-472e18f2ceb3
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-98f7-a95239fd3025
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-10eb-fcb2e5c6a74b
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b29-5d3c-a3fa389ce4d6	00030000-565c-6b29-d410-27fdb95bc4a6
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-78b4-1473eba6ddd4
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-25be-5a8634a70713
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-3572-f52495a6fd1c
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-01ae-aa1f49d24df9
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-98f7-a95239fd3025
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-10eb-fcb2e5c6a74b
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b29-6606-9737df08ae10	00030000-565c-6b29-d410-27fdb95bc4a6
00020000-565c-6b29-e0cc-33b9b5c33df1	00030000-565c-6b29-01ae-aa1f49d24df9
00020000-565c-6b29-e0cc-33b9b5c33df1	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b29-e0cc-33b9b5c33df1	00030000-565c-6b29-25be-5a8634a70713
00020000-565c-6b29-e0cc-33b9b5c33df1	00030000-565c-6b29-3572-f52495a6fd1c
00020000-565c-6b29-e0cc-33b9b5c33df1	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b29-e0cc-33b9b5c33df1	00030000-565c-6b29-98f7-a95239fd3025
00020000-565c-6b29-e0cc-33b9b5c33df1	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b29-acc2-b5c04079c548	00030000-565c-6b29-01ae-aa1f49d24df9
00020000-565c-6b29-acc2-b5c04079c548	00030000-565c-6b29-41f3-472e18f2ceb3
00020000-565c-6b29-acc2-b5c04079c548	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b29-acc2-b5c04079c548	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b29-33c9-1a66ee2b2ad0	00030000-565c-6b29-01ae-aa1f49d24df9
00020000-565c-6b29-33c9-1a66ee2b2ad0	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-cf8a-32709d9822a9
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d0ff-c022c1eff363
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-cf0b-7b9749f8293e
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-9cc1-101b9b25a4e2
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-78b4-1473eba6ddd4
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-68fc-b98ed068b5d0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-636d-3e954709c137
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-e267-fb8a4d022303
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-0e8a-ca200997ff8d
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5b03-45eb740f63d0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-84d0-d976875661e1
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8793-3bea0128922e
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-b83c-7b5a00d92eb5
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-a109-dca2c99b3714
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-977d-0e3b48b4fe2a
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-c5b8-9f064e4483a0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d805-84287db87953
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-0ad0-5a8168997db6
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-1705-aed259b8272d
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-b0e0-e496ad24e546
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-87df-944c938e2e3a
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8657-5deac189d1e3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-9b17-c6c8872afead
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8240-5d555dcb052e
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-7030-f8a3ef09c956
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d6f9-6f7ff383878b
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-dbef-85210373d5ae
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8421-b86fb67ad48f
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-25be-5a8634a70713
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-dd73-157e2e1c7587
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-24a7-1ae275dbc7ab
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-4eba-6655b034d0b7
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-9541-f5201fee7c7c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-332f-76fd573c3a45
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5e3c-2e6681f94c95
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-254d-8c21652cb24e
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-4d8a-d9ebfc82cb4c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-bd5e-728fd3625abb
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8460-e023d9495e88
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8485-8b90006f2275
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-7d54-2a9fbf8144f3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-f89f-b568c1d22379
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-59f4-df5a871e348c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-078d-0f531f458f80
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-1c80-f67081aff003
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-a177-9414647a93cf
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-115e-b1b2a83b4252
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-187d-4036d8c712e1
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-cf1d-d6c40ffadef3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-0f6e-f46ed6170315
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-00c7-4637099342a9
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-9d58-40ffa2158ed7
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-fd66-8193aafa3456
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-6c73-f95f1a183acf
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-6f27-36a217a1b160
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-e3bc-c29327591a45
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-087e-fd6fdd6f8b08
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8428-7e15ce8eb268
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-046d-4c93c45a50db
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3572-f52495a6fd1c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d62c-74f00909c167
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5c32-7aad838c44be
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-daaa-9714f6115903
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-2c72-b4be5d90e473
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3fa9-fbe6bb83eb83
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-836e-860cc94ec0ff
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-73df-d26090e7d482
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-20fd-9377c3b7473a
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-026a-c51556c7e8e8
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-bda1-a5c9c976e4ad
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d397-91a47bea853b
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-709b-ac5d57d0d3be
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-32f7-cc4ec46c5a99
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-99f4-8c0d66085f00
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-c6a4-de5d56393b6a
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3be1-84ca0529be9c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-1397-93ca77d144b4
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3225-fb398184c9f6
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-0793-447d2f84bdd2
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-4417-303af0287dd9
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-b0aa-f4d6eb4302a2
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-ad47-d289438d022d
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d1c2-3f7e087b591a
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-16ff-9c0844cc73a2
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5e1a-d8cfe8929af1
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-e95b-5d25ffb7c1d8
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-51c1-7ab6ccbc3da0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-2daf-7315ff6b19fd
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-b8f4-5d38ee45dccb
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8b07-781be77ba902
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-2f14-455349591f49
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d403-30ab61779f73
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-353e-3575d06100e8
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5452-0f1042ce8fe3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-0c3d-37d8058acc01
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3d8f-834e270a9ec9
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-15ad-0e9e10c6e941
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-7f18-34bc4c8b6059
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-34fc-4028401c0b3d
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-6c27-5484fdc0569b
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-c04e-d1ba40fb81f0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-93a2-5fa954314cd3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5b32-f001ec7a910d
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-05b2-8b530f425fef
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-1e3c-aa9dc8d770e5
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-f099-90f63a839e7c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-1ed0-0e7963e7e88c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-a279-c5a0a65ae0bc
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-adbc-8a8751267c0a
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-6b99-d914235fb22c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3a48-2d2b6fa8cf3f
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-f762-d874efbf6f51
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5fbc-721c68af3dd9
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-7cf1-6644f9495abb
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-c300-19569b4cabed
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-78b6-3e0c821fc4d3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-2525-d04baa4b08b3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-1ba2-61cbfd12a29e
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-77ec-5c8b35cbe449
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-00b8-27b5f95ebfc6
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-0e71-358dbd76ac64
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-9a07-22e3810841e0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3860-1987d7d0905c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-a85f-252285b2b3c2
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-1ac7-09710f9916ec
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-54cb-49b3fea66ef3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-54d1-0f7d00a9de52
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-c3e1-34340ab7e5b4
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-fcc1-80a38dab5e23
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-0922-cdbc6cadf0ff
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-01ae-aa1f49d24df9
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-41f3-472e18f2ceb3
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5778-13fae8b018fa
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3b57-3e988caed14f
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-07ef-8b359743952f
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-f560-80fd91fad228
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-57c7-596e1b69d0ff
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-98f7-a95239fd3025
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5cfb-7690926ce938
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-e19c-5ba00e33156a
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-76f4-47725f356726
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-87fb-10379477d32c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-2f49-879757d04a4b
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-6f6d-325404ea9a72
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-6d38-597109264da5
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-10eb-fcb2e5c6a74b
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-f91a-0d527833a1e8
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-22d4-eb6b74c4ccd0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8524-6dcd474d02d7
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-5b14-00adcdfdecbe
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-4c68-bb90c40eb308
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-3929-9a777d8d311f
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-f479-c3fc92760be7
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-ece3-d0d82e73b3a0
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d3a1-e7ff765d71bf
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-2f49-0e090421d76a
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-f5fe-ff692b193ece
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-e163-d03f2a082e95
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-d410-27fdb95bc4a6
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-8a2a-01e22d6b76a1
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-22e5-3bf06ae21052
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-7f3a-823aac4dab34
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-cee0-73698a3d1c98
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-e40f-054b39a46975
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-6a1c-400398ef46d8
00020000-565c-6b2a-7999-982c586bbfce	00030000-565c-6b29-fe9b-dd66f1873126
00020000-565c-6b2a-6f54-09309451de03	00030000-565c-6b29-8497-c61df30cdc77
00020000-565c-6b2a-061d-fcea38a08c8f	00030000-565c-6b29-e163-d03f2a082e95
00020000-565c-6b2a-0111-cc90df98a1b8	00030000-565c-6b29-22d4-eb6b74c4ccd0
00020000-565c-6b2a-b79c-e2c1b253619c	00030000-565c-6b29-98d6-34d607526c53
00020000-565c-6b2a-938d-f87ff8bd20f9	00030000-565c-6b29-7d54-2a9fbf8144f3
00020000-565c-6b2a-383e-5b570cb3eafc	00030000-565c-6b29-f89f-b568c1d22379
00020000-565c-6b2a-64ff-1ef344386882	00030000-565c-6b29-59f4-df5a871e348c
00020000-565c-6b2a-9a86-5ed6dbe1a852	00030000-565c-6b29-8485-8b90006f2275
00020000-565c-6b2b-ed81-0ad1c0bac3dc	00030000-565c-6b29-078d-0f531f458f80
00020000-565c-6b2b-92b4-72af28441f3f	00030000-565c-6b29-1c80-f67081aff003
00020000-565c-6b2b-169e-79f1c1bc99a1	00030000-565c-6b29-7989-8c9740bc3b7c
00020000-565c-6b2b-b532-7a38caaee4e5	00030000-565c-6b29-f5fe-ff692b193ece
00020000-565c-6b2b-c2be-7fc40d38f6a8	00030000-565c-6b29-6f27-36a217a1b160
00020000-565c-6b2b-a1d4-21d19ae45245	00030000-565c-6b29-5650-65da13dabca0
00020000-565c-6b2b-c0ff-3ef7dc606587	00030000-565c-6b29-977d-0e3b48b4fe2a
00020000-565c-6b2b-ab29-2ec6f101eb9f	00030000-565c-6b29-9ea6-6afb033db753
00020000-565c-6b2b-f814-42812dd4d9d0	00030000-565c-6b29-b8bc-a3b1f5b38c51
00020000-565c-6b2b-f814-42812dd4d9d0	00030000-565c-6b29-5c32-7aad838c44be
00020000-565c-6b2b-f814-42812dd4d9d0	00030000-565c-6b29-98d6-34d607526c53
\.


--
-- TOC entry 3141 (class 0 OID 30174652)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 30174686)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 30174823)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-565c-6b2b-ba39-cbca65fa65f8	00090000-565c-6b2b-e057-e8b1662ce6b7	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-565c-6b2b-62ed-2054abecef16	00090000-565c-6b2b-5275-7e4283da45bf	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-565c-6b2b-318e-d802c766cb71	00090000-565c-6b2b-1b73-06322b0ac67c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-565c-6b2b-d4c8-6d849c0d5460	00090000-565c-6b2b-dbf1-040e2dad56cf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 30174344)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-565c-6b2b-783a-34a44008fa3f	\N	00040000-565c-6b28-6f3f-fc7785ba40be	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-6b2b-bfce-f76dc2057766	\N	00040000-565c-6b28-6f3f-fc7785ba40be	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-565c-6b2b-26b3-e1615580340d	\N	00040000-565c-6b28-6f3f-fc7785ba40be	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-6b2b-96e2-308ab951cdf8	\N	00040000-565c-6b28-6f3f-fc7785ba40be	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-6b2b-24b8-f942f9cc506d	\N	00040000-565c-6b28-6f3f-fc7785ba40be	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-6b2b-d446-0ab81c4842d3	\N	00040000-565c-6b28-a385-e30556d52201	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-6b2b-2cfc-0e569052430b	\N	00040000-565c-6b28-6fb5-a86f219adaac	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-6b2b-e8cd-081612c85355	\N	00040000-565c-6b28-ca64-f0cef90a6d39	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-6b2b-f355-1a45b156b082	\N	00040000-565c-6b28-457b-52b76a9d210e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-6b2c-86c4-5eaa6e7358e1	\N	00040000-565c-6b28-6f3f-fc7785ba40be	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 30174389)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-565c-6b28-593d-4ed39511b5eb	8341	Adlešiči
00050000-565c-6b28-9051-89b48cf41df5	5270	Ajdovščina
00050000-565c-6b28-2936-01a003cbcc15	6280	Ankaran/Ancarano
00050000-565c-6b28-bef8-b890223e9fbb	9253	Apače
00050000-565c-6b28-cf45-f568c5e78075	8253	Artiče
00050000-565c-6b28-4224-6980aefbc372	4275	Begunje na Gorenjskem
00050000-565c-6b28-d46b-ed85038a506a	1382	Begunje pri Cerknici
00050000-565c-6b28-7791-295ffb7db479	9231	Beltinci
00050000-565c-6b28-5cd3-22e96c5a4fc1	2234	Benedikt
00050000-565c-6b28-4d91-a8e17c81ab00	2345	Bistrica ob Dravi
00050000-565c-6b28-7c55-cdd5dabca571	3256	Bistrica ob Sotli
00050000-565c-6b28-fb89-eed6da23ed3e	8259	Bizeljsko
00050000-565c-6b28-1244-248c6e4f8aad	1223	Blagovica
00050000-565c-6b28-7b0e-254435c5ac08	8283	Blanca
00050000-565c-6b28-763b-0d99993ed03e	4260	Bled
00050000-565c-6b28-5ff1-1beb298f6350	4273	Blejska Dobrava
00050000-565c-6b28-1a1a-d9a4234aec89	9265	Bodonci
00050000-565c-6b28-3328-61da320c373e	9222	Bogojina
00050000-565c-6b28-18d5-97ec4e8c6a44	4263	Bohinjska Bela
00050000-565c-6b28-bdf9-b93ac3038d59	4264	Bohinjska Bistrica
00050000-565c-6b28-b890-a76a66a4c90e	4265	Bohinjsko jezero
00050000-565c-6b28-c69a-8ad9d7a378f0	1353	Borovnica
00050000-565c-6b28-a9af-f939e4afc7c6	8294	Boštanj
00050000-565c-6b28-e2e9-0d1ff11a3aa7	5230	Bovec
00050000-565c-6b28-2e6d-516c3e7114e8	5295	Branik
00050000-565c-6b28-8732-ee4d0f17cd95	3314	Braslovče
00050000-565c-6b28-9b67-e446090965eb	5223	Breginj
00050000-565c-6b28-a36c-9d742f7c41b4	8280	Brestanica
00050000-565c-6b28-9303-e49c3460b227	2354	Bresternica
00050000-565c-6b28-9296-19e1d5bf167c	4243	Brezje
00050000-565c-6b28-5967-aa3e9f6fd4ce	1351	Brezovica pri Ljubljani
00050000-565c-6b28-56ba-3014b46c2cc2	8250	Brežice
00050000-565c-6b28-e3d6-9c85f616bef8	4210	Brnik - Aerodrom
00050000-565c-6b28-5f16-b1e0a0e11a5e	8321	Brusnice
00050000-565c-6b28-18de-1a7dc98316f8	3255	Buče
00050000-565c-6b28-b332-79c479708fa2	8276	Bučka 
00050000-565c-6b28-e010-bc89d0d63795	9261	Cankova
00050000-565c-6b28-ada4-4489f16e4d94	3000	Celje 
00050000-565c-6b28-7f1c-4522bb5db683	3001	Celje - poštni predali
00050000-565c-6b28-203d-c2d942a8d275	4207	Cerklje na Gorenjskem
00050000-565c-6b28-8b40-5bbecf1176a7	8263	Cerklje ob Krki
00050000-565c-6b28-109e-17cdceda71ca	1380	Cerknica
00050000-565c-6b28-ff80-3d505e0575e8	5282	Cerkno
00050000-565c-6b28-c642-36deb3be25ac	2236	Cerkvenjak
00050000-565c-6b28-24c2-dfcf523964b2	2215	Ceršak
00050000-565c-6b28-8383-1e64644a9632	2326	Cirkovce
00050000-565c-6b28-0ded-5673f88a69e0	2282	Cirkulane
00050000-565c-6b28-6e0c-6df08d623920	5273	Col
00050000-565c-6b28-d844-10c16cbe6f9d	8251	Čatež ob Savi
00050000-565c-6b28-a68d-eef2586b63e3	1413	Čemšenik
00050000-565c-6b28-b647-52e5bb7814e9	5253	Čepovan
00050000-565c-6b28-5494-f8b4661fa235	9232	Črenšovci
00050000-565c-6b28-ebfb-99ee436a505a	2393	Črna na Koroškem
00050000-565c-6b28-06c1-180057ae36b7	6275	Črni Kal
00050000-565c-6b28-7f20-69ba4d091db2	5274	Črni Vrh nad Idrijo
00050000-565c-6b28-8414-058237079805	5262	Črniče
00050000-565c-6b28-6abb-70c3bbcd7bb3	8340	Črnomelj
00050000-565c-6b28-5101-60dde738a30e	6271	Dekani
00050000-565c-6b28-673c-10b24dba61f5	5210	Deskle
00050000-565c-6b28-9c81-fc5e9e06c17e	2253	Destrnik
00050000-565c-6b28-1083-a9aba2f950b6	6215	Divača
00050000-565c-6b28-cd46-0b42738ac743	1233	Dob
00050000-565c-6b28-9dc6-c11f661478b2	3224	Dobje pri Planini
00050000-565c-6b28-6e8a-41ce09f0d9a4	8257	Dobova
00050000-565c-6b28-40dd-821516f89a5e	1423	Dobovec
00050000-565c-6b28-b358-96e9344c8281	5263	Dobravlje
00050000-565c-6b28-5134-1a7c89944b1b	3204	Dobrna
00050000-565c-6b28-6340-1d019e1293d0	8211	Dobrnič
00050000-565c-6b28-12b0-94267fe5402a	1356	Dobrova
00050000-565c-6b28-c8cc-6517420072e0	9223	Dobrovnik/Dobronak 
00050000-565c-6b28-8e4b-92c4dcf5d442	5212	Dobrovo v Brdih
00050000-565c-6b28-f8b0-765a0ded859d	1431	Dol pri Hrastniku
00050000-565c-6b28-c4fc-39d58bb4b1cf	1262	Dol pri Ljubljani
00050000-565c-6b28-5db1-271f14061ad0	1273	Dole pri Litiji
00050000-565c-6b28-d6f6-12e3f83f4f62	1331	Dolenja vas
00050000-565c-6b28-7f07-e2e5a7c0ad17	8350	Dolenjske Toplice
00050000-565c-6b28-6c9a-c1016df1f6ec	1230	Domžale
00050000-565c-6b28-a0ea-a00effdd0901	2252	Dornava
00050000-565c-6b28-d71f-911ecb6e9870	5294	Dornberk
00050000-565c-6b28-fa52-ab72f9bac996	1319	Draga
00050000-565c-6b28-1f66-c94b4f1eb5d2	8343	Dragatuš
00050000-565c-6b28-458f-5e6c123f468a	3222	Dramlje
00050000-565c-6b28-dd37-f6dae89ef351	2370	Dravograd
00050000-565c-6b28-2f1b-f8f78892174c	4203	Duplje
00050000-565c-6b28-7f05-719d9a65a6fa	6221	Dutovlje
00050000-565c-6b28-c81c-bf3ad43f5a68	8361	Dvor
00050000-565c-6b28-3d32-3f451eb20610	2343	Fala
00050000-565c-6b28-69b8-e39b60c7707c	9208	Fokovci
00050000-565c-6b28-b273-4f04840cca0b	2313	Fram
00050000-565c-6b28-a53b-969ad83e162f	3213	Frankolovo
00050000-565c-6b28-7d68-fd0f76a9d45a	1274	Gabrovka
00050000-565c-6b28-0fa8-4d287910fad2	8254	Globoko
00050000-565c-6b28-26dd-a43d70842a53	5275	Godovič
00050000-565c-6b28-2509-2f2fd8003f2c	4204	Golnik
00050000-565c-6b28-aa8f-fb22fdd7c97c	3303	Gomilsko
00050000-565c-6b28-7ba9-f4f2203c4594	4224	Gorenja vas
00050000-565c-6b28-bce5-4492b2738953	3263	Gorica pri Slivnici
00050000-565c-6b28-6dd1-b428d7b78c9c	2272	Gorišnica
00050000-565c-6b28-9f90-cdeb72422605	9250	Gornja Radgona
00050000-565c-6b28-1452-7cf3686df61c	3342	Gornji Grad
00050000-565c-6b28-e199-cb19b3274752	4282	Gozd Martuljek
00050000-565c-6b28-ab68-0f220580ef15	6272	Gračišče
00050000-565c-6b28-878c-9fb784fbd6c0	9264	Grad
00050000-565c-6b28-9fbc-677c7c4fa56f	8332	Gradac
00050000-565c-6b28-c60e-608cd9921690	1384	Grahovo
00050000-565c-6b28-03e5-713724c2f8af	5242	Grahovo ob Bači
00050000-565c-6b28-c94e-7fed8fda764f	5251	Grgar
00050000-565c-6b28-e43d-2d20b1ba4667	3302	Griže
00050000-565c-6b28-f01e-b1ff1c77a4eb	3231	Grobelno
00050000-565c-6b28-6311-cb3b7ede7209	1290	Grosuplje
00050000-565c-6b28-59aa-a30ca335abe7	2288	Hajdina
00050000-565c-6b28-bf0e-af452d3217b5	8362	Hinje
00050000-565c-6b28-b296-82801bf842fe	2311	Hoče
00050000-565c-6b28-92e9-a2a602980e32	9205	Hodoš/Hodos
00050000-565c-6b28-c9c2-5b468d1c759e	1354	Horjul
00050000-565c-6b28-4a51-995c07a9dd9e	1372	Hotedršica
00050000-565c-6b28-b248-07af64be26a2	1430	Hrastnik
00050000-565c-6b28-c82a-ac61297175cb	6225	Hruševje
00050000-565c-6b28-9498-a9fdb58c7986	4276	Hrušica
00050000-565c-6b28-e056-a13ab2b55ca2	5280	Idrija
00050000-565c-6b28-f20b-fed892f35a03	1292	Ig
00050000-565c-6b28-2467-a7d32dc3d73d	6250	Ilirska Bistrica
00050000-565c-6b28-8005-07e908033df6	6251	Ilirska Bistrica-Trnovo
00050000-565c-6b28-b083-2430bfd6c9da	1295	Ivančna Gorica
00050000-565c-6b28-2f80-2bb847d3623b	2259	Ivanjkovci
00050000-565c-6b28-5044-a03afd96e26e	1411	Izlake
00050000-565c-6b28-7923-b44f897f5950	6310	Izola/Isola
00050000-565c-6b28-b096-5a8ec0ac1ab4	2222	Jakobski Dol
00050000-565c-6b28-081b-1676102309e1	2221	Jarenina
00050000-565c-6b28-c4e2-696465ffd362	6254	Jelšane
00050000-565c-6b28-f1e8-813f3647d7ef	4270	Jesenice
00050000-565c-6b28-3fff-606ad8eddea5	8261	Jesenice na Dolenjskem
00050000-565c-6b28-4ab1-6bddbbc786cf	3273	Jurklošter
00050000-565c-6b28-08be-33877ececbf2	2223	Jurovski Dol
00050000-565c-6b28-ba5e-ea6f3fdf8aec	2256	Juršinci
00050000-565c-6b28-7ea7-eb9a050b5f2a	5214	Kal nad Kanalom
00050000-565c-6b28-3419-90510831c065	3233	Kalobje
00050000-565c-6b28-0039-f1b1e9011a0e	4246	Kamna Gorica
00050000-565c-6b28-31bb-cc54b34e9b91	2351	Kamnica
00050000-565c-6b28-7ff8-405dfdcb2e4d	1241	Kamnik
00050000-565c-6b28-3fd4-e1b8c8284121	5213	Kanal
00050000-565c-6b28-d395-59f869c40553	8258	Kapele
00050000-565c-6b28-68c4-5c9a1eb6faae	2362	Kapla
00050000-565c-6b28-9c8b-b9a3dc412f6e	2325	Kidričevo
00050000-565c-6b28-34b9-22c3bf4a6ee7	1412	Kisovec
00050000-565c-6b28-1393-9ad7052d2d53	6253	Knežak
00050000-565c-6b28-ff09-847c51fcd1ea	5222	Kobarid
00050000-565c-6b28-1941-3a9ac22cdf82	9227	Kobilje
00050000-565c-6b28-d90d-bedeb5a22dda	1330	Kočevje
00050000-565c-6b28-18ad-23beb2c3b0ce	1338	Kočevska Reka
00050000-565c-6b28-2c4a-86e03d3726bc	2276	Kog
00050000-565c-6b28-bb1d-25df30f2c746	5211	Kojsko
00050000-565c-6b28-14da-da24edf79a1a	6223	Komen
00050000-565c-6b28-89a1-cb61b6b4e712	1218	Komenda
00050000-565c-6b28-3b85-9f206ad9edff	6000	Koper/Capodistria 
00050000-565c-6b28-acb0-631f71b44563	6001	Koper/Capodistria - poštni predali
00050000-565c-6b28-801b-1e3c79f927cd	8282	Koprivnica
00050000-565c-6b28-a0d5-abf814d7f130	5296	Kostanjevica na Krasu
00050000-565c-6b28-eb58-426d221726ba	8311	Kostanjevica na Krki
00050000-565c-6b28-3954-aba290accded	1336	Kostel
00050000-565c-6b28-3c06-771c4b92c7be	6256	Košana
00050000-565c-6b28-0b6d-4d2e64db5f85	2394	Kotlje
00050000-565c-6b28-589b-800b8b080936	6240	Kozina
00050000-565c-6b28-fe53-22bba481cd65	3260	Kozje
00050000-565c-6b28-e4e5-920c87c16749	4000	Kranj 
00050000-565c-6b28-cb25-63fdcff20020	4001	Kranj - poštni predali
00050000-565c-6b28-618c-e64055e355a8	4280	Kranjska Gora
00050000-565c-6b28-c8ce-8ae8d9b82fd3	1281	Kresnice
00050000-565c-6b28-3df9-7097ab34d499	4294	Križe
00050000-565c-6b28-2c85-44793d025e3e	9206	Križevci
00050000-565c-6b28-7402-0cfb16126e09	9242	Križevci pri Ljutomeru
00050000-565c-6b28-47cb-d8c45f08bb4f	1301	Krka
00050000-565c-6b28-338a-d36e67877f42	8296	Krmelj
00050000-565c-6b28-5a28-b5eae1b53635	4245	Kropa
00050000-565c-6b28-983a-a00ed78758e5	8262	Krška vas
00050000-565c-6b28-d092-7598ee7c4f27	8270	Krško
00050000-565c-6b28-c8f8-06fa9af31750	9263	Kuzma
00050000-565c-6b28-78a8-c9922592b778	2318	Laporje
00050000-565c-6b28-69f3-be03d02ce930	3270	Laško
00050000-565c-6b28-82a7-71c276565c8a	1219	Laze v Tuhinju
00050000-565c-6b28-3c5e-15f39b242dd2	2230	Lenart v Slovenskih goricah
00050000-565c-6b28-03f5-9a7b5ae60393	9220	Lendava/Lendva
00050000-565c-6b28-2e94-9599f45fcf6a	4248	Lesce
00050000-565c-6b28-c8cd-0b06f0c3b43c	3261	Lesično
00050000-565c-6b28-b69d-272775524187	8273	Leskovec pri Krškem
00050000-565c-6b28-7ff2-8971976cdae1	2372	Libeliče
00050000-565c-6b28-c270-8f97cd09b29f	2341	Limbuš
00050000-565c-6b28-9db2-63c5083bdb43	1270	Litija
00050000-565c-6b28-da25-79cb17277dcc	3202	Ljubečna
00050000-565c-6b28-337d-a46f01ad296d	1000	Ljubljana 
00050000-565c-6b28-fd8b-af94e9e879f8	1001	Ljubljana - poštni predali
00050000-565c-6b28-c0f5-f656b1b29053	1231	Ljubljana - Črnuče
00050000-565c-6b28-6dcd-3b99ffe50151	1261	Ljubljana - Dobrunje
00050000-565c-6b28-36b1-1ea16c084c62	1260	Ljubljana - Polje
00050000-565c-6b28-7530-d21fe474a72e	1210	Ljubljana - Šentvid
00050000-565c-6b28-5806-55ee27275f9b	1211	Ljubljana - Šmartno
00050000-565c-6b28-cab9-92fd4fcebc24	3333	Ljubno ob Savinji
00050000-565c-6b28-541a-f3660a01cfcf	9240	Ljutomer
00050000-565c-6b28-8c70-0882a2bcff9d	3215	Loče
00050000-565c-6b28-02d8-1559b044f5c1	5231	Log pod Mangartom
00050000-565c-6b28-0e8b-44eb5b8344e4	1358	Log pri Brezovici
00050000-565c-6b28-cfe8-fe55eb7c8f87	1370	Logatec
00050000-565c-6b28-92b0-2376c31f5e23	1371	Logatec
00050000-565c-6b28-73dc-1033a9c97058	1434	Loka pri Zidanem Mostu
00050000-565c-6b28-4ad2-f1186a41013a	3223	Loka pri Žusmu
00050000-565c-6b28-2f65-c90769bfcf5f	6219	Lokev
00050000-565c-6b28-6a26-6b2ec7dc17bb	1318	Loški Potok
00050000-565c-6b28-dd59-bc2b6f8481a0	2324	Lovrenc na Dravskem polju
00050000-565c-6b28-dbc0-f55c44a584ae	2344	Lovrenc na Pohorju
00050000-565c-6b28-d0ec-2b4e9ac2eddd	3334	Luče
00050000-565c-6b28-eb7e-29013cd52603	1225	Lukovica
00050000-565c-6b28-10d2-f437bfa96e34	9202	Mačkovci
00050000-565c-6b28-1172-77997824ab28	2322	Majšperk
00050000-565c-6b28-1bcc-cf8006d193be	2321	Makole
00050000-565c-6b28-aea7-0715751d401b	9243	Mala Nedelja
00050000-565c-6b28-7cd3-005e7d20f10f	2229	Malečnik
00050000-565c-6b28-2bec-1ac551ffa513	6273	Marezige
00050000-565c-6b28-dce0-837f4ab39190	2000	Maribor 
00050000-565c-6b28-4e3d-1de6152575a3	2001	Maribor - poštni predali
00050000-565c-6b28-6393-aab13dea7e25	2206	Marjeta na Dravskem polju
00050000-565c-6b28-47d1-dc7757371e11	2281	Markovci
00050000-565c-6b28-5f13-0a82350f61fc	9221	Martjanci
00050000-565c-6b28-a481-4ce44f49abc4	6242	Materija
00050000-565c-6b28-a11b-c094d46721f9	4211	Mavčiče
00050000-565c-6b28-6c90-dc10baf8b045	1215	Medvode
00050000-565c-6b28-d6ec-01f8caa0e67c	1234	Mengeš
00050000-565c-6b28-c9a9-bcdd2350a17b	8330	Metlika
00050000-565c-6b28-8ebf-f81d9f1d9337	2392	Mežica
00050000-565c-6b28-3602-f50c83fc341d	2204	Miklavž na Dravskem polju
00050000-565c-6b28-7901-556e987254c7	2275	Miklavž pri Ormožu
00050000-565c-6b28-9e61-1f2cfec8ea0f	5291	Miren
00050000-565c-6b28-182d-20bfccee0f2b	8233	Mirna
00050000-565c-6b28-d448-6a59fd493388	8216	Mirna Peč
00050000-565c-6b28-72e2-f2f4afc665ef	2382	Mislinja
00050000-565c-6b28-b8ac-791c27fa23ab	4281	Mojstrana
00050000-565c-6b28-8ee8-8306a0375b42	8230	Mokronog
00050000-565c-6b28-a82d-63e71c680aa0	1251	Moravče
00050000-565c-6b28-f959-bec4f11d37d8	9226	Moravske Toplice
00050000-565c-6b28-42f3-93b5aedd78df	5216	Most na Soči
00050000-565c-6b28-70d3-a41f4e93f99c	1221	Motnik
00050000-565c-6b28-338c-e299176c52d6	3330	Mozirje
00050000-565c-6b28-a18c-d8f0d6cdc653	9000	Murska Sobota 
00050000-565c-6b28-c571-663fd557abe0	9001	Murska Sobota - poštni predali
00050000-565c-6b28-2bd3-ae8180f02162	2366	Muta
00050000-565c-6b28-43cc-ae363475665f	4202	Naklo
00050000-565c-6b28-0e2a-160e3e0c448b	3331	Nazarje
00050000-565c-6b28-03a9-65a625458c0f	1357	Notranje Gorice
00050000-565c-6b28-2d42-d3460ad509a9	3203	Nova Cerkev
00050000-565c-6b28-93e9-61263f24a8f5	5000	Nova Gorica 
00050000-565c-6b28-f7a6-86ba829c2a39	5001	Nova Gorica - poštni predali
00050000-565c-6b28-4f41-804c3bb84e83	1385	Nova vas
00050000-565c-6b28-19fb-ad11eb16c535	8000	Novo mesto
00050000-565c-6b28-b2ba-afba835bea6b	8001	Novo mesto - poštni predali
00050000-565c-6b28-9dc2-e9758ed164eb	6243	Obrov
00050000-565c-6b28-5b41-aed887693811	9233	Odranci
00050000-565c-6b28-096e-526493967bfd	2317	Oplotnica
00050000-565c-6b28-006e-869cb567aff4	2312	Orehova vas
00050000-565c-6b28-2f03-d61a12302e01	2270	Ormož
00050000-565c-6b28-e904-6e6907cc0d84	1316	Ortnek
00050000-565c-6b28-1a4c-3d60a2d1d634	1337	Osilnica
00050000-565c-6b28-a500-5e0c18ea0a8a	8222	Otočec
00050000-565c-6b28-76c3-4e202483f783	2361	Ožbalt
00050000-565c-6b28-a66d-3288e51e1ac6	2231	Pernica
00050000-565c-6b28-2d56-0507618c52fc	2211	Pesnica pri Mariboru
00050000-565c-6b28-d015-00e11ba2a337	9203	Petrovci
00050000-565c-6b28-7eb7-016871da2c2a	3301	Petrovče
00050000-565c-6b28-1ca3-96dd82ea887a	6330	Piran/Pirano
00050000-565c-6b28-0359-549c3a98a424	8255	Pišece
00050000-565c-6b28-fd53-9e2722aa8eaf	6257	Pivka
00050000-565c-6b28-f5d3-b5f3d168dade	6232	Planina
00050000-565c-6b28-2fc9-d36f9bd2c6a2	3225	Planina pri Sevnici
00050000-565c-6b28-42fa-4f08a98084a9	6276	Pobegi
00050000-565c-6b28-222b-773be0a218c6	8312	Podbočje
00050000-565c-6b28-ee9a-54cf3ecbaa02	5243	Podbrdo
00050000-565c-6b28-a42c-afdff5be3c7c	3254	Podčetrtek
00050000-565c-6b28-b289-b09e52215138	2273	Podgorci
00050000-565c-6b28-8a55-3c2db49518ce	6216	Podgorje
00050000-565c-6b28-7141-b7b1383b2906	2381	Podgorje pri Slovenj Gradcu
00050000-565c-6b28-9287-5e611a56fae4	6244	Podgrad
00050000-565c-6b28-c0c5-1f63ddd07b71	1414	Podkum
00050000-565c-6b28-739c-7c027c1f2010	2286	Podlehnik
00050000-565c-6b28-2919-ab5d71ab456a	5272	Podnanos
00050000-565c-6b28-caaf-028c2ae626a5	4244	Podnart
00050000-565c-6b28-5a8b-5ae77acc5782	3241	Podplat
00050000-565c-6b28-2107-0d48e88c3cd4	3257	Podsreda
00050000-565c-6b28-e8fa-15071957d44c	2363	Podvelka
00050000-565c-6b28-4f78-d690115bb083	2208	Pohorje
00050000-565c-6b28-7e58-6c57a1d7b822	2257	Polenšak
00050000-565c-6b28-c6d1-92316ece7974	1355	Polhov Gradec
00050000-565c-6b28-b93f-1c4b4ed964e8	4223	Poljane nad Škofjo Loko
00050000-565c-6b28-0c77-38291317cadc	2319	Poljčane
00050000-565c-6b28-4bb1-d7a5c204c4e6	1272	Polšnik
00050000-565c-6b28-cd9d-cc238f377030	3313	Polzela
00050000-565c-6b28-ed06-667b3242c167	3232	Ponikva
00050000-565c-6b28-a705-a8812563b918	6320	Portorož/Portorose
00050000-565c-6b28-abf0-54d23b29bf85	6230	Postojna
00050000-565c-6b28-8296-76c260556adb	2331	Pragersko
00050000-565c-6b28-4cc8-5aef35a5f900	3312	Prebold
00050000-565c-6b28-02c3-75d7a0b08cee	4205	Preddvor
00050000-565c-6b28-989a-867efbbda44e	6255	Prem
00050000-565c-6b28-4500-33bd21f70c4d	1352	Preserje
00050000-565c-6b28-c85b-8a47bc082076	6258	Prestranek
00050000-565c-6b28-d5ae-e6e87ab4b43f	2391	Prevalje
00050000-565c-6b28-a4e6-6bce91bb9ec1	3262	Prevorje
00050000-565c-6b28-832c-0c10995621da	1276	Primskovo 
00050000-565c-6b28-1576-b9a099424960	3253	Pristava pri Mestinju
00050000-565c-6b28-27cb-8eb3a254a96f	9207	Prosenjakovci/Partosfalva
00050000-565c-6b28-f904-501a46905766	5297	Prvačina
00050000-565c-6b28-1374-f6a10c2d76fe	2250	Ptuj
00050000-565c-6b28-59c7-6e18ff40753a	2323	Ptujska Gora
00050000-565c-6b28-a9eb-3ba52dc1b1b0	9201	Puconci
00050000-565c-6b28-e1d3-f49b15e43f0e	2327	Rače
00050000-565c-6b28-45b9-c61d41f2f215	1433	Radeče
00050000-565c-6b28-6cbf-1bd7dc52dc32	9252	Radenci
00050000-565c-6b28-ef08-5b7852e26805	2360	Radlje ob Dravi
00050000-565c-6b28-8618-345165b45302	1235	Radomlje
00050000-565c-6b28-f63e-ad6cb779c81b	4240	Radovljica
00050000-565c-6b28-38d6-9ac7ced9cd54	8274	Raka
00050000-565c-6b28-2755-b969b403e3ec	1381	Rakek
00050000-565c-6b28-ae89-767dbfac43ef	4283	Rateče - Planica
00050000-565c-6b28-2ed1-d35a7bfe381b	2390	Ravne na Koroškem
00050000-565c-6b28-720f-131f7229b9c8	9246	Razkrižje
00050000-565c-6b28-1ebe-77fb631c1cf5	3332	Rečica ob Savinji
00050000-565c-6b28-b7bd-0c453a3e4c3c	5292	Renče
00050000-565c-6b28-6598-0ffcf0ca3812	1310	Ribnica
00050000-565c-6b28-1e34-5194c022cac9	2364	Ribnica na Pohorju
00050000-565c-6b28-d33d-a805e05bcf0b	3272	Rimske Toplice
00050000-565c-6b28-0f9a-0ef20a825ce3	1314	Rob
00050000-565c-6b28-ef1e-4e575d8e3642	5215	Ročinj
00050000-565c-6b28-b5a8-0617b49988c8	3250	Rogaška Slatina
00050000-565c-6b28-b432-9e14676c71cd	9262	Rogašovci
00050000-565c-6b28-a971-a5f1d079d30e	3252	Rogatec
00050000-565c-6b28-df45-5402f3776fbe	1373	Rovte
00050000-565c-6b28-c052-02cf9b55cd28	2342	Ruše
00050000-565c-6b28-2f92-7785fd484966	1282	Sava
00050000-565c-6b28-b80c-edfdb84d6c0d	6333	Sečovlje/Sicciole
00050000-565c-6b28-199f-ba6d7ece4160	4227	Selca
00050000-565c-6b28-b303-db64d938463b	2352	Selnica ob Dravi
00050000-565c-6b28-5c7d-bc616555aa8d	8333	Semič
00050000-565c-6b28-86a8-a2dacd492a27	8281	Senovo
00050000-565c-6b28-0cbb-32eebd1f0563	6224	Senožeče
00050000-565c-6b28-ad76-a2fc4a17c5b3	8290	Sevnica
00050000-565c-6b28-3f2e-40dc72508ca0	6210	Sežana
00050000-565c-6b28-22f3-68ed0911c753	2214	Sladki Vrh
00050000-565c-6b28-a64c-9e3c5a2210c3	5283	Slap ob Idrijci
00050000-565c-6b28-d464-b0b7f105f666	2380	Slovenj Gradec
00050000-565c-6b28-d338-2d15273a200a	2310	Slovenska Bistrica
00050000-565c-6b28-81ec-2520452c8057	3210	Slovenske Konjice
00050000-565c-6b28-9948-b39bb5261d9c	1216	Smlednik
00050000-565c-6b28-a7c3-437d4a14b447	5232	Soča
00050000-565c-6b28-f023-1d9fc73e717d	1317	Sodražica
00050000-565c-6b28-6827-9aebaacc47f7	3335	Solčava
00050000-565c-6b28-42a4-af0a89e30869	5250	Solkan
00050000-565c-6b28-5fb6-2847205ec9d5	4229	Sorica
00050000-565c-6b28-7fdd-697c487d0a4c	4225	Sovodenj
00050000-565c-6b28-8a69-6c3422e04a60	5281	Spodnja Idrija
00050000-565c-6b28-76db-d70194652f6c	2241	Spodnji Duplek
00050000-565c-6b28-e582-5cb7060434e4	9245	Spodnji Ivanjci
00050000-565c-6b28-978a-1d3c06a3e964	2277	Središče ob Dravi
00050000-565c-6b28-d012-3ca9f7e35996	4267	Srednja vas v Bohinju
00050000-565c-6b28-88ed-fe96dc911a0c	8256	Sromlje 
00050000-565c-6b28-74ad-a603cc4e0708	5224	Srpenica
00050000-565c-6b28-fd37-88dcf6c1d8fb	1242	Stahovica
00050000-565c-6b28-7d17-321a034b1ade	1332	Stara Cerkev
00050000-565c-6b28-4142-5dece76fe585	8342	Stari trg ob Kolpi
00050000-565c-6b28-db16-7cb188f0f989	1386	Stari trg pri Ložu
00050000-565c-6b28-3259-9657f7d81819	2205	Starše
00050000-565c-6b28-a4ba-0745a5ed0518	2289	Stoperce
00050000-565c-6b28-c3f0-0905fd48535f	8322	Stopiče
00050000-565c-6b28-3186-59826277c37f	3206	Stranice
00050000-565c-6b28-c933-acc5b07a678a	8351	Straža
00050000-565c-6b28-13d7-fd6755dd722e	1313	Struge
00050000-565c-6b28-ec83-0b097e60f014	8293	Studenec
00050000-565c-6b28-1add-8829b1a2e517	8331	Suhor
00050000-565c-6b28-522c-ba94fc64e15d	2233	Sv. Ana v Slovenskih goricah
00050000-565c-6b28-7685-2e7c84c9f60f	2235	Sv. Trojica v Slovenskih goricah
00050000-565c-6b28-da84-cf4c4739f44d	2353	Sveti Duh na Ostrem Vrhu
00050000-565c-6b28-2dcb-637f64980c7f	9244	Sveti Jurij ob Ščavnici
00050000-565c-6b28-4453-aea9984648d7	3264	Sveti Štefan
00050000-565c-6b28-af06-e5956befa3f4	2258	Sveti Tomaž
00050000-565c-6b28-751c-75068f46c324	9204	Šalovci
00050000-565c-6b28-7d19-4ee01726f805	5261	Šempas
00050000-565c-6b28-e44b-7ea5bb918ed7	5290	Šempeter pri Gorici
00050000-565c-6b28-9c5e-b52426598291	3311	Šempeter v Savinjski dolini
00050000-565c-6b28-aa9c-ad8c905c3899	4208	Šenčur
00050000-565c-6b28-1277-302fc0e6d5d6	2212	Šentilj v Slovenskih goricah
00050000-565c-6b28-3dcc-a07fc0b36e85	8297	Šentjanž
00050000-565c-6b28-8f1a-793baa6ee5ad	2373	Šentjanž pri Dravogradu
00050000-565c-6b28-f706-a75e23172320	8310	Šentjernej
00050000-565c-6b28-292c-3ee4f143a65c	3230	Šentjur
00050000-565c-6b28-3e69-c84b157b7582	3271	Šentrupert
00050000-565c-6b28-5178-6017f0089aea	8232	Šentrupert
00050000-565c-6b28-d87a-1d1b010875f5	1296	Šentvid pri Stični
00050000-565c-6b28-44c3-0eb20fa24601	8275	Škocjan
00050000-565c-6b28-315f-6b7d01b0f5d6	6281	Škofije
00050000-565c-6b28-cf15-8f731918e940	4220	Škofja Loka
00050000-565c-6b28-105d-2038f757c8f8	3211	Škofja vas
00050000-565c-6b28-00ff-162f1e2a4a32	1291	Škofljica
00050000-565c-6b28-875c-185a67988756	6274	Šmarje
00050000-565c-6b28-adc0-c0112be29592	1293	Šmarje - Sap
00050000-565c-6b28-faa0-bab4088ac004	3240	Šmarje pri Jelšah
00050000-565c-6b28-582f-8211ab1bbd55	8220	Šmarješke Toplice
00050000-565c-6b28-c609-01c4fafdd920	2315	Šmartno na Pohorju
00050000-565c-6b28-1d8c-290fefed01e4	3341	Šmartno ob Dreti
00050000-565c-6b28-a48d-57971f4b8e81	3327	Šmartno ob Paki
00050000-565c-6b28-0d51-937a769ce2ca	1275	Šmartno pri Litiji
00050000-565c-6b28-df69-1fe80a180a75	2383	Šmartno pri Slovenj Gradcu
00050000-565c-6b28-b618-4e342842c4b2	3201	Šmartno v Rožni dolini
00050000-565c-6b28-3616-6bfa98adb58b	3325	Šoštanj
00050000-565c-6b28-8636-bac8cd0a47cf	6222	Štanjel
00050000-565c-6b28-bc10-84fa63b3ccdb	3220	Štore
00050000-565c-6b28-2298-3d5c16d4135d	3304	Tabor
00050000-565c-6b28-54e6-9493c03cab0c	3221	Teharje
00050000-565c-6b28-5206-729cf70180b6	9251	Tišina
00050000-565c-6b28-18aa-059627219283	5220	Tolmin
00050000-565c-6b28-fd76-f8b173a3bf8d	3326	Topolšica
00050000-565c-6b28-9302-2922e0a2b34b	2371	Trbonje
00050000-565c-6b28-5a77-c38785c99cc6	1420	Trbovlje
00050000-565c-6b28-7af9-8f3db5c24af1	8231	Trebelno 
00050000-565c-6b28-e872-c19447b372d8	8210	Trebnje
00050000-565c-6b28-ee8c-9b7d4abd8d01	5252	Trnovo pri Gorici
00050000-565c-6b28-3ddd-5bc28599fe0b	2254	Trnovska vas
00050000-565c-6b28-5781-934fa4a0dd48	1222	Trojane
00050000-565c-6b28-e262-403254e96492	1236	Trzin
00050000-565c-6b28-b59d-273d251866aa	4290	Tržič
00050000-565c-6b28-978d-623a2be46a8b	8295	Tržišče
00050000-565c-6b28-0a26-7d5305ce1541	1311	Turjak
00050000-565c-6b28-b56e-c818e4228a51	9224	Turnišče
00050000-565c-6b28-e2b8-1a70b512e810	8323	Uršna sela
00050000-565c-6b28-c958-9fea10b7344a	1252	Vače
00050000-565c-6b28-3834-33f3901634e4	3320	Velenje 
00050000-565c-6b28-a0b4-f4e66eb2f6cc	3322	Velenje - poštni predali
00050000-565c-6b28-61c0-f1ef52e5ea94	8212	Velika Loka
00050000-565c-6b28-67cc-6f9c9b9ff0d7	2274	Velika Nedelja
00050000-565c-6b28-34e4-555ba9c7d2ca	9225	Velika Polana
00050000-565c-6b28-394d-c7399d4ef4ab	1315	Velike Lašče
00050000-565c-6b28-4d03-447edd0bc122	8213	Veliki Gaber
00050000-565c-6b28-7823-ce8ba041cc03	9241	Veržej
00050000-565c-6b28-38be-4665ff25c5bd	1312	Videm - Dobrepolje
00050000-565c-6b28-82c1-1d2953d52591	2284	Videm pri Ptuju
00050000-565c-6b28-2fab-9baf9f12cb0c	8344	Vinica
00050000-565c-6b28-aeb8-8ca7c92590a1	5271	Vipava
00050000-565c-6b28-5c3f-4d3e9fcbfa93	4212	Visoko
00050000-565c-6b28-367a-11fa29e34841	1294	Višnja Gora
00050000-565c-6b28-0a65-26a4adfdf4ab	3205	Vitanje
00050000-565c-6b28-acd9-152998542d66	2255	Vitomarci
00050000-565c-6b28-c8f1-30a8cdd5ec62	1217	Vodice
00050000-565c-6b28-0adb-0637582adbf1	3212	Vojnik\t
00050000-565c-6b28-d2df-203a38e3c154	5293	Volčja Draga
00050000-565c-6b28-306d-cd238773f39b	2232	Voličina
00050000-565c-6b28-5894-276ca9accf87	3305	Vransko
00050000-565c-6b28-8eac-0f993010b343	6217	Vremski Britof
00050000-565c-6b28-549a-a887458d696a	1360	Vrhnika
00050000-565c-6b28-5744-13b503beba33	2365	Vuhred
00050000-565c-6b28-aa9d-4413c221e9d7	2367	Vuzenica
00050000-565c-6b28-a74d-483b8e7512a1	8292	Zabukovje 
00050000-565c-6b28-b5e4-88581ee7b314	1410	Zagorje ob Savi
00050000-565c-6b28-7dd0-b168ad2cd8bc	1303	Zagradec
00050000-565c-6b28-9866-a2eadf33ff91	2283	Zavrč
00050000-565c-6b28-8260-1cb99a84f330	8272	Zdole 
00050000-565c-6b28-0f1b-bda5748db27d	4201	Zgornja Besnica
00050000-565c-6b28-fc2f-5c16a2e800d2	2242	Zgornja Korena
00050000-565c-6b28-b31b-72f761925701	2201	Zgornja Kungota
00050000-565c-6b28-2a8c-71e023478443	2316	Zgornja Ložnica
00050000-565c-6b28-5d97-6273b77211d9	2314	Zgornja Polskava
00050000-565c-6b28-5f19-5a5244d135d1	2213	Zgornja Velka
00050000-565c-6b28-b167-2002b2ff1b59	4247	Zgornje Gorje
00050000-565c-6b28-2621-816fee55ba3e	4206	Zgornje Jezersko
00050000-565c-6b28-f158-897b2c97e33d	2285	Zgornji Leskovec
00050000-565c-6b28-4ddc-83a8174ce4a6	1432	Zidani Most
00050000-565c-6b28-36d4-732c6395e2b2	3214	Zreče
00050000-565c-6b28-f6ce-a8340f033cc6	4209	Žabnica
00050000-565c-6b28-edbf-a845f59880ff	3310	Žalec
00050000-565c-6b28-9219-fa38d2350a56	4228	Železniki
00050000-565c-6b28-695a-68419fe0ed4f	2287	Žetale
00050000-565c-6b28-4503-4af1cc6268f3	4226	Žiri
00050000-565c-6b28-8e3c-321fe4608e5e	4274	Žirovnica
00050000-565c-6b28-8dd2-1958e7d7a1c5	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 30175051)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30174626)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30174374)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-565c-6b2b-42e2-8c138a589b53	00080000-565c-6b2b-783a-34a44008fa3f	\N	00040000-565c-6b28-6f3f-fc7785ba40be	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-565c-6b2b-906e-ad6852441fef	00080000-565c-6b2b-783a-34a44008fa3f	\N	00040000-565c-6b28-6f3f-fc7785ba40be	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-565c-6b2b-24a4-93624fa9a927	00080000-565c-6b2b-bfce-f76dc2057766	\N	00040000-565c-6b28-6f3f-fc7785ba40be	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 30174518)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-565c-6b28-fd41-3b20bf603579	novo leto	1	1	\N	t
00430000-565c-6b28-913f-892fba055ac8	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-565c-6b28-41d3-304031081bc9	dan upora proti okupatorju	27	4	\N	t
00430000-565c-6b28-20c5-f18db4f57328	praznik dela	1	5	\N	t
00430000-565c-6b28-cd7d-dece7ff7f866	praznik dela	2	5	\N	t
00430000-565c-6b28-21e4-93d7a71e9cc2	dan Primoža Trubarja	8	6	\N	f
00430000-565c-6b28-5f37-c48433e02403	dan državnosti	25	6	\N	t
00430000-565c-6b28-ee9d-a0594d5e56e0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-565c-6b28-39a8-bf5216323dae	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-565c-6b28-d469-cdaacd532dea	dan suverenosti	25	10	\N	f
00430000-565c-6b28-4a7b-2da8f2226be1	dan spomina na mrtve	1	11	\N	t
00430000-565c-6b28-92f6-de28fefead02	dan Rudolfa Maistra	23	11	\N	f
00430000-565c-6b28-9da8-0f92c5c57bdd	božič	25	12	\N	t
00430000-565c-6b28-3054-e0a99038fe8f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-565c-6b28-6b0b-bd140fae060e	Marijino vnebovzetje	15	8	\N	t
00430000-565c-6b28-5f61-41e7bd97df65	dan reformacije	31	10	\N	t
00430000-565c-6b28-25af-1336d1f34a53	velikonočna nedelja	27	3	2016	t
00430000-565c-6b28-3b6a-9c30a6392ddb	velikonočna nedelja	16	4	2017	t
00430000-565c-6b28-53fa-f9a3b27b85d4	velikonočna nedelja	1	4	2018	t
00430000-565c-6b28-a5cf-b6b7ac62a6d8	velikonočna nedelja	21	4	2019	t
00430000-565c-6b28-122c-68df16d5f969	velikonočna nedelja	12	4	2020	t
00430000-565c-6b28-bf01-576453544e2a	velikonočna nedelja	4	4	2021	t
00430000-565c-6b28-d4ed-a0aedab08094	velikonočna nedelja	17	4	2022	t
00430000-565c-6b28-f6bd-40a7bcb7ec0c	velikonočna nedelja	9	4	2023	t
00430000-565c-6b28-36cb-e5d3ceb83479	velikonočna nedelja	31	3	2024	t
00430000-565c-6b28-3a1c-99539dd209fa	velikonočna nedelja	20	4	2025	t
00430000-565c-6b28-c848-3a443c329489	velikonočna nedelja	5	4	2026	t
00430000-565c-6b28-8678-c4c9465e3ede	velikonočna nedelja	28	3	2027	t
00430000-565c-6b28-3252-ee5c0dd2e365	velikonočna nedelja	16	4	2028	t
00430000-565c-6b28-73c5-c49585071856	velikonočna nedelja	1	4	2029	t
00430000-565c-6b28-9ef5-be93aafed2f6	velikonočna nedelja	21	4	2030	t
00430000-565c-6b28-121b-6e62e6fe6134	velikonočni ponedeljek	28	3	2016	t
00430000-565c-6b28-7f47-eb4431bea008	velikonočni ponedeljek	17	4	2017	t
00430000-565c-6b28-12ba-969e94d9a67b	velikonočni ponedeljek	2	4	2018	t
00430000-565c-6b28-2e4e-de8614ba58c8	velikonočni ponedeljek	22	4	2019	t
00430000-565c-6b28-b925-f77463cd4047	velikonočni ponedeljek	13	4	2020	t
00430000-565c-6b28-e020-c614e35d3ca4	velikonočni ponedeljek	5	4	2021	t
00430000-565c-6b28-c124-c22f5d9933fb	velikonočni ponedeljek	18	4	2022	t
00430000-565c-6b28-340a-67f6eae42166	velikonočni ponedeljek	10	4	2023	t
00430000-565c-6b28-2fc7-8893bbf19d7b	velikonočni ponedeljek	1	4	2024	t
00430000-565c-6b28-1b16-879dae9d65f7	velikonočni ponedeljek	21	4	2025	t
00430000-565c-6b28-c004-75925cb037b2	velikonočni ponedeljek	6	4	2026	t
00430000-565c-6b28-63cf-1be7473aa49b	velikonočni ponedeljek	29	3	2027	t
00430000-565c-6b28-6cb1-996e67be8354	velikonočni ponedeljek	17	4	2028	t
00430000-565c-6b28-346f-19b7cdf360c0	velikonočni ponedeljek	2	4	2029	t
00430000-565c-6b28-e0a6-434d17598315	velikonočni ponedeljek	22	4	2030	t
00430000-565c-6b28-bf66-bde72935bc29	binkoštna nedelja - binkošti	15	5	2016	t
00430000-565c-6b28-448c-7ae8019ccb0a	binkoštna nedelja - binkošti	4	6	2017	t
00430000-565c-6b28-f145-0f92462c2c7e	binkoštna nedelja - binkošti	20	5	2018	t
00430000-565c-6b28-e939-402c20b6acf6	binkoštna nedelja - binkošti	9	6	2019	t
00430000-565c-6b28-2387-6c65b376935b	binkoštna nedelja - binkošti	31	5	2020	t
00430000-565c-6b28-746f-5305c4efce31	binkoštna nedelja - binkošti	23	5	2021	t
00430000-565c-6b28-56fc-66d242cc3874	binkoštna nedelja - binkošti	5	6	2022	t
00430000-565c-6b28-3fd9-656f476ed8c4	binkoštna nedelja - binkošti	28	5	2023	t
00430000-565c-6b28-9f73-3f8ffbfad8cf	binkoštna nedelja - binkošti	19	5	2024	t
00430000-565c-6b28-34ea-22f71e0f8d9b	binkoštna nedelja - binkošti	8	6	2025	t
00430000-565c-6b28-9fe2-2b1a498671d4	binkoštna nedelja - binkošti	24	5	2026	t
00430000-565c-6b28-9d8c-e174d7df254b	binkoštna nedelja - binkošti	16	5	2027	t
00430000-565c-6b28-a416-cab9e4cd4625	binkoštna nedelja - binkošti	4	6	2028	t
00430000-565c-6b28-2542-b33a4dffbd99	binkoštna nedelja - binkošti	20	5	2029	t
00430000-565c-6b28-9e27-f940f5b6a64a	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 30174478)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 30174490)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 30174638)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 30175065)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 30175075)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-565c-6b2b-453b-39c3986fc15d	00080000-565c-6b2b-26b3-e1615580340d	0987	AK
00190000-565c-6b2b-37cf-b8a79725a85d	00080000-565c-6b2b-bfce-f76dc2057766	0989	AK
00190000-565c-6b2b-257e-74d831289e24	00080000-565c-6b2b-96e2-308ab951cdf8	0986	AK
00190000-565c-6b2b-17e1-8b5cd114ce86	00080000-565c-6b2b-d446-0ab81c4842d3	0984	AK
00190000-565c-6b2b-2223-ee0e309ae37d	00080000-565c-6b2b-2cfc-0e569052430b	0983	AK
00190000-565c-6b2b-07b6-4caf20500e16	00080000-565c-6b2b-e8cd-081612c85355	0982	AK
00190000-565c-6b2c-1464-33b505577d77	00080000-565c-6b2c-86c4-5eaa6e7358e1	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 30174974)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-565c-6b2b-4648-af9c322070f1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 30175083)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30174667)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-565c-6b2a-4442-9b461eab52d7	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-565c-6b2a-a2b0-dd6c7f85fe7d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-565c-6b2a-44a6-d439733cac7d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-565c-6b2a-21d9-e1d12505d823	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-565c-6b2a-afda-eab3d22c4b10	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-565c-6b2a-ba4f-d08c695cad15	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-565c-6b2a-f4db-d24eb58042a7	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 30174611)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 30174601)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30174812)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 30174742)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 30174452)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 30174214)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-565c-6b2c-86c4-5eaa6e7358e1	00010000-565c-6b29-fffd-f7b1a0f641af	2015-11-30 16:28:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-565c-6b2c-521c-6a198fb2934e	00010000-565c-6b29-fffd-f7b1a0f641af	2015-11-30 16:28:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-565c-6b2c-1464-33b505577d77	00010000-565c-6b29-fffd-f7b1a0f641af	2015-11-30 16:28:44	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 30174680)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 30174252)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-565c-6b29-cce5-218725cb0008	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-565c-6b29-d319-de694b40eb64	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-565c-6b29-5378-196466bad87f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-565c-6b29-0021-a75a3ea0d8a4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-565c-6b29-e043-22202481d8ef	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-565c-6b29-ad7f-3a2a6fc84752	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-565c-6b29-0ee4-08ef38d36d82	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-565c-6b29-6791-7451974e41d4	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-565c-6b29-acf0-2fd849688eca	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-565c-6b29-2530-4a12e204c166	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-565c-6b29-2bae-e2ae435a874c	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565c-6b29-80f9-0df2d64f79aa	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565c-6b29-67bd-f59e11815a6d	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-565c-6b29-a39d-108f57e98fb7	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-565c-6b29-7209-86b5c63acc12	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-565c-6b29-8e4d-7ffcf4c8cb6f	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-565c-6b29-212e-83b17a8e2c66	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565c-6b29-795b-2a2524c027cf	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565c-6b29-43c3-9ba10c2747f6	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565c-6b29-d6aa-d2a7a64657d1	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565c-6b29-da73-fefe484a564a	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-565c-6b29-6e94-513c1239c120	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-565c-6b29-39c8-c60f2c97750a	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-565c-6b29-359f-c0d542c56787	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-565c-6b29-3946-002a63c9fa15	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-565c-6b29-63b2-667893bdd570	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-565c-6b29-60ea-d0d0e6885f49	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-565c-6b29-e8df-67e92dfeee65	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-565c-6b29-c5a2-bd89f8c4b7e4	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-565c-6b29-f196-848e9f1a3650	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-565c-6b29-ad9a-9a1f92d902cc	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-565c-6b29-ea4a-c81d54d3f54d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-565c-6b29-66d4-bf78d7214cd3	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-565c-6b29-d0d8-b762273bd0e6	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-565c-6b29-5d3c-a3fa389ce4d6	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-565c-6b29-6606-9737df08ae10	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-565c-6b29-e0cc-33b9b5c33df1	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-565c-6b29-acc2-b5c04079c548	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565c-6b29-33c9-1a66ee2b2ad0	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565c-6b2a-7999-982c586bbfce	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-565c-6b2a-6f54-09309451de03	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-565c-6b2a-061d-fcea38a08c8f	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-565c-6b2a-0111-cc90df98a1b8	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-565c-6b2a-b79c-e2c1b253619c	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-565c-6b2a-938d-f87ff8bd20f9	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-565c-6b2a-383e-5b570cb3eafc	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-565c-6b2a-64ff-1ef344386882	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-565c-6b2a-9a86-5ed6dbe1a852	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-ed81-0ad1c0bac3dc	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-92b4-72af28441f3f	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-169e-79f1c1bc99a1	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-b532-7a38caaee4e5	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-c2be-7fc40d38f6a8	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-a1d4-21d19ae45245	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-c0ff-3ef7dc606587	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-ab29-2ec6f101eb9f	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-565c-6b2b-f814-42812dd4d9d0	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3101 (class 0 OID 30174236)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-565c-6b29-636b-583140f70a5e	00020000-565c-6b29-5378-196466bad87f
00010000-565c-6b29-fffd-f7b1a0f641af	00020000-565c-6b29-5378-196466bad87f
00010000-565c-6b2b-3a69-403d880c4887	00020000-565c-6b2a-7999-982c586bbfce
00010000-565c-6b2b-6777-d0895b7da91b	00020000-565c-6b2a-6f54-09309451de03
00010000-565c-6b2b-6777-d0895b7da91b	00020000-565c-6b2a-938d-f87ff8bd20f9
00010000-565c-6b2b-6777-d0895b7da91b	00020000-565c-6b2b-ed81-0ad1c0bac3dc
00010000-565c-6b2b-6777-d0895b7da91b	00020000-565c-6b2b-169e-79f1c1bc99a1
00010000-565c-6b2b-6777-d0895b7da91b	00020000-565c-6b2b-a1d4-21d19ae45245
00010000-565c-6b2b-6777-d0895b7da91b	00020000-565c-6b2b-ab29-2ec6f101eb9f
00010000-565c-6b2b-6777-d0895b7da91b	00020000-565c-6b2a-0111-cc90df98a1b8
00010000-565c-6b2b-c5d9-e3d53d835da4	00020000-565c-6b2a-6f54-09309451de03
00010000-565c-6b2b-c5d9-e3d53d835da4	00020000-565c-6b2a-061d-fcea38a08c8f
00010000-565c-6b2b-c5d9-e3d53d835da4	00020000-565c-6b2a-0111-cc90df98a1b8
00010000-565c-6b2b-c5d9-e3d53d835da4	00020000-565c-6b2a-b79c-e2c1b253619c
00010000-565c-6b2b-fa09-030f762f288e	00020000-565c-6b2a-6f54-09309451de03
00010000-565c-6b2b-fa09-030f762f288e	00020000-565c-6b2a-061d-fcea38a08c8f
00010000-565c-6b2b-fa09-030f762f288e	00020000-565c-6b2a-0111-cc90df98a1b8
00010000-565c-6b2b-fa09-030f762f288e	00020000-565c-6b2a-b79c-e2c1b253619c
00010000-565c-6b2b-fa09-030f762f288e	00020000-565c-6b2b-169e-79f1c1bc99a1
00010000-565c-6b2b-5718-3bcd34f3e11b	00020000-565c-6b2a-061d-fcea38a08c8f
00010000-565c-6b2b-5718-3bcd34f3e11b	00020000-565c-6b2a-383e-5b570cb3eafc
00010000-565c-6b2b-5718-3bcd34f3e11b	00020000-565c-6b2b-92b4-72af28441f3f
00010000-565c-6b2b-5718-3bcd34f3e11b	00020000-565c-6b2b-b532-7a38caaee4e5
00010000-565c-6b2b-5718-3bcd34f3e11b	00020000-565c-6b2b-169e-79f1c1bc99a1
00010000-565c-6b2b-5718-3bcd34f3e11b	00020000-565c-6b2b-c0ff-3ef7dc606587
00010000-565c-6b2b-bc7e-25f1128fb911	00020000-565c-6b2a-061d-fcea38a08c8f
00010000-565c-6b2b-bc7e-25f1128fb911	00020000-565c-6b2a-383e-5b570cb3eafc
00010000-565c-6b2b-bc7e-25f1128fb911	00020000-565c-6b2a-9a86-5ed6dbe1a852
00010000-565c-6b2b-bc7e-25f1128fb911	00020000-565c-6b2b-92b4-72af28441f3f
00010000-565c-6b2b-bc7e-25f1128fb911	00020000-565c-6b2b-b532-7a38caaee4e5
00010000-565c-6b2b-bc7e-25f1128fb911	00020000-565c-6b2b-169e-79f1c1bc99a1
00010000-565c-6b2b-bc7e-25f1128fb911	00020000-565c-6b2b-c0ff-3ef7dc606587
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2a-061d-fcea38a08c8f
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2a-0111-cc90df98a1b8
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2a-383e-5b570cb3eafc
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2a-64ff-1ef344386882
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2a-9a86-5ed6dbe1a852
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2a-938d-f87ff8bd20f9
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2b-92b4-72af28441f3f
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2b-b532-7a38caaee4e5
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2b-169e-79f1c1bc99a1
00010000-565c-6b2b-3a82-3552e9c8f155	00020000-565c-6b2b-c0ff-3ef7dc606587
00010000-565c-6b2b-6488-c240e4c887a7	00020000-565c-6b2a-6f54-09309451de03
00010000-565c-6b2b-6488-c240e4c887a7	00020000-565c-6b2a-b79c-e2c1b253619c
00010000-565c-6b2b-6488-c240e4c887a7	00020000-565c-6b2a-938d-f87ff8bd20f9
00010000-565c-6b2b-6488-c240e4c887a7	00020000-565c-6b2b-ed81-0ad1c0bac3dc
00010000-565c-6b2b-6488-c240e4c887a7	00020000-565c-6b2b-169e-79f1c1bc99a1
00010000-565c-6b2b-6488-c240e4c887a7	00020000-565c-6b2b-a1d4-21d19ae45245
00010000-565c-6b2b-6488-c240e4c887a7	00020000-565c-6b2b-ab29-2ec6f101eb9f
00010000-565c-6b2b-a486-4de41a4ee7b4	00020000-565c-6b2b-f814-42812dd4d9d0
\.


--
-- TOC entry 3146 (class 0 OID 30174694)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 30174632)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30174578)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-565c-6b2b-1fae-f011c46fc291	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-565c-6b2b-1b4d-094f934cca53	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-565c-6b2b-96d1-72b946224fca	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 30174201)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-565c-6b28-a79b-ffefbeb4f84d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-565c-6b28-2b80-e27e8a73e4b5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-565c-6b28-99f9-42846b2fc933	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-565c-6b28-4805-16bb032efcfb	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-565c-6b28-585a-a78d6794810a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 30174193)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-565c-6b28-ac3a-9cbd2b6f5019	00230000-565c-6b28-4805-16bb032efcfb	popa
00240000-565c-6b28-6f4b-797710442dcb	00230000-565c-6b28-4805-16bb032efcfb	oseba
00240000-565c-6b28-5641-d6b952b05890	00230000-565c-6b28-4805-16bb032efcfb	tippopa
00240000-565c-6b28-a26b-8fa062ad12e3	00230000-565c-6b28-4805-16bb032efcfb	organizacijskaenota
00240000-565c-6b28-3345-12199ae09cff	00230000-565c-6b28-4805-16bb032efcfb	sezona
00240000-565c-6b28-adc3-14b09dcda2f2	00230000-565c-6b28-4805-16bb032efcfb	tipvaje
00240000-565c-6b28-9f9a-1039492f3c4c	00230000-565c-6b28-2b80-e27e8a73e4b5	prostor
00240000-565c-6b28-ef0f-d7c534eddf0e	00230000-565c-6b28-4805-16bb032efcfb	besedilo
00240000-565c-6b28-c3a1-ddc8206de9bd	00230000-565c-6b28-4805-16bb032efcfb	uprizoritev
00240000-565c-6b28-a720-3510054ee416	00230000-565c-6b28-4805-16bb032efcfb	funkcija
00240000-565c-6b28-c4a5-4e8c9a87c618	00230000-565c-6b28-4805-16bb032efcfb	tipfunkcije
00240000-565c-6b28-74fe-4a3e0e99acd4	00230000-565c-6b28-4805-16bb032efcfb	alternacija
00240000-565c-6b28-9ab8-ba5bdeb9dbcb	00230000-565c-6b28-a79b-ffefbeb4f84d	pogodba
00240000-565c-6b28-3f90-13cf952ba9f4	00230000-565c-6b28-4805-16bb032efcfb	zaposlitev
00240000-565c-6b28-9669-02415eef0c87	00230000-565c-6b28-4805-16bb032efcfb	zvrstuprizoritve
00240000-565c-6b28-7e4e-07e66ecb981b	00230000-565c-6b28-a79b-ffefbeb4f84d	programdela
00240000-565c-6b28-ad0a-3ffc5b5e30b3	00230000-565c-6b28-4805-16bb032efcfb	zapis
\.


--
-- TOC entry 3095 (class 0 OID 30174188)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
822c90ed-3aa6-4895-abbf-223caabd9892	00240000-565c-6b28-ac3a-9cbd2b6f5019	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 30174759)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-565c-6b2b-9eea-57f9d073293b	000e0000-565c-6b2b-faee-f31f86a8df21	00080000-565c-6b2b-783a-34a44008fa3f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-565c-6b28-53ab-69b2ff323aee
00270000-565c-6b2b-85da-29705219b141	000e0000-565c-6b2b-faee-f31f86a8df21	00080000-565c-6b2b-783a-34a44008fa3f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-565c-6b28-53ab-69b2ff323aee
\.


--
-- TOC entry 3111 (class 0 OID 30174336)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 30174588)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-565c-6b2b-fcc5-020ec4ba9ce4	00180000-565c-6b2b-f7e9-664553c84ac8	000c0000-565c-6b2b-b70c-0a74174dac2f	00090000-565c-6b2b-e057-e8b1662ce6b7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-6b2b-a4e1-b5edba379b3b	00180000-565c-6b2b-f7e9-664553c84ac8	000c0000-565c-6b2b-5837-9f8b5925ccf9	00090000-565c-6b2b-dbf1-040e2dad56cf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-6b2b-405e-cee566b63a02	00180000-565c-6b2b-f7e9-664553c84ac8	000c0000-565c-6b2b-43eb-112772e09c20	00090000-565c-6b2b-2856-b295161fd2a2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-6b2b-92e7-9cb91e5010b6	00180000-565c-6b2b-f7e9-664553c84ac8	000c0000-565c-6b2b-1f90-ddf4f7269f12	00090000-565c-6b2b-0aff-408c0327be9f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-6b2b-19b7-d37e94c395fc	00180000-565c-6b2b-f7e9-664553c84ac8	000c0000-565c-6b2b-cf0d-99a80350d236	00090000-565c-6b2b-1ddf-6e1d7bcf3fca	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-6b2b-35fe-3c1952ffb6b6	00180000-565c-6b2b-eaf8-ccceb1d96870	\N	00090000-565c-6b2b-1ddf-6e1d7bcf3fca	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-565c-6b2b-1d43-68ca6530527c	00180000-565c-6b2b-eaf8-ccceb1d96870	\N	00090000-565c-6b2b-dbf1-040e2dad56cf	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 30174800)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-565c-6b28-4219-f2d4b8589e2e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-565c-6b28-b0d8-beafa9004634	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-565c-6b28-4664-4fa32fa863cd	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-565c-6b28-11be-a8f868e882dd	04	Režija	Režija	Režija	umetnik	30
000f0000-565c-6b28-3f6d-ca8caf2c466f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-565c-6b28-8f73-fce880f76426	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-565c-6b28-c84e-6e68150c42cb	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-565c-6b28-39f6-c343ae371929	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-565c-6b28-a2b6-6a60815b8c96	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-565c-6b28-f55f-45e48067a1e2	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-565c-6b28-b8f0-656fcb0d9361	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-565c-6b28-bda4-c36e4666443c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-565c-6b28-27a9-3674109e2638	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-565c-6b28-beb4-9be4c49413e1	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-565c-6b28-3b3b-686803529787	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-565c-6b28-64d8-68274c2b60cc	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-565c-6b28-022b-fc08c7ffa531	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-565c-6b28-ea62-ecfe4bda421c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 30174287)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-565c-6b2a-e3bf-8a9b286121de	0001	šola	osnovna ali srednja šola
00400000-565c-6b2a-0c58-e3ef965ba99a	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-565c-6b2a-0d27-db361d235958	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 30175095)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-565c-6b28-a4c8-924ea18b75a2	01	Velika predstava	f	1.00	1.00
002b0000-565c-6b28-e87a-8b7b895655cf	02	Mala predstava	f	0.50	0.50
002b0000-565c-6b28-50aa-29359f75418f	03	Mala koprodukcija	t	0.40	1.00
002b0000-565c-6b28-af8c-f86556e06ca1	04	Srednja koprodukcija	t	0.70	2.00
002b0000-565c-6b28-ed2c-78333fdb4ecb	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 30174568)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-565c-6b28-5a0b-20060800c29f	0001	prva vaja	prva vaja
00420000-565c-6b28-0efc-59a0a63d11ca	0002	tehnična vaja	tehnična vaja
00420000-565c-6b28-eadf-08e1492859f6	0003	lučna vaja	lučna vaja
00420000-565c-6b28-f075-6da21a9b83ed	0004	kostumska vaja	kostumska vaja
00420000-565c-6b28-7c4d-2f2c0240de57	0005	foto vaja	foto vaja
00420000-565c-6b28-10be-19662376d953	0006	1. glavna vaja	1. glavna vaja
00420000-565c-6b28-8f09-0417be9c6629	0007	2. glavna vaja	2. glavna vaja
00420000-565c-6b28-dd88-4f2beb8a3a5d	0008	1. generalka	1. generalka
00420000-565c-6b28-6d5f-4a3b86e26277	0009	2. generalka	2. generalka
00420000-565c-6b28-1fe0-7672d861b47a	0010	odprta generalka	odprta generalka
00420000-565c-6b28-171f-c90c168b2d75	0011	obnovitvena vaja	obnovitvena vaja
00420000-565c-6b28-3bda-5a38d68ddda1	0012	pevska vaja	pevska vaja
00420000-565c-6b28-6880-3fb155f2f447	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-565c-6b28-2073-67c0c03d5a7e	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 30174409)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 30174223)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-565c-6b29-fffd-f7b1a0f641af	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROk76vkVSCNvVsEKrxkOjo51U5Fb7bwBK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-1d20-39b0b9a8a132	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-9d1b-2017acac5dd8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-59b4-98be480f8c70	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-7ab8-0dad6d3b46ce	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-7726-f9d374281645	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-b688-5d04416e68fd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-8173-a0169bf7499a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-4322-7cfbd667a056	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-edb2-e8e58dfc31d4	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-3a69-403d880c4887	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-57f1-df972eb41cee	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-6777-d0895b7da91b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-c5d9-e3d53d835da4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-fa09-030f762f288e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-5718-3bcd34f3e11b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-bc7e-25f1128fb911	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-3a82-3552e9c8f155	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-6488-c240e4c887a7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-565c-6b2b-a486-4de41a4ee7b4	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-565c-6b29-636b-583140f70a5e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 30174850)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-565c-6b2b-7d91-abba1b20835c	00160000-565c-6b2a-014c-0da5d6bc5bbe	\N	00140000-565c-6b28-fa56-918d2c0178d0	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-565c-6b2a-afda-eab3d22c4b10
000e0000-565c-6b2b-faee-f31f86a8df21	00160000-565c-6b2a-586f-ab31dd0662b5	\N	00140000-565c-6b28-8a94-e3dc77af4dfe	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-565c-6b2a-ba4f-d08c695cad15
000e0000-565c-6b2b-881d-6c3beeb6c7d6	\N	\N	00140000-565c-6b28-8a94-e3dc77af4dfe	00190000-565c-6b2b-453b-39c3986fc15d	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565c-6b2a-afda-eab3d22c4b10
000e0000-565c-6b2b-319d-f68e666cf7fd	\N	\N	00140000-565c-6b28-8a94-e3dc77af4dfe	00190000-565c-6b2b-453b-39c3986fc15d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565c-6b2a-afda-eab3d22c4b10
000e0000-565c-6b2b-9622-9e7e42092ebf	\N	\N	00140000-565c-6b28-8a94-e3dc77af4dfe	00190000-565c-6b2b-453b-39c3986fc15d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-565c-6b2a-4442-9b461eab52d7
000e0000-565c-6b2b-c222-9aaebbac163e	\N	\N	00140000-565c-6b28-8a94-e3dc77af4dfe	00190000-565c-6b2b-453b-39c3986fc15d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-565c-6b2a-4442-9b461eab52d7
\.


--
-- TOC entry 3125 (class 0 OID 30174508)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-565c-6b2b-c482-a1bb1fd593d9	\N	000e0000-565c-6b2b-faee-f31f86a8df21	1	
00200000-565c-6b2b-3263-50a3d98f2e08	\N	000e0000-565c-6b2b-faee-f31f86a8df21	2	
00200000-565c-6b2b-e1f9-cad4a7022d06	\N	000e0000-565c-6b2b-faee-f31f86a8df21	3	
00200000-565c-6b2b-b915-42b5e992e396	\N	000e0000-565c-6b2b-faee-f31f86a8df21	4	
00200000-565c-6b2b-7c62-d0ad95c4f596	\N	000e0000-565c-6b2b-faee-f31f86a8df21	5	
\.


--
-- TOC entry 3142 (class 0 OID 30174659)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 30174773)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-565c-6b28-ad58-f05c1afe68b7	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-565c-6b28-884c-5ec8955ac407	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-565c-6b28-6319-a5a1d83b7c26	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-565c-6b28-6295-46ec181b60a3	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-565c-6b28-a8be-e0326c5edd6d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-565c-6b28-4bb4-060bfa5124e2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-565c-6b28-12a4-cd6d47271f8d	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-565c-6b28-062e-0d0b4ec3092b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-565c-6b28-53ab-69b2ff323aee	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-565c-6b28-217c-5ee84f606791	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-565c-6b28-f038-e71eddfaa4b2	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-565c-6b28-d204-6bae805e4106	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-565c-6b28-afb0-8dcf709feed1	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-565c-6b28-5c21-2ad98205dfba	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-565c-6b28-5b61-e7643ae18106	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-565c-6b28-e764-639faa48e9e3	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-565c-6b28-cc30-58d1a6320fbd	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-565c-6b28-234e-288805ac0019	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-565c-6b28-fdbd-7ba7f8ed962b	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-565c-6b28-63f5-fccf371b2072	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-565c-6b28-2838-625d12556809	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-565c-6b28-e782-160df4362ab2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-565c-6b28-b299-851f8fd984ca	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-565c-6b28-3214-fedda2637874	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-565c-6b28-9f91-443fff82a07b	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-565c-6b28-6fc2-97e2bad02b75	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-565c-6b28-562b-4620f89e5cf3	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-565c-6b28-5ca4-3d564fe7d009	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 30175145)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30175114)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 30175157)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 30174731)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-565c-6b2b-1ff3-b064772f10b5	00090000-565c-6b2b-dbf1-040e2dad56cf	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-6b2b-1c4e-a00ea7e0a065	00090000-565c-6b2b-2856-b295161fd2a2	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-6b2b-8b44-fd3ddc5d4836	00090000-565c-6b2b-721c-4e84f8bc2540	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-6b2b-e931-8ad58270f01d	00090000-565c-6b2b-82cd-5a3fcee1d519	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-6b2b-fcef-56b6e4e1ffdc	00090000-565c-6b2b-e715-3a28c6cb600c	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-6b2b-b0dd-942ddb67fed7	00090000-565c-6b2b-2b90-cc5e0d9ae0c8	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 30174552)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 30174840)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-565c-6b28-fa56-918d2c0178d0	01	Drama	drama (SURS 01)
00140000-565c-6b28-1eb7-bbe033879fde	02	Opera	opera (SURS 02)
00140000-565c-6b28-ac44-de48f361c61b	03	Balet	balet (SURS 03)
00140000-565c-6b28-2d1e-dc2da27122e1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-565c-6b28-00cf-d8d2bea44c5c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-565c-6b28-8a94-e3dc77af4dfe	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-565c-6b28-69e5-70e8691fa329	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 30174721)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 30174286)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 30174899)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 30174889)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 30174277)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 30174756)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 30174798)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30175198)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 30174540)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30174562)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30174567)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 30175112)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 30174435)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30174968)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 30174717)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 30174506)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 30174473)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 30174449)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 30174624)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 30175175)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30175182)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 30175206)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 30174651)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 30174407)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 30174305)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 30174369)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 30174332)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30174266)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 30174251)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 30174657)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 30174693)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 30174835)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 30174360)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 30174395)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30175063)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30174630)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30174385)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30174525)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30174494)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 30174486)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 30174642)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30175072)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 30175080)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 30175050)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30175093)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 30174675)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30174615)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 30174606)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30174822)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30174749)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 30174461)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30174222)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30174684)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 30174240)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 30174260)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30174702)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 30174637)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 30174586)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 30174210)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 30174198)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 30174192)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30174769)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 30174341)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 30174597)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30174809)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 30174294)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 30175105)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 30174575)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30174420)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 30174235)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30174868)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30174515)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 30174665)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30174781)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 30175155)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 30175139)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 30175163)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 30174739)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30174556)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30174848)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 30174729)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 30174550)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 30174551)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 30174549)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 30174548)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 30174547)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 30174770)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 30174771)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 30174772)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 30175177)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 30175176)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 30174362)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 30174363)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 30174658)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 30175143)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 30175142)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 30175144)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 30175141)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 30175140)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 30174644)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 30174643)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 30174516)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 30174517)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 30174718)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 30174720)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 30174719)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 30174451)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 30174450)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 30175094)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 30174837)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 30174838)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 30174839)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 30175164)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 30174873)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 30174870)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 30174874)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 30174872)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 30174871)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 30174422)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 30174421)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 30174335)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 30174685)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 30174267)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 30174268)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 30174705)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 30174704)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 30174703)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 30174372)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 30174371)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 30174373)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 30174489)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 30174487)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 30174488)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 30174200)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 30174610)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 30174608)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 30174607)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 30174609)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 30174241)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 30174242)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 30174666)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 30175199)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 30174758)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 30174757)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 30175207)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 30175208)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 30174631)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 30174750)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 30174751)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 30174973)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 30174972)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 30174969)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 30174970)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 30174971)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 30174387)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 30174386)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 30174388)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 30174679)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 30174678)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 30175073)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 30175074)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 30174903)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 30174904)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 30174901)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 30174902)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 30174740)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 30174741)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 30174619)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 30174618)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 30174616)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 30174617)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 30174891)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 30174890)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 30174462)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 30174476)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 30174475)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 30174474)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 30174477)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 30174507)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 30174495)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 30174496)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 30175064)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 30175113)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 30175183)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 30175184)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 30174307)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 30174306)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 30174342)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 30174343)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 30174557)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 30174600)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 30174599)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 30174598)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 30174542)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 30174543)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 30174546)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 30174541)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 30174545)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 30174544)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 30174361)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 30174295)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 30174296)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 30174436)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 30174438)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 30174437)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 30174439)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 30174625)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 30174836)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 30174869)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 30174810)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 30174811)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 30174333)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 30174334)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 30174730)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 30174211)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 30174408)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 30174370)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 30174199)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 30175106)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 30174677)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 30174676)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 30174576)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 30174577)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 30174900)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 30174396)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 30174849)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 30175156)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 30175081)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 30175082)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 30174799)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 30174587)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 30174261)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 30175379)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 30175384)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 30175409)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 30175399)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 30175374)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 30175394)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 30175404)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 30175389)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 30175579)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 30175584)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 30175589)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 30175754)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 30175749)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 30175264)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 30175269)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30175494)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 30175734)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 30175729)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 30175739)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 30175724)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 30175719)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 30175489)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 30175484)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 30175364)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 30175369)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 30175534)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30175544)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 30175539)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 30175319)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 30175314)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 30175474)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 30175709)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 30175594)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 30175599)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 30175604)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 30175744)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 30175624)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 30175609)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 30175629)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 30175619)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 30175614)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 30175309)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 30175304)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 30175249)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 30175244)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 30175514)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 30175224)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 30175229)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 30175529)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 30175524)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 30175519)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 30175279)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 30175274)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 30175284)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 30175344)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 30175334)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 30175339)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 30175209)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 30175449)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 30175439)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 30175434)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 30175444)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 30175214)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 30175219)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 30175499)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 30175769)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 30175574)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 30175569)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 30175774)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 30175779)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 30175479)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 30175559)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 30175564)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 30175684)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 30175679)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 30175664)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 30175669)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 30175674)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 30175294)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 30175289)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 30175299)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 30175509)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 30175504)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 30175694)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 30175699)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 30175654)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 30175659)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 30175644)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 30175649)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 30175549)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 30175554)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 30175469)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 30175464)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 30175454)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 30175459)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 30175639)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 30175634)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 30175324)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 30175329)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 30175359)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 30175349)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 30175354)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 30175689)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 30175704)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 30175714)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 30175759)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 30175764)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 30175239)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 30175234)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 30175254)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 30175259)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 30175414)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 30175429)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 30175424)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 30175419)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-30 16:28:46 CET

--
-- PostgreSQL database dump complete
--

