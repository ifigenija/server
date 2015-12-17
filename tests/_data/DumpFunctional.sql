--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-17 16:19:45 CET

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
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 32733783)
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
-- TOC entry 237 (class 1259 OID 32734398)
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
-- TOC entry 236 (class 1259 OID 32734381)
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
-- TOC entry 182 (class 1259 OID 32733776)
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
-- TOC entry 181 (class 1259 OID 32733774)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 32734258)
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
-- TOC entry 230 (class 1259 OID 32734288)
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
-- TOC entry 251 (class 1259 OID 32734701)
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
-- TOC entry 203 (class 1259 OID 32734031)
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
-- TOC entry 205 (class 1259 OID 32734063)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32734068)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32734623)
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
-- TOC entry 194 (class 1259 OID 32733928)
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
-- TOC entry 238 (class 1259 OID 32734411)
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
-- TOC entry 223 (class 1259 OID 32734211)
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
    altercount integer DEFAULT 0 NOT NULL,
    tipfunkcije_id uuid
);


--
-- TOC entry 200 (class 1259 OID 32734002)
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
-- TOC entry 197 (class 1259 OID 32733968)
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
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 32733945)
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
-- TOC entry 212 (class 1259 OID 32734125)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32734681)
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
-- TOC entry 250 (class 1259 OID 32734694)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32734716)
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
-- TOC entry 170 (class 1259 OID 32153619)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32734150)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32733902)
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
-- TOC entry 185 (class 1259 OID 32733802)
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
-- TOC entry 189 (class 1259 OID 32733869)
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
-- TOC entry 186 (class 1259 OID 32733813)
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
-- TOC entry 178 (class 1259 OID 32733748)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32733767)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32734157)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32734191)
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
-- TOC entry 233 (class 1259 OID 32734329)
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
-- TOC entry 188 (class 1259 OID 32733849)
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
-- TOC entry 191 (class 1259 OID 32733894)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32734567)
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
-- TOC entry 213 (class 1259 OID 32734131)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32733879)
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
-- TOC entry 202 (class 1259 OID 32734023)
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
-- TOC entry 198 (class 1259 OID 32733983)
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
-- TOC entry 199 (class 1259 OID 32733995)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32734143)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32734581)
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
-- TOC entry 242 (class 1259 OID 32734591)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32734480)
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
-- TOC entry 243 (class 1259 OID 32734599)
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
-- TOC entry 219 (class 1259 OID 32734172)
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
-- TOC entry 211 (class 1259 OID 32734116)
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
-- TOC entry 210 (class 1259 OID 32734106)
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
-- TOC entry 232 (class 1259 OID 32734318)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32734248)
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
-- TOC entry 196 (class 1259 OID 32733957)
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
-- TOC entry 175 (class 1259 OID 32733719)
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
-- TOC entry 174 (class 1259 OID 32733717)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 32734185)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32733757)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32733741)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32734199)
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
-- TOC entry 214 (class 1259 OID 32734137)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32734083)
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
-- TOC entry 173 (class 1259 OID 32733706)
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
-- TOC entry 172 (class 1259 OID 32733698)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32733693)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32734265)
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
-- TOC entry 187 (class 1259 OID 32733841)
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
-- TOC entry 209 (class 1259 OID 32734093)
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
-- TOC entry 231 (class 1259 OID 32734306)
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
-- TOC entry 184 (class 1259 OID 32733792)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32734611)
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
-- TOC entry 207 (class 1259 OID 32734073)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32733914)
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
-- TOC entry 176 (class 1259 OID 32733728)
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
-- TOC entry 235 (class 1259 OID 32734356)
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
-- TOC entry 201 (class 1259 OID 32734013)
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
-- TOC entry 218 (class 1259 OID 32734164)
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
-- TOC entry 229 (class 1259 OID 32734279)
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
-- TOC entry 247 (class 1259 OID 32734661)
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
-- TOC entry 246 (class 1259 OID 32734630)
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
-- TOC entry 248 (class 1259 OID 32734673)
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
-- TOC entry 225 (class 1259 OID 32734237)
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
-- TOC entry 204 (class 1259 OID 32734057)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32734346)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32734227)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32733779)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32733722)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32733783)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5672-d28d-23c0-25dce79142ee	10	30	Otroci	Abonma za otroke	200
000a0000-5672-d28d-3abc-8671f0ebb3be	20	60	Mladina	Abonma za mladino	400
000a0000-5672-d28d-e379-23f268af0ea3	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32734398)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5672-d28e-6b51-e7be241b4830	000d0000-5672-d28e-e7a5-1ac4f0bae8dc	\N	00090000-5672-d28d-9bc9-bf637327a68b	000b0000-5672-d28d-62ab-b47b7076d063	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5672-d28e-aae4-fb56e7e89a1d	000d0000-5672-d28e-e284-7954d2aea53b	00100000-5672-d28d-2a98-29e54d963016	00090000-5672-d28d-1af2-e2f63c12d56f	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5672-d28e-7ea8-53e730b0b4b5	000d0000-5672-d28e-1025-d8bdc1bf227d	00100000-5672-d28d-558c-8425695f414b	00090000-5672-d28d-ac8c-e35b8b418867	\N	0003	t	\N	2015-12-17	\N	2	t	\N	f	f
000c0000-5672-d28e-da18-c8176a9917a0	000d0000-5672-d28e-ec1c-fafe9d9070b3	\N	00090000-5672-d28d-c01b-ff5462e74e79	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5672-d28e-1ce8-6c5f68bdc6ad	000d0000-5672-d28e-46fb-e2ccc10cde5d	\N	00090000-5672-d28d-6b45-6c28366cac26	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5672-d28e-5291-9d9d60339479	000d0000-5672-d28e-e683-8fad84a62112	\N	00090000-5672-d28d-bc99-dfa73422228b	000b0000-5672-d28d-0e37-bd834efb91e5	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5672-d28e-1f14-0601756987f5	000d0000-5672-d28e-362d-6f0c5b88ad77	00100000-5672-d28d-2290-2be82f181f2f	00090000-5672-d28d-8b94-3a35a4ef9ff1	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5672-d28e-8170-97f36e061f84	000d0000-5672-d28e-dbf7-7fac5afd62e0	\N	00090000-5672-d28d-8f22-f68fab735b98	000b0000-5672-d28d-c5df-b1309cbdbb35	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5672-d28e-2dc0-7784f81db844	000d0000-5672-d28e-362d-6f0c5b88ad77	00100000-5672-d28d-af37-a7f9d9a427df	00090000-5672-d28d-1237-9a7540b4e6b3	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5672-d28e-ecdc-288dc34db355	000d0000-5672-d28e-362d-6f0c5b88ad77	00100000-5672-d28d-b34a-04ecdabe67bc	00090000-5672-d28d-7b5b-e5195d13679f	\N	0010	t	\N	2015-12-17	\N	16	f	\N	f	t
000c0000-5672-d28e-8ecf-0bf852fbcbcf	000d0000-5672-d28e-362d-6f0c5b88ad77	00100000-5672-d28d-3a8a-f781a343bce9	00090000-5672-d28d-b198-3d8fc393220a	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5672-d28e-8dce-6fe5bd00b2c8	000d0000-5672-d28e-b2cf-c8fa8b8f4ea1	00100000-5672-d28d-2a98-29e54d963016	00090000-5672-d28d-1af2-e2f63c12d56f	000b0000-5672-d28d-67ee-0a9993e80814	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32734381)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32733776)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3162 (class 0 OID 32734258)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5672-d28d-2c35-de72f161b5f3	00160000-5672-d28d-4fd4-13346a4dd658	00090000-5672-d28d-f7e2-9eb126dc1325	aizv	10	t
003d0000-5672-d28d-3b09-f73d85d07063	00160000-5672-d28d-4fd4-13346a4dd658	00090000-5672-d28d-6dcd-bdd4d02a347a	apri	14	t
003d0000-5672-d28e-287c-a57dd3d99701	00160000-5672-d28d-6b10-4941a394d9d2	00090000-5672-d28d-9d89-f0cae44f2157	aizv	11	t
003d0000-5672-d28e-e218-1660a3e6fcdd	00160000-5672-d28d-6cf2-b4ebab68b4ea	00090000-5672-d28d-eb31-508f0f9c60f9	aizv	12	t
003d0000-5672-d28e-63da-1e10861b06e2	00160000-5672-d28d-4fd4-13346a4dd658	00090000-5672-d28d-b28d-8f36930f3789	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32734288)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5672-d28d-4fd4-13346a4dd658	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5672-d28d-6b10-4941a394d9d2	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5672-d28d-6cf2-b4ebab68b4ea	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32734701)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32734031)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5672-d28e-5a06-de9fade4dd73	\N	\N	00200000-5672-d28e-ff66-5af6e47b8caa	\N	\N	\N	00220000-5672-d28d-df75-4f217532079f	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5672-d28e-6dbf-1c599aa8f640	\N	\N	00200000-5672-d28e-f453-60e57bbae5a1	\N	\N	\N	00220000-5672-d28d-df75-4f217532079f	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5672-d28e-19a5-6b74d131a4a1	\N	\N	00200000-5672-d28e-4669-11d1157622d8	\N	\N	\N	00220000-5672-d28d-19a3-2d35fd28e5c0	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5672-d28e-c4f9-8401665ca7b7	\N	\N	00200000-5672-d28e-3349-0ca6b1ae94b7	\N	\N	\N	00220000-5672-d28d-aa42-8fec92cd75c9	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5672-d28e-4765-e360aef4b5ac	\N	\N	00200000-5672-d28e-4b57-d3d73e4b6fd6	\N	\N	\N	00220000-5672-d28d-4dbc-8b449f51a0e0	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32734063)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32734068)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32734623)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32733928)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5672-d28a-112e-83b987e29260	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5672-d28a-271c-7cd8320ea50f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5672-d28a-732c-f2946ea633e4	AL	ALB	008	Albania 	Albanija	\N
00040000-5672-d28a-03f8-a0dd9dd7d0ec	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5672-d28a-9907-0f8272bcf6d4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5672-d28a-37fa-fecbacf337d4	AD	AND	020	Andorra 	Andora	\N
00040000-5672-d28a-22a9-52a61d170d91	AO	AGO	024	Angola 	Angola	\N
00040000-5672-d28a-6080-8127d2005fb0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5672-d28a-1317-b5570c32d188	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5672-d28a-fb46-47195d4c5e2c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5672-d28a-e625-f7a1297464d2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5672-d28a-2bc9-805bee353e5e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5672-d28a-1f05-26a6cf01ba23	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5672-d28a-b014-6a54c64082ac	AU	AUS	036	Australia 	Avstralija	\N
00040000-5672-d28a-8b7c-57bffa695792	AT	AUT	040	Austria 	Avstrija	\N
00040000-5672-d28a-cd93-9af8a76766be	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5672-d28a-7032-10b229ddc46d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5672-d28a-0d37-95df2876c168	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5672-d28a-17fa-baae8f096d82	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5672-d28a-1a11-0751497d654a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5672-d28a-e41c-a3871488e923	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5672-d28a-87c2-09f61e53d4c2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5672-d28a-e13e-d605e512d01b	BZ	BLZ	084	Belize 	Belize	\N
00040000-5672-d28a-842b-5d95b10c77ba	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5672-d28a-857e-f230e99a28a6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5672-d28a-8088-fe1a5443284b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5672-d28a-b3ba-261616d6f77a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5672-d28a-9b63-41c7f205a8c7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5672-d28a-d9f0-550e576e4041	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5672-d28a-4905-a65a8051a3c9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5672-d28a-cd74-c0a251e6f3dc	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5672-d28a-c65c-35ceb72af03a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5672-d28a-7595-14c0c341a6fb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5672-d28a-9524-751a0757bdce	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5672-d28a-2e90-4e938b271313	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5672-d28a-3682-c6700acacaff	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5672-d28a-00de-3dbd939c32a1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5672-d28a-77c8-e69bda383708	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5672-d28a-9ceb-b6500102d843	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5672-d28a-f9f0-6e6bf00e6fb8	CA	CAN	124	Canada 	Kanada	\N
00040000-5672-d28a-3941-a8b30541c973	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5672-d28a-6014-464fbde6630c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5672-d28a-66ef-4b8caafdf9e9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5672-d28a-4452-a4c2bfc0169a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5672-d28a-16c7-a9b6249d5ec3	CL	CHL	152	Chile 	Čile	\N
00040000-5672-d28a-20fe-4f68b0aeee7e	CN	CHN	156	China 	Kitajska	\N
00040000-5672-d28a-74ec-66724222b555	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5672-d28a-7fcc-477cafef08be	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5672-d28a-c29d-2c0510cc4e14	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5672-d28a-5597-35bd62b882dd	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5672-d28a-8831-89bd02ae96f6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5672-d28a-6884-42080bf40f7e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5672-d28a-8947-0f7c0a03c20b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5672-d28a-90b2-b1f15f20822b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5672-d28a-3297-6ae6bafae7d6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5672-d28a-69fc-419049516bed	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5672-d28a-1549-5c138b8c3578	CU	CUB	192	Cuba 	Kuba	\N
00040000-5672-d28a-9f83-6ae21f1309a5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5672-d28a-de24-b5a703c41066	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5672-d28a-8881-1b4428ff8122	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5672-d28a-5ecc-100ea6fba957	DK	DNK	208	Denmark 	Danska	\N
00040000-5672-d28a-fac3-24ff78e7f08e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5672-d28a-b129-453067581075	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5672-d28a-e4c3-036a4eab78b8	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5672-d28a-3eaf-6a8f91183828	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5672-d28a-01ce-393c970f2b91	EG	EGY	818	Egypt 	Egipt	\N
00040000-5672-d28a-ee65-77bdc8022a0e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5672-d28a-0b5e-60e76e887c05	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5672-d28a-1030-afccdae454cd	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5672-d28a-3668-f7e7e5ada84d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5672-d28a-81d4-2a3d41ed194d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5672-d28a-45bb-302285a617a4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5672-d28a-af28-8183604d61d1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5672-d28a-bd16-b1a484dd6f99	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5672-d28a-cf6e-33a08eacb09f	FI	FIN	246	Finland 	Finska	\N
00040000-5672-d28a-e259-2a6f15d7b462	FR	FRA	250	France 	Francija	\N
00040000-5672-d28a-3789-98edbe9c42e1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5672-d28a-6e1a-f15c02815141	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5672-d28a-a1f5-40157c728d64	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5672-d28a-f414-e2f3b5a929a1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5672-d28a-89d3-508025184c3e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5672-d28a-6a1b-c7a7c8985c10	GM	GMB	270	Gambia 	Gambija	\N
00040000-5672-d28a-92bd-d80324a8de6a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5672-d28a-d577-39c2a6085b17	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5672-d28a-8de5-29cfac39c4a4	GH	GHA	288	Ghana 	Gana	\N
00040000-5672-d28a-369b-289ba51ceb5b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5672-d28a-4fc0-345bbdc37ac3	GR	GRC	300	Greece 	Grčija	\N
00040000-5672-d28a-86b6-8b1b1cd559e8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5672-d28a-973a-a8a3d7d389dd	GD	GRD	308	Grenada 	Grenada	\N
00040000-5672-d28a-3282-422d53d21994	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5672-d28a-2bc5-7b3482a4aeac	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5672-d28a-385c-e70d4b09975e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5672-d28a-8b71-80aee92c7492	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5672-d28a-6cb1-91d1ca6845f5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5672-d28a-b982-cc4d855edf35	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5672-d28a-cfe6-0d0f7317dffb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5672-d28a-c4a1-69fc0fd9b86d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5672-d28a-d7ff-b4e729949cd1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5672-d28a-0949-7bd54034f6c9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5672-d28a-a570-eeb27445701d	HN	HND	340	Honduras 	Honduras	\N
00040000-5672-d28a-e394-1beff2d8a1ac	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5672-d28a-08ee-2f94e91f7b13	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5672-d28a-471a-874b7abea5a0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5672-d28a-cb28-7fca0fdb9a70	IN	IND	356	India 	Indija	\N
00040000-5672-d28a-612c-3ec86494eeb1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5672-d28a-8930-21617108dcd2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5672-d28a-b587-eea6ba3c3133	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5672-d28a-15e4-59bef1145f99	IE	IRL	372	Ireland 	Irska	\N
00040000-5672-d28a-3dea-71849ea3a000	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5672-d28a-0c03-e16e2b3061b0	IL	ISR	376	Israel 	Izrael	\N
00040000-5672-d28a-2453-be317c45a0f1	IT	ITA	380	Italy 	Italija	\N
00040000-5672-d28a-d985-af459d3f5c6f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5672-d28a-007f-b949fdba6b06	JP	JPN	392	Japan 	Japonska	\N
00040000-5672-d28a-6b6e-17422594ba56	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5672-d28a-3a41-f68983495bdc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5672-d28a-4ce3-d8aa6a01321a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5672-d28a-44e5-f1a35cc55d3a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5672-d28a-f82b-40dddb6dea40	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5672-d28a-b552-f20d69dc449c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5672-d28a-50c1-a31106b979b7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5672-d28a-349e-93ad0b1a870d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5672-d28a-98d2-28e2029ea8c4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5672-d28a-0b0d-43db38730394	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5672-d28a-f18f-e3cfa68ce415	LV	LVA	428	Latvia 	Latvija	\N
00040000-5672-d28a-f60a-bef5d8a384b5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5672-d28a-c1e3-1f41f97e9f1a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5672-d28a-fa42-c69f2254c7c8	LR	LBR	430	Liberia 	Liberija	\N
00040000-5672-d28a-9622-743ee14bfbdd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5672-d28a-62e1-044b698d0aaf	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5672-d28a-5969-a6fc8a398d7c	LT	LTU	440	Lithuania 	Litva	\N
00040000-5672-d28a-f4f6-151a1421eac3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5672-d28a-8014-06d7a2857c9b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5672-d28a-56a6-8b5b782ac0b6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5672-d28a-b16b-4150e40a9a22	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5672-d28a-7832-5fd60f86391e	MW	MWI	454	Malawi 	Malavi	\N
00040000-5672-d28a-afcc-3cf99eb504fb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5672-d28a-e019-32ab3f676090	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5672-d28a-19dd-b7b2c0e0984a	ML	MLI	466	Mali 	Mali	\N
00040000-5672-d28a-f697-60a2b8eb1357	MT	MLT	470	Malta 	Malta	\N
00040000-5672-d28a-066f-f46fd5d74dcc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5672-d28a-7cd5-1d60597d902a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5672-d28a-35c8-d170bdce0c5e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5672-d28a-3a62-a7d40daef6ca	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5672-d28a-225d-62b187a1682d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5672-d28a-9ddb-5224b3c1da86	MX	MEX	484	Mexico 	Mehika	\N
00040000-5672-d28a-422e-fed5dbb752a8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5672-d28a-5950-3443dbaa9f7d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5672-d28a-0586-a2bc81b28e3c	MC	MCO	492	Monaco 	Monako	\N
00040000-5672-d28a-226c-a9280c824e52	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5672-d28a-e83f-05f7e8713f0e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5672-d28a-adeb-f2379389b1a4	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5672-d28a-f430-64456958e11b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5672-d28a-0b5e-1fbd0638e543	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5672-d28a-d5bc-12be27fc3de2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5672-d28a-fd85-86e85fec625d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5672-d28a-7c4c-73cb5c91312f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5672-d28a-6e9a-134eb1c60656	NP	NPL	524	Nepal 	Nepal	\N
00040000-5672-d28a-d291-4b418abe4ce5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5672-d28a-626a-6920077647e3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5672-d28a-b3a3-d4cfb5725667	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5672-d28a-8b45-18c3859522ce	NE	NER	562	Niger 	Niger 	\N
00040000-5672-d28a-62e9-ffada5e2b9df	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5672-d28a-2767-7900800830b2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5672-d28a-194b-f34c1086c9a1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5672-d28a-331b-653212c64c97	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5672-d28a-48e9-7df2a590fa14	NO	NOR	578	Norway 	Norveška	\N
00040000-5672-d28a-7a9d-abfa4a1d165b	OM	OMN	512	Oman 	Oman	\N
00040000-5672-d28a-19b3-c5538291324a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5672-d28a-f9f1-7c17cb541bc9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5672-d28a-5183-90951d9e0893	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5672-d28a-bab5-a8685a136720	PA	PAN	591	Panama 	Panama	\N
00040000-5672-d28a-aff7-1ee2ad859bd7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5672-d28a-e614-df1d60be996e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5672-d28a-13a7-b91c9da820dd	PE	PER	604	Peru 	Peru	\N
00040000-5672-d28a-5e69-bdda35d314bd	PH	PHL	608	Philippines 	Filipini	\N
00040000-5672-d28a-ade9-730267d73d76	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5672-d28a-00dd-c8bce8a12f2d	PL	POL	616	Poland 	Poljska	\N
00040000-5672-d28a-d25b-d9dd13f637ee	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5672-d28a-d7cb-273219c71218	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5672-d28a-dec9-d50cfbda9196	QA	QAT	634	Qatar 	Katar	\N
00040000-5672-d28a-ee68-2b7a823f817c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5672-d28a-caf7-fc39f1a7a88e	RO	ROU	642	Romania 	Romunija	\N
00040000-5672-d28a-76a0-6c243627356b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5672-d28a-dda9-0bc41bbc416b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5672-d28a-76e3-347b5aadb562	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5672-d28a-1b92-5c0b8001a72c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5672-d28a-53a0-31842c669cc3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5672-d28a-9102-947385341156	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5672-d28a-42f7-c621e09ac264	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5672-d28a-e08a-e6f12ea08372	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5672-d28a-a76c-5e8c2ca11ecb	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5672-d28a-926e-f56c9b2bc17f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5672-d28a-f2cd-e013d75be983	SM	SMR	674	San Marino 	San Marino	\N
00040000-5672-d28a-8c32-d81b3d0a5010	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5672-d28a-d5b0-3ade59b2cf76	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5672-d28a-147e-4a864e2e5ff5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5672-d28a-ea0f-7cf5eb1c1672	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5672-d28a-cca9-220dbb3cce2f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5672-d28a-97df-c7e994ff4d5f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5672-d28a-2cea-1456e887a1d6	SG	SGP	702	Singapore 	Singapur	\N
00040000-5672-d28a-19cc-a04b87bf22d7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5672-d28a-6b56-930e4b88e154	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5672-d28a-bdd6-11e69b8bb63a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5672-d28a-8969-aa043416b0a0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5672-d28a-2f44-cc8521d1b3fc	SO	SOM	706	Somalia 	Somalija	\N
00040000-5672-d28a-cd86-f089c32c5693	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5672-d28a-e9d0-76e996b2d793	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5672-d28a-a591-f1318febb2d2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5672-d28a-e883-844615e8f97c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5672-d28a-f440-536b4b8ef6d2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5672-d28a-07d6-7cfdd683c35a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5672-d28a-96a0-2a6adf704ecd	SR	SUR	740	Suriname 	Surinam	\N
00040000-5672-d28a-ec4b-2eb70639359d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5672-d28a-d195-84d14a1ac5bc	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5672-d28a-e115-d992632430b0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5672-d28a-36c2-7d5c313094b1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5672-d28a-f47e-5893b3235533	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5672-d28a-90fa-9e66cb966815	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5672-d28a-598b-6a272434c23b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5672-d28a-7e60-2e6b18a7041b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5672-d28a-6327-bcb7548f3034	TH	THA	764	Thailand 	Tajska	\N
00040000-5672-d28a-727c-4558d0da3ebb	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5672-d28a-9e2c-b545aa0ded55	TG	TGO	768	Togo 	Togo	\N
00040000-5672-d28a-549a-57442660ae2a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5672-d28a-698d-0f09230a5c31	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5672-d28a-2cb8-551c8d7c569f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5672-d28a-6433-e959e66edaf9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5672-d28a-9724-5a09b171e973	TR	TUR	792	Turkey 	Turčija	\N
00040000-5672-d28a-4c52-69b4561feeaa	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5672-d28a-c83e-3762cc311cf7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5672-d28a-6c1a-fdfc7d28ca00	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5672-d28a-f07b-8de1797dbd87	UG	UGA	800	Uganda 	Uganda	\N
00040000-5672-d28a-bec6-2382efa2b9da	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5672-d28a-b964-f9106bb9ef7e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5672-d28a-c68f-1fff17cb22e2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5672-d28a-c7b4-016c4daf36dd	US	USA	840	United States 	Združene države Amerike	\N
00040000-5672-d28a-bd80-7c075e94266d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5672-d28a-c4b3-54b475d7898d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5672-d28a-1b17-f7ef85d8608f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5672-d28a-6322-b96ef49ebca2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5672-d28a-e2e4-0b19e704864b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5672-d28a-7dc7-c1385d663f78	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5672-d28a-97a0-d7f5ee324c06	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5672-d28a-926c-875f3e0acc28	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5672-d28a-e3ac-407f0aff62c3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5672-d28a-4d5c-7edb246e44bf	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5672-d28a-ff69-528dd065ef9c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5672-d28a-b8c3-87f1491167b3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5672-d28a-fe25-d57fe1a94067	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32734411)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5672-d28e-3506-897856decd38	000e0000-5672-d28e-34ed-e60fd0ade121	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-d28a-61e6-a2bce9e299d5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5672-d28e-2b4f-e9a8c0dd00d3	000e0000-5672-d28e-84da-bfad9d1b91b9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-d28a-6556-107c4b47c07c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5672-d28e-f2d3-4d2b7299d07c	000e0000-5672-d28e-8384-df385b6fa49a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-d28a-61e6-a2bce9e299d5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5672-d28e-828d-7de08adeba03	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5672-d28e-fae9-7b30239c7c46	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32734211)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5672-d28e-e7a5-1ac4f0bae8dc	000e0000-5672-d28e-84da-bfad9d1b91b9	000c0000-5672-d28e-6b51-e7be241b4830	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5672-d28a-ab1c-c8f344194da6
000d0000-5672-d28e-e284-7954d2aea53b	000e0000-5672-d28e-84da-bfad9d1b91b9	000c0000-5672-d28e-aae4-fb56e7e89a1d	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5672-d28a-27c8-394cab15362f
000d0000-5672-d28e-1025-d8bdc1bf227d	000e0000-5672-d28e-84da-bfad9d1b91b9	000c0000-5672-d28e-7ea8-53e730b0b4b5	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5672-d28a-6df7-551a7578d622
000d0000-5672-d28e-ec1c-fafe9d9070b3	000e0000-5672-d28e-84da-bfad9d1b91b9	000c0000-5672-d28e-da18-c8176a9917a0	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5672-d28a-5366-5b12b91febb4
000d0000-5672-d28e-46fb-e2ccc10cde5d	000e0000-5672-d28e-84da-bfad9d1b91b9	000c0000-5672-d28e-1ce8-6c5f68bdc6ad	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5672-d28a-5366-5b12b91febb4
000d0000-5672-d28e-e683-8fad84a62112	000e0000-5672-d28e-84da-bfad9d1b91b9	000c0000-5672-d28e-5291-9d9d60339479	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5672-d28a-ab1c-c8f344194da6
000d0000-5672-d28e-362d-6f0c5b88ad77	000e0000-5672-d28e-84da-bfad9d1b91b9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5672-d28a-ab1c-c8f344194da6
000d0000-5672-d28e-dbf7-7fac5afd62e0	000e0000-5672-d28e-84da-bfad9d1b91b9	000c0000-5672-d28e-8170-97f36e061f84	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5672-d28a-b248-c82195f8ff93
000d0000-5672-d28e-b2cf-c8fa8b8f4ea1	000e0000-5672-d28e-84da-bfad9d1b91b9	000c0000-5672-d28e-8dce-6fe5bd00b2c8	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5672-d28a-cc98-ee600a67b299
\.


--
-- TOC entry 3135 (class 0 OID 32734002)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32733968)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32733945)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5672-d28d-aea4-1ed16987b522	00080000-5672-d28d-de12-a34cd25addd7	00090000-5672-d28d-7b5b-e5195d13679f	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32734125)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32734681)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5672-d28d-3638-0e307c1468f9	00010000-5672-d28b-4a5a-d3a7a8cdb037	\N	Prva mapa	Root mapa	2015-12-17 16:19:41	2015-12-17 16:19:41	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32734694)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32734716)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32153619)
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
\.


--
-- TOC entry 3151 (class 0 OID 32734150)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32733902)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5672-d28b-91c9-d0efaf7e23b6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5672-d28b-1f1f-e69da2c2e57c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5672-d28b-3b7b-d3dd8638a44f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5672-d28b-47fd-3b0b5dc9dd4a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5672-d28b-273a-c3ddf3e31a96	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5672-d28b-8f47-6c62ff37fd8e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5672-d28b-c7d8-91bef4f7cb9c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5672-d28b-f8fe-404266091d02	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5672-d28b-2347-5f4f2674705a	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5672-d28b-5065-0e587bac27cd	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5672-d28b-af7e-362a2ef8e8a6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5672-d28b-a66e-7a085578a346	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5672-d28b-f568-b2112a7cb1e5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5672-d28b-cfac-f5229005ef78	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5672-d28d-c8ee-764853ef2316	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5672-d28d-e11c-edd9ddf38da5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5672-d28d-150f-ce09ec666e75	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5672-d28d-e05b-07fec6327211	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5672-d28d-b4a8-bdc4e18125ba	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5672-d28f-96ee-53349e6b2bb0	application.tenant.maticnopodjetje	string	s:36:"00080000-5672-d28f-5b8b-e6640c6c8584";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32733802)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5672-d28d-0ed9-d5adbddeb976	00000000-5672-d28d-c8ee-764853ef2316	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5672-d28d-e518-9216a3217f87	00000000-5672-d28d-c8ee-764853ef2316	00010000-5672-d28b-4a5a-d3a7a8cdb037	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5672-d28d-24a0-2981aaa49413	00000000-5672-d28d-e11c-edd9ddf38da5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32733869)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5672-d28d-b1ff-993922ccbf7c	\N	00100000-5672-d28d-2a98-29e54d963016	00100000-5672-d28d-558c-8425695f414b	01	Gledališče Nimbis
00410000-5672-d28d-cc61-e8fd23bc2939	00410000-5672-d28d-b1ff-993922ccbf7c	00100000-5672-d28d-2a98-29e54d963016	00100000-5672-d28d-558c-8425695f414b	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32733813)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5672-d28d-9bc9-bf637327a68b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5672-d28d-c01b-ff5462e74e79	00010000-5672-d28d-3659-13e2549afbf1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5672-d28d-ac8c-e35b8b418867	00010000-5672-d28d-4ea1-275d48234d7e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5672-d28d-1237-9a7540b4e6b3	00010000-5672-d28d-e533-9a4812e4d11c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5672-d28d-a980-166445bd3419	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5672-d28d-bc99-dfa73422228b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5672-d28d-b198-3d8fc393220a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5672-d28d-8b94-3a35a4ef9ff1	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5672-d28d-7b5b-e5195d13679f	00010000-5672-d28d-dd3a-a538125020b0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5672-d28d-1af2-e2f63c12d56f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5672-d28d-7135-bcfbf35be941	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5672-d28d-6b45-6c28366cac26	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5672-d28d-8f22-f68fab735b98	00010000-5672-d28d-35d9-b9b5e9f3de49	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5672-d28d-f7e2-9eb126dc1325	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-d28d-6dcd-bdd4d02a347a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-d28d-9d89-f0cae44f2157	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-d28d-eb31-508f0f9c60f9	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5672-d28d-b28d-8f36930f3789	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5672-d28d-d94d-377b906f5564	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-d28d-5be3-dca98c4a98b8	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-d28d-d1c3-34b6fee0f218	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32733748)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5672-d28b-32a5-3da158b9de8b	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5672-d28b-c611-fcf2a450878f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5672-d28b-bf1d-3a750f12b932	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5672-d28b-dbcf-6f6509336d3e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5672-d28b-93b7-9e32d95ba6da	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5672-d28b-35d1-cc213968f54e	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5672-d28b-e596-e3a5aec87bbf	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5672-d28b-5ad1-b9df534e0a11	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5672-d28b-2f4d-c2eb67ac3d57	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5672-d28b-b6e4-8443860cb8af	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5672-d28b-a7a7-c01260cdad63	Abonma-read	Abonma - branje	t
00030000-5672-d28b-a843-de367ce3df31	Abonma-write	Abonma - spreminjanje	t
00030000-5672-d28b-1786-712b2c3b8441	Alternacija-read	Alternacija - branje	t
00030000-5672-d28b-aebe-9f5e01d1e29d	Alternacija-write	Alternacija - spreminjanje	t
00030000-5672-d28b-4807-61e461307f23	Arhivalija-read	Arhivalija - branje	t
00030000-5672-d28b-6525-3f7ec3b2e226	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5672-d28b-fbc7-92d39ecfd0c5	AuthStorage-read	AuthStorage - branje	t
00030000-5672-d28b-31cd-99df8141cd94	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5672-d28b-043e-7bed913cc171	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5672-d28b-6f76-e487329eb685	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5672-d28b-6546-8039903befd4	Besedilo-read	Besedilo - branje	t
00030000-5672-d28b-ab03-053c255788a1	Besedilo-write	Besedilo - spreminjanje	t
00030000-5672-d28b-a081-f04aa7ffb9f6	Dogodek-read	Dogodek - branje	t
00030000-5672-d28b-2a05-141e1c2d53f3	Dogodek-write	Dogodek - spreminjanje	t
00030000-5672-d28b-1ab3-0e76a109267f	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5672-d28b-19c5-f4d9ad9f3578	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5672-d28b-3cd7-3a03c50bb657	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5672-d28b-3c2c-aea17ec985a0	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5672-d28b-a08a-8f65f213523f	DogodekTrait-read	DogodekTrait - branje	t
00030000-5672-d28b-0112-d6b1e50447db	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5672-d28b-90cf-2863bc3563ba	DrugiVir-read	DrugiVir - branje	t
00030000-5672-d28b-c535-50b85136f267	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5672-d28b-1f19-5a84a4edcde4	Drzava-read	Drzava - branje	t
00030000-5672-d28b-9224-6c8856ca4afb	Drzava-write	Drzava - spreminjanje	t
00030000-5672-d28b-c4d5-369b69edbe9f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5672-d28b-5d0d-d9667b0f7c79	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5672-d28b-55f5-2a7aee7f31f6	Funkcija-read	Funkcija - branje	t
00030000-5672-d28b-26a2-f494b0ffd0df	Funkcija-write	Funkcija - spreminjanje	t
00030000-5672-d28b-d48e-a0d97be82ca3	Gostovanje-read	Gostovanje - branje	t
00030000-5672-d28b-448a-27ed843e8a22	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5672-d28b-d34e-76adbbec39f9	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5672-d28b-9aa0-7e86a19e8742	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5672-d28b-f298-fb93ebe673f3	Kupec-read	Kupec - branje	t
00030000-5672-d28b-2253-11c147d91f5c	Kupec-write	Kupec - spreminjanje	t
00030000-5672-d28b-bea8-88ff500cca0a	NacinPlacina-read	NacinPlacina - branje	t
00030000-5672-d28b-53f1-fd166105811d	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5672-d28b-7d22-c481260ade22	Option-read	Option - branje	t
00030000-5672-d28b-6043-f912951f2bf5	Option-write	Option - spreminjanje	t
00030000-5672-d28b-3931-5e16941d595c	OptionValue-read	OptionValue - branje	t
00030000-5672-d28b-8059-a851474d0634	OptionValue-write	OptionValue - spreminjanje	t
00030000-5672-d28b-bd91-a9a373533753	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5672-d28b-2bf1-b0e055ecda1a	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5672-d28b-c923-d019fb647488	Oseba-read	Oseba - branje	t
00030000-5672-d28b-e6d0-29aa3626a972	Oseba-write	Oseba - spreminjanje	t
00030000-5672-d28b-9ff6-1dba42bbf045	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5672-d28b-50a9-320dd702eb03	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5672-d28b-bb43-a7d551a0a42e	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5672-d28b-e241-2f53b99b5a5a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5672-d28b-62dc-0ec0992bae17	Pogodba-read	Pogodba - branje	t
00030000-5672-d28b-ec8a-63537eca4354	Pogodba-write	Pogodba - spreminjanje	t
00030000-5672-d28b-49db-8fbdb77795d4	Popa-read	Popa - branje	t
00030000-5672-d28b-7c1c-d61b033df2f4	Popa-write	Popa - spreminjanje	t
00030000-5672-d28b-a1d9-fb1f605774b9	Posta-read	Posta - branje	t
00030000-5672-d28b-14da-17337d7ecc3d	Posta-write	Posta - spreminjanje	t
00030000-5672-d28b-de2c-91a09fd201e9	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5672-d28b-2838-fc3d659bd90b	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5672-d28b-5c0d-79eeadbab6f5	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5672-d28b-97af-a53bdd5033b1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5672-d28b-163d-17be29623d08	PostniNaslov-read	PostniNaslov - branje	t
00030000-5672-d28b-6b8b-53e18b8f2496	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5672-d28b-925f-3fdbe3a88a43	Praznik-read	Praznik - branje	t
00030000-5672-d28b-85f9-0f1dc16ec554	Praznik-write	Praznik - spreminjanje	t
00030000-5672-d28b-c9b9-eb66b6a826f5	Predstava-read	Predstava - branje	t
00030000-5672-d28b-908d-72e550b07aa7	Predstava-write	Predstava - spreminjanje	t
00030000-5672-d28b-60f7-06068bcbeb1c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5672-d28b-24e4-e82cc40a36c9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5672-d28b-d464-f3351c1e9b8e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5672-d28b-5bd1-eeece69b0712	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5672-d28b-d412-325b9b11f81c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5672-d28b-67f4-51b61be387d2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5672-d28b-afd0-4c137ccb1e01	ProgramDela-read	ProgramDela - branje	t
00030000-5672-d28b-1bbd-5a8e84fd7081	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5672-d28b-6904-4a1c5d0a5b1f	ProgramFestival-read	ProgramFestival - branje	t
00030000-5672-d28b-1582-06a02a81df09	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5672-d28b-45da-82620282d779	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5672-d28b-30e4-ed5bc408a4c6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5672-d28b-e871-d11e8824042a	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5672-d28b-d2f8-6680413d1728	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5672-d28b-c195-b9e95684bd6b	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5672-d28b-cdfe-7a4541f6fcfb	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5672-d28b-7329-2dfceadd4524	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5672-d28b-fee8-9ff3e1c34ccb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5672-d28b-28f3-65390d044d8e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5672-d28b-576c-ab27ce276062	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5672-d28b-2895-d9a1cc58625f	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5672-d28b-7434-a657aa375307	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5672-d28b-99a6-feda67451d55	ProgramRazno-read	ProgramRazno - branje	t
00030000-5672-d28b-40c6-1aeea31c0e09	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5672-d28b-6348-9ddc49ed32c2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5672-d28b-136d-5774fabcceee	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5672-d28b-7209-5f4c4f81bde2	Prostor-read	Prostor - branje	t
00030000-5672-d28b-ca18-45aeff1eb1c5	Prostor-write	Prostor - spreminjanje	t
00030000-5672-d28b-a6df-5b20e5cfe08a	Racun-read	Racun - branje	t
00030000-5672-d28b-5f7b-3398d213ea4b	Racun-write	Racun - spreminjanje	t
00030000-5672-d28b-6860-5ac687e45823	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5672-d28b-04ec-f25253d69447	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5672-d28b-fcd0-775b15527da1	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5672-d28b-0b31-a3bb4dd3ee2c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5672-d28b-8795-50fea6827461	Rekvizit-read	Rekvizit - branje	t
00030000-5672-d28b-90a5-f4b43c295c73	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5672-d28b-fdc1-f7f7853b1fb8	Revizija-read	Revizija - branje	t
00030000-5672-d28b-a768-c5362bd7e7e7	Revizija-write	Revizija - spreminjanje	t
00030000-5672-d28b-023e-37fdedc28cb7	Rezervacija-read	Rezervacija - branje	t
00030000-5672-d28b-3bdd-7307945a6c03	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5672-d28b-78c0-8962e02bf2fa	SedezniRed-read	SedezniRed - branje	t
00030000-5672-d28b-ab60-31943e077499	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5672-d28b-af36-47b096126039	Sedez-read	Sedez - branje	t
00030000-5672-d28b-e1b5-0322e13e4ae6	Sedez-write	Sedez - spreminjanje	t
00030000-5672-d28b-65a6-5b26023bc1c8	Sezona-read	Sezona - branje	t
00030000-5672-d28b-b88b-e3aaf07478ac	Sezona-write	Sezona - spreminjanje	t
00030000-5672-d28b-5b48-406405d99552	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5672-d28b-c9de-fe544b37d0ed	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5672-d28b-3fad-d0db6e892909	Telefonska-read	Telefonska - branje	t
00030000-5672-d28b-8f96-5e1a16fda99d	Telefonska-write	Telefonska - spreminjanje	t
00030000-5672-d28b-a6b8-e54d445052ef	TerminStoritve-read	TerminStoritve - branje	t
00030000-5672-d28b-513a-4651944adeb5	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5672-d28b-9651-03f2f9406efe	TipFunkcije-read	TipFunkcije - branje	t
00030000-5672-d28b-1eab-9080f99c5a8e	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5672-d28b-607f-038ac63c870c	TipPopa-read	TipPopa - branje	t
00030000-5672-d28b-d997-4b196ad18fd1	TipPopa-write	TipPopa - spreminjanje	t
00030000-5672-d28b-0138-4a3a55a148be	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5672-d28b-a505-9787a480d9de	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5672-d28b-02ba-7b80261648de	TipVaje-read	TipVaje - branje	t
00030000-5672-d28b-966d-20ed47238ee3	TipVaje-write	TipVaje - spreminjanje	t
00030000-5672-d28b-d196-65fc144fd3c9	Trr-read	Trr - branje	t
00030000-5672-d28b-991c-6363167209c2	Trr-write	Trr - spreminjanje	t
00030000-5672-d28b-fa0b-e96f92b3104a	Uprizoritev-read	Uprizoritev - branje	t
00030000-5672-d28b-2ba1-921e9eec44fd	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5672-d28b-a9ba-75ff29c25fbf	Vaja-read	Vaja - branje	t
00030000-5672-d28b-6da6-4e5d23103205	Vaja-write	Vaja - spreminjanje	t
00030000-5672-d28b-938e-9612b39027df	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5672-d28b-40ff-af63d0fba87a	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5672-d28b-17dd-421f5590c2f0	VrstaStroska-read	VrstaStroska - branje	t
00030000-5672-d28b-6488-c171d0964289	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5672-d28b-ac36-8fdac0a4e071	Zaposlitev-read	Zaposlitev - branje	t
00030000-5672-d28b-8efa-5f94e136c0b0	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5672-d28b-2754-e031abdc5ff3	Zasedenost-read	Zasedenost - branje	t
00030000-5672-d28b-b81a-24f153924e70	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5672-d28b-7f52-b38d9cbcb34a	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5672-d28b-15ad-baeda3b53d30	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5672-d28b-4419-70e2a4243885	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5672-d28b-5e42-88719effb128	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5672-d28b-1095-1e84b322b229	Job-read	Branje opravil - samo zase - branje	t
00030000-5672-d28b-de5b-44fc67fab075	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5672-d28b-84be-9302fc65bd72	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5672-d28b-c2a9-fc4ed2cbb94b	Report-read	Report - branje	t
00030000-5672-d28b-b60b-7ad1ac61487a	Report-write	Report - spreminjanje	t
00030000-5672-d28b-9be7-73c264a2fa4c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5672-d28b-8d7a-eb54039fc34e	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5672-d28b-97cb-ae59b358d90a	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5672-d28b-20fa-049bbe5b722a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5672-d28b-e0ba-360dd7a0948f	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5672-d28b-2c34-814a81c8b963	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5672-d28b-56b5-3d824538890a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5672-d28b-c0a4-2964124d3b26	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5672-d28b-13e7-69d74260485c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5672-d28b-1e00-7055dacc1960	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5672-d28b-a3fa-26aca3851ba5	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5672-d28b-0292-61454ff83df1	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5672-d28b-f623-7ba36959a6cc	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5672-d28b-7378-212e94619c21	Datoteka-write	Datoteka - spreminjanje	t
00030000-5672-d28b-7434-854bea03bb2d	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32733767)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5672-d28b-1138-1242d3a419cf	00030000-5672-d28b-c611-fcf2a450878f
00020000-5672-d28b-1138-1242d3a419cf	00030000-5672-d28b-32a5-3da158b9de8b
00020000-5672-d28b-7209-026f0f12dde3	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-6f76-e487329eb685
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-ab03-053c255788a1
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-5ba4-236222dead96	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-ef6e-ab8263a8ec97	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28b-ef6e-ab8263a8ec97	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-ef6e-ab8263a8ec97	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-ef6e-ab8263a8ec97	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-ef6e-ab8263a8ec97	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-ef6e-ab8263a8ec97	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-dde6-c4fa3143bca3	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-dde6-c4fa3143bca3	00030000-5672-d28b-8efa-5f94e136c0b0
00020000-5672-d28b-dde6-c4fa3143bca3	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-dde6-c4fa3143bca3	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28b-dde6-c4fa3143bca3	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-dde6-c4fa3143bca3	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-dde6-c4fa3143bca3	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-984d-6aaf50828520	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-984d-6aaf50828520	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-984d-6aaf50828520	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-d812-1a40ede7af1e	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-d812-1a40ede7af1e	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-d812-1a40ede7af1e	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-d812-1a40ede7af1e	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-d812-1a40ede7af1e	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-d812-1a40ede7af1e	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-d812-1a40ede7af1e	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-d812-1a40ede7af1e	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-e20d-effef06aa059	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-e20d-effef06aa059	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-e20d-effef06aa059	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-e20d-effef06aa059	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-991c-6363167209c2
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-6b8b-53e18b8f2496
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-8f96-5e1a16fda99d
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-639f-e4eca1ae064b	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-30b7-4ddd4ca7929d	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-30b7-4ddd4ca7929d	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-30b7-4ddd4ca7929d	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-30b7-4ddd4ca7929d	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-30b7-4ddd4ca7929d	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-30b7-4ddd4ca7929d	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-30b7-4ddd4ca7929d	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-8f96-5e1a16fda99d
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-6b8b-53e18b8f2496
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-991c-6363167209c2
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-7c1c-d61b033df2f4
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-9aa0-7e86a19e8742
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-67f4-51b61be387d2
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-f0a2-bd6fa964bb8d	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-2add-4dcf59231a1b	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-b2c4-2527fc368e1f	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-b2c4-2527fc368e1f	00030000-5672-d28b-d997-4b196ad18fd1
00020000-5672-d28b-01f0-52bef60022a9	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-c247-4ca29ba5c245	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-c247-4ca29ba5c245	00030000-5672-d28b-14da-17337d7ecc3d
00020000-5672-d28b-fbab-678c441f18c9	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-df2e-7f8f8b7a74ba	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-df2e-7f8f8b7a74ba	00030000-5672-d28b-9224-6c8856ca4afb
00020000-5672-d28b-bf0a-9d1898e6ce9c	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-fb44-af511fddf247	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28b-fb44-af511fddf247	00030000-5672-d28b-5e42-88719effb128
00020000-5672-d28b-553a-94b898a09356	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28b-3fc9-462c39c933df	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-3fc9-462c39c933df	00030000-5672-d28b-15ad-baeda3b53d30
00020000-5672-d28b-e011-35d93173d5be	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-a6cc-48e2936b3e72	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28b-a6cc-48e2936b3e72	00030000-5672-d28b-a843-de367ce3df31
00020000-5672-d28b-f00c-11289a7ac040	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28b-c3b5-35d2aea89cbe	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-c3b5-35d2aea89cbe	00030000-5672-d28b-ca18-45aeff1eb1c5
00020000-5672-d28b-c3b5-35d2aea89cbe	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-c3b5-35d2aea89cbe	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-c3b5-35d2aea89cbe	00030000-5672-d28b-6b8b-53e18b8f2496
00020000-5672-d28b-c3b5-35d2aea89cbe	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-effd-bd93711e9e17	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-effd-bd93711e9e17	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-effd-bd93711e9e17	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-3b13-3ff7e7b328be	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-3b13-3ff7e7b328be	00030000-5672-d28b-6488-c171d0964289
00020000-5672-d28b-00ab-e2927ce903c6	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-2bf1-b0e055ecda1a
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-430b-5f90bcb6e168	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-e73c-22e194f168a8	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-e73c-22e194f168a8	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-e73c-22e194f168a8	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-e73c-22e194f168a8	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-e73c-22e194f168a8	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-4750-510920eeefd4	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28b-4750-510920eeefd4	00030000-5672-d28b-966d-20ed47238ee3
00020000-5672-d28b-8be2-3207bbc7b0e4	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-e596-e3a5aec87bbf
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-5ad1-b9df534e0a11
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-afd0-4c137ccb1e01
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-1bbd-5a8e84fd7081
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-6904-4a1c5d0a5b1f
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-1582-06a02a81df09
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-45da-82620282d779
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-30e4-ed5bc408a4c6
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-e871-d11e8824042a
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-d2f8-6680413d1728
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-c195-b9e95684bd6b
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-cdfe-7a4541f6fcfb
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-7329-2dfceadd4524
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-fee8-9ff3e1c34ccb
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-28f3-65390d044d8e
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-576c-ab27ce276062
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-2895-d9a1cc58625f
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-7434-a657aa375307
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-99a6-feda67451d55
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-40c6-1aeea31c0e09
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-6348-9ddc49ed32c2
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-136d-5774fabcceee
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-5bd1-eeece69b0712
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-c535-50b85136f267
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-2838-fc3d659bd90b
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-de5b-44fc67fab075
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-90cf-2863bc3563ba
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-d464-f3351c1e9b8e
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-de2c-91a09fd201e9
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-1095-1e84b322b229
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-0047-b782e6509ebf	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-afd0-4c137ccb1e01
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-6904-4a1c5d0a5b1f
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-45da-82620282d779
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-e871-d11e8824042a
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-c195-b9e95684bd6b
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-7329-2dfceadd4524
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-28f3-65390d044d8e
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-2895-d9a1cc58625f
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-99a6-feda67451d55
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-6348-9ddc49ed32c2
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-d464-f3351c1e9b8e
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-90cf-2863bc3563ba
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-de2c-91a09fd201e9
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-1095-1e84b322b229
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-c99b-9c68f382351d	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-2ba1-921e9eec44fd
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-b6e4-8443860cb8af
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-3f55-ff9f49e721d8	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-d065-8e244625fa44	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-8d9a-067036c715f7	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-8d9a-067036c715f7	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-8d9a-067036c715f7	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-8d9a-067036c715f7	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28b-8d9a-067036c715f7	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-8d9a-067036c715f7	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-8d9a-067036c715f7	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-8d9a-067036c715f7	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-ec8a-63537eca4354
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-c9de-fe544b37d0ed
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-e12b-0c069cb800dc	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-c57e-7d47ebc718b6	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-1c81-2ff52c4fe7be	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-1c81-2ff52c4fe7be	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-1c81-2ff52c4fe7be	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-1c81-2ff52c4fe7be	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-1c81-2ff52c4fe7be	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-1c81-2ff52c4fe7be	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-1c81-2ff52c4fe7be	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-aedc-acc7b7fc1704	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-aedc-acc7b7fc1704	00030000-5672-d28b-c9de-fe544b37d0ed
00020000-5672-d28b-aedc-acc7b7fc1704	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-aedc-acc7b7fc1704	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-3004-a90d2de30f6a	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-3004-a90d2de30f6a	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-6f76-e487329eb685
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-ab03-053c255788a1
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-90cf-2863bc3563ba
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-c535-50b85136f267
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-b6e4-8443860cb8af
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-1095-1e84b322b229
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-de5b-44fc67fab075
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-ec8a-63537eca4354
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-de2c-91a09fd201e9
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-2838-fc3d659bd90b
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-d464-f3351c1e9b8e
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-5bd1-eeece69b0712
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-e596-e3a5aec87bbf
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-afd0-4c137ccb1e01
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-5ad1-b9df534e0a11
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-1bbd-5a8e84fd7081
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-6904-4a1c5d0a5b1f
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-1582-06a02a81df09
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-45da-82620282d779
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-30e4-ed5bc408a4c6
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-e871-d11e8824042a
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-d2f8-6680413d1728
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-c195-b9e95684bd6b
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-cdfe-7a4541f6fcfb
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-7329-2dfceadd4524
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-fee8-9ff3e1c34ccb
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-28f3-65390d044d8e
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-576c-ab27ce276062
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-2895-d9a1cc58625f
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-7434-a657aa375307
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-99a6-feda67451d55
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-40c6-1aeea31c0e09
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-6348-9ddc49ed32c2
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-136d-5774fabcceee
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-c9de-fe544b37d0ed
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-2ba1-921e9eec44fd
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-13f5-8fffeebc3459	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-6f76-e487329eb685
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-ab03-053c255788a1
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-f486-079e8a747fe4	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-6f76-e487329eb685
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-ab03-053c255788a1
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-b6e4-8443860cb8af
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-2ba1-921e9eec44fd
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-31ad-aa5d5f550188	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-6f76-e487329eb685
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-ab03-053c255788a1
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-90cf-2863bc3563ba
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-c535-50b85136f267
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-b6e4-8443860cb8af
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-1095-1e84b322b229
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-de5b-44fc67fab075
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-9aa0-7e86a19e8742
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-ec8a-63537eca4354
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-7c1c-d61b033df2f4
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-de2c-91a09fd201e9
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-2838-fc3d659bd90b
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-6b8b-53e18b8f2496
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-d464-f3351c1e9b8e
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-5bd1-eeece69b0712
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-67f4-51b61be387d2
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-e596-e3a5aec87bbf
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-afd0-4c137ccb1e01
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-5ad1-b9df534e0a11
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-1bbd-5a8e84fd7081
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-6904-4a1c5d0a5b1f
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-1582-06a02a81df09
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-45da-82620282d779
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-30e4-ed5bc408a4c6
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-e871-d11e8824042a
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-d2f8-6680413d1728
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-c195-b9e95684bd6b
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-cdfe-7a4541f6fcfb
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-7329-2dfceadd4524
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-fee8-9ff3e1c34ccb
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-28f3-65390d044d8e
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-576c-ab27ce276062
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-2895-d9a1cc58625f
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-7434-a657aa375307
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-99a6-feda67451d55
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-40c6-1aeea31c0e09
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-6348-9ddc49ed32c2
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-136d-5774fabcceee
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-c9de-fe544b37d0ed
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-8f96-5e1a16fda99d
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-991c-6363167209c2
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-2ba1-921e9eec44fd
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-8efa-5f94e136c0b0
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-47a5-9cbcff8dd49f	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-6f76-e487329eb685
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-ab03-053c255788a1
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-b6e4-8443860cb8af
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-9aa0-7e86a19e8742
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-7c1c-d61b033df2f4
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-6b8b-53e18b8f2496
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-67f4-51b61be387d2
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-8f96-5e1a16fda99d
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-991c-6363167209c2
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-2ba1-921e9eec44fd
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-8efa-5f94e136c0b0
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-4cc5-c1afce80be81	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-3144-fc5685e02b28	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-90cf-2863bc3563ba
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-c535-50b85136f267
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-1095-1e84b322b229
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-de5b-44fc67fab075
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-9aa0-7e86a19e8742
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-2bf1-b0e055ecda1a
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-ec8a-63537eca4354
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-7c1c-d61b033df2f4
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-de2c-91a09fd201e9
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-2838-fc3d659bd90b
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-6b8b-53e18b8f2496
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-d464-f3351c1e9b8e
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-5bd1-eeece69b0712
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-67f4-51b61be387d2
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-e596-e3a5aec87bbf
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-afd0-4c137ccb1e01
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-5ad1-b9df534e0a11
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-1bbd-5a8e84fd7081
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-6904-4a1c5d0a5b1f
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-1582-06a02a81df09
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-45da-82620282d779
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-30e4-ed5bc408a4c6
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-e871-d11e8824042a
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-d2f8-6680413d1728
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-c195-b9e95684bd6b
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-cdfe-7a4541f6fcfb
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-7329-2dfceadd4524
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-fee8-9ff3e1c34ccb
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-28f3-65390d044d8e
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-576c-ab27ce276062
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-2895-d9a1cc58625f
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-7434-a657aa375307
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-99a6-feda67451d55
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-40c6-1aeea31c0e09
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-6348-9ddc49ed32c2
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-136d-5774fabcceee
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-c9de-fe544b37d0ed
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-8f96-5e1a16fda99d
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-991c-6363167209c2
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-6488-c171d0964289
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-8efa-5f94e136c0b0
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28b-a7dd-a1adeed5c1c1	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-32a5-3da158b9de8b
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c611-fcf2a450878f
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a7a7-c01260cdad63
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a843-de367ce3df31
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-4807-61e461307f23
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6525-3f7ec3b2e226
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-fbc7-92d39ecfd0c5
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-31cd-99df8141cd94
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-043e-7bed913cc171
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6f76-e487329eb685
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6546-8039903befd4
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-ab03-053c255788a1
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a081-f04aa7ffb9f6
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-dbcf-6f6509336d3e
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-1ab3-0e76a109267f
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-19c5-f4d9ad9f3578
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-3cd7-3a03c50bb657
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-3c2c-aea17ec985a0
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a08a-8f65f213523f
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-0112-d6b1e50447db
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2a05-141e1c2d53f3
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-90cf-2863bc3563ba
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c535-50b85136f267
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-1f19-5a84a4edcde4
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-9224-6c8856ca4afb
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c4d5-369b69edbe9f
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-5d0d-d9667b0f7c79
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-b6e4-8443860cb8af
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-d48e-a0d97be82ca3
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-448a-27ed843e8a22
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-84be-9302fc65bd72
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-1095-1e84b322b229
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-de5b-44fc67fab075
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-d34e-76adbbec39f9
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-9aa0-7e86a19e8742
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-f298-fb93ebe673f3
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2253-11c147d91f5c
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-56b5-3d824538890a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2c34-814a81c8b963
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-8d7a-eb54039fc34e
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-97cb-ae59b358d90a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-20fa-049bbe5b722a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-e0ba-360dd7a0948f
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-bea8-88ff500cca0a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-53f1-fd166105811d
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-7d22-c481260ade22
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-3931-5e16941d595c
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-8059-a851474d0634
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6043-f912951f2bf5
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-bd91-a9a373533753
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2bf1-b0e055ecda1a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-9ff6-1dba42bbf045
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-50a9-320dd702eb03
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-bb43-a7d551a0a42e
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-e241-2f53b99b5a5a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-ec8a-63537eca4354
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-7c1c-d61b033df2f4
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a1d9-fb1f605774b9
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-de2c-91a09fd201e9
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2838-fc3d659bd90b
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-5c0d-79eeadbab6f5
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-97af-a53bdd5033b1
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-14da-17337d7ecc3d
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6b8b-53e18b8f2496
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-925f-3fdbe3a88a43
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-85f9-0f1dc16ec554
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c9b9-eb66b6a826f5
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-908d-72e550b07aa7
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-60f7-06068bcbeb1c
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-24e4-e82cc40a36c9
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-d464-f3351c1e9b8e
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-5bd1-eeece69b0712
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-d412-325b9b11f81c
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-67f4-51b61be387d2
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-e596-e3a5aec87bbf
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-afd0-4c137ccb1e01
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-5ad1-b9df534e0a11
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-1bbd-5a8e84fd7081
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6904-4a1c5d0a5b1f
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-1582-06a02a81df09
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-45da-82620282d779
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-30e4-ed5bc408a4c6
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-e871-d11e8824042a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-d2f8-6680413d1728
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c195-b9e95684bd6b
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-cdfe-7a4541f6fcfb
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-7329-2dfceadd4524
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-fee8-9ff3e1c34ccb
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-28f3-65390d044d8e
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-576c-ab27ce276062
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2895-d9a1cc58625f
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-7434-a657aa375307
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-99a6-feda67451d55
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-40c6-1aeea31c0e09
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6348-9ddc49ed32c2
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-136d-5774fabcceee
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-7209-5f4c4f81bde2
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-ca18-45aeff1eb1c5
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a6df-5b20e5cfe08a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-5f7b-3398d213ea4b
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6860-5ac687e45823
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-04ec-f25253d69447
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-fcd0-775b15527da1
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-0b31-a3bb4dd3ee2c
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-8795-50fea6827461
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-90a5-f4b43c295c73
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c2a9-fc4ed2cbb94b
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-b60b-7ad1ac61487a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-fdc1-f7f7853b1fb8
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a768-c5362bd7e7e7
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-023e-37fdedc28cb7
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-3bdd-7307945a6c03
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-78c0-8962e02bf2fa
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-ab60-31943e077499
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-af36-47b096126039
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-e1b5-0322e13e4ae6
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-65a6-5b26023bc1c8
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-b88b-e3aaf07478ac
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-9be7-73c264a2fa4c
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c9de-fe544b37d0ed
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-8f96-5e1a16fda99d
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a6b8-e54d445052ef
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-bf1d-3a750f12b932
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-513a-4651944adeb5
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-9651-03f2f9406efe
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-1eab-9080f99c5a8e
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-607f-038ac63c870c
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-d997-4b196ad18fd1
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-0138-4a3a55a148be
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a505-9787a480d9de
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-02ba-7b80261648de
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-966d-20ed47238ee3
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-991c-6363167209c2
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2ba1-921e9eec44fd
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a9ba-75ff29c25fbf
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6da6-4e5d23103205
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-938e-9612b39027df
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-40ff-af63d0fba87a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-17dd-421f5590c2f0
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-6488-c171d0964289
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-f623-7ba36959a6cc
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-0292-61454ff83df1
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-8efa-5f94e136c0b0
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-2754-e031abdc5ff3
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-b81a-24f153924e70
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-7f52-b38d9cbcb34a
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-15ad-baeda3b53d30
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-4419-70e2a4243885
00020000-5672-d28d-4392-004006c8b3e4	00030000-5672-d28b-5e42-88719effb128
00020000-5672-d28d-7a60-54ab35ab81bc	00030000-5672-d28b-a3fa-26aca3851ba5
00020000-5672-d28d-2270-1bedd02d660d	00030000-5672-d28b-1e00-7055dacc1960
00020000-5672-d28d-029d-b6d0d9bad6a9	00030000-5672-d28b-2ba1-921e9eec44fd
00020000-5672-d28d-1f03-290637ec7696	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28d-5eda-73a1bb22588b	00030000-5672-d28b-97cb-ae59b358d90a
00020000-5672-d28d-7480-745664b08777	00030000-5672-d28b-20fa-049bbe5b722a
00020000-5672-d28d-5ddc-a178fefeeeb6	00030000-5672-d28b-e0ba-360dd7a0948f
00020000-5672-d28d-af3d-078a8d0b23bd	00030000-5672-d28b-8d7a-eb54039fc34e
00020000-5672-d28d-13fe-19fb8f63d267	00030000-5672-d28b-56b5-3d824538890a
00020000-5672-d28d-1cc7-744a11c4513e	00030000-5672-d28b-2c34-814a81c8b963
00020000-5672-d28d-ecd6-98e5b8e088d0	00030000-5672-d28b-13e7-69d74260485c
00020000-5672-d28d-c221-6f3b2ff7a917	00030000-5672-d28b-c0a4-2964124d3b26
00020000-5672-d28d-c661-f8d2625aa111	00030000-5672-d28b-c923-d019fb647488
00020000-5672-d28d-7b59-485926be2e6f	00030000-5672-d28b-e6d0-29aa3626a972
00020000-5672-d28d-35e2-8620db77a98e	00030000-5672-d28b-93b7-9e32d95ba6da
00020000-5672-d28d-3f6e-e74b5535c2ec	00030000-5672-d28b-35d1-cc213968f54e
00020000-5672-d28d-014b-4f2018e9a53c	00030000-5672-d28b-7378-212e94619c21
00020000-5672-d28d-7ae8-48ba62fffebe	00030000-5672-d28b-7434-854bea03bb2d
00020000-5672-d28d-0e3e-e7e426c28afe	00030000-5672-d28b-49db-8fbdb77795d4
00020000-5672-d28d-0e3e-e7e426c28afe	00030000-5672-d28b-7c1c-d61b033df2f4
00020000-5672-d28d-0e3e-e7e426c28afe	00030000-5672-d28b-fa0b-e96f92b3104a
00020000-5672-d28d-5e5a-03cc01ec127f	00030000-5672-d28b-d196-65fc144fd3c9
00020000-5672-d28d-d785-831bca434f85	00030000-5672-d28b-991c-6363167209c2
00020000-5672-d28d-5775-feef5930bcc6	00030000-5672-d28b-9be7-73c264a2fa4c
00020000-5672-d28d-93c0-330d3605124c	00030000-5672-d28b-3fad-d0db6e892909
00020000-5672-d28d-ad53-1b0feb46be4c	00030000-5672-d28b-8f96-5e1a16fda99d
00020000-5672-d28d-3024-c7ed806c42e7	00030000-5672-d28b-163d-17be29623d08
00020000-5672-d28d-b08b-863389cfd02a	00030000-5672-d28b-6b8b-53e18b8f2496
00020000-5672-d28d-f8af-2081e8994f77	00030000-5672-d28b-ac36-8fdac0a4e071
00020000-5672-d28d-e577-ce0477bd9c4b	00030000-5672-d28b-8efa-5f94e136c0b0
00020000-5672-d28d-4c16-4325c8c741a2	00030000-5672-d28b-62dc-0ec0992bae17
00020000-5672-d28d-97a1-e4f990086344	00030000-5672-d28b-ec8a-63537eca4354
00020000-5672-d28d-3567-0c28f3ddc2f3	00030000-5672-d28b-5b48-406405d99552
00020000-5672-d28d-6d5a-cffe5fb54952	00030000-5672-d28b-c9de-fe544b37d0ed
00020000-5672-d28d-e1cd-aa3b1de39875	00030000-5672-d28b-1786-712b2c3b8441
00020000-5672-d28d-1fbf-033a3984c042	00030000-5672-d28b-aebe-9f5e01d1e29d
00020000-5672-d28d-4f8d-71525e5beed6	00030000-5672-d28b-2f4d-c2eb67ac3d57
00020000-5672-d28d-17f1-1aacf3c00d40	00030000-5672-d28b-55f5-2a7aee7f31f6
00020000-5672-d28d-25a1-6ee5b9c8265d	00030000-5672-d28b-26a2-f494b0ffd0df
00020000-5672-d28d-5f93-dfa521ebec3f	00030000-5672-d28b-b6e4-8443860cb8af
\.


--
-- TOC entry 3152 (class 0 OID 32734157)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32734191)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32734329)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5672-d28d-62ab-b47b7076d063	00090000-5672-d28d-9bc9-bf637327a68b	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5672-d28d-0e37-bd834efb91e5	00090000-5672-d28d-bc99-dfa73422228b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5672-d28d-c5df-b1309cbdbb35	00090000-5672-d28d-8f22-f68fab735b98	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5672-d28d-67ee-0a9993e80814	00090000-5672-d28d-1af2-e2f63c12d56f	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32733849)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5672-d28d-de12-a34cd25addd7	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-d28d-56b4-3329f31b0950	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5672-d28d-be19-ae1232df8c9d	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-d28d-7d0b-630628144356	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-d28d-58eb-ff0bb1c64e3c	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-d28d-cb7b-4537ccdf3215	\N	00040000-5672-d28a-e625-f7a1297464d2	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-d28d-95f7-a93659ab60e9	\N	00040000-5672-d28a-69fc-419049516bed	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-d28d-ebaa-ccce99df264b	\N	00040000-5672-d28a-8b7c-57bffa695792	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-d28d-b9a9-731e5ba408a6	\N	00040000-5672-d28a-d577-39c2a6085b17	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-d28f-5b8b-e6640c6c8584	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32733894)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5672-d28a-590d-8375ebb0a3b1	8341	Adlešiči
00050000-5672-d28a-9966-7587e997fa3e	5270	Ajdovščina
00050000-5672-d28a-6d47-4e73fa2a9e6b	6280	Ankaran/Ancarano
00050000-5672-d28a-c653-8a957eb099eb	9253	Apače
00050000-5672-d28a-3c4f-af4d34d47b17	8253	Artiče
00050000-5672-d28a-5656-3ff88bfc3f45	4275	Begunje na Gorenjskem
00050000-5672-d28a-8f87-9986d9aba4ae	1382	Begunje pri Cerknici
00050000-5672-d28a-7e1d-fb6919c5cfab	9231	Beltinci
00050000-5672-d28a-cbda-3e259634bf63	2234	Benedikt
00050000-5672-d28a-c6af-47c1d81a1952	2345	Bistrica ob Dravi
00050000-5672-d28a-2c1c-b8a45bdb4eec	3256	Bistrica ob Sotli
00050000-5672-d28a-e61a-89952f3c3f0c	8259	Bizeljsko
00050000-5672-d28a-0841-9ea66d125ec6	1223	Blagovica
00050000-5672-d28a-9071-85082e8c65d3	8283	Blanca
00050000-5672-d28a-3acb-dc5a7d9f0597	4260	Bled
00050000-5672-d28a-4c54-e2c8fbe929fd	4273	Blejska Dobrava
00050000-5672-d28a-6e05-dc0e3dd88342	9265	Bodonci
00050000-5672-d28a-d835-ba8c709bb0b8	9222	Bogojina
00050000-5672-d28a-fb62-7e9db91b94c7	4263	Bohinjska Bela
00050000-5672-d28a-ebf1-ae1217bc77fe	4264	Bohinjska Bistrica
00050000-5672-d28a-d1e2-7a644c4c8bb0	4265	Bohinjsko jezero
00050000-5672-d28a-63d5-09392ee1f3a7	1353	Borovnica
00050000-5672-d28a-963e-b3d39dc0a23e	8294	Boštanj
00050000-5672-d28a-e834-b94c2b6c563b	5230	Bovec
00050000-5672-d28a-cb98-b67519eafcfa	5295	Branik
00050000-5672-d28a-3dd3-b3291313c5b8	3314	Braslovče
00050000-5672-d28a-2ce3-0e59e7996bda	5223	Breginj
00050000-5672-d28a-7d5f-2d9645516b48	8280	Brestanica
00050000-5672-d28a-2d66-fc821e02b3b1	2354	Bresternica
00050000-5672-d28a-b057-60a5b845bf42	4243	Brezje
00050000-5672-d28a-19be-4eb138e7b60d	1351	Brezovica pri Ljubljani
00050000-5672-d28a-858f-10a7b38a5740	8250	Brežice
00050000-5672-d28a-e251-d77149b7a528	4210	Brnik - Aerodrom
00050000-5672-d28a-f3cd-3cd9ff132d23	8321	Brusnice
00050000-5672-d28a-e46c-c71d78899eaf	3255	Buče
00050000-5672-d28a-0486-05a117e4bc76	8276	Bučka 
00050000-5672-d28a-b733-e2becd029a44	9261	Cankova
00050000-5672-d28a-ac00-804ea81f3de0	3000	Celje 
00050000-5672-d28a-839c-dcf6619186f0	3001	Celje - poštni predali
00050000-5672-d28a-6c1e-009cd0aa455e	4207	Cerklje na Gorenjskem
00050000-5672-d28a-531a-5bc04a22b7d1	8263	Cerklje ob Krki
00050000-5672-d28a-e32d-4c1b05bd7d6c	1380	Cerknica
00050000-5672-d28a-f731-150dea44c671	5282	Cerkno
00050000-5672-d28a-598b-2fd0e4ff36e5	2236	Cerkvenjak
00050000-5672-d28a-fcb6-76a2e78fb184	2215	Ceršak
00050000-5672-d28a-7df4-f9c1eb579c50	2326	Cirkovce
00050000-5672-d28a-283c-e6d7e5db3b21	2282	Cirkulane
00050000-5672-d28a-e2f0-89de991272d0	5273	Col
00050000-5672-d28a-6cf7-908a909239f8	8251	Čatež ob Savi
00050000-5672-d28a-3061-7d77fd7aed06	1413	Čemšenik
00050000-5672-d28a-b9ff-b7a45818d0c0	5253	Čepovan
00050000-5672-d28a-2401-09261eab16f3	9232	Črenšovci
00050000-5672-d28a-354a-b0b006e9ed40	2393	Črna na Koroškem
00050000-5672-d28a-2de3-130dc558e785	6275	Črni Kal
00050000-5672-d28a-8421-fb05a41bd4a6	5274	Črni Vrh nad Idrijo
00050000-5672-d28a-555c-317ce21779db	5262	Črniče
00050000-5672-d28a-b46d-74fed422edc9	8340	Črnomelj
00050000-5672-d28a-20bd-bc3f50b30ff0	6271	Dekani
00050000-5672-d28a-204f-b3a4622cc022	5210	Deskle
00050000-5672-d28a-8e26-785e5b757ecf	2253	Destrnik
00050000-5672-d28a-a181-a507726cf976	6215	Divača
00050000-5672-d28a-4723-adcdf56fce48	1233	Dob
00050000-5672-d28a-5666-43fe3552239e	3224	Dobje pri Planini
00050000-5672-d28a-60ff-d421aff56240	8257	Dobova
00050000-5672-d28a-5684-bdf5048ede13	1423	Dobovec
00050000-5672-d28a-2f54-38bff38c72d4	5263	Dobravlje
00050000-5672-d28a-bba7-3458c5f874f1	3204	Dobrna
00050000-5672-d28a-55c7-2aadb150ca2b	8211	Dobrnič
00050000-5672-d28a-6b9e-f6afa1c70b4f	1356	Dobrova
00050000-5672-d28a-772e-5d1cbc4b92c3	9223	Dobrovnik/Dobronak 
00050000-5672-d28a-24a6-dce5eadd5ff6	5212	Dobrovo v Brdih
00050000-5672-d28a-3777-b8d4c96457b3	1431	Dol pri Hrastniku
00050000-5672-d28a-2fe9-d4a938ab1360	1262	Dol pri Ljubljani
00050000-5672-d28a-5932-9a77b5364193	1273	Dole pri Litiji
00050000-5672-d28a-6ff1-a8ffbec41122	1331	Dolenja vas
00050000-5672-d28a-81f9-e70c7b082684	8350	Dolenjske Toplice
00050000-5672-d28a-e1e8-e88313e60ebb	1230	Domžale
00050000-5672-d28a-2ad3-00f45e60cca6	2252	Dornava
00050000-5672-d28a-d5f5-2300e4193997	5294	Dornberk
00050000-5672-d28a-b5f3-246847c2c574	1319	Draga
00050000-5672-d28a-9f4f-cd21b8bbe6fc	8343	Dragatuš
00050000-5672-d28a-2a59-b85fbdd6d306	3222	Dramlje
00050000-5672-d28a-d3aa-346ac07e3ce0	2370	Dravograd
00050000-5672-d28a-6f67-6ab4fb765646	4203	Duplje
00050000-5672-d28a-2bbf-cc7987648310	6221	Dutovlje
00050000-5672-d28a-a959-1b7408eeff2b	8361	Dvor
00050000-5672-d28a-0a11-c36131b2eae5	2343	Fala
00050000-5672-d28a-4cc2-60d9bde16d31	9208	Fokovci
00050000-5672-d28a-9329-152b863e61fd	2313	Fram
00050000-5672-d28a-7faa-0e109b8b431a	3213	Frankolovo
00050000-5672-d28a-708b-5f60393008ef	1274	Gabrovka
00050000-5672-d28a-664b-715ec82bd46d	8254	Globoko
00050000-5672-d28a-70f2-1744abff86b0	5275	Godovič
00050000-5672-d28a-7b1c-d2d77cc78a77	4204	Golnik
00050000-5672-d28a-ee51-095cc4f883e6	3303	Gomilsko
00050000-5672-d28a-d1d2-76e48469fc92	4224	Gorenja vas
00050000-5672-d28a-924f-5a0edfc51011	3263	Gorica pri Slivnici
00050000-5672-d28a-1fd7-73a4e658f269	2272	Gorišnica
00050000-5672-d28a-184d-9cc4fc2a3883	9250	Gornja Radgona
00050000-5672-d28a-72d8-01bce3e12c99	3342	Gornji Grad
00050000-5672-d28a-eb90-514b7a9b0dac	4282	Gozd Martuljek
00050000-5672-d28a-78c5-87adf134aae2	6272	Gračišče
00050000-5672-d28a-bc13-6f2a6ed5a13f	9264	Grad
00050000-5672-d28a-a63b-492cbf917e55	8332	Gradac
00050000-5672-d28a-d244-5b72d3dc8e4b	1384	Grahovo
00050000-5672-d28a-1872-bcc16cbfa90f	5242	Grahovo ob Bači
00050000-5672-d28a-4dad-38f00fae26e8	5251	Grgar
00050000-5672-d28a-7df7-782e37f046dc	3302	Griže
00050000-5672-d28a-354e-f17cf8bcb311	3231	Grobelno
00050000-5672-d28a-93d0-a42207c92994	1290	Grosuplje
00050000-5672-d28a-6f3e-368efb125cc6	2288	Hajdina
00050000-5672-d28a-9ce6-dcde877145b4	8362	Hinje
00050000-5672-d28a-4cf4-7a3172240d5b	2311	Hoče
00050000-5672-d28a-25ba-38048d3368de	9205	Hodoš/Hodos
00050000-5672-d28a-da14-bf86626161ac	1354	Horjul
00050000-5672-d28a-d1e2-e85c96649488	1372	Hotedršica
00050000-5672-d28a-f78c-381bfc220c4f	1430	Hrastnik
00050000-5672-d28a-6be8-379a15ab1759	6225	Hruševje
00050000-5672-d28a-094c-52974335bd23	4276	Hrušica
00050000-5672-d28a-0e15-e132ebecd006	5280	Idrija
00050000-5672-d28a-9132-115e1a3db2dc	1292	Ig
00050000-5672-d28a-8c8d-29ef0907eab9	6250	Ilirska Bistrica
00050000-5672-d28a-e4a4-164afe6be544	6251	Ilirska Bistrica-Trnovo
00050000-5672-d28a-f214-262f4f7ee810	1295	Ivančna Gorica
00050000-5672-d28a-b6f2-ae5e3e0d127a	2259	Ivanjkovci
00050000-5672-d28a-0022-a4fc02b68893	1411	Izlake
00050000-5672-d28a-2e86-26de7d9530c1	6310	Izola/Isola
00050000-5672-d28a-cf20-44408f4cc0b5	2222	Jakobski Dol
00050000-5672-d28a-724a-ca78429b11f7	2221	Jarenina
00050000-5672-d28a-d997-1a102b27408a	6254	Jelšane
00050000-5672-d28a-b02f-2b1b0f97bcad	4270	Jesenice
00050000-5672-d28a-a172-39b5c60b251f	8261	Jesenice na Dolenjskem
00050000-5672-d28a-b94b-18836783b246	3273	Jurklošter
00050000-5672-d28a-68fb-a9f8edfe2681	2223	Jurovski Dol
00050000-5672-d28a-0af5-ee2845845df0	2256	Juršinci
00050000-5672-d28a-d23f-523c41cefa2a	5214	Kal nad Kanalom
00050000-5672-d28a-e521-c9a83952d229	3233	Kalobje
00050000-5672-d28a-9e56-95bd4c4f0698	4246	Kamna Gorica
00050000-5672-d28a-211c-2a387b2f9066	2351	Kamnica
00050000-5672-d28a-08d7-e940b38d9a2f	1241	Kamnik
00050000-5672-d28a-50d3-3cfb3dece3b4	5213	Kanal
00050000-5672-d28a-a23e-43d67bca1b3c	8258	Kapele
00050000-5672-d28a-3a26-b57226160154	2362	Kapla
00050000-5672-d28a-cd0c-dcd2b8045f87	2325	Kidričevo
00050000-5672-d28a-0992-3ac6ed6a7069	1412	Kisovec
00050000-5672-d28a-30dc-2d1d04f10475	6253	Knežak
00050000-5672-d28a-d991-ac82ab433bdb	5222	Kobarid
00050000-5672-d28a-21e3-c1238bcbd298	9227	Kobilje
00050000-5672-d28a-a425-c3a856737058	1330	Kočevje
00050000-5672-d28a-1e75-90ef7d4418fd	1338	Kočevska Reka
00050000-5672-d28a-9ea8-93699ecb7418	2276	Kog
00050000-5672-d28a-fb1a-de6a53165a76	5211	Kojsko
00050000-5672-d28a-2366-c35a64c1b8fa	6223	Komen
00050000-5672-d28a-16c0-3b0ad4a39dbb	1218	Komenda
00050000-5672-d28a-08f2-f9a4e4d8bed3	6000	Koper/Capodistria 
00050000-5672-d28a-ab81-37bd6cc6e20b	6001	Koper/Capodistria - poštni predali
00050000-5672-d28a-b260-63c650097f33	8282	Koprivnica
00050000-5672-d28a-0684-d7facee1db4f	5296	Kostanjevica na Krasu
00050000-5672-d28a-6b96-62dca5b8c896	8311	Kostanjevica na Krki
00050000-5672-d28a-10fb-20ae8927e20b	1336	Kostel
00050000-5672-d28a-402c-f63cb16d46b8	6256	Košana
00050000-5672-d28a-6888-f1a7f3bcfa38	2394	Kotlje
00050000-5672-d28a-ff33-4ad0175f33fc	6240	Kozina
00050000-5672-d28a-9926-3322af3a5d4d	3260	Kozje
00050000-5672-d28a-bcb2-aa515c523781	4000	Kranj 
00050000-5672-d28a-a588-a655969a470f	4001	Kranj - poštni predali
00050000-5672-d28a-aa80-2d8a4096b928	4280	Kranjska Gora
00050000-5672-d28a-3834-3a27faf031d6	1281	Kresnice
00050000-5672-d28a-1a1b-2e87c5e2fcfa	4294	Križe
00050000-5672-d28a-74e3-2fc9850efc2e	9206	Križevci
00050000-5672-d28a-47be-315bce5b9b6e	9242	Križevci pri Ljutomeru
00050000-5672-d28a-fbc3-24b8f8af8411	1301	Krka
00050000-5672-d28a-bd29-d61fa6fabc88	8296	Krmelj
00050000-5672-d28a-864b-765697d2abd5	4245	Kropa
00050000-5672-d28a-59f2-f42fa8ee07ce	8262	Krška vas
00050000-5672-d28a-2bc5-ba9591b10b3f	8270	Krško
00050000-5672-d28a-a02c-862a2c950e6f	9263	Kuzma
00050000-5672-d28a-b0ae-43a1e0ef8b2f	2318	Laporje
00050000-5672-d28a-f404-a9e4bbf42c81	3270	Laško
00050000-5672-d28a-1ef6-cbe782c32a79	1219	Laze v Tuhinju
00050000-5672-d28a-ec21-0a226ded4eda	2230	Lenart v Slovenskih goricah
00050000-5672-d28a-c193-d5bf41699e11	9220	Lendava/Lendva
00050000-5672-d28a-0ea0-aa1dd45cfd67	4248	Lesce
00050000-5672-d28a-55f7-9a3beda7451f	3261	Lesično
00050000-5672-d28a-5d88-7b883a5c800e	8273	Leskovec pri Krškem
00050000-5672-d28a-efb5-f2acc504be24	2372	Libeliče
00050000-5672-d28a-c91e-131034286972	2341	Limbuš
00050000-5672-d28a-3bfc-9cc79e0be27e	1270	Litija
00050000-5672-d28a-769f-72a9be51e6ce	3202	Ljubečna
00050000-5672-d28a-cdff-5dd3546fb2d9	1000	Ljubljana 
00050000-5672-d28a-fe19-2f5a31ec11da	1001	Ljubljana - poštni predali
00050000-5672-d28a-16f2-3830263d881c	1231	Ljubljana - Črnuče
00050000-5672-d28a-0619-57f82acd9196	1261	Ljubljana - Dobrunje
00050000-5672-d28a-c0a7-093809e9ebef	1260	Ljubljana - Polje
00050000-5672-d28a-8bde-6a1c7691378a	1210	Ljubljana - Šentvid
00050000-5672-d28a-d24d-4b5b9a2973c1	1211	Ljubljana - Šmartno
00050000-5672-d28a-b197-a5d29fb8f7e0	3333	Ljubno ob Savinji
00050000-5672-d28a-1abf-a7367fc019e9	9240	Ljutomer
00050000-5672-d28a-d7da-eb5d814296b0	3215	Loče
00050000-5672-d28a-4c17-c7af48a3fb0d	5231	Log pod Mangartom
00050000-5672-d28a-40a4-598062a27d85	1358	Log pri Brezovici
00050000-5672-d28a-541c-ecc5bcf04acc	1370	Logatec
00050000-5672-d28a-5d31-fe79b78b5e37	1371	Logatec
00050000-5672-d28a-d623-e14cfd3aa60f	1434	Loka pri Zidanem Mostu
00050000-5672-d28a-2af1-c2f7c0cd1295	3223	Loka pri Žusmu
00050000-5672-d28a-40c6-919ea501e94b	6219	Lokev
00050000-5672-d28a-8dba-7c991edc9a55	1318	Loški Potok
00050000-5672-d28a-4336-12c6e93eba1f	2324	Lovrenc na Dravskem polju
00050000-5672-d28a-6724-e7e2b6ddfc41	2344	Lovrenc na Pohorju
00050000-5672-d28a-f6f8-5d7b58902339	3334	Luče
00050000-5672-d28a-52d6-ac830b0ce131	1225	Lukovica
00050000-5672-d28a-4999-41e1f7f1c68b	9202	Mačkovci
00050000-5672-d28a-c0db-547eaae962c5	2322	Majšperk
00050000-5672-d28a-db49-e50b6a17f031	2321	Makole
00050000-5672-d28a-b51f-385992ca2b91	9243	Mala Nedelja
00050000-5672-d28a-e6f0-69aba3d232d1	2229	Malečnik
00050000-5672-d28a-9b71-4b125f22d3da	6273	Marezige
00050000-5672-d28a-0525-745be7d5c775	2000	Maribor 
00050000-5672-d28a-56fe-5deb4b748cac	2001	Maribor - poštni predali
00050000-5672-d28a-9b8c-b36e5a0cfe86	2206	Marjeta na Dravskem polju
00050000-5672-d28a-eff5-ec88f120ac32	2281	Markovci
00050000-5672-d28a-862c-78ec427820ba	9221	Martjanci
00050000-5672-d28a-4a71-f740c46d6cca	6242	Materija
00050000-5672-d28a-c273-856cf7d347d9	4211	Mavčiče
00050000-5672-d28a-6c8c-dbf62ed16528	1215	Medvode
00050000-5672-d28a-ed08-85b8f80f3a9e	1234	Mengeš
00050000-5672-d28a-cfdd-0bcbb8ad63b2	8330	Metlika
00050000-5672-d28a-eebf-bc90d22a8991	2392	Mežica
00050000-5672-d28a-5218-e49a3b016fd5	2204	Miklavž na Dravskem polju
00050000-5672-d28a-4250-10f959e73ff3	2275	Miklavž pri Ormožu
00050000-5672-d28a-df53-788c238facf5	5291	Miren
00050000-5672-d28a-dc91-c4322e06cfff	8233	Mirna
00050000-5672-d28a-9388-c9df61707cdf	8216	Mirna Peč
00050000-5672-d28a-57e6-ab60d719a00e	2382	Mislinja
00050000-5672-d28a-3b59-3a4ffdae46b8	4281	Mojstrana
00050000-5672-d28a-96f5-d75227738919	8230	Mokronog
00050000-5672-d28a-aba8-6db908a016be	1251	Moravče
00050000-5672-d28a-72df-076331d8ffe3	9226	Moravske Toplice
00050000-5672-d28a-daf4-e6650cc14c69	5216	Most na Soči
00050000-5672-d28a-29e7-439f6406d6e2	1221	Motnik
00050000-5672-d28a-a7cf-bbe093adec71	3330	Mozirje
00050000-5672-d28a-9f7e-a26f9298aaca	9000	Murska Sobota 
00050000-5672-d28a-b849-bfa7d6ab2c9d	9001	Murska Sobota - poštni predali
00050000-5672-d28a-4a28-f444c788e703	2366	Muta
00050000-5672-d28a-f76b-d25850d79bb4	4202	Naklo
00050000-5672-d28a-a95b-8d631d71a28d	3331	Nazarje
00050000-5672-d28a-774c-094bb029a38a	1357	Notranje Gorice
00050000-5672-d28a-5778-ee3585adb086	3203	Nova Cerkev
00050000-5672-d28a-ac79-691200838af5	5000	Nova Gorica 
00050000-5672-d28a-986e-15cd023ad291	5001	Nova Gorica - poštni predali
00050000-5672-d28a-cce0-19d659e75483	1385	Nova vas
00050000-5672-d28a-8a64-a926496cdc7e	8000	Novo mesto
00050000-5672-d28a-c1c7-d070f6b732d7	8001	Novo mesto - poštni predali
00050000-5672-d28a-b283-dd7ccf55dd69	6243	Obrov
00050000-5672-d28a-f290-4b4a8c68a1c4	9233	Odranci
00050000-5672-d28a-d4e3-cc1be891e729	2317	Oplotnica
00050000-5672-d28a-39f0-c571aa7b733c	2312	Orehova vas
00050000-5672-d28a-5577-927dbc2ae3e7	2270	Ormož
00050000-5672-d28a-849a-ac2ca0162c83	1316	Ortnek
00050000-5672-d28a-f312-c7063e81a3b5	1337	Osilnica
00050000-5672-d28a-b4cf-5c1553553f2e	8222	Otočec
00050000-5672-d28a-6c8b-73873932d9a6	2361	Ožbalt
00050000-5672-d28a-c38d-c015d1765bc7	2231	Pernica
00050000-5672-d28a-ad96-19dbf28a3fad	2211	Pesnica pri Mariboru
00050000-5672-d28a-c9b4-7c189f2d6db8	9203	Petrovci
00050000-5672-d28a-a3e5-a93d9a80abe2	3301	Petrovče
00050000-5672-d28a-e0ad-887efc3728bf	6330	Piran/Pirano
00050000-5672-d28a-360f-a01c3e44711a	8255	Pišece
00050000-5672-d28a-4b5e-b1a8ee7c7ed0	6257	Pivka
00050000-5672-d28a-ae9d-001535d774f3	6232	Planina
00050000-5672-d28a-2a33-0e730eddb98d	3225	Planina pri Sevnici
00050000-5672-d28a-06f9-9c17f1fa2840	6276	Pobegi
00050000-5672-d28a-24bb-c85d3ce78f53	8312	Podbočje
00050000-5672-d28a-a28b-390a39fccb43	5243	Podbrdo
00050000-5672-d28a-4418-ab46127a4de4	3254	Podčetrtek
00050000-5672-d28a-e09f-c3a13b8b558f	2273	Podgorci
00050000-5672-d28a-9ed4-aa6e975142eb	6216	Podgorje
00050000-5672-d28a-6f07-18036451b67a	2381	Podgorje pri Slovenj Gradcu
00050000-5672-d28a-e17b-1be33e40ac06	6244	Podgrad
00050000-5672-d28a-10d8-23148d696483	1414	Podkum
00050000-5672-d28a-8d3c-a05f68513ff2	2286	Podlehnik
00050000-5672-d28a-cb6a-ea48bd76731c	5272	Podnanos
00050000-5672-d28a-895f-9c4070f0ca48	4244	Podnart
00050000-5672-d28a-ee7a-0069efb88273	3241	Podplat
00050000-5672-d28a-34ce-4c655ad674bd	3257	Podsreda
00050000-5672-d28a-9770-d28ea1edef86	2363	Podvelka
00050000-5672-d28a-6ac5-e9d6d2253037	2208	Pohorje
00050000-5672-d28a-393e-f46f3c1512fe	2257	Polenšak
00050000-5672-d28a-80ee-4004a6f22068	1355	Polhov Gradec
00050000-5672-d28a-10b8-298c2444cb3c	4223	Poljane nad Škofjo Loko
00050000-5672-d28a-9bf9-fc872a15bff0	2319	Poljčane
00050000-5672-d28a-36db-b4ce35e491a5	1272	Polšnik
00050000-5672-d28a-8623-8ef4c22d3ad8	3313	Polzela
00050000-5672-d28a-3005-13a969633b54	3232	Ponikva
00050000-5672-d28a-8c40-63232486dda0	6320	Portorož/Portorose
00050000-5672-d28a-d7bb-6148b0909672	6230	Postojna
00050000-5672-d28a-1535-bea81b0d3982	2331	Pragersko
00050000-5672-d28a-eb6d-91830a1d0430	3312	Prebold
00050000-5672-d28a-e90e-6f2a9eebd6eb	4205	Preddvor
00050000-5672-d28a-2928-b074c53786b7	6255	Prem
00050000-5672-d28a-b386-909ea702b12d	1352	Preserje
00050000-5672-d28a-f29c-3d9e4dec9f71	6258	Prestranek
00050000-5672-d28a-cb8e-a3bfbc72534a	2391	Prevalje
00050000-5672-d28a-86d0-d7e5fd460b0e	3262	Prevorje
00050000-5672-d28a-37c1-a978c56de7b8	1276	Primskovo 
00050000-5672-d28a-2cba-da412dbc3bb5	3253	Pristava pri Mestinju
00050000-5672-d28a-b5f9-7ebb727d7dc5	9207	Prosenjakovci/Partosfalva
00050000-5672-d28a-5e93-9215612dbf20	5297	Prvačina
00050000-5672-d28a-d69e-1be533817935	2250	Ptuj
00050000-5672-d28a-f68c-7ddd24b169f9	2323	Ptujska Gora
00050000-5672-d28a-1184-a3a005c1eaf2	9201	Puconci
00050000-5672-d28a-1eeb-83e78ac17893	2327	Rače
00050000-5672-d28a-78ce-60c1cc1d5393	1433	Radeče
00050000-5672-d28a-b2a9-41652fcc5076	9252	Radenci
00050000-5672-d28a-c397-092b84f09822	2360	Radlje ob Dravi
00050000-5672-d28a-cba2-e9a4a9854615	1235	Radomlje
00050000-5672-d28a-d3f6-1ee960006110	4240	Radovljica
00050000-5672-d28a-18b0-f2921500d091	8274	Raka
00050000-5672-d28a-ee5b-500f78abe975	1381	Rakek
00050000-5672-d28a-a261-f7348ed1a2bb	4283	Rateče - Planica
00050000-5672-d28a-850b-3e229050f022	2390	Ravne na Koroškem
00050000-5672-d28a-bc58-24acb86cfbc2	9246	Razkrižje
00050000-5672-d28a-4dc5-427babdbbdb1	3332	Rečica ob Savinji
00050000-5672-d28a-6f88-40c5945f1c6d	5292	Renče
00050000-5672-d28a-8f5e-653c1e19d935	1310	Ribnica
00050000-5672-d28a-f281-9e22da5baeec	2364	Ribnica na Pohorju
00050000-5672-d28a-92ab-90e00e62c7dd	3272	Rimske Toplice
00050000-5672-d28a-57bf-47aa8644dd30	1314	Rob
00050000-5672-d28a-b275-cf7a39e8a02f	5215	Ročinj
00050000-5672-d28a-c366-002380546b03	3250	Rogaška Slatina
00050000-5672-d28a-0975-5ba7a5dac56c	9262	Rogašovci
00050000-5672-d28a-6f80-e18bf03c1440	3252	Rogatec
00050000-5672-d28a-ec76-4eaeaab8cabb	1373	Rovte
00050000-5672-d28a-f087-d625d9fd2e99	2342	Ruše
00050000-5672-d28a-8429-b478835ce2ac	1282	Sava
00050000-5672-d28a-1a13-4bc664e2df66	6333	Sečovlje/Sicciole
00050000-5672-d28a-9403-a105c70161f2	4227	Selca
00050000-5672-d28a-c190-45dd91ca8eff	2352	Selnica ob Dravi
00050000-5672-d28a-36d5-f73b07072425	8333	Semič
00050000-5672-d28a-3ce9-767c2bca4adb	8281	Senovo
00050000-5672-d28a-4c0d-1999bf2b0150	6224	Senožeče
00050000-5672-d28a-45f2-fe07cf0e30ba	8290	Sevnica
00050000-5672-d28a-e8fc-2b4b4fcb2fa2	6210	Sežana
00050000-5672-d28a-7c15-1b323656bd42	2214	Sladki Vrh
00050000-5672-d28a-b9d9-49a1c43f9326	5283	Slap ob Idrijci
00050000-5672-d28a-d5e0-da6071b3ddd8	2380	Slovenj Gradec
00050000-5672-d28a-c347-a99dc38a9015	2310	Slovenska Bistrica
00050000-5672-d28a-0550-3e6426777c17	3210	Slovenske Konjice
00050000-5672-d28a-0b46-21788c1e8599	1216	Smlednik
00050000-5672-d28a-387d-f2fc06bf7ef7	5232	Soča
00050000-5672-d28a-162f-8dede36bd123	1317	Sodražica
00050000-5672-d28a-ef66-445b2e3109f0	3335	Solčava
00050000-5672-d28a-9dac-6e7368dc6031	5250	Solkan
00050000-5672-d28a-12c2-9f0a1deb2e83	4229	Sorica
00050000-5672-d28a-b455-bef0f72cf473	4225	Sovodenj
00050000-5672-d28a-285b-88125bbb5f35	5281	Spodnja Idrija
00050000-5672-d28a-2b64-9901f68fa29a	2241	Spodnji Duplek
00050000-5672-d28a-2e8d-ea5cd0da585a	9245	Spodnji Ivanjci
00050000-5672-d28a-2e9e-74f63254f6fb	2277	Središče ob Dravi
00050000-5672-d28a-98ff-c4dbe57ececb	4267	Srednja vas v Bohinju
00050000-5672-d28a-650a-cd2a55e81270	8256	Sromlje 
00050000-5672-d28a-3296-41ba4a85c33e	5224	Srpenica
00050000-5672-d28a-4afc-d42c681d4cde	1242	Stahovica
00050000-5672-d28a-f960-9886616faecb	1332	Stara Cerkev
00050000-5672-d28a-1a4e-e31902eecee1	8342	Stari trg ob Kolpi
00050000-5672-d28a-09a8-933f7001550b	1386	Stari trg pri Ložu
00050000-5672-d28a-54a4-0e07c0800751	2205	Starše
00050000-5672-d28a-51b8-0814340c7872	2289	Stoperce
00050000-5672-d28a-d17e-71b1ec290f4a	8322	Stopiče
00050000-5672-d28a-181a-33ca29aa42e9	3206	Stranice
00050000-5672-d28a-9371-ac4e3ba96244	8351	Straža
00050000-5672-d28a-10be-5aedcc712020	1313	Struge
00050000-5672-d28a-faf6-be99575b0739	8293	Studenec
00050000-5672-d28a-3951-22f0aa909fbf	8331	Suhor
00050000-5672-d28a-89f1-536de0435308	2233	Sv. Ana v Slovenskih goricah
00050000-5672-d28a-6c0c-9d3b7cb36083	2235	Sv. Trojica v Slovenskih goricah
00050000-5672-d28a-abc4-17b5225e1335	2353	Sveti Duh na Ostrem Vrhu
00050000-5672-d28a-c8e4-2bdb4573773e	9244	Sveti Jurij ob Ščavnici
00050000-5672-d28a-e3d5-c29516017ec6	3264	Sveti Štefan
00050000-5672-d28a-1a5a-02ba5699c61c	2258	Sveti Tomaž
00050000-5672-d28a-2bc1-ea9d7a03dd2d	9204	Šalovci
00050000-5672-d28a-3cf3-4c43af23cbbe	5261	Šempas
00050000-5672-d28a-1a0a-c74248cafb30	5290	Šempeter pri Gorici
00050000-5672-d28a-65d6-c21d10db4a76	3311	Šempeter v Savinjski dolini
00050000-5672-d28a-109c-83fd5f8e8df7	4208	Šenčur
00050000-5672-d28a-564e-39c239755636	2212	Šentilj v Slovenskih goricah
00050000-5672-d28a-6eff-d50c3620d4c1	8297	Šentjanž
00050000-5672-d28a-9ba9-72c4eb7a8c9e	2373	Šentjanž pri Dravogradu
00050000-5672-d28a-a908-801c36c19a9a	8310	Šentjernej
00050000-5672-d28a-057a-d91e59b6060b	3230	Šentjur
00050000-5672-d28a-b954-9c47056684e6	3271	Šentrupert
00050000-5672-d28a-0234-e51b265e1944	8232	Šentrupert
00050000-5672-d28a-89f5-74e1468555cb	1296	Šentvid pri Stični
00050000-5672-d28a-732f-a8d9e2c0d813	8275	Škocjan
00050000-5672-d28a-4850-ecc3aef92e5f	6281	Škofije
00050000-5672-d28a-ffc6-2c64535a29ee	4220	Škofja Loka
00050000-5672-d28a-3ee3-0097596c2180	3211	Škofja vas
00050000-5672-d28a-c6c2-79b321a2857e	1291	Škofljica
00050000-5672-d28a-345d-4f796a881ba8	6274	Šmarje
00050000-5672-d28a-c535-58f1f8efc40a	1293	Šmarje - Sap
00050000-5672-d28a-fcf3-9721b9832bfd	3240	Šmarje pri Jelšah
00050000-5672-d28a-15e8-7ce9cde06e95	8220	Šmarješke Toplice
00050000-5672-d28a-55ad-1dfd44ea9e58	2315	Šmartno na Pohorju
00050000-5672-d28a-df9f-5875b0d2131a	3341	Šmartno ob Dreti
00050000-5672-d28a-a217-791e4eb6416f	3327	Šmartno ob Paki
00050000-5672-d28a-48e3-4407a2b61325	1275	Šmartno pri Litiji
00050000-5672-d28a-c764-4404df960a86	2383	Šmartno pri Slovenj Gradcu
00050000-5672-d28a-880b-3d6f51b2478b	3201	Šmartno v Rožni dolini
00050000-5672-d28a-1935-0a8dde6fcf40	3325	Šoštanj
00050000-5672-d28a-352b-ec959d882a01	6222	Štanjel
00050000-5672-d28a-618f-39d459da87cc	3220	Štore
00050000-5672-d28a-8433-204cbafa5f84	3304	Tabor
00050000-5672-d28a-7d58-7d912d35cb64	3221	Teharje
00050000-5672-d28a-e42c-c9df8054f301	9251	Tišina
00050000-5672-d28a-eda7-faea620d7eb2	5220	Tolmin
00050000-5672-d28a-79d3-45503297ed09	3326	Topolšica
00050000-5672-d28a-58dc-d3c2e516c9c5	2371	Trbonje
00050000-5672-d28a-a3cd-d3831bb04b09	1420	Trbovlje
00050000-5672-d28a-8424-dc700611e2ae	8231	Trebelno 
00050000-5672-d28a-a799-52c8c7c1b1dd	8210	Trebnje
00050000-5672-d28a-60eb-e7846b7beeda	5252	Trnovo pri Gorici
00050000-5672-d28a-05e1-2db5846336e3	2254	Trnovska vas
00050000-5672-d28a-8675-61aae9d92cd5	1222	Trojane
00050000-5672-d28a-bb6c-81eac2e468e5	1236	Trzin
00050000-5672-d28a-4b21-c1e6887ba393	4290	Tržič
00050000-5672-d28a-0013-4b0e88c5cdae	8295	Tržišče
00050000-5672-d28a-f924-77e9e8f746fd	1311	Turjak
00050000-5672-d28a-fd0f-f49a3145d608	9224	Turnišče
00050000-5672-d28a-beb5-e114f6e595a8	8323	Uršna sela
00050000-5672-d28a-d9e1-2f422d2956b2	1252	Vače
00050000-5672-d28a-3c12-51acbd94dd5f	3320	Velenje 
00050000-5672-d28a-6b09-fb44d0cd85e8	3322	Velenje - poštni predali
00050000-5672-d28a-dba9-b7349bdd47ad	8212	Velika Loka
00050000-5672-d28a-08dc-a9d12da125f7	2274	Velika Nedelja
00050000-5672-d28a-da1a-49c6739b42b7	9225	Velika Polana
00050000-5672-d28a-ba63-61052ed4de79	1315	Velike Lašče
00050000-5672-d28a-d076-28946e864961	8213	Veliki Gaber
00050000-5672-d28a-a23e-05f8dd660c50	9241	Veržej
00050000-5672-d28a-3809-f23cd6aca967	1312	Videm - Dobrepolje
00050000-5672-d28a-4fb7-8454f039a859	2284	Videm pri Ptuju
00050000-5672-d28a-0a03-50de503f3381	8344	Vinica
00050000-5672-d28a-d7d2-883b566405ba	5271	Vipava
00050000-5672-d28a-9258-1f011495b07e	4212	Visoko
00050000-5672-d28a-90d0-65642fcb0e24	1294	Višnja Gora
00050000-5672-d28a-340f-a889aa13a5b3	3205	Vitanje
00050000-5672-d28a-316f-398ef265a66b	2255	Vitomarci
00050000-5672-d28a-9046-49b185413a9a	1217	Vodice
00050000-5672-d28a-2020-a4163f6e9fec	3212	Vojnik\t
00050000-5672-d28a-2a70-2e3a59131015	5293	Volčja Draga
00050000-5672-d28a-0a36-8a28798d584f	2232	Voličina
00050000-5672-d28a-d61c-9ea35e897813	3305	Vransko
00050000-5672-d28a-d86a-9721e90667a3	6217	Vremski Britof
00050000-5672-d28a-acef-09aa3c340fe3	1360	Vrhnika
00050000-5672-d28a-e501-2422330ac09f	2365	Vuhred
00050000-5672-d28a-6e9a-f771d9a92ac3	2367	Vuzenica
00050000-5672-d28a-80e9-53f12fd62ff6	8292	Zabukovje 
00050000-5672-d28a-c0a6-defe18247ce7	1410	Zagorje ob Savi
00050000-5672-d28a-f5bd-40fd7f99995e	1303	Zagradec
00050000-5672-d28a-ebfd-2fa85a87127a	2283	Zavrč
00050000-5672-d28a-bf4c-bfd61be54fd2	8272	Zdole 
00050000-5672-d28a-6b76-95c2ca223966	4201	Zgornja Besnica
00050000-5672-d28a-9183-39f83b88f13c	2242	Zgornja Korena
00050000-5672-d28a-b261-be9ef276db86	2201	Zgornja Kungota
00050000-5672-d28a-3e47-7974f1547ca9	2316	Zgornja Ložnica
00050000-5672-d28a-9495-b7f3eae0c0a2	2314	Zgornja Polskava
00050000-5672-d28a-c705-483409869c23	2213	Zgornja Velka
00050000-5672-d28a-07bf-57adf6954f1b	4247	Zgornje Gorje
00050000-5672-d28a-0529-e664606467d0	4206	Zgornje Jezersko
00050000-5672-d28a-2e34-e48fbb19a6ef	2285	Zgornji Leskovec
00050000-5672-d28a-7b38-3af2abfcc083	1432	Zidani Most
00050000-5672-d28a-d019-17f0cd8dde47	3214	Zreče
00050000-5672-d28a-a821-9c4386cf1c5f	4209	Žabnica
00050000-5672-d28a-9182-653eb6b32769	3310	Žalec
00050000-5672-d28a-eb5e-5e5458e59638	4228	Železniki
00050000-5672-d28a-0cf5-126e44f14a5a	2287	Žetale
00050000-5672-d28a-5268-6c68088fee83	4226	Žiri
00050000-5672-d28a-ffb4-107a0eb45122	4274	Žirovnica
00050000-5672-d28a-07ab-c19f91a7afd9	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32734567)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32734131)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32733879)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5672-d28d-8cdf-e287851d7e8e	00080000-5672-d28d-de12-a34cd25addd7	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5672-d28d-48aa-b0b6cb45b629	00080000-5672-d28d-de12-a34cd25addd7	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5672-d28d-4116-d59bb840542b	00080000-5672-d28d-56b4-3329f31b0950	\N	00040000-5672-d28a-bdd6-11e69b8bb63a	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32734023)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5672-d28b-57d9-9fba1adda254	novo leto	1	1	\N	t
00430000-5672-d28b-9a06-a7a7bb3ce487	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5672-d28b-ce65-4425a05090ce	dan upora proti okupatorju	27	4	\N	t
00430000-5672-d28b-22cc-cc50d5c1ec26	praznik dela	1	5	\N	t
00430000-5672-d28b-232d-04f236b81d1e	praznik dela	2	5	\N	t
00430000-5672-d28b-83f0-17f63b55fe77	dan Primoža Trubarja	8	6	\N	f
00430000-5672-d28b-f4db-ef27260edad8	dan državnosti	25	6	\N	t
00430000-5672-d28b-73da-44f4c7c4cdfd	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5672-d28b-d036-31e0750f2b2d	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5672-d28b-799b-7293e94207ac	dan suverenosti	25	10	\N	f
00430000-5672-d28b-11a4-e10a9ca99dba	dan spomina na mrtve	1	11	\N	t
00430000-5672-d28b-6f8d-d8eb280cf42b	dan Rudolfa Maistra	23	11	\N	f
00430000-5672-d28b-f528-17a57fea1f24	božič	25	12	\N	t
00430000-5672-d28b-1955-0112223edf24	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5672-d28b-5dee-6d4c3dde8aa5	Marijino vnebovzetje	15	8	\N	t
00430000-5672-d28b-720d-6f468e9a4f06	dan reformacije	31	10	\N	t
00430000-5672-d28b-701d-762a498a0e82	velikonočna nedelja	27	3	2016	t
00430000-5672-d28b-d23c-9ab1432047e6	velikonočna nedelja	16	4	2017	t
00430000-5672-d28b-b953-72c7029aa458	velikonočna nedelja	1	4	2018	t
00430000-5672-d28b-3133-a52ec477c0c4	velikonočna nedelja	21	4	2019	t
00430000-5672-d28b-a924-eca30c49cd85	velikonočna nedelja	12	4	2020	t
00430000-5672-d28b-49eb-634364a444bc	velikonočna nedelja	4	4	2021	t
00430000-5672-d28b-29e2-7061819431ea	velikonočna nedelja	17	4	2022	t
00430000-5672-d28b-b00a-ea6034c3eba8	velikonočna nedelja	9	4	2023	t
00430000-5672-d28b-ca0c-a207ea235916	velikonočna nedelja	31	3	2024	t
00430000-5672-d28b-0759-d341c7a02153	velikonočna nedelja	20	4	2025	t
00430000-5672-d28b-4c08-e6fb0d59dbfc	velikonočna nedelja	5	4	2026	t
00430000-5672-d28b-8656-41992be6564f	velikonočna nedelja	28	3	2027	t
00430000-5672-d28b-1c5a-2f9a1af6bdf4	velikonočna nedelja	16	4	2028	t
00430000-5672-d28b-7111-e07eef57886e	velikonočna nedelja	1	4	2029	t
00430000-5672-d28b-12cb-0e46ff61d9a1	velikonočna nedelja	21	4	2030	t
00430000-5672-d28b-a611-82cfd250ec9a	velikonočni ponedeljek	28	3	2016	t
00430000-5672-d28b-076e-cd75b0752378	velikonočni ponedeljek	17	4	2017	t
00430000-5672-d28b-e9eb-8a7410b04bdc	velikonočni ponedeljek	2	4	2018	t
00430000-5672-d28b-dc11-7e466c20f149	velikonočni ponedeljek	22	4	2019	t
00430000-5672-d28b-7691-b22aa97bddb5	velikonočni ponedeljek	13	4	2020	t
00430000-5672-d28b-c025-bc5867697eab	velikonočni ponedeljek	5	4	2021	t
00430000-5672-d28b-b9b7-8f1c80ef1ec9	velikonočni ponedeljek	18	4	2022	t
00430000-5672-d28b-85da-9ee8314639f2	velikonočni ponedeljek	10	4	2023	t
00430000-5672-d28b-ebf9-0c9a5cb32e3f	velikonočni ponedeljek	1	4	2024	t
00430000-5672-d28b-a2cd-c1f46e55e2de	velikonočni ponedeljek	21	4	2025	t
00430000-5672-d28b-2d20-2c4d24afb5a0	velikonočni ponedeljek	6	4	2026	t
00430000-5672-d28b-a703-4c0d5f5d0848	velikonočni ponedeljek	29	3	2027	t
00430000-5672-d28b-65d4-35f6d8725a0b	velikonočni ponedeljek	17	4	2028	t
00430000-5672-d28b-a90b-00fd185e56be	velikonočni ponedeljek	2	4	2029	t
00430000-5672-d28b-0a60-e75cee028f7e	velikonočni ponedeljek	22	4	2030	t
00430000-5672-d28b-d781-f74355d215da	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5672-d28b-c282-3345294db204	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5672-d28b-283d-39c1c33beb5f	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5672-d28b-9740-b11d4499c290	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5672-d28b-8f84-9c7b4b3fdaf1	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5672-d28b-66f3-090aa645db19	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5672-d28b-97c8-abe533510a87	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5672-d28b-024a-e30c475c8903	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5672-d28b-542c-5475eb39c46e	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5672-d28b-8d04-c74efa69e8ef	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5672-d28b-35de-3ba0d8a61f3b	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5672-d28b-233a-e3f319aa511a	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5672-d28b-8931-55b2875f8e25	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5672-d28b-17a3-0fe372f848ed	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5672-d28b-34a5-04648564f360	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32733983)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32733995)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32734143)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32734581)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32734591)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5672-d28d-b5f8-3b1d96d8d3fa	00080000-5672-d28d-be19-ae1232df8c9d	0987	AK
00190000-5672-d28d-1a05-9fc2cc38dbfc	00080000-5672-d28d-56b4-3329f31b0950	0989	AK
00190000-5672-d28d-28fa-aa92a3a1e278	00080000-5672-d28d-7d0b-630628144356	0986	AK
00190000-5672-d28d-461e-d34d896e74e9	00080000-5672-d28d-cb7b-4537ccdf3215	0984	AK
00190000-5672-d28d-8ba7-10189cb59f47	00080000-5672-d28d-95f7-a93659ab60e9	0983	AK
00190000-5672-d28d-a970-ac8d9ddab5c2	00080000-5672-d28d-ebaa-ccce99df264b	0982	AK
00190000-5672-d28f-2b97-debc2c8ee913	00080000-5672-d28f-5b8b-e6640c6c8584	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32734480)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5672-d28e-091d-2e2723ebdbc0	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32734599)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32734172)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5672-d28d-babe-a46d958d7f3f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5672-d28d-19a3-2d35fd28e5c0	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5672-d28d-aa42-8fec92cd75c9	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5672-d28d-07e6-cc297143dd98	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5672-d28d-df75-4f217532079f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5672-d28d-4dbc-8b449f51a0e0	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5672-d28d-9c85-de2e3b1126df	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32734116)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32734106)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32734318)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32734248)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32733957)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32733719)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5672-d28f-5b8b-e6640c6c8584	00010000-5672-d28b-8615-810d85077fe5	2015-12-17 16:19:43	INS	a:0:{}
2	App\\Entity\\Option	00000000-5672-d28f-96ee-53349e6b2bb0	00010000-5672-d28b-8615-810d85077fe5	2015-12-17 16:19:43	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5672-d28f-2b97-debc2c8ee913	00010000-5672-d28b-8615-810d85077fe5	2015-12-17 16:19:43	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32734185)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32733757)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5672-d28b-1138-1242d3a419cf	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5672-d28b-7209-026f0f12dde3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5672-d28b-5bc1-a265ee8f0cc8	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5672-d28b-47fa-470f24c657ac	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5672-d28b-5ba4-236222dead96	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5672-d28b-ef6e-ab8263a8ec97	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5672-d28b-dde6-c4fa3143bca3	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5672-d28b-984d-6aaf50828520	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5672-d28b-d812-1a40ede7af1e	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-d28b-e20d-effef06aa059	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-d28b-639f-e4eca1ae064b	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-d28b-30b7-4ddd4ca7929d	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-d28b-f0a2-bd6fa964bb8d	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5672-d28b-2add-4dcf59231a1b	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5672-d28b-b2c4-2527fc368e1f	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5672-d28b-01f0-52bef60022a9	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5672-d28b-c247-4ca29ba5c245	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5672-d28b-fbab-678c441f18c9	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5672-d28b-df2e-7f8f8b7a74ba	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5672-d28b-bf0a-9d1898e6ce9c	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5672-d28b-fb44-af511fddf247	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5672-d28b-553a-94b898a09356	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5672-d28b-3fc9-462c39c933df	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5672-d28b-e011-35d93173d5be	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5672-d28b-a6cc-48e2936b3e72	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5672-d28b-f00c-11289a7ac040	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5672-d28b-c3b5-35d2aea89cbe	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5672-d28b-effd-bd93711e9e17	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5672-d28b-3b13-3ff7e7b328be	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5672-d28b-00ab-e2927ce903c6	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5672-d28b-430b-5f90bcb6e168	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5672-d28b-e73c-22e194f168a8	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5672-d28b-4750-510920eeefd4	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5672-d28b-8be2-3207bbc7b0e4	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5672-d28b-0047-b782e6509ebf	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5672-d28b-c99b-9c68f382351d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5672-d28b-3f55-ff9f49e721d8	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5672-d28b-d065-8e244625fa44	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5672-d28b-8d9a-067036c715f7	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5672-d28b-e12b-0c069cb800dc	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5672-d28b-c57e-7d47ebc718b6	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5672-d28b-1c81-2ff52c4fe7be	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5672-d28b-aedc-acc7b7fc1704	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5672-d28b-3004-a90d2de30f6a	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5672-d28b-13f5-8fffeebc3459	direktor	minimalne pravice za direktorja	t
00020000-5672-d28b-f486-079e8a747fe4	arhivar	arhivar	t
00020000-5672-d28b-31ad-aa5d5f550188	dramaturg	dramaturg	t
00020000-5672-d28b-47a5-9cbcff8dd49f	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5672-d28b-4cc5-c1afce80be81	poslovni-sekretar	poslovni sekretar	t
00020000-5672-d28b-3144-fc5685e02b28	vodja-tehnike	vodja tehnike	t
00020000-5672-d28b-a7dd-a1adeed5c1c1	racunovodja	računovodja	t
00020000-5672-d28d-4392-004006c8b3e4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5672-d28d-7a60-54ab35ab81bc	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-2270-1bedd02d660d	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-029d-b6d0d9bad6a9	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-1f03-290637ec7696	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-5eda-73a1bb22588b	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-7480-745664b08777	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-5ddc-a178fefeeeb6	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-af3d-078a8d0b23bd	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-13fe-19fb8f63d267	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-1cc7-744a11c4513e	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-ecd6-98e5b8e088d0	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-c221-6f3b2ff7a917	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-c661-f8d2625aa111	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-7b59-485926be2e6f	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-35e2-8620db77a98e	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-3f6e-e74b5535c2ec	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-014b-4f2018e9a53c	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-7ae8-48ba62fffebe	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-0e3e-e7e426c28afe	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5672-d28d-5e5a-03cc01ec127f	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-d785-831bca434f85	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-5775-feef5930bcc6	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-93c0-330d3605124c	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-ad53-1b0feb46be4c	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-3024-c7ed806c42e7	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-b08b-863389cfd02a	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-f8af-2081e8994f77	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-e577-ce0477bd9c4b	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-4c16-4325c8c741a2	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-97a1-e4f990086344	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-3567-0c28f3ddc2f3	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-6d5a-cffe5fb54952	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-e1cd-aa3b1de39875	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-1fbf-033a3984c042	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-4f8d-71525e5beed6	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-17f1-1aacf3c00d40	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-25a1-6ee5b9c8265d	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5672-d28d-5f93-dfa521ebec3f	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32733741)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5672-d28b-4a5a-d3a7a8cdb037	00020000-5672-d28b-5bc1-a265ee8f0cc8
00010000-5672-d28b-8615-810d85077fe5	00020000-5672-d28b-5bc1-a265ee8f0cc8
00010000-5672-d28d-99cd-c64fd1f38f88	00020000-5672-d28d-4392-004006c8b3e4
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-7a60-54ab35ab81bc
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-5eda-73a1bb22588b
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-13fe-19fb8f63d267
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-ecd6-98e5b8e088d0
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-c661-f8d2625aa111
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-7ae8-48ba62fffebe
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-029d-b6d0d9bad6a9
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-5e5a-03cc01ec127f
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-93c0-330d3605124c
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-3024-c7ed806c42e7
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-f8af-2081e8994f77
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-4c16-4325c8c741a2
00010000-5672-d28d-2b9b-b29fc2c7788b	00020000-5672-d28d-e1cd-aa3b1de39875
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-7a60-54ab35ab81bc
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-2270-1bedd02d660d
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-029d-b6d0d9bad6a9
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-1f03-290637ec7696
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-c661-f8d2625aa111
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-3f6e-e74b5535c2ec
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-5e5a-03cc01ec127f
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-93c0-330d3605124c
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-3024-c7ed806c42e7
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-f8af-2081e8994f77
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-4c16-4325c8c741a2
00010000-5672-d28d-28bb-3d25d9dde6d4	00020000-5672-d28d-e1cd-aa3b1de39875
00010000-5672-d28d-b18a-70ac74a30783	00020000-5672-d28d-7a60-54ab35ab81bc
00010000-5672-d28d-b18a-70ac74a30783	00020000-5672-d28d-2270-1bedd02d660d
00010000-5672-d28d-b18a-70ac74a30783	00020000-5672-d28d-029d-b6d0d9bad6a9
00010000-5672-d28d-b18a-70ac74a30783	00020000-5672-d28d-1f03-290637ec7696
00010000-5672-d28d-b18a-70ac74a30783	00020000-5672-d28d-ecd6-98e5b8e088d0
00010000-5672-d28d-b18a-70ac74a30783	00020000-5672-d28d-c661-f8d2625aa111
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-2270-1bedd02d660d
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-7480-745664b08777
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-1cc7-744a11c4513e
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-c221-6f3b2ff7a917
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-ecd6-98e5b8e088d0
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-014b-4f2018e9a53c
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-c661-f8d2625aa111
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-7b59-485926be2e6f
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-5e5a-03cc01ec127f
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-d785-831bca434f85
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-93c0-330d3605124c
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-ad53-1b0feb46be4c
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-3024-c7ed806c42e7
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-b08b-863389cfd02a
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-f8af-2081e8994f77
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-e577-ce0477bd9c4b
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-4c16-4325c8c741a2
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-97a1-e4f990086344
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-e1cd-aa3b1de39875
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-1fbf-033a3984c042
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-17f1-1aacf3c00d40
00010000-5672-d28d-8109-ce9b17e36e1a	00020000-5672-d28d-25a1-6ee5b9c8265d
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-2270-1bedd02d660d
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-7480-745664b08777
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-af3d-078a8d0b23bd
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-1cc7-744a11c4513e
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-c221-6f3b2ff7a917
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-ecd6-98e5b8e088d0
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-014b-4f2018e9a53c
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-c661-f8d2625aa111
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-7b59-485926be2e6f
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-35e2-8620db77a98e
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-5e5a-03cc01ec127f
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-d785-831bca434f85
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-5775-feef5930bcc6
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-93c0-330d3605124c
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-ad53-1b0feb46be4c
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-3024-c7ed806c42e7
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-b08b-863389cfd02a
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-f8af-2081e8994f77
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-e577-ce0477bd9c4b
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-4c16-4325c8c741a2
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-97a1-e4f990086344
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-e1cd-aa3b1de39875
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-1fbf-033a3984c042
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-4f8d-71525e5beed6
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-17f1-1aacf3c00d40
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-25a1-6ee5b9c8265d
00010000-5672-d28d-c9d0-3138ebe2ae61	00020000-5672-d28d-5f93-dfa521ebec3f
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-2270-1bedd02d660d
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-029d-b6d0d9bad6a9
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-7480-745664b08777
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-5ddc-a178fefeeeb6
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-af3d-078a8d0b23bd
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-5eda-73a1bb22588b
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-1cc7-744a11c4513e
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-c221-6f3b2ff7a917
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-ecd6-98e5b8e088d0
00010000-5672-d28d-348f-41ecb6cc2d95	00020000-5672-d28d-014b-4f2018e9a53c
00010000-5672-d28d-3ecb-ba2fedab5853	00020000-5672-d28d-7a60-54ab35ab81bc
00010000-5672-d28d-3ecb-ba2fedab5853	00020000-5672-d28d-1f03-290637ec7696
00010000-5672-d28d-3ecb-ba2fedab5853	00020000-5672-d28d-5eda-73a1bb22588b
00010000-5672-d28d-3ecb-ba2fedab5853	00020000-5672-d28d-13fe-19fb8f63d267
00010000-5672-d28d-3ecb-ba2fedab5853	00020000-5672-d28d-ecd6-98e5b8e088d0
00010000-5672-d28d-3ecb-ba2fedab5853	00020000-5672-d28d-c661-f8d2625aa111
00010000-5672-d28d-3ecb-ba2fedab5853	00020000-5672-d28d-7ae8-48ba62fffebe
00010000-5672-d28d-3ecb-ba2fedab5853	00020000-5672-d28d-3567-0c28f3ddc2f3
00010000-5672-d28d-7887-701c234a6d05	00020000-5672-d28d-0e3e-e7e426c28afe
00010000-5672-d28d-0e29-e5df1a01b632	00020000-5672-d28b-13f5-8fffeebc3459
00010000-5672-d28d-f419-77a8fcf1f617	00020000-5672-d28b-f486-079e8a747fe4
00010000-5672-d28d-bcbf-27f25d372797	00020000-5672-d28b-31ad-aa5d5f550188
00010000-5672-d28d-f147-9be91042bed1	00020000-5672-d28b-47a5-9cbcff8dd49f
00010000-5672-d28d-572a-c7df961c7358	00020000-5672-d28b-4cc5-c1afce80be81
00010000-5672-d28d-8e3d-5bf5b4c30100	00020000-5672-d28b-3144-fc5685e02b28
00010000-5672-d28d-1061-0647e02688d9	00020000-5672-d28b-a7dd-a1adeed5c1c1
\.


--
-- TOC entry 3157 (class 0 OID 32734199)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32734137)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32734083)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5672-d28d-2899-1588baafeacf	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5672-d28d-3e44-d341ff8fb4f8	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5672-d28d-5059-857d512233ec	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32733706)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5672-d28a-0e79-29de31e16e17	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5672-d28a-5afb-272c715c7861	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5672-d28a-c0ae-21c0117052e2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5672-d28a-ff3d-769cea2e4197	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5672-d28a-b614-4623795ff867	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32733698)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5672-d28a-8e84-d3f9c0c8dd7b	00230000-5672-d28a-ff3d-769cea2e4197	popa
00240000-5672-d28a-4617-cf7b638640ce	00230000-5672-d28a-ff3d-769cea2e4197	oseba
00240000-5672-d28a-d9bd-b7b0f85e1d3b	00230000-5672-d28a-ff3d-769cea2e4197	tippopa
00240000-5672-d28a-9ce3-fdef945a70fb	00230000-5672-d28a-ff3d-769cea2e4197	organizacijskaenota
00240000-5672-d28a-9b80-4f7da19d0b20	00230000-5672-d28a-ff3d-769cea2e4197	sezona
00240000-5672-d28a-b817-f8d527577b6b	00230000-5672-d28a-ff3d-769cea2e4197	tipvaje
00240000-5672-d28a-1b7b-b1d41b6ee69c	00230000-5672-d28a-5afb-272c715c7861	prostor
00240000-5672-d28a-8666-d0e647ea2972	00230000-5672-d28a-ff3d-769cea2e4197	besedilo
00240000-5672-d28a-bdf6-cec57d12d9d7	00230000-5672-d28a-ff3d-769cea2e4197	uprizoritev
00240000-5672-d28a-46bf-2756f243f236	00230000-5672-d28a-ff3d-769cea2e4197	funkcija
00240000-5672-d28a-fab2-910389c95a63	00230000-5672-d28a-ff3d-769cea2e4197	tipfunkcije
00240000-5672-d28a-9566-847f6c8716f4	00230000-5672-d28a-ff3d-769cea2e4197	alternacija
00240000-5672-d28a-be15-489eb1ed1235	00230000-5672-d28a-0e79-29de31e16e17	pogodba
00240000-5672-d28a-db1a-9a22438eeb31	00230000-5672-d28a-ff3d-769cea2e4197	zaposlitev
00240000-5672-d28a-5d6e-0c32d9df844c	00230000-5672-d28a-ff3d-769cea2e4197	zvrstuprizoritve
00240000-5672-d28a-5079-4d0009d196cd	00230000-5672-d28a-0e79-29de31e16e17	programdela
00240000-5672-d28a-1be0-f2ec94bd9abb	00230000-5672-d28a-ff3d-769cea2e4197	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32733693)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
214a5dff-793b-422b-b363-2d19d5d60d71	00240000-5672-d28a-8e84-d3f9c0c8dd7b	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32734265)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5672-d28e-e7f3-4f7e61820497	000e0000-5672-d28e-84da-bfad9d1b91b9	00080000-5672-d28d-de12-a34cd25addd7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5672-d28b-7cfd-27be9f8f503b
00270000-5672-d28e-1708-687f13057084	000e0000-5672-d28e-84da-bfad9d1b91b9	00080000-5672-d28d-de12-a34cd25addd7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5672-d28b-7cfd-27be9f8f503b
\.


--
-- TOC entry 3122 (class 0 OID 32733841)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32734093)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5672-d28e-4f42-7b114ae46abd	00180000-5672-d28e-5a06-de9fade4dd73	000c0000-5672-d28e-6b51-e7be241b4830	00090000-5672-d28d-9bc9-bf637327a68b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-d28e-cba9-f01d53681d3b	00180000-5672-d28e-5a06-de9fade4dd73	000c0000-5672-d28e-aae4-fb56e7e89a1d	00090000-5672-d28d-1af2-e2f63c12d56f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-d28e-658d-6b6770f07f65	00180000-5672-d28e-5a06-de9fade4dd73	000c0000-5672-d28e-7ea8-53e730b0b4b5	00090000-5672-d28d-ac8c-e35b8b418867	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-d28e-aa2d-e180f6f365cb	00180000-5672-d28e-5a06-de9fade4dd73	000c0000-5672-d28e-da18-c8176a9917a0	00090000-5672-d28d-c01b-ff5462e74e79	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-d28e-e3d5-0ef02e487c06	00180000-5672-d28e-5a06-de9fade4dd73	000c0000-5672-d28e-1ce8-6c5f68bdc6ad	00090000-5672-d28d-6b45-6c28366cac26	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-d28e-9878-b41c77514b9a	00180000-5672-d28e-19a5-6b74d131a4a1	\N	00090000-5672-d28d-6b45-6c28366cac26	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5672-d28e-e18d-adca2dd33d39	00180000-5672-d28e-19a5-6b74d131a4a1	\N	00090000-5672-d28d-1af2-e2f63c12d56f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32734306)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5672-d28a-cc98-ee600a67b299	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5672-d28a-ee16-7950d7520d2d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5672-d28a-d2bf-0a0fbb453e3a	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5672-d28a-27c8-394cab15362f	04	Režija	Režija	Režija	umetnik	30
000f0000-5672-d28a-af64-d2ec81593472	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5672-d28a-3d46-ea5b2cfffea7	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5672-d28a-3772-d04d6617b031	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5672-d28a-c572-dfd9181734dc	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5672-d28a-841b-7c60a26f6cd8	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5672-d28a-c20f-8e0e50556684	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5672-d28a-b248-c82195f8ff93	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5672-d28a-7f5f-7058f1b858ff	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5672-d28a-b459-99972600e103	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5672-d28a-e3c8-4028ad2f4dbf	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5672-d28a-ab1c-c8f344194da6	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5672-d28a-60c4-44e80817bfad	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5672-d28a-5366-5b12b91febb4	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5672-d28a-6df7-551a7578d622	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32733792)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5672-d28d-ceed-d95ff65c51c3	0001	šola	osnovna ali srednja šola
00400000-5672-d28d-5546-e042dfd78fe4	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5672-d28d-4974-2b945cfe6301	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32734611)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5672-d28a-c2a5-05ecfc3966a6	01	Velika predstava	f	1.00	1.00
002b0000-5672-d28a-58ad-41d1393e2bb9	02	Mala predstava	f	0.50	0.50
002b0000-5672-d28a-9d51-5f3d504d2a89	03	Mala koprodukcija	t	0.40	1.00
002b0000-5672-d28a-61e6-a2bce9e299d5	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5672-d28a-6556-107c4b47c07c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32734073)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5672-d28a-7149-9bb21dd0d869	0001	prva vaja	prva vaja
00420000-5672-d28a-332f-be653316ad9c	0002	tehnična vaja	tehnična vaja
00420000-5672-d28a-60a8-292f3a325ded	0003	lučna vaja	lučna vaja
00420000-5672-d28a-b20b-f1b29c0b6b78	0004	kostumska vaja	kostumska vaja
00420000-5672-d28a-bc33-60e1b904a08e	0005	foto vaja	foto vaja
00420000-5672-d28a-e633-7ad670e98108	0006	1. glavna vaja	1. glavna vaja
00420000-5672-d28a-9a88-5c76b7e297c7	0007	2. glavna vaja	2. glavna vaja
00420000-5672-d28a-1e7e-f10a461f8122	0008	1. generalka	1. generalka
00420000-5672-d28a-245b-e30689d541f6	0009	2. generalka	2. generalka
00420000-5672-d28a-1bc5-5c69318fb1b8	0010	odprta generalka	odprta generalka
00420000-5672-d28a-58ef-398a33bdcee5	0011	obnovitvena vaja	obnovitvena vaja
00420000-5672-d28a-83fc-64004d3f2d0e	0012	italijanka	krajša "obnovitvena" vaja
00420000-5672-d28a-c3c9-b5c44ea7a395	0013	pevska vaja	pevska vaja
00420000-5672-d28a-a326-7e94b1808a54	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5672-d28a-b9c1-b51f0b416d03	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32733914)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32733728)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5672-d28b-8615-810d85077fe5	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRODVi6IkaDc0RtJAGO9Dx.uYOK.0KboyC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5672-d28d-4ea1-275d48234d7e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5672-d28d-3659-13e2549afbf1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5672-d28d-dd3a-a538125020b0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5672-d28d-35d9-b9b5e9f3de49	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5672-d28d-e533-9a4812e4d11c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5672-d28d-a89e-4e4eda75109f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5672-d28d-08bb-b0c14a0c8db9	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5672-d28d-9322-d840ccf9f963	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5672-d28d-5f51-0a5eca1f263b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5672-d28d-99cd-c64fd1f38f88	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5672-d28d-8349-de841d275f61	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5672-d28d-2b9b-b29fc2c7788b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5672-d28d-28bb-3d25d9dde6d4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5672-d28d-b18a-70ac74a30783	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5672-d28d-8109-ce9b17e36e1a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5672-d28d-c9d0-3138ebe2ae61	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5672-d28d-348f-41ecb6cc2d95	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5672-d28d-3ecb-ba2fedab5853	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5672-d28d-7887-701c234a6d05	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5672-d28d-0e29-e5df1a01b632	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5672-d28d-f419-77a8fcf1f617	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5672-d28d-bcbf-27f25d372797	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5672-d28d-f147-9be91042bed1	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5672-d28d-572a-c7df961c7358	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5672-d28d-8e3d-5bf5b4c30100	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5672-d28d-1061-0647e02688d9	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5672-d28b-4a5a-d3a7a8cdb037	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32734356)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5672-d28e-34ed-e60fd0ade121	00160000-5672-d28d-4fd4-13346a4dd658	\N	00140000-5672-d28a-6ba6-8068f44d318e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5672-d28d-df75-4f217532079f
000e0000-5672-d28e-84da-bfad9d1b91b9	00160000-5672-d28d-6cf2-b4ebab68b4ea	\N	00140000-5672-d28a-8db3-ede0f6c23286	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5672-d28d-4dbc-8b449f51a0e0
000e0000-5672-d28e-8384-df385b6fa49a	\N	\N	00140000-5672-d28a-8db3-ede0f6c23286	00190000-5672-d28d-b5f8-3b1d96d8d3fa	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5672-d28d-df75-4f217532079f
000e0000-5672-d28e-ec5b-089384ffbdb5	\N	\N	00140000-5672-d28a-8db3-ede0f6c23286	00190000-5672-d28d-b5f8-3b1d96d8d3fa	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5672-d28d-df75-4f217532079f
000e0000-5672-d28e-9204-9f4d49082881	\N	\N	00140000-5672-d28a-8db3-ede0f6c23286	00190000-5672-d28d-b5f8-3b1d96d8d3fa	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5672-d28d-babe-a46d958d7f3f
000e0000-5672-d28e-8329-04c1acafd36f	\N	\N	00140000-5672-d28a-8db3-ede0f6c23286	00190000-5672-d28d-b5f8-3b1d96d8d3fa	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5672-d28d-babe-a46d958d7f3f
\.


--
-- TOC entry 3136 (class 0 OID 32734013)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5672-d28e-ff66-5af6e47b8caa	\N	000e0000-5672-d28e-84da-bfad9d1b91b9	1	
00200000-5672-d28e-f453-60e57bbae5a1	\N	000e0000-5672-d28e-84da-bfad9d1b91b9	2	
00200000-5672-d28e-4669-11d1157622d8	\N	000e0000-5672-d28e-84da-bfad9d1b91b9	3	
00200000-5672-d28e-3349-0ca6b1ae94b7	\N	000e0000-5672-d28e-84da-bfad9d1b91b9	4	
00200000-5672-d28e-4b57-d3d73e4b6fd6	\N	000e0000-5672-d28e-84da-bfad9d1b91b9	5	
\.


--
-- TOC entry 3153 (class 0 OID 32734164)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32734279)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5672-d28b-9377-b051f7725a2a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5672-d28b-5643-c01947694579	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5672-d28b-df17-15a9d2b79eab	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5672-d28b-7582-8032bd49f18b	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5672-d28b-48f6-7413e73f8c3f	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5672-d28b-8608-fb27e1e783e0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5672-d28b-dcbf-0b581ec7c821	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5672-d28b-dbc6-621b546dce67	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5672-d28b-7cfd-27be9f8f503b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5672-d28b-ea75-2f9bfcbc51c9	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5672-d28b-b4c8-a4d8adf99a55	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5672-d28b-59fe-2c373cda2e95	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5672-d28b-6c62-82b75c7e0667	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5672-d28b-78f7-cf3767a3004b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5672-d28b-e55c-08f96b74ec62	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5672-d28b-e38f-c3e9083a537a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5672-d28b-7637-f17f3c7acbf3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5672-d28b-3de3-68894801d5af	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5672-d28b-81ca-95c214a103ba	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5672-d28b-1827-e3dc823cf2e9	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5672-d28b-7746-b9373a07dabd	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5672-d28b-c8c3-f3d99ef9bce3	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5672-d28b-8acd-de107958682d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5672-d28b-6bef-3a889cb530d7	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5672-d28b-d348-06b08bab11fa	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5672-d28b-bc0c-9a2780faf21e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5672-d28b-4c73-55ff549596ae	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5672-d28b-bf2b-d431bbb399bf	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32734661)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32734630)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32734673)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32734237)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5672-d28d-2a98-29e54d963016	00090000-5672-d28d-1af2-e2f63c12d56f	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-d28d-558c-8425695f414b	00090000-5672-d28d-ac8c-e35b8b418867	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-d28d-2290-2be82f181f2f	00090000-5672-d28d-8b94-3a35a4ef9ff1	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-d28d-af37-a7f9d9a427df	00090000-5672-d28d-1237-9a7540b4e6b3	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-d28d-b34a-04ecdabe67bc	00090000-5672-d28d-7b5b-e5195d13679f	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-d28d-3a8a-f781a343bce9	00090000-5672-d28d-b198-3d8fc393220a	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32734057)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32734346)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5672-d28a-6ba6-8068f44d318e	01	Drama	drama (SURS 01)
00140000-5672-d28a-0aaa-727756dd90f5	02	Opera	opera (SURS 02)
00140000-5672-d28a-d65b-ee1cfb0ccc8c	03	Balet	balet (SURS 03)
00140000-5672-d28a-cd3a-b5d5bb7305a0	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5672-d28a-51ba-ba6033d48776	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5672-d28a-8db3-ede0f6c23286	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5672-d28a-0552-551757719086	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32734227)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32733791)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32734405)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32734395)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32733782)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32734262)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32734304)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32734714)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32734045)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32734067)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32734072)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32734628)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32733940)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32734474)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32734223)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32734011)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32733978)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32733954)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32734129)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32734691)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32734698)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32734722)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32153623)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 32734156)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32733912)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32733810)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32733874)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32733837)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32733771)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32733756)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32734162)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32734198)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32734341)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32733865)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32733900)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32734579)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32734135)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32733890)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32734030)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32733999)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32733991)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32734147)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32734588)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32734596)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32734566)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32734609)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32734180)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32734120)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32734111)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32734328)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32734255)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32733966)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32733727)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32734189)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32733745)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32733765)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32734207)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32734142)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32734091)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32733715)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32733703)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32733697)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32734275)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32733846)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32734102)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32734315)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32733799)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32734621)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32734080)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32733925)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32733740)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32734374)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32734020)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32734170)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32734287)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32734671)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32734655)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32734679)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32734245)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32734061)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32734354)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32734235)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32734055)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32734056)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32734054)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32734053)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32734052)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32734276)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32734277)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32734278)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32734693)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32734692)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32733867)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32733868)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32734163)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32734659)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32734658)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32734660)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32734657)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32734656)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32734149)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32734148)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32734021)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32734022)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32734224)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32734226)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32734225)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32733956)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32733955)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32734610)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32734343)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32734344)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32734345)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32734680)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32734379)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32734376)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32734380)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32734378)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32734377)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32733927)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32733926)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32733840)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32734190)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32733772)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32733773)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32734210)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32734209)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32734208)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32733877)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32733876)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32733878)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32733994)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32733992)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32733993)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32733705)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32734115)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32734113)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32734112)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32734114)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32733746)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32733747)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32734171)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32734715)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32734264)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32734263)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32734723)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32734724)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32734136)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32734256)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32734257)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32734479)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32734478)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32734475)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32734476)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32734477)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32733892)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32733891)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32733893)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32734184)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32734183)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32734589)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32734590)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32734409)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32734410)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32734407)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32734408)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32734246)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32734247)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32734124)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32734123)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32734121)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32734122)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32734397)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32734396)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32733967)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32733981)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32733980)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32733979)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32733982)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32734012)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32734000)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32734001)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32734580)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32734629)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32734699)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32734700)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32733812)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32733811)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32733847)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32733848)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32734062)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32734105)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32734104)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32734103)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32734047)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32734048)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32734051)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32734046)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32734050)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32734049)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32733866)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32733800)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32733801)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32733941)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32733943)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32733942)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32733944)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32734130)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32734342)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32734375)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32734316)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32734317)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32733838)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32733839)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32734236)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32733716)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32733913)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32733875)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32733704)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32734622)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32734182)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32734181)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32734081)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32734082)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32734406)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32733901)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32734355)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32734672)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32734597)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32734598)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32734305)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32734092)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32733766)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2917 (class 2606 OID 32734895)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2918 (class 2606 OID 32734900)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2923 (class 2606 OID 32734925)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2921 (class 2606 OID 32734915)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2916 (class 2606 OID 32734890)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2920 (class 2606 OID 32734910)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2922 (class 2606 OID 32734920)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2919 (class 2606 OID 32734905)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2957 (class 2606 OID 32735095)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32735100)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2959 (class 2606 OID 32735105)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 32735270)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2991 (class 2606 OID 32735265)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2894 (class 2606 OID 32734780)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2895 (class 2606 OID 32734785)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32735010)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2988 (class 2606 OID 32735250)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32735245)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2989 (class 2606 OID 32735255)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 32735240)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2985 (class 2606 OID 32735235)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2939 (class 2606 OID 32735005)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2938 (class 2606 OID 32735000)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2914 (class 2606 OID 32734880)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2915 (class 2606 OID 32734885)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32735050)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32735060)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32735055)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2905 (class 2606 OID 32734835)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 32734830)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32734990)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32735225)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2960 (class 2606 OID 32735110)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32735115)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 32735120)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32735260)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2966 (class 2606 OID 32735140)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2963 (class 2606 OID 32735125)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2967 (class 2606 OID 32735145)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32735135)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2964 (class 2606 OID 32735130)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2903 (class 2606 OID 32734825)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2902 (class 2606 OID 32734820)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2891 (class 2606 OID 32734765)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2890 (class 2606 OID 32734760)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32735030)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2886 (class 2606 OID 32734740)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2887 (class 2606 OID 32734745)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2947 (class 2606 OID 32735045)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32735040)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2945 (class 2606 OID 32735035)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32734795)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 32734790)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2898 (class 2606 OID 32734800)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2910 (class 2606 OID 32734860)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 32734850)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32734855)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32734725)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2931 (class 2606 OID 32734965)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2929 (class 2606 OID 32734955)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2928 (class 2606 OID 32734950)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2930 (class 2606 OID 32734960)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2884 (class 2606 OID 32734730)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2885 (class 2606 OID 32734735)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32735015)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32735285)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2956 (class 2606 OID 32735090)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 32735085)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2996 (class 2606 OID 32735290)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2997 (class 2606 OID 32735295)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32734995)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2953 (class 2606 OID 32735075)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2954 (class 2606 OID 32735080)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 32735200)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 32735195)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 32735180)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 32735185)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32735190)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32734810)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 32734805)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2901 (class 2606 OID 32734815)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2943 (class 2606 OID 32735025)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2942 (class 2606 OID 32735020)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 32735210)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 32735215)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2972 (class 2606 OID 32735170)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 32735175)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2970 (class 2606 OID 32735160)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2971 (class 2606 OID 32735165)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2951 (class 2606 OID 32735065)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2952 (class 2606 OID 32735070)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2935 (class 2606 OID 32734985)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2934 (class 2606 OID 32734980)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2932 (class 2606 OID 32734970)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2933 (class 2606 OID 32734975)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2969 (class 2606 OID 32735155)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2968 (class 2606 OID 32735150)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32734840)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32734845)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32734875)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2911 (class 2606 OID 32734865)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2912 (class 2606 OID 32734870)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32735205)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32735220)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32735230)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2993 (class 2606 OID 32735275)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2994 (class 2606 OID 32735280)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2889 (class 2606 OID 32734755)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 32734750)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2892 (class 2606 OID 32734770)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 32734775)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32734930)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 32734945)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32734940)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 32734935)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-17 16:19:45 CET

--
-- PostgreSQL database dump complete
--

