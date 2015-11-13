--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-13 14:24:19 CET

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
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 26766291)
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
-- TOC entry 237 (class 1259 OID 26766905)
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
-- TOC entry 236 (class 1259 OID 26766888)
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
-- TOC entry 182 (class 1259 OID 26766284)
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
-- TOC entry 181 (class 1259 OID 26766282)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 26766765)
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
-- TOC entry 230 (class 1259 OID 26766795)
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
-- TOC entry 251 (class 1259 OID 26767195)
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
-- TOC entry 203 (class 1259 OID 26766539)
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
-- TOC entry 205 (class 1259 OID 26766571)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 26766576)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 26767118)
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
-- TOC entry 194 (class 1259 OID 26766436)
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
-- TOC entry 238 (class 1259 OID 26766918)
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
-- TOC entry 223 (class 1259 OID 26766719)
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
-- TOC entry 200 (class 1259 OID 26766510)
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
-- TOC entry 197 (class 1259 OID 26766476)
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
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 26766453)
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
-- TOC entry 212 (class 1259 OID 26766633)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 26767176)
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
    javnidostop character varying(20) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 250 (class 1259 OID 26767188)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 26767210)
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
-- TOC entry 216 (class 1259 OID 26766658)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 26766410)
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
-- TOC entry 185 (class 1259 OID 26766310)
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
-- TOC entry 189 (class 1259 OID 26766377)
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
-- TOC entry 186 (class 1259 OID 26766321)
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
-- TOC entry 178 (class 1259 OID 26766256)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 26766275)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 26766665)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 26766699)
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
-- TOC entry 233 (class 1259 OID 26766836)
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
-- TOC entry 188 (class 1259 OID 26766357)
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
-- TOC entry 191 (class 1259 OID 26766402)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 26767063)
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
-- TOC entry 213 (class 1259 OID 26766639)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 26766387)
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
-- TOC entry 202 (class 1259 OID 26766531)
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
-- TOC entry 198 (class 1259 OID 26766491)
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
-- TOC entry 199 (class 1259 OID 26766503)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 26766651)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 26767077)
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
-- TOC entry 242 (class 1259 OID 26767087)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 26766986)
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
-- TOC entry 243 (class 1259 OID 26767095)
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
-- TOC entry 219 (class 1259 OID 26766680)
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
-- TOC entry 211 (class 1259 OID 26766624)
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
-- TOC entry 210 (class 1259 OID 26766614)
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
-- TOC entry 232 (class 1259 OID 26766825)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 26766755)
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
-- TOC entry 196 (class 1259 OID 26766465)
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
-- TOC entry 175 (class 1259 OID 26766227)
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
-- TOC entry 174 (class 1259 OID 26766225)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 26766693)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 26766265)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 26766249)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 26766707)
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
-- TOC entry 214 (class 1259 OID 26766645)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 26766591)
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
-- TOC entry 173 (class 1259 OID 26766214)
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
-- TOC entry 172 (class 1259 OID 26766206)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 26766201)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 26766772)
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
-- TOC entry 187 (class 1259 OID 26766349)
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
-- TOC entry 209 (class 1259 OID 26766601)
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
-- TOC entry 231 (class 1259 OID 26766813)
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
-- TOC entry 184 (class 1259 OID 26766300)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 26767106)
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
-- TOC entry 207 (class 1259 OID 26766581)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 26766422)
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
-- TOC entry 176 (class 1259 OID 26766236)
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
-- TOC entry 235 (class 1259 OID 26766863)
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
-- TOC entry 201 (class 1259 OID 26766521)
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
-- TOC entry 218 (class 1259 OID 26766672)
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
-- TOC entry 229 (class 1259 OID 26766786)
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
-- TOC entry 247 (class 1259 OID 26767156)
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
-- TOC entry 246 (class 1259 OID 26767125)
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
-- TOC entry 248 (class 1259 OID 26767168)
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
-- TOC entry 225 (class 1259 OID 26766744)
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
-- TOC entry 204 (class 1259 OID 26766565)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 26766853)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 26766734)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 26766287)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 26766230)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3104 (class 0 OID 26766291)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5645-e480-e57a-f95af4977c75	10	30	Otroci	Abonma za otroke	200
000a0000-5645-e480-2f2d-54145b79bb29	20	60	Mladina	Abonma za mladino	400
000a0000-5645-e480-8ef0-3b4b44c4698c	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3158 (class 0 OID 26766905)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5645-e480-1c6e-5d4ea225891f	000d0000-5645-e480-a823-3054e0562cbc	\N	00090000-5645-e480-3901-7ce207c60d0c	000b0000-5645-e480-eea9-4aa062578028	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5645-e480-b722-3ab1d47258f1	000d0000-5645-e480-fe85-e0a46d06a274	00100000-5645-e480-f035-26b8a3f7266c	00090000-5645-e480-0424-3040108ab1b7	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5645-e480-384a-b00767e7a4a4	000d0000-5645-e480-e540-5bf57aadf3f5	00100000-5645-e480-f621-a9c2d265c6aa	00090000-5645-e480-e7e7-d663baab7ed6	\N	0003	t	\N	2015-11-13	\N	2	t	\N	f	f
000c0000-5645-e480-2c52-15ae4f1c6396	000d0000-5645-e480-bfc0-2df54f4d311a	\N	00090000-5645-e480-752e-6b44316e927b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5645-e480-5233-8a5415346f54	000d0000-5645-e480-9b67-b138807c8a85	\N	00090000-5645-e480-5ebd-5a292a48e1fd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5645-e481-e6d3-55e0f2822a3f	000d0000-5645-e480-9a2c-95dbe81dd898	\N	00090000-5645-e480-e259-8d05aa19fbac	000b0000-5645-e480-443b-5b5739d199d1	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5645-e481-eb41-92d72a430dad	000d0000-5645-e480-45b6-555479cc8669	00100000-5645-e480-422b-1cf6acb6e375	00090000-5645-e480-a20a-614fa54144c7	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5645-e481-74a8-b34411b4c198	000d0000-5645-e480-926e-64dc55315459	\N	00090000-5645-e480-6a90-66109d1d1f49	000b0000-5645-e480-8df5-8fd0f2b9b728	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5645-e481-8d21-e951bbdf6158	000d0000-5645-e480-45b6-555479cc8669	00100000-5645-e480-a3ee-2b2aaa9ea198	00090000-5645-e480-cbb0-c5b3f507cb72	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5645-e481-eacb-50d1793062a6	000d0000-5645-e480-45b6-555479cc8669	00100000-5645-e480-d2b3-237f8d76cdf6	00090000-5645-e480-a682-41c9eaa8824c	\N	0010	t	\N	2015-11-13	\N	16	f	\N	f	t
000c0000-5645-e481-f5f1-ac10e1060b83	000d0000-5645-e480-45b6-555479cc8669	00100000-5645-e480-6c1d-70f75bf18b47	00090000-5645-e480-af8d-f12d3f6a2451	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5645-e481-1f5f-e70e17d27860	000d0000-5645-e480-c354-c840419657e4	00100000-5645-e480-f035-26b8a3f7266c	00090000-5645-e480-0424-3040108ab1b7	000b0000-5645-e480-c02a-9b204124256e	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3157 (class 0 OID 26766888)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 26766284)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3148 (class 0 OID 26766765)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5645-e480-46fc-6b6dee8c9fa7	00160000-5645-e480-6f92-f5befd68058a	00090000-5645-e480-1d23-379e7260312f	aizv	10	t
003d0000-5645-e480-91f3-e4ef263af8ed	00160000-5645-e480-6f92-f5befd68058a	00090000-5645-e480-e9d0-b20069837fb7	apri	14	t
003d0000-5645-e480-91b9-7c03bbed7e0a	00160000-5645-e480-515e-558f91203e4d	00090000-5645-e480-7915-d61f55f1ca06	aizv	11	t
003d0000-5645-e480-9954-b3a3acb2ee33	00160000-5645-e480-6a55-8c5a89a9a8fb	00090000-5645-e480-29a6-df9f21a5717a	aizv	12	t
003d0000-5645-e480-389e-945c149d9fdb	00160000-5645-e480-6f92-f5befd68058a	00090000-5645-e480-f80d-905a07aa7c45	apri	18	f
\.


--
-- TOC entry 3151 (class 0 OID 26766795)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5645-e480-6f92-f5befd68058a	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5645-e480-515e-558f91203e4d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5645-e480-6a55-8c5a89a9a8fb	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3172 (class 0 OID 26767195)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 26766539)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5645-e480-100a-5e50b5b7f338	\N	\N	00200000-5645-e480-60e9-375c4fa5ba27	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5645-e480-5e2a-7684a2147996	\N	\N	00200000-5645-e480-9b05-5ef9210660b3	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5645-e480-4cf2-6b0ad344c843	\N	\N	00200000-5645-e480-01c4-f51306e0cbbf	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5645-e480-1207-45aac6616511	\N	\N	00200000-5645-e480-5cf0-3f7b69d6276f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5645-e480-a764-e9ac8a0dacfd	\N	\N	00200000-5645-e480-f7dd-a5b602064f61	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3126 (class 0 OID 26766571)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 26766576)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 26767118)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 26766436)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5645-e47d-b50b-b6fd79314e0b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5645-e47d-3aa9-da66539e3031	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5645-e47d-f2ea-69c43528e058	AL	ALB	008	Albania 	Albanija	\N
00040000-5645-e47d-a336-34640ae07f23	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5645-e47d-4622-70b17b53b30b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5645-e47d-0e07-3e99d20f6e50	AD	AND	020	Andorra 	Andora	\N
00040000-5645-e47d-c7e0-03f88dce94aa	AO	AGO	024	Angola 	Angola	\N
00040000-5645-e47d-cbd7-0d3543fc364b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5645-e47d-1d6e-6accf529d067	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5645-e47d-b608-4dbd4c008b7b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5645-e47d-55e6-1cd0d47a6847	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5645-e47d-ca37-1d8cb709775d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5645-e47d-4e80-00970e60b301	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5645-e47d-54d8-0985026eaf49	AU	AUS	036	Australia 	Avstralija	\N
00040000-5645-e47d-7605-f45422f31783	AT	AUT	040	Austria 	Avstrija	\N
00040000-5645-e47d-a13b-9dd2afffd68b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5645-e47d-7101-1615f49d23d8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5645-e47d-84ea-9f17fea6f64d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5645-e47d-4413-607b623e83d9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5645-e47d-115e-14705842c6a5	BB	BRB	052	Barbados 	Barbados	\N
00040000-5645-e47d-31b7-23a456a01fb7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5645-e47d-cf81-d49f207d4ec2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5645-e47d-be37-b9d8265dde5f	BZ	BLZ	084	Belize 	Belize	\N
00040000-5645-e47d-0995-be29c8fd3dce	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5645-e47d-b33a-59aeaff0b110	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5645-e47d-e55d-ef248a0db1eb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5645-e47d-d1d0-1f455110e689	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5645-e47d-6629-76fe9d06737a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5645-e47d-9838-8b071739b157	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5645-e47d-d8d1-069e7c38bfd9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5645-e47d-c822-e3e8056aa975	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5645-e47d-0beb-715cd52e23c2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5645-e47d-9f1a-2f8f6c8f312d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5645-e47d-c60f-24981bed1342	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5645-e47d-5c98-9d6c8874463b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5645-e47d-4424-7d51232727fc	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5645-e47d-43ee-79e380d2ef59	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5645-e47d-3e68-d333efac5785	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5645-e47d-0278-9f69686dc174	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5645-e47d-dec1-844bc9b7b6d3	CA	CAN	124	Canada 	Kanada	\N
00040000-5645-e47d-b0bb-1f9a34916e82	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5645-e47d-2014-738a63ef2cae	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5645-e47d-615c-c292469cbb4b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5645-e47d-81da-faf05c93f3e6	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5645-e47d-e31e-d56f0067ecd1	CL	CHL	152	Chile 	Čile	\N
00040000-5645-e47d-1ba5-6a6f821f5a00	CN	CHN	156	China 	Kitajska	\N
00040000-5645-e47d-6b13-e9032ab8391a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5645-e47d-0364-3b80c86dd05c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5645-e47d-9744-a710c55eef14	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5645-e47d-8ca5-4e910fa038b7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5645-e47d-2fc8-b722eafd4b02	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5645-e47d-d457-83644cae46f6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5645-e47d-3d09-eb38e53be5fb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5645-e47d-f9e9-144064a20f2f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5645-e47d-b486-b0ea83394a18	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5645-e47d-a6a1-eaa5e6c4aa07	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5645-e47d-2fec-d8874f59ec5d	CU	CUB	192	Cuba 	Kuba	\N
00040000-5645-e47d-f965-6fa5214331c1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5645-e47d-e057-572fb61b68f0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5645-e47d-abc7-30c1168539dd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5645-e47d-e705-d65a9e3972b1	DK	DNK	208	Denmark 	Danska	\N
00040000-5645-e47d-0bb3-99bba57b9415	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5645-e47d-c99c-fa5c440cca66	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5645-e47d-8ae8-3489189407a3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5645-e47d-bcf7-ee5d78f8afab	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5645-e47d-ebe1-f3abd03d32f5	EG	EGY	818	Egypt 	Egipt	\N
00040000-5645-e47d-9601-136b392ea92d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5645-e47d-ad86-7fd31d18a62d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5645-e47d-1e57-ad232cb231bc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5645-e47d-c7a7-7f9fbf1c6767	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5645-e47d-4cf5-7b9c706003e0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5645-e47d-d8ab-c05c7185c402	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5645-e47d-9c9d-f9aabb3049d6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5645-e47d-3e80-57af9ef2e60d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5645-e47d-3b6f-1d1b5febf7e8	FI	FIN	246	Finland 	Finska	\N
00040000-5645-e47d-bc8f-cbd0622e9641	FR	FRA	250	France 	Francija	\N
00040000-5645-e47d-833c-d6fccd0440d7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5645-e47d-0969-cd98e672eb32	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5645-e47d-a930-feb8fa65368f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5645-e47d-e1c1-98154a105dfe	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5645-e47d-56d6-8be406f5b583	GA	GAB	266	Gabon 	Gabon	\N
00040000-5645-e47d-cd26-f66770398280	GM	GMB	270	Gambia 	Gambija	\N
00040000-5645-e47d-a525-09b13e6bb5eb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5645-e47d-371a-e66c34c11136	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5645-e47d-4767-dc967f343f19	GH	GHA	288	Ghana 	Gana	\N
00040000-5645-e47d-1b1b-dabee98349fa	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5645-e47d-7993-d97cfb5a11a2	GR	GRC	300	Greece 	Grčija	\N
00040000-5645-e47d-b029-0500c31fa24c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5645-e47d-83a6-5dab82f9d571	GD	GRD	308	Grenada 	Grenada	\N
00040000-5645-e47d-0567-3bff8bbc29b8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5645-e47d-d1e3-4c7039d649da	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5645-e47d-6f31-f7838af396a7	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5645-e47d-2091-c089f9cf9ae5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5645-e47d-9f27-cb3edf01a8ba	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5645-e47d-0964-ff3d64e72631	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5645-e47d-ebc9-69b2cdcc299b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5645-e47d-9f6f-a74665d56b82	HT	HTI	332	Haiti 	Haiti	\N
00040000-5645-e47d-f010-38ace9253540	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5645-e47d-5123-3835b499e315	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5645-e47d-36ef-d5c581a992bc	HN	HND	340	Honduras 	Honduras	\N
00040000-5645-e47d-efab-dd59fb86203b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5645-e47d-3d6e-a342e86121e5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5645-e47d-8277-d4e390fb5f52	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5645-e47d-5d21-44e25c69318d	IN	IND	356	India 	Indija	\N
00040000-5645-e47d-fb79-7a2d83878e9e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5645-e47d-4642-2d3e55ce7741	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5645-e47d-3b85-e1da97b89ddb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5645-e47d-5eac-1a6d92c77d1a	IE	IRL	372	Ireland 	Irska	\N
00040000-5645-e47d-7d63-b2dd9fb7adb2	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5645-e47d-6cfd-b765688e49d4	IL	ISR	376	Israel 	Izrael	\N
00040000-5645-e47d-3907-4a2aebdaf2a0	IT	ITA	380	Italy 	Italija	\N
00040000-5645-e47d-ae9b-719ee9a856b4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5645-e47d-f754-cdbdcfe559b1	JP	JPN	392	Japan 	Japonska	\N
00040000-5645-e47d-3244-808a1ee4198b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5645-e47d-43ba-95e76d39f05a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5645-e47d-6789-27097a7a5e53	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5645-e47d-6c71-1dd69c3e884d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5645-e47d-e914-c8b00e8fde89	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5645-e47d-3962-a9570aee2452	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5645-e47d-0248-4b87802103df	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5645-e47d-70a8-058a1374e62d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5645-e47d-6ded-38e793c8e6fa	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5645-e47d-58de-64c0e01d1c44	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5645-e47d-47a8-49435c8422ea	LV	LVA	428	Latvia 	Latvija	\N
00040000-5645-e47d-081b-44142448d92a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5645-e47d-8809-d1409501b083	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5645-e47d-622b-838359cdff77	LR	LBR	430	Liberia 	Liberija	\N
00040000-5645-e47d-4b31-13b04006c947	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5645-e47d-de71-b1fd44bfae30	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5645-e47d-f1cc-a3ff5ece9826	LT	LTU	440	Lithuania 	Litva	\N
00040000-5645-e47d-b405-c9fdeb74589e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5645-e47d-ed67-e19aadd774cd	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5645-e47d-ac88-a295aca80b1c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5645-e47d-65c6-dc7045a79275	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5645-e47d-c0b4-e88cdee57260	MW	MWI	454	Malawi 	Malavi	\N
00040000-5645-e47d-ce8e-44e5f36c15b9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5645-e47d-b4ba-8777617b1cb1	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5645-e47d-a068-23b2995f0a13	ML	MLI	466	Mali 	Mali	\N
00040000-5645-e47d-d8c0-98dc3d200726	MT	MLT	470	Malta 	Malta	\N
00040000-5645-e47d-8860-2dadd0f6edb3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5645-e47d-d604-2d62dcf81880	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5645-e47d-e983-e226972714ab	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5645-e47d-9790-725e830bcd22	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5645-e47d-dbba-298d9b508abe	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5645-e47d-6054-9517668d8171	MX	MEX	484	Mexico 	Mehika	\N
00040000-5645-e47d-e7a7-92c76c7b1559	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5645-e47d-14b2-c426f38b71c7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5645-e47d-31ec-d2e4a3548359	MC	MCO	492	Monaco 	Monako	\N
00040000-5645-e47d-dc58-a86da52b7b0e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5645-e47d-cb6f-c23780ee4a12	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5645-e47d-4808-b5c709f38001	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5645-e47d-d8cb-c835c714a22b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5645-e47d-c6f9-0f9e376a5e70	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5645-e47d-54dc-9a608782faff	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5645-e47d-cf19-d1db5a7bb642	NA	NAM	516	Namibia 	Namibija	\N
00040000-5645-e47d-d81a-7a363f3d274e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5645-e47d-5239-58162bd35a91	NP	NPL	524	Nepal 	Nepal	\N
00040000-5645-e47d-3c29-8b5a0d7e27f1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5645-e47d-c501-904a8e1db200	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5645-e47d-71d1-1efa8a32eec9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5645-e47d-5073-356ff980dc22	NE	NER	562	Niger 	Niger 	\N
00040000-5645-e47d-3fdc-2b37c7573567	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5645-e47d-c4e5-dc5504867662	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5645-e47d-4eba-482171cef606	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5645-e47d-9c25-2821a9892ade	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5645-e47d-f7fd-d5d55339bf08	NO	NOR	578	Norway 	Norveška	\N
00040000-5645-e47d-d58c-0142b992a90f	OM	OMN	512	Oman 	Oman	\N
00040000-5645-e47d-9081-0656b232d06d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5645-e47d-d1ff-a6630965d033	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5645-e47d-a7e6-e336b8beed68	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5645-e47d-2090-1c1c54634b18	PA	PAN	591	Panama 	Panama	\N
00040000-5645-e47d-0c83-818eb07fe53c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5645-e47d-08fb-e2aeca94f737	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5645-e47d-daf2-d24fb2b1da36	PE	PER	604	Peru 	Peru	\N
00040000-5645-e47d-45d2-344198c03301	PH	PHL	608	Philippines 	Filipini	\N
00040000-5645-e47d-d29e-817605622661	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5645-e47d-f40c-179289924827	PL	POL	616	Poland 	Poljska	\N
00040000-5645-e47d-dce8-018826390bcd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5645-e47d-6dd6-d78b7b5ff2af	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5645-e47d-65ed-d20e4b234a57	QA	QAT	634	Qatar 	Katar	\N
00040000-5645-e47d-9a09-d124b9e4aa29	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5645-e47d-b3c7-f56748057284	RO	ROU	642	Romania 	Romunija	\N
00040000-5645-e47d-7c00-ab7156e83023	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5645-e47d-02c4-95edd95cb843	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5645-e47d-5bc8-ecef9e453028	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5645-e47d-7605-afc129270330	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5645-e47d-8f52-51a8640c8b0f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5645-e47d-982e-8909254df20c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5645-e47d-d3f3-79a906388bd6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5645-e47d-bda3-cb6a31211055	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5645-e47d-5bcf-9547b4f9e098	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5645-e47d-b981-213fbc9c4631	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5645-e47d-0239-5c9c4d64a940	SM	SMR	674	San Marino 	San Marino	\N
00040000-5645-e47d-0d4c-daf7c676cc27	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5645-e47d-3bb5-ac1f6aa89c86	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5645-e47d-65d2-15be1ce9d8e4	SN	SEN	686	Senegal 	Senegal	\N
00040000-5645-e47d-5be0-757f1963c8b0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5645-e47d-0913-3d5274cfc084	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5645-e47d-47e5-7b51589dd282	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5645-e47d-7c59-4f26579c2b31	SG	SGP	702	Singapore 	Singapur	\N
00040000-5645-e47d-53bc-9b00d802a704	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5645-e47d-8ff7-c3e71b216dd8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5645-e47d-64ad-91f61779b0bf	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5645-e47d-f9af-9c317af2aaa5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5645-e47d-16b1-37e3544fb4dd	SO	SOM	706	Somalia 	Somalija	\N
00040000-5645-e47d-782a-b1bfa48a06db	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5645-e47d-fc2c-c5e04517ee75	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5645-e47d-fe64-affcc0053d81	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5645-e47d-4191-410eeeb7535e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5645-e47d-c918-6214044ab9ce	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5645-e47d-0122-b757b44b04c6	SD	SDN	729	Sudan 	Sudan	\N
00040000-5645-e47d-50c2-44bd14824b83	SR	SUR	740	Suriname 	Surinam	\N
00040000-5645-e47d-51bf-35755e10d4d7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5645-e47d-b795-4b2fbf105562	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5645-e47d-8925-090af78d2e23	SE	SWE	752	Sweden 	Švedska	\N
00040000-5645-e47d-7f31-52a5575c9923	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5645-e47d-68fa-8d0c3aea4326	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5645-e47d-e8dd-39e7b5b4b887	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5645-e47d-672c-fa7d7490f6f3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5645-e47d-1341-3902add65d69	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5645-e47d-f763-0e2a296c697f	TH	THA	764	Thailand 	Tajska	\N
00040000-5645-e47d-8ebd-c3e7a4232e4d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5645-e47d-5fa3-40cd80f7b1c2	TG	TGO	768	Togo 	Togo	\N
00040000-5645-e47d-3488-718e9678757e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5645-e47d-f5a2-01fb285ae6c8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5645-e47d-a755-477301bf17ce	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5645-e47d-452e-635ec6e8108c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5645-e47d-3dd6-c6c92da37b37	TR	TUR	792	Turkey 	Turčija	\N
00040000-5645-e47d-ea8e-c60a75f822f4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5645-e47d-46c8-bcd8961c5528	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5645-e47d-a1c1-40b1c674edf0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5645-e47d-acfd-1946fb242db3	UG	UGA	800	Uganda 	Uganda	\N
00040000-5645-e47d-3e8c-93fd6938ae8d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5645-e47d-2394-eba06eced23b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5645-e47d-6e35-7c01dd7a4cfa	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5645-e47d-4670-7e0a05c2a792	US	USA	840	United States 	Združene države Amerike	\N
00040000-5645-e47d-fc49-7af3a1b40ca6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5645-e47d-b740-5268217b7c8e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5645-e47d-d22a-c17b2ad6054d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5645-e47d-ddcb-9ae178026531	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5645-e47d-69b4-eca26e615007	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5645-e47d-df9a-d297eaf10e68	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5645-e47d-6f93-6ab878b372df	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5645-e47d-d905-1ea0cc90ac61	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5645-e47d-abfd-ebdfc60f6306	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5645-e47d-d646-1844ad581019	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5645-e47d-b90e-acaede097052	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5645-e47d-76cd-0485a0cd0a93	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5645-e47d-7323-db9d2f7e2fdb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3159 (class 0 OID 26766918)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5645-e480-2a82-cc45ca797dba	000e0000-5645-e480-8430-8cfd7c1459f7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5645-e47d-7d8d-29993d0e50ff	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5645-e480-26d1-622eae6631ff	000e0000-5645-e480-8522-ce4921610806	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5645-e47d-8118-6c16f79f38a9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5645-e480-2ec8-eee657469e65	000e0000-5645-e480-da09-45c7795dada0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5645-e47d-7d8d-29993d0e50ff	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5645-e480-a450-dd6ec8833dc8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5645-e480-0f57-d675e7769ed6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 26766719)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5645-e480-45b6-555479cc8669	000e0000-5645-e480-8522-ce4921610806	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5645-e47d-47a3-e939b366f06d
000d0000-5645-e480-a823-3054e0562cbc	000e0000-5645-e480-8522-ce4921610806	000c0000-5645-e480-1c6e-5d4ea225891f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5645-e47d-47a3-e939b366f06d
000d0000-5645-e480-fe85-e0a46d06a274	000e0000-5645-e480-8522-ce4921610806	000c0000-5645-e480-b722-3ab1d47258f1	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5645-e47d-48b0-c9ecce8fe75a
000d0000-5645-e480-e540-5bf57aadf3f5	000e0000-5645-e480-8522-ce4921610806	000c0000-5645-e480-384a-b00767e7a4a4	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5645-e47d-14bc-badb11663274
000d0000-5645-e480-bfc0-2df54f4d311a	000e0000-5645-e480-8522-ce4921610806	000c0000-5645-e480-2c52-15ae4f1c6396	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5645-e47d-37cb-2395e14d84ba
000d0000-5645-e480-9b67-b138807c8a85	000e0000-5645-e480-8522-ce4921610806	000c0000-5645-e480-5233-8a5415346f54	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5645-e47d-37cb-2395e14d84ba
000d0000-5645-e480-9a2c-95dbe81dd898	000e0000-5645-e480-8522-ce4921610806	000c0000-5645-e481-e6d3-55e0f2822a3f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5645-e47d-47a3-e939b366f06d
000d0000-5645-e480-926e-64dc55315459	000e0000-5645-e480-8522-ce4921610806	000c0000-5645-e481-74a8-b34411b4c198	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5645-e47d-1cbc-7b9e656825eb
000d0000-5645-e480-c354-c840419657e4	000e0000-5645-e480-8522-ce4921610806	000c0000-5645-e481-1f5f-e70e17d27860	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5645-e47d-a991-f274cc42a520
\.


--
-- TOC entry 3121 (class 0 OID 26766510)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 26766476)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 26766453)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5645-e480-c5c8-d2e03120ca81	00080000-5645-e480-fc4b-1a4f8b44725d	00090000-5645-e480-a682-41c9eaa8824c	AK		igralka
\.


--
-- TOC entry 3133 (class 0 OID 26766633)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 26767176)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5645-e480-862e-ef7fa78035c1	00010000-5645-e47e-25dc-71ebf0f5a5c1	\N	Prva mapa	Root mapa	2015-11-13 14:24:16	2015-11-13 14:24:16	R	\N	\N
\.


--
-- TOC entry 3171 (class 0 OID 26767188)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 26767210)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 25231831)
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
-- TOC entry 3137 (class 0 OID 26766658)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 26766410)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5645-e47e-4ecf-a2b81240d197	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5645-e47e-26a1-d10efe0373af	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5645-e47e-a7e3-c7a0ca566470	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5645-e47e-a530-f4c2c6e4901b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5645-e47e-d811-f0bab7e33a3b	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5645-e47e-7ee4-7bd373254b73	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5645-e47e-79dc-230d88471181	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5645-e47e-6daf-308f3f393687	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5645-e47e-057f-07868c3cf068	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5645-e47e-0431-b873aebd26eb	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5645-e47e-6a7b-a31b524d99d8	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5645-e47e-3f52-f74a0c9e86cb	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5645-e47e-363d-2e147c1b330b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5645-e47e-108c-dfab03cce4cf	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5645-e47e-9d6a-1edf4bbe48ac	fsacl.dostop	array	a:5:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}s:4:"RWDA";a:1:{s:5:"label";s:45:"Branje pisanje, brisanje, ažuriranje zapisov";}}	f	t	f	\N	ACL Javni dostop
00000000-5645-e480-c9d5-aaaf600504c9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5645-e480-d47d-a6b18215eaf1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5645-e480-97a1-83f186dadbfd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5645-e480-6867-254c07f39702	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5645-e480-4995-274b9eb7ebb0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5645-e482-74cb-558c1463d0ff	application.tenant.maticnopodjetje	string	s:36:"00080000-5645-e482-3960-b180836f3068";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3106 (class 0 OID 26766310)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5645-e480-713b-72016a90de37	00000000-5645-e480-c9d5-aaaf600504c9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5645-e480-3025-51a6b90cc1f3	00000000-5645-e480-c9d5-aaaf600504c9	00010000-5645-e47e-25dc-71ebf0f5a5c1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5645-e480-1edb-cb95a8a3b36d	00000000-5645-e480-d47d-a6b18215eaf1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3110 (class 0 OID 26766377)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5645-e480-0581-25c82da439b6	\N	00100000-5645-e480-f035-26b8a3f7266c	00100000-5645-e480-f621-a9c2d265c6aa	01	Gledališče Nimbis
00410000-5645-e480-13d0-c310b655ffd0	00410000-5645-e480-0581-25c82da439b6	00100000-5645-e480-f035-26b8a3f7266c	00100000-5645-e480-f621-a9c2d265c6aa	02	Tehnika
\.


--
-- TOC entry 3107 (class 0 OID 26766321)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5645-e480-3901-7ce207c60d0c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5645-e480-752e-6b44316e927b	00010000-5645-e480-da2e-d44372303ddb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5645-e480-e7e7-d663baab7ed6	00010000-5645-e480-2146-851fb4133830	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5645-e480-cbb0-c5b3f507cb72	00010000-5645-e480-6bfb-49e403e69fbb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5645-e480-6414-ce04f2c05282	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5645-e480-e259-8d05aa19fbac	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5645-e480-af8d-f12d3f6a2451	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5645-e480-a20a-614fa54144c7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5645-e480-a682-41c9eaa8824c	00010000-5645-e480-c5d9-0d0498bc6155	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5645-e480-0424-3040108ab1b7	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5645-e480-aa78-a517739c870d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5645-e480-5ebd-5a292a48e1fd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5645-e480-6a90-66109d1d1f49	00010000-5645-e480-d78a-95d28388a70f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5645-e480-1d23-379e7260312f	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-e480-e9d0-b20069837fb7	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-e480-7915-d61f55f1ca06	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-e480-29a6-df9f21a5717a	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5645-e480-f80d-905a07aa7c45	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5645-e480-7fff-b36185f2c433	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-e480-a362-bd04965cf5cb	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-e480-6a97-6140f8f4178d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3099 (class 0 OID 26766256)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5645-e47e-cd9f-1b8b5f71d8f8	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5645-e47e-a6b5-b86f26071849	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5645-e47e-2625-c113f2e1de74	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5645-e47e-4cfc-9f807d485699	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5645-e47e-1616-b8b70b34688e	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5645-e47e-6d40-ff42d48ddd5c	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5645-e47e-1086-b9043246a70c	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5645-e47e-8fa0-ded6d2dbd35e	Abonma-read	Abonma - branje	t
00030000-5645-e47e-112a-f65bf19b09d5	Abonma-write	Abonma - spreminjanje	t
00030000-5645-e47e-a0ee-19b0250479f7	Alternacija-read	Alternacija - branje	t
00030000-5645-e47e-ecb8-ffebdcfa9377	Alternacija-write	Alternacija - spreminjanje	t
00030000-5645-e47e-3195-b537da8d5062	Arhivalija-read	Arhivalija - branje	t
00030000-5645-e47e-23e5-23fbc365f787	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5645-e47e-971d-e3ad5fafd1bf	AuthStorage-read	AuthStorage - branje	t
00030000-5645-e47e-523f-5494c939b8d4	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5645-e47e-840d-28bd935eb849	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5645-e47e-50d2-ba265ef0470e	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5645-e47e-60c9-662cf7b63621	Besedilo-read	Besedilo - branje	t
00030000-5645-e47e-37e5-07a8c11f0939	Besedilo-write	Besedilo - spreminjanje	t
00030000-5645-e47e-4089-58c1dd0ac7f9	Dogodek-read	Dogodek - branje	t
00030000-5645-e47e-fe48-43f104c4c0cc	Dogodek-write	Dogodek - spreminjanje	t
00030000-5645-e47e-c938-a5da9923ec5c	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5645-e47e-8aef-79dfef7e664b	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5645-e47e-09d5-b8263596cc01	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5645-e47e-329b-d22c00efbebc	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5645-e47e-014b-0a179af1cdfb	DogodekTrait-read	DogodekTrait - branje	t
00030000-5645-e47e-262f-ef1ac687c51e	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5645-e47e-3d71-c0dbc8611621	DrugiVir-read	DrugiVir - branje	t
00030000-5645-e47e-261e-1779328b3483	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5645-e47e-0d2a-a985c444d3b5	Drzava-read	Drzava - branje	t
00030000-5645-e47e-450c-4e6ec61392a5	Drzava-write	Drzava - spreminjanje	t
00030000-5645-e47e-6e78-f73ebad2a3b7	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5645-e47e-cc71-3c9b5ac89025	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5645-e47e-5a8e-67f42b63aaf7	Funkcija-read	Funkcija - branje	t
00030000-5645-e47e-3bbe-c0f51315c1e4	Funkcija-write	Funkcija - spreminjanje	t
00030000-5645-e47e-d749-adc3abf6f76b	Gostovanje-read	Gostovanje - branje	t
00030000-5645-e47e-3df0-4cd48f225376	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5645-e47e-47b5-1cbd40f52486	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5645-e47e-34a4-715ef9ca1cef	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5645-e47e-edb6-9fc8350145fa	Kupec-read	Kupec - branje	t
00030000-5645-e47e-4394-fa7600fb5622	Kupec-write	Kupec - spreminjanje	t
00030000-5645-e47e-1b41-04591a449a46	NacinPlacina-read	NacinPlacina - branje	t
00030000-5645-e47e-c2f9-79ac03d2820f	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5645-e47e-bd69-79e91b384621	Option-read	Option - branje	t
00030000-5645-e47e-dc92-3e44cbeaa84d	Option-write	Option - spreminjanje	t
00030000-5645-e47e-0b78-81af9666a91e	OptionValue-read	OptionValue - branje	t
00030000-5645-e47e-5b1c-291e14694cc5	OptionValue-write	OptionValue - spreminjanje	t
00030000-5645-e47e-d0ce-750fa0d89a5e	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5645-e47e-a487-c8823974895b	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5645-e47e-bb35-f2a2959e8afb	Oseba-read	Oseba - branje	t
00030000-5645-e47e-af1f-af04c4b58487	Oseba-write	Oseba - spreminjanje	t
00030000-5645-e47e-6b8d-d24c513d596d	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5645-e47e-6f34-a42f3c8b2e52	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5645-e47e-08bc-d61de4b3d800	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5645-e47e-e5c7-dedf3fe9feba	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5645-e47e-deed-18ba7da7a7b3	Pogodba-read	Pogodba - branje	t
00030000-5645-e47e-39f2-7241df32df9e	Pogodba-write	Pogodba - spreminjanje	t
00030000-5645-e47e-2041-2c736a006bb1	Popa-read	Popa - branje	t
00030000-5645-e47e-f3d8-721f8962783d	Popa-write	Popa - spreminjanje	t
00030000-5645-e47e-db73-1ba045b82211	Posta-read	Posta - branje	t
00030000-5645-e47e-d5fc-942b51a7c9d9	Posta-write	Posta - spreminjanje	t
00030000-5645-e47e-4a72-562ec815a097	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5645-e47e-5f4f-056e22bdce10	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5645-e47e-ccb1-b862281249bf	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5645-e47e-39f9-8ce01377e01a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5645-e47e-ad5e-7472573d2c89	PostniNaslov-read	PostniNaslov - branje	t
00030000-5645-e47e-a7cb-37e1a411c89e	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5645-e47e-ee2d-e0b2f81a7c98	Praznik-read	Praznik - branje	t
00030000-5645-e47e-62ff-cda3a25c61a8	Praznik-write	Praznik - spreminjanje	t
00030000-5645-e47e-1ace-11f32b285254	Predstava-read	Predstava - branje	t
00030000-5645-e47e-2a63-3e23a51d2d42	Predstava-write	Predstava - spreminjanje	t
00030000-5645-e47e-dab9-ef79dfee78ac	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5645-e47e-e365-42c977e1716d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5645-e47e-c76f-dbda471c0247	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5645-e47e-c10f-5f23de55ad6e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5645-e47e-9175-449f9970382d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5645-e47e-db45-49575e9821c4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5645-e47e-88a2-b63adeef059c	ProgramDela-read	ProgramDela - branje	t
00030000-5645-e47e-8fd8-6c824184a11d	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5645-e47e-018b-b55079b706e6	ProgramFestival-read	ProgramFestival - branje	t
00030000-5645-e47e-fbe4-b14208f3c194	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5645-e47e-b850-234e8b4e2a58	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5645-e47e-0529-5ab1a8fffd69	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5645-e47e-17b3-ceed69c79c82	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5645-e47e-5d29-29bd0daa6021	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5645-e47e-9ca9-cc7147f5f8f7	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5645-e47e-a786-f5c38948d3e0	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5645-e47e-3548-19f875266b4e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5645-e47e-62a2-480bc0a97acc	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5645-e47e-e740-7c72333b1c8f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5645-e47e-7570-5be66c9d8281	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5645-e47e-c083-133c43200c94	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5645-e47e-5e6d-b435c5bdd1af	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5645-e47e-6153-cc2bb351e743	ProgramRazno-read	ProgramRazno - branje	t
00030000-5645-e47e-21b0-f266de3765dd	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5645-e47e-f603-ece422002328	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5645-e47e-962e-79a9904ea6d8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5645-e47e-c744-983c71cc1f3a	Prostor-read	Prostor - branje	t
00030000-5645-e47e-3761-b745ae1bd5ea	Prostor-write	Prostor - spreminjanje	t
00030000-5645-e47e-414e-1f5c710c2c2f	Racun-read	Racun - branje	t
00030000-5645-e47e-ea38-12543bf1bcc5	Racun-write	Racun - spreminjanje	t
00030000-5645-e47e-dc71-85bf5745b9d9	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5645-e47e-11a8-915f0a3677a2	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5645-e47e-74da-d1ba33caf698	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5645-e47e-6fcd-e6f408289d8a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5645-e47e-eacb-cef83f0f46c2	Rekvizit-read	Rekvizit - branje	t
00030000-5645-e47e-14c5-8797003d4a58	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5645-e47e-7944-d3afc15ac9a9	Revizija-read	Revizija - branje	t
00030000-5645-e47e-d5be-0fac644bd2d3	Revizija-write	Revizija - spreminjanje	t
00030000-5645-e47e-a0af-8f3e5ae8a398	Rezervacija-read	Rezervacija - branje	t
00030000-5645-e47e-be3b-fcec2d36affc	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5645-e47e-a751-124433ccdc1c	SedezniRed-read	SedezniRed - branje	t
00030000-5645-e47e-56f7-fa3815b6a96f	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5645-e47e-3934-54b5823b9d1c	Sedez-read	Sedez - branje	t
00030000-5645-e47e-7a3b-ee14b53e000e	Sedez-write	Sedez - spreminjanje	t
00030000-5645-e47e-99fc-b2b05744f995	Sezona-read	Sezona - branje	t
00030000-5645-e47e-a930-d91dfce614bb	Sezona-write	Sezona - spreminjanje	t
00030000-5645-e47e-35af-8411881a9c31	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5645-e47e-3411-3e402f64c3fe	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5645-e47e-e882-e3fa384b4272	Stevilcenje-read	Stevilcenje - branje	t
00030000-5645-e47e-2982-82e5c6bfc57d	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5645-e47e-eb16-281651afe736	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5645-e47e-a153-100bff5343d1	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5645-e47e-5164-fc1d77ad0b04	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5645-e47e-39bc-4ef78e613b4b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5645-e47e-6523-3a5a604bc114	Telefonska-read	Telefonska - branje	t
00030000-5645-e47e-674c-db402e814665	Telefonska-write	Telefonska - spreminjanje	t
00030000-5645-e47e-bbae-d7cb98e59ed5	TerminStoritve-read	TerminStoritve - branje	t
00030000-5645-e47e-ea25-f9abbc7485e2	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5645-e47e-1582-c9e3ac08c3fe	TipFunkcije-read	TipFunkcije - branje	t
00030000-5645-e47e-c3d1-735018e719dd	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5645-e47e-f337-20b5c06d799a	TipPopa-read	TipPopa - branje	t
00030000-5645-e47e-3fe4-4ec19f2b2ee9	TipPopa-write	TipPopa - spreminjanje	t
00030000-5645-e47e-623b-19999ec4ac56	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5645-e47e-088e-7169aea76b7d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5645-e47e-be65-cf479fe60f10	TipVaje-read	TipVaje - branje	t
00030000-5645-e47e-6bb1-7115d8518ac5	TipVaje-write	TipVaje - spreminjanje	t
00030000-5645-e47e-010f-df55eb00103a	Trr-read	Trr - branje	t
00030000-5645-e47e-b15e-9a463e4d2851	Trr-write	Trr - spreminjanje	t
00030000-5645-e47e-d68c-44b340a40c14	Uprizoritev-read	Uprizoritev - branje	t
00030000-5645-e47e-f7d4-2f1ee8fe9eae	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5645-e47e-fa94-c1c23fcf3105	Vaja-read	Vaja - branje	t
00030000-5645-e47e-e8df-40e00167a5c7	Vaja-write	Vaja - spreminjanje	t
00030000-5645-e47e-7b0d-bd9d311bda4f	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5645-e47e-1de6-d224704cce81	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5645-e47e-3a62-7e3524c597bd	VrstaStroska-read	VrstaStroska - branje	t
00030000-5645-e47e-9f2e-6c6db0136c4b	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5645-e47e-260c-383d90ca69d0	Zaposlitev-read	Zaposlitev - branje	t
00030000-5645-e47e-c11f-d21ce0a45b25	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5645-e47e-3a19-c4b6ca8c69d6	Zasedenost-read	Zasedenost - branje	t
00030000-5645-e47e-984b-82b1c09c20ed	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5645-e47e-204e-cb937d6e879b	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5645-e47e-ae50-c8d9ee2b60fa	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5645-e47e-c663-094589adb442	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5645-e47e-8c52-d056f56850ac	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5645-e47e-4fac-b5cccd5914cd	Job-read	Branje opravil - samo zase - branje	t
00030000-5645-e47e-9865-d2bdbae27239	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5645-e47e-91e4-43bb4931d1c4	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5645-e47e-4e0f-fff326d9b635	Report-read	Report - branje	t
00030000-5645-e47e-325d-9932b2acbbf9	Report-write	Report - spreminjanje	t
00030000-5645-e47e-2949-9da35a9f9001	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5645-e47e-f308-5e0cd9b1a5cb	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5645-e47e-72ae-2b91b57d30aa	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5645-e47e-ad1d-1741c383fd8e	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5645-e47e-1b95-190b1464b5f3	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5645-e47e-1e73-e0b24a17f1e8	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5645-e47e-85fa-5119cd7edf03	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5645-e47e-267f-3215f9606dc3	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5645-e47e-3248-5f9696290bf6	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5645-e47e-4fab-ba80c782537e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5645-e47e-fdfc-bc5c59732cec	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5645-e47e-fd54-1bf7d7b5583e	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5645-e47e-1330-6a9312fd5f48	Datoteka-write	Datoteka - spreminjanje	t
00030000-5645-e47e-6a04-97846aa0efbc	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3101 (class 0 OID 26766275)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5645-e47e-f899-eb6c95e29d3d	00030000-5645-e47e-a6b5-b86f26071849
00020000-5645-e47e-287a-f8346dd98784	00030000-5645-e47e-0d2a-a985c444d3b5
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-8fa0-ded6d2dbd35e
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-112a-f65bf19b09d5
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-a0ee-19b0250479f7
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-ecb8-ffebdcfa9377
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-3195-b537da8d5062
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-4089-58c1dd0ac7f9
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-4cfc-9f807d485699
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-fe48-43f104c4c0cc
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-0d2a-a985c444d3b5
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-450c-4e6ec61392a5
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-5a8e-67f42b63aaf7
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-3bbe-c0f51315c1e4
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-d749-adc3abf6f76b
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-3df0-4cd48f225376
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-47b5-1cbd40f52486
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-34a4-715ef9ca1cef
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-bd69-79e91b384621
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-0b78-81af9666a91e
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-bb35-f2a2959e8afb
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-af1f-af04c4b58487
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-2041-2c736a006bb1
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-f3d8-721f8962783d
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-db73-1ba045b82211
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-d5fc-942b51a7c9d9
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-ad5e-7472573d2c89
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-a7cb-37e1a411c89e
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-1ace-11f32b285254
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-2a63-3e23a51d2d42
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-9175-449f9970382d
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-db45-49575e9821c4
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-c744-983c71cc1f3a
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-3761-b745ae1bd5ea
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-74da-d1ba33caf698
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-6fcd-e6f408289d8a
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-eacb-cef83f0f46c2
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-14c5-8797003d4a58
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-99fc-b2b05744f995
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-a930-d91dfce614bb
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-1582-c9e3ac08c3fe
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-d68c-44b340a40c14
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-f7d4-2f1ee8fe9eae
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-fa94-c1c23fcf3105
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-e8df-40e00167a5c7
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-3a19-c4b6ca8c69d6
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-984b-82b1c09c20ed
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-204e-cb937d6e879b
00020000-5645-e47e-5a85-6184e8a9f266	00030000-5645-e47e-c663-094589adb442
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-8fa0-ded6d2dbd35e
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-3195-b537da8d5062
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-4089-58c1dd0ac7f9
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-0d2a-a985c444d3b5
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-d749-adc3abf6f76b
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-47b5-1cbd40f52486
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-34a4-715ef9ca1cef
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-bd69-79e91b384621
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-0b78-81af9666a91e
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-bb35-f2a2959e8afb
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-af1f-af04c4b58487
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-2041-2c736a006bb1
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-db73-1ba045b82211
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-ad5e-7472573d2c89
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-a7cb-37e1a411c89e
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-1ace-11f32b285254
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-c744-983c71cc1f3a
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-74da-d1ba33caf698
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-eacb-cef83f0f46c2
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-99fc-b2b05744f995
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-6523-3a5a604bc114
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-674c-db402e814665
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-010f-df55eb00103a
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-b15e-9a463e4d2851
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-260c-383d90ca69d0
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-c11f-d21ce0a45b25
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-204e-cb937d6e879b
00020000-5645-e47e-bd18-35dac75489d9	00030000-5645-e47e-c663-094589adb442
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-8fa0-ded6d2dbd35e
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-a0ee-19b0250479f7
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-3195-b537da8d5062
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-23e5-23fbc365f787
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-60c9-662cf7b63621
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-c938-a5da9923ec5c
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-4089-58c1dd0ac7f9
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-0d2a-a985c444d3b5
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-5a8e-67f42b63aaf7
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-d749-adc3abf6f76b
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-47b5-1cbd40f52486
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-bd69-79e91b384621
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-0b78-81af9666a91e
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-bb35-f2a2959e8afb
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-2041-2c736a006bb1
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-db73-1ba045b82211
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-1ace-11f32b285254
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-9175-449f9970382d
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-c744-983c71cc1f3a
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-74da-d1ba33caf698
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-eacb-cef83f0f46c2
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-99fc-b2b05744f995
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-1582-c9e3ac08c3fe
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-fa94-c1c23fcf3105
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-3a19-c4b6ca8c69d6
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-204e-cb937d6e879b
00020000-5645-e47e-4fe9-c339e082b681	00030000-5645-e47e-c663-094589adb442
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-8fa0-ded6d2dbd35e
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-112a-f65bf19b09d5
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-ecb8-ffebdcfa9377
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-3195-b537da8d5062
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-4089-58c1dd0ac7f9
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-0d2a-a985c444d3b5
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-d749-adc3abf6f76b
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-bd69-79e91b384621
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-0b78-81af9666a91e
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-2041-2c736a006bb1
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-db73-1ba045b82211
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-1ace-11f32b285254
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-c744-983c71cc1f3a
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-74da-d1ba33caf698
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-eacb-cef83f0f46c2
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-99fc-b2b05744f995
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-1582-c9e3ac08c3fe
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-204e-cb937d6e879b
00020000-5645-e47e-f9bd-71739a081b62	00030000-5645-e47e-c663-094589adb442
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-8fa0-ded6d2dbd35e
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-3195-b537da8d5062
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-4089-58c1dd0ac7f9
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-0d2a-a985c444d3b5
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-d749-adc3abf6f76b
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-bd69-79e91b384621
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-0b78-81af9666a91e
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-2041-2c736a006bb1
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-db73-1ba045b82211
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-1ace-11f32b285254
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-c744-983c71cc1f3a
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-74da-d1ba33caf698
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-eacb-cef83f0f46c2
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-99fc-b2b05744f995
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-bbae-d7cb98e59ed5
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-2625-c113f2e1de74
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-1582-c9e3ac08c3fe
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-204e-cb937d6e879b
00020000-5645-e47e-0eb8-7856de81968f	00030000-5645-e47e-c663-094589adb442
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-cd9f-1b8b5f71d8f8
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a6b5-b86f26071849
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-8fa0-ded6d2dbd35e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-112a-f65bf19b09d5
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a0ee-19b0250479f7
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-ecb8-ffebdcfa9377
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3195-b537da8d5062
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-23e5-23fbc365f787
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-840d-28bd935eb849
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-50d2-ba265ef0470e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-60c9-662cf7b63621
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-37e5-07a8c11f0939
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c938-a5da9923ec5c
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-8aef-79dfef7e664b
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-4089-58c1dd0ac7f9
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-4cfc-9f807d485699
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-fe48-43f104c4c0cc
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3d71-c0dbc8611621
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-261e-1779328b3483
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-0d2a-a985c444d3b5
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-450c-4e6ec61392a5
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-6e78-f73ebad2a3b7
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-cc71-3c9b5ac89025
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-5a8e-67f42b63aaf7
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3bbe-c0f51315c1e4
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-d749-adc3abf6f76b
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3df0-4cd48f225376
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-47b5-1cbd40f52486
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-34a4-715ef9ca1cef
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-edb6-9fc8350145fa
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-4394-fa7600fb5622
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-1b41-04591a449a46
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c2f9-79ac03d2820f
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-bd69-79e91b384621
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-0b78-81af9666a91e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-5b1c-291e14694cc5
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-dc92-3e44cbeaa84d
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-d0ce-750fa0d89a5e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a487-c8823974895b
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-bb35-f2a2959e8afb
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-1616-b8b70b34688e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-af1f-af04c4b58487
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-6b8d-d24c513d596d
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-6f34-a42f3c8b2e52
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-08bc-d61de4b3d800
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-e5c7-dedf3fe9feba
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-deed-18ba7da7a7b3
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-39f2-7241df32df9e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-2041-2c736a006bb1
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-f3d8-721f8962783d
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-db73-1ba045b82211
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-4a72-562ec815a097
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-5f4f-056e22bdce10
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-ccb1-b862281249bf
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-39f9-8ce01377e01a
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-d5fc-942b51a7c9d9
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-ad5e-7472573d2c89
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a7cb-37e1a411c89e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-ee2d-e0b2f81a7c98
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-62ff-cda3a25c61a8
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-1ace-11f32b285254
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-2a63-3e23a51d2d42
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-dab9-ef79dfee78ac
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-e365-42c977e1716d
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c76f-dbda471c0247
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c10f-5f23de55ad6e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-9175-449f9970382d
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-db45-49575e9821c4
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-6d40-ff42d48ddd5c
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-88a2-b63adeef059c
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-1086-b9043246a70c
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-8fd8-6c824184a11d
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-018b-b55079b706e6
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-fbe4-b14208f3c194
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-b850-234e8b4e2a58
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-0529-5ab1a8fffd69
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-17b3-ceed69c79c82
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-5d29-29bd0daa6021
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-9ca9-cc7147f5f8f7
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a786-f5c38948d3e0
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3548-19f875266b4e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-62a2-480bc0a97acc
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-e740-7c72333b1c8f
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-7570-5be66c9d8281
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c083-133c43200c94
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-5e6d-b435c5bdd1af
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-6153-cc2bb351e743
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-21b0-f266de3765dd
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-f603-ece422002328
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-962e-79a9904ea6d8
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c744-983c71cc1f3a
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3761-b745ae1bd5ea
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-414e-1f5c710c2c2f
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-ea38-12543bf1bcc5
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-dc71-85bf5745b9d9
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-11a8-915f0a3677a2
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-74da-d1ba33caf698
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-6fcd-e6f408289d8a
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-eacb-cef83f0f46c2
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-14c5-8797003d4a58
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-7944-d3afc15ac9a9
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-d5be-0fac644bd2d3
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a0af-8f3e5ae8a398
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-be3b-fcec2d36affc
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a751-124433ccdc1c
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-56f7-fa3815b6a96f
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3934-54b5823b9d1c
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-7a3b-ee14b53e000e
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-99fc-b2b05744f995
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a930-d91dfce614bb
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-35af-8411881a9c31
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3411-3e402f64c3fe
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-e882-e3fa384b4272
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-eb16-281651afe736
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-a153-100bff5343d1
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-2982-82e5c6bfc57d
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-5164-fc1d77ad0b04
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-39bc-4ef78e613b4b
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-6523-3a5a604bc114
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-674c-db402e814665
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-bbae-d7cb98e59ed5
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-2625-c113f2e1de74
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-ea25-f9abbc7485e2
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-1582-c9e3ac08c3fe
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c3d1-735018e719dd
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-f337-20b5c06d799a
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3fe4-4ec19f2b2ee9
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-623b-19999ec4ac56
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-088e-7169aea76b7d
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-be65-cf479fe60f10
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-6bb1-7115d8518ac5
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-010f-df55eb00103a
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-b15e-9a463e4d2851
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-d68c-44b340a40c14
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-f7d4-2f1ee8fe9eae
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-fa94-c1c23fcf3105
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-e8df-40e00167a5c7
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-7b0d-bd9d311bda4f
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-1de6-d224704cce81
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3a62-7e3524c597bd
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-9f2e-6c6db0136c4b
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-260c-383d90ca69d0
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c11f-d21ce0a45b25
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-3a19-c4b6ca8c69d6
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-984b-82b1c09c20ed
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-204e-cb937d6e879b
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-ae50-c8d9ee2b60fa
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-c663-094589adb442
00020000-5645-e480-e3ea-88ac54a47dc8	00030000-5645-e47e-8c52-d056f56850ac
00020000-5645-e480-b504-0c4d90e78b3c	00030000-5645-e47e-4fab-ba80c782537e
00020000-5645-e480-796c-a6d5bdc10527	00030000-5645-e47e-3248-5f9696290bf6
00020000-5645-e480-6e7f-f8fb1b2dea0a	00030000-5645-e47e-f7d4-2f1ee8fe9eae
00020000-5645-e480-54df-a3864bbe6cfe	00030000-5645-e47e-d68c-44b340a40c14
00020000-5645-e480-b54f-f02d9d825c7c	00030000-5645-e47e-f308-5e0cd9b1a5cb
00020000-5645-e480-faac-3851ddc8a77c	00030000-5645-e47e-72ae-2b91b57d30aa
00020000-5645-e480-e3a3-1248b65c08a8	00030000-5645-e47e-ad1d-1741c383fd8e
00020000-5645-e480-b8dd-5ce10a9d7fbc	00030000-5645-e47e-2949-9da35a9f9001
00020000-5645-e480-8a7e-e43cb347eafd	00030000-5645-e47e-1e73-e0b24a17f1e8
00020000-5645-e480-cba4-218c3c37f860	00030000-5645-e47e-1b95-190b1464b5f3
\.


--
-- TOC entry 3138 (class 0 OID 26766665)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 26766699)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 26766836)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5645-e480-eea9-4aa062578028	00090000-5645-e480-3901-7ce207c60d0c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5645-e480-443b-5b5739d199d1	00090000-5645-e480-e259-8d05aa19fbac	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5645-e480-8df5-8fd0f2b9b728	00090000-5645-e480-6a90-66109d1d1f49	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5645-e480-c02a-9b204124256e	00090000-5645-e480-0424-3040108ab1b7	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3109 (class 0 OID 26766357)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5645-e480-fc4b-1a4f8b44725d	\N	00040000-5645-e47d-64ad-91f61779b0bf	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-e480-199a-b716ad552a32	\N	00040000-5645-e47d-64ad-91f61779b0bf	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5645-e480-4674-0eb966b67fd8	\N	00040000-5645-e47d-64ad-91f61779b0bf	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-e480-3dc7-98209df72a2c	\N	00040000-5645-e47d-64ad-91f61779b0bf	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-e480-6bb1-b3c68693a63d	\N	00040000-5645-e47d-64ad-91f61779b0bf	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-e480-be6d-bd51fea1e5bd	\N	00040000-5645-e47d-55e6-1cd0d47a6847	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-e480-5003-baf123d01aa6	\N	00040000-5645-e47d-a6a1-eaa5e6c4aa07	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-e480-5812-4356a63fd75e	\N	00040000-5645-e47d-7605-f45422f31783	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-e480-ed12-fbce9ba12d6f	\N	00040000-5645-e47d-371a-e66c34c11136	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-e482-3960-b180836f3068	\N	00040000-5645-e47d-64ad-91f61779b0bf	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3112 (class 0 OID 26766402)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5645-e47d-6bad-5ce0e6408422	8341	Adlešiči
00050000-5645-e47d-7d79-b235f7e1ec63	5270	Ajdovščina
00050000-5645-e47d-7ec2-6b9f0fa242c8	6280	Ankaran/Ancarano
00050000-5645-e47d-4652-5bbc96dffa02	9253	Apače
00050000-5645-e47d-aeef-fa57b8894176	8253	Artiče
00050000-5645-e47d-61ee-fd86e221fbf2	4275	Begunje na Gorenjskem
00050000-5645-e47d-c1d2-e4e4cb868048	1382	Begunje pri Cerknici
00050000-5645-e47d-d0fa-2f4497d596d4	9231	Beltinci
00050000-5645-e47d-95d5-7ea5d02f4885	2234	Benedikt
00050000-5645-e47d-8d3b-5cc2bc2b941a	2345	Bistrica ob Dravi
00050000-5645-e47d-cd65-8b643dfc6728	3256	Bistrica ob Sotli
00050000-5645-e47d-6560-7eae7f1a4ff4	8259	Bizeljsko
00050000-5645-e47d-32bd-7e82ac5173d5	1223	Blagovica
00050000-5645-e47d-96a1-6b96a74e4ac5	8283	Blanca
00050000-5645-e47d-5048-2c5ebacd3070	4260	Bled
00050000-5645-e47d-ad17-dc270c957801	4273	Blejska Dobrava
00050000-5645-e47d-0128-dc875c4f4f31	9265	Bodonci
00050000-5645-e47d-dbd1-fe09b9114e63	9222	Bogojina
00050000-5645-e47d-e10d-f1f64c550769	4263	Bohinjska Bela
00050000-5645-e47d-7efb-35607da11b89	4264	Bohinjska Bistrica
00050000-5645-e47d-7dc0-42bc88c01af9	4265	Bohinjsko jezero
00050000-5645-e47d-b7dc-e5619d5c36b3	1353	Borovnica
00050000-5645-e47d-d9f4-93873fe4eb69	8294	Boštanj
00050000-5645-e47d-0fd2-76cac1a392ab	5230	Bovec
00050000-5645-e47d-85b5-13f6b89514da	5295	Branik
00050000-5645-e47d-1cc1-f42ea7dc7777	3314	Braslovče
00050000-5645-e47d-0f1e-21a90d4972fb	5223	Breginj
00050000-5645-e47d-855f-31c910d5b3c6	8280	Brestanica
00050000-5645-e47d-b1e7-7f4615a0243e	2354	Bresternica
00050000-5645-e47d-b004-6d889e83263f	4243	Brezje
00050000-5645-e47d-cc70-993487c2fdc1	1351	Brezovica pri Ljubljani
00050000-5645-e47d-5f18-21c22a20d586	8250	Brežice
00050000-5645-e47d-62bc-34678b237fd2	4210	Brnik - Aerodrom
00050000-5645-e47d-4c36-fe20f7d715e1	8321	Brusnice
00050000-5645-e47d-fcf3-c22b8f6ae1cc	3255	Buče
00050000-5645-e47d-8fae-3e82f26e7c10	8276	Bučka 
00050000-5645-e47d-4cc8-f5d971b8a6ec	9261	Cankova
00050000-5645-e47d-6c5d-a1ea050f256f	3000	Celje 
00050000-5645-e47d-d592-2f62b599abfb	3001	Celje - poštni predali
00050000-5645-e47d-3f57-2a5d2087d34e	4207	Cerklje na Gorenjskem
00050000-5645-e47d-9958-17cae496775c	8263	Cerklje ob Krki
00050000-5645-e47d-7eb6-aaaff693e70d	1380	Cerknica
00050000-5645-e47d-b5ae-0285b27f54f9	5282	Cerkno
00050000-5645-e47d-bf09-95e4a13e7385	2236	Cerkvenjak
00050000-5645-e47d-4a87-353ea7246a5b	2215	Ceršak
00050000-5645-e47d-e48c-ea6133605da8	2326	Cirkovce
00050000-5645-e47d-5ad7-9596f8c07892	2282	Cirkulane
00050000-5645-e47d-683f-f5f071a8a8dd	5273	Col
00050000-5645-e47d-b171-d66776ff38ee	8251	Čatež ob Savi
00050000-5645-e47d-9a7f-09ab5b5b142c	1413	Čemšenik
00050000-5645-e47d-ca45-4857848f0cfe	5253	Čepovan
00050000-5645-e47d-97a0-462821de00b9	9232	Črenšovci
00050000-5645-e47d-9956-f12705287c85	2393	Črna na Koroškem
00050000-5645-e47d-cc28-210077c9b342	6275	Črni Kal
00050000-5645-e47d-2d59-c245dc5ff3d4	5274	Črni Vrh nad Idrijo
00050000-5645-e47d-5b25-efff3c2820f5	5262	Črniče
00050000-5645-e47d-079f-4d925e80e410	8340	Črnomelj
00050000-5645-e47d-2640-0919f543d195	6271	Dekani
00050000-5645-e47d-9f34-7c5daf29beff	5210	Deskle
00050000-5645-e47d-248b-1f1d6c07ef49	2253	Destrnik
00050000-5645-e47d-7bf5-b72a8aa5dba5	6215	Divača
00050000-5645-e47d-cfe2-47b552bba0e6	1233	Dob
00050000-5645-e47d-91e1-5261782d943b	3224	Dobje pri Planini
00050000-5645-e47d-7253-616a4c68e879	8257	Dobova
00050000-5645-e47d-2a77-272963b347ce	1423	Dobovec
00050000-5645-e47d-cec5-ab6f9349c514	5263	Dobravlje
00050000-5645-e47d-9601-770f71ce04b2	3204	Dobrna
00050000-5645-e47d-860b-897adaeeecaa	8211	Dobrnič
00050000-5645-e47d-d5bb-031e7282350e	1356	Dobrova
00050000-5645-e47d-fbbb-a0cf7fa49c0c	9223	Dobrovnik/Dobronak 
00050000-5645-e47d-9b44-b479992143f2	5212	Dobrovo v Brdih
00050000-5645-e47d-c4dc-130fbf4258c2	1431	Dol pri Hrastniku
00050000-5645-e47d-960b-8914dc45d830	1262	Dol pri Ljubljani
00050000-5645-e47d-641d-14c83e544ce2	1273	Dole pri Litiji
00050000-5645-e47d-f888-2166a1e26632	1331	Dolenja vas
00050000-5645-e47d-c381-aaee9f55f86c	8350	Dolenjske Toplice
00050000-5645-e47d-f2f0-36cfc76eb700	1230	Domžale
00050000-5645-e47d-8afe-65d2a1dacda0	2252	Dornava
00050000-5645-e47d-e546-58df9b5ebac2	5294	Dornberk
00050000-5645-e47d-39ce-4fb3f5e3127a	1319	Draga
00050000-5645-e47d-6637-d0c7a3b1fad2	8343	Dragatuš
00050000-5645-e47d-c1f2-a4a0f578de41	3222	Dramlje
00050000-5645-e47d-4189-5f17eeddb2ff	2370	Dravograd
00050000-5645-e47d-8583-b979866d1502	4203	Duplje
00050000-5645-e47d-ab96-9f74b30db18e	6221	Dutovlje
00050000-5645-e47d-34a3-a56d92c6ab05	8361	Dvor
00050000-5645-e47d-667f-8ab59b2aca2d	2343	Fala
00050000-5645-e47d-c8c4-9fff00cf188f	9208	Fokovci
00050000-5645-e47d-0bfe-063f04163f1e	2313	Fram
00050000-5645-e47d-07a1-6b139e39524f	3213	Frankolovo
00050000-5645-e47d-c0f5-257ee7a300bf	1274	Gabrovka
00050000-5645-e47d-787d-a7c880e709cc	8254	Globoko
00050000-5645-e47d-f2d4-f8e431611d4a	5275	Godovič
00050000-5645-e47d-2846-2e75d3581705	4204	Golnik
00050000-5645-e47d-8c7b-46d2bf59e2da	3303	Gomilsko
00050000-5645-e47d-fcee-39d6c503ad31	4224	Gorenja vas
00050000-5645-e47d-7d44-77b111bfac46	3263	Gorica pri Slivnici
00050000-5645-e47d-e93d-adb8496fb008	2272	Gorišnica
00050000-5645-e47d-67f2-43775627e387	9250	Gornja Radgona
00050000-5645-e47d-d6c3-ab7aecefae92	3342	Gornji Grad
00050000-5645-e47d-df9a-8203ed507304	4282	Gozd Martuljek
00050000-5645-e47d-23cd-135a00e3d1bf	6272	Gračišče
00050000-5645-e47d-51ad-e5f7d4e8b6c7	9264	Grad
00050000-5645-e47d-b691-6220923cbdd4	8332	Gradac
00050000-5645-e47d-b49f-76e1b16962b6	1384	Grahovo
00050000-5645-e47d-9290-40bfd909f1a3	5242	Grahovo ob Bači
00050000-5645-e47d-088f-272caa63403e	5251	Grgar
00050000-5645-e47d-1dd8-c52a8633ddfb	3302	Griže
00050000-5645-e47d-9101-545d21a55bcb	3231	Grobelno
00050000-5645-e47d-50e5-ff51b5e09cd6	1290	Grosuplje
00050000-5645-e47d-da47-23373052a158	2288	Hajdina
00050000-5645-e47d-602f-b3195bd3c8ab	8362	Hinje
00050000-5645-e47d-4e70-45e57a16864c	2311	Hoče
00050000-5645-e47d-cfea-dbd27aca1501	9205	Hodoš/Hodos
00050000-5645-e47d-0e09-7b4a41c9609f	1354	Horjul
00050000-5645-e47d-dd61-b39d884ca1ab	1372	Hotedršica
00050000-5645-e47d-ff44-eaf0da597d21	1430	Hrastnik
00050000-5645-e47d-5f6d-4ca1066f5ae2	6225	Hruševje
00050000-5645-e47d-6e93-c0cdd3a84333	4276	Hrušica
00050000-5645-e47d-e706-f3c06a8ef511	5280	Idrija
00050000-5645-e47d-1c36-f904937ba91e	1292	Ig
00050000-5645-e47d-800f-55c9a5df376f	6250	Ilirska Bistrica
00050000-5645-e47d-f39d-48e2fdfca6a8	6251	Ilirska Bistrica-Trnovo
00050000-5645-e47d-13d7-27ee887d739e	1295	Ivančna Gorica
00050000-5645-e47d-30ed-8d62949af1b6	2259	Ivanjkovci
00050000-5645-e47d-861d-8adb2d5b63d1	1411	Izlake
00050000-5645-e47d-6bc4-7e957b65fb71	6310	Izola/Isola
00050000-5645-e47d-5288-5fff8e7ad00a	2222	Jakobski Dol
00050000-5645-e47d-b9b2-2acdb9e59d89	2221	Jarenina
00050000-5645-e47d-9a8f-e114de3bf7c9	6254	Jelšane
00050000-5645-e47d-e633-22fc3a253a36	4270	Jesenice
00050000-5645-e47d-3828-20796a86c163	8261	Jesenice na Dolenjskem
00050000-5645-e47d-e2cb-752687964724	3273	Jurklošter
00050000-5645-e47d-39c6-821960ea5879	2223	Jurovski Dol
00050000-5645-e47d-bfee-cad1c4c3cb34	2256	Juršinci
00050000-5645-e47d-eaef-4be9566d5e04	5214	Kal nad Kanalom
00050000-5645-e47d-716b-ab1c69c45745	3233	Kalobje
00050000-5645-e47d-0a9f-7d5b94d0b2d7	4246	Kamna Gorica
00050000-5645-e47d-b69a-0b84746a53a5	2351	Kamnica
00050000-5645-e47d-f3fd-f290a732dba0	1241	Kamnik
00050000-5645-e47d-a1bc-a4d56b2f1fb3	5213	Kanal
00050000-5645-e47d-020c-16d5d2794e94	8258	Kapele
00050000-5645-e47d-29f4-d942e2e3af02	2362	Kapla
00050000-5645-e47d-7389-f05bb5571b59	2325	Kidričevo
00050000-5645-e47d-f26c-09cb81b8fd56	1412	Kisovec
00050000-5645-e47d-3201-dcf3e78cd5a6	6253	Knežak
00050000-5645-e47d-26b8-3a7a3ff33b27	5222	Kobarid
00050000-5645-e47d-66d2-ab7fe06d8a37	9227	Kobilje
00050000-5645-e47d-b598-03ce40b935ed	1330	Kočevje
00050000-5645-e47d-7978-fc7044eb3c21	1338	Kočevska Reka
00050000-5645-e47d-4198-0b5818c852c6	2276	Kog
00050000-5645-e47d-600a-bd71a2b8b184	5211	Kojsko
00050000-5645-e47d-9ab8-2880e23e483b	6223	Komen
00050000-5645-e47d-bb49-5caa41c56906	1218	Komenda
00050000-5645-e47d-40dd-3b972c5b7b7a	6000	Koper/Capodistria 
00050000-5645-e47d-fcde-e51b20da4d5e	6001	Koper/Capodistria - poštni predali
00050000-5645-e47d-b78e-2466dd5e9449	8282	Koprivnica
00050000-5645-e47d-dde1-ef132abd9aa0	5296	Kostanjevica na Krasu
00050000-5645-e47d-b4f4-70f2e3c35fc3	8311	Kostanjevica na Krki
00050000-5645-e47d-0f0d-ba73ad3d0641	1336	Kostel
00050000-5645-e47d-a16d-b0c79f2a5b0e	6256	Košana
00050000-5645-e47d-fbbc-fda6482e00bc	2394	Kotlje
00050000-5645-e47d-08b9-d3350689add2	6240	Kozina
00050000-5645-e47d-a0a0-22f5dd250bdb	3260	Kozje
00050000-5645-e47d-32d9-cb7078d25fad	4000	Kranj 
00050000-5645-e47d-755b-f8a91dbf1f64	4001	Kranj - poštni predali
00050000-5645-e47d-6656-6978fa27c604	4280	Kranjska Gora
00050000-5645-e47d-05c0-3850f4584cbd	1281	Kresnice
00050000-5645-e47d-4642-c449111e5528	4294	Križe
00050000-5645-e47d-6670-70323502b117	9206	Križevci
00050000-5645-e47d-6b31-4203f6b56ab1	9242	Križevci pri Ljutomeru
00050000-5645-e47d-6a53-5a4fe2fcff2b	1301	Krka
00050000-5645-e47d-30bb-48c7812237bd	8296	Krmelj
00050000-5645-e47d-78d0-eabd08abb969	4245	Kropa
00050000-5645-e47d-28a7-06ae03d97cfb	8262	Krška vas
00050000-5645-e47d-80e4-7ca911af1f26	8270	Krško
00050000-5645-e47d-8155-27527a708f94	9263	Kuzma
00050000-5645-e47d-09e9-54c85ad8fb92	2318	Laporje
00050000-5645-e47d-c15a-92954a548307	3270	Laško
00050000-5645-e47d-3b5f-d90a35c93355	1219	Laze v Tuhinju
00050000-5645-e47d-1a57-1088dfbaad0b	2230	Lenart v Slovenskih goricah
00050000-5645-e47d-4df7-d38147f85222	9220	Lendava/Lendva
00050000-5645-e47d-21ff-1455a32a8fba	4248	Lesce
00050000-5645-e47d-fd97-35f265b6b9bc	3261	Lesično
00050000-5645-e47d-d4cf-6e2eb7693dd2	8273	Leskovec pri Krškem
00050000-5645-e47d-5b4f-8d15a0cda7a0	2372	Libeliče
00050000-5645-e47d-81f1-c928bcdb1696	2341	Limbuš
00050000-5645-e47d-c33b-fdcf013c06de	1270	Litija
00050000-5645-e47d-57ac-9661812f3466	3202	Ljubečna
00050000-5645-e47d-4223-332672f85e05	1000	Ljubljana 
00050000-5645-e47d-b17b-ddc72ff22f54	1001	Ljubljana - poštni predali
00050000-5645-e47d-f400-1cb506f42417	1231	Ljubljana - Črnuče
00050000-5645-e47d-8522-c6837090f760	1261	Ljubljana - Dobrunje
00050000-5645-e47d-88f3-4813af6290f6	1260	Ljubljana - Polje
00050000-5645-e47d-5b2c-f8a04ab710d4	1210	Ljubljana - Šentvid
00050000-5645-e47d-942a-a719d1298840	1211	Ljubljana - Šmartno
00050000-5645-e47d-9736-4c4ae27a4695	3333	Ljubno ob Savinji
00050000-5645-e47d-b7e8-e6bf686112f9	9240	Ljutomer
00050000-5645-e47d-6140-58d969b3d45e	3215	Loče
00050000-5645-e47d-1f97-ef31b5893c72	5231	Log pod Mangartom
00050000-5645-e47d-d644-d23faaaed582	1358	Log pri Brezovici
00050000-5645-e47d-b122-effb980749d9	1370	Logatec
00050000-5645-e47d-2cef-adb5693416ce	1371	Logatec
00050000-5645-e47d-2561-1525ac30283a	1434	Loka pri Zidanem Mostu
00050000-5645-e47d-f520-5912e32bb7c4	3223	Loka pri Žusmu
00050000-5645-e47d-ff0f-2b1bea5dde84	6219	Lokev
00050000-5645-e47d-d09d-4ecf089625df	1318	Loški Potok
00050000-5645-e47d-2524-9ffc383c9b82	2324	Lovrenc na Dravskem polju
00050000-5645-e47d-63b5-df3ed779d8cd	2344	Lovrenc na Pohorju
00050000-5645-e47d-f7de-11bd46bd57a3	3334	Luče
00050000-5645-e47d-a955-8e110d24764a	1225	Lukovica
00050000-5645-e47d-f4d4-3694d7d81b21	9202	Mačkovci
00050000-5645-e47d-c608-1d570df90a47	2322	Majšperk
00050000-5645-e47d-8b66-b74566b315a9	2321	Makole
00050000-5645-e47d-d6d5-a934684b1aa3	9243	Mala Nedelja
00050000-5645-e47d-47fc-97db7f18918f	2229	Malečnik
00050000-5645-e47d-71c4-48894bbcdaad	6273	Marezige
00050000-5645-e47d-7eb7-de022296b369	2000	Maribor 
00050000-5645-e47d-fa09-9993ec475b39	2001	Maribor - poštni predali
00050000-5645-e47d-4793-50c83cc7173c	2206	Marjeta na Dravskem polju
00050000-5645-e47d-a323-9c6165548a07	2281	Markovci
00050000-5645-e47d-135a-ce4e1a140939	9221	Martjanci
00050000-5645-e47d-fe5e-da07c4906e89	6242	Materija
00050000-5645-e47d-aaf2-e63a8156704a	4211	Mavčiče
00050000-5645-e47d-f68a-c69dd3887d19	1215	Medvode
00050000-5645-e47d-ff15-da5714ab74d6	1234	Mengeš
00050000-5645-e47d-d113-4bff31c008a8	8330	Metlika
00050000-5645-e47d-1e8b-a392832d94a1	2392	Mežica
00050000-5645-e47d-bc2b-38f1e9efa954	2204	Miklavž na Dravskem polju
00050000-5645-e47d-ebfc-58047a0b6c08	2275	Miklavž pri Ormožu
00050000-5645-e47d-f284-875a6b948506	5291	Miren
00050000-5645-e47d-a077-7fdc59f7d934	8233	Mirna
00050000-5645-e47d-3d86-7ded4843f581	8216	Mirna Peč
00050000-5645-e47d-e389-7838b71357c8	2382	Mislinja
00050000-5645-e47d-c3c8-3e04d71148d2	4281	Mojstrana
00050000-5645-e47d-8774-8a33c8af72ba	8230	Mokronog
00050000-5645-e47d-d5a9-46942b5e7587	1251	Moravče
00050000-5645-e47d-fd57-ad84c51a0987	9226	Moravske Toplice
00050000-5645-e47d-156d-6c7a408a70de	5216	Most na Soči
00050000-5645-e47d-ff05-19de39e3963a	1221	Motnik
00050000-5645-e47d-a721-fd9d658c1aa6	3330	Mozirje
00050000-5645-e47d-9bcf-3cff5a8cf87b	9000	Murska Sobota 
00050000-5645-e47d-1e32-cd6cfe4bcde4	9001	Murska Sobota - poštni predali
00050000-5645-e47d-4177-c9c44e147a5a	2366	Muta
00050000-5645-e47d-5fa1-de4e2d3f1b52	4202	Naklo
00050000-5645-e47d-7c28-564f1ff6bf2d	3331	Nazarje
00050000-5645-e47d-2f84-32902e5973a6	1357	Notranje Gorice
00050000-5645-e47d-9555-8aa7be7bd625	3203	Nova Cerkev
00050000-5645-e47d-9ef5-f642cef07640	5000	Nova Gorica 
00050000-5645-e47d-a7dd-144d25b07981	5001	Nova Gorica - poštni predali
00050000-5645-e47d-ff4b-9f1e74c383ab	1385	Nova vas
00050000-5645-e47d-e338-2d95c3de449d	8000	Novo mesto
00050000-5645-e47d-5e63-ddb60528c56f	8001	Novo mesto - poštni predali
00050000-5645-e47d-ab63-117943ea2fea	6243	Obrov
00050000-5645-e47d-cb9f-5572df58d204	9233	Odranci
00050000-5645-e47d-2714-6a62bb663f29	2317	Oplotnica
00050000-5645-e47d-772a-077fcee8b848	2312	Orehova vas
00050000-5645-e47d-5a60-ed01a12e550d	2270	Ormož
00050000-5645-e47d-707f-65b1d1890167	1316	Ortnek
00050000-5645-e47d-74f0-014661976671	1337	Osilnica
00050000-5645-e47d-224a-77f64f871247	8222	Otočec
00050000-5645-e47d-40b5-8c9bdf609f59	2361	Ožbalt
00050000-5645-e47d-035a-d9b743c743b7	2231	Pernica
00050000-5645-e47d-cc28-2c5e31d11e8b	2211	Pesnica pri Mariboru
00050000-5645-e47d-1f6a-7f109c05078d	9203	Petrovci
00050000-5645-e47d-5402-f698a6d8b953	3301	Petrovče
00050000-5645-e47d-6c2b-c2ada4ba1664	6330	Piran/Pirano
00050000-5645-e47d-d4a6-8e3e6b69bfc9	8255	Pišece
00050000-5645-e47d-ec10-2efffb8bdc74	6257	Pivka
00050000-5645-e47d-3b9d-501a31d628a2	6232	Planina
00050000-5645-e47d-2c4e-4bfeff49a5a1	3225	Planina pri Sevnici
00050000-5645-e47d-4b0e-fcd911fda23f	6276	Pobegi
00050000-5645-e47d-7604-711b4bdef766	8312	Podbočje
00050000-5645-e47d-64c5-48a8b27a5fa2	5243	Podbrdo
00050000-5645-e47d-47e0-9adfa734c09f	3254	Podčetrtek
00050000-5645-e47d-7cc4-5772d7653312	2273	Podgorci
00050000-5645-e47d-b7c2-1a165630f7e0	6216	Podgorje
00050000-5645-e47d-9808-ddbd810db68a	2381	Podgorje pri Slovenj Gradcu
00050000-5645-e47d-7305-367ca0cae3dd	6244	Podgrad
00050000-5645-e47d-73c7-2f8b6d217c59	1414	Podkum
00050000-5645-e47d-fc18-d361cb0757d4	2286	Podlehnik
00050000-5645-e47d-508a-dcef246d7b14	5272	Podnanos
00050000-5645-e47d-46f9-5c5f24a12a91	4244	Podnart
00050000-5645-e47d-3e1b-eb9b9e3cab6d	3241	Podplat
00050000-5645-e47d-c3c6-3ca683ecbb7c	3257	Podsreda
00050000-5645-e47d-9957-5be35b0d1ba4	2363	Podvelka
00050000-5645-e47d-1289-bc07d713cf6b	2208	Pohorje
00050000-5645-e47d-2302-e4187acef333	2257	Polenšak
00050000-5645-e47d-73e7-02c45e7996d2	1355	Polhov Gradec
00050000-5645-e47d-d0e6-e4f92e699edc	4223	Poljane nad Škofjo Loko
00050000-5645-e47d-75e3-fcb69e676dae	2319	Poljčane
00050000-5645-e47d-6949-58df0d0f2dd2	1272	Polšnik
00050000-5645-e47d-e7d8-6b3e0d11de12	3313	Polzela
00050000-5645-e47d-9557-a41b447595bc	3232	Ponikva
00050000-5645-e47d-709e-3876a84daae7	6320	Portorož/Portorose
00050000-5645-e47d-e712-7879d4a7adea	6230	Postojna
00050000-5645-e47d-8fde-b3c9238b8a0f	2331	Pragersko
00050000-5645-e47d-738b-e5be5ba6b559	3312	Prebold
00050000-5645-e47d-1abb-e35d179963c9	4205	Preddvor
00050000-5645-e47d-76a9-0d05c67110ab	6255	Prem
00050000-5645-e47d-6da4-95a7ca026c20	1352	Preserje
00050000-5645-e47d-6bf5-782eb93c318e	6258	Prestranek
00050000-5645-e47d-c13c-a67babe6610c	2391	Prevalje
00050000-5645-e47d-1099-328c3ee77601	3262	Prevorje
00050000-5645-e47d-8b4a-60ddcf3700a6	1276	Primskovo 
00050000-5645-e47d-fed4-67da1762f708	3253	Pristava pri Mestinju
00050000-5645-e47d-7517-a65c99a1cc33	9207	Prosenjakovci/Partosfalva
00050000-5645-e47d-f614-7293505be10b	5297	Prvačina
00050000-5645-e47d-57ea-c43dea440d40	2250	Ptuj
00050000-5645-e47d-7df7-384656e15135	2323	Ptujska Gora
00050000-5645-e47d-5358-db71a704bc7b	9201	Puconci
00050000-5645-e47d-feb6-9a6be17d1445	2327	Rače
00050000-5645-e47d-eccd-20ffad09790e	1433	Radeče
00050000-5645-e47d-243d-83b500b7c4e7	9252	Radenci
00050000-5645-e47d-11bd-e5a17501c48b	2360	Radlje ob Dravi
00050000-5645-e47d-5ee6-89684047b2f1	1235	Radomlje
00050000-5645-e47d-facf-838ec6547139	4240	Radovljica
00050000-5645-e47d-49ec-92df48fd231b	8274	Raka
00050000-5645-e47d-1efb-6c700de7fdc3	1381	Rakek
00050000-5645-e47d-220d-a9e6c98fc58a	4283	Rateče - Planica
00050000-5645-e47d-e741-37129c5d9341	2390	Ravne na Koroškem
00050000-5645-e47d-db8e-5c8bc030f2a0	9246	Razkrižje
00050000-5645-e47d-5188-ce57d4e6ccdb	3332	Rečica ob Savinji
00050000-5645-e47d-d64a-f26ceee5cfed	5292	Renče
00050000-5645-e47d-f00c-65f6455831a4	1310	Ribnica
00050000-5645-e47d-1685-dea0e8d84b2e	2364	Ribnica na Pohorju
00050000-5645-e47d-080a-f1e5b4aea083	3272	Rimske Toplice
00050000-5645-e47d-82bf-e9e0a9ad9d9b	1314	Rob
00050000-5645-e47d-f295-d79c594e29de	5215	Ročinj
00050000-5645-e47d-2ccf-e4229f208369	3250	Rogaška Slatina
00050000-5645-e47d-446c-380d7804eb11	9262	Rogašovci
00050000-5645-e47d-ff95-dd32cd7af562	3252	Rogatec
00050000-5645-e47d-b3fb-7aff55e3b8e2	1373	Rovte
00050000-5645-e47d-3655-99103c1b5ce5	2342	Ruše
00050000-5645-e47d-9a15-b5227a804fb6	1282	Sava
00050000-5645-e47d-dd5a-24eabdbc209e	6333	Sečovlje/Sicciole
00050000-5645-e47d-234a-3596a26faddb	4227	Selca
00050000-5645-e47d-11e0-aaab1b19ee73	2352	Selnica ob Dravi
00050000-5645-e47d-4e51-307bc4c7cb05	8333	Semič
00050000-5645-e47d-edf7-f9784e77b29c	8281	Senovo
00050000-5645-e47d-7b18-aad8c283ef72	6224	Senožeče
00050000-5645-e47d-d68d-ddad3c685dd9	8290	Sevnica
00050000-5645-e47d-5a48-3e2494609910	6210	Sežana
00050000-5645-e47d-ce9f-2d61c03a7d1c	2214	Sladki Vrh
00050000-5645-e47d-668f-23da6c0f0114	5283	Slap ob Idrijci
00050000-5645-e47d-a826-6744ecdf1255	2380	Slovenj Gradec
00050000-5645-e47d-57f1-c6350ff4ade6	2310	Slovenska Bistrica
00050000-5645-e47d-23af-6ce17746bcbc	3210	Slovenske Konjice
00050000-5645-e47d-45c9-0f4d93a8bcaa	1216	Smlednik
00050000-5645-e47d-4da1-7f38d42a2839	5232	Soča
00050000-5645-e47d-63be-d6715d86e724	1317	Sodražica
00050000-5645-e47d-e144-e5fdcf5517ae	3335	Solčava
00050000-5645-e47d-71b5-6c178afc271d	5250	Solkan
00050000-5645-e47d-4249-aa5abc8996e1	4229	Sorica
00050000-5645-e47d-c438-0b68530af0c3	4225	Sovodenj
00050000-5645-e47d-65c4-1e47e044ec53	5281	Spodnja Idrija
00050000-5645-e47d-c7a2-6588504773a0	2241	Spodnji Duplek
00050000-5645-e47d-1821-ae7b1b2fe018	9245	Spodnji Ivanjci
00050000-5645-e47d-05fe-abe26485e15f	2277	Središče ob Dravi
00050000-5645-e47d-ad87-19fd95eac658	4267	Srednja vas v Bohinju
00050000-5645-e47d-e39d-eba56177e315	8256	Sromlje 
00050000-5645-e47d-4f14-6832495a11ad	5224	Srpenica
00050000-5645-e47d-dff5-a10595d0554c	1242	Stahovica
00050000-5645-e47d-9743-c63edd267e4d	1332	Stara Cerkev
00050000-5645-e47d-01a4-b77d6848f654	8342	Stari trg ob Kolpi
00050000-5645-e47d-a955-5d5b16a9f240	1386	Stari trg pri Ložu
00050000-5645-e47d-c0a1-8d0c24d44955	2205	Starše
00050000-5645-e47d-3c23-595f962116dc	2289	Stoperce
00050000-5645-e47d-31af-dcefec786d2b	8322	Stopiče
00050000-5645-e47d-86ca-b1ff6264ee51	3206	Stranice
00050000-5645-e47d-1edb-7cb13b91cecb	8351	Straža
00050000-5645-e47d-5215-313174802cb8	1313	Struge
00050000-5645-e47d-6cbf-06c3059a14a1	8293	Studenec
00050000-5645-e47d-9236-f46709d58aad	8331	Suhor
00050000-5645-e47d-9bd0-089530a40472	2233	Sv. Ana v Slovenskih goricah
00050000-5645-e47d-c110-6b84bad4aa4e	2235	Sv. Trojica v Slovenskih goricah
00050000-5645-e47d-3aa8-f09440318d2c	2353	Sveti Duh na Ostrem Vrhu
00050000-5645-e47d-3982-97bb22fdcc07	9244	Sveti Jurij ob Ščavnici
00050000-5645-e47d-0348-fd3c2df10555	3264	Sveti Štefan
00050000-5645-e47d-621b-d353a279ebf4	2258	Sveti Tomaž
00050000-5645-e47d-0dd1-1172e33f0a8c	9204	Šalovci
00050000-5645-e47d-5cfc-9593e54c7820	5261	Šempas
00050000-5645-e47d-9c81-3ffccff69d66	5290	Šempeter pri Gorici
00050000-5645-e47d-0bdc-2f07d65cde99	3311	Šempeter v Savinjski dolini
00050000-5645-e47d-7d05-b08adc54d480	4208	Šenčur
00050000-5645-e47d-6f7c-18240796d50b	2212	Šentilj v Slovenskih goricah
00050000-5645-e47d-2b64-4903eed223e3	8297	Šentjanž
00050000-5645-e47d-a8ef-c7a0afeebf84	2373	Šentjanž pri Dravogradu
00050000-5645-e47d-efe7-b00a18c17a72	8310	Šentjernej
00050000-5645-e47d-569c-4da8f2f2dd37	3230	Šentjur
00050000-5645-e47d-3658-27bad16fd40a	3271	Šentrupert
00050000-5645-e47d-733c-a500cf4c7298	8232	Šentrupert
00050000-5645-e47d-05f6-cf15e7a297cd	1296	Šentvid pri Stični
00050000-5645-e47d-2ef0-0db5abfeaf3d	8275	Škocjan
00050000-5645-e47d-718d-20c76b9a8fb6	6281	Škofije
00050000-5645-e47d-2ffe-08bbb76ebf5d	4220	Škofja Loka
00050000-5645-e47d-af82-5bedfb42819b	3211	Škofja vas
00050000-5645-e47d-499d-802a9c67df63	1291	Škofljica
00050000-5645-e47d-4855-febeb60fae68	6274	Šmarje
00050000-5645-e47d-75fa-f0385f15979f	1293	Šmarje - Sap
00050000-5645-e47d-6e88-9141dbd15abc	3240	Šmarje pri Jelšah
00050000-5645-e47d-6e62-84128a7d4e8c	8220	Šmarješke Toplice
00050000-5645-e47d-759d-da6c36360406	2315	Šmartno na Pohorju
00050000-5645-e47d-2512-ee73ac0fc2b8	3341	Šmartno ob Dreti
00050000-5645-e47d-5528-3a0fe9f45e4e	3327	Šmartno ob Paki
00050000-5645-e47d-ff0a-acb795555e10	1275	Šmartno pri Litiji
00050000-5645-e47d-2ac8-707e6816f26e	2383	Šmartno pri Slovenj Gradcu
00050000-5645-e47d-7b8b-14c0d22055be	3201	Šmartno v Rožni dolini
00050000-5645-e47d-8ecc-07ea4601127e	3325	Šoštanj
00050000-5645-e47d-a507-332cac011121	6222	Štanjel
00050000-5645-e47d-7af4-ec35dd917509	3220	Štore
00050000-5645-e47d-6147-18dca1c6f3b5	3304	Tabor
00050000-5645-e47d-e341-5b0e105ce90f	3221	Teharje
00050000-5645-e47d-873e-aef68ba219c0	9251	Tišina
00050000-5645-e47d-b330-3d3e345eedde	5220	Tolmin
00050000-5645-e47d-5816-d01a8fb0062f	3326	Topolšica
00050000-5645-e47d-1b99-6471fbcff0e1	2371	Trbonje
00050000-5645-e47d-9d00-25db1b64326c	1420	Trbovlje
00050000-5645-e47d-7ba2-895996a85a6f	8231	Trebelno 
00050000-5645-e47d-26e6-bc71f6936f48	8210	Trebnje
00050000-5645-e47d-22e4-d60cc4937e56	5252	Trnovo pri Gorici
00050000-5645-e47d-c9d8-d7c96cb1b5e3	2254	Trnovska vas
00050000-5645-e47d-a859-82ea40157c7e	1222	Trojane
00050000-5645-e47d-6687-a65d953b7309	1236	Trzin
00050000-5645-e47d-5e45-3246a1e3c80e	4290	Tržič
00050000-5645-e47d-ca35-5dd089cb4952	8295	Tržišče
00050000-5645-e47d-598d-be10b2d5485f	1311	Turjak
00050000-5645-e47d-f73a-3ca08c3cb8c8	9224	Turnišče
00050000-5645-e47d-48da-2392ac27d5f5	8323	Uršna sela
00050000-5645-e47d-b369-d397060cd2a6	1252	Vače
00050000-5645-e47d-cb64-88af23ab5165	3320	Velenje 
00050000-5645-e47d-4212-c5408f9d7e22	3322	Velenje - poštni predali
00050000-5645-e47d-7076-4b991d7ebf46	8212	Velika Loka
00050000-5645-e47d-2527-6f69ec85bfed	2274	Velika Nedelja
00050000-5645-e47d-2aa9-9b0207143c58	9225	Velika Polana
00050000-5645-e47d-afe0-6d63705b5f14	1315	Velike Lašče
00050000-5645-e47d-8703-3def3fdf0abe	8213	Veliki Gaber
00050000-5645-e47d-77cc-70081c83dbdb	9241	Veržej
00050000-5645-e47d-648e-22bf1d39c1f4	1312	Videm - Dobrepolje
00050000-5645-e47d-028b-498363c5655b	2284	Videm pri Ptuju
00050000-5645-e47d-3c02-fb1300f05c3e	8344	Vinica
00050000-5645-e47d-7612-ff04e72441ee	5271	Vipava
00050000-5645-e47d-326d-c5b12abfe1b1	4212	Visoko
00050000-5645-e47d-1cb2-4100acc719bb	1294	Višnja Gora
00050000-5645-e47d-8734-23a86ec99266	3205	Vitanje
00050000-5645-e47d-2a41-70ecdafa9a9e	2255	Vitomarci
00050000-5645-e47d-ed1e-4dce00cff930	1217	Vodice
00050000-5645-e47d-e91e-b499fee6041a	3212	Vojnik\t
00050000-5645-e47d-9027-7405bc18be69	5293	Volčja Draga
00050000-5645-e47d-3745-3abec199ed60	2232	Voličina
00050000-5645-e47d-63fd-2f18c439debe	3305	Vransko
00050000-5645-e47d-8230-8ed42670f1e8	6217	Vremski Britof
00050000-5645-e47d-6718-8aaa89db6bfd	1360	Vrhnika
00050000-5645-e47d-0369-e59956d25f19	2365	Vuhred
00050000-5645-e47d-50d8-3290cf8145cd	2367	Vuzenica
00050000-5645-e47d-40ae-7ffcdef50fcb	8292	Zabukovje 
00050000-5645-e47d-f74f-dac53e4c1822	1410	Zagorje ob Savi
00050000-5645-e47d-6e3e-09f8c5b0aa99	1303	Zagradec
00050000-5645-e47d-f4a8-452729b8dccc	2283	Zavrč
00050000-5645-e47d-3092-5823d2aea80b	8272	Zdole 
00050000-5645-e47d-6143-0723609fd2c1	4201	Zgornja Besnica
00050000-5645-e47d-69d3-35380fddecab	2242	Zgornja Korena
00050000-5645-e47d-f912-0615ac3b0a6a	2201	Zgornja Kungota
00050000-5645-e47d-1319-80de3e45d320	2316	Zgornja Ložnica
00050000-5645-e47d-26ec-70cd2e67951d	2314	Zgornja Polskava
00050000-5645-e47d-8a1d-f0d455b87e83	2213	Zgornja Velka
00050000-5645-e47d-1c89-cd765d639dae	4247	Zgornje Gorje
00050000-5645-e47d-1ff1-9268d62f53a4	4206	Zgornje Jezersko
00050000-5645-e47d-c129-42684fbd432f	2285	Zgornji Leskovec
00050000-5645-e47d-fa0b-0f9f0fc4603f	1432	Zidani Most
00050000-5645-e47d-4374-2dfb1f667f20	3214	Zreče
00050000-5645-e47d-0309-d5be1e56fd9e	4209	Žabnica
00050000-5645-e47d-b2a8-59cd120b109e	3310	Žalec
00050000-5645-e47d-2242-adeffd28f770	4228	Železniki
00050000-5645-e47d-c358-99732dc0be01	2287	Žetale
00050000-5645-e47d-426b-e8f222772c32	4226	Žiri
00050000-5645-e47d-6b99-9c36135258b3	4274	Žirovnica
00050000-5645-e47d-6276-eccdeca226a7	8360	Žužemberk
\.


--
-- TOC entry 3161 (class 0 OID 26767063)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 26766639)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 26766387)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5645-e480-e331-abc0fb790555	00080000-5645-e480-fc4b-1a4f8b44725d	\N	00040000-5645-e47d-64ad-91f61779b0bf	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5645-e480-8c73-1787f2d48e37	00080000-5645-e480-fc4b-1a4f8b44725d	\N	00040000-5645-e47d-64ad-91f61779b0bf	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5645-e480-9048-bfb536c579e7	00080000-5645-e480-199a-b716ad552a32	\N	00040000-5645-e47d-64ad-91f61779b0bf	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3123 (class 0 OID 26766531)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5645-e47d-6234-087684e1f42f	novo leto	1	1	\N	t
00430000-5645-e47d-5098-f26faa632003	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5645-e47d-d9de-01461d793ce3	dan upora proti okupatorju	27	4	\N	t
00430000-5645-e47d-f1a4-00e8b1f5b20a	praznik dela	1	5	\N	t
00430000-5645-e47d-510f-88b9617f1849	praznik dela	2	5	\N	t
00430000-5645-e47d-3c0c-fad1da138fc9	dan Primoža Trubarja	8	6	\N	f
00430000-5645-e47d-e040-d0abd8089f83	dan državnosti	25	6	\N	t
00430000-5645-e47d-69fc-49455fe35fc3	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5645-e47d-7832-e2eaf6c38ebc	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5645-e47d-389b-0cf996bca270	dan suverenosti	25	10	\N	f
00430000-5645-e47d-592b-fe5421db4e06	dan spomina na mrtve	1	11	\N	t
00430000-5645-e47d-e170-2f6d70a54e6f	dan Rudolfa Maistra	23	11	\N	f
00430000-5645-e47d-a899-6f879195a73b	božič	25	12	\N	t
00430000-5645-e47d-f861-6a65bafd2ba5	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5645-e47d-bce7-3c0732c39304	Marijino vnebovzetje	15	8	\N	t
00430000-5645-e47d-88a1-ca23cb68d899	dan reformacije	31	10	\N	t
00430000-5645-e47d-373b-07fbc95b82cd	velikonočna nedelja	27	3	2016	t
00430000-5645-e47d-aef9-3129e85f724b	velikonočna nedelja	16	4	2017	t
00430000-5645-e47d-2865-e4602754dc0e	velikonočna nedelja	1	4	2018	t
00430000-5645-e47d-7763-99605d30954f	velikonočna nedelja	21	4	2019	t
00430000-5645-e47d-eaa5-2763c29127f2	velikonočna nedelja	12	4	2020	t
00430000-5645-e47d-4300-ed278c6b0309	velikonočna nedelja	4	4	2021	t
00430000-5645-e47d-a7cb-64904654f922	velikonočna nedelja	17	4	2022	t
00430000-5645-e47d-dcba-65bcd5593909	velikonočna nedelja	9	4	2023	t
00430000-5645-e47d-e4fb-2472365d2238	velikonočna nedelja	31	3	2024	t
00430000-5645-e47d-3413-a9565269c408	velikonočna nedelja	20	4	2025	t
00430000-5645-e47d-fbc6-bcbfd0aab1da	velikonočna nedelja	5	4	2026	t
00430000-5645-e47d-7f18-15c8b49cfa23	velikonočna nedelja	28	3	2027	t
00430000-5645-e47d-7259-0abca5c47bc5	velikonočna nedelja	16	4	2028	t
00430000-5645-e47d-eb10-42f230d9b871	velikonočna nedelja	1	4	2029	t
00430000-5645-e47d-d553-5d812d5d0b7d	velikonočna nedelja	21	4	2030	t
00430000-5645-e47d-e702-740e7cfa46c2	velikonočni ponedeljek	28	3	2016	t
00430000-5645-e47d-c72a-aa944f239ebc	velikonočni ponedeljek	17	4	2017	t
00430000-5645-e47d-1eb7-8f713e1720a5	velikonočni ponedeljek	2	4	2018	t
00430000-5645-e47d-c9a6-e9b4713dc94e	velikonočni ponedeljek	22	4	2019	t
00430000-5645-e47d-37f5-5cde1e4a73da	velikonočni ponedeljek	13	4	2020	t
00430000-5645-e47d-9e21-037b650fd7c2	velikonočni ponedeljek	5	4	2021	t
00430000-5645-e47d-181c-33f623da0e88	velikonočni ponedeljek	18	4	2022	t
00430000-5645-e47d-d9cb-0d6ad388226c	velikonočni ponedeljek	10	4	2023	t
00430000-5645-e47d-f58c-d4e5a4183e2e	velikonočni ponedeljek	1	4	2024	t
00430000-5645-e47d-991e-2e32b378f1ea	velikonočni ponedeljek	21	4	2025	t
00430000-5645-e47d-c3e7-0d2bf3712d09	velikonočni ponedeljek	6	4	2026	t
00430000-5645-e47d-64c6-97e8f132d2d2	velikonočni ponedeljek	29	3	2027	t
00430000-5645-e47d-b876-742b1c3a8786	velikonočni ponedeljek	17	4	2028	t
00430000-5645-e47d-9742-5daf9792512a	velikonočni ponedeljek	2	4	2029	t
00430000-5645-e47d-4224-795c2c9e6f85	velikonočni ponedeljek	22	4	2030	t
00430000-5645-e47d-af85-fcbed6c689c6	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5645-e47d-0cff-8f2c2726475b	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5645-e47d-ddb2-0810fe90d9b9	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5645-e47d-577a-65f8648844f4	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5645-e47d-2866-cafd6e3efd67	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5645-e47d-559c-910cb7c82f58	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5645-e47d-92c4-f38314cdaf78	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5645-e47d-92a2-e0c7d9ffc23c	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5645-e47d-8057-4a60753b173d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5645-e47d-e01a-eec2d00f76d5	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5645-e47d-7ee4-36bed09d6646	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5645-e47d-38f6-4d12a781a475	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5645-e47d-3f17-94c7cb73d040	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5645-e47d-cabf-d63a707ecb0f	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5645-e47d-f67e-1300ee3ed2ff	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3119 (class 0 OID 26766491)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 26766503)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 26766651)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 26767077)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 26767087)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5645-e480-29ba-6a7ab2aec4ad	00080000-5645-e480-4674-0eb966b67fd8	0987	AK
00190000-5645-e480-136c-8dee98aa5afe	00080000-5645-e480-199a-b716ad552a32	0989	AK
00190000-5645-e480-8c6d-44fa73118e8a	00080000-5645-e480-3dc7-98209df72a2c	0986	AK
00190000-5645-e480-b6d9-fd81498d0838	00080000-5645-e480-be6d-bd51fea1e5bd	0984	AK
00190000-5645-e480-f955-347d7441b05b	00080000-5645-e480-5003-baf123d01aa6	0983	AK
00190000-5645-e480-ce91-368d224e8df0	00080000-5645-e480-5812-4356a63fd75e	0982	AK
00190000-5645-e482-edc5-7029c3f8b50b	00080000-5645-e482-3960-b180836f3068	1001	AK
\.


--
-- TOC entry 3160 (class 0 OID 26766986)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5645-e480-e77b-3179cbdb38af	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3164 (class 0 OID 26767095)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 26766680)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5645-e480-8920-8ba4e3243478	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5645-e480-8a5b-34dc1b270a3d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5645-e480-9587-131606f8a246	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5645-e480-1e4d-64f54dd7e139	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5645-e480-eca1-543ee63a80bc	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5645-e480-a410-9556dee79a80	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5645-e480-e35f-fe0bc6303ece	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3132 (class 0 OID 26766624)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 26766614)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 26766825)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 26766755)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 26766465)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 26766227)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5645-e482-3960-b180836f3068	00010000-5645-e47e-1f31-89895d11dd99	2015-11-13 14:24:18	INS	a:0:{}
2	App\\Entity\\Option	00000000-5645-e482-74cb-558c1463d0ff	00010000-5645-e47e-1f31-89895d11dd99	2015-11-13 14:24:18	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5645-e482-edc5-7029c3f8b50b	00010000-5645-e47e-1f31-89895d11dd99	2015-11-13 14:24:18	INS	a:0:{}
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3141 (class 0 OID 26766693)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 26766265)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5645-e47e-f899-eb6c95e29d3d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5645-e47e-287a-f8346dd98784	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5645-e47e-c7f4-36bd8a2cfce4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5645-e47e-747c-d96402e0e181	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5645-e47e-5a85-6184e8a9f266	planer	Planer dogodkov v koledarju	t
00020000-5645-e47e-bd18-35dac75489d9	kadrovska	Kadrovska služba	t
00020000-5645-e47e-4fe9-c339e082b681	arhivar	Ažuriranje arhivalij	t
00020000-5645-e47e-f9bd-71739a081b62	igralec	Igralec	t
00020000-5645-e47e-0eb8-7856de81968f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5645-e480-e3ea-88ac54a47dc8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5645-e480-b504-0c4d90e78b3c	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5645-e480-796c-a6d5bdc10527	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5645-e480-6e7f-f8fb1b2dea0a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5645-e480-54df-a3864bbe6cfe	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5645-e480-b54f-f02d9d825c7c	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5645-e480-faac-3851ddc8a77c	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5645-e480-e3a3-1248b65c08a8	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5645-e480-b8dd-5ce10a9d7fbc	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5645-e480-8a7e-e43cb347eafd	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5645-e480-cba4-218c3c37f860	MapaAcl-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3098 (class 0 OID 26766249)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5645-e47e-25dc-71ebf0f5a5c1	00020000-5645-e47e-c7f4-36bd8a2cfce4
00010000-5645-e47e-1f31-89895d11dd99	00020000-5645-e47e-c7f4-36bd8a2cfce4
00010000-5645-e480-90f8-6ee0e81bb3ec	00020000-5645-e480-e3ea-88ac54a47dc8
00010000-5645-e480-878e-b3767bb7423e	00020000-5645-e480-b504-0c4d90e78b3c
00010000-5645-e480-878e-b3767bb7423e	00020000-5645-e480-b54f-f02d9d825c7c
00010000-5645-e480-878e-b3767bb7423e	00020000-5645-e480-8a7e-e43cb347eafd
00010000-5645-e480-3694-89821dc5f8cb	00020000-5645-e480-796c-a6d5bdc10527
00010000-5645-e480-3694-89821dc5f8cb	00020000-5645-e480-faac-3851ddc8a77c
00010000-5645-e480-3694-89821dc5f8cb	00020000-5645-e480-cba4-218c3c37f860
00010000-5645-e480-d8f5-2dca0001e3ec	00020000-5645-e480-796c-a6d5bdc10527
00010000-5645-e480-d8f5-2dca0001e3ec	00020000-5645-e480-faac-3851ddc8a77c
00010000-5645-e480-d8f5-2dca0001e3ec	00020000-5645-e480-b8dd-5ce10a9d7fbc
00010000-5645-e480-d8f5-2dca0001e3ec	00020000-5645-e480-cba4-218c3c37f860
00010000-5645-e480-0a9a-04a19ce27f6c	00020000-5645-e480-796c-a6d5bdc10527
00010000-5645-e480-0a9a-04a19ce27f6c	00020000-5645-e480-6e7f-f8fb1b2dea0a
00010000-5645-e480-0a9a-04a19ce27f6c	00020000-5645-e480-faac-3851ddc8a77c
00010000-5645-e480-0a9a-04a19ce27f6c	00020000-5645-e480-e3a3-1248b65c08a8
00010000-5645-e480-0a9a-04a19ce27f6c	00020000-5645-e480-b8dd-5ce10a9d7fbc
00010000-5645-e480-0a9a-04a19ce27f6c	00020000-5645-e480-b54f-f02d9d825c7c
00010000-5645-e480-0a9a-04a19ce27f6c	00020000-5645-e480-cba4-218c3c37f860
00010000-5645-e480-cb7b-7f6d78fc50a2	00020000-5645-e480-b504-0c4d90e78b3c
00010000-5645-e480-cb7b-7f6d78fc50a2	00020000-5645-e480-54df-a3864bbe6cfe
00010000-5645-e480-cb7b-7f6d78fc50a2	00020000-5645-e480-b54f-f02d9d825c7c
00010000-5645-e480-cb7b-7f6d78fc50a2	00020000-5645-e480-8a7e-e43cb347eafd
\.


--
-- TOC entry 3143 (class 0 OID 26766707)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 26766645)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 26766591)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5645-e480-5baf-63c19cae7f89	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5645-e480-4b02-82198e9a7482	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5645-e480-8a62-ae26a8b340d2	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3094 (class 0 OID 26766214)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5645-e47d-cf81-1cb35e363ecd	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5645-e47d-ddf9-247382a97d63	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5645-e47d-4e76-e82f7ef3f9cd	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5645-e47d-d02b-8027ceb96723	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5645-e47d-6b90-f5ac8263d57a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3093 (class 0 OID 26766206)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5645-e47d-85e8-3f944cf8ef34	00230000-5645-e47d-d02b-8027ceb96723	popa
00240000-5645-e47d-7164-469417e7eb38	00230000-5645-e47d-d02b-8027ceb96723	oseba
00240000-5645-e47d-6c90-c2ac7f47843c	00230000-5645-e47d-d02b-8027ceb96723	tippopa
00240000-5645-e47d-faa5-2d7440e8d0e1	00230000-5645-e47d-d02b-8027ceb96723	organizacijskaenota
00240000-5645-e47d-c365-824da2023cc0	00230000-5645-e47d-d02b-8027ceb96723	sezona
00240000-5645-e47d-6f65-c3fd43efb4c1	00230000-5645-e47d-d02b-8027ceb96723	tipvaje
00240000-5645-e47d-fef1-d0bb747faf98	00230000-5645-e47d-ddf9-247382a97d63	prostor
00240000-5645-e47d-dbd8-98685040cdf5	00230000-5645-e47d-d02b-8027ceb96723	besedilo
00240000-5645-e47d-c41d-7817c88abba4	00230000-5645-e47d-d02b-8027ceb96723	uprizoritev
00240000-5645-e47d-c572-ca6ab6dc6fe7	00230000-5645-e47d-d02b-8027ceb96723	funkcija
00240000-5645-e47d-8a5f-026020b7aee5	00230000-5645-e47d-d02b-8027ceb96723	tipfunkcije
00240000-5645-e47d-2e12-b979b1844df7	00230000-5645-e47d-d02b-8027ceb96723	alternacija
00240000-5645-e47d-65ba-ae845cd59a54	00230000-5645-e47d-cf81-1cb35e363ecd	pogodba
00240000-5645-e47d-1117-490aee00f6c9	00230000-5645-e47d-d02b-8027ceb96723	zaposlitev
00240000-5645-e47d-00b7-18a290b55cc7	00230000-5645-e47d-d02b-8027ceb96723	zvrstuprizoritve
00240000-5645-e47d-b1ac-6079f3f8e12f	00230000-5645-e47d-cf81-1cb35e363ecd	programdela
00240000-5645-e47d-a6bc-7888ffe2ba68	00230000-5645-e47d-d02b-8027ceb96723	zapis
\.


--
-- TOC entry 3092 (class 0 OID 26766201)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
3a3f2453-c007-4d30-9e95-2cc23c8ecc40	00240000-5645-e47d-85e8-3f944cf8ef34	0	1001
\.


--
-- TOC entry 3149 (class 0 OID 26766772)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5645-e480-726c-5e6a907da28d	000e0000-5645-e480-8522-ce4921610806	00080000-5645-e480-fc4b-1a4f8b44725d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5645-e47d-1e39-7452ad0fdd9f
00270000-5645-e480-fd13-9c6c5ca93bea	000e0000-5645-e480-8522-ce4921610806	00080000-5645-e480-fc4b-1a4f8b44725d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5645-e47d-1e39-7452ad0fdd9f
\.


--
-- TOC entry 3108 (class 0 OID 26766349)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 26766601)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5645-e481-4665-b6e644f93b0e	00180000-5645-e480-100a-5e50b5b7f338	000c0000-5645-e480-1c6e-5d4ea225891f	00090000-5645-e480-3901-7ce207c60d0c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-e481-ecc5-2d5e65bfc8af	00180000-5645-e480-100a-5e50b5b7f338	000c0000-5645-e480-b722-3ab1d47258f1	00090000-5645-e480-0424-3040108ab1b7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-e481-767e-db9f2a194b4d	00180000-5645-e480-100a-5e50b5b7f338	000c0000-5645-e480-384a-b00767e7a4a4	00090000-5645-e480-e7e7-d663baab7ed6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-e481-d218-147c5ccf82c4	00180000-5645-e480-100a-5e50b5b7f338	000c0000-5645-e480-2c52-15ae4f1c6396	00090000-5645-e480-752e-6b44316e927b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-e481-8c67-48685d75e2d9	00180000-5645-e480-100a-5e50b5b7f338	000c0000-5645-e480-5233-8a5415346f54	00090000-5645-e480-5ebd-5a292a48e1fd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-e481-5aab-434d0338ffb5	00180000-5645-e480-4cf2-6b0ad344c843	\N	00090000-5645-e480-5ebd-5a292a48e1fd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5645-e481-c79e-c71e8704eb6c	00180000-5645-e480-4cf2-6b0ad344c843	\N	00090000-5645-e480-0424-3040108ab1b7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3152 (class 0 OID 26766813)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5645-e47d-a991-f274cc42a520	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5645-e47d-5235-222c38f3da7d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5645-e47d-4865-b561a82761f7	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5645-e47d-48b0-c9ecce8fe75a	04	Režija	Režija	Režija	umetnik	30
000f0000-5645-e47d-538d-2f66fadfb144	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5645-e47d-089a-cba524657ee2	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5645-e47d-407a-861fb0559d06	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5645-e47d-4d66-b3515da910ee	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5645-e47d-b875-9a24a92474d3	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5645-e47d-5c13-0ff202ed3fc6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5645-e47d-1cbc-7b9e656825eb	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5645-e47d-5887-b5a61de2e0b6	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5645-e47d-9331-69ff3149d576	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5645-e47d-6c34-61d54267d137	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5645-e47d-47a3-e939b366f06d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5645-e47d-8f42-f8ac1cbc7953	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5645-e47d-37cb-2395e14d84ba	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5645-e47d-14bc-badb11663274	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3105 (class 0 OID 26766300)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5645-e480-fb1c-403b445c4869	0001	šola	osnovna ali srednja šola
00400000-5645-e480-b0a4-306715b627c1	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5645-e480-fa12-3be5249f1231	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3165 (class 0 OID 26767106)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5645-e47d-912e-6010e00bce0d	01	Velika predstava	f	1.00	1.00
002b0000-5645-e47d-5514-04842b5b55b4	02	Mala predstava	f	0.50	0.50
002b0000-5645-e47d-f253-5d518e9c794d	03	Mala koprodukcija	t	0.40	1.00
002b0000-5645-e47d-7d8d-29993d0e50ff	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5645-e47d-8118-6c16f79f38a9	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3128 (class 0 OID 26766581)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5645-e47d-5d22-25120212e786	0001	prva vaja	prva vaja
00420000-5645-e47d-8f97-1872a60b2703	0002	tehnična vaja	tehnična vaja
00420000-5645-e47d-e0a0-9e65f19fd16b	0003	lučna vaja	lučna vaja
00420000-5645-e47d-298f-0f27b0fc2270	0004	kostumska vaja	kostumska vaja
00420000-5645-e47d-b12b-2aa5122a1920	0005	foto vaja	foto vaja
00420000-5645-e47d-f8a5-a96f6aceb1f9	0006	1. glavna vaja	1. glavna vaja
00420000-5645-e47d-9f52-ce59de065888	0007	2. glavna vaja	2. glavna vaja
00420000-5645-e47d-bb6b-cf4a5c12af67	0008	1. generalka	1. generalka
00420000-5645-e47d-baba-9cba33a75851	0009	2. generalka	2. generalka
00420000-5645-e47d-fef4-b83e7da219eb	0010	odprta generalka	odprta generalka
00420000-5645-e47d-9197-ae993869ad4c	0011	obnovitvena vaja	obnovitvena vaja
00420000-5645-e47d-5569-241298027a55	0012	pevska vaja	pevska vaja
00420000-5645-e47d-cece-da770be49790	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5645-e47d-7ead-093065a47809	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3114 (class 0 OID 26766422)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 26766236)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5645-e47e-1f31-89895d11dd99	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROV3IT.k1.yggKF2t2mTHca5cigFpurFy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5645-e480-2146-851fb4133830	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5645-e480-da2e-d44372303ddb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5645-e480-c5d9-0d0498bc6155	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5645-e480-d78a-95d28388a70f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5645-e480-6bfb-49e403e69fbb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5645-e480-142a-125263f1a492	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5645-e480-f245-da2de3dbad57	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5645-e480-a21a-a68722fa3596	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5645-e480-7261-38d56b2337be	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5645-e480-90f8-6ee0e81bb3ec	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5645-e480-1744-b76703608cad	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5645-e480-878e-b3767bb7423e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5645-e480-3694-89821dc5f8cb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5645-e480-d8f5-2dca0001e3ec	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5645-e480-0a9a-04a19ce27f6c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5645-e480-cb7b-7f6d78fc50a2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5645-e47e-25dc-71ebf0f5a5c1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3156 (class 0 OID 26766863)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5645-e480-8430-8cfd7c1459f7	00160000-5645-e480-6f92-f5befd68058a	\N	00140000-5645-e47d-9de9-c41befe53361	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5645-e480-eca1-543ee63a80bc
000e0000-5645-e480-8522-ce4921610806	00160000-5645-e480-6a55-8c5a89a9a8fb	\N	00140000-5645-e47d-d0a1-64db343a05c7	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5645-e480-a410-9556dee79a80
000e0000-5645-e480-da09-45c7795dada0	\N	\N	00140000-5645-e47d-d0a1-64db343a05c7	00190000-5645-e480-29ba-6a7ab2aec4ad	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5645-e480-eca1-543ee63a80bc
000e0000-5645-e480-c722-83c62a600f17	\N	\N	00140000-5645-e47d-d0a1-64db343a05c7	00190000-5645-e480-29ba-6a7ab2aec4ad	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5645-e480-eca1-543ee63a80bc
000e0000-5645-e480-dccf-79581d6e808c	\N	\N	00140000-5645-e47d-d0a1-64db343a05c7	00190000-5645-e480-29ba-6a7ab2aec4ad	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5645-e480-8920-8ba4e3243478
000e0000-5645-e480-6f2b-a12a73e53d61	\N	\N	00140000-5645-e47d-d0a1-64db343a05c7	00190000-5645-e480-29ba-6a7ab2aec4ad	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5645-e480-8920-8ba4e3243478
\.


--
-- TOC entry 3122 (class 0 OID 26766521)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5645-e480-60e9-375c4fa5ba27	\N	000e0000-5645-e480-8522-ce4921610806	1	
00200000-5645-e480-9b05-5ef9210660b3	\N	000e0000-5645-e480-8522-ce4921610806	2	
00200000-5645-e480-01c4-f51306e0cbbf	\N	000e0000-5645-e480-8522-ce4921610806	3	
00200000-5645-e480-5cf0-3f7b69d6276f	\N	000e0000-5645-e480-8522-ce4921610806	4	
00200000-5645-e480-f7dd-a5b602064f61	\N	000e0000-5645-e480-8522-ce4921610806	5	
\.


--
-- TOC entry 3139 (class 0 OID 26766672)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 26766786)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5645-e47d-064f-8001b1ea8cbb	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5645-e47d-a6be-515933dc3491	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5645-e47d-6373-cc8b73d90bc7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5645-e47d-d8bd-21daee40ae06	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5645-e47d-3a81-a516b2044e1b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5645-e47d-563a-77d32a5e3229	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5645-e47d-bd52-f4b98966b568	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5645-e47d-2caa-74b185d03318	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5645-e47d-1e39-7452ad0fdd9f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5645-e47d-000f-14e3768e508b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5645-e47d-b80c-b22b50ff6942	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5645-e47d-d06b-1c05fb705d3b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5645-e47d-cb2a-8c7028a64878	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5645-e47d-bb37-c235da8d5999	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5645-e47d-bd10-9e3e0f100205	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5645-e47d-b229-739e33c90ee6	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5645-e47d-8a39-cb614e0a8d19	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5645-e47d-3c81-1c9a11af2f35	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5645-e47d-2fc6-49ea7e3edfbd	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5645-e47d-28bd-b9c072b33c01	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5645-e47d-e5f3-31d21901dc7f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5645-e47d-37c2-7eed58a14c53	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5645-e47d-c033-fd0eba5123f6	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5645-e47d-6120-670642c6785c	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5645-e47d-0d48-d402931d86c1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5645-e47d-fb25-2a5d6f304de2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5645-e47d-8e30-53bb612654ba	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5645-e47d-118b-ca28f99c51a6	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3168 (class 0 OID 26767156)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 26767125)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 26767168)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 26766744)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5645-e480-f035-26b8a3f7266c	00090000-5645-e480-0424-3040108ab1b7	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-e480-f621-a9c2d265c6aa	00090000-5645-e480-e7e7-d663baab7ed6	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-e480-422b-1cf6acb6e375	00090000-5645-e480-a20a-614fa54144c7	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-e480-a3ee-2b2aaa9ea198	00090000-5645-e480-cbb0-c5b3f507cb72	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-e480-d2b3-237f8d76cdf6	00090000-5645-e480-a682-41c9eaa8824c	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-e480-6c1d-70f75bf18b47	00090000-5645-e480-af8d-f12d3f6a2451	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3125 (class 0 OID 26766565)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 26766853)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5645-e47d-9de9-c41befe53361	01	Drama	drama (SURS 01)
00140000-5645-e47d-2015-2f2b672d8558	02	Opera	opera (SURS 02)
00140000-5645-e47d-5c65-472848b91f41	03	Balet	balet (SURS 03)
00140000-5645-e47d-1cf0-194e3304eea9	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5645-e47d-21b2-e2c4afec7cca	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5645-e47d-d0a1-64db343a05c7	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5645-e47d-c541-4302f2c50124	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3145 (class 0 OID 26766734)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2587 (class 2606 OID 26766299)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 26766912)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 26766902)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 26766290)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 26766769)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 26766811)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 26767208)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 26766553)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 26766575)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 26766580)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 26767123)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 26766448)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 26766980)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 26766730)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 26766519)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 26766486)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 26766462)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 26766637)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 26767185)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 26767192)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2868 (class 2606 OID 26767216)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2725 (class 2606 OID 26766664)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 26766420)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 26766318)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 26766382)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 26766345)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 26766279)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2576 (class 2606 OID 26766264)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 26766670)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 26766706)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 26766848)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 26766373)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 26766408)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 26767075)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 26766643)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 26766398)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 26766538)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 26766507)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2654 (class 2606 OID 26766499)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 26766655)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 26767084)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 26767092)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 26767062)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 26767104)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 26766688)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 26766628)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 26766619)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 26766835)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 26766762)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 26766474)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 26766235)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 26766697)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 26766253)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2578 (class 2606 OID 26766273)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 26766715)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 26766650)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 26766599)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 26766223)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 26766211)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 26766205)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 26766782)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 26766354)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 26766610)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 26766822)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 26766307)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 26767116)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 26766588)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 26766433)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 26766248)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 26766881)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 26766528)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 26766678)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 26766794)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 26767166)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 26767150)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 26767174)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 26766752)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 26766569)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 26766861)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 26766742)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 1259 OID 26766563)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2671 (class 1259 OID 26766564)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2672 (class 1259 OID 26766562)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2673 (class 1259 OID 26766561)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2674 (class 1259 OID 26766560)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2768 (class 1259 OID 26766783)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2769 (class 1259 OID 26766784)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2770 (class 1259 OID 26766785)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2854 (class 1259 OID 26767187)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2855 (class 1259 OID 26767186)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2605 (class 1259 OID 26766375)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2606 (class 1259 OID 26766376)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2726 (class 1259 OID 26766671)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2841 (class 1259 OID 26767154)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2842 (class 1259 OID 26767153)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2843 (class 1259 OID 26767155)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2844 (class 1259 OID 26767152)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2845 (class 1259 OID 26767151)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2720 (class 1259 OID 26766657)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2721 (class 1259 OID 26766656)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2662 (class 1259 OID 26766529)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2663 (class 1259 OID 26766530)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 26766731)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 26766733)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2752 (class 1259 OID 26766732)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2637 (class 1259 OID 26766464)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 26766463)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 26767105)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2784 (class 1259 OID 26766850)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2785 (class 1259 OID 26766851)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 26766852)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2851 (class 1259 OID 26767175)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2793 (class 1259 OID 26766886)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2794 (class 1259 OID 26766883)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2795 (class 1259 OID 26766887)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2796 (class 1259 OID 26766885)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2797 (class 1259 OID 26766884)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2627 (class 1259 OID 26766435)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 26766434)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 26766348)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2738 (class 1259 OID 26766698)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2580 (class 1259 OID 26766280)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2581 (class 1259 OID 26766281)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2743 (class 1259 OID 26766718)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2744 (class 1259 OID 26766717)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2745 (class 1259 OID 26766716)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2610 (class 1259 OID 26766385)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2611 (class 1259 OID 26766384)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2612 (class 1259 OID 26766386)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2650 (class 1259 OID 26766502)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2651 (class 1259 OID 26766500)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 26766501)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2560 (class 1259 OID 26766213)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2700 (class 1259 OID 26766623)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2701 (class 1259 OID 26766621)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2702 (class 1259 OID 26766620)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2703 (class 1259 OID 26766622)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2571 (class 1259 OID 26766254)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2572 (class 1259 OID 26766255)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2729 (class 1259 OID 26766679)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2864 (class 1259 OID 26767209)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2766 (class 1259 OID 26766771)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2767 (class 1259 OID 26766770)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2865 (class 1259 OID 26767217)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2866 (class 1259 OID 26767218)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2715 (class 1259 OID 26766644)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2760 (class 1259 OID 26766763)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2761 (class 1259 OID 26766764)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 26766985)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2815 (class 1259 OID 26766984)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2816 (class 1259 OID 26766981)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 26766982)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2818 (class 1259 OID 26766983)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2616 (class 1259 OID 26766400)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 26766399)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2618 (class 1259 OID 26766401)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2732 (class 1259 OID 26766692)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2733 (class 1259 OID 26766691)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2824 (class 1259 OID 26767085)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2825 (class 1259 OID 26767086)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2807 (class 1259 OID 26766916)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 26766917)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2809 (class 1259 OID 26766914)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2810 (class 1259 OID 26766915)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2756 (class 1259 OID 26766753)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2757 (class 1259 OID 26766754)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2706 (class 1259 OID 26766632)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2707 (class 1259 OID 26766631)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2708 (class 1259 OID 26766629)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2709 (class 1259 OID 26766630)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2803 (class 1259 OID 26766904)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 26766903)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2641 (class 1259 OID 26766475)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2644 (class 1259 OID 26766489)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2645 (class 1259 OID 26766488)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2646 (class 1259 OID 26766487)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2647 (class 1259 OID 26766490)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2661 (class 1259 OID 26766520)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 26766508)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2656 (class 1259 OID 26766509)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2821 (class 1259 OID 26767076)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2840 (class 1259 OID 26767124)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2858 (class 1259 OID 26767193)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2859 (class 1259 OID 26767194)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2592 (class 1259 OID 26766320)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 26766319)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2601 (class 1259 OID 26766355)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2602 (class 1259 OID 26766356)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 26766570)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2695 (class 1259 OID 26766613)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 26766612)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2697 (class 1259 OID 26766611)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2675 (class 1259 OID 26766555)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2676 (class 1259 OID 26766556)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2677 (class 1259 OID 26766559)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2678 (class 1259 OID 26766554)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2679 (class 1259 OID 26766558)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2680 (class 1259 OID 26766557)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2609 (class 1259 OID 26766374)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 26766308)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 26766309)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 26766449)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 26766451)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2635 (class 1259 OID 26766450)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2636 (class 1259 OID 26766452)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2714 (class 1259 OID 26766638)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 26766849)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2798 (class 1259 OID 26766882)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 26766823)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 26766824)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2599 (class 1259 OID 26766346)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 26766347)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2753 (class 1259 OID 26766743)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 26766224)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 26766421)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2615 (class 1259 OID 26766383)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 26766212)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2837 (class 1259 OID 26767117)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 26766690)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2737 (class 1259 OID 26766689)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 26766589)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 26766590)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2811 (class 1259 OID 26766913)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 26766409)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2790 (class 1259 OID 26766862)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2848 (class 1259 OID 26767167)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2830 (class 1259 OID 26767093)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 26767094)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2777 (class 1259 OID 26766812)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2694 (class 1259 OID 26766600)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 26766274)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2908 (class 2606 OID 26767389)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2907 (class 2606 OID 26767394)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2902 (class 2606 OID 26767419)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2904 (class 2606 OID 26767409)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2909 (class 2606 OID 26767384)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2905 (class 2606 OID 26767404)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2903 (class 2606 OID 26767414)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 26767399)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2945 (class 2606 OID 26767589)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2944 (class 2606 OID 26767594)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2943 (class 2606 OID 26767599)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 26767764)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 26767759)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 26767274)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2880 (class 2606 OID 26767279)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 26767504)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2972 (class 2606 OID 26767744)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 26767739)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2971 (class 2606 OID 26767749)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 26767734)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2975 (class 2606 OID 26767729)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2924 (class 2606 OID 26767499)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 26767494)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 26767374)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2900 (class 2606 OID 26767379)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2936 (class 2606 OID 26767544)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 26767554)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2935 (class 2606 OID 26767549)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2890 (class 2606 OID 26767329)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 26767324)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 26767484)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 26767719)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2948 (class 2606 OID 26767604)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2947 (class 2606 OID 26767609)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2946 (class 2606 OID 26767614)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2976 (class 2606 OID 26767754)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2950 (class 2606 OID 26767634)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2953 (class 2606 OID 26767619)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2949 (class 2606 OID 26767639)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2951 (class 2606 OID 26767629)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2952 (class 2606 OID 26767624)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2888 (class 2606 OID 26767319)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 26767314)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 26767259)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 26767254)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 26767524)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 26767234)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2872 (class 2606 OID 26767239)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2931 (class 2606 OID 26767539)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2932 (class 2606 OID 26767534)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2933 (class 2606 OID 26767529)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2883 (class 2606 OID 26767289)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2884 (class 2606 OID 26767284)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2882 (class 2606 OID 26767294)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2894 (class 2606 OID 26767354)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2896 (class 2606 OID 26767344)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 26767349)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2869 (class 2606 OID 26767219)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2914 (class 2606 OID 26767459)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 26767449)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2917 (class 2606 OID 26767444)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2915 (class 2606 OID 26767454)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 26767224)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2870 (class 2606 OID 26767229)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2927 (class 2606 OID 26767509)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2981 (class 2606 OID 26767779)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 26767584)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 26767579)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 26767784)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2982 (class 2606 OID 26767789)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2923 (class 2606 OID 26767489)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 26767569)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2939 (class 2606 OID 26767574)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 26767694)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2961 (class 2606 OID 26767689)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2964 (class 2606 OID 26767674)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 26767679)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2962 (class 2606 OID 26767684)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2886 (class 2606 OID 26767304)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2887 (class 2606 OID 26767299)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 26767309)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2928 (class 2606 OID 26767519)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 26767514)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 26767704)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2966 (class 2606 OID 26767709)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2957 (class 2606 OID 26767664)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 26767669)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2959 (class 2606 OID 26767654)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 26767659)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 26767559)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2937 (class 2606 OID 26767564)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2918 (class 2606 OID 26767479)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2919 (class 2606 OID 26767474)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2921 (class 2606 OID 26767464)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 26767469)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2954 (class 2606 OID 26767649)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 26767644)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2892 (class 2606 OID 26767334)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2893 (class 2606 OID 26767339)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 26767369)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 26767359)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2897 (class 2606 OID 26767364)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2965 (class 2606 OID 26767699)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2968 (class 2606 OID 26767714)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 26767724)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 26767769)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 26767774)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2874 (class 2606 OID 26767249)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 26767244)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 26767264)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2878 (class 2606 OID 26767269)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2910 (class 2606 OID 26767424)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2911 (class 2606 OID 26767439)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 26767434)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2913 (class 2606 OID 26767429)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-13 14:24:20 CET

--
-- PostgreSQL database dump complete
--

