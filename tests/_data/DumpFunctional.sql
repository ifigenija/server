--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-20 10:40:49 CET

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
-- TOC entry 183 (class 1259 OID 28686087)
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
-- TOC entry 237 (class 1259 OID 28686701)
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
-- TOC entry 236 (class 1259 OID 28686684)
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
-- TOC entry 182 (class 1259 OID 28686080)
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
-- TOC entry 181 (class 1259 OID 28686078)
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
-- TOC entry 227 (class 1259 OID 28686561)
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
-- TOC entry 230 (class 1259 OID 28686591)
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
-- TOC entry 251 (class 1259 OID 28686992)
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
-- TOC entry 203 (class 1259 OID 28686335)
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
-- TOC entry 205 (class 1259 OID 28686367)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 28686372)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 28686914)
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
-- TOC entry 194 (class 1259 OID 28686232)
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
-- TOC entry 238 (class 1259 OID 28686714)
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
-- TOC entry 223 (class 1259 OID 28686515)
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
-- TOC entry 200 (class 1259 OID 28686306)
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
-- TOC entry 197 (class 1259 OID 28686272)
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
-- TOC entry 195 (class 1259 OID 28686249)
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
-- TOC entry 212 (class 1259 OID 28686429)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 28686972)
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
-- TOC entry 250 (class 1259 OID 28686985)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 28687007)
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
-- TOC entry 216 (class 1259 OID 28686454)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 28686206)
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
-- TOC entry 185 (class 1259 OID 28686106)
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
-- TOC entry 189 (class 1259 OID 28686173)
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
-- TOC entry 186 (class 1259 OID 28686117)
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
-- TOC entry 178 (class 1259 OID 28686052)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 28686071)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 28686461)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 28686495)
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
-- TOC entry 233 (class 1259 OID 28686632)
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
-- TOC entry 188 (class 1259 OID 28686153)
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
-- TOC entry 191 (class 1259 OID 28686198)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 28686859)
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
-- TOC entry 213 (class 1259 OID 28686435)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 28686183)
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
-- TOC entry 202 (class 1259 OID 28686327)
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
-- TOC entry 198 (class 1259 OID 28686287)
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
-- TOC entry 199 (class 1259 OID 28686299)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 28686447)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 28686873)
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
-- TOC entry 242 (class 1259 OID 28686883)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 28686782)
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
-- TOC entry 243 (class 1259 OID 28686891)
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
-- TOC entry 219 (class 1259 OID 28686476)
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
-- TOC entry 211 (class 1259 OID 28686420)
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
-- TOC entry 210 (class 1259 OID 28686410)
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
-- TOC entry 232 (class 1259 OID 28686621)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 28686551)
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
-- TOC entry 196 (class 1259 OID 28686261)
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
-- TOC entry 175 (class 1259 OID 28686023)
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
-- TOC entry 174 (class 1259 OID 28686021)
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
-- TOC entry 220 (class 1259 OID 28686489)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 28686061)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 28686045)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 28686503)
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
-- TOC entry 214 (class 1259 OID 28686441)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 28686387)
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
-- TOC entry 173 (class 1259 OID 28686010)
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
-- TOC entry 172 (class 1259 OID 28686002)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 28685997)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 28686568)
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
-- TOC entry 187 (class 1259 OID 28686145)
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
-- TOC entry 209 (class 1259 OID 28686397)
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
-- TOC entry 231 (class 1259 OID 28686609)
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
-- TOC entry 184 (class 1259 OID 28686096)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 28686902)
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
-- TOC entry 207 (class 1259 OID 28686377)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 28686218)
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
-- TOC entry 176 (class 1259 OID 28686032)
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
-- TOC entry 235 (class 1259 OID 28686659)
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
-- TOC entry 201 (class 1259 OID 28686317)
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
-- TOC entry 218 (class 1259 OID 28686468)
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
-- TOC entry 229 (class 1259 OID 28686582)
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
-- TOC entry 247 (class 1259 OID 28686952)
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
-- TOC entry 246 (class 1259 OID 28686921)
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
-- TOC entry 248 (class 1259 OID 28686964)
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
-- TOC entry 225 (class 1259 OID 28686540)
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
-- TOC entry 204 (class 1259 OID 28686361)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 28686649)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 28686530)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 28686083)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 28686026)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 28686087)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-564e-ea9e-4609-ae6ebf2459c3	10	30	Otroci	Abonma za otroke	200
000a0000-564e-ea9e-c830-70aa3a6984fe	20	60	Mladina	Abonma za mladino	400
000a0000-564e-ea9e-12a4-7184b5f2161d	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 28686701)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-564e-ea9e-8e68-d085c91265b9	000d0000-564e-ea9e-f82a-49854f8dfdc4	\N	00090000-564e-ea9e-a3ef-086a08c04994	000b0000-564e-ea9e-8b24-6d70504f7190	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-564e-ea9e-6e04-7f98baa4517d	000d0000-564e-ea9e-602f-806f9e147b13	00100000-564e-ea9e-4743-5efd140f04f4	00090000-564e-ea9e-a131-c14bbcc967c9	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-564e-ea9e-c4e4-8d32db4e3b60	000d0000-564e-ea9e-65a9-6751c89bbe82	00100000-564e-ea9e-cc0b-4d946aa18f18	00090000-564e-ea9e-ce69-08fd5248006b	\N	0003	t	\N	2015-11-20	\N	2	t	\N	f	f
000c0000-564e-ea9e-65b3-91f944568c29	000d0000-564e-ea9e-0382-11e35c65b500	\N	00090000-564e-ea9e-9c26-3e43382a8105	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-564e-ea9e-9150-d64041e58127	000d0000-564e-ea9e-80c7-4f4fea06e47f	\N	00090000-564e-ea9e-e6ba-1ace743034ac	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-564e-ea9e-9825-448aad585e88	000d0000-564e-ea9e-b98d-2a3cfa00683e	\N	00090000-564e-ea9e-9835-9bd24d8ef98f	000b0000-564e-ea9e-2c64-451fe51fcc8c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-564e-ea9e-f246-e1952c3d4b15	000d0000-564e-ea9e-eac6-f0bbd70ec670	00100000-564e-ea9e-60fd-e21e038777d3	00090000-564e-ea9e-34ce-e2b0299447ee	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-564e-ea9e-5153-a58d4935b678	000d0000-564e-ea9e-5e07-6d2d498b394d	\N	00090000-564e-ea9e-c3cd-f318f02d0da0	000b0000-564e-ea9e-2fc3-997dd0750971	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-564e-ea9e-45f0-bae8fb36ac89	000d0000-564e-ea9e-eac6-f0bbd70ec670	00100000-564e-ea9e-d975-6a9c6a0b2b14	00090000-564e-ea9e-7120-d4eb8eb9f9eb	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-564e-ea9e-f60a-cb3feae7a155	000d0000-564e-ea9e-eac6-f0bbd70ec670	00100000-564e-ea9e-8108-ccdf43c8385d	00090000-564e-ea9e-6f78-543f98f3625c	\N	0010	t	\N	2015-11-20	\N	16	f	\N	f	t
000c0000-564e-ea9e-651b-575270c5d508	000d0000-564e-ea9e-eac6-f0bbd70ec670	00100000-564e-ea9e-9b3d-80023d8189e6	00090000-564e-ea9e-da76-e5ff21ca3d65	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-564e-ea9e-96a0-0798a9da78ae	000d0000-564e-ea9e-f549-db91fb2e89b7	00100000-564e-ea9e-4743-5efd140f04f4	00090000-564e-ea9e-a131-c14bbcc967c9	000b0000-564e-ea9e-f69e-499abef933fa	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 28686684)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 28686080)
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
-- TOC entry 3149 (class 0 OID 28686561)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-564e-ea9e-7478-3a5e7aa6b75f	00160000-564e-ea9d-aa46-9d492165594d	00090000-564e-ea9e-dea5-b9ea984c0859	aizv	10	t
003d0000-564e-ea9e-7833-2266c88093d9	00160000-564e-ea9d-aa46-9d492165594d	00090000-564e-ea9e-abbf-ad1f3cb53579	apri	14	t
003d0000-564e-ea9e-a3ec-aed0f7a88d39	00160000-564e-ea9d-024f-a362ac77450c	00090000-564e-ea9e-32f4-c5d31d8e3d91	aizv	11	t
003d0000-564e-ea9e-61a5-7b0fff280f6f	00160000-564e-ea9d-2592-74253f7f98f4	00090000-564e-ea9e-162a-8ee5b3b48a0c	aizv	12	t
003d0000-564e-ea9e-589a-8cf467ea3553	00160000-564e-ea9d-aa46-9d492165594d	00090000-564e-ea9e-1e0b-d723d4a60ea3	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 28686591)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-564e-ea9d-aa46-9d492165594d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-564e-ea9d-024f-a362ac77450c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-564e-ea9d-2592-74253f7f98f4	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 28686992)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 28686335)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-564e-ea9e-91b4-cc7f8c3049c2	\N	\N	00200000-564e-ea9e-8e1f-b46393255e83	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-564e-ea9e-bdad-7588034036a4	\N	\N	00200000-564e-ea9e-492c-f69c9a20e671	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-564e-ea9e-cd78-0bc3816c8311	\N	\N	00200000-564e-ea9e-458d-8f01e4a973eb	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-564e-ea9e-c651-b58ea5c5c0d3	\N	\N	00200000-564e-ea9e-6e4f-d81d2bdf9f45	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-564e-ea9e-c829-50d6c2438456	\N	\N	00200000-564e-ea9e-0db8-26b5fe8ae8dc	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 28686367)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 28686372)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 28686914)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 28686232)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-564e-ea9b-0786-49865dad186e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-564e-ea9b-71f9-91d54125af1b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-564e-ea9b-3be7-02f2b79d7b3f	AL	ALB	008	Albania 	Albanija	\N
00040000-564e-ea9b-d12f-1bb9901e78a1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-564e-ea9b-38c1-c8dcf5ef7897	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-564e-ea9b-ac54-5eda07f2c227	AD	AND	020	Andorra 	Andora	\N
00040000-564e-ea9b-322e-b74f2d6dec18	AO	AGO	024	Angola 	Angola	\N
00040000-564e-ea9b-c7b4-a1147719759a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-564e-ea9b-18a8-a82f4d59635c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-564e-ea9b-075e-b53bd6b7a5bf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-564e-ea9b-9fbb-9e8a2c431041	AR	ARG	032	Argentina 	Argenitna	\N
00040000-564e-ea9b-fe99-b2bb089c90ea	AM	ARM	051	Armenia 	Armenija	\N
00040000-564e-ea9b-b4b0-823419435c7f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-564e-ea9b-d027-fb4a7f0073ba	AU	AUS	036	Australia 	Avstralija	\N
00040000-564e-ea9b-a84f-b64c8efc879b	AT	AUT	040	Austria 	Avstrija	\N
00040000-564e-ea9b-6eac-6426fef2c8fd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-564e-ea9b-12cf-fd8ed27f020f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-564e-ea9b-014d-99a1d22cee53	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-564e-ea9b-691b-b0c06a5ce5cc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-564e-ea9b-b719-d6c3e74d9091	BB	BRB	052	Barbados 	Barbados	\N
00040000-564e-ea9b-2165-994126c5f08e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-564e-ea9b-511d-dc900726fb74	BE	BEL	056	Belgium 	Belgija	\N
00040000-564e-ea9b-cc75-f731648f6f04	BZ	BLZ	084	Belize 	Belize	\N
00040000-564e-ea9b-609d-6a46ebb672b9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-564e-ea9b-3449-145111983575	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-564e-ea9b-b589-e3af3feeec57	BT	BTN	064	Bhutan 	Butan	\N
00040000-564e-ea9b-ef29-319b29e28356	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-564e-ea9b-a479-dd167980fb54	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-564e-ea9b-f17e-a4fab101ca2e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-564e-ea9b-9021-a8a70bac0127	BW	BWA	072	Botswana 	Bocvana	\N
00040000-564e-ea9b-7874-599376b7cbcb	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-564e-ea9b-c962-13112a3aec98	BR	BRA	076	Brazil 	Brazilija	\N
00040000-564e-ea9b-aeea-3f69b410e1e4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-564e-ea9b-3482-b3016ecfe9bb	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-564e-ea9b-e0bd-9a1ebb31f647	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-564e-ea9b-1945-832d014001c6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-564e-ea9b-6285-5932be1d742d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-564e-ea9b-2ea1-778c52b09f40	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-564e-ea9b-19fe-94c65d0deed3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-564e-ea9b-8f2f-b4f6f74fffe7	CA	CAN	124	Canada 	Kanada	\N
00040000-564e-ea9b-bcc0-1145277ac872	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-564e-ea9b-4f80-b906702c564c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-564e-ea9b-353c-c1473abd1ddb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-564e-ea9b-ae7d-84f2ee7766ea	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-564e-ea9b-90a0-95f37c57d350	CL	CHL	152	Chile 	Čile	\N
00040000-564e-ea9b-fead-ac63246f0996	CN	CHN	156	China 	Kitajska	\N
00040000-564e-ea9b-1aab-1d16fc86aa83	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-564e-ea9b-dc35-3e980429277e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-564e-ea9b-f964-b2b686bbac5f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-564e-ea9b-a568-c60ffaa41d70	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-564e-ea9b-e2a8-208ea93c38d9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-564e-ea9b-2798-a61bde9cf76e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-564e-ea9b-66b4-e5d09182632b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-564e-ea9b-e7d6-d61fb41823d2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-564e-ea9b-c921-fb9ae4ed2982	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-564e-ea9b-cd5a-94522550e416	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-564e-ea9b-37ac-40b9e9cfb27f	CU	CUB	192	Cuba 	Kuba	\N
00040000-564e-ea9b-0cf8-5e22be1da73e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-564e-ea9b-aa91-7fe987a7b9d3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-564e-ea9b-f420-ea7ac85e7ec1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-564e-ea9b-d696-7b2558fafb2f	DK	DNK	208	Denmark 	Danska	\N
00040000-564e-ea9b-8459-984a4503772e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-564e-ea9b-0761-5b8e44e89a42	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-564e-ea9b-1500-7b8f4c40f783	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-564e-ea9b-b182-b12e02c294c0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-564e-ea9b-8c1f-e37ddeffdb2e	EG	EGY	818	Egypt 	Egipt	\N
00040000-564e-ea9b-b0be-cca10d19da6f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-564e-ea9b-c236-f15b1ba67980	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-564e-ea9b-5978-ea4b766fc8a1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-564e-ea9b-ba5e-977c116a89b2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-564e-ea9b-c8eb-5b0a8703a4a9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-564e-ea9b-a2b0-477f405a4f42	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-564e-ea9b-ffa5-346c21ddfc2b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-564e-ea9b-555b-b7d13926b53b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-564e-ea9b-6302-14b8f7691904	FI	FIN	246	Finland 	Finska	\N
00040000-564e-ea9b-55de-d7182c373f0e	FR	FRA	250	France 	Francija	\N
00040000-564e-ea9b-f857-a51e44618afa	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-564e-ea9b-e0b9-d86538fb8200	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-564e-ea9b-32cf-f3f2ac787203	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-564e-ea9b-59d2-018a8f20227e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-564e-ea9b-4d50-8aa0c30c97a3	GA	GAB	266	Gabon 	Gabon	\N
00040000-564e-ea9b-a65c-c23445eb6ddd	GM	GMB	270	Gambia 	Gambija	\N
00040000-564e-ea9b-5c7f-7aba2a5675d3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-564e-ea9b-d929-310e74899d3b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-564e-ea9b-fd6a-75b93c400027	GH	GHA	288	Ghana 	Gana	\N
00040000-564e-ea9b-d2a6-318b31a3ff91	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-564e-ea9b-c357-1f96df6c5de9	GR	GRC	300	Greece 	Grčija	\N
00040000-564e-ea9b-877b-041024359a2e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-564e-ea9b-2086-c37b18cd3268	GD	GRD	308	Grenada 	Grenada	\N
00040000-564e-ea9b-c816-71741f4b64b0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-564e-ea9b-4c38-e10f50456f94	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-564e-ea9b-f417-fbfc20b2b009	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-564e-ea9b-6fb6-54bbc27ee4f2	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-564e-ea9b-8419-393ddb14afd3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-564e-ea9b-6903-d3bad4915298	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-564e-ea9b-1133-5059ddc30bd0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-564e-ea9b-72d6-ee34086ad8ea	HT	HTI	332	Haiti 	Haiti	\N
00040000-564e-ea9b-ef2f-d68b2264652e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-564e-ea9b-acdd-a42e8a03cc45	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-564e-ea9b-3387-f4ef7c555941	HN	HND	340	Honduras 	Honduras	\N
00040000-564e-ea9b-91f7-a69665d4ae9b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-564e-ea9b-ef04-b2dd977d05e7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-564e-ea9b-ba6f-e547e989e05d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-564e-ea9b-2477-cbea9f4ffe2f	IN	IND	356	India 	Indija	\N
00040000-564e-ea9b-60be-660dafc8d471	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-564e-ea9b-200c-7d5af6df77a2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-564e-ea9b-9235-d6d9a32cc076	IQ	IRQ	368	Iraq 	Irak	\N
00040000-564e-ea9b-2bd4-fec0aba2fa21	IE	IRL	372	Ireland 	Irska	\N
00040000-564e-ea9b-fbef-6a9c56d30321	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-564e-ea9b-0b91-e612b0048808	IL	ISR	376	Israel 	Izrael	\N
00040000-564e-ea9b-c385-2f8bff41d63d	IT	ITA	380	Italy 	Italija	\N
00040000-564e-ea9b-8625-7fe8e0dd6763	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-564e-ea9b-5b1f-8c325da14425	JP	JPN	392	Japan 	Japonska	\N
00040000-564e-ea9b-aa14-125c7a3256e6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-564e-ea9b-6ce3-04b712292580	JO	JOR	400	Jordan 	Jordanija	\N
00040000-564e-ea9b-1e72-243c41e5d898	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-564e-ea9b-4940-d4d374bce4f9	KE	KEN	404	Kenya 	Kenija	\N
00040000-564e-ea9b-b88f-5146a25e7e48	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-564e-ea9b-3816-31b8020daa21	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-564e-ea9b-951b-8473db4de40d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-564e-ea9b-a414-20da76aedb28	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-564e-ea9b-7593-2b7029394c3c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-564e-ea9b-581f-ef584f6c88ad	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-564e-ea9b-b023-8fde0e03f426	LV	LVA	428	Latvia 	Latvija	\N
00040000-564e-ea9b-5c4f-d127122981f9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-564e-ea9b-ff33-457e41ecf9a5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-564e-ea9b-634d-c4fa360df762	LR	LBR	430	Liberia 	Liberija	\N
00040000-564e-ea9b-48e2-98ed000a4c6f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-564e-ea9b-a7f6-b559f1148a72	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-564e-ea9b-742a-e33f929adbdf	LT	LTU	440	Lithuania 	Litva	\N
00040000-564e-ea9b-57c9-bb5bfa3f8df5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-564e-ea9b-ab49-3f12f2460187	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-564e-ea9b-a20e-f0144fdac1b6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-564e-ea9b-8b79-645b4af90a92	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-564e-ea9b-ae09-0ef82928a347	MW	MWI	454	Malawi 	Malavi	\N
00040000-564e-ea9b-256c-760989209265	MY	MYS	458	Malaysia 	Malezija	\N
00040000-564e-ea9b-c845-a0b3a4fabb76	MV	MDV	462	Maldives 	Maldivi	\N
00040000-564e-ea9b-c1f6-127f5b6292db	ML	MLI	466	Mali 	Mali	\N
00040000-564e-ea9b-94d5-c53f5593036e	MT	MLT	470	Malta 	Malta	\N
00040000-564e-ea9b-6251-f3f15d5cfaa1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-564e-ea9b-779e-0b7b848d68af	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-564e-ea9b-b26e-ba2b82a12bde	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-564e-ea9b-c89c-7135f90fe263	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-564e-ea9b-b240-91b0175fe2e4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-564e-ea9b-cdd3-5f693a85b8dd	MX	MEX	484	Mexico 	Mehika	\N
00040000-564e-ea9b-fc8c-08136f18d211	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-564e-ea9b-0166-bf961263d7b5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-564e-ea9b-3a23-111b35f567c5	MC	MCO	492	Monaco 	Monako	\N
00040000-564e-ea9b-6734-ae1ed48b28f7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-564e-ea9b-bfd8-2a24eb4c835c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-564e-ea9b-f209-0264259a090c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-564e-ea9b-535a-70b86e4a672b	MA	MAR	504	Morocco 	Maroko	\N
00040000-564e-ea9b-ab0a-7b407bd17811	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-564e-ea9b-baa7-d7242c99e48d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-564e-ea9b-3667-fe6a309e81f6	NA	NAM	516	Namibia 	Namibija	\N
00040000-564e-ea9b-de0c-9a23e5f8259c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-564e-ea9b-077c-ea4b66e379d8	NP	NPL	524	Nepal 	Nepal	\N
00040000-564e-ea9b-30e7-e42811e87fdf	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-564e-ea9b-3a8e-5386539bfc26	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-564e-ea9b-91e5-ec189cf85ff6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-564e-ea9b-0a25-99b714779408	NE	NER	562	Niger 	Niger 	\N
00040000-564e-ea9b-24ef-d384c1f6b8cf	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-564e-ea9b-2241-226677c18c9b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-564e-ea9b-e674-5ff733163cdf	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-564e-ea9b-c8b0-b6764fd0371f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-564e-ea9b-518d-a26f9b626aa7	NO	NOR	578	Norway 	Norveška	\N
00040000-564e-ea9b-a4e7-793fe23fa182	OM	OMN	512	Oman 	Oman	\N
00040000-564e-ea9b-dc37-a3f76c92f36d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-564e-ea9b-6eae-40b1e1aa0b11	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-564e-ea9b-6278-cbff82d9871a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-564e-ea9b-63e4-04175bf7bd49	PA	PAN	591	Panama 	Panama	\N
00040000-564e-ea9b-cab7-48119151a55e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-564e-ea9b-a716-f3d3c18423db	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-564e-ea9b-5833-492361bd2106	PE	PER	604	Peru 	Peru	\N
00040000-564e-ea9b-d505-6f3a382064c9	PH	PHL	608	Philippines 	Filipini	\N
00040000-564e-ea9b-cea6-c095b5b356d6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-564e-ea9b-e8ed-ff3fd528118e	PL	POL	616	Poland 	Poljska	\N
00040000-564e-ea9b-6d6f-3063d19db9c1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-564e-ea9b-0571-d61f8500abdd	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-564e-ea9b-7fbb-467722115407	QA	QAT	634	Qatar 	Katar	\N
00040000-564e-ea9b-ee8f-4c32b1e74bd8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-564e-ea9b-964e-ac1e7d7d40e3	RO	ROU	642	Romania 	Romunija	\N
00040000-564e-ea9b-5b39-2d51d6c75606	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-564e-ea9b-62c8-c28230867c1f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-564e-ea9b-ee18-cb7ab1a14156	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-564e-ea9b-5174-734cf88f2f58	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-564e-ea9b-f9a8-67fc9d9135dd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-564e-ea9b-3473-60b589a210ac	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-564e-ea9b-cb48-d845d5725369	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-564e-ea9b-c507-e133caea3f14	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-564e-ea9b-3d46-c57fee2f1736	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-564e-ea9b-4246-07376dd19982	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-564e-ea9b-eaee-c9dde39bec83	SM	SMR	674	San Marino 	San Marino	\N
00040000-564e-ea9b-0681-d21e675f2811	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-564e-ea9b-6870-41ad4e39f4d8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-564e-ea9b-82e4-773a12ef567e	SN	SEN	686	Senegal 	Senegal	\N
00040000-564e-ea9b-1af9-cb5c564b66e0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-564e-ea9b-1ed0-fe6a39dd9fc3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-564e-ea9b-e273-fa6b0e809500	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-564e-ea9b-7ee2-e804460919e5	SG	SGP	702	Singapore 	Singapur	\N
00040000-564e-ea9b-0e41-f1b107a4e60a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-564e-ea9b-54c6-4141e3e9127f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-564e-ea9b-f399-f70ca820c06e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-564e-ea9b-5d8c-ea2c7379dfdc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-564e-ea9b-da9f-afaf4099dcd6	SO	SOM	706	Somalia 	Somalija	\N
00040000-564e-ea9b-6c94-eb66fb65e8ed	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-564e-ea9b-3119-b883b78a6691	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-564e-ea9b-6c34-523e58013b69	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-564e-ea9b-e26a-468718855d92	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-564e-ea9b-c8f9-4881ca2e83fe	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-564e-ea9b-facf-aece56bfc9a5	SD	SDN	729	Sudan 	Sudan	\N
00040000-564e-ea9b-3f2e-a0a5a2a45782	SR	SUR	740	Suriname 	Surinam	\N
00040000-564e-ea9b-3612-cdcc79587701	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-564e-ea9b-fe05-76762cb1ec48	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-564e-ea9b-6476-32834863addf	SE	SWE	752	Sweden 	Švedska	\N
00040000-564e-ea9b-c6e5-b74ee8d8a771	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-564e-ea9b-c48b-653cdf6b554a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-564e-ea9b-6ace-cbc96b9fc414	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-564e-ea9b-f6e8-77892e70852a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-564e-ea9b-db1c-78f2b17e2a11	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-564e-ea9b-39f2-6854c43619cf	TH	THA	764	Thailand 	Tajska	\N
00040000-564e-ea9b-674f-27e792243af0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-564e-ea9b-006e-ab1167ee21dc	TG	TGO	768	Togo 	Togo	\N
00040000-564e-ea9b-7e31-fa923f66f89e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-564e-ea9b-a108-f7fdad42596a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-564e-ea9b-4990-a580c234e142	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-564e-ea9b-a454-db34553a76c6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-564e-ea9b-6d81-5b7225f176a6	TR	TUR	792	Turkey 	Turčija	\N
00040000-564e-ea9b-3eea-5d188fae9d6a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-564e-ea9b-0ce8-c49d94bbec14	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564e-ea9b-5b69-0c1b01bbc19e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-564e-ea9b-d760-da7ba4c91eb3	UG	UGA	800	Uganda 	Uganda	\N
00040000-564e-ea9b-34ec-4a9507eca64b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-564e-ea9b-4a68-d55dcae70daf	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-564e-ea9b-e111-9dce479f74d2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-564e-ea9b-c053-d56e7adf9221	US	USA	840	United States 	Združene države Amerike	\N
00040000-564e-ea9b-5b1b-1c48098e15c0	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-564e-ea9b-a525-a5b0f4ba7106	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-564e-ea9b-d934-715951ee7dbd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-564e-ea9b-841c-192c33dfb014	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-564e-ea9b-db56-a8b8d5791ce0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-564e-ea9b-a582-e4041f839d45	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-564e-ea9b-85ad-2afe547e8120	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564e-ea9b-f264-a03892c45a93	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-564e-ea9b-b75d-be89291c6494	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-564e-ea9b-c5fa-a51c98133a53	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-564e-ea9b-2a25-5a13255130e5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-564e-ea9b-3e28-e2d7fd70f49c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-564e-ea9b-78c2-1e0d79380349	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 28686714)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-564e-ea9e-6caa-2c85a93a85ec	000e0000-564e-ea9e-67fe-2a159395def3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564e-ea9b-e162-a2e9173677b2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564e-ea9e-bf3e-1b68237ff99d	000e0000-564e-ea9e-2dff-ea4bfc573dcd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564e-ea9b-0f49-96fecb7eeca1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564e-ea9e-6006-7221494a8e8e	000e0000-564e-ea9e-2d5a-05f1f2c42cb5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564e-ea9b-e162-a2e9173677b2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564e-ea9e-bf88-0b6114115560	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564e-ea9e-0562-323c55a3b677	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 28686515)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-564e-ea9e-eac6-f0bbd70ec670	000e0000-564e-ea9e-2dff-ea4bfc573dcd	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-564e-ea9b-90bf-deed532112ff
000d0000-564e-ea9e-f82a-49854f8dfdc4	000e0000-564e-ea9e-2dff-ea4bfc573dcd	000c0000-564e-ea9e-8e68-d085c91265b9	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-564e-ea9b-90bf-deed532112ff
000d0000-564e-ea9e-602f-806f9e147b13	000e0000-564e-ea9e-2dff-ea4bfc573dcd	000c0000-564e-ea9e-6e04-7f98baa4517d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-564e-ea9b-e9c1-fb21aef53fe7
000d0000-564e-ea9e-65a9-6751c89bbe82	000e0000-564e-ea9e-2dff-ea4bfc573dcd	000c0000-564e-ea9e-c4e4-8d32db4e3b60	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-564e-ea9b-2041-4a6ed89c8f34
000d0000-564e-ea9e-0382-11e35c65b500	000e0000-564e-ea9e-2dff-ea4bfc573dcd	000c0000-564e-ea9e-65b3-91f944568c29	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-564e-ea9b-d013-d60db5237362
000d0000-564e-ea9e-80c7-4f4fea06e47f	000e0000-564e-ea9e-2dff-ea4bfc573dcd	000c0000-564e-ea9e-9150-d64041e58127	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-564e-ea9b-d013-d60db5237362
000d0000-564e-ea9e-b98d-2a3cfa00683e	000e0000-564e-ea9e-2dff-ea4bfc573dcd	000c0000-564e-ea9e-9825-448aad585e88	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-564e-ea9b-90bf-deed532112ff
000d0000-564e-ea9e-5e07-6d2d498b394d	000e0000-564e-ea9e-2dff-ea4bfc573dcd	000c0000-564e-ea9e-5153-a58d4935b678	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-564e-ea9b-0b94-a096ec1cc05a
000d0000-564e-ea9e-f549-db91fb2e89b7	000e0000-564e-ea9e-2dff-ea4bfc573dcd	000c0000-564e-ea9e-96a0-0798a9da78ae	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-564e-ea9b-20fa-d18db226b9c9
\.


--
-- TOC entry 3122 (class 0 OID 28686306)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 28686272)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 28686249)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-564e-ea9e-257a-6aab9f180d88	00080000-564e-ea9e-8f17-36b11fd9fa50	00090000-564e-ea9e-6f78-543f98f3625c	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 28686429)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 28686972)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-564e-ea9e-6c6e-9e8e509cb8b7	00010000-564e-ea9c-337f-312b0d60d985	\N	Prva mapa	Root mapa	2015-11-20 10:40:46	2015-11-20 10:40:46	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 28686985)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 28687007)
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
-- TOC entry 3138 (class 0 OID 28686454)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 28686206)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-564e-ea9c-40f7-2becdee6100b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-564e-ea9c-0082-3c2002ff594a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-564e-ea9c-471b-fb561deb6159	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-564e-ea9c-adeb-a311a9bac3cd	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-564e-ea9c-fdc5-5a4bec0cf28e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-564e-ea9c-bb22-a1979575ef55	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-564e-ea9c-4686-58df058f33c8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-564e-ea9c-cd7a-e11534f324e0	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564e-ea9c-ca29-8fe0f25a2f33	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564e-ea9c-8114-1c92efb12044	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-564e-ea9c-c560-1fa277e89948	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-564e-ea9c-d205-c33212a86699	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-564e-ea9c-aeb3-3b5106d11a0c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-564e-ea9c-293c-10517abefc7d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-564e-ea9d-186a-b0b33e597f67	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-564e-ea9d-45dd-32e41108a5ec	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-564e-ea9d-3e91-b7590d3cb802	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-564e-ea9d-5a90-64d99c3b8066	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-564e-ea9d-3ef7-9a2359f8028d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-564e-ea9f-8cd9-f7a91961db0b	application.tenant.maticnopodjetje	string	s:36:"00080000-564e-ea9f-bb4c-4c48c099ec41";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 28686106)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-564e-ea9d-8a41-d4652b941008	00000000-564e-ea9d-186a-b0b33e597f67	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-564e-ea9d-ed89-e5ca8afce19f	00000000-564e-ea9d-186a-b0b33e597f67	00010000-564e-ea9c-337f-312b0d60d985	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-564e-ea9d-36ed-d53affcf1916	00000000-564e-ea9d-45dd-32e41108a5ec	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 28686173)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-564e-ea9e-2795-8d43d9ee9d65	\N	00100000-564e-ea9e-4743-5efd140f04f4	00100000-564e-ea9e-cc0b-4d946aa18f18	01	Gledališče Nimbis
00410000-564e-ea9e-d2d8-da64037d30f2	00410000-564e-ea9e-2795-8d43d9ee9d65	00100000-564e-ea9e-4743-5efd140f04f4	00100000-564e-ea9e-cc0b-4d946aa18f18	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 28686117)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-564e-ea9e-a3ef-086a08c04994	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-564e-ea9e-9c26-3e43382a8105	00010000-564e-ea9e-dca2-1014ac6c3ed6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-564e-ea9e-ce69-08fd5248006b	00010000-564e-ea9e-0530-2c4e0e979c5f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-564e-ea9e-7120-d4eb8eb9f9eb	00010000-564e-ea9e-f91a-a10c51d749c3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-564e-ea9e-6f43-0d6fb8fd5fec	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-564e-ea9e-9835-9bd24d8ef98f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-564e-ea9e-da76-e5ff21ca3d65	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-564e-ea9e-34ce-e2b0299447ee	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-564e-ea9e-6f78-543f98f3625c	00010000-564e-ea9e-8179-e3d40d889598	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-564e-ea9e-a131-c14bbcc967c9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-564e-ea9e-8798-c60f1aab1966	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564e-ea9e-e6ba-1ace743034ac	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-564e-ea9e-c3cd-f318f02d0da0	00010000-564e-ea9e-506c-bbcb6ad357e3	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564e-ea9e-dea5-b9ea984c0859	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-564e-ea9e-abbf-ad1f3cb53579	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-564e-ea9e-32f4-c5d31d8e3d91	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-564e-ea9e-162a-8ee5b3b48a0c	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564e-ea9e-1e0b-d723d4a60ea3	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564e-ea9e-e022-2d95769c9e93	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-564e-ea9e-37e6-be8bea228fbb	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-564e-ea9e-8650-b0ad0f869101	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 28686052)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-564e-ea9c-52a5-f45c9ea5018c	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-564e-ea9c-9ef1-91532d79af47	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-564e-ea9c-7666-5d94680c5f0e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-564e-ea9c-bd22-3cfe2c3051a3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-564e-ea9c-564f-d988e51484b5	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-564e-ea9c-b56c-9942bf736555	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-564e-ea9c-f974-624d1cc0d531	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-564e-ea9c-1452-75587215f2a3	Abonma-read	Abonma - branje	t
00030000-564e-ea9c-30f7-a9474a208f4a	Abonma-write	Abonma - spreminjanje	t
00030000-564e-ea9c-bdef-6c618afb467f	Alternacija-read	Alternacija - branje	t
00030000-564e-ea9c-0ad9-5b1e62a564bd	Alternacija-write	Alternacija - spreminjanje	t
00030000-564e-ea9c-d957-e24435c1ca85	Arhivalija-read	Arhivalija - branje	t
00030000-564e-ea9c-4a41-c73c8f150762	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-564e-ea9c-47c0-7fc9903153b3	AuthStorage-read	AuthStorage - branje	t
00030000-564e-ea9c-1777-fe3cd45cb91e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-564e-ea9c-be1a-d67a66d94df3	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-564e-ea9c-ddf7-bac09f815708	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-564e-ea9c-b6e6-e6a57a9257a2	Besedilo-read	Besedilo - branje	t
00030000-564e-ea9c-8269-2fbb99c42e5a	Besedilo-write	Besedilo - spreminjanje	t
00030000-564e-ea9c-bc0a-224bb49efc84	Dogodek-read	Dogodek - branje	t
00030000-564e-ea9c-637e-8df9cf05d0ee	Dogodek-write	Dogodek - spreminjanje	t
00030000-564e-ea9c-10e7-b796d871f6d9	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-564e-ea9c-5c6b-496eef58b6da	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-564e-ea9c-b17e-5b201cd4b6c7	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-564e-ea9c-d8ac-47f658db4623	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-564e-ea9c-dacf-d761c9939a6c	DogodekTrait-read	DogodekTrait - branje	t
00030000-564e-ea9c-57ed-ae80c4a558bf	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-564e-ea9c-a8e7-25ed12e30e6d	DrugiVir-read	DrugiVir - branje	t
00030000-564e-ea9c-0c9f-a716cfcda49c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-564e-ea9c-f0d5-68fa15e08402	Drzava-read	Drzava - branje	t
00030000-564e-ea9c-d06d-dbaf7997ac10	Drzava-write	Drzava - spreminjanje	t
00030000-564e-ea9c-504e-1b37e3847559	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-564e-ea9c-dd6c-80baf9ab00bb	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-564e-ea9c-8e2d-d8287c6cffeb	Funkcija-read	Funkcija - branje	t
00030000-564e-ea9c-51ea-0573e9191e43	Funkcija-write	Funkcija - spreminjanje	t
00030000-564e-ea9c-db05-4a57026c0a8e	Gostovanje-read	Gostovanje - branje	t
00030000-564e-ea9c-16f2-312a45f478d0	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-564e-ea9c-9f99-8448879b5f8c	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-564e-ea9c-73d4-63ad6aaa062c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-564e-ea9c-f5b1-db252b698958	Kupec-read	Kupec - branje	t
00030000-564e-ea9c-bf10-209233512b14	Kupec-write	Kupec - spreminjanje	t
00030000-564e-ea9c-d1d4-ff7dd1003368	NacinPlacina-read	NacinPlacina - branje	t
00030000-564e-ea9c-5ff6-584b45dd2605	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-564e-ea9c-f667-52ef0662bcde	Option-read	Option - branje	t
00030000-564e-ea9c-12a8-adcc09179475	Option-write	Option - spreminjanje	t
00030000-564e-ea9c-4542-925cb8ddf3fb	OptionValue-read	OptionValue - branje	t
00030000-564e-ea9c-c5eb-ae36160ad042	OptionValue-write	OptionValue - spreminjanje	t
00030000-564e-ea9c-f8a4-44428f6e8e50	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-564e-ea9c-89b2-009d79374394	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-564e-ea9c-b9da-8478a6546731	Oseba-read	Oseba - branje	t
00030000-564e-ea9c-b911-6a2505fb1360	Oseba-write	Oseba - spreminjanje	t
00030000-564e-ea9c-721e-7b8dd80ca6df	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-564e-ea9c-f10f-7ae9da7aba5d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-564e-ea9c-11a8-ab13e3b1e4b8	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-564e-ea9c-9c16-17f127de0c56	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-564e-ea9c-66ee-a018d0e105c0	Pogodba-read	Pogodba - branje	t
00030000-564e-ea9c-0675-b9cd6d51732e	Pogodba-write	Pogodba - spreminjanje	t
00030000-564e-ea9c-7acc-f25aee726e03	Popa-read	Popa - branje	t
00030000-564e-ea9c-d566-6bddb3e6d348	Popa-write	Popa - spreminjanje	t
00030000-564e-ea9c-42d7-4c7c9e65e14e	Posta-read	Posta - branje	t
00030000-564e-ea9c-4300-70b63e2bc657	Posta-write	Posta - spreminjanje	t
00030000-564e-ea9c-1db1-b0ee1f877cc9	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-564e-ea9c-5494-8f6fadb6f006	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-564e-ea9c-e5ee-addc834de575	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-564e-ea9c-b042-705df1f08e4d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-564e-ea9c-3adb-7c1372576ae9	PostniNaslov-read	PostniNaslov - branje	t
00030000-564e-ea9c-79fe-5efc8b3c7541	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-564e-ea9c-2c45-157ed3972e43	Praznik-read	Praznik - branje	t
00030000-564e-ea9c-9eb3-1bfd588da0fe	Praznik-write	Praznik - spreminjanje	t
00030000-564e-ea9c-6bc8-2a6915f4c40d	Predstava-read	Predstava - branje	t
00030000-564e-ea9c-6ab4-7fb25839d2b5	Predstava-write	Predstava - spreminjanje	t
00030000-564e-ea9c-ea7a-bcc743c245d4	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-564e-ea9c-7ab0-d6c44b0d528e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-564e-ea9c-30cb-f56e12e28771	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-564e-ea9c-9ab8-ed9368e5e248	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-564e-ea9c-a54c-7821a126ead2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-564e-ea9c-0e8e-53faede2c4fd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-564e-ea9c-40ac-87251a256226	ProgramDela-read	ProgramDela - branje	t
00030000-564e-ea9c-ad04-9dce3430d255	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-564e-ea9c-a579-e694df5e4303	ProgramFestival-read	ProgramFestival - branje	t
00030000-564e-ea9c-450c-0ce7dfa5c3a1	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-564e-ea9c-7f2c-2ae8c72bbc31	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-564e-ea9c-b10d-c28da8853d95	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-564e-ea9c-009d-d72c3968aae5	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-564e-ea9c-514b-8f5eff638bae	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-564e-ea9c-8bf6-e3fe1168e44d	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-564e-ea9c-2956-74b270a9096c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-564e-ea9c-b4d0-ed7ec15ac35e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-564e-ea9c-71c2-90d74525c5eb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-564e-ea9c-20ba-acbc5a95bbe5	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-564e-ea9c-ee09-7d6af191a949	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-564e-ea9c-93c6-d3539bbba4bd	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-564e-ea9c-806a-183dc0893490	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-564e-ea9c-9624-2fbc5355b0e8	ProgramRazno-read	ProgramRazno - branje	t
00030000-564e-ea9c-5f04-e36dfd960677	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-564e-ea9c-bca6-05a220dceed5	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-564e-ea9c-7ade-03feb71d4eb3	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-564e-ea9c-8c54-5a33cc69b263	Prostor-read	Prostor - branje	t
00030000-564e-ea9c-2310-ec8bf283a5da	Prostor-write	Prostor - spreminjanje	t
00030000-564e-ea9c-81b1-c8dddc483926	Racun-read	Racun - branje	t
00030000-564e-ea9c-8c8d-bbe0450ba93b	Racun-write	Racun - spreminjanje	t
00030000-564e-ea9c-6018-de796c6a6c22	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-564e-ea9c-f123-ff7007d5c7c6	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-564e-ea9c-738c-c7576eb0ccce	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-564e-ea9c-1cef-36c9886b42bd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-564e-ea9c-9b46-a10a6fb141ed	Rekvizit-read	Rekvizit - branje	t
00030000-564e-ea9c-1a7a-42164af1ba6a	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-564e-ea9c-2d3c-a618c64d53e5	Revizija-read	Revizija - branje	t
00030000-564e-ea9c-a992-9067319adb1f	Revizija-write	Revizija - spreminjanje	t
00030000-564e-ea9c-b6d5-1b3053806971	Rezervacija-read	Rezervacija - branje	t
00030000-564e-ea9c-4a87-6d2c4f2436d8	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-564e-ea9c-8d05-bf1f729ad452	SedezniRed-read	SedezniRed - branje	t
00030000-564e-ea9c-c49d-a664df2c9c25	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-564e-ea9c-5bcd-c1f0b1704362	Sedez-read	Sedez - branje	t
00030000-564e-ea9c-4e85-cfed3e3f2ddb	Sedez-write	Sedez - spreminjanje	t
00030000-564e-ea9c-4234-934ca156e89e	Sezona-read	Sezona - branje	t
00030000-564e-ea9c-767c-23624ba80440	Sezona-write	Sezona - spreminjanje	t
00030000-564e-ea9c-715d-dce96ac54279	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-564e-ea9c-946d-2176c24fb879	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-564e-ea9c-e340-8f4f03f3c6ce	Stevilcenje-read	Stevilcenje - branje	t
00030000-564e-ea9c-338c-8362d2209ed9	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-564e-ea9c-5a83-1ba1a502ee18	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-564e-ea9c-8bf0-30b9f1e51070	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-564e-ea9c-44fd-58e2802f33de	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-564e-ea9c-9a83-03e3cdc5901f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-564e-ea9c-e43c-a6ac3607d4de	Telefonska-read	Telefonska - branje	t
00030000-564e-ea9c-6f0a-1ceb5de2dab4	Telefonska-write	Telefonska - spreminjanje	t
00030000-564e-ea9c-ccb6-d84f5ca22147	TerminStoritve-read	TerminStoritve - branje	t
00030000-564e-ea9c-dff8-ac080a942cf5	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-564e-ea9c-f912-429b6fa576db	TipFunkcije-read	TipFunkcije - branje	t
00030000-564e-ea9c-fcd4-44a05c819599	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-564e-ea9c-f12f-14f693f6cd7d	TipPopa-read	TipPopa - branje	t
00030000-564e-ea9c-d2b9-9292efc286db	TipPopa-write	TipPopa - spreminjanje	t
00030000-564e-ea9c-83f6-52f11e2b09dd	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-564e-ea9c-c2f9-d76499a0bbae	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-564e-ea9c-ca52-4dfff3c1b788	TipVaje-read	TipVaje - branje	t
00030000-564e-ea9c-dfe4-fccc9c5ed37e	TipVaje-write	TipVaje - spreminjanje	t
00030000-564e-ea9c-1d62-ce0796b2910f	Trr-read	Trr - branje	t
00030000-564e-ea9c-1426-e53e7da37ba5	Trr-write	Trr - spreminjanje	t
00030000-564e-ea9c-4c9e-ac1d1a6e95e7	Uprizoritev-read	Uprizoritev - branje	t
00030000-564e-ea9c-39c7-33149f43f21b	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-564e-ea9c-d03d-9af9c8cbc9e8	Vaja-read	Vaja - branje	t
00030000-564e-ea9c-1506-22f3d34a6e9d	Vaja-write	Vaja - spreminjanje	t
00030000-564e-ea9c-ecd5-3ff235192675	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-564e-ea9c-000f-c472fab5f60f	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-564e-ea9c-e74d-b566ea9cafb2	VrstaStroska-read	VrstaStroska - branje	t
00030000-564e-ea9c-cd4e-de3caf817d81	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-564e-ea9c-7065-5c30d0882442	Zaposlitev-read	Zaposlitev - branje	t
00030000-564e-ea9c-f5d0-536d62dd1892	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-564e-ea9c-5f68-0212e60371f8	Zasedenost-read	Zasedenost - branje	t
00030000-564e-ea9c-0b0c-3a12f3983b23	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-564e-ea9c-62b2-754e43932c79	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-564e-ea9c-839b-b450ef570ac0	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-564e-ea9c-b120-cffbe37bc251	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-564e-ea9c-f769-1104c90aaee6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-564e-ea9c-b1b8-c9503282e606	Job-read	Branje opravil - samo zase - branje	t
00030000-564e-ea9c-d71b-126cae210663	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-564e-ea9c-4138-f35e52b70031	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-564e-ea9c-cc2f-29e6fb730f18	Report-read	Report - branje	t
00030000-564e-ea9c-8e4d-18bed7ff4475	Report-write	Report - spreminjanje	t
00030000-564e-ea9c-00e7-cecad30cb755	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-564e-ea9c-1274-342e7cd7dd2b	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-564e-ea9c-bb9f-bba878b5d389	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-564e-ea9c-e8ac-a726d6b2e2d4	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-564e-ea9c-22a8-d709d4371030	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-564e-ea9c-7423-dda041726534	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-564e-ea9c-de23-a3d221e39502	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-564e-ea9c-7e11-c9f3bb6bf37a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-564e-ea9c-bc01-4aa4ff555eb6	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564e-ea9c-b703-0269cf0f615d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564e-ea9c-7bb3-d0f45dc68181	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-564e-ea9c-2d81-f1f661d2394d	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-564e-ea9c-c663-95c04996dd2d	Datoteka-write	Datoteka - spreminjanje	t
00030000-564e-ea9c-0826-9d9079fd9879	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 28686071)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-564e-ea9c-4d63-2adc23e46c13	00030000-564e-ea9c-9ef1-91532d79af47
00020000-564e-ea9c-b787-e8c826ee8b98	00030000-564e-ea9c-f0d5-68fa15e08402
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-1452-75587215f2a3
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-30f7-a9474a208f4a
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-bdef-6c618afb467f
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-0ad9-5b1e62a564bd
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-d957-e24435c1ca85
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-bc0a-224bb49efc84
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-bd22-3cfe2c3051a3
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-637e-8df9cf05d0ee
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-f0d5-68fa15e08402
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-d06d-dbaf7997ac10
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-8e2d-d8287c6cffeb
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-51ea-0573e9191e43
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-db05-4a57026c0a8e
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-16f2-312a45f478d0
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-9f99-8448879b5f8c
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-73d4-63ad6aaa062c
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-f667-52ef0662bcde
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-4542-925cb8ddf3fb
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-b9da-8478a6546731
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-b911-6a2505fb1360
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-7acc-f25aee726e03
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-d566-6bddb3e6d348
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-42d7-4c7c9e65e14e
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-4300-70b63e2bc657
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-3adb-7c1372576ae9
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-79fe-5efc8b3c7541
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-6bc8-2a6915f4c40d
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-6ab4-7fb25839d2b5
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-a54c-7821a126ead2
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-0e8e-53faede2c4fd
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-8c54-5a33cc69b263
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-2310-ec8bf283a5da
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-738c-c7576eb0ccce
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-1cef-36c9886b42bd
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-9b46-a10a6fb141ed
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-1a7a-42164af1ba6a
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-4234-934ca156e89e
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-767c-23624ba80440
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-f912-429b6fa576db
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-4c9e-ac1d1a6e95e7
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-39c7-33149f43f21b
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-d03d-9af9c8cbc9e8
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-1506-22f3d34a6e9d
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-5f68-0212e60371f8
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-0b0c-3a12f3983b23
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-62b2-754e43932c79
00020000-564e-ea9c-23b3-025813dbf7d9	00030000-564e-ea9c-b120-cffbe37bc251
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-1452-75587215f2a3
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-d957-e24435c1ca85
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-bc0a-224bb49efc84
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-f0d5-68fa15e08402
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-db05-4a57026c0a8e
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-9f99-8448879b5f8c
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-73d4-63ad6aaa062c
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-f667-52ef0662bcde
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-4542-925cb8ddf3fb
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-b9da-8478a6546731
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-b911-6a2505fb1360
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-7acc-f25aee726e03
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-42d7-4c7c9e65e14e
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-3adb-7c1372576ae9
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-79fe-5efc8b3c7541
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-6bc8-2a6915f4c40d
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-8c54-5a33cc69b263
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-738c-c7576eb0ccce
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-9b46-a10a6fb141ed
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-4234-934ca156e89e
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-e43c-a6ac3607d4de
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-6f0a-1ceb5de2dab4
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-1d62-ce0796b2910f
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-1426-e53e7da37ba5
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-7065-5c30d0882442
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-f5d0-536d62dd1892
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-62b2-754e43932c79
00020000-564e-ea9c-4f95-7d722232192d	00030000-564e-ea9c-b120-cffbe37bc251
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-1452-75587215f2a3
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-bdef-6c618afb467f
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-d957-e24435c1ca85
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-4a41-c73c8f150762
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-b6e6-e6a57a9257a2
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-10e7-b796d871f6d9
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-bc0a-224bb49efc84
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-f0d5-68fa15e08402
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-8e2d-d8287c6cffeb
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-db05-4a57026c0a8e
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-9f99-8448879b5f8c
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-f667-52ef0662bcde
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-4542-925cb8ddf3fb
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-b9da-8478a6546731
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-7acc-f25aee726e03
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-42d7-4c7c9e65e14e
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-6bc8-2a6915f4c40d
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-a54c-7821a126ead2
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-8c54-5a33cc69b263
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-738c-c7576eb0ccce
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-9b46-a10a6fb141ed
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-4234-934ca156e89e
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-f912-429b6fa576db
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-d03d-9af9c8cbc9e8
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-5f68-0212e60371f8
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-62b2-754e43932c79
00020000-564e-ea9c-39c1-0394962f86b8	00030000-564e-ea9c-b120-cffbe37bc251
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-1452-75587215f2a3
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-30f7-a9474a208f4a
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-0ad9-5b1e62a564bd
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-d957-e24435c1ca85
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-bc0a-224bb49efc84
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-f0d5-68fa15e08402
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-db05-4a57026c0a8e
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-f667-52ef0662bcde
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-4542-925cb8ddf3fb
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-7acc-f25aee726e03
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-42d7-4c7c9e65e14e
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-6bc8-2a6915f4c40d
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-8c54-5a33cc69b263
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-738c-c7576eb0ccce
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-9b46-a10a6fb141ed
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-4234-934ca156e89e
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-f912-429b6fa576db
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-62b2-754e43932c79
00020000-564e-ea9c-6f41-2f96a774191c	00030000-564e-ea9c-b120-cffbe37bc251
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-1452-75587215f2a3
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-d957-e24435c1ca85
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-bc0a-224bb49efc84
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-f0d5-68fa15e08402
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-db05-4a57026c0a8e
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-f667-52ef0662bcde
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-4542-925cb8ddf3fb
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-7acc-f25aee726e03
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-42d7-4c7c9e65e14e
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-6bc8-2a6915f4c40d
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-8c54-5a33cc69b263
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-738c-c7576eb0ccce
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-9b46-a10a6fb141ed
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-4234-934ca156e89e
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-ccb6-d84f5ca22147
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-7666-5d94680c5f0e
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-f912-429b6fa576db
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-62b2-754e43932c79
00020000-564e-ea9c-c257-6f2a5511d909	00030000-564e-ea9c-b120-cffbe37bc251
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-52a5-f45c9ea5018c
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-9ef1-91532d79af47
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1452-75587215f2a3
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-30f7-a9474a208f4a
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-bdef-6c618afb467f
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-0ad9-5b1e62a564bd
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-d957-e24435c1ca85
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-4a41-c73c8f150762
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-47c0-7fc9903153b3
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1777-fe3cd45cb91e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-be1a-d67a66d94df3
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-ddf7-bac09f815708
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b6e6-e6a57a9257a2
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-8269-2fbb99c42e5a
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-0826-9d9079fd9879
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-c663-95c04996dd2d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-bc0a-224bb49efc84
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-bd22-3cfe2c3051a3
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-637e-8df9cf05d0ee
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-10e7-b796d871f6d9
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-5c6b-496eef58b6da
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b17e-5b201cd4b6c7
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-d8ac-47f658db4623
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-a8e7-25ed12e30e6d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-0c9f-a716cfcda49c
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f0d5-68fa15e08402
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-d06d-dbaf7997ac10
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-504e-1b37e3847559
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-dd6c-80baf9ab00bb
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-8e2d-d8287c6cffeb
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-51ea-0573e9191e43
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-db05-4a57026c0a8e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-16f2-312a45f478d0
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-4138-f35e52b70031
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b1b8-c9503282e606
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-d71b-126cae210663
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-9f99-8448879b5f8c
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-73d4-63ad6aaa062c
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f5b1-db252b698958
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-bf10-209233512b14
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-00e7-cecad30cb755
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1274-342e7cd7dd2b
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-bb9f-bba878b5d389
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-e8ac-a726d6b2e2d4
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7423-dda041726534
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-22a8-d709d4371030
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-d1d4-ff7dd1003368
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-5ff6-584b45dd2605
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f667-52ef0662bcde
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-12a8-adcc09179475
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-4542-925cb8ddf3fb
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-c5eb-ae36160ad042
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f8a4-44428f6e8e50
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-89b2-009d79374394
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b9da-8478a6546731
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-564f-d988e51484b5
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b911-6a2505fb1360
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-721e-7b8dd80ca6df
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f10f-7ae9da7aba5d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-11a8-ab13e3b1e4b8
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-9c16-17f127de0c56
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-66ee-a018d0e105c0
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-0675-b9cd6d51732e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7acc-f25aee726e03
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-d566-6bddb3e6d348
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-42d7-4c7c9e65e14e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-4300-70b63e2bc657
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1db1-b0ee1f877cc9
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-5494-8f6fadb6f006
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-e5ee-addc834de575
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b042-705df1f08e4d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-3adb-7c1372576ae9
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-79fe-5efc8b3c7541
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-2c45-157ed3972e43
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-9eb3-1bfd588da0fe
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-6bc8-2a6915f4c40d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-6ab4-7fb25839d2b5
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-ea7a-bcc743c245d4
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7ab0-d6c44b0d528e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-30cb-f56e12e28771
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-9ab8-ed9368e5e248
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-a54c-7821a126ead2
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-0e8e-53faede2c4fd
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b56c-9942bf736555
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-40ac-87251a256226
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f974-624d1cc0d531
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-ad04-9dce3430d255
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-a579-e694df5e4303
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-450c-0ce7dfa5c3a1
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7f2c-2ae8c72bbc31
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b10d-c28da8853d95
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-009d-d72c3968aae5
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-514b-8f5eff638bae
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-8bf6-e3fe1168e44d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-2956-74b270a9096c
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b4d0-ed7ec15ac35e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-71c2-90d74525c5eb
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-20ba-acbc5a95bbe5
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-ee09-7d6af191a949
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-93c6-d3539bbba4bd
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-806a-183dc0893490
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-9624-2fbc5355b0e8
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-5f04-e36dfd960677
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-bca6-05a220dceed5
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7ade-03feb71d4eb3
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-8c54-5a33cc69b263
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-2310-ec8bf283a5da
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-81b1-c8dddc483926
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-8c8d-bbe0450ba93b
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-6018-de796c6a6c22
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f123-ff7007d5c7c6
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-9b46-a10a6fb141ed
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1a7a-42164af1ba6a
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-738c-c7576eb0ccce
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1cef-36c9886b42bd
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-cc2f-29e6fb730f18
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-8e4d-18bed7ff4475
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-2d3c-a618c64d53e5
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-a992-9067319adb1f
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b6d5-1b3053806971
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-4a87-6d2c4f2436d8
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-5bcd-c1f0b1704362
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-4e85-cfed3e3f2ddb
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-8d05-bf1f729ad452
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-c49d-a664df2c9c25
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-4234-934ca156e89e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-767c-23624ba80440
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-e340-8f4f03f3c6ce
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-338c-8362d2209ed9
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-715d-dce96ac54279
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-946d-2176c24fb879
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-5a83-1ba1a502ee18
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-8bf0-30b9f1e51070
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-44fd-58e2802f33de
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-9a83-03e3cdc5901f
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-e43c-a6ac3607d4de
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-6f0a-1ceb5de2dab4
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-ccb6-d84f5ca22147
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7666-5d94680c5f0e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-dff8-ac080a942cf5
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f912-429b6fa576db
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-fcd4-44a05c819599
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f12f-14f693f6cd7d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-d2b9-9292efc286db
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-83f6-52f11e2b09dd
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-c2f9-d76499a0bbae
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-ca52-4dfff3c1b788
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-dfe4-fccc9c5ed37e
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1d62-ce0796b2910f
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1426-e53e7da37ba5
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-4c9e-ac1d1a6e95e7
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-39c7-33149f43f21b
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-d03d-9af9c8cbc9e8
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-1506-22f3d34a6e9d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-ecd5-3ff235192675
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-000f-c472fab5f60f
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-e74d-b566ea9cafb2
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-cd4e-de3caf817d81
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-2d81-f1f661d2394d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7bb3-d0f45dc68181
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7e11-c9f3bb6bf37a
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-de23-a3d221e39502
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b703-0269cf0f615d
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-bc01-4aa4ff555eb6
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-7065-5c30d0882442
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f5d0-536d62dd1892
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-5f68-0212e60371f8
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-0b0c-3a12f3983b23
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-62b2-754e43932c79
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-839b-b450ef570ac0
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-b120-cffbe37bc251
00020000-564e-ea9d-cc25-bc874be607d0	00030000-564e-ea9c-f769-1104c90aaee6
00020000-564e-ea9d-78e2-cb01a4acce19	00030000-564e-ea9c-b703-0269cf0f615d
00020000-564e-ea9d-5524-fbb0ade7d1d4	00030000-564e-ea9c-bc01-4aa4ff555eb6
00020000-564e-ea9d-333d-2427fbc14042	00030000-564e-ea9c-39c7-33149f43f21b
00020000-564e-ea9d-7686-0e4ae1f268e1	00030000-564e-ea9c-4c9e-ac1d1a6e95e7
00020000-564e-ea9d-370e-be491ab07f76	00030000-564e-ea9c-1274-342e7cd7dd2b
00020000-564e-ea9d-7dab-7edce0e603ba	00030000-564e-ea9c-bb9f-bba878b5d389
00020000-564e-ea9d-a2de-210f49297918	00030000-564e-ea9c-e8ac-a726d6b2e2d4
00020000-564e-ea9d-848e-2ed47b1d1fae	00030000-564e-ea9c-00e7-cecad30cb755
00020000-564e-ea9d-8caa-5bbc63522684	00030000-564e-ea9c-7423-dda041726534
00020000-564e-ea9d-9726-faa70f95be14	00030000-564e-ea9c-22a8-d709d4371030
00020000-564e-ea9d-092b-f7de73a7f3ca	00030000-564e-ea9c-7e11-c9f3bb6bf37a
00020000-564e-ea9d-c961-1bd22e19003d	00030000-564e-ea9c-de23-a3d221e39502
00020000-564e-ea9d-78a0-9016afbe9b8e	00030000-564e-ea9c-b911-6a2505fb1360
00020000-564e-ea9d-f333-9140ea8d32be	00030000-564e-ea9c-b9da-8478a6546731
00020000-564e-ea9d-0bc2-084b3aadaea2	00030000-564e-ea9c-c663-95c04996dd2d
00020000-564e-ea9d-a483-869960d47fd0	00030000-564e-ea9c-0826-9d9079fd9879
00020000-564e-ea9d-f43f-331f69be88f5	00030000-564e-ea9c-7acc-f25aee726e03
00020000-564e-ea9d-f43f-331f69be88f5	00030000-564e-ea9c-d566-6bddb3e6d348
00020000-564e-ea9d-f43f-331f69be88f5	00030000-564e-ea9c-4c9e-ac1d1a6e95e7
\.


--
-- TOC entry 3139 (class 0 OID 28686461)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 28686495)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 28686632)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-564e-ea9e-8b24-6d70504f7190	00090000-564e-ea9e-a3ef-086a08c04994	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-564e-ea9e-2c64-451fe51fcc8c	00090000-564e-ea9e-9835-9bd24d8ef98f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-564e-ea9e-2fc3-997dd0750971	00090000-564e-ea9e-c3cd-f318f02d0da0	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-564e-ea9e-f69e-499abef933fa	00090000-564e-ea9e-a131-c14bbcc967c9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 28686153)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-564e-ea9e-8f17-36b11fd9fa50	\N	00040000-564e-ea9b-f399-f70ca820c06e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564e-ea9e-5dfe-d93cbaf3c010	\N	00040000-564e-ea9b-f399-f70ca820c06e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-564e-ea9e-d3d0-eb336f6b5283	\N	00040000-564e-ea9b-f399-f70ca820c06e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564e-ea9e-43fa-963c23b98996	\N	00040000-564e-ea9b-f399-f70ca820c06e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564e-ea9e-c904-011eaed477c5	\N	00040000-564e-ea9b-f399-f70ca820c06e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564e-ea9e-9979-06a87e9f0e59	\N	00040000-564e-ea9b-9fbb-9e8a2c431041	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564e-ea9e-7d55-e9bdc57dd975	\N	00040000-564e-ea9b-cd5a-94522550e416	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564e-ea9e-5b19-1cffa28124f1	\N	00040000-564e-ea9b-a84f-b64c8efc879b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564e-ea9e-7d61-e674d06837dc	\N	00040000-564e-ea9b-d929-310e74899d3b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564e-ea9f-bb4c-4c48c099ec41	\N	00040000-564e-ea9b-f399-f70ca820c06e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 28686198)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-564e-ea9b-6aa3-1c03cc143e68	8341	Adlešiči
00050000-564e-ea9b-3c49-f8f11c81b876	5270	Ajdovščina
00050000-564e-ea9b-ba04-2396669d120a	6280	Ankaran/Ancarano
00050000-564e-ea9b-f20a-c0d05e249a6c	9253	Apače
00050000-564e-ea9b-ce4e-daafd33abb9f	8253	Artiče
00050000-564e-ea9b-7224-791d2c9bc074	4275	Begunje na Gorenjskem
00050000-564e-ea9b-c239-920537a469d9	1382	Begunje pri Cerknici
00050000-564e-ea9b-7d05-5e4fd6b16931	9231	Beltinci
00050000-564e-ea9b-9c8b-ac21b26d8ffa	2234	Benedikt
00050000-564e-ea9b-2cb8-4a275fef1ae2	2345	Bistrica ob Dravi
00050000-564e-ea9b-6481-93d27b9314d6	3256	Bistrica ob Sotli
00050000-564e-ea9b-ab2e-dcfd95fe7b2f	8259	Bizeljsko
00050000-564e-ea9b-c67e-ac0e9b73d97e	1223	Blagovica
00050000-564e-ea9b-9d5f-ca58f41bba28	8283	Blanca
00050000-564e-ea9b-0811-38d2de1e8a2e	4260	Bled
00050000-564e-ea9b-eaf2-9ce4a26ff498	4273	Blejska Dobrava
00050000-564e-ea9b-84da-84c2c088f1ae	9265	Bodonci
00050000-564e-ea9b-8fcc-f3dd25ac3f19	9222	Bogojina
00050000-564e-ea9b-634f-0dbb953d7d74	4263	Bohinjska Bela
00050000-564e-ea9b-b89e-5050519f10f3	4264	Bohinjska Bistrica
00050000-564e-ea9b-3650-2453f04be822	4265	Bohinjsko jezero
00050000-564e-ea9b-e935-ae1bacdd1a44	1353	Borovnica
00050000-564e-ea9b-f25d-b67322d2ca5c	8294	Boštanj
00050000-564e-ea9b-697c-8888435552a7	5230	Bovec
00050000-564e-ea9b-28e3-7ee342f66eb2	5295	Branik
00050000-564e-ea9b-9948-0a2a5897c761	3314	Braslovče
00050000-564e-ea9b-ae85-30461c5e84ce	5223	Breginj
00050000-564e-ea9b-3cd2-61609d7671d6	8280	Brestanica
00050000-564e-ea9b-45b2-538ac08fd603	2354	Bresternica
00050000-564e-ea9b-6c5b-125f342364a0	4243	Brezje
00050000-564e-ea9b-d968-96bf03438b3b	1351	Brezovica pri Ljubljani
00050000-564e-ea9b-eb32-054197af2372	8250	Brežice
00050000-564e-ea9b-319b-15bac6508f5d	4210	Brnik - Aerodrom
00050000-564e-ea9b-b4ad-ca0bf9ee4f73	8321	Brusnice
00050000-564e-ea9b-f740-45a107908af7	3255	Buče
00050000-564e-ea9b-ac13-8847479e01c2	8276	Bučka 
00050000-564e-ea9b-66cd-5576198b42a0	9261	Cankova
00050000-564e-ea9b-77ac-7f1c849adde8	3000	Celje 
00050000-564e-ea9b-0c89-9a501fcdb2aa	3001	Celje - poštni predali
00050000-564e-ea9b-292d-127b341098a0	4207	Cerklje na Gorenjskem
00050000-564e-ea9b-6f25-e0052a8dda14	8263	Cerklje ob Krki
00050000-564e-ea9b-928b-5a04eb4eaeed	1380	Cerknica
00050000-564e-ea9b-698e-56ad6706c25e	5282	Cerkno
00050000-564e-ea9b-08eb-bf1e1327c52d	2236	Cerkvenjak
00050000-564e-ea9b-d96d-a78953958d7d	2215	Ceršak
00050000-564e-ea9b-7b84-c0ac74705600	2326	Cirkovce
00050000-564e-ea9b-9fdc-664aa5314ea8	2282	Cirkulane
00050000-564e-ea9b-c893-4b473b8bf671	5273	Col
00050000-564e-ea9b-a6c3-7d709cba0aaf	8251	Čatež ob Savi
00050000-564e-ea9b-c909-12e3b88ad295	1413	Čemšenik
00050000-564e-ea9b-60a6-5a9fb3ad6992	5253	Čepovan
00050000-564e-ea9b-fa37-345847138e79	9232	Črenšovci
00050000-564e-ea9b-2c4b-0bbb1f7c86f4	2393	Črna na Koroškem
00050000-564e-ea9b-6a31-c2bab9819ab8	6275	Črni Kal
00050000-564e-ea9b-0b27-95e17cc781c1	5274	Črni Vrh nad Idrijo
00050000-564e-ea9b-c181-483ceece1628	5262	Črniče
00050000-564e-ea9b-46c3-cc9ff923d080	8340	Črnomelj
00050000-564e-ea9b-e719-79fd284e4b5b	6271	Dekani
00050000-564e-ea9b-0e4a-6789be3adf06	5210	Deskle
00050000-564e-ea9b-a9e7-c88066861bb7	2253	Destrnik
00050000-564e-ea9b-9d48-8f65ab4450af	6215	Divača
00050000-564e-ea9b-a110-6103b93e94e8	1233	Dob
00050000-564e-ea9b-ecbf-85eb3a775d6d	3224	Dobje pri Planini
00050000-564e-ea9b-3aca-368cb2f21b20	8257	Dobova
00050000-564e-ea9b-30dc-e2d17166be86	1423	Dobovec
00050000-564e-ea9b-db61-40e5298b7150	5263	Dobravlje
00050000-564e-ea9b-6544-1157e7e58306	3204	Dobrna
00050000-564e-ea9b-bb4e-4ec18e54f1d2	8211	Dobrnič
00050000-564e-ea9b-d73a-c543ff0d1b41	1356	Dobrova
00050000-564e-ea9b-d3d2-42e5e3cd1312	9223	Dobrovnik/Dobronak 
00050000-564e-ea9b-7b92-03ac4ff1041a	5212	Dobrovo v Brdih
00050000-564e-ea9b-8750-cc387dcfb589	1431	Dol pri Hrastniku
00050000-564e-ea9b-a0a0-e5fdff029725	1262	Dol pri Ljubljani
00050000-564e-ea9b-951d-090595f5947b	1273	Dole pri Litiji
00050000-564e-ea9b-661e-733dd624e734	1331	Dolenja vas
00050000-564e-ea9b-968b-0e54dc00a6ed	8350	Dolenjske Toplice
00050000-564e-ea9b-b321-b216f58d79b7	1230	Domžale
00050000-564e-ea9b-f7f3-40332680eb3a	2252	Dornava
00050000-564e-ea9b-0b40-c3f2aaf266a5	5294	Dornberk
00050000-564e-ea9b-0beb-2a240c0d8fa3	1319	Draga
00050000-564e-ea9b-b3c6-643099b9f0d1	8343	Dragatuš
00050000-564e-ea9b-5c85-fdbfb88e899e	3222	Dramlje
00050000-564e-ea9b-6c7d-7b8387fb8fc0	2370	Dravograd
00050000-564e-ea9b-ab5a-1fc2e51b4acf	4203	Duplje
00050000-564e-ea9b-d8bb-f20a52cfad7a	6221	Dutovlje
00050000-564e-ea9b-17f0-655e72df08b4	8361	Dvor
00050000-564e-ea9b-80c9-87d641f8b13e	2343	Fala
00050000-564e-ea9b-6f5f-ab8ad8975b3a	9208	Fokovci
00050000-564e-ea9b-d8cc-361be07fe411	2313	Fram
00050000-564e-ea9b-8b56-4f14f74373e3	3213	Frankolovo
00050000-564e-ea9b-1cff-eb7e9f83f1ca	1274	Gabrovka
00050000-564e-ea9b-460b-a5165c4df1ce	8254	Globoko
00050000-564e-ea9b-4e07-12f378f3c35c	5275	Godovič
00050000-564e-ea9b-72cc-dec5538b043e	4204	Golnik
00050000-564e-ea9b-35a5-f1b444b68002	3303	Gomilsko
00050000-564e-ea9b-80c3-ee270b810ff4	4224	Gorenja vas
00050000-564e-ea9b-57c6-07986411660b	3263	Gorica pri Slivnici
00050000-564e-ea9b-280f-0a8bef218570	2272	Gorišnica
00050000-564e-ea9b-5a84-bc0892e45c5e	9250	Gornja Radgona
00050000-564e-ea9b-8283-bfb00744e7cd	3342	Gornji Grad
00050000-564e-ea9b-68bf-deb235a55ccd	4282	Gozd Martuljek
00050000-564e-ea9b-2452-933064f00740	6272	Gračišče
00050000-564e-ea9b-b818-85e79f6c97b8	9264	Grad
00050000-564e-ea9b-0bde-74962e9ba26b	8332	Gradac
00050000-564e-ea9b-feaa-2fd80e57f2d4	1384	Grahovo
00050000-564e-ea9b-7573-e272ff224d55	5242	Grahovo ob Bači
00050000-564e-ea9b-1781-52898a019e12	5251	Grgar
00050000-564e-ea9b-c44c-79d08c1a71a7	3302	Griže
00050000-564e-ea9b-e7a6-878e6d4a4964	3231	Grobelno
00050000-564e-ea9b-8bca-c6d03e84057e	1290	Grosuplje
00050000-564e-ea9b-f001-0ffd89c39575	2288	Hajdina
00050000-564e-ea9b-11e3-3d2a39cef71b	8362	Hinje
00050000-564e-ea9b-6271-7f6d78eb24d1	2311	Hoče
00050000-564e-ea9b-af4e-81af9ed2539d	9205	Hodoš/Hodos
00050000-564e-ea9b-1e33-54eb63055b80	1354	Horjul
00050000-564e-ea9b-07eb-4ddc8ff11c25	1372	Hotedršica
00050000-564e-ea9b-5fb5-9441d95d6a90	1430	Hrastnik
00050000-564e-ea9b-cf4b-4b2cf9ee0745	6225	Hruševje
00050000-564e-ea9b-927a-ccde3fe71364	4276	Hrušica
00050000-564e-ea9b-9852-fb29050cf0b4	5280	Idrija
00050000-564e-ea9b-70d8-bd1b5da72bff	1292	Ig
00050000-564e-ea9b-1aa7-b0b2f8fb977d	6250	Ilirska Bistrica
00050000-564e-ea9b-d100-6e3ddf3f378e	6251	Ilirska Bistrica-Trnovo
00050000-564e-ea9b-3ce6-cacf96ad8cf3	1295	Ivančna Gorica
00050000-564e-ea9b-d178-c2e5bdfca688	2259	Ivanjkovci
00050000-564e-ea9b-2508-a560ca0ff178	1411	Izlake
00050000-564e-ea9b-8f86-bebd2eaf8868	6310	Izola/Isola
00050000-564e-ea9b-970f-3112a2ac5a7d	2222	Jakobski Dol
00050000-564e-ea9b-f611-026da4eb44b1	2221	Jarenina
00050000-564e-ea9b-c409-35d8cfcc4aa0	6254	Jelšane
00050000-564e-ea9b-2f75-30c21bf8c642	4270	Jesenice
00050000-564e-ea9b-9d26-99dd69dc4b6e	8261	Jesenice na Dolenjskem
00050000-564e-ea9b-d3e9-6795fe219b77	3273	Jurklošter
00050000-564e-ea9b-a39a-e37558513875	2223	Jurovski Dol
00050000-564e-ea9b-79ff-0bbd5b8b94a5	2256	Juršinci
00050000-564e-ea9b-c87a-eede94d7a4c1	5214	Kal nad Kanalom
00050000-564e-ea9b-e4f9-00d1ccba9319	3233	Kalobje
00050000-564e-ea9b-bbf0-90dbe7a40330	4246	Kamna Gorica
00050000-564e-ea9b-f800-7ce34680b23d	2351	Kamnica
00050000-564e-ea9b-6400-8d96b6e6ff65	1241	Kamnik
00050000-564e-ea9b-4e6e-20fe9d5cc5d6	5213	Kanal
00050000-564e-ea9b-0d95-9359ec9518d8	8258	Kapele
00050000-564e-ea9b-6e7d-94593e8cba80	2362	Kapla
00050000-564e-ea9b-219f-76afb8673cad	2325	Kidričevo
00050000-564e-ea9b-cffd-83da8c6f5e38	1412	Kisovec
00050000-564e-ea9b-2890-06a016eadb32	6253	Knežak
00050000-564e-ea9b-536d-af4b1b9c52ca	5222	Kobarid
00050000-564e-ea9b-e91d-dfa1b26e67fc	9227	Kobilje
00050000-564e-ea9b-4f60-ce274fa4eefe	1330	Kočevje
00050000-564e-ea9b-2f1d-8f091d065276	1338	Kočevska Reka
00050000-564e-ea9b-e090-0b7354915f0b	2276	Kog
00050000-564e-ea9b-acf2-4db65f1b31b6	5211	Kojsko
00050000-564e-ea9b-a4d1-4179c6c37e0c	6223	Komen
00050000-564e-ea9b-7348-0c55f352386c	1218	Komenda
00050000-564e-ea9b-2da1-871c6d0c9f38	6000	Koper/Capodistria 
00050000-564e-ea9b-4949-3d8b9c670a0f	6001	Koper/Capodistria - poštni predali
00050000-564e-ea9b-78a7-21f6ddb6a9cf	8282	Koprivnica
00050000-564e-ea9b-3ca1-abc73802d231	5296	Kostanjevica na Krasu
00050000-564e-ea9b-5660-16fcc48a56b7	8311	Kostanjevica na Krki
00050000-564e-ea9b-39b7-2fe00a7ee8f7	1336	Kostel
00050000-564e-ea9b-88fe-2bcd1ea01491	6256	Košana
00050000-564e-ea9b-26b1-3e943e8bb44e	2394	Kotlje
00050000-564e-ea9b-e741-1601f14b997f	6240	Kozina
00050000-564e-ea9b-222e-c0eab27aa374	3260	Kozje
00050000-564e-ea9b-ee89-9eac92814c78	4000	Kranj 
00050000-564e-ea9b-c2ff-be5acd93437f	4001	Kranj - poštni predali
00050000-564e-ea9b-50a7-e736ef98ab39	4280	Kranjska Gora
00050000-564e-ea9b-7617-f2d4b474bc7e	1281	Kresnice
00050000-564e-ea9b-3f6c-5189b10425c0	4294	Križe
00050000-564e-ea9b-a00f-2d914d3b972b	9206	Križevci
00050000-564e-ea9b-628c-23e564271b97	9242	Križevci pri Ljutomeru
00050000-564e-ea9b-74eb-fcd25d67f3b7	1301	Krka
00050000-564e-ea9b-d588-25d44df08923	8296	Krmelj
00050000-564e-ea9b-a1fd-54433948bd5a	4245	Kropa
00050000-564e-ea9b-e025-470766e37c37	8262	Krška vas
00050000-564e-ea9b-3aa9-cffe8eb3847f	8270	Krško
00050000-564e-ea9b-317b-eb665e6c58c9	9263	Kuzma
00050000-564e-ea9b-3423-29546f45d746	2318	Laporje
00050000-564e-ea9b-2001-5d9d43061350	3270	Laško
00050000-564e-ea9b-c07b-c66ad1c859f2	1219	Laze v Tuhinju
00050000-564e-ea9b-f3f7-f9fa47a4df0d	2230	Lenart v Slovenskih goricah
00050000-564e-ea9b-d5bc-a3e0fe000a34	9220	Lendava/Lendva
00050000-564e-ea9b-50fc-c171eaedf4f1	4248	Lesce
00050000-564e-ea9b-808c-5e49920aee22	3261	Lesično
00050000-564e-ea9b-75b3-12ce573bca06	8273	Leskovec pri Krškem
00050000-564e-ea9b-c652-7026a38d4e59	2372	Libeliče
00050000-564e-ea9b-136d-c6a96f404956	2341	Limbuš
00050000-564e-ea9b-9593-c46623ea69a8	1270	Litija
00050000-564e-ea9b-8514-fb31034e1eb5	3202	Ljubečna
00050000-564e-ea9b-2185-4d7badd71aa9	1000	Ljubljana 
00050000-564e-ea9b-3a93-e53d91821807	1001	Ljubljana - poštni predali
00050000-564e-ea9b-daa5-a5577a65934e	1231	Ljubljana - Črnuče
00050000-564e-ea9b-98e9-150dd26974d3	1261	Ljubljana - Dobrunje
00050000-564e-ea9b-d429-7bff03021f6a	1260	Ljubljana - Polje
00050000-564e-ea9b-5058-c8c5e48a860c	1210	Ljubljana - Šentvid
00050000-564e-ea9b-802e-2f1c820c0713	1211	Ljubljana - Šmartno
00050000-564e-ea9b-a8c0-83fe981627e6	3333	Ljubno ob Savinji
00050000-564e-ea9b-5abe-53a36bc7ee9c	9240	Ljutomer
00050000-564e-ea9b-9771-1078fc24c4f5	3215	Loče
00050000-564e-ea9b-7fee-db0f90a4c4c5	5231	Log pod Mangartom
00050000-564e-ea9b-0451-e23a959d0c9f	1358	Log pri Brezovici
00050000-564e-ea9b-8b52-d2979505c9f8	1370	Logatec
00050000-564e-ea9b-92a0-827ff258d067	1371	Logatec
00050000-564e-ea9b-2ef0-bc22ad37b489	1434	Loka pri Zidanem Mostu
00050000-564e-ea9b-8465-be5768903f19	3223	Loka pri Žusmu
00050000-564e-ea9b-7e59-10f44e3ed3de	6219	Lokev
00050000-564e-ea9b-2363-b5e3fa82a8f7	1318	Loški Potok
00050000-564e-ea9b-2d84-97bbae2b9596	2324	Lovrenc na Dravskem polju
00050000-564e-ea9b-3f93-005faee00e63	2344	Lovrenc na Pohorju
00050000-564e-ea9b-50d1-3092ffe8d2ed	3334	Luče
00050000-564e-ea9b-adb1-45a908d7ffbe	1225	Lukovica
00050000-564e-ea9b-856b-7c920a4fc245	9202	Mačkovci
00050000-564e-ea9b-fd04-4ec611343cdc	2322	Majšperk
00050000-564e-ea9b-97d8-82e4552400d0	2321	Makole
00050000-564e-ea9b-ecf3-e52ed554ff7a	9243	Mala Nedelja
00050000-564e-ea9b-f9e6-2a7e16a16dc3	2229	Malečnik
00050000-564e-ea9b-b610-ccea2fd52e58	6273	Marezige
00050000-564e-ea9b-b89e-30a9bc142a92	2000	Maribor 
00050000-564e-ea9b-c7d5-2bea19f5a739	2001	Maribor - poštni predali
00050000-564e-ea9b-f3ee-de1a35ce2cbc	2206	Marjeta na Dravskem polju
00050000-564e-ea9b-f266-1dd8fd244a3c	2281	Markovci
00050000-564e-ea9b-22ed-ba813d2824a5	9221	Martjanci
00050000-564e-ea9b-48d8-fd594f98c7f5	6242	Materija
00050000-564e-ea9b-63e7-477f531ac070	4211	Mavčiče
00050000-564e-ea9b-c02d-5a42c31201e0	1215	Medvode
00050000-564e-ea9b-4f79-b3993db1688a	1234	Mengeš
00050000-564e-ea9b-43b3-063362a04fa3	8330	Metlika
00050000-564e-ea9b-bf00-382d2014b309	2392	Mežica
00050000-564e-ea9b-9cd9-1d971218db64	2204	Miklavž na Dravskem polju
00050000-564e-ea9b-fada-ac2e4374a7c0	2275	Miklavž pri Ormožu
00050000-564e-ea9b-966b-d5d42e6f888c	5291	Miren
00050000-564e-ea9b-84ef-6b1cac1073f0	8233	Mirna
00050000-564e-ea9b-308a-0a936424cf2f	8216	Mirna Peč
00050000-564e-ea9b-2ca6-9ee16f63eb91	2382	Mislinja
00050000-564e-ea9b-b94f-9156b1f30f47	4281	Mojstrana
00050000-564e-ea9b-8e1d-eeb35dc22a65	8230	Mokronog
00050000-564e-ea9b-6ed5-e316e3a9e0b0	1251	Moravče
00050000-564e-ea9b-bc87-e0798e83f89e	9226	Moravske Toplice
00050000-564e-ea9b-15cd-9d95503d544b	5216	Most na Soči
00050000-564e-ea9b-77c6-1ed4ea8aceea	1221	Motnik
00050000-564e-ea9b-1df6-7bda29f0e1a6	3330	Mozirje
00050000-564e-ea9b-4b93-f329b0fc2236	9000	Murska Sobota 
00050000-564e-ea9b-1019-fbe12710cfb0	9001	Murska Sobota - poštni predali
00050000-564e-ea9b-ae97-49234b2d32f7	2366	Muta
00050000-564e-ea9b-f13a-2302da6e3702	4202	Naklo
00050000-564e-ea9b-5e53-b263cb3e7fd9	3331	Nazarje
00050000-564e-ea9b-be41-a91005937654	1357	Notranje Gorice
00050000-564e-ea9b-41c6-8e7bac1e9cbd	3203	Nova Cerkev
00050000-564e-ea9b-75bd-2920f6bd04c1	5000	Nova Gorica 
00050000-564e-ea9b-5eb0-981a79b3a0c7	5001	Nova Gorica - poštni predali
00050000-564e-ea9b-a21f-6d1e5e8f8f20	1385	Nova vas
00050000-564e-ea9b-11fa-24ef1c6737f2	8000	Novo mesto
00050000-564e-ea9b-854c-26b016370c2b	8001	Novo mesto - poštni predali
00050000-564e-ea9b-d2b3-7cdf92b47c97	6243	Obrov
00050000-564e-ea9b-ed39-8d9d9131be18	9233	Odranci
00050000-564e-ea9b-1c07-528356a54df3	2317	Oplotnica
00050000-564e-ea9b-ebf0-7f73fa3e61ba	2312	Orehova vas
00050000-564e-ea9b-d902-c42d62fda31e	2270	Ormož
00050000-564e-ea9b-9b10-ad5fbc2a422d	1316	Ortnek
00050000-564e-ea9b-d7fa-5957407918c0	1337	Osilnica
00050000-564e-ea9b-0417-82d8b37e06ca	8222	Otočec
00050000-564e-ea9b-5d28-04ee98aa175b	2361	Ožbalt
00050000-564e-ea9b-b339-53df571bcaae	2231	Pernica
00050000-564e-ea9b-b408-112ef937d3a0	2211	Pesnica pri Mariboru
00050000-564e-ea9b-f179-b5cbe92c00cf	9203	Petrovci
00050000-564e-ea9b-adab-1f2968ec5b8e	3301	Petrovče
00050000-564e-ea9b-e0ee-85e05a3c8904	6330	Piran/Pirano
00050000-564e-ea9b-c40b-161fddde88bf	8255	Pišece
00050000-564e-ea9b-a4c0-971407f1bfd7	6257	Pivka
00050000-564e-ea9b-6093-04f9e0e32c9b	6232	Planina
00050000-564e-ea9b-f0bd-ac6741978550	3225	Planina pri Sevnici
00050000-564e-ea9b-7417-0d5ec244f8ff	6276	Pobegi
00050000-564e-ea9b-7916-cc8b43e79a6d	8312	Podbočje
00050000-564e-ea9b-c094-043b62314b50	5243	Podbrdo
00050000-564e-ea9b-da3d-40a379f50a68	3254	Podčetrtek
00050000-564e-ea9b-3229-808a587a8156	2273	Podgorci
00050000-564e-ea9b-7086-06874ec733a8	6216	Podgorje
00050000-564e-ea9b-f2d1-abf0cb6b02d0	2381	Podgorje pri Slovenj Gradcu
00050000-564e-ea9b-ec39-b1fce7f5775d	6244	Podgrad
00050000-564e-ea9b-f6e9-ac5a733f02ca	1414	Podkum
00050000-564e-ea9b-a05a-04e843df2f62	2286	Podlehnik
00050000-564e-ea9b-4e05-cd083f18bad4	5272	Podnanos
00050000-564e-ea9b-7a94-b638bb5df27e	4244	Podnart
00050000-564e-ea9b-dc01-da4241435397	3241	Podplat
00050000-564e-ea9b-6fce-f9e46c518848	3257	Podsreda
00050000-564e-ea9b-cac3-d60c981c68f6	2363	Podvelka
00050000-564e-ea9b-fac1-eaef4ca77888	2208	Pohorje
00050000-564e-ea9b-f433-5a25610eb12b	2257	Polenšak
00050000-564e-ea9b-5ee0-6957a4abdae2	1355	Polhov Gradec
00050000-564e-ea9b-3ab9-0a1fbb5f8e48	4223	Poljane nad Škofjo Loko
00050000-564e-ea9b-8fea-47b46f17a0e7	2319	Poljčane
00050000-564e-ea9b-6153-52183ff1054e	1272	Polšnik
00050000-564e-ea9b-1728-b73c577f11b5	3313	Polzela
00050000-564e-ea9b-48e1-6daf9fa0106a	3232	Ponikva
00050000-564e-ea9b-c603-3798e680d391	6320	Portorož/Portorose
00050000-564e-ea9b-204b-6844ae7917d7	6230	Postojna
00050000-564e-ea9b-1ed1-c872f44f9a75	2331	Pragersko
00050000-564e-ea9b-abf2-548400f1a547	3312	Prebold
00050000-564e-ea9b-afb7-58cd0a55bc22	4205	Preddvor
00050000-564e-ea9b-6147-2a6b61fc59ef	6255	Prem
00050000-564e-ea9b-6b39-371c046b36f9	1352	Preserje
00050000-564e-ea9b-0ff7-55478e3a8af9	6258	Prestranek
00050000-564e-ea9b-36fe-3f723959ca44	2391	Prevalje
00050000-564e-ea9b-8346-fb2c620a9c5d	3262	Prevorje
00050000-564e-ea9b-5a35-bcf45b12e346	1276	Primskovo 
00050000-564e-ea9b-da87-be0fb2aa1367	3253	Pristava pri Mestinju
00050000-564e-ea9b-df97-fa2fb71539c9	9207	Prosenjakovci/Partosfalva
00050000-564e-ea9b-e2f4-eef81bd4e1fe	5297	Prvačina
00050000-564e-ea9b-e53c-45a0978581ee	2250	Ptuj
00050000-564e-ea9b-d184-24e59efd10b0	2323	Ptujska Gora
00050000-564e-ea9b-1cb0-0ea924e14d05	9201	Puconci
00050000-564e-ea9b-8b09-8de14edf661c	2327	Rače
00050000-564e-ea9b-d73a-ca1479598fd5	1433	Radeče
00050000-564e-ea9b-69b3-ffae9425be5d	9252	Radenci
00050000-564e-ea9b-dc1b-4b1e6795d0b7	2360	Radlje ob Dravi
00050000-564e-ea9b-f18c-87e92469617b	1235	Radomlje
00050000-564e-ea9b-eaab-6f4406339325	4240	Radovljica
00050000-564e-ea9b-9dc9-95e22c3aee37	8274	Raka
00050000-564e-ea9b-059f-e7d4da063590	1381	Rakek
00050000-564e-ea9b-9dd2-8bbb1b5c5c85	4283	Rateče - Planica
00050000-564e-ea9b-0cbf-d9b3b488ebed	2390	Ravne na Koroškem
00050000-564e-ea9b-64df-b0fcdbe0e573	9246	Razkrižje
00050000-564e-ea9b-d006-9e6c118cea0b	3332	Rečica ob Savinji
00050000-564e-ea9b-d8e9-b155426ffa2c	5292	Renče
00050000-564e-ea9b-8146-e5871b588db8	1310	Ribnica
00050000-564e-ea9b-5eda-67f3584c6407	2364	Ribnica na Pohorju
00050000-564e-ea9b-386f-67ea024019fe	3272	Rimske Toplice
00050000-564e-ea9b-9d4a-a182797f0505	1314	Rob
00050000-564e-ea9b-87b9-b7f248884a29	5215	Ročinj
00050000-564e-ea9b-615c-1d3b2db0eac4	3250	Rogaška Slatina
00050000-564e-ea9b-0f5a-2213d8c99363	9262	Rogašovci
00050000-564e-ea9b-3993-e5cbbd92144f	3252	Rogatec
00050000-564e-ea9b-1ec9-7d3f3fc736b1	1373	Rovte
00050000-564e-ea9b-47b2-30a7ddaf1a2b	2342	Ruše
00050000-564e-ea9b-2cb2-a5429f86229c	1282	Sava
00050000-564e-ea9b-6ea9-33a0edef8ace	6333	Sečovlje/Sicciole
00050000-564e-ea9b-9a7c-b5271f7fb63f	4227	Selca
00050000-564e-ea9b-b231-c3b46699e3e3	2352	Selnica ob Dravi
00050000-564e-ea9b-da02-8c19e5bacd19	8333	Semič
00050000-564e-ea9b-37c5-9a54d39f5333	8281	Senovo
00050000-564e-ea9b-41aa-f92f2afba6d5	6224	Senožeče
00050000-564e-ea9b-4ef5-d13775256c75	8290	Sevnica
00050000-564e-ea9b-e7bc-4aad765d973f	6210	Sežana
00050000-564e-ea9b-64b2-3ba6aa0157f3	2214	Sladki Vrh
00050000-564e-ea9b-8807-8a653bef2289	5283	Slap ob Idrijci
00050000-564e-ea9b-4373-5a888d813463	2380	Slovenj Gradec
00050000-564e-ea9b-c6e3-625f67a652d6	2310	Slovenska Bistrica
00050000-564e-ea9b-a01f-3fda3664efce	3210	Slovenske Konjice
00050000-564e-ea9b-cc20-95f20c480ecc	1216	Smlednik
00050000-564e-ea9b-ec85-ee613c7ed7de	5232	Soča
00050000-564e-ea9b-7d10-25a2aed8acaf	1317	Sodražica
00050000-564e-ea9b-66a6-10490073e0b8	3335	Solčava
00050000-564e-ea9b-5f99-768ad2664a50	5250	Solkan
00050000-564e-ea9b-a02c-f89bacc23972	4229	Sorica
00050000-564e-ea9b-d1f2-412850ad2e0c	4225	Sovodenj
00050000-564e-ea9b-8ce9-adc08deae08f	5281	Spodnja Idrija
00050000-564e-ea9b-82b1-1f7268c8f2b1	2241	Spodnji Duplek
00050000-564e-ea9b-5a9b-021fd1f9a1bf	9245	Spodnji Ivanjci
00050000-564e-ea9b-744c-3938c665b06e	2277	Središče ob Dravi
00050000-564e-ea9b-47d6-9faf46cb19ed	4267	Srednja vas v Bohinju
00050000-564e-ea9b-0b6b-de4408788d5c	8256	Sromlje 
00050000-564e-ea9b-8137-ceb583cace23	5224	Srpenica
00050000-564e-ea9b-100b-773753704570	1242	Stahovica
00050000-564e-ea9b-c878-fade199d6529	1332	Stara Cerkev
00050000-564e-ea9b-89c5-e514954021e8	8342	Stari trg ob Kolpi
00050000-564e-ea9b-24c7-81d0aed97653	1386	Stari trg pri Ložu
00050000-564e-ea9b-edf3-3e08cd8312ae	2205	Starše
00050000-564e-ea9b-8db6-4f5e370fa463	2289	Stoperce
00050000-564e-ea9b-a5a9-3e53ea9544d7	8322	Stopiče
00050000-564e-ea9b-8daf-c04b3b195809	3206	Stranice
00050000-564e-ea9b-b3bd-ef0689fc9c9d	8351	Straža
00050000-564e-ea9b-985b-aac346c49c3e	1313	Struge
00050000-564e-ea9b-af79-d30338104bc7	8293	Studenec
00050000-564e-ea9b-67c4-498b7a77a67b	8331	Suhor
00050000-564e-ea9b-8100-fa7e808bcb22	2233	Sv. Ana v Slovenskih goricah
00050000-564e-ea9b-3a7d-77f97a196e56	2235	Sv. Trojica v Slovenskih goricah
00050000-564e-ea9b-334d-c30151ae2ff5	2353	Sveti Duh na Ostrem Vrhu
00050000-564e-ea9b-a8c0-87f3da379587	9244	Sveti Jurij ob Ščavnici
00050000-564e-ea9b-38fb-5d5bdef1f84b	3264	Sveti Štefan
00050000-564e-ea9b-a691-c12203634cd5	2258	Sveti Tomaž
00050000-564e-ea9b-ff47-00581361e639	9204	Šalovci
00050000-564e-ea9b-9f62-bc390b474ec2	5261	Šempas
00050000-564e-ea9b-fa04-ef3b32b4e71d	5290	Šempeter pri Gorici
00050000-564e-ea9b-0219-44be8a140ef0	3311	Šempeter v Savinjski dolini
00050000-564e-ea9b-4c7a-c3d59de09e38	4208	Šenčur
00050000-564e-ea9b-a427-ab12ce6a9bdd	2212	Šentilj v Slovenskih goricah
00050000-564e-ea9b-9bf5-34cccceb21ba	8297	Šentjanž
00050000-564e-ea9b-06d8-da87be80619f	2373	Šentjanž pri Dravogradu
00050000-564e-ea9b-398e-1af87ee3a605	8310	Šentjernej
00050000-564e-ea9b-d69b-6405dc5f8a9d	3230	Šentjur
00050000-564e-ea9b-489a-27f86e20b17b	3271	Šentrupert
00050000-564e-ea9b-0636-1b8301f60db0	8232	Šentrupert
00050000-564e-ea9b-a717-018b1c983f62	1296	Šentvid pri Stični
00050000-564e-ea9b-b9f8-86aa0efe3968	8275	Škocjan
00050000-564e-ea9b-8866-084a66890d07	6281	Škofije
00050000-564e-ea9b-9132-8fb5c8b49642	4220	Škofja Loka
00050000-564e-ea9b-604a-0cb11ca4f1e9	3211	Škofja vas
00050000-564e-ea9b-62d3-9710d96149e0	1291	Škofljica
00050000-564e-ea9b-848b-cd7a93c188c1	6274	Šmarje
00050000-564e-ea9b-40cb-6145aae51ffb	1293	Šmarje - Sap
00050000-564e-ea9b-2fb7-56ac21d889e5	3240	Šmarje pri Jelšah
00050000-564e-ea9b-cda0-6116c1762011	8220	Šmarješke Toplice
00050000-564e-ea9b-bcba-512e7f7a55bc	2315	Šmartno na Pohorju
00050000-564e-ea9b-5b10-876404fee7b2	3341	Šmartno ob Dreti
00050000-564e-ea9b-607a-07ef2ad17a6e	3327	Šmartno ob Paki
00050000-564e-ea9b-024e-6147d7de81e1	1275	Šmartno pri Litiji
00050000-564e-ea9b-c156-e2fb4477e7e8	2383	Šmartno pri Slovenj Gradcu
00050000-564e-ea9b-563f-3ddeec79f9c0	3201	Šmartno v Rožni dolini
00050000-564e-ea9b-38af-820a75102a85	3325	Šoštanj
00050000-564e-ea9b-094a-34b9522d8454	6222	Štanjel
00050000-564e-ea9b-764b-a5233580f032	3220	Štore
00050000-564e-ea9b-5acb-b53393f0c82e	3304	Tabor
00050000-564e-ea9b-18ef-2470b0bb7e03	3221	Teharje
00050000-564e-ea9b-a26a-b4173715a985	9251	Tišina
00050000-564e-ea9b-5a9d-b23c9540311b	5220	Tolmin
00050000-564e-ea9b-09c8-f65d024d8e68	3326	Topolšica
00050000-564e-ea9b-e382-738409c7406b	2371	Trbonje
00050000-564e-ea9b-725a-1ffbd346283f	1420	Trbovlje
00050000-564e-ea9b-8368-018a59c25485	8231	Trebelno 
00050000-564e-ea9b-ab1b-079b9fe6907c	8210	Trebnje
00050000-564e-ea9b-79fd-7f096036485b	5252	Trnovo pri Gorici
00050000-564e-ea9b-4698-a4d8c87350ea	2254	Trnovska vas
00050000-564e-ea9b-af7c-7ed028b9f6b7	1222	Trojane
00050000-564e-ea9b-b711-dadd59aab6e8	1236	Trzin
00050000-564e-ea9b-5112-2b9b11856b44	4290	Tržič
00050000-564e-ea9b-a62d-4a2bce6ffe55	8295	Tržišče
00050000-564e-ea9b-8fe7-6e5f8b134b20	1311	Turjak
00050000-564e-ea9b-c9f3-22c9c72302a7	9224	Turnišče
00050000-564e-ea9b-a0d1-35880ebbdf96	8323	Uršna sela
00050000-564e-ea9b-ac88-a6d2b88d6a60	1252	Vače
00050000-564e-ea9b-8a1e-68b172933c69	3320	Velenje 
00050000-564e-ea9b-d128-1ac30abccc1e	3322	Velenje - poštni predali
00050000-564e-ea9b-6193-12acd04dcd65	8212	Velika Loka
00050000-564e-ea9b-c77e-33be7f315730	2274	Velika Nedelja
00050000-564e-ea9b-1b5d-0f11c895335a	9225	Velika Polana
00050000-564e-ea9b-efcd-1cc1e009e929	1315	Velike Lašče
00050000-564e-ea9b-99e5-4df9ab566f55	8213	Veliki Gaber
00050000-564e-ea9b-6f72-b16effd59ec6	9241	Veržej
00050000-564e-ea9b-c194-67e239d22129	1312	Videm - Dobrepolje
00050000-564e-ea9b-b343-1d157002468d	2284	Videm pri Ptuju
00050000-564e-ea9b-56d3-0a576d09ce6a	8344	Vinica
00050000-564e-ea9b-1a35-05047546c08b	5271	Vipava
00050000-564e-ea9b-cb07-64fbf6fdad12	4212	Visoko
00050000-564e-ea9b-72d6-ef06578e3cd5	1294	Višnja Gora
00050000-564e-ea9b-5004-5349a6d099a4	3205	Vitanje
00050000-564e-ea9b-a56c-7ac08a1626ad	2255	Vitomarci
00050000-564e-ea9b-2d4f-d63212138b42	1217	Vodice
00050000-564e-ea9b-cec2-1688e844ef32	3212	Vojnik\t
00050000-564e-ea9b-34b1-19cd60ed5b5c	5293	Volčja Draga
00050000-564e-ea9b-4123-54391921daa6	2232	Voličina
00050000-564e-ea9b-5c92-6603a6010d61	3305	Vransko
00050000-564e-ea9b-6bdb-7a805844e4ff	6217	Vremski Britof
00050000-564e-ea9b-ff41-2b3ce04ba120	1360	Vrhnika
00050000-564e-ea9b-0f10-ede12a011290	2365	Vuhred
00050000-564e-ea9b-8ca0-fc149555260d	2367	Vuzenica
00050000-564e-ea9b-8359-ddc6bde6f7f1	8292	Zabukovje 
00050000-564e-ea9b-3c02-ea2b364f3fe4	1410	Zagorje ob Savi
00050000-564e-ea9b-a2f0-2f23b9ce93c0	1303	Zagradec
00050000-564e-ea9b-77b3-2d11b342d2db	2283	Zavrč
00050000-564e-ea9b-8162-613a65c548c1	8272	Zdole 
00050000-564e-ea9b-a061-7d1d64ae9a59	4201	Zgornja Besnica
00050000-564e-ea9b-0db3-1f8b5b7c5ac2	2242	Zgornja Korena
00050000-564e-ea9b-d6f0-dc8188b4ff29	2201	Zgornja Kungota
00050000-564e-ea9b-39d1-16248f2a3c3c	2316	Zgornja Ložnica
00050000-564e-ea9b-e6aa-63683dc4d64b	2314	Zgornja Polskava
00050000-564e-ea9b-b2a5-222bb29bc524	2213	Zgornja Velka
00050000-564e-ea9b-4d49-f1052cd6f155	4247	Zgornje Gorje
00050000-564e-ea9b-ad63-efb3d5aab90b	4206	Zgornje Jezersko
00050000-564e-ea9b-c1ae-c5e5f00ce101	2285	Zgornji Leskovec
00050000-564e-ea9b-5b77-9ff2cc629cd9	1432	Zidani Most
00050000-564e-ea9b-a0bb-215e9b8119b8	3214	Zreče
00050000-564e-ea9b-8093-fe332f9d3bce	4209	Žabnica
00050000-564e-ea9b-8cb9-c7abce51e24b	3310	Žalec
00050000-564e-ea9b-49ea-8ddde34e0d2d	4228	Železniki
00050000-564e-ea9b-b80b-1766fc7cc879	2287	Žetale
00050000-564e-ea9b-2258-d06b09ca71d4	4226	Žiri
00050000-564e-ea9b-e0df-81f57a5739ce	4274	Žirovnica
00050000-564e-ea9b-c463-15a8fb6a9f3c	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 28686859)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 28686435)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 28686183)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-564e-ea9e-6fe8-dec08cb3baf1	00080000-564e-ea9e-8f17-36b11fd9fa50	\N	00040000-564e-ea9b-f399-f70ca820c06e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-564e-ea9e-9ef7-35844ee4b9eb	00080000-564e-ea9e-8f17-36b11fd9fa50	\N	00040000-564e-ea9b-f399-f70ca820c06e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-564e-ea9e-f886-b730bfd4fe8a	00080000-564e-ea9e-5dfe-d93cbaf3c010	\N	00040000-564e-ea9b-f399-f70ca820c06e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 28686327)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-564e-ea9b-c761-ebf56bdfa4c6	novo leto	1	1	\N	t
00430000-564e-ea9b-b701-af0c028d2dd5	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-564e-ea9b-7ea6-9433b9a56745	dan upora proti okupatorju	27	4	\N	t
00430000-564e-ea9b-ad9c-48a9edd4bae1	praznik dela	1	5	\N	t
00430000-564e-ea9b-fe08-363b0b130018	praznik dela	2	5	\N	t
00430000-564e-ea9b-c369-c6c3bca6b90d	dan Primoža Trubarja	8	6	\N	f
00430000-564e-ea9b-9f1f-2e14f57145c3	dan državnosti	25	6	\N	t
00430000-564e-ea9b-16dd-c8b85860241e	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-564e-ea9b-0cb4-8b0d64ce779f	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-564e-ea9b-0395-da326807fe56	dan suverenosti	25	10	\N	f
00430000-564e-ea9b-32a5-580a3852309d	dan spomina na mrtve	1	11	\N	t
00430000-564e-ea9b-e9e1-312644b57ab8	dan Rudolfa Maistra	23	11	\N	f
00430000-564e-ea9b-5268-051df5eae2be	božič	25	12	\N	t
00430000-564e-ea9b-94da-fa7eec3c898d	dan samostojnosti in enotnosti	26	12	\N	t
00430000-564e-ea9b-3010-39f3a9c891bf	Marijino vnebovzetje	15	8	\N	t
00430000-564e-ea9b-b8a8-3de3c7e38ef6	dan reformacije	31	10	\N	t
00430000-564e-ea9b-58fa-a58c8033fb66	velikonočna nedelja	27	3	2016	t
00430000-564e-ea9b-054c-db131b0056b7	velikonočna nedelja	16	4	2017	t
00430000-564e-ea9b-3490-b6ca14e583f7	velikonočna nedelja	1	4	2018	t
00430000-564e-ea9b-0754-8efd72928971	velikonočna nedelja	21	4	2019	t
00430000-564e-ea9b-6aa1-8033d210dfac	velikonočna nedelja	12	4	2020	t
00430000-564e-ea9b-11b1-8089218c2682	velikonočna nedelja	4	4	2021	t
00430000-564e-ea9b-19b5-b6b11aab397e	velikonočna nedelja	17	4	2022	t
00430000-564e-ea9b-3f0f-04005a6e9af0	velikonočna nedelja	9	4	2023	t
00430000-564e-ea9b-a362-afdc58896728	velikonočna nedelja	31	3	2024	t
00430000-564e-ea9b-9939-9aebd025f783	velikonočna nedelja	20	4	2025	t
00430000-564e-ea9b-5b85-1801b641e0d6	velikonočna nedelja	5	4	2026	t
00430000-564e-ea9b-3caa-0ba01b843226	velikonočna nedelja	28	3	2027	t
00430000-564e-ea9b-0605-409b5a84eec4	velikonočna nedelja	16	4	2028	t
00430000-564e-ea9b-00a4-f15e1bc82fbb	velikonočna nedelja	1	4	2029	t
00430000-564e-ea9b-70ff-d3b0f0a3d1ef	velikonočna nedelja	21	4	2030	t
00430000-564e-ea9b-6eaa-ecfa1aa98ae8	velikonočni ponedeljek	28	3	2016	t
00430000-564e-ea9b-b7d4-001fb1e7113a	velikonočni ponedeljek	17	4	2017	t
00430000-564e-ea9b-a7d6-6a5f361ca197	velikonočni ponedeljek	2	4	2018	t
00430000-564e-ea9b-db4f-543ff2fc437a	velikonočni ponedeljek	22	4	2019	t
00430000-564e-ea9b-1e8c-cc98bc36e05c	velikonočni ponedeljek	13	4	2020	t
00430000-564e-ea9b-8528-cadd908c6357	velikonočni ponedeljek	5	4	2021	t
00430000-564e-ea9b-5804-2a69b74599db	velikonočni ponedeljek	18	4	2022	t
00430000-564e-ea9b-c183-91ac5bb138bf	velikonočni ponedeljek	10	4	2023	t
00430000-564e-ea9b-51a8-4dcb01a24969	velikonočni ponedeljek	1	4	2024	t
00430000-564e-ea9b-56f4-3871edabc56a	velikonočni ponedeljek	21	4	2025	t
00430000-564e-ea9c-06eb-659aa0228c3a	velikonočni ponedeljek	6	4	2026	t
00430000-564e-ea9c-eed0-01617431581b	velikonočni ponedeljek	29	3	2027	t
00430000-564e-ea9c-5427-81a4cbd61fbd	velikonočni ponedeljek	17	4	2028	t
00430000-564e-ea9c-77f5-cd3c3483f126	velikonočni ponedeljek	2	4	2029	t
00430000-564e-ea9c-ce38-a91a633fbc70	velikonočni ponedeljek	22	4	2030	t
00430000-564e-ea9c-6f09-a09259555777	binkoštna nedelja - binkošti	15	5	2016	t
00430000-564e-ea9c-72d1-00dec6d6886b	binkoštna nedelja - binkošti	4	6	2017	t
00430000-564e-ea9c-82b5-db885dd5732b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-564e-ea9c-58f5-662362eeafba	binkoštna nedelja - binkošti	9	6	2019	t
00430000-564e-ea9c-982b-15b4b4de913b	binkoštna nedelja - binkošti	31	5	2020	t
00430000-564e-ea9c-ca24-1d12cc9c664d	binkoštna nedelja - binkošti	23	5	2021	t
00430000-564e-ea9c-d40e-052613dd56ea	binkoštna nedelja - binkošti	5	6	2022	t
00430000-564e-ea9c-d723-5fccca13c53b	binkoštna nedelja - binkošti	28	5	2023	t
00430000-564e-ea9c-19cc-5710c8a9f2ab	binkoštna nedelja - binkošti	19	5	2024	t
00430000-564e-ea9c-792c-b2b6612112ad	binkoštna nedelja - binkošti	8	6	2025	t
00430000-564e-ea9c-ac20-d6bdff5ba9e7	binkoštna nedelja - binkošti	24	5	2026	t
00430000-564e-ea9c-f858-c5e69beaa4bb	binkoštna nedelja - binkošti	16	5	2027	t
00430000-564e-ea9c-5f65-329c4acbbc95	binkoštna nedelja - binkošti	4	6	2028	t
00430000-564e-ea9c-22c6-118ca018adef	binkoštna nedelja - binkošti	20	5	2029	t
00430000-564e-ea9c-8d3d-cb0774f34268	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 28686287)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 28686299)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 28686447)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 28686873)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 28686883)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-564e-ea9e-d9ca-d3809d81470d	00080000-564e-ea9e-d3d0-eb336f6b5283	0987	AK
00190000-564e-ea9e-c1cc-90e915a5322b	00080000-564e-ea9e-5dfe-d93cbaf3c010	0989	AK
00190000-564e-ea9e-5eaa-90b5536a0702	00080000-564e-ea9e-43fa-963c23b98996	0986	AK
00190000-564e-ea9e-7ffb-77eeee3de06b	00080000-564e-ea9e-9979-06a87e9f0e59	0984	AK
00190000-564e-ea9e-b4fe-7be405ea483b	00080000-564e-ea9e-7d55-e9bdc57dd975	0983	AK
00190000-564e-ea9e-4730-c66392e5c55d	00080000-564e-ea9e-5b19-1cffa28124f1	0982	AK
00190000-564e-ea9f-11cc-78367a787261	00080000-564e-ea9f-bb4c-4c48c099ec41	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 28686782)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-564e-ea9e-bc60-7052d475aa7a	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 28686891)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 28686476)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-564e-ea9d-edae-553a21ad345c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-564e-ea9d-a3fc-0998c68ee2ab	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-564e-ea9d-698e-4901db304e3e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-564e-ea9d-5bf1-a4df6dc6e098	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-564e-ea9d-f65a-5d808254ea53	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-564e-ea9d-ef76-5328856c3a28	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-564e-ea9d-f7eb-28835db46345	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 28686420)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 28686410)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 28686621)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 28686551)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 28686261)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 28686023)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-564e-ea9f-bb4c-4c48c099ec41	00010000-564e-ea9c-e0c7-890ff822f6cb	2015-11-20 10:40:47	INS	a:0:{}
2	App\\Entity\\Option	00000000-564e-ea9f-8cd9-f7a91961db0b	00010000-564e-ea9c-e0c7-890ff822f6cb	2015-11-20 10:40:47	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-564e-ea9f-11cc-78367a787261	00010000-564e-ea9c-e0c7-890ff822f6cb	2015-11-20 10:40:47	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 28686489)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 28686061)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-564e-ea9c-4d63-2adc23e46c13	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-564e-ea9c-b787-e8c826ee8b98	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-564e-ea9c-0f2f-dad894621be7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-564e-ea9c-8ee4-1392c2441a9a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-564e-ea9c-23b3-025813dbf7d9	planer	Planer dogodkov v koledarju	t
00020000-564e-ea9c-4f95-7d722232192d	kadrovska	Kadrovska služba	t
00020000-564e-ea9c-39c1-0394962f86b8	arhivar	Ažuriranje arhivalij	t
00020000-564e-ea9c-6f41-2f96a774191c	igralec	Igralec	t
00020000-564e-ea9c-c257-6f2a5511d909	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-564e-ea9d-cc25-bc874be607d0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-564e-ea9d-78e2-cb01a4acce19	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-5524-fbb0ade7d1d4	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-333d-2427fbc14042	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-7686-0e4ae1f268e1	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-370e-be491ab07f76	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-7dab-7edce0e603ba	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-a2de-210f49297918	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-848e-2ed47b1d1fae	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-8caa-5bbc63522684	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-9726-faa70f95be14	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-092b-f7de73a7f3ca	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-c961-1bd22e19003d	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-78a0-9016afbe9b8e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-f333-9140ea8d32be	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-0bc2-084b3aadaea2	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-a483-869960d47fd0	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-564e-ea9d-f43f-331f69be88f5	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3099 (class 0 OID 28686045)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-564e-ea9c-337f-312b0d60d985	00020000-564e-ea9c-0f2f-dad894621be7
00010000-564e-ea9c-e0c7-890ff822f6cb	00020000-564e-ea9c-0f2f-dad894621be7
00010000-564e-ea9e-a3fb-a7c4bb289eee	00020000-564e-ea9d-cc25-bc874be607d0
00010000-564e-ea9e-5648-3bbf5fbec1c5	00020000-564e-ea9d-78e2-cb01a4acce19
00010000-564e-ea9e-5648-3bbf5fbec1c5	00020000-564e-ea9d-370e-be491ab07f76
00010000-564e-ea9e-5648-3bbf5fbec1c5	00020000-564e-ea9d-8caa-5bbc63522684
00010000-564e-ea9e-5648-3bbf5fbec1c5	00020000-564e-ea9d-092b-f7de73a7f3ca
00010000-564e-ea9e-5648-3bbf5fbec1c5	00020000-564e-ea9d-f333-9140ea8d32be
00010000-564e-ea9e-5648-3bbf5fbec1c5	00020000-564e-ea9d-a483-869960d47fd0
00010000-564e-ea9e-5648-3bbf5fbec1c5	00020000-564e-ea9d-333d-2427fbc14042
00010000-564e-ea9e-06d9-59fd4f3dc240	00020000-564e-ea9d-78e2-cb01a4acce19
00010000-564e-ea9e-06d9-59fd4f3dc240	00020000-564e-ea9d-5524-fbb0ade7d1d4
00010000-564e-ea9e-06d9-59fd4f3dc240	00020000-564e-ea9d-333d-2427fbc14042
00010000-564e-ea9e-06d9-59fd4f3dc240	00020000-564e-ea9d-7686-0e4ae1f268e1
00010000-564e-ea9e-5ae2-04c08b01c9b5	00020000-564e-ea9d-78e2-cb01a4acce19
00010000-564e-ea9e-5ae2-04c08b01c9b5	00020000-564e-ea9d-5524-fbb0ade7d1d4
00010000-564e-ea9e-5ae2-04c08b01c9b5	00020000-564e-ea9d-333d-2427fbc14042
00010000-564e-ea9e-5ae2-04c08b01c9b5	00020000-564e-ea9d-7686-0e4ae1f268e1
00010000-564e-ea9e-5ae2-04c08b01c9b5	00020000-564e-ea9d-092b-f7de73a7f3ca
00010000-564e-ea9e-9159-417bec1d2c5e	00020000-564e-ea9d-5524-fbb0ade7d1d4
00010000-564e-ea9e-9159-417bec1d2c5e	00020000-564e-ea9d-7dab-7edce0e603ba
00010000-564e-ea9e-9159-417bec1d2c5e	00020000-564e-ea9d-9726-faa70f95be14
00010000-564e-ea9e-9159-417bec1d2c5e	00020000-564e-ea9d-c961-1bd22e19003d
00010000-564e-ea9e-9159-417bec1d2c5e	00020000-564e-ea9d-092b-f7de73a7f3ca
00010000-564e-ea9e-9159-417bec1d2c5e	00020000-564e-ea9d-0bc2-084b3aadaea2
00010000-564e-ea9e-24df-38e7818656de	00020000-564e-ea9d-5524-fbb0ade7d1d4
00010000-564e-ea9e-24df-38e7818656de	00020000-564e-ea9d-7dab-7edce0e603ba
00010000-564e-ea9e-24df-38e7818656de	00020000-564e-ea9d-848e-2ed47b1d1fae
00010000-564e-ea9e-24df-38e7818656de	00020000-564e-ea9d-9726-faa70f95be14
00010000-564e-ea9e-24df-38e7818656de	00020000-564e-ea9d-c961-1bd22e19003d
00010000-564e-ea9e-24df-38e7818656de	00020000-564e-ea9d-092b-f7de73a7f3ca
00010000-564e-ea9e-24df-38e7818656de	00020000-564e-ea9d-0bc2-084b3aadaea2
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-5524-fbb0ade7d1d4
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-333d-2427fbc14042
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-7dab-7edce0e603ba
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-a2de-210f49297918
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-848e-2ed47b1d1fae
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-370e-be491ab07f76
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-9726-faa70f95be14
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-c961-1bd22e19003d
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-092b-f7de73a7f3ca
00010000-564e-ea9e-e8a5-3e4f61a9e226	00020000-564e-ea9d-0bc2-084b3aadaea2
00010000-564e-ea9e-f8b4-5ff2625ded6a	00020000-564e-ea9d-78e2-cb01a4acce19
00010000-564e-ea9e-f8b4-5ff2625ded6a	00020000-564e-ea9d-7686-0e4ae1f268e1
00010000-564e-ea9e-f8b4-5ff2625ded6a	00020000-564e-ea9d-370e-be491ab07f76
00010000-564e-ea9e-f8b4-5ff2625ded6a	00020000-564e-ea9d-8caa-5bbc63522684
00010000-564e-ea9e-f8b4-5ff2625ded6a	00020000-564e-ea9d-092b-f7de73a7f3ca
00010000-564e-ea9e-f8b4-5ff2625ded6a	00020000-564e-ea9d-f333-9140ea8d32be
00010000-564e-ea9e-f8b4-5ff2625ded6a	00020000-564e-ea9d-a483-869960d47fd0
00010000-564e-ea9e-fea0-1d36432d0d27	00020000-564e-ea9d-f43f-331f69be88f5
\.


--
-- TOC entry 3144 (class 0 OID 28686503)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 28686441)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 28686387)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-564e-ea9e-df64-4756a671cbe8	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-564e-ea9e-f497-db9bddd3d99b	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-564e-ea9e-79e8-84fce4050f3b	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 28686010)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-564e-ea9b-1b3c-7349214f79e0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-564e-ea9b-32d6-a48a67d87128	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-564e-ea9b-2d8c-2f45ef99890c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-564e-ea9b-e905-8bb3f671a6ea	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-564e-ea9b-7f37-bbb3a9d36821	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 28686002)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-564e-ea9b-ddf4-216b0f8d4801	00230000-564e-ea9b-e905-8bb3f671a6ea	popa
00240000-564e-ea9b-19ea-af016c965df3	00230000-564e-ea9b-e905-8bb3f671a6ea	oseba
00240000-564e-ea9b-a2fb-3c1834b2826e	00230000-564e-ea9b-e905-8bb3f671a6ea	tippopa
00240000-564e-ea9b-f067-72708b8c308a	00230000-564e-ea9b-e905-8bb3f671a6ea	organizacijskaenota
00240000-564e-ea9b-46e4-98553fe07d48	00230000-564e-ea9b-e905-8bb3f671a6ea	sezona
00240000-564e-ea9b-9431-f9a4bb7b164d	00230000-564e-ea9b-e905-8bb3f671a6ea	tipvaje
00240000-564e-ea9b-c7bb-668251bb8cd4	00230000-564e-ea9b-32d6-a48a67d87128	prostor
00240000-564e-ea9b-a590-38b6e1be501e	00230000-564e-ea9b-e905-8bb3f671a6ea	besedilo
00240000-564e-ea9b-c2b6-35412148c1cf	00230000-564e-ea9b-e905-8bb3f671a6ea	uprizoritev
00240000-564e-ea9b-f3d5-526530caf078	00230000-564e-ea9b-e905-8bb3f671a6ea	funkcija
00240000-564e-ea9b-2e03-f1bdae507182	00230000-564e-ea9b-e905-8bb3f671a6ea	tipfunkcije
00240000-564e-ea9b-2654-00db66fea85c	00230000-564e-ea9b-e905-8bb3f671a6ea	alternacija
00240000-564e-ea9b-03ed-fdf564b63b7c	00230000-564e-ea9b-1b3c-7349214f79e0	pogodba
00240000-564e-ea9b-d9de-754ae6c7581d	00230000-564e-ea9b-e905-8bb3f671a6ea	zaposlitev
00240000-564e-ea9b-9e28-2994b781efe2	00230000-564e-ea9b-e905-8bb3f671a6ea	zvrstuprizoritve
00240000-564e-ea9b-4818-b66fd9f7ec72	00230000-564e-ea9b-1b3c-7349214f79e0	programdela
00240000-564e-ea9b-2706-59ac40b3dce6	00230000-564e-ea9b-e905-8bb3f671a6ea	zapis
\.


--
-- TOC entry 3093 (class 0 OID 28685997)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
2b457776-b11f-4d0b-b8b9-9271f9dac258	00240000-564e-ea9b-ddf4-216b0f8d4801	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 28686568)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-564e-ea9e-c33d-7cdb2ab1a923	000e0000-564e-ea9e-2dff-ea4bfc573dcd	00080000-564e-ea9e-8f17-36b11fd9fa50	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-564e-ea9b-12cd-4dd63a61428a
00270000-564e-ea9e-774b-0fca07f02c3b	000e0000-564e-ea9e-2dff-ea4bfc573dcd	00080000-564e-ea9e-8f17-36b11fd9fa50	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-564e-ea9b-12cd-4dd63a61428a
\.


--
-- TOC entry 3109 (class 0 OID 28686145)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 28686397)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-564e-ea9e-61e7-08dc3a44926f	00180000-564e-ea9e-91b4-cc7f8c3049c2	000c0000-564e-ea9e-8e68-d085c91265b9	00090000-564e-ea9e-a3ef-086a08c04994	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564e-ea9e-40d7-47088b41bbb5	00180000-564e-ea9e-91b4-cc7f8c3049c2	000c0000-564e-ea9e-6e04-7f98baa4517d	00090000-564e-ea9e-a131-c14bbcc967c9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564e-ea9e-4c13-930124b0cac6	00180000-564e-ea9e-91b4-cc7f8c3049c2	000c0000-564e-ea9e-c4e4-8d32db4e3b60	00090000-564e-ea9e-ce69-08fd5248006b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564e-ea9e-3843-52f3eff3cb73	00180000-564e-ea9e-91b4-cc7f8c3049c2	000c0000-564e-ea9e-65b3-91f944568c29	00090000-564e-ea9e-9c26-3e43382a8105	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564e-ea9e-e7c2-8f1383dd41cb	00180000-564e-ea9e-91b4-cc7f8c3049c2	000c0000-564e-ea9e-9150-d64041e58127	00090000-564e-ea9e-e6ba-1ace743034ac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564e-ea9e-44dd-921d36160242	00180000-564e-ea9e-cd78-0bc3816c8311	\N	00090000-564e-ea9e-e6ba-1ace743034ac	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-564e-ea9e-fd41-bda6054a10b0	00180000-564e-ea9e-cd78-0bc3816c8311	\N	00090000-564e-ea9e-a131-c14bbcc967c9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 28686609)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-564e-ea9b-20fa-d18db226b9c9	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-564e-ea9b-444a-a00c46492367	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-564e-ea9b-3d7b-d8c32810a416	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-564e-ea9b-e9c1-fb21aef53fe7	04	Režija	Režija	Režija	umetnik	30
000f0000-564e-ea9b-a5a7-6456b91da5b6	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-564e-ea9b-f616-850437b41f01	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-564e-ea9b-a59c-e184085ee791	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-564e-ea9b-7bc7-fdda3d23be30	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-564e-ea9b-749e-6b9fd3fb34ed	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-564e-ea9b-d825-d3da3b5d496a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-564e-ea9b-0b94-a096ec1cc05a	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-564e-ea9b-4e51-0e3fe6f0f0ef	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-564e-ea9b-67d4-4139e5a806ac	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-564e-ea9b-434e-f068c0c0d94d	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-564e-ea9b-90bf-deed532112ff	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-564e-ea9b-eab6-51b7f685fe19	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-564e-ea9b-d013-d60db5237362	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-564e-ea9b-2041-4a6ed89c8f34	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 28686096)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-564e-ea9d-0f1c-3400170172bb	0001	šola	osnovna ali srednja šola
00400000-564e-ea9d-fdcb-b50757a29852	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-564e-ea9d-2a0d-e85fbdac04b3	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 28686902)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-564e-ea9b-0131-3c02e4198187	01	Velika predstava	f	1.00	1.00
002b0000-564e-ea9b-83b7-860b0cc4bfa2	02	Mala predstava	f	0.50	0.50
002b0000-564e-ea9b-8329-26971036b315	03	Mala koprodukcija	t	0.40	1.00
002b0000-564e-ea9b-e162-a2e9173677b2	04	Srednja koprodukcija	t	0.70	2.00
002b0000-564e-ea9b-0f49-96fecb7eeca1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 28686377)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-564e-ea9b-293f-2780d94c1f3d	0001	prva vaja	prva vaja
00420000-564e-ea9b-2587-c30508e2fc2b	0002	tehnična vaja	tehnična vaja
00420000-564e-ea9b-0a05-17192dcc8283	0003	lučna vaja	lučna vaja
00420000-564e-ea9b-19ae-de12275f5961	0004	kostumska vaja	kostumska vaja
00420000-564e-ea9b-287e-607aafca90d5	0005	foto vaja	foto vaja
00420000-564e-ea9b-a9d6-5ee6480f04e2	0006	1. glavna vaja	1. glavna vaja
00420000-564e-ea9b-63f2-204c6d4f1b79	0007	2. glavna vaja	2. glavna vaja
00420000-564e-ea9b-d1a5-de372296a88d	0008	1. generalka	1. generalka
00420000-564e-ea9b-18bd-1bd7077e9b26	0009	2. generalka	2. generalka
00420000-564e-ea9b-5fb9-95562f0b2fa6	0010	odprta generalka	odprta generalka
00420000-564e-ea9b-9e07-d60be3f4ea0a	0011	obnovitvena vaja	obnovitvena vaja
00420000-564e-ea9b-80b3-1283b1376165	0012	pevska vaja	pevska vaja
00420000-564e-ea9b-b2ba-9b97556d8c1e	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-564e-ea9b-89cf-0e0fa966d068	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 28686218)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 28686032)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-564e-ea9c-e0c7-890ff822f6cb	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROG8TfiID9l7P3fKoxQtolYG6IUBNcIrq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-0530-2c4e0e979c5f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-dca2-1014ac6c3ed6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-8179-e3d40d889598	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-506c-bbcb6ad357e3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-f91a-a10c51d749c3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-e891-d94791c0976f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-dbbe-284343a7fe84	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-2745-34deb8b9cce4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-430e-291f71940635	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-a3fb-a7c4bb289eee	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-e26b-ea2e75c97b35	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-5648-3bbf5fbec1c5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-06d9-59fd4f3dc240	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-5ae2-04c08b01c9b5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-9159-417bec1d2c5e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-24df-38e7818656de	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-e8a5-3e4f61a9e226	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-f8b4-5ff2625ded6a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-564e-ea9e-fea0-1d36432d0d27	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-564e-ea9c-337f-312b0d60d985	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 28686659)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-564e-ea9e-67fe-2a159395def3	00160000-564e-ea9d-aa46-9d492165594d	\N	00140000-564e-ea9b-2816-a032db6f8766	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-564e-ea9d-f65a-5d808254ea53
000e0000-564e-ea9e-2dff-ea4bfc573dcd	00160000-564e-ea9d-2592-74253f7f98f4	\N	00140000-564e-ea9b-4793-b7cbfe27c747	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-564e-ea9d-ef76-5328856c3a28
000e0000-564e-ea9e-2d5a-05f1f2c42cb5	\N	\N	00140000-564e-ea9b-4793-b7cbfe27c747	00190000-564e-ea9e-d9ca-d3809d81470d	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564e-ea9d-f65a-5d808254ea53
000e0000-564e-ea9e-b257-c4f28be52850	\N	\N	00140000-564e-ea9b-4793-b7cbfe27c747	00190000-564e-ea9e-d9ca-d3809d81470d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564e-ea9d-f65a-5d808254ea53
000e0000-564e-ea9e-593f-b09463ef456a	\N	\N	00140000-564e-ea9b-4793-b7cbfe27c747	00190000-564e-ea9e-d9ca-d3809d81470d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-564e-ea9d-edae-553a21ad345c
000e0000-564e-ea9e-4199-42a7be62165a	\N	\N	00140000-564e-ea9b-4793-b7cbfe27c747	00190000-564e-ea9e-d9ca-d3809d81470d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-564e-ea9d-edae-553a21ad345c
\.


--
-- TOC entry 3123 (class 0 OID 28686317)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-564e-ea9e-8e1f-b46393255e83	\N	000e0000-564e-ea9e-2dff-ea4bfc573dcd	1	
00200000-564e-ea9e-492c-f69c9a20e671	\N	000e0000-564e-ea9e-2dff-ea4bfc573dcd	2	
00200000-564e-ea9e-458d-8f01e4a973eb	\N	000e0000-564e-ea9e-2dff-ea4bfc573dcd	3	
00200000-564e-ea9e-6e4f-d81d2bdf9f45	\N	000e0000-564e-ea9e-2dff-ea4bfc573dcd	4	
00200000-564e-ea9e-0db8-26b5fe8ae8dc	\N	000e0000-564e-ea9e-2dff-ea4bfc573dcd	5	
\.


--
-- TOC entry 3140 (class 0 OID 28686468)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 28686582)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-564e-ea9b-b452-1793f3fc01be	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-564e-ea9b-225c-43ad92a4d87b	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-564e-ea9b-809e-f9f8f042eb6f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-564e-ea9b-8046-f669f0bbe1a1	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-564e-ea9b-2f6d-64f10cd859c1	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-564e-ea9b-2294-95e9ae6e4896	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-564e-ea9b-e93f-c70417b1df80	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-564e-ea9b-9ccf-c02c484c3548	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-564e-ea9b-12cd-4dd63a61428a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-564e-ea9b-0655-e7c1d543676f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-564e-ea9b-5e70-f1b159cadb46	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-564e-ea9b-dd7c-7eed5b0a5ef9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-564e-ea9b-90d4-bf88b26faa48	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-564e-ea9b-c830-07a6b57462e2	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-564e-ea9b-1153-f73aaae06431	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-564e-ea9b-d9b7-0a18d383f5d0	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-564e-ea9b-2d24-3fc8d86b6aa0	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-564e-ea9b-1008-d1bfaeaf1d2a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-564e-ea9b-9ffc-648a45201346	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-564e-ea9b-efdb-17c16890274b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-564e-ea9b-9b2f-b71e432e292e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-564e-ea9b-bbcb-2d9deae60295	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-564e-ea9b-6ff9-bb632cb2d29b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-564e-ea9b-5efb-fe7bfa4b5fa9	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-564e-ea9b-a7a0-994e141f5627	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-564e-ea9b-0182-6d1f5fbb859f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-564e-ea9b-6d74-784c334449dd	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-564e-ea9b-56f6-b9254406304b	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 28686952)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 28686921)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 28686964)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 28686540)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-564e-ea9e-4743-5efd140f04f4	00090000-564e-ea9e-a131-c14bbcc967c9	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564e-ea9e-cc0b-4d946aa18f18	00090000-564e-ea9e-ce69-08fd5248006b	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564e-ea9e-60fd-e21e038777d3	00090000-564e-ea9e-34ce-e2b0299447ee	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564e-ea9e-d975-6a9c6a0b2b14	00090000-564e-ea9e-7120-d4eb8eb9f9eb	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564e-ea9e-8108-ccdf43c8385d	00090000-564e-ea9e-6f78-543f98f3625c	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564e-ea9e-9b3d-80023d8189e6	00090000-564e-ea9e-da76-e5ff21ca3d65	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 28686361)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 28686649)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-564e-ea9b-2816-a032db6f8766	01	Drama	drama (SURS 01)
00140000-564e-ea9b-1278-627b37f393ec	02	Opera	opera (SURS 02)
00140000-564e-ea9b-bdf4-f9a89fe72fb5	03	Balet	balet (SURS 03)
00140000-564e-ea9b-1a3a-d805f6b02b87	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-564e-ea9b-756d-91962880dddf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-564e-ea9b-4793-b7cbfe27c747	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-564e-ea9b-ee9a-885c78ac936e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 28686530)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 28686095)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 28686708)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 28686698)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 28686086)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 28686565)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 28686607)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 28687005)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 28686349)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 28686371)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 28686376)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 28686919)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 28686244)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 28686776)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 28686526)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 28686315)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 28686282)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 28686258)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 28686433)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 28686982)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 28686989)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 28687013)
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
-- TOC entry 2726 (class 2606 OID 28686460)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 28686216)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 28686114)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 28686178)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 28686141)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 28686075)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 28686060)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 28686466)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 28686502)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 28686644)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 28686169)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 28686204)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 28686871)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 28686439)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 28686194)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 28686334)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 28686303)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 28686295)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 28686451)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 28686880)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 28686888)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 28686858)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 28686900)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 28686484)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 28686424)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 28686415)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 28686631)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 28686558)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 28686270)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 28686031)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 28686493)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 28686049)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 28686069)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 28686511)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 28686446)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 28686395)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 28686019)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 28686007)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 28686001)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 28686578)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 28686150)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 28686406)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 28686618)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 28686103)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 28686912)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 28686384)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 28686229)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 28686044)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 28686677)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 28686324)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 28686474)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 28686590)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 28686962)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 28686946)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 28686970)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 28686548)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 28686365)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 28686657)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 28686538)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 28686359)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 28686360)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 28686358)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 28686357)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 28686356)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 28686579)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 28686580)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 28686581)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 28686984)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 28686983)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 28686171)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 28686172)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 28686467)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 28686950)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 28686949)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 28686951)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 28686948)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 28686947)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 28686453)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 28686452)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 28686325)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 28686326)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 28686527)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 28686529)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 28686528)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 28686260)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 28686259)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 28686901)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 28686646)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 28686647)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 28686648)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 28686971)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 28686682)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 28686679)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 28686683)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 28686681)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 28686680)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 28686231)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 28686230)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 28686144)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 28686494)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 28686076)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 28686077)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 28686514)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 28686513)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 28686512)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 28686181)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 28686180)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 28686182)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 28686298)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 28686296)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 28686297)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 28686009)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 28686419)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 28686417)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 28686416)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 28686418)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 28686050)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 28686051)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 28686475)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 28687006)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 28686567)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 28686566)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 28687014)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 28687015)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 28686440)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 28686559)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 28686560)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 28686781)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 28686780)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 28686777)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 28686778)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 28686779)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 28686196)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 28686195)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 28686197)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 28686488)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 28686487)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 28686881)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 28686882)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 28686712)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 28686713)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 28686710)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 28686711)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 28686549)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 28686550)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 28686428)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 28686427)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 28686425)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 28686426)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 28686700)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 28686699)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 28686271)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 28686285)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 28686284)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 28686283)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 28686286)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 28686316)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 28686304)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 28686305)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 28686872)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 28686920)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 28686990)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 28686991)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 28686116)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 28686115)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 28686151)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 28686152)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 28686366)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 28686409)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 28686408)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 28686407)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 28686351)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 28686352)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 28686355)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 28686350)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 28686354)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 28686353)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 28686170)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 28686104)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 28686105)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 28686245)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 28686247)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 28686246)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 28686248)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 28686434)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 28686645)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 28686678)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 28686619)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 28686620)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 28686142)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 28686143)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 28686539)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 28686020)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 28686217)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 28686179)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 28686008)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 28686913)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 28686486)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 28686485)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 28686385)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 28686386)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 28686709)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 28686205)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 28686658)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 28686963)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 28686889)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 28686890)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 28686608)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 28686396)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 28686070)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2904 (class 2606 OID 28687186)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2905 (class 2606 OID 28687191)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2910 (class 2606 OID 28687216)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2908 (class 2606 OID 28687206)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2903 (class 2606 OID 28687181)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2907 (class 2606 OID 28687201)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2909 (class 2606 OID 28687211)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 28687196)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 28687386)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 28687391)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 28687396)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 28687561)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 28687556)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 28687071)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2882 (class 2606 OID 28687076)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 28687301)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 28687541)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 28687536)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2976 (class 2606 OID 28687546)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 28687531)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 28687526)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2926 (class 2606 OID 28687296)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 28687291)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 28687171)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2902 (class 2606 OID 28687176)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 28687341)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 28687351)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 28687346)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2892 (class 2606 OID 28687126)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 28687121)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 28687281)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 28687516)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2947 (class 2606 OID 28687401)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 28687406)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 28687411)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 28687551)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 28687431)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 28687416)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2954 (class 2606 OID 28687436)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 28687426)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2951 (class 2606 OID 28687421)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2890 (class 2606 OID 28687116)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 28687111)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2878 (class 2606 OID 28687056)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 28687051)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 28687321)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 28687031)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2874 (class 2606 OID 28687036)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 28687336)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 28687331)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2932 (class 2606 OID 28687326)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 28687086)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2883 (class 2606 OID 28687081)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 28687091)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 28687151)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 28687141)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 28687146)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 28687016)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2918 (class 2606 OID 28687256)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 28687246)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2915 (class 2606 OID 28687241)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2917 (class 2606 OID 28687251)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 28687021)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 28687026)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 28687306)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 28687576)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2943 (class 2606 OID 28687381)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 28687376)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 28687581)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2984 (class 2606 OID 28687586)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 28687286)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 28687366)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2941 (class 2606 OID 28687371)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 28687491)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 28687486)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 28687471)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2962 (class 2606 OID 28687476)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 28687481)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 28687101)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 28687096)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 28687106)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2930 (class 2606 OID 28687316)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 28687311)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 28687501)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2968 (class 2606 OID 28687506)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2959 (class 2606 OID 28687461)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2960 (class 2606 OID 28687466)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2957 (class 2606 OID 28687451)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 28687456)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 28687356)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 28687361)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 28687276)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2921 (class 2606 OID 28687271)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2919 (class 2606 OID 28687261)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 28687266)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2956 (class 2606 OID 28687446)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 28687441)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 28687131)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 28687136)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 28687166)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 28687156)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2899 (class 2606 OID 28687161)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 28687496)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 28687511)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 28687521)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 28687566)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2981 (class 2606 OID 28687571)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2876 (class 2606 OID 28687046)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 28687041)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 28687061)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2880 (class 2606 OID 28687066)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 28687221)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 28687236)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 28687231)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2912 (class 2606 OID 28687226)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-20 10:40:49 CET

--
-- PostgreSQL database dump complete
--

